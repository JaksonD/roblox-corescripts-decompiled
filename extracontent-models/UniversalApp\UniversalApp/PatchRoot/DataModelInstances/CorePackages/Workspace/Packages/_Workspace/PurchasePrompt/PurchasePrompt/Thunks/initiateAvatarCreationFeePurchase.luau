local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.RequestAvatarCreationFeePurchase);
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Services.ExternalSettings);
local v6 = require(l_Parent_0.Network.getBalanceInfo);
local v7 = require(l_Parent_0.Network.getAccountInfo);
local v8 = require(l_Parent_0.Actions.ErrorOccurred);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v10 = require(l_Parent_0.Network.getUnifiedPurchaseFlowEligibility);
local v11 = require(script.Parent.resolvePromptState);
local v12 = {
    v4, 
    v5
};
return function(v13, v14, v15, v16) --[[ Line: 25 ]] --[[ Name: initiateAvatarCreationFeePurchase ]]
    -- upvalues: v3 (copy), v12 (copy), v4 (copy), v5 (copy), v1 (copy), v2 (copy), v7 (copy), v6 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v10 (copy), v11 (copy), v8 (copy)
    return v3.new(script.Name, v12, function(v17, v18) --[[ Line: 26 ]]
        -- upvalues: v4 (ref), v5 (ref), v1 (ref), v15 (copy), v14 (copy), v2 (ref), v7 (ref), v6 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v10 (ref), v16 (copy), v13 (copy), v11 (ref), v8 (ref)
        local v19 = v18[v4];
        local v20 = v18[v5];
        v17:dispatch(v1(v15, v14));
        return v2.all({
            accountInfo = v7(v19, v20), 
            balanceInfo = v6(v19, v20, true), 
            isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10(v19) else nil
        }):andThen(function(v21) --[[ Line: 39 ]]
            -- upvalues: v16 (ref), v13 (ref), v17 (copy), v11 (ref)
            local v22 = {
                PriceInRobux = v16, 
                Name = v13.name, 
                Description = v13.description
            };
            v17:dispatch(v11(v22, v21.accountInfo, v21.balanceInfo, false, true, v16, v21.isUserEligibleForUnifiedPurchaseFlow));
        end):catch(function(v23) --[[ Line: 57 ]]
            -- upvalues: v17 (copy), v8 (ref)
            v17:dispatch(v8(v23));
        end);
    end);
end;