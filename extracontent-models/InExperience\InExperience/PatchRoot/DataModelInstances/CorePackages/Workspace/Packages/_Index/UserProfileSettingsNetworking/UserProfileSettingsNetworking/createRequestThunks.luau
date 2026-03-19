local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetUserProfileSettings);
local v2 = require(l_networkRequests_0.createSetUserProfileSettings);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return {
        GetUserProfileSettings = v1(v3), 
        SetUserProfileSettings = v2(v3)
    };
end;