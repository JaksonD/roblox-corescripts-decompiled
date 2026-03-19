local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Utils_0 = l_script_FirstAncestor_0.Utils;
local v3 = require(l_Utils_0.addRawValueMethodToEnum);
local v4 = require(l_Parent_0.enumerate);
local v5 = {
    Captcha = "captcha", 
    TwoStepVerification = "twostepverification", 
    SecurityQuestions = "securityquestions", 
    Reauthentication = "reauthentication", 
    ProofOfWork = "proofofwork", 
    ForceAuthenticator = "forceauthenticator", 
    ForceTwoStepVerification = "forcetwostepverification", 
    DeviceIntegrity = "deviceintegrity", 
    DeviceAccessToken = "deviceaccesstoken", 
    Denied = "denied", 
    EmailVerification = "emailverification", 
    PhoneVerification = "phoneverification", 
    PrivateAccessToken = "privateaccesstoken", 
    BlockSession = "blocksession"
};
local v6 = v4(script.Name, v5);
v3(v6, v5);
return v6;