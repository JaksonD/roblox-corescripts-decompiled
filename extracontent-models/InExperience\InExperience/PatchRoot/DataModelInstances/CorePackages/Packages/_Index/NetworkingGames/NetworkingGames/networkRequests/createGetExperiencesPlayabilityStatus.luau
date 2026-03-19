local v0 = require(script.Parent.Parent.GAMES_URL);
return function(v1) --[[ Line: 9 ]]
    -- upvalues: v0 (copy)
    return v1.roduxNetworking.GET({
        Name = "GetExperiencesPlayabilityStatus"
    }, function(v2, v3) --[[ Line: 12 ]]
        -- upvalues: v0 (ref)
        return v2(v0):path("v1"):path("games"):path("multiget-playability-status"):expandedQueryArgsWithIds("universeIds", v3);
    end);
end;