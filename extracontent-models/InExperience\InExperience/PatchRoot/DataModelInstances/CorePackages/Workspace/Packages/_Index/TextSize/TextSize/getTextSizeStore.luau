local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextSize");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.createTextSizeStore);
return v2.createComputed(v3);