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
local l_FFlagRemoveDependencyArrayAntipattern_0 = l_SharedFlags_0.FFlagRemoveDependencyArrayAntipattern;
return function(v69) --[[ Line: 99 ]] --[[ Name: SquadLobby ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useStyle_0 (copy), l_useSquadState_0 (copy), l_useNavigation_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useVoiceStatus_0 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_HttpService_0 (copy), v3 (copy), l_SquadViewFlags_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useSelector_0 (copy), l_useStore_0 (copy), l_SquadQuickStartExperimentation_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), l_SquadPromptType_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FFlagMakeCreateOrJoinSquadAThunks_0 (copy), l_createOrJoinSquad_0 (copy), l_NetworkingSquads_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_logInExpCoplayTelemetry_0 (copy), l_SquadCoplayJoin_0 (copy), l_FFlagEnableSquadCoplayDependencyArray_0 (copy), l_useEffectOnce_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), v9 (copy), l_Cryo_0 (copy), v18 (copy), v57 (copy), v56 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_usePrevious_0 (copy), l_UserBlockingNetworking_0 (copy), l_NetworkingPresence_0 (copy), v7 (copy), l_SquadRegroupExperimentation_0 (copy), l_PresenceType_0 (copy), l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 (copy), v51 (copy), v15 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Foundation_0 (copy), v12 (copy), l_EventNames_0 (copy), v17 (copy), v62 (copy), v13 (copy), v11 (copy), l_StateLayerAffordance_0 (copy), v14 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v16 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_Roact_0 (copy), l_SquadLobbySessionProvider_0 (copy)
    local v70 = l_useTokens_0();
    local v71 = l_useDispatch_0();
    local v72 = tonumber(l_useLocalUserId_0()) or 0;
    local v73 = l_useStyle_0();
    local v74 = l_useSquadState_0();
    local v75 = l_useNavigation_0();
    local l_isWideMode_0 = v69.isWideMode;
    local v77 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v78, v79 = l_React_0.useState(0);
    local v80 = l_useVoiceStatus_0();
    if l_FFlagEnableSquadTopBannerWideMode_0 then
        local v81 = l_React_0.useRef(l_HttpService_0:GenerateGUID());
        local l_v81_0 = v81 --[[ copy: 12 -> 61 ]];
        l_React_0.useEffect(function() --[[ Line: 114 ]]
            -- upvalues: l_isWideMode_0 (copy), l_v81_0 (copy), v77 (copy), v75 (copy), v3 (ref)
            if not l_isWideMode_0 then
                local l_current_0 = l_v81_0.current;
                v77.disableSquadTopBanner(l_current_0, true);
                local v85 = v75 and v75.addListener(v3.Events.WillBlur, function(v84) --[[ Line: 119 ]]
                    -- upvalues: v77 (ref), l_current_0 (copy)
                    if v84.state.routeName ~= "SquadInviteFriends" and v84.state.routeName ~= "SquadLobby" then
                        v77.disableSquadTopBanner(l_current_0, false);
                        return;
                    else
                        v77.disableSquadTopBanner(l_current_0, true);
                        return;
                    end;
                end);
                return function() --[[ Line: 130 ]]
                    -- upvalues: v85 (ref), v77 (ref), l_current_0 (copy)
                    if v85 then
                        v85.remove();
                        v85 = nil;
                    end;
                    v77.disableSquadTopBanner(l_current_0, false);
                end;
            else
                return function() --[[ Line: 140 ]]

                end;
            end;
        end, {
            v77.disableSquadTopBanner, 
            v75, 
            l_isWideMode_0
        });
        l_React_0.useEffect(function() --[[ Line: 143 ]]
            -- upvalues: v77 (copy), l_SquadViewFlags_0 (ref)
            v77.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            return function() --[[ Line: 145 ]]
                -- upvalues: v77 (ref), l_SquadViewFlags_0 (ref)
                v77.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v77.updateSquadViewFlags
        });
    else
        l_React_0.useEffect(function() --[[ Line: 153 ]]
            -- upvalues: v77 (copy), l_SquadViewFlags_0 (ref), v75 (copy), v3 (ref)
            v77.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            local v87 = v75 and v75.addListener(v3.Events.WillBlur, function(v86) --[[ Line: 156 ]]
                -- upvalues: v77 (ref), l_SquadViewFlags_0 (ref)
                if v86.state.routeName ~= "SquadInviteFriends" and v86.state.routeName ~= "SquadLobby" then
                    v77.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
                    return;
                else
                    v77.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
                    return;
                end;
            end);
            return function() --[[ Line: 163 ]]
                -- upvalues: v87 (ref), v77 (ref), l_SquadViewFlags_0 (ref)
                if v87 then
                    v87.remove();
                    v87 = nil;
                end;
                v77.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v77.updateSquadViewFlags, 
            v75
        });
    end;
    local v88, v89 = l_React_0.useState(false);
    local v90, v91 = l_React_0.useState(Vector2.zero);
    local v93 = l_React_0.useCallback(function(v92) --[[ Line: 175 ]]
        -- upvalues: v91 (copy)
        v91(v92.AbsoluteSize);
    end, {
        v91
    });
    local v94 = l_useCurrentSquadSelector_0();
    local v95 = if v94 then v94.squadId else "";
    local v96 = v94 and v94.members;
    local v98 = l_React_0.useCallback(function(v97) --[[ Line: 183 ]]
        if v97.Squad and v97.Squad.Squad and v97.Squad.Squad.currentSquad then
            return v97.Squad.Squad.currentSquad.parentChannelId or "";
        else
            return "";
        end;
    end, {});
    local v99 = l_useSelector_0(v98);
    local v100 = l_useStore_0();
    local v101 = v75.getParam("conversationId") or "";
    local v102 = v77.useGetConversationFromId(v101);
    local v103 = v102 and v102.participants;
    local v104 = v94 and v94.invitees;
    local v105 = nil;
    local v106 = nil;
    local v107 = nil;
    v105 = v75.getParam("extraParams") or {};
    v106 = v105.squadId;
    if l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and l_FFlagEnablePartyQuickStartButton_0 then
        v107 = v105.squadCreateOrJoinAttemptId;
    end;
    local v108 = l_React_0.useCallback(function() --[[ Line: 207 ]]
        -- upvalues: v77 (copy), v100 (copy), l_SquadPromptType_0 (ref), v69 (copy)
        v77.setSquadPrompt(v100, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error, 
            onConfirm = function() --[[ Line: 211 ]] --[[ Name: onConfirm ]]
                -- upvalues: v69 (ref)
                v69.navigateAwayFromSquad();
            end
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v69.navigateAwayFromSquad, 
        v100, 
        v77.setSquadPrompt
    } else l_dependencyArray_0(v69.navigateAwayFromSquad, v100, v77.setSquadPrompt));
    local v115 = l_React_0.useCallback(function(v109) --[[ Line: 222 ]]
        -- upvalues: l_FFlagMakeCreateOrJoinSquadAThunks_0 (ref), v71 (copy), l_createOrJoinSquad_0 (ref), v77 (copy), v107 (ref), v69 (copy), l_NetworkingSquads_0 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_logInExpCoplayTelemetry_0 (ref), l_SquadCoplayJoin_0 (ref), v108 (copy)
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then
            v71(l_createOrJoinSquad_0(v109, v77.setSquadPrompt, v77.fireSquadAnalytics, v77.squadLocation, v107, v69.navigateAwayFromSquad));
            return;
        else
            local v110 = v71(l_NetworkingSquads_0.CreateOrJoinSquad.API({
                parentChannelId = v109, 
                leaveExisting = true, 
                squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v77.squadLocation else nil, 
                partyAttemptId = v107
            }));
            if l_FFlagEnableSquadCoplayAnalytic_0 then
                v110 = v110:andThen(function(v111) --[[ Line: 245 ]]
                    -- upvalues: l_logInExpCoplayTelemetry_0 (ref), v77 (ref), l_SquadCoplayJoin_0 (ref)
                    local l_groupUpId_0 = v111.responseBody.groupUp.groupUpId;
                    local l_members_0 = v111.responseBody.groupUp.members;
                    if l_groupUpId_0 and l_members_0 then
                        l_logInExpCoplayTelemetry_0(l_groupUpId_0, l_members_0, v77.squadLocation, l_SquadCoplayJoin_0.PartyJoin, v77.fireSquadAnalytics);
                    end;
                end);
            end;
            v110:catch(function(_) --[[ Line: 261 ]]
                -- upvalues: v108 (ref)
                v108();
            end);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71, 
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then l_createOrJoinSquad_0 else nil, 
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v69.navigateAwayFromSquad else nil, 
        if not l_FFlagMakeCreateOrJoinSquadAThunks_0 then v108 else nil, 
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v77.setSquadPrompt else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v77.squadLocation else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v77.fireSquadAnalytics else nil, 
        v107
    } else l_dependencyArray_0(v71, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then l_createOrJoinSquad_0 else nil, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v69.navigateAwayFromSquad else nil, if not l_FFlagMakeCreateOrJoinSquadAThunks_0 then v108 else nil, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v77.setSquadPrompt else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v77.squadLocation else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v77.fireSquadAnalytics else nil, v107));
    local v116 = v106 and v106 ~= v95;
    l_React_0.useEffect(function() --[[ Line: 293 ]]
        -- upvalues: v116 (copy), v77 (copy), v100 (copy), l_SquadPromptType_0 (ref), v115 (copy), v101 (copy), v69 (copy), v75 (copy)
        if v116 then
            v77.setSquadPrompt(v100, {
                promptType = l_SquadPromptType_0.JoinAnotherSquad, 
                onConfirm = function() --[[ Line: 297 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v115 (ref), v101 (ref)
                    v115(v101);
                end, 
                onCancel = function() --[[ Line: 300 ]] --[[ Name: onCancel ]]
                    -- upvalues: v69 (ref)
                    v69.navigateAwayFromSquad();
                end
            });
            v75.setParams({
                squadId = nil
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v106, 
        v77.setSquadPrompt, 
        v115, 
        v101, 
        v69.navigateAwayFromSquad, 
        v116
    } else l_dependencyArray_0(v106, v77.setSquadPrompt, v115, v101, v69.navigateAwayFromSquad, v116));
    l_useEffectOnce_0(function() --[[ Line: 331 ]]
        -- upvalues: v116 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v77 (copy), v102 (copy), v69 (copy), v95 (copy), v9 (ref), v101 (copy), v71 (copy), v115 (copy), v108 (copy)
        if v116 then
            return;
        elseif l_FFlagAppChatShowOSAOnPageEntry_0 and v77.shouldShowOSAForConversation and v77.shouldShowOSAForConversation(v102) then
            v69.navigateAwayFromSquad();
            return;
        else
            if v95 == "" then
                if v102 and v102.source == "friends" then
                    v9:debug("Channel does not exist for: {}. Creating a friend conversation.", v101);
                    v71(v77.createFriendConversation(v101)):andThen(function(v117) --[[ Line: 355 ]]
                        -- upvalues: v115 (ref)
                        if v117 and v117.id then
                            v115(v117.id);
                        end;
                    end):catch(function(v118) --[[ Line: 360 ]]
                        -- upvalues: v9 (ref), v108 (ref)
                        v9:debug("Error while trying to create a friend conversation: {}", v118);
                        v108();
                    end);
                    return;
                else
                    v115(v101);
                end;
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71, 
        v77.createFriendConversation, 
        v101, 
        v102, 
        v115, 
        v108
    } else l_dependencyArray_0(v71, v77.createFriendConversation, v101, v102, v115, v108));
    local v119, v120 = l_React_0.useState({});
    local v124 = l_React_0.useMemo(function() --[[ Line: 391 ]]
        -- upvalues: v96 (copy)
        local v121 = {};
        if v96 then
            for _, v123 in ipairs(v96) do
                v121[tostring(v123.userId)] = true;
            end;
        end;
        return v121;
    end, {
        v96
    });
    local v137 = l_React_0.useCallback(function(v125, v126, v127) --[[ Line: 412 ]]
        -- upvalues: l_Cryo_0 (ref), v72 (copy), v18 (ref), v57 (ref), v56 (ref)
        local v128 = {};
        local v129 = 0;
        if v126 and #l_Cryo_0.Dictionary.keys(v126) == 0 then
            table.insert(v128, {
                userId = v72, 
                partyStatus = v18.Connecting
            });
        elseif v125 then
            local v130 = os.time();
            for _, v132 in ipairs(v125) do
                local l_Inactive_0 = v18.Inactive;
                if v126[v132] then
                    l_Inactive_0 = v18.Active;
                else
                    local v135 = v127 and l_Cryo_0.List.findWhere(v127, function(v134) --[[ Line: 437 ]]
                        -- upvalues: v132 (copy)
                        return v132 == tostring(v134.userId);
                    end);
                    if v135 then
                        local v136 = math.floor(v127[v135].invitedAtTimestampMs / 1000) or 0;
                        if v130 >= v136 then
                            if v130 - v136 < v57 then
                                l_Inactive_0 = v18.Invited;
                                v129 = v129 + 1;
                            elseif v130 - v136 < v56 + v57 then
                                l_Inactive_0 = v18.NoResponse;
                                v129 = v129 + 1;
                            end;
                        else
                            continue;
                        end;
                    end;
                end;
                table.insert(v128, {
                    userId = tonumber(v132), 
                    partyStatus = l_Inactive_0
                });
            end;
        end;
        return {
            users = v128, 
            numberOfUpdatesPending = v129
        };
    end, {});
    l_React_0.useEffect(function() --[[ Line: 481 ]]
        -- upvalues: v137 (copy), v103 (copy), v124 (copy), v104 (copy), v120 (copy), l_setInterval_0 (ref), l_clearInterval_0 (ref)
        local v138 = v137(v103, v124, v104);
        v120(v138.users);
        local v139 = nil;
        v139 = l_setInterval_0(function() --[[ Line: 487 ]]
            -- upvalues: v137 (ref), v103 (ref), v124 (ref), v104 (ref), v120 (ref), l_clearInterval_0 (ref), v139 (ref)
            local v140 = v137(v103, v124, v104);
            v120(v140.users);
            if v140.numberOfUpdatesPending == 0 then
                l_clearInterval_0(v139);
            end;
        end, 1000);
        return function() --[[ Line: 496 ]]
            -- upvalues: l_clearInterval_0 (ref), v139 (ref)
            l_clearInterval_0(v139);
        end;
    end, {
        v124, 
        v104, 
        v103, 
        v137
    });
    local v141 = l_usePrevious_0(v95) or "";
    l_React_0.useEffect(function() --[[ Line: 503 ]]
        -- upvalues: v141 (copy), v95 (copy), v69 (copy), v101 (copy), v99 (copy), v3 (ref), l_isWideMode_0 (copy), v75 (copy)
        if v141 ~= "" and v95 == "" then
            v69.navigateAwayFromSquad();
            return;
        else
            if v95 ~= "" and v101 ~= "" and v99 ~= "" and v99 ~= v101 then
                local v142 = {
                    v3.Actions.navigate({
                        routeName = "ChatConversation", 
                        params = {
                            conversationId = v99
                        }
                    }), 
                    v3.Actions.navigate({
                        routeName = "SquadLobby", 
                        params = {
                            conversationId = v99
                        }
                    })
                };
                if l_isWideMode_0 then
                    v75.navigate("ChatLanding", {
                        conversationId = v99
                    }, v3.StackActions.reset({
                        index = 2, 
                        actions = v142
                    }));
                    return;
                else
                    table.insert(v142, 1, v3.Actions.navigate({
                        routeName = "ChatLanding"
                    }));
                    v75.navigate("ChatLandingStack", {
                        conversationId = v99
                    }, v3.StackActions.reset({
                        index = 3, 
                        actions = v142
                    }));
                end;
            end;
            return;
        end;
    end, {
        v75, 
        v99, 
        v101, 
        v95, 
        v69.navigateAwayFromSquad
    });
    local v143 = l_usePrevious_0(v96);
    l_React_0.useEffect(function() --[[ Line: 568 ]]
        -- upvalues: v96 (copy), v143 (copy), v72 (copy), v71 (copy), l_UserBlockingNetworking_0 (ref), l_NetworkingPresence_0 (ref)
        local v144 = {};
        if v96 then
            for _, v146 in pairs(v96) do
                local v147 = false;
                if v143 then
                    for _, v149 in pairs(v143) do
                        if v149.userId == v146.userId then
                            v147 = true;
                            break;
                        end;
                    end;
                end;
                if not v147 then
                    table.insert(v144, v146.userId);
                    if v72 ~= v146.userId then
                        v71(l_UserBlockingNetworking_0.IsBlockedById.API({
                            userId = v146.userId, 
                            currentUserId = v72
                        }));
                    end;
                end;
            end;
        end;
        v71(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v144));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v96, 
        v72, 
        v143
    } else l_dependencyArray_0(v96, v72, v143));
    local v150 = l_React_0.useCallback(function() --[[ Line: 603 ]]
        -- upvalues: v89 (copy), v88 (copy)
        v89(not v88);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v88, 
        v89
    } else l_dependencyArray_0(v88, v89));
    local v151 = v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20;
    local v152 = v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20;
    local v153, v154 = l_React_0.useState(nil);
    local v155, v156 = l_React_0.useState(false);
    local v158 = l_React_0.useCallback(function(v157) --[[ Line: 620 ]]
        -- upvalues: v79 (copy), v70 (copy)
        if v157.Y > 0 then
            v79(v157.Y + v70.Gap.Medium);
            return;
        else
            v79(0);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v79, 
        v70
    } else l_dependencyArray_0(v79, v70));
    local v167 = l_React_0.useCallback(function(v159) --[[ Line: 633 ]]
        -- upvalues: v96 (copy)
        local v160 = v159.Squad and v159.Squad.Presence and v159.Squad.Presence.byUserId or {};
        local v161 = {};
        local l_ipairs_0 = ipairs;
        local v163 = v96 or {};
        for _, v165 in l_ipairs_0(v163) do
            local v166 = tostring(v165.userId);
            v161[v166] = v160[v166];
        end;
        return v161;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v96
    } else l_dependencyArray_0(v96));
    local v168 = l_useSelector_0(v167);
    local v172 = l_React_0.useMemo(function() --[[ Line: 649 ]]
        -- upvalues: l_SquadRegroupExperimentation_0 (ref), v69 (copy), v94 (copy), v168 (copy), v72 (copy), l_PresenceType_0 (ref)
        if not l_SquadRegroupExperimentation_0.getSquadRegroupEnabled() or not v69.isInExperience or not v94 or not v94.members or #v94.members <= 1 or not v94.selfPermissions or not v94.selfPermissions.canSeeRegroupJoinButton then
            return false;
        else
            local v169 = v168[tostring(v72)];
            if v169 == nil then
                return false;
            else
                for v170, v171 in pairs(v168) do
                    if v171 ~= nil and v170 ~= tostring(v72) and (v171.userPresenceType == l_PresenceType_0.Online or v171.userPresenceType == l_PresenceType_0.InGame and v169.gameId ~= nil and v171.gameId ~= nil and v169.gameId ~= v171.gameId) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v168, 
        v72, 
        v69.isInExperience, 
        v94
    } else l_dependencyArray_0(v168, v72, v69.isInExperience, v94));
    local v173 = v70.Size.Size_1000 + v70.Padding.Medium * 2;
    local v174 = l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 and v172;
    local v175 = if not v174 and v172 then v70.Gap.XXLarge + v173 else 0;
    local v176 = l_React_0.useMemo(function() --[[ Line: 701 ]]
        -- upvalues: v51 (ref), l_React_0 (ref), v15 (ref), v158 (copy)
        if v51 then
            return (l_React_0.createElement(v15, {
                onAbsoluteSizeChanged = v158
            }));
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v158
    } else l_dependencyArray_0(v158));
    local v177 = l_React_0.useCallback(function() --[[ Line: 714 ]]
        -- upvalues: v69 (copy), v99 (copy)
        v69.navigateToSquadInviteFriends(v99);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v99, 
        v69.navigateToSquadInviteFriends
    } else l_dependencyArray_0(v99, v69.navigateToSquadInviteFriends));
    local v180 = l_React_0.useMemo(function() --[[ Line: 723 ]]
        -- upvalues: l_React_0 (ref), v78 (copy), v175 (copy), v73 (copy), l_FFlagEnableAppChatFocusableFixes_0 (ref), v93 (copy), v174 (copy), l_Foundation_0 (ref), v12 (ref), v90 (copy), v151 (copy), v70 (copy), v173 (copy), v119 (copy), v69 (copy), v77 (copy), l_EventNames_0 (ref), v99 (copy), v17 (ref), v62 (ref), v80 (copy), v154 (copy), v156 (copy), v177 (copy), v13 (ref), v72 (copy)
        return l_React_0.createElement("ScrollingFrame", {
            Position = UDim2.fromOffset(0, v78), 
            Size = UDim2.new(1, 0, 1, -(v78 + v175)), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.new(), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarImageColor3 = v73.Theme.UIEmphasis.Color, 
            ScrollBarImageTransparency = v73.Theme.UIEmphasis.Transparency, 
            ScrollBarThickness = 4, 
            Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil, 
            ZIndex = 0, 
            [l_React_0.Change.AbsoluteSize] = v93
        }, {
            FrameContents = if v174 then l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-y size-full-0 bg-surface-0 col align-x-center align-y-top"
            }, {
                UserGridContainer = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "auto-y size-full-0 bg-surface-0", 
                    LayoutOrder = 1
                }, {
                    SquadLobbyUserGrid = l_React_0.createElement(v12, {
                        containerSize = v90 - Vector2.new(0, v151 + v70.Gap.Medium + v173), 
                        paddingBottom = UDim.new(0, 0), 
                        users = v119, 
                        isInExperience = v69.isInExperience, 
                        onUserCardActivated = function(v178) --[[ Line: 753 ]] --[[ Name: onUserCardActivated ]]
                            -- upvalues: v77 (ref), l_EventNames_0 (ref), v99 (ref), v17 (ref), v62 (ref), v80 (ref), v154 (ref), v156 (ref)
                            v77.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                                parentChannelId = v99, 
                                actionType = v17.UserCardClicked, 
                                voiceStatus = if v62 then v80 else nil
                            });
                            v154(v178);
                            v156(true);
                        end, 
                        navigateToHomePage = v69.navigateToHomePage, 
                        navigateToSquadInviteFriends = v177
                    })
                }), 
                RegroupRowSpacer = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v70.Gap.Medium), 
                    LayoutOrder = 2
                }), 
                SquadLobbyRegroupRow = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v173), 
                    LayoutOrder = 3
                }, {
                    Row = l_React_0.createElement(v13, {
                        localUserId = v72
                    })
                }), 
                BottomPadding = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v151), 
                    LayoutOrder = 4
                })
            }) else nil, 
            SquadLobbyUserGrid = if v174 then nil else l_React_0.createElement(v12, {
                containerSize = v90 - Vector2.new(0, v151), 
                paddingBottom = UDim.new(0, v151), 
                users = v119, 
                isInExperience = v69.isInExperience, 
                onUserCardActivated = function(v179) --[[ Line: 795 ]] --[[ Name: onUserCardActivated ]]
                    -- upvalues: v77 (ref), l_EventNames_0 (ref), v99 (ref), v17 (ref), v62 (ref), v80 (ref), v154 (ref), v156 (ref)
                    v77.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                        parentChannelId = v99, 
                        actionType = v17.UserCardClicked, 
                        voiceStatus = if v62 then v80 else nil
                    });
                    v154(v179);
                    v156(true);
                end, 
                navigateToHomePage = v69.navigateToHomePage, 
                navigateToSquadInviteFriends = v177
            })
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v154, 
        v156, 
        v90, 
        v96, 
        v177, 
        v93, 
        v69.navigateToHomePage, 
        v151, 
        v78, 
        if v172 then v175 else nil, 
        v119, 
        v174, 
        if v174 then v173 else nil, 
        if v174 then v72 else nil, 
        if v62 then v80 else nil
    } else l_dependencyArray_0(v154, v156, v90, v96, v177, v93, v69.navigateToHomePage, v151, v78, if v172 then v175 else nil, v119, v174, if v174 then v173 else nil, if v174 then v72 else nil, if v62 then v80 else nil));
    local v181 = l_React_0.useMemo(function() --[[ Line: 847 ]]
        -- upvalues: l_React_0 (ref), v11 (ref), v74 (copy), v102 (copy), v69 (copy), v150 (copy), v95 (copy)
        return l_React_0.createElement(v11, {
            squadState = v74, 
            anchorPoint = Vector2.new(0.5, 1), 
            hasUnreadMessages = if v102 and v102.hasUnreadMessages then v102.hasUnreadMessages else false, 
            navigateAwayFromSquad = v69.navigateAwayFromSquad, 
            navigateToHomePage = v69.navigateToHomePage, 
            toggleVoiceChatMenu = v150, 
            position = UDim2.new(0.5, 0, 1, -20), 
            squadId = v95, 
            isInExperience = v69.isInExperience
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v95, 
        v69.isInExperience, 
        v69.navigateToHomePage, 
        v74, 
        v150, 
        v102 and v102.hasUnreadMessages
    } else l_dependencyArray_0(v95, v69.isInExperience, v69.navigateToHomePage, v74, v150, v102 and v102.hasUnreadMessages));
    local v182 = l_React_0.useMemo(function() --[[ Line: 882 ]]
        -- upvalues: v174 (copy), v172 (copy), l_React_0 (ref), l_Foundation_0 (ref), v7 (ref), v70 (copy), v173 (copy), v13 (ref), v72 (copy)
        if v174 or not v172 then
            return nil;
        else
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "anchor-bottom-center auto-none gui-object-defaults", 
                Position = UDim2.new(0.5, 0, 1, -(20 + v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT + v70.Gap.XXLarge)), 
                Size = UDim2.new(1, 0, 0, v173)
            }, {
                Row = l_React_0.createElement(v13, {
                    localUserId = v72
                })
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v172, 
        v72, 
        v70, 
        v173
    } else l_dependencyArray_0(v172, v72, v70, v173));
    local v183 = l_React_0.useMemo(function() --[[ Line: 908 ]]
        -- upvalues: v88 (copy), l_React_0 (ref), l_Foundation_0 (ref), l_StateLayerAffordance_0 (ref), v89 (copy), v152 (copy), v70 (copy), v14 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v69 (copy)
        if v88 then
            return (l_React_0.createElement(l_Foundation_0.View, {
                Size = UDim2.new(1, 0, 1, 0), 
                stateLayer = {
                    affordance = l_StateLayerAffordance_0.None
                }, 
                onActivated = function() --[[ Line: 914 ]] --[[ Name: onActivated ]]
                    -- upvalues: v89 (ref)
                    v89(false);
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
                        Size = UDim2.new(1, 0, 0, v152), 
                        flexItem = {
                            FlexMode = Enum.UIFlexMode.Fill
                        }, 
                        LayoutOrder = 1, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 938 ]] --[[ Name: onActivated ]]
                            -- upvalues: v89 (ref)
                            v89(false);
                        end
                    }), 
                    Menu = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        flexItem = {
                            ItemLineAlignment = Enum.ItemLineAlignment.Center
                        }, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2, 
                        padding = Vector2.new(v70.Padding.XLarge, v70.Padding.Medium), 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 951 ]] --[[ Name: onActivated ]]

                        end, 
                        ZIndex = 3
                    }, {
                        SquadLobbyVoiceChatMenu = l_React_0.createElement(v14, {
                            openSquadVoiceChangers = if l_FFlagEnablePartyVoiceChangersInLua_0 then v69.openSquadVoiceChangers else nil
                        })
                    }), 
                    BottomPadding = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 0, v152), 
                        LayoutOrder = 3, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 964 ]] --[[ Name: onActivated ]]
                            -- upvalues: v89 (ref)
                            v89(false);
                        end
                    })
                })
            }));
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v152, 
        v88, 
        v89, 
        v70
    } else l_dependencyArray_0(v152, v88, v89, v70));
    local v184 = l_React_0.useMemo(function() --[[ Line: 983 ]]
        -- upvalues: v155 (copy), v153 (copy), l_React_0 (ref), v16 (ref), v69 (copy), v154 (copy), v156 (copy), v99 (copy)
        if v155 and v153 then
            return (l_React_0.createElement(v16, {
                userId = v153, 
                isInExperience = v69.isInExperience, 
                onDismiss = function() --[[ Line: 988 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v154 (ref), v156 (ref)
                    v154(nil);
                    v156(false);
                end, 
                openViewProfile = function() --[[ Line: 992 ]] --[[ Name: openViewProfile ]]
                    -- upvalues: v69 (ref), v153 (ref)
                    v69.openViewProfile(v153);
                end, 
                openSquadVoiceAbuseReport = v69.openSquadVoiceAbuseReport, 
                parentChannelId = v99
            }));
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v99, 
        v69.isInExperience, 
        v155, 
        v156, 
        v69.openViewProfile, 
        v153, 
        v154
    } else l_dependencyArray_0(v99, v69.isInExperience, v155, v156, v69.openViewProfile, v153, v154));
    l_React_0.useEffect(function() --[[ Line: 1021 ]]
        -- upvalues: l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_SquadRegroupExperimentation_0 (ref)
        l_SquadCoordinationExperienceJoinExperimentation_0.logExposure();
        if l_FFlagEnableSquadRegroupExperimentation_0 then
            l_SquadRegroupExperimentation_0.logExposure();
        end;
    end, {});
    local v185 = l_Roact_0.createFragment({
        SquadLobbyBanners = v176, 
        SquadLobbyUsersScrollingFrame = v180, 
        SquadLobbyRegroupRow = v182, 
        SquadLobbyActionBar = v181, 
        SquadLobbyVoiceChatMenu = v183, 
        UserDropdownMenu = v184
    });
    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
        v185 = l_React_0.createElement(l_SquadLobbySessionProvider_0.Provider, nil, v185);
    end;
    return v185;
end;