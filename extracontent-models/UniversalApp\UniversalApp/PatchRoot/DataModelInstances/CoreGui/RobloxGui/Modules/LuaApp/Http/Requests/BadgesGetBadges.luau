local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2, v3) --[[ Line: 32 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sv1/universes/%d/badges", v1.BADGES_URL, v3), "GET");
end;