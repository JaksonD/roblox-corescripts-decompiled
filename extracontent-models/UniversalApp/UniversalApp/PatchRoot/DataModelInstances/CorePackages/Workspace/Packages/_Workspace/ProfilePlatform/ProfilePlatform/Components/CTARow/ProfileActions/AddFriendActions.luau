local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.SocialCommon);
local v6 = require(l_Parent_0.RobloxAppEnums);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_ContextualInfoTypes_0 = v5.Enums.ContextualInfoTypes;
local l_AppPage_0 = v6.AppPage;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v13 = require(l_script_FirstAncestor_0.Networking.NetworkingFriends);
local v14 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local v15 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatform);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local v17 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v19 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_FriendRequestNicknamesIXP_0 = require(l_Parent_0.FriendRequestNicknames).FriendRequestNicknamesIXP;
local l_USER_FRIENDING_ERRORS_0 = v16.USER_FRIENDING_ERRORS;
local l_STATUS_CODES_0 = v16.STATUS_CODES;
local function v32(v23, v24, v25) --[[ Line: 31 ]] --[[ Name: setErrorToast ]]
    -- upvalues: v17 (copy), l_STATUS_CODES_0 (copy), l_USER_FRIENDING_ERRORS_0 (copy), l_HttpService_0 (copy), l_SetCurrentToastMessage_0 (copy)
    local function v28(v26, v27) --[[ Line: 32 ]] --[[ Name: getErrorToastMessage ]]
        -- upvalues: v24 (copy), v17 (ref), l_STATUS_CODES_0 (ref), l_USER_FRIENDING_ERRORS_0 (ref), v23 (copy)
        if v24 == v17.ProfileActions.AddFriend or v24 == v17.ProfileActions.AddFriendFromContacts then
            if v26 == l_STATUS_CODES_0.BAD_REQUEST then
                return ({
                    [l_USER_FRIENDING_ERRORS_0.INVALID_TARGET_USER_ERROR] = v23.localized.invalidTargetUserError, 
                    [l_USER_FRIENDING_ERRORS_0.ALREADY_FRIEND_ERROR] = v23.localized.alreadyFriendError, 
                    [l_USER_FRIENDING_ERRORS_0.MAX_FRIENDS_ERROR] = v23.localized.maxFriendsError, 
                    [l_USER_FRIENDING_ERRORS_0.INVALID_NICKNAME_ERROR] = v23.localized.invalidNicknameError
                })[v27];
            elseif v26 == l_STATUS_CODES_0.UNAUTHORIZED then
                return ({
                    [l_USER_FRIENDING_ERRORS_0.UNAUTHORIZED_ERROR] = v23.localized.unauthorizedError
                })[v27];
            elseif v26 == l_STATUS_CODES_0.FORBIDDEN then
                return ({
                    [l_USER_FRIENDING_ERRORS_0.USER_BANNED_ERROR] = v23.localized.userBannedError, 
                    [l_USER_FRIENDING_ERRORS_0.USER_BLOCKED_ERROR] = v23.localized.userBlockedError, 
                    [l_USER_FRIENDING_ERRORS_0.USER_NOT_PASSED_CAPTCHA_ERROR] = v23.localized.userNotPassedCaptchaError
                })[v27];
            elseif v26 == l_STATUS_CODES_0.TOO_MANY_REQUESTS then
                return ({
                    [l_USER_FRIENDING_ERRORS_0.TOO_MANY_REQUESTS_ERROR] = v23.localized.tooManyRequestsError
                })[v27];
            end;
        end;
        return nil;
    end;
    if v25 ~= nil then
        local l_StatusCode_0 = v25.StatusCode;
        local v30 = if v25.Body then l_HttpService_0:JSONDecode(v25.Body) else nil;
        local v31 = v28(l_StatusCode_0, if v30 and v30.errors and v30.errors[1] and v30.errors[1].code then v30.errors[1].code else nil) or v23.localized.defaultFriendingError;
        v23.dispatch(l_SetCurrentToastMessage_0({
            toastMessage = v31, 
            isLocalized = true
        }));
        return;
    else
        v23.dispatch(l_SetCurrentToastMessage_0({
            toastMessage = v23.localized.defaultFriendingError, 
            isLocalized = true
        }));
        return;
    end;
end;
return {
    [v17.ProfileActions.AddFriend] = function(v33) --[[ Line: 83 ]]
        -- upvalues: v17 (copy), l_ButtonVariant_0 (copy), v19 (copy), l_FriendRequestNicknamesIXP_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), v13 (copy), v14 (copy), v32 (copy)
        return {
            text = v33.localized[v17.ProfileActions.AddFriend], 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = function() --[[ Line: 87 ]] --[[ Name: onActivated ]]
                -- upvalues: v33 (copy), v19 (ref), v17 (ref), l_FriendRequestNicknamesIXP_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v13 (ref), v14 (ref), v32 (ref)
                v33.analytics.fireAnalyticsEvent(v19.CTAButtonAddFriend, {
                    buttonSurface = v33.buttonSurface, 
                    absolutePosition = v33.profileWrapperContext.sourceInfo.homepageCarouselAbsolutePosition, 
                    isHomePageCarousel = v33.profileWrapperContext.sourceInfo.source == v17.Sources.HomepageFriendsCarousel, 
                    isRecommendation = v33.profileWrapperContext.sourceInfo.isRecommendation, 
                    source = v33.profileWrapperContext.sourceInfo.source, 
                    contextualInfoType = v33.profileWrapperContext.sourceInfo.contextualInfoType, 
                    recommendationContextType = v33.profileWrapperContext.sourceInfo.recommendationContextType, 
                    recommendationRank = v33.profileWrapperContext.sourceInfo.recommendationRank, 
                    recommendationSessionId = v33.profileWrapperContext.sourceInfo.recommendationSessionId
                });
                if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v33.friendRequestNicknamesEnabled then
                    return v33.dispatch(l_NavigateDown_0({
                        name = l_AppPage_0.SetNicknameModal, 
                        extraProps = {
                            friendRequestParams = {
                                targetUserId = v33.profileId, 
                                source = v33.profileWrapperContext.sourceInfo.friendshipOriginSourceType
                            }
                        }
                    }));
                else
                    v33.dispatch(l_SetCurrentToastMessage_0({
                        toastMessage = v33.localized.friendRequestSentToast, 
                        toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                        isLocalized = true
                    }));
                    return v33.dispatch(v13.RequestFriendshipFromUserId.API({
                        targetUserId = v33.profileId, 
                        currentUserId = v33.localUserId, 
                        friendshipOriginSourceType = v33.profileWrapperContext.sourceInfo.friendshipOriginSourceType
                    })):andThen(function() --[[ Line: 123 ]]
                        -- upvalues: v33 (ref), v14 (ref)
                        return v33.dispatch(v14(v33.profileId));
                    end):catch(function(v34) --[[ Line: 126 ]]
                        -- upvalues: v32 (ref), v33 (ref), v17 (ref)
                        v32(v33, v17.ProfileActions.AddFriend, v34);
                    end);
                end;
            end
        };
    end, 
    [v17.ProfileActions.AddFriendFromContacts] = function(v35) --[[ Line: 134 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v17 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), v13 (copy), l_ContextualInfoTypes_0 (copy), v15 (copy), v32 (copy)
        return {
            variant = l_ButtonVariant_0.Emphasis, 
            text = v35.localized[v17.ProfileActions.AddFriendFromContacts], 
            onActivated = function() --[[ Line: 138 ]] --[[ Name: onActivated ]]
                -- upvalues: v35 (copy), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v13 (ref), l_ContextualInfoTypes_0 (ref), v15 (ref), v17 (ref), v32 (ref)
                v35.dispatch(l_SetCurrentToastMessage_0({
                    toastMessage = v35.localized.friendRequestSentToast, 
                    toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                    isLocalized = true
                }));
                return v35.dispatch(v13.RequestFriendshipFromContactId.API({
                    currentUserId = v35.localUserId, 
                    contactId = v35.profileId, 
                    contextType = l_ContextualInfoTypes_0.Contacts
                })):andThen(function() --[[ Line: 150 ]]
                    -- upvalues: v35 (ref), v15 (ref), v17 (ref)
                    return v35.dispatch(v15({
                        profileType = v35.profileType, 
                        profileId = v35.profileId, 
                        components = {
                            v17.Components.ContactProfileHeader, 
                            v17.Components.Actions, 
                            v17.Components.ContactDescription
                        }
                    }));
                end):catch(function(v36) --[[ Line: 161 ]]
                    -- upvalues: v32 (ref), v35 (ref), v17 (ref)
                    v32(v35, v17.ProfileActions.AddFriendFromContacts, v36);
                end);
            end
        };
    end, 
    [v17.ProfileActions.AddFriendFromContactsSent] = function(v37) --[[ Line: 168 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v17 (copy)
        return {
            variant = l_ButtonVariant_0.Subtle, 
            text = v37.localized[v17.ProfileActions.AddFriendFromContactsSent], 
            onActivated = function() --[[ Line: 172 ]] --[[ Name: onActivated ]]

            end, 
            isDisabled = true
        };
    end, 
    [v17.ProfileActions.CannotAddFriend] = function(v38) --[[ Line: 177 ]]
        -- upvalues: v17 (copy)
        return {
            text = v38.localized[v17.ProfileActions.CannotAddFriend], 
            onActivated = function() --[[ Line: 180 ]] --[[ Name: onActivated ]]

            end, 
            isDisabled = true
        };
    end
};