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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v31 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v32 = require(script.Parent.useTabNavigationFocusNavigationBindings);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXEnableEditorCategoryDeepLink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
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
local v106 = v4.forwardRef(function(v46, v47) --[[ Line: 94 ]]
    -- upvalues: v4 (copy), v5 (copy), l_useTokens_0 (copy), l_useInputType_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useSelector_0 (copy), l_FFlagAXCategoryUnifiedLogging_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AvatarScreenProperties_0 (copy), l_useFocusGuiObject_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_findValueKeyInRefCache_0 (copy), l_GuiService_0 (copy), v32 (copy), l_useTableWrappedCallbackRef_0 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXEnableEditorCategoryDeepLink_0 (copy), v17 (copy), v27 (copy), v20 (copy), v19 (copy), v18 (copy), l_Focusable_0 (copy), v16 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_sendUnifiedEventLogForInstance_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), l_FFlagAXReduceCatalogFilterWidth_0 (copy), v14 (copy), v10 (copy), l_FitFrameHorizontal_0 (copy), v15 (copy), v31 (copy), v13 (copy)
    local v48, v49 = v4.useState(nil);
    local v50 = v5.useRefCache();
    local v51 = v5.useRefCache();
    local v52 = v4.useRef(nil);
    local v53 = l_useTokens_0();
    local v54 = l_useInputType_0();
    local v55 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.useFocusController();
    local v59 = l_useSelector_0(function(v56) --[[ Line: 105 ]]
        -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AvatarScreenProperties_0 (ref)
        if not l_FFlagAXCategoryUnifiedLogging_0 then
            return nil;
        else
            local v57 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentRoactNavigationRoute(v56) else v56.Navigation and v56.Navigation.currentRoute;
            local v58 = v57 and l_AvatarScreenProperties_0[v57.routeName];
            if v58 and v58.analyticsData then
                return v58.analyticsData.unifiedLoggingSurface;
            else
                return nil;
            end;
        end;
    end);
    local v60 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local l_v52_0 = v52;
    if l_FFlagAXMigrateMainNavigationInputBindings_0 then
        local v64 = v4.useCallback(function(v62) --[[ Line: 122 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v50 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v60 (copy), v55 (copy)
            v62.cancelled = true;
            local v63 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v50);
            if v63 and v63 > 1 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v60 then
                        v60(v50[v63 - 1].current);
                        return;
                    end;
                else
                    v55.moveFocusLeft();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v60 else v55
        });
        local v67 = v4.useCallback(function(v65) --[[ Line: 136 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v50 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v60 (copy), v55 (copy)
            v65.cancelled = true;
            local v66 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v50);
            if v66 and v66 < #v50 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v60 then
                        v60(v50[v66 + 1].current);
                        return;
                    end;
                else
                    v55.moveFocusRight();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v60 else v55
        });
        local v69 = v4.useCallback(function(v68) --[[ Line: 150 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v60 (copy), v46 (copy), v55 (copy)
            v68.cancelled = true;
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v60 and v46.NextSelectionUp and v46.NextSelectionUp.current then
                    v60(v46.NextSelectionUp.current);
                    return;
                end;
            else
                v55.moveFocusUp();
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v60 else v55, 
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v46.NextSelectionUp else nil
        });
        local v70 = v32({
            onTabBackward = v64, 
            onTabForward = v67, 
            onNavigateBack = v69
        }, v52);
        l_v52_0 = l_useTableWrappedCallbackRef_0(v70);
    end;
    local v72 = l_useSelector_0(function(v71) --[[ Line: 173 ]]
        return v71.AvatarExperience.AvatarEditor.NewItemNotifications;
    end, l_getUseSelectorDeepEquals_0());
    local v80 = v4.useCallback(function(v73, v74) --[[ Line: 177 ]]
        -- upvalues: v52 (copy)
        local l_current_0 = v52.current;
        local v76 = (v73 or 0) - 50;
        if l_current_0 then
            local l_X_0 = l_current_0.AbsoluteWindowSize.X;
            if not l_X_0 or l_X_0 == 0 then
                return;
            else
                local v78 = false;
                if v73 + v74 > 0 then
                    v78 = v73 + v74 < l_X_0;
                end;
                local v79 = false;
                if v73 > 0 then
                    v79 = v73 < l_X_0;
                end;
                if not v79 and not v78 then
                    l_current_0.CanvasPosition = Vector2.new(v76, l_current_0.CanvasPosition.Y);
                end;
            end;
        end;
    end, {});
    local v82 = v4.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v46 (copy), v51 (copy), v80 (copy), v49 (copy)
        local v81 = nil;
        v81 = if v46.shouldUseCategoryId then if v46.selectedCategoryId then v51[v46.selectedCategoryId].current else nil else if v46.selectedCategoryIndex then v51[v46.selectedCategoryIndex].current else nil;
        if v81 == nil then
            return false;
        else
            v80(v81.AbsolutePosition.X, v81.AbsoluteSize.X);
            v49(v81);
            return true;
        end;
    end, {
        v46.selectedCategoryIndex, 
        v46.selectedCategoryId
    });
    if not l_FFlagAXEnableEditorCategoryDeepLink_0 then
        v4.useEffect(function() --[[ Line: 223 ]]
            -- upvalues: v82 (copy), v52 (copy)
            v82();
            if v52.current then
                v52.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Once(function() --[[ Line: 226 ]]
                    -- upvalues: v82 (ref)
                    v82();
                end);
            end;
        end, {});
    end;
    v4.useEffect(function() --[[ Line: 233 ]]
        -- upvalues: v82 (copy)
        v82();
    end, {
        v82
    });
    local v90 = v4.useCallback(function(v83) --[[ Line: 237 ]]
        -- upvalues: v46 (copy), v17 (ref), v27 (ref), v20 (ref), v72 (copy), v19 (ref), v18 (ref)
        if v46.categories ~= v17() then
            return false;
        else
            local v84 = v46.categories[v83];
            if v27() then
                return v20.shouldNotifyCategory(v84, v72);
            elseif v84.Name == v19.CharacterKey or v84.Name == "Body" then
                return v72[v18.NewOutfitNotificationKey];
            elseif v84.Name == v19.HeadAndBody and v72[v18.NewDHOutfitNotificationKey] then
                return true;
            else
                local l_Subcategories_0 = v84.Subcategories;
                if l_Subcategories_0 then
                    for _, v87 in l_Subcategories_0 do
                        local l_AssetTypeIdStrings_0 = v87.AssetTypeIdStrings;
                        if l_AssetTypeIdStrings_0 and v20.shouldNotifyAssetTypes(l_AssetTypeIdStrings_0, v72) then
                            return true;
                        end;
                    end;
                else
                    local l_AssetTypeIdStrings_1 = v84.AssetTypeIdStrings;
                    if l_AssetTypeIdStrings_1 and v20.shouldNotifyAssetTypes(l_AssetTypeIdStrings_1, v72) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
    end, {
        v46.categories, 
        v72
    });
    local v95 = v4.useCallback(function(v91, v92) --[[ Line: 282 ]]
        -- upvalues: v46 (copy), v4 (ref), l_Focusable_0 (ref), v16 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v90 (copy), v51 (copy), l_FFlagAXCategoryUnifiedLogging_0 (ref), v50 (copy), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), v59 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v55 (copy), v5 (ref), l_FFlagAXRemoveCatalogCategoryNavKey_0 (ref), l_AvatarScreen_0 (ref), l_FFlagAXMigrateCategoryTooltip_0 (ref), l_FFlagAXCatalogCategoryTooltip_0 (ref)
        local v93 = false;
        v93 = if v46.shouldUseCategoryId then v46.selectedCategoryId == v92.Id else v46.selectedCategoryIndex == v91;
        return v4.createElement(l_Focusable_0[v16], {
            categoryIndex = v91, 
            categoryId = v92.Id, 
            categoryTitle = v92.Title, 
            localizedCategoryTitle = if l_FFlagAXCatalogCategoriesSDUI_0 then v92.LocalizedTitle else nil, 
            layoutOrder = v91, 
            isSelected = v93, 
            hasNewItemNotification = v90(v91), 
            frameRef = v51[if v46.shouldUseCategoryId then v92.Id else v91], 
            onActivate = function() --[[ Line: 299 ]] --[[ Name: onActivate ]]
                -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (ref), v50 (ref), v91 (copy), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), v92 (copy), v59 (ref), v46 (ref)
                if l_FFlagAXCategoryUnifiedLogging_0 then
                    local v94 = v50[v91];
                    if v94 and v94.current then
                        l_sendUnifiedEventLogForInstance_0(v94.current, {
                            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                            elementName = "SELECT_CATEGORY_" .. string.upper(v92.Name), 
                            surface = v59
                        });
                    end;
                end;
                if v46.shouldUseCategoryId and v46.selectCategoryId then
                    v46.selectCategoryId(v92.Id);
                    return;
                else
                    v46.selectCategory(v91);
                    return;
                end;
            end, 
            ref = v50[v91], 
            NextSelectionLeft = if v91 > 1 then v50[v91 - 1] else nil, 
            NextSelectionRight = if v91 < #v46.categories then v50[v91 + 1] else nil, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else if v55 ~= nil then {
                ShiftLeft = v5.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 325 ]]
                    -- upvalues: v91 (copy), v55 (ref)
                    if v91 > 1 then
                        v55.moveFocusLeft();
                    end;
                end), 
                ShiftRight = v5.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 330 ]]
                    -- upvalues: v91 (copy), v46 (ref), v55 (ref)
                    if v91 < #v46.categories then
                        v55.moveFocusRight();
                    end;
                end)
            } else nil, 
            navigationKey = if not l_FFlagAXRemoveCatalogCategoryNavKey_0 then v92.NavigationKey else nil, 
            navBarHeight = v46.navHeight, 
            avatarScreenOfOrigin = l_AvatarScreen_0.Catalog, 
            categoryTooltipKey = if not not l_FFlagAXMigrateCategoryTooltip_0 or l_FFlagAXCatalogCategoryTooltip_0 then v92.TooltipKey else nil, 
            categoryTooltipLocalizationKey = if l_FFlagAXMigrateCategoryTooltip_0 then v92.TooltipLocalizationKey else nil, 
            categoryLocalizedTooltipBody = if l_FFlagAXCatalogCategoriesSDUI_0 then v92.TooltipBody else nil
        });
    end, {
        v46.selectedCategoryIndex, 
        v46.selectedCategoryId, 
        v90, 
        v46.selectCategory, 
        v46.selectCategoryId, 
        v46.shouldUseCategoryId, 
        v46.categories, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v55
    });
    local v97 = v4.useCallback(function(v96) --[[ Line: 361 ]]
        -- upvalues: v52 (copy)
        if v52.current then
            v52.current.CanvasSize = UDim2.new(0, v96.AbsoluteSize.X, 1, 0);
        end;
    end, {});
    local v98 = nil;
    local v99 = nil;
    if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then
        v98 = if l_FFlagAXReduceCatalogFilterWidth_0 then v53.Size.Size_1300 else v53.Size.Size_1400;
        v99 = v53.Size.Size_600;
    end;
    local v104 = v4.useCallback(function() --[[ Line: 378 ]]
        -- upvalues: v54 (copy), v14 (ref), v46 (copy), v95 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (ref), v4 (ref), v10 (ref), v98 (ref), v99 (ref), v51 (copy), l_Focusable_0 (ref), l_FitFrameHorizontal_0 (ref), v97 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v5 (ref), v55 (copy), v15 (ref), v52 (copy), v48 (copy)
        local v100 = not (v54 == v14.InputType.Gamepad) or v46.subcategorySelected;
        local v101 = {};
        for v102, v103 in v46.categories do
            v101[v103.Name] = v95(v102, v103);
        end;
        if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v46.supportFilterButton and v46.showFilterButton then
            v101.RightPadding = v4.createElement(v10.View, {
                tag = "auto-xy", 
                Size = UDim2.new(0, v98 + v99, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = #v46.categories + 1, 
                ref = v51.RightPadding
            });
        end;
        return {
            NavFrame = v4.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
                height = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                [v4.Change.AbsoluteSize] = v97, 
                inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else {
                    ToTopBar = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 406 ]]
                        -- upvalues: v55 (ref)
                        v55.moveFocusUp();
                    end)
                }
            }, v101), 
            Highlight = v100 and v4.createElement(v15, {
                scrollingFrameRef = v52, 
                useArrowHighlight = v46.subcategorySelected, 
                selectedCategoryButtonInstance = v48
            })
        };
    end, {
        v54, 
        v46.subcategorySelected, 
        v95, 
        v97, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v55, 
        v48, 
        v46.categories, 
        v46.supportFilterButton, 
        v46.showFilterButton, 
        l_FFlagAXMoveCatalogFilterToL1Navigation_0
    });
    local l_selectedCategoryIndex_0 = v46.selectedCategoryIndex;
    if v46.shouldUseCategoryId then
        l_selectedCategoryIndex_0 = v31.findCategoryIndexById(v46.categories, v46.selectedCategoryId);
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        ClipsDescendants = true, 
        BackgroundColor3 = v53.Color.Surface.Surface_0.Color3, 
        BackgroundTransparency = v53.Color.Surface.Surface_0.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v46.layoutOrder, 
        Size = UDim2.new(1, 0, 0, v46.navHeight), 
        ZIndex = v46.zIndex, 
        ref = v47, 
        NextSelectionUp = v46.NextSelectionUp, 
        NextSelectionDown = v46.NextSelectionDown, 
        defaultChild = v50[l_selectedCategoryIndex_0]
    }, {
        ScrollingListWithArrowsAndGradient = v4.createElement(v13, {
            getScollingListContent = v104, 
            listHeight = v46.navHeight, 
            scrollingFrameRef = l_v52_0, 
            buttonRefs = v51, 
            buttonPadding = 0, 
            onSizeChanged = if l_FFlagAXEnableEditorCategoryDeepLink_0 then v82 else nil, 
            backgroundColor = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v53.Color.Surface.Surface_0.Color3 else nil, 
            supportFilterButton = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v46.supportFilterButton else nil, 
            hideFilterButton = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then not v46.showFilterButton else nil, 
            filterButtonWidth = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v98 else nil, 
            filterButtonGradientWidth = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v99 else nil
        })
    });
end);
return v4.memo(v106);