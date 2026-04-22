local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserRelationshipModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.HttpRequest);
local v4 = game:DefineFastInt("AddFriendsHttpRetryCount", 3);
local v5 = require(l_script_FirstAncestor_0.Rodux.RODUX_KEY);
local v9 = v3.config({
    requestFunction = function(v6, v7, v8) --[[ Line: 12 ]] --[[ Name: requestFunction ]]
        -- upvalues: v3 (copy)
        return v3.requestFunctions.RequestInternal(v6, v7, v8);
    end, 
    maxRetryCount = v4
});
return (v2.config({
    keyPath = ("%*.NetworkStatus"):format(v5), 
    networkImpl = v9
}));