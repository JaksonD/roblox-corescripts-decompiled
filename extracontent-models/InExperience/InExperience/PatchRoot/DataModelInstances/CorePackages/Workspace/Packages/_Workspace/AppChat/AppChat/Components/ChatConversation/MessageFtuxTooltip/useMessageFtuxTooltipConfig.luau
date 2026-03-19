local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v2 = require(script.Parent.MessageFtuxTooltipVariant);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseSwipeForReplies);
local v4 = {
    [v2.Replies] = function() --[[ Line: 18 ]] --[[ Name: useRepliesTooltipConfig ]]
        -- upvalues: l_UserInputService_0 (copy), v3 (copy)
        return {
            textKey = (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled) and "Feature.Chat.Label.HoverToReplyTooltip" or v3 and "Feature.Chat.Label.SwipeToReplyTooltip" or "Feature.Chat.Label.LongPressToReplyTooltip", 
            storageKey = "AppChatEnableRepliesUIFtuxTooltip"
        };
    end
};
return function(v5) --[[ Line: 31 ]]
    -- upvalues: v4 (copy)
    return v4[v5]();
end;