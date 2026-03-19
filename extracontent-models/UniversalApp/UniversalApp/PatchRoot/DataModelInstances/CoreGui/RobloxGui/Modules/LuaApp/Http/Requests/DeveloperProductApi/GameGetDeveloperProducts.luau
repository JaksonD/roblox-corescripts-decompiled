local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sdeveloper-products/v1/universes/%s/store?page=1&pageSize=100&storePageEnabled=true", v1.APIS_URL, v3), "GET");
end;