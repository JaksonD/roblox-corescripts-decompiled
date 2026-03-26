local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppChatPerfExperimentation_0 = require(l_Parent_0.SocialExperiments).AppChatPerfExperimentation;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_BidirectionalFlatList_0 = require(l_Parent_0.VirtualizedList).BidirectionalFlatList;
local l_CoreGui_0 = require(l_Parent_0.ReactFocusNavigation).EngineInterface.CoreGui;
local v7 = require(l_Parent_0.Cryo);
local l_FocusNavigationService_0 = require(l_Parent_0.ReactFocusNavigation).FocusNavigationService;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.Roact);
local v12 = require(l_Parent_0.Promise);
local v13 = require(l_Parent_0.SharedFlags);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v15 = require(l_Parent_0.SocialCarousel);
local v16 = require(l_Parent_0.SocialExperiments);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v19 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local v20 = require(l_script_FirstAncestor_0.Telemetry.createScrollIntervalTracker);
local l_Constants_0 = v15.Constants;
local l_Enums_0 = v15.Enums;
local l_SquadQuickStartExperimentation_0 = v16.SquadQuickStartExperimentation;
local v24 = require(script.Parent.ChatLandingModal.ChatLandingModalContainer);
local v25 = require(script.Parent.ConversationEntry);
local v26 = require(script.Parent.ConversationGroupsEntryContainer);
local v27 = require(script.Parent.PartyQuickStartContainer);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v29 = game:DefineFastFlag("AppChatPerformanceExposureEnabled", false);
local v30 = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5);
local l_FFlagEnablePartyQuickStartButton_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyQuickStartButton;
local l_FFlagAppIaScrollAway_0 = v13.FFlagAppIaScrollAway;
local v33 = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30);
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationBadgingLogging);
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationListTimestampAndUnreadDotIxpEnabled);
local v36 = require(l_script_FirstAncestor_0.Flags.FStringAppChatConversationListTimestampAndUnreadDotIxpLayer);
local v37 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatPerfChatLandingPaginationEnabled);
local v38 = game:DefineFastInt("AppChatPerfChatLandingPaginationWindowSize", 2);
local v39 = game:DefineFastInt("AppChatPerfChatLandingPaginationInitialRender", 8);
local v40 = game:DefineFastInt("AppChatPerfChatLandingPaginationOnStartReachedUnits", 1);
local v41 = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 1);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local v43 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local l_PartyPageCarouselExperimentation_0 = require(l_Parent_0.SocialExperiments).PartyPageCarouselExperimentation;
local v45 = require(script.Parent.Logger):new(script.Name);
local v46 = v11.PureComponent:extend("ConversationList");
v46.defaultProps = {
    focusIndex = 1, 
    focusLock = {}, 
    itemList = {}, 
    loadNext = nil, 
    loadPrevious = nil, 
    onActivated = nil, 
    navigateToQuickStartSquadInviteFriends = function() --[[ Line: 81 ]] --[[ Name: navigateToQuickStartSquadInviteFriends ]]

    end, 
    navigateToSquadLobby = function() --[[ Line: 82 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    isDebugEnabled = false, 
    Size = UDim2.fromScale(1, 1), 
    LayoutOrder = 1, 
    onScrollUpdate = function() --[[ Line: 86 ]] --[[ Name: onScrollUpdate ]]

    end, 
    entryHeight = 64, 
    shouldShowPhoneVerificationUpsell = false, 
    shouldShowUnfilteredAccessFtux = false, 
    shouldShowPartyUpsellFtux = false, 
    dismissUnfilteredThreadsFtux = function() --[[ Line: 91 ]] --[[ Name: dismissUnfilteredThreadsFtux ]]

    end, 
    canvasTopPadding = l_FFlagAppIaScrollAway_0 and 0 or nil, 
    fireConversationImpressionEvent = v34 and function() --[[ Line: 93 ]]

    end or nil, 
    isPartyQuickStartEnabled = not l_FFlagIsSquadEnabledAMP_0 and nil, 
    fireConversationClickedEvent = v43 and function() --[[ Line: 95 ]]

    end or nil
};
v46.init = function(v47) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v46 (copy), v18 (copy), l_Signal_0 (copy), l_AppPage_0 (copy), l_Constants_0 (copy), l_PartyPageCarouselExperimentation_0 (copy), l_memoize_0 (copy), l_Enums_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_SquadQuickStartExperimentation_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v11 (copy), v24 (copy), v26 (copy), v27 (copy), v10 (copy), v15 (copy), l_FFlagAppIaScrollAway_0 (copy), v25 (copy), v34 (copy), v43 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationService_0 (copy), l_CoreGui_0 (copy), l_AppChatPerfExperimentation_0 (copy), v29 (copy), l_IXPService_0 (copy), v35 (copy), v36 (copy)
    v46.ENTRY_HEIGHT = v47.props.entryHeight;
    if v18 then
        v47.scrollIntervalTracker = nil;
    end;
    v47.scrollViewPositionChangedSignal = l_Signal_0.new();
    v47.unifiedLogging = {
        appPage = l_AppPage_0.Chat, 
        impressionTag = if v47.props.isInExperience then l_Constants_0.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else l_Constants_0.ANALYTICS.SRC.PARTY_PAGE_UA, 
        scrollViewPositionChangedSignal = v47.scrollViewPositionChangedSignal, 
        sortId = 0, 
        sortIndex = 1
    };
    v47.onScrollUpdate = function(v48) --[[ Line: 115 ]]
        -- upvalues: v18 (ref), v47 (copy)
        if v18 and v47.scrollIntervalTracker then
            v47.scrollIntervalTracker.onScrollTick();
        end;
        v47.currentAnchor = math.floor(v48.CanvasPosition.Y / 64);
        v47.scrollViewPositionChangedSignal:fire();
        v47.props.onScrollUpdate(v48);
    end;
    v47.focusLock = v47.props.focusLock;
    if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then
        v47.navigateToConversationFromSocialCarousel = function(v49) --[[ Line: 129 ]]
            -- upvalues: v47 (copy)
            v47.props.navigateToConversationFromUserId(v49.id);
        end;
    end;
    v47.identifier = function(v50) --[[ Line: 134 ]]
        if not v50 then
            return nil;
        else
            return v50.id .. tostring(v50.unixTime);
        end;
    end;
    local v51 = l_memoize_0(function() --[[ Line: 142 ]]
        -- upvalues: l_Enums_0 (ref), v47 (copy)
        return {
            {
                tileGroup = l_Enums_0.TileGroup.StartSquad, 
                onActivated = v47.props.navigateToQuickStartSquadInviteFriends
            }, 
            {
                tileGroup = l_Enums_0.TileGroup.FriendsList, 
                onActivated = v47.navigateToConversationFromSocialCarousel
            }
        };
    end);
    v47.isPartyQuickStartEnabled = function() --[[ Line: 155 ]]
        -- upvalues: l_FFlagIsSquadEnabledAMP_0 (ref), v47 (copy), l_SquadQuickStartExperimentation_0 (ref), l_FFlagEnablePartyQuickStartButton_0 (ref)
        if l_FFlagIsSquadEnabledAMP_0 then
            return v47.props.isPartyQuickStartEnabled;
        else
            return l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and l_FFlagEnablePartyQuickStartButton_0;
        end;
    end;
    v47.renderItem = function(v52, _) --[[ Line: 164 ]]
        -- upvalues: v11 (ref), v24 (ref), v26 (ref), v47 (copy), v27 (ref), l_PartyPageCarouselExperimentation_0 (ref), v10 (ref), v15 (ref), v51 (copy), l_Constants_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v25 (ref), v34 (ref), v43 (ref)
        local l_item_0 = v52.item;
        if l_item_0.isChatLandingModal then
            return v11.createElement(v24, {});
        elseif l_item_0.isGroupLink then
            return v11.createElement(v26, {
                entryHeight = v47.ENTRY_HEIGHT
            });
        elseif v47.isPartyQuickStartEnabled() and l_item_0.isQuickStartLink then
            return v11.createElement(v27, {
                entryHeight = v47.ENTRY_HEIGHT
            });
        elseif l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() and l_item_0.isSocialCarousel then
            return v10.createElement(v15.Entry, {
                customTileList = v51(), 
                roduxKey = "ChatAppReducer", 
                hideCarouselHeader = true, 
                source = if v47.props.isInExperience then l_Constants_0.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else l_Constants_0.ANALYTICS.SRC.PARTY_PAGE_UA, 
                unifiedLogging = v47.unifiedLogging
            });
        elseif l_FFlagAppIaScrollAway_0 and l_item_0.isCanvasTopPadding then
            return v11.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_item_0.height), 
                BackgroundTransparency = 1
            });
        else
            return v11.createElement(v25, {
                boldTitle = false, 
                entryHeight = v47.ENTRY_HEIGHT, 
                conversation = l_item_0, 
                onActivated = v47.props.onActivated, 
                onSquadJoinButtonActivated = v47.props.navigateToSquadLobby, 
                key = "ConversationEntry" .. tostring(l_item_0.id), 
                fireImpressionEvent = if v34 then v47.props.fireConversationImpressionEvent else nil, 
                fireClickEvent = if v43 then v47.props.fireConversationClickedEvent else nil
            }, v47.props.isDebugEnabled and {
                debugCell = v11.createElement("StringValue", {
                    Value = tostring(l_item_0.id)
                })
            });
        end;
    end;
    v47.ref = v11.createRef();
    v47.viewRef = v11.createRef();
    v47.initialFetchesAttempted = 0;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v47.focusNavigationService = l_FocusNavigationService_0.new(l_CoreGui_0);
        v47.getScrollRef = function() --[[ Line: 222 ]]
            -- upvalues: v47 (copy)
            if v47.ref.current == nil then
                return nil;
            else
                local v55 = v47.ref.current._listRef._scrollRef.getNativeScrollRef();
                if v55 == nil then
                    return nil;
                else
                    return v55._nativeRef.current;
                end;
            end;
        end;
    end;
    l_AppChatPerfExperimentation_0.logExposure();
    l_PartyPageCarouselExperimentation_0.logExposure();
    if l_SquadQuickStartExperimentation_0.isLogExposureEnabled then
        l_SquadQuickStartExperimentation_0.logExposure();
    end;
    if v29 and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
        l_IXPService_0:LogFlagLinkedUserLayerExposure("Party.Chat.Performance");
    end;
    if v35 and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
        l_IXPService_0:LogFlagLinkedUserLayerExposure(v36);
    end;
end;
v46.didMount = function(v56) --[[ Line: 255 ]] --[[ Name: didMount ]]
    -- upvalues: v18 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v20 (copy), v19 (copy)
    if v18 and l_FFlagEnableAppChatFocusableFixes_0 and v56.getScrollRef then
        local v57 = v56.getScrollRef();
        if v57 ~= nil then
            v56.scrollIntervalTracker = v20(v19.Events.ScrollConversationList, v57);
        end;
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        local v58 = v56.getScrollRef();
        if v58 ~= nil then
            v58.Selectable = false;
        end;
    end;
end;
v46.willUnmount = function(v59) --[[ Line: 271 ]] --[[ Name: willUnmount ]]
    -- upvalues: v18 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    if v18 and v59.scrollIntervalTracker then
        v59.scrollIntervalTracker.cleanup();
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v59.focusNavigationService:teardown();
    end;
end;
v46.willUpdate = function(v60, v61, _) --[[ Line: 280 ]] --[[ Name: willUpdate ]]
    -- upvalues: v30 (copy), v33 (copy), v45 (copy), v46 (copy)
    if v61.filterText and v61.filterText ~= "" and v61.filterText ~= v60.props.filterText then
        v60.focusLock = v61.filterText;
    elseif v61.itemList[1] and v60.props.itemList[1] and v61.itemList[1].id ~= v60.props.itemList[1].id and v60.currentAnchor == 1 then
        v60.focusLock = {};
    end;
    if v61.itemList and v60.props.itemList ~= v61.itemList and v60.initialFetchesAttempted < v30 and #v61.itemList < v33 then
        v60.initialFetchesAttempted = v60.initialFetchesAttempted + 1;
        v45:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #v61.itemList, v33, v60.initialFetchesAttempted, v30);
        v60.props.loadNext();
    end;
    if v61.entryHeight ~= v60.props.entryHeight then
        v46.ENTRY_HEIGHT = v61.entryHeight;
    end;
end;
v46.render = function(v63) --[[ Line: 315 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_PartyPageCarouselExperimentation_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v11 (copy), l_BidirectionalFlatList_0 (copy), v37 (copy), v38 (copy), v39 (copy), v45 (copy), v12 (copy), v41 (copy), v40 (copy), l_withStyle_0 (copy)
    local l_itemList_0 = v63.props.itemList;
    local v65 = true;
    if v63.props.filterText ~= "" then
        v65 = v63.props.filterText == nil;
    end;
    local l_showGroupsLink_0 = v63.props.showGroupsLink;
    if v65 and l_showGroupsLink_0 then
        l_itemList_0 = v7.List.join({
            {
                id = "ConversationGroupsEntryContainer", 
                isGroupLink = true
            }
        }, l_itemList_0);
    end;
    if not l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() and v63.isPartyQuickStartEnabled() then
        l_itemList_0 = v7.List.join({
            {
                id = "PartyQuickStartContainer", 
                isQuickStartLink = true
            }
        }, l_itemList_0);
    end;
    if v65 then
        if v63.isPartyQuickStartEnabled() and l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() and (v63.props.isWideMode or not v63.props.isInExperience) then
            l_itemList_0 = v7.List.join({
                {
                    id = "SocialCarousel", 
                    isSocialCarousel = true
                }
            }, l_itemList_0);
        end;
        l_itemList_0 = v7.List.join({
            {
                id = "UnfilteredThreadsFtux", 
                isChatLandingModal = true
            }
        }, l_itemList_0);
    end;
    if l_FFlagAppIaScrollAway_0 and v63.props.canvasTopPadding > 0 then
        l_itemList_0 = v7.List.join({
            {
                id = "CanvasTopPadding", 
                isCanvasTopPadding = true, 
                height = v63.props.canvasTopPadding
            }
        }, l_itemList_0);
    end;
    local v71 = l_FFlagAppIaScrollAway_0 and function(_, v68) --[[ Line: 373 ]]
        -- upvalues: v63 (copy)
        local v69 = nil;
        local v70 = nil;
        if v63.props.canvasTopPadding > 0 then
            if v68 == 1 then
                v69 = v63.props.canvasTopPadding;
                v70 = 0;
            else
                v69 = v63.ENTRY_HEIGHT;
                v70 = v63.props.canvasTopPadding + v63.ENTRY_HEIGHT * (v68 - 2);
            end;
        else
            v69 = v63.ENTRY_HEIGHT;
            v70 = v63.ENTRY_HEIGHT * (v68 - 1);
        end;
        return {
            length = v69, 
            offset = v70, 
            index = v68
        };
    end or nil;
    local function v80(v72) --[[ Line: 397 ]] --[[ Name: renderScroller ]]
        -- upvalues: v11 (ref), v63 (copy), l_BidirectionalFlatList_0 (ref), l_itemList_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v71 (copy), v37 (ref), v38 (ref), v39 (ref), v45 (ref), v12 (ref), v41 (ref), v40 (ref)
        return v11.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v63.props.Size, 
            [v11.Ref] = v63.viewRef
        }, {
            scroller = v11.createElement(l_BidirectionalFlatList_0, {
                data = l_itemList_0, 
                renderItem = v63.renderItem, 
                getItemLayout = if l_FFlagAppIaScrollAway_0 then v71 else function(_, v74) --[[ Line: 408 ]]
                    -- upvalues: v63 (ref)
                    return {
                        length = v63.ENTRY_HEIGHT, 
                        offset = v63.ENTRY_HEIGHT * (v74 - 1), 
                        index = v74
                    };
                end, 
                style = {
                    BackgroundColor3 = v72.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v72.Tokens.Global.Color.None.Transparency, 
                    ScrollBarThickness = 0, 
                    BorderSizePixel = 0
                }, 
                contentContainerStyle = {
                    BackgroundColor3 = v72.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v72.Tokens.Global.Color.None.Transparency, 
                    BorderSizePixel = 0
                }, 
                windowSize = if v37() then v38 else 2, 
                initialNumToRender = if v37() then v39 else 15, 
                onScroll = v63.onScrollUpdate, 
                onContentSizeChange = function(_, v76) --[[ Line: 434 ]] --[[ Name: onContentSizeChange ]]
                    -- upvalues: v63 (ref), v45 (ref)
                    local l_current_0 = v63.viewRef.current;
                    if l_current_0 then
                        v45:debug("onContentSizeChange - Window height: {} vs Content height: {}", l_current_0.AbsoluteSize.Y, v76);
                        if v76 <= l_current_0.AbsoluteSize.Y then
                            v45:info("Not enough content to fill the view, loading more conversations");
                            v63.props.loadNext();
                        end;
                    end;
                end, 
                onEndReached = function() --[[ Line: 448 ]] --[[ Name: onEndReached ]]
                    -- upvalues: v45 (ref), v63 (ref), v12 (ref)
                    v45:debug("onEndReached - Loading more conversations");
                    v63.props.loadNext();
                    return v12.resolve();
                end, 
                onStartReached = function() --[[ Line: 453 ]] --[[ Name: onStartReached ]]
                    -- upvalues: v45 (ref), v63 (ref), v12 (ref)
                    v45:debug("onStartReached - Loading previous conversations");
                    if v63.props.loadPrevious then
                        v63.props.loadPrevious();
                    end;
                    return v12.resolve();
                end, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                CanvasSize = UDim2.fromScale(0, 0), 
                onEndReachedThreshold = v63.ENTRY_HEIGHT * if v37() then v41 else 4, 
                onStartReachedThreshold = v63.ENTRY_HEIGHT * if v37() then v40 else 4, 
                compareItemData = function(v78, v79) --[[ Line: 468 ]] --[[ Name: compareItemData ]]
                    return v78.id == v79.id;
                end, 
                [v11.Ref] = v63.ref, 
                autoscrollToTopThreshold = 33, 
                enableAutoscrollToTop = true
            })
        });
    end;
    return l_withStyle_0(function(v81) --[[ Line: 478 ]]
        -- upvalues: l_itemList_0 (ref), v11 (ref), v63 (copy), v80 (copy)
        if #l_itemList_0 == 0 then
            return v11.createElement("Frame", {
                Size = v63.props.Size, 
                BackgroundColor3 = v81.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v81.Tokens.Global.Color.None.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = v63.props.LayoutOrder
            });
        else
            return v80(v81);
        end;
    end);
end;
return v46;