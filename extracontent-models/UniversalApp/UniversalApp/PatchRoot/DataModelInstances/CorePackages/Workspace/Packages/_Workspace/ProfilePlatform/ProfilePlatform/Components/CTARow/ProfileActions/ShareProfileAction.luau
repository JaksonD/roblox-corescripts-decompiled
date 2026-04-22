local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ButtonVariant_0 = require(l_Parent_0.Foundation).Enums.ButtonVariant;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_ProfileSharePolicyEnum_0 = require(l_Parent_0.ProfileShareLinks).Enums.ProfileSharePolicyEnum;
local v7 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v8 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v10 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return {
    [v8.ProfileActions.ShareProfile] = function(v11) --[[ Line: 23 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v8 (copy), v10 (copy), l_ProfileSharePolicyEnum_0 (copy), l_default_0 (copy), l_Contexts_0 (copy), l_SetCurrentToastMessage_0 (copy), v7 (copy)
        return {
            variant = l_ButtonVariant_0.Standard, 
            text = v11.localized[v8.ProfileActions.ShareProfile], 
            onActivated = function() --[[ Line: 27 ]] --[[ Name: onActivated ]]
                -- upvalues: v11 (copy), v10 (ref), l_ProfileSharePolicyEnum_0 (ref), l_default_0 (ref), l_Contexts_0 (ref), l_SetCurrentToastMessage_0 (ref), v7 (ref)
                v11.analytics.fireAnalyticsEvent(v10.CTAButtonShareProfile, {
                    buttonSurface = v11.buttonSurface
                });
                if v11.profileShareLink.policy == l_ProfileSharePolicyEnum_0.Disabled then
                    l_default_0:setClipboardText({
                        context = l_Contexts_0.ProfileCard, 
                        text = string.format("%s/%s", v11.PROFILE_SHARE_LINK_URL, v11.profileId)
                    });
                    v11.dispatch(l_SetCurrentToastMessage_0({
                        toastMessage = v7.LinkCopied
                    }));
                    return;
                else
                    v11.profileShareLink.onActivated();
                    return;
                end;
            end
        };
    end
};