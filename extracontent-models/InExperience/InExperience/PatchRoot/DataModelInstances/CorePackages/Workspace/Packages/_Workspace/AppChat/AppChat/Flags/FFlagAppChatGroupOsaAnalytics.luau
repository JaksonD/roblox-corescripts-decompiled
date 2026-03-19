local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local v2 = game:DefineFastFlag("AppChatGroupOsaAnalytics3", false);
return l_FFlagAppChatEnableGroupOSA_0 and v2;