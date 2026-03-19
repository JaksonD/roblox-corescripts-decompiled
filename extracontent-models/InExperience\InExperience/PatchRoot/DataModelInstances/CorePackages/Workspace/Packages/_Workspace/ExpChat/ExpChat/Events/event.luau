local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.DispatchBindableEvent);
return require(script.Parent.createEvent)(v1);