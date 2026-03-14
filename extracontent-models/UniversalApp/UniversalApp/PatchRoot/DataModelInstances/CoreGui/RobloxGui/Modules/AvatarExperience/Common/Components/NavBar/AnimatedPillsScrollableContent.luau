local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(l_Modules_0.LuaApp.mutedError);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.MarketplaceCategoryPillWithTooltip);
local l_CategoryPillCloseButton_0 = v7.Components.CategoryPillCloseButton;
local l_AnimatedCategoryPill_0 = v7.Components.AnimatedCategoryPill;
local l_AnimatedSubcategoryPill_0 = v7.Components.AnimatedSubcategoryPill;
local l_useSubcategoryPillAnimation_0 = v7.Hooks.useSubcategoryPillAnimation;
local v14 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v16 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v16.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXCatalogCategoryTooltip_0 = v16.FFlagAXCatalogCategoryTooltip;
local l_FFlagAXMigrateCategoryTooltip_0 = v16.FFlagAXMigrateCategoryTooltip;
local l_FFlagAXCatalogCategoriesSDUI_0 = v16.FFlagAXCatalogCategoriesSDUI;
return function(v21) --[[ Line: 64 ]]
    -- upvalues: v2 (copy), v14 (copy), l_useTokens_0 (copy), l_useSubcategoryPillAnimation_0 (copy), v6 (copy), l_Focusable_0 (copy), l_CategoryPillCloseButton_0 (copy), v9 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), v4 (copy), v8 (copy), l_AnimatedCategoryPill_0 (copy), l_AnimatedSubcategoryPill_0 (copy)
    local l_shouldShowSubcategories_0 = v21.shouldShowSubcategories;
    local v23 = v2.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v14 (ref), v21 (copy)
        return v14.extractCategoryById(v21.selectedCategoryId, v21.categories);
    end, {
        v21.selectedCategoryId, 
        v21.categories
    });
    local v24 = l_useTokens_0();
    local l_Surface_0_0 = v24.Color.Surface.Surface_0;
    local l_navButtonRefs_0 = v21.navButtonRefs;
    local l_categoryButtonRefs_0 = v21.categoryButtonRefs;
    local v28 = v2.useRef(nil);
    local v29 = v2.useRef({});
    local v30 = v2.useRef(0);
    local v31 = l_useSubcategoryPillAnimation_0(v23);
    local l_subcategoriesState_0 = v31.subcategoriesState;
    local l_isFadingOut_0 = v31.isFadingOut;
    local v34 = v2.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v21 (copy), v6 (ref)
        v21.selectCategoryId(v6.DefaultCatalogCategoryId);
    end, {
        v21.selectCategoryId
    });
    local v35 = v2.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v2 (ref), l_Focusable_0 (ref), l_CategoryPillCloseButton_0 (ref), v34 (copy), l_categoryButtonRefs_0 (copy), l_navButtonRefs_0 (copy)
        return v2.createElement(l_Focusable_0[l_CategoryPillCloseButton_0], {
            pillIndex = 1, 
            onActivated = v34, 
            categoryButtonRefs = l_categoryButtonRefs_0, 
            navButtonRefs = l_navButtonRefs_0
        });
    end, {
        v34
    });
    local v43 = v2.useCallback(function(v36, v37, v38) --[[ Line: 99 ]]
        -- upvalues: v21 (copy), v2 (ref), l_Focusable_0 (ref), v9 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v6 (ref), l_categoryButtonRefs_0 (copy), l_navButtonRefs_0 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (ref), l_AvatarScreen_0 (ref), l_FFlagAXMigrateCategoryTooltip_0 (ref), l_FFlagAXCatalogCategoryTooltip_0 (ref)
        local l_isSubcategory_0 = v36.isSubcategory;
        local v40 = (if l_isSubcategory_0 then v21.selectedSubcategoryId else v21.selectedCategoryId) == v36.Id;
        local l_selectCategoryId_0 = v21.selectCategoryId;
        local l_selectSubcategoryId_0 = v21.selectSubcategoryId;
        return v2.createElement(l_Focusable_0[v9], {
            id = v36.Id, 
            title = v36.Title, 
            localizedTitle = if l_FFlagAXCatalogCategoriesSDUI_0 then v36.LocalizedTitle else nil, 
            isChecked = v40, 
            onActivated = function() --[[ Line: 111 ]] --[[ Name: onActivated ]]
                -- upvalues: v36 (copy), v40 (copy), l_selectSubcategoryId_0 (copy), v21 (ref), l_selectCategoryId_0 (copy), v6 (ref)
                if v36.isSubcategory then
                    if v40 then
                        l_selectSubcategoryId_0(v21.selectedCategoryId, nil);
                        return;
                    else
                        l_selectSubcategoryId_0(v21.selectedCategoryId, v36.Id);
                        return;
                    end;
                elseif v40 then
                    l_selectCategoryId_0(v6.DefaultCatalogCategoryId);
                    return;
                else
                    l_selectCategoryId_0(v36.Id);
                    return;
                end;
            end, 
            pillIndex = v37, 
            isSubcategory = l_isSubcategory_0, 
            categoryButtonRefs = l_categoryButtonRefs_0, 
            navButtonRefs = l_navButtonRefs_0, 
            categories = v21.categories, 
            isSelectable = v38, 
            navigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else v36.NavigationKey, 
            navBarHeight = v21.navHeight, 
            avatarScreenOfOrigin = l_AvatarScreen_0.Catalog, 
            categoryTooltipKey = if not not l_FFlagAXMigrateCategoryTooltip_0 or l_FFlagAXCatalogCategoryTooltip_0 then v36.TooltipKey else nil, 
            categoryTooltipLocalizationKey = if l_FFlagAXMigrateCategoryTooltip_0 then v36.TooltipLocalizationKey else nil, 
            categoryLocalizedTooltipBody = if l_FFlagAXCatalogCategoriesSDUI_0 then v36.TooltipBody else nil
        });
    end, {
        v21.selectedCategoryId, 
        v21.selectedSubcategoryId, 
        v21.selectCategoryId, 
        v21.selectSubcategoryId, 
        v21.navHeight
    });
    local l_XSmall_0 = v24.Padding.XSmall;
    return v2.createElement(v4.View, {
        tag = "auto-xy", 
        Size = UDim2.new(0, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = v21.layoutOrder
    }, {
        CloseButtonFrame = v2.createElement(v4.View, {
            tag = "auto-xy radius-circle align-x-center align-y-center", 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            ZIndex = 3, 
            backgroundStyle = l_Surface_0_0, 
            ref = v28, 
            Visible = l_shouldShowSubcategories_0
        }, {
            CloseButton = v35()
        }), 
        CategoriesFrame = v2.createElement(v4.View, {
            tag = "auto-xy", 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            ZIndex = 1
        }, ((function() --[[ Line: 187 ]]
            -- upvalues: v21 (copy), v8 (ref), v28 (copy), l_XSmall_0 (copy), v2 (ref), l_AnimatedCategoryPill_0 (ref), v43 (copy), v29 (copy), v30 (copy)
            local l_categories_0 = v21.categories;
            local v46 = 2;
            local v47 = {};
            local v48 = 0;
            for _, v50 in l_categories_0 do
                if v50.Id == nil then
                    v8("AnimatedPillsScrollableContent: Selected category does not have an ID" .. v50.Name);
                else
                    local v51 = 0;
                    if v28.current and v28.current.AbsoluteSize then
                        v51 = v28.current.AbsoluteSize.X;
                    end;
                    local v52 = false;
                    if v21.selectedCategoryId == v50.Id then
                        v52 = v21.shouldShowSubcategories;
                    end;
                    local l_v48_0 = v48;
                    if v52 then
                        l_v48_0 = v51 + l_XSmall_0;
                    end;
                    v47[v50.Id] = v2.createElement(l_AnimatedCategoryPill_0, {
                        catInfo = v50, 
                        pillIndex = v46, 
                        isSelected = v21.selectedCategoryId == v50.Id, 
                        shouldShowSubcategories = v21.shouldShowSubcategories, 
                        closeButtonWidth = v51, 
                        targetX = l_v48_0, 
                        renderCategoryPill = v43, 
                        onRef = function(v54) --[[ Line: 224 ]] --[[ Name: onRef ]]
                            -- upvalues: v29 (ref), v50 (copy)
                            if v54 then
                                v29.current[v50.Id] = v54;
                            end;
                        end
                    });
                    local v55 = 0;
                    if v29.current[v50.Id] and v29.current[v50.Id].AbsoluteSize then
                        v55 = v29.current[v50.Id].AbsoluteSize.X;
                    end;
                    v48 = v48 + l_XSmall_0 + v55;
                    if v52 then
                        v30.current = l_v48_0 + l_XSmall_0 + v55;
                    end;
                    v46 = v46 + 1;
                end;
            end;
            return v47;
        end)())), 
        SubcategoriesFrame = v2.createElement(v4.View, {
            tag = "auto-xy", 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v30.current, 0.5, 0), 
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_XSmall_0), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }, ((function() --[[ Line: 273 ]]
            -- upvalues: l_subcategoriesState_0 (copy), v8 (ref), v2 (ref), l_AnimatedSubcategoryPill_0 (ref), v43 (copy), l_isFadingOut_0 (copy)
            local v56 = {};
            local l_l_subcategoriesState_0_0 = l_subcategoriesState_0;
            local v58 = 3;
            for _, v60 in l_l_subcategoriesState_0_0 do
                if v60.Id == nil then
                    v8("AnimatedPillsScrollableContent: Selected subcategory does not have an ID" .. v60.Name);
                else
                    v56[v60.Id] = v2.createElement(l_AnimatedSubcategoryPill_0, {
                        subcategory = v60, 
                        pillIndex = v58, 
                        renderCategoryPill = v43, 
                        isFadingOut = l_isFadingOut_0, 
                        isSelectable = not l_isFadingOut_0
                    });
                    v58 = v58 + 1;
                end;
            end;
            return v56;
        end)()))
    });
end;