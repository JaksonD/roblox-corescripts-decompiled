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
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAutotranslation);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
local v19 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v20 = {
    [v12.PlainText] = {
        component = v8, 
        name = "PlainText", 
        paddingOffset = 0
    }, 
    [v12.Link] = {
        component = v10, 
        name = "AssetCard", 
        paddingOffset = v16 and 0 or 2
    }
};
local v21 = {
    component = v11, 
    name = "Hidden", 
    paddingOffset = 0
};
local function _(v22) --[[ Line: 51 ]] --[[ Name: getMessageComponent ]]
    -- upvalues: v18 (copy), v19 (copy), v21 (copy), v20 (copy)
    if v18 and v22 and v22.visibility == v19.VisibilityTypes.Hidden then
        return v21;
    else
        return v20[v22.messageType];
    end;
end;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v25 = v4.PureComponent:extend("ChatMessage");
v25.defaultProps = {
    additionalProps = {
        shareLink = nil, 
        placeId = nil, 
        universeId = nil, 
        senderUserId = nil, 
        onDetailsOpened = function() --[[ Line: 69 ]] --[[ Name: onDetailsOpened ]]

        end, 
        openGameDetailsPage = function() --[[ Line: 70 ]] --[[ Name: openGameDetailsPage ]]

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
    closeKeyboard = function() --[[ Line: 95 ]] --[[ Name: closeKeyboard ]]

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
v25.init = function(v26) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), l_memoize_0 (copy), l_Text_0 (copy)
    v26.getModeratedText = function(v27) --[[ Line: 108 ]]
        return string.gsub(v27, "[^%s]", "#");
    end;
    v26.messageMaxWidth = function(v28, v29) --[[ Line: 112 ]]
        local v30 = 128;
        if v28 then
            v30 = v30 + 112;
        end;
        return v29 - v30;
    end;
    if v17 then
        v26.getBubbleMaxWidth = l_memoize_0(function(v31, v32, v33, v34, v35) --[[ Line: 123 ]]
            -- upvalues: l_Text_0 (ref), v26 (copy)
            if v35 then
                local v36 = l_Text_0.GetTextBounds(v32, v34, v26.props.autotranslationOriginalTextFontSize, Vector2.new(v31, 10000));
                local v37 = l_Text_0.GetTextBounds(v35, v34, v33, Vector2.new(v31, 10000));
                return math.max(v36.X, v37.X) + 20;
            else
                return l_Text_0.GetTextBounds(v32, v34, v33, Vector2.new(v31, 10000)).X + 20;
            end;
        end);
        return;
    else
        v26.getBubbleMaxWidth = l_memoize_0(function(v38, v39, v40, v41) --[[ Line: 140 ]]
            -- upvalues: l_Text_0 (ref)
            return l_Text_0.GetTextBounds(v39, v41, v40, Vector2.new(v38, 10000)).X + 20;
        end);
        return;
    end;
end;
v25.render = function(v42) --[[ Line: 147 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v19 (copy), v21 (copy), v20 (copy), v14 (copy), l_pruneConsecutiveNewLines_0 (copy), v7 (copy), l_withStyle_0 (copy), v4 (copy), v13 (copy), v2 (copy), v17 (copy), v3 (copy), v16 (copy)
    local v43;
    if v18 then
        local l_props_0 = v42.props;
        v43 = if v18 and l_props_0 and l_props_0.visibility == v19.VisibilityTypes.Hidden then v21 else v20[l_props_0.messageType];
    else
        v43 = v20[v42.props.messageType];
    end;
    local v45 = v42.messageMaxWidth(v42.props.wideMode, v42.props.parentWidth);
    if not v43 then
        v14:warning("ChatMessage doesn't support messageType: {}", v42.props.messageType);
        return nil;
    else
        local l_content_0 = v42.props.content;
        l_content_0 = l_pruneConsecutiveNewLines_0(l_content_0);
        local v47 = v42.props.moderated and v42.getModeratedText(l_content_0) or l_content_0;
        local v48 = v7() and v42.props.repliesTo and v42.props.repliesTo.messageType and v42.props.repliesTo.content;
        return l_withStyle_0(function(v49) --[[ Line: 169 ]]
            -- upvalues: v4 (ref), v13 (ref), v2 (ref), v42 (copy), v45 (copy), v43 (copy), v7 (ref), v18 (ref), v17 (ref), v47 (copy), v3 (ref), v48 (copy), v19 (ref), v21 (ref), v20 (ref), v16 (ref)
            local l_Body_0 = v49.Font.Body;
            local v51 = v49.Font.BaseSize * l_Body_0.RelativeSize;
            local l_BodySmall_0 = v49.Font.BodySmall;
            local v53 = v49.Font.BaseSize * l_BodySmall_0.RelativeSize;
            return v4.createElement(v13, v2.Dictionary.join(v42.props, {
                messageMaxWidth = v45, 
                messageTypePaddingOffset = v43.paddingOffset, 
                messageId = v42.props.messageId, 
                isPending = if v7() then v42.props.isSending or v42.props.moderated or v42.props.failed else nil, 
                visibility = if v18 then v42.props.visibility else nil, 
                renderMessage = not v7() and function(v54) --[[ Line: 189 ]]
                    -- upvalues: v4 (ref), v43 (ref), v2 (ref), v42 (ref), l_Body_0 (copy), v17 (ref), v45 (ref), v47 (ref), v51 (copy)
                    return v4.createFragment({
                        [v43.name] = v4.createElement(v43.component, v2.Dictionary.join({
                            additionalProps = v42.props.additionalProps, 
                            font = l_Body_0.Font, 
                            hasTail = v42.props.isNewSender, 
                            innerPadding = 10, 
                            isIncoming = v42.props.isIncoming, 
                            isPending = v42.props.isSending or v42.props.moderated or v42.props.failed, 
                            isUnfiltered = v42.props.isUnfiltered, 
                            isLastMessageInMessageGroup = v42.props.isLastMessageInMessageGroup, 
                            maxWidth = if v17 then v42.getBubbleMaxWidth(v45, v47, v51, l_Body_0.Font, v42.props.translatedText) else v42.getBubbleMaxWidth(v45, v47, v51, l_Body_0.Font), 
                            messageDefaultNoticeText = v42.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v42.props.messageModeratedNoticeText, 
                            parentWidth = v42.props.parentWidth, 
                            text = v47, 
                            textSize = v51, 
                            wideMode = v42.props.wideMode, 
                            [v4.Change.AbsoluteSize] = v42.messageSizeChanged, 
                            translatedText = if v17 then v42.props.translatedText else nil
                        }, v54 or {}))
                    });
                end or function(v55, v56) --[[ Line: 233 ]]
                    -- upvalues: v3 (ref), v2 (ref), v42 (ref), v48 (ref), v4 (ref), v18 (ref), v19 (ref), v21 (ref), v20 (ref), l_Body_0 (copy), v7 (ref), v17 (ref), v45 (ref), v47 (ref), v51 (copy), v53 (copy), v49 (copy), v43 (ref), v16 (ref)
                    local l_createElement_0 = v3.createElement;
                    local v58 = "ImageButton";
                    local v59 = v2.Dictionary.join({
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1
                    }, v55 or {});
                    local v60 = {
                        UIListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = if v42.props.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right, 
                            Padding = UDim.new(0, 10)
                        })
                    };
                    local v61;
                    if v48 then
                        v61 = v4.createElement;
                        local v62;
                        if v18 then
                            local l_repliesTo_0 = v42.props.repliesTo;
                            v62 = (if v18 and l_repliesTo_0 and l_repliesTo_0.visibility == v19.VisibilityTypes.Hidden then v21 else v20[l_repliesTo_0.messageType]).component;
                        else
                            v62 = v20[v42.props.repliesTo.messageType].component;
                        end;
                        v61 = v61(v62, {
                            additionalProps = v42.props.additionalProps, 
                            font = l_Body_0.Font, 
                            hasTail = false, 
                            innerPadding = 10, 
                            isIncoming = v42.props.isIncoming, 
                            isPending = false, 
                            isUnfiltered = v42.props.isUnfiltered, 
                            isRepliedTo = true, 
                            isLastMessageInMessageGroup = v42.props.isLastMessageInMessageGroup, 
                            maxWidth = if not not v7() or v17 then v45 else v42.getBubbleMaxWidth(v45, v47, v51, l_Body_0.Font), 
                            messageDefaultNoticeText = v42.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v42.props.messageModeratedNoticeText, 
                            parentWidth = v42.props.parentWidth, 
                            text = v42.props.repliesTo.content, 
                            textSize = v53, 
                            wideMode = v42.props.wideMode, 
                            [v4.Change.AbsoluteSize] = v42.messageSizeChanged, 
                            LayoutOrder = 1
                        });
                    else
                        v61 = nil;
                    end;
                    v60.repliesTo = v61;
                    v60.mainMessage = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        [v3.Change.AbsoluteSize] = v42.messageSizeChanged, 
                        LayoutOrder = 2, 
                        ref = if v56 then v56.ref else nil
                    }, {
                        UIListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v49.Tokens.Global.Size_50)
                        }), 
                        Icons = if v56 then v56.Icons else nil, 
                        [v43.name] = v4.createElement(v43.component, {
                            additionalProps = v42.props.additionalProps, 
                            font = l_Body_0.Font, 
                            hasTail = (not not v16 or not v42.props.repliesTo) and v42.props.isNewSender, 
                            innerPadding = 10, 
                            isIncoming = v42.props.isIncoming, 
                            isPending = v42.props.isSending or v42.props.moderated or v42.props.failed, 
                            isUnfiltered = v42.props.isUnfiltered, 
                            isLastMessageInMessageGroup = v42.props.isLastMessageInMessageGroup, 
                            isLastIncomingChatMessage = v42.props.isLastIncomingChatMessage, 
                            isPressed = if v56 then v56.isPressed else nil, 
                            maxWidth = if v17 then v42.getBubbleMaxWidth(v45, v47, v51, l_Body_0.Font, v42.props.translatedText) else v42.getBubbleMaxWidth(v45, v47, v51, l_Body_0.Font), 
                            messageDefaultNoticeText = v42.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v42.props.messageModeratedNoticeText, 
                            parentWidth = v42.props.parentWidth, 
                            text = v47, 
                            textSize = v51, 
                            wideMode = v42.props.wideMode, 
                            [v4.Change.AbsoluteSize] = v42.messageSizeChanged, 
                            LayoutOrder = v42.props.isIncoming and 1 or 2, 
                            translatedText = if v17 then v42.props.translatedText else nil
                        })
                    });
                    return l_createElement_0(v58, v59, v60);
                end
            }));
        end);
    end;
end;
if v17 then
    return function(v64) --[[ Line: 349 ]]
        -- upvalues: l_useTokens_0 (copy), v3 (copy), v25 (copy), v2 (copy)
        local v65 = l_useTokens_0();
        return v3.createElement(v25, v2.Dictionary.union(v64, {
            autotranslationOriginalTextFontSize = v65.Typography.BodySmall.FontSize
        }));
    end;
else
    return v25;
end;