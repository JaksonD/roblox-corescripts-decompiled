local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy)
    return v5(v3.economy.paymentsGateway.checkUserPurchaseSettings(), "POST", {
        postBody = l_HttpService_0:JSONEncode({}), 
        headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    });
end;