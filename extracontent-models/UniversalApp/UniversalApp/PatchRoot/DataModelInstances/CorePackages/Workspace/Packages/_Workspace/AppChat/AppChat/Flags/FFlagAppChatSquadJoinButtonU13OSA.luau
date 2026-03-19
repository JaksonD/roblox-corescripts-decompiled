local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local l_FFlagAppChatEnableU13ChatOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableU13ChatOptIn;
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence);
return l_FFlagAppChatEnableGroupOSA_0 and l_FFlagAppChatEnableU13ChatOptIn_0 and v4 and game:DefineFastFlag("AppChatSquadJoinButtonU13OSA", false);