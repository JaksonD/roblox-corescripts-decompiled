local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v7 = require(l_CorePackages_0.Packages.Otter);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.RoactRodux);
local v13 = require(l_CorePackages_0.Packages.Promise);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local v17 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v17.Style.withStyle;
local l_withGridConfig_DEPRECATED_0 = v17.Core.Layout.Grid.withGridConfig_DEPRECATED;
local l_EmptyState_0 = v17.App.Indicator.EmptyState;
local v21 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_LayoutConfig_0 = v21.LayoutConfig;
local l_AppPage_0 = v21.AppPage;
local l_SearchTypes_0 = v21.SearchTypes;
local v25 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local l_reportPromiseLoadingTimeWrapper_0 = v25.Analytics.Timing.reportPromiseLoadingTimeWrapper;
local l_createDiagMetricString_0 = v25.Analytics.Formatters.createDiagMetricString;
local l_Diag_0 = v25.Analytics.DefaultAnalyticsService.Diag;
local l_EventStream_0 = v25.Analytics.DefaultAnalyticsService.EventStream;
local l_Enums_0 = v25.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local l_getDeepValue_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useNavigationFocus_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigationFocus;
local l_SearchSourceEvent_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).SearchSourceEvent;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v39 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local v40 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_VisibilityControl_0 = v40.VisibilityControl;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SearchRetrievalStatus_0 = l_Modules_0.LuaApp.Enum.SearchRetrievalStatus;
local l_Context_0 = l_Modules_0.LuaApp.Components.Search.SearchTypeSelection.Context;
local l_OmniSearchSessionUtil_0 = l_Modules_0.LuaApp.Analytics.Sessions.OmniSearchSessionUtil;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v47 = require(l_Modules_1.LuaApp.Enum.OmniSearchVerticalType);
local v48 = require(l_Modules_1.LuaApp.Components.TopBar.TopBar);
local v49 = require(l_Modules_1.LuaApp.Components.Search.ButtonStripSelector);
local v50 = require(l_Modules_1.LuaApp.Components.Search.GamesSearchPage);
local v51 = require(l_Modules_1.LuaApp.Components.UserSearch.Players.PlayerSearch);
local v52 = require(l_Modules_1.AvatarExperience.Catalog.Components.Search.CatalogSearch);
local v53 = require(l_Modules_1.LuaApp.Components.Search.TopResultsSearchPage.TopResultsSearchPage);
local v54 = require(l_Modules_1.LuaApp.Enum.ScrollMovementDirection);
local v55 = require(l_Modules_1.LuaApp.Thunks.OpenWebview);
local v56 = require(l_Modules_1.LuaApp.Actions.SetSearchType);
local v57 = require(l_Modules_1.LuaApp.Actions.SetSearchParameters);
local v58 = require(l_Modules_1.LuaApp.SearchUuid);
local v59 = require(l_Modules_1.LuaApp.Analytics.Events.search);
local v60 = require(l_Modules_1.LuaApp.Thunks.Search.ApiFetchOmniSearchAutoFirstPage);
local v61 = require(l_Modules_1.LuaApp.Thunks.Search.getAutoFetchingStatus);
local l_FFlagSearchTopResultsTabEnabledForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchTopResultsTabEnabledForAll;
local v63 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v63.FFlagAppIaScrollAway;
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = v63.FFlagLuaAppSearchPeopleUnifiedSchemaFields;
local l_FFlagLuaAppSearchStandardizeAssetCategorization_0 = v63.FFlagLuaAppSearchStandardizeAssetCategorization;
local v67 = {
    frequency = 3, 
    dampeningRatio = 0
};
local v68 = {
    [l_SearchTypes_0.Games] = v50, 
    [l_SearchTypes_0.Players] = v51, 
    [l_SearchTypes_0.Catalog] = v52, 
    [l_SearchTypes_0.TopResults] = v53, 
    [l_SearchTypes_0.Auto] = v17.App.Container.LoadingStatePage
};
local v69 = if l_FFlagAppIaScrollAway_0 then {
    [l_SearchTypes_0.Games] = true, 
    [l_SearchTypes_0.Players] = true, 
    [l_SearchTypes_0.TopResults] = true
} else nil;
local function v75(v70, v71, v72) --[[ Line: 106 ]] --[[ Name: fireAutoSearchLoadingTimeEvent ]]
    -- upvalues: l_SearchRetrievalStatus_0 (copy), l_getDeepValue_0 (copy), v47 (copy), l_Contexts_0 (copy), l_EventStream_0 (copy), l_EventTypes_0 (copy), l_createDiagMetricString_0 (copy), l_Diag_0 (copy)
    local v73 = nil;
    v73 = v71.status == l_SearchRetrievalStatus_0.Failed and "omniSearch" or if l_getDeepValue_0(v71, "result.responseBody.vertical") == v47.User then l_Contexts_0.PlayerSearch else "gameSearch";
    l_EventStream_0:sendEventDeferred(v73, l_EventTypes_0.LoadingTime, {
        isAutoSearchType = true, 
        status = v71.status, 
        loadingTime = v72
    });
    local v74 = l_createDiagMetricString_0(v70, v71) .. "_" .. v73;
    l_Diag_0:reportStats(v74, v72);
end;
local v76 = v11.PureComponent:extend("SearchPage");
v76.defaultProps = {
    searchType = l_SearchTypes_0.Games
};
v76.validateProps = v9.strictInterface({
    topBarHeight = v9.number, 
    searchParameters = v9.strictInterface({
        searchKeyword = v9.string, 
        isKeywordSuggestionEnabled = v9.boolean
    }), 
    searchType = v9.string, 
    screenSize = v9.Vector2, 
    currentPage = v9.table, 
    currentRoute = v9.table, 
    autoTabSearchStatus = v9.string, 
    openWebview = v9.callback, 
    setSearchType = v9.callback, 
    setSearchParameters = v9.callback, 
    dispatchOmniSearchAutoFirstPage = v9.callback, 
    eventIngest = v9.any, 
    sessionService = v9.any, 
    networking = v9.any, 
    useCreationCenterTitle = v9.boolean, 
    gridConfig = v9.table, 
    searchUuid = v9.optional(v9.string), 
    omniSearchUuid = v9.optional(v9.string), 
    isFocused = v9.boolean, 
    isTopPageEnabled = v9.optional(v9.boolean), 
    navigation = v9.any
});
v76.init = function(v77) --[[ Line: 168 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_SearchTypes_0 (copy), v39 (copy), v58 (copy), l_OmniSearchSessionUtil_0 (copy), v59 (copy), l_FFlagAppIaScrollAway_0 (copy), v40 (copy), l_AppPage_0 (copy), l_SearchSourceEvent_0 (copy), v54 (copy), v7 (copy), v67 (copy), l_LayoutConfig_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), v75 (copy), v13 (copy), l_memoize_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy)
    v77.isMounted = false;
    v77.searchTypeSelectorFrameRef = v11.createRef();
    v77.searchPageRef = v11.createRef();
    v77.searchComponents = {};
    local l_searchType_0 = v77.props.searchType;
    v77.searchInfoMap = {};
    v77.searchInfoMap[l_searchType_0] = {
        searchUuid = v77.props.searchUuid, 
        searchParameters = v77.props.searchParameters
    };
    v77.currentSearchType = l_searchType_0;
    v77.state = {
        currentSearchType = l_searchType_0, 
        isRoutedFromAutoSearch = l_searchType_0 == l_SearchTypes_0.Auto
    };
    v77.useSearchTypeSelector = function() --[[ Line: 187 ]]
        -- upvalues: v39 (ref), v77 (copy)
        return v39.isSearchTypeInOmniSearch(v77.state.currentSearchType);
    end;
    v77.updateSearchType = function(v79, v80) --[[ Line: 191 ]]
        -- upvalues: v77 (copy), l_SearchTypes_0 (ref), v58 (ref), l_OmniSearchSessionUtil_0 (ref), v59 (ref), l_FFlagAppIaScrollAway_0 (ref), v40 (ref)
        if v77.state.currentSearchType == v79 then
            return;
        elseif not v77.props.searchParameters then
            assert(false, "self.props.searchParameters should not be nil");
            return;
        else
            local l_searchKeyword_0 = v77.props.searchParameters.searchKeyword;
            local v82 = nil;
            if v77.searchInfoMap[v79] then
                v82 = v77.searchInfoMap[v79].searchUuid;
            else
                v82 = if v77.state.currentSearchType == l_SearchTypes_0.Auto and v77.searchInfoMap[l_SearchTypes_0.Auto] and v77.searchInfoMap[l_SearchTypes_0.Auto].searchUuid then v77.searchInfoMap[l_SearchTypes_0.Auto].searchUuid else v58();
                if v77.state.currentSearchType ~= l_SearchTypes_0.Auto and v79 ~= l_SearchTypes_0.Auto then
                    v77:setState({
                        isRoutedFromAutoSearch = false
                    });
                end;
                local v83 = {
                    searchKeyword = l_searchKeyword_0, 
                    isKeywordSuggestionEnabled = true
                };
                v77.searchInfoMap[v79] = {
                    searchUuid = v82, 
                    searchParameters = v83
                };
                v77.props.setSearchParameters(v82, v83);
                v77.props.setSearchType(v82, v79);
            end;
            l_OmniSearchSessionUtil_0.updateSearchType(v77.props.sessionService, v79, v82, v80);
            local v84 = v77.state.currentSearchType == l_SearchTypes_0.Auto;
            if v77.currentSearchType ~= v79 then
                local l_currentRoute_0 = v77.props.currentRoute;
                local v86 = if v84 then l_currentRoute_0[#l_currentRoute_0 - 1].name else v77.props.currentPage.name;
                v59(v77.props.eventIngest, v79, "search", l_searchKeyword_0, v84, v86);
            end;
            v77:setState({
                currentSearchType = v79
            });
            v77.currentSearchType = v79;
            if not l_FFlagAppIaScrollAway_0 or not v40.getScrollAwayEnabled() then
                v77.setTabBarVisible();
            end;
            return;
        end;
    end;
    v77.onPageChange = function(v87) --[[ Line: 254 ]]
        -- upvalues: v77 (copy), l_AppPage_0 (ref), l_OmniSearchSessionUtil_0 (ref), l_SearchSourceEvent_0 (ref)
        local l_currentPage_0 = v77.props.currentPage;
        if not l_currentPage_0 or not l_currentPage_0.name or l_currentPage_0.name ~= l_AppPage_0.SearchPage then
            return;
        elseif not v77.props.isFocused then
            return;
        else
            local l_sessionService_0 = v77.props.sessionService;
            local v90 = l_currentPage_0.extraProps and l_currentPage_0.extraProps.omniSearchInfo;
            if v90 then
                assert(v90.omniSearchUuid ~= nil);
                assert(v90.searchKeyword ~= nil);
                local l_omniSearchUuid_0 = v90.omniSearchUuid;
                local l_searchKeyword_1 = v90.searchKeyword;
                if v87 and v87.extraProps and v87.extraProps.omniSearchInfo and l_omniSearchUuid_0 == v87.extraProps.omniSearchInfo.omniSearchUuid then
                    return;
                else
                    local v93 = nil;
                    local v94 = v77.searchInfoMap[v77.state.currentSearchType];
                    if v94 then
                        v93 = v94.searchUuid;
                    end;
                    l_OmniSearchSessionUtil_0.create(l_sessionService_0, l_omniSearchUuid_0, l_searchKeyword_1, v77.state.currentSearchType, v93, l_SearchSourceEvent_0.NavBack);
                end;
            end;
            return;
        end;
    end;
    v77.onTopResultsSelected = function(v95) --[[ Line: 301 ]]
        -- upvalues: v77 (copy), l_SearchTypes_0 (ref)
        if not v77.isMounted then
            return;
        else
            v77.updateSearchType(l_SearchTypes_0.TopResults, v95);
            return;
        end;
    end;
    v77.onGamesSelected = function(v96) --[[ Line: 309 ]]
        -- upvalues: v77 (copy), l_SearchTypes_0 (ref)
        if not v77.isMounted then
            return;
        else
            v77.updateSearchType(l_SearchTypes_0.Games, v96);
            return;
        end;
    end;
    v77.onPlayersSelected = function(v97) --[[ Line: 316 ]]
        -- upvalues: v77 (copy), l_SearchTypes_0 (ref)
        if not v77.isMounted then
            return;
        else
            v77.updateSearchType(l_SearchTypes_0.Players, v97);
            return;
        end;
    end;
    if not l_FFlagAppIaScrollAway_0 or not v40.getScrollAwayEnabled() then
        v77.selectorVisible = true;
        v77.onScrollDirectionChanged = function(v98) --[[ Line: 325 ]]
            -- upvalues: v54 (ref), v77 (copy), v7 (ref), v67 (ref)
            local v99 = v98 == v54.Backward;
            if v99 ~= v77.selectorVisible then
                v77.selectorVisible = v99;
                v77.motor:setGoal({
                    searchTypeSelectorFramePosition = v7.spring(v77.getSelectorFramePosition(v99), v67), 
                    searchPagePosition = v7.spring(v77.getSearchPagePosition(v99), v67), 
                    searchPageSizeOffset = v7.spring(v77.getSearchPageSizeOffset(v99), v67)
                });
            end;
        end;
        v77.setTabBarVisible = function() --[[ Line: 340 ]]
            -- upvalues: v77 (copy), v7 (ref), v67 (ref)
            if not v77.selectorVisible then
                v77.selectorVisible = true;
                v77.motor:setGoal({
                    searchTypeSelectorFramePosition = v7.spring(v77.getSelectorFramePosition(v77.selectorVisible), v67), 
                    searchPagePosition = v7.spring(v77.getSearchPagePosition(v77.selectorVisible), v67), 
                    searchPageSizeOffset = v7.spring(v77.getSearchPageSizeOffset(v77.selectorVisible), v67)
                });
            end;
        end;
        v77.getSelectorFramePosition = function(v100) --[[ Line: 357 ]]
            -- upvalues: v77 (copy), l_LayoutConfig_0 (ref)
            local v101 = v77.props.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
            local v102 = v77.props.topBarHeight - v101;
            if not v100 then
                v102 = v102 - 43;
            end;
            return v102;
        end;
        v77.getSearchPagePosition = function(v103) --[[ Line: 368 ]]
            -- upvalues: v77 (copy)
            return v77.getSelectorFramePosition(v103) + 43 - 1;
        end;
        v77.getSearchPageSizeOffset = function(v104) --[[ Line: 373 ]]
            -- upvalues: v77 (copy)
            return -v77.getSearchPagePosition(v104);
        end;
    end;
    v77.checkDispatchInitialOmniSearch = function() --[[ Line: 378 ]]
        -- upvalues: l_searchType_0 (copy), l_SearchTypes_0 (ref), l_reportPromiseLoadingTimeWrapper_0 (ref), v77 (copy), v75 (ref), v13 (ref)
        if l_searchType_0 == l_SearchTypes_0.Auto then
            return l_reportPromiseLoadingTimeWrapper_0(v77.props.dispatchOmniSearchAutoFirstPage, function() --[[ Line: 382 ]]
                return {
                    fetch = "search_auto"
                };
            end, {
                fireEvent = v75
            })(v77.props.networking, v77.props.searchParameters.searchKeyword, v77.props.searchUuid, v77.props.omniSearchUuid);
        else
            return v13.resolve();
        end;
    end;
    v77.buildSearchTypeSelections = l_memoize_0(function(v105, v106, v107, v108, v109) --[[ Line: 398 ]]
        -- upvalues: l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), l_SearchTypes_0 (ref), v77 (copy)
        local v110 = {};
        if l_FFlagSearchTopResultsTabEnabledForAll_0 or v109 then
            table.insert(v110, {
                name = l_SearchTypes_0.TopResults, 
                text = v105, 
                onActivated = v77.onTopResultsSelected
            });
        end;
        table.insert(v110, {
            name = l_SearchTypes_0.Games, 
            text = v106, 
            onActivated = v77.onGamesSelected, 
            image = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v109 then nil else "LuaApp/icons/GameDetails/play"
        });
        if v108 then
            table.insert(v110, {
                name = l_SearchTypes_0.Players, 
                text = v107, 
                onActivated = v77.onPlayersSelected, 
                image = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v109 then nil else "LuaApp/icons/avatar_profile"
            });
        end;
        return v110;
    end);
end;
v76.renderWithLocalized = function(v111, v112) --[[ Line: 430 ]] --[[ Name: renderWithLocalized ]]
    -- upvalues: l_SearchTypes_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v40 (copy), l_withStyle_0 (copy), v69 (copy), v11 (copy), v68 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (copy), l_AppPage_0 (copy), l_SearchRetrievalStatus_0 (copy), l_EmptyState_0 (copy), v48 (copy), l_VisibilityControl_0 (copy), v49 (copy), v39 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), v10 (copy), l_Context_0 (copy)
    local l_topBarHeight_0 = v111.props.topBarHeight;
    local l_currentSearchType_0 = v111.state.currentSearchType;
    local l_searchUuid_0 = v111.searchInfoMap[l_currentSearchType_0].searchUuid;
    local l_searchParameters_0 = v111.searchInfoMap[l_currentSearchType_0].searchParameters;
    local l_useCreationCenterTitle_0 = v111.props.useCreationCenterTitle;
    local v118 = true;
    if l_currentSearchType_0 == l_SearchTypes_0.Catalog then
        v118 = false;
        l_topBarHeight_0 = 0;
    end;
    local l_l_topBarHeight_0_0 = l_topBarHeight_0;
    if v111.useSearchTypeSelector() then
        l_l_topBarHeight_0_0 = l_l_topBarHeight_0_0 + 43;
    end;
    local v120 = l_FFlagAppIaScrollAway_0 and v40.getScrollAwayEnabled() and 0 or v111.useSearchTypeSelector() and v111.getSearchPagePosition(true) or l_l_topBarHeight_0_0;
    local v121 = nil;
    if l_currentSearchType_0 == l_SearchTypes_0.Games and l_useCreationCenterTitle_0 then
        v121 = v112.creationCenter;
    elseif l_currentSearchType_0 == l_SearchTypes_0.Games then
        v121 = v112.chartsTitle;
    end;
    return l_withStyle_0(function(v122) --[[ Line: 460 ]]
        -- upvalues: l_currentSearchType_0 (copy), l_SearchTypes_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v40 (ref), v69 (ref), l_topBarHeight_0 (ref), v111 (copy), v11 (ref), v68 (ref), l_searchUuid_0 (copy), l_searchParameters_0 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (ref), l_AppPage_0 (ref), l_SearchRetrievalStatus_0 (ref), l_EmptyState_0 (ref), v112 (copy), l_l_topBarHeight_0_0 (ref), v118 (ref), v48 (ref), v121 (ref), l_VisibilityControl_0 (ref), v49 (ref), v39 (ref), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), v10 (ref), l_Context_0 (ref), v120 (copy)
        local l_Transparency_0 = v122.Theme.BackgroundDefault.Transparency;
        if l_currentSearchType_0 == l_SearchTypes_0.Catalog then
            l_Transparency_0 = 1;
        end;
        local v124 = nil;
        if l_FFlagAppIaScrollAway_0 and v40.getScrollAwayEnabled() and v69[l_currentSearchType_0] then
            v124 = l_topBarHeight_0;
            if v111.useSearchTypeSelector() then
                v124 = v124 + 43;
            end;
        end;
        local v125 = v11.createElement(v68[l_currentSearchType_0], {
            searchUuid = l_searchUuid_0, 
            omniSearchUuid = v111.props.omniSearchUuid, 
            searchParameters = l_searchParameters_0, 
            onScrollDirectionChanged = v111.useSearchTypeSelector() and v111.onScrollDirectionChanged or nil, 
            isRoutedFromAutoSearch = v111.state.isRoutedFromAutoSearch, 
            canvasTopPadding = v124, 
            appPage = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 and l_currentSearchType_0 == l_SearchTypes_0.Players then l_AppPage_0.SearchPage else nil
        });
        if l_currentSearchType_0 == l_SearchTypes_0.Auto and v111.props.autoTabSearchStatus == l_SearchRetrievalStatus_0.Failed then
            v125 = v11.createElement(l_EmptyState_0, {
                onActivated = v111.checkDispatchInitialOmniSearch, 
                text = v112.failedMessage
            });
        end;
        v111.searchComponents[l_currentSearchType_0] = v125;
        local v126 = {};
        for v127, v128 in pairs(v111.searchComponents) do
            v126[v127] = v11.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                Visible = v127 == l_currentSearchType_0
            }, {
                SearchComponent = v128
            });
        end;
        local v129 = l_FFlagAppIaScrollAway_0 and v40.getScrollAwayEnabled() and 0 or v111.useSearchTypeSelector() and v111.getSearchPageSizeOffset(true) or -l_l_topBarHeight_0_0;
        local v130 = v111.buildSearchTypeSelections(v112.topResults, v112.games, v112.players, l_searchParameters_0 ~= nil, v111.props.isTopPageEnabled);
        return v11.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            TopBar = if v118 then v11.createElement(v48.Container, {
                ZIndex = 3, 
                searchType = l_currentSearchType_0, 
                searchParameters = l_searchParameters_0, 
                titleText = v121, 
                leftItem = v48.BackButton, 
                rightItems = {
                    v48.SearchButton, 
                    v48.BuyRobuxButton, 
                    v48.NotificationsButton
                }
            }) else nil, 
            SearchTypeSelectorFrame = v111.useSearchTypeSelector() and v11.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 43), 
                Position = if l_FFlagAppIaScrollAway_0 and v40.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v131) --[[ Line: 540 ]]
                    -- upvalues: l_topBarHeight_0 (ref)
                    local v132 = v131 * (l_topBarHeight_0 + 43) - 43;
                    return UDim2.fromOffset(0, v132);
                end) else UDim2.new(0, 0, 0, v111.getSelectorFramePosition(true)), 
                BackgroundColor3 = v122.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = l_Transparency_0, 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                [v11.Ref] = v111.searchTypeSelectorFrameRef
            }, {
                Layout = v11.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 10)
                }), 
                SearchTypeSelector = v11.createElement(v49, {
                    selections = v130, 
                    activeSelection = l_currentSearchType_0, 
                    size = UDim2.new(1, 0, 0, 32), 
                    backgroundColor3 = v122.Theme.BackgroundDefault.Color, 
                    backgroundTransparency = l_Transparency_0, 
                    layoutOrder = 1, 
                    leftRightPadding = v39.getPageSideMargin(v111.props.screenSize.X), 
                    newDesignEnabled = v111.props.isTopPageEnabled or l_FFlagSearchTopResultsTabEnabledForAll_0
                }), 
                Divider = v11.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    LayoutOrder = 2, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v122.Theme.Divider.Color, 
                    BackgroundTransparency = v122.Theme.Divider.Transparency
                })
            }), 
            SearchTypeSelectionContextProvider = v10.createElement(l_Context_0.Provider, {
                value = {
                    selections = v130
                }
            }, {
                SearchPage = v11.createElement("Frame", {
                    BackgroundColor3 = v122.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = l_Transparency_0, 
                    ZIndex = 1, 
                    Position = UDim2.new(0, 0, 0, v120), 
                    Size = UDim2.new(1, 0, 1, v129), 
                    BorderSizePixel = v111.useSearchTypeSelector() and 0 or nil, 
                    [v11.Ref] = v111.useSearchTypeSelector() and v111.searchPageRef or nil
                }, v126)
            })
        });
    end);
end;
v76.render = function(v133) --[[ Line: 593 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_FFlagLuaAppSearchStandardizeAssetCategorization_0 (copy)
    return l_withLocalization_0({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        games = l_FFlagLuaAppSearchStandardizeAssetCategorization_0 and "CommonUI.Features.Label.Games" or "CommonUI.Features.Label.Game", 
        players = "CommonUI.Features.Label.Players", 
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet", 
        chartsTitle = "CommonUI.Features.Label.Charts", 
        topResults = "Search.GlobalSearch.TopResultsLabel"
    })(function(v134) --[[ Line: 603 ]]
        -- upvalues: v133 (copy)
        return (v133:renderWithLocalized(v134));
    end);
end;
v76.didMount = function(v135) --[[ Line: 609 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), v40 (copy), v7 (copy)
    v135.isMounted = true;
    if not v135.useSearchTypeSelector() then
        return;
    else
        if not l_FFlagAppIaScrollAway_0 or not v40.getScrollAwayEnabled() then
            v135.motor = v7.createGroupMotor({
                searchTypeSelectorFramePosition = v135.getSelectorFramePosition(true), 
                searchPagePosition = v135.getSearchPagePosition(true), 
                searchPageSizeOffset = v135.getSearchPageSizeOffset(true)
            });
            v135.motor:onStep(function(v136) --[[ Line: 620 ]]
                -- upvalues: v135 (copy)
                if v135.searchTypeSelectorFrameRef.current then
                    v135.searchTypeSelectorFrameRef.current.Position = UDim2.new(0, 0, 0, v136.searchTypeSelectorFramePosition);
                end;
                local l_searchPagePosition_0 = v136.searchPagePosition;
                local l_searchPageSizeOffset_0 = v136.searchPageSizeOffset;
                v135.searchPageRef.current.Position = UDim2.new(0, 0, 0, l_searchPagePosition_0);
                v135.searchPageRef.current.Size = UDim2.new(1, 0, 1, l_searchPageSizeOffset_0);
            end);
            v135.motor:start();
        end;
        v135.checkDispatchInitialOmniSearch();
        return;
    end;
end;
v76.willUnmount = function(v139) --[[ Line: 638 ]] --[[ Name: willUnmount ]]
    v139.isMounted = false;
    if v139.motor then
        v139.motor:destroy();
    end;
end;
v76.didUpdate = function(v140, v141, _) --[[ Line: 645 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_SearchTypes_0 (copy), l_SearchSourceEvent_0 (copy)
    if v141.currentPage ~= v140.props.currentPage then
        v140.onPageChange(v141.currentPage);
    end;
    local l_currentSearchType_1 = v140.state.currentSearchType;
    if v140.props.searchType ~= l_currentSearchType_1 and l_currentSearchType_1 == l_SearchTypes_0.Auto then
        v140.updateSearchType(v140.props.searchType, l_SearchSourceEvent_0.AutoRouting);
    end;
end;
v76 = v12.connect(function(v144, v145) --[[ Line: 656 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v61 (copy), l_SearchRetrievalStatus_0 (copy)
    local v146 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v144) else v144.Navigation.history[#v144.Navigation.history];
    local v147 = v144.SearchesParameters[v145.searchUuid];
    return {
        topBarHeight = v144.TopBar.topBarHeight, 
        searchParameters = v147, 
        searchType = v144.SearchesTypes[v145.searchUuid], 
        screenSize = v144.ScreenSize, 
        currentPage = v146[#v146], 
        currentRoute = v146, 
        autoTabSearchStatus = v147 and v61(v144, v147.searchKeyword) or l_SearchRetrievalStatus_0.NotStarted
    };
end, function(v148) --[[ Line: 673 ]]
    -- upvalues: v55 (copy), v56 (copy), v57 (copy), v60 (copy)
    return {
        openWebview = function(v149, v150) --[[ Line: 675 ]] --[[ Name: openWebview ]]
            -- upvalues: v148 (copy), v55 (ref)
            return v148(v55(v149, v150));
        end, 
        setSearchType = function(v151, v152) --[[ Line: 678 ]] --[[ Name: setSearchType ]]
            -- upvalues: v148 (copy), v56 (ref)
            return v148(v56(v151, v152));
        end, 
        setSearchParameters = function(v153, v154) --[[ Line: 681 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v148 (copy), v57 (ref)
            return v148(v57(v153, v154));
        end, 
        dispatchOmniSearchAutoFirstPage = function(v155, v156, v157, v158) --[[ Line: 684 ]] --[[ Name: dispatchOmniSearchAutoFirstPage ]]
            -- upvalues: v148 (copy), v60 (ref)
            return v148((v60(v155, {
                searchKeyword = v156, 
                searchUuid = v157, 
                omniSearchUuid = v158
            })));
        end
    };
end)(v76);
v76 = l_RoactServices_0.connect({
    eventIngest = l_AppEventIngestService_0, 
    sessionService = l_AppSessionService_0, 
    networking = l_RoactNetworking_0
})(v76);
local v161 = l_RoactAppPolicy_0.connect(function(v159, _) --[[ Line: 700 ]]
    return {
        useCreationCenterTitle = v159.getGamesPageCreationCenterTitle()
    };
end)(v76);
return function(v162) --[[ Line: 710 ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_useNavigationFocus_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_withGridConfig_DEPRECATED_0 (copy), l_LayoutConfig_0 (copy), v11 (copy), v161 (copy), v8 (copy)
    local v165 = l_useNavigationProps_0(function(v163, v164) --[[ Line: 711 ]]
        if v163 then
            return {
                searchUuid = v163, 
                omniSearchUuid = v164.omniSearchInfo and v164.omniSearchInfo.omniSearchUuid
            };
        else
            return {};
        end;
    end);
    local v166 = l_useNavigationFocus_0();
    local v167 = nil;
    if not l_FFlagSearchTopResultsTabEnabledForAll_0 then
        v167 = l_useUserExperiment_0({
            l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer
        }, function(v168) --[[ Line: 726 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            return (v168[l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer] or {}).isTopPageEnabled;
        end, false);
    end;
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v169) --[[ Line: 737 ]]
        -- upvalues: v11 (ref), v161 (ref), v8 (ref), v162 (copy), v166 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), v167 (ref), v165 (copy)
        return v11.createElement(v161, v8.Dictionary.join(v162, {
            gridConfig = v169, 
            isFocused = v166, 
            isTopPageEnabled = l_FFlagSearchTopResultsTabEnabledForAll_0 or v167
        }, v165));
    end);
end;