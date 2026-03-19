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
local l_SendGameImpressions_0 = require(l_CorePackages_0.Workspace.Packages.GameCollections).SendGameImpressions;
local v28 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v28.Events.gamePlayIntent;
local l_sortDeeplinkFailureCounter_0 = v28.Events.sortDeeplinkFailureCounter;
local l_Context_0 = v28.Constants.Context;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useDeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceType;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_IconWithTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).IconWithTooltip;
local l_OpenInfoPeekView_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryRouting).OpenInfoPeekView;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v39 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_GameSortGroups_0 = v39.GameSortGroups;
local l_OmniFeedConstants_0 = v39.OmniFeedConstants;
local l_GameTileConstants_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameTileConstants;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_SduiSeeAllGrid_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).SduiSeeAllGrid;
local l_isSduiGameOmniFeedItem_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).isSduiGameOmniFeedItem;
local v47 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
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
local l_usePageSideMargin_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).usePageSideMargin;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v62 = require(l_Modules_1.LuaApp.Constants);
local v63 = require(l_Modules_1.LuaApp.FitChildren);
local v64 = require(l_Modules_1.LuaApp.Components.FitTextLabel);
local v65 = require(l_Modules_1.LuaApp.Components.Games.GamesDropDownList);
local v66 = require(l_Modules_1.LuaApp.Components.Games.GameCategoryTabGroup);
local v67 = require(l_Modules_1.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v68 = require(l_Modules_1.LuaApp.Actions.RefreshSiteAlertInfo);
local v69 = require(l_Modules_1.Personalization.PersonalizationTopBar);
local v70 = require(l_Modules_1.Personalization.Games.GameSeeAllImpressionsDetector);
local v71 = require(l_Modules_1.LuaApp.Flags.LuaAppGameTileConfig);
local v72 = require(l_Modules_1.Personalization.Flags.FFlagLuaAppRemoveSeeAllDropdown);
local v73 = require(l_Modules_1.Personalization.Flags.FFlagLuaAppRemoveSeeAllDropdownIXP);
local v74 = game:DefineFastFlag("LuaAppExplicitErrorOnWidthForSeeAll2", false);
local v75 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v75.FFlagAppIaScrollAway;
local l_FFlagLuaAppSortDeeplinkFix_0 = v75.FFlagLuaAppSortDeeplinkFix;
local l_FFlagLuaAppLayoutParamsInContext_0 = v75.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 = v75.FFlagLuaAppSduiSeeAllLayoutParamsFix;
local l_FFlagLuaAppLogOmniRecommendationsMetadata_0 = v75.FFlagLuaAppLogOmniRecommendationsMetadata;
local l_FFlagSduiServerCompat_0 = v75.FFlagSduiServerCompat;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = v75.FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagEnableLeftNavOnConsole_0 = v75.FFlagEnableLeftNavOnConsole;
local l_GAME_GRID_PADDING_0 = v39.Constants.GAME_GRID_PADDING;
local l_SECTION_HEADER_HEIGHT_0 = v62.SECTION_HEADER_HEIGHT;
local v86 = {
    OMNI_HOME = {
        sortType = l_AppPage_0.Home, 
        isOmni = true
    }, 
    GAMES = {
        sortType = l_GameSortGroups_0.GamesList, 
        isOmni = false
    }
};
local v87 = {
    Dropdown = "Dropdown", 
    Tabs = "Tabs"
};
local v88 = v6.PureComponent:extend("GamesList");
v88.validateProps = v2.strictInterface({
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
    categorySelectorHeight = v2.optional(v2.number), 
    topBarCategoriesScrollerPadding = v2.optional(v2.number), 
    topBarCategoriesScrollerHeight = v2.optional(v2.number), 
    backgroundTransparency = v2.number, 
    hasTopBar = v2.boolean, 
    hideGameStatsIXP = v2.optional(v2.boolean), 
    hideDropdown = if v73 then v2.optional(v2.boolean) else nil, 
    navigation = v2.optional(v2.table), 
    screenProps = v2.optional(v2.table), 
    loggingProtocol = v2.table, 
    networking = v2.callback, 
    eventIngest = v2.table, 
    analytics = v2.table, 
    appAnalytics = v2.table
});
v88.init = function(v89) --[[ Line: 182 ]] --[[ Name: init ]]
    -- upvalues: l_Signal_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v6 (copy), v74 (copy), l_Workspace_0 (copy), l_mutedError_0 (copy), l_isSduiGameOmniFeedItem_0 (copy), v86 (copy), l_OmniFeedConstants_0 (copy), v39 (copy), l_SendGameImpressions_0 (copy), l_gamePlayIntent_0 (copy), l_Context_0 (copy)
    v89.isOmni = function() --[[ Line: 183 ]]
        -- upvalues: v89 (copy)
        return v89.state.selectedOmni;
    end;
    v89.gamesListViewChangedSignal = l_Signal_0.new();
    v89.containerRef = if l_FFlagEnableLeftNavOnConsole_0 then v89.props.containerRef else v6.createRef();
    v89.setContainerRef = function(v90) --[[ Line: 188 ]]
        -- upvalues: v89 (copy)
        v89.containerRef.current = v90;
        if v89.props.setScrollingFrame then
            v89.props.setScrollingFrame(v90);
        end;
    end;
    local l_screenSize_0 = v89.props.screenSize;
    local l_gameGridSidePadding_0 = v89.props.gameGridSidePadding;
    local v93 = l_screenSize_0.X - 2 * l_gameGridSidePadding_0;
    if v93 < 0 then
        if v74 then
            if l_Workspace_0.CurrentCamera then
                local l_ViewportSize_0 = l_Workspace_0.CurrentCamera.ViewportSize;
                l_mutedError_0((("See All contentWidth should be positive. screenSize.X: %*; sidePadding: %*; Camera: (%*, %*)"):format(l_screenSize_0.X, l_gameGridSidePadding_0, l_ViewportSize_0.X, l_ViewportSize_0.Y)));
            else
                l_mutedError_0((("See All does not have a Workspace.CurrentCamera! screenSize.X: %*; sidePadding: %*"):format(l_screenSize_0.X, l_gameGridSidePadding_0)));
            end;
        end;
        v93 = 0;
    end;
    v89:setState({
        sortIndex = if v89.props.isOmni then v89.props.initialSortIndex else nil, 
        sortName = v89.props.initialSortName, 
        selectedOmni = v89.props.isOmni, 
        contentSize = Vector2.new(v93, l_screenSize_0.Y), 
        frameSize = l_screenSize_0
    });
    v89.getSelectedSort = function() --[[ Line: 225 ]]
        -- upvalues: v89 (copy)
        return v89.props.topicInfos[v89.state.sortName] or {};
    end;
    v89.getSelectedSortContents = function() --[[ Line: 229 ]]
        -- upvalues: v89 (copy)
        return v89.props.gameSortContents[v89.state.sortName];
    end;
    v89.getSelectedSortIdentifier = function() --[[ Line: 233 ]]
        -- upvalues: v89 (copy)
        return v89.state.sortName;
    end;
    v89.isSponsoredSort = function() --[[ Line: 237 ]]
        -- upvalues: v89 (copy)
        local v95 = v89.getSelectedSort();
        if v95 and v95:isSponsored() then
            return true;
        else
            return false;
        end;
    end;
    v89.isSdui = function() --[[ Line: 246 ]]
        -- upvalues: v89 (copy), l_isSduiGameOmniFeedItem_0 (ref)
        local v96 = v89.getSelectedSort();
        if v96 and l_isSduiGameOmniFeedItem_0(v96.treatmentType, v96.topicId) then
            return true;
        else
            return false;
        end;
    end;
    v89.refresh = function() --[[ Line: 254 ]]
        -- upvalues: v86 (ref), v89 (copy), l_OmniFeedConstants_0 (ref)
        local l_v86_0 = v86;
        return v89.isOmni() and v89.props.dispatchRefreshOmni(v89.props.networking, v89.props.omniRecommendationsRequest, l_v86_0.OMNI_HOME.sortType, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.ManualRefresh, v89.props.loggingProtocol) or v89.props.dispatchRefresh(v89.props.networking, v89.state.sortName, l_v86_0.GAMES.sortType);
    end;
    v89.loadMoreGames = function(v98) --[[ Line: 268 ]]
        -- upvalues: v39 (ref), v89 (copy), v86 (ref)
        local v99 = v98 or v39.Constants.DEFAULT_GAME_FETCH_COUNT;
        local l_dispatchLoadMoreGames_0 = v89.props.dispatchLoadMoreGames;
        local l_networking_0 = v89.props.networking;
        local v102 = v89.getSelectedSort();
        local v103 = v89.getSelectedSortContents();
        if v89.isOmni() then
            return v89.props.dispatchLoadMoreGamesOmni(l_networking_0, v86.OMNI_HOME.sortType, v89.state.sortIndex, v99, v89.props.loggingProtocol);
        elseif v103 then
            return l_dispatchLoadMoreGames_0(l_networking_0, v102, v103.rowsRequested, v99, v103.nextPageExclusiveStartId, v103.nextPageToken);
        else
            return;
        end;
    end;
    v89.switchToSort = function(v104, v105, v106) --[[ Line: 297 ]]
        -- upvalues: v89 (copy)
        if not v89.isMounted then
            return;
        else
            if v104.topicId ~= nil then
                v89.props.analytics.reportFilterChangeWithId(v104.topicId, nil, v106);
                v89:setState({
                    sortIndex = v105, 
                    selectedOmni = true, 
                    sortName = tostring(v104.topicId)
                });
            else
                v89.props.analytics.reportFilterChangeWithId(v104.gameSetTypeId, v104.gameSetTargetId, v106);
                v89:setState({
                    sortName = v104.name, 
                    selectedOmni = false
                });
            end;
            spawn(function() --[[ Line: 320 ]]
                -- upvalues: v89 (ref)
                if v89.isMounted then
                    v89:setState({
                        forceRender = nil
                    });
                end;
            end);
            return;
        end;
    end;
    v89.reportGameDetailOpened = function(v107) --[[ Line: 329 ]]
        -- upvalues: v89 (copy)
        local v108 = v89.getSelectedSort();
        local l_analytics_0 = v89.props.analytics;
        local v110 = nil;
        local v111 = v89.getSelectedSortContents();
        v110 = v111 and v111.entries or nil;
        if not v110 then
            return;
        else
            local v112 = v108 and v108.analyticsTypeId or nil;
            local v113 = #v110;
            local v114 = v110[v107];
            local l_placeId_0 = v114.placeId;
            local l_isSponsored_0 = v114.isSponsored;
            local l_adId_0 = v114.adId;
            local v118 = v108 and v108.gameSetTargetId;
            local l_universeId_0 = v114.universeId;
            local l_pageContext_0 = v89.props.pageContext;
            local v121 = v108 and v108.appliedFilters or nil;
            l_analytics_0.reportOpenGameDetailWithId(l_placeId_0, v112, v118, nil, v107, v113, l_isSponsored_0, l_adId_0, l_universeId_0, l_pageContext_0, v121);
            return;
        end;
    end;
    v89.sendGameImpressionsFromSdui = function(v122, v123, _, _, v126) --[[ Line: 366 ]]
        -- upvalues: v89 (copy)
        v89.sendGameImpressions(v122, v123, v126);
    end;
    v89.setLogSduiImpressions = function(v127) --[[ Line: 376 ]]
        -- upvalues: v89 (copy)
        v89:setState({
            logSduiImpressions = v127
        });
    end;
    v89.onCollectionViewabilityChanged = function() --[[ Line: 382 ]]
        -- upvalues: v89 (copy)
        v89.gamesListViewChangedSignal:fire();
    end;
    v89.sendGameImpressions = function(v128, v129, v130) --[[ Line: 386 ]]
        -- upvalues: v89 (copy), l_SendGameImpressions_0 (ref)
        local v131 = v89.getSelectedSortContents();
        if not v129 and not v131 then
            return;
        else
            local v132 = v89.getSelectedSort();
            if not v132 then
                return;
            else
                local l_analyticsTypeId_0 = v132.analyticsTypeId;
                local l_gameSetTargetId_0 = v132.gameSetTargetId;
                local v135 = nil;
                if not v89.isOmni() then
                    v135 = v89.props.sortPageId;
                end;
                local l_appliedFilters_0 = v132.appliedFilters;
                local l_pageContext_1 = v89.props.pageContext;
                l_SendGameImpressions_0.sendFromSeeAll(v89.props.eventIngest, v89.props.appAnalytics, v128, v129 or v131.entries, l_pageContext_1, l_analyticsTypeId_0, l_gameSetTargetId_0, v135, l_appliedFilters_0, v130);
                return;
            end;
        end;
    end;
    v89.onAbsoluteContentSizeChanged = function(v138) --[[ Line: 420 ]]
        -- upvalues: v89 (copy)
        if v89.isMounted and v138 then
            local l_AbsoluteContentSize_0 = v138.AbsoluteContentSize;
            if v89.state.contentSize == l_AbsoluteContentSize_0 then
                return;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v89:setState({
                    contentSize = l_AbsoluteContentSize_0
                });
            end;
        end;
    end;
    v89.updateGamesInSort = function() --[[ Line: 435 ]]
        -- upvalues: v86 (ref), v89 (copy)
        local l_v86_1 = v86;
        v89.props.dispatchFetchExpiringTokens(v89.props.networking, l_v86_1.GAMES.sortType);
        local v141 = v89.getSelectedSortContents();
        local v142 = v141 and v141.entries and #v141.entries or nil;
        if v142 ~= nil and v142 == 0 then
            if v89.isOmni() then
                v89.loadMoreGames():catch(function() --[[ Line: 447 ]]
                    warn("Failed to load omni games");
                end);
                return;
            else
                v89.props.dispatchRefreshSortContents(v89.props.networking, v89.state.sortName);
            end;
        end;
    end;
    v89.reportExperienceLaunched = function(v143, v144) --[[ Line: 456 ]]
        -- upvalues: v89 (copy), l_gamePlayIntent_0 (ref), l_Context_0 (ref)
        local v145 = v89.getSelectedSort();
        l_gamePlayIntent_0(v89.props.eventIngest, l_Context_0.ExperienceTile, {
            placeId = v143.placeId, 
            rootPlaceId = tonumber(v143.placeId), 
            universeId = v143.universeId, 
            sortIndex = tostring(v89.state.sortIndex), 
            sortEntryIndex = tostring(v143.index), 
            referralSource = v144, 
            gameSetTypeId = if v89.isOmni() then v145.topicId else v145.gameSetTypeId, 
            gameSetTargetId = if v89.isOmni() then nil else v145.gameSetTargetId, 
            appliedFilters = v145.appliedFilters, 
            nativeAdData = v143.adId, 
            pageName = v89.props.pageContext
        });
    end;
    v89.onActivateTooltip = function() --[[ Line: 473 ]]
        -- upvalues: v89 (copy)
        if v89.isMounted and v89.isSponsoredSort() then
            v89.props.onActivateTooltip(v89.props.sponsoredTooltipTitle, v89.props.sponsoredTooltipBody);
        end;
    end;
end;
v88.renderWithLocalized = function(v146, v147) --[[ Line: 482 ]] --[[ Name: renderWithLocalized ]]
    -- upvalues: v71 (copy), v87 (copy), l_AppPage_0 (copy), v72 (copy), v73 (copy), l_SECTION_HEADER_HEIGHT_0 (copy), v86 (copy), l_withStyle_0 (copy), l_GameTileConstants_0 (copy), v6 (copy), l_IconWithTooltip_0 (copy), l_TooltipOrientation_0 (copy), v69 (copy), v66 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v67 (copy), l_FFlagAppIaScrollAway_0 (copy), v47 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_GAME_GRID_PADDING_0 (copy), v65 (copy), v64 (copy), v63 (copy), v7 (copy), l_SduiSeeAllGrid_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_GameGridSelector_0 (copy), l_Context_0 (copy), v70 (copy)
    local l_topBarHeight_0 = v146.props.topBarHeight;
    local v149 = v146.getSelectedSortIdentifier();
    local l_screenSize_1 = v146.props.screenSize;
    local l_frameSize_0 = v146.state.frameSize;
    local l_contentSize_0 = v146.state.contentSize;
    local v153 = v146.getSelectedSort();
    local v154 = v146.getSelectedSortContents();
    local l_useCreationCenterTitle_0 = v146.props.useCreationCenterTitle;
    local l_gameGridSidePadding_1 = v146.props.gameGridSidePadding;
    local v157 = v71.shouldHideGameStats(v146.props.pageContext, v146.props.hideGameStatsIXP);
    local v158 = if v146.props.useCategoryScrollList then v87.Tabs else v87.Dropdown;
    if not v149 then
        return nil;
    elseif not v154 then
        return nil;
    else
        local v159 = nil;
        if l_useCreationCenterTitle_0 then
            v159 = v147.creationCenter;
        elseif v146.props.pageContext == l_AppPage_0.Games then
            v159 = v147.chartsTitle;
        end;
        local v160 = v72 and (not v73 or v146.props.hideDropdown);
        local v161 = if v160 then nil else 38;
        local v162 = 12;
        local v163 = if v160 then v162 else v161 + v162;
        local v164 = v163 + l_SECTION_HEADER_HEIGHT_0 + 14;
        if v158 == v87.Tabs then
            v161 = 0;
            v162 = 0;
            l_topBarHeight_0 = v146.props.topBarCategoriesScrollerHeight;
        end;
        local l_v86_2 = v86;
        local v166 = false;
        local v167 = nil;
        v166 = v146.isSponsoredSort();
        v167 = v146.props.sponsoredTooltipBody;
        local v168 = v146.isSdui();
        return l_withStyle_0(function(v169) --[[ Line: 537 ]]
            -- upvalues: l_GameTileConstants_0 (ref), v6 (ref), v163 (copy), v153 (copy), l_IconWithTooltip_0 (ref), l_TooltipOrientation_0 (ref), v146 (copy), v167 (ref), v69 (ref), v159 (ref), v158 (copy), v87 (ref), v66 (ref), l_v86_2 (copy), v149 (copy), l_FFlagEnableLeftNavOnConsole_0 (ref), l_gameGridSidePadding_1 (copy), v67 (ref), l_FFlagAppIaScrollAway_0 (ref), v47 (ref), l_topBarHeight_0 (ref), v154 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), l_GAME_GRID_PADDING_0 (ref), v164 (copy), v162 (ref), v160 (copy), v65 (ref), v161 (ref), v166 (ref), v64 (ref), v63 (ref), v168 (copy), v7 (ref), l_SduiSeeAllGrid_0 (ref), l_FFlagSduiServerCompat_0 (ref), l_GameGridSelector_0 (ref), l_contentSize_0 (copy), l_frameSize_0 (copy), l_screenSize_1 (copy), v157 (copy), l_Context_0 (ref), v70 (ref)
            local l_Footer_0 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
            local v171 = v6.createElement("Frame", {
                Name = "TitleWithTooltip", 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0, 0, 0, v163), 
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
                    Text = v153.displayName, 
                    Font = v169.Font.Header1.Font, 
                    TextSize = v169.Font.BaseSize * v169.Font.Header1.RelativeSize, 
                    TextColor3 = v169.Theme.TextEmphasis.Color, 
                    TextTransparency = v169.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    TextWrapped = true, 
                    LayoutOrder = 1
                }), 
                GamesListTooltip = v6.createElement(l_IconWithTooltip_0, {
                    tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                    onActivateTooltip = v146.onActivateTooltip, 
                    layoutOrder = 2, 
                    hoverText = v167, 
                    triggerPointName = "GamesListTooltip"
                })
            });
            return v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v146.props.backgroundTransparency, 
                BorderSizePixel = 0
            }, {
                TopBar = if v146.props.hasTopBar then v6.createElement(v69, {
                    titleText = v159
                }) else nil, 
                CategorySelectorScrollWrapper = if v158 == v87.Tabs then v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v146.props.categorySelectorHeight), 
                    ZIndex = 2, 
                    BackgroundColor3 = v169.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v146.props.backgroundTransparency, 
                    Position = UDim2.fromOffset(0, v146.props.topBarCategoriesScrollerPadding)
                }, {
                    GameCategoryTabGroup = v6.createElement(v66, {
                        size = UDim2.new(1, 0, 0, v146.props.categorySelectorHeight), 
                        sortCategories = l_v86_2, 
                        selectedSortIndex = v146.state.sortIndex, 
                        selectedSortName = v149, 
                        onSelected = v146.switchToSort, 
                        padding = if l_FFlagEnableLeftNavOnConsole_0 then {
                            left = l_gameGridSidePadding_1, 
                            right = l_gameGridSidePadding_1, 
                            top = 0, 
                            bottom = 0
                        } else {
                            left = v146.props.safeAreaPadding, 
                            right = v146.props.safeAreaPadding, 
                            top = 0, 
                            bottom = 0
                        }
                    })
                }) else nil, 
                Scroller = v6.createElement(v67, {
                    Position = if l_FFlagAppIaScrollAway_0 and v47.getScrollAwayEnabled() then UDim2.fromOffset(0, 0) else UDim2.new(0, 0, 0, l_topBarHeight_0), 
                    Size = if l_FFlagAppIaScrollAway_0 and v47.getScrollAwayEnabled() then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -l_topBarHeight_0), 
                    BackgroundTransparency = v146.props.backgroundTransparency, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    refresh = v146.refresh, 
                    onLoadMore = v154.hasMoreRows and v146.loadMoreGames, 
                    ScrollingEnabled = if l_FFlagEnableLeftNavOnConsole_0 then v146.props.isScrollingEnabled else nil, 
                    createEndOfScrollElement = not v154.hasMoreRows, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 and v47.getScrollAwayEnabled() then l_topBarHeight_0 else nil, 
                    canvasSidePadding = if l_FFlagLuaAppLayoutParamsInContext_0 then l_gameGridSidePadding_1 else nil, 
                    contentFrameRefCallback = if l_FFlagLuaAppLayoutParamsInContext_0 then v146.props.setContentFrame else nil, 
                    AutomaticCanvasSize = if l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 then Enum.AutomaticSize.Y else nil, 
                    onAbsoluteSizeChangedCallback = function(v172) --[[ Line: 637 ]] --[[ Name: onAbsoluteSizeChangedCallback ]]
                        -- upvalues: v146 (ref)
                        if v146.isMounted and v172 then
                            v146:setState({
                                frameSize = v172.AbsoluteSize
                            });
                        end;
                        v146.gamesListViewChangedSignal:fire();
                    end, 
                    onCanvasPositionChangedCallback = function() --[[ Line: 645 ]] --[[ Name: onCanvasPositionChangedCallback ]]
                        -- upvalues: v146 (ref)
                        v146.gamesListViewChangedSignal:fire();
                    end, 
                    shouldExtendIntoSafeArea = if l_FFlagExtendScrollingFramesBySafeInsets_0 then {
                        left = false, 
                        top = false, 
                        right = false, 
                        bottom = true
                    } else nil, 
                    [v6.Ref] = v146.setContainerRef
                }, {
                    Layout = v6.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        [v6.Change.AbsoluteContentSize] = v146.onAbsoluteContentSizeChanged
                    }), 
                    Padding = v6.createElement("UIPadding", {
                        PaddingLeft = if l_FFlagLuaAppLayoutParamsInContext_0 then nil else UDim.new(0, l_gameGridSidePadding_1), 
                        PaddingRight = if l_FFlagLuaAppLayoutParamsInContext_0 then nil else UDim.new(0, l_gameGridSidePadding_1), 
                        PaddingTop = UDim.new(0, l_GAME_GRID_PADDING_0)
                    }), 
                    TopSection = if v158 == v87.Dropdown then v6.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, v164), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Padding = v6.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, v162)
                        }), 
                        DropDown = if v160 then nil else v6.createElement(v65, {
                            size = UDim2.new(1, 0, 0, v161), 
                            position = UDim2.new(0, 0, 0, 0), 
                            selectedSortName = v149, 
                            selectedSortIndex = v146.state.sortIndex, 
                            onSelected = v146.switchToSort, 
                            isOmni = v146.isOmni(), 
                            sortCategories = l_v86_2
                        }), 
                        Title = if v166 then v171 else v6.createElement(v64, {
                            Text = v153.displayName, 
                            Position = UDim2.new(0, 0, 0, v163), 
                            Font = v169.Font.Header1.Font, 
                            TextSize = v169.Font.BaseSize * v169.Font.Header1.RelativeSize, 
                            TextColor3 = v169.Theme.TextEmphasis.Color, 
                            TextTransparency = v169.Theme.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v63.FitAxis.Height, 
                            TextWrapped = true
                        })
                    }) else nil, 
                    ["GameGrid " .. v149] = if v168 then v7.createElement(l_SduiSeeAllGrid_0, {
                        appPage = v146.props.pageContext, 
                        verticalScrollingFrameRef = v146.containerRef, 
                        contentFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v146.props.contentFrame else nil, 
                        scrollViewPositionChangedSignal = v146.gamesListViewChangedSignal, 
                        collectionId = v146.state.sortName, 
                        collectionIndex = v146.state.sortIndex, 
                        LayoutOrder = not l_FFlagSduiServerCompat_0 and 2 or nil, 
                        layoutOrder = l_FFlagSduiServerCompat_0 and 2 or nil, 
                        impressionsTag = "GamesList", 
                        setLogImpressions = v146.setLogSduiImpressions, 
                        sendGameImpressions = v146.sendGameImpressionsFromSdui, 
                        onCollectionViewabilityChanged = v146.onCollectionViewabilityChanged
                    }) else v6.createElement(l_GameGridSelector_0, {
                        LayoutOrder = 2, 
                        entries = v154.entries, 
                        reportGameDetailOpened = v146.reportGameDetailOpened, 
                        windowSize = Vector2.new(l_contentSize_0.X, l_frameSize_0.Y), 
                        screenSize = l_screenSize_1, 
                        hideGameStats = v157, 
                        currentSidePadding = l_gameGridSidePadding_1, 
                        impressionsTag = "GamesList", 
                        reportExperienceLaunched = v146.reportExperienceLaunched, 
                        launchExperienceEventContext = l_Context_0.ExperienceTile, 
                        playerCountStyle = l_Footer_0
                    }), 
                    GameSeeAllImpressionsDetector = v6.createElement(v70, {
                        parentRef = v146.containerRef, 
                        impressionsTag = "GamesList", 
                        scrollViewPositionChangedSignal = v146.gamesListViewChangedSignal, 
                        sendGameImpressions = if v168 then v146.state.logSduiImpressions else v146.sendGameImpressions, 
                        gameSortId = v146.state.sortName
                    })
                }), 
                SafeAreaBottomPadding = if not v146.props.safeAreaBottomPadding or l_FFlagEnableLeftNavOnConsole_0 then nil else v6.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, v146.props.safeAreaBottomPadding)
                })
            });
        end);
    end;
end;
v88.render = function(v173) --[[ Line: 753 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        chartsTitle = "CommonUI.Features.Label.Charts"
    })(function(v174) --[[ Line: 757 ]]
        -- upvalues: v173 (copy)
        return v173:renderWithLocalized(v174);
    end);
end;
v88.didMount = function(v175) --[[ Line: 762 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagLuaAppSortDeeplinkFix_0 (copy), v86 (copy), l_default_0 (copy), l_sortDeeplinkFailureCounter_0 (copy)
    v175.isMounted = true;
    if not l_FFlagLuaAppSortDeeplinkFix_0 and v175.props.pageContext == "Deeplink" and not v175.props.gameSortContents[v175.state.sortName] then
        v175.props.dispatchFetchExpiringTokens(v175.props.networking, v86.GAMES.sortType):andThen(function() --[[ Line: 771 ]]
            -- upvalues: v175 (copy)
            if v175.isMounted then
                v175:setState({
                    missingSortLoadComplete = true
                });
            end;
        end, function(_) --[[ Line: 777 ]]
            -- upvalues: l_default_0 (ref), l_sortDeeplinkFailureCounter_0 (ref), v175 (copy)
            l_default_0:logRobloxTelemetryCounter(l_sortDeeplinkFailureCounter_0);
            v175.props.navigateBack();
        end);
        return;
    else
        v175.updateGamesInSort();
        return;
    end;
end;
v88.willUnmount = function(v177) --[[ Line: 786 ]] --[[ Name: willUnmount ]]
    v177.isMounted = false;
end;
v88.didUpdate = function(v178, v179, v180) --[[ Line: 790 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagLuaAppSortDeeplinkFix_0 (copy), l_default_0 (copy), l_sortDeeplinkFailureCounter_0 (copy)
    if v178.state.sortName ~= v180.sortName or not l_FFlagLuaAppSortDeeplinkFix_0 and not v179.gameSortContents[v178.state.sortName] and v178.props.gameSortContents[v178.state.sortName] then
        if not l_FFlagLuaAppSortDeeplinkFix_0 then
            task.spawn(function() --[[ Line: 800 ]]
                -- upvalues: v178 (copy)
                if v178.isMounted then
                    v178:setState({
                        missingSortLoadComplete = false
                    });
                end;
            end);
        end;
        v178.updateGamesInSort();
    end;
    if not l_FFlagLuaAppSortDeeplinkFix_0 and v178.state.missingSortLoadComplete and not v178.props.gameSortContents[v178.state.sortName] then
        l_default_0:logRobloxTelemetryCounter(l_sortDeeplinkFailureCounter_0);
        v178.props.navigateBack();
    end;
end;
local v207 = v12.connect(function(v181, _) --[[ Line: 820 ]]
    -- upvalues: l_TopicInfosReducer_0 (copy), l_TopicContentsReducer_0 (copy)
    return {
        topBarHeight = v181.TopBar.topBarHeight, 
        screenSize = v181.ScreenSize, 
        topicInfos = v181.Personalization[l_TopicInfosReducer_0.key], 
        gameSortContents = v181.Personalization[l_TopicContentsReducer_0.key]
    };
end, function(v183) --[[ Line: 827 ]]
    -- upvalues: v68 (copy), l_FetchDataWithErrorToasts_0 (copy), l_RefreshGameSorts_0 (copy), l_ApiFetchOmniRecommendations_0 (copy), l_ApiFetchGamesData_0 (copy), l_ApiFetchGamesInSort_0 (copy), l_ApiFetchOmniRecommendationsMetadata_0 (copy), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (copy), l_RefreshExpiringSortTokens_0 (copy), l_NavigateBack_0 (copy)
    return {
        dispatchRefresh = function(v184, v185, v186) --[[ Line: 829 ]] --[[ Name: dispatchRefresh ]]
            -- upvalues: v183 (copy), v68 (ref), l_FetchDataWithErrorToasts_0 (ref), l_RefreshGameSorts_0 (ref)
            v183(v68());
            return v183((l_FetchDataWithErrorToasts_0((l_RefreshGameSorts_0(v184, {
                v186
            }, v185, nil)))));
        end, 
        dispatchRefreshOmni = function(v187, v188, v189, v190, v191) --[[ Line: 835 ]] --[[ Name: dispatchRefreshOmni ]]
            -- upvalues: v183 (copy), v68 (ref), l_FetchDataWithErrorToasts_0 (ref), l_ApiFetchOmniRecommendations_0 (ref)
            v183(v68());
            return v183((l_FetchDataWithErrorToasts_0((l_ApiFetchOmniRecommendations_0(v187, v188, v189, nil, nil, v190, v191)))));
        end, 
        dispatchRefreshSortContents = function(v192, v193) --[[ Line: 857 ]] --[[ Name: dispatchRefreshSortContents ]]
            -- upvalues: v183 (copy), l_ApiFetchGamesData_0 (ref)
            return v183(l_ApiFetchGamesData_0(v192, nil, v193, nil, nil));
        end, 
        dispatchLoadMoreGames = function(v194, v195, v196, v197, v198, v199) --[[ Line: 860 ]] --[[ Name: dispatchLoadMoreGames ]]
            -- upvalues: v183 (copy), l_FetchDataWithErrorToasts_0 (ref), l_ApiFetchGamesInSort_0 (ref)
            return v183((l_FetchDataWithErrorToasts_0((l_ApiFetchGamesInSort_0(v194, v195, true, {
                startRows = v196, 
                maxRows = v197, 
                exclusiveStartId = v198, 
                pageToken = v199
            })))));
        end, 
        dispatchLoadMoreGamesOmni = function(v200, v201, v202, v203, v204) --[[ Line: 868 ]] --[[ Name: dispatchLoadMoreGamesOmni ]]
            -- upvalues: v183 (copy), l_FetchDataWithErrorToasts_0 (ref), l_ApiFetchOmniRecommendationsMetadata_0 (ref), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (ref)
            return v183((l_FetchDataWithErrorToasts_0((l_ApiFetchOmniRecommendationsMetadata_0(v200, v201, v202, v203, v204, l_FFlagLuaAppLogOmniRecommendationsMetadata_0 and "GamesList" or nil)))));
        end, 
        dispatchFetchExpiringTokens = function(v205, v206) --[[ Line: 882 ]] --[[ Name: dispatchFetchExpiringTokens ]]
            -- upvalues: v183 (copy), l_RefreshExpiringSortTokens_0 (ref)
            return v183((l_RefreshExpiringSortTokens_0(v205, {
                v206
            })));
        end, 
        navigateBack = function() --[[ Line: 885 ]] --[[ Name: navigateBack ]]
            -- upvalues: v183 (copy), l_NavigateBack_0 (ref)
            return v183(l_NavigateBack_0());
        end
    };
end)(v88);
v88 = v24.connectUserLayer({
    l_AppUserLayers_0.GameTileLayer, 
    l_AppUserLayers_0.PlayerAppSeeAllUXLayer
}, function(v208, _) --[[ Line: 978 ]]
    -- upvalues: l_AppUserLayers_0 (copy), v73 (copy)
    local v210 = v208[l_AppUserLayers_0.GameTileLayer] or {};
    local v211 = v208[l_AppUserLayers_0.PlayerAppSeeAllUXLayer] or {};
    return {
        hideGameStatsIXP = v210.hideGameStats == "true", 
        hideDropdown = if v73 then v211.ShouldRemoveSeeAllDropdown else nil
    };
end)(function(v212) --[[ Line: 892 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDispatch_0 (copy), v7 (copy), l_OpenInfoPeekView_0 (copy), l_useDeviceType_0 (copy), l_useNavigationProps_0 (copy), l_useAppPolicy_0 (copy), l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_usePageSideMargin_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_useLastInputMode_0 (copy), l_useAnimateScrollViewToSelection_0 (copy), v9 (copy), v6 (copy), v207 (copy)
    local v213 = l_useLocalization_0({
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic", 
        SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
    });
    local l_SponsoredDisclosure_0 = v213.SponsoredDisclosure;
    local l_SponsoredTitle_0 = v213.SponsoredTitle;
    local v216 = l_useDispatch_0();
    local v219 = v7.useCallback(function(v217, v218) --[[ Line: 900 ]]
        -- upvalues: v216 (copy), l_OpenInfoPeekView_0 (ref)
        v216(l_OpenInfoPeekView_0(v217, v218));
    end, {});
    local v220 = l_useDeviceType_0();
    local v224 = l_useNavigationProps_0(function(v221, v222) --[[ Line: 906 ]]
        local v223 = {
            sortPageId = v222.sortPageId, 
            pageContext = v222.pageContext, 
            initialSortName = v221
        };
        if v222.isOmni then
            v223.isOmni = true;
            v223.initialSortIndex = v222.sortIndex;
        end;
        return v223;
    end);
    local v226 = l_useAppPolicy_0(function(v225) --[[ Line: 921 ]]
        return v225.getGamesPageCreationCenterTitle();
    end);
    local v228 = l_useAppPolicy_0(function(v227) --[[ Line: 924 ]]
        return v227.getGameListCategoryScrollListEnabled();
    end);
    local v229 = l_useDesignTokens_0();
    local v230 = l_useUiModeInfo_0();
    local v231 = v230.uiMode ~= l_UiMode_0.TenFoot;
    local v232 = v230.uiMode == l_UiMode_0.TenFoot;
    local v233, v234 = v7.useState(nil);
    local v235 = l_usePageSideMargin_0(v233);
    local v236 = if v232 then v229.Global.Space_500 else nil;
    local v237 = nil;
    local v238 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v239, v240 = v7.useState(nil);
        v237 = v239;
        v238 = v240;
    end;
    local v241 = nil;
    local v242 = nil;
    if l_FFlagEnableLeftNavOnConsole_0 then
        v241 = v7.useRef(nil);
        v242 = l_useLastInputMode_0() == "Cursor";
        l_useAnimateScrollViewToSelection_0(v241, 0.4);
    end;
    local v243 = v9.Dictionary.join(v212, {
        deviceType = v220, 
        onActivateTooltip = v219, 
        sponsoredTooltipBody = l_SponsoredDisclosure_0, 
        sponsoredTooltipTitle = l_SponsoredTitle_0, 
        useCreationCenterTitle = v226, 
        useCategoryScrollList = v228, 
        categorySelectorHeight = v229.Global.Size_600, 
        topBarCategoriesScrollerHeight = v229.Global.Size_1000, 
        topBarCategoriesScrollerPadding = v229.Global.Space_200, 
        hasTopBar = v231, 
        backgroundTransparency = v229.LuaApps.SeeAll.BackgroundTransparency, 
        safeAreaPadding = v229.Global.Space_800, 
        gameGridSidePadding = v235, 
        safeAreaBottomPadding = v236, 
        contentFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v237 else nil, 
        setContentFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v238 else nil, 
        setScrollingFrame = v234, 
        containerRef = if l_FFlagEnableLeftNavOnConsole_0 then v241 else nil, 
        isScrollingEnabled = if l_FFlagEnableLeftNavOnConsole_0 then v242 else nil
    }, v224);
    return v6.createElement(v207, v243);
end);
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0, 
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    appAnalytics = l_RoactAnalytics_0, 
    loggingProtocol = l_AppLogging_0
})(v88);