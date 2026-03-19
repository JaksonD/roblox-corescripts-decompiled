local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills);
local l_FFlagAXCatalogCategoriesStore_0 = v6.FFlagAXCatalogCategoriesStore;
local l_FFlagAXCatalogSupportDisableFilters_0 = v6.FFlagAXCatalogSupportDisableFilters;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v6.FFlagAXMoveCatalogFilterToL1Navigation;
local l_FFlagAXCatalogSearchSupportDisableFilters_0 = v6.FFlagAXCatalogSearchSupportDisableFilters;
local l_FFlagAXCatalogCategoriesSDUI_0 = v6.FFlagAXCatalogCategoriesSDUI;
local _ = require(script.Parent.CatalogResultListNavigationView);
return function(v19) --[[ Line: 54 ]] --[[ Name: useCatalogResultListNavigationViewModel ]]
    -- upvalues: v3 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v11 (copy), l_useSignalState_0 (copy), l_FFlagAXCatalogSupportDisableFilters_0 (copy), v12 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), v10 (copy), l_FFlagAXCatalogSearchSupportDisableFilters_0 (copy)
    local v20 = v3.useRef(nil);
    local v21 = v3.useRef(nil);
    local v22 = l_useNavigation_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_fromSearch_0 = v19.fromSearch;
    local v25 = v19.searchInCatalog and v19.searchInCatalog.items or nil;
    local v26 = v19.focusedWidget and v19.focusedWidget.active and true or false;
    local l_l_fromSearch_0_0 = l_fromSearch_0;
    local v28 = true;
    local l_l_fromSearch_0_1 = l_fromSearch_0;
    if v19.hidePillBar then
        l_l_fromSearch_0_0 = false;
        l_l_fromSearch_0_1 = false;
    end;
    if v19.hideTopBar then
        v28 = false;
        l_l_fromSearch_0_1 = false;
        l_l_fromSearch_0_0 = false;
    end;
    local v30 = nil;
    if v22.state.routeName == l_AvatarScreen_0.CatalogSearch then
        v30 = (v22.getParam("searchParams") or {}).searchKeyword;
    end;
    local v31 = if v28 then v20 else nil;
    local v32 = nil;
    local v33 = nil;
    local _ = nil;
    local v35 = nil;
    local v36 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        if l_FFlagAXCatalogCategoriesSDUI_0 then
            local v37 = v11.getCatalogCategoriesStore();
            v35 = l_useSignalState_0(v37.getCategories);
        end;
        local v38 = if l_fromSearch_0 then v11.getCatalogSearchSelectionStore() else v11.getCatalogSelectionStore();
        v32 = l_useSignalState_0(v38.selectedCategoryId);
        v33 = l_useSignalState_0(v38.selectedSubcategoryId);
        if l_FFlagAXCatalogSupportDisableFilters_0 then
            v36 = l_useSignalState_0(v38.selectedCategoryInfo).DisableFilters;
        end;
    end;
    local v39 = if not not v12() or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v10.CatalogMainNavHeight else v10.MainNavHeight;
    local v40 = l_l_fromSearch_0_1 and not l_l_fromSearch_0_0 and not l_FFlagAXMoveCatalogFilterToL1Navigation_0;
    local v41 = nil;
    if l_FFlagAXCatalogSearchSupportDisableFilters_0 then
        v41 = not v36;
    end;
    local v42 = true;
    if l_FFlagAXCatalogSupportDisableFilters_0 then
        v42 = not v36;
    end;
    return {
        backgroundTransparency = l_Theme_0.BackgroundDefault.Transparency or 1, 
        backgroundColor = l_Theme_0.BackgroundDefault.Color, 
        restorePreviousChildFocus = v19.restorePreviousChildFocus, 
        topPanelRef = v19.topPanelRef, 
        defaultChildRef = if v28 then v20 else v21, 
        nextSelectionDown = if v19.hasEntries then v19.gridRef else nil, 
        updateHeightBinding = v19.updateHeightBinding, 
        showNavBar = v28, 
        showTopics = l_l_fromSearch_0_0, 
        showFilterButtonLayout = v40, 
        focusedWidgetActive = v26, 
        catalogAnalytics = v19.catalogAnalytics, 
        axAnalytics = v19.axAnalytics, 
        navHeightMain = v39, 
        navBarRef = v20, 
        navBarNextSelectionDown = if l_l_fromSearch_0_0 then v21 else nil, 
        backToTopSignal = v19.backToTopSignal, 
        fromSearch = l_fromSearch_0, 
        onCategoryOrSubcategoryChange = v19.onCategoryOrSubcategoryChange, 
        onCategoryOrSubcategoryChangeById = v19.onCategoryOrSubcategoryChangeById, 
        selectedCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then v32 else nil, 
        selectedSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then v33 else nil, 
        categories = if l_FFlagAXCatalogCategoriesSDUI_0 then v35 else nil, 
        pillBarRef = v21, 
        pillBarNextSelectionUp = v31, 
        topicBarItems = v25, 
        searchKeyword = v30, 
        showTopicBarFilterButton = v41, 
        filterButtonLayoutShowFilterButton = v42, 
        filterButtonLayoutNextSelectionUp = v31, 
        focusedWidgetTitle = v19.focusedWidget.title, 
        focusedWidgetLocalizedTitle = v19.focusedWidget.localizedTitle, 
        focusedWidgetLocalizedTooltip = v19.focusedWidget.localizedTooltip, 
        showCloseIcon = v19.showCloseIcon, 
        searchUuid = v19.searchUuid, 
        onCloseFocusedWidget = v19.onCloseFocusedWidget
    };
end;