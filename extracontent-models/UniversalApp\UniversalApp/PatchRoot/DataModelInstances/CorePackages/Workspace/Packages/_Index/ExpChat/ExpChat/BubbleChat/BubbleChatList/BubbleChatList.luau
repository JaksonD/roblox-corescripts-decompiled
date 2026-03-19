local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_List_0 = require(l_Parent_0.llama).List;
local v4 = require(l_script_FirstAncestor_0.BubbleChat.ChatBubble);
local v5 = require(l_script_FirstAncestor_0.GlobalFlags);
local v6 = v2.PureComponent:extend("BubbleChatList");
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabledBubbleChat);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatUseUpdatedMessageRendered);
v6.getDerivedStateFromProps = function(v9, v10) --[[ Line: 16 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: l_List_0 (copy), v7 (copy), v8 (copy)
    local v11 = {};
    if v10.bubbles then
        for _, v13 in ipairs(v10.bubbles) do
            if not l_List_0.findWhere(v9.messages, function(v14, _) --[[ Line: 23 ]]
                -- upvalues: v13 (copy)
                return v14.messageId == v13.messageId;
            end) then
                table.insert(v11, {
                    messageId = v13.messageId, 
                    fadingOut = true
                });
            end;
        end;
    end;
    for _, v17 in ipairs(v9.messages) do
        local v18 = tonumber(tostring(v17.timestamp):sub(-9));
        table.insert(v11, {
            messageId = v17.messageId, 
            fadingOut = false, 
            text = v17.text, 
            translation = if v7() then v17.translation else nil, 
            useTranslation = if v7() then v17.useTranslation else nil, 
            timestamp = v18 or v17.timestamp, 
            bubbleChatMessageProperties = v17.bubbleChatMessageProperties, 
            textChatMessageInstance = if v8() then v17.textChatMessageInstance else nil
        });
    end;
    return {
        bubbles = v11
    };
end;
v6.init = function(v19, v20) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: l_List_0 (copy)
    v19.state = {};
    if (not v20.messages or #v20.messages == 0) and v20.onLastBubbleFadeOut then
        v20.onLastBubbleFadeOut();
    end;
    v19.onBubbleFadeOut = function(v21) --[[ Line: 67 ]]
        -- upvalues: l_List_0 (ref), v19 (copy)
        local v23 = l_List_0.filter(v19.state.bubbles, function(v22) --[[ Line: 68 ]]
            -- upvalues: v21 (copy)
            return v22.messageId ~= v21;
        end);
        if #v23 == 0 and v19.props.onLastBubbleFadeOut then
            v19.props.onLastBubbleFadeOut();
            return;
        else
            v19:setState({
                bubbles = v23
            });
            return;
        end;
    end;
end;
v6.render = function(v24) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy), v7 (copy), v8 (copy)
    local v25 = {};
    local l_chatSettings_0 = v24.props.chatSettings;
    v25.Layout = v2.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
        Padding = UDim.new(0, l_chatSettings_0.BubblesSpacing)
    });
    v25.CaretPadding = v24.props.chatSettings.TailVisible and (not v5.AvatarChatEnabled or v24.props.showCaret) and v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 8)
    });
    for v27, v28 in ipairs(v24.state.bubbles) do
        local v29 = v27 == #v24.state.bubbles;
        local v30 = v29 and v24.props.renderFirstInsert or nil;
        local l_insertSize_0 = v24.props.insertSize;
        local l_text_0 = v28.text;
        local l_translation_0 = v28.translation;
        if v28.bubbleChatMessageProperties then
            local l_bubbleChatMessageProperties_0 = v28.bubbleChatMessageProperties;
            if l_bubbleChatMessageProperties_0:IsA("TextChatMessageProperties") then
                if l_bubbleChatMessageProperties_0.Text ~= "" then
                    l_text_0 = l_bubbleChatMessageProperties_0.Text;
                end;
                if l_bubbleChatMessageProperties_0.Translation ~= "" then
                    l_translation_0 = l_bubbleChatMessageProperties_0.Translation;
                end;
            end;
        end;
        v25["Bubble" .. v28.messageId] = v2.createElement(v4, {
            messageId = v28.messageId, 
            text = l_text_0 or "", 
            translation = if v7() then l_translation_0 else nil, 
            useTranslation = if v7() then v28.useTranslation else nil, 
            timestamp = v28.timestamp or 0, 
            isMostRecent = v29, 
            theme = v24.props.theme, 
            fadingOut = v28.fadingOut, 
            onFadeOut = v24.onBubbleFadeOut, 
            chatSettings = l_chatSettings_0, 
            renderInsert = v30, 
            insertSize = l_insertSize_0, 
            showCaret = v24.props.showCaret, 
            clientSettings = v24.props.clientSettings, 
            bubbleChatMessageProperties = v28.bubbleChatMessageProperties, 
            isTextChatServiceOn = v24.props.isTextChatServiceOn, 
            textChatMessageInstance = if v8() then v28.textChatMessageInstance else nil
        });
    end;
    return v2.createElement("Frame", {
        Visible = v24.props.isVisible, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, v25);
end;
return v6;