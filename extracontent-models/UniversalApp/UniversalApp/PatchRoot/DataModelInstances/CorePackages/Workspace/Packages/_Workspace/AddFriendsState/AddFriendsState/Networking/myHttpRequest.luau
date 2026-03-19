local l_Parent_0 = script:FindFirstAncestor("AddFriendsState").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = game:DefineFastInt("AddFriendsHttpRetryCount", 3);
return (v1.config({
    requestFunction = function(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: requestFunction ]]
        -- upvalues: v1 (copy)
        return v1.requestFunctions.RequestInternal(v3, v4, v5);
    end, 
    maxRetryCount = v2
}));