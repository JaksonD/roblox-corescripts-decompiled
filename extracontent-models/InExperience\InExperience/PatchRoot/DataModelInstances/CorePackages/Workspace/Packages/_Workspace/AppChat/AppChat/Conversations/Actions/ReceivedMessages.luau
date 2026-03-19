local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4) --[[ Line: 6 ]]
    return {
        conversationId = v1, 
        messages = v2, 
        shouldMarkConversationUnread = v3, 
        exclusiveStartMessageId = v4
    };
end);