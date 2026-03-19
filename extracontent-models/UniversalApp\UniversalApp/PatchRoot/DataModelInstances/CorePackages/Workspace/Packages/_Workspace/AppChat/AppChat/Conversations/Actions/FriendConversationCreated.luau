local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 17 ]]
    return {
        newConversationId = v1.newConversationId, 
        oldFriendConversationId = v1.oldFriendConversationId
    };
end);