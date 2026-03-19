local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local l_FFlagGroupOSAGetConversationParticipants_0 = require(script.Parent).FFlagGroupOSAGetConversationParticipants;
return l_FFlagAppChatEnableGroupOSA_0 and l_FFlagGroupOSAGetConversationParticipants_0 and game:DefineFastFlag("AppChatLoadInNewOSAInfo", false);