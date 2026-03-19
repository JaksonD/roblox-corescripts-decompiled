local l_Parent_0 = script:FindFirstAncestor("GameProductInfoRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 26 ]]
    -- upvalues: l_Url_0 (copy)
    assert(type(v3) == "table", "GamesGetProductInfo request expects universeIds to be a table");
    assert(#v3 > 0, "GamesGetProductInfo request expects universeIds count to be greater than 0");
    assert(#v3 <= 100, "GamesGetProductInfo request expects universeIds count to not exceed " .. 100);
    local v4 = table.concat(v3, ",");
    return v2(string.format("%sv1/games/games-product-info?universeIds=%s", l_Url_0.GAME_URL, v4), "GET");
end;