local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2, v3) --[[ Line: 16 ]]
    -- upvalues: v1 (copy)
    assert(type(v3) == "string", "GameGetIsFavorite request expects universeId to be a string");
    return v2(string.format("%sv1/games/%s/favorites", v1.GAME_URL, v3), "GET");
end;