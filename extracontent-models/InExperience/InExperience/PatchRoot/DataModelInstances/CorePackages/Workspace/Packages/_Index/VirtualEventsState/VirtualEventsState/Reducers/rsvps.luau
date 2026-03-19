local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEventsState");
local l_Players_0 = game:GetService("Players");
local l_NetworkingVirtualEvents_0 = require(l_script_FirstAncestor_0.network).NetworkingVirtualEvents;
return require(script.Parent["rsvps.impl"])(l_NetworkingVirtualEvents_0, l_Players_0);