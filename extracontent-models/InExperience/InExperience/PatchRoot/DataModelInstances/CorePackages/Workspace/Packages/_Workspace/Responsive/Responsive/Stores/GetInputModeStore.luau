local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.createInputModeStore);
return v1.createComputed(v2);