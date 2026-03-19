local l_Parent_0 = script:FindFirstAncestor("ExperimentCacheManager").Parent;
local v1 = require(l_Parent_0.Dash);
local l_getAllAppUserLayers_0 = require(l_Parent_0.ExperimentLayers).getAllAppUserLayers;
return function() --[[ Line: 5 ]]
    -- upvalues: l_getAllAppUserLayers_0 (copy), v1 (copy)
    local v3 = l_getAllAppUserLayers_0();
    return v1.values(v3);
end;