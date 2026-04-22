local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RobloxAppEnums);
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Images_0 = v3.App.ImageSet.Images;
local l_AppPage_0 = v4.AppPage;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v9 = require(l_script_FirstAncestor_0.Networking.myUserBlockingNetworking);
local v10 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local v11 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v13 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage);
local l_USER_BLOCKING_ERRORS_0 = v14.USER_BLOCKING_ERRORS;
return {
    [v11.ProfileActions.Block] = function(v17) --[[ Line: 26 ]]
        -- upvalues: v11 (copy), v13 (copy), l_AppPage_0 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), v10 (copy)
        return {
            text = v17.localized[v11.ProfileActions.Block], 
            onActivated = function() --[[ Line: 29 ]] --[[ Name: onActivated ]]
                -- upvalues: v17 (copy), v13 (ref), l_AppPage_0 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v10 (ref)
                v17.analytics.fireAnalyticsEvent(v13.ContextualMenuButtonBlock, {
                    buttonSurface = v17.buttonSurface
                });
                v17.navigation.push(l_AppPage_0.BlockingModal, {
                    navProps = {
                        userId = v17.profileId, 
                        onBlockSuccess = function() --[[ Line: 36 ]] --[[ Name: onBlockSuccess ]]
                            -- upvalues: v17 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v10 (ref)
                            v17.dispatch(l_SetCurrentToastMessage_0({
                                toastMessage = v17.localized.userBlockedToast, 
                                toastIcon = l_Images_0["icons/actions/block"], 
                                isLocalized = true
                            }));
                            v17.dispatch(v10(v17.profileId));
                        end
                    }
                });
            end
        };
    end, 
    [v11.ProfileActions.Unblock] = function(v18) --[[ Line: 51 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v11 (copy), v13 (copy), v9 (copy), v10 (copy), l_USER_BLOCKING_ERRORS_0 (copy), l_SetCurrentToastMessage_0 (copy), v15 (copy)
        return {
            variant = l_ButtonVariant_0.Standard, 
            text = v18.localized[v11.ProfileActions.Unblock], 
            onActivated = function() --[[ Line: 55 ]] --[[ Name: onActivated ]]
                -- upvalues: v18 (copy), v13 (ref), v9 (ref), v10 (ref), l_USER_BLOCKING_ERRORS_0 (ref), l_SetCurrentToastMessage_0 (ref), v15 (ref)
                v18.analytics.fireAnalyticsEvent(v13.CTAButtonUnblock, {
                    buttonSurface = v18.buttonSurface
                });
                return v18.dispatch(v9.UnblockUserById.API({
                    userId = v18.profileId, 
                    currentUserId = v18.localUserId
                })):andThen(function() --[[ Line: 64 ]]
                    -- upvalues: v18 (ref), v10 (ref)
                    return v18.dispatch(v10(v18.profileId));
                end):catch(function(v19) --[[ Line: 67 ]]
                    -- upvalues: l_USER_BLOCKING_ERRORS_0 (ref), v18 (ref), l_SetCurrentToastMessage_0 (ref), v15 (ref)
                    if v19 ~= nil and tonumber(v19.Body) == l_USER_BLOCKING_ERRORS_0.PARENT_BLOCKED_TARGET_USER_ERROR then
                        v18.dispatch(l_SetCurrentToastMessage_0({
                            toastMessage = v18.localized.unblockTargetParentManagedToast, 
                            isLocalized = true
                        }));
                        return;
                    elseif v19 ~= nil and tonumber(v19.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
                        v18.dispatch(l_SetCurrentToastMessage_0({
                            toastMessage = v18.localized.unblockTargetNotBlockedToast, 
                            isLocalized = true
                        }));
                        return;
                    elseif v15 and v19 ~= nil and tonumber(v19.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
                        v18.dispatch(l_SetCurrentToastMessage_0({
                            toastMessage = v18.localized.blockedOnPlatformToast, 
                            isLocalized = true
                        }));
                        return;
                    else
                        v18.dispatch(l_SetCurrentToastMessage_0({
                            toastMessage = v18.localized.somethingIsWrongToast, 
                            isLocalized = true
                        }));
                        return;
                    end;
                end);
            end
        };
    end
};