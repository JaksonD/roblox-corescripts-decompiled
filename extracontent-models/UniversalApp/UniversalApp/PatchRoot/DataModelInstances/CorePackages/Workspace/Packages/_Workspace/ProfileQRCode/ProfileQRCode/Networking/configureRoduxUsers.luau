local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(l_Parent_0.NetworkingUsers);
local v2 = require(script.Parent.configuredRoduxNetworking);
return v1.config({
    roduxNetworking = v2
});