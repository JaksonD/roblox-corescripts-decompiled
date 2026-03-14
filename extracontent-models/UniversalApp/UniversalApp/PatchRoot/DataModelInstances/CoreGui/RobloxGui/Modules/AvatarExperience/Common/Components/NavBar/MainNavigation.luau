local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local l_FitFrameHorizontal_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal;
local l_useInputType_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useInputType;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v10.Hooks.useTokens;
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient);
local v14 = require(l_Modules_0.LuaApp.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavHighlight);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.DEPRECATED_CategoryButton);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v21 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_getUseSelectorDeepEquals_0 = v21.Utils.getUseSelectorDeepEquals;
local l_findValueKeyInRefCache_0 = v21.Utils.RoactGamepadMigration.findValueKeyInRefCache;
local l_useTableWrappedCallbackRef_0 = v21.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMigrateMainNavigationInputBindings_0 = v25.FFlagAXMigrateMainNavigationInputBindings;
local v27 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v28 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v28.Enums.AvatarScreen;
local v30 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v31 = require(script.Parent.useTabNavigationFocusNavigationBindings);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXEnableEditorCategoryDeepLink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink;
local l_FFlagAXCategoryUnifiedLogging_0 = v25.FFlagAXCategoryUnifiedLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventLogForInstance_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLogForInstance;
local l_AvatarScreenProperties_0 = v28.AvatarRoute.AvatarScreenProperties;
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v25.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXCatalogCategoriesSDUI_0 = v25.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXCatalogCategoryTooltip_0 = v25.FFlagAXCatalogCategoryTooltip;
local l_FFlagAXMigrateCategoryTooltip_0 = v25.FFlagAXMigrateCategoryTooltip;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v25.FFlagAXMoveCatalogFilterToL1Navigation;
local l_FFlagAXReduceCatalogFilterWidth_0 = v25.FFlagAXReduceCatalogFilterWidth;
local v104 = v4.forwardRef(function(v44, v45) --[[ Line: 92 ]]
    -- upvalues: v4 (copy), v5 (copy), l_useTokens_0 (copy), l_useInputType_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useSelector_0 (copy), l_FFlagAXCategoryUnifiedLogging_0 (copy), l_AvatarScreenProperties_0 (copy), l_useFocusGuiObject_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_findValueKeyInRefCache_0 (copy), l_GuiService_0 (copy), v31 (copy), l_useTableWrappedCallbackRef_0 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXEnableEditorCategoryDeepLink_0 (copy), v17 (copy), v27 (copy), v20 (copy), v19 (copy), v18 (copy), l_Focusable_0 (copy), v16 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_sendUnifiedEventLogForInstance_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), l_FFlagAXReduceCatalogFilterWidth_0 (copy), v14 (copy), v10 (copy), l_FitFrameHorizontal_0 (copy), v15 (copy), v30 (copy), v13 (copy)
    local v46, v47 = v4.useState(nil);
    local v48 = v5.useRefCache();
    local v49 = v5.useRefCache();
    local v50 = v4.useRef(nil);
    local v51 = l_useTokens_0();
    local v52 = l_useInputType_0();
    local v53 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.useFocusController();
    local v57 = l_useSelector_0(function(v54) --[[ Line: 103 ]]
        -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (ref), l_AvatarScreenProperties_0 (ref)
        if not l_FFlagAXCategoryUnifiedLogging_0 then
            return nil;
        else
            local v55 = v54.Navigation and v54.Navigation.currentRoute;
            local v56 = v55 and l_AvatarScreenProperties_0[v55.routeName];
            if v56 and v56.analyticsData then
                return v56.analyticsData.unifiedLoggingSurface;
            else
                return nil;
            end;
        end;
    end);
    local v58 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local l_v50_0 = v50;
    if l_FFlagAXMigrateMainNavigationInputBindings_0 then
        local v62 = v4.useCallback(function(v60) --[[ Line: 118 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v48 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v58 (copy), v53 (copy)
            v60.cancelled = true;
            local v61 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v48);
            if v61 and v61 > 1 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v58 then
                        v58(v48[v61 - 1].current);
                        return;
                    end;
                else
                    v53.moveFocusLeft();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v58 else v53
        });
        local v65 = v4.useCallback(function(v63) --[[ Line: 132 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v48 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v58 (copy), v53 (copy)
            v63.cancelled = true;
            local v64 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v48);
            if v64 and v64 < #v48 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v58 then
                        v58(v48[v64 + 1].current);
                        return;
                    end;
                else
                    v53.moveFocusRight();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v58 else v53
        });
        local v67 = v4.useCallback(function(v66) --[[ Line: 146 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v58 (copy), v44 (copy), v53 (copy)
            v66.cancelled = true;
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v58 and v44.NextSelectionUp and v44.NextSelectionUp.current then
                    v58(v44.NextSelectionUp.current);
                    return;
                end;
            else
                v53.moveFocusUp();
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v58 else v53, 
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v44.NextSelectionUp else nil
        });
        local v68 = v31({
            onTabBackward = v62, 
            onTabForward = v65, 
            onNavigateBack = v67
        }, v50);
        l_v50_0 = l_useTableWrappedCallbackRef_0(v68);
    end;
    local v70 = l_useSelector_0(function(v69) --[[ Line: 169 ]]
        return v69.AvatarExperience.AvatarEditor.NewItemNotifications;
    end, l_getUseSelectorDeepEquals_0());
    local v78 = v4.useCallback(function(v71, v72) --[[ Line: 173 ]]
        -- upvalues: v50 (copy)
        local l_current_0 = v50.current;
        local v74 = (v71 or 0) - 50;
        if l_current_0 then
            local l_X_0 = l_current_0.AbsoluteWindowSize.X;
            if not l_X_0 or l_X_0 == 0 then
                return;
            else
                local v76 = false;
                if v71 + v72 > 0 then
                    v76 = v71 + v72 < l_X_0;
                end;
                local v77 = false;
                if v71 > 0 then
                    v77 = v71 < l_X_0;
                end;
                if not v77 and not v76 then
                    l_current_0.CanvasPosition = Vector2.new(v74, l_current_0.CanvasPosition.Y);
                end;
            end;
        end;
    end, {});
    local v80 = v4.useCallback(function() --[[ Line: 197 ]]
        -- upvalues: v44 (copy), v49 (copy), v78 (copy), v47 (copy)
        local v79 = nil;
        v79 = if v44.shouldUseCategoryId then if v44.selectedCategoryId then v49[v44.selectedCategoryId].current else nil else if v44.selectedCategoryIndex then v49[v44.selectedCategoryIndex].current else nil;
        if v79 == nil then
            return false;
        else
            v78(v79.AbsolutePosition.X, v79.AbsoluteSize.X);
            v47(v79);
            return true;
        end;
    end, {
        v44.selectedCategoryIndex, 
        v44.selectedCategoryId
    });
    if not l_FFlagAXEnableEditorCategoryDeepLink_0 then
        v4.useEffect(function() --[[ Line: 219 ]]
            -- upvalues: v80 (copy), v50 (copy)
            v80();
            if v50.current then
                v50.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Once(function() --[[ Line: 222 ]]
                    -- upvalues: v80 (ref)
                    v80();
                end);
            end;
        end, {});
    end;
    v4.useEffect(function() --[[ Line: 229 ]]
        -- upvalues: v80 (copy)
        v80();
    end, {
        v80
    });
    local v88 = v4.useCallback(function(v81) --[[ Line: 233 ]]
        -- upvalues: v44 (copy), v17 (ref), v27 (ref), v20 (ref), v70 (copy), v19 (ref), v18 (ref)
        if v44.categories ~= v17() then
            return false;
        else
            local v82 = v44.categories[v81];
            if v27() then
                return v20.shouldNotifyCategory(v82, v70);
            elseif v82.Name == v19.CharacterKey or v82.Name == "Body" then
                return v70[v18.NewOutfitNotificationKey];
            elseif v82.Name == v19.HeadAndBody and v70[v18.NewDHOutfitNotificationKey] then
                return true;
            else
                local l_Subcategories_0 = v82.Subcategories;
                if l_Subcategories_0 then
                    for _, v85 in l_Subcategories_0 do
                        local l_AssetTypeIdStrings_0 = v85.AssetTypeIdStrings;
                        if l_AssetTypeIdStrings_0 and v20.shouldNotifyAssetTypes(l_AssetTypeIdStrings_0, v70) then
                            return true;
                        end;
                    end;
                else
                    local l_AssetTypeIdStrings_1 = v82.AssetTypeIdStrings;
                    if l_AssetTypeIdStrings_1 and v20.shouldNotifyAssetTypes(l_AssetTypeIdStrings_1, v70) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
    end, {
        v44.categories, 
        v70
    });
    local v93 = v4.useCallback(function(v89, v90) --[[ Line: 278 ]]
        -- upvalues: v44 (copy), v4 (ref), l_Focusable_0 (ref), v16 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v88 (copy), v49 (copy), l_FFlagAXCategoryUnifiedLogging_0 (ref), v48 (copy), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), v57 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v53 (copy), v5 (ref), l_FFlagAXRemoveCatalogCategoryNavKey_0 (ref), l_AvatarScreen_0 (ref), l_FFlagAXMigrateCategoryTooltip_0 (ref), l_FFlagAXCatalogCategoryTooltip_0 (ref)
        local v91 = false;
        v91 = if v44.shouldUseCategoryId then v44.selectedCategoryId == v90.Id else v44.selectedCategoryIndex == v89;
        return v4.createElement(l_Focusable_0[v16], {
            categoryIndex = v89, 
            categoryId = v90.Id, 
            categoryTitle = v90.Title, 
            localizedCategoryTitle = if l_FFlagAXCatalogCategoriesSDUI_0 then v90.LocalizedTitle else nil, 
            layoutOrder = v89, 
            isSelected = v91, 
            hasNewItemNotification = v88(v89), 
            frameRef = v49[if v44.shouldUseCategoryId then v90.Id else v89], 
            onActivate = function() --[[ Line: 295 ]] --[[ Name: onActivate ]]
                -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (ref), v48 (ref), v89 (copy), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), v90 (copy), v57 (ref), v44 (ref)
                if l_FFlagAXCategoryUnifiedLogging_0 then
                    local v92 = v48[v89];
                    if v92 and v92.current then
                        l_sendUnifiedEventLogForInstance_0(v92.current, {
                            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                            elementName = "SELECT_CATEGORY_" .. string.upper(v90.Name), 
                            surface = v57
                        });
                    end;
                end;
                if v44.shouldUseCategoryId and v44.selectCategoryId then
                    v44.selectCategoryId(v90.Id);
                    return;
                else
                    v44.selectCategory(v89);
                    return;
                end;
            end, 
            ref = v48[v89], 
            NextSelectionLeft = if v89 > 1 then v48[v89 - 1] else nil, 
            NextSelectionRight = if v89 < #v44.categories then v48[v89 + 1] else nil, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else if v53 ~= nil then {
                ShiftLeft = v5.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 321 ]]
                    -- upvalues: v89 (copy), v53 (ref)
                    if v89 > 1 then
                        v53.moveFocusLeft();
                    end;
                end), 
                ShiftRight = v5.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 326 ]]
                    -- upvalues: v89 (copy), v44 (ref), v53 (ref)
                    if v89 < #v44.categories then
                        v53.moveFocusRight();
                    end;
                end)
            } else nil, 
            navigationKey = if not l_FFlagAXRemoveCatalogCategoryNavKey_0 then v90.NavigationKey else nil, 
            navBarHeight = v44.navHeight, 
            avatarScreenOfOrigin = l_AvatarScreen_0.Catalog, 
            categoryTooltipKey = if not not l_FFlagAXMigrateCategoryTooltip_0 or l_FFlagAXCatalogCategoryTooltip_0 then v90.TooltipKey else nil, 
            categoryTooltipLocalizationKey = if l_FFlagAXMigrateCategoryTooltip_0 then v90.TooltipLocalizationKey else nil, 
            categoryLocalizedTooltipBody = if l_FFlagAXCatalogCategoriesSDUI_0 then v90.TooltipBody else nil
        });
    end, {
        v44.selectedCategoryIndex, 
        v44.selectedCategoryId, 
        v88, 
        v44.selectCategory, 
        v44.selectCategoryId, 
        v44.shouldUseCategoryId, 
        v44.categories, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v53
    });
    local v95 = v4.useCallback(function(v94) --[[ Line: 357 ]]
        -- upvalues: v50 (copy)
        if v50.current then
            v50.current.CanvasSize = UDim2.new(0, v94.AbsoluteSize.X, 1, 0);
        end;
    end, {});
    local v96 = nil;
    local v97 = nil;
    if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then
        v96 = if l_FFlagAXReduceCatalogFilterWidth_0 then v51.Size.Size_1200 else v51.Size.Size_1400;
        v97 = v51.Size.Size_600;
    end;
    local v102 = v4.useCallback(function() --[[ Line: 374 ]]
        -- upvalues: v52 (copy), v14 (ref), v44 (copy), v93 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (ref), v4 (ref), v10 (ref), v96 (ref), v97 (ref), v49 (copy), l_Focusable_0 (ref), l_FitFrameHorizontal_0 (ref), v95 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v5 (ref), v53 (copy), v15 (ref), v50 (copy), v46 (copy)
        local v98 = not (v52 == v14.InputType.Gamepad) or v44.subcategorySelected;
        local v99 = {};
        for v100, v101 in v44.categories do
            v99[v101.Name] = v93(v100, v101);
        end;
        if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v44.supportFilterButton and v44.showFilterButton then
            v99.RightPadding = v4.createElement(v10.View, {
                tag = "auto-xy", 
                Size = UDim2.new(0, v96 + v97, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = #v44.categories + 1, 
                ref = v49.RightPadding
            });
        end;
        return {
            NavFrame = v4.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
                height = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                [v4.Change.AbsoluteSize] = v95, 
                inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else {
                    ToTopBar = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 402 ]]
                        -- upvalues: v53 (ref)
                        v53.moveFocusUp();
                    end)
                }
            }, v99), 
            Highlight = v98 and v4.createElement(v15, {
                scrollingFrameRef = v50, 
                useArrowHighlight = v44.subcategorySelected, 
                selectedCategoryButtonInstance = v46
            })
        };
    end, {
        v52, 
        v44.subcategorySelected, 
        v93, 
        v95, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v53, 
        v46, 
        v44.categories, 
        v44.supportFilterButton, 
        v44.showFilterButton, 
        l_FFlagAXMoveCatalogFilterToL1Navigation_0
    });
    local l_selectedCategoryIndex_0 = v44.selectedCategoryIndex;
    if v44.shouldUseCategoryId then
        l_selectedCategoryIndex_0 = v30.findCategoryIndexById(v44.categories, v44.selectedCategoryId);
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        ClipsDescendants = true, 
        BackgroundColor3 = v51.Color.Surface.Surface_0.Color3, 
        BackgroundTransparency = v51.Color.Surface.Surface_0.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v44.layoutOrder, 
        Size = UDim2.new(1, 0, 0, v44.navHeight), 
        ZIndex = v44.zIndex, 
        ref = v45, 
        NextSelectionUp = v44.NextSelectionUp, 
        NextSelectionDown = v44.NextSelectionDown, 
        defaultChild = v48[l_selectedCategoryIndex_0]
    }, {
        ScrollingListWithArrowsAndGradient = v4.createElement(v13, {
            getScollingListContent = v102, 
            listHeight = v44.navHeight, 
            scrollingFrameRef = l_v50_0, 
            buttonRefs = v49, 
            buttonPadding = 0, 
            onSizeChanged = if l_FFlagAXEnableEditorCategoryDeepLink_0 then v80 else nil, 
            backgroundColor = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v51.Color.Surface.Surface_0.Color3 else nil, 
            supportFilterButton = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v44.supportFilterButton else nil, 
            hideFilterButton = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then not v44.showFilterButton else nil, 
            filterButtonWidth = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v96 else nil, 
            filterButtonGradientWidth = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v97 else nil
        })
    });
end);
return v4.memo(v104);