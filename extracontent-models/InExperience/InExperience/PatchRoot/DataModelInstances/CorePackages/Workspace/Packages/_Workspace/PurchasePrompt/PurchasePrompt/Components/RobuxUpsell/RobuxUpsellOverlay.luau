local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.PurchasePromptDeps);
local l_Roact_0 = v4.Roact;
local l_IAPExperience_0 = v4.IAPExperience;
local l_RobuxUpsellFlow_0 = l_IAPExperience_0.PurchaseFlow.RobuxUpsellFlow;
local l_RobuxUpsellFlowState_0 = l_IAPExperience_0.PurchaseFlow.RobuxUpsellFlowState;
local l_U13ConfirmType_0 = l_IAPExperience_0.PurchaseFlow.U13ConfirmType;
local l_PurchaseErrorType_0 = l_IAPExperience_0.PurchaseFlow.PurchaseErrorType;
local _ = require(l_script_FirstAncestor_0.Models.RobuxUpsell);
local v12 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v13 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v14 = require(l_script_FirstAncestor_0.Enums.VPCModalType);
local v15 = require(l_script_FirstAncestor_0.Utils.AppContext);
local v16 = l_Roact_0.PureComponent:extend(script.Name);
local v17 = require(l_script_FirstAncestor_0.Flags.GetFFlagDisablePurchasePromptFunctionForMaquettes);
local v18 = require(l_script_FirstAncestor_0.Enums.PaymentPlatform);
local v19 = require(l_script_FirstAncestor_0.Utils.getPaymentPlatform);
local v20 = require(l_script_FirstAncestor_0.Utils.getUnifiedPurchaseModalType);
local v21 = require(l_script_FirstAncestor_0.Utils.emitPerformanceMetrics);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v23 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v24 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v25 = require(l_script_FirstAncestor_0.Utils.logUnifiedPurchaseTelemetryCounter);
local v26 = require(l_script_FirstAncestor_0.Utils.sendUnifiedPurchaseEventLog);
local v27 = require(l_script_FirstAncestor_0.Enums.UnifiedPurchaseEventNameEnum);
local v28 = require(l_script_FirstAncestor_0.Misc.Constants);
local l_HttpService_0 = game:GetService("HttpService");
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagFixCountersForUpsellModalShown);
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
v16.init = function(v34) --[[ Line: 103 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v25 (copy), v24 (copy), v27 (copy), l_Players_0 (copy), v12 (copy), v13 (copy), v30 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v21 (copy), v28 (copy)
    v34.state = {
        canAcceptInput = false
    };
    v34.dispatchFetchPurchaseWarning = function() --[[ Line: 108 ]]
        -- upvalues: v34 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v25 (ref), v24 (ref), v27 (ref)
        local l_props_0 = v34.props;
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v34.props.useUnifiedProductPurchaseModal then
            local v36 = v34.props.purchaseAnalyticsMetadata or {};
            v25(v24.UnifiedRobuxUpsellModalBuyButtonClickedCounter, v36.surface, v36.productType);
            v34:emitUnifiedPurchaseTelemetry(v27.RobuxUpsellModalBuyClicked);
        end;
        return v34.props.dispatchFetchPurchaseWarning(l_props_0.robuxProviderId);
    end;
    v34.promptRobuxPurchase = function() --[[ Line: 123 ]]
        -- upvalues: v34 (copy)
        local l_props_1 = v34.props;
        v34.props.promptRobuxPurchase(v34.props.networking, l_props_1.robuxProviderId, l_props_1.robuxProductId);
    end;
    v34.onDelayedInputComplete = function() --[[ Line: 128 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            canAcceptInput = true
        });
    end;
    v34.canAcceptInput = function() --[[ Line: 134 ]]
        -- upvalues: v34 (copy), l_Players_0 (ref)
        local l_state_0 = v34.state;
        if l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.GameplayPaused then
            return false;
        else
            return l_state_0.canAcceptInput;
        end;
    end;
    v34.confirmButtonPressed = function() --[[ Line: 144 ]]
        -- upvalues: v34 (copy), v12 (ref), v13 (ref)
        local l_props_2 = v34.props;
        local l_promptState_0 = l_props_2.promptState;
        local l_purchaseError_0 = l_props_2.purchaseError;
        if not v34.canAcceptInput() then
            return;
        elseif l_promptState_0 == v12.RobuxUpsell then
            l_props_2.dispatchFetchPurchaseWarning();
            return;
        elseif l_promptState_0 == v12.LargeRobuxUpsell then
            l_props_2.openRobuxStore();
            return;
        elseif l_promptState_0 == v12.U13PaymentModal or l_promptState_0 == v12.U13MonthlyThreshold1Modal or l_promptState_0 == v12.U13MonthlyThreshold2Modal or l_promptState_0 == v12.ParentalConsentWarningPaymentModal13To17 then
            l_props_2.promptRobuxPurchase();
            return;
        elseif l_promptState_0 == v12.PurchaseComplete then
            l_props_2.endPurchase();
            return;
        elseif l_promptState_0 == v12.Error then
            if l_purchaseError_0 == v13.TwoFactorNeeded or l_purchaseError_0 == v13.TwoFactorNeededSettings then
                l_props_2.openSecuritySettings();
                return;
            else
                l_props_2.endPurchase();
                return;
            end;
        else
            return;
        end;
    end;
    v34.cancelButtonPressed = function() --[[ Line: 184 ]]
        -- upvalues: v34 (copy)
        v34.props.endPurchase();
    end;
    v34.onBuyItemButtonMounted = function(_) --[[ Line: 190 ]]
        -- upvalues: v34 (copy), v30 (ref), v25 (ref), v24 (ref), v27 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), v21 (ref), v28 (ref)
        local v43 = v34.props.purchaseAnalyticsMetadata or {};
        if v30 then
            v25(v24.UnifiedRobuxUpsellModalShownCounter, v43.surface, v43.productType);
        else
            v25(v24.UnifiedRobuxUpsellModalBuyButtonClickedCounter, v43.surface, v43.productType);
        end;
        v34:emitUnifiedPurchaseTelemetry(v27.RobuxUpsellModalShown);
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and v43 and v43.surface then
            v21(v28.PerformanceMetrics.IntervalName.RobuxUpsellModalShown, v43.surface);
        end;
    end;
end;
v16.didMount = function(v44) --[[ Line: 219 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v46, _) --[[ Line: 220 ]]
        -- upvalues: v44 (copy)
        if v46 == Enum.UserInputState.Begin then
            v44.confirmButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v49, _) --[[ Line: 225 ]]
        -- upvalues: v44 (copy)
        if v49 == Enum.UserInputState.Begin then
            v44.cancelButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonB);
end;
v16.willUnmount = function(_) --[[ Line: 232 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
end;
v16.getFlowState = function(v52) --[[ Line: 237 ]] --[[ Name: getFlowState ]]
    -- upvalues: v12 (copy), l_RobuxUpsellFlowState_0 (copy), v13 (copy)
    local l_props_3 = v52.props;
    local l_promptState_1 = l_props_3.promptState;
    local l_purchaseError_1 = l_props_3.purchaseError;
    if l_promptState_1 == v12.RobuxUpsell then
        return l_RobuxUpsellFlowState_0.PurchaseModal;
    elseif l_promptState_1 == v12.LargeRobuxUpsell then
        return l_RobuxUpsellFlowState_0.LargeRobuxPurchaseModal;
    elseif l_promptState_1 == v12.PurchaseInProgress then
        return l_RobuxUpsellFlowState_0.ItemPurchasePending;
    elseif l_promptState_1 == v12.UpsellInProgress then
        return l_RobuxUpsellFlowState_0.RobuxPurchasePending;
    elseif l_promptState_1 == v12.PollingBalance then
        return l_RobuxUpsellFlowState_0.RobuxGrantPending;
    elseif l_promptState_1 == v12.U13PaymentModal then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_promptState_1 == v12.U13MonthlyThreshold1Modal then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_promptState_1 == v12.U13MonthlyThreshold2Modal then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_promptState_1 == v12.PurchaseComplete then
        return l_RobuxUpsellFlowState_0.Success;
    elseif l_promptState_1 == v12.LeaveRobloxWarning then
        return l_RobuxUpsellFlowState_0.LeaveRobloxWarning;
    elseif l_promptState_1 == v12.EnablePurchaseVPCModal then
        return l_RobuxUpsellFlowState_0.PurchaseVPCModal;
    elseif l_promptState_1 == v12.Error then
        if l_purchaseError_1 == v13.TwoFactorNeeded or l_purchaseError_1 == v13.TwoFactorNeededSettings then
            return l_RobuxUpsellFlowState_0.TwoStepRequired;
        else
            return l_RobuxUpsellFlowState_0.Error;
        end;
    else
        return l_RobuxUpsellFlowState_0.None;
    end;
end;
v16.getU13ConfirmType = function(v56) --[[ Line: 275 ]] --[[ Name: getU13ConfirmType ]]
    -- upvalues: v12 (copy), l_U13ConfirmType_0 (copy)
    local l_promptState_2 = v56.props.promptState;
    if l_promptState_2 == v12.U13PaymentModal then
        return l_U13ConfirmType_0.U13PaymentModal;
    elseif l_promptState_2 == v12.U13MonthlyThreshold1Modal then
        return l_U13ConfirmType_0.U13MonthlyThreshold1Modal;
    elseif l_promptState_2 == v12.U13MonthlyThreshold2Modal then
        return l_U13ConfirmType_0.U13MonthlyThreshold2Modal;
    elseif l_promptState_2 == v12.ParentalConsentWarningPaymentModal13To17 then
        return l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17;
    else
        return l_U13ConfirmType_0.None;
    end;
end;
v16.getErrorType = function(v58) --[[ Line: 293 ]] --[[ Name: getErrorType ]]
    -- upvalues: v13 (copy), l_PurchaseErrorType_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v15 (copy)
    local l_props_4 = v58.props;
    if l_props_4.purchaseError == v13.AlreadyOwn then
        return l_PurchaseErrorType_0.AlreadyOwn;
    elseif l_props_4.purchaseError == v13.NotEnoughRobux or l_props_4.purchaseError == v13.NotEnoughRobuxXbox or l_props_4.purchaseError == v13.NotEnoughRobuxNoUpsell then
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_props_4.useUnifiedProductPurchaseModal and v15.get() == v15.Enum.IN_APP then
            return l_PurchaseErrorType_0.NotEnoughRobuxInApp;
        else
            return l_PurchaseErrorType_0.NotEnoughRobux;
        end;
    elseif l_props_4.purchaseError == v13.Limited then
        return l_PurchaseErrorType_0.Limited;
    elseif l_props_4.purchaseError == v13.NotForSale then
        return l_PurchaseErrorType_0.NotForSale;
    elseif l_props_4.purchaseError == v13.NotForSaleHere then
        return l_PurchaseErrorType_0.NotForSaleExperience;
    elseif l_props_4.purchaseError == v13.PremiumOnly then
        return l_PurchaseErrorType_0.PremiumOnly;
    elseif l_props_4.purchaseError == v13.ThirdPartyDisabled then
        return l_PurchaseErrorType_0.ThirdPartyDisabled;
    elseif l_props_4.purchaseError == v13.Under13 then
        return l_PurchaseErrorType_0.Under13;
    elseif l_props_4.purchaseError == v13.InvalidFunds then
        return l_PurchaseErrorType_0.FailedGrant;
    elseif l_props_4.purchaseError == v13.InvalidFundsUnknown then
        return l_PurchaseErrorType_0.FailedGrantUnknown;
    elseif l_props_4.purchaseError == v13.EconomicRestriction then
        return l_PurchaseErrorType_0.EconomicRestriction;
    else
        return l_PurchaseErrorType_0.Unknown;
    end;
end;
v16.getVPCModalType = function(v60) --[[ Line: 333 ]] --[[ Name: getVPCModalType ]]
    -- upvalues: v12 (copy), v14 (copy)
    if v60.props.promptState == v12.EnablePurchaseVPCModal then
        return v14.toRawValue(v14.EnablePurchase);
    else
        return v14.toRawValue(v14.None);
    end;
end;
v16.emitUnifiedPurchaseTelemetry = function(v61, v62) --[[ Line: 345 ]] --[[ Name: emitUnifiedPurchaseTelemetry ]]
    -- upvalues: l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), l_HttpService_0 (copy), v26 (copy)
    local l_props_5 = v61.props;
    local v64 = l_props_5.purchaseAnalyticsMetadata or {};
    local v65 = {
        event_name = v62, 
        purchase_flow_uuid = v64.purchaseFlowUUID, 
        product_id = v64.productId, 
        product_type = v64.productType, 
        product_target_id = v64.productTargetId, 
        robux_price = v64.price, 
        surface = v64.surface, 
        user_roblox_balance = v64.userRobuxBalance, 
        salelocation_universeid = v64.saleLocationUniverseId, 
        product_universeid = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v64.productUniverseId else nil, 
        event_metadata = l_HttpService_0:JSONEncode({
            upsell_robux_package_id = l_props_5.robuxProductId, 
            upsell_robux_package_amount = l_props_5.iapRobuxAmount
        })
    };
    v26(v65);
end;
v16.render = function(v66) --[[ Line: 371 ]] --[[ Name: render ]]
    -- upvalues: v23 (copy), l_Roact_0 (copy), l_RobuxUpsellFlow_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v20 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v17 (copy), v19 (copy), v18 (copy)
    local l_props_6 = v66.props;
    local v68 = v23.new();
    return l_Roact_0.createElement(l_RobuxUpsellFlow_0, {
        screenSize = l_props_6.screenSize, 
        shouldAnimate = true, 
        isDelayedInput = true, 
        onDelayedInputComplete = v66.onDelayedInputComplete, 
        model = l_props_6.humanoidModel, 
        itemIcon = l_props_6.itemIcon, 
        itemProductId = l_props_6.itemProductId, 
        itemName = l_props_6.itemName, 
        itemRobuxCost = l_props_6.itemRobuxCost, 
        iapCostStr = l_props_6.iapCostStr, 
        iapRobuxAmount = l_props_6.iapRobuxAmount, 
        beforeRobuxBalance = l_props_6.beforeRobuxBalance, 
        useUpsellSuggestions = l_props_6.useUpsellSuggestions, 
        upsellSuggestions = l_props_6.upsellSuggestions, 
        selectedUpsellIndex = l_props_6.selectedUpsellIndex, 
        onUpsellSuggestionsSelected = l_props_6.onUpsellSuggestionsSelected, 
        virtualItemBadgeType = l_props_6.virtualItemBadgeType, 
        useUnifiedProductPurchaseModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then l_props_6.useUnifiedProductPurchaseModal else nil, 
        unifiedProductPurchaseModalType = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v20(l_props_6.requestType) else nil, 
        onBuyItemButtonMounted = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v66.onBuyItemButtonMounted else nil, 
        hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then l_props_6.purchaseAnalyticsMetadata and l_props_6.purchaseAnalyticsMetadata.surface == "Catalog" else nil, 
        purchaseState = v66:getFlowState(), 
        errorType = v66:getErrorType(), 
        economicRestrictionError = l_props_6.economicRestrictionError, 
        u13ConfirmType = v66:getU13ConfirmType(), 
        purchaseVPCType = v66:getVPCModalType(), 
        acceptControllerIcon = l_props_6.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
        cancelControllerIcon = l_props_6.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
        purchaseRobux = v66.dispatchFetchPurchaseWarning, 
        acceptPurchaseWarning = v66.promptRobuxPurchase, 
        openBuyRobux = l_props_6.openRobuxStore, 
        showTermsOfUse = l_props_6.openTermsOfUse, 
        openSecuritySettings = l_props_6.openSecuritySettings, 
        cancelPurchase = l_props_6.endPurchase, 
        flowComplete = l_props_6.endPurchase, 
        onAnalyticEvent = l_props_6.onAnalyticEvent, 
        eventPrefix = "InGame", 
        isQuest = v17() and v19(v68.getPlatform()) == v18.Maquettes
    });
end;
return v16;