local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local l_FitFrameHorizontal_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal;
local v8 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v8.Hooks.useTokens;
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v13.Enums.CatalogCategories;
local l_findValueKeyInRefCache_0 = v13.Utils.RoactGamepadMigration.findValueKeyInRefCache;
local l_useTableWrappedCallbackRef_0 = v13.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v17 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMigrateMainNavigationInputBindings_0 = v17.FFlagAXMigrateMainNavigationInputBindings;
local l_FFlagAXCategoryPillPositionAnimation_0 = v17.FFlagAXCategoryPillPositionAnimation;
local v20 = require(l_Modules_0.LuaApp.mutedError);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.MarketplaceCategoryPillWithTooltip);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.AnimatedPillsScrollableContent);
local l_CategoryPillCloseButton_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.CategoryPillCloseButton;
local v24 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v25 = require(script.Parent.useTabNavigationFocusNavigationBindings);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_FFlagAXCatalogCategoryTooltip_0 = v17.FFlagAXCatalogCategoryTooltip;
local l_FFlagAXMigrateCategoryTooltip_0 = v17.FFlagAXMigrateCategoryTooltip;
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v17.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXCatalogSupportDisableFilters_0 = v17.FFlagAXCatalogSupportDisableFilters;
local l_FFlagAXCatalogCategoriesSDUI_0 = v17.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXScrollingListAutomaticCanvasSize_0 = v17.FFlagAXScrollingListAutomaticCanvasSize;
local l_FFlagAXReduceCatalogFilterWidth_0 = v17.FFlagAXReduceCatalogFilterWidth;
local v98 = v4.forwardRef(function(v34, v35) --[[ Line: 82 ]]
    -- upvalues: v4 (copy), v5 (copy), l_useTokens_0 (copy), l_FFlagAXReduceCatalogFilterWidth_0 (copy), l_useFocusGuiObject_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_findValueKeyInRefCache_0 (copy), l_GuiService_0 (copy), v25 (copy), l_useTableWrappedCallbackRef_0 (copy), l_FFlagAXCategoryPillPositionAnimation_0 (copy), l_Focusable_0 (copy), v21 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v12 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), l_CategoryPillCloseButton_0 (copy), v24 (copy), v8 (copy), v20 (copy), l_FitFrameHorizontal_0 (copy), v22 (copy), l_FFlagAXCatalogSupportDisableFilters_0 (copy), l_CatalogCategories_0 (copy), v11 (copy), l_FFlagAXScrollingListAutomaticCanvasSize_0 (copy)
    local v36, v37 = v4.useState(0);
    local v38 = v5.useRefCache();
    local v39 = v5.useRefCache();
    local v40 = v4.useRef(nil);
    local v41 = l_useTokens_0();
    local v42 = if l_FFlagAXReduceCatalogFilterWidth_0 then v41.Size.Size_1200 else v41.Size.Size_1400;
    local l_Size_600_0 = v41.Size.Size_600;
    local v44 = l_useFocusGuiObject_0();
    local l_v40_0 = v40;
    if l_FFlagAXMigrateMainNavigationInputBindings_0 then
        local v48 = v4.useCallback(function(v46) --[[ Line: 97 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v38 (copy), v44 (copy)
            v46.cancelled = true;
            local v47 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v38);
            if v47 and v47 > 1 and v44 then
                v44(v38[v47 - 1].current);
            end;
        end, {
            v44
        });
        local v51 = v4.useCallback(function(v49) --[[ Line: 107 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v38 (copy), v44 (copy)
            v49.cancelled = true;
            local v50 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v38);
            if v50 and v50 < #v38 and v44 then
                v44(v38[v50 + 1].current);
            end;
        end, {
            v44
        });
        local v53 = v4.useCallback(function(v52) --[[ Line: 118 ]]
            -- upvalues: v44 (copy), v34 (copy)
            v52.cancelled = true;
            if v44 and v34.NextSelectionUp and v34.NextSelectionUp.current then
                v44(v34.NextSelectionUp.current);
            end;
        end, {
            v44, 
            v34.NextSelectionUp
        });
        local v54 = v25({
            onTabBackward = v48, 
            onTabForward = v51, 
            onNavigateBack = v53
        }, v40);
        l_v40_0 = l_useTableWrappedCallbackRef_0(v54);
    end;
    if not l_FFlagAXCategoryPillPositionAnimation_0 then
        local v62 = v4.useCallback(function(v55, v56) --[[ Line: 140 ]]
            -- upvalues: v40 (copy)
            local l_current_0 = v40.current;
            local v58 = (v55 or 0) - 50;
            if l_current_0 then
                local l_X_0 = l_current_0.AbsoluteWindowSize.X;
                if not l_X_0 or l_X_0 == 0 then
                    return;
                else
                    local v60 = false;
                    if v55 + v56 > 0 then
                        v60 = v55 + v56 < l_X_0;
                    end;
                    local v61 = false;
                    if v55 > 0 then
                        v61 = v55 < l_X_0;
                    end;
                    if not v61 and not v60 then
                        l_current_0.CanvasPosition = Vector2.new(v58, l_current_0.CanvasPosition.Y);
                    end;
                end;
            end;
        end, {});
        local l_v62_0 = v62 --[[ copy: 12 -> 20 ]];
        local v65 = v4.useCallback(function() --[[ Line: 164 ]]
            -- upvalues: v34 (copy), v39 (copy), l_v62_0 (copy)
            local v64 = if v34.selectedCategoryId then v39[v34.selectedCategoryId].current else nil;
            if v64 == nil then
                return false;
            else
                l_v62_0(v64.AbsolutePosition.X, v64.AbsoluteSize.X);
                return true;
            end;
        end, {
            v34.selectedCategoryId
        });
        local l_v65_0 = v65 --[[ copy: 13 -> 21 ]];
        v4.useEffect(function() --[[ Line: 179 ]]
            -- upvalues: l_v65_0 (copy), v40 (copy)
            l_v65_0();
            if v40.current then
                v40.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Once(function() --[[ Line: 182 ]]
                    -- upvalues: l_v65_0 (ref)
                    l_v65_0();
                end);
            end;
        end, {});
        v4.useEffect(function() --[[ Line: 188 ]]
            -- upvalues: l_v65_0 (copy)
            l_v65_0();
        end, {
            v65
        });
    else
        v4.useEffect(function() --[[ Line: 192 ]]
            -- upvalues: v40 (copy)
            local l_current_1 = v40.current;
            if l_current_1 then
                l_current_1.CanvasPosition = Vector2.new(0, l_current_1.CanvasPosition.Y);
            end;
        end, {
            v34.selectedCategoryId
        });
    end;
    local v75 = v4.useCallback(function(v68, v69, v70) --[[ Line: 201 ]]
        -- upvalues: v34 (copy), v4 (ref), l_Focusable_0 (ref), v21 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v12 (ref), v40 (copy), v39 (copy), v38 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (ref), l_AvatarScreen_0 (ref), l_FFlagAXMigrateCategoryTooltip_0 (ref), l_FFlagAXCatalogCategoryTooltip_0 (ref)
        local l_isSubcategory_0 = v68.isSubcategory;
        local v72 = (if l_isSubcategory_0 then v34.selectedSubcategoryId else v34.selectedCategoryId) == v68.Id;
        local l_selectCategoryId_0 = v34.selectCategoryId;
        local l_selectSubcategoryId_0 = v34.selectSubcategoryId;
        return v4.createElement(l_Focusable_0[v21], {
            id = v68.Id, 
            title = v68.Title, 
            localizedTitle = if l_FFlagAXCatalogCategoriesSDUI_0 then v68.LocalizedTitle else nil, 
            isChecked = v72, 
            onActivated = function() --[[ Line: 214 ]] --[[ Name: onActivated ]]
                -- upvalues: v68 (copy), v72 (copy), l_selectSubcategoryId_0 (copy), v34 (ref), l_selectCategoryId_0 (copy), v12 (ref), v40 (ref)
                if v68.isSubcategory then
                    if v72 then
                        l_selectSubcategoryId_0(v34.selectedCategoryId, nil);
                        return;
                    else
                        l_selectSubcategoryId_0(v34.selectedCategoryId, v68.Id);
                        return;
                    end;
                else
                    if v72 then
                        l_selectCategoryId_0(v12.DefaultCatalogCategoryId);
                    else
                        l_selectCategoryId_0(v68.Id);
                    end;
                    if v40.current then
                        v40.current.CanvasPosition = Vector2.new(0, v40.current.CanvasPosition.Y);
                    end;
                    return;
                end;
            end, 
            layoutOrder = v69, 
            pillIndex = v70, 
            isSubcategory = l_isSubcategory_0, 
            categoryButtonRefs = v39, 
            navButtonRefs = v38, 
            categories = v34.categories, 
            navigationKey = if not l_FFlagAXRemoveCatalogCategoryNavKey_0 then v68.NavigationKey else nil, 
            navBarHeight = v34.navHeight, 
            avatarScreenOfOrigin = l_AvatarScreen_0.Catalog, 
            categoryTooltipKey = if not not l_FFlagAXMigrateCategoryTooltip_0 or l_FFlagAXCatalogCategoryTooltip_0 then v68.TooltipKey else nil, 
            categoryTooltipLocalizationKey = if l_FFlagAXMigrateCategoryTooltip_0 then v68.TooltipLocalizationKey else nil, 
            categoryLocalizedTooltipBody = if l_FFlagAXCatalogCategoriesSDUI_0 then v68.TooltipBody else nil
        });
    end, {
        v34.selectedCategoryId, 
        v34.selectedSubcategoryId, 
        v34.selectCategoryId, 
        v34.selectSubcategoryId
    });
    local v79 = v4.useCallback(function(v76, v77) --[[ Line: 261 ]]
        -- upvalues: v34 (copy), v4 (ref), l_Focusable_0 (ref), l_CategoryPillCloseButton_0 (ref), v12 (ref), v39 (copy), v38 (copy)
        local l_selectCategoryId_1 = v34.selectCategoryId;
        return v4.createElement(l_Focusable_0[l_CategoryPillCloseButton_0], {
            layoutOrder = v76, 
            pillIndex = v77, 
            onActivated = function() --[[ Line: 267 ]] --[[ Name: onActivated ]]
                -- upvalues: l_selectCategoryId_1 (copy), v12 (ref)
                l_selectCategoryId_1(v12.DefaultCatalogCategoryId);
            end, 
            categoryButtonRefs = v39, 
            navButtonRefs = v38
        });
    end, {
        v34.selectCategoryId
    });
    local v82 = v4.useCallback(function(v80) --[[ Line: 275 ]]
        -- upvalues: v37 (copy), v40 (copy)
        local v81 = v80.AbsoluteSize.X or 0;
        v37(v81);
        if v40.current then
            v40.current.CanvasSize = UDim2.new(0, v81, 1, 0);
        end;
    end, {});
    local v92 = v4.useCallback(function() --[[ Line: 284 ]]
        -- upvalues: v34 (copy), v24 (ref), v4 (ref), v8 (ref), v41 (copy), v39 (copy), v79 (copy), v20 (ref), v75 (copy), v42 (copy), l_Size_600_0 (copy), l_Focusable_0 (ref), l_FitFrameHorizontal_0 (ref), v82 (copy)
        local l_categories_0 = v34.categories;
        local v84 = {};
        local v85 = v24.extractCategoryById(v34.selectedCategoryId, l_categories_0);
        if v85 then
            local v86 = 1;
            local v87 = 1;
            v84.LeftPadding = v4.createElement(v8.View, {
                tag = "auto-xy", 
                Size = UDim2.new(0, v41.Padding.Small, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v87, 
                ref = v39.LeftPadding
            });
            v87 = v87 + 1;
            if v85.Subcategories then
                v84.CloseButton = v79(v87, v86);
                v86 = v86 + 1;
                v87 = v87 + 1;
                if v85.Id == nil then
                    v20("Selected category does not have an ID" .. v85.Name);
                else
                    v84[v85.Id] = v75(v85, v87, v86);
                end;
                v86 = v86 + 1;
                v87 = v87 + 1;
                for _, v89 in v85.Subcategories do
                    if v89.Id == nil then
                        v20("Selected subcategory does not have an ID" .. v89.Name);
                    else
                        v84[v89.Id] = v75(v89, v87, v86);
                    end;
                    v86 = v86 + 1;
                    v87 = v87 + 1;
                end;
            else
                for _, v91 in l_categories_0 do
                    if v91.Id == nil then
                        v20("Selected category does not have an ID" .. v91.Name);
                    else
                        v84[v91.Id] = v75(v91, v87, v86);
                    end;
                    v86 = v86 + 1;
                    v87 = v87 + 1;
                end;
            end;
            v84.RightPadding = v4.createElement(v8.View, {
                tag = "auto-xy", 
                Size = UDim2.new(0, v42 + l_Size_600_0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v87, 
                ref = v39.RightPadding
            });
        else
            v20("Selected category does not exist in categories list" .. v34.selectedCategoryId);
        end;
        return {
            NavFrame = v4.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
                height = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                [v4.Change.AbsoluteSize] = v82, 
                contentPadding = UDim.new(0, 6)
            }, v84)
        };
    end, {
        v34.subcategorySelected, 
        v82, 
        v34.categories, 
        v75, 
        v79
    });
    local v94 = v4.useCallback(function() --[[ Line: 378 ]]
        -- upvalues: v4 (ref), v8 (ref), v41 (copy), v39 (copy), v22 (ref), v34 (copy), v38 (copy), v40 (copy), v42 (copy), l_Size_600_0 (copy), l_Focusable_0 (ref), l_FitFrameHorizontal_0 (ref), v82 (copy)
        local v93 = {
            LeftPadding = v4.createElement(v8.View, {
                tag = "auto-xy", 
                Size = UDim2.new(0, v41.Padding.Small, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                ref = v39.LeftPadding
            }), 
            MainContents = v4.createElement(v22, {
                navHeight = v34.navHeight, 
                categories = v34.categories, 
                selectedCategoryId = v34.selectedCategoryId, 
                selectCategoryId = v34.selectCategoryId, 
                selectedSubcategoryId = v34.selectedSubcategoryId, 
                selectSubcategoryId = v34.selectSubcategoryId, 
                shouldShowSubcategories = v34.shouldShowSubcategories or not not v34.shouldShowSubcategories, 
                layoutOrder = 2, 
                navButtonRefs = v38, 
                scrollingFrameRef = v40, 
                categoryButtonRefs = v39
            }), 
            RightPadding = v4.createElement(v8.View, {
                tag = "auto-xy", 
                Size = UDim2.new(0, v42 + l_Size_600_0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                ref = v39.RightPadding
            })
        };
        return {
            NavFrame = v4.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
                height = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                [v4.Change.AbsoluteSize] = v82, 
                contentPadding = UDim.new(0, 6)
            }, v93)
        };
    end, {
        v82, 
        v34.navHeight, 
        v34.categories, 
        v34.selectedCategoryId, 
        v34.selectCategoryId, 
        v34.selectedSubcategoryId, 
        v34.selectSubcategoryId, 
        v34.shouldShowSubcategories
    });
    local v95 = v24.findCategoryIndexById(v34.categories, v34.selectedCategoryId);
    local l_Color3_0 = v41.Color.Surface.Surface_0.Color3;
    if l_FFlagAXCategoryPillPositionAnimation_0 then
        l_Color3_0 = v41.Color.Surface.Surface_0;
    end;
    local v97 = nil;
    v97 = if not l_FFlagAXCatalogSupportDisableFilters_0 then v34.selectedCategoryId == l_CatalogCategories_0.Avatars:rawValue() else v34.hideFilterButton or false;
    return v4.createElement(l_Focusable_0.Frame, {
        ClipsDescendants = true, 
        BackgroundColor3 = if l_FFlagAXCategoryPillPositionAnimation_0 then l_Color3_0.Color3 else l_Color3_0, 
        BackgroundTransparency = if l_FFlagAXCategoryPillPositionAnimation_0 then l_Color3_0.Transparency else v41.Color.Surface.Surface_0.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v34.layoutOrder, 
        Size = UDim2.new(1, 0, 0, v34.navHeight), 
        ZIndex = v34.zIndex, 
        ref = v35, 
        NextSelectionUp = v34.NextSelectionUp, 
        NextSelectionDown = v34.NextSelectionDown, 
        defaultChild = v38[v95]
    }, {
        ScrollingListWithArrowsAndGradient = v4.createElement(v11, {
            getScollingListContent = if l_FFlagAXCategoryPillPositionAnimation_0 then v94 else v92, 
            listHeight = v34.navHeight, 
            scrollingFrameRef = l_v40_0, 
            buttonRefs = v39, 
            buttonPadding = 0, 
            backgroundColor = if l_FFlagAXCategoryPillPositionAnimation_0 then l_Color3_0.Color3 else l_Color3_0, 
            tokens = if l_FFlagAXScrollingListAutomaticCanvasSize_0 then nil else v41, 
            supportFilterButton = true, 
            canvasWidth = if l_FFlagAXScrollingListAutomaticCanvasSize_0 then nil else v36, 
            hideFilterButton = v97, 
            filterButtonWidth = v42, 
            filterButtonGradientWidth = l_Size_600_0
        })
    });
end);
return v4.memo(v98);