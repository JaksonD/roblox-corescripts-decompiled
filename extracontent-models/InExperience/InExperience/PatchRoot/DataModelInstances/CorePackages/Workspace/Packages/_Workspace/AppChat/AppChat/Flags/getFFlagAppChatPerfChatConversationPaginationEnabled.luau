local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_AppChatPerfExperimentation_0 = require(l_Parent_0.SocialExperiments).AppChatPerfExperimentation;
local v2 = require(script.Parent.FFlagAppChatBetterListPerformance);
game:DefineFastFlag("AppChatPerfChatConversationPaginationEnabled", false);
return function() --[[ Line: 9 ]]
    -- upvalues: l_AppChatPerfExperimentation_0 (copy), v2 (copy)
    return game:GetFastFlag("AppChatPerfChatConversationPaginationEnabled") and (l_AppChatPerfExperimentation_0.getChatConversationPaginationEnabled() or v2);
end;