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
local l_FFlagAXParentCatClickableWhenSubCatOn_0 = v9.FFlagAXParentCatClickableWhenSubCatOn;
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
v23.init = function(v31) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXParentCatClickableWhenSubCatOn_0 (copy), v27 (copy), l_FFlagAXLogNilCategoryAndSubcategorySelection_0 (copy), v26 (copy)
    v31.selectCategory = function(v32) --[[ Line: 78 ]]
        -- upvalues: v31 (copy)
        if v32 == v31.props.selectedCategoryIndex then
            return;
        else
            local l_onCategoryOrSubcategoryChange_0 = v31.props.onCategoryOrSubcategoryChange;
            if l_onCategoryOrSubcategoryChange_0 then
                l_onCategoryOrSubcategoryChange_0(v32, 0);
            end;
            v31:setCategoryAndSubcategory(v32, nil);
            return;
        end;
    end;
    v31.selectSubcategory = function(_, v35) --[[ Line: 92 ]]
        -- upvalues: v31 (copy)
        if v35 == v31.props.selectedSubcategoryIndex then
            return;
        else
            local l_onCategoryOrSubcategoryChange_1 = v31.props.onCategoryOrSubcategoryChange;
            if l_onCategoryOrSubcategoryChange_1 then
                l_onCategoryOrSubcategoryChange_1(v31.props.selectedCategoryIndex, v35);
            end;
            v31:setCategoryAndSubcategory(nil, v35);
            return;
        end;
    end;
    v31.selectCategoryId = function(v37) --[[ Line: 106 ]]
        -- upvalues: l_FFlagAXParentCatClickableWhenSubCatOn_0 (ref), v27 (ref), v31 (copy), l_FFlagAXLogNilCategoryAndSubcategorySelection_0 (ref), v26 (ref)
        if l_FFlagAXParentCatClickableWhenSubCatOn_0 and not v27() then
            if v37 == v31.props.selectedCategoryId and v31.props.selectedSubcategoryId == nil then
                return;
            end;
        elseif v37 == v31.props.selectedCategoryId then
            return;
        end;
        local l_onCategoryOrSubcategoryChangeById_0 = v31.props.onCategoryOrSubcategoryChangeById;
        if l_onCategoryOrSubcategoryChangeById_0 then
            l_onCategoryOrSubcategoryChangeById_0(v37, nil);
        end;
        if l_FFlagAXLogNilCategoryAndSubcategorySelection_0 and v37 == nil then
            v26("CatalogNavigation:selectCategoryId called with nil categoryId", v37);
        end;
        v31:setCategoryAndSubcategoryById(v37, nil);
    end;
    v31.selectSubcategoryId = function(_, v40) --[[ Line: 130 ]]
        -- upvalues: v31 (copy), l_FFlagAXLogNilCategoryAndSubcategorySelection_0 (ref), v26 (ref)
        if v40 == v31.props.selectedSubcategoryId then
            return;
        else
            local l_onCategoryOrSubcategoryChangeById_1 = v31.props.onCategoryOrSubcategoryChangeById;
            if l_onCategoryOrSubcategoryChangeById_1 then
                l_onCategoryOrSubcategoryChangeById_1(v31.props.selectedCategoryId, v40);
            end;
            if l_FFlagAXLogNilCategoryAndSubcategorySelection_0 and v40 == nil then
                v26("CatalogNavigation:selectSubcategoryId called with nil subCategoryId", v40);
            end;
            v31:setCategoryAndSubcategoryById(nil, v40);
            return;
        end;
    end;
    v31.onSubNavigationPropsDidUpdate = function(v42, v43) --[[ Line: 147 ]]
        -- upvalues: v31 (copy)
        if v31.props.selectedCategoryId ~= v42.selectedCategoryId and v43.current then
            v43.current.CanvasPosition = Vector2.new();
        end;
    end;
end;
v23.setCategoryAndSubcategoryById = function(v44, v45, v46) --[[ Line: 160 ]] --[[ Name: setCategoryAndSubcategoryById ]]
    local l_analytics_0 = v44.props.analytics;
    local l_axAnalytics_0 = v44.props.axAnalytics;
    local l_navigation_0 = v44.props.navigation;
    local l_backToTopSignal_0 = v44.props.backToTopSignal;
    if l_backToTopSignal_0 and (v45 == nil or v45 == v44.props.selectedCategoryId) and (v46 == nil or v46 == v44.props.selectedSubcategoryId) then
        l_backToTopSignal_0:fire();
    end;
    if v44.props.fromSearch and v44.props.setSearchCategoryAndSubcategory then
        v44.props.setSearchCategoryAndSubcategory(v45, v46);
    else
        v44.props.setCategoryAndSubcategory(v45, v46, l_analytics_0);
    end;
    v44.props.exit3DFullView(l_axAnalytics_0, l_navigation_0.state.routeName);
end;
v23.processCatalogDeepLink = function(v51) --[[ Line: 184 ]] --[[ Name: processCatalogDeepLink ]]
    -- upvalues: v8 (copy)
    local l_externalNavigationRequest_0 = v51.props.externalNavigationRequest;
    local v53 = l_externalNavigationRequest_0.params or {};
    if v53.keyword == nil and v8.catalogDeepLinkExists(l_externalNavigationRequest_0) then
        local v54 = v8.buildCatalogFilterFromDeepLinkParams(v53);
        v51.props.applyDeepLinkCatalogFilters(v54);
    end;
end;
v23.didUpdate = function(v55) --[[ Line: 194 ]] --[[ Name: didUpdate ]]
    v55:processCatalogDeepLink();
end;
v23.didMount = function(v56) --[[ Line: 198 ]] --[[ Name: didMount ]]
    v56:processCatalogDeepLink();
end;
v23.render = function(v57) --[[ Line: 202 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v14 (copy), v13 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v24 (copy), v27 (copy), v25 (copy), v3 (copy), v18 (copy), v17 (copy)
    local l_layoutOrderMain_0 = v57.props.layoutOrderMain;
    local l_layoutOrderSub_0 = v57.props.layoutOrderSub;
    local l_navHeightMain_0 = v57.props.navHeightMain;
    local l_navHeightSub_0 = v57.props.navHeightSub;
    local l_selectedCategoryIndex_0 = v57.props.selectedCategoryIndex;
    local l_selectedSubcategoryIndex_0 = v57.props.selectedSubcategoryIndex;
    local l_selectedCategoryId_0 = v57.props.selectedCategoryId;
    local l_selectedSubcategoryId_0 = v57.props.selectedSubcategoryId;
    local l_absoluteSizeChanged_0 = v57.props.absoluteSizeChanged;
    local l_showingTopics_0 = v57.props.showingTopics;
    local l_selectCategory_0 = v57.selectCategory;
    local l_selectSubcategory_0 = v57.selectSubcategory;
    local l_selectCategoryId_0 = v57.selectCategoryId;
    local l_selectSubcategoryId_0 = v57.selectSubcategoryId;
    local v72 = if l_FFlagAXCatalogCategoriesStore_0 then v14() else v13();
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v72 = v57.props.categories;
    end;
    local l_Subcategories_0 = v24.getCategoryId(l_selectedCategoryId_0).Subcategories;
    local l_navBarRef_0 = v57.props.navBarRef;
    if v27() and (not v25 or not v57.props.fromSearch) then
        return v3.createElement(v18, {
            layoutOrderMain = l_layoutOrderMain_0, 
            navHeightMain = l_navHeightMain_0, 
            categoryTable = v72, 
            selectedCategoryId = l_selectedCategoryId_0, 
            selectCategoryId = l_selectCategoryId_0, 
            selectedSubcategoryId = l_selectedSubcategoryId_0, 
            selectSubcategoryId = l_selectSubcategoryId_0, 
            absoluteSizeChanged = l_absoluteSizeChanged_0, 
            showingTopics = l_showingTopics_0, 
            navigationFrameRef = l_navBarRef_0, 
            NextSelectionUp = v57.props.NextSelectionUp, 
            NextSelectionDown = v57.props.NextSelectionDown
        });
    else
        return v3.createElement(v17, {
            layoutOrderMain = l_layoutOrderMain_0, 
            navHeightMain = l_navHeightMain_0, 
            layoutOrderSub = l_layoutOrderSub_0, 
            navHeightSub = l_navHeightSub_0, 
            categoryTable = v72, 
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
            onSubNavigationPropsDidUpdate = v57.onSubNavigationPropsDidUpdate, 
            absoluteSizeChanged = l_absoluteSizeChanged_0, 
            showingTopics = l_showingTopics_0, 
            navigationFrameRef = l_navBarRef_0, 
            NextSelectionUp = v57.props.NextSelectionUp, 
            NextSelectionDown = v57.props.NextSelectionDown
        });
    end;
end;
v23 = v4.withNavigation(v23);
return v5.connect(function(v75, v76) --[[ Line: 291 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy)
    local v77 = nil;
    local v78 = nil;
    local v79 = nil;
    if not l_FFlagAXCatalogCategoriesStore_0 then
        if v76.fromSearch and v75.AvatarExperience.Catalog.SearchCategories then
            v77 = v75.AvatarExperience.Catalog.SearchCategories.categoryId;
            v78 = v75.AvatarExperience.Catalog.SearchCategories.subcategoryId;
        else
            v77 = v75.AvatarExperience.Catalog.Categories.categoryId;
            v78 = v75.AvatarExperience.Catalog.Categories.subcategoryId;
        end;
    end;
    v79 = v75.AvatarExperience.ExternalNavigationRequest or {};
    if l_FFlagAXCatalogCategoriesStore_0 then
        return {
            externalNavigationRequest = v79
        };
    else
        return {
            selectedCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v77, 
            selectedSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v78, 
            externalNavigationRequest = v79
        };
    end;
end, function(v80) --[[ Line: 321 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v12 (copy), l_FFlagAXMutedErrorLoggingForCategorySelection_0 (copy), v26 (copy), v16 (copy), v7 (copy), l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy), v21 (copy), v20 (copy)
    return {
        setCategoryAndSubcategory = function(v81, v82, v83) --[[ Line: 323 ]] --[[ Name: setCategoryAndSubcategory ]]
            -- upvalues: v80 (copy), v15 (ref)
            v80(v15(v81, v82, v83));
        end, 
        setSearchCategoryAndSubcategory = function(v84, v85) --[[ Line: 327 ]] --[[ Name: setSearchCategoryAndSubcategory ]]
            -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (ref), v12 (ref), l_FFlagAXMutedErrorLoggingForCategorySelection_0 (ref), v26 (ref), v80 (copy), v16 (ref)
            if l_FFlagAXCatalogCategoriesStore_0 then
                if not v12.getCatalogSearchSelectionStore().changeCategory(v84, v85) then
                    if l_FFlagAXMutedErrorLoggingForCategorySelection_0 then
                        v26("[SetSearchCategoryAndSubcategory] Failed to change to category: " .. tostring(v84) .. " and subcategory: " .. tostring(v85));
                        return;
                    else
                        v26("Failed to select subcategory in SetSearchCategoryAndSubcategory thunk");
                        return;
                    end;
                end;
            else
                v80(v16(v84, v85));
            end;
        end, 
        exit3DFullView = function(v86, v87) --[[ Line: 348 ]] --[[ Name: exit3DFullView ]]
            -- upvalues: v80 (copy), v7 (ref)
            v80(v7(v86, v87));
        end, 
        applyDeepLinkCatalogFilters = function(v88) --[[ Line: 351 ]] --[[ Name: applyDeepLinkCatalogFilters ]]
            -- upvalues: l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (ref), v80 (copy), v21 (ref), v20 (ref)
            if l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 then
                v80(v21(v88));
                return;
            else
                v80(v20(v88));
                return;
            end;
        end
    };
end)(v23);