local l_Parent_0 = script:FindFirstAncestor("EditProfileBackground").Parent;
local v1 = require(l_Parent_0.ProfileCustomizationNetworking);
local v2 = require(script.Parent.ProfileRoduxNetworking);
return (v1.config({
    roduxNetworking = v2
}));