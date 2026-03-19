local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
return (require(l_Parent_0.FriendsNetworking).config({
    roduxNetworking = v2
}));