local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetSocialLinks);
local v2 = require(l_networkRequests_0.createGetSelfSocialLinks);
local v3 = require(l_networkRequests_0.createSetSocialLinks);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return {
        GetSocialLinks = v1(v4), 
        GetSelfSocialLinks = v2(v4), 
        SetSocialLinks = v3(v4)
    };
end;