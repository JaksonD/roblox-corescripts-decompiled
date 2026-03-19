local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Promise);
local l_UsersGetPresence_0 = require(l_Parent_0.UserLib).Requests.UsersGetPresence;
local v6 = require(l_Parent_0.UserProfiles);
local l_getCombinedNameFromId_0 = v6.Selectors.getCombinedNameFromId;
local l_PostSendExperienceInvite_0 = require(l_Parent_0.GameInvite).PostSendExperienceInvite;
local l_JoinExperience_0 = require(l_Parent_0.NotificationsCommon).JoinExperience;
local v10 = require(l_script_FirstAncestor_0.Enums.SocialContextToastDiagKeys);
local v11 = require(l_script_FirstAncestor_0.Actions.SetToastContent);
local v12 = require(l_script_FirstAncestor_0.Actions.SetConfirmationModal);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v14 = require(l_script_FirstAncestor_0.Enums.ToastTypes);
local v15 = require(l_script_FirstAncestor_0.Enums.SocialContextToastAnalyticsActionTypes);
local v16 = require(l_script_FirstAncestor_0.SocialContextToastEvents);
local l_useOneToOnePartyNudgeStartPartyRejected_0 = require(l_Parent_0.SquadsCore).Hooks.useOneToOnePartyNudgeStartPartyRejected;
local l_DEPRECATED_FriendsGetFriendStatuses_0 = require(l_Parent_0.Http).Requests.DEPRECATED_FriendsGetFriendStatuses;
local l_GetFFlagSocialContextToastEventStream_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialContextToastEventStream;
local l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent;
local l_GetFFlagEnableReferredPlayerJoinRemoteEventForAll_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEventForAll;
local l_GetFIntMaxReferredPlayerJoinToasts_0 = require(l_Parent_0.SharedFlags).GetFIntMaxReferredPlayerJoinToasts;
local l_FFlagEnablePartyNudgeAfterJoin_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyNudgeAfterJoin;
local v24 = game:DefineFastInt("SocialContextToastDelay", 10);
local v25 = nil;
if l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0() then
    v25 = function() --[[ Line: 55 ]]
        -- upvalues: l_GetFFlagEnableReferredPlayerJoinRemoteEventForAll_0 (copy)
        if l_GetFFlagEnableReferredPlayerJoinRemoteEventForAll_0() then
            return true;
        else
            return false;
        end;
    end;
end;
local function v35(v26, v27) --[[ Line: 64 ]] --[[ Name: getNames ]]
    -- upvalues: v4 (copy), v6 (copy), l_getCombinedNameFromId_0 (copy)
    local v28 = {};
    for v29 = 1, #v27 do
        v28[v29] = tostring(v27[v29]);
    end;
    return v4.new(function(v30, _) --[[ Line: 69 ]]
        -- upvalues: v26 (copy), v6 (ref), v28 (copy), v27 (copy), l_getCombinedNameFromId_0 (ref)
        v26:query({
            query = v6.Queries.userProfilesAllNamesByUserIds, 
            variables = {
                userIds = v28
            }
        }):andThen(function(v32) --[[ Line: 77 ]]
            -- upvalues: v27 (ref), l_getCombinedNameFromId_0 (ref), v30 (copy)
            local v33 = {};
            for v34 = 1, #v27 do
                table.insert(v33, {
                    userId = v27[v34], 
                    name = l_getCombinedNameFromId_0(v32.data, v27[v34])
                });
            end;
            v30(v33);
        end);
    end);
end;
local function _(v36, v37, v38) --[[ Line: 90 ]] --[[ Name: sortFriendsList ]]
    -- upvalues: v3 (copy)
    if not v38 then
        return v36;
    else
        v36 = v3.List.removeValue(v36, v37);
        table.insert(v36, 1, v37);
        return v36;
    end;
end;
local function v49(v40, v41, v42, v43, v44, v45, v46) --[[ Line: 100 ]] --[[ Name: showYouJoinedFriendsToast ]]
    -- upvalues: v11 (copy), v10 (copy), l_GetFFlagSocialContextToastEventStream_0 (copy), v16 (copy), v14 (copy), v15 (copy), v3 (copy), v35 (copy)
    if #v43 == 0 then
        return v41(v11(nil));
    else
        v40.analytics.Diag:reportCounter(v10.YouJoinedFriends, 1);
        if l_GetFFlagSocialContextToastEventStream_0() then
            v16(v40.eventIngest, {
                toastType = v14.YouJoinedFriends, 
                friendId = table.concat(v43, ","), 
                universeId = v45, 
                placeId = v46, 
                actionType = v15.Shown
            });
        end;
        if v42 > 0 then
            local l_v43_0 = v43;
            if not v44 then
                v43 = l_v43_0;
            else
                l_v43_0 = v3.List.removeValue(l_v43_0, v42);
                table.insert(l_v43_0, 1, v42);
                v43 = l_v43_0;
            end;
        end;
        return v35(v40.apolloClient, v43):andThen(function(v48) --[[ Line: 127 ]]
            -- upvalues: v41 (copy), v11 (ref), v14 (ref)
            v41(v11({
                toastType = v14.YouJoinedFriends, 
                userList = v48
            }));
        end);
    end;
end;
local function v72(v50, v51, v52, _, v54, v55) --[[ Line: 135 ]] --[[ Name: handleFollowedPlayerDisconnected ]]
    -- upvalues: l_UsersGetPresence_0 (copy), v10 (copy), l_GetFFlagSocialContextToastEventStream_0 (copy), v16 (copy), v14 (copy), v15 (copy), v35 (copy), v11 (copy), v12 (copy), l_JoinExperience_0 (copy), l_PostSendExperienceInvite_0 (copy)
    local l_analytics_0 = v50.analytics;
    local l_networking_0 = v50.networking;
    l_UsersGetPresence_0(l_networking_0, {
        v52
    }):andThen(function(v58) --[[ Line: 138 ]]
        -- upvalues: v54 (copy), l_analytics_0 (copy), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), v50 (copy), v14 (ref), v52 (copy), v55 (copy), v15 (ref), v35 (ref), v51 (copy), v11 (ref), v12 (ref), l_JoinExperience_0 (ref), l_PostSendExperienceInvite_0 (ref)
        if not v58.responseBody or not v58.responseBody.userPresences or #v58.responseBody.userPresences == 0 then
            return;
        else
            local v59 = v58.responseBody.userPresences[1];
            local l_universeId_0 = v59.universeId;
            if tostring(l_universeId_0) == tostring(v54) then
                l_analytics_0.Diag:reportCounter(v10.FollowedFriendInOtherPlace, 1);
                if l_GetFFlagSocialContextToastEventStream_0() then
                    v16(v50.eventIngest, {
                        toastType = v14.FriendInNonRootPlace, 
                        friendId = tostring(v52), 
                        universeId = v54, 
                        placeId = v55, 
                        actionType = v15.Shown
                    });
                end;
                return v35(v50.apolloClient, {
                    v52
                }):andThen(function(v61) --[[ Line: 163 ]]
                    -- upvalues: v51 (ref), v11 (ref), v14 (ref), v52 (ref)
                    if #v61 == 0 then
                        return;
                    else
                        v51(v11({
                            toastType = v14.FriendInNonRootPlace, 
                            joinerUserId = v52, 
                            joinerName = v61[1].name
                        }));
                        return;
                    end;
                end);
            elseif l_universeId_0 ~= nil then
                l_analytics_0.Diag:reportCounter(v10.FollowedFriendInOtherUniverse, 1);
                if l_GetFFlagSocialContextToastEventStream_0() then
                    v16(v50.eventIngest, {
                        toastType = v14.FollowYourFriend, 
                        friendId = tostring(v52), 
                        universeId = v54, 
                        placeId = v55, 
                        actionType = v15.Shown
                    });
                end;
                local function v64(v62) --[[ Line: 184 ]] --[[ Name: closeCallback ]]
                    -- upvalues: v51 (ref), v12 (ref), l_analytics_0 (ref), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), v50 (ref), v52 (ref), v54 (ref), v55 (ref), v15 (ref), v59 (copy), l_JoinExperience_0 (ref)
                    if not v62 then
                        v51(v12(false));
                        return;
                    else
                        l_analytics_0.Diag:reportCounter(v10.ConfirmLeaveGameButtonClicked, 1);
                        if l_GetFFlagSocialContextToastEventStream_0() then
                            v16(v50.eventIngest, {
                                toastType = "LeaveGameConfirmationModal", 
                                friendId = tostring(v52), 
                                universeId = v54, 
                                placeId = v55, 
                                actionType = v15.ButtonClicked
                            });
                        end;
                        local v63 = string.format("roblox://userid=%s&placeid=%s", tostring(v52), v59.placeId);
                        l_JoinExperience_0(v63, true);
                        return;
                    end;
                end;
                local function v65() --[[ Line: 204 ]] --[[ Name: onJoinFriendButtonClick ]]
                    -- upvalues: l_analytics_0 (ref), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), v50 (ref), v14 (ref), v52 (ref), v54 (ref), v55 (ref), v15 (ref), v51 (ref), v12 (ref), v64 (copy)
                    l_analytics_0.Diag:reportCounter(v10.JoinFriendButtonClicked, 1);
                    if l_GetFFlagSocialContextToastEventStream_0() then
                        v16(v50.eventIngest, {
                            toastType = v14.FollowYourFriend, 
                            friendId = tostring(v52), 
                            universeId = v54, 
                            placeId = v55, 
                            actionType = v15.ButtonClicked
                        });
                    end;
                    v51(v12(true, v64));
                end;
                return v35(v50.apolloClient, {
                    v52
                }):andThen(function(v66) --[[ Line: 218 ]]
                    -- upvalues: v51 (ref), v11 (ref), v14 (ref), v52 (ref), v59 (copy), v65 (copy)
                    if #v66 == 0 then
                        return;
                    else
                        v51(v11({
                            toastType = v14.FollowYourFriend, 
                            joinerUserId = v52, 
                            joinerName = v66[1].name, 
                            experienceName = v59.lastLocation, 
                            onActivated = v65
                        }));
                        return;
                    end;
                end);
            else
                l_analytics_0.Diag:reportCounter(v10.FollowedFriendNotInGame, 1);
                if l_GetFFlagSocialContextToastEventStream_0() then
                    v16(v50.eventIngest, {
                        toastType = v14.InviteBack, 
                        friendId = tostring(v52), 
                        universeId = v54, 
                        placeId = v55, 
                        actionType = v15.Shown
                    });
                end;
                local function v69() --[[ Line: 241 ]] --[[ Name: onInviteBackButtonClick ]]
                    -- upvalues: l_analytics_0 (ref), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), v50 (ref), v14 (ref), v52 (ref), v54 (ref), v55 (ref), v15 (ref), l_PostSendExperienceInvite_0 (ref), v51 (ref), v11 (ref)
                    l_analytics_0.Diag:reportCounter(v10.InviteBackButtonClicked, 1);
                    if l_GetFFlagSocialContextToastEventStream_0() then
                        v16(v50.eventIngest, {
                            toastType = v14.InviteBack, 
                            friendId = tostring(v52), 
                            universeId = v54, 
                            placeId = v55, 
                            actionType = v15.ButtonClicked
                        });
                    end;
                    l_PostSendExperienceInvite_0(v50.networking, tostring(v52), tostring(v55), "SocialContextToast"):andThen(function(_) --[[ Line: 257 ]]
                        -- upvalues: v51 (ref), v11 (ref), v14 (ref)
                        v51(v11({
                            toastType = v14.InviteSuccess
                        }));
                    end, function(_) --[[ Line: 261 ]]
                        -- upvalues: v51 (ref), v11 (ref), v14 (ref)
                        v51(v11({
                            toastType = v14.InviteFailure
                        }));
                    end);
                end;
                return v35(v50.apolloClient, {
                    v52
                }):andThen(function(v70) --[[ Line: 269 ]]
                    -- upvalues: v51 (ref), v11 (ref), v14 (ref), v52 (ref), v69 (copy)
                    if #v70 == 0 then
                        return;
                    else
                        v51(v11({
                            toastType = v14.InviteBack, 
                            joinerUserId = v52, 
                            joinerName = v70[1].name, 
                            onActivated = v69
                        }));
                        return;
                    end;
                end);
            end;
        end;
    end, function(_) --[[ Line: 282 ]]
        -- upvalues: l_analytics_0 (copy), v10 (ref)
        l_analytics_0.Diag:reportCounter(v10.ErrorFetchingPresence, 1);
    end);
end;
SocialContextToastDispatcher = function(v73) --[[ Line: 288 ]] --[[ Name: SocialContextToastDispatcher ]]
    -- upvalues: v2 (copy), l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0 (copy), l_useDispatch_0 (copy), l_DEPRECATED_FriendsGetFriendStatuses_0 (copy), v72 (copy), v49 (copy), v10 (copy), l_GetFFlagSocialContextToastEventStream_0 (copy), v16 (copy), v14 (copy), v15 (copy), v35 (copy), v11 (copy), l_FFlagEnablePartyNudgeAfterJoin_0 (copy), l_useOneToOnePartyNudgeStartPartyRejected_0 (copy), l_GetFIntMaxReferredPlayerJoinToasts_0 (copy), v24 (copy), v25 (ref)
    local l_services_0 = v73.services;
    local l_analytics_1 = l_services_0.analytics;
    local l_playersService_0 = l_services_0.playersService;
    local v77 = v2.createRef();
    local l_networking_1 = l_services_0.networking;
    local v79 = v2.useRef(nil);
    local v80 = v2.useRef(nil);
    local v81 = if l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0() then v2.useRef(nil) else nil;
    local v82 = if l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0() then v2.useRef(0) else nil;
    local v83 = l_useDispatch_0();
    local function v95() --[[ Line: 307 ]] --[[ Name: showToastOnJoin ]]
        -- upvalues: l_playersService_0 (copy), l_DEPRECATED_FriendsGetFriendStatuses_0 (ref), l_networking_1 (copy), v72 (ref), l_services_0 (copy), v83 (copy), v73 (copy), v49 (ref)
        local l_FollowUserId_0 = l_playersService_0.LocalPlayer.FollowUserId;
        local v85 = false;
        local v86 = {};
        local v87 = {};
        for _, v89 in pairs(l_playersService_0:GetPlayers()) do
            table.insert(v87, v89.UserId);
        end;
        l_DEPRECATED_FriendsGetFriendStatuses_0(l_networking_1, v87):andThen(function(v90) --[[ Line: 319 ]]
            -- upvalues: l_FollowUserId_0 (copy), v85 (ref), v86 (copy), v72 (ref), l_services_0 (ref), v83 (ref), v73 (ref), v49 (ref)
            if v90 and v90.responseBody and v90.responseBody.data then
                local l_data_0 = v90.responseBody.data;
                for _, v93 in pairs(l_data_0) do
                    local l_id_0 = v93.id;
                    if l_id_0 == l_FollowUserId_0 then
                        v85 = true;
                    end;
                    if v93.status == "Friends" then
                        table.insert(v86, l_id_0);
                    end;
                end;
                if l_FollowUserId_0 > 0 and not v85 then
                    return v72(l_services_0, v83, l_FollowUserId_0, v86, v73.gameId, v73.placeId);
                else
                    return v49(l_services_0, v83, l_FollowUserId_0, v86, v85, v73.gameId, v73.placeId);
                end;
            else
                return;
            end;
        end);
    end;
    local function v103(v96) --[[ Line: 355 ]] --[[ Name: onPlayerAdded ]]
        -- upvalues: l_playersService_0 (copy), l_analytics_1 (copy), v10 (ref), l_GetFFlagSocialContextToastEventStream_0 (ref), v16 (ref), l_services_0 (copy), v14 (ref), v73 (copy), v15 (ref), v35 (ref), v83 (copy), v11 (ref)
        local l_LocalPlayer_0 = l_playersService_0.LocalPlayer;
        if v96.FollowUserId == l_LocalPlayer_0.UserId then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 358 ]]
                -- upvalues: l_LocalPlayer_0 (copy), v96 (copy)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return l_LocalPlayer_0:IsFriendsWithAsync(v96.UserId);
                else
                    return l_LocalPlayer_0:IsFriendsWith(v96.UserId);
                end;
            end);
            if l_status_0 and l_result_0 then
                l_analytics_1.Diag:reportCounter(v10.YouWereFollowed, 1);
                if l_GetFFlagSocialContextToastEventStream_0() then
                    v16(l_services_0.eventIngest, {
                        toastType = v14.FriendJoinedYou, 
                        friendId = tostring(v96.UserId), 
                        universeId = v73.gameId, 
                        placeId = v73.placeId, 
                        actionType = v15.Shown
                    });
                end;
                local v100 = {
                    v96.UserId
                };
                v35(l_services_0.apolloClient, v100):andThen(function(v101) --[[ Line: 380 ]]
                    -- upvalues: v96 (copy), v83 (ref), v11 (ref), v14 (ref)
                    local l_name_0 = v101[1].name;
                    if l_name_0 == nil then
                        l_name_0 = v96.DisplayName;
                    end;
                    v83(v11({
                        toastType = v14.FriendJoinedYou, 
                        joinerUserId = v96.UserId, 
                        joinerName = l_name_0
                    }));
                end);
            end;
        end;
    end;
    if l_FFlagEnablePartyNudgeAfterJoin_0 then
        l_useOneToOnePartyNudgeStartPartyRejected_0(function(v104) --[[ Line: 398 ]]
            -- upvalues: l_playersService_0 (copy), v103 (copy)
            if v104 and v104.inviterId then
                local l_l_playersService_0_PlayerByUserId_0 = l_playersService_0:GetPlayerByUserId(v104.inviterId);
                if l_l_playersService_0_PlayerByUserId_0 then
                    v103(l_l_playersService_0_PlayerByUserId_0);
                end;
            end;
        end);
    end;
    local v106 = nil;
    if l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0() then
        v106 = v2.useCallback(function(v107) --[[ Line: 410 ]]
            -- upvalues: v82 (copy), l_GetFIntMaxReferredPlayerJoinToasts_0 (ref), v83 (copy), v11 (ref), v14 (ref)
            if v82.current >= l_GetFIntMaxReferredPlayerJoinToasts_0() then
                return;
            else
                v82.current = v82.current + 1;
                v83(v11({
                    toastType = v14.InviteeJoinedYou, 
                    joinerUserId = v107.UserId, 
                    joinerName = v107.DisplayName
                }));
                return;
            end;
        end, {});
    end;
    v2.useEffect(function() --[[ Line: 425 ]]
        -- upvalues: l_FFlagEnablePartyNudgeAfterJoin_0 (ref), l_services_0 (copy), v80 (copy), v24 (ref), v77 (copy), l_playersService_0 (copy), v95 (copy), v79 (copy), v103 (copy), l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0 (ref), v25 (ref), v81 (copy), v106 (ref)
        local v108 = true;
        if l_FFlagEnablePartyNudgeAfterJoin_0 and l_services_0.showPlayerJoinedFriendsToastRemoteEvent then
            v108 = false;
            v80.current = l_services_0.showPlayerJoinedFriendsToastRemoteEvent.OnClientEvent:Connect(function() --[[ Line: 430 ]]
                -- upvalues: v108 (ref)
                v108 = true;
            end);
        end;
        task.delay(v24, function() --[[ Line: 438 ]]
            -- upvalues: v77 (ref), l_playersService_0 (ref), v108 (ref), v95 (ref), l_FFlagEnablePartyNudgeAfterJoin_0 (ref), l_services_0 (ref), v79 (ref), v103 (ref), l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0 (ref), v25 (ref), v81 (ref), v106 (ref)
            if not v77.current then
                if #l_playersService_0:GetPlayers() > 0 and v108 then
                    v95();
                end;
                if l_FFlagEnablePartyNudgeAfterJoin_0 then
                    if l_services_0.showFriendJoinedPlayerToastRemoteEvent then
                        v79.current = l_services_0.showFriendJoinedPlayerToastRemoteEvent.OnClientEvent:Connect(v103);
                    end;
                else
                    v79.current = l_playersService_0.PlayerAdded:Connect(v103);
                end;
                if l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0() and l_services_0.referredPlayerJoinRemoteEvent and v25() then
                    v81.current = l_services_0.referredPlayerJoinRemoteEvent.OnClientEvent:Connect(v106);
                end;
            end;
        end);
        return function() --[[ Line: 465 ]]
            -- upvalues: v77 (ref), v79 (ref), l_FFlagEnablePartyNudgeAfterJoin_0 (ref), v80 (ref), l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0 (ref), v81 (ref)
            v77.current = true;
            if v79.current then
                v79.current:disconnect();
            end;
            if l_FFlagEnablePartyNudgeAfterJoin_0 and v80.current then
                v80.current:disconnect();
            end;
            if l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0() and v81.current then
                v81.current:disconnect();
            end;
        end;
    end, {
        l_playersService_0, 
        v106, 
        l_services_0.referredPlayerJoinRemoteEvent, 
        if l_FFlagEnablePartyNudgeAfterJoin_0 then l_services_0.showFriendJoinedPlayerToastRemoteEvent else nil, 
        if l_FFlagEnablePartyNudgeAfterJoin_0 then l_services_0.showPlayerJoinedFriendsToastRemoteEvent else nil
    });
end;
return SocialContextToastDispatcher;