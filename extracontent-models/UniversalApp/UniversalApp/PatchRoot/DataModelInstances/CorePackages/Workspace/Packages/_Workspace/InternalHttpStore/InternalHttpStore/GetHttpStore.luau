local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local v3 = require(l_Parent_0.createHttpStore);
return v2.createComputed(v3);