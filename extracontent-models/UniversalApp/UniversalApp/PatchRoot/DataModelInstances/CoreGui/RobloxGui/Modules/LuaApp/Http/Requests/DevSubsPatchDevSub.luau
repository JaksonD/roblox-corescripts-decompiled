local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder).fromString("apis:developer-subscriptions/v1/subscriptions/{subscriptionId}");
return function(v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    return v3(v2({
        subscriptionId = v4
    }), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            isAutoRenewing = v5
        })
    });
end;