local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Flags.GetFIntExperienceStoreApiPageSize);
return function(v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v6 = v2();
    return v3(string.format("%sexperience-store/v1/universes/%s/store?limit=%d&cursor=%s", v1.APIS_URL, v4, v6, v5), "GET");
end;