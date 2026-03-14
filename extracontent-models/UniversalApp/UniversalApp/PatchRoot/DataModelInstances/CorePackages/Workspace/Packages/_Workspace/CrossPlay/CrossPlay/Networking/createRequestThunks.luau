local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossPlay");
local v1 = require(l_script_FirstAncestor_0.Networking.networkRequests.createGetUserSettingsPlatform);
local v2 = require(l_script_FirstAncestor_0.Networking.networkRequests.createUpdateUserSettingsPlatform);
return function(v3) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return {
        GetUserSettingsPlatform = v1(v3), 
        UpdateUserSettingsPlatform = v2(v3)
    };
end;