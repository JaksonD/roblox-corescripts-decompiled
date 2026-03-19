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
local function _(v43) --[[ Line: 65 ]]
    -- upvalues: v22 (copy)
    return utf8.len(v43) >= v22.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN;
end;
local v45 = v5.PureComponent:extend("PlayerSearchPage");
v45.validateProps = v3.strictInterface({
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
    enableOnlineFrequents = v3.optional(v3.boolean)
});
v45.init = function(v46) --[[ Line: 105 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), l_HttpService_0 (copy), l_Analytics_0 (copy), l_Signal_0 (copy), l_fireImpressionEvent_0 (copy), l_EventNames_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), v10 (copy), l_Timers_0 (copy), l_RetrievalStatus_0 (copy), l_RetrievalStatus_1 (copy), v22 (copy)
    local l_screenSize_0 = v46.props.screenSize;
    local v48 = v12.getPageSideMargin(l_screenSize_0.X);
    v46.userSearchUuid = v46.props.searchUuid or l_HttpService_0:GenerateGUID(false);
    v46.Analytics = l_Analytics_0({
        infoForAllEvents = {
            globalSessionId = v46.props.omniSearchUuid, 
            userSearchSessionId = v46.userSearchUuid
        }
    });
    v46.state = {
        loaded = false, 
        impressionsToSend = nil, 
        contentSize = Vector2.new(l_screenSize_0.X - 2 * v48, l_screenSize_0.Y), 
        itemsPerRow = 1
    };
    v46.onRequestImpressionsSignal = l_Signal_0.new();
    v46.onImpressionsDetected = function(v49) --[[ Line: 126 ]]
        -- upvalues: v46 (copy)
        if not v49 or #v49 == 0 then
            return;
        else
            v46:setState({
                impressionsToSend = v49
            });
            return;
        end;
    end;
    v46.onItemsPerRowChanged = function(v50) --[[ Line: 136 ]]
        -- upvalues: v46 (copy)
        v46:setState({
            itemsPerRow = v50
        });
    end;
    v46.sendPlayerTileImpressions = function(v51) --[[ Line: 142 ]]
        -- upvalues: l_fireImpressionEvent_0 (ref), v46 (copy)
        l_fireImpressionEvent_0({
            impressions = v51, 
            entries = v46.props.usersSearchResult and v46.props.usersSearchResult.entries or nil, 
            itemsPerRow = v46.state.itemsPerRow, 
            startRowNumber = 1
        }, v46.Analytics.fireAnalyticsEvent);
    end;
    v46.onAbsoluteContentSizeChanged = function(v52) --[[ Line: 151 ]]
        -- upvalues: v46 (copy)
        if v46.isMounted and v52 then
            local l_AbsoluteContentSize_0 = v52.AbsoluteContentSize;
            if v46.state.contentSize == l_AbsoluteContentSize_0 then
                return;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v46:setState({
                    contentSize = l_AbsoluteContentSize_0
                });
            end;
        end;
    end;
    v46.fireSearchPageLoadEvents = function(_, v55, v56) --[[ Line: 166 ]]
        -- upvalues: v46 (copy), l_EventNames_0 (ref)
        local v57 = v55.nextPage or false;
        local l_fireAnalyticsEvent_0 = v46.Analytics.fireAnalyticsEvent;
        l_fireAnalyticsEvent_0(l_EventNames_0.UserSearchLoadingTime, {
            status = v55.status, 
            loadingTime = v56, 
            nextPage = v57
        });
        l_fireAnalyticsEvent_0(l_EventNames_0.UserSearchLoaded, {
            status = v55.status, 
            nextPage = v57
        });
    end;
    v46.fetchPlayerSearch = function(v59, v60) --[[ Line: 180 ]]
        -- upvalues: l_reportPromiseLoadingTimeWrapper_0 (ref), v46 (copy), v10 (ref)
        return l_reportPromiseLoadingTimeWrapper_0(v46.props.fetchPlayerSearch, function(_) --[[ Line: 183 ]]
            -- upvalues: v60 (copy)
            return {
                fetch = "userSearch", 
                nextPage = v60.nextPage
            };
        end, {
            fireEvent = v46.fireSearchPageLoadEvents
        })(v59, v60):catch(function() --[[ Line: 189 ]]
            -- upvalues: v10 (ref)
            return v10.resolve();
        end);
    end;
    v46.loadingTimers = l_Timers_0();
    v46.reportLoadingTimeForPromise = function(v62, v63) --[[ Line: 196 ]]
        -- upvalues: v46 (copy), l_EventNames_0 (ref), l_RetrievalStatus_0 (ref)
        local v64 = v46.loadingTimers.start();
        local function v67(v65) --[[ Line: 199 ]]
            -- upvalues: v46 (ref), v64 (copy), l_EventNames_0 (ref), v63 (copy)
            local v66 = v46.loadingTimers.stop(v64);
            v46.Analytics.fireAnalyticsEvent(l_EventNames_0.UserSearchLoadingTime, {
                status = v65, 
                loadingTime = v66, 
                nextPage = if v63 then v63.nextPage else false
            });
        end;
        return v62():andThen(function() --[[ Line: 211 ]]
            -- upvalues: v67 (copy), l_RetrievalStatus_0 (ref)
            v67(l_RetrievalStatus_0.Done.rawValue());
        end):catch(function() --[[ Line: 214 ]]
            -- upvalues: v67 (copy), l_RetrievalStatus_0 (ref)
            v67(l_RetrievalStatus_0.Failed.rawValue());
        end);
    end;
    v46.onLoadMore = function() --[[ Line: 219 ]]
        -- upvalues: v46 (copy)
        local l_networking_0 = v46.props.networking;
        local l_searchKeyword_0 = v46.props.searchParameters.searchKeyword;
        return v46.fetchPlayerSearch(l_networking_0, {
            keyword = l_searchKeyword_0, 
            searchUuid = v46.userSearchUuid, 
            omniSearchUuid = v46.props.omniSearchUuid, 
            nextPage = true
        });
    end;
    v46.dispatchInitialSearch = function() --[[ Line: 232 ]]
        -- upvalues: v46 (copy), l_RetrievalStatus_1 (ref), v10 (ref), v22 (ref)
        if v46.props.isRoutedFromAutoSearch then
            if v46.props.autoTabSearchStatus == l_RetrievalStatus_1.Done and v46.state.loaded == false then
                v46:setState({
                    loaded = true
                });
            end;
            return v10.resolve();
        else
            local l_networking_1 = v46.props.networking;
            local l_searchKeyword_1 = v46.props.searchParameters.searchKeyword;
            if l_searchKeyword_1 and utf8.len(l_searchKeyword_1) >= v22.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN then
                return v46.fetchPlayerSearch(l_networking_1, {
                    keyword = l_searchKeyword_1, 
                    searchUuid = v46.userSearchUuid, 
                    omniSearchUuid = v46.props.omniSearchUuid, 
                    nextPage = false
                });
            else
                return nil;
            end;
        end;
    end;
end;
v45.didMount = function(v72) --[[ Line: 262 ]] --[[ Name: didMount ]]
    v72.isMounted = true;
    v72.dispatchInitialSearch();
end;
v45.willUnmount = function(v73) --[[ Line: 267 ]] --[[ Name: willUnmount ]]
    v73.isMounted = false;
    if v73.props.searchParameters.searchKeyword then
        v73.props.removeUserSearchResults(v73.props.searchParameters.searchKeyword);
    end;
    if v73.userSearchUuid then
        v73.props.removeTextSearchResults(v73.userSearchUuid);
    end;
end;
local function v77(v74) --[[ Line: 304 ]] --[[ Name: PlayerSearchPageLoaded ]]
    -- upvalues: v6 (copy), l_useLastInputMode_0 (copy), l_useAnimateScrollViewToSelection_0 (copy), v5 (copy), v24 (copy), l_PaginationMethod_0 (copy), l_RetrievalStatus_1 (copy), l_FFlagAppIaScrollAway_0 (copy), v23 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v11 (copy), v25 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (copy), l_ScreenSizeImpressionsDetector_0 (copy)
    local v75 = v6.useRef(nil);
    local v76 = true;
    if l_useLastInputMode_0() ~= "Cursor" then
        v76 = v75.current == nil;
    end;
    l_useAnimateScrollViewToSelection_0(v75, 0.4);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Content = v5.createElement(v24, {
            [v5.Ref] = v75, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            CanvasSize = UDim2.new(1, 0, 1, 0), 
            ScrollingEnabled = v76, 
            refresh = v74.refresh, 
            loadMoreButtonText = if v74.hasMoreEntries and v74.usersSearchResult.paginationMethod == l_PaginationMethod_0.Button and v74.playerSearchStatus ~= l_RetrievalStatus_1.Fetching then v74.localized.loadMoreButtonText else nil, 
            BackgroundTransparency = v74.backgroundTransparency, 
            canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v74.canvasTopPadding else nil, 
            onLoadMore = v74.onLoadMore, 
            onScrollDirectionChanged = v74.onScrollDirectionChanged, 
            onCanvasPositionChangedCallback = v23(function() --[[ Line: 330 ]]
                -- upvalues: v74 (copy)
                v74.onRequestImpressionsSignal:fire();
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
                [v5.Change.AbsoluteContentSize] = v74.onAbsoluteContentSizeChanged
            }), 
            Padding = v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v74.sidePadding), 
                PaddingRight = UDim.new(0, v74.sidePadding), 
                PaddingTop = UDim.new(0, v11.Constants.GAME_GRID_PADDING), 
                PaddingBottom = UDim.new(0, v11.Constants.GAME_GRID_PADDING)
            }), 
            PlayerGrid = v5.createElement(v25, {
                LayoutOrder = 1, 
                entries = v74.entries, 
                searchParameters = v74.searchParameters, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                windowSize = Vector2.new(v74.contentSize.X, v74.screenSize.Y), 
                impressionsTag = "PLAYER_TILE_IMPRESSIONS", 
                Analytics = v74.Analytics, 
                enablePresenceIndicator = v74.enablePresenceIndicator, 
                onItemsPerRowChanged = v74.onItemsPerRowChanged, 
                itemsPerRow = v74.itemsPerRow, 
                startRowNumber = 1, 
                enableOnlineFrequents = if not l_FFlagPlayerSearchEnableOnlineFrequents_0 or l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 then nil else v74.enableOnlineFrequents
            })
        }), 
        ScreenSizeImpressionsDetector = v5.createElement(l_ScreenSizeImpressionsDetector_0, {
            onRequestImpressionsSignal = v74.onRequestImpressionsSignal, 
            onImpressionsDetected = v74.onImpressionsDetected, 
            impressionsTag = "PLAYER_TILE_IMPRESSIONS"
        })
    });
end;
v45.renderOnLoaded = function(v78) --[[ Line: 381 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: v12 (copy), v5 (copy), l_SearchTextBanner_0 (copy), v26 (copy), l_RetrievalStatus_1 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v77 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (copy), v24 (copy), l_PaginationMethod_0 (copy), v23 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v11 (copy), v25 (copy), l_ScreenSizeImpressionsDetector_0 (copy)
    local l_screenSize_1 = v78.props.screenSize;
    local l_contentSize_0 = v78.state.contentSize;
    local v81 = v12.getPageSideMargin(l_screenSize_1.X);
    local l_searchWordLengthNotSupported_0 = v78.props.searchWordLengthNotSupported;
    local v83 = false;
    local v84 = {};
    local l_usersSearchResult_0 = v78.props.usersSearchResult;
    if l_usersSearchResult_0 then
        v83 = if l_usersSearchResult_0.nextPageCursor then l_usersSearchResult_0.nextPageCursor ~= "EndOfPlayerSearch" else false;
        v84 = l_usersSearchResult_0.entries;
    end;
    if v78.props.hotlineSearchText then
        return v5.createElement(l_SearchTextBanner_0, {
            text = v78.props.hotlineSearchText, 
            sidePadding = v81
        });
    else
        local v86 = true;
        if #v84 ~= 0 then
            v86 = l_searchWordLengthNotSupported_0;
        end;
        if v86 then
            return v5.createElement(v26, {
                wideMode = v78.props.wideMode, 
                screenSize = v78.props.screenSize, 
                backgroundTransparency = v78.props.backgroundTransparency, 
                searchWordLengthNotSupported = l_searchWordLengthNotSupported_0, 
                shouldShowUserSearchLandingPage = v78.props.shouldShowUserSearchLandingPage, 
                fireAnalyticsEvent = v78.Analytics.fireAnalyticsEvent
            });
        else
            local v87 = {
                noResultsText = "Feature.PlayerSearchResults.Label.NoResultsFound", 
                keywordTooShortText = "Feature.PlayerSearchResults.Label.KeywordTooShort", 
                loadMoreButtonText = "Search.GlobalSearch.Action.LoadMore"
            };
            local v88 = v83 and v78.props.playerSearchStatus ~= l_RetrievalStatus_1.Fetching and v78.onLoadMore or nil;
            return l_withStyle_0(function(_) --[[ Line: 427 ]]
                -- upvalues: l_withLocalization_0 (ref), v87 (copy), l_FFlagEnableLeftNavOnConsole_0 (ref), v5 (ref), v77 (ref), v78 (copy), v83 (ref), l_usersSearchResult_0 (copy), l_FFlagAppIaScrollAway_0 (ref), v88 (copy), v81 (copy), v84 (ref), l_contentSize_0 (copy), l_screenSize_1 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (ref), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (ref), v24 (ref), l_PaginationMethod_0 (ref), l_RetrievalStatus_1 (ref), v23 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v11 (ref), v25 (ref), l_ScreenSizeImpressionsDetector_0 (ref)
                return l_withLocalization_0(v87)(function(v90) --[[ Line: 428 ]]
                    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), v5 (ref), v77 (ref), v78 (ref), v83 (ref), l_usersSearchResult_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v88 (ref), v81 (ref), v84 (ref), l_contentSize_0 (ref), l_screenSize_1 (ref), l_FFlagPlayerSearchEnableOnlineFrequents_0 (ref), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (ref), v24 (ref), l_PaginationMethod_0 (ref), l_RetrievalStatus_1 (ref), v23 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v11 (ref), v25 (ref), l_ScreenSizeImpressionsDetector_0 (ref)
                    if l_FFlagEnableLeftNavOnConsole_0 then
                        return v5.createElement(v77, {
                            refresh = v78.refresh, 
                            hasMoreEntries = v83, 
                            usersSearchResult = l_usersSearchResult_0, 
                            playerSearchStatus = v78.props.playerSearchStatus, 
                            localized = v90, 
                            backgroundTransparency = v78.props.backgroundTransparency, 
                            canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v78.props.canvasTopPadding else nil, 
                            onLoadMore = v88, 
                            onScrollDirectionChanged = v78.props.onScrollDirectionChanged, 
                            onRequestImpressionsSignal = v78.onRequestImpressionsSignal, 
                            sidePadding = v81, 
                            entries = v84, 
                            searchParameters = v78.props.searchParameters, 
                            contentSize = l_contentSize_0, 
                            screenSize = l_screenSize_1, 
                            onAbsoluteContentSizeChanged = v78.onAbsoluteContentSizeChanged, 
                            Analytics = v78.Analytics, 
                            enablePresenceIndicator = v78.props.enablePresenceIndicator, 
                            onItemsPerRowChanged = v78.onItemsPerRowChanged, 
                            itemsPerRow = v78.state.itemsPerRow, 
                            enableOnlineFrequents = if not l_FFlagPlayerSearchEnableOnlineFrequents_0 or l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 then nil else v78.props.enableOnlineFrequents, 
                            onImpressionsDetected = v78.onImpressionsDetected
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
                                refresh = v78.refresh, 
                                loadMoreButtonText = if v83 and l_usersSearchResult_0.paginationMethod == l_PaginationMethod_0.Button and v78.props.playerSearchStatus ~= l_RetrievalStatus_1.Fetching then v90.loadMoreButtonText else nil, 
                                BackgroundTransparency = v78.props.backgroundTransparency, 
                                canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v78.props.canvasTopPadding else nil, 
                                onLoadMore = v88, 
                                onScrollDirectionChanged = v78.props.onScrollDirectionChanged, 
                                onCanvasPositionChangedCallback = v23(function() --[[ Line: 477 ]]
                                    -- upvalues: v78 (ref)
                                    v78.onRequestImpressionsSignal:fire();
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
                                    [v5.Change.AbsoluteContentSize] = v78.onAbsoluteContentSizeChanged
                                }), 
                                Padding = v5.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0, v81), 
                                    PaddingRight = UDim.new(0, v81), 
                                    PaddingTop = UDim.new(0, v11.Constants.GAME_GRID_PADDING), 
                                    PaddingBottom = UDim.new(0, v11.Constants.GAME_GRID_PADDING)
                                }), 
                                PlayerGrid = v5.createElement(v25, {
                                    LayoutOrder = 1, 
                                    entries = v84, 
                                    searchParameters = v78.props.searchParameters, 
                                    horizontalAlignment = Enum.HorizontalAlignment.Left, 
                                    windowSize = Vector2.new(l_contentSize_0.X, l_screenSize_1.Y), 
                                    impressionsTag = "PLAYER_TILE_IMPRESSIONS", 
                                    Analytics = v78.Analytics, 
                                    enablePresenceIndicator = v78.props.enablePresenceIndicator, 
                                    onItemsPerRowChanged = v78.onItemsPerRowChanged, 
                                    itemsPerRow = v78.state.itemsPerRow, 
                                    startRowNumber = 1, 
                                    enableOnlineFrequents = if not l_FFlagPlayerSearchEnableOnlineFrequents_0 or l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 then nil else v78.props.enableOnlineFrequents
                                })
                            }), 
                            ScreenSizeImpressionsDetector = v5.createElement(l_ScreenSizeImpressionsDetector_0, {
                                onRequestImpressionsSignal = v78.onRequestImpressionsSignal, 
                                onImpressionsDetected = v78.onImpressionsDetected, 
                                impressionsTag = "PLAYER_TILE_IMPRESSIONS"
                            })
                        });
                    end;
                end);
            end);
        end;
    end;
end;
v45.renderOnFailed = function(v91, v92) --[[ Line: 531 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: v5 (copy), l_EmptyState_0 (copy)
    return v5.createElement(l_EmptyState_0, {
        onActivated = v91.dispatchInitialSearch, 
        text = v92.failedMessage
    });
end;
v45.renderOnLoading = function(_) --[[ Line: 538 ]] --[[ Name: renderOnLoading ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), l_LoadingStatePage_0 (copy)
    return l_withStyle_0(function(v94) --[[ Line: 539 ]]
        -- upvalues: v5 (ref), l_LoadingStatePage_0 (ref)
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v94.Theme.BackgroundDefault.Transparency, 
            BackgroundColor3 = v94.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }, v5.createElement(l_LoadingStatePage_0));
    end);
end;
v45.render = function(v95) --[[ Line: 549 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v5 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    local v96 = if v95.props.isRoutedFromAutoSearch then v95.props.autoTabSearchStatus else v95.props.playerSearchStatus;
    return l_withLocalization_0({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v97) --[[ Line: 556 ]]
        -- upvalues: v5 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), v96 (copy), v95 (copy)
        return v5.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(v96), 
            renderOnLoading = function() --[[ Line: 559 ]] --[[ Name: renderOnLoading ]]
                -- upvalues: v95 (ref)
                if v95.state.loaded then
                    return (v95:renderOnLoaded());
                else
                    return (v95:renderOnLoading());
                end;
            end, 
            renderOnFailed = function() --[[ Line: 562 ]] --[[ Name: renderOnFailed ]]
                -- upvalues: v95 (ref), v97 (copy)
                return v95:renderOnFailed(v97);
            end, 
            renderOnLoaded = function() --[[ Line: 565 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v95 (ref)
                return v95:renderOnLoaded();
            end
        });
    end);
end;
v45.didUpdate = function(v98, v99, v100) --[[ Line: 572 ]] --[[ Name: didUpdate ]]
    -- upvalues: v4 (copy), l_RetrievalStatus_1 (copy)
    v4.assert(v99.searchUuid == v98.props.searchUuid, (("SearchUuid should not change during the lifetime of PlayerSearchPage, analytics could be incorrect; detected a change %* -> %*"):format(v99.searchUuid, v98.props.searchUuid)));
    local v101 = if v98.props.isRoutedFromAutoSearch then v98.props.autoTabSearchStatus else v98.props.playerSearchStatus;
    if v101 ~= v99.playerSearchStatus then
        if v101 == l_RetrievalStatus_1.Done then
            if v98.state.loaded == false then
                v98:setState({
                    loaded = true
                });
            end;
            v98.onRequestImpressionsSignal:fire();
        elseif (v101 == l_RetrievalStatus_1.NotStarted or v101 == l_RetrievalStatus_1.Failed) and v98.state.loaded == true then
            v98:setState({
                loaded = false
            });
        end;
    end;
    local l_impressionsToSend_0 = v98.state.impressionsToSend;
    if l_impressionsToSend_0 ~= nil and l_impressionsToSend_0 ~= v100.impressionsToSend then
        v98.sendPlayerTileImpressions(l_impressionsToSend_0);
        v98:setState({
            impressionsToSend = nil
        });
    end;
end;
return l_RoactServices_0.connect({
    networking = v8
})(v45);