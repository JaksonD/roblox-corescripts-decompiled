local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
local v2 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRemoveMessagesFromAppContainer);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.SharedFlags);
local l_FFlagExpChatUseMessagesStore_0 = v4.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatUseChatConfigStore_0 = v4.FFlagExpChatUseChatConfigStore;
return function(v7, _) --[[ Line: 11 ]]
    -- upvalues: l_FFlagExpChatUseMessagesStore_0 (copy), v1 (copy), v2 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy)
    return {
        canLocalUserChat = if l_FFlagExpChatUseMessagesStore_0 then nil else v7.CanLocalUserChat, 
        isChatInputBarVisible = v7.ChatVisibility.isChatInputBarEnabled.value, 
        isChatWindowVisible = v7.ChatVisibility.isChatWindowEnabled.value, 
        isChannelBarVisible = if v1() then v7.ChatVisibility.isChannelBarEnabled.value else false, 
        chatTopBarVisibility = v7.ChatVisibility.isChatInputBarEnabled._topBarVisibility and v7.ChatVisibility.isChatWindowEnabled._topBarVisibility, 
        messages = if v2 then nil else v7.Messages.windowMessagesInOrder, 
        chatLayoutAlignment = v7.ChatLayout.Alignment, 
        chatWindowSettings = if l_FFlagExpChatUseChatConfigStore_0 then nil else v7.ChatLayout.ChatWindowSettings, 
        clientSettings = v7.ClientSettings
    };
end;