local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder).new({
    base = v1.APIS_URL, 
    path = "developer-subscriptions/v1/subscriptions", 
    query = "{userId}&{status}&{includeLookupData}&{cursor|}"
});
return function(v3, v4, v5, v6) --[[ Line: 11 ]] --[[ Name: getSubscriptions ]]
    -- upvalues: v2 (copy)
    return v3(v2({
        userId = v4, 
        status = v5, 
        cursor = v6, 
        includeLookupData = "true"
    }), "GET");
end;