local l_Parent_0 = script:FindFirstAncestor("SocialBlockingModal").Parent;
local v1 = require(l_Parent_0.UserBlockingNetworking);
local v2 = require(script.Parent.myRoduxNetworking);
return (v1.config({
    roduxNetworking = v2
}));