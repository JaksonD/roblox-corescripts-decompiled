local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.UserProfileSettingsNetworking);
local v2 = require(script.Parent.ProfileRoduxNetworking);
return (v1.config({
    roduxNetworking = v2
}));