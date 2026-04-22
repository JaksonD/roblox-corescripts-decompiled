local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v6 = require(l_script_FirstAncestor_0.Networking.NetworkingFriends);
local v7 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local v8 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v10 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return {
    [v8.ProfileActions.AcceptFriendRequest] = function(v11) --[[ Line: 18 ]]
        -- upvalues: v8 (copy), l_ButtonVariant_0 (copy), v10 (copy), v6 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), v7 (copy)
        return {
            text = v11.localized[v8.ProfileActions.AcceptFriendRequest], 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = function() --[[ Line: 22 ]] --[[ Name: onActivated ]]
                -- upvalues: v11 (copy), v10 (ref), v8 (ref), v6 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v7 (ref)
                v11.analytics.fireAnalyticsEvent(v10.CTAButtonAcceptFriendRequest, {
                    buttonSurface = v11.buttonSurface, 
                    absolutePosition = v11.profileWrapperContext.sourceInfo.homepageCarouselAbsolutePosition, 
                    isHomePageCarousel = v11.profileWrapperContext.sourceInfo.source == v8.Sources.HomepageFriendsCarousel, 
                    isRecommendation = v11.profileWrapperContext.sourceInfo.isRecommendation, 
                    source = v11.profileWrapperContext.sourceInfo.source, 
                    contextualInfoType = v11.profileWrapperContext.sourceInfo.contextualInfoType, 
                    recommendationContextType = v11.profileWrapperContext.sourceInfo.recommendationContextType, 
                    recommendationRank = v11.profileWrapperContext.sourceInfo.recommendationRank, 
                    recommendationSessionId = v11.profileWrapperContext.sourceInfo.recommendationSessionId
                });
                return v11.dispatch(v6.AcceptFriendRequestFromUserId.API({
                    targetUserId = v11.profileId, 
                    currentUserId = v11.localUserId
                })):andThen(function() --[[ Line: 40 ]]
                    -- upvalues: v11 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v7 (ref)
                    v11.dispatch(l_SetCurrentToastMessage_0({
                        toastMessage = v11.localized.friendAcceptedToast, 
                        toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                        isLocalized = true
                    }));
                    return v11.dispatch(v7(v11.profileId));
                end);
            end
        };
    end, 
    [v8.ProfileActions.AcceptOffNetworkFriendRequest] = function(v12) --[[ Line: 52 ]]
        -- upvalues: v8 (copy), v10 (copy), v6 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), v7 (copy)
        return {
            text = v12.localized[v8.ProfileActions.AcceptOffNetworkFriendRequest], 
            onActivated = function() --[[ Line: 55 ]] --[[ Name: onActivated ]]
                -- upvalues: v12 (copy), v10 (ref), v6 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v7 (ref)
                v12.analytics.fireAnalyticsEvent(v10.CTAButtonAddFriendFromContacts, {
                    shareLinkId = v12.profileWrapperContext.sourceInfo.shareLinkId
                });
                return v12.dispatch(v6.AcceptFriendRequestWithToken.API({
                    targetUserId = v12.profileId, 
                    currentUserId = v12.localUserId, 
                    friendingToken = v12.profileWrapperContext.offNetworkFriendRequestToken
                })):andThen(function() --[[ Line: 65 ]]
                    -- upvalues: v12 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v7 (ref)
                    v12.dispatch(l_SetCurrentToastMessage_0({
                        toastMessage = v12.localized.friendAcceptedToast, 
                        toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                        isLocalized = true
                    }));
                    return v12.dispatch(v7(v12.profileId));
                end);
            end
        };
    end
};