local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Enums.RobloxSubscriptionFlowCompleteReason);
local _ = require(l_script_FirstAncestor_0.types);
local v6 = nil;
local function v30() --[[ Line: 44 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v7, v8 = v2.createSignal(v3.Unspecified);
    local v9, v10 = v2.createSignal(nil);
    local v11, v12 = v2.createSignal(false);
    local v13, v14 = v2.createSignal({});
    local v15, v16 = v2.createSignal("");
    local v17, v18 = v2.createSignal(false);
    local v19, v20 = v2.createSignal({});
    local v21 = nil;
    local v22 = nil;
    local function v24(v23) --[[ Line: 59 ]] --[[ Name: setOnFlowComplete ]]
        -- upvalues: v21 (ref)
        v21 = v23;
    end;
    local function v26(v25) --[[ Line: 63 ]] --[[ Name: triggerOnFlowComplete ]]
        -- upvalues: v21 (ref)
        if v21 then
            v21(v25);
        end;
    end;
    local function v28(v27) --[[ Line: 69 ]] --[[ Name: setOnUnmountUI ]]
        -- upvalues: v22 (ref)
        v22 = v27;
    end;
    local function v29() --[[ Line: 73 ]] --[[ Name: triggerUnmountUI ]]
        -- upvalues: v22 (ref)
        if v22 then
            v22();
            v22 = nil;
        end;
    end;
    return {
        getPromptState = v7, 
        setPromptState = v8, 
        getRobloxSubscriptionProduct = v9, 
        setRobloxSubscriptionProduct = v10, 
        getDidTryPurchasing = v11, 
        setDidTryPurchasing = v12, 
        getPaymentSessionId = v15, 
        setPaymentSessionId = v16, 
        getEntryContext = v19, 
        setEntryContext = v20, 
        setOnFlowComplete = v24, 
        triggerOnFlowComplete = v26, 
        getPurchaseUIOptions = v13, 
        setPurchaseUIOptions = v14, 
        getIsNativePurchase = v17, 
        setIsNativePurchase = v18, 
        setOnUnmountUI = v28, 
        triggerUnmountUI = v29
    };
end;
return {
    get = function() --[[ Line: 104 ]]
        -- upvalues: v6 (ref), v2 (copy), v30 (copy)
        if v6 == nil then
            v6 = v2.createComputed(v30)(false);
        end;
        return v6;
    end, 
    cleanup = function() --[[ Line: 111 ]]
        -- upvalues: v6 (ref)
        v6 = nil;
    end
};