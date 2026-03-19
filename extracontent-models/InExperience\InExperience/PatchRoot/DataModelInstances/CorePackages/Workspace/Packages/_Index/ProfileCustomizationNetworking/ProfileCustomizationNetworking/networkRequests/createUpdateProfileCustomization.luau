local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 30 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.POST({
        Name = "UpdateProfileCustomization"
    }, function(v3, v4) --[[ Line: 33 ]]
        -- upvalues: v1 (ref)
        local v5 = {
            profileCustomization = {
                profileEntity = v4.profileEntity, 
                pinnedComponents = v4.pinnedComponents, 
                customizedComponents = v4.customizedComponents
            }
        };
        return v3(v1):path("profile-platform-api"):path("v1"):path("profiles"):path("customization"):path("update"):body(v5);
    end);
end;