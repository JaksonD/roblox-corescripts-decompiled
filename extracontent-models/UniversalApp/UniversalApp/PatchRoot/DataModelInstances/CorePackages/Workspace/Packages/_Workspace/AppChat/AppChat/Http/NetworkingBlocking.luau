local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.UserBlockingNetworking);
local v2 = require(script.Parent.RoduxNetworking);
return v1.config({
    roduxNetworking = v2
});