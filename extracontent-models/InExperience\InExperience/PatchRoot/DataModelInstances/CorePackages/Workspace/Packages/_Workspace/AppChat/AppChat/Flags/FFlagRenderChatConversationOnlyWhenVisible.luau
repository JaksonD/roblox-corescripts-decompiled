local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_AppChatPerfExperimentation_0 = require(l_Parent_0.SocialExperiments).AppChatPerfExperimentation;
local v2 = require(script.Parent.FFlagAppChatBetterListPerformance);
return game:DefineFastFlag("RenderChatConversationOnlyWhenVisible3", false) and (l_AppChatPerfExperimentation_0.getChatConversationRenderingFixEnabled() or v2);