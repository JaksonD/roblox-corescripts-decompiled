local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetPresencesFromUserIds);
local v2 = require(l_networkRequests_0.createSetInvisibilityStatus);
local _ = require(script.Parent.networkingPresenceTypes);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return {
        GetPresencesFromUserIds = v1(v4), 
        SetInvisibilityStatus = v2(v4)
    };
end;