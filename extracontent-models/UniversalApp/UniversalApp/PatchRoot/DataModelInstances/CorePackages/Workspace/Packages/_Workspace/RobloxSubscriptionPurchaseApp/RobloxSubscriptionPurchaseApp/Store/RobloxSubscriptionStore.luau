local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Enums.RobloxSubscriptionFlowCompleteReason);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local _ = require(l_script_FirstAncestor_0.types);
local v7 = nil;
local function v36() --[[ Line: 48 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v8, v9 = v2.createSignal(v3.Unspecified);
    local v10, v11 = v2.createSignal(nil);
    local v12, v13 = v2.createSignal(false);
    local v14, v15 = v2.createSignal({});
    local v16, v17 = v2.createSignal("");
    local v18, v19 = v2.createSignal(false);
    local v20, v21 = v2.createSignal({});
    local v22, v23 = v2.createSignal({});
    local v26 = v2.createComputed(function(v24) --[[ Line: 59 ]]
        -- upvalues: v10 (copy)
        local v25 = v10(v24);
        return v25 and v25.ProductKey and v25.ProductKey.Id or "";
    end);
    local v27 = nil;
    local v28 = nil;
    local function v30(v29) --[[ Line: 70 ]] --[[ Name: setOnFlowComplete ]]
        -- upvalues: v27 (ref)
        v27 = v29;
    end;
    local function v32(v31) --[[ Line: 74 ]] --[[ Name: triggerOnFlowComplete ]]
        -- upvalues: v27 (ref)
        if v27 then
            v27(v31);
        end;
    end;
    local function v34(v33) --[[ Line: 80 ]] --[[ Name: setOnUnmountUI ]]
        -- upvalues: v28 (ref)
        v28 = v33;
    end;
    local function v35() --[[ Line: 84 ]] --[[ Name: triggerUnmountUI ]]
        -- upvalues: v28 (ref)
        if v28 then
            v28();
            v28 = nil;
        end;
    end;
    return {
        getPromptState = v8, 
        setPromptState = v9, 
        getRobloxSubscriptionProduct = v10, 
        setRobloxSubscriptionProduct = v11, 
        getPurchaseFlowOptions = v22, 
        setPurchaseFlowOptions = v23, 
        getDidTryPurchasing = v12, 
        setDidTryPurchasing = v13, 
        getPaymentSessionId = v16, 
        setPaymentSessionId = v17, 
        getEntryContext = v20, 
        setEntryContext = v21, 
        setOnFlowComplete = v30, 
        triggerOnFlowComplete = v32, 
        getPurchaseUIOptions = v14, 
        setPurchaseUIOptions = v15, 
        getIsNativePurchase = v18, 
        setIsNativePurchase = v19, 
        getRobloxSubscriptionProductId = v26, 
        setOnUnmountUI = v34, 
        triggerUnmountUI = v35
    };
end;
return {
    get = function() --[[ Line: 118 ]]
        -- upvalues: v7 (ref), v2 (copy), v36 (copy)
        if v7 == nil then
            v7 = v2.createComputed(v36)(false);
        end;
        return v7;
    end, 
    cleanup = function() --[[ Line: 125 ]]
        -- upvalues: v7 (ref)
        v7 = nil;
    end
};