local l_Parent_0 = script:FindFirstAncestor("ExperienceLoadingScript").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.Parent.createLoadingScreenStore);
return v1.createComputed(v2);