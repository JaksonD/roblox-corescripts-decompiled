local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 13 ]]
    return {
        bubbleChatSettings = v1.bubbleChatSettings or {}, 
        chatWindowSettings = v1.chatWindowSettings or {}, 
        chatInputBarSettings = v1.chatInputBarSettings or {}, 
        channelTabsSettings = v1.channelTabsSettings or {}
    };
end);