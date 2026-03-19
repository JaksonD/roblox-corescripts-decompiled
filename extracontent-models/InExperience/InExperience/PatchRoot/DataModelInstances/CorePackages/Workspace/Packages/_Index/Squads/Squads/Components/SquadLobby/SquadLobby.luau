local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_Parent_0.UIBlox);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useVoiceStatus_0 = require(l_Parent_0.CrossExperienceVoice).Hooks.useVoiceStatus;
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local v8 = require(l_script_FirstAncestor_0.dependencies);
local v9 = require(l_script_FirstAncestor_0.Logger);
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v11 = require(script.Parent.SquadLobbyActionBar);
local v12 = require(script.Parent.SquadLobbyUserGrid);
local v13 = require(script.Parent.SquadLobbyRegroupRow);
local v14 = require(script.Parent.SquadLobbyVoiceChatMenu);
local v15 = require(script.Parent.SquadLobbyBanners);
local v16 = require(script.Parent.SquadLobbyUserDropdownMenu);
local v17 = require(l_script_FirstAncestor_0.Enums.SquadPartySheetActionEnum);
local v18 = require(l_script_FirstAncestor_0.Enums.SquadUserPartyStatus);
local l_Cryo_0 = v8.Cryo;
local l_Foundation_0 = v8.Foundation;
local l_LuauPolyfill_0 = v8.LuauPolyfill;
local l_NetworkingPresence_0 = v8.NetworkingPresence;
local l_NetworkingSquads_0 = v8.NetworkingSquads;
local l_React_0 = v8.React;
local l_Roact_0 = v8.Roact;
local l_SharedFlags_0 = v8.SharedFlags;
local l_EventNames_0 = v8.SquadsCore.Analytics.EventNames;
local l_SquadExternalContractContext_0 = v8.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v8.SquadsCore.Enums.SquadPromptType;
local l_SquadCoplayJoin_0 = v8.SquadsCore.Enums.SquadCoplayJoin;
local l_SquadViewFlags_0 = v8.SquadsCore.SquadExternalContractProvider.SquadViewFlags;
local l_SquadLobbySessionProvider_0 = v8.SquadsCore.SquadSessionProvider.SquadLobbySessionProvider;
local l_logInExpCoplayTelemetry_0 = v8.SquadsCore.Analytics.logInExpCoplayTelemetry;
local l_createOrJoinSquad_0 = v8.SquadsCore.Thunks.createOrJoinSquad;
local l_UserBlockingNetworking_0 = v8.UserBlockingNetworking;
local l_dependencyArray_0 = v8.Hooks.dependencyArray;
local l_useCurrentSquadSelector_0 = v8.Hooks.useCurrentSquadSelector;
local l_useDispatch_0 = v8.Hooks.useDispatch;
local l_useEffectOnce_0 = v8.Hooks.useEffectOnce;
local l_useNavigation_0 = v8.useNavigation;
local l_usePrevious_0 = v8.Hooks.usePrevious;
local l_useSelector_0 = v8.Hooks.useSelector;
local l_useStore_0 = v8.Hooks.useStore;
local l_useSquadState_0 = v8.SquadsCore.Hooks.useSquadState;
local l_PresenceType_0 = v8.RoduxPresence.Enums.PresenceType;
local l_StateLayerAffordance_0 = l_Foundation_0.Enums.StateLayerAffordance;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_clearInterval_0 = l_LuauPolyfill_0.clearInterval;
local l_setInterval_0 = l_LuauPolyfill_0.setInterval;
local v51 = game:DefineFastFlag("EnableSquadLobbyBanners", false);
local l_FFlagEnableSquadCoplayAnalytic_0 = l_SharedFlags_0.FFlagEnableSquadCoplayAnalytic;
local l_FFlagEnableSquadCoplayDependencyArray_0 = l_SharedFlags_0.FFlagEnableSquadCoplayDependencyArray;
local l_FFlagEnableSquadTopBannerWideMode_0 = l_SharedFlags_0.FFlagEnableSquadTopBannerWideMode;
local l_FFlagMakeCreateOrJoinSquadAThunks_0 = l_SharedFlags_0.FFlagMakeCreateOrJoinSquadAThunks;
local v56 = game:DefineFastInt("PartyInviteeNoResponseDurationSeconds", 3);
local v57 = game:DefineFastInt("PartyUserInvitedDurationSeconds", 10);
local l_SquadQuickStartExperimentation_0 = v8.SocialExperiments.SquadQuickStartExperimentation;
local l_SquadCoordinationExperienceJoinExperimentation_0 = v8.SocialExperiments.SquadCoordinationExperienceJoinExperimentation;
local l_SquadRegroupExperimentation_0 = v8.SocialExperiments.SquadRegroupExperimentation;
local l_FFlagEnablePartyQuickStartButton_0 = l_SharedFlags_0.FFlagEnablePartyQuickStartButton;
local v62 = require(l_script_FirstAncestor_0.Flags.FFlagRecordVoiceStatusOnPartyAction);
local l_FFlagEnableAppChatFocusableFixes_0 = l_SharedFlags_0.FFlagEnableAppChatFocusableFixes;
local l_FFlagEnablePartyVoiceChangersInLua_0 = l_SharedFlags_0.FFlagEnablePartyVoiceChangersInLua;
local l_FFlagEnableSquadRegroupExperimentation_0 = l_SharedFlags_0.FFlagEnableSquadRegroupExperimentation;
local l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 = l_SharedFlags_0.FFlagEnableSquadRegroupExperimentationSmallScreenFix;
return function(v67) --[[ Line: 95 ]] --[[ Name: SquadLobby ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useStyle_0 (copy), l_useSquadState_0 (copy), l_useNavigation_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useVoiceStatus_0 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_HttpService_0 (copy), v3 (copy), l_SquadViewFlags_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useSelector_0 (copy), l_useStore_0 (copy), l_SquadQuickStartExperimentation_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), l_SquadPromptType_0 (copy), l_dependencyArray_0 (copy), l_FFlagMakeCreateOrJoinSquadAThunks_0 (copy), l_createOrJoinSquad_0 (copy), l_NetworkingSquads_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_logInExpCoplayTelemetry_0 (copy), l_SquadCoplayJoin_0 (copy), l_FFlagEnableSquadCoplayDependencyArray_0 (copy), l_useEffectOnce_0 (copy), v9 (copy), l_Cryo_0 (copy), v18 (copy), v57 (copy), v56 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_usePrevious_0 (copy), l_UserBlockingNetworking_0 (copy), l_NetworkingPresence_0 (copy), v7 (copy), l_SquadRegroupExperimentation_0 (copy), l_PresenceType_0 (copy), l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 (copy), v51 (copy), v15 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Foundation_0 (copy), v12 (copy), l_EventNames_0 (copy), v17 (copy), v62 (copy), v13 (copy), v11 (copy), l_StateLayerAffordance_0 (copy), v14 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v16 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_Roact_0 (copy), l_SquadLobbySessionProvider_0 (copy)
    local v68 = l_useTokens_0();
    local v69 = l_useDispatch_0();
    local v70 = tonumber(l_useLocalUserId_0()) or 0;
    local v71 = l_useStyle_0();
    local v72 = l_useSquadState_0();
    local v73 = l_useNavigation_0();
    local l_isWideMode_0 = v67.isWideMode;
    local v75 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v76, v77 = l_React_0.useState(0);
    local v78 = l_useVoiceStatus_0();
    if l_FFlagEnableSquadTopBannerWideMode_0 then
        local v79 = l_React_0.useRef(l_HttpService_0:GenerateGUID());
        local l_v79_0 = v79 --[[ copy: 12 -> 61 ]];
        l_React_0.useEffect(function() --[[ Line: 110 ]]
            -- upvalues: l_isWideMode_0 (copy), l_v79_0 (copy), v75 (copy), v73 (copy), v3 (ref)
            if not l_isWideMode_0 then
                local l_current_0 = l_v79_0.current;
                v75.disableSquadTopBanner(l_current_0, true);
                local v83 = v73 and v73.addListener(v3.Events.WillBlur, function(v82) --[[ Line: 115 ]]
                    -- upvalues: v75 (ref), l_current_0 (copy)
                    if v82.state.routeName ~= "SquadInviteFriends" and v82.state.routeName ~= "SquadLobby" then
                        v75.disableSquadTopBanner(l_current_0, false);
                        return;
                    else
                        v75.disableSquadTopBanner(l_current_0, true);
                        return;
                    end;
                end);
                return function() --[[ Line: 126 ]]
                    -- upvalues: v83 (ref), v75 (ref), l_current_0 (copy)
                    if v83 then
                        v83.remove();
                        v83 = nil;
                    end;
                    v75.disableSquadTopBanner(l_current_0, false);
                end;
            else
                return function() --[[ Line: 136 ]]

                end;
            end;
        end, {
            v75.disableSquadTopBanner, 
            v73, 
            l_isWideMode_0
        });
        l_React_0.useEffect(function() --[[ Line: 139 ]]
            -- upvalues: v75 (copy), l_SquadViewFlags_0 (ref)
            v75.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            return function() --[[ Line: 141 ]]
                -- upvalues: v75 (ref), l_SquadViewFlags_0 (ref)
                v75.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v75.updateSquadViewFlags
        });
    else
        l_React_0.useEffect(function() --[[ Line: 149 ]]
            -- upvalues: v75 (copy), l_SquadViewFlags_0 (ref), v73 (copy), v3 (ref)
            v75.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            local v85 = v73 and v73.addListener(v3.Events.WillBlur, function(v84) --[[ Line: 152 ]]
                -- upvalues: v75 (ref), l_SquadViewFlags_0 (ref)
                if v84.state.routeName ~= "SquadInviteFriends" and v84.state.routeName ~= "SquadLobby" then
                    v75.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
                    return;
                else
                    v75.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
                    return;
                end;
            end);
            return function() --[[ Line: 159 ]]
                -- upvalues: v85 (ref), v75 (ref), l_SquadViewFlags_0 (ref)
                if v85 then
                    v85.remove();
                    v85 = nil;
                end;
                v75.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v75.updateSquadViewFlags, 
            v73
        });
    end;
    local v86, v87 = l_React_0.useState(false);
    local v88, v89 = l_React_0.useState(Vector2.zero);
    local v91 = l_React_0.useCallback(function(v90) --[[ Line: 171 ]]
        -- upvalues: v89 (copy)
        v89(v90.AbsoluteSize);
    end, {
        v89
    });
    local v92 = l_useCurrentSquadSelector_0();
    local v93 = if v92 then v92.squadId else "";
    local v94 = v92 and v92.members;
    local v96 = l_React_0.useCallback(function(v95) --[[ Line: 179 ]]
        if v95.Squad and v95.Squad.Squad and v95.Squad.Squad.currentSquad then
            return v95.Squad.Squad.currentSquad.parentChannelId or "";
        else
            return "";
        end;
    end, {});
    local v97 = l_useSelector_0(v96);
    local v98 = l_useStore_0();
    local v99 = v73.getParam("conversationId") or "";
    local v100 = v75.useGetConversationFromId(v99);
    local v101 = v100 and v100.participants;
    local v102 = v92 and v92.invitees;
    local v103 = nil;
    local v104 = nil;
    local v105 = nil;
    v103 = v73.getParam("extraParams") or {};
    v104 = v103.squadId;
    if l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and l_FFlagEnablePartyQuickStartButton_0 then
        v105 = v103.squadCreateOrJoinAttemptId;
    end;
    local v106 = l_React_0.useCallback(function() --[[ Line: 202 ]]
        -- upvalues: v75 (copy), v98 (copy), l_SquadPromptType_0 (ref), v67 (copy)
        v75.setSquadPrompt(v98, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error, 
            onConfirm = function() --[[ Line: 206 ]] --[[ Name: onConfirm ]]
                -- upvalues: v67 (ref)
                v67.navigateAwayFromSquad();
            end
        });
    end, l_dependencyArray_0(v67.navigateAwayFromSquad, v98, v75.setSquadPrompt));
    local v113 = l_React_0.useCallback(function(v107) --[[ Line: 213 ]]
        -- upvalues: l_FFlagMakeCreateOrJoinSquadAThunks_0 (ref), v69 (copy), l_createOrJoinSquad_0 (ref), v75 (copy), v105 (ref), v67 (copy), l_NetworkingSquads_0 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_logInExpCoplayTelemetry_0 (ref), l_SquadCoplayJoin_0 (ref), v106 (copy)
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then
            v69(l_createOrJoinSquad_0(v107, v75.setSquadPrompt, v75.fireSquadAnalytics, v75.squadLocation, v105, v67.navigateAwayFromSquad));
            return;
        else
            local v108 = v69(l_NetworkingSquads_0.CreateOrJoinSquad.API({
                parentChannelId = v107, 
                leaveExisting = true, 
                squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v75.squadLocation else nil, 
                partyAttemptId = v105
            }));
            if l_FFlagEnableSquadCoplayAnalytic_0 then
                v108 = v108:andThen(function(v109) --[[ Line: 236 ]]
                    -- upvalues: l_logInExpCoplayTelemetry_0 (ref), v75 (ref), l_SquadCoplayJoin_0 (ref)
                    local l_groupUpId_0 = v109.responseBody.groupUp.groupUpId;
                    local l_members_0 = v109.responseBody.groupUp.members;
                    if l_groupUpId_0 and l_members_0 then
                        l_logInExpCoplayTelemetry_0(l_groupUpId_0, l_members_0, v75.squadLocation, l_SquadCoplayJoin_0.PartyJoin, v75.fireSquadAnalytics);
                    end;
                end);
            end;
            v108:catch(function(_) --[[ Line: 252 ]]
                -- upvalues: v106 (ref)
                v106();
            end);
            return;
        end;
    end, l_dependencyArray_0(v69, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then l_createOrJoinSquad_0 else nil, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v67.navigateAwayFromSquad else nil, if not l_FFlagMakeCreateOrJoinSquadAThunks_0 then v106 else nil, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v75.setSquadPrompt else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v75.squadLocation else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v75.fireSquadAnalytics else nil, v105));
    local v114 = v104 and v104 ~= v93;
    l_React_0.useEffect(function() --[[ Line: 273 ]]
        -- upvalues: v114 (copy), v75 (copy), v98 (copy), l_SquadPromptType_0 (ref), v113 (copy), v99 (copy), v67 (copy), v73 (copy)
        if v114 then
            v75.setSquadPrompt(v98, {
                promptType = l_SquadPromptType_0.JoinAnotherSquad, 
                onConfirm = function() --[[ Line: 277 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v113 (ref), v99 (ref)
                    v113(v99);
                end, 
                onCancel = function() --[[ Line: 280 ]] --[[ Name: onCancel ]]
                    -- upvalues: v67 (ref)
                    v67.navigateAwayFromSquad();
                end
            });
            v73.setParams({
                squadId = nil
            });
        end;
    end, l_dependencyArray_0(v104, v75.setSquadPrompt, v113, v99, v67.navigateAwayFromSquad, v114));
    l_useEffectOnce_0(function() --[[ Line: 302 ]]
        -- upvalues: v114 (copy), v93 (copy), v100 (copy), v9 (ref), v99 (copy), v69 (copy), v75 (copy), v113 (copy), v106 (copy)
        if v114 then
            return;
        else
            if v93 == "" then
                if v100 and v100.source == "friends" then
                    v9:debug("Channel does not exist for: {}. Creating a friend conversation.", v99);
                    v69(v75.createFriendConversation(v99)):andThen(function(v115) --[[ Line: 317 ]]
                        -- upvalues: v113 (ref)
                        if v115 and v115.id then
                            v113(v115.id);
                        end;
                    end):catch(function(v116) --[[ Line: 322 ]]
                        -- upvalues: v9 (ref), v106 (ref)
                        v9:debug("Error while trying to create a friend conversation: {}", v116);
                        v106();
                    end);
                    return;
                else
                    v113(v99);
                end;
            end;
            return;
        end;
    end, l_dependencyArray_0(v69, v75.createFriendConversation, v99, v100, v113, v106));
    local v117, v118 = l_React_0.useState({});
    local v122 = l_React_0.useMemo(function() --[[ Line: 344 ]]
        -- upvalues: v94 (copy)
        local v119 = {};
        if v94 then
            for _, v121 in ipairs(v94) do
                v119[tostring(v121.userId)] = true;
            end;
        end;
        return v119;
    end, {
        v94
    });
    local v135 = l_React_0.useCallback(function(v123, v124, v125) --[[ Line: 365 ]]
        -- upvalues: l_Cryo_0 (ref), v70 (copy), v18 (ref), v57 (ref), v56 (ref)
        local v126 = {};
        local v127 = 0;
        if v124 and #l_Cryo_0.Dictionary.keys(v124) == 0 then
            table.insert(v126, {
                userId = v70, 
                partyStatus = v18.Connecting
            });
        elseif v123 then
            local v128 = os.time();
            for _, v130 in ipairs(v123) do
                local l_Inactive_0 = v18.Inactive;
                if v124[v130] then
                    l_Inactive_0 = v18.Active;
                else
                    local v133 = v125 and l_Cryo_0.List.findWhere(v125, function(v132) --[[ Line: 390 ]]
                        -- upvalues: v130 (copy)
                        return v130 == tostring(v132.userId);
                    end);
                    if v133 then
                        local v134 = math.floor(v125[v133].invitedAtTimestampMs / 1000) or 0;
                        if v128 >= v134 then
                            if v128 - v134 < v57 then
                                l_Inactive_0 = v18.Invited;
                                v127 = v127 + 1;
                            elseif v128 - v134 < v56 + v57 then
                                l_Inactive_0 = v18.NoResponse;
                                v127 = v127 + 1;
                            end;
                        else
                            continue;
                        end;
                    end;
                end;
                table.insert(v126, {
                    userId = tonumber(v130), 
                    partyStatus = l_Inactive_0
                });
            end;
        end;
        return {
            users = v126, 
            numberOfUpdatesPending = v127
        };
    end, {});
    l_React_0.useEffect(function() --[[ Line: 434 ]]
        -- upvalues: v135 (copy), v101 (copy), v122 (copy), v102 (copy), v118 (copy), l_setInterval_0 (ref), l_clearInterval_0 (ref)
        local v136 = v135(v101, v122, v102);
        v118(v136.users);
        local v137 = nil;
        v137 = l_setInterval_0(function() --[[ Line: 440 ]]
            -- upvalues: v135 (ref), v101 (ref), v122 (ref), v102 (ref), v118 (ref), l_clearInterval_0 (ref), v137 (ref)
            local v138 = v135(v101, v122, v102);
            v118(v138.users);
            if v138.numberOfUpdatesPending == 0 then
                l_clearInterval_0(v137);
            end;
        end, 1000);
        return function() --[[ Line: 449 ]]
            -- upvalues: l_clearInterval_0 (ref), v137 (ref)
            l_clearInterval_0(v137);
        end;
    end, {
        v122, 
        v102, 
        v101, 
        v135
    });
    local v139 = l_usePrevious_0(v93) or "";
    l_React_0.useEffect(function() --[[ Line: 456 ]]
        -- upvalues: v139 (copy), v93 (copy), v67 (copy), v99 (copy), v97 (copy), v3 (ref), l_isWideMode_0 (copy), v73 (copy)
        if v139 ~= "" and v93 == "" then
            v67.navigateAwayFromSquad();
            return;
        else
            if v93 ~= "" and v99 ~= "" and v97 ~= "" and v97 ~= v99 then
                local v140 = {
                    v3.Actions.navigate({
                        routeName = "ChatConversation", 
                        params = {
                            conversationId = v97
                        }
                    }), 
                    v3.Actions.navigate({
                        routeName = "SquadLobby", 
                        params = {
                            conversationId = v97
                        }
                    })
                };
                if l_isWideMode_0 then
                    v73.navigate("ChatLanding", {
                        conversationId = v97
                    }, v3.StackActions.reset({
                        index = 2, 
                        actions = v140
                    }));
                    return;
                else
                    table.insert(v140, 1, v3.Actions.navigate({
                        routeName = "ChatLanding"
                    }));
                    v73.navigate("ChatLandingStack", {
                        conversationId = v97
                    }, v3.StackActions.reset({
                        index = 3, 
                        actions = v140
                    }));
                end;
            end;
            return;
        end;
    end, {
        v73, 
        v97, 
        v99, 
        v93, 
        v67.navigateAwayFromSquad
    });
    local v141 = l_usePrevious_0(v94);
    l_React_0.useEffect(function() --[[ Line: 520 ]]
        -- upvalues: v94 (copy), v141 (copy), v70 (copy), v69 (copy), l_UserBlockingNetworking_0 (ref), l_NetworkingPresence_0 (ref)
        local v142 = {};
        if v94 then
            for _, v144 in pairs(v94) do
                local v145 = false;
                if v141 then
                    for _, v147 in pairs(v141) do
                        if v147.userId == v144.userId then
                            v145 = true;
                            break;
                        end;
                    end;
                end;
                if not v145 then
                    table.insert(v142, v144.userId);
                    if v70 ~= v144.userId then
                        v69(l_UserBlockingNetworking_0.IsBlockedById.API({
                            userId = v144.userId, 
                            currentUserId = v70
                        }));
                    end;
                end;
            end;
        end;
        v69(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v142));
    end, l_dependencyArray_0(v94, v70, v141));
    local v148 = l_React_0.useCallback(function() --[[ Line: 550 ]]
        -- upvalues: v87 (copy), v86 (copy)
        v87(not v86);
    end, l_dependencyArray_0(v86, v87));
    local v149 = v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20;
    local v150 = v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20;
    local v151, v152 = l_React_0.useState(nil);
    local v153, v154 = l_React_0.useState(false);
    local v156 = l_React_0.useCallback(function(v155) --[[ Line: 562 ]]
        -- upvalues: v77 (copy), v68 (copy)
        if v155.Y > 0 then
            v77(v155.Y + v68.Gap.Medium);
            return;
        else
            v77(0);
            return;
        end;
    end, l_dependencyArray_0(v77, v68));
    local v165 = l_React_0.useCallback(function(v157) --[[ Line: 570 ]]
        -- upvalues: v94 (copy)
        local v158 = v157.Squad and v157.Squad.Presence and v157.Squad.Presence.byUserId or {};
        local v159 = {};
        local l_ipairs_0 = ipairs;
        local v161 = v94 or {};
        for _, v163 in l_ipairs_0(v161) do
            local v164 = tostring(v163.userId);
            v159[v164] = v158[v164];
        end;
        return v159;
    end, l_dependencyArray_0(v94));
    local v166 = l_useSelector_0(v165);
    local v170 = l_React_0.useMemo(function() --[[ Line: 583 ]]
        -- upvalues: l_SquadRegroupExperimentation_0 (ref), v67 (copy), v92 (copy), v166 (copy), v70 (copy), l_PresenceType_0 (ref)
        if not l_SquadRegroupExperimentation_0.getSquadRegroupEnabled() or not v67.isInExperience or not v92 or not v92.members or #v92.members <= 1 or not v92.selfPermissions or not v92.selfPermissions.canSeeRegroupJoinButton then
            return false;
        else
            local v167 = v166[tostring(v70)];
            if v167 == nil then
                return false;
            else
                for v168, v169 in pairs(v166) do
                    if v169 ~= nil and v168 ~= tostring(v70) and (v169.userPresenceType == l_PresenceType_0.Online or v169.userPresenceType == l_PresenceType_0.InGame and v167.gameId ~= nil and v169.gameId ~= nil and v167.gameId ~= v169.gameId) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
    end, l_dependencyArray_0(v166, v70, v67.isInExperience, v92));
    local v171 = v68.Size.Size_1000 + v68.Padding.Medium * 2;
    local v172 = l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 and v170;
    local v173 = if not v172 and v170 then v68.Gap.XXLarge + v171 else 0;
    local v174 = l_React_0.useMemo(function() --[[ Line: 630 ]]
        -- upvalues: v51 (ref), l_React_0 (ref), v15 (ref), v156 (copy)
        if v51 then
            return (l_React_0.createElement(v15, {
                onAbsoluteSizeChanged = v156
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v156));
    local v175 = l_React_0.useCallback(function() --[[ Line: 638 ]]
        -- upvalues: v67 (copy), v97 (copy)
        v67.navigateToSquadInviteFriends(v97);
    end, l_dependencyArray_0(v97, v67.navigateToSquadInviteFriends));
    local v178 = l_React_0.useMemo(function() --[[ Line: 643 ]]
        -- upvalues: l_React_0 (ref), v76 (copy), v173 (copy), v71 (copy), l_FFlagEnableAppChatFocusableFixes_0 (ref), v91 (copy), v172 (copy), l_Foundation_0 (ref), v12 (ref), v88 (copy), v149 (copy), v68 (copy), v171 (copy), v117 (copy), v67 (copy), v75 (copy), l_EventNames_0 (ref), v97 (copy), v17 (ref), v62 (ref), v78 (copy), v152 (copy), v154 (copy), v175 (copy), v13 (ref), v70 (copy)
        return l_React_0.createElement("ScrollingFrame", {
            Position = UDim2.fromOffset(0, v76), 
            Size = UDim2.new(1, 0, 1, -(v76 + v173)), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.new(), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarImageColor3 = v71.Theme.UIEmphasis.Color, 
            ScrollBarImageTransparency = v71.Theme.UIEmphasis.Transparency, 
            ScrollBarThickness = 4, 
            Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil, 
            ZIndex = 0, 
            [l_React_0.Change.AbsoluteSize] = v91
        }, {
            FrameContents = if v172 then l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-y size-full-0 bg-surface-0 col align-x-center align-y-top"
            }, {
                UserGridContainer = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "auto-y size-full-0 bg-surface-0", 
                    LayoutOrder = 1
                }, {
                    SquadLobbyUserGrid = l_React_0.createElement(v12, {
                        containerSize = v88 - Vector2.new(0, v149 + v68.Gap.Medium + v171), 
                        paddingBottom = UDim.new(0, 0), 
                        users = v117, 
                        isInExperience = v67.isInExperience, 
                        onUserCardActivated = function(v176) --[[ Line: 673 ]] --[[ Name: onUserCardActivated ]]
                            -- upvalues: v75 (ref), l_EventNames_0 (ref), v97 (ref), v17 (ref), v62 (ref), v78 (ref), v152 (ref), v154 (ref)
                            v75.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                                parentChannelId = v97, 
                                actionType = v17.UserCardClicked, 
                                voiceStatus = if v62 then v78 else nil
                            });
                            v152(v176);
                            v154(true);
                        end, 
                        navigateToHomePage = v67.navigateToHomePage, 
                        navigateToSquadInviteFriends = v175
                    })
                }), 
                RegroupRowSpacer = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v68.Gap.Medium), 
                    LayoutOrder = 2
                }), 
                SquadLobbyRegroupRow = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v171), 
                    LayoutOrder = 3
                }, {
                    Row = l_React_0.createElement(v13, {
                        localUserId = v70
                    })
                }), 
                BottomPadding = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v149), 
                    LayoutOrder = 4
                })
            }) else nil, 
            SquadLobbyUserGrid = if v172 then nil else l_React_0.createElement(v12, {
                containerSize = v88 - Vector2.new(0, v149), 
                paddingBottom = UDim.new(0, v149), 
                users = v117, 
                isInExperience = v67.isInExperience, 
                onUserCardActivated = function(v177) --[[ Line: 715 ]] --[[ Name: onUserCardActivated ]]
                    -- upvalues: v75 (ref), l_EventNames_0 (ref), v97 (ref), v17 (ref), v62 (ref), v78 (ref), v152 (ref), v154 (ref)
                    v75.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                        parentChannelId = v97, 
                        actionType = v17.UserCardClicked, 
                        voiceStatus = if v62 then v78 else nil
                    });
                    v152(v177);
                    v154(true);
                end, 
                navigateToHomePage = v67.navigateToHomePage, 
                navigateToSquadInviteFriends = v175
            })
        });
    end, l_dependencyArray_0(v152, v154, v88, v94, v175, v91, v67.navigateToHomePage, v149, v76, if v170 then v173 else nil, v117, v172, if v172 then v171 else nil, if v172 then v70 else nil, if v62 then v78 else nil));
    local v179 = l_React_0.useMemo(function() --[[ Line: 749 ]]
        -- upvalues: l_React_0 (ref), v11 (ref), v72 (copy), v100 (copy), v67 (copy), v148 (copy), v93 (copy)
        return l_React_0.createElement(v11, {
            squadState = v72, 
            anchorPoint = Vector2.new(0.5, 1), 
            hasUnreadMessages = if v100 and v100.hasUnreadMessages then v100.hasUnreadMessages else false, 
            navigateAwayFromSquad = v67.navigateAwayFromSquad, 
            navigateToHomePage = v67.navigateToHomePage, 
            toggleVoiceChatMenu = v148, 
            position = UDim2.new(0.5, 0, 1, -20), 
            squadId = v93, 
            isInExperience = v67.isInExperience
        });
    end, l_dependencyArray_0(v93, v67.isInExperience, v67.navigateToHomePage, v72, v148, v100 and v100.hasUnreadMessages));
    local v180 = l_React_0.useMemo(function() --[[ Line: 774 ]]
        -- upvalues: v172 (copy), v170 (copy), l_React_0 (ref), l_Foundation_0 (ref), v7 (ref), v68 (copy), v171 (copy), v13 (ref), v70 (copy)
        if v172 or not v170 then
            return nil;
        else
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "anchor-bottom-center auto-none gui-object-defaults", 
                Position = UDim2.new(0.5, 0, 1, -(20 + v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT + v68.Gap.XXLarge)), 
                Size = UDim2.new(1, 0, 0, v171)
            }, {
                Row = l_React_0.createElement(v13, {
                    localUserId = v70
                })
            });
        end;
    end, l_dependencyArray_0(v170, v70, v68, v171));
    local v181 = l_React_0.useMemo(function() --[[ Line: 795 ]]
        -- upvalues: v86 (copy), l_React_0 (ref), l_Foundation_0 (ref), l_StateLayerAffordance_0 (ref), v87 (copy), v150 (copy), v68 (copy), v14 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v67 (copy)
        if v86 then
            return (l_React_0.createElement(l_Foundation_0.View, {
                Size = UDim2.new(1, 0, 1, 0), 
                stateLayer = {
                    affordance = l_StateLayerAffordance_0.None
                }, 
                onActivated = function() --[[ Line: 801 ]] --[[ Name: onActivated ]]
                    -- upvalues: v87 (ref)
                    v87(false);
                end
            }, {
                l_React_0.createElement(l_Foundation_0.ScrollView, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    sizeConstraint = {
                        MaxSize = Vector2.new(350, 1e999)
                    }, 
                    scroll = {
                        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                        CanvasSize = UDim2.new(1, 0, 1, 0), 
                        ScrollingDirection = Enum.ScrollingDirection.Y
                    }, 
                    layout = {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }
                }, {
                    FlexibleSpace = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 0, v150), 
                        flexItem = {
                            FlexMode = Enum.UIFlexMode.Fill
                        }, 
                        LayoutOrder = 1, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 825 ]] --[[ Name: onActivated ]]
                            -- upvalues: v87 (ref)
                            v87(false);
                        end
                    }), 
                    Menu = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        flexItem = {
                            ItemLineAlignment = Enum.ItemLineAlignment.Center
                        }, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2, 
                        padding = Vector2.new(v68.Padding.XLarge, v68.Padding.Medium), 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 838 ]] --[[ Name: onActivated ]]

                        end, 
                        ZIndex = 3
                    }, {
                        SquadLobbyVoiceChatMenu = l_React_0.createElement(v14, {
                            openSquadVoiceChangers = if l_FFlagEnablePartyVoiceChangersInLua_0 then v67.openSquadVoiceChangers else nil
                        })
                    }), 
                    BottomPadding = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 0, v150), 
                        LayoutOrder = 3, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 851 ]] --[[ Name: onActivated ]]
                            -- upvalues: v87 (ref)
                            v87(false);
                        end
                    })
                })
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v150, v86, v87, v68));
    local v182 = l_React_0.useMemo(function() --[[ Line: 861 ]]
        -- upvalues: v153 (copy), v151 (copy), l_React_0 (ref), v16 (ref), v67 (copy), v152 (copy), v154 (copy), v97 (copy)
        if v153 and v151 then
            return (l_React_0.createElement(v16, {
                userId = v151, 
                isInExperience = v67.isInExperience, 
                onDismiss = function() --[[ Line: 866 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v152 (ref), v154 (ref)
                    v152(nil);
                    v154(false);
                end, 
                openViewProfile = function() --[[ Line: 870 ]] --[[ Name: openViewProfile ]]
                    -- upvalues: v67 (ref), v151 (ref)
                    v67.openViewProfile(v151);
                end, 
                openSquadVoiceAbuseReport = v67.openSquadVoiceAbuseReport, 
                parentChannelId = v97
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v97, v67.isInExperience, v153, v154, v67.openViewProfile, v151, v152));
    l_React_0.useEffect(function() --[[ Line: 889 ]]
        -- upvalues: l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_SquadRegroupExperimentation_0 (ref)
        l_SquadCoordinationExperienceJoinExperimentation_0.logExposure();
        if l_FFlagEnableSquadRegroupExperimentation_0 then
            l_SquadRegroupExperimentation_0.logExposure();
        end;
    end, {});
    local v183 = l_Roact_0.createFragment({
        SquadLobbyBanners = v174, 
        SquadLobbyUsersScrollingFrame = v178, 
        SquadLobbyRegroupRow = v180, 
        SquadLobbyActionBar = v179, 
        SquadLobbyVoiceChatMenu = v181, 
        UserDropdownMenu = v182
    });
    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
        v183 = l_React_0.createElement(l_SquadLobbySessionProvider_0.Provider, nil, v183);
    end;
    return v183;
end;