local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetTagsFromUserIds);
local v2 = require(l_networkRequests_0.createSetUserTag);
local _ = require(script.Parent.networkingAliasesTypes);
return function(v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return {
        GetTagsFromUserIds = v1(v4), 
        SetUserTag = v2(v4)
    };
end;