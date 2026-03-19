local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_enumerate_0 = require(l_Parent_0.PurchasePromptDeps).enumerate;
local v3 = require(l_script_FirstAncestor_0.Utils.addRawValueMethodToEnum);
local v4 = {};
local v5 = {
    None = "None", 
    ConfirmedU13PaymentModal = "ConfirmedU13PaymentModal", 
    ConfirmedU13MonthlyThreshold1Modal = "ConfirmedU13MonthlyThreshold1Modal", 
    ConfirmedU13MonthlyThreshold2Modal = "ConfirmedU13MonthlyThreshold2Modal", 
    ConfirmedParentalConsentWarningPaymentModal13To17 = "ConfirmedParentalConsentWarningPaymentModal13To17"
};
v4.UserActionType = l_enumerate_0(script.Name, v5);
v3(v4.UserActionType, v5);
v4.Post = function(v6, v7) --[[ Line: 21 ]] --[[ Name: Post ]]
    -- upvalues: v4 (copy)
    local v8 = v4.UserActionType.toRawValue(v7);
    return v6.postPurchaseWarningAcknowledge(v8);
end;
return v4;