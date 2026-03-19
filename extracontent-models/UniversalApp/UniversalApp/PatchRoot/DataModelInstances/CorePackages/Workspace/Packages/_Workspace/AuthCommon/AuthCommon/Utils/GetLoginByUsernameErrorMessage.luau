local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v3 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v4 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodeSSO);
local v5 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnSSO", false);
local v6 = l_getAppFeaturePolicies_0().getPlatformAccountName();
local v7 = {
    [v4.AuthError] = "Authentication.Login.Response.SomethingWentWrong", 
    [v4.ExternalIdentityAlreadyConnected] = {
        "Authentication.Login.Response.AlreadyLinked"; 
        platform = v6
    }, 
    [v4.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword", 
    [v4.FloodedPS] = "Authentication.TwoStepVerification.Response.TooManyAttempts", 
    [v4.Require2FA] = "Authentication.Login.Response.Require2FAGeneric", 
    [v4.RelinkingCooldown] = {
        "Authentication.Login.Response.RelinkingFreeze"; 
        platform = v6
    }, 
    [v3.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword", 
    [v4.FloodedXbox] = "Authentication.TwoStepVerification.Response.TooManyAttempts", 
    [v4.RobloxAccountAlreadyConnectedXbox] = {
        "Authentication.Login.Response.AlreadyLinked"; 
        platform = v6
    }, 
    [v4.ExternalIdentityAlreadyConnectedXbox] = {
        "Authentication.Login.Response.AlreadyLinked"; 
        platform = v6
    }
};
if v5 then
    v7[v3.IllegalChildAccountLinking] = "Authentication.Login.LinkIllegalChildAccountLinking";
end;
return function(v8) --[[ Line: 44 ]] --[[ Name: GetLoginByUsernameErrorMessage ]]
    -- upvalues: v7 (copy)
    if v7[v8] then
        return v7[v8];
    else
        return "Authentication.Login.Response.SomethingWentWrong";
    end;
end;