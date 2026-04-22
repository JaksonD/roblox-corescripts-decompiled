local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v4 = require(l_script_FirstAncestor_0.Networking.NetworkingFriends);
local v5 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return {
    [v6.ProfileActions.IgnoreFriendRequest] = function(v9) --[[ Line: 16 ]]
        -- upvalues: v6 (copy), v8 (copy), v4 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), v5 (copy)
        return {
            text = v9.localized[v6.ProfileActions.IgnoreFriendRequest], 
            onActivated = function() --[[ Line: 19 ]] --[[ Name: onActivated ]]
                -- upvalues: v9 (copy), v8 (ref), v4 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v5 (ref)
                v9.analytics.fireAnalyticsEvent(v8.ContextualMenuButtonIgnoreFriendRequest, {
                    buttonSurface = v9.buttonSurface
                });
                return v9.dispatch(v4.DeclineFriendRequestFromUserId.API({
                    targetUserId = v9.profileId, 
                    currentUserId = v9.localUserId
                })):andThen(function() --[[ Line: 28 ]]
                    -- upvalues: v9 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v5 (ref)
                    v9.dispatch(l_SetCurrentToastMessage_0({
                        toastMessage = v9.localized.friendRequestIgnoredToast, 
                        toastIcon = l_Images_0["icons/actions/reject"], 
                        isLocalized = true
                    }));
                    return v9.dispatch(v5(v9.profileId));
                end);
            end
        };
    end
};