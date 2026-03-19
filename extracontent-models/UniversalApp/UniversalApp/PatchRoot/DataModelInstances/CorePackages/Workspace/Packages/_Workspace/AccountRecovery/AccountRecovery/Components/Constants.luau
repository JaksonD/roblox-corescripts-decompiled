local l_Parent_0 = script:FindFirstAncestor("AccountRecovery").Parent;
local l_GetFIntAccountRecoverySecondsBetweenResends_0 = require(l_Parent_0.SharedFlags).GetFIntAccountRecoverySecondsBetweenResends;
return {
    UnknownErrorKey = "Authentication.AccountRecovery.MessageUnknownError", 
    SecondsBetweenResends = l_GetFIntAccountRecoverySecondsBetweenResends_0(), 
    VerificationCodeLength = 6
};