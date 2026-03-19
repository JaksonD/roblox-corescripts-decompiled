local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useMemo_0 = v2.useMemo;
local l_useEffect_0 = v2.useEffect;
local v5 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v9 = require(l_Parent_0.Localization);
local l_LocalizationProvider_0 = v9.LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_useLocalization_0 = v9.Hooks.useLocalization;
local v13 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v14 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v15 = require(l_Parent_0.IAPExperience);
local l_formatEconomicRestrictionText_0 = v15.Utility.formatEconomicRestrictionText;
local l_addEconomicRestrictionKeysToLocalization_0 = v15.Utility.addEconomicRestrictionKeysToLocalization;
local v18 = require(l_script_FirstAncestor_0.Utils.formatTextWithParams);
local l_EconomicRestrictionsCounter_0 = v15.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local l_ProductPurchasePromptCounter_0 = v15.Counters.ProductPurchasePromptCounter.ProductPurchasePromptCounter;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_UnifiedPurchaseCompletionModal_0 = v15.UnifiedPurchaseCompletionModal;
local l_UnifiedPurchaseCompletionModalV2_0 = v15.UnifiedPurchaseCompletionModalV2;
local v27 = require(l_script_FirstAncestor_0.Flags.FFlagFixPurchasingErrorCounter);
local _ = require(l_Parent_0.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal;
local v29 = require(l_script_FirstAncestor_0.Utils.AppContext);
local l_FFlagAddCenterDialogForUnifiedPurchaseModal_1 = require(l_Parent_0.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal;
local function v33(v31, v32) --[[ Line: 58 ]] --[[ Name: getPurchaseErrorText ]]
    -- upvalues: v14 (copy)
    if v32 == v14.CannotGetBalance then
        return v31.PurchaseErrorCannotGetBalanceText;
    elseif v32 == v14.CannotGetItemPrice then
        return v31.PurchaseErrorCannotGetItemPriceText;
    elseif v32 == v14.NotForSale then
        return v31.PurchaseErrorNotForSaleText;
    elseif v32 == v14.NotForSaleHere then
        return v31.PurchaseErrorNotForSaleHereText;
    elseif v32 == v14.AlreadyOwn then
        return v31.PurchaseErrorAlreadyOwnText;
    elseif v32 == v14.Under13 then
        return v31.PurchaseErrorUnder13Text;
    elseif v32 == v14.Limited then
        return v31.PurchaseErrorLimitedText;
    elseif v32 == v14.ThirdPartyDisabled then
        return v31.PurchaseErrorThirdPartyDisabledText;
    elseif v32 == v14.NotEnoughRobux then
        return v31.PurchaseErrorNotEnoughRobuxText;
    elseif v32 == v14.NotEnoughRobuxXbox then
        return v31.PurchaseErrorNotEnoughRobuxXboxText;
    elseif v32 == v14.NotEnoughRobuxNoUpsell then
        return v31.PurchaseErrorNotEnoughRobuxNoUpsellText;
    elseif v32 == v14.TwoFactorNeeded then
        return v31.PurchaseErrorTwoFactorNeededText;
    elseif v32 == v14.TwoFactorNeededSettings then
        return v31.PurchaseErrorTwoFactorNeededSettingsText;
    elseif v32 == v14.UnknownFailure then
        return v31.PurchaseErrorUnknownFailureText;
    elseif v32 == v14.UnknownFailureNoItemName then
        return v31.PurchaseErrorUnknownFailureNoItemNameText;
    elseif v32 == v14.PurchaseDisabled then
        return v31.PurchaseErrorPurchaseDisabledText;
    elseif v32 == v14.InvalidFunds then
        return v31.PurchaseErrorInvalidFundsText;
    elseif v32 == v14.InvalidFundsUnknown then
        return v31.PurchaseErrorInvalidFundsUnknownText;
    elseif v32 == v14.PremiumOnly then
        return v31.PurchaseErrorPremiumOnlyText;
    else
        return v31.PurchaseErrorUnknownFailureNoItemNameText;
    end;
end;
local function v40(v34, v35) --[[ Line: 102 ]] --[[ Name: getModalContent ]]
    -- upvalues: v13 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v18 (copy), v14 (copy), l_formatEconomicRestrictionText_0 (copy), v33 (copy)
    local l_promptState_0 = v35.promptState;
    local l_purchaseError_0 = v35.purchaseError;
    local l_isGenericChallengeResponse_0 = v35.isGenericChallengeResponse;
    local l_productInfo_0 = v35.productInfo;
    if l_promptState_0 == v13.PurchaseComplete then
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v35.useUnifiedPurchaseCompletionModal then
            if v35.isMultiItem then
                return {
                    messageText = v34.MultiItemPurchaseCompleteBody, 
                    titleText = v34.PurchaseCompleteTitle
                };
            else
                return {
                    messageText = v18(v34.PurchaseCompleteBody, {
                        ITEM_NAME = v35.productInfo.name
                    }), 
                    titleText = v34.PurchaseCompleteTitle
                };
            end;
        else
            return {
                messageText = v18(v34.PurchaseCompleteSucceededText, {
                    ITEM_NAME = v35.productInfo.name
                }), 
                titleText = v34.BuyItemTitle
            };
        end;
    elseif l_promptState_0 == v13.U13PaymentModal then
        return {
            messageText = v34.ScaryModalOneText, 
            titleText = v34.BuyItemTitle
        };
    elseif l_promptState_0 == v13.U13MonthlyThreshold1Modal then
        return {
            messageText = v34.ScaryModalTwoText, 
            titleText = v34.BuyItemTitle
        };
    elseif l_promptState_0 == v13.U13MonthlyThreshold2Modal then
        return {
            messageText = v34.ScaryModalParentalText, 
            titleText = v34.BuyItemTitle
        };
    elseif l_promptState_0 == v13.ParentalConsentWarningPaymentModal13To17 then
        return {
            messageText = v34.ParentalConsentText, 
            titleText = v34.BuyItemTitle
        };
    elseif l_promptState_0 == v13.Error then
        if l_purchaseError_0 == v14.UnknownFailure then
            return {
                messageText = v18(v34.PurchaseErrorUnknownFailureText, {
                    ITEM_NAME = l_productInfo_0.name
                }), 
                titleText = v34.ErrorTitle
            };
        elseif l_purchaseError_0 == v14.TwoFactorNeededSettings or l_isGenericChallengeResponse_0(l_purchaseError_0) then
            return {
                messageText = v34.Enable2SVLogoutText, 
                titleText = v34.ErrorTitle
            };
        elseif l_purchaseError_0 == v14.EconomicRestriction then
            return {
                messageText = l_formatEconomicRestrictionText_0(v34, {
                    violationType = v35.economicRestrictionError.violationType, 
                    timeoutMinutes = v35.economicRestrictionError.timeoutMinutes
                }, true), 
                titleText = v34.ErrorTitle
            };
        else
            return {
                messageText = v33(v34, l_purchaseError_0), 
                titleText = v34.ErrorTitle
            };
        end;
    else
        return {
            messageText = v34.PurchaseErrorUnknownFailureNoItemNameText, 
            titleText = v34.ErrorTitle
        };
    end;
end;
local function v43(v41, v42) --[[ Line: 185 ]] --[[ Name: getButtonStackInfo ]]
    -- upvalues: l_ButtonType_0 (copy)
    if v41.includeCancelButton then
        return {
            {
                props = {
                    onActivated = v41.cancelButtonPressed, 
                    text = v42.CancelPurchaseText, 
                    inputIcon = v41.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil
                }
            }, 
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v41.confirmButtonPressed, 
                    text = v42.OkButtonText, 
                    inputIcon = v41.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                }
            }
        };
    else
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v41.confirmButtonPressed, 
                    text = v42.OkButtonText, 
                    inputIcon = v41.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                }
            }
        };
    end;
end;
local function v48(v44) --[[ Line: 220 ]] --[[ Name: ProductPurchasePrompt ]]
    -- upvalues: l_addEconomicRestrictionKeysToLocalization_0 (copy), l_useLocalization_0 (copy), l_useMemo_0 (copy), v40 (copy), l_useEffect_0 (copy), v27 (copy), l_default_0 (copy), l_ProductPurchasePromptCounter_0 (copy), v14 (copy), v13 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_1 (copy), v29 (copy), v2 (copy), l_UnifiedPurchaseCompletionModalV2_0 (copy), l_UnifiedPurchaseCompletionModal_0 (copy), l_InteractiveAlert_0 (copy), v43 (copy)
    local v45 = {
        PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted", 
        PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted", 
        PurchaseCompleteSucceededText = "CoreScripts.PurchasePrompt.PurchaseMessage.Succeeded", 
        BuyItemTitle = "CoreScripts.PurchasePrompt.Title.BuyItem", 
        VerificationRequiredTitle = "CoreScripts.PurchasePrompt.Title.VerificationRequired", 
        OkButtonText = "CoreScripts.PurchasePrompt.Button.OK", 
        SettingsButtonText = "CoreScripts.PurchasePrompt.Button.Settings", 
        CancelPurchaseText = "CoreScripts.PurchasePrompt.CancelPurchase.Cancel", 
        ErrorTitle = "CoreScripts.PremiumModal.Title.Error", 
        ScaryModalOneText = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalOne", 
        ScaryModalTwoText = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalTwo", 
        ScaryModalParentalText = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalParental", 
        Enable2SVLogoutText = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SVLogout", 
        PurchaseErrorCannotGetBalanceText = "CoreScripts.PurchasePrompt.PurchaseFailed.CannotGetBalance", 
        PurchaseErrorCannotGetItemPriceText = "CoreScripts.PurchasePrompt.PurchaseFailed.CannotGetItemPrice", 
        PurchaseErrorNotForSaleText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotForSale", 
        PurchaseErrorNotForSaleHereText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotForSaleHere", 
        PurchaseErrorAlreadyOwnText = "CoreScripts.PurchasePrompt.PurchaseFailed.AlreadyOwn", 
        PurchaseErrorUnder13Text = "CoreScripts.PurchasePrompt.PurchaseFailed.Under13", 
        PurchaseErrorLimitedText = "CoreScripts.PurchasePrompt.PurchaseFailed.Limited", 
        PurchaseErrorThirdPartyDisabledText = "CoreScripts.PurchasePrompt.PurchaseFailed.ThirdPartyDisabled", 
        PurchaseErrorNotEnoughRobuxText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotEnoughRobux", 
        PurchaseErrorNotEnoughRobuxXboxText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotEnoughRobuxXbox", 
        PurchaseErrorNotEnoughRobuxNoUpsellText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotEnoughRobuxNoUpsell", 
        PurchaseErrorTwoFactorNeededText = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SV", 
        PurchaseErrorTwoFactorNeededSettingsText = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SV", 
        PurchaseErrorUnknownFailureText = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailure", 
        PurchaseErrorUnknownFailureNoItemNameText = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
        PurchaseErrorPurchaseDisabledText = "CoreScripts.PurchasePrompt.PurchaseFailed.PurchaseDisabled", 
        PurchaseErrorInvalidFundsText = "CoreScripts.PurchasePrompt.PurchaseFailed.InvalidFunds", 
        PurchaseErrorInvalidFundsUnknownText = "CoreScripts.PurchasePrompt.PurchaseFailed.InvalidFunds", 
        PurchaseErrorPremiumOnlyText = "CoreScripts.PurchasePrompt.PurchaseFailed.PremiumOnly", 
        MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
    };
    l_addEconomicRestrictionKeysToLocalization_0(v45);
    local v46 = l_useLocalization_0(v45);
    local v47 = l_useMemo_0(function() --[[ Line: 260 ]]
        -- upvalues: v40 (ref), v46 (copy), v44 (copy)
        return (v40(v46, v44));
    end, {
        v44
    });
    l_useEffect_0(function() --[[ Line: 264 ]]
        -- upvalues: v27 (ref), l_default_0 (ref), l_ProductPurchasePromptCounter_0 (ref), v44 (copy), v14 (ref), v13 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref)
        if v27 then
            l_default_0:logRobloxTelemetryCounter(l_ProductPurchasePromptCounter_0, 1, {
                promptState = tostring(v44.promptState), 
                purchaseError = if v14.isMember(v44.purchaseError) then tostring(v44.purchaseError) else tostring(v14.UnknownFailure)
            });
        else
            l_default_0:logRobloxTelemetryCounter(l_ProductPurchasePromptCounter_0, 1, {
                promptState = tostring(v44.promptState), 
                purchaseError = if v44.promptState == v13.Error then tostring(v44.purchaseError) else ""
            });
        end;
        if v44.purchaseError == v14.EconomicRestriction then
            l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
                surface = l_EconomicRestrictionsSurface_0.InExperience, 
                failureReason = tostring(v44.economicRestrictionError.violationType)
            });
        end;
    end, {
        v44.purchaseError
    });
    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v44.useUnifiedPurchaseCompletionModal then
        if l_FFlagAddCenterDialogForUnifiedPurchaseModal_1 and v29.get() == v29.Enum.IN_APP then
            return v2.createElement(l_UnifiedPurchaseCompletionModalV2_0, {
                title = v47.titleText, 
                isError = v44.promptState ~= v13.PurchaseComplete, 
                bodyText = v47.messageText, 
                buttons = {
                    onActivated = v44.confirmButtonPressed, 
                    text = v46.OkButtonText, 
                    onClose = v44.cancelButtonPressed
                }
            });
        else
            return v2.createElement(l_UnifiedPurchaseCompletionModal_0, {
                title = v47.titleText, 
                isError = v44.promptState ~= v13.PurchaseComplete, 
                bodyText = v47.messageText, 
                buttons = {
                    onActivated = v44.confirmButtonPressed, 
                    text = v46.OkButtonText, 
                    onClose = v44.cancelButtonPressed
                }
            });
        end;
    else
        return v2.createElement(l_InteractiveAlert_0, {
            screenSize = v44.screenSize, 
            title = v47.titleText, 
            titleIcon = v44.titleIcon, 
            bodyText = v47.messageText, 
            buttonStackInfo = {
                buttons = v43(v44, v46)
            }
        });
    end;
end;
return function(v49) --[[ Line: 321 ]] --[[ Name: ProductPurchasePromptContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v48 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchasePrompt = v2.createElement(v48, v49)
    });
end;