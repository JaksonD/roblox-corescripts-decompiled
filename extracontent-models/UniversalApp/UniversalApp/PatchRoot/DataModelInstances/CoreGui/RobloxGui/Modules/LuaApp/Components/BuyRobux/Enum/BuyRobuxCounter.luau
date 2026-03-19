local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v3 = require(l_CorePackages_0.Packages.enumerate);
local v4 = {
    ShowU13PaymentModal = "ShowU13PaymentModal", 
    ShowU13MonthlyThreshold1Modal = "ShowU13MonthlyThreshold1Modal", 
    ShowU13MonthlyThreshold2Modal = "ShowU13MonthlyThreshold2Modal", 
    ShowParentalConsentWarningPaymentModal13To17 = "ShowParentalConsentWarningPaymentModal13To17", 
    ConfirmU13PaymentModal = "ConfirmU13PaymentModal", 
    ConfirmU13MonthlyThreshold1Modal = "ConfirmU13MonthlyThreshold1Modal", 
    ConfirmU13MonthlyThreshold2Modal = "ConfirmU13MonthlyThreshold2Modal", 
    ConfirmParentalConsentWarningPaymentModal13To17 = "ConfirmParentalConsentWarningPaymentModal13To17", 
    InvalidProducts = "FailedInvalidProducts", 
    PurchaseFailed = "PurchaseFailed", 
    PurchaseCanceled = "PurchaseCanceled", 
    ShowPurchaseNotEnabledModal = "ShowPurchaseNotEnabledModal", 
    ShowEconomicRestrictionModal = "ShowEconomicRestrictionModal"
};
local v5 = v3(script.Name, v4);
v2(v5, v4);
return v5;