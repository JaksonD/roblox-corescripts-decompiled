local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v3 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactRodux);
local l_List_0 = require(l_Parent_0.llama).List;
local v7 = require(l_Parent_0.ExpChatShared);
local v8 = require(l_script_FirstAncestor_0.memoize);
local l_createEffect_0 = require(l_Parent_0.Signals).createEffect;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatTransparentFocusSupport);
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_UI_0 = script.Parent.UI;
local v14 = require(l_UI_0.ChatWindow);
local l_FFlagExpChatUseMessagesStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseMessagesStore;
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v7.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local v17 = v4.Component:extend("ChatWindowApp");
v17.defaultProps = {
    LayoutOrder = 1, 
    messages = if v10 then nil else {}, 
    size = UDim2.fromScale(1, 1)
};
local v18 = nil;
v18 = if l_GetFFlagTextChatEnableUniverseChatTabs_0() then v8(function(v19, v20, v21, v22) --[[ Line: 34 ]]
    -- upvalues: l_List_0 (copy)
    if not v20 then
        return l_List_0.map(v19.windowMessagesInOrder, function(v23) --[[ Line: 36 ]]
            -- upvalues: v19 (copy)
            return v19.byMessageId[v23];
        end);
    else
        local l_v22_0 = v22;
        if v21 and v19.windowMessagesInOrderByTabId[v21.Name] then
            l_v22_0 = v21.Name;
        end;
        if l_v22_0 then
            return l_List_0.map(v19.windowMessagesInOrderByTabId[l_v22_0] or {}, function(v25) --[[ Line: 45 ]]
                -- upvalues: v19 (copy)
                return v19.byMessageId[v25];
            end);
        else
            return {};
        end;
    end;
end) else v8(function(v26, v27, v28) --[[ Line: 54 ]]
    -- upvalues: l_List_0 (copy)
    if not v27 then
        return l_List_0.map(v26.windowMessagesInOrder, function(v29) --[[ Line: 56 ]]
            -- upvalues: v26 (copy)
            return v26.byMessageId[v29];
        end);
    elseif v28 then
        return l_List_0.map(v26.windowMessagesInOrderByTabId[v28.Name] or {}, function(v30) --[[ Line: 63 ]]
            -- upvalues: v26 (copy)
            return v26.byMessageId[v30];
        end);
    else
        return {};
    end;
end);
if l_FFlagExpChatUseMessagesStore_0 and not v10 then
    v17.init = function(v31) --[[ Line: 74 ]] --[[ Name: init ]]
        -- upvalues: v3 (copy)
        v31.state = {
            messagesState = nil
        };
        v31.MessagesStore = v3(false);
        v31.disposeEffects = {};
    end;
    v17.didMount = function(v32) --[[ Line: 83 ]] --[[ Name: didMount ]]
        -- upvalues: l_createEffect_0 (copy)
        if v32.MessagesStore then
            local v33 = v32.MessagesStore.getByMessageId(false);
            local v34 = v32.MessagesStore.getWindowMessagesInOrder(false);
            local v35 = v32.MessagesStore.getWindowMessagesInOrderByTabId(false);
            local v36 = {
                byMessageId = v33, 
                windowMessagesInOrder = v34, 
                windowMessagesInOrderByTabId = v35
            };
            if v36 then
                v32:setState({
                    messagesState = v36
                });
            end;
            local v41 = l_createEffect_0(function(v37) --[[ Line: 102 ]]
                -- upvalues: v32 (copy)
                local v38 = v32.MessagesStore.getByMessageId(v37);
                local v39 = v32.MessagesStore.getWindowMessagesInOrder(v37);
                local v40 = v32.MessagesStore.getWindowMessagesInOrderByTabId(v37);
                if v38 or v39 or v40 then
                    v32:setState({
                        messagesState = {
                            byMessageId = v38, 
                            windowMessagesInOrder = v39, 
                            windowMessagesInOrderByTabId = v40
                        }
                    });
                end;
            end);
            table.insert(v32.disposeEffects, v41);
        end;
    end;
    v17.willUnmount = function(v42) --[[ Line: 122 ]] --[[ Name: willUnmount ]]
        if v42.disposeEffects then
            for _, v44 in ipairs(v42.disposeEffects) do
                v44();
            end;
            v42.disposeEffects = {};
        end;
    end;
end;
v17.render = function(v45) --[[ Line: 132 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v18 (ref), v4 (copy), v14 (copy)
    local v46 = nil;
    if not v10 then
        if l_FFlagExpChatUseMessagesStore_0 then
            local l_messagesState_0 = v45.state.messagesState;
            v46 = if l_messagesState_0 then if l_GetFFlagTextChatEnableUniverseChatTabs_0() then v18(l_messagesState_0, v45.props.isChannelBarVisible, v45.props.targetTextChannel, v45.props.selectedChannelName) else v18(l_messagesState_0, v45.props.isChannelBarVisible, v45.props.targetTextChannel) else {};
        else
            v46 = if l_GetFFlagTextChatEnableUniverseChatTabs_0() then v18(v45.props.messages, v45.props.isChannelBarVisible, v45.props.targetTextChannel, v45.props.selectedChannelName) else v18(v45.props.messages, v45.props.isChannelBarVisible, v45.props.targetTextChannel);
        end;
    end;
    return v4.createElement(v14, {
        LayoutOrder = v45.props.LayoutOrder, 
        messages = if v10 then nil else v46, 
        size = v45.props.size, 
        transparencyValue = v45.props.transparencyValue, 
        textTransparency = v45.props.textTransparency, 
        onHovered = v45.props.onHovered, 
        onUnhovered = v45.props.onUnhovered, 
        mutedUserIds = if l_FFlagExpChatUseMessagesStore_0 then nil else v45.props.mutedUserIds, 
        verifiedUserIds = v45.props.verifiedUserIds, 
        activateWhisperMode = v45.props.activateWhisperMode, 
        resetTargetChannel = v45.props.resetTargetChannel, 
        visible = v45.props.visible, 
        onAbsoluteSizeChanged = v45.props.onAbsoluteSizeChanged, 
        onAbsolutePositionChanged = v45.props.onAbsolutePositionChanged, 
        chatWindowSettings = v45.props.chatWindowSettings, 
        showTranslationButton = v45.props.showTranslationButton, 
        targetTextChannel = v45.props.targetTextChannel, 
        selectedChannelName = if l_GetFFlagTextChatEnableUniverseChatTabs_0() then v45.props.selectedChannelName else nil, 
        isChannelBarVisible = v45.props.isChannelBarVisible, 
        onFocus = v45.props.onFocus, 
        onUnfocus = v45.props.onUnfocus
    });
end;
return v5.connect(function(v48) --[[ Line: 193 ]]
    -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v10 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy)
    local v49 = nil;
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
        local l_selectedChannelName_0 = v48.TextChannels.selectedChannelName;
        v49 = if l_selectedChannelName_0 and v48.ChannelTabs and v48.ChannelTabs.allChannelTabs[l_selectedChannelName_0] then l_selectedChannelName_0 else if v48.ChannelTabs then v48.ChannelTabs.selectedTabName or "RBXGeneral" else "RBXGeneral";
    end;
    return {
        chatIntervention = v48.ChatIntervention, 
        messages = if not not v10 or l_FFlagExpChatUseMessagesStore_0 then nil else v48.Messages, 
        mutedUserIds = if l_FFlagExpChatUseMessagesStore_0 then nil else v48.MutedUsers, 
        verifiedUserIds = if l_FFlagEnableVerifiedBadgeStore_0 then nil else v48.VerifiedUsers, 
        targetTextChannel = v48.TextChannels.targetTextChannel, 
        selectedChannelName = v49
    };
end, function(_) --[[ Line: 214 ]]
    -- upvalues: v11 (copy), v2 (copy)
    return {
        onFocus = function() --[[ Line: 216 ]] --[[ Name: onFocus ]]
            -- upvalues: v11 (ref), v2 (ref)
            if v11 then
                return v2(false).setContextMenuOpen();
            else
                return v2(false).setTextboxFocus();
            end;
        end, 
        onUnfocus = function() --[[ Line: 224 ]] --[[ Name: onUnfocus ]]
            -- upvalues: v11 (ref), v2 (ref)
            if v11 then
                return v2(false).clearContextMenuOpen();
            else
                return v2(false).clearTextboxFocus();
            end;
        end
    };
end)(v17);