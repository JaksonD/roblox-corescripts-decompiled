local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.dependencies);
local v4 = require(l_Parent_0.Common.TextKeys);
local l_FriendshipOriginSourceType_0 = v3.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v6 = require(l_Parent_1.SocialCommon);
local l_Images_0 = v3.UIBlox.App.ImageSet.Images;
local l_React_0 = v3.React;
local l_useDispatch_0 = v3.Hooks.useDispatch;
local l_useSelector_0 = v3.Hooks.useSelector;
local l_NetworkingFriends_0 = v3.NetworkingFriends;
local l_NetworkStatus_0 = v3.RoduxNetworking.Enum.NetworkStatus;
local l_RoduxFriends_0 = v3.RoduxFriends;
local l_getDeepValue_0 = v3.SocialLibraries.Dictionary.getDeepValue;
local l_EventNames_0 = require(l_Parent_0.Analytics).EventNames;
local l_ContextualInfoTypes_0 = v6.Enums.ContextualInfoTypes;
local v17 = require(l_Parent_0.Flags.getFFlagPYMKDisableButtonsOnFetch);
local l_FriendRequestNicknamesIXP_0 = require(l_Parent_1.FriendRequestNicknames).FriendRequestNicknamesIXP;
local l_AppPage_0 = require(l_Parent_1.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_1.NavigationRodux).Thunks.NavigateDown;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_1.FocusNavigationUtils).FocusNavigationEventNameEnum;
local _ = require(l_Parent_1.UserList);
local l_FFlagHomepagePYMKPresenceAnalytics_0 = require(l_Parent_1.SharedFlags).FFlagHomepagePYMKPresenceAnalytics;
local l_FFlagLuaAppPymkFriendRequestSchemaFields_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppPymkFriendRequestSchemaFields;
local l_FFlagHomepagePYMKUseHorizontalUserList_0 = require(l_Parent_1.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList;
local function _(v26, v27, v28) --[[ Line: 57 ]]
    -- upvalues: l_NetworkStatus_0 (copy)
    return v27.getStatus(v26, v28) == l_NetworkStatus_0.Fetching;
end;
return function(v30) --[[ Line: 61 ]] --[[ Name: usePYMKCarouselUserButtons ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), l_RoduxFriends_0 (copy), l_getDeepValue_0 (copy), l_FriendRequestNicknamesIXP_0 (copy), v17 (copy), l_NetworkingFriends_0 (copy), l_NetworkStatus_0 (copy), l_React_0 (copy), l_Images_0 (copy), l_FFlagHomepagePYMKUseHorizontalUserList_0 (copy), l_EventNames_0 (copy), l_FFlagHomepagePYMKPresenceAnalytics_0 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_FFlagLuaAppPymkFriendRequestSchemaFields_0 (copy), l_HttpService_0 (copy), l_ContextualInfoTypes_0 (copy), l_FriendshipOriginSourceType_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v31 = tostring(v30.userId);
    local v32 = l_useDispatch_0();
    local v34 = l_useSelector_0(function(v33) --[[ Line: 65 ]]
        return (tostring(v33.LocalUserId));
    end);
    local v36 = l_useSelector_0(function(v35) --[[ Line: 68 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v31 (copy)
        return l_RoduxFriends_0.Selectors.selectFriendshipStatusesByUserIds(v35)({
            v31
        })[v31] or nil;
    end);
    local v38 = l_useSelector_0(function(v37) --[[ Line: 72 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v34 (copy), v31 (copy)
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v37)(v34)[v31] or {};
    end);
    local v40 = l_useSelector_0(function(v39) --[[ Line: 76 ]]
        -- upvalues: l_getDeepValue_0 (ref), v31 (copy)
        return l_getDeepValue_0(v39, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v31)) or false;
    end);
    local v41 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
    local v46 = if v17() then l_useSelector_0(function(v42) --[[ Line: 86 ]]
        -- upvalues: l_NetworkingFriends_0 (ref), v31 (copy), l_NetworkStatus_0 (ref)
        local v43 = {};
        local l_RequestFriendshipFromUserId_0 = l_NetworkingFriends_0.RequestFriendshipFromUserId;
        local l_v31_0 = v31;
        v43.RequestFriendshipFromUserId = l_RequestFriendshipFromUserId_0.getStatus(v42, l_v31_0) == l_NetworkStatus_0.Fetching;
        l_RequestFriendshipFromUserId_0 = l_NetworkingFriends_0.AcceptFriendRequestFromUserId;
        l_v31_0 = v31;
        v43.AcceptFriendRequestFromUserId = l_RequestFriendshipFromUserId_0.getStatus(v42, l_v31_0) == l_NetworkStatus_0.Fetching;
        return v43;
    end) else nil;
    local v48 = l_React_0.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: v36 (copy), l_Images_0 (ref), l_FFlagHomepagePYMKUseHorizontalUserList_0 (ref), v40 (copy), v17 (ref), v46 (copy), v30 (copy), l_EventNames_0 (ref), v38 (copy), v31 (copy), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), v32 (copy), l_NetworkingFriends_0 (ref), v34 (copy), v4 (ref), l_FocusNavigationEventNameEnum_0 (ref), l_FFlagLuaAppPymkFriendRequestSchemaFields_0 (ref), l_HttpService_0 (ref), l_ContextualInfoTypes_0 (ref), l_FriendshipOriginSourceType_0 (ref), l_FriendRequestNicknamesIXP_0 (ref), v41 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if v36 == Enum.FriendStatus.FriendRequestSent then
            return {
                {
                    icon = l_Images_0["icons/actions/friends/friendpending"], 
                    isSecondary = true, 
                    isDisabled = true, 
                    onActivated = l_FFlagHomepagePYMKUseHorizontalUserList_0 and function() --[[ Line: 110 ]]

                    end or nil, 
                    isLoading = not l_FFlagHomepagePYMKUseHorizontalUserList_0 and nil, 
                    buttonType = l_FFlagHomepagePYMKUseHorizontalUserList_0 and "Pending" or nil, 
                    focusEvent = nil
                }
            };
        elseif v40 then
            return {
                {
                    icon = l_Images_0["icons/actions/friends/friendAdd"], 
                    isSecondary = false, 
                    isDisabled = if v17() then if v46 then v46.AcceptFriendRequestFromUserId else false else false, 
                    onActivated = function() --[[ Line: 124 ]] --[[ Name: onActivated ]]
                        -- upvalues: v30 (ref), l_EventNames_0 (ref), v38 (ref), v31 (ref), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), v32 (ref), l_NetworkingFriends_0 (ref), v34 (ref), v4 (ref)
                        v30.fireAnalyticsEvent(l_EventNames_0.AcceptFriendship, {
                            recommendationContextType = v38.contextType, 
                            requestedId = v31, 
                            recommendationRank = v38.rank, 
                            absolutePosition = v30.absolutePosition, 
                            presence = if l_FFlagHomepagePYMKPresenceAnalytics_0 then v30.userPresenceType else nil
                        });
                        v32(l_NetworkingFriends_0.AcceptFriendRequestFromUserId.API({
                            currentUserId = v34, 
                            targetUserId = v31
                        })):andThen(function() --[[ Line: 136 ]]
                            -- upvalues: v30 (ref), v4 (ref)
                            v30.showToast(v4.ConnectionAddedToast);
                        end):catch(function() --[[ Line: 139 ]]
                            -- upvalues: v30 (ref), v4 (ref)
                            v30.showToast(v4.SomethingIsWrongToast);
                        end);
                    end, 
                    isLoading = if l_FFlagHomepagePYMKUseHorizontalUserList_0 then if v46 then v46.AcceptFriendRequestFromUserId else false else nil, 
                    buttonType = l_FFlagHomepagePYMKUseHorizontalUserList_0 and "Accept" or nil, 
                    focusEvent = if l_FFlagHomepagePYMKUseHorizontalUserList_0 then l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest else nil
                }
            };
        elseif not v36 or v36 == Enum.FriendStatus.NotFriend then
            return {
                {
                    icon = l_Images_0["icons/actions/friends/friendAdd"], 
                    isSecondary = false, 
                    isDisabled = if v17() then if v46 then v46.RequestFriendshipFromUserId else false else false, 
                    onActivated = function() --[[ Line: 160 ]] --[[ Name: onActivated ]]
                        -- upvalues: v30 (ref), l_EventNames_0 (ref), v38 (ref), v31 (ref), l_FFlagLuaAppPymkFriendRequestSchemaFields_0 (ref), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), l_HttpService_0 (ref), l_NetworkingFriends_0 (ref), v34 (ref), l_ContextualInfoTypes_0 (ref), l_FriendshipOriginSourceType_0 (ref), l_FriendRequestNicknamesIXP_0 (ref), v41 (ref), v32 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v4 (ref)
                        v30.fireAnalyticsEvent(l_EventNames_0.RequestFriendship, {
                            recommendationContextType = v38.contextType, 
                            requestedId = v31, 
                            contactId = v30.contactId, 
                            recommendationRank = v38.rank, 
                            absolutePosition = v30.absolutePosition, 
                            positionInRow = if l_FFlagLuaAppPymkFriendRequestSchemaFields_0 then v30.absolutePosition else nil, 
                            presence = if l_FFlagHomepagePYMKPresenceAnalytics_0 then v30.userPresenceType else nil, 
                            interactionUuid = if l_FFlagLuaAppPymkFriendRequestSchemaFields_0 then l_HttpService_0:GenerateGUID(false) else nil
                        });
                        local v47 = if v30.contactId then l_NetworkingFriends_0.RequestFriendshipFromContactId.API({
                            currentUserId = v34, 
                            targetUserId = v31, 
                            contactId = v30.contactId, 
                            contextType = l_ContextualInfoTypes_0.Contacts, 
                            friendshipOriginSourceType = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue()
                        }) else l_NetworkingFriends_0.RequestFriendshipFromUserId.API({
                            currentUserId = v34, 
                            targetUserId = v31, 
                            friendshipOriginSourceType = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue()
                        });
                        if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v41 and not v30.contactId then
                            v32(l_NavigateDown_0({
                                name = l_AppPage_0.SetNicknameModal, 
                                extraProps = {
                                    friendRequestParams = {
                                        targetUserId = v31, 
                                        source = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue()
                                    }
                                }
                            }));
                            return;
                        else
                            v32(v47):andThen(function() --[[ Line: 205 ]]
                                -- upvalues: v30 (ref), v4 (ref)
                                v30.showToast(v4.ConnectionRequestSentToast);
                            end):catch(function() --[[ Line: 208 ]]
                                -- upvalues: v30 (ref), v4 (ref)
                                v30.showToast(v4.SomethingIsWrongToast);
                            end);
                            return;
                        end;
                    end, 
                    isLoading = if l_FFlagHomepagePYMKUseHorizontalUserList_0 then if v46 then v46.RequestFriendshipFromUserId else false else nil, 
                    buttonType = l_FFlagHomepagePYMKUseHorizontalUserList_0 and "Add" or nil, 
                    focusEvent = if l_FFlagHomepagePYMKUseHorizontalUserList_0 then l_FocusNavigationEventNameEnum_0.HoldToAddFriend else nil
                }
            };
        else
            return {};
        end;
    end, {
        v36, 
        v31, 
        v41, 
        v40, 
        v38, 
        v34, 
        v32, 
        if l_FFlagHomepagePYMKPresenceAnalytics_0 then v30.userPresenceType else nil
    });
    return l_React_0.useCallback(function() --[[ Line: 238 ]]
        -- upvalues: v48 (copy)
        return v48;
    end, {
        v48
    });
end;