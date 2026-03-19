local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
if not require(l_script_FirstAncestor_0.Flags.FFlagAppChatRefactorChatMessage) then
    return require(script.Parent.ChatMessageDeprecated);
else
    local l_Parent_0 = l_script_FirstAncestor_0.Parent;
    local v2 = require(l_Parent_0.Cryo);
    local v3 = require(l_Parent_0.React);
    local v4 = require(l_Parent_0.Roact);
    local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
    local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
    local v7 = require(script.Parent.PlainTextAutomaticSize);
    local v8 = require(script.Parent.AssetCardTempAutomaticSize);
    local v9 = require(script.Parent.HiddenMessage);
    local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
    local v11 = require(script.Parent.ChatMessageContainerAutomaticSize);
    local v12 = require(script.Parent.Logger);
    local l_pruneConsecutiveNewLines_0 = require(l_script_FirstAncestor_0.SocialLibraries).Utils.pruneConsecutiveNewLines;
    local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
    local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAutotranslation);
    local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
    local v17 = require(l_script_FirstAncestor_0.Models.MessageModel);
    local v18 = require(l_Parent_0.Foundation);
    local l_View_0 = v18.View;
    local l_Image_0 = v18.Image;
    local v21 = {
        [v10.PlainText] = {
            component = v7, 
            name = "PlainText", 
            paddingOffset = 0
        }, 
        [v10.Link] = {
            component = v8, 
            name = "AssetCard", 
            paddingOffset = v14 and 0 or 2
        }
    };
    local v22 = {
        component = v9, 
        name = "Hidden", 
        paddingOffset = 0
    };
    local function _(v23) --[[ Line: 57 ]] --[[ Name: getMessageComponent ]]
        -- upvalues: v16 (copy), v17 (copy), v22 (copy), v21 (copy)
        if v16 and v23 and v23.visibility == v17.VisibilityTypes.Hidden then
            return v22;
        else
            return v21[v23.messageType];
        end;
    end;
    local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
    local v26 = {
        additionalProps = {
            shareLink = nil, 
            placeId = nil, 
            universeId = nil, 
            senderUserId = nil, 
            onDetailsOpened = function() --[[ Line: 120 ]] --[[ Name: onDetailsOpened ]]

            end, 
            openGameDetailsPage = function() --[[ Line: 121 ]] --[[ Name: openGameDetailsPage ]]

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
        visibility = nil, 
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
        closeKeyboard = function() --[[ Line: 147 ]] --[[ Name: closeKeyboard ]]

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
    return function(v27) --[[ Line: 159 ]]
        -- upvalues: v2 (copy), v26 (copy), l_useTokens_0 (copy), v15 (copy), v3 (copy), l_Text_0 (copy), v16 (copy), v17 (copy), v22 (copy), v21 (copy), l_pruneConsecutiveNewLines_0 (copy), v6 (copy), v12 (copy), l_View_0 (copy), v11 (copy), v4 (copy), l_Image_0 (copy), v14 (copy)
        local v28 = v2.Dictionary.union(v26, v27);
        local function _(v29) --[[ Line: 164 ]] --[[ Name: getModeratedText ]]
            return string.gsub(v29, "[^%s]", "#");
        end;
        local function v34(v31, v32) --[[ Line: 168 ]] --[[ Name: messageMaxWidth ]]
            local v33 = 128;
            if v31 then
                v33 = v33 + 112;
            end;
            return v32 - v33;
        end;
        local v35 = l_useTokens_0();
        local v36 = nil;
        v36 = if v15 then v3.useCallback(function(v37, v38, v39, v40, v41) --[[ Line: 182 ]]
            -- upvalues: l_Text_0 (ref), v35 (copy)
            if v41 then
                local v42 = l_Text_0.GetTextBounds(v38, v40, v35.Typography.BodySmall.FontSize, Vector2.new(v37, 10000));
                local v43 = l_Text_0.GetTextBounds(v41, v40, v39, Vector2.new(v37, 10000));
                return math.max(v42.X, v43.X) + 20;
            else
                return l_Text_0.GetTextBounds(v38, v40, v39, Vector2.new(v37, 10000)).X + 20;
            end;
        end) else v3.useCallback(function(v44, v45, v46, v47) --[[ Line: 199 ]]
            -- upvalues: l_Text_0 (ref)
            return l_Text_0.GetTextBounds(v45, v47, v46, Vector2.new(v44, 10000)).X + 20;
        end);
        local v48 = if v16 then if v16 and v28 and v28.visibility == v17.VisibilityTypes.Hidden then v22 else v21[v28.messageType] else v21[v28.messageType];
        local v52 = v3.useMemo(function() --[[ Line: 208 ]]
            -- upvalues: v28 (copy)
            local l_wideMode_0 = v28.wideMode;
            local l_parentWidth_0 = v28.parentWidth;
            local v51 = 128;
            if l_wideMode_0 then
                v51 = v51 + 112;
            end;
            return l_parentWidth_0 - v51;
        end, {
            v34, 
            v28.wideMode, 
            v28.parentWidth
        });
        local l_content_0 = v28.content;
        l_content_0 = l_pruneConsecutiveNewLines_0(l_content_0);
        local v54 = v28.moderated and string.gsub(l_content_0, "[^%s]", "#") or l_content_0;
        local v55 = v6() and v28.repliesTo and v28.repliesTo.messageType and v28.repliesTo.content;
        local l_BodyLarge_0 = v35.Typography.BodyLarge;
        local l_FontSize_0 = l_BodyLarge_0.FontSize;
        local l_BodySmall_0 = v35.Typography.BodySmall;
        local l_FontSize_1 = l_BodySmall_0.FontSize;
        if not v48 then
            v12:warning("ChatMessage doesn't support messageType: {}", v28.messageType);
            return v3.createElement(l_View_0, {});
        else
            return v3.createElement(v11, v2.Dictionary.union(v28, {
                messageMaxWidth = v52, 
                messageTypePaddingOffset = v48.paddingOffset, 
                messageId = v28.messageId, 
                isPending = if v6() then v28.isSending or v28.moderated or v28.failed else nil, 
                visibility = if v16 then v28.visibility else nil, 
                renderMessage = not v6() and function(v60) --[[ Line: 247 ]]
                    -- upvalues: v4 (ref), v48 (copy), v3 (ref), v2 (ref), v28 (copy), l_BodyLarge_0 (copy), v15 (ref), v36 (ref), v52 (copy), v54 (copy), l_FontSize_0 (copy)
                    return v4.createFragment({
                        [v48.name] = v3.createElement(v48.component, v2.Dictionary.union({
                            additionalProps = v28.additionalProps, 
                            font = l_BodyLarge_0.Font, 
                            hasTail = v28.isNewSender, 
                            innerPadding = 10, 
                            isIncoming = v28.isIncoming, 
                            isPending = v28.isSending or v28.moderated or v28.failed, 
                            isUnfiltered = v28.isUnfiltered, 
                            isLastMessageInMessageGroup = v28.isLastMessageInMessageGroup, 
                            maxWidth = if v15 then v36(v52, v54, l_FontSize_0, l_BodyLarge_0.Font, v28.translatedText) else v36(v52, v54, l_FontSize_0, l_BodyLarge_0.Font), 
                            messageDefaultNoticeText = v28.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v28.messageModeratedNoticeText, 
                            parentWidth = v28.parentWidth, 
                            text = v54, 
                            textSize = l_FontSize_0, 
                            wideMode = v28.wideMode, 
                            translatedText = if v15 then v28.translatedText else nil
                        }, v60 or {}))
                    });
                end or function(v61, v62) --[[ Line: 290 ]]
                    -- upvalues: v3 (ref), l_Image_0 (ref), v2 (ref), v28 (copy), v55 (copy), v16 (ref), v17 (ref), v22 (ref), v21 (ref), l_BodyLarge_0 (copy), v6 (ref), v52 (copy), v36 (ref), l_FontSize_1 (copy), l_BodySmall_0 (copy), l_View_0 (ref), v48 (copy), v14 (ref), v15 (ref), v54 (copy), l_FontSize_0 (copy)
                    local l_createElement_0 = v3.createElement;
                    local l_l_Image_0_0 = l_Image_0;
                    local v65 = v2.Dictionary.union({
                        tag = {
                            ["auto-xy gui-object-defaults col align-y-center"] = true, 
                            ["align-x-left"] = v28.isIncoming, 
                            ["align-x-right"] = not v28.isIncoming
                        }, 
                        layout = {
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 10)
                        }
                    }, v61 or {});
                    local v66 = {};
                    local v67;
                    if v55 then
                        v67 = v3.createElement;
                        local v68;
                        if v16 then
                            local l_repliesTo_0 = v28.repliesTo;
                            v68 = (if v16 and l_repliesTo_0 and l_repliesTo_0.visibility == v17.VisibilityTypes.Hidden then v22 else v21[l_repliesTo_0.messageType]).component;
                        else
                            v68 = v21[v28.repliesTo.messageType].component;
                        end;
                        v67 = v67(v68, {
                            additionalProps = v28.additionalProps, 
                            font = l_BodyLarge_0.Font, 
                            hasTail = false, 
                            innerPadding = 10, 
                            isIncoming = v28.isIncoming, 
                            isPending = false, 
                            isUnfiltered = v28.isUnfiltered, 
                            isRepliedTo = true, 
                            isLastMessageInMessageGroup = v28.isLastMessageInMessageGroup, 
                            maxWidth = if v6() then v52 else v36(v52, v28.repliesTo.content, l_FontSize_1, l_BodySmall_0.Font), 
                            messageDefaultNoticeText = v28.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v28.messageModeratedNoticeText, 
                            parentWidth = v28.parentWidth, 
                            text = v28.repliesTo.content, 
                            textSize = l_FontSize_1, 
                            wideMode = v28.wideMode, 
                            LayoutOrder = 1
                        });
                    else
                        v67 = nil;
                    end;
                    v66.repliesTo = v67;
                    v66.mainMessage = v3.createElement(l_View_0, {
                        tag = "row auto-xy align-y-center gap-xxsmall", 
                        LayoutOrder = 2, 
                        ref = if v62 then v62.ref else nil
                    }, {
                        Icons = if v62 then v62.Icons else nil, 
                        [v48.name] = v3.createElement(v48.component, {
                            additionalProps = v28.additionalProps, 
                            font = l_BodyLarge_0.Font, 
                            hasTail = (not not v14 or v28.repliesTo == nil) and v28.isNewSender == true, 
                            innerPadding = 10, 
                            isIncoming = v28.isIncoming, 
                            isPending = v28.isSending or v28.moderated or v28.failed, 
                            isUnfiltered = v28.isUnfiltered, 
                            isLastMessageInMessageGroup = v28.isLastMessageInMessageGroup, 
                            isLastIncomingChatMessage = v28.isLastIncomingChatMessage, 
                            isPressed = if v62 then v62.isPressed else nil, 
                            maxWidth = if v15 then v36(v52, v54, l_FontSize_0, l_BodyLarge_0.Font, v28.translatedText) else v36(v52, v54, l_FontSize_0, l_BodyLarge_0.Font), 
                            messageDefaultNoticeText = v28.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v28.messageModeratedNoticeText, 
                            parentWidth = v28.parentWidth, 
                            text = v54, 
                            textSize = l_FontSize_0, 
                            wideMode = v28.wideMode, 
                            LayoutOrder = v28.isIncoming and 1 or 2, 
                            translatedText = if v15 then v28.translatedText else nil
                        })
                    });
                    return l_createElement_0(l_l_Image_0_0, v65, v66);
                end
            }));
        end;
    end;
end;