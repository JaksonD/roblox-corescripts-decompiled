local l_Parent_0 = script:FindFirstAncestor("PlayerContextualMenu").Parent;
local l_RoduxNetworking_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoduxNetworking;
local v2 = require(script.Parent.httpRequest);
return l_RoduxNetworking_0.config({
    keyPath = "EventReceievers.NetworkStatus", 
    networkImpl = v2
});