local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.Counter);
local v2 = require(l_Parent_0.Enums.PurchaseFlow);
local v3 = require(l_Parent_0.Enums.PaymentPlatform);
local v4 = require(l_Parent_0.Services.Analytics);
local v5 = require(l_Parent_0.Services.ExternalSettings);
local v6 = require(l_Parent_0.Utils.getPaymentPlatform);
local v7 = require(l_Parent_0.Utils.getCounterCombinations);
local v8 = require(l_Parent_0.Utils.SelectedRobuxPackage);
local v9 = require(l_Parent_0.Thunk);
local v10 = {
    v4, 
    v5
};
return function(v11) --[[ Line: 23 ]] --[[ Name: sendCounter ]]
    -- upvalues: v9 (copy), v10 (copy), v4 (copy), v5 (copy), v1 (copy), v2 (copy), v8 (copy), v6 (copy), v3 (copy), v7 (copy)
    return v9.new(script.Name, v10, function(v12, v13) --[[ Line: 24 ]]
        -- upvalues: v4 (ref), v5 (ref), v1 (ref), v11 (copy), v2 (ref), v8 (ref), v6 (ref), v3 (ref), v7 (ref)
        local v14 = v13[v4];
        local v15 = v13[v5];
        local v16 = v1.toRawValue(v11);
        local v17 = v12:getState();
        local l_purchaseFlow_0 = v17.purchaseFlow;
        local v19 = if l_purchaseFlow_0 ~= nil then v2.toRawValue(l_purchaseFlow_0) else nil;
        local v20 = v8.getRobuxPurchaseAmount(v17);
        local v21 = v15.getPlatform();
        local v22 = v6(v21);
        local v23 = v3.toRawValue(v22);
        for _, v25 in (v7("PurchasePrompt", v16, v23, v19, v20)) do
            v14.sendCounter(v25);
        end;
    end);
end;