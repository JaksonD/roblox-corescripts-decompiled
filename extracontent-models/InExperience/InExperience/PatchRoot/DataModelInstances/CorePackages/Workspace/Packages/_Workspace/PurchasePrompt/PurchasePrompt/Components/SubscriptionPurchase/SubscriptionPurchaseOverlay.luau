local _ = game:GetService("ContextActionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.PurchasePromptDeps);
local v4 = require(l_Parent_0.ToastRodux);
local v5 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v6 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v8 = require(l_Parent_0.RobloxTranslator);
local l_Roact_0 = v3.Roact;
local l_ToastType_0 = v4.Enums.ToastType;
local l_IAPExperience_0 = v3.IAPExperience;
local l_SubscriptionPurchaseFlow_0 = l_IAPExperience_0.PurchaseFlow.SubscriptionPurchaseFlow;
local l_SubscriptionPurchaseFlowState_0 = l_IAPExperience_0.PurchaseFlow.SubscriptionPurchaseFlowState;
local l_PurchaseErrorType_0 = l_IAPExperience_0.PurchaseFlow.PurchaseErrorType;
local v15 = require(l_script_FirstAncestor_0.Enums.VPCModalType);
local v16 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableSubscriptionPurchaseToast);
local v17 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableVpcForInExperienceSubscriptionPurchase);
local v18 = l_Roact_0.PureComponent:extend(script.Name);
v18.init = function(v19) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v19.confirmButtonPressed = function() --[[ Line: 64 ]]
        -- upvalues: v19 (copy), v5 (ref)
        local l_props_0 = v19.props;
        local l_promptState_0 = l_props_0.promptState;
        if l_promptState_0 == v5.PromptSubscriptionPurchase then
            l_props_0.promptSubscriptionPurchase();
            return;
        elseif l_promptState_0 == v5.PurchaseComplete then
            l_props_0.endPurchase();
            return;
        elseif l_promptState_0 == v5.Error then
            l_props_0.endPurchase();
            return;
        else
            return;
        end;
    end;
    v19.cancelButtonPressed = function() --[[ Line: 80 ]]
        -- upvalues: v19 (copy)
        v19.props.endPurchase();
    end;
end;
v18.getFlowState = function(v22) --[[ Line: 87 ]] --[[ Name: getFlowState ]]
    -- upvalues: v5 (copy), l_SubscriptionPurchaseFlowState_0 (copy), v17 (copy), v6 (copy)
    local l_props_1 = v22.props;
    local l_promptState_1 = l_props_1.promptState;
    if l_promptState_1 == v5.PromptSubscriptionPurchase then
        return l_SubscriptionPurchaseFlowState_0.PurchaseModal;
    elseif l_promptState_1 == v5.Error then
        if v17() and l_props_1.purchaseError == v6.VpcRequired then
            return l_SubscriptionPurchaseFlowState_0.PurchaseVPCModal;
        else
            return l_SubscriptionPurchaseFlowState_0.Error;
        end;
    else
        return l_SubscriptionPurchaseFlowState_0.None;
    end;
end;
v18.getErrorType = function(v25) --[[ Line: 106 ]] --[[ Name: getErrorType ]]
    -- upvalues: v6 (copy), l_PurchaseErrorType_0 (copy)
    local l_props_2 = v25.props;
    if l_props_2.purchaseError == v6.AlreadySubscribed then
        return l_PurchaseErrorType_0.AlreadySubscribed;
    elseif l_props_2.purchaseError == v6.SubscriptionExceededUserSpendLimit then
        return l_PurchaseErrorType_0.SubscriptionExceededUserSpendLimit;
    elseif l_props_2.purchaseError == v6.SubscriptionUnsupportedLocale then
        return l_PurchaseErrorType_0.SubscriptionUnsupportedLocale;
    elseif l_props_2.purchaseError == v6.RestrictedUser then
        return l_PurchaseErrorType_0.RestrictedUser;
    elseif l_props_2.purchaseError == v6.SubscriptionPurchasePlatformNotSupported then
        return l_PurchaseErrorType_0.SubscriptionPurchasePlatformNotSupported;
    elseif l_props_2.purchaseError == v6.SubscriptionInvalidSaleLocation then
        return l_PurchaseErrorType_0.SubscriptionInvalidSaleLocation;
    elseif l_props_2.purchaseError == v6.SubscriptionNotForSale then
        return l_PurchaseErrorType_0.SubscriptionNotForSale;
    elseif l_props_2.purchaseError == v6.VpcRequired then
        return l_PurchaseErrorType_0.VpcRequired;
    elseif l_props_2.purchaseError == v6.ExceedParentalSpendLimit then
        return l_PurchaseErrorType_0.ExceedParentalSpendLimit;
    elseif l_props_2.purchaseError == v6.EconomicRestriction then
        return l_PurchaseErrorType_0.EconomicRestriction;
    else
        return l_PurchaseErrorType_0.Unknown;
    end;
end;
v18.getVPCModalType = function(_, v28) --[[ Line: 134 ]] --[[ Name: getVPCModalType ]]
    -- upvalues: l_SubscriptionPurchaseFlowState_0 (copy), v15 (copy)
    if v28 == l_SubscriptionPurchaseFlowState_0.PurchaseVPCModal then
        return v15.toRawValue(v15.EnablePurchase);
    else
        return v15.toRawValue(v15.None);
    end;
end;
v18.render = function(v29) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_SubscriptionPurchaseFlow_0 (copy)
    local l_props_3 = v29.props;
    local v31 = v29:getFlowState();
    local v32 = v29:getErrorType();
    return l_Roact_0.createElement(l_SubscriptionPurchaseFlow_0, {
        screenSize = l_props_3.screenSize, 
        purchaseState = v31, 
        errorType = v32, 
        economicRestrictionError = l_props_3.economicRestrictionError, 
        purchaseVPCType = v29:getVPCModalType(v31), 
        subscriptionId = l_props_3.subscriptionId, 
        name = l_props_3.name, 
        subscriptionProviderId = l_props_3.subscriptionProviderId, 
        subscriptionProviderName = l_props_3.subscriptionProviderName, 
        priceTier = l_props_3.priceTier, 
        displayPrice = l_props_3.displayPrice, 
        period = l_props_3.period, 
        disclaimerText = l_props_3.disclaimerText, 
        description = l_props_3.description, 
        itemIcon = l_props_3.itemIcon, 
        primaryPaymentMethod = l_props_3.primaryPaymentMethod, 
        secondaryPaymentMethod = l_props_3.secondaryPaymentMethod, 
        acceptControllerIcon = l_props_3.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
        isTestingMode = l_props_3.isTestingMode, 
        purchaseSubscription = l_props_3.promptSubscriptionPurchase, 
        cancelPurchase = l_props_3.endPurchase, 
        flowComplete = l_props_3.endPurchase, 
        onAnalyticEvent = l_props_3.onAnalyticEvent, 
        eventPrefix = "InGame"
    });
end;
v18.didUpdate = function(v33) --[[ Line: 183 ]] --[[ Name: didUpdate ]]
    -- upvalues: v16 (copy), l_SubscriptionPurchaseFlowState_0 (copy), l_PurchaseErrorType_0 (copy), v8 (copy), l_ToastType_0 (copy)
    if v16() then
        local v34 = v33:getFlowState();
        local v35 = v33:getErrorType();
        if v34 == l_SubscriptionPurchaseFlowState_0.Error and v35 == l_PurchaseErrorType_0.Unknown then
            v33.props.setCurrentToastMessage({
                toastTitle = v8:FormatByKey("Feature.Subscription.Error.GenericSubscribeError"), 
                toastType = l_ToastType_0.NetworkingError
            });
            v33.props.endPurchase();
        end;
    end;
end;
return v18;