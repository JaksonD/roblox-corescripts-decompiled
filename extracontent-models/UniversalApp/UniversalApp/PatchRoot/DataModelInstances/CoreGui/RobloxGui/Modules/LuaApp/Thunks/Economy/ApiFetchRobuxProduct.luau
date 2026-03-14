local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PaymentsGatewayApi.PostGetUpsellProduct);
local v4 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v5 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local function v8(v7) --[[ Line: 11 ]] --[[ Name: paymentPlatformToUpsellPlatform ]]
    -- upvalues: v4 (copy)
    if v7 == v4.Web then
        return "Web";
    elseif v7 == v4.Apple then
        return "AppleAppStore";
    elseif v7 == v4.Google then
        return "GooglePlayStore";
    elseif v7 == v4.Amazon then
        return "AmazonStore";
    elseif v7 == v4.UWP then
        return "WindowsStore";
    elseif v7 == v4.Xbox then
        return "XboxStore";
    elseif v7 == v4.Maquettes then
        return "MaquettesStore";
    elseif v7 == v4.Palisades then
        return "PalisadesStore";
    elseif v7 == v4.Microsoft then
        return "MicrosoftStore";
    elseif v7 == v4.MilkyWay then
        return "MilkyWayStore";
    else
        return "None";
    end;
end;
return function(v9, v10, v11) --[[ Line: 46 ]]
    -- upvalues: v8 (copy), v5 (copy), v3 (copy), v2 (copy)
    return function(_) --[[ Line: 47 ]]
        -- upvalues: v8 (ref), v5 (ref), v3 (ref), v9 (copy), v10 (copy), v11 (copy), v2 (ref)
        local v13 = v8(v5());
        return v3(v9, v13, v10, v11):andThen(function(v14) --[[ Line: 49 ]]
            -- upvalues: v2 (ref)
            if v14 == nil or v14[1] == nil then
                return v2.reject();
            else
                local v15 = v14[1];
                local v16 = {
                    productId = v15.roblox_product_id, 
                    providerId = v15.provider_product_id, 
                    productName = v15.roblox_product_name, 
                    robuxAmount = v15.robux_amount, 
                    robuxAmountBeforeBonus = v15.robux_amount_before_bonus, 
                    price = v15.price
                };
                return v2.resolve(v16);
            end;
        end);
    end;
end;