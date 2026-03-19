local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_Modules_0.LuaApp.ArgCheck);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_Modules_0.LuaApp.Types.EconomyTypes);
local v8 = v6.tuple(v6.callback, v6.integer, v7.PurchaseDetail);
return function(v9, v10, v11) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), v8 (copy), v4 (copy), l_HttpService_0 (copy)
    v5.assert(v8(v9, v10, v11));
    return v9(("%sdeveloper-products/v1/developer-products/%i/purchase?requestLocationType=ExperienceDetailPage"):format(v4.APIS_URL, v10), "POST", {
        postBody = l_HttpService_0:JSONEncode(v11)
    });
end;