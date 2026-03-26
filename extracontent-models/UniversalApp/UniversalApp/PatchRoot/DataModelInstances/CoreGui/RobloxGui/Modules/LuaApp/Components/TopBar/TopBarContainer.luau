local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_getPageMargin_0 = v3.App.Container.getPageMargin;
local l_withGridConfig_DEPRECATED_0 = v3.Core.Layout.Grid.withGridConfig_DEPRECATED;
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_CorePackages_0.Packages.Dash);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.RoactRodux);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_FFlagEnableAppNavGamepadRemoval_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAppNavGamepadRemoval;
local v15 = require(l_CorePackages_0.Packages.RoactGamepad);
local v16 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_Focusable_0 = v15.Focusable;
local v18 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v21 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v23 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_VerticalEfficiencyExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation;
local v25 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local l_SearchConstants_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.SearchConstants;
local v27 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local v28 = require(l_Modules_0.LuaApp.Thunks.ConfirmSearch);
local v29 = require(l_Modules_0.LuaApp.AppPage);
local v30 = require(l_Modules_0.LuaApp.AppPageProperties);
local v31 = require(l_Modules_0.LuaApp.Actions.SetTopBarHeight);
local v32 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v35 = require(l_Modules_0.LuaApp.Constants);
local v36 = require(l_Modules_0.LuaApp.AppPageLocalizationKeys);
local v37 = require(l_Modules_0.LuaApp.Components.SearchBar);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v39 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local v40 = require(l_Modules_0.LuaApp.Common.wrapComponent);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v44 = require(l_Modules_0.LuaApp.Components.Banner.useBannerContainer);
local v45 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local v46 = require(l_Modules_0.LuaApp.Context.withTopBarSearchSignal);
local v47 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v49 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.shouldShowProfileInHeaderBar);
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v51 = require(script.Parent.Buttons.SearchButton);
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local l_AppHeaderBar_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).AppHeaderBar;
local v54 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_VisibilityControl_0 = v54.VisibilityControl;
local v56 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagSearchOmniAutocompletePageIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePageIXP;
local l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppFixAppNavHeaderIconsAlignment;
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP;
local v62 = game:DefineFastString("LuaAppSlpIxpLayer", "Growth.Omnisearch.SearchLandingPage");
local v63 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v63.FFlagLuaAppCompositionSupport;
local l_FFlagAppIaScrollAway_0 = v63.FFlagAppIaScrollAway;
local l_FFlagAppIaHomeSubTab_0 = v63.FFlagAppIaHomeSubTab;
local l_FFlagAppIaStatusBar_0 = v63.FFlagAppIaStatusBar;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v63.FFlagEnableHeaderBarButtonsUpdate;
local v69 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v71 = game:DefineFastFlag("LuaAppEnableSlpForVr", false);
local v72 = nil;
if v69 then
    v72 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).Utils.shouldShowLeftHeader;
end;
local l_NAV_BAR_SIZE_0 = v35.NAV_BAR_SIZE;
local l_NON_COMPACT_SEARCH_BAR_SIZE_0 = l_SearchConstants_0.NON_COMPACT_SEARCH_BAR_SIZE;
local v75 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v76 = v11.Component:extend("TopBarContainer");
v76.validateProps = v7.strictInterface({
    searchType = v7.string, 
    ZIndex = v7.number, 
    hideSiteMessageBanner = v7.boolean, 
    forceCompactMode = v7.boolean, 
    transparentBackground = v7.boolean, 
    searchParameters = v7.optional(v7.table), 
    onConfirmSearchCallback = v7.optional(v7.callback), 
    titleText = v7.optional(v7.string), 
    NextSelectionUp = v7.optional(v7.table), 
    NextSelectionDown = v7.optional(v7.table), 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    leftItem = v7.optional(v7.any), 
    centerItem = v7.optional(v7.any), 
    rightItems = v7.optional(v7.array(v7.any)), 
    isSecondary = v7.optional(v7.boolean), 
    useParentSizeForCenterItem = v7.optional(v7.boolean), 
    setDefaultRefOverride = v7.optional(v7.callback), 
    gridConfig = v7.optional(v7.table), 
    focusController = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v7.optional(v7.table), 
    totalBannerHeight = v7.optional(v7.number), 
    bannerContainer = v7.optional(v7.table), 
    isSpatial = v7.optional(v7.boolean), 
    screenSize = v7.Vector2, 
    formFactor = v7.string, 
    currentRoute = v7.table, 
    showSearchBar = v7.boolean, 
    statusBarHeight = v7.number, 
    opaquePage = v7.string, 
    confirmSearch = v7.callback, 
    setTopBarHeight = v7.callback, 
    analytics = v7.table, 
    sessionService = v7.optional(v7.union(v7.Instance, v7.table)), 
    eventIngest = v7.table, 
    enableNotifications = v7.boolean, 
    enableSearch = v7.boolean, 
    enableSearchAutoComplete = v7.boolean, 
    shouldShowSearchLandingPage = if l_FFlagSearchOmniAutocompletePageIXP_0 then v7.optional(v7.boolean) else nil, 
    navigation = v7.table, 
    avatarRoute = v7.optional(v7.table), 
    forwardRef = v7.optional(v7.table), 
    shouldNavigateToSearchLandingPage = v7.optional(v7.boolean), 
    sideMarginOverride = if l_FFlagLuaAppCompositionSupport_0 then v7.optional(v7.number) else nil, 
    tag = if l_FFlagLuaAppCompositionSupport_0 then v7.optional(v7.string) else nil, 
    tokens = v7.table
});
v76.defaultProps = {
    searchType = l_SearchTypes_0.Games, 
    enableSearch = false, 
    ZIndex = 2, 
    onConfirmSearchCallback = nil, 
    hideSiteMessageBanner = false, 
    forceCompactMode = false, 
    transparentBackground = false, 
    rightItems = {}
};
local function _(v77, v78) --[[ Line: 218 ]] --[[ Name: applyTokenScaling ]]
    return v77 * v78.Config.UI.Scale;
end;
local function _(v80) --[[ Line: 222 ]] --[[ Name: calculateNavBarSize ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy)
    return l_NAV_BAR_SIZE_0 * v80.Config.UI.Scale;
end;
local _ = function(v82, _) --[[ Line: 226 ]] --[[ Name: calculateTopBarHeight ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_LayoutConfig_0 (copy)
    local l_statusBarHeight_0 = v82.statusBarHeight;
    local _ = nil;
    local l_tokens_0 = v82.tokens;
    return l_statusBarHeight_0 + l_NAV_BAR_SIZE_0 * l_tokens_0.Config.UI.Scale + math.round(v82.totalBannerHeight) + 2 * v82.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
end;
local function _(v88) --[[ Line: 237 ]]
    -- upvalues: l_SearchTypes_0 (copy), v56 (copy)
    local v89 = true;
    if v88 ~= l_SearchTypes_0.Games then
        v89 = true;
        if v88 ~= l_SearchTypes_0.Auto then
            v89 = true;
            if v88 ~= l_SearchTypes_0.TopResults then
                v89 = v56() and v88 == l_SearchTypes_0.Catalog;
            end;
        end;
    end;
    return v89;
end;
v76.shouldUpdate = function(v91, v92, v93) --[[ Line: 243 ]] --[[ Name: shouldUpdate ]]
    -- upvalues: v9 (copy)
    if v93 ~= v91.state then
        return true;
    elseif v92 == v91.props then
        return false;
    else
        for v94, v95 in pairs(v92) do
            if v94 ~= "rightItems" and v91.props[v94] ~= v95 then
                return true;
            end;
        end;
        for v96, v97 in pairs(v91.props) do
            if v96 ~= "rightItems" and v92[v96] ~= v97 then
                return true;
            end;
        end;
        return not v9.shallowEqual(v91.props.rightItems, v92.rightItems);
    end;
end;
v76.getPageOwner = function(v98) --[[ Line: 267 ]] --[[ Name: getPageOwner ]]
    return v98.props.navigation.state.routeName;
end;
local function v105(v99) --[[ Line: 272 ]] --[[ Name: isTopPage ]]
    -- upvalues: l_FFlagAppIaHomeSubTab_0 (copy), v27 (copy), v8 (copy), v54 (copy)
    local l_currentRoute_0 = v99.currentRoute;
    local l_name_0 = l_currentRoute_0[#l_currentRoute_0].name;
    local v102 = nil;
    v102 = if v99.avatarRoute then v99.avatarRoute.opaque.name else v99.opaquePage;
    local l_routeName_0 = v99.navigation.state.routeName;
    if l_FFlagAppIaHomeSubTab_0 and l_routeName_0 == v27.Constants.HomeContainerName then
        return v8.List.find(v54.Constants.HOME_CONTAINER_SUB_TAB_PAGES, l_name_0) ~= nil;
    else
        local v104 = true;
        if l_routeName_0 ~= l_name_0 then
            v104 = l_routeName_0 == v102;
        end;
        return v104;
    end;
end;
v76.updateTopBarHeight = function(v106, v107, v108) --[[ Line: 294 ]] --[[ Name: updateTopBarHeight ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_LayoutConfig_0 (copy), v105 (copy), v32 (copy), l_FFlagAppIaScrollAway_0 (copy), v54 (copy), l_VisibilityControl_0 (copy)
    local l_props_0 = v106.props;
    local l_state_0 = v106.state;
    local l_statusBarHeight_1 = l_props_0.statusBarHeight;
    local v112 = nil;
    local l_tokens_1 = l_props_0.tokens;
    local v114 = l_statusBarHeight_1 + l_NAV_BAR_SIZE_0 * l_tokens_1.Config.UI.Scale + math.round(l_props_0.totalBannerHeight) + 2 * l_props_0.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
    l_props_0 = v105(v106.props);
    if v107 and v108 and v107.navigation == v106.props.navigation then
        l_statusBarHeight_1 = v107.statusBarHeight;
        v112 = nil;
        l_tokens_1 = v107.tokens;
        l_state_0 = l_statusBarHeight_1 + l_NAV_BAR_SIZE_0 * l_tokens_1.Config.UI.Scale + math.round(v107.totalBannerHeight) + 2 * v107.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
        l_statusBarHeight_1 = v105(v107);
        if l_state_0 == v114 and l_props_0 == l_statusBarHeight_1 then
            return;
        end;
    end;
    if l_props_0 then
        v32.GetDisplayStore().setTopBarHeight(v114);
        v106.props.setTopBarHeight(v114);
        if l_FFlagAppIaScrollAway_0 and v54.getScrollAwayEnabled() then
            l_VisibilityControl_0.setScrollDistance(v114);
        end;
    end;
end;
v76.init = function(v115) --[[ Line: 315 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v15 (copy), l_UserInputService_0 (copy)
    v115.searchBarRef = v11.createRef();
    v115.isMounted = false;
    v115.rightItemRefs = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v15.createRefCache();
    v115.itemDefaultChildRefs = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v15.createRefCache();
    v115.leftItemRef = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v11.createRef();
    v115.centerItemRef = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v11.createRef();
    v115.buttonVisibilityCallbacks = {};
    v115.state = {
        isSearching = false, 
        absolutePosition = Vector2.new(0, 0), 
        lastInputType = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else l_UserInputService_0:GetLastInputType(), 
        hiddenItems = {}
    };
    v115:bindFunctions();
    v115:updateTopBarHeight();
end;
v76.bindFunctions = function(v116) --[[ Line: 339 ]] --[[ Name: bindFunctions ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_SearchTypes_0 (copy), v39 (copy), l_SessionType_0 (copy), v56 (copy), v25 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v69 (copy)
    local l_currentRoute_1 = v116.props.currentRoute;
    local l_name_1 = l_currentRoute_1[#l_currentRoute_1].name;
    v116.onSearchButtonActivated = function() --[[ Line: 343 ]]
        -- upvalues: v116 (copy), l_name_1 (copy), l_AvatarScreen_0 (ref)
        if not v116.isMounted then
            return;
        else
            v116:setIsSearching(true);
            v116.props.analytics.reportSearchButtonClick(l_name_1);
            if v116.props.shouldNavigateToSearchLandingPage then
                v116:setIsSearching(false);
                v116.props.navigation.navigate(l_AvatarScreen_0.CatalogSearchLanding);
            end;
            return;
        end;
    end;
    v116.onExitSearch = function() --[[ Line: 358 ]]
        -- upvalues: v116 (copy)
        if not v116.isMounted then
            return;
        else
            v116:setIsSearching(false);
            return;
        end;
    end;
    v116.cancelSearchCallback = function() --[[ Line: 366 ]]
        -- upvalues: v116 (copy), l_SearchTypes_0 (ref), v39 (ref), l_name_1 (copy)
        if not v116.isMounted then
            return;
        else
            local l_searchType_0 = v116.props.searchType;
            local v120 = l_searchType_0 == l_SearchTypes_0.Auto;
            if l_searchType_0 == l_SearchTypes_0.Games or v120 then
                v39(v116.props.eventIngest, "games", "cancel", nil, v120, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.TopResults then
                v39(v116.props.eventIngest, l_SearchTypes_0.TopResults, "cancel", nil, nil, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.Players then
                v39(v116.props.eventIngest, "players", "cancel", nil, nil, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.Catalog then
                v116.props.analytics.reportSearchCanceled("catalog");
            end;
            v116.onExitSearch();
            return;
        end;
    end;
    v116.cancelSearchAndEndSession = function() --[[ Line: 391 ]]
        -- upvalues: v116 (copy), l_SessionType_0 (ref)
        v116.cancelSearchCallback();
        if v116.props.sessionService:SessionExists(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete) then
            v116.props.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
        end;
    end;
    v116.onSearchBarFocused = function() --[[ Line: 399 ]]
        -- upvalues: v116 (copy), l_SearchTypes_0 (ref), l_SessionType_0 (ref), v39 (ref), l_name_1 (copy)
        if not v116.isMounted then
            return;
        else
            local l_searchType_1 = v116.props.searchType;
            local v122 = l_searchType_1 == l_SearchTypes_0.Auto;
            if l_searchType_1 == l_SearchTypes_0.Games or v122 or l_searchType_1 == l_SearchTypes_0.TopResults then
                if v116.props.enableSearchAutoComplete then
                    v116.props.sessionService:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
                end;
                v39(v116.props.eventIngest, if l_searchType_1 == l_SearchTypes_0.TopResults then l_SearchTypes_0.TopResults else "games", "open", nil, v122, l_name_1);
            elseif l_searchType_1 == l_SearchTypes_0.Players then
                v39(v116.props.eventIngest, "players", "open", nil, nil, l_name_1);
            elseif l_searchType_1 == l_SearchTypes_0.Catalog then
                v116.props.analytics.reportSearchFocused("catalog");
            end;
            v116:setIsSearching(true);
            return;
        end;
    end;
    v116.onTextCleared = function() --[[ Line: 433 ]]
        -- upvalues: v116 (copy)
        if not v116.isMounted then
            return;
        else
            return;
        end;
    end;
    v116.confirmSearchCallback = function(v123, v124, v125) --[[ Line: 439 ]]
        -- upvalues: v116 (copy), v56 (ref), v25 (ref), l_SearchTypes_0 (ref)
        if not v116.isMounted then
            return;
        else
            local l_searchType_2 = v116.props.searchType;
            local v127 = {
                isAutocompleteSuggestion = v124, 
                allAutocompleteSuggestions = v125, 
                searchType = l_searchType_2, 
                isAvatarAutocompleteEnabled = v56(), 
                navigation = v116.props.navigation, 
                pageOwner = v116:getPageOwner(), 
                sessionService = v116.props.sessionService, 
                eventIngest = v116.props.eventIngest, 
                topBarAnalytics = v116.props.analytics
            };
            v116.props.confirmSearch(v123, v127);
            if v25.isSearchTypeInOmniSearch(l_searchType_2) or l_searchType_2 == l_SearchTypes_0.Catalog then
                v116.onExitSearch();
            end;
            if v56() and v116.props.onConfirmSearchCallback then
                v116.props.onConfirmSearchCallback();
            end;
            return;
        end;
    end;
    v116.absolutePositionChangedCallback = function(v128) --[[ Line: 467 ]]
        -- upvalues: v116 (copy)
        v116:setState({
            absolutePosition = v128.AbsolutePosition
        });
    end;
    v116.searchSignalCallback = function(v129) --[[ Line: 473 ]]
        -- upvalues: v116 (copy)
        if v116:getPageOwner() == v129 then
            v116.onSearchButtonActivated();
        end;
    end;
    v116.renderNavigation = function(v130) --[[ Line: 479 ]]
        -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (ref), v116 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (ref), v69 (ref)
        local v131 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v116:shouldShowCenterItem() and v116.centerItemRef or v116:getFirstRightItemRef() or v116.props.NextSelectionRight;
        return v116:renderTopBarItem(v116.props.leftItem, nil, v131, nil, nil, if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v69 then v130 else nil, if v69 then v116.props.navigation.state.routeName else nil);
    end;
    v116.renderCenter = function() --[[ Line: 498 ]]
        -- upvalues: v116 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (ref)
        local v132 = v116:shouldShowLeftItem();
        local l_centerItem_0 = v116.props.centerItem;
        local v134 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v132 and v116.leftItemRef or nil;
        local v135 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v116:getFirstRightItemRef() or v116.props.NextSelectionRight;
        if v116.props.useParentSizeForCenterItem then
            return v116:renderTopBarItem(l_centerItem_0, v134, v135, nil, true);
        else
            return v116:renderTopBarItem(l_centerItem_0, v134, v135);
        end;
    end;
end;
v76.isSearchPageOverlayEnabled = function(v136) --[[ Line: 524 ]] --[[ Name: isSearchPageOverlayEnabled ]]
    -- upvalues: v71 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_FFlagSearchOmniAutocompletePageIXP_0 (copy)
    if v71 then
        return l_FFlagSearchOmniAutocompletePage_0;
    else
        return not v136.props.isSpatial and l_FFlagSearchOmniAutocompletePage_0 and (not l_FFlagSearchOmniAutocompletePageIXP_0 or v136.props.shouldShowSearchLandingPage);
    end;
end;
v76.setIsSearching = function(v137, v138) --[[ Line: 534 ]] --[[ Name: setIsSearching ]]
    v137:setState({
        isSearching = v138
    });
    if v137.props.setDefaultRefOverride then
        local v139 = if v138 then v137.searchBarRef else nil;
        v137.props.setDefaultRefOverride(v139);
    end;
end;
v76.didMount = function(v140) --[[ Line: 544 ]] --[[ Name: didMount ]]
    v140.isMounted = true;
end;
v76.willUnmount = function(v141) --[[ Line: 548 ]] --[[ Name: willUnmount ]]
    v141.isMounted = false;
end;
v76.isCompactViewMode = function(v142) --[[ Line: 552 ]] --[[ Name: isCompactViewMode ]]
    -- upvalues: l_FormFactor_0 (copy)
    local l_formFactor_0 = v142.props.formFactor;
    return v142.props.forceCompactMode or l_formFactor_0 == l_FormFactor_0.COMPACT;
end;
v76.getPageNameLocalizationKey = function(v144) --[[ Line: 560 ]] --[[ Name: getPageNameLocalizationKey ]]
    -- upvalues: v36 (copy)
    local l_name_2 = v144.props.currentRoute[1].name;
    return v36[v144.props.navigation.state.routeName] or v36[l_name_2];
end;
v76.maybeRenderRightItems = function(v146, v147, v148, v149) --[[ Line: 569 ]] --[[ Name: maybeRenderRightItems ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy)
    if v148 then
        return {};
    elseif l_FFlagEnableAppNavGamepadRemoval_0 then
        local l_rightItems_0 = v146.props.rightItems;
        local v151 = {};
        for v152, v153 in ipairs(l_rightItems_0) do
            v151["topBarItem_" .. tostring(v152)] = v146:renderTopBarItem(v153, nil, nil, v152);
        end;
        return v151;
    else
        return v146:renderRightItems(v147, if v146:shouldShowCenterItem() then v146.centerItemRef else if v149 then v146.leftItemRef else nil);
    end;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v76.renderRightItems = function(v154, _, v156) --[[ Line: 600 ]] --[[ Name: renderRightItems ]]
        local v157 = {};
        v157 = v154.props.rightItems;
        local v158 = {};
        local function v161(v159) --[[ Line: 607 ]] --[[ Name: nextRef ]]
            -- upvalues: v157 (ref), v154 (copy)
            while true do
                if v159 < #v157 then
                    v159 = v159 + 1;
                    local v160 = v157[v159];
                    if not v154.state.hiddenItems[v160] then
                        return v154.rightItemRefs[v160];
                    end;
                else
                    return nil;
                end;
            end;
        end;
        local function v164(v162) --[[ Line: 619 ]] --[[ Name: prevRef ]]
            -- upvalues: v157 (ref), v154 (copy)
            while true do
                if v162 > 1 then
                    v162 = v162 - 1;
                    local v163 = v157[v162];
                    if not v154.state.hiddenItems[v163] then
                        return v154.rightItemRefs[v163];
                    end;
                else
                    return nil;
                end;
            end;
        end;
        for v165, v166 in ipairs(v157) do
            local v167 = v164(v165) or v156;
            local v168 = v161(v165);
            v158["topBarItem_" .. tostring(v165)] = v154:renderTopBarItem(v166, v167, v168, v165);
        end;
        return v158;
    end;
end;
v76.renderTopBarItem = function(v169, v170, v171, v172, v173, v174, v175, v176) --[[ Line: 641 ]] --[[ Name: renderTopBarItem ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy), v11 (copy), l_Focusable_0 (copy), l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v69 (copy)
    local l_formFactor_1 = v169.props.formFactor;
    local l_isSearching_0 = v169.state.isSearching;
    local l_isSecondary_0 = v169.props.isSecondary;
    local v180 = v169:isCompactViewMode();
    local v181 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v169:getItemRef(v170);
    local v182 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v169:getItemDefaultChildRef(v170);
    local v183 = not v169.state.hiddenItems[v170];
    return v11.createElement(l_FFlagEnableAppNavGamepadRemoval_0 and "Frame" or l_Focusable_0.Frame, {
        AutomaticSize = if not v174 then if l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0() then Enum.AutomaticSize.XY else Enum.AutomaticSize.X else nil, 
        Size = if not v174 then if l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0() then UDim2.fromScale(0, 0) else UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v173, 
        NextSelectionLeft = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v171, 
        NextSelectionRight = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v172, 
        [v11.Ref] = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v181, 
        defaultChild = v182, 
        Visible = v183
    }, {
        Button = v11.createElement(v170, {
            formFactor = l_formFactor_1, 
            isCompactView = v180, 
            isSearching = l_isSearching_0, 
            isSecondary = l_isSecondary_0, 
            cancelSearch = v169.cancelSearchAndEndSession, 
            activateSearch = v169.onSearchButtonActivated, 
            setVisible = v169:getButtonVisibilityCallback(v170), 
            buttonRef = v182, 
            titleText = if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v69 then v175 else nil, 
            routeName = if v69 then v176 else nil
        })
    });
end;
v76.shouldShowLeftItem = function(v184) --[[ Line: 690 ]] --[[ Name: shouldShowLeftItem ]]
    local l_leftItem_0 = v184.props.leftItem;
    return if l_leftItem_0 then not v184.state.hiddenItems[l_leftItem_0] and (not v184.state.isSearching or false) else false;
end;
v76.shouldShowCenterItem = function(v186) --[[ Line: 695 ]] --[[ Name: shouldShowCenterItem ]]
    local l_centerItem_1 = v186.props.centerItem;
    return l_centerItem_1 and not v186.state.hiddenItems[l_centerItem_1] or false;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v76.getItemRef = function(v188, v189) --[[ Line: 701 ]] --[[ Name: getItemRef ]]
        if v189 == nil then
            return nil;
        elseif v189 == v188.props.leftItem then
            return v188.leftItemRef;
        elseif v189 == v188.props.centerItem then
            return v188.centerItemRef;
        else
            return v188.rightItemRefs[v189];
        end;
    end;
    v76.getItemDefaultChildRef = function(v190, v191) --[[ Line: 708 ]] --[[ Name: getItemDefaultChildRef ]]
        if v191 == nil then
            return nil;
        else
            return v190.itemDefaultChildRefs[v191];
        end;
    end;
end;
v76.hasSearchButton = function(v192) --[[ Line: 713 ]] --[[ Name: hasSearchButton ]]
    -- upvalues: v51 (copy)
    local l_rightItems_1 = v192.props.rightItems;
    for _, v195 in ipairs(l_rightItems_1) do
        if v195 == v51 then
            return true;
        end;
    end;
    return false;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v76.getFirstRightItemRef = function(v196) --[[ Line: 724 ]] --[[ Name: getFirstRightItemRef ]]
        local l_rightItems_2 = v196.props.rightItems;
        for _, v199 in ipairs(l_rightItems_2) do
            if not v196.state.hiddenItems[v199] then
                return v196.rightItemRefs[v199];
            end;
        end;
        return nil;
    end;
end;
v76.getButtonVisibilityCallback = function(v200, v201) --[[ Line: 735 ]] --[[ Name: getButtonVisibilityCallback ]]
    -- upvalues: v8 (copy)
    local v202 = v200.buttonVisibilityCallbacks[v201];
    if not v202 then
        v202 = function(v203) --[[ Line: 738 ]]
            -- upvalues: v200 (copy), v8 (ref), v201 (copy)
            v200:setState(function(v204) --[[ Line: 739 ]]
                -- upvalues: v8 (ref), v201 (ref), v203 (copy)
                return {
                    hiddenItems = v8.Dictionary.join(v204.hiddenItems, {
                        [v201] = not v203 or v8.None
                    })
                };
            end);
        end;
        v200.buttonVisibilityCallbacks[v201] = v202;
    end;
    return v202;
end;
v76.getRenderSearchBar = function(v205, v206, v207, v208, v209, v210, v211, v212, _) --[[ Line: 752 ]] --[[ Name: getRenderSearchBar ]]
    -- upvalues: v11 (copy), v37 (copy), l_SearchTypes_0 (copy), v56 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v25 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy)
    if v206 then
        return function() --[[ Line: 763 ]]
            -- upvalues: v11 (ref), v37 (ref), v205 (copy), v207 (copy), v208 (copy), v209 (copy), v210 (copy), l_SearchTypes_0 (ref), v56 (ref), l_FFlagEnableAppNavGamepadRemoval_0 (ref), v211 (copy), v212 (copy), v25 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref)
            local l_createElement_0 = v11.createElement;
            local l_v37_0 = v37;
            local v216 = {
                cancelSearch = v205.cancelSearchCallback, 
                confirmSearch = v205.confirmSearchCallback, 
                onFocused = v205.onSearchBarFocused, 
                onTextCleared = v205.onTextCleared, 
                isCompactView = v207, 
                placeholderText = v208, 
                searchType = v209
            };
            local l_v210_0 = v210;
            if l_v210_0 then
                local l_v209_0 = v209;
                l_v210_0 = true;
                if l_v209_0 ~= l_SearchTypes_0.Games then
                    l_v210_0 = true;
                    if l_v209_0 ~= l_SearchTypes_0.Auto then
                        l_v210_0 = true;
                        if l_v209_0 ~= l_SearchTypes_0.TopResults then
                            l_v210_0 = v56() and l_v209_0 == l_SearchTypes_0.Catalog;
                        end;
                    end;
                end;
            end;
            v216.autocomplete = l_v210_0;
            v216[v11.Ref] = v205.searchBarRef;
            v216.focusController = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v205.props.focusController;
            v216.isSearching = v205.state.isSearching;
            v216.animated = v211;
            v216.initialSearchText = v205.props.searchParameters and v205.props.searchParameters.searchKeyword or "";
            v216.searchBarPadding = v212 and 0 or nil;
            v216.searchPageOverlayEnabled = if v205:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v209) else nil;
            v216.disableListPicker = if v205:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v209) else nil;
            v216.onExitSearch = if l_FFlagSearchOmniAutocompletePage_0 then v205.onExitSearch else nil;
            return l_createElement_0(l_v37_0, v216);
        end;
    else
        return nil;
    end;
end;
v76.getRenderRootSearchBar = function(v219, v220, v221, v222, v223, v224, v225, _) --[[ Line: 792 ]] --[[ Name: getRenderRootSearchBar ]]
    -- upvalues: v11 (copy), v37 (copy), l_NON_COMPACT_SEARCH_BAR_SIZE_0 (copy), l_SearchTypes_0 (copy), v56 (copy), v25 (copy)
    if not v220 and v221 and not v222 then
        return function() --[[ Line: 802 ]]
            -- upvalues: v11 (ref), v37 (ref), l_NON_COMPACT_SEARCH_BAR_SIZE_0 (ref), v219 (copy), v223 (copy), v222 (copy), v224 (copy), v225 (copy), l_SearchTypes_0 (ref), v56 (ref), v25 (ref)
            local l_createElement_1 = v11.createElement;
            local l_v37_1 = v37;
            local v229 = {
                Size = UDim2.new(0, l_NON_COMPACT_SEARCH_BAR_SIZE_0, 1, 0), 
                cancelSearch = v219.cancelSearchCallback, 
                confirmSearch = v219.confirmSearchCallback, 
                onFocused = v219.onSearchBarFocused, 
                onTextCleared = v219.onTextCleared, 
                placeholderText = v223, 
                isCompactView = v222, 
                modernUI = true, 
                searchType = v224
            };
            local l_v225_0 = v225;
            if l_v225_0 then
                local l_v224_0 = v224;
                l_v225_0 = true;
                if l_v224_0 ~= l_SearchTypes_0.Games then
                    l_v225_0 = true;
                    if l_v224_0 ~= l_SearchTypes_0.Auto then
                        l_v225_0 = true;
                        if l_v224_0 ~= l_SearchTypes_0.TopResults then
                            l_v225_0 = v56() and l_v224_0 == l_SearchTypes_0.Catalog;
                        end;
                    end;
                end;
            end;
            v229.autocomplete = l_v225_0;
            v229.isSearching = v219.state.isSearching;
            v229.initialSearchText = v219.props.searchParameters and v219.props.searchParameters.searchKeyword or "";
            v229[v11.Ref] = v219.searchBarRef;
            v229.searchPageOverlayEnabled = if v219:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v224) else nil;
            v229.disableListPicker = if v219:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v224) else nil;
            return l_createElement_1(l_v37_1, v229);
        end;
    else
        return nil;
    end;
end;
v76.renderAppHeaderBar = function(v232, v233, v234, v235, v236, v237, v238, v239) --[[ Line: 829 ]] --[[ Name: renderAppHeaderBar ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v69 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), v49 (copy), v72 (ref), v11 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_LayoutConfig_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), l_AppHeaderBar_0 (copy)
    local l_Tokens_0 = v234.Tokens;
    local v241 = {};
    local l_tokens_2 = v232.props.tokens;
    v241.barHeight = l_NAV_BAR_SIZE_0 * l_tokens_2.Config.UI.Scale;
    local v243 = (not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v69) and function() --[[ Line: 843 ]]
        -- upvalues: v232 (copy), v237 (copy), v233 (copy)
        return v232.renderNavigation(v237 or v233.pageTitle);
    end or v232.renderNavigation;
    v241.renderNavigation = if v239 then v243 else nil;
    l_tokens_2 = v232.props.centerItem;
    v241.title = v237 or v233.pageTitle;
    v241.isTitleCentered = v239 and not v232.props.isSecondary or false;
    v241.titleFontStyle = if not not v239 or v232.props.isSecondary then l_Tokens_0.Semantic.Typography.Header else l_Tokens_0.Semantic.Typography.Title;
    if l_tokens_2 then
        v241.title = "";
    elseif v232.state.isSearching then
        v241.title = "";
    elseif l_FFlagLuaAppMoveProfileIntoTopBar_0 and (not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar()) and v239 and v49(v232.props.currentRoute[1].name, v232.props.currentRoute[#v232.props.currentRoute].name, v232.props.formFactor, v232.state.isSearching) then
        v241.title = "";
    elseif v69 and v239 and v72(v232.props.navigation.state.routeName, v232.props.currentRoute[#v232.props.currentRoute].name, v232.state.isSearching) then
        v241.title = "";
    end;
    v241.shouldRenderTitle = true;
    v241.shouldRenderCenter = true;
    if v235 or v236 then
        v241.renderCenter = v235 or v236;
    elseif l_tokens_2 then
        v241.renderCenter = v232.renderCenter;
    end;
    v241.renderUtilities = if v235 then nil else function() --[[ Line: 895 ]]
        -- upvalues: v11 (ref), v238 (copy)
        return v11.createFragment(v238);
    end;
    local l_gridConfig_0 = v232.props.gridConfig;
    local v245 = UDim.new(0, if l_FFlagLuaAppCompositionSupport_0 then v232.props.sideMarginOverride or l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingHorizontal] else l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingHorizontal]);
    local v246 = UDim.new(0, l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingRightItems]);
    v241.utilitiesGap = if l_FFlagEnableHeaderBarButtonsUpdate_0 then UDim.new(0, v232.props.tokens.Size.Size_100) else v246;
    v241.paddingLeft = v245;
    v241.paddingRight = if l_FFlagEnableHeaderBarButtonsUpdate_0 then v245 - UDim.new(0, v232.props.tokens.Size.Size_100) else v245;
    v241.paddingTop = UDim.new(0, 0);
    v241.paddingBottom = UDim.new(0, 0);
    v241.backgroundStyle = if v232.props.transparentBackground then {
        Color3 = Color3.new(0, 0, 0), 
        Transparency = 1
    } else nil;
    v241.onMedia = false;
    return v11.createElement(l_AppHeaderBar_0, v241);
end;
v76.renderWithProviders = function(v247, v248, v249, v250) --[[ Line: 927 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_LayoutConfig_0 (copy), l_NAV_BAR_SIZE_0 (copy), l_SearchTypes_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v54 (copy), l_VisibilityControl_0 (copy), l_FFlagAppIaStatusBar_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy), l_FlyoutSidePanelIXP_0 (copy), v11 (copy), v10 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_Focusable_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v47 (copy)
    local l_titleText_0 = v247.props.titleText;
    local v252 = v247:shouldShowLeftItem();
    local v253 = v247:hasSearchButton() and v247.props.enableSearch;
    local l_searchType_3 = v247.props.searchType;
    local l_enableSearchAutoComplete_0 = v247.props.enableSearchAutoComplete;
    local l_ZIndex_0 = v247.props.ZIndex;
    local v257 = v247.props.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
    local l_statusBarHeight_2 = v247.props.statusBarHeight;
    local l_tokens_3 = v247.props.tokens;
    l_tokens_3 = l_statusBarHeight_2 + l_NAV_BAR_SIZE_0 * l_tokens_3.Config.UI.Scale + v257;
    local v260 = l_tokens_3 + v247.props.totalBannerHeight;
    local v261 = v247:isCompactViewMode();
    local l_searchPlaceholderSearchGames_0 = v250.searchPlaceholderSearchGames;
    if l_searchType_3 == l_SearchTypes_0.Catalog then
        l_searchPlaceholderSearchGames_0 = v250.searchPlaceholderSearchMarketplace;
    end;
    local v263 = v261 and (v247.state.isSearching or v247.props.showSearchBar);
    local v264 = not v247.props.showSearchBar;
    local v265 = v247:maybeRenderRightItems(v249, v263, v252);
    local v266 = v247:getRenderSearchBar(v263, v261, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0, v264, v252);
    local v267 = v247:getRenderRootSearchBar(v263, v253, v261, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0);
    local v268 = {
        Active = true, 
        BackgroundColor3 = v249.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v247.props.transparentBackground and 1 or v249.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, l_tokens_3), 
        ZIndex = 2
    };
    local v269 = UDim2.new(0, v247.props.screenSize.X, 0, v247.props.screenSize.Y);
    local v270 = UDim2.new(0, -v247.state.absolutePosition.X, 0, -v247.state.absolutePosition.Y);
    local l_forwardRef_0 = v247.props.forwardRef;
    local v272 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else if v267 or v261 and v247.state.isSearching then v247.searchBarRef else if v247:shouldShowLeftItem() then v247.leftItemRef else if v247:shouldShowCenterItem() then v247.centerItemRef else v247:getFirstRightItemRef();
    local v275 = if l_FFlagAppIaScrollAway_0 and v54.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v273) --[[ Line: 1006 ]]
        -- upvalues: l_FFlagAppIaStatusBar_0 (ref), l_FFlagAppIaHomeSubTab_0 (ref), l_FlyoutSidePanelIXP_0 (ref), v260 (copy), l_statusBarHeight_2 (copy)
        local v274 = if l_FFlagAppIaStatusBar_0 and l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then (v273 - 1) * (v260 - l_statusBarHeight_2) else (v273 - 1) * v260;
        return UDim2.new(0, 0, 0, v274);
    end) else nil;
    local l_createElement_2 = v11.createElement;
    local v277 = "Frame";
    local v278 = {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0, 
        [v10.Tag] = if l_FFlagLuaAppCompositionSupport_0 then v247.props.tag else nil, 
        [v11.Change.AbsolutePosition] = v247.absolutePositionChangedCallback
    };
    local v279 = {};
    local l_createElement_3 = v11.createElement;
    local v281 = "Frame";
    local v282 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v260), 
        Position = v275
    };
    local v283 = {};
    local l_createElement_4 = v11.createElement;
    local v285 = "Frame";
    local l_v268_0 = v268;
    local v287 = {};
    local l_createElement_5 = v11.createElement;
    local v289 = l_FFlagEnableAppNavGamepadRemoval_0 and "Frame" or l_Focusable_0.Frame;
    local v290 = {
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundColor3 = v249.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v247.props.transparentBackground and 1 or v249.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 1, 0)
    };
    local l_new_0 = UDim2.new;
    local v292 = 1;
    local v293 = 0;
    local v294 = 0;
    local l_tokens_4 = v247.props.tokens;
    v290.Size = l_new_0(v292, v293, v294, l_NAV_BAR_SIZE_0 * l_tokens_4.Config.UI.Scale);
    v290[v11.Ref] = l_forwardRef_0;
    v290.NextSelectionRight = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else not (v261 and v247.state.isSearching) and v247.props.NextSelectionRight or nil;
    v290.NextSelectionDown = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else not (v261 and v247.state.isSearching) and v247.props.NextSelectionDown or nil;
    v290.defaultChild = v272;
    v287.NavBar = l_createElement_5(v289, v290, {
        AppHeaderBar = v247:renderAppHeaderBar(v250, v249, v266, v267, l_titleText_0, v265, v252)
    });
    v283.TopBar = l_createElement_4(v285, l_v268_0, v287);
    v283.BannerContainer = v11.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.new(0, 0, 0, l_tokens_3), 
        BackgroundTransparency = 1
    }, v247.props.bannerContainer);
    v279.TopBarContents = l_createElement_3(v281, v282, v283);
    v279.DarkOverlay = v11.createElement("TextButton", {
        Size = v269, 
        Position = v270, 
        AutoButtonColor = false, 
        BackgroundColor3 = v249.Theme.Overlay.Color, 
        BackgroundTransparency = 1, 
        Text = "", 
        Visible = v247.state.isSearching, 
        [v11.Event.Activated] = v247.cancelSearchAndEndSession, 
        ZIndex = 1
    });
    v279.LastInputChangedListener = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v11.createElement(l_ExternalEventConnection_0, {
        event = l_UserInputService_0.LastInputTypeChanged, 
        callback = function(v296) --[[ Line: 1080 ]] --[[ Name: callback ]]
            -- upvalues: v247 (copy)
            v247:setState({
                lastInputType = v296
            });
        end
    });
    v279.SignalConnection = v11.createElement(v47, {
        signal = v248, 
        callback = v247.searchSignalCallback
    });
    v279.HiddenItems = v247:renderHiddenItems();
    return l_createElement_2(v277, v278, v279);
end;
v76.renderHiddenItems = function(v297) --[[ Line: 1096 ]] --[[ Name: renderHiddenItems ]]
    -- upvalues: v11 (copy)
    return v11.createElement("Frame", {
        Visible = false
    }, {
        leftItem = v297.props.leftItem and not v297:shouldShowLeftItem() and v297:renderTopBarItem(v297.props.leftItem), 
        centerItem = v297.props.centerItem and not v297:shouldShowCenterItem() and v297:renderTopBarItem(v297.props.centerItem)
    });
end;
v76.render = function(v298) --[[ Line: 1107 ]] --[[ Name: render ]]
    -- upvalues: v46 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return v46(function(v299) --[[ Line: 1108 ]]
        -- upvalues: l_withStyle_0 (ref), v298 (copy), l_withLocalization_0 (ref)
        return l_withStyle_0(function(v300) --[[ Line: 1109 ]]
            -- upvalues: v298 (ref), l_withLocalization_0 (ref), v299 (copy)
            local v301 = v298:getPageNameLocalizationKey();
            return l_withLocalization_0({
                pageTitle = v301, 
                searchPlaceholderSearchGames = "Search.GlobalSearch.Example.SearchGames", 
                searchPlaceholderSearchMarketplace = "Search.GlobalSearch.Example.SearchMarketplace"
            })(function(v302) --[[ Line: 1115 ]]
                -- upvalues: v298 (ref), v299 (ref), v300 (copy)
                return v298:renderWithProviders(v299, v300, v302);
            end);
        end);
    end);
end;
v76.didUpdate = function(v303, v304, v305) --[[ Line: 1122 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy), v75 (copy)
    v303:updateTopBarHeight(v304, v305);
    if not l_FFlagEnableAppNavGamepadRemoval_0 then
        local v306 = v75[v303.state.lastInputType];
        local l_focusController_0 = v303.props.focusController;
        if v303.state.isSearching and not v305.isSearching and v306 and l_focusController_0 then
            l_focusController_0.moveFocusTo(v303.searchBarRef);
        elseif not v303.state.isSearching and v305.isSearching and v306 and l_focusController_0 then
            l_focusController_0.moveFocusTo(v303.searchButtonRef);
        end;
    end;
    v303:closeSearchBarIfLeavingPage(v304);
end;
v76.closeSearchBarIfLeavingPage = function(v308, v309) --[[ Line: 1138 ]] --[[ Name: closeSearchBarIfLeavingPage ]]
    local l_currentRoute_2 = v308.props.currentRoute;
    local l_currentRoute_3 = v309.currentRoute;
    if l_currentRoute_2[#l_currentRoute_2].name ~= l_currentRoute_3[#l_currentRoute_3].name and v308.state.isSearching == true then
        v308.onExitSearch();
    end;
    if v308.props.avatarRoute and v309.avatarRoute and v308.props.avatarRoute.opaque.key ~= v309.avatarRoute.opaque.key and v308.state.isSearching == true then
        v308.onExitSearch();
    end;
end;
local function _(v312) --[[ Line: 1159 ]] --[[ Name: isInPeekViewFromSearch ]]
    -- upvalues: v45 (copy), v29 (copy)
    local l_name_3 = v312[#v312].name;
    return (not (not v45() or l_name_3 ~= v29.GameDetail) or l_name_3 == v29.ProfilePlatform) and #v312 > 1 and v312[#v312 - 1].name == v29.SearchPage;
end;
local function _(v315) --[[ Line: 1168 ]] --[[ Name: getShowSearchBar ]]
    -- upvalues: v29 (copy), v45 (copy)
    if v315[#v315].name == v29.SearchPage then
        return true;
    else
        local l_name_4 = v315[#v315].name;
        if (not (not v45() or l_name_4 ~= v29.GameDetail) or l_name_4 == v29.ProfilePlatform) and #v315 > 1 and v315[#v315 - 1].name == v29.SearchPage then
            return true;
        else
            return false;
        end;
    end;
end;
local function v322(v318) --[[ Line: 1180 ]] --[[ Name: getCurrentOpaquePage ]]
    -- upvalues: v30 (copy)
    for v319 = #v318, 1, -1 do
        local l_name_5 = v318[v319].name;
        local v321 = v30[l_name_5];
        if v321 == nil or not v321.renderUnderlyingPage then
            return l_name_5;
        end;
    end;
    return nil;
end;
v76 = v40(function(v323, v324) --[[ Line: 1192 ]]
    -- upvalues: l_FFlagLuaAppCompositionSupport_0 (copy), l_getPageMargin_0 (copy), l_withGridConfig_DEPRECATED_0 (copy), l_LayoutConfig_0 (copy), v11 (copy), v8 (copy)
    local v325 = if l_FFlagLuaAppCompositionSupport_0 then v324.sideMarginOverride or l_getPageMargin_0(v324.screenSize.X) else l_getPageMargin_0(v324.screenSize.X);
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingRightItems] = 0, 
        [l_LayoutConfig_0.Keys.PaddingHorizontal] = v325, 
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v326) --[[ Line: 1201 ]]
        -- upvalues: v11 (ref), v323 (copy), v8 (ref), v324 (copy)
        return v11.createElement(v323, v8.Dictionary.join(v324, {
            gridConfig = v326
        }));
    end);
end)(v76);
v76 = v12.connect(function(v327, _) --[[ Line: 1211 ]]
    -- upvalues: v29 (copy), v45 (copy), v322 (copy)
    local v329 = v327.Navigation.history[#v327.Navigation.history];
    local v330 = {
        screenSize = v327.ScreenSize, 
        formFactor = v327.FormFactor, 
        currentRoute = v329
    };
    local v331;
    if v329[#v329].name == v29.SearchPage then
        v331 = true;
    else
        local l_name_6 = v329[#v329].name;
        v331 = (not (not v45() or l_name_6 ~= v29.GameDetail) or l_name_6 == v29.ProfilePlatform) and #v329 > 1 and v329[#v329 - 1].name == v29.SearchPage and true or false;
    end;
    v330.showSearchBar = v331;
    v330.statusBarHeight = v327.TopBar.statusBarHeight;
    v330.opaquePage = v322(v329);
    return v330;
end, function(v333) --[[ Line: 1222 ]]
    -- upvalues: v28 (copy), v31 (copy)
    return {
        confirmSearch = function(v334, v335) --[[ Line: 1224 ]] --[[ Name: confirmSearch ]]
            -- upvalues: v333 (copy), v28 (ref)
            return v333(v28(v334, v335));
        end, 
        setTopBarHeight = function(v336) --[[ Line: 1227 ]] --[[ Name: setTopBarHeight ]]
            -- upvalues: v333 (copy), v31 (ref)
            return v333(v31(v336));
        end
    };
end)(v76);
v76 = l_RoactServices_0.connect({
    analytics = v18, 
    sessionService = l_AppSessionService_0, 
    eventIngest = v21
})(v76);
v76 = l_RoactAppPolicy_0.connect(function(v337, _) --[[ Line: 1239 ]]
    return {
        enableNotifications = v337.getNotifications(), 
        enableSearch = v337.getSearchBar(), 
        enableSearchAutoComplete = v337.getSearchAutoComplete()
    };
end)(v76);
v76 = v48(v16.withNavigation(v76), {
    required = false
});
if not v71 and l_FFlagSearchOmniAutocompletePageIXP_0 then
    v76 = v23.connectUserLayer({
        v62
    }, function(v339, _) --[[ Line: 1253 ]]
        -- upvalues: v62 (copy)
        return {
            shouldShowSearchLandingPage = (v339[v62] or {}).shouldShowSearchLandingPage
        };
    end, false)(v76);
end;
local l_v76_0 = v76;
v76 = function(v342) --[[ Line: 1263 ]]
    -- upvalues: v44 (copy), l_useIsSpatial_0 (copy), l_useTokens_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v11 (copy), l_v76_0 (copy), v8 (copy), v15 (copy)
    local l_hideSiteMessageBanner_0 = v342.hideSiteMessageBanner;
    local v344, v345 = v44(l_hideSiteMessageBanner_0);
    local v346 = l_useIsSpatial_0();
    local v347 = l_useTokens_0();
    if l_FFlagEnableAppNavGamepadRemoval_0 then
        return v11.createElement(l_v76_0, v8.Dictionary.join(v342, {
            bannerContainer = v344, 
            totalBannerHeight = v345, 
            isSpatial = v346, 
            tokens = v347
        }));
    else
        return v15.withFocusController(function(v348) --[[ Line: 1281 ]]
            -- upvalues: v11 (ref), l_v76_0 (ref), v8 (ref), v342 (copy), v344 (copy), v345 (copy), v346 (copy), v347 (copy)
            return v11.createElement(l_v76_0, v8.Dictionary.join(v342, {
                focusController = v348, 
                bannerContainer = v344, 
                totalBannerHeight = v345, 
                isSpatial = v346, 
                tokens = v347
            }));
        end);
    end;
end;
return v11.forwardRef(function(v349, v350) --[[ Line: 1296 ]]
    -- upvalues: v11 (copy), v76 (ref), v8 (copy)
    return v11.createElement(v76, v8.Dictionary.join(v349, {
        forwardRef = v350
    }));
end);