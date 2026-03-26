local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v7 = require(script.Parent.useRelationshipSelector);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v11 = require(l_Parent_0.RoactUtils);
local v12 = require(l_script_FirstAncestor_0.Networking.FriendsNetworking);
local l_Enums_0 = require(l_Parent_0.FriendsNetworking).Enums;
local l_useJoinUserInExperience_0 = require(l_Parent_0.SocialExperienceJoin).useJoinUserInExperience;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v19 = require(l_script_FirstAncestor_0.Utils.PresenceHelpers);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_FriendRequestNicknamesIXP_0 = require(l_Parent_0.FriendRequestNicknames).FriendRequestNicknamesIXP;
local l_FFlagUserSearchAddFocusActionsSupport_0 = require(l_Parent_0.SharedFlags).FFlagUserSearchAddFocusActionsSupport;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return function(v24, v25) --[[ Line: 52 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), v7 (copy), l_FriendRequestNicknamesIXP_0 (copy), l_useStyle_0 (copy), l_useJoinUserInExperience_0 (copy), l_Contexts_0 (copy), l_Images_0 (copy), v19 (copy), l_FFlagUserSearchAddFocusActionsSupport_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v12 (copy), l_SetCurrentToastMessage_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v8 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Enums_0 (copy)
    local v26 = l_useLocalUserId_0();
    local v27 = l_useDispatch_0();
    local v28 = v7(v24.userId);
    local v29 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
    local v30 = l_useStyle_0();
    local v31 = l_useJoinUserInExperience_0(v24.userId, {
        analyticProps = {
            context = l_Contexts_0.PlayerSearch, 
            subpage = v24.subpage
        }
    });
    local v32 = if v24.shouldUseCompactTiles then l_Images_0["icons/common/plus_small"] else l_Images_0["icons/actions/friends/friendAdd"];
    local v33 = if v24.shouldUseCompactTiles then l_Images_0["icons/common/plus_small"] else l_Images_0["icons/actions/friends/friendpending"];
    local v34 = l_Images_0["icons/common/play"];
    if v28.status == Enum.FriendStatus.Friend and v24.shouldUseCompactTiles and v19.isUserInGame(v24.userPresence) then
        return {
            {
                icon = v34, 
                isSecondary = false, 
                isDisabled = v31.isLoading, 
                onActivated = function() --[[ Line: 85 ]] --[[ Name: onActivated ]]
                    -- upvalues: v31 (copy)
                    v31.joinExperience();
                end, 
                imageColor = v30.Theme.ContextualPrimaryContent.Color, 
                backgroundColor = v30.Theme.OnlineStatus.Color, 
                focusEventName = if l_FFlagUserSearchAddFocusActionsSupport_0 and v24.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.HoldToPlay else nil
            }
        };
    elseif v28.isMyself or v28.status == Enum.FriendStatus.Friend then
        return nil;
    elseif v28.status == Enum.FriendStatus.FriendRequestReceived then
        return {
            {
                icon = v32, 
                isSecondary = false, 
                isDisabled = false, 
                focusEventName = if l_FFlagUserSearchAddFocusActionsSupport_0 and v24.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest else nil, 
                onActivated = function() --[[ Line: 109 ]] --[[ Name: onActivated ]]
                    -- upvalues: v27 (copy), v12 (ref), v24 (copy), v26 (copy), l_SetCurrentToastMessage_0 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v25 (copy), v8 (ref)
                    v27(v12.AcceptFriendRequestFromUserId.API({
                        targetUserId = v24.userId, 
                        currentUserId = v26
                    })):andThen(function() --[[ Line: 114 ]]
                        -- upvalues: v27 (ref), l_SetCurrentToastMessage_0 (ref), l_FFlagConnectionsToFriendsRename_0 (ref)
                        v27(l_SetCurrentToastMessage_0({
                            toastMessage = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendAdded" or "Feature.Friends.Action.ConnectionAdded"
                        }));
                    end):catch(function() --[[ Line: 121 ]]
                        -- upvalues: v27 (ref), l_SetCurrentToastMessage_0 (ref)
                        v27(l_SetCurrentToastMessage_0({
                            toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                        }));
                    end);
                    if v25 then
                        v25(v8.PlayerFriendAccept);
                    end;
                end
            }
        };
    elseif v28.status == Enum.FriendStatus.FriendRequestSent then
        return {
            {
                icon = v33, 
                isSecondary = false, 
                isDisabled = true, 
                onActivated = v2.noop()
            }
        };
    elseif not v28.status or v28.status == Enum.FriendStatus.NotFriend then
        return {
            {
                icon = v32, 
                isSecondary = false, 
                isDisabled = false, 
                focusEventName = if l_FFlagUserSearchAddFocusActionsSupport_0 and v24.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest else nil, 
                onActivated = function() --[[ Line: 150 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_FriendRequestNicknamesIXP_0 (ref), v29 (copy), v25 (copy), v8 (ref), v27 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v24 (copy), l_Enums_0 (ref), v12 (ref), v26 (copy), l_SetCurrentToastMessage_0 (ref), l_FFlagConnectionsToFriendsRename_0 (ref)
                    if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v29 then
                        if v25 then
                            v25(v8.PlayerFriendRequest);
                        end;
                        v27(l_NavigateDown_0({
                            name = l_AppPage_0.SetNicknameModal, 
                            extraProps = {
                                friendRequestParams = {
                                    targetUserId = v24.userId, 
                                    source = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
                                }
                            }
                        }));
                        return;
                    else
                        v27(v12.RequestFriendshipFromUserId.API({
                            targetUserId = v24.userId, 
                            currentUserId = v26, 
                            friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
                        })):andThen(function() --[[ Line: 170 ]]
                            -- upvalues: v27 (ref), l_SetCurrentToastMessage_0 (ref), l_FFlagConnectionsToFriendsRename_0 (ref)
                            v27(l_SetCurrentToastMessage_0({
                                toastMessage = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendRequestSent" or "Feature.Friends.Action.ConnectionRequestSent"
                            }));
                        end):catch(function() --[[ Line: 177 ]]
                            -- upvalues: v27 (ref), l_SetCurrentToastMessage_0 (ref)
                            v27(l_SetCurrentToastMessage_0({
                                toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                            }));
                        end);
                        if v25 then
                            v25(v8.PlayerFriendRequest);
                        end;
                        return;
                    end;
                end
            }
        };
    else
        return nil;
    end;
end;