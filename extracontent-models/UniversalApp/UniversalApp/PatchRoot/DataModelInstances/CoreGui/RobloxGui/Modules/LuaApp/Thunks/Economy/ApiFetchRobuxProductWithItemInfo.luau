local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PaymentsGatewayApi.PostGetUpsellProduct);
local v4 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v6 = require(l_Modules_0.LuaApp.Thunks.Economy.Util.PaymentPlatformUtils);
local _ = require(l_Modules_0.LuaApp.Thunks.Economy.Types.EconomyTypes);
return function(v8, v9, v10, v11, v12, v13) --[[ Line: 13 ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy), v2 (copy)
    return function(_) --[[ Line: 14 ]]
        -- upvalues: v6 (ref), v4 (ref), v3 (ref), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v2 (ref)
        local v15 = v6.paymentPlatformToUpsellPlatform(v4());
        return v3(v8, v15, v9, v10, v11, v12, v13):andThen(function(v16) --[[ Line: 25 ]]
            -- upvalues: v2 (ref)
            if v16 == nil or v16[1] == nil then
                return v2.reject();
            else
                local v17 = v16[1];
                local v18 = {
                    productId = v17.roblox_product_id, 
                    providerId = v17.provider_product_id, 
                    productName = v17.roblox_product_name, 
                    robuxAmount = v17.robux_amount, 
                    robuxAmountBeforeBonus = v17.robux_amount_before_bonus, 
                    price = v17.price
                };
                return v2.resolve(v18);
            end;
        end);
    end;
end;