local l_Parent_0 = script:FindFirstAncestor("PlayabilityRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 22 ]]
    -- upvalues: l_Url_0 (copy)
    assert(type(v3) == "table", "GamesMultigetPlayabilityStatus request expects universeId to be a table");
    local v4 = table.concat(v3, ",");
    return v2(string.format("%s/v1/games/multiget-playability-status?universeIds=%s", l_Url_0.GAME_URL, v4), "GET");
end;