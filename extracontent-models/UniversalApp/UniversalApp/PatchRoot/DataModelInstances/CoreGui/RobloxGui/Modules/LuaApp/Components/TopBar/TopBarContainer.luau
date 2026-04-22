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
local l_Selectors_0 = v27.Selectors;
local v29 = require(l_Modules_0.LuaApp.Thunks.ConfirmSearch);
local v30 = require(l_Modules_0.LuaApp.AppPage);
local v31 = require(l_Modules_0.LuaApp.AppPageProperties);
local v32 = require(l_Modules_0.LuaApp.Actions.SetTopBarHeight);
local v33 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v36 = require(l_Modules_0.LuaApp.Constants);
local v37 = require(l_Modules_0.LuaApp.AppPageLocalizationKeys);
local v38 = require(l_Modules_0.LuaApp.Components.SearchBar);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v40 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local v41 = require(l_Modules_0.LuaApp.Common.wrapComponent);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v45 = require(l_Modules_0.LuaApp.Components.Banner.useBannerContainer);
local v46 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local v47 = require(l_Modules_0.LuaApp.Context.withTopBarSearchSignal);
local v48 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v50 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.shouldShowProfileInHeaderBar);
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v52 = require(script.Parent.Buttons.SearchButton);
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local l_AppHeaderBar_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).AppHeaderBar;
local v55 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_VisibilityControl_0 = v55.VisibilityControl;
local v57 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagSearchOmniAutocompletePageIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePageIXP;
local l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppFixAppNavHeaderIconsAlignment;
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP;
local v63 = game:DefineFastString("LuaAppSlpIxpLayer", "Growth.Omnisearch.SearchLandingPage");
local v64 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v64.FFlagLuaAppCompositionSupport;
local l_FFlagAppIaScrollAway_0 = v64.FFlagAppIaScrollAway;
local l_FFlagAppIaHomeSubTab_0 = v64.FFlagAppIaHomeSubTab;
local l_FFlagAppIaStatusBar_0 = v64.FFlagAppIaStatusBar;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v64.FFlagEnableHeaderBarButtonsUpdate;
local l_FFlagUseNavigationSelectors_0 = v64.FFlagUseNavigationSelectors;
local v71 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagEnableHomeRobloxLogo_0 = v64.FFlagEnableHomeRobloxLogo;
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v74 = game:DefineFastFlag("LuaAppEnableSlpForVr", false);
local v75 = nil;
if v71 or l_FFlagEnableHomeRobloxLogo_0 then
    v75 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).Utils.shouldShowLeftHeader;
end;
local l_NAV_BAR_SIZE_0 = v36.NAV_BAR_SIZE;
local l_NON_COMPACT_SEARCH_BAR_SIZE_0 = l_SearchConstants_0.NON_COMPACT_SEARCH_BAR_SIZE;
local v78 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v79 = v11.Component:extend("TopBarContainer");
v79.validateProps = v7.strictInterface({
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
v79.defaultProps = {
    searchType = l_SearchTypes_0.Games, 
    enableSearch = false, 
    ZIndex = 2, 
    onConfirmSearchCallback = nil, 
    hideSiteMessageBanner = false, 
    forceCompactMode = false, 
    transparentBackground = false, 
    rightItems = {}
};
local function _(v80, v81) --[[ Line: 221 ]] --[[ Name: applyTokenScaling ]]
    return v80 * v81.Config.UI.Scale;
end;
local function _(v83) --[[ Line: 225 ]] --[[ Name: calculateNavBarSize ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy)
    return l_NAV_BAR_SIZE_0 * v83.Config.UI.Scale;
end;
local _ = function(v85, _) --[[ Line: 229 ]] --[[ Name: calculateTopBarHeight ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_LayoutConfig_0 (copy)
    local l_statusBarHeight_0 = v85.statusBarHeight;
    local _ = nil;
    local l_tokens_0 = v85.tokens;
    return l_statusBarHeight_0 + l_NAV_BAR_SIZE_0 * l_tokens_0.Config.UI.Scale + math.round(v85.totalBannerHeight) + 2 * v85.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
end;
local function _(v91) --[[ Line: 240 ]]
    -- upvalues: l_SearchTypes_0 (copy), v57 (copy)
    local v92 = true;
    if v91 ~= l_SearchTypes_0.Games then
        v92 = true;
        if v91 ~= l_SearchTypes_0.Auto then
            v92 = true;
            if v91 ~= l_SearchTypes_0.TopResults then
                v92 = v57() and v91 == l_SearchTypes_0.Catalog;
            end;
        end;
    end;
    return v92;
end;
v79.shouldUpdate = function(v94, v95, v96) --[[ Line: 246 ]] --[[ Name: shouldUpdate ]]
    -- upvalues: v9 (copy)
    if v96 ~= v94.state then
        return true;
    elseif v95 == v94.props then
        return false;
    else
        for v97, v98 in pairs(v95) do
            if v97 ~= "rightItems" and v94.props[v97] ~= v98 then
                return true;
            end;
        end;
        for v99, v100 in pairs(v94.props) do
            if v99 ~= "rightItems" and v95[v99] ~= v100 then
                return true;
            end;
        end;
        return not v9.shallowEqual(v94.props.rightItems, v95.rightItems);
    end;
end;
v79.getPageOwner = function(v101) --[[ Line: 270 ]] --[[ Name: getPageOwner ]]
    return v101.props.navigation.state.routeName;
end;
local function v108(v102) --[[ Line: 275 ]] --[[ Name: isTopPage ]]
    -- upvalues: l_FFlagAppIaHomeSubTab_0 (copy), v27 (copy), v8 (copy), v55 (copy)
    local l_currentRoute_0 = v102.currentRoute;
    local l_name_0 = l_currentRoute_0[#l_currentRoute_0].name;
    local v105 = nil;
    v105 = if v102.avatarRoute then v102.avatarRoute.opaque.name else v102.opaquePage;
    local l_routeName_0 = v102.navigation.state.routeName;
    if l_FFlagAppIaHomeSubTab_0 and l_routeName_0 == v27.Constants.HomeContainerName then
        return v8.List.find(v55.Constants.HOME_CONTAINER_SUB_TAB_PAGES, l_name_0) ~= nil;
    else
        local v107 = true;
        if l_routeName_0 ~= l_name_0 then
            v107 = l_routeName_0 == v105;
        end;
        return v107;
    end;
end;
v79.updateTopBarHeight = function(v109, v110, v111) --[[ Line: 297 ]] --[[ Name: updateTopBarHeight ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_LayoutConfig_0 (copy), v108 (copy), v33 (copy), l_FFlagAppIaScrollAway_0 (copy), v55 (copy), l_VisibilityControl_0 (copy)
    local l_props_0 = v109.props;
    local l_state_0 = v109.state;
    local l_statusBarHeight_1 = l_props_0.statusBarHeight;
    local v115 = nil;
    local l_tokens_1 = l_props_0.tokens;
    local v117 = l_statusBarHeight_1 + l_NAV_BAR_SIZE_0 * l_tokens_1.Config.UI.Scale + math.round(l_props_0.totalBannerHeight) + 2 * l_props_0.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
    l_props_0 = v108(v109.props);
    if v110 and v111 and v110.navigation == v109.props.navigation then
        l_statusBarHeight_1 = v110.statusBarHeight;
        v115 = nil;
        l_tokens_1 = v110.tokens;
        l_state_0 = l_statusBarHeight_1 + l_NAV_BAR_SIZE_0 * l_tokens_1.Config.UI.Scale + math.round(v110.totalBannerHeight) + 2 * v110.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
        l_statusBarHeight_1 = v108(v110);
        if l_state_0 == v117 and l_props_0 == l_statusBarHeight_1 then
            return;
        end;
    end;
    if l_props_0 then
        v33.GetDisplayStore().setTopBarHeight(v117);
        v109.props.setTopBarHeight(v117);
        if l_FFlagAppIaScrollAway_0 and v55.getScrollAwayEnabled() then
            l_VisibilityControl_0.setScrollDistance(v117);
        end;
    end;
end;
v79.init = function(v118) --[[ Line: 318 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v15 (copy), l_UserInputService_0 (copy)
    v118.searchBarRef = v11.createRef();
    v118.isMounted = false;
    v118.rightItemRefs = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v15.createRefCache();
    v118.itemDefaultChildRefs = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v15.createRefCache();
    v118.leftItemRef = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v11.createRef();
    v118.centerItemRef = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v11.createRef();
    v118.buttonVisibilityCallbacks = {};
    v118.state = {
        isSearching = false, 
        absolutePosition = Vector2.new(0, 0), 
        lastInputType = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else l_UserInputService_0:GetLastInputType(), 
        hiddenItems = {}
    };
    v118:bindFunctions();
    v118:updateTopBarHeight();
end;
v79.bindFunctions = function(v119) --[[ Line: 342 ]] --[[ Name: bindFunctions ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_SearchTypes_0 (copy), v40 (copy), l_SessionType_0 (copy), v57 (copy), v25 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v71 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy)
    local l_currentRoute_1 = v119.props.currentRoute;
    local l_name_1 = l_currentRoute_1[#l_currentRoute_1].name;
    v119.onSearchButtonActivated = function() --[[ Line: 346 ]]
        -- upvalues: v119 (copy), l_name_1 (copy), l_AvatarScreen_0 (ref)
        if not v119.isMounted then
            return;
        else
            v119:setIsSearching(true);
            v119.props.analytics.reportSearchButtonClick(l_name_1);
            if v119.props.shouldNavigateToSearchLandingPage then
                v119:setIsSearching(false);
                v119.props.navigation.navigate(l_AvatarScreen_0.CatalogSearchLanding);
            end;
            return;
        end;
    end;
    v119.onExitSearch = function() --[[ Line: 361 ]]
        -- upvalues: v119 (copy)
        if not v119.isMounted then
            return;
        else
            v119:setIsSearching(false);
            return;
        end;
    end;
    v119.cancelSearchCallback = function() --[[ Line: 369 ]]
        -- upvalues: v119 (copy), l_SearchTypes_0 (ref), v40 (ref), l_name_1 (copy)
        if not v119.isMounted then
            return;
        else
            local l_searchType_0 = v119.props.searchType;
            local v123 = l_searchType_0 == l_SearchTypes_0.Auto;
            if l_searchType_0 == l_SearchTypes_0.Games or v123 then
                v40(v119.props.eventIngest, "games", "cancel", nil, v123, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.TopResults then
                v40(v119.props.eventIngest, l_SearchTypes_0.TopResults, "cancel", nil, nil, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.Players then
                v40(v119.props.eventIngest, "players", "cancel", nil, nil, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.Catalog then
                v119.props.analytics.reportSearchCanceled("catalog");
            end;
            v119.onExitSearch();
            return;
        end;
    end;
    v119.cancelSearchAndEndSession = function() --[[ Line: 394 ]]
        -- upvalues: v119 (copy), l_SessionType_0 (ref)
        v119.cancelSearchCallback();
        if v119.props.sessionService:SessionExists(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete) then
            v119.props.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
        end;
    end;
    v119.onSearchBarFocused = function() --[[ Line: 402 ]]
        -- upvalues: v119 (copy), l_SearchTypes_0 (ref), l_SessionType_0 (ref), v40 (ref), l_name_1 (copy)
        if not v119.isMounted then
            return;
        else
            local l_searchType_1 = v119.props.searchType;
            local v125 = l_searchType_1 == l_SearchTypes_0.Auto;
            if l_searchType_1 == l_SearchTypes_0.Games or v125 or l_searchType_1 == l_SearchTypes_0.TopResults then
                if v119.props.enableSearchAutoComplete then
                    v119.props.sessionService:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
                end;
                v40(v119.props.eventIngest, if l_searchType_1 == l_SearchTypes_0.TopResults then l_SearchTypes_0.TopResults else "games", "open", nil, v125, l_name_1);
            elseif l_searchType_1 == l_SearchTypes_0.Players then
                v40(v119.props.eventIngest, "players", "open", nil, nil, l_name_1);
            elseif l_searchType_1 == l_SearchTypes_0.Catalog then
                v119.props.analytics.reportSearchFocused("catalog");
            end;
            v119:setIsSearching(true);
            return;
        end;
    end;
    v119.onTextCleared = function() --[[ Line: 436 ]]
        -- upvalues: v119 (copy)
        if not v119.isMounted then
            return;
        else
            return;
        end;
    end;
    v119.confirmSearchCallback = function(v126, v127, v128) --[[ Line: 442 ]]
        -- upvalues: v119 (copy), v57 (ref), v25 (ref), l_SearchTypes_0 (ref)
        if not v119.isMounted then
            return;
        else
            local l_searchType_2 = v119.props.searchType;
            local v130 = {
                isAutocompleteSuggestion = v127, 
                allAutocompleteSuggestions = v128, 
                searchType = l_searchType_2, 
                isAvatarAutocompleteEnabled = v57(), 
                navigation = v119.props.navigation, 
                pageOwner = v119:getPageOwner(), 
                sessionService = v119.props.sessionService, 
                eventIngest = v119.props.eventIngest, 
                topBarAnalytics = v119.props.analytics
            };
            v119.props.confirmSearch(v126, v130);
            if v25.isSearchTypeInOmniSearch(l_searchType_2) or l_searchType_2 == l_SearchTypes_0.Catalog then
                v119.onExitSearch();
            end;
            if v57() and v119.props.onConfirmSearchCallback then
                v119.props.onConfirmSearchCallback();
            end;
            return;
        end;
    end;
    v119.absolutePositionChangedCallback = function(v131) --[[ Line: 470 ]]
        -- upvalues: v119 (copy)
        v119:setState({
            absolutePosition = v131.AbsolutePosition
        });
    end;
    v119.searchSignalCallback = function(v132) --[[ Line: 476 ]]
        -- upvalues: v119 (copy)
        if v119:getPageOwner() == v132 then
            v119.onSearchButtonActivated();
        end;
    end;
    v119.renderNavigation = function(v133) --[[ Line: 482 ]]
        -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (ref), v119 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (ref), v71 (ref), l_FFlagEnableHomeRobloxLogo_0 (ref)
        local v134 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v119:shouldShowCenterItem() and v119.centerItemRef or v119:getFirstRightItemRef() or v119.props.NextSelectionRight;
        return v119:renderTopBarItem(v119.props.leftItem, nil, v134, nil, nil, if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v71 or l_FFlagEnableHomeRobloxLogo_0 then v133 else nil, if not not v71 or l_FFlagEnableHomeRobloxLogo_0 then v119.props.navigation.state.routeName else nil);
    end;
    v119.renderCenter = function() --[[ Line: 507 ]]
        -- upvalues: v119 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (ref)
        local v135 = v119:shouldShowLeftItem();
        local l_centerItem_0 = v119.props.centerItem;
        local v137 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v135 and v119.leftItemRef or nil;
        local v138 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v119:getFirstRightItemRef() or v119.props.NextSelectionRight;
        if v119.props.useParentSizeForCenterItem then
            return v119:renderTopBarItem(l_centerItem_0, v137, v138, nil, true);
        else
            return v119:renderTopBarItem(l_centerItem_0, v137, v138);
        end;
    end;
end;
v79.isSearchPageOverlayEnabled = function(v139) --[[ Line: 533 ]] --[[ Name: isSearchPageOverlayEnabled ]]
    -- upvalues: v74 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_FFlagSearchOmniAutocompletePageIXP_0 (copy)
    if v74 then
        return l_FFlagSearchOmniAutocompletePage_0;
    else
        return not v139.props.isSpatial and l_FFlagSearchOmniAutocompletePage_0 and (not l_FFlagSearchOmniAutocompletePageIXP_0 or v139.props.shouldShowSearchLandingPage);
    end;
end;
v79.setIsSearching = function(v140, v141) --[[ Line: 543 ]] --[[ Name: setIsSearching ]]
    v140:setState({
        isSearching = v141
    });
    if v140.props.setDefaultRefOverride then
        local v142 = if v141 then v140.searchBarRef else nil;
        v140.props.setDefaultRefOverride(v142);
    end;
end;
v79.didMount = function(v143) --[[ Line: 553 ]] --[[ Name: didMount ]]
    v143.isMounted = true;
end;
v79.willUnmount = function(v144) --[[ Line: 557 ]] --[[ Name: willUnmount ]]
    v144.isMounted = false;
end;
v79.isCompactViewMode = function(v145) --[[ Line: 561 ]] --[[ Name: isCompactViewMode ]]
    -- upvalues: l_FormFactor_0 (copy)
    local l_formFactor_0 = v145.props.formFactor;
    return v145.props.forceCompactMode or l_formFactor_0 == l_FormFactor_0.COMPACT;
end;
v79.getPageNameLocalizationKey = function(v147) --[[ Line: 569 ]] --[[ Name: getPageNameLocalizationKey ]]
    -- upvalues: v37 (copy)
    local l_name_2 = v147.props.currentRoute[1].name;
    return v37[v147.props.navigation.state.routeName] or v37[l_name_2];
end;
v79.maybeRenderRightItems = function(v149, v150, v151, v152) --[[ Line: 578 ]] --[[ Name: maybeRenderRightItems ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy)
    if v151 then
        return {};
    elseif l_FFlagEnableAppNavGamepadRemoval_0 then
        local l_rightItems_0 = v149.props.rightItems;
        local v154 = {};
        for v155, v156 in ipairs(l_rightItems_0) do
            v154["topBarItem_" .. tostring(v155)] = v149:renderTopBarItem(v156, nil, nil, v155);
        end;
        return v154;
    else
        return v149:renderRightItems(v150, if v149:shouldShowCenterItem() then v149.centerItemRef else if v152 then v149.leftItemRef else nil);
    end;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v79.renderRightItems = function(v157, _, v159) --[[ Line: 609 ]] --[[ Name: renderRightItems ]]
        local v160 = {};
        v160 = v157.props.rightItems;
        local v161 = {};
        local function v164(v162) --[[ Line: 616 ]] --[[ Name: nextRef ]]
            -- upvalues: v160 (ref), v157 (copy)
            while true do
                if v162 < #v160 then
                    v162 = v162 + 1;
                    local v163 = v160[v162];
                    if not v157.state.hiddenItems[v163] then
                        return v157.rightItemRefs[v163];
                    end;
                else
                    return nil;
                end;
            end;
        end;
        local function v167(v165) --[[ Line: 628 ]] --[[ Name: prevRef ]]
            -- upvalues: v160 (ref), v157 (copy)
            while true do
                if v165 > 1 then
                    v165 = v165 - 1;
                    local v166 = v160[v165];
                    if not v157.state.hiddenItems[v166] then
                        return v157.rightItemRefs[v166];
                    end;
                else
                    return nil;
                end;
            end;
        end;
        for v168, v169 in ipairs(v160) do
            local v170 = v167(v168) or v159;
            local v171 = v164(v168);
            v161["topBarItem_" .. tostring(v168)] = v157:renderTopBarItem(v169, v170, v171, v168);
        end;
        return v161;
    end;
end;
v79.renderTopBarItem = function(v172, v173, v174, v175, v176, v177, v178, v179) --[[ Line: 650 ]] --[[ Name: renderTopBarItem ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy), v11 (copy), l_Focusable_0 (copy), l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v71 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy)
    local l_formFactor_1 = v172.props.formFactor;
    local l_isSearching_0 = v172.state.isSearching;
    local l_isSecondary_0 = v172.props.isSecondary;
    local v183 = v172:isCompactViewMode();
    local v184 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v172:getItemRef(v173);
    local v185 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v172:getItemDefaultChildRef(v173);
    local v186 = not v172.state.hiddenItems[v173];
    return v11.createElement(l_FFlagEnableAppNavGamepadRemoval_0 and "Frame" or l_Focusable_0.Frame, {
        AutomaticSize = if not v177 then if l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0() then Enum.AutomaticSize.XY else Enum.AutomaticSize.X else nil, 
        Size = if not v177 then if l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0() then UDim2.fromScale(0, 0) else UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v176, 
        NextSelectionLeft = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v174, 
        NextSelectionRight = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v175, 
        [v11.Ref] = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v184, 
        defaultChild = v185, 
        Visible = v186
    }, {
        Button = v11.createElement(v173, {
            formFactor = l_formFactor_1, 
            isCompactView = v183, 
            isSearching = l_isSearching_0, 
            isSecondary = l_isSecondary_0, 
            cancelSearch = v172.cancelSearchAndEndSession, 
            activateSearch = v172.onSearchButtonActivated, 
            setVisible = v172:getButtonVisibilityCallback(v173), 
            buttonRef = v185, 
            titleText = if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v71 or l_FFlagEnableHomeRobloxLogo_0 then v178 else nil, 
            routeName = if not not v71 or l_FFlagEnableHomeRobloxLogo_0 then v179 else nil
        })
    });
end;
v79.shouldShowLeftItem = function(v187) --[[ Line: 703 ]] --[[ Name: shouldShowLeftItem ]]
    local l_leftItem_0 = v187.props.leftItem;
    return if l_leftItem_0 then not v187.state.hiddenItems[l_leftItem_0] and (not v187.state.isSearching or false) else false;
end;
v79.shouldShowCenterItem = function(v189) --[[ Line: 708 ]] --[[ Name: shouldShowCenterItem ]]
    local l_centerItem_1 = v189.props.centerItem;
    return l_centerItem_1 and not v189.state.hiddenItems[l_centerItem_1] or false;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v79.getItemRef = function(v191, v192) --[[ Line: 714 ]] --[[ Name: getItemRef ]]
        if v192 == nil then
            return nil;
        elseif v192 == v191.props.leftItem then
            return v191.leftItemRef;
        elseif v192 == v191.props.centerItem then
            return v191.centerItemRef;
        else
            return v191.rightItemRefs[v192];
        end;
    end;
    v79.getItemDefaultChildRef = function(v193, v194) --[[ Line: 721 ]] --[[ Name: getItemDefaultChildRef ]]
        if v194 == nil then
            return nil;
        else
            return v193.itemDefaultChildRefs[v194];
        end;
    end;
end;
v79.hasSearchButton = function(v195) --[[ Line: 726 ]] --[[ Name: hasSearchButton ]]
    -- upvalues: v52 (copy)
    local l_rightItems_1 = v195.props.rightItems;
    for _, v198 in ipairs(l_rightItems_1) do
        if v198 == v52 then
            return true;
        end;
    end;
    return false;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v79.getFirstRightItemRef = function(v199) --[[ Line: 737 ]] --[[ Name: getFirstRightItemRef ]]
        local l_rightItems_2 = v199.props.rightItems;
        for _, v202 in ipairs(l_rightItems_2) do
            if not v199.state.hiddenItems[v202] then
                return v199.rightItemRefs[v202];
            end;
        end;
        return nil;
    end;
end;
v79.getButtonVisibilityCallback = function(v203, v204) --[[ Line: 748 ]] --[[ Name: getButtonVisibilityCallback ]]
    -- upvalues: v8 (copy)
    local v205 = v203.buttonVisibilityCallbacks[v204];
    if not v205 then
        v205 = function(v206) --[[ Line: 751 ]]
            -- upvalues: v203 (copy), v8 (ref), v204 (copy)
            v203:setState(function(v207) --[[ Line: 752 ]]
                -- upvalues: v8 (ref), v204 (ref), v206 (copy)
                return {
                    hiddenItems = v8.Dictionary.join(v207.hiddenItems, {
                        [v204] = not v206 or v8.None
                    })
                };
            end);
        end;
        v203.buttonVisibilityCallbacks[v204] = v205;
    end;
    return v205;
end;
v79.getRenderSearchBar = function(v208, v209, v210, v211, v212, v213, v214, v215, _) --[[ Line: 765 ]] --[[ Name: getRenderSearchBar ]]
    -- upvalues: v11 (copy), v38 (copy), l_SearchTypes_0 (copy), v57 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v25 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy)
    if v209 then
        return function() --[[ Line: 776 ]]
            -- upvalues: v11 (ref), v38 (ref), v208 (copy), v210 (copy), v211 (copy), v212 (copy), v213 (copy), l_SearchTypes_0 (ref), v57 (ref), l_FFlagEnableAppNavGamepadRemoval_0 (ref), v214 (copy), v215 (copy), v25 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref)
            local l_createElement_0 = v11.createElement;
            local l_v38_0 = v38;
            local v219 = {
                cancelSearch = v208.cancelSearchCallback, 
                confirmSearch = v208.confirmSearchCallback, 
                onFocused = v208.onSearchBarFocused, 
                onTextCleared = v208.onTextCleared, 
                isCompactView = v210, 
                placeholderText = v211, 
                searchType = v212
            };
            local l_v213_0 = v213;
            if l_v213_0 then
                local l_v212_0 = v212;
                l_v213_0 = true;
                if l_v212_0 ~= l_SearchTypes_0.Games then
                    l_v213_0 = true;
                    if l_v212_0 ~= l_SearchTypes_0.Auto then
                        l_v213_0 = true;
                        if l_v212_0 ~= l_SearchTypes_0.TopResults then
                            l_v213_0 = v57() and l_v212_0 == l_SearchTypes_0.Catalog;
                        end;
                    end;
                end;
            end;
            v219.autocomplete = l_v213_0;
            v219[v11.Ref] = v208.searchBarRef;
            v219.focusController = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v208.props.focusController;
            v219.isSearching = v208.state.isSearching;
            v219.animated = v214;
            v219.initialSearchText = v208.props.searchParameters and v208.props.searchParameters.searchKeyword or "";
            v219.searchBarPadding = v215 and 0 or nil;
            v219.searchPageOverlayEnabled = if v208:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v212) else nil;
            v219.disableListPicker = if v208:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v212) else nil;
            v219.onExitSearch = if l_FFlagSearchOmniAutocompletePage_0 then v208.onExitSearch else nil;
            return l_createElement_0(l_v38_0, v219);
        end;
    else
        return nil;
    end;
end;
v79.getRenderRootSearchBar = function(v222, v223, v224, v225, v226, v227, v228, _) --[[ Line: 805 ]] --[[ Name: getRenderRootSearchBar ]]
    -- upvalues: v11 (copy), v38 (copy), l_NON_COMPACT_SEARCH_BAR_SIZE_0 (copy), l_SearchTypes_0 (copy), v57 (copy), v25 (copy)
    if not v223 and v224 and not v225 then
        return function() --[[ Line: 815 ]]
            -- upvalues: v11 (ref), v38 (ref), l_NON_COMPACT_SEARCH_BAR_SIZE_0 (ref), v222 (copy), v226 (copy), v225 (copy), v227 (copy), v228 (copy), l_SearchTypes_0 (ref), v57 (ref), v25 (ref)
            local l_createElement_1 = v11.createElement;
            local l_v38_1 = v38;
            local v232 = {
                Size = UDim2.new(0, l_NON_COMPACT_SEARCH_BAR_SIZE_0, 1, 0), 
                cancelSearch = v222.cancelSearchCallback, 
                confirmSearch = v222.confirmSearchCallback, 
                onFocused = v222.onSearchBarFocused, 
                onTextCleared = v222.onTextCleared, 
                placeholderText = v226, 
                isCompactView = v225, 
                modernUI = true, 
                searchType = v227
            };
            local l_v228_0 = v228;
            if l_v228_0 then
                local l_v227_0 = v227;
                l_v228_0 = true;
                if l_v227_0 ~= l_SearchTypes_0.Games then
                    l_v228_0 = true;
                    if l_v227_0 ~= l_SearchTypes_0.Auto then
                        l_v228_0 = true;
                        if l_v227_0 ~= l_SearchTypes_0.TopResults then
                            l_v228_0 = v57() and l_v227_0 == l_SearchTypes_0.Catalog;
                        end;
                    end;
                end;
            end;
            v232.autocomplete = l_v228_0;
            v232.isSearching = v222.state.isSearching;
            v232.initialSearchText = v222.props.searchParameters and v222.props.searchParameters.searchKeyword or "";
            v232[v11.Ref] = v222.searchBarRef;
            v232.searchPageOverlayEnabled = if v222:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v227) else nil;
            v232.disableListPicker = if v222:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v227) else nil;
            return l_createElement_1(l_v38_1, v232);
        end;
    else
        return nil;
    end;
end;
v79.renderAppHeaderBar = function(v235, v236, v237, v238, v239, v240, v241, v242) --[[ Line: 842 ]] --[[ Name: renderAppHeaderBar ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v71 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), v50 (copy), v75 (ref), v11 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_LayoutConfig_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), l_AppHeaderBar_0 (copy)
    local l_Tokens_0 = v237.Tokens;
    local v244 = {};
    local l_tokens_2 = v235.props.tokens;
    v244.barHeight = l_NAV_BAR_SIZE_0 * l_tokens_2.Config.UI.Scale;
    local v246 = (not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v71 or l_FFlagEnableHomeRobloxLogo_0) and function() --[[ Line: 858 ]]
        -- upvalues: v235 (copy), v240 (copy), v236 (copy)
        return v235.renderNavigation(v240 or v236.pageTitle);
    end or v235.renderNavigation;
    v244.renderNavigation = if v242 then v246 else nil;
    l_tokens_2 = v235.props.centerItem;
    v244.title = v240 or v236.pageTitle;
    v244.isTitleCentered = v242 and not v235.props.isSecondary or false;
    v244.titleFontStyle = if not not v242 or v235.props.isSecondary then l_Tokens_0.Semantic.Typography.Header else l_Tokens_0.Semantic.Typography.Title;
    if l_tokens_2 then
        v244.title = "";
    elseif v235.state.isSearching then
        v244.title = "";
    elseif l_FFlagLuaAppMoveProfileIntoTopBar_0 and (not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar()) and v242 and v50(v235.props.currentRoute[1].name, v235.props.currentRoute[#v235.props.currentRoute].name, v235.props.formFactor, v235.state.isSearching) then
        v244.title = "";
    elseif (v71 or l_FFlagEnableHomeRobloxLogo_0) and v242 and v75(v235.props.navigation.state.routeName, v235.props.currentRoute[#v235.props.currentRoute].name, v235.state.isSearching) then
        v244.title = "";
    end;
    v244.shouldRenderTitle = true;
    v244.shouldRenderCenter = true;
    if v238 or v239 then
        v244.renderCenter = v238 or v239;
    elseif l_tokens_2 then
        v244.renderCenter = v235.renderCenter;
    end;
    v244.renderUtilities = if v238 then nil else function() --[[ Line: 910 ]]
        -- upvalues: v11 (ref), v241 (copy)
        return v11.createFragment(v241);
    end;
    local l_gridConfig_0 = v235.props.gridConfig;
    local v248 = UDim.new(0, if l_FFlagLuaAppCompositionSupport_0 then v235.props.sideMarginOverride or l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingHorizontal] else l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingHorizontal]);
    local v249 = UDim.new(0, l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingRightItems]);
    v244.utilitiesGap = if l_FFlagEnableHeaderBarButtonsUpdate_0 then UDim.new(0, v235.props.tokens.Size.Size_100) else v249;
    v244.paddingLeft = v248;
    v244.paddingRight = if l_FFlagEnableHeaderBarButtonsUpdate_0 then v248 - UDim.new(0, v235.props.tokens.Size.Size_100) else v248;
    v244.paddingTop = UDim.new(0, 0);
    v244.paddingBottom = UDim.new(0, 0);
    v244.backgroundStyle = if v235.props.transparentBackground then {
        Color3 = Color3.new(0, 0, 0), 
        Transparency = 1
    } else nil;
    v244.onMedia = false;
    return v11.createElement(l_AppHeaderBar_0, v244);
end;
v79.renderWithProviders = function(v250, v251, v252, v253) --[[ Line: 942 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_LayoutConfig_0 (copy), l_NAV_BAR_SIZE_0 (copy), l_SearchTypes_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v55 (copy), l_VisibilityControl_0 (copy), l_FFlagAppIaStatusBar_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy), l_FlyoutSidePanelIXP_0 (copy), v11 (copy), v10 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_Focusable_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v48 (copy)
    local l_titleText_0 = v250.props.titleText;
    local v255 = v250:shouldShowLeftItem();
    local v256 = v250:hasSearchButton() and v250.props.enableSearch;
    local l_searchType_3 = v250.props.searchType;
    local l_enableSearchAutoComplete_0 = v250.props.enableSearchAutoComplete;
    local l_ZIndex_0 = v250.props.ZIndex;
    local v260 = v250.props.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
    local l_statusBarHeight_2 = v250.props.statusBarHeight;
    local l_tokens_3 = v250.props.tokens;
    l_tokens_3 = l_statusBarHeight_2 + l_NAV_BAR_SIZE_0 * l_tokens_3.Config.UI.Scale + v260;
    local v263 = l_tokens_3 + v250.props.totalBannerHeight;
    local v264 = v250:isCompactViewMode();
    local l_searchPlaceholderSearchGames_0 = v253.searchPlaceholderSearchGames;
    if l_searchType_3 == l_SearchTypes_0.Catalog then
        l_searchPlaceholderSearchGames_0 = v253.searchPlaceholderSearchMarketplace;
    end;
    local v266 = v264 and (v250.state.isSearching or v250.props.showSearchBar);
    local v267 = not v250.props.showSearchBar;
    local v268 = v250:maybeRenderRightItems(v252, v266, v255);
    local v269 = v250:getRenderSearchBar(v266, v264, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0, v267, v255);
    local v270 = v250:getRenderRootSearchBar(v266, v256, v264, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0);
    local v271 = {
        Active = true, 
        BackgroundColor3 = v252.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v250.props.transparentBackground and 1 or v252.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, l_tokens_3), 
        ZIndex = 2
    };
    local v272 = UDim2.new(0, v250.props.screenSize.X, 0, v250.props.screenSize.Y);
    local v273 = UDim2.new(0, -v250.state.absolutePosition.X, 0, -v250.state.absolutePosition.Y);
    local l_forwardRef_0 = v250.props.forwardRef;
    local v275 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else if v270 or v264 and v250.state.isSearching then v250.searchBarRef else if v250:shouldShowLeftItem() then v250.leftItemRef else if v250:shouldShowCenterItem() then v250.centerItemRef else v250:getFirstRightItemRef();
    local v278 = if l_FFlagAppIaScrollAway_0 and v55.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v276) --[[ Line: 1021 ]]
        -- upvalues: l_FFlagAppIaStatusBar_0 (ref), l_FFlagAppIaHomeSubTab_0 (ref), l_FlyoutSidePanelIXP_0 (ref), v263 (copy), l_statusBarHeight_2 (copy)
        local v277 = if l_FFlagAppIaStatusBar_0 and l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then (v276 - 1) * (v263 - l_statusBarHeight_2) else (v276 - 1) * v263;
        return UDim2.new(0, 0, 0, v277);
    end) else nil;
    local l_createElement_2 = v11.createElement;
    local v280 = "Frame";
    local v281 = {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0, 
        [v10.Tag] = if l_FFlagLuaAppCompositionSupport_0 then v250.props.tag else nil, 
        [v11.Change.AbsolutePosition] = v250.absolutePositionChangedCallback
    };
    local v282 = {};
    local l_createElement_3 = v11.createElement;
    local v284 = "Frame";
    local v285 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v263), 
        Position = v278
    };
    local v286 = {};
    local l_createElement_4 = v11.createElement;
    local v288 = "Frame";
    local l_v271_0 = v271;
    local v290 = {};
    local l_createElement_5 = v11.createElement;
    local v292 = l_FFlagEnableAppNavGamepadRemoval_0 and "Frame" or l_Focusable_0.Frame;
    local v293 = {
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundColor3 = v252.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v250.props.transparentBackground and 1 or v252.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 1, 0)
    };
    local l_new_0 = UDim2.new;
    local v295 = 1;
    local v296 = 0;
    local v297 = 0;
    local l_tokens_4 = v250.props.tokens;
    v293.Size = l_new_0(v295, v296, v297, l_NAV_BAR_SIZE_0 * l_tokens_4.Config.UI.Scale);
    v293[v11.Ref] = l_forwardRef_0;
    v293.NextSelectionRight = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else not (v264 and v250.state.isSearching) and v250.props.NextSelectionRight or nil;
    v293.NextSelectionDown = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else not (v264 and v250.state.isSearching) and v250.props.NextSelectionDown or nil;
    v293.defaultChild = v275;
    v290.NavBar = l_createElement_5(v292, v293, {
        AppHeaderBar = v250:renderAppHeaderBar(v253, v252, v269, v270, l_titleText_0, v268, v255)
    });
    v286.TopBar = l_createElement_4(v288, l_v271_0, v290);
    v286.BannerContainer = v11.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.new(0, 0, 0, l_tokens_3), 
        BackgroundTransparency = 1
    }, v250.props.bannerContainer);
    v282.TopBarContents = l_createElement_3(v284, v285, v286);
    v282.DarkOverlay = v11.createElement("TextButton", {
        Size = v272, 
        Position = v273, 
        AutoButtonColor = false, 
        BackgroundColor3 = v252.Theme.Overlay.Color, 
        BackgroundTransparency = 1, 
        Text = "", 
        Visible = v250.state.isSearching, 
        [v11.Event.Activated] = v250.cancelSearchAndEndSession, 
        ZIndex = 1
    });
    v282.LastInputChangedListener = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v11.createElement(l_ExternalEventConnection_0, {
        event = l_UserInputService_0.LastInputTypeChanged, 
        callback = function(v299) --[[ Line: 1095 ]] --[[ Name: callback ]]
            -- upvalues: v250 (copy)
            v250:setState({
                lastInputType = v299
            });
        end
    });
    v282.SignalConnection = v11.createElement(v48, {
        signal = v251, 
        callback = v250.searchSignalCallback
    });
    v282.HiddenItems = v250:renderHiddenItems();
    return l_createElement_2(v280, v281, v282);
end;
v79.renderHiddenItems = function(v300) --[[ Line: 1111 ]] --[[ Name: renderHiddenItems ]]
    -- upvalues: v11 (copy)
    return v11.createElement("Frame", {
        Visible = false
    }, {
        leftItem = v300.props.leftItem and not v300:shouldShowLeftItem() and v300:renderTopBarItem(v300.props.leftItem), 
        centerItem = v300.props.centerItem and not v300:shouldShowCenterItem() and v300:renderTopBarItem(v300.props.centerItem)
    });
end;
v79.render = function(v301) --[[ Line: 1122 ]] --[[ Name: render ]]
    -- upvalues: v47 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return v47(function(v302) --[[ Line: 1123 ]]
        -- upvalues: l_withStyle_0 (ref), v301 (copy), l_withLocalization_0 (ref)
        return l_withStyle_0(function(v303) --[[ Line: 1124 ]]
            -- upvalues: v301 (ref), l_withLocalization_0 (ref), v302 (copy)
            local v304 = v301:getPageNameLocalizationKey();
            return l_withLocalization_0({
                pageTitle = v304, 
                searchPlaceholderSearchGames = "Search.GlobalSearch.Example.SearchGames", 
                searchPlaceholderSearchMarketplace = "Search.GlobalSearch.Example.SearchMarketplace"
            })(function(v305) --[[ Line: 1130 ]]
                -- upvalues: v301 (ref), v302 (ref), v303 (copy)
                return v301:renderWithProviders(v302, v303, v305);
            end);
        end);
    end);
end;
v79.didUpdate = function(v306, v307, v308) --[[ Line: 1137 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy), v78 (copy)
    v306:updateTopBarHeight(v307, v308);
    if not l_FFlagEnableAppNavGamepadRemoval_0 then
        local v309 = v78[v306.state.lastInputType];
        local l_focusController_0 = v306.props.focusController;
        if v306.state.isSearching and not v308.isSearching and v309 and l_focusController_0 then
            l_focusController_0.moveFocusTo(v306.searchBarRef);
        elseif not v306.state.isSearching and v308.isSearching and v309 and l_focusController_0 then
            l_focusController_0.moveFocusTo(v306.searchButtonRef);
        end;
    end;
    v306:closeSearchBarIfLeavingPage(v307);
end;
v79.closeSearchBarIfLeavingPage = function(v311, v312) --[[ Line: 1153 ]] --[[ Name: closeSearchBarIfLeavingPage ]]
    local l_currentRoute_2 = v311.props.currentRoute;
    local l_currentRoute_3 = v312.currentRoute;
    if l_currentRoute_2[#l_currentRoute_2].name ~= l_currentRoute_3[#l_currentRoute_3].name and v311.state.isSearching == true then
        v311.onExitSearch();
    end;
    if v311.props.avatarRoute and v312.avatarRoute and v311.props.avatarRoute.opaque.key ~= v312.avatarRoute.opaque.key and v311.state.isSearching == true then
        v311.onExitSearch();
    end;
end;
local function _(v315) --[[ Line: 1174 ]] --[[ Name: isInPeekViewFromSearch ]]
    -- upvalues: v46 (copy), v30 (copy)
    local l_name_3 = v315[#v315].name;
    return (not (not v46() or l_name_3 ~= v30.GameDetail) or l_name_3 == v30.ProfilePlatform) and #v315 > 1 and v315[#v315 - 1].name == v30.SearchPage;
end;
local function _(v318) --[[ Line: 1183 ]] --[[ Name: getShowSearchBar ]]
    -- upvalues: v30 (copy), v46 (copy)
    if v318[#v318].name == v30.SearchPage then
        return true;
    else
        local l_name_4 = v318[#v318].name;
        if (not (not v46() or l_name_4 ~= v30.GameDetail) or l_name_4 == v30.ProfilePlatform) and #v318 > 1 and v318[#v318 - 1].name == v30.SearchPage then
            return true;
        else
            return false;
        end;
    end;
end;
local function v325(v321) --[[ Line: 1195 ]] --[[ Name: getCurrentOpaquePage ]]
    -- upvalues: v31 (copy)
    for v322 = #v321, 1, -1 do
        local l_name_5 = v321[v322].name;
        local v324 = v31[l_name_5];
        if v324 == nil or not v324.renderUnderlyingPage then
            return l_name_5;
        end;
    end;
    return nil;
end;
v79 = v41(function(v326, v327) --[[ Line: 1207 ]]
    -- upvalues: l_FFlagLuaAppCompositionSupport_0 (copy), l_getPageMargin_0 (copy), l_withGridConfig_DEPRECATED_0 (copy), l_LayoutConfig_0 (copy), v11 (copy), v8 (copy)
    local v328 = if l_FFlagLuaAppCompositionSupport_0 then v327.sideMarginOverride or l_getPageMargin_0(v327.screenSize.X) else l_getPageMargin_0(v327.screenSize.X);
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingRightItems] = 0, 
        [l_LayoutConfig_0.Keys.PaddingHorizontal] = v328, 
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v329) --[[ Line: 1216 ]]
        -- upvalues: v11 (ref), v326 (copy), v8 (ref), v327 (copy)
        return v11.createElement(v326, v8.Dictionary.join(v327, {
            gridConfig = v329
        }));
    end);
end)(v79);
v79 = v12.connect(function(v330, _) --[[ Line: 1226 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v30 (copy), v46 (copy), v325 (copy)
    local v332 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v330) else v330.Navigation.history[#v330.Navigation.history];
    local v333 = {
        screenSize = v330.ScreenSize, 
        formFactor = v330.FormFactor, 
        currentRoute = v332
    };
    local v334;
    if v332[#v332].name == v30.SearchPage then
        v334 = true;
    else
        local l_name_6 = v332[#v332].name;
        v334 = (not (not v46() or l_name_6 ~= v30.GameDetail) or l_name_6 == v30.ProfilePlatform) and #v332 > 1 and v332[#v332 - 1].name == v30.SearchPage and true or false;
    end;
    v333.showSearchBar = v334;
    v333.statusBarHeight = v330.TopBar.statusBarHeight;
    v333.opaquePage = v325(v332);
    return v333;
end, function(v336) --[[ Line: 1239 ]]
    -- upvalues: v29 (copy), v32 (copy)
    return {
        confirmSearch = function(v337, v338) --[[ Line: 1241 ]] --[[ Name: confirmSearch ]]
            -- upvalues: v336 (copy), v29 (ref)
            return v336(v29(v337, v338));
        end, 
        setTopBarHeight = function(v339) --[[ Line: 1244 ]] --[[ Name: setTopBarHeight ]]
            -- upvalues: v336 (copy), v32 (ref)
            return v336(v32(v339));
        end
    };
end)(v79);
v79 = l_RoactServices_0.connect({
    analytics = v18, 
    sessionService = l_AppSessionService_0, 
    eventIngest = v21
})(v79);
v79 = l_RoactAppPolicy_0.connect(function(v340, _) --[[ Line: 1256 ]]
    return {
        enableNotifications = v340.getNotifications(), 
        enableSearch = v340.getSearchBar(), 
        enableSearchAutoComplete = v340.getSearchAutoComplete()
    };
end)(v79);
v79 = v49(v16.withNavigation(v79), {
    required = false
});
if not v74 and l_FFlagSearchOmniAutocompletePageIXP_0 then
    v79 = v23.connectUserLayer({
        v63
    }, function(v342, _) --[[ Line: 1270 ]]
        -- upvalues: v63 (copy)
        return {
            shouldShowSearchLandingPage = (v342[v63] or {}).shouldShowSearchLandingPage
        };
    end, false)(v79);
end;
local l_v79_0 = v79;
v79 = function(v345) --[[ Line: 1280 ]]
    -- upvalues: v45 (copy), l_useIsSpatial_0 (copy), l_useTokens_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v11 (copy), l_v79_0 (copy), v8 (copy), v15 (copy)
    local l_hideSiteMessageBanner_0 = v345.hideSiteMessageBanner;
    local v347, v348 = v45(l_hideSiteMessageBanner_0);
    local v349 = l_useIsSpatial_0();
    local v350 = l_useTokens_0();
    if l_FFlagEnableAppNavGamepadRemoval_0 then
        return v11.createElement(l_v79_0, v8.Dictionary.join(v345, {
            bannerContainer = v347, 
            totalBannerHeight = v348, 
            isSpatial = v349, 
            tokens = v350
        }));
    else
        return v15.withFocusController(function(v351) --[[ Line: 1298 ]]
            -- upvalues: v11 (ref), l_v79_0 (ref), v8 (ref), v345 (copy), v347 (copy), v348 (copy), v349 (copy), v350 (copy)
            return v11.createElement(l_v79_0, v8.Dictionary.join(v345, {
                focusController = v351, 
                bannerContainer = v347, 
                totalBannerHeight = v348, 
                isSpatial = v349, 
                tokens = v350
            }));
        end);
    end;
end;
return v11.forwardRef(function(v352, v353) --[[ Line: 1313 ]]
    -- upvalues: v11 (copy), v79 (ref), v8 (copy)
    return v11.createElement(v79, v8.Dictionary.join(v352, {
        forwardRef = v353
    }));
end);