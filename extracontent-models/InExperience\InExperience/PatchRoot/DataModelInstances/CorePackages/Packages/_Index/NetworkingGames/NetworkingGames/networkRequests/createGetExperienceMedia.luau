local v0 = require(script.Parent.Parent.GAMES_URL);
return function(v1) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return v1.roduxNetworking.GET({
        Name = "GetExperienceMedia"
    }, function(v2, v3) --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        return v2(v0):path("v2"):path("games"):id(v3):path("media");
    end);
end;