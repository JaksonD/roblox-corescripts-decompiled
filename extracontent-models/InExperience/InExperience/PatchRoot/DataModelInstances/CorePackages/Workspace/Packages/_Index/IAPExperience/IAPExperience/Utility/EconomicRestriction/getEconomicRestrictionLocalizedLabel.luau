local l_script_FirstAncestor_0 = script:FindFirstAncestor("IAPExperience");
local v1 = require(l_script_FirstAncestor_0.Enums.EconomicRestrictionsViolationType);
local v2 = require(l_script_FirstAncestor_0.Utility.logger);
return function(v3, v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v4 == v1.Chargeback then
        return v3.chargebackViolationLabel;
    elseif v4 == v1.AbuseOfAffiliateSystem then
        return v3.fraudAbuseOfAffiliateSystemViolationLabel;
    elseif v4 == v1.AttemptedUnauthorizedPaymentMethodUse then
        return v3.fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel;
    elseif v4 == v1.PaymentAuthorizationAttempt then
        return v3.fraudPaymentAbuseViolationLabel;
    elseif v4 == v1.RepeatedRefundRequests then
        return v3.fraudRepeatedRefundRequestsViolationLabel;
    elseif v4 == v1.SuspiciousAccountPatterns then
        return v3.fraudSuspiciousAccountPatternsViolationLabel;
    elseif v4 == v1.SuspiciousRefundRequests then
        return v3.fraudSuspiciousRefundRequestsViolationLabel;
    elseif v4 == v1.UnauthorizedPurchase then
        return v3.fraudUnauthorizedPurchaseViolationLabel;
    elseif v4 == v1.UseOfUnauthorizedOffPlatformTransactions then
        return v3.fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel;
    elseif v4 == v1.VirtualEconomyAbuse then
        return v3.fraudVirtualEconomyAbuseViolationLabel;
    else
        v2.error({
            message = "Invalid violation type", 
            violationType = v4
        });
        return "";
    end;
end;