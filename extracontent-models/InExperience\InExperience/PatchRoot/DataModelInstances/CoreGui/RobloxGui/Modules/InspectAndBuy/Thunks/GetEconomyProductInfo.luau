local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Models.BundleInfo);
local v6 = require(l_Parent_0.Services.Network);
local v7 = require(l_Parent_0.Actions.SetAssets);
local v8 = require(l_Parent_0.Actions.SetBundles);
local v9 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v10 = require(l_Parent_0.Thunks.SendCounter);
local v11 = require(l_Parent_0.Constants);
local v12 = {
    v6
};
local v13 = v9("getEconomyProductInfo");
return function(v14, v15, v16) --[[ Line: 26 ]] --[[ Name: GetEconomyProductInfo ]]
    -- upvalues: v3 (copy), v12 (copy), v6 (copy), v13 (copy), l_PerformFetch_0 (copy), v4 (copy), v7 (copy), v5 (copy), v8 (copy), v10 (copy), v11 (copy)
    return v3.new(script.Name, v12, function(v17, v18) --[[ Line: 27 ]]
        -- upvalues: v6 (ref), v13 (ref), v14 (copy), l_PerformFetch_0 (ref), v15 (copy), v4 (ref), v7 (ref), v5 (ref), v16 (copy), v8 (ref), v10 (ref), v11 (ref)
        local v19 = v18[v6];
        local v20 = v13(v17:getState().storeId, v14);
        return l_PerformFetch_0.Single(v20, function() --[[ Line: 32 ]]
            -- upvalues: v19 (copy), v14 (ref), v15 (ref), v4 (ref), v17 (copy), v7 (ref), v5 (ref), v16 (ref), v8 (ref), v10 (ref), v11 (ref)
            return v19.getEconomyProductInfo(v14):andThen(function(v21) --[[ Line: 33 ]]
                -- upvalues: v15 (ref), v4 (ref), v17 (ref), v7 (ref), v5 (ref), v16 (ref), v8 (ref), v10 (ref), v11 (ref)
                local v22 = not v21.purchasable and (v21.reason == "AlreadyOwned" or false);
                local v23 = v21.price or 0;
                local l_purchasable_0 = v21.purchasable;
                local l_premiumPricing_0 = v21.premiumPricing;
                if not v21.purchasable and v21.reason == "InsufficientFunds" then
                    l_purchasable_0 = true;
                end;
                if not v15 then
                    local v26 = v4.fromGetEconomyProductInfo(v21, v22, v23, l_purchasable_0, l_premiumPricing_0);
                    v17:dispatch(v7({
                        v26
                    }));
                else
                    local v27 = v5.fromGetEconomyProductInfo(v22, v16, v23, l_purchasable_0);
                    v17:dispatch(v8({
                        v27
                    }));
                end;
                v17:dispatch(v10(v11.Counters.GetEconomyProductInfo .. v11.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 54 ]]
                -- upvalues: v17 (ref), v10 (ref), v11 (ref)
                v17:dispatch(v10(v11.Counters.GetEconomyProductInfo .. v11.CounterSuffix.RequestRejected));
            end);
        end)(v17):catch(function(_) --[[ Line: 59 ]]
            -- upvalues: v17 (copy), v10 (ref), v11 (ref)
            v17:dispatch(v10(v11.Counters.GetEconomyProductInfo .. v11.CounterSuffix.RequestFailed));
        end);
    end);
end;