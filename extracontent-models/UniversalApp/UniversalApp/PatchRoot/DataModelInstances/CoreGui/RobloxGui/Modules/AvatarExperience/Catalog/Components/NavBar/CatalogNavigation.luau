local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v8 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v9.FFlagAXCatalogCategoriesStore;
local l_FFlagAXMutedErrorLoggingForCategorySelection_0 = v9.FFlagAXMutedErrorLoggingForCategorySelection;
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategoriesFromStore);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetCategoryAndSubcategory);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchCategoryAndSubcategory);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavigationFrame);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.PillsNavigationFrame);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToDeepLinkCatalogFilterThunk);
local l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 = v9.FFlagAXFixPrefetchMarketplaceStartupCrash;
local v23 = v3.PureComponent:extend("CatalogNavigation");
local v24 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v25 = game:DefineFastFlag("AXDisableCategoryPillsOnCatalogSearch", false);
local v26 = require(l_Modules_0.LuaApp.mutedError);
local v27 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills);
local l_FFlagAXCatalogCategoriesSDUI_0 = v9.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXLogNilCategoryAndSubcategorySelection_0 = v9.FFlagAXLogNilCategoryAndSubcategorySelection;
v23.validateProps = v6.strictInterface({
    analytics = v6.table, 
    axAnalytics = v6.table, 
    layoutOrderMain = v6.number, 
    layoutOrderSub = v6.number, 
    navHeightMain = v6.number, 
    navHeightSub = v6.number, 
    absoluteSizeChanged = v6.optional(v6.callback), 
    navBarRef = v6.table, 
    NextSelectionDown = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    backToTopSignal = v6.optional(v6.table), 
    showingTopics = v6.optional(v6.boolean), 
    fromSearch = v6.optional(v6.boolean), 
    onCategoryOrSubcategoryChange = v6.optional(v6.callback), 
    onCategoryOrSubcategoryChangeById = v6.optional(v6.callback), 
    categories = if l_FFlagAXCatalogCategoriesSDUI_0 then v6.optional(v6.table) else nil, 
    selectedCategoryId = v6.string, 
    selectedSubcategoryId = v6.optional(v6.string), 
    externalNavigationRequest = v6.table, 
    setCategoryAndSubcategory = v6.callback, 
    setSearchCategoryAndSubcategory = v6.callback, 
    applyDeepLinkCatalogFilters = v6.callback, 
    exit3DFullView = v6.callback, 
    navigation = v6.table
});
v23.init = function(v30) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v27 (copy), l_FFlagAXLogNilCategoryAndSubcategorySelection_0 (copy), v26 (copy)
    v30.selectCategory = function(v31) --[[ Line: 77 ]]
        -- upvalues: v30 (copy)
        if v31 == v30.props.selectedCategoryIndex then
            return;
        else
            local l_onCategoryOrSubcategoryChange_0 = v30.props.onCategoryOrSubcategoryChange;
            if l_onCategoryOrSubcategoryChange_0 then
                l_onCategoryOrSubcategoryChange_0(v31, 0);
            end;
            v30:setCategoryAndSubcategory(v31, nil);
            return;
        end;
    end;
    v30.selectSubcategory = function(_, v34) --[[ Line: 91 ]]
        -- upvalues: v30 (copy)
        if v34 == v30.props.selectedSubcategoryIndex then
            return;
        else
            local l_onCategoryOrSubcategoryChange_1 = v30.props.onCategoryOrSubcategoryChange;
            if l_onCategoryOrSubcategoryChange_1 then
                l_onCategoryOrSubcategoryChange_1(v30.props.selectedCategoryIndex, v34);
            end;
            v30:setCategoryAndSubcategory(nil, v34);
            return;
        end;
    end;
    v30.selectCategoryId = function(v36) --[[ Line: 105 ]]
        -- upvalues: v27 (ref), v30 (copy), l_FFlagAXLogNilCategoryAndSubcategorySelection_0 (ref), v26 (ref)
        if not v27() then
            if v36 == v30.props.selectedCategoryId and v30.props.selectedSubcategoryId == nil then
                return;
            end;
        elseif v36 == v30.props.selectedCategoryId then
            return;
        end;
        local l_onCategoryOrSubcategoryChangeById_0 = v30.props.onCategoryOrSubcategoryChangeById;
        if l_onCategoryOrSubcategoryChangeById_0 then
            l_onCategoryOrSubcategoryChangeById_0(v36, nil);
        end;
        if l_FFlagAXLogNilCategoryAndSubcategorySelection_0 and v36 == nil then
            v26("CatalogNavigation:selectCategoryId called with nil categoryId", v36);
        end;
        v30:setCategoryAndSubcategoryById(v36, nil);
    end;
    v30.selectSubcategoryId = function(_, v39) --[[ Line: 129 ]]
        -- upvalues: v30 (copy), l_FFlagAXLogNilCategoryAndSubcategorySelection_0 (ref), v26 (ref)
        if v39 == v30.props.selectedSubcategoryId then
            return;
        else
            local l_onCategoryOrSubcategoryChangeById_1 = v30.props.onCategoryOrSubcategoryChangeById;
            if l_onCategoryOrSubcategoryChangeById_1 then
                l_onCategoryOrSubcategoryChangeById_1(v30.props.selectedCategoryId, v39);
            end;
            if l_FFlagAXLogNilCategoryAndSubcategorySelection_0 and v39 == nil then
                v26("CatalogNavigation:selectSubcategoryId called with nil subCategoryId", v39);
            end;
            v30:setCategoryAndSubcategoryById(nil, v39);
            return;
        end;
    end;
    v30.onSubNavigationPropsDidUpdate = function(v41, v42) --[[ Line: 146 ]]
        -- upvalues: v30 (copy)
        if v30.props.selectedCategoryId ~= v41.selectedCategoryId and v42.current then
            v42.current.CanvasPosition = Vector2.new();
        end;
    end;
end;
v23.setCategoryAndSubcategoryById = function(v43, v44, v45) --[[ Line: 159 ]] --[[ Name: setCategoryAndSubcategoryById ]]
    local l_analytics_0 = v43.props.analytics;
    local l_axAnalytics_0 = v43.props.axAnalytics;
    local l_navigation_0 = v43.props.navigation;
    local l_backToTopSignal_0 = v43.props.backToTopSignal;
    if l_backToTopSignal_0 and (v44 == nil or v44 == v43.props.selectedCategoryId) and (v45 == nil or v45 == v43.props.selectedSubcategoryId) then
        l_backToTopSignal_0:fire();
    end;
    if v43.props.fromSearch and v43.props.setSearchCategoryAndSubcategory then
        v43.props.setSearchCategoryAndSubcategory(v44, v45);
    else
        v43.props.setCategoryAndSubcategory(v44, v45, l_analytics_0);
    end;
    v43.props.exit3DFullView(l_axAnalytics_0, l_navigation_0.state.routeName);
end;
v23.processCatalogDeepLink = function(v50) --[[ Line: 183 ]] --[[ Name: processCatalogDeepLink ]]
    -- upvalues: v8 (copy)
    local l_externalNavigationRequest_0 = v50.props.externalNavigationRequest;
    local v52 = l_externalNavigationRequest_0.params or {};
    if v52.keyword == nil and v8.catalogDeepLinkExists(l_externalNavigationRequest_0) then
        local v53 = v8.buildCatalogFilterFromDeepLinkParams(v52);
        v50.props.applyDeepLinkCatalogFilters(v53);
    end;
end;
v23.didUpdate = function(v54) --[[ Line: 193 ]] --[[ Name: didUpdate ]]
    v54:processCatalogDeepLink();
end;
v23.didMount = function(v55) --[[ Line: 197 ]] --[[ Name: didMount ]]
    v55:processCatalogDeepLink();
end;
v23.render = function(v56) --[[ Line: 201 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v14 (copy), v13 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v24 (copy), v27 (copy), v25 (copy), v3 (copy), v18 (copy), v17 (copy)
    local l_layoutOrderMain_0 = v56.props.layoutOrderMain;
    local l_layoutOrderSub_0 = v56.props.layoutOrderSub;
    local l_navHeightMain_0 = v56.props.navHeightMain;
    local l_navHeightSub_0 = v56.props.navHeightSub;
    local l_selectedCategoryIndex_0 = v56.props.selectedCategoryIndex;
    local l_selectedSubcategoryIndex_0 = v56.props.selectedSubcategoryIndex;
    local l_selectedCategoryId_0 = v56.props.selectedCategoryId;
    local l_selectedSubcategoryId_0 = v56.props.selectedSubcategoryId;
    local l_absoluteSizeChanged_0 = v56.props.absoluteSizeChanged;
    local l_showingTopics_0 = v56.props.showingTopics;
    local l_selectCategory_0 = v56.selectCategory;
    local l_selectSubcategory_0 = v56.selectSubcategory;
    local l_selectCategoryId_0 = v56.selectCategoryId;
    local l_selectSubcategoryId_0 = v56.selectSubcategoryId;
    local v71 = if l_FFlagAXCatalogCategoriesStore_0 then v14() else v13();
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v71 = v56.props.categories;
    end;
    local l_Subcategories_0 = v24.getCategoryId(l_selectedCategoryId_0).Subcategories;
    local l_navBarRef_0 = v56.props.navBarRef;
    if v27() and (not v25 or not v56.props.fromSearch) then
        return v3.createElement(v18, {
            layoutOrderMain = l_layoutOrderMain_0, 
            navHeightMain = l_navHeightMain_0, 
            categoryTable = v71, 
            selectedCategoryId = l_selectedCategoryId_0, 
            selectCategoryId = l_selectCategoryId_0, 
            selectedSubcategoryId = l_selectedSubcategoryId_0, 
            selectSubcategoryId = l_selectSubcategoryId_0, 
            absoluteSizeChanged = l_absoluteSizeChanged_0, 
            showingTopics = l_showingTopics_0, 
            navigationFrameRef = l_navBarRef_0, 
            NextSelectionUp = v56.props.NextSelectionUp, 
            NextSelectionDown = v56.props.NextSelectionDown
        });
    else
        return v3.createElement(v17, {
            layoutOrderMain = l_layoutOrderMain_0, 
            navHeightMain = l_navHeightMain_0, 
            layoutOrderSub = l_layoutOrderSub_0, 
            navHeightSub = l_navHeightSub_0, 
            categoryTable = v71, 
            selectedCategoryIndex = l_selectedCategoryIndex_0, 
            selectCategory = l_selectCategory_0, 
            selectedSubcategoryIndex = l_selectedSubcategoryIndex_0, 
            selectSubcategory = l_selectSubcategory_0, 
            selectedCategoryId = l_selectedCategoryId_0, 
            selectCategoryId = l_selectCategoryId_0, 
            selectedSubcategoryId = l_selectedSubcategoryId_0, 
            selectSubcategoryId = l_selectSubcategoryId_0, 
            shouldUseCategoryId = true, 
            subcategoryTable = l_Subcategories_0, 
            onSubNavigationPropsDidUpdate = v56.onSubNavigationPropsDidUpdate, 
            absoluteSizeChanged = l_absoluteSizeChanged_0, 
            showingTopics = l_showingTopics_0, 
            navigationFrameRef = l_navBarRef_0, 
            NextSelectionUp = v56.props.NextSelectionUp, 
            NextSelectionDown = v56.props.NextSelectionDown
        });
    end;
end;
v23 = v4.withNavigation(v23);
return v5.connect(function(v74, v75) --[[ Line: 290 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy)
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    if not l_FFlagAXCatalogCategoriesStore_0 then
        if v75.fromSearch and v74.AvatarExperience.Catalog.SearchCategories then
            v76 = v74.AvatarExperience.Catalog.SearchCategories.categoryId;
            v77 = v74.AvatarExperience.Catalog.SearchCategories.subcategoryId;
        else
            v76 = v74.AvatarExperience.Catalog.Categories.categoryId;
            v77 = v74.AvatarExperience.Catalog.Categories.subcategoryId;
        end;
    end;
    v78 = v74.AvatarExperience.ExternalNavigationRequest or {};
    if l_FFlagAXCatalogCategoriesStore_0 then
        return {
            externalNavigationRequest = v78
        };
    else
        return {
            selectedCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v76, 
            selectedSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v77, 
            externalNavigationRequest = v78
        };
    end;
end, function(v79) --[[ Line: 320 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v12 (copy), l_FFlagAXMutedErrorLoggingForCategorySelection_0 (copy), v26 (copy), v16 (copy), v7 (copy), l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy), v21 (copy), v20 (copy)
    return {
        setCategoryAndSubcategory = function(v80, v81, v82) --[[ Line: 322 ]] --[[ Name: setCategoryAndSubcategory ]]
            -- upvalues: v79 (copy), v15 (ref)
            v79(v15(v80, v81, v82));
        end, 
        setSearchCategoryAndSubcategory = function(v83, v84) --[[ Line: 326 ]] --[[ Name: setSearchCategoryAndSubcategory ]]
            -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (ref), v12 (ref), l_FFlagAXMutedErrorLoggingForCategorySelection_0 (ref), v26 (ref), v79 (copy), v16 (ref)
            if l_FFlagAXCatalogCategoriesStore_0 then
                if not v12.getCatalogSearchSelectionStore().changeCategory(v83, v84) then
                    if l_FFlagAXMutedErrorLoggingForCategorySelection_0 then
                        v26("[SetSearchCategoryAndSubcategory] Failed to change to category: " .. tostring(v83) .. " and subcategory: " .. tostring(v84));
                        return;
                    else
                        v26("Failed to select subcategory in SetSearchCategoryAndSubcategory thunk");
                        return;
                    end;
                end;
            else
                v79(v16(v83, v84));
            end;
        end, 
        exit3DFullView = function(v85, v86) --[[ Line: 347 ]] --[[ Name: exit3DFullView ]]
            -- upvalues: v79 (copy), v7 (ref)
            v79(v7(v85, v86));
        end, 
        applyDeepLinkCatalogFilters = function(v87) --[[ Line: 350 ]] --[[ Name: applyDeepLinkCatalogFilters ]]
            -- upvalues: l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (ref), v79 (copy), v21 (ref), v20 (ref)
            if l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 then
                v79(v21(v87));
                return;
            else
                v79(v20(v87));
                return;
            end;
        end
    };
end)(v23);