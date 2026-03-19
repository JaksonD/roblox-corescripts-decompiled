local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2, v3) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    assert(type(v3) == "string", "EconomyGetCurrency request expects userId to be a string");
    return v2(string.format("%s/v1/users/%s/currency", v1.ECONOMY_URL, v3), "GET");
end;