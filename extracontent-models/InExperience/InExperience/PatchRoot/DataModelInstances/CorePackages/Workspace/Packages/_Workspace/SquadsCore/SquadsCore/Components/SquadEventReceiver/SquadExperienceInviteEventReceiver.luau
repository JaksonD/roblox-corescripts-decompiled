local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_FFlagEnableRecordSquadExperienceInviteChanges_0 = require(l_script_FirstAncestor_0.Flags).FFlagEnableRecordSquadExperienceInviteChanges;
local v6 = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v7 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v8 = require(l_script_FirstAncestor_0.Enums.SquadToastType);
local v9 = require(l_script_FirstAncestor_0.Logger);
local v10 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local v11 = require(l_script_FirstAncestor_0.RoduxSquads);
local v12 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local v13 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadParentChannelId);
local v14 = require(l_Parent_0.Cryo);
local v15 = require(l_Parent_0.ExperienceService);
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v17 = require(l_Parent_0.React);
local v18 = require(l_Parent_0.RealtimeDelivery);
local v19 = require(l_Parent_0.SharedFlags);
local v20 = require(l_Parent_0.SoundManager);
local l_SquadCoordinationExperienceJoinExperimentation_0 = require(l_Parent_0.SocialExperiments).SquadCoordinationExperienceJoinExperimentation;
local v22 = require(l_Parent_0.ToastNotification);
local v23 = require(l_Parent_0.ToastNotificationsProtocol);
local v24 = require(l_Parent_0.LuauPolyfill);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GameParams_0 = v15.GameParams;
local l_ExperienceService_0 = v15.ExperienceService;
local l_clearInterval_0 = v24.clearInterval;
local l_setInterval_0 = v24.setInterval;
local l_ExperienceInviteState_0 = v11.Enums.ExperienceInviteState;
local l_ExperienceInviteVoteType_0 = v11.Enums.ExperienceInviteVoteType;
local l_ExperienceInviteType_0 = v11.Enums.ExperienceInviteType;
local l_Sounds_0 = v20.Sounds;
local l_SoundManager_0 = v20.SoundManager;
local v38 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v39 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_LifecycleEvents_0 = v22.LifecycleEvents;
local l_NotificationTypeEnum_0 = v22.ToastNotificationTypeModule.NotificationTypeEnum;
local v42 = game:DefineFastInt("SquadExperienceInvitePollingIntervalSeconds", 4);
local v43 = game:DefineFastInt("SquadExperienceInviteTimeoutSeconds", 30);
local l_FFlagDebugSquadLogsEnabled_0 = v19.FFlagDebugSquadLogsEnabled;
local l_FFlagSplitSquadJoinOriginSources_0 = v19.FFlagSplitSquadJoinOriginSources;
local l_FFlagSquadLaunchExperienceMobileFix_0 = v19.FFlagSquadLaunchExperienceMobileFix;
local l_FFlagEnablePrivatePartyAcceptInvite_0 = v19.FFlagEnablePrivatePartyAcceptInvite;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v19.FFlagRemoveDependencyArrayAntipattern;
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("ToastNotifications", "userActionOnToastNotification");
local function _(v50) --[[ Line: 80 ]]
    -- upvalues: l_FFlagDebugSquadLogsEnabled_0 (copy), l_HttpService_0 (copy)
    if l_FFlagDebugSquadLogsEnabled_0 then
        return l_HttpService_0:JSONEncode(v50);
    elseif v50.StatusCode then
        return v50.StatusCode;
    else
        return -1;
    end;
end;
return function(v52) --[[ Line: 88 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v17 (copy), v38 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), v23 (copy), l_useSelector_0 (copy), v13 (copy), l_ExperienceInviteVoteType_0 (copy), v11 (copy), v10 (copy), v9 (copy), l_FFlagDebugSquadLogsEnabled_0 (copy), l_HttpService_0 (copy), v39 (copy), v14 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), v43 (copy), l_ExperienceInviteState_0 (copy), l_FFlagEnablePrivatePartyAcceptInvite_0 (copy), l_ExperienceInviteType_0 (copy), v6 (copy), l_FFlagSquadLaunchExperienceMobileFix_0 (copy), l_FFlagSplitSquadJoinOriginSources_0 (copy), l_GameParams_0 (copy), l_ExperienceService_0 (copy), v42 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_FFlagEnableRecordSquadExperienceInviteChanges_0 (copy), v12 (copy), v7 (copy), v8 (copy), v18 (copy), l_NotificationTypeEnum_0 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), l_LifecycleEvents_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy)
    local v53 = l_useDispatch_0();
    local v54 = tonumber(l_useLocalUserId_0()) or 0;
    local v55 = v17.useContext(v38);
    local v56, v57 = v17.useState("");
    v17.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), v57 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 98 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId);
        end);
        if l_status_0 then
            v57(l_result_0);
        end;
        local v62 = l_AppStorageService_0.ItemWasSet:Connect(function(v60, v61) --[[ Line: 105 ]]
            -- upvalues: l_LocalStorageKey_0 (ref), v57 (ref)
            if v60 == l_LocalStorageKey_0.BrowserTrackerId then
                v57(v61);
            end;
        end);
        return function() --[[ Line: 110 ]]
            -- upvalues: v62 (copy)
            v62:Disconnect();
        end;
    end, {
        v57
    });
    local l_default_0 = v23.ToastNotificationProtocol.default;
    local v64 = v17.useRef(false);
    local v66 = v17.useCallback(function(v65) --[[ Line: 118 ]]
        if v65.Squad and v65.Squad.Squad then
            return v65.Squad.Squad.currentExperienceInvite;
        else
            return nil;
        end;
    end, {});
    local v67 = l_useSelector_0(v66);
    local v68 = v13();
    local v69 = v67 and v67.model;
    local v70 = v69 and v69.experienceInviteId or "";
    local v71 = v69 and v69.state or "";
    local v72 = v69 and v69.experienceDetail.gameInstanceId or "";
    local v73 = v69 and v69.experienceDetail.placeId or 0;
    local v74 = v69 and v69.inviterId or 0;
    local v78, v79 = v17.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v67 (copy), l_ExperienceInviteVoteType_0 (ref), v54 (copy), v56 (copy)
        if not v67 or not v67.model then
            if v67 and v67.notification.isInviter then
                return l_ExperienceInviteVoteType_0.Accept, false;
            else
                return l_ExperienceInviteVoteType_0.Invalid, false;
            end;
        else
            for _, v76 in ipairs(v67.model.votes) do
                if v76.userId == v54 then
                    local v77 = false;
                    if v76.voteIdentifier and v76.voteIdentifier ~= "" then
                        v77 = v76.voteIdentifier ~= v56;
                    end;
                    return v76.voteType, v77;
                end;
            end;
            return l_ExperienceInviteVoteType_0.NoVote, false;
        end;
    end, {
        v67, 
        v54, 
        v56
    });
    local v82 = v17.useCallback(function(v80, v81) --[[ Line: 165 ]]
        -- upvalues: l_default_0 (copy), v53 (copy), v11 (ref), v64 (copy)
        if v81 then
            l_default_0:dismissNotification(v80);
        end;
        v53(v11.Actions.CurrentExperienceInviteDismissed(v80));
        v64.current = false;
    end, {
        v53
    });
    local v86 = v17.useCallback(function(v83, v84) --[[ Line: 176 ]]
        -- upvalues: v53 (copy), v10 (ref), v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), l_HttpService_0 (ref)
        return v53(v10.GetExperienceInvite.API({
            experienceInviteId = v83, 
            membershipEntityId = v84
        })):catch(function(v85) --[[ Line: 180 ]]
            -- upvalues: v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), l_HttpService_0 (ref), v83 (copy), v84 (copy)
            v9:warning("Error getting experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}", if l_FFlagDebugSquadLogsEnabled_0 then l_HttpService_0:JSONEncode(v85) else if v85.StatusCode then v85.StatusCode else -1, v83, v84);
        end);
    end, {
        v53
    });
    local v96 = v17.useCallback(function(v87, v88, v89) --[[ Line: 190 ]]
        -- upvalues: v68 (copy), v53 (copy), v10 (ref), v56 (copy), v55 (copy), v39 (ref), v14 (ref), l_HttpService_0 (ref), v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref)
        local v90 = {
            parentChannelId = v68, 
            experienceInviteId = v87, 
            voteType = v88
        };
        return v53(v10.VoteForExperienceInvite.API({
            experienceInviteId = v87, 
            membershipEntityId = v89, 
            voteIdentifier = v56, 
            voteType = v88
        })):andThen(function() --[[ Line: 203 ]]
            -- upvalues: v55 (ref), v39 (ref), v14 (ref), v90 (copy)
            v55.fireSquadAnalytics(v39.SquadVoteApiCall, v14.Dictionary.union(v90, {
                isSuccess = true
            }));
        end):catch(function(v91) --[[ Line: 211 ]]
            -- upvalues: l_HttpService_0 (ref), v55 (ref), v39 (ref), v14 (ref), v90 (copy), v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), v87 (copy), v89 (copy), v88 (copy)
            local l_Body_0 = v91.Body;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 213 ]]
                -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                return l_HttpService_0:JSONDecode(l_Body_0);
            end);
            local v95 = if l_status_1 then l_result_1.errorType else nil;
            v55.fireSquadAnalytics(v39.SquadVoteApiCall, v14.Dictionary.union(v90, {
                isSuccess = false, 
                errorMessage = v95, 
                errorType = if v91.StatusCode then tostring(v91.StatusCode) else nil
            }));
            v9:warning("Error voting for experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}, VoteType: {}", if l_FFlagDebugSquadLogsEnabled_0 then l_HttpService_0:JSONEncode(v91) else if v91.StatusCode then v91.StatusCode else -1, v87, v89, v88);
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v53, 
        v56
    } else l_dependencyArray_0(v53, v56));
    local v98 = v17.useCallback(function(v97) --[[ Line: 243 ]]
        -- upvalues: v55 (copy), v39 (ref), v70 (copy), v72 (copy), v73 (copy), v74 (copy), v71 (copy), v68 (copy)
        v55.fireSquadAnalytics(v39.SquadExperienceInviteStateChange, {
            experienceInviteId = v70, 
            invitationGameInstanceId = v72, 
            invitationPlaceId = v73, 
            inviterId = v74, 
            inviteState = v71, 
            parentChannelId = v68, 
            joinAttemptId = v97
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v72, 
        v70, 
        v74, 
        v73, 
        v71, 
        v68, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v55.fireSquadAnalytics else nil
    } else l_dependencyArray_0(v72, v70, v74, v73, v71, v68, if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v55.fireSquadAnalytics else nil));
    v17.useEffect(function() --[[ Line: 282 ]]
        -- upvalues: v67 (copy), v43 (ref), v82 (copy)
        local v99 = nil;
        if v67 then
            v99 = task.delay(v43, function() --[[ Line: 285 ]]
                -- upvalues: v82 (ref), v67 (ref)
                v82(v67.notification.notificationId, true);
            end);
        end;
        return function() --[[ Line: 289 ]]
            -- upvalues: v99 (ref)
            if v99 then
                task.cancel(v99);
            end;
        end;
    end, {
        v82, 
        v67
    });
    v17.useEffect(function() --[[ Line: 298 ]]
        -- upvalues: v67 (copy), v78 (copy), l_ExperienceInviteVoteType_0 (ref), v64 (copy), l_ExperienceInviteState_0 (ref), l_FFlagEnablePrivatePartyAcceptInvite_0 (ref), l_ExperienceInviteType_0 (ref), v9 (ref), v82 (copy), v55 (copy), v6 (ref), l_FFlagSquadLaunchExperienceMobileFix_0 (ref), l_FFlagSplitSquadJoinOriginSources_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_HttpService_0 (ref), v98 (copy), l_GameParams_0 (ref), l_ExperienceService_0 (ref)
        if not v67 or v78 ~= l_ExperienceInviteVoteType_0.Accept or v64.current then
            return;
        else
            local l_model_0 = v67.model;
            local l_notification_0 = v67.notification;
            if l_model_0 and l_model_0.state == l_ExperienceInviteState_0.ReservationSuccessful then
                local l_gameInstanceId_0 = l_model_0.experienceDetail.gameInstanceId;
                local l_placeId_0 = l_model_0.experienceDetail.placeId;
                if not l_FFlagEnablePrivatePartyAcceptInvite_0 or v67.model.inviteType ~= l_ExperienceInviteType_0.PlayWithPartyInPrivatePartyServer then
                    assert(l_gameInstanceId_0, "Game instance id should exist.");
                end;
                v64.current = true;
                v9:debug("Launching experience. GameInstanceId: {}, PlaceId: {}", l_gameInstanceId_0, l_placeId_0);
                local v107 = task.delay(1, function() --[[ Line: 325 ]]
                    -- upvalues: v82 (ref), l_notification_0 (copy), v55 (ref), v6 (ref), l_FFlagSquadLaunchExperienceMobileFix_0 (ref), l_FFlagSplitSquadJoinOriginSources_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_HttpService_0 (ref), v98 (ref), l_GameParams_0 (ref), l_placeId_0 (copy), l_gameInstanceId_0 (copy), l_FFlagEnablePrivatePartyAcceptInvite_0 (ref), v67 (ref), l_ExperienceInviteType_0 (ref), l_ExperienceService_0 (ref)
                    v82(l_notification_0.notificationId, true);
                    if v55.squadLocation == v6.InExperience and l_FFlagSquadLaunchExperienceMobileFix_0 then
                        game:Shutdown();
                    end;
                    local v104 = "SquadExperienceInvite";
                    if l_FFlagSplitSquadJoinOriginSources_0 then
                        if v55.squadLocation == v6.UniversalApp then
                            v104 = "SquadExperienceInviteFromUA";
                        elseif v55.squadLocation == v6.InExperience then
                            v104 = "SquadExperienceInviteFromInExp";
                        end;
                    end;
                    local v105 = nil;
                    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
                        v105 = l_HttpService_0:GenerateGUID(false);
                        v98(v105);
                    end;
                    local v106 = l_GameParams_0.fromPlaceInstance(l_placeId_0, l_gameInstanceId_0);
                    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
                        v106.joinAttemptId = v105;
                    end;
                    if l_FFlagEnablePrivatePartyAcceptInvite_0 and v67.model.inviteType == l_ExperienceInviteType_0.PlayWithPartyInPrivatePartyServer then
                        v106.isPrivateParty = true;
                    end;
                    l_ExperienceService_0:LaunchExperience(v106, v104, nil);
                end);
                return function() --[[ Line: 363 ]]
                    -- upvalues: v107 (copy)
                    task.cancel(v107);
                end;
            else
                return;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v55.squadLocation, 
        v67, 
        v82, 
        v78, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v98 else nil
    } else l_dependencyArray_0(v55.squadLocation, v67, v82, v78, if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v98 else nil));
    v17.useEffect(function() --[[ Line: 391 ]]
        -- upvalues: v42 (ref), v67 (copy), l_ExperienceInviteState_0 (ref), l_setInterval_0 (ref), v86 (copy), l_clearInterval_0 (ref)
        local l_v42_0 = v42;
        local v109 = nil;
        if v67 and (not v67.model or v67.model.state == l_ExperienceInviteState_0.Active or v67.model.state == l_ExperienceInviteState_0.Reserving) then
            v109 = l_setInterval_0(function() --[[ Line: 402 ]]
                -- upvalues: v86 (ref), v67 (ref)
                v86(v67.notification.experienceInviteId, v67.notification.membershipEntityId);
            end, l_v42_0 * 1000);
        end;
        return function() --[[ Line: 410 ]]
            -- upvalues: v109 (ref), l_clearInterval_0 (ref)
            if v109 then
                l_clearInterval_0(v109);
            end;
        end;
    end, {
        v67, 
        v86
    });
    v17.useEffect(function() --[[ Line: 419 ]]
        -- upvalues: v67 (copy), v52 (copy), v79 (copy), v82 (copy)
        if v67 and (v52.currentSquadId ~= v67.notification.membershipEntityId or v79) then
            v82(v67.notification.notificationId, true);
        end;
    end, {
        v67, 
        v82, 
        v52.currentSquadId, 
        v79
    });
    if l_FFlagEnableRecordSquadExperienceInviteChanges_0 then
        v17.useEffect(function() --[[ Line: 432 ]]
            -- upvalues: l_ExperienceInviteState_0 (ref), v71 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v98 (copy)
            if l_ExperienceInviteState_0[v71] then
                if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
                    if l_ExperienceInviteState_0[v71] ~= l_ExperienceInviteState_0.ReservationSuccessful then
                        v98();
                        return;
                    end;
                else
                    v98();
                end;
            end;
        end, {
            v71, 
            v98
        });
    end;
    v17.useEffect(function() --[[ Line: 451 ]]
        -- upvalues: v67 (copy), v9 (ref), v12 (ref), v54 (copy), l_ExperienceInviteState_0 (ref), l_default_0 (copy), v82 (copy), v78 (copy), l_ExperienceInviteVoteType_0 (ref), v55 (copy), v39 (ref), v68 (copy), v7 (ref), v8 (ref)
        if not v67 or not v67.model then
            return;
        else
            v9:debug("Current experience invite updated: {}", v12(v67.model));
            local l_notificationId_0 = v67.notification.notificationId;
            local l_state_0 = v67.model.state;
            if v67.model.inviterId == v54 then
                if l_state_0 == l_ExperienceInviteState_0.Active then
                    if v67.model.spotsTaken > 1 then
                        l_default_0:updateNotification(l_notificationId_0, v67.model.spotsTaken .. "SpotsFilled");
                        return;
                    end;
                elseif l_state_0 == l_ExperienceInviteState_0.Reserving or l_state_0 == l_ExperienceInviteState_0.ReservationSuccessful then
                    l_default_0:updateNotification(l_notificationId_0, "launching");
                    return;
                else
                    v82(l_notificationId_0, true);
                    if l_state_0 ~= l_ExperienceInviteState_0.Cancelled and l_state_0 ~= l_ExperienceInviteState_0.ReservationFailed then
                        v9:warning("Invitee unexpected squad experience invite state: {}", l_state_0);
                        return;
                    end;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Active then
                if v78 == l_ExperienceInviteVoteType_0.Invalid or v78 == l_ExperienceInviteVoteType_0.NoVote then
                    if v67.model.spotsTaken >= v67.model.totalSpots then
                        v55.fireSquadAnalytics(v39.SquadToastActions, {
                            parentChannelId = v68, 
                            experienceInviteId = v67.model.experienceInviteId, 
                            toastAction = v7.ExpInvSlotsFull, 
                            toastType = v8.ExperienceInvite
                        });
                        l_default_0:updateNotification(l_notificationId_0, "slotsFull");
                        return;
                    end;
                elseif v78 == l_ExperienceInviteVoteType_0.Accept then
                    l_default_0:updateNotification(l_notificationId_0, "waiting");
                    return;
                elseif v78 == l_ExperienceInviteVoteType_0.Decline or v78 == l_ExperienceInviteVoteType_0.Dismiss then
                    v82(l_notificationId_0, true);
                    return;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Reserving or l_state_0 == l_ExperienceInviteState_0.ReservationSuccessful then
                if v78 == l_ExperienceInviteVoteType_0.Invalid or v78 == l_ExperienceInviteVoteType_0.NoVote then
                    v55.fireSquadAnalytics(v39.SquadToastActions, {
                        parentChannelId = v68, 
                        experienceInviteId = v67.model.experienceInviteId, 
                        toastAction = v7.ExpInvExpired, 
                        toastType = v8.ExperienceInvite
                    });
                    l_default_0:updateNotification(l_notificationId_0, "expired");
                    return;
                elseif v78 == l_ExperienceInviteVoteType_0.Accept then
                    l_default_0:updateNotification(l_notificationId_0, "waiting");
                    return;
                elseif v78 == l_ExperienceInviteVoteType_0.Decline or v78 == l_ExperienceInviteVoteType_0.Dismiss then
                    v82(l_notificationId_0, true);
                    return;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Cancelled then
                l_default_0:updateNotification(l_notificationId_0, "cancelled");
                return;
            else
                v82(l_notificationId_0, true);
                if l_state_0 ~= l_ExperienceInviteState_0.ReservationFailed then
                    v9:warning("Inviter unexpected squad experience invite state: {}", l_state_0);
                end;
            end;
            return;
        end;
    end, {
        v67, 
        v68, 
        v82, 
        v54, 
        v55.fireSquadAnalytics, 
        v78
    });
    v18.useRealtimeNamespace("ExperienceInviteUpdate", function(v112) --[[ Line: 543 ]]
        -- upvalues: v9 (ref), v12 (ref), v53 (copy), v11 (ref)
        v9:debug("Experience invite RTN received. Detail: {}", v12(v112));
        v53(v11.Actions.CurrentExperienceInviteUpdated(v112));
    end, {
        v53
    });
    v17.useEffect(function() --[[ Line: 555 ]]
        -- upvalues: l_default_0 (copy), v67 (copy), v78 (copy), l_ExperienceInviteVoteType_0 (ref), v82 (copy), l_ExperienceInviteState_0 (ref), v55 (copy), v39 (ref), v68 (copy), v7 (ref), v8 (ref), v96 (copy)
        local v114 = l_default_0:listenToDismissNotification(function(v113) --[[ Line: 557 ]]
            -- upvalues: v67 (ref), v78 (ref), l_ExperienceInviteVoteType_0 (ref), v82 (ref), l_ExperienceInviteState_0 (ref), v55 (ref), v39 (ref), v68 (ref), v7 (ref), v8 (ref), v96 (ref)
            if v67 and v67.notification.notificationId == v113.notificationId then
                if v78 ~= l_ExperienceInviteVoteType_0.Accept then
                    v82(v113.notificationId, false);
                end;
                if (not v67.model or v67.model.state == l_ExperienceInviteState_0.Active) and (v78 == l_ExperienceInviteVoteType_0.Invalid or v78 == l_ExperienceInviteVoteType_0.NoVote) then
                    v55.fireSquadAnalytics(v39.SquadToastActions, {
                        parentChannelId = v68, 
                        experienceInviteId = v67.notification.experienceInviteId, 
                        toastAction = v7.ExpInvDismiss, 
                        toastType = v8.ExperienceInvite
                    });
                    v96(v67.notification.experienceInviteId, l_ExperienceInviteVoteType_0.Dismiss, v67.notification.membershipEntityId);
                end;
            end;
        end);
        return function() --[[ Line: 598 ]]
            -- upvalues: v114 (copy)
            if v114 then
                v114:Disconnect();
            end;
        end;
    end, {
        v67, 
        v68, 
        v82, 
        v53, 
        v55.fireSquadAnalytics, 
        v78, 
        v96
    });
    v17.useEffect(function() --[[ Line: 614 ]]
        -- upvalues: l_default_0 (copy), v54 (copy), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v53 (copy), v11 (ref)
        local v117 = l_default_0:listenToDisplayNotification(function(v115) --[[ Line: 616 ]]
            -- upvalues: v54 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v53 (ref), v11 (ref)
            if not v115 then
                return;
            elseif v54 <= 0 then
                return;
            else
                if v115.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation then
                    local v116 = l_HttpService_0:JSONDecode(v115.lifecycleData);
                    v53(v11.Actions.CurrentExperienceInviteReceived(v116.experienceInviteId, v116.membershipEntityId, v115.notificationId, v116.isInviter));
                end;
                return;
            end;
        end);
        return function() --[[ Line: 637 ]]
            -- upvalues: v117 (copy)
            if v117 then
                v117:Disconnect();
            end;
        end;
    end, {
        v54
    });
    v17.useEffect(function() --[[ Line: 646 ]]
        -- upvalues: l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), l_NotificationTypeEnum_0 (ref), v67 (copy), l_HttpService_0 (ref), v53 (copy), v11 (ref), l_default_0 (copy), l_ExperienceInviteState_0 (ref), v78 (copy), l_ExperienceInviteVoteType_0 (ref)
        local v120 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v118) --[[ Line: 649 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), v67 (ref), l_HttpService_0 (ref), v53 (ref), v11 (ref), l_default_0 (ref), l_ExperienceInviteState_0 (ref), v78 (ref), l_ExperienceInviteVoteType_0 (ref)
            if v118.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation and v118.userActionType == "timerElapsed" then
                if not v67 then
                    local v119 = l_HttpService_0:JSONDecode(v118.parameters);
                    v53(v11.Actions.CurrentExperienceInviteReceived(v119.experienceInviteId, v119.membershipEntityId, v118.notificationId, v119.isInviter));
                    v53(function() --[[ Line: 664 ]]
                        -- upvalues: l_default_0 (ref), v118 (copy)
                        l_default_0:updateNotification(v118.notificationId, "expired");
                    end);
                    return;
                else
                    assert(v67, "Experience invite must exist to perform actions.");
                    if (not v67.model or v67.model.state == l_ExperienceInviteState_0.Active) and (v78 == l_ExperienceInviteVoteType_0.Invalid or v78 == l_ExperienceInviteVoteType_0.NoVote) then
                        l_default_0:updateNotification(v118.notificationId, "expired");
                    end;
                end;
            end;
        end, false, true);
        return function() --[[ Line: 694 ]]
            -- upvalues: v120 (copy)
            if v120 then
                v120:Disconnect();
            end;
        end;
    end, {
        v67, 
        v78, 
        v96
    });
    v17.useEffect(function() --[[ Line: 702 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v68 (copy), v8 (ref), v67 (copy), v53 (copy), v11 (ref), v55 (copy), v39 (ref), v14 (ref), v7 (ref), v96 (copy), l_ExperienceInviteVoteType_0 (ref)
        local v124 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadExperienceInvitation, function(v121) --[[ Line: 706 ]]
            -- upvalues: l_HttpService_0 (ref), v68 (ref), v8 (ref), v67 (ref), v53 (ref), v11 (ref), v55 (ref), v39 (ref), v14 (ref), v7 (ref), v96 (ref), l_ExperienceInviteVoteType_0 (ref)
            if v121 and v121.userActionType == "click" and v121.visualItem and v121.visualItem.actionEventParams then
                local v122 = l_HttpService_0:JSONDecode(v121.visualItem.actionEventParams);
                local v123 = {
                    parentChannelId = v68, 
                    experienceInviteId = v122.experienceInviteId, 
                    toastType = v8.ExperienceInvite
                };
                if not v67 then
                    v53(v11.Actions.CurrentExperienceInviteReceived(v122.experienceInviteId, v122.membershipEntityId, v121.notificationData.id, v122.isInviter));
                end;
                if v121.visualItem.eventName == "GroupUpSquadExperience" then
                    v55.fireSquadAnalytics(v39.SquadToastActions, v14.Dictionary.union(v123, {
                        toastAction = v7.ExpInvAccept
                    }));
                    v96(v122.experienceInviteId, l_ExperienceInviteVoteType_0.Accept, v122.membershipEntityId);
                    return;
                elseif v121.visualItem.eventName == "DismissSquadExperienceInvited" then
                    v55.fireSquadAnalytics(v39.SquadToastActions, v14.Dictionary.union(v123, {
                        toastAction = v7.ExpInvDecline
                    }));
                    v96(v122.experienceInviteId, l_ExperienceInviteVoteType_0.Decline, v122.membershipEntityId);
                    return;
                elseif v121.visualItem.eventName == "CancelSquadExperienceSpotsFilled" then
                    v55.fireSquadAnalytics(v39.SquadToastActions, v14.Dictionary.union(v123, {
                        toastAction = v7.ExpInvCancel
                    }));
                    v96(v122.experienceInviteId, l_ExperienceInviteVoteType_0.Cancel, v122.membershipEntityId);
                end;
            end;
        end);
        return function() --[[ Line: 774 ]]
            -- upvalues: v124 (copy)
            v124();
        end;
    end, {
        v67, 
        v68, 
        v53, 
        v55.fireSquadAnalytics, 
        v96
    });
    v17.useEffect(function() --[[ Line: 787 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v55 (copy), v39 (ref)
        local v128 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadExperienceInvitation, function(v125) --[[ Line: 791 ]]
            -- upvalues: l_HttpService_0 (ref), v55 (ref), v39 (ref)
            local v126 = v125 and v125.state and v125.state.visualItems and v125.state.visualItems.button and v125.state.visualItems.button[1] and v125.state.visualItems.button[1].actionEventParams;
            if v126 then
                local l_experienceInviteId_0 = l_HttpService_0:JSONDecode(v126).experienceInviteId;
                v55.fireSquadAnalytics(v39.SquadExperienceInviteImpression, {
                    experienceInviteId = l_experienceInviteId_0, 
                    notificationId = v125.id, 
                    clientTimestamp = os.time()
                });
            end;
        end);
        return function() --[[ Line: 811 ]]
            -- upvalues: v128 (copy)
            v128();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v55.fireSquadAnalytics
    } else l_dependencyArray_0(v55.fireSquadAnalytics));
    v17.useEffect(function() --[[ Line: 821 ]]
        -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref)
        local function v130(v129) --[[ Line: 822 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref)
            if v129.currentState == "invited" then
                l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
            end;
        end;
        local v131 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadExperienceInvitation, v130);
        local v132 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Update, l_NotificationTypeEnum_0.SquadExperienceInvitation, v130);
        return function() --[[ Line: 840 ]]
            -- upvalues: v131 (copy), v132 (copy)
            v131();
            v132();
        end;
    end, {});
    return nil;
end;