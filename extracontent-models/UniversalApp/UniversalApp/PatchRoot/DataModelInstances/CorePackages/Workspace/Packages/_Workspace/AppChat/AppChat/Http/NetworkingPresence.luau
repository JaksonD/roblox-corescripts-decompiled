local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_NetworkingPresence_0 = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingPresence;
local v2 = require(script.Parent.RoduxNetworking);
return l_NetworkingPresence_0.config({
    roduxNetworking = v2
});