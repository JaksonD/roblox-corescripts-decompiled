local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_IXPService_0 = game:GetService("IXPService");
local v3 = require(l_Parent_0.Roact);
local l_BidirectionalFlatList_0 = require(l_Parent_0.VirtualizedList).BidirectionalFlatList;
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationService_0 = v6.FocusNavigationService;
local l_CoreGui_0 = v6.EngineInterface.CoreGui;
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v10 = require(l_script_FirstAncestor_0.Telemetry.createScrollIntervalTracker);
local v11 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local v12 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v13 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v14 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v15 = require(script.Parent.Utils.getLastMessageWithFilter);
local v16 = require(script.Parent.ChatMessage);
local v17 = require(script.Parent.SystemMessage);
local v18 = require(script.Parent.SystemMessageContainer);
local v19 = require(script.Parent.CustomMessageEntryContainer);
local v20 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_GetFFlagEnableSocialCards_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialCards;
local v22 = game:DefineFastInt("AppChatMessageInitialFetchMinMessages", 20);
local v23 = game:DefineFastInt("AppChatInitialMessageFetchLimit", 10);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatHandleAgeChange);
local v25 = game:DefineFastInt("AppChatOsaAutoScrollDelayMs", 100);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAutotranslation);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAutotranslationRespectsExperienceChatSetting);
local l_FFlagEnableAppChatMessageVisibility_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatMessageVisibility;
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatChatBubbleUIRevampIxpEnabled);
local v32 = require(l_script_FirstAncestor_0.Flags.FStringAppChatChatBubbleUIRevampIxpLayer);
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableMessageAuthorPresence);
local v34 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatPerfChatConversationPaginationEnabled);
local v35 = game:DefineFastInt("AppChatPerfChatConversationPaginationWindowSize", 2);
local v36 = game:DefineFastInt("AppChatPerfChatConversationPaginationInitialRender", 10);
local v37 = game:DefineFastInt("AppChatPerfChatConversationPaginationOnStartReached", 64);
local v38 = game:DefineFastInt("AppChatPerfChatConversationPaginationOnEndReached", 100);
local function v40(v39) --[[ Line: 63 ]] --[[ Name: isIncomingChatMessage ]]
    -- upvalues: v13 (copy)
    return v39.isIncoming and (v39.messageType == v13.PlainText or v39.messageType == v13.Link);
end;
local function v43(v41) --[[ Line: 68 ]]
    -- upvalues: v13 (copy)
    local v42 = true;
    if v41.messageType ~= v13.PlainText then
        v42 = v41.messageType == v13.Link;
    end;
    return v42;
end;
local v44 = v3.PureComponent:extend("MessageList");
v44.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    autoScrollMaxIndex = 3, 
    bottomMargin = 10, 
    conversationId = nil, 
    initialFocusIndex = 1, 
    isDebugEnabled = false, 
    itemList = {}, 
    loadNext = function() --[[ Line: 82 ]] --[[ Name: loadNext ]]

    end, 
    markAsRead = function() --[[ Line: 83 ]] --[[ Name: markAsRead ]]

    end, 
    messageListRef = nil, 
    onDetailsOpened = function() --[[ Line: 85 ]] --[[ Name: onDetailsOpened ]]

    end, 
    openGameDetailsPage = function(_, _) --[[ Line: 86 ]] --[[ Name: openGameDetailsPage ]]

    end, 
    openViewProfile = nil, 
    wideMode = false, 
    viewProfileOnAvatarPressed = true, 
    closeKeyboard = function() --[[ Line: 90 ]] --[[ Name: closeKeyboard ]]

    end, 
    inputBoxRef = nil, 
    invalidMessageTypeText = "PLACEHOLDER This message could not be displayed", 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    unknownUserText = "PLACEHOLDER unknown user", 
    scrollToTopOnInitialOsaLoad = false
};
local function v49(v47, v48) --[[ Line: 100 ]] --[[ Name: compareItemData ]]
    if v47 == nil or v48 == nil then
        return false;
    else
        return v47.stable_key ~= nil and v47.stable_key == v48.stable_key or v47.messageId ~= nil and v47.messageId == v48.messageId;
    end;
end;
v44.init = function(v50) --[[ Line: 109 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v12 (copy), v13 (copy), v3 (copy), v28 (copy), v20 (copy), v15 (copy), v40 (copy), v31 (copy), l_IXPService_0 (copy), v32 (copy), v19 (copy), v18 (copy), l_GetFFlagEnableSocialCards_0 (copy), v33 (copy), v26 (copy), v16 (copy), v14 (copy), v30 (copy), l_FFlagEnableAppChatMessageVisibility_0 (copy), v17 (copy), v10 (copy), v11 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationService_0 (copy), l_CoreGui_0 (copy)
    v50.state = {
        width = 0, 
        startIndex = 1, 
        firstItem = v50.props.itemList[1]
    };
    v50.focusIndex = v50.props.initialFocusIndex;
    if v9 then
        v50._scrollIntervalTracker = nil;
    end;
    v50.isValidMessageAndSenderType = function(v51, v52) --[[ Line: 122 ]]
        -- upvalues: v12 (ref), v13 (ref)
        if v52 == v12.SenderTypes.System then
            return v51 == v13.System;
        elseif v52 == v12.SenderTypes.User then
            local v53 = true;
            if v51 ~= v13.PlainText then
                v53 = v51 == v13.Link;
            end;
            return v53;
        elseif v51 == v13.Custom then
            return true;
        else
            return false;
        end;
    end;
    v50.ref = v50.props.messageListRef or v3.createRef();
    local v54 = if v28 then game:GetService("TextChatService").ChatTranslationEnabled else false;
    v50.lastIncomingChatMessageId = nil;
    if v20() and v50.props.itemList then
        v50.lastIncomingChatMessageId = v15(v50.props.itemList, v40);
    end;
    v50.logChatBubbleRevampExposure = function() --[[ Line: 146 ]]
        -- upvalues: v31 (ref), l_IXPService_0 (ref), v32 (ref)
        if v31 then
            pcall(function() --[[ Line: 148 ]]
                -- upvalues: l_IXPService_0 (ref), v32 (ref)
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v32);
            end);
        end;
    end;
    v50.renderItem = function(v55) --[[ Line: 154 ]]
        -- upvalues: v50 (copy), v3 (ref), v13 (ref), v19 (ref), v18 (ref), l_GetFFlagEnableSocialCards_0 (ref), v33 (ref), v26 (ref), v28 (ref), v54 (copy), v16 (ref), v14 (ref), v20 (ref), v30 (ref), l_FFlagEnableAppChatMessageVisibility_0 (ref), v17 (ref)
        if v50.isValidMessageAndSenderType(v55.messageType, v55.senderType) then
            local v56 = v50.props.isDebugEnabled and v3.createElement("StringValue", {
                Value = tostring(v55.messageId)
            });
            if v55.messageType == v13.Custom then
                return v3.createElement(v19, {
                    openViewProfile = v50.props.openViewProfile, 
                    customEntryType = v55.customEntryType, 
                    conversationId = v50.props.conversationId
                });
            elseif v55.messageType == v13.System then
                return v3.createElement(v18, {
                    cards = if l_GetFFlagEnableSocialCards_0() then v55.cards else nil, 
                    text = v55.content, 
                    parentWidth = v50.state.width, 
                    sent = v55.sent, 
                    showDateTime = v55.showDateTime, 
                    messageId = v55.messageId, 
                    senderTargetId = if l_GetFFlagEnableSocialCards_0() then v55.senderTargetId else nil, 
                    conversationId = if l_GetFFlagEnableSocialCards_0() and v33 then v50.props.conversationId else nil, 
                    debugElement = v56
                });
            else
                local l_additionalProps_0 = v55.additionalProps;
                if l_additionalProps_0 then
                    l_additionalProps_0.onDetailsOpened = v50.props.onDetailsOpened;
                end;
                if not l_additionalProps_0 then
                    l_additionalProps_0 = {};
                end;
                l_additionalProps_0.openGameDetailsPage = v50.props.openGameDetailsPage;
                l_additionalProps_0.shareLink = v55.shareLink;
                local v58 = nil;
                if v26 then
                    v58 = if v28 then if v54 then v55.contentToDisplay else nil else v55.contentToDisplay;
                end;
                return v3.createElement(v16, {
                    additionalProps = l_additionalProps_0, 
                    content = v55.content, 
                    debugElement = v56, 
                    failed = v55.failed, 
                    filteredForReceivers = v55.filteredForReceivers, 
                    isIncoming = v55.isIncoming, 
                    isNewSender = v55.isNewSender, 
                    isSending = v55.isSending, 
                    isUnfiltered = v55.moderationType == v14.ModerationTypes.TrustedComms, 
                    isLastMessageInMessageGroup = v55.isLastMessageInMessageGroup, 
                    isLastIncomingChatMessage = if v20() then v55.messageId == v50.lastIncomingChatMessageId else nil, 
                    messageDefaultNoticeText = v50.props.messageDefaultNoticeText, 
                    conversationId = if not not v20() or v33 then v50.props.conversationId else nil, 
                    messageId = v55.messageId, 
                    messageModeratedNoticeText = v50.props.messageModeratedNoticeText, 
                    messageHiddenNoticeText = if v30 then v50.props.messageHiddenNoticeText else nil, 
                    messageType = v55.messageType, 
                    moderated = v55.moderated, 
                    openViewProfile = v50.props.openViewProfile, 
                    parentWidth = v50.state.width, 
                    readingMessagesIsEnabled = true, 
                    senderUserId = if v20() then v55.senderTargetId else v55.sender.id, 
                    sent = v55.sent, 
                    showDateTime = v55.showDateTime, 
                    showDisplayName = v55.showDisplayName, 
                    shouldShowName = v55.sender.shouldShowName, 
                    thumbnail = v55.sender.thumbnail, 
                    wideMode = v50.props.wideMode, 
                    unknownUserText = v50.props.unknownUserText, 
                    viewProfileOnAvatarPressed = v50.props.viewProfileOnAvatarPressed, 
                    closeKeyboard = if v20() then v50.props.closeKeyboard else nil, 
                    inputBoxRef = if v20() then v50.props.inputBoxRef else nil, 
                    repliesTo = if v20() then v55.repliesTo else nil, 
                    visibility = if l_FFlagEnableAppChatMessageVisibility_0 then v55.visibility else nil, 
                    translatedText = v58
                });
            end;
        else
            return v3.createElement(v17, {
                Text = v50.props.invalidMessageTypeText
            });
        end;
    end;
    v50.updateWidth = function(v59) --[[ Line: 258 ]]
        -- upvalues: v50 (copy)
        if v59.AbsoluteSize.X ~= v50.state.width then
            v50:setState({
                width = v59.AbsoluteSize.X
            });
        end;
    end;
    v50.changeFocus = function(v60) --[[ Line: 265 ]]
        -- upvalues: v50 (copy)
        v50.isNearBottom = v60.anchorIndex <= v50.props.autoScrollMaxIndex + 1;
        v50.focusIndex = v50.isNearBottom and 1 or v60.anchorIndex + 1;
        if v60.anchorIndex == 1 and not v50.props.itemList[1].read then
            v50.props.markAsRead();
        end;
    end;
    v50.identifier = function(v61) --[[ Line: 277 ]]
        return v61.messageId .. "|" .. (v61.position or "");
    end;
    v50.getScrollRef = function() --[[ Line: 281 ]]
        -- upvalues: v50 (copy)
        if v50.ref.current == nil then
            return nil;
        else
            local v62 = v50.ref.current._listRef._scrollRef.getNativeScrollRef();
            if v62 == nil then
                return nil;
            else
                return v62._nativeRef.current;
            end;
        end;
    end;
    v50.calculateScrollOffset = function(v63) --[[ Line: 294 ]]
        local l_Y_0 = v63.CanvasPosition.Y;
        local l_Y_1 = v63.AbsoluteCanvasSize.Y;
        local l_Y_2 = v63.AbsoluteWindowSize.Y;
        return l_Y_1 - l_Y_0 - l_Y_2;
    end;
    v50.onScroll = function(v67) --[[ Line: 302 ]]
        -- upvalues: v9 (ref), v50 (copy), v10 (ref), v11 (ref)
        if v9 then
            if v50._scrollIntervalTracker == nil then
                local v68 = v50.getScrollRef();
                if v68 ~= nil then
                    v50._scrollIntervalTracker = v10(v11.Events.ScrollMessageList, v68, {
                        conversationId = v50.props.conversationId
                    });
                end;
            end;
            if v50._scrollIntervalTracker then
                v50._scrollIntervalTracker.onScrollTick();
            end;
        end;
        local v69 = v50.calculateScrollOffset(v67);
        if v69 < 512 then
            v50:setState(function(_, v71) --[[ Line: 321 ]]
                return {
                    firstItem = v71.itemList[1]
                };
            end);
        end;
        if v69 < 64 then
            v50.props.markAsRead();
        end;
        v50.isNearBottom = v69 < 64;
    end;
    v50.initialFetchesAttempted = 0;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v50.focusNavigationService = l_FocusNavigationService_0.new(l_CoreGui_0);
    end;
end;
v44.getDerivedStateFromProps = function(v72, v73) --[[ Line: 341 ]] --[[ Name: getDerivedStateFromProps ]]
    if v73.firstItem == nil then
        return {
            startIndex = 1
        };
    else
        local v74 = 1;
        while v74 <= #v72.itemList do
            local v75 = v72.itemList[v74];
            local l_firstItem_0 = v73.firstItem;
            if not (v75 ~= nil and not (l_firstItem_0 == nil) and (v75.stable_key ~= nil and v75.stable_key == l_firstItem_0.stable_key or v75.messageId ~= nil and v75.messageId == l_firstItem_0.messageId)) then
                v74 = v74 + 1;
            else
                break;
            end;
        end;
        if #v72.itemList < v74 then
            return {
                startIndex = 1
            };
        else
            return {
                startIndex = v74
            };
        end;
    end;
end;
v44.didUpdate = function(v77, v78, _) --[[ Line: 366 ]] --[[ Name: didUpdate ]]
    -- upvalues: v9 (copy), v11 (copy), v24 (copy), v23 (copy), v22 (copy), v25 (copy), v20 (copy), v15 (copy), v40 (copy)
    if v9 and #v77.props.itemList > #v78.itemList then
        v11.finish(v11.Events.PaginationMessageList, {
            conversationId = v77.props.conversationId
        });
    end;
    if v24 and v77.props.itemList and #v77.props.itemList == 0 and v78.itemList and #v78.itemList > 0 then
        v77.initialFetchesAttempted = 0;
    end;
    if v77.props.itemList and v77.props.itemList ~= v78.itemList and v77.initialFetchesAttempted < v23 and #v77.props.itemList < v22 and v77.props.loadNext then
        v77.initialFetchesAttempted = v77.initialFetchesAttempted + 1;
        v77.props.loadNext();
    end;
    if v78.conversationId ~= v77.props.conversationId then
        v77.isNearBottom = true;
    end;
    local v80 = v77.getScrollRef();
    if (if v80 ~= nil then v77.calculateScrollOffset(v80) else 0) < 64 then
        v77.isNearBottom = true;
        if #v77.props.itemList > 0 then
            v77.props.markAsRead();
        end;
    end;
    if v78.readingMessagesIsEnabled ~= v77.props.readingMessagesIsEnabled and v77.props.readingMessagesIsEnabled and v77.isNearBottom then
        v77.props.markAsRead();
    end;
    if v77.props.scrollToTopOnInitialOsaLoad and not v78.scrollToTopOnInitialOsaLoad and #v77.props.itemList > 0 then
        local v81 = v77.ref and v77.ref.current;
        if v81 and v81.scrollToEnd then
            task.delay(v25 / 1000, function() --[[ Line: 427 ]]
                -- upvalues: v81 (copy), v77 (copy)
                v81:scrollToIndex({
                    index = #v77.props.itemList, 
                    animated = false
                });
            end);
        end;
    end;
    if v20() and v77.props.itemList and not v77.lastIncomingChatMessageId then
        v77.lastIncomingChatMessageId = v15(v77.props.itemList, v40);
    end;
end;
v44.didMount = function(v82) --[[ Line: 438 ]] --[[ Name: didMount ]]
    -- upvalues: v22 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v31 (copy), v15 (copy), v43 (copy)
    if #v82.props.itemList < v22 and v82.props.loadNext then
        v82.props.loadNext();
    end;
    v82.isNearBottom = true;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        local v83 = v82.getScrollRef();
        if v83 ~= nil then
            v83.Selectable = false;
        end;
    end;
    if v31 and v15(v82.props.itemList, v43) then
        v82.logChatBubbleRevampExposure();
    end;
end;
v44.willUnmount = function(v84) --[[ Line: 454 ]] --[[ Name: willUnmount ]]
    -- upvalues: v9 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    if v9 and v84._scrollIntervalTracker then
        v84._scrollIntervalTracker.cleanup();
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v84.focusNavigationService:teardown();
    end;
end;
v44.renderScrollingFrame = function(v85) --[[ Line: 463 ]] --[[ Name: renderScrollingFrame ]]
    -- upvalues: v3 (copy), l_BidirectionalFlatList_0 (copy), v34 (copy), v35 (copy), v36 (copy), v9 (copy), v11 (copy), v5 (copy), v38 (copy), v37 (copy), v49 (copy)
    local v86 = false;
    local v87 = {};
    local l_startIndex_0 = v85.state.startIndex;
    if l_startIndex_0 ~= 1 then
        local v89 = v85.getScrollRef();
        if (if v89 ~= nil then v85.calculateScrollOffset(v89) else 0) < 128 then
            l_startIndex_0 = 1;
        end;
    end;
    if l_startIndex_0 ~= 1 then
        local v90 = v85.props.itemList[1];
        local l_firstItem_1 = v85.state.firstItem;
        if v90 == nil or l_firstItem_1 == nil or (v90.stable_key == nil or v90.stable_key ~= l_firstItem_1.stable_key) and (v90.messageId == nil or v90.messageId ~= l_firstItem_1.messageId) then
            table.move(v85.props.itemList, l_startIndex_0, #v85.props.itemList, 1, v87);
            v86 = true;
        end;
    end;
    if not v86 then
        v87 = v85.props.itemList;
    end;
    v86 = false;
    return v3.createElement(l_BidirectionalFlatList_0, {
        data = v87, 
        renderItem = function(v92) --[[ Line: 483 ]] --[[ Name: renderItem ]]
            -- upvalues: v85 (copy)
            return v85.renderItem(v92.item);
        end, 
        inverted = true, 
        Size = v85.props.Size, 
        style = {
            BackgroundTransparency = 1, 
            ScrollBarThickness = 0, 
            Name = "MessageList"
        }, 
        contentContainerStyle = {
            BackgroundTransparency = 1
        }, 
        keyExtractor = function(v93, v94) --[[ Line: 497 ]] --[[ Name: keyExtractor ]]
            return v93.stable_key or v93.messageId or v94;
        end, 
        windowSize = if v34() then v35 else 5, 
        initialNumToRender = if v85.props.scrollToTopOnInitialOsaLoad then #v87 else if v34() then v36 else 30, 
        onScroll = v85.onScroll, 
        onEndReached = function() --[[ Line: 511 ]] --[[ Name: onEndReached ]]
            -- upvalues: v9 (ref), v11 (ref), v85 (copy), v5 (ref)
            if v9 then
                v11.start(v11.Events.PaginationMessageList, {
                    conversationId = v85.props.conversationId
                });
            end;
            v85.props.loadNext();
            return v5.resolve();
        end, 
        onEndReachedThreshold = if v34() then v38 else 300, 
        onStartReachedThreshold = if v34() then v37 else 64, 
        compareItemData = v49, 
        scrollEventThrottle = v85.props.scrollEventThrottle or 75, 
        [v3.Ref] = v85.ref, 
        autoscrollToTopThreshold = 33, 
        enableAutoscrollToTop = true, 
        ListHeaderComponent = function() --[[ Line: 532 ]] --[[ Name: ListHeaderComponent ]]
            -- upvalues: v3 (ref)
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 10)
            });
        end, 
        showDefaultLoadingIndicators = false, 
        onContentSizeChange = function(v95, _) --[[ Line: 539 ]] --[[ Name: onContentSizeChange ]]
            -- upvalues: v85 (copy)
            v85:setState({
                width = v95
            });
        end, 
        optimizeInvertedCanvasResize = true, 
        UNSTABLE_forceSiblingLayoutUpdate = true
    });
end;
v44.renderEmptyMessageList = function(v97) --[[ Line: 549 ]] --[[ Name: renderEmptyMessageList ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Frame", {
        Size = v97.props.Size, 
        BackgroundTransparency = 1
    });
end;
v44.render = function(v98) --[[ Line: 556 ]] --[[ Name: render ]]
    if #v98.props.itemList ~= 0 then
        return (v98:renderScrollingFrame());
    else
        return (v98:renderEmptyMessageList());
    end;
end;
return v44;