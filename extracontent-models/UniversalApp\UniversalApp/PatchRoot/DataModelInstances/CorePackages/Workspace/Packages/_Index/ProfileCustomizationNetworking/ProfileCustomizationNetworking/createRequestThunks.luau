local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createUpdateProfileCustomization);
local v2 = require(l_networkRequests_0.createGetProfileCustomization);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return {
        UpdateProfileCustomization = v1(v3), 
        GetProfileCustomization = v2(v3)
    };
end;