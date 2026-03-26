local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Enums.RobloxSubscriptionFlowCompleteReason);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local _ = require(l_script_FirstAncestor_0.types);
local v7 = nil;
local function v40() --[[ Line: 50 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v8, v9 = v2.createSignal(v3.Unspecified);
    local v10, v11 = v2.createSignal(nil);
    local v12, v13 = v2.createSignal(false);
    local v14, v15 = v2.createSignal({});
    local v16, v17 = v2.createSignal("");
    local v18, v19 = v2.createSignal(false);
    local v20, v21 = v2.createSignal({});
    local v22, v23 = v2.createSignal({});
    local v26 = v2.createComputed(function(v24) --[[ Line: 61 ]]
        -- upvalues: v10 (copy)
        local v25 = v10(v24);
        return v25 and v25.ProductKey and v25.ProductKey.Id or "";
    end);
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local function v31(v30) --[[ Line: 72 ]] --[[ Name: setOnFlowComplete ]]
        -- upvalues: v27 (ref)
        v27 = v30;
    end;
    local function v33(v32) --[[ Line: 76 ]] --[[ Name: triggerOnFlowComplete ]]
        -- upvalues: v27 (ref)
        if v27 then
            v27(v32);
        end;
    end;
    local function v35(v34) --[[ Line: 82 ]] --[[ Name: setOnBackButtonActivated ]]
        -- upvalues: v29 (ref)
        v29 = v34;
    end;
    local function v36() --[[ Line: 86 ]] --[[ Name: triggerOnBackButtonActivated ]]
        -- upvalues: v29 (ref)
        if v29 then
            v29();
        end;
    end;
    local function v38(v37) --[[ Line: 92 ]] --[[ Name: setOnUnmountUI ]]
        -- upvalues: v28 (ref)
        v28 = v37;
    end;
    local function v39() --[[ Line: 96 ]] --[[ Name: triggerUnmountUI ]]
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
        setOnFlowComplete = v31, 
        triggerOnFlowComplete = v33, 
        getPurchaseUIOptions = v14, 
        setPurchaseUIOptions = v15, 
        getIsNativePurchase = v18, 
        setIsNativePurchase = v19, 
        getRobloxSubscriptionProductId = v26, 
        setOnUnmountUI = v38, 
        triggerUnmountUI = v39, 
        setOnBackButtonActivated = v35, 
        triggerOnBackButtonActivated = v36
    };
end;
return {
    get = function() --[[ Line: 132 ]]
        -- upvalues: v7 (ref), v2 (copy), v40 (copy)
        if v7 == nil then
            v7 = v2.createComputed(v40)(false);
        end;
        return v7;
    end, 
    cleanup = function() --[[ Line: 139 ]]
        -- upvalues: v7 (ref)
        v7 = nil;
    end
};