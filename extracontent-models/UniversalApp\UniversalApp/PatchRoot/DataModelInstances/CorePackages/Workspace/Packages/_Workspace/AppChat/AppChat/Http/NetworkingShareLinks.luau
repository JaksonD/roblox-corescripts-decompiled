local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(script.Parent.RoduxNetworking);
return require(l_Parent_0.ShareLinksNetworking).config({
    roduxNetworking = v1
});