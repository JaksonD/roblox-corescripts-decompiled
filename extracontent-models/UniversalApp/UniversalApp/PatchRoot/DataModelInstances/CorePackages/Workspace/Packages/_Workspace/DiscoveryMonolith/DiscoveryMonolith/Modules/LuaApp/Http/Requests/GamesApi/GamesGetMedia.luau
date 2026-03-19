local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 10 ]]
    -- upvalues: l_Url_0 (copy)
    assert(typeof(v3) == "string", "universe has to be a string");
    return v2(string.format("%sv2/games/%s/media", l_Url_0.GAME_URL, v3), "GET");
end;