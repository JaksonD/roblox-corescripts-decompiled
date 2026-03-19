local l_CorePackages_0 = game:GetService("CorePackages");
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v5 = require(l_CorePackages_0.Packages.Otter);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.Promise);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local v15 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v15.Style.withStyle;
local l_withGridConfig_DEPRECATED_0 = v15.Core.Layout.Grid.withGridConfig_DEPRECATED;
local l_EmptyState_0 = v15.App.Indicator.EmptyState;
local v19 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_LayoutConfig_0 = v19.LayoutConfig;
local l_AppPage_0 = v19.AppPage;
local l_SearchTypes_0 = v19.SearchTypes;
local v23 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local l_reportPromiseLoadingTimeWrapper_0 = v23.Analytics.Timing.reportPromiseLoadingTimeWrapper;
local l_createDiagMetricString_0 = v23.Analytics.Formatters.createDiagMetricString;
local l_Diag_0 = v23.Analytics.DefaultAnalyticsService.Diag;
local l_EventStream_0 = v23.Analytics.DefaultAnalyticsService.EventStream;
local l_Enums_0 = v23.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local l_getDeepValue_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useNavigationFocus_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigationFocus;
local l_SearchSourceEvent_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).SearchSourceEvent;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v37 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local v38 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_VisibilityControl_0 = v38.VisibilityControl;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SearchRetrievalStatus_0 = l_Modules_0.LuaApp.Enum.SearchRetrievalStatus;
local l_Context_0 = l_Modules_0.LuaApp.Components.Search.SearchTypeSelection.Context;
local l_OmniSearchSessionUtil_0 = l_Modules_0.LuaApp.Analytics.Sessions.OmniSearchSessionUtil;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v45 = require(l_Modules_1.LuaApp.Enum.OmniSearchVerticalType);
local v46 = require(l_Modules_1.LuaApp.Components.TopBar.TopBar);
local v47 = require(l_Modules_1.LuaApp.Components.Search.ButtonStripSelector);
local v48 = require(l_Modules_1.LuaApp.Components.Search.GamesSearchPage);
local v49 = require(l_Modules_1.LuaApp.Components.UserSearch.Players.PlayerSearch);
local v50 = require(l_Modules_1.AvatarExperience.Catalog.Components.Search.CatalogSearch);
local v51 = require(l_Modules_1.LuaApp.Components.Search.TopResultsSearchPage.TopResultsSearchPage);
local v52 = require(l_Modules_1.LuaApp.Enum.ScrollMovementDirection);
local v53 = require(l_Modules_1.LuaApp.Thunks.OpenWebview);
local v54 = require(l_Modules_1.LuaApp.Actions.SetSearchType);
local v55 = require(l_Modules_1.LuaApp.Actions.SetSearchParameters);
local v56 = require(l_Modules_1.LuaApp.SearchUuid);
local v57 = require(l_Modules_1.LuaApp.Analytics.Events.search);
local v58 = require(l_Modules_1.LuaApp.Thunks.Search.ApiFetchOmniSearchAutoFirstPage);
local v59 = require(l_Modules_1.LuaApp.Thunks.Search.getAutoFetchingStatus);
local l_FFlagSearchTopResultsTabEnabledForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchTopResultsTabEnabledForAll;
local l_FFlagAppIaScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway;
local v62 = {
    frequency = 3, 
    dampeningRatio = 0
};
local v63 = {
    [l_SearchTypes_0.Games] = v48, 
    [l_SearchTypes_0.Players] = v49, 
    [l_SearchTypes_0.Catalog] = v50, 
    [l_SearchTypes_0.TopResults] = v51, 
    [l_SearchTypes_0.Auto] = v15.App.Container.LoadingStatePage
};
local v64 = if l_FFlagAppIaScrollAway_0 then {
    [l_SearchTypes_0.Games] = true, 
    [l_SearchTypes_0.Players] = true, 
    [l_SearchTypes_0.TopResults] = true
} else nil;
local function v70(v65, v66, v67) --[[ Line: 102 ]] --[[ Name: fireAutoSearchLoadingTimeEvent ]]
    -- upvalues: l_SearchRetrievalStatus_0 (copy), l_getDeepValue_0 (copy), v45 (copy), l_Contexts_0 (copy), l_EventStream_0 (copy), l_EventTypes_0 (copy), l_createDiagMetricString_0 (copy), l_Diag_0 (copy)
    local v68 = nil;
    v68 = v66.status == l_SearchRetrievalStatus_0.Failed and "omniSearch" or if l_getDeepValue_0(v66, "result.responseBody.vertical") == v45.User then l_Contexts_0.PlayerSearch else "gameSearch";
    l_EventStream_0:sendEventDeferred(v68, l_EventTypes_0.LoadingTime, {
        isAutoSearchType = true, 
        status = v66.status, 
        loadingTime = v67
    });
    local v69 = l_createDiagMetricString_0(v65, v66) .. "_" .. v68;
    l_Diag_0:reportStats(v69, v67);
end;
local v71 = v9.PureComponent:extend("SearchPage");
v71.defaultProps = {
    searchType = l_SearchTypes_0.Games
};
v71.validateProps = v7.strictInterface({
    topBarHeight = v7.number, 
    searchParameters = v7.strictInterface({
        searchKeyword = v7.string, 
        isKeywordSuggestionEnabled = v7.boolean
    }), 
    searchType = v7.string, 
    screenSize = v7.Vector2, 
    currentPage = v7.table, 
    currentRoute = v7.table, 
    autoTabSearchStatus = v7.string, 
    openWebview = v7.callback, 
    setSearchType = v7.callback, 
    setSearchParameters = v7.callback, 
    dispatchOmniSearchAutoFirstPage = v7.callback, 
    eventIngest = v7.any, 
    sessionService = v7.any, 
    networking = v7.any, 
    useCreationCenterTitle = v7.boolean, 
    gridConfig = v7.table, 
    searchUuid = v7.optional(v7.string), 
    omniSearchUuid = v7.optional(v7.string), 
    isFocused = v7.boolean, 
    isTopPageEnabled = v7.optional(v7.boolean), 
    navigation = v7.any
});
v71.init = function(v72) --[[ Line: 164 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_SearchTypes_0 (copy), v37 (copy), v56 (copy), l_OmniSearchSessionUtil_0 (copy), v57 (copy), l_FFlagAppIaScrollAway_0 (copy), v38 (copy), l_AppPage_0 (copy), l_SearchSourceEvent_0 (copy), v52 (copy), v5 (copy), v62 (copy), l_LayoutConfig_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), v70 (copy), v11 (copy), l_memoize_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy)
    v72.isMounted = false;
    v72.searchTypeSelectorFrameRef = v9.createRef();
    v72.searchPageRef = v9.createRef();
    v72.searchComponents = {};
    local l_searchType_0 = v72.props.searchType;
    v72.searchInfoMap = {};
    v72.searchInfoMap[l_searchType_0] = {
        searchUuid = v72.props.searchUuid, 
        searchParameters = v72.props.searchParameters
    };
    v72.currentSearchType = l_searchType_0;
    v72.state = {
        currentSearchType = l_searchType_0, 
        isRoutedFromAutoSearch = l_searchType_0 == l_SearchTypes_0.Auto
    };
    v72.useSearchTypeSelector = function() --[[ Line: 183 ]]
        -- upvalues: v37 (ref), v72 (copy)
        return v37.isSearchTypeInOmniSearch(v72.state.currentSearchType);
    end;
    v72.updateSearchType = function(v74, v75) --[[ Line: 187 ]]
        -- upvalues: v72 (copy), l_SearchTypes_0 (ref), v56 (ref), l_OmniSearchSessionUtil_0 (ref), v57 (ref), l_FFlagAppIaScrollAway_0 (ref), v38 (ref)
        if v72.state.currentSearchType == v74 then
            return;
        elseif not v72.props.searchParameters then
            assert(false, "self.props.searchParameters should not be nil");
            return;
        else
            local l_searchKeyword_0 = v72.props.searchParameters.searchKeyword;
            local v77 = nil;
            if v72.searchInfoMap[v74] then
                v77 = v72.searchInfoMap[v74].searchUuid;
            else
                v77 = if v72.state.currentSearchType == l_SearchTypes_0.Auto and v72.searchInfoMap[l_SearchTypes_0.Auto] and v72.searchInfoMap[l_SearchTypes_0.Auto].searchUuid then v72.searchInfoMap[l_SearchTypes_0.Auto].searchUuid else v56();
                if v72.state.currentSearchType ~= l_SearchTypes_0.Auto and v74 ~= l_SearchTypes_0.Auto then
                    v72:setState({
                        isRoutedFromAutoSearch = false
                    });
                end;
                local v78 = {
                    searchKeyword = l_searchKeyword_0, 
                    isKeywordSuggestionEnabled = true
                };
                v72.searchInfoMap[v74] = {
                    searchUuid = v77, 
                    searchParameters = v78
                };
                v72.props.setSearchParameters(v77, v78);
                v72.props.setSearchType(v77, v74);
            end;
            l_OmniSearchSessionUtil_0.updateSearchType(v72.props.sessionService, v74, v77, v75);
            local v79 = v72.state.currentSearchType == l_SearchTypes_0.Auto;
            if v72.currentSearchType ~= v74 then
                local l_currentRoute_0 = v72.props.currentRoute;
                local v81 = if v79 then l_currentRoute_0[#l_currentRoute_0 - 1].name else v72.props.currentPage.name;
                v57(v72.props.eventIngest, v74, "search", l_searchKeyword_0, v79, v81);
            end;
            v72:setState({
                currentSearchType = v74
            });
            v72.currentSearchType = v74;
            if not l_FFlagAppIaScrollAway_0 or not v38.getScrollAwayEnabled() then
                v72.setTabBarVisible();
            end;
            return;
        end;
    end;
    v72.onPageChange = function(v82) --[[ Line: 250 ]]
        -- upvalues: v72 (copy), l_AppPage_0 (ref), l_OmniSearchSessionUtil_0 (ref), l_SearchSourceEvent_0 (ref)
        local l_currentPage_0 = v72.props.currentPage;
        if not l_currentPage_0 or not l_currentPage_0.name or l_currentPage_0.name ~= l_AppPage_0.SearchPage then
            return;
        elseif not v72.props.isFocused then
            return;
        else
            local l_sessionService_0 = v72.props.sessionService;
            local v85 = l_currentPage_0.extraProps and l_currentPage_0.extraProps.omniSearchInfo;
            if v85 then
                assert(v85.omniSearchUuid ~= nil);
                assert(v85.searchKeyword ~= nil);
                local l_omniSearchUuid_0 = v85.omniSearchUuid;
                local l_searchKeyword_1 = v85.searchKeyword;
                if v82 and v82.extraProps and v82.extraProps.omniSearchInfo and l_omniSearchUuid_0 == v82.extraProps.omniSearchInfo.omniSearchUuid then
                    return;
                else
                    local v88 = nil;
                    local v89 = v72.searchInfoMap[v72.state.currentSearchType];
                    if v89 then
                        v88 = v89.searchUuid;
                    end;
                    l_OmniSearchSessionUtil_0.create(l_sessionService_0, l_omniSearchUuid_0, l_searchKeyword_1, v72.state.currentSearchType, v88, l_SearchSourceEvent_0.NavBack);
                end;
            end;
            return;
        end;
    end;
    v72.onTopResultsSelected = function(v90) --[[ Line: 297 ]]
        -- upvalues: v72 (copy), l_SearchTypes_0 (ref)
        if not v72.isMounted then
            return;
        else
            v72.updateSearchType(l_SearchTypes_0.TopResults, v90);
            return;
        end;
    end;
    v72.onGamesSelected = function(v91) --[[ Line: 305 ]]
        -- upvalues: v72 (copy), l_SearchTypes_0 (ref)
        if not v72.isMounted then
            return;
        else
            v72.updateSearchType(l_SearchTypes_0.Games, v91);
            return;
        end;
    end;
    v72.onPlayersSelected = function(v92) --[[ Line: 312 ]]
        -- upvalues: v72 (copy), l_SearchTypes_0 (ref)
        if not v72.isMounted then
            return;
        else
            v72.updateSearchType(l_SearchTypes_0.Players, v92);
            return;
        end;
    end;
    if not l_FFlagAppIaScrollAway_0 or not v38.getScrollAwayEnabled() then
        v72.selectorVisible = true;
        v72.onScrollDirectionChanged = function(v93) --[[ Line: 321 ]]
            -- upvalues: v52 (ref), v72 (copy), v5 (ref), v62 (ref)
            local v94 = v93 == v52.Backward;
            if v94 ~= v72.selectorVisible then
                v72.selectorVisible = v94;
                v72.motor:setGoal({
                    searchTypeSelectorFramePosition = v5.spring(v72.getSelectorFramePosition(v94), v62), 
                    searchPagePosition = v5.spring(v72.getSearchPagePosition(v94), v62), 
                    searchPageSizeOffset = v5.spring(v72.getSearchPageSizeOffset(v94), v62)
                });
            end;
        end;
        v72.setTabBarVisible = function() --[[ Line: 336 ]]
            -- upvalues: v72 (copy), v5 (ref), v62 (ref)
            if not v72.selectorVisible then
                v72.selectorVisible = true;
                v72.motor:setGoal({
                    searchTypeSelectorFramePosition = v5.spring(v72.getSelectorFramePosition(v72.selectorVisible), v62), 
                    searchPagePosition = v5.spring(v72.getSearchPagePosition(v72.selectorVisible), v62), 
                    searchPageSizeOffset = v5.spring(v72.getSearchPageSizeOffset(v72.selectorVisible), v62)
                });
            end;
        end;
        v72.getSelectorFramePosition = function(v95) --[[ Line: 353 ]]
            -- upvalues: v72 (copy), l_LayoutConfig_0 (ref)
            local v96 = v72.props.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
            local v97 = v72.props.topBarHeight - v96;
            if not v95 then
                v97 = v97 - 43;
            end;
            return v97;
        end;
        v72.getSearchPagePosition = function(v98) --[[ Line: 364 ]]
            -- upvalues: v72 (copy)
            return v72.getSelectorFramePosition(v98) + 43 - 1;
        end;
        v72.getSearchPageSizeOffset = function(v99) --[[ Line: 369 ]]
            -- upvalues: v72 (copy)
            return -v72.getSearchPagePosition(v99);
        end;
    end;
    v72.checkDispatchInitialOmniSearch = function() --[[ Line: 374 ]]
        -- upvalues: l_searchType_0 (copy), l_SearchTypes_0 (ref), l_reportPromiseLoadingTimeWrapper_0 (ref), v72 (copy), v70 (ref), v11 (ref)
        if l_searchType_0 == l_SearchTypes_0.Auto then
            return l_reportPromiseLoadingTimeWrapper_0(v72.props.dispatchOmniSearchAutoFirstPage, function() --[[ Line: 378 ]]
                return {
                    fetch = "search_auto"
                };
            end, {
                fireEvent = v70
            })(v72.props.networking, v72.props.searchParameters.searchKeyword, v72.props.searchUuid, v72.props.omniSearchUuid);
        else
            return v11.resolve();
        end;
    end;
    v72.buildSearchTypeSelections = l_memoize_0(function(v100, v101, v102, v103, v104) --[[ Line: 394 ]]
        -- upvalues: l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), l_SearchTypes_0 (ref), v72 (copy)
        local v105 = {};
        if l_FFlagSearchTopResultsTabEnabledForAll_0 or v104 then
            table.insert(v105, {
                name = l_SearchTypes_0.TopResults, 
                text = v100, 
                onActivated = v72.onTopResultsSelected
            });
        end;
        table.insert(v105, {
            name = l_SearchTypes_0.Games, 
            text = v101, 
            onActivated = v72.onGamesSelected, 
            image = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v104 then nil else "LuaApp/icons/GameDetails/play"
        });
        if v103 then
            table.insert(v105, {
                name = l_SearchTypes_0.Players, 
                text = v102, 
                onActivated = v72.onPlayersSelected, 
                image = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v104 then nil else "LuaApp/icons/avatar_profile"
            });
        end;
        return v105;
    end);
end;
v71.renderWithLocalized = function(v106, v107) --[[ Line: 426 ]] --[[ Name: renderWithLocalized ]]
    -- upvalues: l_SearchTypes_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v38 (copy), l_withStyle_0 (copy), v64 (copy), v9 (copy), v63 (copy), l_SearchRetrievalStatus_0 (copy), l_EmptyState_0 (copy), v46 (copy), l_VisibilityControl_0 (copy), v47 (copy), v37 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), v8 (copy), l_Context_0 (copy)
    local l_topBarHeight_0 = v106.props.topBarHeight;
    local l_currentSearchType_0 = v106.state.currentSearchType;
    local l_searchUuid_0 = v106.searchInfoMap[l_currentSearchType_0].searchUuid;
    local l_searchParameters_0 = v106.searchInfoMap[l_currentSearchType_0].searchParameters;
    local l_useCreationCenterTitle_0 = v106.props.useCreationCenterTitle;
    local v113 = true;
    if l_currentSearchType_0 == l_SearchTypes_0.Catalog then
        v113 = false;
        l_topBarHeight_0 = 0;
    end;
    local l_l_topBarHeight_0_0 = l_topBarHeight_0;
    if v106.useSearchTypeSelector() then
        l_l_topBarHeight_0_0 = l_l_topBarHeight_0_0 + 43;
    end;
    local v115 = l_FFlagAppIaScrollAway_0 and v38.getScrollAwayEnabled() and 0 or v106.useSearchTypeSelector() and v106.getSearchPagePosition(true) or l_l_topBarHeight_0_0;
    local v116 = nil;
    if l_currentSearchType_0 == l_SearchTypes_0.Games and l_useCreationCenterTitle_0 then
        v116 = v107.creationCenter;
    elseif l_currentSearchType_0 == l_SearchTypes_0.Games then
        v116 = v107.chartsTitle;
    end;
    return l_withStyle_0(function(v117) --[[ Line: 456 ]]
        -- upvalues: l_currentSearchType_0 (copy), l_SearchTypes_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v38 (ref), v64 (ref), l_topBarHeight_0 (ref), v106 (copy), v9 (ref), v63 (ref), l_searchUuid_0 (copy), l_searchParameters_0 (copy), l_SearchRetrievalStatus_0 (ref), l_EmptyState_0 (ref), v107 (copy), l_l_topBarHeight_0_0 (ref), v113 (ref), v46 (ref), v116 (ref), l_VisibilityControl_0 (ref), v47 (ref), v37 (ref), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), v8 (ref), l_Context_0 (ref), v115 (copy)
        local l_Transparency_0 = v117.Theme.BackgroundDefault.Transparency;
        if l_currentSearchType_0 == l_SearchTypes_0.Catalog then
            l_Transparency_0 = 1;
        end;
        local v119 = nil;
        if l_FFlagAppIaScrollAway_0 and v38.getScrollAwayEnabled() and v64[l_currentSearchType_0] then
            v119 = l_topBarHeight_0;
            if v106.useSearchTypeSelector() then
                v119 = v119 + 43;
            end;
        end;
        local v120 = v9.createElement(v63[l_currentSearchType_0], {
            searchUuid = l_searchUuid_0, 
            omniSearchUuid = v106.props.omniSearchUuid, 
            searchParameters = l_searchParameters_0, 
            onScrollDirectionChanged = v106.useSearchTypeSelector() and v106.onScrollDirectionChanged or nil, 
            isRoutedFromAutoSearch = v106.state.isRoutedFromAutoSearch, 
            canvasTopPadding = v119
        });
        if l_currentSearchType_0 == l_SearchTypes_0.Auto and v106.props.autoTabSearchStatus == l_SearchRetrievalStatus_0.Failed then
            v120 = v9.createElement(l_EmptyState_0, {
                onActivated = v106.checkDispatchInitialOmniSearch, 
                text = v107.failedMessage
            });
        end;
        v106.searchComponents[l_currentSearchType_0] = v120;
        local v121 = {};
        for v122, v123 in pairs(v106.searchComponents) do
            v121[v122] = v9.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                Visible = v122 == l_currentSearchType_0
            }, {
                SearchComponent = v123
            });
        end;
        local v124 = l_FFlagAppIaScrollAway_0 and v38.getScrollAwayEnabled() and 0 or v106.useSearchTypeSelector() and v106.getSearchPageSizeOffset(true) or -l_l_topBarHeight_0_0;
        local v125 = v106.buildSearchTypeSelections(v107.topResults, v107.games, v107.players, l_searchParameters_0 ~= nil, v106.props.isTopPageEnabled);
        return v9.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            TopBar = if v113 then v9.createElement(v46.Container, {
                ZIndex = 3, 
                searchType = l_currentSearchType_0, 
                searchParameters = l_searchParameters_0, 
                titleText = v116, 
                leftItem = v46.BackButton, 
                rightItems = {
                    v46.SearchButton, 
                    v46.BuyRobuxButton, 
                    v46.NotificationsButton
                }
            }) else nil, 
            SearchTypeSelectorFrame = v106.useSearchTypeSelector() and v9.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 43), 
                Position = if l_FFlagAppIaScrollAway_0 and v38.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v126) --[[ Line: 533 ]]
                    -- upvalues: l_topBarHeight_0 (ref)
                    local v127 = v126 * (l_topBarHeight_0 + 43) - 43;
                    return UDim2.fromOffset(0, v127);
                end) else UDim2.new(0, 0, 0, v106.getSelectorFramePosition(true)), 
                BackgroundColor3 = v117.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = l_Transparency_0, 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                [v9.Ref] = v106.searchTypeSelectorFrameRef
            }, {
                Layout = v9.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 10)
                }), 
                SearchTypeSelector = v9.createElement(v47, {
                    selections = v125, 
                    activeSelection = l_currentSearchType_0, 
                    size = UDim2.new(1, 0, 0, 32), 
                    backgroundColor3 = v117.Theme.BackgroundDefault.Color, 
                    backgroundTransparency = l_Transparency_0, 
                    layoutOrder = 1, 
                    leftRightPadding = v37.getPageSideMargin(v106.props.screenSize.X), 
                    newDesignEnabled = v106.props.isTopPageEnabled or l_FFlagSearchTopResultsTabEnabledForAll_0
                }), 
                Divider = v9.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    LayoutOrder = 2, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v117.Theme.Divider.Color, 
                    BackgroundTransparency = v117.Theme.Divider.Transparency
                })
            }), 
            SearchTypeSelectionContextProvider = v8.createElement(l_Context_0.Provider, {
                value = {
                    selections = v125
                }
            }, {
                SearchPage = v9.createElement("Frame", {
                    BackgroundColor3 = v117.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = l_Transparency_0, 
                    ZIndex = 1, 
                    Position = UDim2.new(0, 0, 0, v115), 
                    Size = UDim2.new(1, 0, 1, v124), 
                    BorderSizePixel = v106.useSearchTypeSelector() and 0 or nil, 
                    [v9.Ref] = v106.useSearchTypeSelector() and v106.searchPageRef or nil
                }, v121)
            })
        });
    end);
end;
v71.render = function(v128) --[[ Line: 586 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        games = "CommonUI.Features.Label.Game", 
        players = "CommonUI.Features.Label.Players", 
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet", 
        chartsTitle = "CommonUI.Features.Label.Charts", 
        topResults = "Search.GlobalSearch.TopResultsLabel"
    })(function(v129) --[[ Line: 594 ]]
        -- upvalues: v128 (copy)
        return (v128:renderWithLocalized(v129));
    end);
end;
v71.didMount = function(v130) --[[ Line: 600 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), v38 (copy), v5 (copy)
    v130.isMounted = true;
    if not v130.useSearchTypeSelector() then
        return;
    else
        if not l_FFlagAppIaScrollAway_0 or not v38.getScrollAwayEnabled() then
            v130.motor = v5.createGroupMotor({
                searchTypeSelectorFramePosition = v130.getSelectorFramePosition(true), 
                searchPagePosition = v130.getSearchPagePosition(true), 
                searchPageSizeOffset = v130.getSearchPageSizeOffset(true)
            });
            v130.motor:onStep(function(v131) --[[ Line: 611 ]]
                -- upvalues: v130 (copy)
                if v130.searchTypeSelectorFrameRef.current then
                    v130.searchTypeSelectorFrameRef.current.Position = UDim2.new(0, 0, 0, v131.searchTypeSelectorFramePosition);
                end;
                local l_searchPagePosition_0 = v131.searchPagePosition;
                local l_searchPageSizeOffset_0 = v131.searchPageSizeOffset;
                v130.searchPageRef.current.Position = UDim2.new(0, 0, 0, l_searchPagePosition_0);
                v130.searchPageRef.current.Size = UDim2.new(1, 0, 1, l_searchPageSizeOffset_0);
            end);
            v130.motor:start();
        end;
        v130.checkDispatchInitialOmniSearch();
        return;
    end;
end;
v71.willUnmount = function(v134) --[[ Line: 629 ]] --[[ Name: willUnmount ]]
    v134.isMounted = false;
    if v134.motor then
        v134.motor:destroy();
    end;
end;
v71.didUpdate = function(v135, v136, _) --[[ Line: 636 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_SearchTypes_0 (copy), l_SearchSourceEvent_0 (copy)
    if v136.currentPage ~= v135.props.currentPage then
        v135.onPageChange(v136.currentPage);
    end;
    local l_currentSearchType_1 = v135.state.currentSearchType;
    if v135.props.searchType ~= l_currentSearchType_1 and l_currentSearchType_1 == l_SearchTypes_0.Auto then
        v135.updateSearchType(v135.props.searchType, l_SearchSourceEvent_0.AutoRouting);
    end;
end;
v71 = v10.connect(function(v139, v140) --[[ Line: 647 ]]
    -- upvalues: v59 (copy), l_SearchRetrievalStatus_0 (copy)
    local v141 = v139.Navigation.history[#v139.Navigation.history];
    local v142 = v139.SearchesParameters[v140.searchUuid];
    return {
        topBarHeight = v139.TopBar.topBarHeight, 
        searchParameters = v142, 
        searchType = v139.SearchesTypes[v140.searchUuid], 
        screenSize = v139.ScreenSize, 
        currentPage = v141[#v141], 
        currentRoute = v141, 
        autoTabSearchStatus = v142 and v59(v139, v142.searchKeyword) or l_SearchRetrievalStatus_0.NotStarted
    };
end, function(v143) --[[ Line: 662 ]]
    -- upvalues: v53 (copy), v54 (copy), v55 (copy), v58 (copy)
    return {
        openWebview = function(v144, v145) --[[ Line: 664 ]] --[[ Name: openWebview ]]
            -- upvalues: v143 (copy), v53 (ref)
            return v143(v53(v144, v145));
        end, 
        setSearchType = function(v146, v147) --[[ Line: 667 ]] --[[ Name: setSearchType ]]
            -- upvalues: v143 (copy), v54 (ref)
            return v143(v54(v146, v147));
        end, 
        setSearchParameters = function(v148, v149) --[[ Line: 670 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v143 (copy), v55 (ref)
            return v143(v55(v148, v149));
        end, 
        dispatchOmniSearchAutoFirstPage = function(v150, v151, v152, v153) --[[ Line: 673 ]] --[[ Name: dispatchOmniSearchAutoFirstPage ]]
            -- upvalues: v143 (copy), v58 (ref)
            return v143((v58(v150, {
                searchKeyword = v151, 
                searchUuid = v152, 
                omniSearchUuid = v153
            })));
        end
    };
end)(v71);
v71 = l_RoactServices_0.connect({
    eventIngest = l_AppEventIngestService_0, 
    sessionService = l_AppSessionService_0, 
    networking = l_RoactNetworking_0
})(v71);
local v156 = l_RoactAppPolicy_0.connect(function(v154, _) --[[ Line: 689 ]]
    return {
        useCreationCenterTitle = v154.getGamesPageCreationCenterTitle()
    };
end)(v71);
return function(v157) --[[ Line: 699 ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_useNavigationFocus_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_withGridConfig_DEPRECATED_0 (copy), l_LayoutConfig_0 (copy), v9 (copy), v156 (copy), v6 (copy)
    local v160 = l_useNavigationProps_0(function(v158, v159) --[[ Line: 700 ]]
        if v158 then
            return {
                searchUuid = v158, 
                omniSearchUuid = v159.omniSearchInfo and v159.omniSearchInfo.omniSearchUuid
            };
        else
            return {};
        end;
    end);
    local v161 = l_useNavigationFocus_0();
    local v162 = nil;
    if not l_FFlagSearchTopResultsTabEnabledForAll_0 then
        v162 = l_useUserExperiment_0({
            l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer
        }, function(v163) --[[ Line: 715 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            return (v163[l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer] or {}).isTopPageEnabled;
        end, false);
    end;
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v164) --[[ Line: 726 ]]
        -- upvalues: v9 (ref), v156 (ref), v6 (ref), v157 (copy), v161 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), v162 (ref), v160 (copy)
        return v9.createElement(v156, v6.Dictionary.join(v157, {
            gridConfig = v164, 
            isFocused = v161, 
            isTopPageEnabled = l_FFlagSearchTopResultsTabEnabledForAll_0 or v162
        }, v160));
    end);
end;