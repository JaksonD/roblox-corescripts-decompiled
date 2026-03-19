local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.CheckEmailVerification);
local v2 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v3 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableUpdatedLogoutUpsellModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUpdatedLogoutUpsellModal;
return function(v7, v8, v9) --[[ Line: 14 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), l_FFlagEnableUpdatedLogoutUpsellModal_0 (copy), v1 (copy)
    return function(v10) --[[ Line: 15 ]]
        -- upvalues: v9 (copy), v3 (ref), v2 (ref), v7 (copy), v8 (copy), v4 (ref), l_FFlagEnableUpdatedLogoutUpsellModal_0 (ref), v1 (ref)
        local v11 = {
            addEmailOver13TextKey = "Feature.VerificationUpsell.Description.LogoutAddEmailTextOver13", 
            addEmailUnder13TextKey = v9.getRenameParentEmailForVerificationUpsell() and "Feature.VerificationUpsell.Description.LogoutAddEmailTextUnder13V2" or "Feature.VerificationUpsell.Description.LogoutAddEmailTextUnder13", 
            addEmailTitleKey = "Feature.VerificationUpsell.Heading.VerifyOnLogout", 
            updateEmailSecondaryButtonText = "Feature.VerificationUpsell.Action.Logout", 
            origin = "logout", 
            onUpdateEmailSecondaryButtonPressedEvent = v3.Button.SkipLogOutAnyway, 
            onUpdateEmailSecondaryButtonPressed = function() --[[ Line: 25 ]] --[[ Name: onUpdateEmailSecondaryButtonPressed ]]
                -- upvalues: v10 (copy), v2 (ref), v7 (ref), v8 (ref), v4 (ref)
                v10:dispatch(v2(v7, v8, v4.EmailUpsellLogOut));
            end
        };
        if l_FFlagEnableUpdatedLogoutUpsellModal_0 then
            v11.addEmailTitleKey = "Feature.VerificationUpsell.Heading.FinishAccountSetup";
            v11.addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.AddParentalEmail";
            v11.updateEmailPrimaryButtonText = "Feature.VerificationUpsell.Action.Logout";
            v11.useUpdatedModalDesign = true;
        end;
        return v10:dispatch(v1(v7, true, v11));
    end;
end;