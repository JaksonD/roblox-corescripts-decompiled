local l_Workspace_0 = game:GetService("Workspace");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_TopicInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicInfosRodux).TopicInfosReducer;
local l_TopicContentsReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux).TopicContentsReducer;
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_withStyle_0 = v8.Style.withStyle;
local l_TooltipOrientation_0 = v8.App.Dialog.Enum.TooltipOrientation;
local v12 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_RoactNetworking_0 = v14.RoactNetworking;
local l_AppLogging_0 = v14.AppLogging;
local l_RoactAnalyticsCommonGameEvents_0 = v14.RoactAnalyticsCommonGameEvents;
local l_AppEventIngestService_0 = v14.AppEventIngestService;
local l_RoactAnalytics_0 = v14.RoactAnalytics;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v24 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_GameCollectionItemTypes_0 = require(l_CorePackages_0.Workspace.Packages.GameCollections).GameCollectionItemTypes;
local l_SendGameImpressions_0 = require(l_CorePackages_0.Workspace.Packages.GameCollections).SendGameImpressions;
local v29 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v29.Events.gamePlayIntent;
local l_sortDeeplinkFailureCounter_0 = v29.Events.sortDeeplinkFailureCounter;
local l_Context_0 = v29.Constants.Context;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useDeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceType;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_IconWithTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).IconWithTooltip;
local l_OpenInfoPeekView_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryRouting).OpenInfoPeekView;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v40 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_GameSortGroups_0 = v40.GameSortGroups;
local l_OmniFeedConstants_0 = v40.OmniFeedConstants;
local l_GameTileConstants_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameTileConstants;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_SduiSeeAllGrid_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).SduiSeeAllGrid;
local l_isSduiGameOmniFeedItem_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).isSduiGameOmniFeedItem;
local v48 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useAnimateScrollViewToSelection_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).useAnimateScrollViewToSelection;
local l_useLastInputMode_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMode;
local l_NavigateBack_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateBack;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_ApiFetchGamesInSort_0 = l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort;
local l_FetchDataWithErrorToasts_0 = l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts;
local l_ApiFetchOmniRecommendationsMetadata_0 = l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata;
local l_ApiFetchOmniRecommendations_0 = l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations;
local l_GameGridSelector_0 = l_Modules_0.LuaApp.Components.Games.GameGridSelector;
local l_ApiFetchGamesData_0 = l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesData;
local l_RefreshGameSorts_0 = l_Modules_0.LuaApp.Thunks.RefreshGameSorts;
local l_RefreshExpiringSortTokens_0 = l_Modules_0.LuaApp.Thunks.Games.RefreshExpiringSortTokens;
local v61 = require(l_CorePackages_0.Packages.SignalsReact);
local v62 = require(l_CorePackages_0.Workspace.Packages.CollectionViews);
local l_usePageSideMargin_0 = v62.usePageSideMargin;
local l_useCollectionLayout_0 = v62.useCollectionLayout;
local l_CompositionTags_0 = require(l_CorePackages_0.Workspace.Packages.AppComposition).CompositionTags;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v67 = require(l_Modules_1.LuaApp.Constants);
local v68 = require(l_Modules_1.LuaApp.FitChildren);
local v69 = require(l_Modules_1.LuaApp.Components.FitTextLabel);
local v70 = require(l_Modules_1.LuaApp.Components.Games.GamesDropDownList);
local v71 = require(l_Modules_1.LuaApp.Components.Games.GameCategoryTabGroup);
local v72 = require(l_Modules_1.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v73 = require(l_Modules_1.LuaApp.Actions.RefreshSiteAlertInfo);
local v74 = require(l_Modules_1.Personalization.PersonalizationTopBar);
local v75 = require(l_Modules_1.Personalization.Games.GameSeeAllImpressionsDetector);
local v76 = require(l_Modules_1.LuaApp.Flags.LuaAppGameTileConfig);
local v77 = require(l_Modules_1.Personalization.Flags.FFlagLuaAppRemoveSeeAllDropdown);
local v78 = require(l_Modules_1.Personalization.Flags.FFlagLuaAppRemoveSeeAllDropdownIXP);
local v79 = game:DefineFastFlag("LuaAppExplicitErrorOnWidthForSeeAll2", false);
local v80 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v80.FFlagAppIaScrollAway;
local l_FFlagLuaAppSortDeeplinkFix_0 = v80.FFlagLuaAppSortDeeplinkFix;
local l_FFlagLuaAppLayoutParamsInContext_0 = v80.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 = v80.FFlagLuaAppSduiSeeAllLayoutParamsFix;
local l_FFlagLuaAppLogOmniRecommendationsMetadata_0 = v80.FFlagLuaAppLogOmniRecommendationsMetadata;
local l_FFlagSduiServerCompat_0 = v80.FFlagSduiServerCompat;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = v80.FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagEnableLeftNavOnConsole_0 = v80.FFlagEnableLeftNavOnConsole;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = v80.FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppCompositionHome_0 = v80.FFlagLuaAppCompositionHome;
local l_FFlagLuaAppCompositionCharts_0 = v80.FFlagLuaAppCompositionCharts;
local l_FFlagLuaAppCompositionAlways_0 = v80.FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppCompositionSupport_0 = v80.FFlagLuaAppCompositionSupport;
local v94 = (not not l_FFlagLuaAppCompositionHome_0 or l_FFlagLuaAppCompositionCharts_0 or l_FFlagLuaAppCompositionAlways_0) and l_FFlagLuaAppCompositionSupport_0;
local l_GAME_GRID_PADDING_0 = v40.Constants.GAME_GRID_PADDING;
local l_SECTION_HEADER_HEIGHT_0 = v67.SECTION_HEADER_HEIGHT;
local v97 = {
    OMNI_HOME = {
        sortType = l_AppPage_0.Home, 
        isOmni = true
    }, 
    GAMES = {
        sortType = l_GameSortGroups_0.GamesList, 
        isOmni = false
    }
};
local v98 = {
    Dropdown = "Dropdown", 
    Tabs = "Tabs"
};
local v99 = v6.PureComponent:extend("GamesList");
v99.validateProps = v2.strictInterface({
    sortPageId = v2.optional(v2.string), 
    isOmni = v2.optional(v2.boolean), 
    initialSortIndex = v2.optional(v2.number), 
    initialSortName = v2.optional(v2.string), 
    pageContext = v2.string, 
    contentFrame = v2.optional(v2.Instance), 
    setContentFrame = v2.optional(v2.callback), 
    setScrollingFrame = v2.optional(v2.callback), 
    containerRef = if l_FFlagEnableLeftNavOnConsole_0 then v2.table else nil, 
    isScrollingEnabled = if l_FFlagEnableLeftNavOnConsole_0 then v2.boolean else nil, 
    topBarHeight = v2.number, 
    screenSize = v2.Vector2, 
    topicInfos = v2.table, 
    gameSortContents = v2.table, 
    sponsoredTooltipTitle = v2.string, 
    sponsoredTooltipBody = v2.string, 
    dispatchRefresh = v2.callback, 
    dispatchRefreshOmni = v2.callback, 
    dispatchRefreshSortContents = v2.callback, 
    dispatchLoadMoreGames = v2.callback, 
    dispatchLoadMoreGamesOmni = v2.callback, 
    dispatchFetchExpiringTokens = v2.callback, 
    onActivateTooltip = v2.callback, 
    navigateBack = v2.callback, 
    useCreationCenterTitle = v2.optional(v2.boolean), 
    useCategoryScrollList = v2.optional(v2.boolean), 
    deviceType = v2.string, 
    safeAreaPadding = v2.number, 
    safeAreaBottomPadding = v2.optional(v2.number), 
    gameGridSidePadding = v2.number, 
    stableContentWidth = if l_FFlagLuaAppCompositionSupport_0 then v2.optional(v2.number) else nil, 
    categorySelectorHeight = v2.optional(v2.number), 
    topBarCategoriesScrollerPadding = v2.optional(v2.number), 
    topBarCategoriesScrollerHeight = v2.optional(v2.number), 
    backgroundTransparency = v2.number, 
    hasTopBar = v2.boolean, 
    hideGameStatsIXP = v2.optional(v2.boolean), 
    hideDropdown = if v78 then v2.optional(v2.boolean) else nil, 
    navigation = v2.optional(v2.table), 
    screenProps = v2.optional(v2.table), 
    loggingProtocol = v2.table, 
    networking = v2.callback, 
    eventIngest = v2.table, 
    analytics = v2.table, 
    appAnalytics = v2.table
});
v99.init = function(v100) --[[ Line: 198 ]] --[[ Name: init ]]
    -- upvalues: l_Signal_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v6 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v79 (copy), l_Workspace_0 (copy), l_mutedError_0 (copy), l_isSduiGameOmniFeedItem_0 (copy), v97 (copy), l_OmniFeedConstants_0 (copy), v40 (copy), l_SendGameImpressions_0 (copy), l_gamePlayIntent_0 (copy), l_Context_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy)
    v100.isOmni = function() --[[ Line: 199 ]]
        -- upvalues: v100 (copy)
        return v100.state.selectedOmni;
    end;
    v100.gamesListViewChangedSignal = l_Signal_0.new();
    v100.containerRef = if l_FFlagEnableLeftNavOnConsole_0 then v100.props.containerRef else v6.createRef();
    v100.setContainerRef = function(v101) --[[ Line: 204 ]]
        -- upvalues: v100 (copy)
        v100.containerRef.current = v101;
        if v100.props.setScrollingFrame then
            v100.props.setScrollingFrame(v101);
        end;
    end;
    local l_screenSize_0 = v100.props.screenSize;
    local l_gameGridSidePadding_0 = v100.props.gameGridSidePadding;
    local v104 = if l_FFlagLuaAppCompositionSupport_0 and v100.props.stableContentWidth then v100.props.stableContentWidth else l_screenSize_0.X - 2 * l_gameGridSidePadding_0;
    if v104 < 0 then
        if v79 then
            if l_Workspace_0.CurrentCamera then
                local l_ViewportSize_0 = l_Workspace_0.CurrentCamera.ViewportSize;
                l_mutedError_0((("See All contentWidth should be positive. screenSize.X: %*; sidePadding: %*; Camera: (%*, %*)"):format(l_screenSize_0.X, l_gameGridSidePadding_0, l_ViewportSize_0.X, l_ViewportSize_0.Y)));
            else
                l_mutedError_0((("See All does not have a Workspace.CurrentCamera! screenSize.X: %*; sidePadding: %*"):format(l_screenSize_0.X, l_gameGridSidePadding_0)));
            end;
        end;
        v104 = 0;
    end;
    v100:setState({
        sortIndex = if v100.props.isOmni then v100.props.initialSortIndex else nil, 
        sortName = v100.props.initialSortName, 
        selectedOmni = v100.props.isOmni, 
        contentSize = Vector2.new(v104, l_screenSize_0.Y), 
        frameSize = l_screenSize_0
    });
    v100.getSelectedSort = function() --[[ Line: 242 ]]
        -- upvalues: v100 (copy)
        return v100.props.topicInfos[v100.state.sortName] or {};
    end;
    v100.getSelectedSortContents = function() --[[ Line: 246 ]]
        -- upvalues: v100 (copy)
        return v100.props.gameSortContents[v100.state.sortName];
    end;
    v100.getSelectedSortIdentifier = function() --[[ Line: 250 ]]
        -- upvalues: v100 (copy)
        return v100.state.sortName;
    end;
    v100.isSponsoredSort = function() --[[ Line: 254 ]]
        -- upvalues: v100 (copy)
        local v106 = v100.getSelectedSort();
        if v106 and v106:isSponsored() then
            return true;
        else
            return false;
        end;
    end;
    v100.isSdui = function() --[[ Line: 263 ]]
        -- upvalues: v100 (copy), l_isSduiGameOmniFeedItem_0 (ref)
        local v107 = v100.getSelectedSort();
        if v107 and l_isSduiGameOmniFeedItem_0(v107.treatmentType, v107.topicId) then
            return true;
        else
            return false;
        end;
    end;
    v100.refresh = function() --[[ Line: 271 ]]
        -- upvalues: v97 (ref), v100 (copy), l_OmniFeedConstants_0 (ref)
        local l_v97_0 = v97;
        return v100.isOmni() and v100.props.dispatchRefreshOmni(v100.props.networking, v100.props.omniRecommendationsRequest, l_v97_0.OMNI_HOME.sortType, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.ManualRefresh, v100.props.loggingProtocol) or v100.props.dispatchRefresh(v100.props.networking, v100.state.sortName, l_v97_0.GAMES.sortType);
    end;
    v100.loadMoreGames = function(v109) --[[ Line: 285 ]]
        -- upvalues: v40 (ref), v100 (copy), v97 (ref)
        local v110 = v109 or v40.Constants.DEFAULT_GAME_FETCH_COUNT;
        local l_dispatchLoadMoreGames_0 = v100.props.dispatchLoadMoreGames;
        local l_networking_0 = v100.props.networking;
        local v113 = v100.getSelectedSort();
        local v114 = v100.getSelectedSortContents();
        if v100.isOmni() then
            return v100.props.dispatchLoadMoreGamesOmni(l_networking_0, v97.OMNI_HOME.sortType, v100.state.sortIndex, v110, v100.props.loggingProtocol);
        elseif v114 then
            return l_dispatchLoadMoreGames_0(l_networking_0, v113, v114.rowsRequested, v110, v114.nextPageExclusiveStartId, v114.nextPageToken);
        else
            return;
        end;
    end;
    v100.switchToSort = function(v115, v116, v117) --[[ Line: 314 ]]
        -- upvalues: v100 (copy)
        if not v100.isMounted then
            return;
        else
            if v115.topicId ~= nil then
                v100.props.analytics.reportFilterChangeWithId(v115.topicId, nil, v117);
                v100:setState({
                    sortIndex = v116, 
                    selectedOmni = true, 
                    sortName = tostring(v115.topicId)
                });
            else
                v100.props.analytics.reportFilterChangeWithId(v115.gameSetTypeId, v115.gameSetTargetId, v117);
                v100:setState({
                    sortName = v115.name, 
                    selectedOmni = false
                });
            end;
            spawn(function() --[[ Line: 337 ]]
                -- upvalues: v100 (ref)
                if v100.isMounted then
                    v100:setState({
                        forceRender = nil
                    });
                end;
            end);
            return;
        end;
    end;
    v100.reportGameDetailOpened = function(v118) --[[ Line: 346 ]]
        -- upvalues: v100 (copy)
        local v119 = v100.getSelectedSort();
        local l_analytics_0 = v100.props.analytics;
        local v121 = nil;
        local v122 = v100.getSelectedSortContents();
        v121 = v122 and v122.entries or nil;
        if not v121 then
            return;
        else
            local v123 = v119 and v119.analyticsTypeId or nil;
            local v124 = #v121;
            local v125 = v121[v118];
            local l_placeId_0 = v125.placeId;
            local l_isSponsored_0 = v125.isSponsored;
            local l_adId_0 = v125.adId;
            local v129 = v119 and v119.gameSetTargetId;
            local l_universeId_0 = v125.universeId;
            local l_pageContext_0 = v100.props.pageContext;
            local v132 = v119 and v119.appliedFilters or nil;
            l_analytics_0.reportOpenGameDetailWithId(l_placeId_0, v123, v129, nil, v118, v124, l_isSponsored_0, l_adId_0, l_universeId_0, l_pageContext_0, v132);
            return;
        end;
    end;
    v100.sendGameImpressionsFromSdui = function(v133, v134, _, _, v137) --[[ Line: 383 ]]
        -- upvalues: v100 (copy)
        v100.sendGameImpressions(v133, v134, v137);
    end;
    v100.setLogSduiImpressions = function(v138) --[[ Line: 393 ]]
        -- upvalues: v100 (copy)
        v100:setState({
            logSduiImpressions = v138
        });
    end;
    v100.onCollectionViewabilityChanged = function() --[[ Line: 399 ]]
        -- upvalues: v100 (copy)
        v100.gamesListViewChangedSignal:fire();
    end;
    v100.sendGameImpressions = function(v139, v140, v141) --[[ Line: 403 ]]
        -- upvalues: v100 (copy), l_SendGameImpressions_0 (ref)
        local v142 = v100.getSelectedSortContents();
        if not v140 and not v142 then
            return;
        else
            local v143 = v100.getSelectedSort();
            if not v143 then
                return;
            else
                local l_analyticsTypeId_0 = v143.analyticsTypeId;
                local l_gameSetTargetId_0 = v143.gameSetTargetId;
                local v146 = nil;
                if not v100.isOmni() then
                    v146 = v100.props.sortPageId;
                end;
                local l_appliedFilters_0 = v143.appliedFilters;
                local l_pageContext_1 = v100.props.pageContext;
                l_SendGameImpressions_0.sendFromSeeAll(v100.props.eventIngest, v100.props.appAnalytics, v139, v140 or v142.entries, l_pageContext_1, l_analyticsTypeId_0, l_gameSetTargetId_0, v146, l_appliedFilters_0, v141);
                return;
            end;
        end;
    end;
    v100.onAbsoluteContentSizeChanged = function(v149) --[[ Line: 437 ]]
        -- upvalues: l_FFlagLuaAppCompositionSupport_0 (ref), v100 (copy)
        if l_FFlagLuaAppCompositionSupport_0 and v100.props.stableContentWidth then
            return;
        else
            if v100.isMounted and v149 then
                local l_AbsoluteContentSize_0 = v149.AbsoluteContentSize;
                if v100.state.contentSize == l_AbsoluteContentSize_0 then
                    return;
                elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                    v100:setState({
                        contentSize = l_AbsoluteContentSize_0
                    });
                end;
            end;
            return;
        end;
    end;
    v100.updateGamesInSort = function() --[[ Line: 455 ]]
        -- upvalues: v97 (ref), v100 (copy)
        local l_v97_1 = v97;
        v100.props.dispatchFetchExpiringTokens(v100.props.networking, l_v97_1.GAMES.sortType);
        local v152 = v100.getSelectedSortContents();
        local v153 = v152 and v152.entries and #v152.entries or nil;
        if v153 ~= nil and v153 == 0 then
            if v100.isOmni() then
                v100.loadMoreGames():catch(function() --[[ Line: 467 ]]
                    warn("Failed to load omni games");
                end);
                return;
            else
                v100.props.dispatchRefreshSortContents(v100.props.networking, v100.state.sortName);
            end;
        end;
    end;
    v100.reportExperienceLaunched = function(v154, v155) --[[ Line: 476 ]]
        -- upvalues: v100 (copy), l_gamePlayIntent_0 (ref), l_Context_0 (ref), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref)
        local v156 = v100.getSelectedSort();
        l_gamePlayIntent_0(v100.props.eventIngest, l_Context_0.ExperienceTile, {
            placeId = v154.placeId, 
            rootPlaceId = tonumber(v154.placeId), 
            universeId = v154.universeId, 
            sortIndex = tostring(v100.state.sortIndex), 
            sortEntryIndex = tostring(v154.index), 
            referralSource = v155, 
            gameSetTypeId = if v100.isOmni() then v156.topicId else v156.gameSetTypeId, 
            gameSetTargetId = if v100.isOmni() then nil else v156.gameSetTargetId, 
            appliedFilters = v156.appliedFilters, 
            nativeAdData = v154.adId, 
            pageName = v100.props.pageContext, 
            tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else nil
        });
    end;
    v100.onActivateTooltip = function() --[[ Line: 496 ]]
        -- upvalues: v100 (copy)
        if v100.isMounted and v100.isSponsoredSort() then
            v100.props.onActivateTooltip(v100.props.sponsoredTooltipTitle, v100.props.sponsoredTooltipBody);
        end;
    end;
end;
v99.renderWithLocalized = function(v157, v158) --[[ Line: 505 ]] --[[ Name: renderWithLocalized ]]
    -- upvalues: v76 (copy), v98 (copy), l_AppPage_0 (copy), v77 (copy), v78 (copy), l_SECTION_HEADER_HEIGHT_0 (copy), v97 (copy), l_withStyle_0 (copy), l_GameTileConstants_0 (copy), v6 (copy), l_IconWithTooltip_0 (copy), l_TooltipOrientation_0 (copy), v74 (copy), v94 (copy), l_CompositionTags_0 (copy), v7 (copy), v71 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v72 (copy), l_FFlagAppIaScrollAway_0 (copy), v48 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_GAME_GRID_PADDING_0 (copy), v70 (copy), v69 (copy), v68 (copy), l_SduiSeeAllGrid_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_GameGridSelector_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_Context_0 (copy), v75 (copy)
    local l_topBarHeight_0 = v157.props.topBarHeight;
    local v160 = v157.getSelectedSortIdentifier();
    local l_screenSize_1 = v157.props.screenSize;
    local l_frameSize_0 = v157.state.frameSize;
    local l_contentSize_0 = v157.state.contentSize;
    local v164 = v157.getSelectedSort();
    local v165 = v157.getSelectedSortContents();
    local l_useCreationCenterTitle_0 = v157.props.useCreationCenterTitle;
    local l_gameGridSidePadding_1 = v157.props.gameGridSidePadding;
    local v168 = v76.shouldHideGameStats(v157.props.pageContext, v157.props.hideGameStatsIXP);
    local v169 = if v157.props.useCategoryScrollList then v98.Tabs else v98.Dropdown;
    if not v160 then
        return nil;
    elseif not v165 then
        return nil;
    else
        local v170 = nil;
        if l_useCreationCenterTitle_0 then
            v170 = v158.creationCenter;
        elseif v157.props.pageContext == l_AppPage_0.Games then
            v170 = v158.chartsTitle;
        end;
        local v171 = v77 and (not v78 or v157.props.hideDropdown);
        local v172 = if v171 then nil else 38;
        local v173 = 12;
        local v174 = if v171 then v173 else v172 + v173;
        local v175 = v174 + l_SECTION_HEADER_HEIGHT_0 + 14;
        if v169 == v98.Tabs then
            v172 = 0;
            v173 = 0;
            l_topBarHeight_0 = v157.props.topBarCategoriesScrollerHeight;
        end;
        local l_v97_2 = v97;
        local v177 = false;
        local v178 = nil;
        v177 = v157.isSponsoredSort();
        v178 = v157.props.sponsoredTooltipBody;
        local v179 = v157.isSdui();
        return l_withStyle_0(function(v180) --[[ Line: 560 ]]
            -- upvalues: l_GameTileConstants_0 (ref), v6 (ref), v174 (copy), v164 (copy), l_IconWithTooltip_0 (ref), l_TooltipOrientation_0 (ref), v157 (copy), v178 (ref), v74 (ref), v170 (ref), v94 (ref), l_CompositionTags_0 (ref), v169 (copy), v98 (ref), v7 (ref), v71 (ref), l_v97_2 (copy), v160 (copy), l_FFlagEnableLeftNavOnConsole_0 (ref), l_gameGridSidePadding_1 (copy), v72 (ref), l_FFlagAppIaScrollAway_0 (ref), v48 (ref), l_topBarHeight_0 (ref), v165 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), l_GAME_GRID_PADDING_0 (ref), v175 (copy), v173 (ref), v171 (copy), v70 (ref), v172 (ref), v177 (ref), v69 (ref), v68 (ref), v179 (copy), l_SduiSeeAllGrid_0 (ref), l_FFlagSduiServerCompat_0 (ref), l_GameGridSelector_0 (ref), l_FFlagLuaAppCompositionSupport_0 (ref), l_frameSize_0 (copy), l_contentSize_0 (copy), l_screenSize_1 (copy), v168 (copy), l_Context_0 (ref), v75 (ref)
            local l_Footer_0 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
            local v182 = v6.createElement("Frame", {
                Name = "TitleWithTooltip", 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0, 0, 0, v174), 
                BackgroundTransparency = 1
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                Title = v6.createElement("TextLabel", {
                    Text = v164.displayName, 
                    Font = v180.Font.Header1.Font, 
                    TextSize = v180.Font.BaseSize * v180.Font.Header1.RelativeSize, 
                    TextColor3 = v180.Theme.TextEmphasis.Color, 
                    TextTransparency = v180.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    TextWrapped = true, 
                    LayoutOrder = 1
                }), 
                GamesListTooltip = v6.createElement(l_IconWithTooltip_0, {
                    tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                    onActivateTooltip = v157.onActivateTooltip, 
                    layoutOrder = 2, 
                    hoverText = v178, 
                    triggerPointName = "GamesListTooltip"
                })
            });
            return v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v157.props.backgroundTransparency, 
                BorderSizePixel = 0
            }, {
                TopBar = if v157.props.hasTopBar then v6.createElement(v74, {
                    titleText = v170, 
                    tag = if v94 then l_CompositionTags_0.ContentRegion.Header else nil, 
                    sideMarginOverride = v94 and 0 or nil
                }) else nil, 
                CategorySelectorScrollWrapper = if v169 == v98.Tabs then v6.createElement("Frame", {
                    [v7.Tag] = if v94 then l_CompositionTags_0.ContentRegion.Header else nil, 
                    Size = UDim2.new(1, 0, 0, v157.props.categorySelectorHeight), 
                    ZIndex = 2, 
                    BackgroundColor3 = v180.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v157.props.backgroundTransparency, 
                    Position = if v94 then nil else UDim2.fromOffset(0, v157.props.topBarCategoriesScrollerPadding)
                }, {
                    GameCategoryTabGroup = v6.createElement(v71, {
                        size = UDim2.new(1, 0, 0, v157.props.categorySelectorHeight), 
                        sortCategories = l_v97_2, 
                        selectedSortIndex = v157.state.sortIndex, 
                        selectedSortName = v160, 
                        onSelected = v157.switchToSort, 
                        padding = if v94 then {
                            left = 0, 
                            right = 0, 
                            top = 0, 
                            bottom = 0
                        } else if l_FFlagEnableLeftNavOnConsole_0 then {
                            left = l_gameGridSidePadding_1, 
                            right = l_gameGridSidePadding_1, 
                            top = 0, 
                            bottom = 0
                        } else {
                            left = v157.props.safeAreaPadding, 
                            right = v157.props.safeAreaPadding, 
                            top = 0, 
                            bottom = 0
                        }
                    })
                }) else nil, 
                Scroller = v6.createElement(v72, {
                    Position = if l_FFlagAppIaScrollAway_0 and v48.getScrollAwayEnabled() then UDim2.fromOffset(0, 0) else UDim2.new(0, 0, 0, l_topBarHeight_0), 
                    Size = if l_FFlagAppIaScrollAway_0 and v48.getScrollAwayEnabled() then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -l_topBarHeight_0), 
                    BackgroundTransparency = v157.props.backgroundTransparency, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    refresh = v157.refresh, 
                    onLoadMore = v165.hasMoreRows and v157.loadMoreGames, 
                    ScrollingEnabled = if l_FFlagEnableLeftNavOnConsole_0 then v157.props.isScrollingEnabled else nil, 
                    createEndOfScrollElement = not v165.hasMoreRows, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 and v48.getScrollAwayEnabled() then l_topBarHeight_0 else nil, 
                    canvasSidePadding = if l_FFlagLuaAppLayoutParamsInContext_0 then l_gameGridSidePadding_1 else nil, 
                    contentFrameRefCallback = if l_FFlagLuaAppLayoutParamsInContext_0 then v157.props.setContentFrame else nil, 
                    AutomaticCanvasSize = if l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 then Enum.AutomaticSize.Y else nil, 
                    onAbsoluteSizeChangedCallback = function(v183) --[[ Line: 671 ]] --[[ Name: onAbsoluteSizeChangedCallback ]]
                        -- upvalues: v157 (ref)
                        if v157.isMounted and v183 then
                            v157:setState({
                                frameSize = v183.AbsoluteSize
                            });
                        end;
                        v157.gamesListViewChangedSignal:fire();
                    end, 
                    onCanvasPositionChangedCallback = function() --[[ Line: 679 ]] --[[ Name: onCanvasPositionChangedCallback ]]
                        -- upvalues: v157 (ref)
                        v157.gamesListViewChangedSignal:fire();
                    end, 
                    shouldExtendIntoSafeArea = if l_FFlagExtendScrollingFramesBySafeInsets_0 then {
                        left = false, 
                        top = false, 
                        right = false, 
                        bottom = true
                    } else nil, 
                    contentTag = if v94 then l_CompositionTags_0.ContentRegion.Body else nil, 
                    [v6.Ref] = v157.setContainerRef
                }, {
                    Layout = v6.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        [v6.Change.AbsoluteContentSize] = v157.onAbsoluteContentSizeChanged
                    }), 
                    Padding = if v94 then nil else v6.createElement("UIPadding", {
                        PaddingLeft = if l_FFlagLuaAppLayoutParamsInContext_0 then nil else UDim.new(0, l_gameGridSidePadding_1), 
                        PaddingRight = if l_FFlagLuaAppLayoutParamsInContext_0 then nil else UDim.new(0, l_gameGridSidePadding_1), 
                        PaddingTop = UDim.new(0, l_GAME_GRID_PADDING_0)
                    }), 
                    PaddingTopSpacer = if v94 then v6.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, l_GAME_GRID_PADDING_0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 0
                    }) else nil, 
                    TopSection = if v169 == v98.Dropdown then v6.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, v175), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Padding = v6.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, v173)
                        }), 
                        DropDown = if v171 then nil else v6.createElement(v70, {
                            size = UDim2.new(1, 0, 0, v172), 
                            position = UDim2.new(0, 0, 0, 0), 
                            selectedSortName = v160, 
                            selectedSortIndex = v157.state.sortIndex, 
                            onSelected = v157.switchToSort, 
                            isOmni = v157.isOmni(), 
                            sortCategories = l_v97_2
                        }), 
                        Title = if v177 then v182 else v6.createElement(v69, {
                            Text = v164.displayName, 
                            Position = UDim2.new(0, 0, 0, v174), 
                            Font = v180.Font.Header1.Font, 
                            TextSize = v180.Font.BaseSize * v180.Font.Header1.RelativeSize, 
                            TextColor3 = v180.Theme.TextEmphasis.Color, 
                            TextTransparency = v180.Theme.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v68.FitAxis.Height, 
                            TextWrapped = true
                        })
                    }) else nil, 
                    ["GameGrid " .. v160] = if v179 then v7.createElement(l_SduiSeeAllGrid_0, {
                        appPage = v157.props.pageContext, 
                        verticalScrollingFrameRef = v157.containerRef, 
                        contentFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v157.props.contentFrame else nil, 
                        scrollViewPositionChangedSignal = v157.gamesListViewChangedSignal, 
                        collectionId = v157.state.sortName, 
                        collectionIndex = v157.state.sortIndex, 
                        LayoutOrder = not l_FFlagSduiServerCompat_0 and 2 or nil, 
                        layoutOrder = l_FFlagSduiServerCompat_0 and 2 or nil, 
                        impressionsTag = "GamesList", 
                        setLogImpressions = v157.setLogSduiImpressions, 
                        sendGameImpressions = v157.sendGameImpressionsFromSdui, 
                        onCollectionViewabilityChanged = v157.onCollectionViewabilityChanged
                    }) else v6.createElement(l_GameGridSelector_0, {
                        LayoutOrder = 2, 
                        entries = v165.entries, 
                        reportGameDetailOpened = v157.reportGameDetailOpened, 
                        windowSize = if l_FFlagLuaAppCompositionSupport_0 and v157.props.stableContentWidth then Vector2.new(v157.props.stableContentWidth, l_frameSize_0.Y) else Vector2.new(l_contentSize_0.X, l_frameSize_0.Y), 
                        screenSize = l_screenSize_1, 
                        hideGameStats = v168, 
                        currentSidePadding = l_gameGridSidePadding_1, 
                        impressionsTag = "GamesList", 
                        reportExperienceLaunched = v157.reportExperienceLaunched, 
                        launchExperienceEventContext = l_Context_0.ExperienceTile, 
                        playerCountStyle = l_Footer_0, 
                        appCompositionEnabled = v94 and true or nil
                    }), 
                    GameSeeAllImpressionsDetector = v6.createElement(v75, {
                        parentRef = v157.containerRef, 
                        impressionsTag = "GamesList", 
                        scrollViewPositionChangedSignal = v157.gamesListViewChangedSignal, 
                        sendGameImpressions = if v179 then v157.state.logSduiImpressions else v157.sendGameImpressions, 
                        gameSortId = v157.state.sortName
                    })
                }), 
                SafeAreaBottomPadding = if not v157.props.safeAreaBottomPadding or l_FFlagEnableLeftNavOnConsole_0 then nil else v6.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, v157.props.safeAreaBottomPadding)
                })
            });
        end);
    end;
end;
v99.render = function(v184) --[[ Line: 800 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        chartsTitle = "CommonUI.Features.Label.Charts"
    })(function(v185) --[[ Line: 804 ]]
        -- upvalues: v184 (copy)
        return v184:renderWithLocalized(v185);
    end);
end;
v99.didMount = function(v186) --[[ Line: 809 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagLuaAppSortDeeplinkFix_0 (copy), v97 (copy), l_default_0 (copy), l_sortDeeplinkFailureCounter_0 (copy)
    v186.isMounted = true;
    if not l_FFlagLuaAppSortDeeplinkFix_0 and v186.props.pageContext == "Deeplink" and not v186.props.gameSortContents[v186.state.sortName] then
        v186.props.dispatchFetchExpiringTokens(v186.props.networking, v97.GAMES.sortType):andThen(function() --[[ Line: 818 ]]
            -- upvalues: v186 (copy)
            if v186.isMounted then
                v186:setState({
                    missingSortLoadComplete = true
                });
            end;
        end, function(_) --[[ Line: 824 ]]
            -- upvalues: l_default_0 (ref), l_sortDeeplinkFailureCounter_0 (ref), v186 (copy)
            l_default_0:logRobloxTelemetryCounter(l_sortDeeplinkFailureCounter_0);
            v186.props.navigateBack();
        end);
        return;
    else
        v186.updateGamesInSort();
        return;
    end;
end;
v99.willUnmount = function(v188) --[[ Line: 833 ]] --[[ Name: willUnmount ]]
    v188.isMounted = false;
end;
v99.didUpdate = function(v189, v190, v191) --[[ Line: 837 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagLuaAppSortDeeplinkFix_0 (copy), l_default_0 (copy), l_sortDeeplinkFailureCounter_0 (copy)
    if v189.state.sortName ~= v191.sortName or not l_FFlagLuaAppSortDeeplinkFix_0 and not v190.gameSortContents[v189.state.sortName] and v189.props.gameSortContents[v189.state.sortName] then
        if not l_FFlagLuaAppSortDeeplinkFix_0 then
            task.spawn(function() --[[ Line: 847 ]]
                -- upvalues: v189 (copy)
                if v189.isMounted then
                    v189:setState({
                        missingSortLoadComplete = false
                    });
                end;
            end);
        end;
        v189.updateGamesInSort();
    end;
    if not l_FFlagLuaAppSortDeeplinkFix_0 and v189.state.missingSortLoadComplete and not v189.props.gameSortContents[v189.state.sortName] then
        l_default_0:logRobloxTelemetryCounter(l_sortDeeplinkFailureCounter_0);
        v189.props.navigateBack();
    end;
end;
local v218 = v12.connect(function(v192, _) --[[ Line: 867 ]]
    -- upvalues: l_TopicInfosReducer_0 (copy), l_TopicContentsReducer_0 (copy)
    return {
        topBarHeight = v192.TopBar.topBarHeight, 
        screenSize = v192.ScreenSize, 
        topicInfos = v192.Personalization[l_TopicInfosReducer_0.key], 
        gameSortContents = v192.Personalization[l_TopicContentsReducer_0.key]
    };
end, function(v194) --[[ Line: 874 ]]
    -- upvalues: v73 (copy), l_FetchDataWithErrorToasts_0 (copy), l_RefreshGameSorts_0 (copy), l_ApiFetchOmniRecommendations_0 (copy), l_ApiFetchGamesData_0 (copy), l_ApiFetchGamesInSort_0 (copy), l_ApiFetchOmniRecommendationsMetadata_0 (copy), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (copy), l_RefreshExpiringSortTokens_0 (copy), l_NavigateBack_0 (copy)
    return {
        dispatchRefresh = function(v195, v196, v197) --[[ Line: 876 ]] --[[ Name: dispatchRefresh ]]
            -- upvalues: v194 (copy), v73 (ref), l_FetchDataWithErrorToasts_0 (ref), l_RefreshGameSorts_0 (ref)
            v194(v73());
            return v194((l_FetchDataWithErrorToasts_0((l_RefreshGameSorts_0(v195, {
                v197
            }, v196, nil)))));
        end, 
        dispatchRefreshOmni = function(v198, v199, v200, v201, v202) --[[ Line: 882 ]] --[[ Name: dispatchRefreshOmni ]]
            -- upvalues: v194 (copy), v73 (ref), l_FetchDataWithErrorToasts_0 (ref), l_ApiFetchOmniRecommendations_0 (ref)
            v194(v73());
            return v194((l_FetchDataWithErrorToasts_0((l_ApiFetchOmniRecommendations_0(v198, v199, v200, nil, nil, v201, v202)))));
        end, 
        dispatchRefreshSortContents = function(v203, v204) --[[ Line: 904 ]] --[[ Name: dispatchRefreshSortContents ]]
            -- upvalues: v194 (copy), l_ApiFetchGamesData_0 (ref)
            return v194(l_ApiFetchGamesData_0(v203, nil, v204, nil, nil));
        end, 
        dispatchLoadMoreGames = function(v205, v206, v207, v208, v209, v210) --[[ Line: 907 ]] --[[ Name: dispatchLoadMoreGames ]]
            -- upvalues: v194 (copy), l_FetchDataWithErrorToasts_0 (ref), l_ApiFetchGamesInSort_0 (ref)
            return v194((l_FetchDataWithErrorToasts_0((l_ApiFetchGamesInSort_0(v205, v206, true, {
                startRows = v207, 
                maxRows = v208, 
                exclusiveStartId = v209, 
                pageToken = v210
            })))));
        end, 
        dispatchLoadMoreGamesOmni = function(v211, v212, v213, v214, v215) --[[ Line: 915 ]] --[[ Name: dispatchLoadMoreGamesOmni ]]
            -- upvalues: v194 (copy), l_FetchDataWithErrorToasts_0 (ref), l_ApiFetchOmniRecommendationsMetadata_0 (ref), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (ref)
            return v194((l_FetchDataWithErrorToasts_0((l_ApiFetchOmniRecommendationsMetadata_0(v211, v212, v213, v214, v215, l_FFlagLuaAppLogOmniRecommendationsMetadata_0 and "GamesList" or nil)))));
        end, 
        dispatchFetchExpiringTokens = function(v216, v217) --[[ Line: 929 ]] --[[ Name: dispatchFetchExpiringTokens ]]
            -- upvalues: v194 (copy), l_RefreshExpiringSortTokens_0 (ref)
            return v194((l_RefreshExpiringSortTokens_0(v216, {
                v217
            })));
        end, 
        navigateBack = function() --[[ Line: 932 ]] --[[ Name: navigateBack ]]
            -- upvalues: v194 (copy), l_NavigateBack_0 (ref)
            return v194(l_NavigateBack_0());
        end
    };
end)(v99);
v99 = v24.connectUserLayer({
    l_AppUserLayers_0.GameTileLayer, 
    l_AppUserLayers_0.PlayerAppSeeAllUXLayer
}, function(v219, _) --[[ Line: 1039 ]]
    -- upvalues: l_AppUserLayers_0 (copy), v78 (copy)
    local v221 = v219[l_AppUserLayers_0.GameTileLayer] or {};
    local v222 = v219[l_AppUserLayers_0.PlayerAppSeeAllUXLayer] or {};
    return {
        hideGameStatsIXP = v221.hideGameStats == "true", 
        hideDropdown = if v78 then v222.ShouldRemoveSeeAllDropdown else nil
    };
end)(function(v223) --[[ Line: 939 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDispatch_0 (copy), v7 (copy), l_OpenInfoPeekView_0 (copy), l_useDeviceType_0 (copy), l_useNavigationProps_0 (copy), l_useAppPolicy_0 (copy), l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_useCollectionLayout_0 (copy), v94 (copy), l_usePageSideMargin_0 (copy), v61 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_useLastInputMode_0 (copy), l_useAnimateScrollViewToSelection_0 (copy), v9 (copy), v6 (copy), v218 (copy)
    local v224 = l_useLocalization_0({
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic", 
        SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
    });
    local l_SponsoredDisclosure_0 = v224.SponsoredDisclosure;
    local l_SponsoredTitle_0 = v224.SponsoredTitle;
    local v227 = l_useDispatch_0();
    local v230 = v7.useCallback(function(v228, v229) --[[ Line: 947 ]]
        -- upvalues: v227 (copy), l_OpenInfoPeekView_0 (ref)
        v227(l_OpenInfoPeekView_0(v228, v229));
    end, {});
    local v231 = l_useDeviceType_0();
    local v235 = l_useNavigationProps_0(function(v232, v233) --[[ Line: 953 ]]
        local v234 = {
            sortPageId = v233.sortPageId, 
            pageContext = v233.pageContext, 
            initialSortName = v232
        };
        if v233.isOmni then
            v234.isOmni = true;
            v234.initialSortIndex = v233.sortIndex;
        end;
        return v234;
    end);
    local v237 = l_useAppPolicy_0(function(v236) --[[ Line: 968 ]]
        return v236.getGamesPageCreationCenterTitle();
    end);
    local v239 = l_useAppPolicy_0(function(v238) --[[ Line: 971 ]]
        return v238.getGameListCategoryScrollListEnabled();
    end);
    local v240 = l_useDesignTokens_0();
    local v241 = l_useUiModeInfo_0();
    local v242 = v241.uiMode ~= l_UiMode_0.TenFoot;
    local v243 = v241.uiMode == l_UiMode_0.TenFoot;
    local v244, v245 = v7.useState(nil);
    local v246 = nil;
    local v247 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        local v248 = l_useCollectionLayout_0();
        v246 = v94 and 0 or l_usePageSideMargin_0(v244);
        local v249 = v61.useSignalState(v248.getContainerWidth);
        v247 = if v94 then math.max(0, v249 - 2 * v248.margin) else nil;
    else
        v246 = l_usePageSideMargin_0(v244);
    end;
    local v250 = if v243 then v240.Global.Space_500 else nil;
    local v251 = nil;
    local v252 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v253, v254 = v7.useState(nil);
        v251 = v253;
        v252 = v254;
    end;
    local v255 = nil;
    local v256 = nil;
    if l_FFlagEnableLeftNavOnConsole_0 then
        v255 = v7.useRef(nil);
        v256 = l_useLastInputMode_0() == "Cursor";
        l_useAnimateScrollViewToSelection_0(v255, 0.4);
    end;
    local v257 = v9.Dictionary.join(v223, {
        deviceType = v231, 
        onActivateTooltip = v230, 
        sponsoredTooltipBody = l_SponsoredDisclosure_0, 
        sponsoredTooltipTitle = l_SponsoredTitle_0, 
        useCreationCenterTitle = v237, 
        useCategoryScrollList = v239, 
        categorySelectorHeight = v240.Global.Size_600, 
        topBarCategoriesScrollerHeight = v240.Global.Size_1000, 
        topBarCategoriesScrollerPadding = v240.Global.Space_200, 
        hasTopBar = v242, 
        backgroundTransparency = v240.LuaApps.SeeAll.BackgroundTransparency, 
        safeAreaPadding = v240.Global.Space_800, 
        gameGridSidePadding = v246, 
        stableContentWidth = if l_FFlagLuaAppCompositionSupport_0 then v247 else nil, 
        safeAreaBottomPadding = v250, 
        contentFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v251 else nil, 
        setContentFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v252 else nil, 
        setScrollingFrame = v245, 
        containerRef = if l_FFlagEnableLeftNavOnConsole_0 then v255 else nil, 
        isScrollingEnabled = if l_FFlagEnableLeftNavOnConsole_0 then v256 else nil
    }, v235);
    return v6.createElement(v218, v257);
end);
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0, 
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    appAnalytics = l_RoactAnalytics_0, 
    loggingProtocol = l_AppLogging_0
})(v99);