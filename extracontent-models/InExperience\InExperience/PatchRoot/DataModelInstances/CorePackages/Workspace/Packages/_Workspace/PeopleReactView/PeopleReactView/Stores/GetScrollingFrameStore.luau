local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.createScrollingFrameStore);
return v1.createComputed(v2);