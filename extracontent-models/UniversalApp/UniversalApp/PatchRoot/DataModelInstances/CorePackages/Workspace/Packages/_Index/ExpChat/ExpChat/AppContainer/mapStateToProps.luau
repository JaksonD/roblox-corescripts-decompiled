local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
local v2 = require(l_script_FirstAncestor_0.selectSelectedTabName);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.ExpChatShared);
local v5 = require(l_Parent_0.SharedFlags);
local l_FFlagExpChatUseMessagesStore_0 = v5.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatUseChatConfigStore_0 = v5.FFlagExpChatUseChatConfigStore;
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v4.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local function _(v9) --[[ Line: 13 ]] --[[ Name: getIsChatInputBarVisible ]]
    -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v2 (copy)
    local l_isChatInputBarEnabled_0 = v9.ChatVisibility.isChatInputBarEnabled;
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v2(v9) == "RBXGlobal" and l_isChatInputBarEnabled_0._propertyEnabled ~= nil then
        return l_isChatInputBarEnabled_0._topBarVisibility and l_isChatInputBarEnabled_0._coreGuiEnabled and not l_isChatInputBarEnabled_0._devTextBoxEnabled;
    else
        return l_isChatInputBarEnabled_0.value;
    end;
end;
return function(v12, _) --[[ Line: 28 ]]
    -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v2 (copy), v1 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy)
    local v14 = false;
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
        local l_ChannelTabs_0 = v12.ChannelTabs;
        local v16 = false;
        if l_ChannelTabs_0 ~= nil then
            v16 = false;
            if l_ChannelTabs_0.allChannelTabs ~= nil then
                v16 = l_ChannelTabs_0.allChannelTabs.RBXGlobal ~= nil;
            end;
        end;
        v14 = v16;
    end;
    local v17 = {
        canLocalUserChat = if l_FFlagExpChatUseMessagesStore_0 then nil else v12.CanLocalUserChat
    };
    local l_isChatInputBarEnabled_1 = v12.ChatVisibility.isChatInputBarEnabled;
    v17.isChatInputBarVisible = if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v2(v12) == "RBXGlobal" and l_isChatInputBarEnabled_1._propertyEnabled ~= nil then l_isChatInputBarEnabled_1._topBarVisibility and l_isChatInputBarEnabled_1._coreGuiEnabled and not l_isChatInputBarEnabled_1._devTextBoxEnabled else l_isChatInputBarEnabled_1.value;
    v17.isChatWindowVisible = v12.ChatVisibility.isChatWindowEnabled.value;
    v17.isChannelBarVisible = if v1() then v12.ChatVisibility.isChannelBarEnabled.value or l_GetFFlagTextChatEnableUniverseChatTabs_0() and v14 and v12.ChatVisibility.isChatWindowEnabled.value else false;
    v17.chatTopBarVisibility = v12.ChatVisibility.isChatInputBarEnabled._topBarVisibility and v12.ChatVisibility.isChatWindowEnabled._topBarVisibility;
    v17.chatLayoutAlignment = v12.ChatLayout.Alignment;
    v17.chatWindowSettings = if l_FFlagExpChatUseChatConfigStore_0 then nil else v12.ChatLayout.ChatWindowSettings;
    v17.clientSettings = v12.ClientSettings;
    return v17;
end;