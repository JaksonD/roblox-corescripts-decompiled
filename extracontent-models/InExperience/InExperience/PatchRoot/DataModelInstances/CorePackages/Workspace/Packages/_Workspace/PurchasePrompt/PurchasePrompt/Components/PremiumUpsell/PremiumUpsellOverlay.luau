local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.PurchasePromptDeps);
local l_Roact_0 = v3.Roact;
local l_IAPExperience_0 = v3.IAPExperience;
local l_PremiumUpsellFlow_0 = l_IAPExperience_0.PurchaseFlow.PremiumUpsellFlow;
local l_PremiumUpsellFlowState_0 = l_IAPExperience_0.PurchaseFlow.PremiumUpsellFlowState;
local l_PurchaseErrorType_0 = l_IAPExperience_0.PurchaseFlow.PurchaseErrorType;
local v9 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v10 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v11 = require(l_script_FirstAncestor_0.Enums.VPCModalType);
local v12 = l_Roact_0.PureComponent:extend(script.Name);
local v13 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableVpcForInExperiencePremiumUpsell);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
v12.init = function(v15) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v13 (copy)
    v15.confirmButtonPressed = function() --[[ Line: 52 ]]
        -- upvalues: v15 (copy), v9 (ref), v13 (ref)
        local l_props_0 = v15.props;
        local l_promptState_0 = l_props_0.promptState;
        if l_promptState_0 == v9.PremiumUpsell then
            if v13() then
                l_props_0.dispatchPremiumPrecheck();
                return;
            else
                l_props_0.promptPremiumPurchase();
                return;
            end;
        elseif l_promptState_0 == v9.PurchaseComplete then
            l_props_0.endPurchase();
            return;
        elseif l_promptState_0 == v9.Error then
            l_props_0.endPurchase();
            return;
        else
            return;
        end;
    end;
    v15.cancelButtonPressed = function() --[[ Line: 72 ]]
        -- upvalues: v15 (copy)
        v15.props.endPurchase();
    end;
end;
v12.didMount = function(v18) --[[ Line: 79 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("PremiumPurchaseConfirmButtonBind", function(_, v20, _) --[[ Line: 80 ]]
        -- upvalues: v18 (copy)
        if v20 == Enum.UserInputState.Begin then
            v18.confirmButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("PremiumPurchaseCancelButtonBind", function(_, v23, _) --[[ Line: 85 ]]
        -- upvalues: v18 (copy)
        if v23 == Enum.UserInputState.Begin then
            v18.cancelButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonB);
end;
v12.willUnmount = function(_) --[[ Line: 92 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("PremiumPurchaseConfirmButtonBind");
    l_ContextActionService_0:UnbindCoreAction("PremiumPurchaseCancelButtonBind");
end;
v12.getFlowState = function(v26) --[[ Line: 97 ]] --[[ Name: getFlowState ]]
    -- upvalues: v9 (copy), l_PremiumUpsellFlowState_0 (copy)
    local l_promptState_1 = v26.props.promptState;
    if l_promptState_1 == v9.PremiumUpsell then
        return l_PremiumUpsellFlowState_0.PurchaseModal;
    elseif l_promptState_1 == v9.Error then
        return l_PremiumUpsellFlowState_0.Error;
    elseif l_promptState_1 == v9.EnablePurchaseVPCModal then
        return l_PremiumUpsellFlowState_0.PurchaseVPCModal;
    else
        return l_PremiumUpsellFlowState_0.None;
    end;
end;
v12.getErrorType = function(v28) --[[ Line: 113 ]] --[[ Name: getErrorType ]]
    -- upvalues: v10 (copy), l_PurchaseErrorType_0 (copy)
    local l_props_1 = v28.props;
    if l_props_1.purchaseError == v10.AlreadyPremium then
        return l_PurchaseErrorType_0.AlreadyPremium;
    elseif l_props_1.purchaseError == v10.PremiumUnavailablePlatform then
        return l_PurchaseErrorType_0.PremiumPlatformUnavailable;
    elseif l_props_1.purchaseError == v10.EconomicRestriction then
        return l_PurchaseErrorType_0.EconomicRestriction;
    else
        return l_PurchaseErrorType_0.Unknown;
    end;
end;
v12.getVPCModalType = function(v30) --[[ Line: 127 ]] --[[ Name: getVPCModalType ]]
    -- upvalues: v9 (copy), v11 (copy)
    if v30.props.promptState == v9.EnablePurchaseVPCModal then
        return v11.toRawValue(v11.EnablePurchase);
    else
        return v11.toRawValue(v11.None);
    end;
end;
v12.render = function(v31) --[[ Line: 137 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_PremiumUpsellFlow_0 (copy), v13 (copy)
    local l_props_2 = v31.props;
    return l_Roact_0.createElement(l_PremiumUpsellFlow_0, {
        screenSize = l_props_2.screenSize, 
        isCatalog = false, 
        currencySymbol = l_props_2.currencySymbol, 
        robuxPrice = l_props_2.robuxPrice, 
        robuxAmount = l_props_2.robuxAmount, 
        purchaseState = v31:getFlowState(), 
        errorType = v31:getErrorType(), 
        economicRestrictionError = l_props_2.economicRestrictionError, 
        purchaseVPCType = v31:getVPCModalType(), 
        acceptControllerIcon = l_props_2.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
        purchasePremium = if v13() then l_props_2.dispatchPremiumPrecheck else l_props_2.promptPremiumPurchase, 
        cancelPurchase = l_props_2.endPurchase, 
        flowComplete = l_props_2.endPurchase, 
        onAnalyticEvent = l_props_2.onAnalyticEvent, 
        eventPrefix = "InGame"
    });
end;
return v12;