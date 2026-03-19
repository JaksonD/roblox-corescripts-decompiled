local v0 = require(script.Parent.Parent.AVATAR_URL);
return function(v1) --[[ Line: 8 ]]
    -- upvalues: v0 (copy)
    return v1.roduxNetworking.GET({
        Name = "GetCurrentlyWearing"
    }, function(v2, v3) --[[ Line: 11 ]]
        -- upvalues: v0 (ref)
        return v2(v0):path("v1"):path("users"):id(v3):path("currently-wearing");
    end);
end;