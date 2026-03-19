local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v3 = require(l_CorePackages_0.Packages.enumerate);
local v4 = {
    ChangePasswordIntro = "CHANGE_PASSWORD_INTRO", 
    ChangePasswordForm = "CHANGE_PASSWORD_FORM", 
    ChangePasswordConfirmation = "CHANGE_PASSWORD_CONFIRMATION", 
    ChangePasswordDismissConfirmation = "CHANGE_PASSWORD_DISMISS_CONFIRMATION", 
    AccountPinForm = "ACCOUNT_PIN_FORM", 
    AccountPinFormExpired = "ACCOUNT_PIN_FORM_EXPIRED", 
    AuthenticatorUpsellIntro = "AUTHENTICATOR_UPSELL", 
    AuthenticatorUpsellInstallApps = "AUTHENTICATOR_INSTALL_APPS", 
    AccountRestoresPolicyUpsell = "ACCOUNT_RESTORES_POLICY_UPSELL", 
    Email2SVUpsell = "EMAIL_2SV_UPSELL"
};
local v5 = v3(script.Name, v4);
v2(v5, v4);
return v5;