local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Logger_0 = require(l_script_FirstAncestor_0.Parent.ExpChatShared).Logger;
return l_Logger_0:new(l_Logger_0.name .. "/AppContainer");