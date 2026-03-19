local l_Modules_0 = script:FindFirstAncestor("DiscoveryMonolith").Modules;
local v1 = require(l_Modules_0.Personalization.Games.Discovery.SetDiscoveryNextPageId);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v4 = v2 or "";
    if v3.type == v1.name then
        v4 = v3.nextPageId;
    end;
    return v4;
end;