local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local l_isErrorReasonPrefixWithEconomicRestrictions_0 = require(l_Parent_0.IAPExperience).Utility.isErrorReasonPrefixWithEconomicRestrictions;
return function(v4) --[[ Line: 8 ]] --[[ Name: parseSubscriptionError ]]
    -- upvalues: v2 (copy), l_isErrorReasonPrefixWithEconomicRestrictions_0 (copy)
    if v4 == "UserHasSpendLimitSet" then
        return v2.SubscriptionExceededUserSpendLimit;
    elseif v4 == "UnsupportedLocale" then
        return v2.SubscriptionUnsupportedLocale;
    elseif v4 == "RestrictedUser" then
        return v2.RestrictedUser;
    elseif v4 == "PurchasePlatformNotSupported" then
        return v2.SubscriptionPurchasePlatformNotSupported;
    elseif v4 == "InvalidSaleLocation" then
        return v2.SubscriptionInvalidSaleLocation;
    elseif v4 == "UserAlreadySubscribed" then
        return v2.AlreadySubscribed;
    elseif v4 == "ProductNotForSale" then
        return v2.SubscriptionNotForSale;
    elseif v4 == "VpcRequired" then
        return v2.VpcRequired;
    elseif v4 == "ExceedParentalSpendLimit" then
        return v2.ExceedParentalSpendLimit;
    elseif l_isErrorReasonPrefixWithEconomicRestrictions_0(v4) then
        return v4;
    else
        return v2.UnknownFailure;
    end;
end;