local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Reducers.Reducer);
local v4 = require(l_script_FirstAncestor_0.Services.ABTest);
local v5 = require(l_script_FirstAncestor_0.Services.Network);
local v6 = require(l_script_FirstAncestor_0.Services.Analytics);
local v7 = require(l_script_FirstAncestor_0.Services.PlatformInterface);
local v8 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v9 = require(l_script_FirstAncestor_0.Thunk);
local v10 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
return {
    getMockPurchaseFlow = function(v11) --[[ Line: 17 ]] --[[ Name: getMockPurchaseFlow ]]
        -- upvalues: v10 (copy)
        return v11 or v10.Product;
    end, 
    getMockNativeUpsell = function(_, _, _) --[[ Line: 21 ]] --[[ Name: getMockNativeUpsell ]]
        return {
            robuxProductId = "testRobuxProductId", 
            productId = "testProductId", 
            robuxPurchaseAmount = 500
        };
    end, 
    getMockRobuxUpsellSuggestions = function(v15) --[[ Line: 29 ]] --[[ Name: getMockRobuxUpsellSuggestions ]]
        return {
            products = v15 or {
                {
                    providerId = "testRobuxProductId", 
                    productId = "testProductId", 
                    robuxAmount = 500, 
                    robuxAmountBeforeBonus = 450, 
                    price = "4.99"
                }
            }, 
            selection = 1
        };
    end, 
    getMockStore = function() --[[ Line: 44 ]] --[[ Name: getMockStore ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), l_Rodux_0 (copy), v3 (copy), v9 (copy)
        local v16 = v4.new();
        local v17 = v5.new();
        local v18 = v6.new();
        local v19 = v7.new();
        local v20 = v8.new();
        return l_Rodux_0.Store.new(v3, {}, {
            v9.middleware({
                [v4] = v16, 
                [v5] = v17, 
                [v6] = v18, 
                [v7] = v19, 
                [v8] = v20
            })
        });
    end
};