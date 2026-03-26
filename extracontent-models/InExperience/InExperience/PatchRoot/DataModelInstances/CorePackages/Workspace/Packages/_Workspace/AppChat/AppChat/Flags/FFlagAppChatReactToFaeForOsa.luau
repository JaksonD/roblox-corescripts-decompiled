local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local v2 = game:DefineFastFlag("AppChatReactToFaeForOsa1", false);
return v1.FFlagAppChatShowOSAOnPageEntry and v2;