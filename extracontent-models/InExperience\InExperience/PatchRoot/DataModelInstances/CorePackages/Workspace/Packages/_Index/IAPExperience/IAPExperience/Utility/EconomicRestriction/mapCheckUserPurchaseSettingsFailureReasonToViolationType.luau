local l_script_FirstAncestor_0 = script:FindFirstAncestor("IAPExperience");
local v1 = require(l_script_FirstAncestor_0.Enums.CheckUserPurchaseSettingsFailureReason);
local v2 = require(l_script_FirstAncestor_0.Enums.EconomicRestrictionsViolationType);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v3 == v1.Chargeback then
        return v2.Chargeback;
    elseif v3 == v1.AbuseOfAffiliateSystem then
        return v2.AbuseOfAffiliateSystem;
    elseif v3 == v1.AttemptedUnauthorizedPaymentMethodUse then
        return v2.AttemptedUnauthorizedPaymentMethodUse;
    elseif v3 == v1.PaymentAuthorizationAttempt then
        return v2.PaymentAuthorizationAttempt;
    elseif v3 == v1.RepeatedRefundRequests then
        return v2.RepeatedRefundRequests;
    elseif v3 == v1.SuspiciousAccountPatterns then
        return v2.SuspiciousAccountPatterns;
    elseif v3 == v1.SuspiciousRefundRequests then
        return v2.SuspiciousRefundRequests;
    elseif v3 == v1.UnauthorizedPurchase then
        return v2.UnauthorizedPurchase;
    elseif v3 == v1.UseOfUnauthorizedOffPlatformTransactions then
        return v2.UseOfUnauthorizedOffPlatformTransactions;
    elseif v3 == v1.VirtualEconomyAbuse then
        return v2.VirtualEconomyAbuse;
    else
        return v2.None;
    end;
end;