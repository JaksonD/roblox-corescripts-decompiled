local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
return function(v5, v6, v7, v8, v9, v10, v11) --[[ Line: 8 ]] --[[ Name: PostGetUpsellProduct ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy)
    return v5(v3.economy.paymentsGateway.getUpsellProduct(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            upsell_platform = v6, 
            user_robux_balance = v7, 
            attempt_robux_amount = v8, 
            item_product_id = v9, 
            item_name = v10, 
            universe_id = v11
        })
    });
end;