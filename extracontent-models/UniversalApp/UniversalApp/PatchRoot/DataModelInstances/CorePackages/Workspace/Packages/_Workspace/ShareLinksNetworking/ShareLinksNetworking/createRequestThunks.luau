local _ = require(script.Parent.networkingShareLinkTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createGenerateLink);
local v3 = require(l_networkRequests_0.createGetOrGenerateLink);
local v4 = require(l_networkRequests_0.createResolveLinkFromLinkId);
local v5 = require(l_networkRequests_0.createResolveLinkFromLinkIdV2);
local v6 = require(l_networkRequests_0.createGetMetadata);
return function(v7) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy)
    return {
        GenerateLink = v2(v7), 
        GetOrGenerateLink = v3(v7), 
        ResolveLinkFromLinkId = v4(v7), 
        ResolveLinkFromLinkIdV2 = v5(v7), 
        GetMetadata = v6(v7)
    };
end;