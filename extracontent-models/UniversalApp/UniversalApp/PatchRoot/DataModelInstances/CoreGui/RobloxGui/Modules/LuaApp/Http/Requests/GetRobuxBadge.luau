local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2) --[[ Line: 16 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%s/robuxbadge/v1/robuxbadge", v1.APIS_URL), "GET");
end;