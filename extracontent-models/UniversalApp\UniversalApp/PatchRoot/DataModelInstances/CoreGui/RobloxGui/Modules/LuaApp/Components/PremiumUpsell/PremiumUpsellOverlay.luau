local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_PremiumUpsellFlow_0 = v3.PurchaseFlow.PremiumUpsellFlow;
local l_PremiumUpsellFlowState_0 = v3.PurchaseFlow.PremiumUpsellFlowState;
local l_PurchaseErrorType_0 = v3.PurchaseFlow.PurchaseErrorType;
local v7 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v8 = require(script.Parent.Enum.PremiumUpsellCounter);
local v9 = v2.PureComponent:extend(script.Name);
v9.init = function(v10) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: l_PurchaseErrorType_0 (copy), v8 (copy)
    v10.state = {
        errorType = l_PurchaseErrorType_0.None
    };
    v10.failFlow = function(v11, v12) --[[ Line: 47 ]]
        -- upvalues: v10 (copy), v8 (ref), l_PurchaseErrorType_0 (ref)
        v10.sendCounter(v8.Failed);
        local v13 = {};
        if v12 ~= nil then
            v13 = v12;
        end;
        if v11 ~= nil then
            v13.errorType = v11;
        else
            v13.errorType = l_PurchaseErrorType_0.Unknown;
        end;
        v10:setState(v13);
    end;
    v10.purchasePremium = function() --[[ Line: 63 ]]
        -- upvalues: v10 (copy), v8 (ref)
        v10.sendCounter(v8.Confirmed);
        v10.props.promptPremium();
    end;
    v10.cancelPurchase = function() --[[ Line: 68 ]]
        -- upvalues: v10 (copy), v8 (ref)
        v10.sendCounter(v8.Cancelled);
        v10.props.cancelPurchase();
    end;
    v10.flowComplete = function() --[[ Line: 73 ]]
        -- upvalues: v10 (copy)
        v10.props.endPurchase();
    end;
    v10.sendAnalyticEvent = function(v14, v15) --[[ Line: 77 ]]
        -- upvalues: v10 (copy)
        v10.props.sendAnalyticEvent(v10.props.eventPrefix .. "PremiumUpsell", v14, v15);
    end;
    v10.sendCounter = function(v16) --[[ Line: 81 ]]
        -- upvalues: v10 (copy), v8 (ref)
        v10.props.sendCounter(v8.toRawValue(v16));
    end;
end;
v9.didMount = function(v17) --[[ Line: 86 ]] --[[ Name: didMount ]]
    -- upvalues: v8 (copy)
    v17.sendCounter(v8.Shown);
end;
v9.didUpdate = function(v18, v19) --[[ Line: 90 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy), v8 (copy)
    local l_props_0 = v18.props;
    if l_props_0.iapProductsFetchingStatus ~= v19.iapProductsFetchingStatus and l_props_0.iapProductsFetchingStatus == v7.Failed then
        v18.sendCounter(v8.InvalidProducts);
        v18.failFlow();
    end;
end;
v9.getFlowState = function(v21) --[[ Line: 101 ]] --[[ Name: getFlowState ]]
    -- upvalues: l_PurchaseErrorType_0 (copy), l_PremiumUpsellFlowState_0 (copy), v7 (copy)
    local l_state_0 = v21.state;
    local l_props_1 = v21.props;
    if l_state_0.errorType ~= l_PurchaseErrorType_0.None then
        return l_PremiumUpsellFlowState_0.Error;
    elseif l_props_1.iapProductsFetchingStatus ~= v7.Done then
        return l_PremiumUpsellFlowState_0.None;
    elseif l_props_1.robuxPrice ~= nil then
        return l_PremiumUpsellFlowState_0.PurchaseModal;
    else
        return l_PremiumUpsellFlowState_0.Error;
    end;
end;
v9.getErrorType = function(v24) --[[ Line: 122 ]] --[[ Name: getErrorType ]]
    return v24.state.errorType;
end;
v9.render = function(v25) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_PremiumUpsellFlow_0 (copy)
    local l_props_2 = v25.props;
    return v2.createElement(l_PremiumUpsellFlow_0, {
        screenSize = l_props_2.screenSize, 
        currencySymbol = l_props_2.currencySymbol, 
        robuxPrice = l_props_2.robuxPrice, 
        robuxAmount = l_props_2.robuxAmount, 
        purchaseState = v25:getFlowState(), 
        errorType = v25:getErrorType(), 
        purchasePremium = v25.purchasePremium, 
        cancelPurchase = v25.cancelPurchase, 
        flowComplete = v25.flowComplete, 
        onAnalyticEvent = v25.sendAnalyticEvent, 
        eventPrefix = l_props_2.eventPrefix, 
        dispatchCentralOverlay = l_props_2.dispatchCentralOverlay
    });
end;
return v9;