local l_Parent_0 = script:FindFirstAncestor("PlaceInfoRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: l_Url_0 (copy)
    local v4 = {
        placeIds = v3
    };
    local v5 = l_Url_0:makeQueryString(v4);
    return v2(string.format("%s/v1/games/multiget-place-details?%s", l_Url_0.GAME_URL, v5), "GET");
end;