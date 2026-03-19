local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_Focusable_0 = v4.Focusable;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Components.CatalogTopicBar);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.NavBar.CatalogNavigation);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.FocusedWidgetTopContent);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v13) --[[ Line: 74 ]] --[[ Name: CatalogResultListNavigationView ]]
    -- upvalues: v3 (copy), l_Focusable_0 (copy), v9 (copy), v12 (copy), v8 (copy), v10 (copy), v11 (copy)
    return v3.createElement(l_Focusable_0.Frame, {
        [v3.Tag] = "data-testid=CatalogResultListNavigationView", 
        BackgroundTransparency = v13.backgroundTransparency, 
        BackgroundColor3 = v13.backgroundColor, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        restorePreviousChildFocus = v13.restorePreviousChildFocus, 
        ref = v13.topPanelRef, 
        defaultChild = v13.defaultChildRef, 
        NextSelectionDown = v13.nextSelectionDown, 
        [v3.Change.AbsoluteSize] = function(v14) --[[ Line: 87 ]]
            -- upvalues: v13 (copy)
            v13.updateHeightBinding(v14.AbsoluteSize.Y);
        end
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        NavBar = if v13.showNavBar then v3.createElement(v9, {
            analytics = v13.catalogAnalytics, 
            axAnalytics = v13.axAnalytics, 
            layoutOrderMain = 1, 
            layoutOrderSub = 2, 
            navHeightMain = v13.navHeightMain, 
            navHeightSub = v12.SubNavHeight, 
            navBarRef = v13.navBarRef, 
            NextSelectionDown = v13.navBarNextSelectionDown, 
            backToTopSignal = v13.backToTopSignal, 
            showingTopics = v13.showTopics, 
            fromSearch = v13.fromSearch, 
            onCategoryOrSubcategoryChange = v13.onCategoryOrSubcategoryChange, 
            onCategoryOrSubcategoryChangeById = v13.onCategoryOrSubcategoryChangeById, 
            selectedCategoryId = v13.selectedCategoryId, 
            selectedSubcategoryId = v13.selectedSubcategoryId, 
            categories = v13.categories
        }) else nil, 
        PillBar = if v13.showTopics then v3.createElement(v8, {
            layoutOrder = 3, 
            NextSelectionUp = v13.pillBarNextSelectionUp, 
            frameRef = v13.pillBarRef, 
            items = v13.topicBarItems, 
            searchKeyword = v13.searchKeyword, 
            showFilterButton = v13.showTopicBarFilterButton or false
        }) else if v13.showFilterButtonLayout then v3.createElement(v10, {
            height = v12.PillBarHeight, 
            isContentEmpty = true, 
            layoutOrder = 3, 
            showFilterButton = v13.filterButtonLayoutShowFilterButton, 
            layoutRef = v13.pillBarRef, 
            NextSelectionUp = v13.filterButtonLayoutNextSelectionUp
        }) else nil, 
        FocusedWidgetBar = if v13.focusedWidgetActive then v3.createElement(v11, {
            active = v13.focusedWidgetActive, 
            focusedWidgetTitle = v13.focusedWidgetTitle, 
            focusedWidgetLocalizedTitle = v13.focusedWidgetLocalizedTitle, 
            focusedWidgetLocalizedTooltip = v13.focusedWidgetLocalizedTooltip, 
            showCloseIcon = v13.showCloseIcon, 
            searchUuid = v13.searchUuid, 
            layoutOrder = 4, 
            onClose = v13.onCloseFocusedWidget
        }) else nil
    });
end;