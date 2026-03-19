local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = game:DefineFastInt("GameInviteHttpRetryCount", 0);
return {
    networkImpl = v1.config({
        requestFunction = v1.requestFunctions.HttpRbxApi, 
        maxRetryCount = v2
    })
};