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
local v70 = game:DefineFastFlag("LuaAppEnableSlpForVr", false);
local v71 = nil;
if v69 then
    v71 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).Utils.shouldShowLeftHeader;
end;
local l_NAV_BAR_SIZE_0 = v35.NAV_BAR_SIZE;
local l_NON_COMPACT_SEARCH_BAR_SIZE_0 = l_SearchConstants_0.NON_COMPACT_SEARCH_BAR_SIZE;
local v74 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v75 = v11.Component:extend("TopBarContainer");
v75.validateProps = v7.strictInterface({
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
v75.defaultProps = {
    searchType = l_SearchTypes_0.Games, 
    enableSearch = false, 
    ZIndex = 2, 
    onConfirmSearchCallback = nil, 
    hideSiteMessageBanner = false, 
    forceCompactMode = false, 
    transparentBackground = false, 
    rightItems = {}
};
local function _(v76, v77) --[[ Line: 217 ]] --[[ Name: applyTokenScaling ]]
    return v76 * v77.Config.UI.Scale;
end;
local function _(v79) --[[ Line: 221 ]] --[[ Name: calculateNavBarSize ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy)
    return l_NAV_BAR_SIZE_0 * v79.Config.UI.Scale;
end;
local _ = function(v81, _) --[[ Line: 225 ]] --[[ Name: calculateTopBarHeight ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_LayoutConfig_0 (copy)
    local l_statusBarHeight_0 = v81.statusBarHeight;
    local _ = nil;
    local l_tokens_0 = v81.tokens;
    return l_statusBarHeight_0 + l_NAV_BAR_SIZE_0 * l_tokens_0.Config.UI.Scale + math.round(v81.totalBannerHeight) + 2 * v81.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
end;
local function _(v87) --[[ Line: 236 ]]
    -- upvalues: l_SearchTypes_0 (copy), v56 (copy)
    local v88 = true;
    if v87 ~= l_SearchTypes_0.Games then
        v88 = true;
        if v87 ~= l_SearchTypes_0.Auto then
            v88 = true;
            if v87 ~= l_SearchTypes_0.TopResults then
                v88 = v56() and v87 == l_SearchTypes_0.Catalog;
            end;
        end;
    end;
    return v88;
end;
v75.shouldUpdate = function(v90, v91, v92) --[[ Line: 242 ]] --[[ Name: shouldUpdate ]]
    -- upvalues: v9 (copy)
    if v92 ~= v90.state then
        return true;
    elseif v91 == v90.props then
        return false;
    else
        for v93, v94 in pairs(v91) do
            if v93 ~= "rightItems" and v90.props[v93] ~= v94 then
                return true;
            end;
        end;
        for v95, v96 in pairs(v90.props) do
            if v95 ~= "rightItems" and v91[v95] ~= v96 then
                return true;
            end;
        end;
        return not v9.shallowEqual(v90.props.rightItems, v91.rightItems);
    end;
end;
v75.getPageOwner = function(v97) --[[ Line: 266 ]] --[[ Name: getPageOwner ]]
    return v97.props.navigation.state.routeName;
end;
local function v104(v98) --[[ Line: 271 ]] --[[ Name: isTopPage ]]
    -- upvalues: l_FFlagAppIaHomeSubTab_0 (copy), v27 (copy), v8 (copy), v54 (copy)
    local l_currentRoute_0 = v98.currentRoute;
    local l_name_0 = l_currentRoute_0[#l_currentRoute_0].name;
    local v101 = nil;
    v101 = if v98.avatarRoute then v98.avatarRoute.opaque.name else v98.opaquePage;
    local l_routeName_0 = v98.navigation.state.routeName;
    if l_FFlagAppIaHomeSubTab_0 and l_routeName_0 == v27.Constants.HomeContainerName then
        return v8.List.find(v54.Constants.HOME_CONTAINER_SUB_TAB_PAGES, l_name_0) ~= nil;
    else
        local v103 = true;
        if l_routeName_0 ~= l_name_0 then
            v103 = l_routeName_0 == v101;
        end;
        return v103;
    end;
end;
v75.updateTopBarHeight = function(v105, v106, v107) --[[ Line: 293 ]] --[[ Name: updateTopBarHeight ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_LayoutConfig_0 (copy), v104 (copy), v32 (copy), l_FFlagAppIaScrollAway_0 (copy), v54 (copy), l_VisibilityControl_0 (copy)
    local l_props_0 = v105.props;
    local l_state_0 = v105.state;
    local l_statusBarHeight_1 = l_props_0.statusBarHeight;
    local v111 = nil;
    local l_tokens_1 = l_props_0.tokens;
    local v113 = l_statusBarHeight_1 + l_NAV_BAR_SIZE_0 * l_tokens_1.Config.UI.Scale + math.round(l_props_0.totalBannerHeight) + 2 * l_props_0.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
    l_props_0 = v104(v105.props);
    if v106 and v107 and v106.navigation == v105.props.navigation then
        l_statusBarHeight_1 = v106.statusBarHeight;
        v111 = nil;
        l_tokens_1 = v106.tokens;
        l_state_0 = l_statusBarHeight_1 + l_NAV_BAR_SIZE_0 * l_tokens_1.Config.UI.Scale + math.round(v106.totalBannerHeight) + 2 * v106.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
        l_statusBarHeight_1 = v104(v106);
        if l_state_0 == v113 and l_props_0 == l_statusBarHeight_1 then
            return;
        end;
    end;
    if l_props_0 then
        v32.GetDisplayStore().setTopBarHeight(v113);
        v105.props.setTopBarHeight(v113);
        if l_FFlagAppIaScrollAway_0 and v54.getScrollAwayEnabled() then
            l_VisibilityControl_0.setScrollDistance(v113);
        end;
    end;
end;
v75.init = function(v114) --[[ Line: 314 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v15 (copy), l_UserInputService_0 (copy)
    v114.searchBarRef = v11.createRef();
    v114.isMounted = false;
    v114.rightItemRefs = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v15.createRefCache();
    v114.itemDefaultChildRefs = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v15.createRefCache();
    v114.leftItemRef = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v11.createRef();
    v114.centerItemRef = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v11.createRef();
    v114.buttonVisibilityCallbacks = {};
    v114.state = {
        isSearching = false, 
        absolutePosition = Vector2.new(0, 0), 
        lastInputType = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else l_UserInputService_0:GetLastInputType(), 
        hiddenItems = {}
    };
    v114:bindFunctions();
    v114:updateTopBarHeight();
end;
v75.bindFunctions = function(v115) --[[ Line: 338 ]] --[[ Name: bindFunctions ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_SearchTypes_0 (copy), v39 (copy), l_SessionType_0 (copy), v56 (copy), v25 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v69 (copy)
    local l_currentRoute_1 = v115.props.currentRoute;
    local l_name_1 = l_currentRoute_1[#l_currentRoute_1].name;
    v115.onSearchButtonActivated = function() --[[ Line: 342 ]]
        -- upvalues: v115 (copy), l_name_1 (copy), l_AvatarScreen_0 (ref)
        if not v115.isMounted then
            return;
        else
            v115:setIsSearching(true);
            v115.props.analytics.reportSearchButtonClick(l_name_1);
            if v115.props.shouldNavigateToSearchLandingPage then
                v115:setIsSearching(false);
                v115.props.navigation.navigate(l_AvatarScreen_0.CatalogSearchLanding);
            end;
            return;
        end;
    end;
    v115.onExitSearch = function() --[[ Line: 357 ]]
        -- upvalues: v115 (copy)
        if not v115.isMounted then
            return;
        else
            v115:setIsSearching(false);
            return;
        end;
    end;
    v115.cancelSearchCallback = function() --[[ Line: 365 ]]
        -- upvalues: v115 (copy), l_SearchTypes_0 (ref), v39 (ref), l_name_1 (copy)
        if not v115.isMounted then
            return;
        else
            local l_searchType_0 = v115.props.searchType;
            local v119 = l_searchType_0 == l_SearchTypes_0.Auto;
            if l_searchType_0 == l_SearchTypes_0.Games or v119 then
                v39(v115.props.eventIngest, "games", "cancel", nil, v119, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.TopResults then
                v39(v115.props.eventIngest, l_SearchTypes_0.TopResults, "cancel", nil, nil, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.Players then
                v39(v115.props.eventIngest, "players", "cancel", nil, nil, l_name_1);
            elseif l_searchType_0 == l_SearchTypes_0.Catalog then
                v115.props.analytics.reportSearchCanceled("catalog");
            end;
            v115.onExitSearch();
            return;
        end;
    end;
    v115.cancelSearchAndEndSession = function() --[[ Line: 390 ]]
        -- upvalues: v115 (copy), l_SessionType_0 (ref)
        v115.cancelSearchCallback();
        if v115.props.sessionService:SessionExists(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete) then
            v115.props.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
        end;
    end;
    v115.onSearchBarFocused = function() --[[ Line: 398 ]]
        -- upvalues: v115 (copy), l_SearchTypes_0 (ref), l_SessionType_0 (ref), v39 (ref), l_name_1 (copy)
        if not v115.isMounted then
            return;
        else
            local l_searchType_1 = v115.props.searchType;
            local v121 = l_searchType_1 == l_SearchTypes_0.Auto;
            if l_searchType_1 == l_SearchTypes_0.Games or v121 or l_searchType_1 == l_SearchTypes_0.TopResults then
                if v115.props.enableSearchAutoComplete then
                    v115.props.sessionService:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
                end;
                v39(v115.props.eventIngest, if l_searchType_1 == l_SearchTypes_0.TopResults then l_SearchTypes_0.TopResults else "games", "open", nil, v121, l_name_1);
            elseif l_searchType_1 == l_SearchTypes_0.Players then
                v39(v115.props.eventIngest, "players", "open", nil, nil, l_name_1);
            elseif l_searchType_1 == l_SearchTypes_0.Catalog then
                v115.props.analytics.reportSearchFocused("catalog");
            end;
            v115:setIsSearching(true);
            return;
        end;
    end;
    v115.onTextCleared = function() --[[ Line: 432 ]]
        -- upvalues: v115 (copy)
        if not v115.isMounted then
            return;
        else
            return;
        end;
    end;
    v115.confirmSearchCallback = function(v122, v123, v124) --[[ Line: 438 ]]
        -- upvalues: v115 (copy), v56 (ref), v25 (ref), l_SearchTypes_0 (ref)
        if not v115.isMounted then
            return;
        else
            local l_searchType_2 = v115.props.searchType;
            local v126 = {
                isAutocompleteSuggestion = v123, 
                allAutocompleteSuggestions = v124, 
                searchType = l_searchType_2, 
                isAvatarAutocompleteEnabled = v56(), 
                navigation = v115.props.navigation, 
                pageOwner = v115:getPageOwner(), 
                sessionService = v115.props.sessionService, 
                eventIngest = v115.props.eventIngest, 
                topBarAnalytics = v115.props.analytics
            };
            v115.props.confirmSearch(v122, v126);
            if v25.isSearchTypeInOmniSearch(l_searchType_2) or l_searchType_2 == l_SearchTypes_0.Catalog then
                v115.onExitSearch();
            end;
            if v56() and v115.props.onConfirmSearchCallback then
                v115.props.onConfirmSearchCallback();
            end;
            return;
        end;
    end;
    v115.absolutePositionChangedCallback = function(v127) --[[ Line: 466 ]]
        -- upvalues: v115 (copy)
        v115:setState({
            absolutePosition = v127.AbsolutePosition
        });
    end;
    v115.searchSignalCallback = function(v128) --[[ Line: 472 ]]
        -- upvalues: v115 (copy)
        if v115:getPageOwner() == v128 then
            v115.onSearchButtonActivated();
        end;
    end;
    v115.renderNavigation = function(v129) --[[ Line: 478 ]]
        -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (ref), v115 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (ref), v69 (ref)
        local v130 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v115:shouldShowCenterItem() and v115.centerItemRef or v115:getFirstRightItemRef() or v115.props.NextSelectionRight;
        return v115:renderTopBarItem(v115.props.leftItem, nil, v130, nil, nil, if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v69 then v129 else nil, if v69 then v115.props.navigation.state.routeName else nil);
    end;
    v115.renderCenter = function() --[[ Line: 497 ]]
        -- upvalues: v115 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (ref)
        local v131 = v115:shouldShowLeftItem();
        local l_centerItem_0 = v115.props.centerItem;
        local v133 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v131 and v115.leftItemRef or nil;
        local v134 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v115:getFirstRightItemRef() or v115.props.NextSelectionRight;
        if v115.props.useParentSizeForCenterItem then
            return v115:renderTopBarItem(l_centerItem_0, v133, v134, nil, true);
        else
            return v115:renderTopBarItem(l_centerItem_0, v133, v134);
        end;
    end;
end;
v75.isSearchPageOverlayEnabled = function(v135) --[[ Line: 523 ]] --[[ Name: isSearchPageOverlayEnabled ]]
    -- upvalues: v70 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_FFlagSearchOmniAutocompletePageIXP_0 (copy)
    if v70 then
        return l_FFlagSearchOmniAutocompletePage_0;
    else
        return not v135.props.isSpatial and l_FFlagSearchOmniAutocompletePage_0 and (not l_FFlagSearchOmniAutocompletePageIXP_0 or v135.props.shouldShowSearchLandingPage);
    end;
end;
v75.setIsSearching = function(v136, v137) --[[ Line: 533 ]] --[[ Name: setIsSearching ]]
    v136:setState({
        isSearching = v137
    });
    if v136.props.setDefaultRefOverride then
        local v138 = if v137 then v136.searchBarRef else nil;
        v136.props.setDefaultRefOverride(v138);
    end;
end;
v75.didMount = function(v139) --[[ Line: 543 ]] --[[ Name: didMount ]]
    v139.isMounted = true;
end;
v75.willUnmount = function(v140) --[[ Line: 547 ]] --[[ Name: willUnmount ]]
    v140.isMounted = false;
end;
v75.isCompactViewMode = function(v141) --[[ Line: 551 ]] --[[ Name: isCompactViewMode ]]
    -- upvalues: l_FormFactor_0 (copy)
    local l_formFactor_0 = v141.props.formFactor;
    return v141.props.forceCompactMode or l_formFactor_0 == l_FormFactor_0.COMPACT;
end;
v75.getPageNameLocalizationKey = function(v143) --[[ Line: 559 ]] --[[ Name: getPageNameLocalizationKey ]]
    -- upvalues: v36 (copy)
    local l_name_2 = v143.props.currentRoute[1].name;
    return v36[v143.props.navigation.state.routeName] or v36[l_name_2];
end;
v75.maybeRenderRightItems = function(v145, v146, v147, v148) --[[ Line: 568 ]] --[[ Name: maybeRenderRightItems ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy)
    if v147 then
        return {};
    elseif l_FFlagEnableAppNavGamepadRemoval_0 then
        local l_rightItems_0 = v145.props.rightItems;
        local v150 = {};
        for v151, v152 in ipairs(l_rightItems_0) do
            v150["topBarItem_" .. tostring(v151)] = v145:renderTopBarItem(v152, nil, nil, v151);
        end;
        return v150;
    else
        return v145:renderRightItems(v146, if v145:shouldShowCenterItem() then v145.centerItemRef else if v148 then v145.leftItemRef else nil);
    end;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v75.renderRightItems = function(v153, _, v155) --[[ Line: 599 ]] --[[ Name: renderRightItems ]]
        local v156 = {};
        v156 = v153.props.rightItems;
        local v157 = {};
        local function v160(v158) --[[ Line: 606 ]] --[[ Name: nextRef ]]
            -- upvalues: v156 (ref), v153 (copy)
            while true do
                if v158 < #v156 then
                    v158 = v158 + 1;
                    local v159 = v156[v158];
                    if not v153.state.hiddenItems[v159] then
                        return v153.rightItemRefs[v159];
                    end;
                else
                    return nil;
                end;
            end;
        end;
        local function v163(v161) --[[ Line: 618 ]] --[[ Name: prevRef ]]
            -- upvalues: v156 (ref), v153 (copy)
            while true do
                if v161 > 1 then
                    v161 = v161 - 1;
                    local v162 = v156[v161];
                    if not v153.state.hiddenItems[v162] then
                        return v153.rightItemRefs[v162];
                    end;
                else
                    return nil;
                end;
            end;
        end;
        for v164, v165 in ipairs(v156) do
            local v166 = v163(v164) or v155;
            local v167 = v160(v164);
            v157["topBarItem_" .. tostring(v164)] = v153:renderTopBarItem(v165, v166, v167, v164);
        end;
        return v157;
    end;
end;
v75.renderTopBarItem = function(v168, v169, v170, v171, v172, v173, v174, v175) --[[ Line: 640 ]] --[[ Name: renderTopBarItem ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy), v11 (copy), l_Focusable_0 (copy), l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v69 (copy)
    local l_formFactor_1 = v168.props.formFactor;
    local l_isSearching_0 = v168.state.isSearching;
    local l_isSecondary_0 = v168.props.isSecondary;
    local v179 = v168:isCompactViewMode();
    local v180 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v168:getItemRef(v169);
    local v181 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v168:getItemDefaultChildRef(v169);
    local v182 = not v168.state.hiddenItems[v169];
    return v11.createElement(l_FFlagEnableAppNavGamepadRemoval_0 and "Frame" or l_Focusable_0.Frame, {
        AutomaticSize = if not v173 then if l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0() then Enum.AutomaticSize.XY else Enum.AutomaticSize.X else nil, 
        Size = if not v173 then if l_GetFFlagLuaAppFixAppNavHeaderIconsAlignment_0() then UDim2.fromScale(0, 0) else UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v172, 
        NextSelectionLeft = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v170, 
        NextSelectionRight = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v171, 
        [v11.Ref] = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v180, 
        defaultChild = v181, 
        Visible = v182
    }, {
        Button = v11.createElement(v169, {
            formFactor = l_formFactor_1, 
            isCompactView = v179, 
            isSearching = l_isSearching_0, 
            isSecondary = l_isSecondary_0, 
            cancelSearch = v168.cancelSearchAndEndSession, 
            activateSearch = v168.onSearchButtonActivated, 
            setVisible = v168:getButtonVisibilityCallback(v169), 
            buttonRef = v181, 
            titleText = if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v69 then v174 else nil, 
            routeName = if v69 then v175 else nil
        })
    });
end;
v75.shouldShowLeftItem = function(v183) --[[ Line: 689 ]] --[[ Name: shouldShowLeftItem ]]
    local l_leftItem_0 = v183.props.leftItem;
    return if l_leftItem_0 then not v183.state.hiddenItems[l_leftItem_0] and (not v183.state.isSearching or false) else false;
end;
v75.shouldShowCenterItem = function(v185) --[[ Line: 694 ]] --[[ Name: shouldShowCenterItem ]]
    local l_centerItem_1 = v185.props.centerItem;
    return l_centerItem_1 and not v185.state.hiddenItems[l_centerItem_1] or false;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v75.getItemRef = function(v187, v188) --[[ Line: 700 ]] --[[ Name: getItemRef ]]
        if v188 == nil then
            return nil;
        elseif v188 == v187.props.leftItem then
            return v187.leftItemRef;
        elseif v188 == v187.props.centerItem then
            return v187.centerItemRef;
        else
            return v187.rightItemRefs[v188];
        end;
    end;
    v75.getItemDefaultChildRef = function(v189, v190) --[[ Line: 707 ]] --[[ Name: getItemDefaultChildRef ]]
        if v190 == nil then
            return nil;
        else
            return v189.itemDefaultChildRefs[v190];
        end;
    end;
end;
v75.hasSearchButton = function(v191) --[[ Line: 712 ]] --[[ Name: hasSearchButton ]]
    -- upvalues: v51 (copy)
    local l_rightItems_1 = v191.props.rightItems;
    for _, v194 in ipairs(l_rightItems_1) do
        if v194 == v51 then
            return true;
        end;
    end;
    return false;
end;
if not l_FFlagEnableAppNavGamepadRemoval_0 then
    v75.getFirstRightItemRef = function(v195) --[[ Line: 723 ]] --[[ Name: getFirstRightItemRef ]]
        local l_rightItems_2 = v195.props.rightItems;
        for _, v198 in ipairs(l_rightItems_2) do
            if not v195.state.hiddenItems[v198] then
                return v195.rightItemRefs[v198];
            end;
        end;
        return nil;
    end;
end;
v75.getButtonVisibilityCallback = function(v199, v200) --[[ Line: 734 ]] --[[ Name: getButtonVisibilityCallback ]]
    -- upvalues: v8 (copy)
    local v201 = v199.buttonVisibilityCallbacks[v200];
    if not v201 then
        v201 = function(v202) --[[ Line: 737 ]]
            -- upvalues: v199 (copy), v8 (ref), v200 (copy)
            v199:setState(function(v203) --[[ Line: 738 ]]
                -- upvalues: v8 (ref), v200 (ref), v202 (copy)
                return {
                    hiddenItems = v8.Dictionary.join(v203.hiddenItems, {
                        [v200] = not v202 or v8.None
                    })
                };
            end);
        end;
        v199.buttonVisibilityCallbacks[v200] = v201;
    end;
    return v201;
end;
v75.getRenderSearchBar = function(v204, v205, v206, v207, v208, v209, v210, v211, _) --[[ Line: 751 ]] --[[ Name: getRenderSearchBar ]]
    -- upvalues: v11 (copy), v37 (copy), l_SearchTypes_0 (copy), v56 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v25 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy)
    if v205 then
        return function() --[[ Line: 762 ]]
            -- upvalues: v11 (ref), v37 (ref), v204 (copy), v206 (copy), v207 (copy), v208 (copy), v209 (copy), l_SearchTypes_0 (ref), v56 (ref), l_FFlagEnableAppNavGamepadRemoval_0 (ref), v210 (copy), v211 (copy), v25 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref)
            local l_createElement_0 = v11.createElement;
            local l_v37_0 = v37;
            local v215 = {
                cancelSearch = v204.cancelSearchCallback, 
                confirmSearch = v204.confirmSearchCallback, 
                onFocused = v204.onSearchBarFocused, 
                onTextCleared = v204.onTextCleared, 
                isCompactView = v206, 
                placeholderText = v207, 
                searchType = v208
            };
            local l_v209_0 = v209;
            if l_v209_0 then
                local l_v208_0 = v208;
                l_v209_0 = true;
                if l_v208_0 ~= l_SearchTypes_0.Games then
                    l_v209_0 = true;
                    if l_v208_0 ~= l_SearchTypes_0.Auto then
                        l_v209_0 = true;
                        if l_v208_0 ~= l_SearchTypes_0.TopResults then
                            l_v209_0 = v56() and l_v208_0 == l_SearchTypes_0.Catalog;
                        end;
                    end;
                end;
            end;
            v215.autocomplete = l_v209_0;
            v215[v11.Ref] = v204.searchBarRef;
            v215.focusController = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v204.props.focusController;
            v215.isSearching = v204.state.isSearching;
            v215.animated = v210;
            v215.initialSearchText = v204.props.searchParameters and v204.props.searchParameters.searchKeyword or "";
            v215.searchBarPadding = v211 and 0 or nil;
            v215.searchPageOverlayEnabled = if v204:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v208) else nil;
            v215.disableListPicker = if v204:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v208) else nil;
            v215.onExitSearch = if l_FFlagSearchOmniAutocompletePage_0 then v204.onExitSearch else nil;
            return l_createElement_0(l_v37_0, v215);
        end;
    else
        return nil;
    end;
end;
v75.getRenderRootSearchBar = function(v218, v219, v220, v221, v222, v223, v224, _) --[[ Line: 791 ]] --[[ Name: getRenderRootSearchBar ]]
    -- upvalues: v11 (copy), v37 (copy), l_NON_COMPACT_SEARCH_BAR_SIZE_0 (copy), l_SearchTypes_0 (copy), v56 (copy), v25 (copy)
    if not v219 and v220 and not v221 then
        return function() --[[ Line: 801 ]]
            -- upvalues: v11 (ref), v37 (ref), l_NON_COMPACT_SEARCH_BAR_SIZE_0 (ref), v218 (copy), v222 (copy), v221 (copy), v223 (copy), v224 (copy), l_SearchTypes_0 (ref), v56 (ref), v25 (ref)
            local l_createElement_1 = v11.createElement;
            local l_v37_1 = v37;
            local v228 = {
                Size = UDim2.new(0, l_NON_COMPACT_SEARCH_BAR_SIZE_0, 1, 0), 
                cancelSearch = v218.cancelSearchCallback, 
                confirmSearch = v218.confirmSearchCallback, 
                onFocused = v218.onSearchBarFocused, 
                onTextCleared = v218.onTextCleared, 
                placeholderText = v222, 
                isCompactView = v221, 
                modernUI = true, 
                searchType = v223
            };
            local l_v224_0 = v224;
            if l_v224_0 then
                local l_v223_0 = v223;
                l_v224_0 = true;
                if l_v223_0 ~= l_SearchTypes_0.Games then
                    l_v224_0 = true;
                    if l_v223_0 ~= l_SearchTypes_0.Auto then
                        l_v224_0 = true;
                        if l_v223_0 ~= l_SearchTypes_0.TopResults then
                            l_v224_0 = v56() and l_v223_0 == l_SearchTypes_0.Catalog;
                        end;
                    end;
                end;
            end;
            v228.autocomplete = l_v224_0;
            v228.isSearching = v218.state.isSearching;
            v228.initialSearchText = v218.props.searchParameters and v218.props.searchParameters.searchKeyword or "";
            v228[v11.Ref] = v218.searchBarRef;
            v228.searchPageOverlayEnabled = if v218:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v223) else nil;
            v228.disableListPicker = if v218:isSearchPageOverlayEnabled() then v25.isSearchTypeInOmniSearch(v223) else nil;
            return l_createElement_1(l_v37_1, v228);
        end;
    else
        return nil;
    end;
end;
v75.renderAppHeaderBar = function(v231, v232, v233, v234, v235, v236, v237, v238) --[[ Line: 828 ]] --[[ Name: renderAppHeaderBar ]]
    -- upvalues: l_NAV_BAR_SIZE_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v69 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), v49 (copy), v71 (ref), v11 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_LayoutConfig_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), l_AppHeaderBar_0 (copy)
    local l_Tokens_0 = v233.Tokens;
    local v240 = {};
    local l_tokens_2 = v231.props.tokens;
    v240.barHeight = l_NAV_BAR_SIZE_0 * l_tokens_2.Config.UI.Scale;
    local v242 = (not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v69) and function() --[[ Line: 842 ]]
        -- upvalues: v231 (copy), v236 (copy), v232 (copy)
        return v231.renderNavigation(v236 or v232.pageTitle);
    end or v231.renderNavigation;
    v240.renderNavigation = if v238 then v242 else nil;
    l_tokens_2 = v231.props.centerItem;
    v240.title = v236 or v232.pageTitle;
    v240.isTitleCentered = v238 and not v231.props.isSecondary or false;
    v240.titleFontStyle = if not not v238 or v231.props.isSecondary then l_Tokens_0.Semantic.Typography.Header else l_Tokens_0.Semantic.Typography.Title;
    if l_tokens_2 then
        v240.title = "";
    elseif v231.state.isSearching then
        v240.title = "";
    elseif l_FFlagLuaAppMoveProfileIntoTopBar_0 and (not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar()) and v238 and v49(v231.props.currentRoute[1].name, v231.props.currentRoute[#v231.props.currentRoute].name, v231.props.formFactor, v231.state.isSearching) then
        v240.title = "";
    elseif v69 and v238 and v71(v231.props.navigation.state.routeName, v231.props.currentRoute[#v231.props.currentRoute].name, v231.state.isSearching) then
        v240.title = "";
    end;
    v240.shouldRenderTitle = true;
    v240.shouldRenderCenter = true;
    if v234 or v235 then
        v240.renderCenter = v234 or v235;
    elseif l_tokens_2 then
        v240.renderCenter = v231.renderCenter;
    end;
    v240.renderUtilities = if v234 then nil else function() --[[ Line: 894 ]]
        -- upvalues: v11 (ref), v237 (copy)
        return v11.createFragment(v237);
    end;
    local l_gridConfig_0 = v231.props.gridConfig;
    local v244 = UDim.new(0, if l_FFlagLuaAppCompositionSupport_0 then v231.props.sideMarginOverride or l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingHorizontal] else l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingHorizontal]);
    local v245 = UDim.new(0, l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingRightItems]);
    v240.utilitiesGap = if l_FFlagEnableHeaderBarButtonsUpdate_0 then UDim.new(0, v231.props.tokens.Size.Size_100) else v245;
    v240.paddingLeft = v244;
    v240.paddingRight = v244;
    v240.paddingTop = UDim.new(0, 0);
    v240.paddingBottom = UDim.new(0, 0);
    v240.backgroundStyle = if v231.props.transparentBackground then {
        Color3 = Color3.new(0, 0, 0), 
        Transparency = 1
    } else nil;
    v240.onMedia = false;
    return v11.createElement(l_AppHeaderBar_0, v240);
end;
v75.renderWithProviders = function(v246, v247, v248, v249) --[[ Line: 924 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_LayoutConfig_0 (copy), l_NAV_BAR_SIZE_0 (copy), l_SearchTypes_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v54 (copy), l_VisibilityControl_0 (copy), l_FFlagAppIaStatusBar_0 (copy), v11 (copy), v10 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_Focusable_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v47 (copy)
    local l_titleText_0 = v246.props.titleText;
    local v251 = v246:shouldShowLeftItem();
    local v252 = v246:hasSearchButton() and v246.props.enableSearch;
    local l_searchType_3 = v246.props.searchType;
    local l_enableSearchAutoComplete_0 = v246.props.enableSearchAutoComplete;
    local l_ZIndex_0 = v246.props.ZIndex;
    local v256 = v246.props.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
    local l_statusBarHeight_2 = v246.props.statusBarHeight;
    local l_tokens_3 = v246.props.tokens;
    l_tokens_3 = l_statusBarHeight_2 + l_NAV_BAR_SIZE_0 * l_tokens_3.Config.UI.Scale + v256;
    local v259 = l_tokens_3 + v246.props.totalBannerHeight;
    local v260 = v246:isCompactViewMode();
    local l_searchPlaceholderSearchGames_0 = v249.searchPlaceholderSearchGames;
    if l_searchType_3 == l_SearchTypes_0.Catalog then
        l_searchPlaceholderSearchGames_0 = v249.searchPlaceholderSearchMarketplace;
    end;
    local v262 = v260 and (v246.state.isSearching or v246.props.showSearchBar);
    local v263 = not v246.props.showSearchBar;
    local v264 = v246:maybeRenderRightItems(v248, v262, v251);
    local v265 = v246:getRenderSearchBar(v262, v260, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0, v263, v251);
    local v266 = v246:getRenderRootSearchBar(v262, v252, v260, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0);
    local v267 = {
        Active = true, 
        BackgroundColor3 = v248.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v246.props.transparentBackground and 1 or v248.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, l_tokens_3), 
        ZIndex = 2
    };
    local v268 = UDim2.new(0, v246.props.screenSize.X, 0, v246.props.screenSize.Y);
    local v269 = UDim2.new(0, -v246.state.absolutePosition.X, 0, -v246.state.absolutePosition.Y);
    local l_forwardRef_0 = v246.props.forwardRef;
    local v271 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else if v266 or v260 and v246.state.isSearching then v246.searchBarRef else if v246:shouldShowLeftItem() then v246.leftItemRef else if v246:shouldShowCenterItem() then v246.centerItemRef else v246:getFirstRightItemRef();
    local v274 = if l_FFlagAppIaScrollAway_0 and v54.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v272) --[[ Line: 1003 ]]
        -- upvalues: l_FFlagAppIaStatusBar_0 (ref), v259 (copy), l_statusBarHeight_2 (copy)
        local v273 = if l_FFlagAppIaStatusBar_0 then (v272 - 1) * (v259 - l_statusBarHeight_2) else (v272 - 1) * v259;
        return UDim2.new(0, 0, 0, v273);
    end) else nil;
    local l_createElement_2 = v11.createElement;
    local v276 = "Frame";
    local v277 = {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0, 
        [v10.Tag] = if l_FFlagLuaAppCompositionSupport_0 then v246.props.tag else nil, 
        [v11.Change.AbsolutePosition] = v246.absolutePositionChangedCallback
    };
    local v278 = {};
    local l_createElement_3 = v11.createElement;
    local v280 = "Frame";
    local v281 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v259), 
        Position = v274
    };
    local v282 = {};
    local l_createElement_4 = v11.createElement;
    local v284 = "Frame";
    local l_v267_0 = v267;
    local v286 = {};
    local l_createElement_5 = v11.createElement;
    local v288 = l_FFlagEnableAppNavGamepadRemoval_0 and "Frame" or l_Focusable_0.Frame;
    local v289 = {
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundColor3 = v248.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v246.props.transparentBackground and 1 or v248.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 1, 0)
    };
    local l_new_0 = UDim2.new;
    local v291 = 1;
    local v292 = 0;
    local v293 = 0;
    local l_tokens_4 = v246.props.tokens;
    v289.Size = l_new_0(v291, v292, v293, l_NAV_BAR_SIZE_0 * l_tokens_4.Config.UI.Scale);
    v289[v11.Ref] = l_forwardRef_0;
    v289.NextSelectionRight = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else not (v260 and v246.state.isSearching) and v246.props.NextSelectionRight or nil;
    v289.NextSelectionDown = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else not (v260 and v246.state.isSearching) and v246.props.NextSelectionDown or nil;
    v289.defaultChild = v271;
    v286.NavBar = l_createElement_5(v288, v289, {
        AppHeaderBar = v246:renderAppHeaderBar(v249, v248, v265, v266, l_titleText_0, v264, v251)
    });
    v282.TopBar = l_createElement_4(v284, l_v267_0, v286);
    v282.BannerContainer = v11.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.new(0, 0, 0, l_tokens_3), 
        BackgroundTransparency = 1
    }, v246.props.bannerContainer);
    v278.TopBarContents = l_createElement_3(v280, v281, v282);
    v278.DarkOverlay = v11.createElement("TextButton", {
        Size = v268, 
        Position = v269, 
        AutoButtonColor = false, 
        BackgroundColor3 = v248.Theme.Overlay.Color, 
        BackgroundTransparency = 1, 
        Text = "", 
        Visible = v246.state.isSearching, 
        [v11.Event.Activated] = v246.cancelSearchAndEndSession, 
        ZIndex = 1
    });
    v278.LastInputChangedListener = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v11.createElement(l_ExternalEventConnection_0, {
        event = l_UserInputService_0.LastInputTypeChanged, 
        callback = function(v295) --[[ Line: 1075 ]] --[[ Name: callback ]]
            -- upvalues: v246 (copy)
            v246:setState({
                lastInputType = v295
            });
        end
    });
    v278.SignalConnection = v11.createElement(v47, {
        signal = v247, 
        callback = v246.searchSignalCallback
    });
    v278.HiddenItems = v246:renderHiddenItems();
    return l_createElement_2(v276, v277, v278);
end;
v75.renderHiddenItems = function(v296) --[[ Line: 1091 ]] --[[ Name: renderHiddenItems ]]
    -- upvalues: v11 (copy)
    return v11.createElement("Frame", {
        Visible = false
    }, {
        leftItem = v296.props.leftItem and not v296:shouldShowLeftItem() and v296:renderTopBarItem(v296.props.leftItem), 
        centerItem = v296.props.centerItem and not v296:shouldShowCenterItem() and v296:renderTopBarItem(v296.props.centerItem)
    });
end;
v75.render = function(v297) --[[ Line: 1102 ]] --[[ Name: render ]]
    -- upvalues: v46 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return v46(function(v298) --[[ Line: 1103 ]]
        -- upvalues: l_withStyle_0 (ref), v297 (copy), l_withLocalization_0 (ref)
        return l_withStyle_0(function(v299) --[[ Line: 1104 ]]
            -- upvalues: v297 (ref), l_withLocalization_0 (ref), v298 (copy)
            local v300 = v297:getPageNameLocalizationKey();
            return l_withLocalization_0({
                pageTitle = v300, 
                searchPlaceholderSearchGames = "Search.GlobalSearch.Example.SearchGames", 
                searchPlaceholderSearchMarketplace = "Search.GlobalSearch.Example.SearchMarketplace"
            })(function(v301) --[[ Line: 1110 ]]
                -- upvalues: v297 (ref), v298 (ref), v299 (copy)
                return v297:renderWithProviders(v298, v299, v301);
            end);
        end);
    end);
end;
v75.didUpdate = function(v302, v303, v304) --[[ Line: 1117 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy), v74 (copy)
    v302:updateTopBarHeight(v303, v304);
    if not l_FFlagEnableAppNavGamepadRemoval_0 then
        local v305 = v74[v302.state.lastInputType];
        local l_focusController_0 = v302.props.focusController;
        if v302.state.isSearching and not v304.isSearching and v305 and l_focusController_0 then
            l_focusController_0.moveFocusTo(v302.searchBarRef);
        elseif not v302.state.isSearching and v304.isSearching and v305 and l_focusController_0 then
            l_focusController_0.moveFocusTo(v302.searchButtonRef);
        end;
    end;
    v302:closeSearchBarIfLeavingPage(v303);
end;
v75.closeSearchBarIfLeavingPage = function(v307, v308) --[[ Line: 1133 ]] --[[ Name: closeSearchBarIfLeavingPage ]]
    local l_currentRoute_2 = v307.props.currentRoute;
    local l_currentRoute_3 = v308.currentRoute;
    if l_currentRoute_2[#l_currentRoute_2].name ~= l_currentRoute_3[#l_currentRoute_3].name and v307.state.isSearching == true then
        v307.onExitSearch();
    end;
    if v307.props.avatarRoute and v308.avatarRoute and v307.props.avatarRoute.opaque.key ~= v308.avatarRoute.opaque.key and v307.state.isSearching == true then
        v307.onExitSearch();
    end;
end;
local function _(v311) --[[ Line: 1154 ]] --[[ Name: isInPeekViewFromSearch ]]
    -- upvalues: v45 (copy), v29 (copy)
    local l_name_3 = v311[#v311].name;
    return (not (not v45() or l_name_3 ~= v29.GameDetail) or l_name_3 == v29.ProfilePlatform) and #v311 > 1 and v311[#v311 - 1].name == v29.SearchPage;
end;
local function _(v314) --[[ Line: 1163 ]] --[[ Name: getShowSearchBar ]]
    -- upvalues: v29 (copy), v45 (copy)
    if v314[#v314].name == v29.SearchPage then
        return true;
    else
        local l_name_4 = v314[#v314].name;
        if (not (not v45() or l_name_4 ~= v29.GameDetail) or l_name_4 == v29.ProfilePlatform) and #v314 > 1 and v314[#v314 - 1].name == v29.SearchPage then
            return true;
        else
            return false;
        end;
    end;
end;
local function v321(v317) --[[ Line: 1175 ]] --[[ Name: getCurrentOpaquePage ]]
    -- upvalues: v30 (copy)
    for v318 = #v317, 1, -1 do
        local l_name_5 = v317[v318].name;
        local v320 = v30[l_name_5];
        if v320 == nil or not v320.renderUnderlyingPage then
            return l_name_5;
        end;
    end;
    return nil;
end;
v75 = v40(function(v322, v323) --[[ Line: 1187 ]]
    -- upvalues: l_FFlagLuaAppCompositionSupport_0 (copy), l_getPageMargin_0 (copy), l_withGridConfig_DEPRECATED_0 (copy), l_LayoutConfig_0 (copy), v11 (copy), v8 (copy)
    local v324 = if l_FFlagLuaAppCompositionSupport_0 then v323.sideMarginOverride or l_getPageMargin_0(v323.screenSize.X) else l_getPageMargin_0(v323.screenSize.X);
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingRightItems] = 0, 
        [l_LayoutConfig_0.Keys.PaddingHorizontal] = v324, 
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v325) --[[ Line: 1196 ]]
        -- upvalues: v11 (ref), v322 (copy), v8 (ref), v323 (copy)
        return v11.createElement(v322, v8.Dictionary.join(v323, {
            gridConfig = v325
        }));
    end);
end)(v75);
v75 = v12.connect(function(v326, _) --[[ Line: 1206 ]]
    -- upvalues: v29 (copy), v45 (copy), v321 (copy)
    local v328 = v326.Navigation.history[#v326.Navigation.history];
    local v329 = {
        screenSize = v326.ScreenSize, 
        formFactor = v326.FormFactor, 
        currentRoute = v328
    };
    local v330;
    if v328[#v328].name == v29.SearchPage then
        v330 = true;
    else
        local l_name_6 = v328[#v328].name;
        v330 = (not (not v45() or l_name_6 ~= v29.GameDetail) or l_name_6 == v29.ProfilePlatform) and #v328 > 1 and v328[#v328 - 1].name == v29.SearchPage and true or false;
    end;
    v329.showSearchBar = v330;
    v329.statusBarHeight = v326.TopBar.statusBarHeight;
    v329.opaquePage = v321(v328);
    return v329;
end, function(v332) --[[ Line: 1217 ]]
    -- upvalues: v28 (copy), v31 (copy)
    return {
        confirmSearch = function(v333, v334) --[[ Line: 1219 ]] --[[ Name: confirmSearch ]]
            -- upvalues: v332 (copy), v28 (ref)
            return v332(v28(v333, v334));
        end, 
        setTopBarHeight = function(v335) --[[ Line: 1222 ]] --[[ Name: setTopBarHeight ]]
            -- upvalues: v332 (copy), v31 (ref)
            return v332(v31(v335));
        end
    };
end)(v75);
v75 = l_RoactServices_0.connect({
    analytics = v18, 
    sessionService = l_AppSessionService_0, 
    eventIngest = v21
})(v75);
v75 = l_RoactAppPolicy_0.connect(function(v336, _) --[[ Line: 1234 ]]
    return {
        enableNotifications = v336.getNotifications(), 
        enableSearch = v336.getSearchBar(), 
        enableSearchAutoComplete = v336.getSearchAutoComplete()
    };
end)(v75);
v75 = v48(v16.withNavigation(v75), {
    required = false
});
if not v70 and l_FFlagSearchOmniAutocompletePageIXP_0 then
    v75 = v23.connectUserLayer({
        v62
    }, function(v338, _) --[[ Line: 1248 ]]
        -- upvalues: v62 (copy)
        return {
            shouldShowSearchLandingPage = (v338[v62] or {}).shouldShowSearchLandingPage
        };
    end, false)(v75);
end;
local l_v75_0 = v75;
v75 = function(v341) --[[ Line: 1258 ]]
    -- upvalues: v44 (copy), l_useIsSpatial_0 (copy), l_useTokens_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v11 (copy), l_v75_0 (copy), v8 (copy), v15 (copy)
    local l_hideSiteMessageBanner_0 = v341.hideSiteMessageBanner;
    local v343, v344 = v44(l_hideSiteMessageBanner_0);
    local v345 = l_useIsSpatial_0();
    local v346 = l_useTokens_0();
    if l_FFlagEnableAppNavGamepadRemoval_0 then
        return v11.createElement(l_v75_0, v8.Dictionary.join(v341, {
            bannerContainer = v343, 
            totalBannerHeight = v344, 
            isSpatial = v345, 
            tokens = v346
        }));
    else
        return v15.withFocusController(function(v347) --[[ Line: 1276 ]]
            -- upvalues: v11 (ref), l_v75_0 (ref), v8 (ref), v341 (copy), v343 (copy), v344 (copy), v345 (copy), v346 (copy)
            return v11.createElement(l_v75_0, v8.Dictionary.join(v341, {
                focusController = v347, 
                bannerContainer = v343, 
                totalBannerHeight = v344, 
                isSpatial = v345, 
                tokens = v346
            }));
        end);
    end;
end;
return v11.forwardRef(function(v348, v349) --[[ Line: 1291 ]]
    -- upvalues: v11 (copy), v75 (ref), v8 (copy)
    return v11.createElement(v75, v8.Dictionary.join(v348, {
        forwardRef = v349
    }));
end);