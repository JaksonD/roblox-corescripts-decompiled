local _ = require(script.Parent.networkingShareLinkTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createGenerateLink);
local v3 = require(l_networkRequests_0.createGetOrGenerateLink);
local v4 = require(l_networkRequests_0.createResolveLinkFromLinkId);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    return {
        ResolveLinkFromLinkId = v4(v5), 
        GenerateLink = v2(v5), 
        GetOrGenerateLink = v3(v5)
    };
end;