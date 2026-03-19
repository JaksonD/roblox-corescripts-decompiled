local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Network.Url);
return function(v2, v3) --[[ Line: 20 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sv1/games/%d/icon", v1.GAME_URL, v3), "GET");
end;