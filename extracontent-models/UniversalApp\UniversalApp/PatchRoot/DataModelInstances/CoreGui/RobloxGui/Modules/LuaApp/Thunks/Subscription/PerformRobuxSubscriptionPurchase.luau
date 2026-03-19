local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.SubscriptionsApi.PurchaseSubscriptionWithRobux);
return function(v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2(v3, v4, v5):andThen(function(v6) --[[ Line: 8 ]]
        -- upvalues: v1 (ref)
        return v1.resolve(v6.responseBody);
    end, function(v7) --[[ Line: 10 ]]
        -- upvalues: v1 (ref)
        return v1.reject(v7);
    end);
end;