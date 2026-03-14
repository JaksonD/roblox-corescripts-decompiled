local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_NetworkingChat_0 = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingChat;
local v2 = require(script.Parent.RoduxNetworking);
return l_NetworkingChat_0.config({
    roduxNetworking = v2
});