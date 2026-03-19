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
local v61 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v61.FFlagAppIaScrollAway;
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = v61.FFlagLuaAppSearchPeopleUnifiedSchemaFields;
local v64 = {
    frequency = 3, 
    dampeningRatio = 0
};
local v65 = {
    [l_SearchTypes_0.Games] = v48, 
    [l_SearchTypes_0.Players] = v49, 
    [l_SearchTypes_0.Catalog] = v50, 
    [l_SearchTypes_0.TopResults] = v51, 
    [l_SearchTypes_0.Auto] = v15.App.Container.LoadingStatePage
};
local v66 = if l_FFlagAppIaScrollAway_0 then {
    [l_SearchTypes_0.Games] = true, 
    [l_SearchTypes_0.Players] = true, 
    [l_SearchTypes_0.TopResults] = true
} else nil;
local function v72(v67, v68, v69) --[[ Line: 103 ]] --[[ Name: fireAutoSearchLoadingTimeEvent ]]
    -- upvalues: l_SearchRetrievalStatus_0 (copy), l_getDeepValue_0 (copy), v45 (copy), l_Contexts_0 (copy), l_EventStream_0 (copy), l_EventTypes_0 (copy), l_createDiagMetricString_0 (copy), l_Diag_0 (copy)
    local v70 = nil;
    v70 = v68.status == l_SearchRetrievalStatus_0.Failed and "omniSearch" or if l_getDeepValue_0(v68, "result.responseBody.vertical") == v45.User then l_Contexts_0.PlayerSearch else "gameSearch";
    l_EventStream_0:sendEventDeferred(v70, l_EventTypes_0.LoadingTime, {
        isAutoSearchType = true, 
        status = v68.status, 
        loadingTime = v69
    });
    local v71 = l_createDiagMetricString_0(v67, v68) .. "_" .. v70;
    l_Diag_0:reportStats(v71, v69);
end;
local v73 = v9.PureComponent:extend("SearchPage");
v73.defaultProps = {
    searchType = l_SearchTypes_0.Games
};
v73.validateProps = v7.strictInterface({
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
v73.init = function(v74) --[[ Line: 165 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_SearchTypes_0 (copy), v37 (copy), v56 (copy), l_OmniSearchSessionUtil_0 (copy), v57 (copy), l_FFlagAppIaScrollAway_0 (copy), v38 (copy), l_AppPage_0 (copy), l_SearchSourceEvent_0 (copy), v52 (copy), v5 (copy), v64 (copy), l_LayoutConfig_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), v72 (copy), v11 (copy), l_memoize_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy)
    v74.isMounted = false;
    v74.searchTypeSelectorFrameRef = v9.createRef();
    v74.searchPageRef = v9.createRef();
    v74.searchComponents = {};
    local l_searchType_0 = v74.props.searchType;
    v74.searchInfoMap = {};
    v74.searchInfoMap[l_searchType_0] = {
        searchUuid = v74.props.searchUuid, 
        searchParameters = v74.props.searchParameters
    };
    v74.currentSearchType = l_searchType_0;
    v74.state = {
        currentSearchType = l_searchType_0, 
        isRoutedFromAutoSearch = l_searchType_0 == l_SearchTypes_0.Auto
    };
    v74.useSearchTypeSelector = function() --[[ Line: 184 ]]
        -- upvalues: v37 (ref), v74 (copy)
        return v37.isSearchTypeInOmniSearch(v74.state.currentSearchType);
    end;
    v74.updateSearchType = function(v76, v77) --[[ Line: 188 ]]
        -- upvalues: v74 (copy), l_SearchTypes_0 (ref), v56 (ref), l_OmniSearchSessionUtil_0 (ref), v57 (ref), l_FFlagAppIaScrollAway_0 (ref), v38 (ref)
        if v74.state.currentSearchType == v76 then
            return;
        elseif not v74.props.searchParameters then
            assert(false, "self.props.searchParameters should not be nil");
            return;
        else
            local l_searchKeyword_0 = v74.props.searchParameters.searchKeyword;
            local v79 = nil;
            if v74.searchInfoMap[v76] then
                v79 = v74.searchInfoMap[v76].searchUuid;
            else
                v79 = if v74.state.currentSearchType == l_SearchTypes_0.Auto and v74.searchInfoMap[l_SearchTypes_0.Auto] and v74.searchInfoMap[l_SearchTypes_0.Auto].searchUuid then v74.searchInfoMap[l_SearchTypes_0.Auto].searchUuid else v56();
                if v74.state.currentSearchType ~= l_SearchTypes_0.Auto and v76 ~= l_SearchTypes_0.Auto then
                    v74:setState({
                        isRoutedFromAutoSearch = false
                    });
                end;
                local v80 = {
                    searchKeyword = l_searchKeyword_0, 
                    isKeywordSuggestionEnabled = true
                };
                v74.searchInfoMap[v76] = {
                    searchUuid = v79, 
                    searchParameters = v80
                };
                v74.props.setSearchParameters(v79, v80);
                v74.props.setSearchType(v79, v76);
            end;
            l_OmniSearchSessionUtil_0.updateSearchType(v74.props.sessionService, v76, v79, v77);
            local v81 = v74.state.currentSearchType == l_SearchTypes_0.Auto;
            if v74.currentSearchType ~= v76 then
                local l_currentRoute_0 = v74.props.currentRoute;
                local v83 = if v81 then l_currentRoute_0[#l_currentRoute_0 - 1].name else v74.props.currentPage.name;
                v57(v74.props.eventIngest, v76, "search", l_searchKeyword_0, v81, v83);
            end;
            v74:setState({
                currentSearchType = v76
            });
            v74.currentSearchType = v76;
            if not l_FFlagAppIaScrollAway_0 or not v38.getScrollAwayEnabled() then
                v74.setTabBarVisible();
            end;
            return;
        end;
    end;
    v74.onPageChange = function(v84) --[[ Line: 251 ]]
        -- upvalues: v74 (copy), l_AppPage_0 (ref), l_OmniSearchSessionUtil_0 (ref), l_SearchSourceEvent_0 (ref)
        local l_currentPage_0 = v74.props.currentPage;
        if not l_currentPage_0 or not l_currentPage_0.name or l_currentPage_0.name ~= l_AppPage_0.SearchPage then
            return;
        elseif not v74.props.isFocused then
            return;
        else
            local l_sessionService_0 = v74.props.sessionService;
            local v87 = l_currentPage_0.extraProps and l_currentPage_0.extraProps.omniSearchInfo;
            if v87 then
                assert(v87.omniSearchUuid ~= nil);
                assert(v87.searchKeyword ~= nil);
                local l_omniSearchUuid_0 = v87.omniSearchUuid;
                local l_searchKeyword_1 = v87.searchKeyword;
                if v84 and v84.extraProps and v84.extraProps.omniSearchInfo and l_omniSearchUuid_0 == v84.extraProps.omniSearchInfo.omniSearchUuid then
                    return;
                else
                    local v90 = nil;
                    local v91 = v74.searchInfoMap[v74.state.currentSearchType];
                    if v91 then
                        v90 = v91.searchUuid;
                    end;
                    l_OmniSearchSessionUtil_0.create(l_sessionService_0, l_omniSearchUuid_0, l_searchKeyword_1, v74.state.currentSearchType, v90, l_SearchSourceEvent_0.NavBack);
                end;
            end;
            return;
        end;
    end;
    v74.onTopResultsSelected = function(v92) --[[ Line: 298 ]]
        -- upvalues: v74 (copy), l_SearchTypes_0 (ref)
        if not v74.isMounted then
            return;
        else
            v74.updateSearchType(l_SearchTypes_0.TopResults, v92);
            return;
        end;
    end;
    v74.onGamesSelected = function(v93) --[[ Line: 306 ]]
        -- upvalues: v74 (copy), l_SearchTypes_0 (ref)
        if not v74.isMounted then
            return;
        else
            v74.updateSearchType(l_SearchTypes_0.Games, v93);
            return;
        end;
    end;
    v74.onPlayersSelected = function(v94) --[[ Line: 313 ]]
        -- upvalues: v74 (copy), l_SearchTypes_0 (ref)
        if not v74.isMounted then
            return;
        else
            v74.updateSearchType(l_SearchTypes_0.Players, v94);
            return;
        end;
    end;
    if not l_FFlagAppIaScrollAway_0 or not v38.getScrollAwayEnabled() then
        v74.selectorVisible = true;
        v74.onScrollDirectionChanged = function(v95) --[[ Line: 322 ]]
            -- upvalues: v52 (ref), v74 (copy), v5 (ref), v64 (ref)
            local v96 = v95 == v52.Backward;
            if v96 ~= v74.selectorVisible then
                v74.selectorVisible = v96;
                v74.motor:setGoal({
                    searchTypeSelectorFramePosition = v5.spring(v74.getSelectorFramePosition(v96), v64), 
                    searchPagePosition = v5.spring(v74.getSearchPagePosition(v96), v64), 
                    searchPageSizeOffset = v5.spring(v74.getSearchPageSizeOffset(v96), v64)
                });
            end;
        end;
        v74.setTabBarVisible = function() --[[ Line: 337 ]]
            -- upvalues: v74 (copy), v5 (ref), v64 (ref)
            if not v74.selectorVisible then
                v74.selectorVisible = true;
                v74.motor:setGoal({
                    searchTypeSelectorFramePosition = v5.spring(v74.getSelectorFramePosition(v74.selectorVisible), v64), 
                    searchPagePosition = v5.spring(v74.getSearchPagePosition(v74.selectorVisible), v64), 
                    searchPageSizeOffset = v5.spring(v74.getSearchPageSizeOffset(v74.selectorVisible), v64)
                });
            end;
        end;
        v74.getSelectorFramePosition = function(v97) --[[ Line: 354 ]]
            -- upvalues: v74 (copy), l_LayoutConfig_0 (ref)
            local v98 = v74.props.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
            local v99 = v74.props.topBarHeight - v98;
            if not v97 then
                v99 = v99 - 43;
            end;
            return v99;
        end;
        v74.getSearchPagePosition = function(v100) --[[ Line: 365 ]]
            -- upvalues: v74 (copy)
            return v74.getSelectorFramePosition(v100) + 43 - 1;
        end;
        v74.getSearchPageSizeOffset = function(v101) --[[ Line: 370 ]]
            -- upvalues: v74 (copy)
            return -v74.getSearchPagePosition(v101);
        end;
    end;
    v74.checkDispatchInitialOmniSearch = function() --[[ Line: 375 ]]
        -- upvalues: l_searchType_0 (copy), l_SearchTypes_0 (ref), l_reportPromiseLoadingTimeWrapper_0 (ref), v74 (copy), v72 (ref), v11 (ref)
        if l_searchType_0 == l_SearchTypes_0.Auto then
            return l_reportPromiseLoadingTimeWrapper_0(v74.props.dispatchOmniSearchAutoFirstPage, function() --[[ Line: 379 ]]
                return {
                    fetch = "search_auto"
                };
            end, {
                fireEvent = v72
            })(v74.props.networking, v74.props.searchParameters.searchKeyword, v74.props.searchUuid, v74.props.omniSearchUuid);
        else
            return v11.resolve();
        end;
    end;
    v74.buildSearchTypeSelections = l_memoize_0(function(v102, v103, v104, v105, v106) --[[ Line: 395 ]]
        -- upvalues: l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), l_SearchTypes_0 (ref), v74 (copy)
        local v107 = {};
        if l_FFlagSearchTopResultsTabEnabledForAll_0 or v106 then
            table.insert(v107, {
                name = l_SearchTypes_0.TopResults, 
                text = v102, 
                onActivated = v74.onTopResultsSelected
            });
        end;
        table.insert(v107, {
            name = l_SearchTypes_0.Games, 
            text = v103, 
            onActivated = v74.onGamesSelected, 
            image = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v106 then nil else "LuaApp/icons/GameDetails/play"
        });
        if v105 then
            table.insert(v107, {
                name = l_SearchTypes_0.Players, 
                text = v104, 
                onActivated = v74.onPlayersSelected, 
                image = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v106 then nil else "LuaApp/icons/avatar_profile"
            });
        end;
        return v107;
    end);
end;
v73.renderWithLocalized = function(v108, v109) --[[ Line: 427 ]] --[[ Name: renderWithLocalized ]]
    -- upvalues: l_SearchTypes_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v38 (copy), l_withStyle_0 (copy), v66 (copy), v9 (copy), v65 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (copy), l_AppPage_0 (copy), l_SearchRetrievalStatus_0 (copy), l_EmptyState_0 (copy), v46 (copy), l_VisibilityControl_0 (copy), v47 (copy), v37 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), v8 (copy), l_Context_0 (copy)
    local l_topBarHeight_0 = v108.props.topBarHeight;
    local l_currentSearchType_0 = v108.state.currentSearchType;
    local l_searchUuid_0 = v108.searchInfoMap[l_currentSearchType_0].searchUuid;
    local l_searchParameters_0 = v108.searchInfoMap[l_currentSearchType_0].searchParameters;
    local l_useCreationCenterTitle_0 = v108.props.useCreationCenterTitle;
    local v115 = true;
    if l_currentSearchType_0 == l_SearchTypes_0.Catalog then
        v115 = false;
        l_topBarHeight_0 = 0;
    end;
    local l_l_topBarHeight_0_0 = l_topBarHeight_0;
    if v108.useSearchTypeSelector() then
        l_l_topBarHeight_0_0 = l_l_topBarHeight_0_0 + 43;
    end;
    local v117 = l_FFlagAppIaScrollAway_0 and v38.getScrollAwayEnabled() and 0 or v108.useSearchTypeSelector() and v108.getSearchPagePosition(true) or l_l_topBarHeight_0_0;
    local v118 = nil;
    if l_currentSearchType_0 == l_SearchTypes_0.Games and l_useCreationCenterTitle_0 then
        v118 = v109.creationCenter;
    elseif l_currentSearchType_0 == l_SearchTypes_0.Games then
        v118 = v109.chartsTitle;
    end;
    return l_withStyle_0(function(v119) --[[ Line: 457 ]]
        -- upvalues: l_currentSearchType_0 (copy), l_SearchTypes_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v38 (ref), v66 (ref), l_topBarHeight_0 (ref), v108 (copy), v9 (ref), v65 (ref), l_searchUuid_0 (copy), l_searchParameters_0 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (ref), l_AppPage_0 (ref), l_SearchRetrievalStatus_0 (ref), l_EmptyState_0 (ref), v109 (copy), l_l_topBarHeight_0_0 (ref), v115 (ref), v46 (ref), v118 (ref), l_VisibilityControl_0 (ref), v47 (ref), v37 (ref), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), v8 (ref), l_Context_0 (ref), v117 (copy)
        local l_Transparency_0 = v119.Theme.BackgroundDefault.Transparency;
        if l_currentSearchType_0 == l_SearchTypes_0.Catalog then
            l_Transparency_0 = 1;
        end;
        local v121 = nil;
        if l_FFlagAppIaScrollAway_0 and v38.getScrollAwayEnabled() and v66[l_currentSearchType_0] then
            v121 = l_topBarHeight_0;
            if v108.useSearchTypeSelector() then
                v121 = v121 + 43;
            end;
        end;
        local v122 = v9.createElement(v65[l_currentSearchType_0], {
            searchUuid = l_searchUuid_0, 
            omniSearchUuid = v108.props.omniSearchUuid, 
            searchParameters = l_searchParameters_0, 
            onScrollDirectionChanged = v108.useSearchTypeSelector() and v108.onScrollDirectionChanged or nil, 
            isRoutedFromAutoSearch = v108.state.isRoutedFromAutoSearch, 
            canvasTopPadding = v121, 
            appPage = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 and l_currentSearchType_0 == l_SearchTypes_0.Players then l_AppPage_0.SearchPage else nil
        });
        if l_currentSearchType_0 == l_SearchTypes_0.Auto and v108.props.autoTabSearchStatus == l_SearchRetrievalStatus_0.Failed then
            v122 = v9.createElement(l_EmptyState_0, {
                onActivated = v108.checkDispatchInitialOmniSearch, 
                text = v109.failedMessage
            });
        end;
        v108.searchComponents[l_currentSearchType_0] = v122;
        local v123 = {};
        for v124, v125 in pairs(v108.searchComponents) do
            v123[v124] = v9.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                Visible = v124 == l_currentSearchType_0
            }, {
                SearchComponent = v125
            });
        end;
        local v126 = l_FFlagAppIaScrollAway_0 and v38.getScrollAwayEnabled() and 0 or v108.useSearchTypeSelector() and v108.getSearchPageSizeOffset(true) or -l_l_topBarHeight_0_0;
        local v127 = v108.buildSearchTypeSelections(v109.topResults, v109.games, v109.players, l_searchParameters_0 ~= nil, v108.props.isTopPageEnabled);
        return v9.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            TopBar = if v115 then v9.createElement(v46.Container, {
                ZIndex = 3, 
                searchType = l_currentSearchType_0, 
                searchParameters = l_searchParameters_0, 
                titleText = v118, 
                leftItem = v46.BackButton, 
                rightItems = {
                    v46.SearchButton, 
                    v46.BuyRobuxButton, 
                    v46.NotificationsButton
                }
            }) else nil, 
            SearchTypeSelectorFrame = v108.useSearchTypeSelector() and v9.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 43), 
                Position = if l_FFlagAppIaScrollAway_0 and v38.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v128) --[[ Line: 537 ]]
                    -- upvalues: l_topBarHeight_0 (ref)
                    local v129 = v128 * (l_topBarHeight_0 + 43) - 43;
                    return UDim2.fromOffset(0, v129);
                end) else UDim2.new(0, 0, 0, v108.getSelectorFramePosition(true)), 
                BackgroundColor3 = v119.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = l_Transparency_0, 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                [v9.Ref] = v108.searchTypeSelectorFrameRef
            }, {
                Layout = v9.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 10)
                }), 
                SearchTypeSelector = v9.createElement(v47, {
                    selections = v127, 
                    activeSelection = l_currentSearchType_0, 
                    size = UDim2.new(1, 0, 0, 32), 
                    backgroundColor3 = v119.Theme.BackgroundDefault.Color, 
                    backgroundTransparency = l_Transparency_0, 
                    layoutOrder = 1, 
                    leftRightPadding = v37.getPageSideMargin(v108.props.screenSize.X), 
                    newDesignEnabled = v108.props.isTopPageEnabled or l_FFlagSearchTopResultsTabEnabledForAll_0
                }), 
                Divider = v9.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    LayoutOrder = 2, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v119.Theme.Divider.Color, 
                    BackgroundTransparency = v119.Theme.Divider.Transparency
                })
            }), 
            SearchTypeSelectionContextProvider = v8.createElement(l_Context_0.Provider, {
                value = {
                    selections = v127
                }
            }, {
                SearchPage = v9.createElement("Frame", {
                    BackgroundColor3 = v119.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = l_Transparency_0, 
                    ZIndex = 1, 
                    Position = UDim2.new(0, 0, 0, v117), 
                    Size = UDim2.new(1, 0, 1, v126), 
                    BorderSizePixel = v108.useSearchTypeSelector() and 0 or nil, 
                    [v9.Ref] = v108.useSearchTypeSelector() and v108.searchPageRef or nil
                }, v123)
            })
        });
    end);
end;
v73.render = function(v130) --[[ Line: 590 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        games = "CommonUI.Features.Label.Game", 
        players = "CommonUI.Features.Label.Players", 
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet", 
        chartsTitle = "CommonUI.Features.Label.Charts", 
        topResults = "Search.GlobalSearch.TopResultsLabel"
    })(function(v131) --[[ Line: 598 ]]
        -- upvalues: v130 (copy)
        return (v130:renderWithLocalized(v131));
    end);
end;
v73.didMount = function(v132) --[[ Line: 604 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), v38 (copy), v5 (copy)
    v132.isMounted = true;
    if not v132.useSearchTypeSelector() then
        return;
    else
        if not l_FFlagAppIaScrollAway_0 or not v38.getScrollAwayEnabled() then
            v132.motor = v5.createGroupMotor({
                searchTypeSelectorFramePosition = v132.getSelectorFramePosition(true), 
                searchPagePosition = v132.getSearchPagePosition(true), 
                searchPageSizeOffset = v132.getSearchPageSizeOffset(true)
            });
            v132.motor:onStep(function(v133) --[[ Line: 615 ]]
                -- upvalues: v132 (copy)
                if v132.searchTypeSelectorFrameRef.current then
                    v132.searchTypeSelectorFrameRef.current.Position = UDim2.new(0, 0, 0, v133.searchTypeSelectorFramePosition);
                end;
                local l_searchPagePosition_0 = v133.searchPagePosition;
                local l_searchPageSizeOffset_0 = v133.searchPageSizeOffset;
                v132.searchPageRef.current.Position = UDim2.new(0, 0, 0, l_searchPagePosition_0);
                v132.searchPageRef.current.Size = UDim2.new(1, 0, 1, l_searchPageSizeOffset_0);
            end);
            v132.motor:start();
        end;
        v132.checkDispatchInitialOmniSearch();
        return;
    end;
end;
v73.willUnmount = function(v136) --[[ Line: 633 ]] --[[ Name: willUnmount ]]
    v136.isMounted = false;
    if v136.motor then
        v136.motor:destroy();
    end;
end;
v73.didUpdate = function(v137, v138, _) --[[ Line: 640 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_SearchTypes_0 (copy), l_SearchSourceEvent_0 (copy)
    if v138.currentPage ~= v137.props.currentPage then
        v137.onPageChange(v138.currentPage);
    end;
    local l_currentSearchType_1 = v137.state.currentSearchType;
    if v137.props.searchType ~= l_currentSearchType_1 and l_currentSearchType_1 == l_SearchTypes_0.Auto then
        v137.updateSearchType(v137.props.searchType, l_SearchSourceEvent_0.AutoRouting);
    end;
end;
v73 = v10.connect(function(v141, v142) --[[ Line: 651 ]]
    -- upvalues: v59 (copy), l_SearchRetrievalStatus_0 (copy)
    local v143 = v141.Navigation.history[#v141.Navigation.history];
    local v144 = v141.SearchesParameters[v142.searchUuid];
    return {
        topBarHeight = v141.TopBar.topBarHeight, 
        searchParameters = v144, 
        searchType = v141.SearchesTypes[v142.searchUuid], 
        screenSize = v141.ScreenSize, 
        currentPage = v143[#v143], 
        currentRoute = v143, 
        autoTabSearchStatus = v144 and v59(v141, v144.searchKeyword) or l_SearchRetrievalStatus_0.NotStarted
    };
end, function(v145) --[[ Line: 666 ]]
    -- upvalues: v53 (copy), v54 (copy), v55 (copy), v58 (copy)
    return {
        openWebview = function(v146, v147) --[[ Line: 668 ]] --[[ Name: openWebview ]]
            -- upvalues: v145 (copy), v53 (ref)
            return v145(v53(v146, v147));
        end, 
        setSearchType = function(v148, v149) --[[ Line: 671 ]] --[[ Name: setSearchType ]]
            -- upvalues: v145 (copy), v54 (ref)
            return v145(v54(v148, v149));
        end, 
        setSearchParameters = function(v150, v151) --[[ Line: 674 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v145 (copy), v55 (ref)
            return v145(v55(v150, v151));
        end, 
        dispatchOmniSearchAutoFirstPage = function(v152, v153, v154, v155) --[[ Line: 677 ]] --[[ Name: dispatchOmniSearchAutoFirstPage ]]
            -- upvalues: v145 (copy), v58 (ref)
            return v145((v58(v152, {
                searchKeyword = v153, 
                searchUuid = v154, 
                omniSearchUuid = v155
            })));
        end
    };
end)(v73);
v73 = l_RoactServices_0.connect({
    eventIngest = l_AppEventIngestService_0, 
    sessionService = l_AppSessionService_0, 
    networking = l_RoactNetworking_0
})(v73);
local v158 = l_RoactAppPolicy_0.connect(function(v156, _) --[[ Line: 693 ]]
    return {
        useCreationCenterTitle = v156.getGamesPageCreationCenterTitle()
    };
end)(v73);
return function(v159) --[[ Line: 703 ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_useNavigationFocus_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_withGridConfig_DEPRECATED_0 (copy), l_LayoutConfig_0 (copy), v9 (copy), v158 (copy), v6 (copy)
    local v162 = l_useNavigationProps_0(function(v160, v161) --[[ Line: 704 ]]
        if v160 then
            return {
                searchUuid = v160, 
                omniSearchUuid = v161.omniSearchInfo and v161.omniSearchInfo.omniSearchUuid
            };
        else
            return {};
        end;
    end);
    local v163 = l_useNavigationFocus_0();
    local v164 = nil;
    if not l_FFlagSearchTopResultsTabEnabledForAll_0 then
        v164 = l_useUserExperiment_0({
            l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer
        }, function(v165) --[[ Line: 719 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            return (v165[l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer] or {}).isTopPageEnabled;
        end, false);
    end;
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v166) --[[ Line: 730 ]]
        -- upvalues: v9 (ref), v158 (ref), v6 (ref), v159 (copy), v163 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), v164 (ref), v162 (copy)
        return v9.createElement(v158, v6.Dictionary.join(v159, {
            gridConfig = v166, 
            isFocused = v163, 
            isTopPageEnabled = l_FFlagSearchTopResultsTabEnabledForAll_0 or v164
        }, v162));
    end);
end;