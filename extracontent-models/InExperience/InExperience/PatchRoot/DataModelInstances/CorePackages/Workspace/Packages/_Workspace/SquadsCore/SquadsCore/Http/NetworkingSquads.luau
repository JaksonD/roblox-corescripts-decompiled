local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(script.Parent.RoduxNetworking);
return require(l_Parent_0.NetworkingSquads).config({
    roduxNetworking = v1
});