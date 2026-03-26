local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence);
return l_FFlagAppChatEnableGroupOSA_0 and v3 and game:DefineFastFlag("AppChatSquadJoinButtonOSA1", false);