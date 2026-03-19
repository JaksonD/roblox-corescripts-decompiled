local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = game:DefineFastInt("LuaAppJoinGameFailureInfluxHundredthsPercentage", 0);
return function(v3, v4, v5) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy)
    v5 = v5 or {};
    v1.isType(v4, "string", "documentName");
    v3:reportSeries(v4, v5, v2);
end;