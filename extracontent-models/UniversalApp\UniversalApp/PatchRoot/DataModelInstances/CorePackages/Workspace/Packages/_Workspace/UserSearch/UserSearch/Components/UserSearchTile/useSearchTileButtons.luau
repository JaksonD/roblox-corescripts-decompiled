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
return function(v23, v24) --[[ Line: 49 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), v7 (copy), l_FriendRequestNicknamesIXP_0 (copy), l_useStyle_0 (copy), l_useJoinUserInExperience_0 (copy), l_Contexts_0 (copy), l_Images_0 (copy), v19 (copy), l_FFlagUserSearchAddFocusActionsSupport_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v12 (copy), l_SetCurrentToastMessage_0 (copy), v8 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Enums_0 (copy)
    local v25 = l_useLocalUserId_0();
    local v26 = l_useDispatch_0();
    local v27 = v7(v23.userId);
    local v28 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
    local v29 = l_useStyle_0();
    local v30 = l_useJoinUserInExperience_0(v23.userId, {
        analyticProps = {
            context = l_Contexts_0.PlayerSearch, 
            subpage = v23.subpage
        }
    });
    local v31 = if v23.shouldUseCompactTiles then l_Images_0["icons/common/plus_small"] else l_Images_0["icons/actions/friends/friendAdd"];
    local v32 = if v23.shouldUseCompactTiles then l_Images_0["icons/common/plus_small"] else l_Images_0["icons/actions/friends/friendpending"];
    local v33 = l_Images_0["icons/common/play"];
    if v27.status == Enum.FriendStatus.Friend and v23.shouldUseCompactTiles and v19.isUserInGame(v23.userPresence) then
        return {
            {
                icon = v33, 
                isSecondary = false, 
                isDisabled = v30.isLoading, 
                onActivated = function() --[[ Line: 82 ]] --[[ Name: onActivated ]]
                    -- upvalues: v30 (copy)
                    v30.joinExperience();
                end, 
                imageColor = v29.Theme.ContextualPrimaryContent.Color, 
                backgroundColor = v29.Theme.OnlineStatus.Color, 
                focusEventName = if l_FFlagUserSearchAddFocusActionsSupport_0 and v23.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.HoldToPlay else nil
            }
        };
    elseif v27.isMyself or v27.status == Enum.FriendStatus.Friend then
        return nil;
    elseif v27.status == Enum.FriendStatus.FriendRequestReceived then
        return {
            {
                icon = v31, 
                isSecondary = false, 
                isDisabled = false, 
                focusEventName = if l_FFlagUserSearchAddFocusActionsSupport_0 and v23.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest else nil, 
                onActivated = function() --[[ Line: 106 ]] --[[ Name: onActivated ]]
                    -- upvalues: v26 (copy), v12 (ref), v23 (copy), v25 (copy), l_SetCurrentToastMessage_0 (ref), v24 (copy), v8 (ref)
                    v26(v12.AcceptFriendRequestFromUserId.API({
                        targetUserId = v23.userId, 
                        currentUserId = v25
                    })):andThen(function() --[[ Line: 111 ]]
                        -- upvalues: v26 (ref), l_SetCurrentToastMessage_0 (ref)
                        v26(l_SetCurrentToastMessage_0({
                            toastMessage = "Feature.Friends.Action.ConnectionAdded"
                        }));
                    end):catch(function() --[[ Line: 116 ]]
                        -- upvalues: v26 (ref), l_SetCurrentToastMessage_0 (ref)
                        v26(l_SetCurrentToastMessage_0({
                            toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                        }));
                    end);
                    if v24 then
                        v24(v8.PlayerFriendAccept);
                    end;
                end
            }
        };
    elseif v27.status == Enum.FriendStatus.FriendRequestSent then
        return {
            {
                icon = v32, 
                isSecondary = false, 
                isDisabled = true, 
                onActivated = v2.noop()
            }
        };
    elseif not v27.status or v27.status == Enum.FriendStatus.NotFriend then
        return {
            {
                icon = v31, 
                isSecondary = false, 
                isDisabled = false, 
                focusEventName = if l_FFlagUserSearchAddFocusActionsSupport_0 and v23.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest else nil, 
                onActivated = function() --[[ Line: 145 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_FriendRequestNicknamesIXP_0 (ref), v28 (copy), v24 (copy), v8 (ref), v26 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v23 (copy), l_Enums_0 (ref), v12 (ref), v25 (copy), l_SetCurrentToastMessage_0 (ref)
                    if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v28 then
                        if v24 then
                            v24(v8.PlayerFriendRequest);
                        end;
                        v26(l_NavigateDown_0({
                            name = l_AppPage_0.SetNicknameModal, 
                            extraProps = {
                                friendRequestParams = {
                                    targetUserId = v23.userId, 
                                    source = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
                                }
                            }
                        }));
                        return;
                    else
                        v26(v12.RequestFriendshipFromUserId.API({
                            targetUserId = v23.userId, 
                            currentUserId = v25, 
                            friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
                        })):andThen(function() --[[ Line: 165 ]]
                            -- upvalues: v26 (ref), l_SetCurrentToastMessage_0 (ref)
                            v26(l_SetCurrentToastMessage_0({
                                toastMessage = "Feature.Friends.Action.ConnectionRequestSent"
                            }));
                        end):catch(function() --[[ Line: 170 ]]
                            -- upvalues: v26 (ref), l_SetCurrentToastMessage_0 (ref)
                            v26(l_SetCurrentToastMessage_0({
                                toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                            }));
                        end);
                        if v24 then
                            v24(v8.PlayerFriendRequest);
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