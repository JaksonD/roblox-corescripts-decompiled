local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEventsState");
local l_NetworkingVirtualEvents_0 = require(l_script_FirstAncestor_0.network).NetworkingVirtualEvents;
return require(script.Parent["events.impl"])(l_NetworkingVirtualEvents_0);