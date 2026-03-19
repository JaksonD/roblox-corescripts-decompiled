local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(script.Parent.ProfileRoduxNetworking);
return require(l_Parent_0.PersonasNetworking).config({
    roduxNetworking = v1
});