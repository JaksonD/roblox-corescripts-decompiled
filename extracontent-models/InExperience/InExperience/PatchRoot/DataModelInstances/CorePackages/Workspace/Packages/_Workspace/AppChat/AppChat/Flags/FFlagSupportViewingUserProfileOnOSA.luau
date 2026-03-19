local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_FFlagAppChatGroupOsaDialogHost_0 = v1.FFlagAppChatGroupOsaDialogHost;
local l_FFlagAppChatEnableGroupOSA_0 = v1.FFlagAppChatEnableGroupOSA;
local v4 = game:DefineFastFlag("SupportViewingUserProfileOnOSA", false);
return l_FFlagAppChatEnableGroupOSA_0 and l_FFlagAppChatGroupOsaDialogHost_0 and v4;