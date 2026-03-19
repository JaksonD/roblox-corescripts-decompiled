local v0 = require(script.Parent.Parent.PREMIUM_FEATURES_URL);
return function(v1) --[[ Line: 8 ]]
    -- upvalues: v0 (copy)
    return v1.roduxNetworking.GET({
        Name = "GetUserPremiumMembershipStatus"
    }, function(v2, v3) --[[ Line: 13 ]]
        -- upvalues: v0 (ref)
        return v2(v0):path("v1"):path("users"):id(v3):path("validate-membership");
    end);
end;