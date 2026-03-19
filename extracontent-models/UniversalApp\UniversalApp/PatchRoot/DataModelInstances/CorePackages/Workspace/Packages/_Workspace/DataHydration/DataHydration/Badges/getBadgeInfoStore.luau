local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.Parent.createBadgeInfoStore);
return v1.createComputed(v2);