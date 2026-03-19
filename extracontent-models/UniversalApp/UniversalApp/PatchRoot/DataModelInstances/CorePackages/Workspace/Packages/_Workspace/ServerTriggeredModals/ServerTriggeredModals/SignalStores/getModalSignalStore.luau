local l_Parent_0 = script:FindFirstAncestor("ServerTriggeredModals").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.Parent.createModalSignalStore);
return v1.createComputed(v2);