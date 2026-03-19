local l_Parent_0 = script:FindFirstAncestor("FriendsMenu").Parent;
local v1 = require(l_Parent_0.UniversalAppPolicy);
return function() --[[ Line: 6 ]] --[[ Name: getRenameFriendsToConnectionsEnabledFriendsMenu ]]
    -- upvalues: v1 (copy)
    return v1.getAppFeaturePolicies().getRenameFriendsToConnections();
end;