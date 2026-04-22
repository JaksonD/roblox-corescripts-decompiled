local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_Parent_0.UIBlox);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useVoiceStatus_0 = require(l_Parent_0.CrossExperienceVoice).Hooks.useVoiceStatus;
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(l_script_FirstAncestor_0.dependencies);
local v10 = require(l_script_FirstAncestor_0.Logger);
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v12 = require(script.Parent.SquadLobbyActionBar);
local v13 = require(script.Parent.SquadLobbyUserGrid);
local v14 = require(script.Parent.SquadLobbyRegroupRow);
local v15 = require(script.Parent.SquadLobbyVoiceChatMenu);
local v16 = require(script.Parent.SquadLobbyBanners);
local v17 = require(script.Parent.SquadLobbyUserDropdownMenu);
local v18 = require(l_script_FirstAncestor_0.Enums.SquadPartySheetActionEnum);
local v19 = require(l_script_FirstAncestor_0.Enums.SquadUserPartyStatus);
local l_Cryo_0 = v9.Cryo;
local l_Foundation_0 = v9.Foundation;
local l_LuauPolyfill_0 = v9.LuauPolyfill;
local l_NetworkingPresence_0 = v9.NetworkingPresence;
local l_NetworkingSquads_0 = v9.NetworkingSquads;
local l_React_0 = v9.React;
local l_Roact_0 = v9.Roact;
local l_SharedFlags_0 = v9.SharedFlags;
local l_EventNames_0 = v9.SquadsCore.Analytics.EventNames;
local l_SquadExternalContractContext_0 = v9.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v9.SquadsCore.Enums.SquadPromptType;
local l_SquadCoplayJoin_0 = v9.SquadsCore.Enums.SquadCoplayJoin;
local l_SquadViewFlags_0 = v9.SquadsCore.SquadExternalContractProvider.SquadViewFlags;
local l_SquadLobbySessionProvider_0 = v9.SquadsCore.SquadSessionProvider.SquadLobbySessionProvider;
local l_logInExpCoplayTelemetry_0 = v9.SquadsCore.Analytics.logInExpCoplayTelemetry;
local l_createOrJoinSquad_0 = v9.SquadsCore.Thunks.createOrJoinSquad;
local l_UserBlockingNetworking_0 = v9.UserBlockingNetworking;
local l_dependencyArray_0 = v9.Hooks.dependencyArray;
local l_useCurrentSquadSelector_0 = v9.Hooks.useCurrentSquadSelector;
local l_useDispatch_0 = v9.Hooks.useDispatch;
local l_useEffectOnce_0 = v9.Hooks.useEffectOnce;
local l_useNavigation_0 = v9.useNavigation;
local l_usePrevious_0 = v9.Hooks.usePrevious;
local l_useSelector_0 = v9.Hooks.useSelector;
local l_useStore_0 = v9.Hooks.useStore;
local l_useSquadState_0 = v9.SquadsCore.Hooks.useSquadState;
local l_PresenceType_0 = v9.RoduxPresence.Enums.PresenceType;
local l_StateLayerAffordance_0 = l_Foundation_0.Enums.StateLayerAffordance;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_clearInterval_0 = l_LuauPolyfill_0.clearInterval;
local l_setInterval_0 = l_LuauPolyfill_0.setInterval;
local v52 = game:DefineFastFlag("EnableSquadLobbyBanners", false);
local l_FFlagEnableSquadCoplayAnalytic_0 = l_SharedFlags_0.FFlagEnableSquadCoplayAnalytic;
local l_FFlagEnableSquadCoplayDependencyArray_0 = l_SharedFlags_0.FFlagEnableSquadCoplayDependencyArray;
local l_FFlagEnableSquadTopBannerWideMode_0 = l_SharedFlags_0.FFlagEnableSquadTopBannerWideMode;
local l_FFlagMakeCreateOrJoinSquadAThunks_0 = l_SharedFlags_0.FFlagMakeCreateOrJoinSquadAThunks;
local v57 = game:DefineFastInt("PartyInviteeNoResponseDurationSeconds", 3);
local v58 = game:DefineFastInt("PartyUserInvitedDurationSeconds", 10);
local l_SquadQuickStartExperimentation_0 = v9.SocialExperiments.SquadQuickStartExperimentation;
local l_SquadCoordinationExperienceJoinExperimentation_0 = v9.SocialExperiments.SquadCoordinationExperienceJoinExperimentation;
local l_SquadRegroupExperimentation_0 = v9.SocialExperiments.SquadRegroupExperimentation;
local l_FFlagEnablePartyQuickStartButton_0 = l_SharedFlags_0.FFlagEnablePartyQuickStartButton;
local v63 = require(l_script_FirstAncestor_0.Flags.FFlagRecordVoiceStatusOnPartyAction);
local l_FFlagEnableAppChatFocusableFixes_0 = l_SharedFlags_0.FFlagEnableAppChatFocusableFixes;
local l_FFlagEnablePartyVoiceChangersInLua_0 = l_SharedFlags_0.FFlagEnablePartyVoiceChangersInLua;
local l_FFlagEnableSquadRegroupExperimentation_0 = l_SharedFlags_0.FFlagEnableSquadRegroupExperimentation;
local l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 = l_SharedFlags_0.FFlagEnableSquadRegroupExperimentationSmallScreenFix;
local l_FFlagEnableSquadRegroupServerCapacityCheck_0 = l_SharedFlags_0.FFlagEnableSquadRegroupServerCapacityCheck;
local l_FFlagAppChatShowOSAOnPageEntry_0 = l_SharedFlags_0.FFlagAppChatShowOSAOnPageEntry;
local l_FFlagRemoveDependencyArrayAntipattern_0 = l_SharedFlags_0.FFlagRemoveDependencyArrayAntipattern;
return function(v71) --[[ Line: 100 ]] --[[ Name: SquadLobby ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useStyle_0 (copy), l_useSquadState_0 (copy), l_useNavigation_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useVoiceStatus_0 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_HttpService_0 (copy), v4 (copy), l_SquadViewFlags_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useSelector_0 (copy), l_useStore_0 (copy), l_SquadQuickStartExperimentation_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), l_SquadPromptType_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FFlagMakeCreateOrJoinSquadAThunks_0 (copy), l_createOrJoinSquad_0 (copy), l_NetworkingSquads_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_logInExpCoplayTelemetry_0 (copy), l_SquadCoplayJoin_0 (copy), l_FFlagEnableSquadCoplayDependencyArray_0 (copy), l_useEffectOnce_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), v10 (copy), l_Cryo_0 (copy), v19 (copy), v58 (copy), v57 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_usePrevious_0 (copy), l_UserBlockingNetworking_0 (copy), l_NetworkingPresence_0 (copy), v8 (copy), l_FFlagEnableSquadRegroupServerCapacityCheck_0 (copy), l_Players_0 (copy), l_SquadRegroupExperimentation_0 (copy), l_PresenceType_0 (copy), l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 (copy), v52 (copy), v16 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Foundation_0 (copy), v13 (copy), l_EventNames_0 (copy), v18 (copy), v63 (copy), v14 (copy), v12 (copy), l_StateLayerAffordance_0 (copy), v15 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v17 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_Roact_0 (copy), l_SquadLobbySessionProvider_0 (copy)
    local v72 = l_useTokens_0();
    local v73 = l_useDispatch_0();
    local v74 = tonumber(l_useLocalUserId_0()) or 0;
    local v75 = l_useStyle_0();
    local v76 = l_useSquadState_0();
    local v77 = l_useNavigation_0();
    local l_isWideMode_0 = v71.isWideMode;
    local v79 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v80, v81 = l_React_0.useState(0);
    local v82 = l_useVoiceStatus_0();
    if l_FFlagEnableSquadTopBannerWideMode_0 then
        local v83 = l_React_0.useRef(l_HttpService_0:GenerateGUID());
        local l_v83_0 = v83 --[[ copy: 12 -> 62 ]];
        l_React_0.useEffect(function() --[[ Line: 115 ]]
            -- upvalues: l_isWideMode_0 (copy), l_v83_0 (copy), v79 (copy), v77 (copy), v4 (ref)
            if not l_isWideMode_0 then
                local l_current_0 = l_v83_0.current;
                v79.disableSquadTopBanner(l_current_0, true);
                local v87 = v77 and v77.addListener(v4.Events.WillBlur, function(v86) --[[ Line: 120 ]]
                    -- upvalues: v79 (ref), l_current_0 (copy)
                    if v86.state.routeName ~= "SquadInviteFriends" and v86.state.routeName ~= "SquadLobby" then
                        v79.disableSquadTopBanner(l_current_0, false);
                        return;
                    else
                        v79.disableSquadTopBanner(l_current_0, true);
                        return;
                    end;
                end);
                return function() --[[ Line: 131 ]]
                    -- upvalues: v87 (ref), v79 (ref), l_current_0 (copy)
                    if v87 then
                        v87.remove();
                        v87 = nil;
                    end;
                    v79.disableSquadTopBanner(l_current_0, false);
                end;
            else
                return function() --[[ Line: 141 ]]

                end;
            end;
        end, {
            v79.disableSquadTopBanner, 
            v77, 
            l_isWideMode_0
        });
        l_React_0.useEffect(function() --[[ Line: 144 ]]
            -- upvalues: v79 (copy), l_SquadViewFlags_0 (ref)
            v79.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            return function() --[[ Line: 146 ]]
                -- upvalues: v79 (ref), l_SquadViewFlags_0 (ref)
                v79.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v79.updateSquadViewFlags
        });
    else
        l_React_0.useEffect(function() --[[ Line: 154 ]]
            -- upvalues: v79 (copy), l_SquadViewFlags_0 (ref), v77 (copy), v4 (ref)
            v79.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            local v89 = v77 and v77.addListener(v4.Events.WillBlur, function(v88) --[[ Line: 157 ]]
                -- upvalues: v79 (ref), l_SquadViewFlags_0 (ref)
                if v88.state.routeName ~= "SquadInviteFriends" and v88.state.routeName ~= "SquadLobby" then
                    v79.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
                    return;
                else
                    v79.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
                    return;
                end;
            end);
            return function() --[[ Line: 164 ]]
                -- upvalues: v89 (ref), v79 (ref), l_SquadViewFlags_0 (ref)
                if v89 then
                    v89.remove();
                    v89 = nil;
                end;
                v79.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v79.updateSquadViewFlags, 
            v77
        });
    end;
    local v90, v91 = l_React_0.useState(false);
    local v92, v93 = l_React_0.useState(Vector2.zero);
    local v95 = l_React_0.useCallback(function(v94) --[[ Line: 176 ]]
        -- upvalues: v93 (copy)
        v93(v94.AbsoluteSize);
    end, {
        v93
    });
    local v96 = l_useCurrentSquadSelector_0();
    local v97 = if v96 then v96.squadId else "";
    local v98 = v96 and v96.members;
    local v100 = l_React_0.useCallback(function(v99) --[[ Line: 184 ]]
        if v99.Squad and v99.Squad.Squad and v99.Squad.Squad.currentSquad then
            return v99.Squad.Squad.currentSquad.parentChannelId or "";
        else
            return "";
        end;
    end, {});
    local v101 = l_useSelector_0(v100);
    local v102 = l_useStore_0();
    local v103 = v77.getParam("conversationId") or "";
    local v104 = v79.useGetConversationFromId(v103);
    local v105 = v104 and v104.participants;
    local v106 = v96 and v96.invitees;
    local v107 = nil;
    local v108 = nil;
    local v109 = nil;
    v107 = v77.getParam("extraParams") or {};
    v108 = v107.squadId;
    if l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and l_FFlagEnablePartyQuickStartButton_0 then
        v109 = v107.squadCreateOrJoinAttemptId;
    end;
    local v110 = l_React_0.useCallback(function() --[[ Line: 208 ]]
        -- upvalues: v79 (copy), v102 (copy), l_SquadPromptType_0 (ref), v71 (copy)
        v79.setSquadPrompt(v102, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error, 
            onConfirm = function() --[[ Line: 212 ]] --[[ Name: onConfirm ]]
                -- upvalues: v71 (ref)
                v71.navigateAwayFromSquad();
            end
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71.navigateAwayFromSquad, 
        v102, 
        v79.setSquadPrompt
    } else l_dependencyArray_0(v71.navigateAwayFromSquad, v102, v79.setSquadPrompt));
    local v117 = l_React_0.useCallback(function(v111) --[[ Line: 223 ]]
        -- upvalues: l_FFlagMakeCreateOrJoinSquadAThunks_0 (ref), v73 (copy), l_createOrJoinSquad_0 (ref), v79 (copy), v109 (ref), v71 (copy), l_NetworkingSquads_0 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_logInExpCoplayTelemetry_0 (ref), l_SquadCoplayJoin_0 (ref), v110 (copy)
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then
            v73(l_createOrJoinSquad_0(v111, v79.setSquadPrompt, v79.fireSquadAnalytics, v79.squadLocation, v109, v71.navigateAwayFromSquad));
            return;
        else
            local v112 = v73(l_NetworkingSquads_0.CreateOrJoinSquad.API({
                parentChannelId = v111, 
                leaveExisting = true, 
                squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v79.squadLocation else nil, 
                partyAttemptId = v109
            }));
            if l_FFlagEnableSquadCoplayAnalytic_0 then
                v112 = v112:andThen(function(v113) --[[ Line: 246 ]]
                    -- upvalues: l_logInExpCoplayTelemetry_0 (ref), v79 (ref), l_SquadCoplayJoin_0 (ref)
                    local l_groupUpId_0 = v113.responseBody.groupUp.groupUpId;
                    local l_members_0 = v113.responseBody.groupUp.members;
                    if l_groupUpId_0 and l_members_0 then
                        l_logInExpCoplayTelemetry_0(l_groupUpId_0, l_members_0, v79.squadLocation, l_SquadCoplayJoin_0.PartyJoin, v79.fireSquadAnalytics);
                    end;
                end);
            end;
            v112:catch(function(_) --[[ Line: 262 ]]
                -- upvalues: v110 (ref)
                v110();
            end);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v73, 
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then l_createOrJoinSquad_0 else nil, 
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v71.navigateAwayFromSquad else nil, 
        if not l_FFlagMakeCreateOrJoinSquadAThunks_0 then v110 else nil, 
        if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v79.setSquadPrompt else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v79.squadLocation else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v79.fireSquadAnalytics else nil, 
        v109
    } else l_dependencyArray_0(v73, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then l_createOrJoinSquad_0 else nil, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v71.navigateAwayFromSquad else nil, if not l_FFlagMakeCreateOrJoinSquadAThunks_0 then v110 else nil, if l_FFlagMakeCreateOrJoinSquadAThunks_0 then v79.setSquadPrompt else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v79.squadLocation else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v79.fireSquadAnalytics else nil, v109));
    local v118 = v108 and v108 ~= v97;
    l_React_0.useEffect(function() --[[ Line: 294 ]]
        -- upvalues: v118 (copy), v79 (copy), v102 (copy), l_SquadPromptType_0 (ref), v117 (copy), v103 (copy), v71 (copy), v77 (copy)
        if v118 then
            v79.setSquadPrompt(v102, {
                promptType = l_SquadPromptType_0.JoinAnotherSquad, 
                onConfirm = function() --[[ Line: 298 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v117 (ref), v103 (ref)
                    v117(v103);
                end, 
                onCancel = function() --[[ Line: 301 ]] --[[ Name: onCancel ]]
                    -- upvalues: v71 (ref)
                    v71.navigateAwayFromSquad();
                end
            });
            v77.setParams({
                squadId = nil
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v108, 
        v79.setSquadPrompt, 
        v117, 
        v103, 
        v71.navigateAwayFromSquad, 
        v118
    } else l_dependencyArray_0(v108, v79.setSquadPrompt, v117, v103, v71.navigateAwayFromSquad, v118));
    l_useEffectOnce_0(function() --[[ Line: 332 ]]
        -- upvalues: v118 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v79 (copy), v104 (copy), v71 (copy), v97 (copy), v10 (ref), v103 (copy), v73 (copy), v117 (copy), v110 (copy)
        if v118 then
            return;
        elseif l_FFlagAppChatShowOSAOnPageEntry_0 and v79.shouldShowOSAForConversation and v79.shouldShowOSAForConversation(v104) then
            v71.navigateAwayFromSquad();
            return;
        else
            if v97 == "" then
                if v104 and v104.source == "friends" then
                    v10:debug("Channel does not exist for: {}. Creating a friend conversation.", v103);
                    v73(v79.createFriendConversation(v103)):andThen(function(v119) --[[ Line: 356 ]]
                        -- upvalues: v117 (ref)
                        if v119 and v119.id then
                            v117(v119.id);
                        end;
                    end):catch(function(v120) --[[ Line: 361 ]]
                        -- upvalues: v10 (ref), v110 (ref)
                        v10:debug("Error while trying to create a friend conversation: {}", v120);
                        v110();
                    end);
                    return;
                else
                    v117(v103);
                end;
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v73, 
        v79.createFriendConversation, 
        v103, 
        v104, 
        v117, 
        v110
    } else l_dependencyArray_0(v73, v79.createFriendConversation, v103, v104, v117, v110));
    local v121, v122 = l_React_0.useState({});
    local v126 = l_React_0.useMemo(function() --[[ Line: 392 ]]
        -- upvalues: v98 (copy)
        local v123 = {};
        if v98 then
            for _, v125 in ipairs(v98) do
                v123[tostring(v125.userId)] = true;
            end;
        end;
        return v123;
    end, {
        v98
    });
    local v139 = l_React_0.useCallback(function(v127, v128, v129) --[[ Line: 413 ]]
        -- upvalues: l_Cryo_0 (ref), v74 (copy), v19 (ref), v58 (ref), v57 (ref)
        local v130 = {};
        local v131 = 0;
        if v128 and #l_Cryo_0.Dictionary.keys(v128) == 0 then
            table.insert(v130, {
                userId = v74, 
                partyStatus = v19.Connecting
            });
        elseif v127 then
            local v132 = os.time();
            for _, v134 in ipairs(v127) do
                local l_Inactive_0 = v19.Inactive;
                if v128[v134] then
                    l_Inactive_0 = v19.Active;
                else
                    local v137 = v129 and l_Cryo_0.List.findWhere(v129, function(v136) --[[ Line: 438 ]]
                        -- upvalues: v134 (copy)
                        return v134 == tostring(v136.userId);
                    end);
                    if v137 then
                        local v138 = math.floor(v129[v137].invitedAtTimestampMs / 1000) or 0;
                        if v132 >= v138 then
                            if v132 - v138 < v58 then
                                l_Inactive_0 = v19.Invited;
                                v131 = v131 + 1;
                            elseif v132 - v138 < v57 + v58 then
                                l_Inactive_0 = v19.NoResponse;
                                v131 = v131 + 1;
                            end;
                        else
                            continue;
                        end;
                    end;
                end;
                table.insert(v130, {
                    userId = tonumber(v134), 
                    partyStatus = l_Inactive_0
                });
            end;
        end;
        return {
            users = v130, 
            numberOfUpdatesPending = v131
        };
    end, {});
    l_React_0.useEffect(function() --[[ Line: 482 ]]
        -- upvalues: v139 (copy), v105 (copy), v126 (copy), v106 (copy), v122 (copy), l_setInterval_0 (ref), l_clearInterval_0 (ref)
        local v140 = v139(v105, v126, v106);
        v122(v140.users);
        local v141 = nil;
        v141 = l_setInterval_0(function() --[[ Line: 488 ]]
            -- upvalues: v139 (ref), v105 (ref), v126 (ref), v106 (ref), v122 (ref), l_clearInterval_0 (ref), v141 (ref)
            local v142 = v139(v105, v126, v106);
            v122(v142.users);
            if v142.numberOfUpdatesPending == 0 then
                l_clearInterval_0(v141);
            end;
        end, 1000);
        return function() --[[ Line: 497 ]]
            -- upvalues: l_clearInterval_0 (ref), v141 (ref)
            l_clearInterval_0(v141);
        end;
    end, {
        v126, 
        v106, 
        v105, 
        v139
    });
    local v143 = l_usePrevious_0(v97) or "";
    l_React_0.useEffect(function() --[[ Line: 504 ]]
        -- upvalues: v143 (copy), v97 (copy), v71 (copy), v103 (copy), v101 (copy), v4 (ref), l_isWideMode_0 (copy), v77 (copy)
        if v143 ~= "" and v97 == "" then
            v71.navigateAwayFromSquad();
            return;
        else
            if v97 ~= "" and v103 ~= "" and v101 ~= "" and v101 ~= v103 then
                local v144 = {
                    v4.Actions.navigate({
                        routeName = "ChatConversation", 
                        params = {
                            conversationId = v101
                        }
                    }), 
                    v4.Actions.navigate({
                        routeName = "SquadLobby", 
                        params = {
                            conversationId = v101
                        }
                    })
                };
                if l_isWideMode_0 then
                    v77.navigate("ChatLanding", {
                        conversationId = v101
                    }, v4.StackActions.reset({
                        index = 2, 
                        actions = v144
                    }));
                    return;
                else
                    table.insert(v144, 1, v4.Actions.navigate({
                        routeName = "ChatLanding"
                    }));
                    v77.navigate("ChatLandingStack", {
                        conversationId = v101
                    }, v4.StackActions.reset({
                        index = 3, 
                        actions = v144
                    }));
                end;
            end;
            return;
        end;
    end, {
        v77, 
        v101, 
        v103, 
        v97, 
        v71.navigateAwayFromSquad
    });
    local v145 = l_usePrevious_0(v98);
    l_React_0.useEffect(function() --[[ Line: 569 ]]
        -- upvalues: v98 (copy), v145 (copy), v74 (copy), v73 (copy), l_UserBlockingNetworking_0 (ref), l_NetworkingPresence_0 (ref)
        local v146 = {};
        if v98 then
            for _, v148 in pairs(v98) do
                local v149 = false;
                if v145 then
                    for _, v151 in pairs(v145) do
                        if v151.userId == v148.userId then
                            v149 = true;
                            break;
                        end;
                    end;
                end;
                if not v149 then
                    table.insert(v146, v148.userId);
                    if v74 ~= v148.userId then
                        v73(l_UserBlockingNetworking_0.IsBlockedById.API({
                            userId = v148.userId, 
                            currentUserId = v74
                        }));
                    end;
                end;
            end;
        end;
        v73(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v146));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v98, 
        v74, 
        v145
    } else l_dependencyArray_0(v98, v74, v145));
    local v152 = l_React_0.useCallback(function() --[[ Line: 604 ]]
        -- upvalues: v91 (copy), v90 (copy)
        v91(not v90);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v90, 
        v91
    } else l_dependencyArray_0(v90, v91));
    local v153 = v8.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20;
    local v154 = v8.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20;
    local v155, v156 = l_React_0.useState(nil);
    local v157, v158 = l_React_0.useState(false);
    local v160 = l_React_0.useCallback(function(v159) --[[ Line: 621 ]]
        -- upvalues: v81 (copy), v72 (copy)
        if v159.Y > 0 then
            v81(v159.Y + v72.Gap.Medium);
            return;
        else
            v81(0);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81, 
        v72
    } else l_dependencyArray_0(v81, v72));
    local v169 = l_React_0.useCallback(function(v161) --[[ Line: 634 ]]
        -- upvalues: v98 (copy)
        local v162 = v161.Squad and v161.Squad.Presence and v161.Squad.Presence.byUserId or {};
        local v163 = {};
        local l_ipairs_0 = ipairs;
        local v165 = v98 or {};
        for _, v167 in l_ipairs_0(v165) do
            local v168 = tostring(v167.userId);
            v163[v168] = v162[v168];
        end;
        return v163;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v98
    } else l_dependencyArray_0(v98));
    local v170 = l_useSelector_0(v169);
    local v171 = not l_FFlagEnableSquadRegroupServerCapacityCheck_0 or l_Players_0.MaxPlayers > 1;
    local v175 = l_React_0.useMemo(function() --[[ Line: 653 ]]
        -- upvalues: l_SquadRegroupExperimentation_0 (ref), v71 (copy), v171 (copy), v96 (copy), v170 (copy), v74 (copy), l_PresenceType_0 (ref)
        if not l_SquadRegroupExperimentation_0.getSquadRegroupEnabled() or not v71.isInExperience or not v171 or not v96 or not v96.members or #v96.members <= 1 or not v96.selfPermissions or not v96.selfPermissions.canSeeRegroupJoinButton then
            return false;
        else
            local v172 = v170[tostring(v74)];
            if v172 == nil then
                return false;
            else
                for v173, v174 in pairs(v170) do
                    if v174 ~= nil and v173 ~= tostring(v74) and (v174.userPresenceType == l_PresenceType_0.Online or v174.userPresenceType == l_PresenceType_0.InGame and v172.gameId ~= nil and v174.gameId ~= nil and v172.gameId ~= v174.gameId) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v170, 
        v74, 
        v71.isInExperience, 
        v96, 
        v171
    } else l_dependencyArray_0(v170, v74, v71.isInExperience, v96, v171));
    local v176 = v72.Size.Size_1000 + v72.Padding.Medium * 2;
    local v177 = l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 and v175;
    local v178 = if not v177 and v175 then v72.Gap.XXLarge + v176 else 0;
    local v179 = l_React_0.useMemo(function() --[[ Line: 718 ]]
        -- upvalues: v52 (ref), l_React_0 (ref), v16 (ref), v160 (copy)
        if v52 then
            return (l_React_0.createElement(v16, {
                onAbsoluteSizeChanged = v160
            }));
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v160
    } else l_dependencyArray_0(v160));
    local v180 = l_React_0.useCallback(function() --[[ Line: 731 ]]
        -- upvalues: v71 (copy), v101 (copy)
        v71.navigateToSquadInviteFriends(v101);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v101, 
        v71.navigateToSquadInviteFriends
    } else l_dependencyArray_0(v101, v71.navigateToSquadInviteFriends));
    local v183 = l_React_0.useMemo(function() --[[ Line: 740 ]]
        -- upvalues: l_React_0 (ref), v80 (copy), v178 (copy), v75 (copy), l_FFlagEnableAppChatFocusableFixes_0 (ref), v95 (copy), v177 (copy), l_Foundation_0 (ref), v13 (ref), v92 (copy), v153 (copy), v72 (copy), v176 (copy), v121 (copy), v71 (copy), v79 (copy), l_EventNames_0 (ref), v101 (copy), v18 (ref), v63 (ref), v82 (copy), v156 (copy), v158 (copy), v180 (copy), v14 (ref), v74 (copy)
        return l_React_0.createElement("ScrollingFrame", {
            Position = UDim2.fromOffset(0, v80), 
            Size = UDim2.new(1, 0, 1, -(v80 + v178)), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.new(), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarImageColor3 = v75.Theme.UIEmphasis.Color, 
            ScrollBarImageTransparency = v75.Theme.UIEmphasis.Transparency, 
            ScrollBarThickness = 4, 
            Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil, 
            ZIndex = 0, 
            [l_React_0.Change.AbsoluteSize] = v95
        }, {
            FrameContents = if v177 then l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-y size-full-0 bg-surface-0 col align-x-center align-y-top"
            }, {
                UserGridContainer = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "auto-y size-full-0 bg-surface-0", 
                    LayoutOrder = 1
                }, {
                    SquadLobbyUserGrid = l_React_0.createElement(v13, {
                        containerSize = v92 - Vector2.new(0, v153 + v72.Gap.Medium + v176), 
                        paddingBottom = UDim.new(0, 0), 
                        users = v121, 
                        isInExperience = v71.isInExperience, 
                        onUserCardActivated = function(v181) --[[ Line: 770 ]] --[[ Name: onUserCardActivated ]]
                            -- upvalues: v79 (ref), l_EventNames_0 (ref), v101 (ref), v18 (ref), v63 (ref), v82 (ref), v156 (ref), v158 (ref)
                            v79.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                                parentChannelId = v101, 
                                actionType = v18.UserCardClicked, 
                                voiceStatus = if v63 then v82 else nil
                            });
                            v156(v181);
                            v158(true);
                        end, 
                        navigateToHomePage = v71.navigateToHomePage, 
                        navigateToSquadInviteFriends = v180
                    })
                }), 
                RegroupRowSpacer = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v72.Gap.Medium), 
                    LayoutOrder = 2
                }), 
                SquadLobbyRegroupRow = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v176), 
                    LayoutOrder = 3
                }, {
                    Row = l_React_0.createElement(v14, {
                        localUserId = v74
                    })
                }), 
                BottomPadding = l_React_0.createElement(l_Foundation_0.View, {
                    tag = "bg-surface-0", 
                    Size = UDim2.new(1, 0, 0, v153), 
                    LayoutOrder = 4
                })
            }) else nil, 
            SquadLobbyUserGrid = if v177 then nil else l_React_0.createElement(v13, {
                containerSize = v92 - Vector2.new(0, v153), 
                paddingBottom = UDim.new(0, v153), 
                users = v121, 
                isInExperience = v71.isInExperience, 
                onUserCardActivated = function(v182) --[[ Line: 812 ]] --[[ Name: onUserCardActivated ]]
                    -- upvalues: v79 (ref), l_EventNames_0 (ref), v101 (ref), v18 (ref), v63 (ref), v82 (ref), v156 (ref), v158 (ref)
                    v79.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                        parentChannelId = v101, 
                        actionType = v18.UserCardClicked, 
                        voiceStatus = if v63 then v82 else nil
                    });
                    v156(v182);
                    v158(true);
                end, 
                navigateToHomePage = v71.navigateToHomePage, 
                navigateToSquadInviteFriends = v180
            })
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v156, 
        v158, 
        v92, 
        v98, 
        v180, 
        v95, 
        v71.navigateToHomePage, 
        v153, 
        v80, 
        if v175 then v178 else nil, 
        v121, 
        v177, 
        if v177 then v176 else nil, 
        if v177 then v74 else nil, 
        if v63 then v82 else nil
    } else l_dependencyArray_0(v156, v158, v92, v98, v180, v95, v71.navigateToHomePage, v153, v80, if v175 then v178 else nil, v121, v177, if v177 then v176 else nil, if v177 then v74 else nil, if v63 then v82 else nil));
    local v184 = l_React_0.useMemo(function() --[[ Line: 864 ]]
        -- upvalues: l_React_0 (ref), v12 (ref), v76 (copy), v104 (copy), v71 (copy), v152 (copy), v97 (copy)
        return l_React_0.createElement(v12, {
            squadState = v76, 
            anchorPoint = Vector2.new(0.5, 1), 
            hasUnreadMessages = if v104 and v104.hasUnreadMessages then v104.hasUnreadMessages else false, 
            navigateAwayFromSquad = v71.navigateAwayFromSquad, 
            navigateToHomePage = v71.navigateToHomePage, 
            toggleVoiceChatMenu = v152, 
            position = UDim2.new(0.5, 0, 1, -20), 
            squadId = v97, 
            isInExperience = v71.isInExperience
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v97, 
        v71.isInExperience, 
        v71.navigateToHomePage, 
        v76, 
        v152, 
        v104 and v104.hasUnreadMessages
    } else l_dependencyArray_0(v97, v71.isInExperience, v71.navigateToHomePage, v76, v152, v104 and v104.hasUnreadMessages));
    local v185 = l_React_0.useMemo(function() --[[ Line: 899 ]]
        -- upvalues: v177 (copy), v175 (copy), l_React_0 (ref), l_Foundation_0 (ref), v8 (ref), v72 (copy), v176 (copy), v14 (ref), v74 (copy)
        if v177 or not v175 then
            return nil;
        else
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "anchor-bottom-center auto-none gui-object-defaults", 
                Position = UDim2.new(0.5, 0, 1, -(20 + v8.SQUAD_LOBBY_ACTION_BAR_HEIGHT + v72.Gap.XXLarge)), 
                Size = UDim2.new(1, 0, 0, v176)
            }, {
                Row = l_React_0.createElement(v14, {
                    localUserId = v74
                })
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v175, 
        v74, 
        v72, 
        v176
    } else l_dependencyArray_0(v175, v74, v72, v176));
    local v186 = l_React_0.useMemo(function() --[[ Line: 925 ]]
        -- upvalues: v90 (copy), l_React_0 (ref), l_Foundation_0 (ref), l_StateLayerAffordance_0 (ref), v91 (copy), v154 (copy), v72 (copy), v15 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v71 (copy)
        if v90 then
            return (l_React_0.createElement(l_Foundation_0.View, {
                Size = UDim2.new(1, 0, 1, 0), 
                stateLayer = {
                    affordance = l_StateLayerAffordance_0.None
                }, 
                onActivated = function() --[[ Line: 931 ]] --[[ Name: onActivated ]]
                    -- upvalues: v91 (ref)
                    v91(false);
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
                        Size = UDim2.new(1, 0, 0, v154), 
                        flexItem = {
                            FlexMode = Enum.UIFlexMode.Fill
                        }, 
                        LayoutOrder = 1, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 955 ]] --[[ Name: onActivated ]]
                            -- upvalues: v91 (ref)
                            v91(false);
                        end
                    }), 
                    Menu = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        flexItem = {
                            ItemLineAlignment = Enum.ItemLineAlignment.Center
                        }, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2, 
                        padding = Vector2.new(v72.Padding.XLarge, v72.Padding.Medium), 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 968 ]] --[[ Name: onActivated ]]

                        end, 
                        ZIndex = 3
                    }, {
                        SquadLobbyVoiceChatMenu = l_React_0.createElement(v15, {
                            openSquadVoiceChangers = if l_FFlagEnablePartyVoiceChangersInLua_0 then v71.openSquadVoiceChangers else nil
                        })
                    }), 
                    BottomPadding = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 0, v154), 
                        LayoutOrder = 3, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 981 ]] --[[ Name: onActivated ]]
                            -- upvalues: v91 (ref)
                            v91(false);
                        end
                    })
                })
            }));
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v154, 
        v90, 
        v91, 
        v72
    } else l_dependencyArray_0(v154, v90, v91, v72));
    local v187 = l_React_0.useMemo(function() --[[ Line: 1000 ]]
        -- upvalues: v157 (copy), v155 (copy), l_React_0 (ref), v17 (ref), v71 (copy), v156 (copy), v158 (copy), v101 (copy)
        if v157 and v155 then
            return (l_React_0.createElement(v17, {
                userId = v155, 
                isInExperience = v71.isInExperience, 
                onDismiss = function() --[[ Line: 1005 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v156 (ref), v158 (ref)
                    v156(nil);
                    v158(false);
                end, 
                openViewProfile = function() --[[ Line: 1009 ]] --[[ Name: openViewProfile ]]
                    -- upvalues: v71 (ref), v155 (ref)
                    v71.openViewProfile(v155);
                end, 
                openSquadVoiceAbuseReport = v71.openSquadVoiceAbuseReport, 
                parentChannelId = v101
            }));
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v101, 
        v71.isInExperience, 
        v157, 
        v158, 
        v71.openViewProfile, 
        v155, 
        v156
    } else l_dependencyArray_0(v101, v71.isInExperience, v157, v158, v71.openViewProfile, v155, v156));
    l_React_0.useEffect(function() --[[ Line: 1038 ]]
        -- upvalues: l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_SquadRegroupExperimentation_0 (ref)
        l_SquadCoordinationExperienceJoinExperimentation_0.logExposure();
        if l_FFlagEnableSquadRegroupExperimentation_0 then
            l_SquadRegroupExperimentation_0.logExposure();
        end;
    end, {});
    local v188 = l_Roact_0.createFragment({
        SquadLobbyBanners = v179, 
        SquadLobbyUsersScrollingFrame = v183, 
        SquadLobbyRegroupRow = v185, 
        SquadLobbyActionBar = v184, 
        SquadLobbyVoiceChatMenu = v186, 
        UserDropdownMenu = v187
    });
    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
        v188 = l_React_0.createElement(l_SquadLobbySessionProvider_0.Provider, nil, v188);
    end;
    return v188;
end;