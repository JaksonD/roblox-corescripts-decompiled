local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2, v3, v4) --[[ Line: 50 ]]
    -- upvalues: v1 (copy)
    assert(type(v3) == "string", "GameGetRecommendedGames request expects universeId to be a string");
    local v5 = v1:makeQueryString(v4);
    return v2(string.format("%sv1/games/recommendations/game/%s?%s", v1.GAME_URL, v3, v5), "GET");
end;