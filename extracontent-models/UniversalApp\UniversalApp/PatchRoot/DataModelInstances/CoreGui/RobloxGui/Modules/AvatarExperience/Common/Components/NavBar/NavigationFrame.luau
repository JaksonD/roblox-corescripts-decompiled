local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_FitFrameVertical_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical;
local l_NavigationEvents_0 = require(l_CorePackages_0.Packages.RoactNavigation).NavigationEvents;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_CloseableHeader_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Components.CloseableHeader;
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_CatalogCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.CatalogCategories;
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.MainNavigation);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.SubNavigation);
local v18 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP);
local v19 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v20.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXCatalogCategoriesSDUI_0 = v20.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXCatalogSupportDisableFilters_0 = v20.FFlagAXCatalogSupportDisableFilters;
local l_FFlagAXCustomizeMakeupSupport_0 = v20.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v20.FFlagAXMoveCatalogFilterToL1Navigation;
local v26 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
return v3.memo(function(v27) --[[ Line: 81 ]] --[[ Name: NavigationFrame ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), v26 (copy), l_FFlagAXCatalogSupportDisableFilters_0 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), l_AvatarScreen_0 (copy), v19 (copy), l_useLocalization_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_CatalogCategories_0 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_CloseableHeader_0 (copy), v13 (copy), v16 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v15 (copy), v17 (copy), v18 (copy), l_NavigationEvents_0 (copy)
    local v28 = l_useNavigation_0();
    local v29 = v3.useRef(nil);
    local v30 = v3.useRef(nil);
    local v31, v32 = v3.useState(false);
    local v33 = l_useStyle_0();
    local v34 = l_useTokens_0();
    local l_Theme_0 = v33.Theme;
    local v36 = nil;
    local v37 = nil;
    if v27.shouldUseCategoryId and v27.selectedCategoryId then
        v36 = v3.useMemo(function() --[[ Line: 95 ]]
            -- upvalues: v26 (ref), v27 (copy)
            return v26.extractCategoryById(v27.selectedCategoryId, v27.categoryTable);
        end, {
            v27.selectedCategoryId, 
            v27.categoryTable
        });
        if l_FFlagAXCatalogSupportDisableFilters_0 then
            v37 = v3.useMemo(function() --[[ Line: 100 ]]
                -- upvalues: v27 (copy), v26 (ref)
                if v27.selectedSubcategoryId and v27.subcategoryTable then
                    return v26.extractSubcategoryById(v27.selectedSubcategoryId, v27.subcategoryTable);
                else
                    return nil;
                end;
            end, {
                v27.selectedSubcategoryId, 
                v27.subcategoryTable
            });
        end;
    else
        v36 = v27.categoryTable[v27.selectedCategoryIndex];
        if l_FFlagAXCatalogSupportDisableFilters_0 then
            v37 = v27.subcategoryTable and v27.subcategoryTable[v27.selectedSubcategoryIndex];
        end;
    end;
    local v38 = v36.Subcategories ~= nil;
    local v39 = nil;
    if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then
        if v28.state.routeName == l_AvatarScreen_0.CatalogSearch then
            v39 = true;
        elseif v19() or v28.state.routeName == l_AvatarScreen_0.Catalog then
            v39 = not v27.showingTopics;
        end;
    else
        v39 = if v19() then not v27.showingTopics else not v27.showingTopics and v28.state.routeName == l_AvatarScreen_0.Catalog;
    end;
    local v40 = l_useLocalization_0({
        selectedCategoryTitle = if l_FFlagAXCatalogCategoriesSDUI_0 and v36.LocalizedTitle then nil else v36.Title
    });
    local v42 = v3.useCallback(function(v41) --[[ Line: 135 ]]
        -- upvalues: v27 (copy)
        if v27.absoluteSizeChanged then
            v27.absoluteSizeChanged(v41.AbsoluteSize);
        end;
    end, {
        v27.absoluteSizeChanged
    });
    if l_FFlagAXCatalogSupportDisableFilters_0 then
        if (v37 or v36).DisableFilters then
            v39 = false;
        end;
    elseif l_FFlagAXRemoveCatalogCategoryNavKey_0 then
        if v36.Id == l_CatalogCategories_0.Avatars:rawValue() then
            v39 = false;
        end;
    elseif v36.NavigationKey == l_CatalogCategories_0.Avatars then
        v39 = false;
    end;
    local l_createElement_0 = v3.createElement;
    local v44 = l_Focusable_0[l_FitFrameVertical_0];
    local v45 = {
        width = UDim.new(1, 0), 
        FillDirection = Enum.FillDirection.Vertical, 
        BackgroundColor3 = if v27.replaceMainNavigationWithCloseableHeader then v34.Color.Surface.Surface_0.Color3 else l_Theme_0.BackgroundContrast.Color, 
        BackgroundTransparency = if v27.replaceMainNavigationWithCloseableHeader then v34.Color.Surface.Surface_0.Transparency else l_Theme_0.BackgroundContrast.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v27.layoutOrderMain, 
        ZIndex = 3, 
        [v3.Change.AbsoluteSize] = v42, 
        ref = v27.navigationFrameRef, 
        defaultChild = v29, 
        restorePreviousChildFocus = true
    };
    local v46 = {};
    local v47;
    if v27.replaceMainNavigationWithCloseableHeader then
        v47 = v3.createElement(l_CloseableHeader_0, {
            Size = UDim2.new(1, 0, 0, v27.navHeightMain), 
            ZIndex = 1, 
            LayoutOrder = v27.layoutOrderMain, 
            text = if l_FFlagAXCatalogCategoriesSDUI_0 and v36.LocalizedTitle then v36.LocalizedTitle else v40.selectedCategoryTitle, 
            onClose = v27.onCloseableHeaderClosed, 
            ref = v29, 
            padding = {
                left = v13.WidgetListHorizontalMargin, 
                right = v13.WidgetListHorizontalMargin
            }, 
            NextSelectionDown = if not v38 and v27.showingTopics then v27.NextSelectionDown else v30, 
            NextSelectionUp = v27.NextSelectionUp
        });
    else
        v47 = v3.createElement;
        local l_v16_0 = v16;
        local v49 = {
            layoutOrder = v27.layoutOrderMain, 
            navHeight = v27.navHeightMain, 
            zIndex = 1, 
            categories = v27.categoryTable, 
            selectedCategoryIndex = v27.selectedCategoryIndex, 
            selectCategory = v27.selectCategory, 
            selectedCategoryId = v27.selectedCategoryId, 
            selectCategoryId = v27.selectCategoryId, 
            shouldUseCategoryId = v27.selectedCategoryId ~= nil or nil
        };
        local v50 = false;
        if v27.selectedSubcategoryId ~= nil then
            v50 = v38;
        end;
        v49.subcategorySelected = v50;
        v49.supportFilterButton = l_FFlagAXMoveCatalogFilterToL1Navigation_0 and true;
        v49.showFilterButton = l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v39;
        v49.ref = v29;
        v49.NextSelectionDown = if not v38 and v27.showingTopics then v27.NextSelectionDown else v30;
        v49.NextSelectionUp = v27.NextSelectionUp;
        v47 = v47(l_v16_0, v49);
    end;
    v46.MainNavigation = v47;
    v46.SubNavigation = if l_FFlagAXCustomizeMakeupSupport_0 and v36.ShowSubcategoriesAsSubnavigation then nil else v3.createElement(v15, {
        height = if not not v38 or not l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v39 then v27.navHeightSub else 0, 
        isContentEmpty = not v38, 
        layoutOrder = v27.layoutOrderSub, 
        showFilterButton = not l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v39, 
        layoutRef = v30, 
        NextSelectionUp = v29, 
        NextSelectionDown = v27.NextSelectionDown
    }, {
        SubNavigation = v3.createElement(v17, {
            layoutOrder = 1, 
            navHeight = v27.navHeightSub, 
            subcategories = v27.subcategoryTable, 
            onSubNavigationPropsDidUpdate = v27.onSubNavigationPropsDidUpdate, 
            selectedCategoryIndex = v27.selectedCategoryIndex, 
            selectedSubcategoryIndex = v27.selectedSubcategoryIndex, 
            selectSubcategory = v27.selectSubcategory, 
            selectedCategoryId = v27.selectedCategoryId, 
            selectedSubcategoryId = v27.selectedSubcategoryId, 
            selectSubcategoryId = v27.selectSubcategoryId, 
            shouldUseCategoryId = v27.selectedCategoryId ~= nil or nil, 
            isHidden = if v18.isEnabled() then not v31 else nil, 
            BackgroundTransparency = v27.replaceMainNavigationWithCloseableHeader and 1 or nil
        })
    });
    v46.NavigationFrameNavEvents = if v18.isEnabled() then v3.createElement(l_NavigationEvents_0, {
        onDidFocus = function() --[[ Line: 265 ]] --[[ Name: onDidFocus ]]
            -- upvalues: v32 (copy)
            v32(true);
        end, 
        onWillBlur = function() --[[ Line: 268 ]] --[[ Name: onWillBlur ]]
            -- upvalues: v32 (copy)
            v32(false);
        end
    }) else nil;
    return l_createElement_0(v44, v45, v46);
end);