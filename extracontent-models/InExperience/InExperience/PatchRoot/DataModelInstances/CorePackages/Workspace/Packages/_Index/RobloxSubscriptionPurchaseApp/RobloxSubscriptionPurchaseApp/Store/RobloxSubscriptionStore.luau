local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Enums.RobloxSubscriptionFlowCompleteReason);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorReason);
local _ = require(l_script_FirstAncestor_0.types);
local v8 = nil;
local function v43() --[[ Line: 54 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v9, v10 = v2.createSignal(v3.Unspecified);
    local v11, v12 = v2.createSignal(nil);
    local v13, v14 = v2.createSignal(false);
    local v15, v16 = v2.createSignal({});
    local v17, v18 = v2.createSignal("");
    local v19, v20 = v2.createSignal(false);
    local v21, v22 = v2.createSignal({});
    local v23, v24 = v2.createSignal({});
    local v25, v26 = v2.createSignal(nil);
    local v29 = v2.createComputed(function(v27) --[[ Line: 66 ]]
        -- upvalues: v11 (copy)
        local v28 = v11(v27);
        return v28 and v28.ProductKey and v28.ProductKey.Id or "";
    end);
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local function v34(v33) --[[ Line: 77 ]] --[[ Name: setOnFlowComplete ]]
        -- upvalues: v30 (ref)
        v30 = v33;
    end;
    local function v36(v35) --[[ Line: 81 ]] --[[ Name: triggerOnFlowComplete ]]
        -- upvalues: v30 (ref)
        if v30 then
            v30(v35);
        end;
    end;
    local function v38(v37) --[[ Line: 87 ]] --[[ Name: setOnBackButtonActivated ]]
        -- upvalues: v32 (ref)
        v32 = v37;
    end;
    local function v39() --[[ Line: 91 ]] --[[ Name: triggerOnBackButtonActivated ]]
        -- upvalues: v32 (ref)
        if v32 then
            v32();
        end;
    end;
    local function v41(v40) --[[ Line: 97 ]] --[[ Name: setOnUnmountUI ]]
        -- upvalues: v31 (ref)
        v31 = v40;
    end;
    local function v42() --[[ Line: 101 ]] --[[ Name: triggerUnmountUI ]]
        -- upvalues: v31 (ref)
        if v31 then
            v31();
            v31 = nil;
        end;
    end;
    return {
        getPromptState = v9, 
        setPromptState = v10, 
        getRobloxSubscriptionProduct = v11, 
        setRobloxSubscriptionProduct = v12, 
        getPurchaseFlowOptions = v23, 
        setPurchaseFlowOptions = v24, 
        getDidTryPurchasing = v13, 
        setDidTryPurchasing = v14, 
        getPaymentSessionId = v17, 
        setPaymentSessionId = v18, 
        getEntryContext = v21, 
        setEntryContext = v22, 
        getErrorReason = v25, 
        setErrorReason = v26, 
        setOnFlowComplete = v34, 
        triggerOnFlowComplete = v36, 
        getPurchaseUIOptions = v15, 
        setPurchaseUIOptions = v16, 
        getIsNativePurchase = v19, 
        setIsNativePurchase = v20, 
        getRobloxSubscriptionProductId = v29, 
        setOnUnmountUI = v41, 
        triggerUnmountUI = v42, 
        setOnBackButtonActivated = v38, 
        triggerOnBackButtonActivated = v39
    };
end;
return {
    get = function() --[[ Line: 139 ]]
        -- upvalues: v8 (ref), v2 (copy), v43 (copy)
        if v8 == nil then
            v8 = v2.createComputed(v43)(false);
        end;
        return v8;
    end, 
    cleanup = function() --[[ Line: 146 ]]
        -- upvalues: v8 (ref)
        v8 = nil;
    end
};