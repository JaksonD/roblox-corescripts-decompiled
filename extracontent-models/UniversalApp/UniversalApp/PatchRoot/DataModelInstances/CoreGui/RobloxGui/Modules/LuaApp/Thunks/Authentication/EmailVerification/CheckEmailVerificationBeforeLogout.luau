local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.CheckEmailVerification);
local v2 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v3 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableUpdatedLogoutUpsellModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUpdatedLogoutUpsellModal;
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagEmailUpsellIncludePrivacyPolicy);
return function(v8, v9, v10) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v7 (copy), l_FFlagEnableUpdatedLogoutUpsellModal_0 (copy), v1 (copy)
    return function(v11) --[[ Line: 16 ]]
        -- upvalues: v10 (copy), v3 (ref), v2 (ref), v8 (copy), v9 (copy), v4 (ref), v7 (ref), l_FFlagEnableUpdatedLogoutUpsellModal_0 (ref), v1 (ref)
        local v12 = {
            addEmailOver13TextKey = "Feature.VerificationUpsell.Description.LogoutAddEmailTextOver13", 
            addEmailUnder13TextKey = v10.getRenameParentEmailForVerificationUpsell() and "Feature.VerificationUpsell.Description.LogoutAddEmailTextUnder13V2" or "Feature.VerificationUpsell.Description.LogoutAddEmailTextUnder13", 
            addEmailTitleKey = "Feature.VerificationUpsell.Heading.VerifyOnLogout", 
            updateEmailSecondaryButtonText = "Feature.VerificationUpsell.Action.Logout", 
            origin = "logout", 
            onUpdateEmailSecondaryButtonPressedEvent = v3.Button.SkipLogOutAnyway, 
            onUpdateEmailSecondaryButtonPressed = function() --[[ Line: 26 ]] --[[ Name: onUpdateEmailSecondaryButtonPressed ]]
                -- upvalues: v11 (copy), v2 (ref), v8 (ref), v9 (ref), v4 (ref)
                v11:dispatch(v2(v8, v9, v4.EmailUpsellLogOut));
            end
        };
        if v7() then
            v12.emailUpsellLockedIsLocalUserUnder13 = v11:getState().IsLocalUserUnder13;
        end;
        if l_FFlagEnableUpdatedLogoutUpsellModal_0 then
            v12.addEmailTitleKey = "Feature.VerificationUpsell.Heading.FinishAccountSetup";
            v12.addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.AddParentalEmail";
            v12.updateEmailPrimaryButtonText = "Feature.VerificationUpsell.Action.Logout";
            v12.useUpdatedModalDesign = true;
        end;
        return v11:dispatch(v1(v8, true, v12));
    end;
end;