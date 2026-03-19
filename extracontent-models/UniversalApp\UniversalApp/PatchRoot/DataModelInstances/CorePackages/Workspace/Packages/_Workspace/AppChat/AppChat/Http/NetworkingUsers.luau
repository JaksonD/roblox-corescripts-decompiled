local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_NetworkingUsers_0 = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingUsers;
local v2 = require(script.Parent.RoduxNetworking);
return l_NetworkingUsers_0.config({
    roduxNetworking = v2
});