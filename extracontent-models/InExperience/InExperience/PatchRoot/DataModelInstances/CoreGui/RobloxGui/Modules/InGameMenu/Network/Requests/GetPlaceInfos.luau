local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Network.Url);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    for v4, v5 in ipairs(v3) do
        v3[v4] = tostring(v5);
    end;
    local v6 = {
        placeIds = v3
    };
    local v7 = v1:makeQueryString(v6);
    return v2(string.format("%s/v1/games/multiget-place-details?%s", v1.GAME_URL, v7), "GET");
end;