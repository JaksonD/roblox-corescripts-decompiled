local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_FitFrameVertical_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.PillsNavigation);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCategoryPillPositionAnimation_0 = v10.FFlagAXCategoryPillPositionAnimation;
local l_FFlagAXCatalogSupportDisableFilters_0 = v10.FFlagAXCatalogSupportDisableFilters;
return v3.memo(function(v13) --[[ Line: 46 ]] --[[ Name: PillsNavigationFrame ]]
    -- upvalues: v3 (copy), l_useStyle_0 (copy), v9 (copy), l_FFlagAXCatalogSupportDisableFilters_0 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), v7 (copy), l_FFlagAXCategoryPillPositionAnimation_0 (copy)
    local v14 = v3.useRef(nil);
    local v15 = v3.useRef(nil);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v17 = v3.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v9 (ref), v13 (copy)
        return v9.extractCategoryById(v13.selectedCategoryId, v13.categoryTable);
    end, {
        v13.selectedCategoryId, 
        v13.categoryTable
    });
    local v18 = nil;
    if l_FFlagAXCatalogSupportDisableFilters_0 then
        v18 = v17.DisableFilters;
    end;
    local v19 = v17.Subcategories ~= nil;
    local v21 = v3.useCallback(function(v20) --[[ Line: 63 ]]
        -- upvalues: v13 (copy)
        if v13.absoluteSizeChanged then
            v13.absoluteSizeChanged(v20.AbsoluteSize);
        end;
    end, {
        v13.absoluteSizeChanged
    });
    local l_createElement_0 = v3.createElement;
    local v23 = l_Focusable_0[l_FitFrameVertical_0];
    local v24 = {
        width = UDim.new(1, 0), 
        FillDirection = Enum.FillDirection.Vertical, 
        BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundContrast.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v13.layoutOrderMain, 
        ZIndex = 3, 
        [v3.Change.AbsoluteSize] = v21, 
        ref = v13.navigationFrameRef, 
        defaultChild = v14, 
        restorePreviousChildFocus = true
    };
    local v25 = {};
    local l_createElement_1 = v3.createElement;
    local l_v7_0 = v7;
    local v28 = {
        layoutOrder = v13.layoutOrderMain, 
        navHeight = v13.navHeightMain, 
        zIndex = 1, 
        categories = v13.categoryTable, 
        selectedCategoryId = v13.selectedCategoryId, 
        selectCategoryId = v13.selectCategoryId, 
        selectedSubcategoryId = v13.selectedSubcategoryId, 
        selectSubcategoryId = v13.selectSubcategoryId
    };
    local v29 = false;
    if v13.selectedSubcategoryId ~= nil then
        v29 = v19;
    end;
    v28.subcategorySelected = v29;
    v28.shouldShowSubcategories = if l_FFlagAXCategoryPillPositionAnimation_0 then v19 else nil;
    v28.hideFilterButton = if l_FFlagAXCatalogSupportDisableFilters_0 then v18 else nil;
    v28.ref = v14;
    v28.NextSelectionDown = if not v19 and v13.showingTopics then v13.NextSelectionDown else v15;
    v28.NextSelectionUp = v13.NextSelectionUp;
    v25.PillsNavigation = l_createElement_1(l_v7_0, v28);
    return l_createElement_0(v23, v24, v25);
end);