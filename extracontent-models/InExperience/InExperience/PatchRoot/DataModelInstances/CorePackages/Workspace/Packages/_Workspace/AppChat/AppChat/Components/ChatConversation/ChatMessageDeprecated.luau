local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v8 = require(script.Parent.PlainTextAutomaticSize);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v10 = require(script.Parent.AssetCardTempAutomaticSize);
local v11 = require(script.Parent.HiddenMessage);
local v12 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v13 = require(script.Parent.ChatMessageContainerAutomaticSize);
local v14 = require(script.Parent.Logger);
local l_pruneConsecutiveNewLines_0 = require(l_script_FirstAncestor_0.SocialLibraries).Utils.pruneConsecutiveNewLines;
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAutotranslation);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
local v18 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v19 = {
    [v12.PlainText] = {
        component = v8, 
        name = "PlainText", 
        paddingOffset = 0
    }, 
    [v12.Link] = {
        component = v10, 
        name = "AssetCard", 
        paddingOffset = 0
    }
};
local v20 = {
    component = v11, 
    name = "Hidden", 
    paddingOffset = 0
};
local function _(v21) --[[ Line: 49 ]] --[[ Name: getMessageComponent ]]
    -- upvalues: v17 (copy), v18 (copy), v20 (copy), v19 (copy)
    if v17 and v21 and v21.visibility == v18.VisibilityTypes.Hidden then
        return v20;
    else
        return v19[v21.messageType];
    end;
end;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v24 = v4.PureComponent:extend("ChatMessage");
v24.defaultProps = {
    additionalProps = {
        shareLink = nil, 
        placeId = nil, 
        universeId = nil, 
        senderUserId = nil, 
        onDetailsOpened = function() --[[ Line: 67 ]] --[[ Name: onDetailsOpened ]]

        end, 
        openGameDetailsPage = function() --[[ Line: 68 ]] --[[ Name: openGameDetailsPage ]]

        end
    }, 
    conversationId = nil, 
    BackgroundColor3 = nil, 
    content = "", 
    debugElement = nil, 
    displayName = nil, 
    failed = false, 
    filteredForReceivers = false, 
    isIncoming = false, 
    isNewSender = false, 
    isSending = false, 
    isUnfiltered = false, 
    isLastMessageInMessageGroup = false, 
    isLastIncomingChatMessage = false, 
    messageType = nil, 
    moderated = false, 
    parentWidth = 0, 
    senderUserId = nil, 
    sent = nil, 
    showDateTime = false, 
    thumbnail = nil, 
    Transparency = nil, 
    wideMode = false, 
    viewProfileOnAvatarPressed = true, 
    closeKeyboard = function() --[[ Line: 93 ]] --[[ Name: closeKeyboard ]]

    end, 
    inputBoxRef = nil, 
    repliesTo = nil, 
    translatedText = nil, 
    autotranslationOriginalTextFontSize = 16, 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    messageHiddenNoticeText = "PLACEHOLDER This message is not available", 
    unknownUserText = "PLACEHOLDER unknown user"
};
v24.init = function(v25) --[[ Line: 105 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), l_memoize_0 (copy), l_Text_0 (copy)
    v25.getModeratedText = function(v26) --[[ Line: 106 ]]
        return string.gsub(v26, "[^%s]", "#");
    end;
    v25.messageMaxWidth = function(v27, v28) --[[ Line: 110 ]]
        local v29 = 128;
        if v27 then
            v29 = v29 + 112;
        end;
        return v28 - v29;
    end;
    if v16 then
        v25.getBubbleMaxWidth = l_memoize_0(function(v30, v31, v32, v33, v34) --[[ Line: 121 ]]
            -- upvalues: l_Text_0 (ref), v25 (copy)
            if v34 then
                local v35 = l_Text_0.GetTextBounds(v31, v33, v25.props.autotranslationOriginalTextFontSize, Vector2.new(v30, 10000));
                local v36 = l_Text_0.GetTextBounds(v34, v33, v32, Vector2.new(v30, 10000));
                return math.max(v35.X, v36.X) + 20;
            else
                return l_Text_0.GetTextBounds(v31, v33, v32, Vector2.new(v30, 10000)).X + 20;
            end;
        end);
        return;
    else
        v25.getBubbleMaxWidth = l_memoize_0(function(v37, v38, v39, v40) --[[ Line: 138 ]]
            -- upvalues: l_Text_0 (ref)
            return l_Text_0.GetTextBounds(v38, v40, v39, Vector2.new(v37, 10000)).X + 20;
        end);
        return;
    end;
end;
v24.render = function(v41) --[[ Line: 145 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v18 (copy), v20 (copy), v19 (copy), v14 (copy), l_pruneConsecutiveNewLines_0 (copy), v7 (copy), l_withStyle_0 (copy), v4 (copy), v13 (copy), v2 (copy), v16 (copy), v3 (copy)
    local v42;
    if v17 then
        local l_props_0 = v41.props;
        v42 = if v17 and l_props_0 and l_props_0.visibility == v18.VisibilityTypes.Hidden then v20 else v19[l_props_0.messageType];
    else
        v42 = v19[v41.props.messageType];
    end;
    local v44 = v41.messageMaxWidth(v41.props.wideMode, v41.props.parentWidth);
    if not v42 then
        v14:warning("ChatMessage doesn't support messageType: {}", v41.props.messageType);
        return nil;
    else
        local l_content_0 = v41.props.content;
        l_content_0 = l_pruneConsecutiveNewLines_0(l_content_0);
        local v46 = v41.props.moderated and v41.getModeratedText(l_content_0) or l_content_0;
        local v47 = v7() and v41.props.repliesTo and v41.props.repliesTo.messageType and v41.props.repliesTo.content;
        return l_withStyle_0(function(v48) --[[ Line: 167 ]]
            -- upvalues: v4 (ref), v13 (ref), v2 (ref), v41 (copy), v44 (copy), v42 (copy), v7 (ref), v17 (ref), v16 (ref), v46 (copy), v3 (ref), v47 (copy), v18 (ref), v20 (ref), v19 (ref)
            local l_Body_0 = v48.Font.Body;
            local v50 = v48.Font.BaseSize * l_Body_0.RelativeSize;
            local l_BodySmall_0 = v48.Font.BodySmall;
            local v52 = v48.Font.BaseSize * l_BodySmall_0.RelativeSize;
            return v4.createElement(v13, v2.Dictionary.join(v41.props, {
                messageMaxWidth = v44, 
                messageTypePaddingOffset = v42.paddingOffset, 
                messageId = v41.props.messageId, 
                isPending = if v7() then v41.props.isSending or v41.props.moderated or v41.props.failed else nil, 
                visibility = if v17 then v41.props.visibility else nil, 
                renderMessage = not v7() and function(v53) --[[ Line: 187 ]]
                    -- upvalues: v4 (ref), v42 (ref), v2 (ref), v41 (ref), l_Body_0 (copy), v16 (ref), v44 (ref), v46 (ref), v50 (copy)
                    return v4.createFragment({
                        [v42.name] = v4.createElement(v42.component, v2.Dictionary.join({
                            additionalProps = v41.props.additionalProps, 
                            font = l_Body_0.Font, 
                            hasTail = v41.props.isNewSender, 
                            innerPadding = 10, 
                            isIncoming = v41.props.isIncoming, 
                            isPending = v41.props.isSending or v41.props.moderated or v41.props.failed, 
                            isUnfiltered = v41.props.isUnfiltered, 
                            isLastMessageInMessageGroup = v41.props.isLastMessageInMessageGroup, 
                            maxWidth = if v16 then v41.getBubbleMaxWidth(v44, v46, v50, l_Body_0.Font, v41.props.translatedText) else v41.getBubbleMaxWidth(v44, v46, v50, l_Body_0.Font), 
                            messageDefaultNoticeText = v41.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v41.props.messageModeratedNoticeText, 
                            parentWidth = v41.props.parentWidth, 
                            text = v46, 
                            textSize = v50, 
                            wideMode = v41.props.wideMode, 
                            [v4.Change.AbsoluteSize] = v41.messageSizeChanged, 
                            translatedText = if v16 then v41.props.translatedText else nil
                        }, v53 or {}))
                    });
                end or function(v54, v55) --[[ Line: 231 ]]
                    -- upvalues: v3 (ref), v2 (ref), v41 (ref), v47 (ref), v4 (ref), v17 (ref), v18 (ref), v20 (ref), v19 (ref), l_Body_0 (copy), v7 (ref), v16 (ref), v44 (ref), v46 (ref), v50 (copy), v52 (copy), v48 (copy), v42 (ref)
                    local l_createElement_0 = v3.createElement;
                    local v57 = "ImageButton";
                    local v58 = v2.Dictionary.join({
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1
                    }, v54 or {});
                    local v59 = {
                        UIListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = if v41.props.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right, 
                            Padding = UDim.new(0, 10)
                        })
                    };
                    local v60;
                    if v47 then
                        v60 = v4.createElement;
                        local v61;
                        if v17 then
                            local l_repliesTo_0 = v41.props.repliesTo;
                            v61 = (if v17 and l_repliesTo_0 and l_repliesTo_0.visibility == v18.VisibilityTypes.Hidden then v20 else v19[l_repliesTo_0.messageType]).component;
                        else
                            v61 = v19[v41.props.repliesTo.messageType].component;
                        end;
                        v60 = v60(v61, {
                            additionalProps = v41.props.additionalProps, 
                            font = l_Body_0.Font, 
                            hasTail = false, 
                            innerPadding = 10, 
                            isIncoming = v41.props.isIncoming, 
                            isPending = false, 
                            isUnfiltered = v41.props.isUnfiltered, 
                            isRepliedTo = true, 
                            isLastMessageInMessageGroup = v41.props.isLastMessageInMessageGroup, 
                            maxWidth = if not not v7() or v16 then v44 else v41.getBubbleMaxWidth(v44, v46, v50, l_Body_0.Font), 
                            messageDefaultNoticeText = v41.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v41.props.messageModeratedNoticeText, 
                            parentWidth = v41.props.parentWidth, 
                            text = v41.props.repliesTo.content, 
                            textSize = v52, 
                            wideMode = v41.props.wideMode, 
                            [v4.Change.AbsoluteSize] = v41.messageSizeChanged, 
                            LayoutOrder = 1
                        });
                    else
                        v60 = nil;
                    end;
                    v59.repliesTo = v60;
                    v59.mainMessage = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        [v3.Change.AbsoluteSize] = v41.messageSizeChanged, 
                        LayoutOrder = 2, 
                        ref = if v55 then v55.ref else nil
                    }, {
                        UIListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v48.Tokens.Global.Size_50)
                        }), 
                        Icons = if v55 then v55.Icons else nil, 
                        [v42.name] = v4.createElement(v42.component, {
                            additionalProps = v41.props.additionalProps, 
                            font = l_Body_0.Font, 
                            hasTail = v41.props.isNewSender, 
                            innerPadding = 10, 
                            isIncoming = v41.props.isIncoming, 
                            isPending = v41.props.isSending or v41.props.moderated or v41.props.failed, 
                            isUnfiltered = v41.props.isUnfiltered, 
                            isLastMessageInMessageGroup = v41.props.isLastMessageInMessageGroup, 
                            isLastIncomingChatMessage = v41.props.isLastIncomingChatMessage, 
                            isPressed = if v55 then v55.isPressed else nil, 
                            maxWidth = if v16 then v41.getBubbleMaxWidth(v44, v46, v50, l_Body_0.Font, v41.props.translatedText) else v41.getBubbleMaxWidth(v44, v46, v50, l_Body_0.Font), 
                            messageDefaultNoticeText = v41.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v41.props.messageModeratedNoticeText, 
                            parentWidth = v41.props.parentWidth, 
                            text = v46, 
                            textSize = v50, 
                            wideMode = v41.props.wideMode, 
                            [v4.Change.AbsoluteSize] = v41.messageSizeChanged, 
                            LayoutOrder = v41.props.isIncoming and 1 or 2, 
                            translatedText = if v16 then v41.props.translatedText else nil
                        })
                    });
                    return l_createElement_0(v57, v58, v59);
                end
            }));
        end);
    end;
end;
if v16 then
    return function(v63) --[[ Line: 346 ]]
        -- upvalues: l_useTokens_0 (copy), v3 (copy), v24 (copy), v2 (copy)
        local v64 = l_useTokens_0();
        return v3.createElement(v24, v2.Dictionary.union(v63, {
            autotranslationOriginalTextFontSize = v64.Typography.BodySmall.FontSize
        }));
    end;
else
    return v24;
end;