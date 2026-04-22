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
local l_FFlagSquadLaunchExperienceMobileFix_0 = v19.FFlagSquadLaunchExperienceMobileFix;
local l_FFlagEnablePrivatePartyAcceptInvite_0 = v19.FFlagEnablePrivatePartyAcceptInvite;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v19.FFlagRemoveDependencyArrayAntipattern;
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("ToastNotifications", "userActionOnToastNotification");
local function _(v49) --[[ Line: 79 ]]
    -- upvalues: l_FFlagDebugSquadLogsEnabled_0 (copy), l_HttpService_0 (copy)
    if l_FFlagDebugSquadLogsEnabled_0 then
        return l_HttpService_0:JSONEncode(v49);
    elseif v49.StatusCode then
        return v49.StatusCode;
    else
        return -1;
    end;
end;
return function(v51) --[[ Line: 87 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v17 (copy), v38 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), v23 (copy), l_useSelector_0 (copy), v13 (copy), l_ExperienceInviteVoteType_0 (copy), v11 (copy), v10 (copy), v9 (copy), l_FFlagDebugSquadLogsEnabled_0 (copy), l_HttpService_0 (copy), v39 (copy), v14 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), v43 (copy), l_ExperienceInviteState_0 (copy), l_FFlagEnablePrivatePartyAcceptInvite_0 (copy), l_ExperienceInviteType_0 (copy), v6 (copy), l_FFlagSquadLaunchExperienceMobileFix_0 (copy), l_GameParams_0 (copy), l_ExperienceService_0 (copy), v42 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_FFlagEnableRecordSquadExperienceInviteChanges_0 (copy), v12 (copy), v7 (copy), v8 (copy), v18 (copy), l_NotificationTypeEnum_0 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), l_LifecycleEvents_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy)
    local v52 = l_useDispatch_0();
    local v53 = tonumber(l_useLocalUserId_0()) or 0;
    local v54 = v17.useContext(v38);
    local v55, v56 = v17.useState("");
    v17.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), v56 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 97 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId);
        end);
        if l_status_0 then
            v56(l_result_0);
        end;
        local v61 = l_AppStorageService_0.ItemWasSet:Connect(function(v59, v60) --[[ Line: 104 ]]
            -- upvalues: l_LocalStorageKey_0 (ref), v56 (ref)
            if v59 == l_LocalStorageKey_0.BrowserTrackerId then
                v56(v60);
            end;
        end);
        return function() --[[ Line: 109 ]]
            -- upvalues: v61 (copy)
            v61:Disconnect();
        end;
    end, {
        v56
    });
    local l_default_0 = v23.ToastNotificationProtocol.default;
    local v63 = v17.useRef(false);
    local v65 = v17.useCallback(function(v64) --[[ Line: 117 ]]
        if v64.Squad and v64.Squad.Squad then
            return v64.Squad.Squad.currentExperienceInvite;
        else
            return nil;
        end;
    end, {});
    local v66 = l_useSelector_0(v65);
    local v67 = v13();
    local v68 = v66 and v66.model;
    local v69 = v68 and v68.experienceInviteId or "";
    local v70 = v68 and v68.state or "";
    local v71 = v68 and v68.experienceDetail.gameInstanceId or "";
    local v72 = v68 and v68.experienceDetail.placeId or 0;
    local v73 = v68 and v68.inviterId or 0;
    local v77, v78 = v17.useMemo(function() --[[ Line: 137 ]]
        -- upvalues: v66 (copy), l_ExperienceInviteVoteType_0 (ref), v53 (copy), v55 (copy)
        if not v66 or not v66.model then
            if v66 and v66.notification.isInviter then
                return l_ExperienceInviteVoteType_0.Accept, false;
            else
                return l_ExperienceInviteVoteType_0.Invalid, false;
            end;
        else
            for _, v75 in ipairs(v66.model.votes) do
                if v75.userId == v53 then
                    local v76 = false;
                    if v75.voteIdentifier and v75.voteIdentifier ~= "" then
                        v76 = v75.voteIdentifier ~= v55;
                    end;
                    return v75.voteType, v76;
                end;
            end;
            return l_ExperienceInviteVoteType_0.NoVote, false;
        end;
    end, {
        v66, 
        v53, 
        v55
    });
    local v81 = v17.useCallback(function(v79, v80) --[[ Line: 164 ]]
        -- upvalues: l_default_0 (copy), v52 (copy), v11 (ref), v63 (copy)
        if v80 then
            l_default_0:dismissNotification(v79);
        end;
        v52(v11.Actions.CurrentExperienceInviteDismissed(v79));
        v63.current = false;
    end, {
        v52
    });
    local v85 = v17.useCallback(function(v82, v83) --[[ Line: 175 ]]
        -- upvalues: v52 (copy), v10 (ref), v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), l_HttpService_0 (ref)
        return v52(v10.GetExperienceInvite.API({
            experienceInviteId = v82, 
            membershipEntityId = v83
        })):catch(function(v84) --[[ Line: 179 ]]
            -- upvalues: v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), l_HttpService_0 (ref), v82 (copy), v83 (copy)
            v9:warning("Error getting experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}", if l_FFlagDebugSquadLogsEnabled_0 then l_HttpService_0:JSONEncode(v84) else if v84.StatusCode then v84.StatusCode else -1, v82, v83);
        end);
    end, {
        v52
    });
    local v95 = v17.useCallback(function(v86, v87, v88) --[[ Line: 189 ]]
        -- upvalues: v67 (copy), v52 (copy), v10 (ref), v55 (copy), v54 (copy), v39 (ref), v14 (ref), l_HttpService_0 (ref), v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref)
        local v89 = {
            parentChannelId = v67, 
            experienceInviteId = v86, 
            voteType = v87
        };
        return v52(v10.VoteForExperienceInvite.API({
            experienceInviteId = v86, 
            membershipEntityId = v88, 
            voteIdentifier = v55, 
            voteType = v87
        })):andThen(function() --[[ Line: 202 ]]
            -- upvalues: v54 (ref), v39 (ref), v14 (ref), v89 (copy)
            v54.fireSquadAnalytics(v39.SquadVoteApiCall, v14.Dictionary.union(v89, {
                isSuccess = true
            }));
        end):catch(function(v90) --[[ Line: 210 ]]
            -- upvalues: l_HttpService_0 (ref), v54 (ref), v39 (ref), v14 (ref), v89 (copy), v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), v86 (copy), v88 (copy), v87 (copy)
            local l_Body_0 = v90.Body;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 212 ]]
                -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                return l_HttpService_0:JSONDecode(l_Body_0);
            end);
            local v94 = if l_status_1 then l_result_1.errorType else nil;
            v54.fireSquadAnalytics(v39.SquadVoteApiCall, v14.Dictionary.union(v89, {
                isSuccess = false, 
                errorMessage = v94, 
                errorType = if v90.StatusCode then tostring(v90.StatusCode) else nil
            }));
            v9:warning("Error voting for experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}, VoteType: {}", if l_FFlagDebugSquadLogsEnabled_0 then l_HttpService_0:JSONEncode(v90) else if v90.StatusCode then v90.StatusCode else -1, v86, v88, v87);
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v52, 
        v55
    } else l_dependencyArray_0(v52, v55));
    local v97 = v17.useCallback(function(v96) --[[ Line: 242 ]]
        -- upvalues: v54 (copy), v39 (ref), v69 (copy), v71 (copy), v72 (copy), v73 (copy), v70 (copy), v67 (copy)
        v54.fireSquadAnalytics(v39.SquadExperienceInviteStateChange, {
            experienceInviteId = v69, 
            invitationGameInstanceId = v71, 
            invitationPlaceId = v72, 
            inviterId = v73, 
            inviteState = v70, 
            parentChannelId = v67, 
            joinAttemptId = v96
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71, 
        v69, 
        v73, 
        v72, 
        v70, 
        v67, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v54.fireSquadAnalytics else nil
    } else l_dependencyArray_0(v71, v69, v73, v72, v70, v67, if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v54.fireSquadAnalytics else nil));
    v17.useEffect(function() --[[ Line: 281 ]]
        -- upvalues: v66 (copy), v43 (ref), v81 (copy)
        local v98 = nil;
        if v66 then
            v98 = task.delay(v43, function() --[[ Line: 284 ]]
                -- upvalues: v81 (ref), v66 (ref)
                v81(v66.notification.notificationId, true);
            end);
        end;
        return function() --[[ Line: 288 ]]
            -- upvalues: v98 (ref)
            if v98 then
                task.cancel(v98);
            end;
        end;
    end, {
        v81, 
        v66
    });
    v17.useEffect(function() --[[ Line: 297 ]]
        -- upvalues: v66 (copy), v77 (copy), l_ExperienceInviteVoteType_0 (ref), v63 (copy), l_ExperienceInviteState_0 (ref), l_FFlagEnablePrivatePartyAcceptInvite_0 (ref), l_ExperienceInviteType_0 (ref), v9 (ref), v81 (copy), v54 (copy), v6 (ref), l_FFlagSquadLaunchExperienceMobileFix_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_HttpService_0 (ref), v97 (copy), l_GameParams_0 (ref), l_ExperienceService_0 (ref)
        if not v66 or v77 ~= l_ExperienceInviteVoteType_0.Accept or v63.current then
            return;
        else
            local l_model_0 = v66.model;
            local l_notification_0 = v66.notification;
            if l_model_0 and l_model_0.state == l_ExperienceInviteState_0.ReservationSuccessful then
                local l_gameInstanceId_0 = l_model_0.experienceDetail.gameInstanceId;
                local l_placeId_0 = l_model_0.experienceDetail.placeId;
                if not l_FFlagEnablePrivatePartyAcceptInvite_0 or v66.model.inviteType ~= l_ExperienceInviteType_0.PlayWithPartyInPrivatePartyServer then
                    assert(l_gameInstanceId_0, "Game instance id should exist.");
                end;
                v63.current = true;
                v9:debug("Launching experience. GameInstanceId: {}, PlaceId: {}", l_gameInstanceId_0, l_placeId_0);
                local v106 = task.delay(1, function() --[[ Line: 324 ]]
                    -- upvalues: v81 (ref), l_notification_0 (copy), v54 (ref), v6 (ref), l_FFlagSquadLaunchExperienceMobileFix_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_HttpService_0 (ref), v97 (ref), l_GameParams_0 (ref), l_placeId_0 (copy), l_gameInstanceId_0 (copy), l_FFlagEnablePrivatePartyAcceptInvite_0 (ref), v66 (ref), l_ExperienceInviteType_0 (ref), l_ExperienceService_0 (ref)
                    v81(l_notification_0.notificationId, true);
                    if v54.squadLocation == v6.InExperience and l_FFlagSquadLaunchExperienceMobileFix_0 then
                        game:Shutdown();
                    end;
                    local v103 = "SquadExperienceInvite";
                    if v54.squadLocation == v6.UniversalApp then
                        v103 = "SquadExperienceInviteFromUA";
                    elseif v54.squadLocation == v6.InExperience then
                        v103 = "SquadExperienceInviteFromInExp";
                    end;
                    local v104 = nil;
                    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
                        v104 = l_HttpService_0:GenerateGUID(false);
                        v97(v104);
                    end;
                    local v105 = l_GameParams_0.fromPlaceInstance(l_placeId_0, l_gameInstanceId_0);
                    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
                        v105.joinAttemptId = v104;
                    end;
                    if l_FFlagEnablePrivatePartyAcceptInvite_0 and v66.model.inviteType == l_ExperienceInviteType_0.PlayWithPartyInPrivatePartyServer then
                        v105.isPrivateParty = true;
                    end;
                    l_ExperienceService_0:LaunchExperience(v105, v103, nil);
                end);
                return function() --[[ Line: 359 ]]
                    -- upvalues: v106 (copy)
                    task.cancel(v106);
                end;
            else
                return;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v54.squadLocation, 
        v66, 
        v81, 
        v77, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v97 else nil
    } else l_dependencyArray_0(v54.squadLocation, v66, v81, v77, if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v97 else nil));
    v17.useEffect(function() --[[ Line: 387 ]]
        -- upvalues: v42 (ref), v66 (copy), l_ExperienceInviteState_0 (ref), l_setInterval_0 (ref), v85 (copy), l_clearInterval_0 (ref)
        local l_v42_0 = v42;
        local v108 = nil;
        if v66 and (not v66.model or v66.model.state == l_ExperienceInviteState_0.Active or v66.model.state == l_ExperienceInviteState_0.Reserving) then
            v108 = l_setInterval_0(function() --[[ Line: 398 ]]
                -- upvalues: v85 (ref), v66 (ref)
                v85(v66.notification.experienceInviteId, v66.notification.membershipEntityId);
            end, l_v42_0 * 1000);
        end;
        return function() --[[ Line: 406 ]]
            -- upvalues: v108 (ref), l_clearInterval_0 (ref)
            if v108 then
                l_clearInterval_0(v108);
            end;
        end;
    end, {
        v66, 
        v85
    });
    v17.useEffect(function() --[[ Line: 415 ]]
        -- upvalues: v66 (copy), v51 (copy), v78 (copy), v81 (copy)
        if v66 and (v51.currentSquadId ~= v66.notification.membershipEntityId or v78) then
            v81(v66.notification.notificationId, true);
        end;
    end, {
        v66, 
        v81, 
        v51.currentSquadId, 
        v78
    });
    if l_FFlagEnableRecordSquadExperienceInviteChanges_0 then
        v17.useEffect(function() --[[ Line: 428 ]]
            -- upvalues: l_ExperienceInviteState_0 (ref), v70 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v97 (copy)
            if l_ExperienceInviteState_0[v70] then
                if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
                    if l_ExperienceInviteState_0[v70] ~= l_ExperienceInviteState_0.ReservationSuccessful then
                        v97();
                        return;
                    end;
                else
                    v97();
                end;
            end;
        end, {
            v70, 
            v97
        });
    end;
    v17.useEffect(function() --[[ Line: 447 ]]
        -- upvalues: v66 (copy), v9 (ref), v12 (ref), v53 (copy), l_ExperienceInviteState_0 (ref), l_default_0 (copy), v81 (copy), v77 (copy), l_ExperienceInviteVoteType_0 (ref), v54 (copy), v39 (ref), v67 (copy), v7 (ref), v8 (ref)
        if not v66 or not v66.model then
            return;
        else
            v9:debug("Current experience invite updated: {}", v12(v66.model));
            local l_notificationId_0 = v66.notification.notificationId;
            local l_state_0 = v66.model.state;
            if v66.model.inviterId == v53 then
                if l_state_0 == l_ExperienceInviteState_0.Active then
                    if v66.model.spotsTaken > 1 then
                        l_default_0:updateNotification(l_notificationId_0, v66.model.spotsTaken .. "SpotsFilled");
                        return;
                    end;
                elseif l_state_0 == l_ExperienceInviteState_0.Reserving or l_state_0 == l_ExperienceInviteState_0.ReservationSuccessful then
                    l_default_0:updateNotification(l_notificationId_0, "launching");
                    return;
                else
                    v81(l_notificationId_0, true);
                    if l_state_0 ~= l_ExperienceInviteState_0.Cancelled and l_state_0 ~= l_ExperienceInviteState_0.ReservationFailed then
                        v9:warning("Invitee unexpected squad experience invite state: {}", l_state_0);
                        return;
                    end;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Active then
                if v77 == l_ExperienceInviteVoteType_0.Invalid or v77 == l_ExperienceInviteVoteType_0.NoVote then
                    if v66.model.spotsTaken >= v66.model.totalSpots then
                        v54.fireSquadAnalytics(v39.SquadToastActions, {
                            parentChannelId = v67, 
                            experienceInviteId = v66.model.experienceInviteId, 
                            toastAction = v7.ExpInvSlotsFull, 
                            toastType = v8.ExperienceInvite
                        });
                        l_default_0:updateNotification(l_notificationId_0, "slotsFull");
                        return;
                    end;
                elseif v77 == l_ExperienceInviteVoteType_0.Accept then
                    l_default_0:updateNotification(l_notificationId_0, "waiting");
                    return;
                elseif v77 == l_ExperienceInviteVoteType_0.Decline or v77 == l_ExperienceInviteVoteType_0.Dismiss then
                    v81(l_notificationId_0, true);
                    return;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Reserving or l_state_0 == l_ExperienceInviteState_0.ReservationSuccessful then
                if v77 == l_ExperienceInviteVoteType_0.Invalid or v77 == l_ExperienceInviteVoteType_0.NoVote then
                    v54.fireSquadAnalytics(v39.SquadToastActions, {
                        parentChannelId = v67, 
                        experienceInviteId = v66.model.experienceInviteId, 
                        toastAction = v7.ExpInvExpired, 
                        toastType = v8.ExperienceInvite
                    });
                    l_default_0:updateNotification(l_notificationId_0, "expired");
                    return;
                elseif v77 == l_ExperienceInviteVoteType_0.Accept then
                    l_default_0:updateNotification(l_notificationId_0, "waiting");
                    return;
                elseif v77 == l_ExperienceInviteVoteType_0.Decline or v77 == l_ExperienceInviteVoteType_0.Dismiss then
                    v81(l_notificationId_0, true);
                    return;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Cancelled then
                l_default_0:updateNotification(l_notificationId_0, "cancelled");
                return;
            else
                v81(l_notificationId_0, true);
                if l_state_0 ~= l_ExperienceInviteState_0.ReservationFailed then
                    v9:warning("Inviter unexpected squad experience invite state: {}", l_state_0);
                end;
            end;
            return;
        end;
    end, {
        v66, 
        v67, 
        v81, 
        v53, 
        v54.fireSquadAnalytics, 
        v77
    });
    v18.useRealtimeNamespace("ExperienceInviteUpdate", function(v111) --[[ Line: 539 ]]
        -- upvalues: v9 (ref), v12 (ref), v52 (copy), v11 (ref)
        v9:debug("Experience invite RTN received. Detail: {}", v12(v111));
        v52(v11.Actions.CurrentExperienceInviteUpdated(v111));
    end, {
        v52
    });
    v17.useEffect(function() --[[ Line: 551 ]]
        -- upvalues: l_default_0 (copy), v66 (copy), v77 (copy), l_ExperienceInviteVoteType_0 (ref), v81 (copy), l_ExperienceInviteState_0 (ref), v54 (copy), v39 (ref), v67 (copy), v7 (ref), v8 (ref), v95 (copy)
        local v113 = l_default_0:listenToDismissNotification(function(v112) --[[ Line: 553 ]]
            -- upvalues: v66 (ref), v77 (ref), l_ExperienceInviteVoteType_0 (ref), v81 (ref), l_ExperienceInviteState_0 (ref), v54 (ref), v39 (ref), v67 (ref), v7 (ref), v8 (ref), v95 (ref)
            if v66 and v66.notification.notificationId == v112.notificationId then
                if v77 ~= l_ExperienceInviteVoteType_0.Accept then
                    v81(v112.notificationId, false);
                end;
                if (not v66.model or v66.model.state == l_ExperienceInviteState_0.Active) and (v77 == l_ExperienceInviteVoteType_0.Invalid or v77 == l_ExperienceInviteVoteType_0.NoVote) then
                    v54.fireSquadAnalytics(v39.SquadToastActions, {
                        parentChannelId = v67, 
                        experienceInviteId = v66.notification.experienceInviteId, 
                        toastAction = v7.ExpInvDismiss, 
                        toastType = v8.ExperienceInvite
                    });
                    v95(v66.notification.experienceInviteId, l_ExperienceInviteVoteType_0.Dismiss, v66.notification.membershipEntityId);
                end;
            end;
        end);
        return function() --[[ Line: 594 ]]
            -- upvalues: v113 (copy)
            if v113 then
                v113:Disconnect();
            end;
        end;
    end, {
        v66, 
        v67, 
        v81, 
        v52, 
        v54.fireSquadAnalytics, 
        v77, 
        v95
    });
    v17.useEffect(function() --[[ Line: 610 ]]
        -- upvalues: l_default_0 (copy), v53 (copy), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v52 (copy), v11 (ref)
        local v116 = l_default_0:listenToDisplayNotification(function(v114) --[[ Line: 612 ]]
            -- upvalues: v53 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v52 (ref), v11 (ref)
            if not v114 then
                return;
            elseif v53 <= 0 then
                return;
            else
                if v114.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation then
                    local v115 = l_HttpService_0:JSONDecode(v114.lifecycleData);
                    v52(v11.Actions.CurrentExperienceInviteReceived(v115.experienceInviteId, v115.membershipEntityId, v114.notificationId, v115.isInviter));
                end;
                return;
            end;
        end);
        return function() --[[ Line: 633 ]]
            -- upvalues: v116 (copy)
            if v116 then
                v116:Disconnect();
            end;
        end;
    end, {
        v53
    });
    v17.useEffect(function() --[[ Line: 642 ]]
        -- upvalues: l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), l_NotificationTypeEnum_0 (ref), v66 (copy), l_HttpService_0 (ref), v52 (copy), v11 (ref), l_default_0 (copy), l_ExperienceInviteState_0 (ref), v77 (copy), l_ExperienceInviteVoteType_0 (ref)
        local v119 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v117) --[[ Line: 645 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), v66 (ref), l_HttpService_0 (ref), v52 (ref), v11 (ref), l_default_0 (ref), l_ExperienceInviteState_0 (ref), v77 (ref), l_ExperienceInviteVoteType_0 (ref)
            if v117.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation and v117.userActionType == "timerElapsed" then
                if not v66 then
                    local v118 = l_HttpService_0:JSONDecode(v117.parameters);
                    v52(v11.Actions.CurrentExperienceInviteReceived(v118.experienceInviteId, v118.membershipEntityId, v117.notificationId, v118.isInviter));
                    v52(function() --[[ Line: 660 ]]
                        -- upvalues: l_default_0 (ref), v117 (copy)
                        l_default_0:updateNotification(v117.notificationId, "expired");
                    end);
                    return;
                else
                    assert(v66, "Experience invite must exist to perform actions.");
                    if (not v66.model or v66.model.state == l_ExperienceInviteState_0.Active) and (v77 == l_ExperienceInviteVoteType_0.Invalid or v77 == l_ExperienceInviteVoteType_0.NoVote) then
                        l_default_0:updateNotification(v117.notificationId, "expired");
                    end;
                end;
            end;
        end, false, true);
        return function() --[[ Line: 690 ]]
            -- upvalues: v119 (copy)
            if v119 then
                v119:Disconnect();
            end;
        end;
    end, {
        v66, 
        v77, 
        v95
    });
    v17.useEffect(function() --[[ Line: 698 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v67 (copy), v8 (ref), v66 (copy), v52 (copy), v11 (ref), v54 (copy), v39 (ref), v14 (ref), v7 (ref), v95 (copy), l_ExperienceInviteVoteType_0 (ref)
        local v123 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadExperienceInvitation, function(v120) --[[ Line: 702 ]]
            -- upvalues: l_HttpService_0 (ref), v67 (ref), v8 (ref), v66 (ref), v52 (ref), v11 (ref), v54 (ref), v39 (ref), v14 (ref), v7 (ref), v95 (ref), l_ExperienceInviteVoteType_0 (ref)
            if v120 and v120.userActionType == "click" and v120.visualItem and v120.visualItem.actionEventParams then
                local v121 = l_HttpService_0:JSONDecode(v120.visualItem.actionEventParams);
                local v122 = {
                    parentChannelId = v67, 
                    experienceInviteId = v121.experienceInviteId, 
                    toastType = v8.ExperienceInvite
                };
                if not v66 then
                    v52(v11.Actions.CurrentExperienceInviteReceived(v121.experienceInviteId, v121.membershipEntityId, v120.notificationData.id, v121.isInviter));
                end;
                if v120.visualItem.eventName == "GroupUpSquadExperience" then
                    v54.fireSquadAnalytics(v39.SquadToastActions, v14.Dictionary.union(v122, {
                        toastAction = v7.ExpInvAccept
                    }));
                    v95(v121.experienceInviteId, l_ExperienceInviteVoteType_0.Accept, v121.membershipEntityId);
                    return;
                elseif v120.visualItem.eventName == "DismissSquadExperienceInvited" then
                    v54.fireSquadAnalytics(v39.SquadToastActions, v14.Dictionary.union(v122, {
                        toastAction = v7.ExpInvDecline
                    }));
                    v95(v121.experienceInviteId, l_ExperienceInviteVoteType_0.Decline, v121.membershipEntityId);
                    return;
                elseif v120.visualItem.eventName == "CancelSquadExperienceSpotsFilled" then
                    v54.fireSquadAnalytics(v39.SquadToastActions, v14.Dictionary.union(v122, {
                        toastAction = v7.ExpInvCancel
                    }));
                    v95(v121.experienceInviteId, l_ExperienceInviteVoteType_0.Cancel, v121.membershipEntityId);
                end;
            end;
        end);
        return function() --[[ Line: 770 ]]
            -- upvalues: v123 (copy)
            v123();
        end;
    end, {
        v66, 
        v67, 
        v52, 
        v54.fireSquadAnalytics, 
        v95
    });
    v17.useEffect(function() --[[ Line: 783 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v54 (copy), v39 (ref)
        local v127 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadExperienceInvitation, function(v124) --[[ Line: 787 ]]
            -- upvalues: l_HttpService_0 (ref), v54 (ref), v39 (ref)
            local v125 = v124 and v124.state and v124.state.visualItems and v124.state.visualItems.button and v124.state.visualItems.button[1] and v124.state.visualItems.button[1].actionEventParams;
            if v125 then
                local l_experienceInviteId_0 = l_HttpService_0:JSONDecode(v125).experienceInviteId;
                v54.fireSquadAnalytics(v39.SquadExperienceInviteImpression, {
                    experienceInviteId = l_experienceInviteId_0, 
                    notificationId = v124.id, 
                    clientTimestamp = os.time()
                });
            end;
        end);
        return function() --[[ Line: 807 ]]
            -- upvalues: v127 (copy)
            v127();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v54.fireSquadAnalytics
    } else l_dependencyArray_0(v54.fireSquadAnalytics));
    v17.useEffect(function() --[[ Line: 817 ]]
        -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref)
        local function v129(v128) --[[ Line: 818 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref)
            if v128.currentState == "invited" then
                l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
            end;
        end;
        local v130 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadExperienceInvitation, v129);
        local v131 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Update, l_NotificationTypeEnum_0.SquadExperienceInvitation, v129);
        return function() --[[ Line: 836 ]]
            -- upvalues: v130 (copy), v131 (copy)
            v130();
            v131();
        end;
    end, {});
    return nil;
end;