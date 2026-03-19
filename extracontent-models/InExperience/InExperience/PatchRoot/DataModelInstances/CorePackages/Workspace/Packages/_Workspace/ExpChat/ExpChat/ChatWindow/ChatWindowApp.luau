local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v3 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactRodux);
local l_List_0 = require(l_Parent_0.llama).List;
local v7 = require(l_script_FirstAncestor_0.memoize);
local l_createEffect_0 = require(l_Parent_0.Signals).createEffect;
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatTransparentFocusSupport);
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_UI_0 = script.Parent.UI;
local v13 = require(l_UI_0.ChatWindow);
local l_FFlagExpChatUseMessagesStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseMessagesStore;
local v15 = v4.Component:extend("ChatWindowApp");
v15.defaultProps = {
    LayoutOrder = 1, 
    messages = if v9 then nil else {}, 
    size = UDim2.fromScale(1, 1)
};
local v21 = v7(function(v16, v17, v18) --[[ Line: 30 ]]
    -- upvalues: l_List_0 (copy)
    if not v17 then
        return l_List_0.map(v16.windowMessagesInOrder, function(v19) --[[ Line: 32 ]]
            -- upvalues: v16 (copy)
            return v16.byMessageId[v19];
        end);
    elseif v18 then
        return l_List_0.map(v16.windowMessagesInOrderByTabId[v18.Name] or {}, function(v20) --[[ Line: 39 ]]
            -- upvalues: v16 (copy)
            return v16.byMessageId[v20];
        end);
    else
        return {};
    end;
end);
if l_FFlagExpChatUseMessagesStore_0 then
    v15.init = function(v22) --[[ Line: 50 ]] --[[ Name: init ]]
        -- upvalues: v3 (copy)
        v22.state = {
            messagesState = nil
        };
        v22.MessagesStore = v3(false);
        v22.disposeEffects = {};
    end;
    v15.didMount = function(v23) --[[ Line: 59 ]] --[[ Name: didMount ]]
        -- upvalues: l_createEffect_0 (copy)
        if v23.MessagesStore then
            local v24 = v23.MessagesStore.getByMessageId(false);
            local v25 = v23.MessagesStore.getWindowMessagesInOrder(false);
            local v26 = v23.MessagesStore.getWindowMessagesInOrderByTabId(false);
            local v27 = {
                byMessageId = v24, 
                windowMessagesInOrder = v25, 
                windowMessagesInOrderByTabId = v26
            };
            if v27 then
                v23:setState({
                    messagesState = v27
                });
            end;
            local v32 = l_createEffect_0(function(v28) --[[ Line: 78 ]]
                -- upvalues: v23 (copy)
                local v29 = v23.MessagesStore.getByMessageId(v28);
                local v30 = v23.MessagesStore.getWindowMessagesInOrder(v28);
                local v31 = v23.MessagesStore.getWindowMessagesInOrderByTabId(v28);
                if v29 or v30 or v31 then
                    v23:setState({
                        messagesState = {
                            byMessageId = v29, 
                            windowMessagesInOrder = v30, 
                            windowMessagesInOrderByTabId = v31
                        }
                    });
                end;
            end);
            table.insert(v23.disposeEffects, v32);
        end;
    end;
    v15.willUnmount = function(v33) --[[ Line: 98 ]] --[[ Name: willUnmount ]]
        if v33.disposeEffects then
            for _, v35 in ipairs(v33.disposeEffects) do
                v35();
            end;
            v33.disposeEffects = {};
        end;
    end;
end;
v15.render = function(v36) --[[ Line: 108 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagExpChatUseMessagesStore_0 (copy), v21 (copy), v4 (copy), v13 (copy), v9 (copy)
    local v37 = nil;
    if l_FFlagExpChatUseMessagesStore_0 then
        local l_messagesState_0 = v36.state.messagesState;
        v37 = if l_messagesState_0 then v21(l_messagesState_0, v36.props.isChannelBarVisible, v36.props.targetTextChannel) else {};
    else
        v37 = v21(v36.props.messages, v36.props.isChannelBarVisible, v36.props.targetTextChannel);
    end;
    return v4.createElement(v13, {
        LayoutOrder = v36.props.LayoutOrder, 
        messages = if v9 then nil else v37, 
        size = v36.props.size, 
        transparencyValue = v36.props.transparencyValue, 
        textTransparency = v36.props.textTransparency, 
        onHovered = v36.props.onHovered, 
        onUnhovered = v36.props.onUnhovered, 
        mutedUserIds = if l_FFlagExpChatUseMessagesStore_0 then nil else v36.props.mutedUserIds, 
        verifiedUserIds = v36.props.verifiedUserIds, 
        activateWhisperMode = v36.props.activateWhisperMode, 
        resetTargetChannel = v36.props.resetTargetChannel, 
        visible = v36.props.visible, 
        onAbsoluteSizeChanged = v36.props.onAbsoluteSizeChanged, 
        onAbsolutePositionChanged = v36.props.onAbsolutePositionChanged, 
        chatWindowSettings = v36.props.chatWindowSettings, 
        showTranslationButton = v36.props.showTranslationButton, 
        targetTextChannel = v36.props.targetTextChannel, 
        isChannelBarVisible = v36.props.isChannelBarVisible, 
        onFocus = v36.props.onFocus, 
        onUnfocus = v36.props.onUnfocus
    });
end;
return v5.connect(function(v39) --[[ Line: 146 ]]
    -- upvalues: v9 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy)
    return {
        chatIntervention = v39.ChatIntervention, 
        messages = if not not v9 or l_FFlagExpChatUseMessagesStore_0 then nil else v39.Messages, 
        mutedUserIds = if l_FFlagExpChatUseMessagesStore_0 then nil else v39.MutedUsers, 
        verifiedUserIds = if l_FFlagEnableVerifiedBadgeStore_0 then nil else v39.VerifiedUsers, 
        targetTextChannel = v39.TextChannels.targetTextChannel
    };
end, function(_) --[[ Line: 154 ]]
    -- upvalues: v10 (copy), v2 (copy)
    return {
        onFocus = function() --[[ Line: 156 ]] --[[ Name: onFocus ]]
            -- upvalues: v10 (ref), v2 (ref)
            if v10 then
                return v2(false).setContextMenuOpen();
            else
                return v2(false).setTextboxFocus();
            end;
        end, 
        onUnfocus = function() --[[ Line: 164 ]] --[[ Name: onUnfocus ]]
            -- upvalues: v10 (ref), v2 (ref)
            if v10 then
                return v2(false).clearContextMenuOpen();
            else
                return v2(false).clearTextboxFocus();
            end;
        end
    };
end)(v15);