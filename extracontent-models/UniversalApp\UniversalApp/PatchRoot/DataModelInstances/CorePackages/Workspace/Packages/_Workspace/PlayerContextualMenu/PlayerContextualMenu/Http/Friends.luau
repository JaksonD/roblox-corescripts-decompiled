local l_Parent_0 = script:FindFirstAncestor("PlayerContextualMenu").Parent;
local v1 = require(script.Parent.RoduxNetworking);
return require(l_Parent_0.FriendsNetworking).config({
    roduxNetworking = v1
});