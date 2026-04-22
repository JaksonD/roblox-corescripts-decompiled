local l_Parent_0 = script:FindFirstAncestor("SocialTabsPage").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = game:DefineFastInt("SocialTabsPageHttpRetryCount", 3);
return v1.config({
    requestFunction = v1.requestFunctions.RequestInternal, 
    maxRetryCount = v2
});