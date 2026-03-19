local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_Focusable_0 = v5.Focusable;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Components.CatalogTopicBar);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.NavBar.CatalogNavigation);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.FocusedWidgetTopContent);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills);
local v17 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v17.FFlagAXCatalogCategoriesStore;
local l_FFlagAXCatalogSupportDisableFilters_0 = v17.FFlagAXCatalogSupportDisableFilters;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v17.FFlagAXMoveCatalogFilterToL1Navigation;
local l_FFlagAXCatalogSearchSupportDisableFilters_0 = v17.FFlagAXCatalogSearchSupportDisableFilters;
local l_FFlagAXCatalogCategoriesSDUI_0 = v17.FFlagAXCatalogCategoriesSDUI;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
return function(v25) --[[ Line: 56 ]] --[[ Name: ResultsListTopPanel ]]
    -- upvalues: v4 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v23 (copy), l_useSignalState_0 (copy), l_FFlagAXCatalogSupportDisableFilters_0 (copy), v3 (copy), l_Focusable_0 (copy), v12 (copy), v16 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), v10 (copy), v11 (copy), l_FFlagAXCatalogSearchSupportDisableFilters_0 (copy), v9 (copy), v13 (copy)
    local v26 = v4.useRef(nil);
    local v27 = v4.useRef(nil);
    local v28 = l_useNavigation_0();
    local l_fromSearch_0 = v25.fromSearch;
    local l_catalogAnalytics_0 = v25.catalogAnalytics;
    local l_axAnalytics_0 = v25.axAnalytics;
    local l_searchInCatalog_0 = v25.searchInCatalog;
    local v33 = l_searchInCatalog_0 and l_searchInCatalog_0.items or nil;
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_fromSearch_1 = v25.fromSearch;
    local v36 = v4.useMemo(function() --[[ Line: 71 ]]
        -- upvalues: v28 (copy), l_AvatarScreen_0 (ref)
        if v28.state.routeName == l_AvatarScreen_0.CatalogSearch then
            return (v28.getParam("searchParams") or {}).searchKeyword;
        else
            return nil;
        end;
    end, {
        v28
    });
    local v37 = true;
    local l_l_fromSearch_0_0 = l_fromSearch_0;
    local l_hideTopBar_0 = v25.hideTopBar;
    local l_active_0 = v25.focusedWidget.active;
    if v25.hidePillBar then
        l_fromSearch_1 = false;
        l_l_fromSearch_0_0 = false;
    end;
    if l_hideTopBar_0 then
        v37 = false;
        l_l_fromSearch_0_0 = false;
        l_fromSearch_1 = false;
    end;
    local v41 = if v37 then v26 else nil;
    local v42 = nil;
    local v43 = nil;
    local _ = nil;
    local v45 = nil;
    local v46 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        if l_FFlagAXCatalogCategoriesSDUI_0 then
            local v47 = v23.getCatalogCategoriesStore();
            v45 = l_useSignalState_0(v47.getCategories);
        end;
        local v48 = if v25.fromSearch then v23.getCatalogSearchSelectionStore() else v23.getCatalogSelectionStore();
        v42 = l_useSignalState_0(v48.selectedCategoryId);
        v43 = l_useSignalState_0(v48.selectedSubcategoryId);
        if l_FFlagAXCatalogSupportDisableFilters_0 then
            v46 = l_useSignalState_0(v48.selectedCategoryInfo).DisableFilters;
        end;
    end;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency or 1, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        restorePreviousChildFocus = v25.restorePreviousChildFocus, 
        ref = v25.topPanelRef, 
        defaultChild = if v37 then v26 else v27, 
        NextSelectionDown = if v25.hasEntries then v25.gridRef else nil, 
        [v3.Change.AbsoluteSize] = function(v49) --[[ Line: 136 ]]
            -- upvalues: v25 (copy)
            v25.updateHeightBinding(v49.AbsoluteSize.Y);
        end
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        NavBar = if v37 then v3.createElement(v12, {
            analytics = l_catalogAnalytics_0, 
            axAnalytics = l_axAnalytics_0, 
            layoutOrderMain = 1, 
            layoutOrderSub = 2, 
            navHeightMain = if not not v16() or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v10.CatalogMainNavHeight else v10.MainNavHeight, 
            navHeightSub = v10.SubNavHeight, 
            navBarRef = v26, 
            NextSelectionDown = if l_fromSearch_1 then v27 else nil, 
            backToTopSignal = v25.backToTopSignal, 
            showingTopics = l_fromSearch_1, 
            fromSearch = l_fromSearch_0, 
            onCategoryOrSubcategoryChange = v25.onCategoryOrSubcategoryChange, 
            onCategoryOrSubcategoryChangeById = v25.onCategoryOrSubcategoryChangeById, 
            selectedCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then v42 else nil, 
            selectedSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then v43 else nil, 
            categories = if l_FFlagAXCatalogCategoriesSDUI_0 then v45 else nil
        }) else nil, 
        PillBar = if l_fromSearch_1 then v3.createElement(v11, {
            layoutOrder = 3, 
            NextSelectionUp = v41, 
            frameRef = v27, 
            items = v33, 
            searchKeyword = v36, 
            showFilterButton = if l_FFlagAXCatalogSearchSupportDisableFilters_0 then not v46 else nil
        }) else if not l_l_fromSearch_0_0 or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then nil else v3.createElement(v9, {
            height = v10.PillBarHeight, 
            isContentEmpty = true, 
            layoutOrder = 3, 
            showFilterButton = not l_FFlagAXCatalogSupportDisableFilters_0 or not v46, 
            layoutRef = v27, 
            NextSelectionUp = v41
        }), 
        FocusedWidgetBar = if l_active_0 then v4.createElement(v13, {
            active = l_active_0, 
            focusedWidgetTitle = v25.focusedWidget.title, 
            focusedWidgetLocalizedTitle = v25.focusedWidget.localizedTitle, 
            focusedWidgetLocalizedTooltip = v25.focusedWidget.localizedTooltip, 
            showCloseIcon = v25.showCloseIcon, 
            searchUuid = v25.searchUuid, 
            layoutOrder = 4, 
            onClose = v25.onCloseFocusedWidget
        }) else nil
    });
end;