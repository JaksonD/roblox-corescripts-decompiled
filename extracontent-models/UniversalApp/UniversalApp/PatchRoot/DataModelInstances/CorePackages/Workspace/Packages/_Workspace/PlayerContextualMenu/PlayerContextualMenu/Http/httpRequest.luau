local l_Parent_0 = script:FindFirstAncestor("PlayerContextualMenu").Parent;
local v1 = require(l_Parent_0.HttpRequest);
return v1.config({
    requestFunction = v1.requestFunctions.HttpRbxApi, 
    maxRetryCount = 0
});