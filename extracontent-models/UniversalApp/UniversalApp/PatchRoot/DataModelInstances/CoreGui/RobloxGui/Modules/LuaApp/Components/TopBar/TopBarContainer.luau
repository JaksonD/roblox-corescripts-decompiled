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
local v10 = require(l_CorePackages_0.Packages.Roact);
local v11 = require(l_CorePackages_0.Packages.RoactRodux);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_FFlagEnableAppNavGamepadRemoval_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAppNavGamepadRemoval;
local v14 = require(l_CorePackages_0.Packages.RoactGamepad);
local v15 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_Focusable_0 = v14.Focusable;
local v17 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v20 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v22 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_VerticalEfficiencyExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation;
local v24 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local l_SearchConstants_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.SearchConstants;
local v26 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local v27 = require(l_Modules_0.LuaApp.Thunks.ConfirmSearch);
local v28 = require(l_Modules_0.LuaApp.AppPage);
local v29 = require(l_Modules_0.LuaApp.AppPageProperties);
local v30 = require(l_Modules_0.LuaApp.Actions.SetTopBarHeight);
local v31 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v34 = require(l_Modules_0.LuaApp.Constants);
local v35 = require(l_Modules_0.LuaApp.AppPageLocalizationKeys);
local v36 = require(l_Modules_0.LuaApp.Components.SearchBar);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v38 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local v39 = require(l_Modules_0.LuaApp.Common.wrapComponent);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v43 = require(l_Modules_0.LuaApp.Components.Banner.useBannerContainer);
local v44 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local v45 = require(l_Modules_0.LuaApp.Context.withTopBarSearchSignal);
local v46 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local v47 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v48 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.shouldShowProfileInHeaderBar);
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v50 = require(script.Parent.Buttons.SearchButton);
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local l_AppHeaderBar_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).AppHeaderBar;
local v53 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_VisibilityControl_0 = v53.VisibilityControl;
local v55 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagSearchOmniAutocompletePageIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePageIXP;
local l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppFixAppNavHeaderIconsAlignment;
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP;
local v61 = game:DefineFastString("LuaAppSlpIxpLayer", "Growth.Omnisearch.SearchLandingPage");
local v62 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v62.FFlagAppIaScrollAway;
local l_FFlagAppIaHomeSubTab_0 = v62.FFlagAppIaHomeSubTab;
local l_FFlagAppIaStatusBar_0 = v62.FFlagAppIaStatusBar;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v62.FFlagEnableHeaderBarButtonsUpdate;
local v67 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v68 = game:DefineFastFlag("LuaAppEnableSlpForVr", false);
local v69 = nil;
if v67 then
    v69 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).Utils.shouldShowLeftHeader;
end;
local l_NAV_BAR_SIZE_0 = v34.NAV_BAR_SIZE;
local l_NON_COMPACT_SEARCH_BAR_SIZE_0 = l_SearchConstants_0.NON_COMPACT_SEARCH_BAR_SIZE;
local v72 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v73 = v10.Component:extend("TopBarContainer");
v73.validateProps = v7.strictInterface({
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
    tokens = v7.table
});
v73.defaultProps = {
    searchType = l_SearchTypes_0.Games, 
    enableSearch = false, 
    ZIndex = 2, 
    onConfirmSearchCallback = nil, 
    hideSiteMessageBanner = false, 
    forceCompactMode = false, 
    transparentBackground = false, 
    rightItems = {}
};
local function _(v74, v75) --[[ Line: 207 ]] --[[ Name: applyTokenScaling ]]
    return v74 * v75.Config.UI.Scale;
end;
local function _(v77) --[[ Line: 211 ]] --[[ Name: calculateNavBarSize ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy)
    return l_NAV_BAR_SIZE_0 * v77.Config.UI.Scale;
end;
local _ = function(v79, _) --[[ Line: 215 ]] --[[ Name: calculateTopBarHeight ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_LayoutConfig_0 (copy)
    local l_statusBarHeight_0 = v79.statusBarHeight;
    local _ = nil;
    local l_tokens_0 = v79.tokens;
    return l_statusBarHeight_0 + l_NAV_BAR_SIZE_0 * l_tokens_0.Config.UI.Scale + math.round(v79.totalBannerHeight) + 2 * v79.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
end;
local function _(v85) --[[ Line: 226 ]]
    -- upvalues: l_SearchTypes_0 (copy), v55 (copy)
    local v86 = true;
    if v85 ~= l_SearchTypes_0.Games then
        v86 = true;
        if v85 ~= l_SearchTypes_0.Auto then
            v86 = true;
            if v85 ~= l_SearchTypes_0.TopResults then
                v86 = v55() and v85 == l_SearchTypes_0.Catalog;
            end;
        end;
    end;
    return v86;
end;
v73.shouldUpdate = function(v88, v89, v90) --[[ Line: 232 ]] --[[ Name: shouldUpdate ]]
    -- upvalues: v9 (copy)
    if v90 ~= v88.state then
        return true;
    elseif v89 == v88.props then
        return false;
    else
        for v91, v92 in pairs(v89) do
            if v91 ~= "rightItems" and v88.props[v91] ~= v92 then
                return true;
            end;
        end;
        for v93, v94 in pairs(v88.props) do
            if v93 ~= "rightItems" and v89[v93] ~= v94 then
                return true;
            end;
        end;
        return not v9.shallowEqual(v88.props.rightItems, v89.rightItems);
    end;
end;
v73.getPageOwner = function(v95) --[[ Line: 256 ]] --[[ Name: getPageOwner ]]
    return v95.props.navigation.state.routeName;
end;
local function v102(v96) --[[ Line: 261 ]] --[[ Name: isTopPage ]]
    -- upvalues: l_FFlagAppIaHomeSubTab_0 (copy), v26 (copy), v8 (copy), v53 (copy)
    local l_currentRoute_0 = v96.currentRoute;
    local l_name_0 = l_currentRoute_0[#l_currentRoute_0].name;
    local v99 = nil;
    v99 = if v96.avatarRoute then v96.avatarRoute.opaque.name else v96.opaquePage;
    local l_routeName_0 = v96.navigation.state.routeName;
    if l_FFlagAppIaHomeSubTab_0 and l_routeName_0 == v26.Constants.HomeContainerName then
        return v8.List.find(v53.Constants.HOME_CONTAINER_SUB_TAB_PAGES, l_name_0) ~= nil;
    else
        local v101 = true;
        if l_routeName_0 ~= l_name_0 then
            v101 = l_routeName_0 == v99;
        end;
        return v101;
    end;
end;
v73.updateTopBarHeight = function(v103, v104, v105) --[[ Line: 283 ]] --[[ Name: updateTopBarHeight ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_LayoutConfig_0 (copy), v102 (copy), v31 (copy), l_FFlagAppIaScrollAway_0 (copy), v53 (copy), l_VisibilityControl_0 (copy)
    local l_props_0 = v103.props;
    local l_state_0 = v103.state;
    local l_statusBarHeight_1 = l_props_0.statusBarHeight;
    local v109 = nil;
    local l_tokens_1 = l_props_0.tokens;
    local v111 = l_statusBarHeight_1 + l_NAV_BAR_SIZE_0 * l_tokens_1.Config.UI.Scale + math.round(l_props_0.totalBannerHeight) + 2 * l_props_0.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
    l_props_0 = v102(v103.props);
    if v104 and v105 and v104.navigation == v103.props.navigation then
        l_statusBarHeight_1 = v104.statusBarHeight;
        v109 = nil;
        l_tokens_1 = v104.tokens;
        l_state_0 = l_statusBarHeight_1 + l_NAV_BAR_SIZE_0 * l_tokens_1.Config.UI.Scale + math.round(v104.totalBannerHeight) + 2 * v104.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
        l_statusBarHeight_1 = v102(v104);
        if l_state_0 == v111 and l_props_0 == l_statusBarHeight_1 then
            return;
        end;
    end;
    if l_props_0 then
        v31.GetDisplayStore().setTopBarHeight(v111);
        v103.props.setTopBarHeight(v111);
        if l_FFlagAppIaScrollAway_0 and v53.getScrollAwayEnabled() then
            l_VisibilityControl_0.setScrollDistance(v111);
        end;
    end;
end;
v73.init = function(v112) --[[ Line: 304 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v14 (copy), l_UserInputService_0 (copy)
    v112.searchBarRef = v10.createRef();
    v112.isMounted = false;
    v112.rightItemRefs = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v14.createRefCache();
    v112.itemDefaultChildRefs = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v14.createRefCache();
    v112.leftItemRef = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v10.createRef();
    v112.centerItemRef = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v10.createRef();
    v112.buttonVisibilityCallbacks = {};
    v112.state = {
        isSearching = false, 
        absolutePosition = Vector2.new(0, 0), 
        lastInputType = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else l_UserInputService_0:GetLastInputType(), 
        hiddenItems = {}
    };
    v112:bindFunctions();
    v112:updateTopBarHeight();
end;
v73.bindFunctions = function(v113) --[[ Line: 328 ]] --[[ Name: bindFunctions ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_SearchTypes_0 (copy), v38 (copy), l_SessionType_0 (copy), v55 (copy), v24 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v67 (copy)
    local l_currentRoute_1 = v113.props.currentRoute;
    local l_name_1 = l_currentRoute_1[#l_currentRoute_1].name;
    v113.onSearchButtonActivated = function() --[[ Line: 332 ]]
        -- upvalues: v113 (copy), l_name_1 (copy), l_AvatarScreen_0 (ref)
        if not v113.isMounted then
            return;
        else
            v113:setIsSearching(true);
            v113.props.analytics.reportSearchButtonClick(l_name_1);
            if v113.props.shouldNavigateToSearchLandingPage then
                v113:setIsSearching(false);
                v113.props.navigation.navigate(l_AvatarScreen_0.CatalogSearchLanding);
            end;
            return;
        end;
    end;
    v113.onExitSearch = function() --[[ Line: 347 ]]
        -- upvalues: v113 (copy)
        if not v113.isMounted then
            return;
        else
            v113:setIsSearching(false);
            return;
        end;
    end;
    v113.cancelSearchCallback = function() --[[ Line: 355 ]]
        -- upvalues: v113 (copy), l_SearchTypes_0 (ref), v38 (ref), l_name_1 (copy)
        if not v113.isMounted then
            return;
        else
            local l_searchType_0 = v113.props.searchType;
            local v117 = l_searchType_0 == l_SearchTypes_0.Auto;
            if l_searchType_0 == l_SearchTypes_0.Games or v117 then
                v38(v113.props.eventIngest, "games", "cancel", nil, v117, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.TopResults then
                v38(v113.props.eventIngest, l_SearchTypes_0.TopResults, "cancel", nil, nil, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.Players then
                v38(v113.props.eventIngest, "players", "cancel", nil, nil, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.Catalog then
                v113.props.analytics.reportSearchCanceled("catalog");
            end;
            v113.onExitSearch();
            return;
        end;
    end;
    v113.cancelSearchAndEndSession = function() --[[ Line: 380 ]]
        -- upvalues: v113 (copy), l_SessionType_0 (ref)
        v113.cancelSearchCallback();
        if v113.props.sessionService:SessionExists(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete) then
            v113.props.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
        end;
    end;
    v113.onSearchBarFocused = function() --[[ Line: 388 ]]
        -- upvalues: v113 (copy), l_SearchTypes_0 (ref), l_SessionType_0 (ref), v38 (ref), l_name_1 (copy)
        if not v113.isMounted then
            return;
        else
            local l_searchType_1 = v113.props.searchType;
            local v119 = l_searchType_1 == l_SearchTypes_0.Auto;
            if l_searchType_1 == l_SearchTypes_0.Games or v119 or l_searchType_1 == l_SearchTypes_0.TopResults then
                if v113.props.enableSearchAutoComplete then
                    v113.props.sessionService:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
                end;
                v38(v113.props.eventIngest, if l_searchType_1 == l_SearchTypes_0.TopResults then l_SearchTypes_0.TopResults else "games", "open", nil, v119, l_name_1);
            elseif l_searchType_1 == l_SearchTypes_0.Players then
                v38(v113.props.eventIngest, "players", "open", nil, nil, l_name_1);
            elseif l_searchType_1 == l_SearchTypes_0.Catalog then
                v113.props.analytics.reportSearchFocused("catalog");
            end;
            v113:setIsSearching(true);
            return;
        end;
    end;
    v113.onTextCleared = function() --[[ Line: 422 ]]
        -- upvalues: v113 (copy)
        if not v113.isMounted then
            return;
        else
            return;
        end;
    end;
    v113.confirmSearchCallback = function(v120, v121, v122) --[[ Line: 428 ]]
        -- upvalues: v113 (copy), v55 (ref), v24 (ref), l_SearchTypes_0 (ref)
        if not v113.isMounted then
            return;
        else
            local l_searchType_2 = v113.props.searchType;
            local v124 = {
                isAutocompleteSuggestion = v121, 
                allAutocompleteSuggestions = v122, 
                searchType = l_searchType_2, 
                isAvatarAutocompleteEnabled = v55(), 
                navigation = v113.props.navigation, 
                pageOwner = v113:getPageOwner(), 
                sessionService = v113.props.sessionService, 
                eventIngest = v113.props.eventIngest, 
                topBarAnalytics = v113.props.analytics
            };
            v113.props.confirmSearch(v120, v124);
            if v24.isSearchTypeInOmniSearch(l_searchType_2) or l_searchType_2 == l_SearchTypes_0.Catalog then
                v113.onExitSearch();
            end;
            if v55() and v113.props.onConfirmSearchCallback then
                v113.props.onConfirmSearchCallback();
            end;
            return;
        end;
    end;
    v113.absolutePositionChangedCallback = function(v125) --[[ Line: 456 ]]
        -- upvalues: v113 (copy)
        v113:setState({
            absolutePosition = v125.AbsolutePosition
        });
    end;
    v113.searchSignalCallback = function(v126) --[[ Line: 462 ]]
        -- upvalues: v113 (copy)
        if v113:getPageOwner() == v126 then
            v113.onSearchButtonActivated();
        end;
    end;
    v113.renderNavigation = function(v127) --[[ Line: 468 ]]
        -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (ref), v113 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (ref), v67 (ref)
        local v128 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v113:shouldShowCenterItem() and v113.centerItemRef or v113:getFirstRightItemRef() or v113.props.NextSelectionRight;
        return v113:renderTopBarItem(v113.props.leftItem, nil, v128, nil, nil, if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v67 then v127 else nil, if v67 then v113.props.navigation.state.routeName else nil);
    end;
    v113.renderCenter = function() --[[ Line: 487 ]]
        -- upvalues: v113 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (ref)
        local v129 = v113:shouldShowLeftItem();
        local l_centerItem_0 = v113.props.centerItem;
        local v131 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v129 and v113.leftItemRef or nil;
        local v132 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v113:getFirstRightItemRef() or v113.props.NextSelectionRight;
        if v113.props.useParentSizeForCenterItem then
            return v113:renderTopBarItem(l_centerItem_0, v131, v132, nil, true);
        else
            return v113:renderTopBarItem(l_centerItem_0, v131, v132);
        end;
    end;
end;
v73.isSearchPageOverlayEnabled = function(v133) --[[ Line: 513 ]] --[[ Name: isSearchPageOverlayEnabled ]]
    -- upvalues: v68 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_FFlagSearchOmniAutocompletePageIXP_0 (copy)
    if v68 then
        return l_FFlagSearchOmniAutocompletePage_0;
    else
        return not v133.props.isSpatial and l_FFlagSearchOmniAutocompletePage_0 and (not l_FFlagSearchOmniAutocompletePageIXP_0 or v133.props.shouldShowSearchLandingPage);
    end;
end;
v73.setIsSearching = function(v134, v135) --[[ Line: 523 ]] --[[ Name: setIsSearching ]]
    v134:setState({
        isSearching = v135
    });
    if v134.props.setDefaultRefOverride then
        local v136 = if v135 then v134.searchBarRef else nil;
        v134.props.setDefaultRefOverride(v136);
    end;
end;
v73.didMount = function(v137) --[[ Line: 533 ]] --[[ Name: didMount ]]
    v137.isMounted = true;
end;
v73.willUnmount = function(v138) --[[ Line: 537 ]] --[[ Name: willUnmount ]]
    v138.isMounted = false;
end;
v73.isCompactViewMode = function(v139) --[[ Line: 541 ]] --[[ Name: isCompactViewMode ]]
    -- upvalues: l_FormFactor_0 (copy)
    local l_formFactor_0 = v139.props.formFactor;
    return v139.props.forceCompactMode or l_formFactor_0 == l_FormFactor_0.COMPACT;
end;
v73.getPageNameLocalizationKey = function(v141) --[[ Line: 549 ]] --[[ Name: getPageNameLocalizationKey ]]
    -- upvalues: v35 (copy)
    local l_name_2 = v141.props.currentRoute[1].name;
    return v35[v141.props.navigation.state.routeName] or v35[l_name_2];
end;
v73.maybeRenderRightItems = function(v143, v144, v145, v146) --[[ Line: 558 ]] --[[ Name: maybeRenderRightItems ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy)
    if v145 then
        return {};
    elseif l_FFlagEnableAppNavGamepadRemoval_0 then
        local l_rightItems_0 = v143.props.rightItems;
        local v148 = {};
        for v149, v150 in ipairs(l_rightItems_0) do
            v148["topBarItem_" .. tostring(v149)] = v143:renderTopBarItem(v150, nil, nil, v149);
        end;
        return v148;
    else
        return v143:renderRightItems(v144, if v143:shouldShowCenterItem() then v143.centerItemRef else if v146 then v143.leftItemRef else nil);
    end;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v73.renderRightItems = function(v151, _, v153) --[[ Line: 589 ]] --[[ Name: renderRightItems ]]
        local v154 = {};
        v154 = v151.props.rightItems;
        local v155 = {};
        local function v158(v156) --[[ Line: 596 ]] --[[ Name: nextRef ]]
            -- upvalues: v154 (ref), v151 (copy)
            while true do
                if v156 < #v154 then
                    v156 = v156 + 1;
                    local v157 = v154[v156];
                    if not v151.state.hiddenItems[v157] then
                        return v151.rightItemRefs[v157];
                    end;
                else
                    return nil;
                end;
            end;
        end;
        local function v161(v159) --[[ Line: 608 ]] --[[ Name: prevRef ]]
            -- upvalues: v154 (ref), v151 (copy)
            while true do
                if v159 > 1 then
                    v159 = v159 - 1;
                    local v160 = v154[v159];
                    if not v151.state.hiddenItems[v160] then
                        return v151.rightItemRefs[v160];
                    end;
                else
                    return nil;
                end;
            end;
        end;
        for v162, v163 in ipairs(v154) do
            local v164 = v161(v162) or v153;
            local v165 = v158(v162);
            v155["topBarItem_" .. tostring(v162)] = v151:renderTopBarItem(v163, v164, v165, v162);
        end;
        return v155;
    end;
end;
v73.renderTopBarItem = function(v166, v167, v168, v169, v170, v171, v172, v173) --[[ Line: 630 ]] --[[ Name: renderTopBarItem ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy), v10 (copy), l_Focusable_0 (copy), l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v67 (copy)
    local l_formFactor_1 = v166.props.formFactor;
    local l_isSearching_0 = v166.state.isSearching;
    local l_isSecondary_0 = v166.props.isSecondary;
    local v177 = v166:isCompactViewMode();
    local v178 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v166:getItemRef(v167);
    local v179 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v166:getItemDefaultChildRef(v167);
    local v180 = not v166.state.hiddenItems[v167];
    return v10.createElement(l_FFlagEnableAppNavGamepadRemoval_0 and "Frame" or l_Focusable_0.Frame, {
        AutomaticSize = if not v171 then if l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0() then Enum.AutomaticSize.XY else Enum.AutomaticSize.X else nil, 
        Size = if not v171 then if l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0() then UDim2.fromScale(0, 0) else UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v170, 
        NextSelectionLeft = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v168, 
        NextSelectionRight = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v169, 
        [v10.Ref] = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v178, 
        defaultChild = v179, 
        Visible = v180
    }, {
        Button = v10.createElement(v167, {
            formFactor = l_formFactor_1, 
            isCompactView = v177, 
            isSearching = l_isSearching_0, 
            isSecondary = l_isSecondary_0, 
            cancelSearch = v166.cancelSearchAndEndSession, 
            activateSearch = v166.onSearchButtonActivated, 
            setVisible = v166:getButtonVisibilityCallback(v167), 
            buttonRef = v179, 
            titleText = if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v67 then v172 else nil, 
            routeName = if v67 then v173 else nil
        })
    });
end;
v73.shouldShowLeftItem = function(v181) --[[ Line: 679 ]] --[[ Name: shouldShowLeftItem ]]
    local l_leftItem_0 = v181.props.leftItem;
    return if l_leftItem_0 then not v181.state.hiddenItems[l_leftItem_0] and (not v181.state.isSearching or false) else false;
end;
v73.shouldShowCenterItem = function(v183) --[[ Line: 684 ]] --[[ Name: shouldShowCenterItem ]]
    local l_centerItem_1 = v183.props.centerItem;
    return l_centerItem_1 and not v183.state.hiddenItems[l_centerItem_1] or false;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v73.getItemRef = function(v185, v186) --[[ Line: 690 ]] --[[ Name: getItemRef ]]
        if v186 == nil then
            return nil;
        elseif v186 == v185.props.leftItem then
            return v185.leftItemRef;
        elseif v186 == v185.props.centerItem then
            return v185.centerItemRef;
        else
            return v185.rightItemRefs[v186];
        end;
    end;
    v73.getItemDefaultChildRef = function(v187, v188) --[[ Line: 697 ]] --[[ Name: getItemDefaultChildRef ]]
        if v188 == nil then
            return nil;
        else
            return v187.itemDefaultChildRefs[v188];
        end;
    end;
end;
v73.hasSearchButton = function(v189) --[[ Line: 702 ]] --[[ Name: hasSearchButton ]]
    -- upvalues: v50 (copy)
    local l_rightItems_1 = v189.props.rightItems;
    for _, v192 in ipairs(l_rightItems_1) do
        if v192 == v50 then
            return true;
        end;
    end;
    return false;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v73.getFirstRightItemRef = function(v193) --[[ Line: 713 ]] --[[ Name: getFirstRightItemRef ]]
        local l_rightItems_2 = v193.props.rightItems;
        for _, v196 in ipairs(l_rightItems_2) do
            if not v193.state.hiddenItems[v196] then
                return v193.rightItemRefs[v196];
            end;
        end;
        return nil;
    end;
end;
v73.getButtonVisibilityCallback = function(v197, v198) --[[ Line: 724 ]] --[[ Name: getButtonVisibilityCallback ]]
    -- upvalues: v8 (copy)
    local v199 = v197.buttonVisibilityCallbacks[v198];
    if not v199 then
        v199 = function(v200) --[[ Line: 727 ]]
            -- upvalues: v197 (copy), v8 (ref), v198 (copy)
            v197:setState(function(v201) --[[ Line: 728 ]]
                -- upvalues: v8 (ref), v198 (ref), v200 (copy)
                return {
                    hiddenItems = v8.Dictionary.join(v201.hiddenItems, {
                        [v198] = not v200 or v8.None
                    })
                };
            end);
        end;
        v197.buttonVisibilityCallbacks[v198] = v199;
    end;
    return v199;
end;
v73.getRenderSearchBar = function(v202, v203, v204, v205, v206, v207, v208, v209, _) --[[ Line: 741 ]] --[[ Name: getRenderSearchBar ]]
    -- upvalues: v10 (copy), v36 (copy), l_SearchTypes_0 (copy), v55 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v24 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy)
    if v203 then
        return function() --[[ Line: 752 ]]
            -- upvalues: v10 (ref), v36 (ref), v202 (copy), v204 (copy), v205 (copy), v206 (copy), v207 (copy), l_SearchTypes_0 (ref), v55 (ref), l_FFlagEnableAppNavGamepadRemoval_0 (ref), v208 (copy), v209 (copy), v24 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref)
            local l_createElement_0 = v10.createElement;
            local l_v36_0 = v36;
            local v213 = {
                cancelSearch = v202.cancelSearchCallback, 
                confirmSearch = v202.confirmSearchCallback, 
                onFocused = v202.onSearchBarFocused, 
                onTextCleared = v202.onTextCleared, 
                isCompactView = v204, 
                placeholderText = v205, 
                searchType = v206
            };
            local l_v207_0 = v207;
            if l_v207_0 then
                local l_v206_0 = v206;
                l_v207_0 = true;
                if l_v206_0 ~= l_SearchTypes_0.Games then
                    l_v207_0 = true;
                    if l_v206_0 ~= l_SearchTypes_0.Auto then
                        l_v207_0 = true;
                        if l_v206_0 ~= l_SearchTypes_0.TopResults then
                            l_v207_0 = v55() and l_v206_0 == l_SearchTypes_0.Catalog;
                        end;
                    end;
                end;
            end;
            v213.autocomplete = l_v207_0;
            v213[v10.Ref] = v202.searchBarRef;
            v213.focusController = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v202.props.focusController;
            v213.isSearching = v202.state.isSearching;
            v213.animated = v208;
            v213.initialSearchText = v202.props.searchParameters and v202.props.searchParameters.searchKeyword or "";
            v213.searchBarPadding = v209 and 0 or nil;
            v213.searchPageOverlayEnabled = if v202:isSearchPageOverlayEnabled() then v24.isSearchTypeInOmniSearch(v206) else nil;
            v213.disableListPicker = if v202:isSearchPageOverlayEnabled() then v24.isSearchTypeInOmniSearch(v206) else nil;
            v213.onExitSearch = if l_FFlagSearchOmniAutocompletePage_0 then v202.onExitSearch else nil;
            return l_createElement_0(l_v36_0, v213);
        end;
    else
        return nil;
    end;
end;
v73.getRenderRootSearchBar = function(v216, v217, v218, v219, v220, v221, v222, _) --[[ Line: 781 ]] --[[ Name: getRenderRootSearchBar ]]
    -- upvalues: v10 (copy), v36 (copy), l_NON_COMPACT_SEARCH_BAR_SIZE_0 (copy), l_SearchTypes_0 (copy), v55 (copy), v24 (copy)
    if not v217 and v218 and not v219 then
        return function() --[[ Line: 791 ]]
            -- upvalues: v10 (ref), v36 (ref), l_NON_COMPACT_SEARCH_BAR_SIZE_0 (ref), v216 (copy), v220 (copy), v219 (copy), v221 (copy), v222 (copy), l_SearchTypes_0 (ref), v55 (ref), v24 (ref)
            local l_createElement_1 = v10.createElement;
            local l_v36_1 = v36;
            local v226 = {
                Size = UDim2.new(0, l_NON_COMPACT_SEARCH_BAR_SIZE_0, 1, 0), 
                cancelSearch = v216.cancelSearchCallback, 
                confirmSearch = v216.confirmSearchCallback, 
                onFocused = v216.onSearchBarFocused, 
                onTextCleared = v216.onTextCleared, 
                placeholderText = v220, 
                isCompactView = v219, 
                modernUI = true, 
                searchType = v221
            };
            local l_v222_0 = v222;
            if l_v222_0 then
                local l_v221_0 = v221;
                l_v222_0 = true;
                if l_v221_0 ~= l_SearchTypes_0.Games then
                    l_v222_0 = true;
                    if l_v221_0 ~= l_SearchTypes_0.Auto then
                        l_v222_0 = true;
                        if l_v221_0 ~= l_SearchTypes_0.TopResults then
                            l_v222_0 = v55() and l_v221_0 == l_SearchTypes_0.Catalog;
                        end;
                    end;
                end;
            end;
            v226.autocomplete = l_v222_0;
            v226.isSearching = v216.state.isSearching;
            v226.initialSearchText = v216.props.searchParameters and v216.props.searchParameters.searchKeyword or "";
            v226[v10.Ref] = v216.searchBarRef;
            v226.searchPageOverlayEnabled = if v216:isSearchPageOverlayEnabled() then v24.isSearchTypeInOmniSearch(v221) else nil;
            v226.disableListPicker = if v216:isSearchPageOverlayEnabled() then v24.isSearchTypeInOmniSearch(v221) else nil;
            return l_createElement_1(l_v36_1, v226);
        end;
    else
        return nil;
    end;
end;
v73.renderAppHeaderBar = function(v229, v230, v231, v232, v233, v234, v235, v236) --[[ Line: 818 ]] --[[ Name: renderAppHeaderBar ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v67 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), v48 (copy), v69 (ref), v10 (copy), l_LayoutConfig_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), l_AppHeaderBar_0 (copy)
    local l_Tokens_0 = v231.Tokens;
    local v238 = {};
    local l_tokens_2 = v229.props.tokens;
    v238.barHeight = l_NAV_BAR_SIZE_0 * l_tokens_2.Config.UI.Scale;
    local v240 = (not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v67) and function() --[[ Line: 832 ]]
        -- upvalues: v229 (copy), v234 (copy), v230 (copy)
        return v229.renderNavigation(v234 or v230.pageTitle);
    end or v229.renderNavigation;
    v238.renderNavigation = if v236 then v240 else nil;
    l_tokens_2 = v229.props.centerItem;
    v238.title = v234 or v230.pageTitle;
    v238.isTitleCentered = v236 and not v229.props.isSecondary or false;
    v238.titleFontStyle = if not not v236 or v229.props.isSecondary then l_Tokens_0.Semantic.Typography.Header else l_Tokens_0.Semantic.Typography.Title;
    if l_tokens_2 then
        v238.title = "";
    elseif v229.state.isSearching then
        v238.title = "";
    elseif l_FFlagLuaAppMoveProfileIntoTopBar_0 and (not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar()) and v236 and v48(v229.props.currentRoute[1].name, v229.props.currentRoute[#v229.props.currentRoute].name, v229.props.formFactor, v229.state.isSearching) then
        v238.title = "";
    elseif v67 and v236 and v69(v229.props.navigation.state.routeName, v229.props.currentRoute[#v229.props.currentRoute].name, v229.state.isSearching) then
        v238.title = "";
    end;
    v238.shouldRenderTitle = true;
    v238.shouldRenderCenter = true;
    if v232 or v233 then
        v238.renderCenter = v232 or v233;
    elseif l_tokens_2 then
        v238.renderCenter = v229.renderCenter;
    end;
    v238.renderUtilities = if v232 then nil else function() --[[ Line: 884 ]]
        -- upvalues: v10 (ref), v235 (copy)
        return v10.createFragment(v235);
    end;
    local l_gridConfig_0 = v229.props.gridConfig;
    local v242 = UDim.new(0, l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingHorizontal]);
    local v243 = UDim.new(0, l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingRightItems]);
    v238.utilitiesGap = if l_FFlagEnableHeaderBarButtonsUpdate_0 then UDim.new(0, v229.props.tokens.Size.Size_100) else v243;
    v238.paddingLeft = v242;
    v238.paddingRight = v242;
    v238.paddingTop = UDim.new(0, 0);
    v238.paddingBottom = UDim.new(0, 0);
    v238.backgroundStyle = if v229.props.transparentBackground then {
        Color3 = Color3.new(0, 0, 0), 
        Transparency = 1
    } else nil;
    v238.onMedia = false;
    return v10.createElement(l_AppHeaderBar_0, v238);
end;
v73.renderWithProviders = function(v244, v245, v246, v247) --[[ Line: 909 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_LayoutConfig_0 (copy), l_NAV_BAR_SIZE_0 (copy), l_SearchTypes_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v53 (copy), l_VisibilityControl_0 (copy), l_FFlagAppIaStatusBar_0 (copy), v10 (copy), l_Focusable_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v46 (copy)
    local l_titleText_0 = v244.props.titleText;
    local v249 = v244:shouldShowLeftItem();
    local v250 = v244:hasSearchButton() and v244.props.enableSearch;
    local l_searchType_3 = v244.props.searchType;
    local l_enableSearchAutoComplete_0 = v244.props.enableSearchAutoComplete;
    local l_ZIndex_0 = v244.props.ZIndex;
    local v254 = v244.props.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
    local l_statusBarHeight_2 = v244.props.statusBarHeight;
    local l_tokens_3 = v244.props.tokens;
    l_tokens_3 = l_statusBarHeight_2 + l_NAV_BAR_SIZE_0 * l_tokens_3.Config.UI.Scale + v254;
    local v257 = l_tokens_3 + v244.props.totalBannerHeight;
    local v258 = v244:isCompactViewMode();
    local l_searchPlaceholderSearchGames_0 = v247.searchPlaceholderSearchGames;
    if l_searchType_3 == l_SearchTypes_0.Catalog then
        l_searchPlaceholderSearchGames_0 = v247.searchPlaceholderSearchMarketplace;
    end;
    local v260 = v258 and (v244.state.isSearching or v244.props.showSearchBar);
    local v261 = not v244.props.showSearchBar;
    local v262 = v244:maybeRenderRightItems(v246, v260, v249);
    local v263 = v244:getRenderSearchBar(v260, v258, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0, v261, v249);
    local v264 = v244:getRenderRootSearchBar(v260, v250, v258, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0);
    local v265 = {
        Active = true, 
        BackgroundColor3 = v246.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v244.props.transparentBackground and 1 or v246.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, l_tokens_3), 
        ZIndex = 2
    };
    local v266 = UDim2.new(0, v244.props.screenSize.X, 0, v244.props.screenSize.Y);
    local v267 = UDim2.new(0, -v244.state.absolutePosition.X, 0, -v244.state.absolutePosition.Y);
    local l_forwardRef_0 = v244.props.forwardRef;
    local v269 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else if v264 or v258 and v244.state.isSearching then v244.searchBarRef else if v244:shouldShowLeftItem() then v244.leftItemRef else if v244:shouldShowCenterItem() then v244.centerItemRef else v244:getFirstRightItemRef();
    local v272 = if l_FFlagAppIaScrollAway_0 and v53.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v270) --[[ Line: 988 ]]
        -- upvalues: l_FFlagAppIaStatusBar_0 (ref), v257 (copy), l_statusBarHeight_2 (copy)
        local v271 = if l_FFlagAppIaStatusBar_0 then (v270 - 1) * (v257 - l_statusBarHeight_2) else (v270 - 1) * v257;
        return UDim2.new(0, 0, 0, v271);
    end) else nil;
    local l_createElement_2 = v10.createElement;
    local v274 = "Frame";
    local v275 = {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0, 
        [v10.Change.AbsolutePosition] = v244.absolutePositionChangedCallback
    };
    local v276 = {};
    local l_createElement_3 = v10.createElement;
    local v278 = "Frame";
    local v279 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v257), 
        Position = v272
    };
    local v280 = {};
    local l_createElement_4 = v10.createElement;
    local v282 = "Frame";
    local l_v265_0 = v265;
    local v284 = {};
    local l_createElement_5 = v10.createElement;
    local v286 = l_FFlagEnableAppNavGamepadRemoval_0 and "Frame" or l_Focusable_0.Frame;
    local v287 = {
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundColor3 = v246.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v244.props.transparentBackground and 1 or v246.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 1, 0)
    };
    local l_new_0 = UDim2.new;
    local v289 = 1;
    local v290 = 0;
    local v291 = 0;
    local l_tokens_4 = v244.props.tokens;
    v287.Size = l_new_0(v289, v290, v291, l_NAV_BAR_SIZE_0 * l_tokens_4.Config.UI.Scale);
    v287[v10.Ref] = l_forwardRef_0;
    v287.NextSelectionRight = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else not (v258 and v244.state.isSearching) and v244.props.NextSelectionRight or nil;
    v287.NextSelectionDown = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else not (v258 and v244.state.isSearching) and v244.props.NextSelectionDown or nil;
    v287.defaultChild = v269;
    v284.NavBar = l_createElement_5(v286, v287, {
        AppHeaderBar = v244:renderAppHeaderBar(v247, v246, v263, v264, l_titleText_0, v262, v249)
    });
    v280.TopBar = l_createElement_4(v282, l_v265_0, v284);
    v280.BannerContainer = v10.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.new(0, 0, 0, l_tokens_3), 
        BackgroundTransparency = 1
    }, v244.props.bannerContainer);
    v276.TopBarContents = l_createElement_3(v278, v279, v280);
    v276.DarkOverlay = v10.createElement("TextButton", {
        Size = v266, 
        Position = v267, 
        AutoButtonColor = false, 
        BackgroundColor3 = v246.Theme.Overlay.Color, 
        BackgroundTransparency = 1, 
        Text = "", 
        Visible = v244.state.isSearching, 
        [v10.Event.Activated] = v244.cancelSearchAndEndSession, 
        ZIndex = 1
    });
    v276.LastInputChangedListener = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v10.createElement(l_ExternalEventConnection_0, {
        event = l_UserInputService_0.LastInputTypeChanged, 
        callback = function(v293) --[[ Line: 1059 ]] --[[ Name: callback ]]
            -- upvalues: v244 (copy)
            v244:setState({
                lastInputType = v293
            });
        end
    });
    v276.SignalConnection = v10.createElement(v46, {
        signal = v245, 
        callback = v244.searchSignalCallback
    });
    v276.HiddenItems = v244:renderHiddenItems();
    return l_createElement_2(v274, v275, v276);
end;
v73.renderHiddenItems = function(v294) --[[ Line: 1075 ]] --[[ Name: renderHiddenItems ]]
    -- upvalues: v10 (copy)
    return v10.createElement("Frame", {
        Visible = false
    }, {
        leftItem = v294.props.leftItem and not v294:shouldShowLeftItem() and v294:renderTopBarItem(v294.props.leftItem), 
        centerItem = v294.props.centerItem and not v294:shouldShowCenterItem() and v294:renderTopBarItem(v294.props.centerItem)
    });
end;
v73.render = function(v295) --[[ Line: 1086 ]] --[[ Name: render ]]
    -- upvalues: v45 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return v45(function(v296) --[[ Line: 1087 ]]
        -- upvalues: l_withStyle_0 (ref), v295 (copy), l_withLocalization_0 (ref)
        return l_withStyle_0(function(v297) --[[ Line: 1088 ]]
            -- upvalues: v295 (ref), l_withLocalization_0 (ref), v296 (copy)
            local v298 = v295:getPageNameLocalizationKey();
            return l_withLocalization_0({
                pageTitle = v298, 
                searchPlaceholderSearchGames = "Search.GlobalSearch.Example.SearchGames", 
                searchPlaceholderSearchMarketplace = "Search.GlobalSearch.Example.SearchMarketplace"
            })(function(v299) --[[ Line: 1094 ]]
                -- upvalues: v295 (ref), v296 (ref), v297 (copy)
                return v295:renderWithProviders(v296, v297, v299);
            end);
        end);
    end);
end;
v73.didUpdate = function(v300, v301, v302) --[[ Line: 1101 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy), v72 (copy)
    v300:updateTopBarHeight(v301, v302);
    if not l_FFlagEnableAppNavGamepadRemoval_0 then
        local v303 = v72[v300.state.lastInputType];
        local l_focusController_0 = v300.props.focusController;
        if v300.state.isSearching and not v302.isSearching and v303 and l_focusController_0 then
            l_focusController_0.moveFocusTo(v300.searchBarRef);
        elseif not v300.state.isSearching and v302.isSearching and v303 and l_focusController_0 then
            l_focusController_0.moveFocusTo(v300.searchButtonRef);
        end;
    end;
    v300:closeSearchBarIfLeavingPage(v301);
end;
v73.closeSearchBarIfLeavingPage = function(v305, v306) --[[ Line: 1117 ]] --[[ Name: closeSearchBarIfLeavingPage ]]
    local l_currentRoute_2 = v305.props.currentRoute;
    local l_currentRoute_3 = v306.currentRoute;
    if l_currentRoute_2[#l_currentRoute_2].name ~= l_currentRoute_3[#l_currentRoute_3].name and v305.state.isSearching == true then
        v305.onExitSearch();
    end;
    if v305.props.avatarRoute and v306.avatarRoute and v305.props.avatarRoute.opaque.key ~= v306.avatarRoute.opaque.key and v305.state.isSearching == true then
        v305.onExitSearch();
    end;
end;
local function _(v309) --[[ Line: 1138 ]] --[[ Name: isInPeekViewFromSearch ]]
    -- upvalues: v44 (copy), v28 (copy)
    local l_name_3 = v309[#v309].name;
    return (not (not v44() or l_name_3 ~= v28.GameDetail) or l_name_3 == v28.ProfilePlatform) and #v309 > 1 and v309[#v309 - 1].name == v28.SearchPage;
end;
local function _(v312) --[[ Line: 1147 ]] --[[ Name: getShowSearchBar ]]
    -- upvalues: v28 (copy), v44 (copy)
    if v312[#v312].name == v28.SearchPage then
        return true;
    else
        local l_name_4 = v312[#v312].name;
        if (not (not v44() or l_name_4 ~= v28.GameDetail) or l_name_4 == v28.ProfilePlatform) and #v312 > 1 and v312[#v312 - 1].name == v28.SearchPage then
            return true;
        else
            return false;
        end;
    end;
end;
local function v319(v315) --[[ Line: 1159 ]] --[[ Name: getCurrentOpaquePage ]]
    -- upvalues: v29 (copy)
    for v316 = #v315, 1, -1 do
        local l_name_5 = v315[v316].name;
        local v318 = v29[l_name_5];
        if v318 == nil or not v318.renderUnderlyingPage then
            return l_name_5;
        end;
    end;
    return nil;
end;
v73 = v39(function(v320, v321) --[[ Line: 1171 ]]
    -- upvalues: l_withGridConfig_DEPRECATED_0 (copy), l_LayoutConfig_0 (copy), l_getPageMargin_0 (copy), v10 (copy), v8 (copy)
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingRightItems] = 0, 
        [l_LayoutConfig_0.Keys.PaddingHorizontal] = l_getPageMargin_0(v321.screenSize.X), 
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v322) --[[ Line: 1176 ]]
        -- upvalues: v10 (ref), v320 (copy), v8 (ref), v321 (copy)
        return v10.createElement(v320, v8.Dictionary.join(v321, {
            gridConfig = v322
        }));
    end);
end)(v73);
v73 = v11.connect(function(v323, _) --[[ Line: 1186 ]]
    -- upvalues: v28 (copy), v44 (copy), v319 (copy)
    local v325 = v323.Navigation.history[#v323.Navigation.history];
    local v326 = {
        screenSize = v323.ScreenSize, 
        formFactor = v323.FormFactor, 
        currentRoute = v325
    };
    local v327;
    if v325[#v325].name == v28.SearchPage then
        v327 = true;
    else
        local l_name_6 = v325[#v325].name;
        v327 = (not (not v44() or l_name_6 ~= v28.GameDetail) or l_name_6 == v28.ProfilePlatform) and #v325 > 1 and v325[#v325 - 1].name == v28.SearchPage and true or false;
    end;
    v326.showSearchBar = v327;
    v326.statusBarHeight = v323.TopBar.statusBarHeight;
    v326.opaquePage = v319(v325);
    return v326;
end, function(v329) --[[ Line: 1197 ]]
    -- upvalues: v27 (copy), v30 (copy)
    return {
        confirmSearch = function(v330, v331) --[[ Line: 1199 ]] --[[ Name: confirmSearch ]]
            -- upvalues: v329 (copy), v27 (ref)
            return v329(v27(v330, v331));
        end, 
        setTopBarHeight = function(v332) --[[ Line: 1202 ]] --[[ Name: setTopBarHeight ]]
            -- upvalues: v329 (copy), v30 (ref)
            return v329(v30(v332));
        end
    };
end)(v73);
v73 = l_RoactServices_0.connect({
    analytics = v17, 
    sessionService = l_AppSessionService_0, 
    eventIngest = v20
})(v73);
v73 = l_RoactAppPolicy_0.connect(function(v333, _) --[[ Line: 1214 ]]
    return {
        enableNotifications = v333.getNotifications(), 
        enableSearch = v333.getSearchBar(), 
        enableSearchAutoComplete = v333.getSearchAutoComplete()
    };
end)(v73);
v73 = v47(v15.withNavigation(v73), {
    required = false
});
if not v68 and l_FFlagSearchOmniAutocompletePageIXP_0 then
    v73 = v22.connectUserLayer({
        v61
    }, function(v335, _) --[[ Line: 1228 ]]
        -- upvalues: v61 (copy)
        return {
            shouldShowSearchLandingPage = (v335[v61] or {}).shouldShowSearchLandingPage
        };
    end, false)(v73);
end;
local l_v73_0 = v73;
v73 = function(v338) --[[ Line: 1238 ]]
    -- upvalues: v43 (copy), l_useIsSpatial_0 (copy), l_useTokens_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v10 (copy), l_v73_0 (copy), v8 (copy), v14 (copy)
    local l_hideSiteMessageBanner_0 = v338.hideSiteMessageBanner;
    local v340, v341 = v43(l_hideSiteMessageBanner_0);
    local v342 = l_useIsSpatial_0();
    local v343 = l_useTokens_0();
    if l_FFlagEnableAppNavGamepadRemoval_0 then
        return v10.createElement(l_v73_0, v8.Dictionary.join(v338, {
            bannerContainer = v340, 
            totalBannerHeight = v341, 
            isSpatial = v342, 
            tokens = v343
        }));
    else
        return v14.withFocusController(function(v344) --[[ Line: 1256 ]]
            -- upvalues: v10 (ref), l_v73_0 (ref), v8 (ref), v338 (copy), v340 (copy), v341 (copy), v342 (copy), v343 (copy)
            return v10.createElement(l_v73_0, v8.Dictionary.join(v338, {
                focusController = v344, 
                bannerContainer = v340, 
                totalBannerHeight = v341, 
                isSpatial = v342, 
                tokens = v343
            }));
        end);
    end;
end;
return v10.forwardRef(function(v345, v346) --[[ Line: 1271 ]]
    -- upvalues: v10 (copy), v73 (ref), v8 (copy)
    return v10.createElement(v73, v8.Dictionary.join(v345, {
        forwardRef = v346
    }));
end);