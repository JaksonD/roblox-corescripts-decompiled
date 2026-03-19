local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2) --[[ Line: 49 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sv1/products", v1.PREMIUM_FEATURES), "GET");
end;