local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_script_FirstAncestor_0.Constants);
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
return function() --[[ Line: 15 ]]
    -- upvalues: v2 (copy), l_MarketplaceService_0 (copy), v5 (copy), v3 (copy)
    return v2.new(function(v7, v8) --[[ Line: 16 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v5 (ref), v3 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v5 (ref)
            return l_MarketplaceService_0:GetAvailableSubscriptionProductsAsync(v5.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE);
        end);
        if l_status_0 then
            v7((v3.format(l_result_0 or {})));
            return;
        else
            v8((tostring(l_result_0)));
            return;
        end;
    end);
end;