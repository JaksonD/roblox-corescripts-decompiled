local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.POST({
        Name = "SetUserProfileSettings"
    }, function(v3, v4) --[[ Line: 15 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("user-profile-api"):path("v1"):path("user"):path("profiles"):path("settings"):body({
            userProfileSettings = {
                isInExperienceNameEnabled = v4.isInExperienceNameEnabled
            }
        });
    end);
end;