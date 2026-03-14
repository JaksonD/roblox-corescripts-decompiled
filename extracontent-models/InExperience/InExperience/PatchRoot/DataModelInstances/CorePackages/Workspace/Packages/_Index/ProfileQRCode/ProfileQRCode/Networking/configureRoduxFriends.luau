local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(script.Parent.configuredRoduxNetworking);
return require(l_Parent_0.FriendsNetworking).config({
    roduxNetworking = v1
});