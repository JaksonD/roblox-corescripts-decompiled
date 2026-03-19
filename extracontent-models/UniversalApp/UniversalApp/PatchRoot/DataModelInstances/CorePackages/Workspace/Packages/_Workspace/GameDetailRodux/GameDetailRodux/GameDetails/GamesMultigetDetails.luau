local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 18 ]]
    -- upvalues: l_Url_0 (copy)
    assert(type(v3) == "table", "GamesMultigetDetails request expects universeIds to be a table");
    if #v3 == 0 or #v3 > 100 then
        error("GamesMultigetDetails request expects universeIds count between 1-100");
    end;
    local v4 = table.concat(v3, ",");
    return v2(string.format("%sv1/games?universeIds=%s", l_Url_0.GAME_URL, v4), "GET");
end;