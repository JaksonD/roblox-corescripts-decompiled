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
    local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAutotranslation);
    local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
    local v16 = require(l_script_FirstAncestor_0.Models.MessageModel);
    local v17 = require(l_Parent_0.Foundation);
    local l_View_0 = v17.View;
    local l_Image_0 = v17.Image;
    local v20 = {
        [v10.PlainText] = {
            component = v7, 
            name = "PlainText", 
            paddingOffset = 0
        }, 
        [v10.Link] = {
            component = v8, 
            name = "AssetCard", 
            paddingOffset = 0
        }
    };
    local v21 = {
        component = v9, 
        name = "Hidden", 
        paddingOffset = 0
    };
    local function _(v22) --[[ Line: 55 ]] --[[ Name: getMessageComponent ]]
        -- upvalues: v15 (copy), v16 (copy), v21 (copy), v20 (copy)
        if v15 and v22 and v22.visibility == v16.VisibilityTypes.Hidden then
            return v21;
        else
            return v20[v22.messageType];
        end;
    end;
    local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
    local v25 = {
        additionalProps = {
            shareLink = nil, 
            placeId = nil, 
            universeId = nil, 
            senderUserId = nil, 
            onDetailsOpened = function() --[[ Line: 118 ]] --[[ Name: onDetailsOpened ]]

            end, 
            openGameDetailsPage = function() --[[ Line: 119 ]] --[[ Name: openGameDetailsPage ]]

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
        closeKeyboard = function() --[[ Line: 145 ]] --[[ Name: closeKeyboard ]]

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
    return function(v26) --[[ Line: 157 ]]
        -- upvalues: v2 (copy), v25 (copy), l_useTokens_0 (copy), v14 (copy), v3 (copy), l_Text_0 (copy), v15 (copy), v16 (copy), v21 (copy), v20 (copy), l_pruneConsecutiveNewLines_0 (copy), v6 (copy), v12 (copy), l_View_0 (copy), v11 (copy), v4 (copy), l_Image_0 (copy)
        local v27 = v2.Dictionary.union(v25, v26);
        local function _(v28) --[[ Line: 162 ]] --[[ Name: getModeratedText ]]
            return string.gsub(v28, "[^%s]", "#");
        end;
        local function v33(v30, v31) --[[ Line: 166 ]] --[[ Name: messageMaxWidth ]]
            local v32 = 128;
            if v30 then
                v32 = v32 + 112;
            end;
            return v31 - v32;
        end;
        local v34 = l_useTokens_0();
        local v35 = nil;
        v35 = if v14 then v3.useCallback(function(v36, v37, v38, v39, v40) --[[ Line: 180 ]]
            -- upvalues: l_Text_0 (ref), v34 (copy)
            if v40 then
                local v41 = l_Text_0.GetTextBounds(v37, v39, v34.Typography.BodySmall.FontSize, Vector2.new(v36, 10000));
                local v42 = l_Text_0.GetTextBounds(v40, v39, v38, Vector2.new(v36, 10000));
                return math.max(v41.X, v42.X) + 20;
            else
                return l_Text_0.GetTextBounds(v37, v39, v38, Vector2.new(v36, 10000)).X + 20;
            end;
        end) else v3.useCallback(function(v43, v44, v45, v46) --[[ Line: 197 ]]
            -- upvalues: l_Text_0 (ref)
            return l_Text_0.GetTextBounds(v44, v46, v45, Vector2.new(v43, 10000)).X + 20;
        end);
        local v47 = if v15 then if v15 and v27 and v27.visibility == v16.VisibilityTypes.Hidden then v21 else v20[v27.messageType] else v20[v27.messageType];
        local v51 = v3.useMemo(function() --[[ Line: 206 ]]
            -- upvalues: v27 (copy)
            local l_wideMode_0 = v27.wideMode;
            local l_parentWidth_0 = v27.parentWidth;
            local v50 = 128;
            if l_wideMode_0 then
                v50 = v50 + 112;
            end;
            return l_parentWidth_0 - v50;
        end, {
            v33, 
            v27.wideMode, 
            v27.parentWidth
        });
        local l_content_0 = v27.content;
        l_content_0 = l_pruneConsecutiveNewLines_0(l_content_0);
        local v53 = v27.moderated and string.gsub(l_content_0, "[^%s]", "#") or l_content_0;
        local v54 = v6() and v27.repliesTo and v27.repliesTo.messageType and v27.repliesTo.content;
        local l_BodyLarge_0 = v34.Typography.BodyLarge;
        local l_FontSize_0 = l_BodyLarge_0.FontSize;
        local l_BodySmall_0 = v34.Typography.BodySmall;
        local l_FontSize_1 = l_BodySmall_0.FontSize;
        if not v47 then
            v12:warning("ChatMessage doesn't support messageType: {}", v27.messageType);
            return v3.createElement(l_View_0, {});
        else
            return v3.createElement(v11, v2.Dictionary.union(v27, {
                messageMaxWidth = v51, 
                messageTypePaddingOffset = v47.paddingOffset, 
                messageId = v27.messageId, 
                isPending = if v6() then v27.isSending or v27.moderated or v27.failed else nil, 
                visibility = if v15 then v27.visibility else nil, 
                renderMessage = not v6() and function(v59) --[[ Line: 245 ]]
                    -- upvalues: v4 (ref), v47 (copy), v3 (ref), v2 (ref), v27 (copy), l_BodyLarge_0 (copy), v14 (ref), v35 (ref), v51 (copy), v53 (copy), l_FontSize_0 (copy)
                    return v4.createFragment({
                        [v47.name] = v3.createElement(v47.component, v2.Dictionary.union({
                            additionalProps = v27.additionalProps, 
                            font = l_BodyLarge_0.Font, 
                            hasTail = v27.isNewSender, 
                            innerPadding = 10, 
                            isIncoming = v27.isIncoming, 
                            isPending = v27.isSending or v27.moderated or v27.failed, 
                            isUnfiltered = v27.isUnfiltered, 
                            isLastMessageInMessageGroup = v27.isLastMessageInMessageGroup, 
                            maxWidth = if v14 then v35(v51, v53, l_FontSize_0, l_BodyLarge_0.Font, v27.translatedText) else v35(v51, v53, l_FontSize_0, l_BodyLarge_0.Font), 
                            messageDefaultNoticeText = v27.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v27.messageModeratedNoticeText, 
                            parentWidth = v27.parentWidth, 
                            text = v53, 
                            textSize = l_FontSize_0, 
                            wideMode = v27.wideMode, 
                            translatedText = if v14 then v27.translatedText else nil
                        }, v59 or {}))
                    });
                end or function(v60, v61) --[[ Line: 288 ]]
                    -- upvalues: v3 (ref), l_Image_0 (ref), v2 (ref), v27 (copy), v54 (copy), v15 (ref), v16 (ref), v21 (ref), v20 (ref), l_BodyLarge_0 (copy), v6 (ref), v51 (copy), v35 (ref), l_FontSize_1 (copy), l_BodySmall_0 (copy), l_View_0 (ref), v47 (copy), v14 (ref), v53 (copy), l_FontSize_0 (copy)
                    local l_createElement_0 = v3.createElement;
                    local l_l_Image_0_0 = l_Image_0;
                    local v64 = v2.Dictionary.union({
                        tag = {
                            ["auto-xy gui-object-defaults col align-y-center"] = true, 
                            ["align-x-left"] = v27.isIncoming, 
                            ["align-x-right"] = not v27.isIncoming
                        }, 
                        layout = {
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 10)
                        }
                    }, v60 or {});
                    local v65 = {};
                    local v66;
                    if v54 then
                        v66 = v3.createElement;
                        local v67;
                        if v15 then
                            local l_repliesTo_0 = v27.repliesTo;
                            v67 = (if v15 and l_repliesTo_0 and l_repliesTo_0.visibility == v16.VisibilityTypes.Hidden then v21 else v20[l_repliesTo_0.messageType]).component;
                        else
                            v67 = v20[v27.repliesTo.messageType].component;
                        end;
                        v66 = v66(v67, {
                            additionalProps = v27.additionalProps, 
                            font = l_BodyLarge_0.Font, 
                            hasTail = false, 
                            innerPadding = 10, 
                            isIncoming = v27.isIncoming, 
                            isPending = false, 
                            isUnfiltered = v27.isUnfiltered, 
                            isRepliedTo = true, 
                            isLastMessageInMessageGroup = v27.isLastMessageInMessageGroup, 
                            maxWidth = if v6() then v51 else v35(v51, v27.repliesTo.content, l_FontSize_1, l_BodySmall_0.Font), 
                            messageDefaultNoticeText = v27.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v27.messageModeratedNoticeText, 
                            parentWidth = v27.parentWidth, 
                            text = v27.repliesTo.content, 
                            textSize = l_FontSize_1, 
                            wideMode = v27.wideMode, 
                            LayoutOrder = 1
                        });
                    else
                        v66 = nil;
                    end;
                    v65.repliesTo = v66;
                    v65.mainMessage = v3.createElement(l_View_0, {
                        tag = "row auto-xy align-y-center gap-xxsmall", 
                        LayoutOrder = 2, 
                        ref = if v61 then v61.ref else nil
                    }, {
                        Icons = if v61 then v61.Icons else nil, 
                        [v47.name] = v3.createElement(v47.component, {
                            additionalProps = v27.additionalProps, 
                            font = l_BodyLarge_0.Font, 
                            hasTail = v27.isNewSender == true, 
                            innerPadding = 10, 
                            isIncoming = v27.isIncoming, 
                            isPending = v27.isSending or v27.moderated or v27.failed, 
                            isUnfiltered = v27.isUnfiltered, 
                            isLastMessageInMessageGroup = v27.isLastMessageInMessageGroup, 
                            isLastIncomingChatMessage = v27.isLastIncomingChatMessage, 
                            isPressed = if v61 then v61.isPressed else nil, 
                            maxWidth = if v14 then v35(v51, v53, l_FontSize_0, l_BodyLarge_0.Font, v27.translatedText) else v35(v51, v53, l_FontSize_0, l_BodyLarge_0.Font), 
                            messageDefaultNoticeText = v27.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v27.messageModeratedNoticeText, 
                            parentWidth = v27.parentWidth, 
                            text = v53, 
                            textSize = l_FontSize_0, 
                            wideMode = v27.wideMode, 
                            LayoutOrder = v27.isIncoming and 1 or 2, 
                            translatedText = if v14 then v27.translatedText else nil
                        })
                    });
                    return l_createElement_0(l_l_Image_0_0, v64, v65);
                end
            }));
        end;
    end;
end;