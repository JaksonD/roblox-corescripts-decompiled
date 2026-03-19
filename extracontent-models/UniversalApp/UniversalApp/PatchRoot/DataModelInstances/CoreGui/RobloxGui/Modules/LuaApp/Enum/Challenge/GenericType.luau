local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v3 = require(l_CorePackages_0.Packages.enumerate);
local v4 = {
    Captcha = "captcha", 
    TwoStepVerification = "twostepverification", 
    SecurityQuestions = "securityquestions", 
    Reauthentication = "reauthentication", 
    ProofOfWork = "proofofwork", 
    ForceAuthenticator = "forceauthenticator", 
    DeviceIntegrity = "deviceintegrity", 
    DeviceAccessToken = "deviceaccesstoken", 
    Denied = "denied", 
    EmailVerification = "emailverification", 
    PhoneVerification = "phoneverification", 
    PrivateAccessToken = "privateaccesstoken", 
    BlockSession = "blocksession", 
    Biometric = "biometric"
};
local v5 = v3(script.Name, v4);
v2(v5, v4);
return v5;