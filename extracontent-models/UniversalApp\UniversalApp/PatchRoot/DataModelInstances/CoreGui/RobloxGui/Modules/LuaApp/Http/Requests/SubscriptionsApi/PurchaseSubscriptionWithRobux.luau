local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_Modules_0.LuaApp.ArgCheck);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = v6.tuple(v6.callback, v6.string);
return function(v8, v9, v10) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), v7 (copy), v4 (copy), l_HttpService_0 (copy)
    v5.assert(v7(v8, v9, v10));
    return v8(string.format("%sv1/subscriptions/purchase-with-robux/%s", v4.APIS_URL, v9), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            priceInRobux = v10
        })
    });
end;