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
local v29 = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5);
local l_FFlagEnablePartyQuickStartButton_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyQuickStartButton;
local l_FFlagAppIaScrollAway_0 = v13.FFlagAppIaScrollAway;
local v32 = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30);
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationListTimestampAndUnreadDotIxpEnabled);
local v34 = require(l_script_FirstAncestor_0.Flags.FStringAppChatConversationListTimestampAndUnreadDotIxpLayer);
local v35 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatPerfChatLandingPaginationEnabled);
local v36 = game:DefineFastInt("AppChatPerfChatLandingPaginationWindowSize", 2);
local v37 = game:DefineFastInt("AppChatPerfChatLandingPaginationInitialRender", 8);
local v38 = game:DefineFastInt("AppChatPerfChatLandingPaginationOnStartReachedUnits", 1);
local v39 = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 1);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local l_PartyPageCarouselExperimentation_0 = require(l_Parent_0.SocialExperiments).PartyPageCarouselExperimentation;
local v43 = require(script.Parent.Logger):new(script.Name);
local v44 = v11.PureComponent:extend("ConversationList");
v44.defaultProps = {
    focusIndex = 1, 
    focusLock = {}, 
    itemList = {}, 
    loadNext = nil, 
    loadPrevious = nil, 
    onActivated = nil, 
    navigateToQuickStartSquadInviteFriends = function() --[[ Line: 79 ]] --[[ Name: navigateToQuickStartSquadInviteFriends ]]

    end, 
    navigateToSquadLobby = function() --[[ Line: 80 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    isDebugEnabled = false, 
    Size = UDim2.fromScale(1, 1), 
    LayoutOrder = 1, 
    onScrollUpdate = function() --[[ Line: 84 ]] --[[ Name: onScrollUpdate ]]

    end, 
    entryHeight = 64, 
    shouldShowPhoneVerificationUpsell = false, 
    shouldShowUnfilteredAccessFtux = false, 
    shouldShowPartyUpsellFtux = false, 
    dismissUnfilteredThreadsFtux = function() --[[ Line: 89 ]] --[[ Name: dismissUnfilteredThreadsFtux ]]

    end, 
    canvasTopPadding = l_FFlagAppIaScrollAway_0 and 0 or nil, 
    fireConversationImpressionEvent = function() --[[ Line: 91 ]] --[[ Name: fireConversationImpressionEvent ]]

    end, 
    isPartyQuickStartEnabled = not l_FFlagIsSquadEnabledAMP_0 and nil, 
    fireConversationClickedEvent = v41 and function() --[[ Line: 93 ]]

    end or nil
};
v44.init = function(v45) --[[ Line: 96 ]] --[[ Name: init ]]
    -- upvalues: v44 (copy), v18 (copy), l_Signal_0 (copy), l_AppPage_0 (copy), l_Constants_0 (copy), l_PartyPageCarouselExperimentation_0 (copy), l_memoize_0 (copy), l_Enums_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_SquadQuickStartExperimentation_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v11 (copy), v24 (copy), v26 (copy), v27 (copy), v10 (copy), v15 (copy), l_FFlagAppIaScrollAway_0 (copy), v25 (copy), v41 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationService_0 (copy), l_CoreGui_0 (copy), l_AppChatPerfExperimentation_0 (copy), v33 (copy), l_IXPService_0 (copy), v34 (copy)
    v44.ENTRY_HEIGHT = v45.props.entryHeight;
    if v18 then
        v45.scrollIntervalTracker = nil;
    end;
    v45.scrollViewPositionChangedSignal = l_Signal_0.new();
    v45.unifiedLogging = {
        appPage = l_AppPage_0.Chat, 
        impressionTag = if v45.props.isInExperience then l_Constants_0.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else l_Constants_0.ANALYTICS.SRC.PARTY_PAGE_UA, 
        scrollViewPositionChangedSignal = v45.scrollViewPositionChangedSignal, 
        sortId = 0, 
        sortIndex = 1
    };
    v45.onScrollUpdate = function(v46) --[[ Line: 113 ]]
        -- upvalues: v18 (ref), v45 (copy)
        if v18 and v45.scrollIntervalTracker then
            v45.scrollIntervalTracker.onScrollTick();
        end;
        v45.currentAnchor = math.floor(v46.CanvasPosition.Y / 64);
        v45.scrollViewPositionChangedSignal:fire();
        v45.props.onScrollUpdate(v46);
    end;
    v45.focusLock = v45.props.focusLock;
    if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then
        v45.navigateToConversationFromSocialCarousel = function(v47) --[[ Line: 127 ]]
            -- upvalues: v45 (copy)
            v45.props.navigateToConversationFromUserId(v47.id);
        end;
    end;
    v45.identifier = function(v48) --[[ Line: 132 ]]
        if not v48 then
            return nil;
        else
            return v48.id .. tostring(v48.unixTime);
        end;
    end;
    local v49 = l_memoize_0(function() --[[ Line: 140 ]]
        -- upvalues: l_Enums_0 (ref), v45 (copy)
        return {
            {
                tileGroup = l_Enums_0.TileGroup.StartSquad, 
                onActivated = v45.props.navigateToQuickStartSquadInviteFriends
            }, 
            {
                tileGroup = l_Enums_0.TileGroup.FriendsList, 
                onActivated = v45.navigateToConversationFromSocialCarousel
            }
        };
    end);
    v45.isPartyQuickStartEnabled = function() --[[ Line: 153 ]]
        -- upvalues: l_FFlagIsSquadEnabledAMP_0 (ref), v45 (copy), l_SquadQuickStartExperimentation_0 (ref), l_FFlagEnablePartyQuickStartButton_0 (ref)
        if l_FFlagIsSquadEnabledAMP_0 then
            return v45.props.isPartyQuickStartEnabled;
        else
            return l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and l_FFlagEnablePartyQuickStartButton_0;
        end;
    end;
    v45.renderItem = function(v50, _) --[[ Line: 162 ]]
        -- upvalues: v11 (ref), v24 (ref), v26 (ref), v45 (copy), v27 (ref), l_PartyPageCarouselExperimentation_0 (ref), v10 (ref), v15 (ref), v49 (copy), l_Constants_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v25 (ref), v41 (ref)
        local l_item_0 = v50.item;
        if l_item_0.isChatLandingModal then
            return v11.createElement(v24, {});
        elseif l_item_0.isGroupLink then
            return v11.createElement(v26, {
                entryHeight = v45.ENTRY_HEIGHT
            });
        elseif v45.isPartyQuickStartEnabled() and l_item_0.isQuickStartLink then
            return v11.createElement(v27, {
                entryHeight = v45.ENTRY_HEIGHT
            });
        elseif l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() and l_item_0.isSocialCarousel then
            return v10.createElement(v15.Entry, {
                customTileList = v49(), 
                roduxKey = "ChatAppReducer", 
                hideCarouselHeader = true, 
                source = if v45.props.isInExperience then l_Constants_0.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else l_Constants_0.ANALYTICS.SRC.PARTY_PAGE_UA, 
                unifiedLogging = v45.unifiedLogging
            });
        elseif l_FFlagAppIaScrollAway_0 and l_item_0.isCanvasTopPadding then
            return v11.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_item_0.height), 
                BackgroundTransparency = 1
            });
        else
            return v11.createElement(v25, {
                boldTitle = false, 
                entryHeight = v45.ENTRY_HEIGHT, 
                conversation = l_item_0, 
                onActivated = v45.props.onActivated, 
                onSquadJoinButtonActivated = v45.props.navigateToSquadLobby, 
                key = "ConversationEntry" .. tostring(l_item_0.id), 
                fireImpressionEvent = v45.props.fireConversationImpressionEvent, 
                fireClickEvent = if v41 then v45.props.fireConversationClickedEvent else nil
            }, v45.props.isDebugEnabled and {
                debugCell = v11.createElement("StringValue", {
                    Value = tostring(l_item_0.id)
                })
            });
        end;
    end;
    v45.ref = v11.createRef();
    v45.viewRef = v11.createRef();
    v45.initialFetchesAttempted = 0;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v45.focusNavigationService = l_FocusNavigationService_0.new(l_CoreGui_0);
        v45.getScrollRef = function() --[[ Line: 218 ]]
            -- upvalues: v45 (copy)
            if v45.ref.current == nil then
                return nil;
            else
                local v53 = v45.ref.current._listRef._scrollRef.getNativeScrollRef();
                if v53 == nil then
                    return nil;
                else
                    return v53._nativeRef.current;
                end;
            end;
        end;
    end;
    l_AppChatPerfExperimentation_0.logExposure();
    l_PartyPageCarouselExperimentation_0.logExposure();
    if l_SquadQuickStartExperimentation_0.isLogExposureEnabled then
        l_SquadQuickStartExperimentation_0.logExposure();
    end;
    if v33 and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
        l_IXPService_0:LogFlagLinkedUserLayerExposure(v34);
    end;
end;
v44.didMount = function(v54) --[[ Line: 247 ]] --[[ Name: didMount ]]
    -- upvalues: v18 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v20 (copy), v19 (copy)
    if v18 and l_FFlagEnableAppChatFocusableFixes_0 and v54.getScrollRef then
        local v55 = v54.getScrollRef();
        if v55 ~= nil then
            v54.scrollIntervalTracker = v20(v19.Events.ScrollConversationList, v55);
        end;
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        local v56 = v54.getScrollRef();
        if v56 ~= nil then
            v56.Selectable = false;
        end;
    end;
end;
v44.willUnmount = function(v57) --[[ Line: 263 ]] --[[ Name: willUnmount ]]
    -- upvalues: v18 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    if v18 and v57.scrollIntervalTracker then
        v57.scrollIntervalTracker.cleanup();
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v57.focusNavigationService:teardown();
    end;
end;
v44.willUpdate = function(v58, v59, _) --[[ Line: 272 ]] --[[ Name: willUpdate ]]
    -- upvalues: v29 (copy), v32 (copy), v43 (copy), v44 (copy)
    if v59.filterText and v59.filterText ~= "" and v59.filterText ~= v58.props.filterText then
        v58.focusLock = v59.filterText;
    elseif v59.itemList[1] and v58.props.itemList[1] and v59.itemList[1].id ~= v58.props.itemList[1].id and v58.currentAnchor == 1 then
        v58.focusLock = {};
    end;
    if v59.itemList and v58.props.itemList ~= v59.itemList and v58.initialFetchesAttempted < v29 and #v59.itemList < v32 then
        v58.initialFetchesAttempted = v58.initialFetchesAttempted + 1;
        v43:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #v59.itemList, v32, v58.initialFetchesAttempted, v29);
        v58.props.loadNext();
    end;
    if v59.entryHeight ~= v58.props.entryHeight then
        v44.ENTRY_HEIGHT = v59.entryHeight;
    end;
end;
v44.render = function(v61) --[[ Line: 307 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_PartyPageCarouselExperimentation_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v11 (copy), l_BidirectionalFlatList_0 (copy), v35 (copy), v36 (copy), v37 (copy), v43 (copy), v12 (copy), v39 (copy), v38 (copy), l_withStyle_0 (copy)
    local l_itemList_0 = v61.props.itemList;
    local v63 = true;
    if v61.props.filterText ~= "" then
        v63 = v61.props.filterText == nil;
    end;
    local l_showGroupsLink_0 = v61.props.showGroupsLink;
    if v63 and l_showGroupsLink_0 then
        l_itemList_0 = v7.List.join({
            {
                id = "ConversationGroupsEntryContainer", 
                isGroupLink = true
            }
        }, l_itemList_0);
    end;
    if not l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() and v61.isPartyQuickStartEnabled() then
        l_itemList_0 = v7.List.join({
            {
                id = "PartyQuickStartContainer", 
                isQuickStartLink = true
            }
        }, l_itemList_0);
    end;
    if v63 then
        if v61.isPartyQuickStartEnabled() and l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() and (v61.props.isWideMode or not v61.props.isInExperience) then
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
    if l_FFlagAppIaScrollAway_0 and v61.props.canvasTopPadding > 0 then
        l_itemList_0 = v7.List.join({
            {
                id = "CanvasTopPadding", 
                isCanvasTopPadding = true, 
                height = v61.props.canvasTopPadding
            }
        }, l_itemList_0);
    end;
    local v69 = l_FFlagAppIaScrollAway_0 and function(_, v66) --[[ Line: 365 ]]
        -- upvalues: v61 (copy)
        local v67 = nil;
        local v68 = nil;
        if v61.props.canvasTopPadding > 0 then
            if v66 == 1 then
                v67 = v61.props.canvasTopPadding;
                v68 = 0;
            else
                v67 = v61.ENTRY_HEIGHT;
                v68 = v61.props.canvasTopPadding + v61.ENTRY_HEIGHT * (v66 - 2);
            end;
        else
            v67 = v61.ENTRY_HEIGHT;
            v68 = v61.ENTRY_HEIGHT * (v66 - 1);
        end;
        return {
            length = v67, 
            offset = v68, 
            index = v66
        };
    end or nil;
    local function v78(v70) --[[ Line: 389 ]] --[[ Name: renderScroller ]]
        -- upvalues: v11 (ref), v61 (copy), l_BidirectionalFlatList_0 (ref), l_itemList_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v69 (copy), v35 (ref), v36 (ref), v37 (ref), v43 (ref), v12 (ref), v39 (ref), v38 (ref)
        return v11.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v61.props.Size, 
            [v11.Ref] = v61.viewRef
        }, {
            scroller = v11.createElement(l_BidirectionalFlatList_0, {
                data = l_itemList_0, 
                renderItem = v61.renderItem, 
                getItemLayout = if l_FFlagAppIaScrollAway_0 then v69 else function(_, v72) --[[ Line: 400 ]]
                    -- upvalues: v61 (ref)
                    return {
                        length = v61.ENTRY_HEIGHT, 
                        offset = v61.ENTRY_HEIGHT * (v72 - 1), 
                        index = v72
                    };
                end, 
                style = {
                    BackgroundColor3 = v70.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v70.Tokens.Global.Color.None.Transparency, 
                    ScrollBarThickness = 0, 
                    BorderSizePixel = 0
                }, 
                contentContainerStyle = {
                    BackgroundColor3 = v70.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v70.Tokens.Global.Color.None.Transparency, 
                    BorderSizePixel = 0
                }, 
                windowSize = if v35() then v36 else 2, 
                initialNumToRender = if v35() then v37 else 15, 
                onScroll = v61.onScrollUpdate, 
                onContentSizeChange = function(_, v74) --[[ Line: 426 ]] --[[ Name: onContentSizeChange ]]
                    -- upvalues: v61 (ref), v43 (ref)
                    local l_current_0 = v61.viewRef.current;
                    if l_current_0 then
                        v43:debug("onContentSizeChange - Window height: {} vs Content height: {}", l_current_0.AbsoluteSize.Y, v74);
                        if v74 <= l_current_0.AbsoluteSize.Y then
                            v43:info("Not enough content to fill the view, loading more conversations");
                            v61.props.loadNext();
                        end;
                    end;
                end, 
                onEndReached = function() --[[ Line: 440 ]] --[[ Name: onEndReached ]]
                    -- upvalues: v43 (ref), v61 (ref), v12 (ref)
                    v43:debug("onEndReached - Loading more conversations");
                    v61.props.loadNext();
                    return v12.resolve();
                end, 
                onStartReached = function() --[[ Line: 445 ]] --[[ Name: onStartReached ]]
                    -- upvalues: v43 (ref), v61 (ref), v12 (ref)
                    v43:debug("onStartReached - Loading previous conversations");
                    if v61.props.loadPrevious then
                        v61.props.loadPrevious();
                    end;
                    return v12.resolve();
                end, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                CanvasSize = UDim2.fromScale(0, 0), 
                onEndReachedThreshold = v61.ENTRY_HEIGHT * if v35() then v39 else 4, 
                onStartReachedThreshold = v61.ENTRY_HEIGHT * if v35() then v38 else 4, 
                compareItemData = function(v76, v77) --[[ Line: 460 ]] --[[ Name: compareItemData ]]
                    return v76.id == v77.id;
                end, 
                [v11.Ref] = v61.ref, 
                autoscrollToTopThreshold = 33, 
                enableAutoscrollToTop = true
            })
        });
    end;
    return l_withStyle_0(function(v79) --[[ Line: 470 ]]
        -- upvalues: l_itemList_0 (ref), v11 (ref), v61 (copy), v78 (copy)
        if #l_itemList_0 == 0 then
            return v11.createElement("Frame", {
                Size = v61.props.Size, 
                BackgroundColor3 = v79.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v79.Tokens.Global.Color.None.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = v61.props.LayoutOrder
            });
        else
            return v78(v79);
        end;
    end);
end;
return v44;