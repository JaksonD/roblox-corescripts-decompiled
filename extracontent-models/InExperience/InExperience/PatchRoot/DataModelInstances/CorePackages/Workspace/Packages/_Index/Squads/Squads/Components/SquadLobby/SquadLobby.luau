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
local l_FFlagAppChatShowOSAOnPageEntry_0 = l_SharedFlags_0.FFlagAppChatShowOSAOnPageEntry;
return function(v68) --[[ Line: 96 ]] --[[ Name: SquadLobby ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useStyle_0 (copy), l_useSquadState_0 (copy), l_useNavigation_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useVoiceStatus_0 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_HttpService_0 (copy), v3 (copy), l_SquadViewFlags_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useSelector_0 (copy), l_useStore_0 (copy), l_SquadQuickStartExperimentation_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), l_SquadPromptType_0 (copy), l_dependencyArray_0 (copy), l_FFlagMakeCreateOrJoinSquadAThunks_0 (copy), l_createOrJoinSquad_0 (copy), l_NetworkingSquads_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_logInExpCoplayTelemetry_0 (copy), l_SquadCoplayJoin_0 (copy), l_FFlagEnableSquadCoplayDependencyArray_0 (copy), l_useEffectOnce_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), v9 (copy), l_Cryo_0 (copy), v18 (copy), v57 (copy), v56 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_usePrevious_0 (copy), l_UserBlockingNetworking_0 (copy), l_NetworkingPresence_0 (copy), v7 (copy), l_SquadRegroupExperimentation_0 (copy), l_PresenceType_0 (copy), l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 (copy), v51 (copy), v15 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Foundation_0 (copy), v12 (copy), l_EventNames_0 (copy), v17 (copy), v62 (copy), v13 (copy), v11 (copy), l_StateLayerAffordance_0 (copy), v14 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v16 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_Roact_0 (copy), l_SquadLobbySessionProvider_0 (copy)
    local v69 = l_useTokens_0();
    local v70 = l_useDispatch_0();
    local v71 = tonumber(l_useLocalUserId_0()) or 0;
    local v72 = l_useStyle_0();
    local v73 = l_useSquadState_0();
    local v74 = l_useNavigation_0();
    local l_isWideMode_0 = v68.isWideMode;
    local v76 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v77, v78 = l_React_0.useState(0);
    local v79 = l_useVoiceStatus_0();
    if l_FFlagEnableSquadTopBannerWideMode_0 then
        local v80 = l_React_0.useRef(l_HttpService_0:GenerateGUID());
        local l_v80_0 = v80 --[[ copy: 12 -> 61 ]];
        l_React_0.useEffect(function() --[[ Line: 111 ]]
            -- upvalues: l_isWideMode_0 (copy), l_v80_0 (copy), v76 (copy), v74 (copy), v3 (ref)
            if not l_isWideMode_0 then
                local l_current_0 = l_v80_0.current;
                v76.disableSquadTopBanner(l_current_0, true);
                local v84 = v74 and v74.addListener(v3.Events.WillBlur, function(v83) --[[ Line: 116 ]]
                    -- upvalues: v76 (ref), l_current_0 (copy)
                    if v83.state.routeName ~= "SquadInviteFriends" and v83.state.routeName ~= "SquadLobby" then
                        v76.disableSquadTopBanner(l_current_0, false);
                        return;
                    else
                        v76.disableSquadTopBanner(l_current_0, true);
                        return;
                    end;
                end);
                return function() --[[ Line: 127 ]]
                    -- upvalues: v84 (ref), v76 (ref), l_current_0 (copy)
                    if v84 then
                        v84.remove();
                        v84 = nil;
                    end;
                    v76.disableSquadTopBanner(l_current_0, false);
                end;
            else
                return function() --[[ Line: 137 ]]

                end;
            end;
        end, {
            v76.disableSquadTopBanner, 
            v74, 
            l_isWideMode_0
        });
        l_React_0.useEffect(function() --[[ Line: 140 ]]
            -- upvalues: v76 (copy), l_SquadViewFlags_0 (ref)
            v76.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            return function() --[[ Line: 142 ]]
                -- upvalues: v76 (ref), l_SquadViewFlags_0 (ref)
                v76.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v76.updateSquadViewFlags
        });
    else
        l_React_0.useEffect(function() --[[ Line: 150 ]]
            -- upvalues: v76 (copy), l_SquadViewFlags_0 (ref), v74 (copy), v3 (ref)
            v76.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            local v86 = v74 and v74.addListener(v3.Events.WillBlur, function(v85) --[[ Line: 153 ]]
                -- upvalues: v76 (ref), l_SquadViewFlags_0 (ref)
                if v85.state.routeName ~= "SquadInviteFriends" and v85.state.routeName ~= "SquadLobby" then
                    v76.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
                    return;
                else
                    v76.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
                    return;
                end;
            end);
            return function() --[[ Line: 160 ]]
                -- upvalues: v86 (ref), v76 (ref), l_SquadViewFlags_0 (ref)
                if v86 then
                    v86.remove();
                    v86 = nil;
                end;
                v76.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v76.updateSquadViewFlags, 
            v74
        });
    end;
    local v87, v88 = l_React_0.useState(false);
    local v89, v90 = l_React_0.useState(Vector2.zero);
    local v92 = l_React_0.useCallback(function(v91) --[[ Line: 172 ]]
        -- upvalues: v90 (copy)
        v90(v91.AbsoluteSize);
    end, {
        v90
    });
    local v93 = l_useCurrentSquadSelector_0();
    local v94 = if v93 then v93.squadId else "";
    local v95 = v93 and v93.members;
    local v97 = l_React_0.useCallback(function(v96) --[[ Line: 180 ]]
        if v96.Squad and v96.Squad.Squad and v96.Squad.Squad.currentSquad then
            return v96.Squad.Squad.currentSquad.parentChannelId or "";
        else
            return "";
        end;
    end, {});
    local v98 = l_useSelector_0(v97);
    local v99 = l_useStore_0();
    local v100 = v74.getParam("conversationId") or "";
    local v101 = v76.useGetConversationFromId(v100);
    local v102 = v101 and v101.participants;
    local v103 = v93 and v93.invitees;
    local v104 = nil;
    local v105 = nil;
    local v106 = nil;
    v104 = v74.getParam("extraParams") or {};
    v105 = v104.squadId;
    if l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and l_FFlagEnablePartyQuickStartButton_0 then
        v106 = v104.squadCreateOrJoinAttemptId;
    end;
    local v107 = l_React_0.useCallback(function() --[[ Line: 203 ]]
        -- upvalues: v76 (copy), v99 (copy), l_SquadPromptType_0 (ref), v68 (copy)
        v76.setSquadPrompt(v99, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error, 
            onConfirm = function() --[[ Line: 207 ]] --[[ Name: onConfirm ]]
                -- upvalues: v68 (ref)
                v68.navigateAwayFromSquad();
            end
        });
    end, l_dependencyArray_0(v68.navigateAwayFromSquad, v99, v76.setSquadPrompt));
    local v114 = l_React_0.useCallback(function(v108) --[[ Line: 214 ]]
        -- upvalues: l_FFlagMakeCreateOrJoinSquadAThunks_0 (ref), v70 (copy), l_createOrJoinSquad_0 (ref), v76 (copy), v106 (ref), v68 (copy), l_NetworkingSquads_0 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_logInExpCoplayTelemetry_0 (ref), l_SquadCoplayJoin_0 (ref), v107 (copy)
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then
            v70(l_createOrJoinSquad_0(v108, v76.setSquadPrompt, v76.fireSquadAnalytics, v76.squadLocation, v106, v68.navigateAwayFromSquad));
            return;
        else
            local v109 = v70(l_NetworkingSquads_0.CreateOrJoinSquad.API({
                parentChannelId = v108, 
                leaveExisting = true, 
                squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v76.squadLocation else nil, 
                partyAttemptId = v106
            }));
            if l_FFlagEnableSquadCoplayAnalytic_0 then
                v109 = v109:andThen(function(v110) --[[ Line: 237 ]]
                    -- upvalues: l_logInExpCoplayTelemetry_0 (ref), v76 (ref), l_SquadCoplayJoin_0 (ref)
                    local l_groupUpId_0 = v110.responseBody.groupUp.groupUpId;
                    local l_members_0 = v110.responseBody.groupUp.members;
                    if l_groupUpId_0 and l_members_0 then
                        l_logInExpCoplayTelemetry_0(l_groupUpId_0, l_members_0, v76.squadLocation, l_SquadCoplayJoin_0.PartyJoin, v76.fireSquadAnalytics);
                    end;
                end);
            end;
            v109:catch(function(_) --[[ Line: 253 ]]
                -- upvalues: v107 (ref)
                v107();
            end);
            return;
        end;
    end, l_dependencyArray_0(v70, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then l_createOrJoinSquad_0 else nil, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v68.navigateAwayFromSquad else nil, if not l_FFlagMakeCreateOrJoinSquadAThunks_0 then v107 else nil, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v76.setSquadPrompt else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v76.squadLocation else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v76.fireSquadAnalytics else nil, v106));
    local v115 = v105 and v105 ~= v94;
    l_React_0.useEffect(function() --[[ Line: 274 ]]
        -- upvalues: v115 (copy), v76 (copy), v99 (copy), l_SquadPromptType_0 (ref), v114 (copy), v100 (copy), v68 (copy), v74 (copy)
        if v115 then
            v76.setSquadPrompt(v99, {
                promptType = l_SquadPromptType_0.JoinAnotherSquad, 
                onConfirm = function() --[[ Line: 278 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v114 (ref), v100 (ref)
                    v114(v100);
                end, 
                onCancel = function() --[[ Line: 281 ]] --[[ Name: onCancel ]]
                    -- upvalues: v68 (ref)
                    v68.navigateAwayFromSquad();
                end
            });
            v74.setParams({
                squadId = nil
            });
        end;
    end, l_dependencyArray_0(v105, v76.setSquadPrompt, v114, v100, v68.navigateAwayFromSquad, v115));
    l_useEffectOnce_0(function() --[[ Line: 303 ]]
        -- upvalues: v115 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v76 (copy), v101 (copy), v68 (copy), v94 (copy), v9 (ref), v100 (copy), v70 (copy), v114 (copy), v107 (copy)
        if v115 then
            return;
        elseif l_FFlagAppChatShowOSAOnPageEntry_0 and v76.shouldShowOSAForConversation and v76.shouldShowOSAForConversation(v101) then
            v68.navigateAwayFromSquad();
            return;
        else
            if v94 == "" then
                if v101 and v101.source == "friends" then
                    v9:debug("Channel does not exist for: {}. Creating a friend conversation.", v100);
                    v70(v76.createFriendConversation(v100)):andThen(function(v116) --[[ Line: 327 ]]
                        -- upvalues: v114 (ref)
                        if v116 and v116.id then
                            v114(v116.id);
                        end;
                    end):catch(function(v117) --[[ Line: 332 ]]
                        -- upvalues: v9 (ref), v107 (ref)
                        v9:debug("Error while trying to create a friend conversation: {}", v117);
                        v107();
                    end);
                    return;
                else
                    v114(v100);
                end;
            end;
            return;
        end;
    end, l_dependencyArray_0(v70, v76.createFriendConversation, v100, v101, v114, v107));
    local v118, v119 = l_React_0.useState({});
    local v123 = l_React_0.useMemo(function() --[[ Line: 354 ]]
        -- upvalues: v95 (copy)
        local v120 = {};
        if v95 then
            for _, v122 in ipairs(v95) do
                v120[tostring(v122.userId)] = true;
            end;
        end;
        return v120;
    end, {
        v95
    });
    local v136 = l_React_0.useCallback(function(v124, v125, v126) --[[ Line: 375 ]]
        -- upvalues: l_Cryo_0 (ref), v71 (copy), v18 (ref), v57 (ref), v56 (ref)
        local v127 = {};
        local v128 = 0;
        if v125 and #l_Cryo_0.Dictionary.keys(v125) == 0 then
            table.insert(v127, {
                userId = v71, 
                partyStatus = v18.Connecting
            });
        elseif v124 then
            local v129 = os.time();
            for _, v131 in ipairs(v124) do
                local l_Inactive_0 = v18.Inactive;
                if v125[v131] then
                    l_Inactive_0 = v18.Active;
                else
                    local v134 = v126 and l_Cryo_0.List.findWhere(v126, function(v133) --[[ Line: 400 ]]
                        -- upvalues: v131 (copy)
                        return v131 == tostring(v133.userId);
                    end);
                    if v134 then
                        local v135 = math.floor(v126[v134].invitedAtTimestampMs / 1000) or 0;
                        if v129 >= v135 then
                            if v129 - v135 < v57 then
                                l_Inactive_0 = v18.Invited;
                                v128 = v128 + 1;
                            elseif v129 - v135 < v56 + v57 then
                                l_Inactive_0 = v18.NoResponse;
                                v128 = v128 + 1;
                            end;
                        else
                            continue;
                        end;
                    end;
                end;
                table.insert(v127, {
                    userId = tonumber(v131), 
                    partyStatus = l_Inactive_0
                });
            end;
        end;
        return {
            users = v127, 
            numberOfUpdatesPending = v128
        };
    end, {});
    l_React_0.useEffect(function() --[[ Line: 444 ]]
        -- upvalues: v136 (copy), v102 (copy), v123 (copy), v103 (copy), v119 (copy), l_setInterval_0 (ref), l_clearInterval_0 (ref)
        local v137 = v136(v102, v123, v103);
        v119(v137.users);
        local v138 = nil;
        v138 = l_setInterval_0(function() --[[ Line: 450 ]]
            -- upvalues: v136 (ref), v102 (ref), v123 (ref), v103 (ref), v119 (ref), l_clearInterval_0 (ref), v138 (ref)
            local v139 = v136(v102, v123, v103);
            v119(v139.users);
            if v139.numberOfUpdatesPending == 0 then
                l_clearInterval_0(v138);
            end;
        end, 1000);
        return function() --[[ Line: 459 ]]
            -- upvalues: l_clearInterval_0 (ref), v138 (ref)
            l_clearInterval_0(v138);
        end;
    end, {
        v123, 
        v103, 
        v102, 
        v136
    });
    local v140 = l_usePrevious_0(v94) or "";
    l_React_0.useEffect(function() --[[ Line: 466 ]]
        -- upvalues: v140 (copy), v94 (copy), v68 (copy), v100 (copy), v98 (copy), v3 (ref), l_isWideMode_0 (copy), v74 (copy)
        if v140 ~= "" and v94 == "" then
            v68.navigateAwayFromSquad();
            return;
        else
            if v94 ~= "" and v100 ~= "" and v98 ~= "" and v98 ~= v100 then
                local v141 = {
                    v3.Actions.navigate({
                        routeName = "ChatConversation", 
                        params = {
                            conversationId = v98
                        }
                    }), 
                    v3.Actions.navigate({
                        routeName = "SquadLobby", 
                        params = {
                            conversationId = v98
                        }
                    })
                };
                if l_isWideMode_0 then
                    v74.navigate("ChatLanding", {
                        conversationId = v98
                    }, v3.StackActions.reset({
                        index = 2, 
                        actions = v141
                    }));
                    return;
                else
                    table.insert(v141, 1, v3.Actions.navigate({
                        routeName = "ChatLanding"
                    }));
                    v74.navigate("ChatLandingStack", {
                        conversationId = v98
                    }, v3.StackActions.reset({
                        index = 3, 
                        actions = v141
                    }));
                end;
            end;
            return;
        end;
    end, {
        v74, 
        v98, 
        v100, 
        v94, 
        v68.navigateAwayFromSquad
    });
    local v142 = l_usePrevious_0(v95);
    l_React_0.useEffect(function() --[[ Line: 530 ]]
        -- upvalues: v95 (copy), v142 (copy), v71 (copy), v70 (copy), l_UserBlockingNetworking_0 (ref), l_NetworkingPresence_0 (ref)
        local v143 = {};
        if v95 then
            for _, v145 in pairs(v95) do
                local v146 = false;
                if v142 then
                    for _, v148 in pairs(v142) do
                        if v148.userId == v145.userId then
                            v146 = true;
                            break;
                        end;
                    end;
                end;
                if not v146 then
                    table.insert(v143, v145.userId);
                    if v71 ~= v145.userId then
                        v70(l_UserBlockingNetworking_0.IsBlockedById.API({
                            userId = v145.userId, 
                            currentUserId = v71
                        }));
                    end;
                end;
            end;
        end;
        v70(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v143));
    end, l_dependencyArray_0(v95, v71, v142));
    local v149 = l_React_0.useCallback(function() --[[ Line: 560 ]]
        -- upvalues: v88 (copy), v87 (copy)
        v88(not v87);
    end, l_dependencyArray_0(v87, v88));
    local v150 = v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20;
    local v151 = v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20;
    local v152, v153 = l_React_0.useState(nil);
    local v154, v155 = l_React_0.useState(false);
    local v157 = l_React_0.useCallback(function(v156) --[[ Line: 572 ]]
        -- upvalues: v78 (copy), v69 (copy)
        if v156.Y > 0 then
            v78(v156.Y + v69.Gap.Medium);
            return;
        else
            v78(0);
            return;
        end;
    end, l_dependencyArray_0(v78, v69));
    local v166 = l_React_0.useCallback(function(v158) --[[ Line: 580 ]]
        -- upvalues: v95 (copy)
        local v159 = v158.Squad and v158.Squad.Presence and v158.Squad.Presence.byUserId or {};
        local v160 = {};
        local l_ipairs_0 = ipairs;
        local v162 = v95 or {};
        for _, v164 in l_ipairs_0(v162) do
            local v165 = tostring(v164.userId);
            v160[v165] = v159[v165];
        end;
        return v160;
    end, l_dependencyArray_0(v95));
    local v167 = l_useSelector_0(v166);
    local v171 = l_React_0.useMemo(function() --[[ Line: 593 ]]
        -- upvalues: l_SquadRegroupExperimentation_0 (ref), v68 (copy), v93 (copy), v167 (copy), v71 (copy), l_PresenceType_0 (ref)
        if not l_SquadRegroupExperimentation_0.getSquadRegroupEnabled() or not v68.isInExperience or not v93 or not v93.members or #v93.members <= 1 or not v93.selfPermissions or not v93.selfPermissions.canSeeRegroupJoinButton then
            return false;
        else
            local v168 = v167[tostring(v71)];
            if v168 == nil then
                return false;
            else
                for v169, v170 in pairs(v167) do
                    if v170 ~= nil and v169 ~= tostring(v71) and (v170.userPresenceType == l_PresenceType_0.Online or v170.userPresenceType == l_PresenceType_0.InGame and v168.gameId ~= nil and v170.gameId ~= nil and v168.gameId ~= v170.gameId) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
    end, l_dependencyArray_0(v167, v71, v68.isInExperience, v93));
    local v172 = v69.Size.Size_1000 + v69.Padding.Medium * 2;
    local v173 = l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 and v171;
    local v174 = if not v173 and v171 then v69.Gap.XXLarge + v172 else 0;
    local v175 = l_React_0.useMemo(function() --[[ Line: 640 ]]
        -- upvalues: v51 (ref), l_React_0 (ref), v15 (ref), v157 (copy)
        if v51 then
            return (l_React_0.createElement(v15, {
                onAbsoluteSizeChanged = v157
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v157));
    local v176 = l_React_0.useCallback(function() --[[ Line: 648 ]]
        -- upvalues: v68 (copy), v98 (copy)
        v68.navigateToSquadInviteFriends(v98);
    end, l_dependencyArray_0(v98, v68.navigateToSquadInviteFriends));
    local v179 = l_React_0.useMemo(function() --[[ Line: 653 ]]
        -- upvalues: l_React_0 (ref), v77 (copy), v174 (copy), v72 (copy), l_FFlagEnableAppChatFocusableFixes_0 (ref), v92 (copy), v173 (copy), l_Foundation_0 (ref), v12 (ref), v89 (copy), v150 (copy), v69 (copy), v172 (copy), v118 (copy), v68 (copy), v76 (copy), l_EventNames_0 (ref), v98 (copy), v17 (ref), v62 (ref), v79 (copy), v153 (copy), v155 (copy), v176 (copy), v13 (ref), v71 (copy)
        return l_React_0.createElement("ScrollingFrame", {
            Position = UDim2.fromOffset(0, v77), 
            Size = UDim2.new(1, 0, 1, -(v77 + v174)), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.new(), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarImageColor3 = v72.Theme.UIEmphasis.Color, 
            ScrollBarImageTransparency = v72.Theme.UIEmphasis.Transparency, 
            ScrollBarThickness = 4, 
            Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil, 
            ZIndex = 0, 
            [l_React_0.Change.AbsoluteSize] = v92
        }, {
            FrameContents = if v173 then l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-y size-full-0 bg-surface-0 col align-x-center align-y-top"
            }, {
                UserGridContainer = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "auto-y size-full-0 bg-surface-0", 
                    LayoutOrder = 1
                }, {
                    SquadLobbyUserGrid = l_React_0.createElement(v12, {
                        containerSize = v89 - Vector2.new(0, v150 + v69.Gap.Medium + v172), 
                        paddingBottom = UDim.new(0, 0), 
                        users = v118, 
                        isInExperience = v68.isInExperience, 
                        onUserCardActivated = function(v177) --[[ Line: 683 ]] --[[ Name: onUserCardActivated ]]
                            -- upvalues: v76 (ref), l_EventNames_0 (ref), v98 (ref), v17 (ref), v62 (ref), v79 (ref), v153 (ref), v155 (ref)
                            v76.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                                parentChannelId = v98, 
                                actionType = v17.UserCardClicked, 
                                voiceStatus = if v62 then v79 else nil
                            });
                            v153(v177);
                            v155(true);
                        end, 
                        navigateToHomePage = v68.navigateToHomePage, 
                        navigateToSquadInviteFriends = v176
                    })
                }), 
                RegroupRowSpacer = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v69.Gap.Medium), 
                    LayoutOrder = 2
                }), 
                SquadLobbyRegroupRow = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v172), 
                    LayoutOrder = 3
                }, {
                    Row = l_React_0.createElement(v13, {
                        localUserId = v71
                    })
                }), 
                BottomPadding = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v150), 
                    LayoutOrder = 4
                })
            }) else nil, 
            SquadLobbyUserGrid = if v173 then nil else l_React_0.createElement(v12, {
                containerSize = v89 - Vector2.new(0, v150), 
                paddingBottom = UDim.new(0, v150), 
                users = v118, 
                isInExperience = v68.isInExperience, 
                onUserCardActivated = function(v178) --[[ Line: 725 ]] --[[ Name: onUserCardActivated ]]
                    -- upvalues: v76 (ref), l_EventNames_0 (ref), v98 (ref), v17 (ref), v62 (ref), v79 (ref), v153 (ref), v155 (ref)
                    v76.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                        parentChannelId = v98, 
                        actionType = v17.UserCardClicked, 
                        voiceStatus = if v62 then v79 else nil
                    });
                    v153(v178);
                    v155(true);
                end, 
                navigateToHomePage = v68.navigateToHomePage, 
                navigateToSquadInviteFriends = v176
            })
        });
    end, l_dependencyArray_0(v153, v155, v89, v95, v176, v92, v68.navigateToHomePage, v150, v77, if v171 then v174 else nil, v118, v173, if v173 then v172 else nil, if v173 then v71 else nil, if v62 then v79 else nil));
    local v180 = l_React_0.useMemo(function() --[[ Line: 759 ]]
        -- upvalues: l_React_0 (ref), v11 (ref), v73 (copy), v101 (copy), v68 (copy), v149 (copy), v94 (copy)
        return l_React_0.createElement(v11, {
            squadState = v73, 
            anchorPoint = Vector2.new(0.5, 1), 
            hasUnreadMessages = if v101 and v101.hasUnreadMessages then v101.hasUnreadMessages else false, 
            navigateAwayFromSquad = v68.navigateAwayFromSquad, 
            navigateToHomePage = v68.navigateToHomePage, 
            toggleVoiceChatMenu = v149, 
            position = UDim2.new(0.5, 0, 1, -20), 
            squadId = v94, 
            isInExperience = v68.isInExperience
        });
    end, l_dependencyArray_0(v94, v68.isInExperience, v68.navigateToHomePage, v73, v149, v101 and v101.hasUnreadMessages));
    local v181 = l_React_0.useMemo(function() --[[ Line: 784 ]]
        -- upvalues: v173 (copy), v171 (copy), l_React_0 (ref), l_Foundation_0 (ref), v7 (ref), v69 (copy), v172 (copy), v13 (ref), v71 (copy)
        if v173 or not v171 then
            return nil;
        else
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "anchor-bottom-center auto-none gui-object-defaults", 
                Position = UDim2.new(0.5, 0, 1, -(20 + v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT + v69.Gap.XXLarge)), 
                Size = UDim2.new(1, 0, 0, v172)
            }, {
                Row = l_React_0.createElement(v13, {
                    localUserId = v71
                })
            });
        end;
    end, l_dependencyArray_0(v171, v71, v69, v172));
    local v182 = l_React_0.useMemo(function() --[[ Line: 805 ]]
        -- upvalues: v87 (copy), l_React_0 (ref), l_Foundation_0 (ref), l_StateLayerAffordance_0 (ref), v88 (copy), v151 (copy), v69 (copy), v14 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v68 (copy)
        if v87 then
            return (l_React_0.createElement(l_Foundation_0.View, {
                Size = UDim2.new(1, 0, 1, 0), 
                stateLayer = {
                    affordance = l_StateLayerAffordance_0.None
                }, 
                onActivated = function() --[[ Line: 811 ]] --[[ Name: onActivated ]]
                    -- upvalues: v88 (ref)
                    v88(false);
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
                        Size = UDim2.new(1, 0, 0, v151), 
                        flexItem = {
                            FlexMode = Enum.UIFlexMode.Fill
                        }, 
                        LayoutOrder = 1, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 835 ]] --[[ Name: onActivated ]]
                            -- upvalues: v88 (ref)
                            v88(false);
                        end
                    }), 
                    Menu = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        flexItem = {
                            ItemLineAlignment = Enum.ItemLineAlignment.Center
                        }, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2, 
                        padding = Vector2.new(v69.Padding.XLarge, v69.Padding.Medium), 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 848 ]] --[[ Name: onActivated ]]

                        end, 
                        ZIndex = 3
                    }, {
                        SquadLobbyVoiceChatMenu = l_React_0.createElement(v14, {
                            openSquadVoiceChangers = if l_FFlagEnablePartyVoiceChangersInLua_0 then v68.openSquadVoiceChangers else nil
                        })
                    }), 
                    BottomPadding = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 0, v151), 
                        LayoutOrder = 3, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 861 ]] --[[ Name: onActivated ]]
                            -- upvalues: v88 (ref)
                            v88(false);
                        end
                    })
                })
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v151, v87, v88, v69));
    local v183 = l_React_0.useMemo(function() --[[ Line: 871 ]]
        -- upvalues: v154 (copy), v152 (copy), l_React_0 (ref), v16 (ref), v68 (copy), v153 (copy), v155 (copy), v98 (copy)
        if v154 and v152 then
            return (l_React_0.createElement(v16, {
                userId = v152, 
                isInExperience = v68.isInExperience, 
                onDismiss = function() --[[ Line: 876 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v153 (ref), v155 (ref)
                    v153(nil);
                    v155(false);
                end, 
                openViewProfile = function() --[[ Line: 880 ]] --[[ Name: openViewProfile ]]
                    -- upvalues: v68 (ref), v152 (ref)
                    v68.openViewProfile(v152);
                end, 
                openSquadVoiceAbuseReport = v68.openSquadVoiceAbuseReport, 
                parentChannelId = v98
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v98, v68.isInExperience, v154, v155, v68.openViewProfile, v152, v153));
    l_React_0.useEffect(function() --[[ Line: 899 ]]
        -- upvalues: l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_SquadRegroupExperimentation_0 (ref)
        l_SquadCoordinationExperienceJoinExperimentation_0.logExposure();
        if l_FFlagEnableSquadRegroupExperimentation_0 then
            l_SquadRegroupExperimentation_0.logExposure();
        end;
    end, {});
    local v184 = l_Roact_0.createFragment({
        SquadLobbyBanners = v175, 
        SquadLobbyUsersScrollingFrame = v179, 
        SquadLobbyRegroupRow = v181, 
        SquadLobbyActionBar = v180, 
        SquadLobbyVoiceChatMenu = v182, 
        UserDropdownMenu = v183
    });
    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
        v184 = l_React_0.createElement(l_SquadLobbySessionProvider_0.Provider, nil, v184);
    end;
    return v184;
end;