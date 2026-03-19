local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetPromptState);
local v2 = require(l_Parent_0.Enums.PromptState);
local v3 = require(l_Parent_0.Enums.PurchaseWarning);
local v4 = require(l_Parent_0.Thunks.launchRobuxUpsell);
local v5 = require(l_Parent_0.Thunk);
return function(v6) --[[ Line: 9 ]] --[[ Name: resolvePurchasePrecheck ]]
    -- upvalues: v5 (copy), v3 (copy), v1 (copy), v2 (copy), v4 (copy)
    return v5.new(script.Name, {}, function(v7, _) --[[ Line: 10 ]]
        -- upvalues: v6 (copy), v3 (ref), v1 (ref), v2 (ref), v4 (ref)
        if v6 == v3.U13PaymentModal then
            return v7:dispatch(v1(v2.U13PaymentModal));
        elseif v6 == v3.U13MonthlyThreshold1Modal then
            return v7:dispatch(v1(v2.U13MonthlyThreshold1Modal));
        elseif v6 == v3.RequireEmailVerification then
            return v7:dispatch(v1(v2.RequireEmailVerification));
        elseif v6 == v3.U13MonthlyThreshold2Modal then
            return v7:dispatch(v1(v2.U13MonthlyThreshold2Modal));
        elseif v6 == v3.ParentalConsentWarningPaymentModal13To17 then
            return v7:dispatch(v1(v2.ParentalConsentWarningPaymentModal13To17));
        else
            return v7:dispatch(v4());
        end;
    end);
end;