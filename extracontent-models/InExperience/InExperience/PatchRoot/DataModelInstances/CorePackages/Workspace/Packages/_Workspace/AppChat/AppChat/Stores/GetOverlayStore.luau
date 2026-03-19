local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.createOverlayStore);
return v1.createComputed(v2);