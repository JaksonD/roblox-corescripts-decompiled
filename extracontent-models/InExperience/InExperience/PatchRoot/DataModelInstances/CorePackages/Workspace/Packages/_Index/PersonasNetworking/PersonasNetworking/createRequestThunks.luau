local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetPersona);
local v2 = require(l_networkRequests_0.createSetStatus);
local v3 = require(l_networkRequests_0.createSetDisplayName);
local v4 = require(l_networkRequests_0.createSetOutfit);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    return {
        GetPersona = v1(v5), 
        SetStatus = v2(v5), 
        SetDisplayName = v3(v5), 
        SetOutfit = v4(v5)
    };
end;