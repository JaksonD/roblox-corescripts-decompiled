local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerContextualMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_NetworkingBlocking_0 = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingBlocking;
local v3 = require(l_Parent_0.UserBlockingNetworking);
local v4 = require(script.Parent.RoduxNetworking);
if require(l_script_FirstAncestor_0.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled) then
    return (v3.config({
        roduxNetworking = v4
    }));
else
    return (l_NetworkingBlocking_0.config({
        roduxNetworking = v4
    }));
end;