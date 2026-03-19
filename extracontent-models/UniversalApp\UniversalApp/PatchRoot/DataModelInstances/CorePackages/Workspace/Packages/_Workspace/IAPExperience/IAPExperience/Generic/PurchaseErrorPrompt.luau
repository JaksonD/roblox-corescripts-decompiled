local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_Images_0 = v4.App.ImageSet.Images;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_2.AppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_2.Localization).LocalizationProvider;
local l_withLocalization_0 = require(l_Parent_2.Localization).withLocalization;
local v12 = require(l_Parent_1.Enums.PurchaseErrorType);
local v13 = require(l_Parent_1.Enums.EconomicRestrictionsViolationType);
local v14 = require(l_Parent_0.PurchaseFlowType);
local l_default_0 = require(l_Parent_2.LoggingProtocol).default;
local v16 = require(l_Parent_1.Utility.logger);
local v17 = require(l_Parent_1.Utility.getAppContext);
local v18 = v3.Component:extend(script.Name);
local v19 = require(l_Parent_1.Generic.Events.PurchaseErrorPromptCounter);
local l_PurchaseErrorPromptShownCounter_0 = v19.PurchaseErrorPromptShownCounter;
local l_EconomicRestrictionsPromptShownCounter_0 = v19.EconomicRestrictionsPromptShownCounter;
v18.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v18.getErrorTitle = function(_, v23, v24, v25) --[[ Line: 49 ]] --[[ Name: getErrorTitle ]]
    -- upvalues: v12 (copy), v14 (copy)
    if v24 == v12.FailedRobuxPurchase then
        return v23.robuxFailedPurchaseTitle;
    elseif v24 == v12.AlreadySubscribed then
        return v23.alreadySubscribedTitle;
    elseif v25 == v14.Subscription then
        return v23.cantSubscribeTitle;
    else
        return v23.titleText;
    end;
end;
v18.getErrorMessage = function(_, v27, v28, v29) --[[ Line: 61 ]] --[[ Name: getErrorMessage ]]
    -- upvalues: v12 (copy)
    if v28 == v12.AlreadyOwn then
        return v27.alreadyOwnText;
    elseif v28 == v12.FailedGrant then
        return v27.failedGrantText;
    elseif v28 == v12.FailedGrantUnknown then
        return v27.failedGrantUnknownText;
    elseif v28 == v12.Limited then
        return v27.limitedText;
    elseif v28 == v12.NotEnoughRobux then
        return v27.notEnoughRobuxText;
    elseif v28 == v12.NotForSale then
        return v27.notForSaleText;
    elseif v28 == v12.NotForSaleExperience then
        return v27.notForSaleExperienceText;
    elseif v28 == v12.PremiumOnly then
        return v27.premiumOnlyText;
    elseif v28 == v12.ThirdPartyDisabled then
        return v27.thirdPartyDisabledText;
    elseif v28 == v12.Under13 then
        return v27.under13Text;
    elseif v28 == v12.PremiumPlatformUnavailable then
        return v27.premiumPlatformUnavailable;
    elseif v28 == v12.AlreadyPremium then
        return v27.alreadyPremium;
    elseif v28 == v12.PurchaseLimit then
        return v27.purchaseLimitText;
    elseif v28 == v12.ParentalLimit then
        return v27.parentalLimitText;
    elseif v28 == v12.FailedRobuxPurchase then
        return v27.robuxFailedPurchaseText;
    elseif v28 == v12.AlreadySubscribed then
        return v27.alreadySubscribedText;
    elseif v28 == v12.SubscriptionNotForSale then
        return v27.subscriptionNotForSaleText;
    elseif v28 == v12.SubscriptionExceededUserSpendLimit then
        return v27.parentalRestrictionSubscriptionText;
    elseif v28 == v12.SubscriptionUnsupportedLocale then
        return v27.subscriptionUnsupportedLocaleText;
    elseif v28 == v12.RestrictedUser then
        return v27.restrictedUserText;
    elseif v28 == v12.SubscriptionPurchasePlatformNotSupported or v28 == v12.SubscriptionInvalidSaleLocation then
        return v27.subscriptionUnsupportedPlatformText;
    elseif v28 == v12.VpcRequired then
        return v27.vpcRequiredText;
    elseif v28 == v12.ExceedParentalSpendLimit then
        return v27.exceedParentalSpendLimitText;
    elseif v28 == v12.EconomicRestriction then
        return formatEconomicRestrictionText(v27, v29);
    else
        return v27.unknownText;
    end;
end;
formatEconomicRestrictionText = function(v30, v31) --[[ Line: 123 ]] --[[ Name: formatEconomicRestrictionText ]]
    -- upvalues: l_default_0 (copy), l_EconomicRestrictionsPromptShownCounter_0 (copy), v17 (copy), v16 (copy)
    local l_timeoutMinutes_0 = v31.timeoutMinutes;
    local l_violationType_0 = v31.violationType;
    l_default_0:logRobloxTelemetryCounter(l_EconomicRestrictionsPromptShownCounter_0, 1, {
        violationType = tostring(l_violationType_0), 
        appContext = v17()
    });
    if not l_timeoutMinutes_0 or not l_violationType_0 then
        v16.error({
            error = "Timeout and violationType is required for economic restriction text. Showing unknown error.", 
            timeoutMinutes = l_timeoutMinutes_0, 
            violationType = l_violationType_0
        });
        return v30.unknownText;
    else
        local v34 = getEconomicRestrictionViolationLabel(v30, l_violationType_0);
        local v35 = math.ceil(l_timeoutMinutes_0 / 60);
        if v35 >= 24 then
            local v36 = math.ceil(v35 / 24);
            return v30.economicRestrictionBaseTextDays:gsub("{day}", (tostring(v36))):gsub("{violation}", v34);
        else
            return v30.economicRestrictionBaseTextHours:gsub("{hour}", (tostring(v35))):gsub("{violation}", v34);
        end;
    end;
end;
getEconomicRestrictionViolationLabel = function(v37, v38) --[[ Line: 154 ]] --[[ Name: getEconomicRestrictionViolationLabel ]]
    -- upvalues: v13 (copy), v16 (copy)
    if v38 == v13.Chargeback then
        return v37.chargebackViolationLabel;
    elseif v38 == v13.AbuseOfAffiliateSystem then
        return v37.fraudAbuseOfAffiliateSystemViolationLabel;
    elseif v38 == v13.AttemptedUnauthorizedPaymentMethodUse then
        return v37.fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel;
    elseif v38 == v13.PaymentAuthorizationAttempt then
        return v37.fraudPaymentAbuseViolationLabel;
    elseif v38 == v13.RepeatedRefundRequests then
        return v37.fraudRepeatedRefundRequestsViolationLabel;
    elseif v38 == v13.SuspiciousAccountPatterns then
        return v37.fraudSuspiciousAccountPatternsViolationLabel;
    elseif v38 == v13.SuspiciousRefundRequests then
        return v37.fraudSuspiciousRefundRequestsViolationLabel;
    elseif v38 == v13.UnauthorizedPurchase then
        return v37.fraudUnauthorizedPurchaseViolationLabel;
    elseif v38 == v13.UseOfUnauthorizedOffPlatformTransactions then
        return v37.fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel;
    elseif v38 == v13.VirtualEconomyAbuse then
        return v37.fraudVirtualEconomyAbuseViolationLabel;
    else
        v16.error({
            message = "Invalid violation type", 
            violationType = v38
        });
        return "";
    end;
end;
getIsAlreadyOwnedError = function(v39) --[[ Line: 185 ]] --[[ Name: getIsAlreadyOwnedError ]]
    -- upvalues: v12 (copy)
    local v40 = true;
    if v39 ~= v12.AlreadyOwn then
        v40 = true;
        if v39 ~= v12.AlreadyPremium then
            v40 = v39 == v12.AlreadySubscribed;
        end;
    end;
    return v40;
end;
getErrorTitleIcon = function(v41) --[[ Line: 191 ]] --[[ Name: getErrorTitleIcon ]]
    -- upvalues: l_Images_0 (copy)
    if getIsAlreadyOwnedError(v41) then
        return l_Images_0["icons/status/success_large"];
    else
        return l_Images_0["icons/status/error_large"];
    end;
end;
v18.renderNewAlertWithLocalization = function(v42) --[[ Line: 198 ]] --[[ Name: renderNewAlertWithLocalization ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        titleText = "IAPExperience.PurchaseError.Title.Error", 
        robuxFailedPurchaseTitle = "IAPExperience.PurchaseError.Title.RobuxPurchaseFailed", 
        robuxFailedPurchaseText = "IAPExperience.PurchaseError.Text.FailedRobuxPurchase", 
        unknownText = "IAPExperience.PurchaseError.Text.UnknownError", 
        okText = "IAPExperience.PurchaseError.Text.Ok", 
        alreadyOwnText = "IAPExperience.PurchaseError.Text.AlreadyOwn", 
        failedGrantText = "IAPExperience.PurchaseError.Text.FailedGrant", 
        failedGrantUnknownText = "IAPExperience.PurchaseError.Text.FailedGrantUnknown", 
        limitedText = "IAPExperience.PurchaseError.Text.Limited", 
        notEnoughRobuxText = "IAPExperience.PurchaseError.Text.NotEnoughRobux", 
        notForSaleText = "IAPExperience.PurchaseError.Text.NotForSale", 
        notForSaleExperienceText = "IAPExperience.PurchaseError.Text.NotForSaleExperience", 
        premiumOnlyText = "IAPExperience.PurchaseError.Text.PremiumOnly", 
        thirdPartyDisabledText = "IAPExperience.PurchaseError.Text.ThirdPartyDisabled", 
        under13Text = "IAPExperience.PurchaseError.Text.Under13", 
        premiumPlatformUnavailable = "IAPExperience.PurchaseError.Text.PremiumPlatformUnavailable", 
        alreadyPremium = "IAPExperience.PurchaseError.AlreadyPremium", 
        purchaseLimitText = "IAPExperience.PurchaseError.Text.PurchaseLimit", 
        parentalLimitText = "IAPExperience.PurchaseError.Text.ParentalLimit", 
        alreadySubscribedTitle = "IAPExperience.PurchaseError.Title.AlreadySubscribed", 
        cantSubscribeTitle = "IAPExperience.PurchaseError.Title.CantSubscribe", 
        alreadySubscribedText = "IAPExperience.PurchaseError.Text.AlreadySubscribed", 
        subscriptionNotForSaleText = "IAPExperience.PurchaseError.Text.SubscriptionNotForSale", 
        parentalRestrictionSubscriptionText = "IAPExperience.PurchaseError.Text.ParentalRestrictionSubscription", 
        subscriptionUnsupportedLocaleText = "IAPExperience.PurchaseError.Text.SubscriptionUnsupportedLocale", 
        restrictedUserText = "IAPExperience.PurchaseError.Text.RestrictedUser", 
        subscriptionUnsupportedPlatformText = "IAPExperience.PurchaseError.Text.SubscriptionUnsupportedPlatform", 
        vpcRequiredText = "IAPExperience.PurchaseError.Text.VpcRequired", 
        exceedParentalSpendLimitText = "Feature.Subscription.Message.MonthlySpendRestrictionsMonthlyLimitExceed", 
        chargebackViolationLabel = "Feature.NotApproved.Label.AbuseType.Chargeback", 
        fraudAbuseOfAffiliateSystemViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudAbuseOfTheAffiliateSystem", 
        fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudAttemptedUnauthorizedPaymentMethodUse", 
        fraudPaymentAbuseViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudPaymentAbuse", 
        fraudRepeatedRefundRequestsViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudRepeatedRefundRequests", 
        fraudSuspiciousAccountPatternsViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudSuspiciousAccountPatterns", 
        fraudSuspiciousRefundRequestsViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudSuspiciousRefundRequests", 
        fraudUnauthorizedPurchaseViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudUnauthorizedPurchase", 
        fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudUseOfUnauthorizedOffPlatformTransactions", 
        fraudVirtualEconomyAbuseViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudVirtualEconomyAbuse", 
        economicRestrictionBaseTextHours = "IAPExperience.PurchaseError.Text.EconomicRestrictionsHours", 
        economicRestrictionBaseTextDays = "IAPExperience.PurchaseError.Text.EconomicRestrictionsDays"
    })(function(v43) --[[ Line: 241 ]]
        -- upvalues: v42 (copy)
        return v42:renderAlert(v43);
    end);
end;
v18.render = function(v44) --[[ Line: 246 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy)
    return v3.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        Alert = v44:renderNewAlertWithLocalization()
    });
end;
v18.renderAlert = function(v45, v46) --[[ Line: 254 ]] --[[ Name: renderAlert ]]
    -- upvalues: v12 (copy), v16 (copy), v17 (copy), l_default_0 (copy), l_PurchaseErrorPromptShownCounter_0 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_props_0 = v45.props;
    local v48 = l_props_0.errorType and v12.toRawValue(l_props_0.errorType) or tostring(l_props_0.errorType);
    v16.debug({
        message = "Purchase Error Prompt Shown", 
        errorType = tostring(l_props_0.errorType), 
        errorLabel = v48, 
        flowType = tostring(l_props_0.flowType), 
        screenHeight = l_props_0.screenSize.Y, 
        screenWidth = l_props_0.screenSize.X, 
        portrait = l_props_0.screenSize.X < l_props_0.screenSize.Y, 
        appContext = v17()
    });
    l_default_0:logRobloxTelemetryCounter(l_PurchaseErrorPromptShownCounter_0, 1, {
        errorType = tostring(l_props_0.errorType), 
        errorLabel = v48, 
        flowType = tostring(l_props_0.flowType), 
        screenHeight = l_props_0.screenSize.Y, 
        screenWidth = l_props_0.screenSize.X, 
        portrait = l_props_0.screenSize.X < l_props_0.screenSize.Y, 
        appContext = v17()
    });
    return v3.createElement(l_InteractiveAlert_0, {
        anchorPoint = l_props_0.anchorPoint, 
        position = l_props_0.position, 
        screenSize = l_props_0.screenSize, 
        title = v45:getErrorTitle(v46, l_props_0.errorType, l_props_0.flowType), 
        titleIcon = getErrorTitleIcon(l_props_0.errorType), 
        bodyText = v45:getErrorMessage(v46, l_props_0.errorType, l_props_0.economicRestrictionError), 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_props_0.doneActivated, 
                        text = v46.okText, 
                        inputIcon = l_props_0.doneControllerIcon
                    }
                }
            }
        }
    });
end;
return v18;