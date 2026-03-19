local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_CorePackages_0.Packages.React);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v10 = require(l_Modules_0.LuaApp.Promise);
local v11 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local v12 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local v13 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v13.Style.withStyle;
local l_RetrievalStatus_0 = v13.App.Loading.Enum.RetrievalStatus;
local l_LoadingStateContainer_0 = v13.App.Container.LoadingStateContainer;
local l_EmptyState_0 = v13.App.Indicator.EmptyState;
local l_LoadingStatePage_0 = v13.App.Container.LoadingStatePage;
local l_RetrievalStatus_1 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local v22 = require(l_Modules_0.LuaApp.Constants);
local v23 = require(l_Modules_0.LuaApp.Util.debounce);
local v24 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v25 = require(script.Parent.PlayerGridWithUserSearchHydrationLayerWrapper);
local v26 = require(script.Parent.EmptyPlayerSearchPage);
local v27 = require(l_Modules_0.LuaApp.Components.UserSearch.api);
local l_EventNames_0 = v27.Analytics.EventNames;
local l_Analytics_0 = v27.Analytics.Analytics;
local l_fireImpressionEvent_0 = v27.Analytics.fireImpressionEvent;
local v31 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local l_Timers_0 = v31.Analytics.Timing.Timers;
local l_reportPromiseLoadingTimeWrapper_0 = v31.Analytics.Timing.reportPromiseLoadingTimeWrapper;
local l_PaginationMethod_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Enum.PaginationMethod;
local l_SearchTextBanner_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.SearchTextBanner;
local l_useLastInputMode_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMode;
local l_useAnimateScrollViewToSelection_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).useAnimateScrollViewToSelection;
local l_FFlagAppIaScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway;
local l_FFlagPlayerSearchEnableOnlineFrequents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents;
local l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields;
local function _(v44) --[[ Line: 67 ]]
    -- upvalues: v22 (copy)
    return utf8.len(v44) >= v22.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN;
end;
local v46 = v5.PureComponent:extend("PlayerSearchPage");
v46.validateProps = v3.strictInterface({
    searchUuid = v3.optional(v3.string), 
    omniSearchUuid = v3.optional(v3.string), 
    backgroundTransparency = v3.optional(v3.number), 
    searchParameters = v3.table, 
    onScrollDirectionChanged = v3.optional(v3.callback), 
    shouldShowUserSearchLandingPage = v3.optional(v3.boolean), 
    isRoutedFromAutoSearch = v3.optional(v3.boolean), 
    enableNewEmptySearchUI = v3.optional(v3.boolean), 
    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v3.optional(v3.number) else nil, 
    hotlineSearchText = v3.optional(v3.string), 
    screenSize = v3.Vector2, 
    usersSearchResult = v3.optional(v3.table), 
    searchWordLengthNotSupported = v3.boolean, 
    playerSearchStatus = v3.string, 
    autoTabSearchStatus = v3.optional(v3.string), 
    wideMode = v3.optional(v3.boolean), 
    fetchPlayerSearch = v3.callback, 
    removeUserSearchResults = v3.callback, 
    removeTextSearchResults = v3.callback, 
    networking = v3.callback, 
    eventIngest = v3.optional(v3.table), 
    enablePresenceIndicator = v3.optional(v3.boolean), 
    enableOnlineFrequents = v3.optional(v3.boolean), 
    appPage = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v3.optional(v3.string) else nil
});
v46.init = function(v47) --[[ Line: 108 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), l_HttpService_0 (copy), l_Analytics_0 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (copy), l_Signal_0 (copy), l_fireImpressionEvent_0 (copy), l_EventNames_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), v10 (copy), l_Timers_0 (copy), l_RetrievalStatus_0 (copy), l_RetrievalStatus_1 (copy), v22 (copy)
    local l_screenSize_0 = v47.props.screenSize;
    local v49 = v12.getPageSideMargin(l_screenSize_0.X);
    v47.userSearchUuid = v47.props.searchUuid or l_HttpService_0:GenerateGUID(false);
    v47.Analytics = l_Analytics_0({
        infoForAllEvents = {
            globalSessionId = v47.props.omniSearchUuid, 
            userSearchSessionId = v47.userSearchUuid, 
            pageContext = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v47.props.appPage else nil
        }
    });
    v47.state = {
        loaded = false, 
        impressionsToSend = nil, 
        contentSize = Vector2.new(l_screenSize_0.X - 2 * v49, l_screenSize_0.Y), 
        itemsPerRow = 1
    };
    v47.onRequestImpressionsSignal = l_Signal_0.new();
    v47.onImpressionsDetected = function(v50) --[[ Line: 130 ]]
        -- upvalues: v47 (copy)
        if not v50 or #v50 == 0 then
            return;
        else
            v47:setState({
                impressionsToSend = v50
            });
            return;
        end;
    end;
    v47.onItemsPerRowChanged = function(v51) --[[ Line: 140 ]]
        -- upvalues: v47 (copy)
        v47:setState({
            itemsPerRow = v51
        });
    end;
    v47.sendPlayerTileImpressions = function(v52) --[[ Line: 146 ]]
        -- upvalues: l_fireImpressionEvent_0 (ref), v47 (copy)
        l_fireImpressionEvent_0({
            impressions = v52, 
            entries = v47.props.usersSearchResult and v47.props.usersSearchResult.entries or nil, 
            itemsPerRow = v47.state.itemsPerRow, 
            startRowNumber = 1
        }, v47.Analytics.fireAnalyticsEvent);
    end;
    v47.onAbsoluteContentSizeChanged = function(v53) --[[ Line: 155 ]]
        -- upvalues: v47 (copy)
        if v47.isMounted and v53 then
            local l_AbsoluteContentSize_0 = v53.AbsoluteContentSize;
            if v47.state.contentSize == l_AbsoluteContentSize_0 then
                return;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v47:setState({
                    contentSize = l_AbsoluteContentSize_0
                });
            end;
        end;
    end;
    v47.fireSearchPageLoadEvents = function(_, v56, v57) --[[ Line: 170 ]]
        -- upvalues: v47 (copy), l_EventNames_0 (ref)
        local v58 = v56.nextPage or false;
        local l_fireAnalyticsEvent_0 = v47.Analytics.fireAnalyticsEvent;
        l_fireAnalyticsEvent_0(l_EventNames_0.UserSearchLoadingTime, {
            status = v56.status, 
            loadingTime = v57, 
            nextPage = v58
        });
        l_fireAnalyticsEvent_0(l_EventNames_0.UserSearchLoaded, {
            status = v56.status, 
            nextPage = v58
        });
    end;
    v47.fetchPlayerSearch = function(v60, v61) --[[ Line: 184 ]]
        -- upvalues: l_reportPromiseLoadingTimeWrapper_0 (ref), v47 (copy), v10 (ref)
        return l_reportPromiseLoadingTimeWrapper_0(v47.props.fetchPlayerSearch, function(_) --[[ Line: 187 ]]
            -- upvalues: v61 (copy)
            return {
                fetch = "userSearch", 
                nextPage = v61.nextPage
            };
        end, {
            fireEvent = v47.fireSearchPageLoadEvents
        })(v60, v61):catch(function() --[[ Line: 193 ]]
            -- upvalues: v10 (ref)
            return v10.resolve();
        end);
    end;
    v47.loadingTimers = l_Timers_0();
    v47.reportLoadingTimeForPromise = function(v63, v64) --[[ Line: 200 ]]
        -- upvalues: v47 (copy), l_EventNames_0 (ref), l_RetrievalStatus_0 (ref)
        local v65 = v47.loadingTimers.start();
        local function v68(v66) --[[ Line: 203 ]]
            -- upvalues: v47 (ref), v65 (copy), l_EventNames_0 (ref), v64 (copy)
            local v67 = v47.loadingTimers.stop(v65);
            v47.Analytics.fireAnalyticsEvent(l_EventNames_0.UserSearchLoadingTime, {
                status = v66, 
                loadingTime = v67, 
                nextPage = if v64 then v64.nextPage else false
            });
        end;
        return v63():andThen(function() --[[ Line: 215 ]]
            -- upvalues: v68 (copy), l_RetrievalStatus_0 (ref)
            v68(l_RetrievalStatus_0.Done.rawValue());
        end):catch(function() --[[ Line: 218 ]]
            -- upvalues: v68 (copy), l_RetrievalStatus_0 (ref)
            v68(l_RetrievalStatus_0.Failed.rawValue());
        end);
    end;
    v47.onLoadMore = function() --[[ Line: 223 ]]
        -- upvalues: v47 (copy)
        local l_networking_0 = v47.props.networking;
        local l_searchKeyword_0 = v47.props.searchParameters.searchKeyword;
        return v47.fetchPlayerSearch(l_networking_0, {
            keyword = l_searchKeyword_0, 
            searchUuid = v47.userSearchUuid, 
            omniSearchUuid = v47.props.omniSearchUuid, 
            nextPage = true
        });
    end;
    v47.dispatchInitialSearch = function() --[[ Line: 236 ]]
        -- upvalues: v47 (copy), l_RetrievalStatus_1 (ref), v10 (ref), v22 (ref)
        if v47.props.isRoutedFromAutoSearch then
            if v47.props.autoTabSearchStatus == l_RetrievalStatus_1.Done and v47.state.loaded == false then
                v47:setState({
                    loaded = true
                });
            end;
            return v10.resolve();
        else
            local l_networking_1 = v47.props.networking;
            local l_searchKeyword_1 = v47.props.searchParameters.searchKeyword;
            if l_searchKeyword_1 and utf8.len(l_searchKeyword_1) >= v22.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN then
                return v47.fetchPlayerSearch(l_networking_1, {
                    keyword = l_searchKeyword_1, 
                    searchUuid = v47.userSearchUuid, 
                    omniSearchUuid = v47.props.omniSearchUuid, 
                    nextPage = false
                });
            else
                return nil;
            end;
        end;
    end;
end;
v46.didMount = function(v73) --[[ Line: 266 ]] --[[ Name: didMount ]]
    v73.isMounted = true;
    v73.dispatchInitialSearch();
end;
v46.willUnmount = function(v74) --[[ Line: 271 ]] --[[ Name: willUnmount ]]
    v74.isMounted = false;
    if v74.props.searchParameters.searchKeyword then
        v74.props.removeUserSearchResults(v74.props.searchParameters.searchKeyword);
    end;
    if v74.userSearchUuid then
        v74.props.removeTextSearchResults(v74.userSearchUuid);
    end;
end;
local function v78(v75) --[[ Line: 308 ]] --[[ Name: PlayerSearchPageLoaded ]]
    -- upvalues: v6 (copy), l_useLastInputMode_0 (copy), l_useAnimateScrollViewToSelection_0 (copy), v5 (copy), v24 (copy), l_PaginationMethod_0 (copy), l_RetrievalStatus_1 (copy), l_FFlagAppIaScrollAway_0 (copy), v23 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v11 (copy), v25 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (copy), l_ScreenSizeImpressionsDetector_0 (copy)
    local v76 = v6.useRef(nil);
    local v77 = true;
    if l_useLastInputMode_0() ~= "Cursor" then
        v77 = v76.current == nil;
    end;
    l_useAnimateScrollViewToSelection_0(v76, 0.4);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Content = v5.createElement(v24, {
            [v5.Ref] = v76, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            CanvasSize = UDim2.new(1, 0, 1, 0), 
            ScrollingEnabled = v77, 
            refresh = v75.refresh, 
            loadMoreButtonText = if v75.hasMoreEntries and v75.usersSearchResult.paginationMethod == l_PaginationMethod_0.Button and v75.playerSearchStatus ~= l_RetrievalStatus_1.Fetching then v75.localized.loadMoreButtonText else nil, 
            BackgroundTransparency = v75.backgroundTransparency, 
            canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v75.canvasTopPadding else nil, 
            onLoadMore = v75.onLoadMore, 
            onScrollDirectionChanged = v75.onScrollDirectionChanged, 
            onCanvasPositionChangedCallback = v23(function() --[[ Line: 334 ]]
                -- upvalues: v75 (copy)
                v75.onRequestImpressionsSignal:fire();
            end, 0.2), 
            shouldExtendIntoSafeArea = if l_FFlagExtendScrollingFramesBySafeInsets_0 then {
                left = false, 
                top = false, 
                right = false, 
                bottom = true
            } else nil
        }, {
            Layout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12), 
                [v5.Change.AbsoluteContentSize] = v75.onAbsoluteContentSizeChanged
            }), 
            Padding = v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v75.sidePadding), 
                PaddingRight = UDim.new(0, v75.sidePadding), 
                PaddingTop = UDim.new(0, v11.Constants.GAME_GRID_PADDING), 
                PaddingBottom = UDim.new(0, v11.Constants.GAME_GRID_PADDING)
            }), 
            PlayerGrid = v5.createElement(v25, {
                LayoutOrder = 1, 
                entries = v75.entries, 
                searchParameters = v75.searchParameters, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                windowSize = Vector2.new(v75.contentSize.X, v75.screenSize.Y), 
                impressionsTag = "PLAYER_TILE_IMPRESSIONS", 
                Analytics = v75.Analytics, 
                enablePresenceIndicator = v75.enablePresenceIndicator, 
                onItemsPerRowChanged = v75.onItemsPerRowChanged, 
                itemsPerRow = v75.itemsPerRow, 
                startRowNumber = 1, 
                enableOnlineFrequents = if not l_FFlagPlayerSearchEnableOnlineFrequents_0 or l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 then nil else v75.enableOnlineFrequents
            })
        }), 
        ScreenSizeImpressionsDetector = v5.createElement(l_ScreenSizeImpressionsDetector_0, {
            onRequestImpressionsSignal = v75.onRequestImpressionsSignal, 
            onImpressionsDetected = v75.onImpressionsDetected, 
            impressionsTag = "PLAYER_TILE_IMPRESSIONS"
        })
    });
end;
v46.renderOnLoaded = function(v79) --[[ Line: 385 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: v12 (copy), v5 (copy), l_SearchTextBanner_0 (copy), v26 (copy), l_RetrievalStatus_1 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v78 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (copy), v24 (copy), l_PaginationMethod_0 (copy), v23 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v11 (copy), v25 (copy), l_ScreenSizeImpressionsDetector_0 (copy)
    local l_screenSize_1 = v79.props.screenSize;
    local l_contentSize_0 = v79.state.contentSize;
    local v82 = v12.getPageSideMargin(l_screenSize_1.X);
    local l_searchWordLengthNotSupported_0 = v79.props.searchWordLengthNotSupported;
    local v84 = false;
    local v85 = {};
    local l_usersSearchResult_0 = v79.props.usersSearchResult;
    if l_usersSearchResult_0 then
        v84 = if l_usersSearchResult_0.nextPageCursor then l_usersSearchResult_0.nextPageCursor ~= "EndOfPlayerSearch" else false;
        v85 = l_usersSearchResult_0.entries;
    end;
    if v79.props.hotlineSearchText then
        return v5.createElement(l_SearchTextBanner_0, {
            text = v79.props.hotlineSearchText, 
            sidePadding = v82
        });
    else
        local v87 = true;
        if #v85 ~= 0 then
            v87 = l_searchWordLengthNotSupported_0;
        end;
        if v87 then
            return v5.createElement(v26, {
                wideMode = v79.props.wideMode, 
                screenSize = v79.props.screenSize, 
                backgroundTransparency = v79.props.backgroundTransparency, 
                searchWordLengthNotSupported = l_searchWordLengthNotSupported_0, 
                shouldShowUserSearchLandingPage = v79.props.shouldShowUserSearchLandingPage, 
                fireAnalyticsEvent = v79.Analytics.fireAnalyticsEvent
            });
        else
            local v88 = {
                noResultsText = "Feature.PlayerSearchResults.Label.NoResultsFound", 
                keywordTooShortText = "Feature.PlayerSearchResults.Label.KeywordTooShort", 
                loadMoreButtonText = "Search.GlobalSearch.Action.LoadMore"
            };
            local v89 = v84 and v79.props.playerSearchStatus ~= l_RetrievalStatus_1.Fetching and v79.onLoadMore or nil;
            return l_withStyle_0(function(_) --[[ Line: 431 ]]
                -- upvalues: l_withLocalization_0 (ref), v88 (copy), l_FFlagEnableLeftNavOnConsole_0 (ref), v5 (ref), v78 (ref), v79 (copy), v84 (ref), l_usersSearchResult_0 (copy), l_FFlagAppIaScrollAway_0 (ref), v89 (copy), v82 (copy), v85 (ref), l_contentSize_0 (copy), l_screenSize_1 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (ref), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (ref), v24 (ref), l_PaginationMethod_0 (ref), l_RetrievalStatus_1 (ref), v23 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v11 (ref), v25 (ref), l_ScreenSizeImpressionsDetector_0 (ref)
                return l_withLocalization_0(v88)(function(v91) --[[ Line: 432 ]]
                    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), v5 (ref), v78 (ref), v79 (ref), v84 (ref), l_usersSearchResult_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v89 (ref), v82 (ref), v85 (ref), l_contentSize_0 (ref), l_screenSize_1 (ref), l_FFlagPlayerSearchEnableOnlineFrequents_0 (ref), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (ref), v24 (ref), l_PaginationMethod_0 (ref), l_RetrievalStatus_1 (ref), v23 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v11 (ref), v25 (ref), l_ScreenSizeImpressionsDetector_0 (ref)
                    if l_FFlagEnableLeftNavOnConsole_0 then
                        return v5.createElement(v78, {
                            refresh = v79.refresh, 
                            hasMoreEntries = v84, 
                            usersSearchResult = l_usersSearchResult_0, 
                            playerSearchStatus = v79.props.playerSearchStatus, 
                            localized = v91, 
                            backgroundTransparency = v79.props.backgroundTransparency, 
                            canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v79.props.canvasTopPadding else nil, 
                            onLoadMore = v89, 
                            onScrollDirectionChanged = v79.props.onScrollDirectionChanged, 
                            onRequestImpressionsSignal = v79.onRequestImpressionsSignal, 
                            sidePadding = v82, 
                            entries = v85, 
                            searchParameters = v79.props.searchParameters, 
                            contentSize = l_contentSize_0, 
                            screenSize = l_screenSize_1, 
                            onAbsoluteContentSizeChanged = v79.onAbsoluteContentSizeChanged, 
                            Analytics = v79.Analytics, 
                            enablePresenceIndicator = v79.props.enablePresenceIndicator, 
                            onItemsPerRowChanged = v79.onItemsPerRowChanged, 
                            itemsPerRow = v79.state.itemsPerRow, 
                            enableOnlineFrequents = if not l_FFlagPlayerSearchEnableOnlineFrequents_0 or l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 then nil else v79.props.enableOnlineFrequents, 
                            onImpressionsDetected = v79.onImpressionsDetected
                        });
                    else
                        return v5.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }, {
                            Content = v5.createElement(v24, {
                                Size = UDim2.new(1, 0, 1, 0), 
                                Position = UDim2.new(0, 0, 0, 0), 
                                CanvasSize = UDim2.new(1, 0, 1, 0), 
                                refresh = v79.refresh, 
                                loadMoreButtonText = if v84 and l_usersSearchResult_0.paginationMethod == l_PaginationMethod_0.Button and v79.props.playerSearchStatus ~= l_RetrievalStatus_1.Fetching then v91.loadMoreButtonText else nil, 
                                BackgroundTransparency = v79.props.backgroundTransparency, 
                                canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v79.props.canvasTopPadding else nil, 
                                onLoadMore = v89, 
                                onScrollDirectionChanged = v79.props.onScrollDirectionChanged, 
                                onCanvasPositionChangedCallback = v23(function() --[[ Line: 481 ]]
                                    -- upvalues: v79 (ref)
                                    v79.onRequestImpressionsSignal:fire();
                                end, 0.2), 
                                shouldExtendIntoSafeArea = if l_FFlagExtendScrollingFramesBySafeInsets_0 then {
                                    left = false, 
                                    top = false, 
                                    right = false, 
                                    bottom = true
                                } else nil
                            }, {
                                Layout = v5.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Vertical, 
                                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    Padding = UDim.new(0, 12), 
                                    [v5.Change.AbsoluteContentSize] = v79.onAbsoluteContentSizeChanged
                                }), 
                                Padding = v5.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0, v82), 
                                    PaddingRight = UDim.new(0, v82), 
                                    PaddingTop = UDim.new(0, v11.Constants.GAME_GRID_PADDING), 
                                    PaddingBottom = UDim.new(0, v11.Constants.GAME_GRID_PADDING)
                                }), 
                                PlayerGrid = v5.createElement(v25, {
                                    LayoutOrder = 1, 
                                    entries = v85, 
                                    searchParameters = v79.props.searchParameters, 
                                    horizontalAlignment = Enum.HorizontalAlignment.Left, 
                                    windowSize = Vector2.new(l_contentSize_0.X, l_screenSize_1.Y), 
                                    impressionsTag = "PLAYER_TILE_IMPRESSIONS", 
                                    Analytics = v79.Analytics, 
                                    enablePresenceIndicator = v79.props.enablePresenceIndicator, 
                                    onItemsPerRowChanged = v79.onItemsPerRowChanged, 
                                    itemsPerRow = v79.state.itemsPerRow, 
                                    startRowNumber = 1, 
                                    enableOnlineFrequents = if not l_FFlagPlayerSearchEnableOnlineFrequents_0 or l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 then nil else v79.props.enableOnlineFrequents
                                })
                            }), 
                            ScreenSizeImpressionsDetector = v5.createElement(l_ScreenSizeImpressionsDetector_0, {
                                onRequestImpressionsSignal = v79.onRequestImpressionsSignal, 
                                onImpressionsDetected = v79.onImpressionsDetected, 
                                impressionsTag = "PLAYER_TILE_IMPRESSIONS"
                            })
                        });
                    end;
                end);
            end);
        end;
    end;
end;
v46.renderOnFailed = function(v92, v93) --[[ Line: 535 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: v5 (copy), l_EmptyState_0 (copy)
    return v5.createElement(l_EmptyState_0, {
        onActivated = v92.dispatchInitialSearch, 
        text = v93.failedMessage
    });
end;
v46.renderOnLoading = function(_) --[[ Line: 542 ]] --[[ Name: renderOnLoading ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), l_LoadingStatePage_0 (copy)
    return l_withStyle_0(function(v95) --[[ Line: 543 ]]
        -- upvalues: v5 (ref), l_LoadingStatePage_0 (ref)
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v95.Theme.BackgroundDefault.Transparency, 
            BackgroundColor3 = v95.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }, v5.createElement(l_LoadingStatePage_0));
    end);
end;
v46.render = function(v96) --[[ Line: 553 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v5 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    local v97 = if v96.props.isRoutedFromAutoSearch then v96.props.autoTabSearchStatus else v96.props.playerSearchStatus;
    return l_withLocalization_0({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v98) --[[ Line: 560 ]]
        -- upvalues: v5 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), v97 (copy), v96 (copy)
        return v5.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(v97), 
            renderOnLoading = function() --[[ Line: 563 ]] --[[ Name: renderOnLoading ]]
                -- upvalues: v96 (ref)
                if v96.state.loaded then
                    return (v96:renderOnLoaded());
                else
                    return (v96:renderOnLoading());
                end;
            end, 
            renderOnFailed = function() --[[ Line: 566 ]] --[[ Name: renderOnFailed ]]
                -- upvalues: v96 (ref), v98 (copy)
                return v96:renderOnFailed(v98);
            end, 
            renderOnLoaded = function() --[[ Line: 569 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v96 (ref)
                return v96:renderOnLoaded();
            end
        });
    end);
end;
v46.didUpdate = function(v99, v100, v101) --[[ Line: 576 ]] --[[ Name: didUpdate ]]
    -- upvalues: v4 (copy), l_RetrievalStatus_1 (copy)
    v4.assert(v100.searchUuid == v99.props.searchUuid, (("SearchUuid should not change during the lifetime of PlayerSearchPage, analytics could be incorrect; detected a change %* -> %*"):format(v100.searchUuid, v99.props.searchUuid)));
    local v102 = if v99.props.isRoutedFromAutoSearch then v99.props.autoTabSearchStatus else v99.props.playerSearchStatus;
    if v102 ~= v100.playerSearchStatus then
        if v102 == l_RetrievalStatus_1.Done then
            if v99.state.loaded == false then
                v99:setState({
                    loaded = true
                });
            end;
            v99.onRequestImpressionsSignal:fire();
        elseif (v102 == l_RetrievalStatus_1.NotStarted or v102 == l_RetrievalStatus_1.Failed) and v99.state.loaded == true then
            v99:setState({
                loaded = false
            });
        end;
    end;
    local l_impressionsToSend_0 = v99.state.impressionsToSend;
    if l_impressionsToSend_0 ~= nil and l_impressionsToSend_0 ~= v101.impressionsToSend then
        v99.sendPlayerTileImpressions(l_impressionsToSend_0);
        v99:setState({
            impressionsToSend = nil
        });
    end;
end;
return l_RoactServices_0.connect({
    networking = v8
})(v46);