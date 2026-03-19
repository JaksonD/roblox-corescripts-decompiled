local l_Parent_0 = script.Parent;
local l_networkRequests_0 = l_Parent_0.networkRequests;
local v2 = require(l_networkRequests_0.createGetPhoneInformation);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
return function(v4) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    return {
        GetPhoneInformation = v2(v4)
    };
end;