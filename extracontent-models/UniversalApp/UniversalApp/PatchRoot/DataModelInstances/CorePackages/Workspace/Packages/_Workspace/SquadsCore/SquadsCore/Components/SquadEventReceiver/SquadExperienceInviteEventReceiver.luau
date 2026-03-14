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
local l_Sounds_0 = v20.Sounds;
local l_SoundManager_0 = v20.SoundManager;
local v37 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v38 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_LifecycleEvents_0 = v22.LifecycleEvents;
local l_NotificationTypeEnum_0 = v22.ToastNotificationTypeModule.NotificationTypeEnum;
local v41 = game:DefineFastInt("SquadExperienceInvitePollingIntervalSeconds", 4);
local v42 = game:DefineFastInt("SquadExperienceInviteTimeoutSeconds", 30);
local l_FFlagDebugSquadLogsEnabled_0 = v19.FFlagDebugSquadLogsEnabled;
local l_FFlagSplitSquadJoinOriginSources_0 = v19.FFlagSplitSquadJoinOriginSources;
local l_FFlagSquadLaunchExperienceMobileFix_0 = v19.FFlagSquadLaunchExperienceMobileFix;
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("ToastNotifications", "userActionOnToastNotification");
local function _(v47) --[[ Line: 76 ]]
    -- upvalues: l_FFlagDebugSquadLogsEnabled_0 (copy), l_HttpService_0 (copy)
    if l_FFlagDebugSquadLogsEnabled_0 then
        return l_HttpService_0:JSONEncode(v47);
    elseif v47.StatusCode then
        return v47.StatusCode;
    else
        return -1;
    end;
end;
return function(v49) --[[ Line: 84 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v17 (copy), v37 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), v23 (copy), l_useSelector_0 (copy), v13 (copy), l_ExperienceInviteVoteType_0 (copy), v11 (copy), v10 (copy), v9 (copy), l_FFlagDebugSquadLogsEnabled_0 (copy), l_HttpService_0 (copy), v38 (copy), v14 (copy), l_dependencyArray_0 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), v42 (copy), l_ExperienceInviteState_0 (copy), v6 (copy), l_FFlagSquadLaunchExperienceMobileFix_0 (copy), l_FFlagSplitSquadJoinOriginSources_0 (copy), l_GameParams_0 (copy), l_ExperienceService_0 (copy), v41 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_FFlagEnableRecordSquadExperienceInviteChanges_0 (copy), v12 (copy), v7 (copy), v8 (copy), v18 (copy), l_NotificationTypeEnum_0 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), l_LifecycleEvents_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy)
    local v50 = l_useDispatch_0();
    local v51 = tonumber(l_useLocalUserId_0()) or 0;
    local v52 = v17.useContext(v37);
    local v53, v54 = v17.useState("");
    v17.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), v54 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 94 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId);
        end);
        if l_status_0 then
            v54(l_result_0);
        end;
        local v59 = l_AppStorageService_0.ItemWasSet:Connect(function(v57, v58) --[[ Line: 101 ]]
            -- upvalues: l_LocalStorageKey_0 (ref), v54 (ref)
            if v57 == l_LocalStorageKey_0.BrowserTrackerId then
                v54(v58);
            end;
        end);
        return function() --[[ Line: 106 ]]
            -- upvalues: v59 (copy)
            v59:Disconnect();
        end;
    end, {
        v54
    });
    local l_default_0 = v23.ToastNotificationProtocol.default;
    local v61 = v17.useRef(false);
    local v63 = v17.useCallback(function(v62) --[[ Line: 114 ]]
        if v62.Squad and v62.Squad.Squad then
            return v62.Squad.Squad.currentExperienceInvite;
        else
            return nil;
        end;
    end, {});
    local v64 = l_useSelector_0(v63);
    local v65 = v13();
    local v66 = v64 and v64.model;
    local v67 = v66 and v66.experienceInviteId or "";
    local v68 = v66 and v66.state or "";
    local v69 = v66 and v66.experienceDetail.gameInstanceId or "";
    local v70 = v66 and v66.experienceDetail.placeId or 0;
    local v71 = v66 and v66.inviterId or 0;
    local v75, v76 = v17.useMemo(function() --[[ Line: 134 ]]
        -- upvalues: v64 (copy), l_ExperienceInviteVoteType_0 (ref), v51 (copy), v53 (copy)
        if not v64 or not v64.model then
            if v64 and v64.notification.isInviter then
                return l_ExperienceInviteVoteType_0.Accept, false;
            else
                return l_ExperienceInviteVoteType_0.Invalid, false;
            end;
        else
            for _, v73 in ipairs(v64.model.votes) do
                if v73.userId == v51 then
                    local v74 = false;
                    if v73.voteIdentifier and v73.voteIdentifier ~= "" then
                        v74 = v73.voteIdentifier ~= v53;
                    end;
                    return v73.voteType, v74;
                end;
            end;
            return l_ExperienceInviteVoteType_0.NoVote, false;
        end;
    end, {
        v64, 
        v51, 
        v53
    });
    local v79 = v17.useCallback(function(v77, v78) --[[ Line: 161 ]]
        -- upvalues: l_default_0 (copy), v50 (copy), v11 (ref), v61 (copy)
        if v78 then
            l_default_0:dismissNotification(v77);
        end;
        v50(v11.Actions.CurrentExperienceInviteDismissed(v77));
        v61.current = false;
    end, {
        v50
    });
    local v83 = v17.useCallback(function(v80, v81) --[[ Line: 172 ]]
        -- upvalues: v50 (copy), v10 (ref), v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), l_HttpService_0 (ref)
        return v50(v10.GetExperienceInvite.API({
            experienceInviteId = v80, 
            membershipEntityId = v81
        })):catch(function(v82) --[[ Line: 176 ]]
            -- upvalues: v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), l_HttpService_0 (ref), v80 (copy), v81 (copy)
            v9:warning("Error getting experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}", if l_FFlagDebugSquadLogsEnabled_0 then l_HttpService_0:JSONEncode(v82) else if v82.StatusCode then v82.StatusCode else -1, v80, v81);
        end);
    end, {
        v50
    });
    local v93 = v17.useCallback(function(v84, v85, v86) --[[ Line: 185 ]]
        -- upvalues: v65 (copy), v50 (copy), v10 (ref), v53 (copy), v52 (copy), v38 (ref), v14 (ref), l_HttpService_0 (ref), v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref)
        local v87 = {
            parentChannelId = v65, 
            experienceInviteId = v84, 
            voteType = v85
        };
        return v50(v10.VoteForExperienceInvite.API({
            experienceInviteId = v84, 
            membershipEntityId = v86, 
            voteIdentifier = v53, 
            voteType = v85
        })):andThen(function() --[[ Line: 198 ]]
            -- upvalues: v52 (ref), v38 (ref), v14 (ref), v87 (copy)
            v52.fireSquadAnalytics(v38.SquadVoteApiCall, v14.Dictionary.union(v87, {
                isSuccess = true
            }));
        end):catch(function(v88) --[[ Line: 206 ]]
            -- upvalues: l_HttpService_0 (ref), v52 (ref), v38 (ref), v14 (ref), v87 (copy), v9 (ref), l_FFlagDebugSquadLogsEnabled_0 (ref), v84 (copy), v86 (copy), v85 (copy)
            local l_Body_0 = v88.Body;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 208 ]]
                -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                return l_HttpService_0:JSONDecode(l_Body_0);
            end);
            local v92 = if l_status_1 then l_result_1.errorType else nil;
            v52.fireSquadAnalytics(v38.SquadVoteApiCall, v14.Dictionary.union(v87, {
                isSuccess = false, 
                errorMessage = v92, 
                errorType = if v88.StatusCode then tostring(v88.StatusCode) else nil
            }));
            v9:warning("Error voting for experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}, VoteType: {}", if l_FFlagDebugSquadLogsEnabled_0 then l_HttpService_0:JSONEncode(v88) else if v88.StatusCode then v88.StatusCode else -1, v84, v86, v85);
        end);
    end, l_dependencyArray_0(v50, v53));
    local v95 = v17.useCallback(function(v94) --[[ Line: 234 ]]
        -- upvalues: v52 (copy), v38 (ref), v67 (copy), v69 (copy), v70 (copy), v71 (copy), v68 (copy), v65 (copy)
        v52.fireSquadAnalytics(v38.SquadExperienceInviteStateChange, {
            experienceInviteId = v67, 
            invitationGameInstanceId = v69, 
            invitationPlaceId = v70, 
            inviterId = v71, 
            inviteState = v68, 
            parentChannelId = v65, 
            joinAttemptId = v94
        });
    end, l_dependencyArray_0(v69, v67, v71, v70, v68, v65, if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v52.fireSquadAnalytics else nil));
    v17.useEffect(function() --[[ Line: 261 ]]
        -- upvalues: v64 (copy), v42 (ref), v79 (copy)
        local v96 = nil;
        if v64 then
            v96 = task.delay(v42, function() --[[ Line: 264 ]]
                -- upvalues: v79 (ref), v64 (ref)
                v79(v64.notification.notificationId, true);
            end);
        end;
        return function() --[[ Line: 268 ]]
            -- upvalues: v96 (ref)
            if v96 then
                task.cancel(v96);
            end;
        end;
    end, {
        v79, 
        v64
    });
    v17.useEffect(function() --[[ Line: 277 ]]
        -- upvalues: v64 (copy), v75 (copy), l_ExperienceInviteVoteType_0 (ref), v61 (copy), l_ExperienceInviteState_0 (ref), v9 (ref), v79 (copy), v52 (copy), v6 (ref), l_FFlagSquadLaunchExperienceMobileFix_0 (ref), l_FFlagSplitSquadJoinOriginSources_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_HttpService_0 (ref), v95 (copy), l_GameParams_0 (ref), l_ExperienceService_0 (ref)
        if not v64 or v75 ~= l_ExperienceInviteVoteType_0.Accept or v61.current then
            return;
        else
            local l_model_0 = v64.model;
            local l_notification_0 = v64.notification;
            if l_model_0 and l_model_0.state == l_ExperienceInviteState_0.ReservationSuccessful then
                local l_gameInstanceId_0 = l_model_0.experienceDetail.gameInstanceId;
                local l_placeId_0 = l_model_0.experienceDetail.placeId;
                assert(l_gameInstanceId_0, "Game instance id should exist.");
                v61.current = true;
                v9:debug("Launching experience. GameInstanceId: {}, PlaceId: {}", l_gameInstanceId_0, l_placeId_0);
                local v104 = task.delay(1, function() --[[ Line: 297 ]]
                    -- upvalues: v79 (ref), l_notification_0 (copy), v52 (ref), v6 (ref), l_FFlagSquadLaunchExperienceMobileFix_0 (ref), l_FFlagSplitSquadJoinOriginSources_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), l_HttpService_0 (ref), v95 (ref), l_GameParams_0 (ref), l_placeId_0 (copy), l_gameInstanceId_0 (copy), l_ExperienceService_0 (ref)
                    v79(l_notification_0.notificationId, true);
                    if v52.squadLocation == v6.InExperience and l_FFlagSquadLaunchExperienceMobileFix_0 then
                        game:Shutdown();
                    end;
                    local v101 = "SquadExperienceInvite";
                    if l_FFlagSplitSquadJoinOriginSources_0 then
                        if v52.squadLocation == v6.UniversalApp then
                            v101 = "SquadExperienceInviteFromUA";
                        elseif v52.squadLocation == v6.InExperience then
                            v101 = "SquadExperienceInviteFromInExp";
                        end;
                    end;
                    local v102 = nil;
                    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
                        v102 = l_HttpService_0:GenerateGUID(false);
                        v95(v102);
                    end;
                    local v103 = l_GameParams_0.fromPlaceInstance(l_placeId_0, l_gameInstanceId_0);
                    if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
                        v103.joinAttemptId = v102;
                    end;
                    l_ExperienceService_0:LaunchExperience(v103, v101, nil);
                end);
                return function() --[[ Line: 328 ]]
                    -- upvalues: v104 (copy)
                    task.cancel(v104);
                end;
            else
                return;
            end;
        end;
    end, l_dependencyArray_0(v52.squadLocation, v64, v79, v75, if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v95 else nil));
    v17.useEffect(function() --[[ Line: 346 ]]
        -- upvalues: v41 (ref), v64 (copy), l_ExperienceInviteState_0 (ref), l_setInterval_0 (ref), v83 (copy), l_clearInterval_0 (ref)
        local l_v41_0 = v41;
        local v106 = nil;
        if v64 and (not v64.model or v64.model.state == l_ExperienceInviteState_0.Active or v64.model.state == l_ExperienceInviteState_0.Reserving) then
            v106 = l_setInterval_0(function() --[[ Line: 357 ]]
                -- upvalues: v83 (ref), v64 (ref)
                v83(v64.notification.experienceInviteId, v64.notification.membershipEntityId);
            end, l_v41_0 * 1000);
        end;
        return function() --[[ Line: 365 ]]
            -- upvalues: v106 (ref), l_clearInterval_0 (ref)
            if v106 then
                l_clearInterval_0(v106);
            end;
        end;
    end, {
        v64, 
        v83
    });
    v17.useEffect(function() --[[ Line: 374 ]]
        -- upvalues: v64 (copy), v49 (copy), v76 (copy), v79 (copy)
        if v64 and (v49.currentSquadId ~= v64.notification.membershipEntityId or v76) then
            v79(v64.notification.notificationId, true);
        end;
    end, {
        v64, 
        v79, 
        v49.currentSquadId, 
        v76
    });
    if l_FFlagEnableRecordSquadExperienceInviteChanges_0 then
        v17.useEffect(function() --[[ Line: 387 ]]
            -- upvalues: l_ExperienceInviteState_0 (ref), v68 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v95 (copy)
            if l_ExperienceInviteState_0[v68] then
                if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
                    if l_ExperienceInviteState_0[v68] ~= l_ExperienceInviteState_0.ReservationSuccessful then
                        v95();
                        return;
                    end;
                else
                    v95();
                end;
            end;
        end, {
            v68, 
            v95
        });
    end;
    v17.useEffect(function() --[[ Line: 406 ]]
        -- upvalues: v64 (copy), v9 (ref), v12 (ref), v51 (copy), l_ExperienceInviteState_0 (ref), l_default_0 (copy), v79 (copy), v75 (copy), l_ExperienceInviteVoteType_0 (ref), v52 (copy), v38 (ref), v65 (copy), v7 (ref), v8 (ref)
        if not v64 or not v64.model then
            return;
        else
            v9:debug("Current experience invite updated: {}", v12(v64.model));
            local l_notificationId_0 = v64.notification.notificationId;
            local l_state_0 = v64.model.state;
            if v64.model.inviterId == v51 then
                if l_state_0 == l_ExperienceInviteState_0.Active then
                    if v64.model.spotsTaken > 1 then
                        l_default_0:updateNotification(l_notificationId_0, v64.model.spotsTaken .. "SpotsFilled");
                        return;
                    end;
                elseif l_state_0 == l_ExperienceInviteState_0.Reserving or l_state_0 == l_ExperienceInviteState_0.ReservationSuccessful then
                    l_default_0:updateNotification(l_notificationId_0, "launching");
                    return;
                else
                    v79(l_notificationId_0, true);
                    if l_state_0 ~= l_ExperienceInviteState_0.Cancelled and l_state_0 ~= l_ExperienceInviteState_0.ReservationFailed then
                        v9:warning("Invitee unexpected squad experience invite state: {}", l_state_0);
                        return;
                    end;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Active then
                if v75 == l_ExperienceInviteVoteType_0.Invalid or v75 == l_ExperienceInviteVoteType_0.NoVote then
                    if v64.model.spotsTaken >= v64.model.totalSpots then
                        v52.fireSquadAnalytics(v38.SquadToastActions, {
                            parentChannelId = v65, 
                            experienceInviteId = v64.model.experienceInviteId, 
                            toastAction = v7.ExpInvSlotsFull, 
                            toastType = v8.ExperienceInvite
                        });
                        l_default_0:updateNotification(l_notificationId_0, "slotsFull");
                        return;
                    end;
                elseif v75 == l_ExperienceInviteVoteType_0.Accept then
                    l_default_0:updateNotification(l_notificationId_0, "waiting");
                    return;
                elseif v75 == l_ExperienceInviteVoteType_0.Decline or v75 == l_ExperienceInviteVoteType_0.Dismiss then
                    v79(l_notificationId_0, true);
                    return;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Reserving or l_state_0 == l_ExperienceInviteState_0.ReservationSuccessful then
                if v75 == l_ExperienceInviteVoteType_0.Invalid or v75 == l_ExperienceInviteVoteType_0.NoVote then
                    v52.fireSquadAnalytics(v38.SquadToastActions, {
                        parentChannelId = v65, 
                        experienceInviteId = v64.model.experienceInviteId, 
                        toastAction = v7.ExpInvExpired, 
                        toastType = v8.ExperienceInvite
                    });
                    l_default_0:updateNotification(l_notificationId_0, "expired");
                    return;
                elseif v75 == l_ExperienceInviteVoteType_0.Accept then
                    l_default_0:updateNotification(l_notificationId_0, "waiting");
                    return;
                elseif v75 == l_ExperienceInviteVoteType_0.Decline or v75 == l_ExperienceInviteVoteType_0.Dismiss then
                    v79(l_notificationId_0, true);
                    return;
                end;
            elseif l_state_0 == l_ExperienceInviteState_0.Cancelled then
                l_default_0:updateNotification(l_notificationId_0, "cancelled");
                return;
            else
                v79(l_notificationId_0, true);
                if l_state_0 ~= l_ExperienceInviteState_0.ReservationFailed then
                    v9:warning("Inviter unexpected squad experience invite state: {}", l_state_0);
                end;
            end;
            return;
        end;
    end, {
        v64, 
        v65, 
        v79, 
        v51, 
        v52.fireSquadAnalytics, 
        v75
    });
    v18.useRealtimeNamespace("ExperienceInviteUpdate", function(v109) --[[ Line: 498 ]]
        -- upvalues: v9 (ref), v12 (ref), v50 (copy), v11 (ref)
        v9:debug("Experience invite RTN received. Detail: {}", v12(v109));
        v50(v11.Actions.CurrentExperienceInviteUpdated(v109));
    end, {
        v50
    });
    v17.useEffect(function() --[[ Line: 510 ]]
        -- upvalues: l_default_0 (copy), v64 (copy), v75 (copy), l_ExperienceInviteVoteType_0 (ref), v79 (copy), l_ExperienceInviteState_0 (ref), v52 (copy), v38 (ref), v65 (copy), v7 (ref), v8 (ref), v93 (copy)
        local v111 = l_default_0:listenToDismissNotification(function(v110) --[[ Line: 512 ]]
            -- upvalues: v64 (ref), v75 (ref), l_ExperienceInviteVoteType_0 (ref), v79 (ref), l_ExperienceInviteState_0 (ref), v52 (ref), v38 (ref), v65 (ref), v7 (ref), v8 (ref), v93 (ref)
            if v64 and v64.notification.notificationId == v110.notificationId then
                if v75 ~= l_ExperienceInviteVoteType_0.Accept then
                    v79(v110.notificationId, false);
                end;
                if (not v64.model or v64.model.state == l_ExperienceInviteState_0.Active) and (v75 == l_ExperienceInviteVoteType_0.Invalid or v75 == l_ExperienceInviteVoteType_0.NoVote) then
                    v52.fireSquadAnalytics(v38.SquadToastActions, {
                        parentChannelId = v65, 
                        experienceInviteId = v64.notification.experienceInviteId, 
                        toastAction = v7.ExpInvDismiss, 
                        toastType = v8.ExperienceInvite
                    });
                    v93(v64.notification.experienceInviteId, l_ExperienceInviteVoteType_0.Dismiss, v64.notification.membershipEntityId);
                end;
            end;
        end);
        return function() --[[ Line: 553 ]]
            -- upvalues: v111 (copy)
            if v111 then
                v111:Disconnect();
            end;
        end;
    end, {
        v64, 
        v65, 
        v79, 
        v50, 
        v52.fireSquadAnalytics, 
        v75, 
        v93
    });
    v17.useEffect(function() --[[ Line: 569 ]]
        -- upvalues: l_default_0 (copy), v51 (copy), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v50 (copy), v11 (ref)
        local v114 = l_default_0:listenToDisplayNotification(function(v112) --[[ Line: 571 ]]
            -- upvalues: v51 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v50 (ref), v11 (ref)
            if not v112 then
                return;
            elseif v51 <= 0 then
                return;
            else
                if v112.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation then
                    local v113 = l_HttpService_0:JSONDecode(v112.lifecycleData);
                    v50(v11.Actions.CurrentExperienceInviteReceived(v113.experienceInviteId, v113.membershipEntityId, v112.notificationId, v113.isInviter));
                end;
                return;
            end;
        end);
        return function() --[[ Line: 592 ]]
            -- upvalues: v114 (copy)
            if v114 then
                v114:Disconnect();
            end;
        end;
    end, {
        v51
    });
    v17.useEffect(function() --[[ Line: 601 ]]
        -- upvalues: l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), l_NotificationTypeEnum_0 (ref), v64 (copy), l_HttpService_0 (ref), v50 (copy), v11 (ref), l_default_0 (copy), l_ExperienceInviteState_0 (ref), v75 (copy), l_ExperienceInviteVoteType_0 (ref)
        local v117 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v115) --[[ Line: 604 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), v64 (ref), l_HttpService_0 (ref), v50 (ref), v11 (ref), l_default_0 (ref), l_ExperienceInviteState_0 (ref), v75 (ref), l_ExperienceInviteVoteType_0 (ref)
            if v115.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation and v115.userActionType == "timerElapsed" then
                if not v64 then
                    local v116 = l_HttpService_0:JSONDecode(v115.parameters);
                    v50(v11.Actions.CurrentExperienceInviteReceived(v116.experienceInviteId, v116.membershipEntityId, v115.notificationId, v116.isInviter));
                    v50(function() --[[ Line: 619 ]]
                        -- upvalues: l_default_0 (ref), v115 (copy)
                        l_default_0:updateNotification(v115.notificationId, "expired");
                    end);
                    return;
                else
                    assert(v64, "Experience invite must exist to perform actions.");
                    if (not v64.model or v64.model.state == l_ExperienceInviteState_0.Active) and (v75 == l_ExperienceInviteVoteType_0.Invalid or v75 == l_ExperienceInviteVoteType_0.NoVote) then
                        l_default_0:updateNotification(v115.notificationId, "expired");
                    end;
                end;
            end;
        end, false, true);
        return function() --[[ Line: 649 ]]
            -- upvalues: v117 (copy)
            if v117 then
                v117:Disconnect();
            end;
        end;
    end, {
        v64, 
        v75, 
        v93
    });
    v17.useEffect(function() --[[ Line: 657 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v65 (copy), v8 (ref), v64 (copy), v50 (copy), v11 (ref), v52 (copy), v38 (ref), v14 (ref), v7 (ref), v93 (copy), l_ExperienceInviteVoteType_0 (ref)
        local v121 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadExperienceInvitation, function(v118) --[[ Line: 661 ]]
            -- upvalues: l_HttpService_0 (ref), v65 (ref), v8 (ref), v64 (ref), v50 (ref), v11 (ref), v52 (ref), v38 (ref), v14 (ref), v7 (ref), v93 (ref), l_ExperienceInviteVoteType_0 (ref)
            if v118 and v118.userActionType == "click" and v118.visualItem and v118.visualItem.actionEventParams then
                local v119 = l_HttpService_0:JSONDecode(v118.visualItem.actionEventParams);
                local v120 = {
                    parentChannelId = v65, 
                    experienceInviteId = v119.experienceInviteId, 
                    toastType = v8.ExperienceInvite
                };
                if not v64 then
                    v50(v11.Actions.CurrentExperienceInviteReceived(v119.experienceInviteId, v119.membershipEntityId, v118.notificationData.id, v119.isInviter));
                end;
                if v118.visualItem.eventName == "GroupUpSquadExperience" then
                    v52.fireSquadAnalytics(v38.SquadToastActions, v14.Dictionary.union(v120, {
                        toastAction = v7.ExpInvAccept
                    }));
                    v93(v119.experienceInviteId, l_ExperienceInviteVoteType_0.Accept, v119.membershipEntityId);
                    return;
                elseif v118.visualItem.eventName == "DismissSquadExperienceInvited" then
                    v52.fireSquadAnalytics(v38.SquadToastActions, v14.Dictionary.union(v120, {
                        toastAction = v7.ExpInvDecline
                    }));
                    v93(v119.experienceInviteId, l_ExperienceInviteVoteType_0.Decline, v119.membershipEntityId);
                    return;
                elseif v118.visualItem.eventName == "CancelSquadExperienceSpotsFilled" then
                    v52.fireSquadAnalytics(v38.SquadToastActions, v14.Dictionary.union(v120, {
                        toastAction = v7.ExpInvCancel
                    }));
                    v93(v119.experienceInviteId, l_ExperienceInviteVoteType_0.Cancel, v119.membershipEntityId);
                end;
            end;
        end);
        return function() --[[ Line: 729 ]]
            -- upvalues: v121 (copy)
            v121();
        end;
    end, {
        v64, 
        v65, 
        v50, 
        v52.fireSquadAnalytics, 
        v93
    });
    v17.useEffect(function() --[[ Line: 741 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v52 (copy), v38 (ref)
        local v125 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadExperienceInvitation, function(v122) --[[ Line: 745 ]]
            -- upvalues: l_HttpService_0 (ref), v52 (ref), v38 (ref)
            local v123 = v122 and v122.state and v122.state.visualItems and v122.state.visualItems.button and v122.state.visualItems.button[1] and v122.state.visualItems.button[1].actionEventParams;
            if v123 then
                local l_experienceInviteId_0 = l_HttpService_0:JSONDecode(v123).experienceInviteId;
                v52.fireSquadAnalytics(v38.SquadExperienceInviteImpression, {
                    experienceInviteId = l_experienceInviteId_0, 
                    notificationId = v122.id, 
                    clientTimestamp = os.time()
                });
            end;
        end);
        return function() --[[ Line: 765 ]]
            -- upvalues: v125 (copy)
            v125();
        end;
    end, l_dependencyArray_0(v52.fireSquadAnalytics));
    v17.useEffect(function() --[[ Line: 771 ]]
        -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref)
        local function v127(v126) --[[ Line: 772 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref)
            if v126.currentState == "invited" then
                l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
            end;
        end;
        local v128 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadExperienceInvitation, v127);
        local v129 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Update, l_NotificationTypeEnum_0.SquadExperienceInvitation, v127);
        return function() --[[ Line: 790 ]]
            -- upvalues: v128 (copy), v129 (copy)
            v128();
            v129();
        end;
    end, {});
    return nil;
end;