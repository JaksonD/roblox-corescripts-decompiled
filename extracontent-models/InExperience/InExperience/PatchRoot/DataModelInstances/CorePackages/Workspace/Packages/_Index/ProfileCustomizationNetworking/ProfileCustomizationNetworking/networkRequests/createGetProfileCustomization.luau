local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 15 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.POST({
        Name = "GetProfileCustomization"
    }, function(v3, v4) --[[ Line: 18 ]]
        -- upvalues: v1 (ref)
        local v5 = {
            profileEntities = {
                v4.profileEntity
            }
        };
        return v3(v1):path("profile-platform-api"):path("v1"):path("profiles"):path("customization"):path("get"):body(v5);
    end);
end;