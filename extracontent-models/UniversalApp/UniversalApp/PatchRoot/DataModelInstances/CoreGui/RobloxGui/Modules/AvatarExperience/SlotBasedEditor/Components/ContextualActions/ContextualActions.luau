local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Constants;
local v14 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_ContextualActionButton_0 = v4.Components.ContextualActionButton;
local l_ColorGradientCircle_0 = v4.Components.ColorGradientCircle;
local l_SlotBasedEditorAnalytics_0 = v8.Surfaces.SlotBasedEditorAnalytics;
local v18 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId);
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_IconOnlyMenu_0 = v7.IconOnlyMenu;
local l_MenuItemEnum_0 = v7.Enums.MenuItemEnum;
local l_IconName_0 = v3.Enums.IconName;
local l_AXTooltip_0 = v10.AXTooltipComponents.AXTooltip;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local l_useMakeupLayeringTooltip_0 = v9.Hooks.useMakeupLayeringTooltip;
local l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 = v6.FFlagAXColorAdjustmentButtonShouldAccountForTryOns;
local l_FFlagAXShowHeadAdjustmentInRightControlBar_0 = v6.FFlagAXShowHeadAdjustmentInRightControlBar;
local l_FFlagAXMigrateBuilderIcons_0 = v6.FFlagAXMigrateBuilderIcons;
local l_FFlagDynamicHeadsMigration_0 = v6.FFlagDynamicHeadsMigration;
local l_FFlagAXMakeupEquipping_0 = v6.FFlagAXMakeupEquipping;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v6.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 = v6.FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent;
local l_FFlagAXMakeupLayeringTooltipFTUX_0 = v6.FFlagAXMakeupLayeringTooltipFTUX;
local l_selectColorAdjustmentButtonColor_0 = v4.State.Selectors.selectColorAdjustmentButtonColor;
local v40 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v4.State.Selectors.selectShowColorQuickButton else require(l_Modules_0.AvatarExperience.Common.Selectors.selectShowColorQuickButton);
local l_selectCurrentAvatarEditorCategory_0 = v4.State.Selectors.selectCurrentAvatarEditorCategory;
local l_selectHasMakeupTryOn_0 = v4.State.Selectors.selectHasMakeupTryOn;
local l_selectTotalLayeredMakeupAssets_0 = v4.State.Selectors.selectTotalLayeredMakeupAssets;
local v44 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsInMakeupCategoryWithMultipleItems);
local v45 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local l_AvatarEditorSubcategories_0 = v12.Enums.AvatarEditorSubcategories;
local v47 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory);
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local v49 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAccessoryAdjustmentQuickButtonDuringTryOn);
local l_MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON_0 = l_Constants_0.MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON;
local function v52(v51) --[[ Line: 73 ]] --[[ Name: selectDeviceOrientation ]]
    return v51.DeviceOrientation;
end;
local function v59(v53) --[[ Line: 77 ]] --[[ Name: selectIsInHeadsSubcategory ]]
    -- upvalues: l_selectCurrentAvatarEditorCategory_0 (copy), v45 (copy), l_AvatarEditorSubcategories_0 (copy)
    local v54 = l_selectCurrentAvatarEditorCategory_0(v53);
    local v55 = v45()[v54];
    if not v55 or not v55.Subcategories then
        return false;
    else
        local l_subcategory_0 = v53.AvatarExperience.AvatarEditor.Categories.subcategory;
        if not l_subcategory_0 then
            return false;
        else
            local v57 = v55.Subcategories[l_subcategory_0];
            local v58 = false;
            if v57 ~= nil then
                v58 = v57.Id == l_AvatarEditorSubcategories_0.Heads;
            end;
            return v58;
        end;
    end;
end;
local function v80(v60) --[[ Line: 93 ]] --[[ Name: selectEquippedDynamicHeadAndTryOnBundle ]]
    -- upvalues: v11 (copy), v18 (copy), l_FFlagDynamicHeadsMigration_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy)
    local v61 = nil;
    local v62 = nil;
    local v63 = v60.AvatarExperience and v60.AvatarExperience.AvatarEditor and v60.AvatarExperience.AvatarEditor.Character and v60.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    if v63 and v63[v11.AssetTypeIdStrings.DynamicHead] then
        v61 = next(v63[v11.AssetTypeIdStrings.DynamicHead]);
    end;
    local v64 = v60.AvatarExperience and v60.AvatarExperience.Common and v60.AvatarExperience.Common.AssetInfos;
    if v61 and v64 then
        v62 = v64[v61];
    end;
    local v65, _ = v18(v60, v11.AssetTypeIdStrings.DynamicHead);
    local v67 = nil;
    if v65 and v64 then
        v67 = v64[v65];
    end;
    local v68 = false;
    if l_FFlagDynamicHeadsMigration_0 then
        local v69 = v60.AvatarExperience.AvatarScene.OutfitTryOn and v60.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v70 = nil;
        local v71 = nil;
        if v69 and v65 then
            for _, v73 in v69 do
                if v73.itemType == v11.ItemType.Bundle and v73.bundleInfo then
                    if v73.bundleInfo[v65] then
                        v70 = v73.itemId;
                        v71 = v73;
                        break;
                    end;
                elseif v73.itemType == v11.ItemType.Asset and v73.itemId == v65 then
                    v70 = v73.itemId;
                    v71 = v73;
                    break;
                end;
            end;
        end;
        local v74 = v60.AvatarExperience and v60.AvatarExperience.Common and v60.AvatarExperience.Common.BundleInfos;
        local v75 = nil;
        if v70 and v74 then
            v75 = v74[v70];
        end;
        local v76 = nil;
        if v71 and v71.itemSubType == v11.BundleTypeIdStrings.DynamicHead and v71.bundleInfo then
            for v77, _ in v71.bundleInfo do
                local v79 = if v64 then v64[v77] else nil;
                if v79 and v79.supportsHeadShapes == true then
                    v76 = true;
                    break;
                end;
            end;
        end;
        if v67 and v67.supportsHeadShapes ~= nil then
            v68 = v67.supportsHeadShapes;
        elseif v75 and v75.supportsHeadShapes ~= nil then
            v68 = v75.supportsHeadShapes;
        elseif v76 ~= nil then
            v68 = v76;
        elseif v65 == nil and v62 and v62.supportsHeadShapes ~= nil then
            v68 = v62.supportsHeadShapes;
        end;
    elseif v67 then
        v68 = v67.supportsHeadShapes ~= nil and v67.supportsHeadShapes;
    elseif v62 then
        v68 = v62.supportsHeadShapes ~= nil and v62.supportsHeadShapes;
    end;
    return {
        equippedDynamicHeadId = v61, 
        equippedDynamicHeadInfo = v62, 
        tryOnAssetId = v65, 
        tryOnDynamicHeadAssetInfo = v67, 
        supportsHeadShapes = v68, 
        hasDynamicHead = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v61 ~= nil or v65 ~= nil else nil
    };
end;
return v2.memo(v2.forwardRef(function(v81) --[[ Line: 227 ]] --[[ Name: ContextualActions ]]
    -- upvalues: l_useTokens_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_selectColorAdjustmentButtonColor_0 (copy), v40 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v49 (copy), l_FFlagAXShowHeadAdjustmentInRightControlBar_0 (copy), v80 (copy), v59 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_selectHasMakeupTryOn_0 (copy), l_selectTotalLayeredMakeupAssets_0 (copy), v44 (copy), l_AvatarScreen_0 (copy), l_MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON_0 (copy), l_FFlagAXMakeupLayeringTooltipFTUX_0 (copy), l_useLocalization_0 (copy), l_useMakeupLayeringTooltip_0 (copy), v52 (copy), v14 (copy), v2 (copy), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_MenuItemEnum_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v3 (copy), l_ContextualActionButton_0 (copy), l_ColorGradientCircle_0 (copy), l_IconOnlyMenu_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_IconName_0 (copy), l_AXTooltip_0 (copy), v47 (copy)
    local v82 = l_useTokens_0();
    local v83 = l_useNavigation_0();
    local v84 = l_useAvatarRoute_0();
    local v85 = l_useDispatch_0();
    local v86 = l_useSelector_0(l_selectColorAdjustmentButtonColor_0);
    local v87 = l_useSelector_0(v40);
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then
        local v91 = v49();
        v88 = v91.shouldEnableAccessoryAdjustmentDuringTryOn;
        v89 = v91.adjustableLastTryOnItemId;
        v90 = v91.accessoryAdjustmentQuickButtonFtux;
    end;
    local v92 = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then l_useSelector_0(v80) else nil;
    local v93 = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then l_useSelector_0(v59) else nil;
    local v94 = if l_FFlagAXMakeupEquipping_0 then l_useSelector_0(l_selectHasMakeupTryOn_0) else false;
    local v95 = if l_FFlagAXMakeupEquipping_0 then l_useSelector_0(l_selectTotalLayeredMakeupAssets_0) else nil;
    local v96 = if l_FFlagAXMakeupEquipping_0 then l_useSelector_0(v44) else false;
    local v97 = if l_FFlagAXMakeupEquipping_0 then v84.opaque.name == l_AvatarScreen_0.AvatarEditor else false;
    local v98 = if l_FFlagAXMakeupEquipping_0 then v94 and l_MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON_0 <= v95 else nil;
    local v99 = if l_FFlagAXMakeupEquipping_0 then v98 or v97 and v96 else false;
    local v100 = if l_FFlagAXMakeupLayeringTooltipFTUX_0 then l_useLocalization_0({
        makeupLayeringTooltipText = "Feature.Avatar.Text.MakeupLayeringTooltip"
    }) else nil;
    local v101 = if l_FFlagAXMakeupLayeringTooltipFTUX_0 then l_useMakeupLayeringTooltip_0(v99) else nil;
    local v102 = nil;
    if l_FFlagAXMakeupLayeringTooltipFTUX_0 then
        v102 = l_useSelector_0(v52) == v14.Keys.Portrait and "Left" or "Right";
    end;
    local v103 = if l_FFlagAXMakeupEquipping_0 then v2.useCallback(function() --[[ Line: 288 ]]
        -- upvalues: l_FFlagAXMakeupLayeringTooltipFTUX_0 (ref), v101 (copy), v83 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v84 (copy), l_SlotBasedEditorAnalytics_0 (ref), l_MenuItemEnum_0 (ref)
        if l_FFlagAXMakeupLayeringTooltipFTUX_0 then
            v101.dismissTooltip();
        end;
        v83.navigate(l_AvatarScreen_0.LayeredMakeupSort);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v84 and v84.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(l_MenuItemEnum_0.AvatarRefinement.MakeupLayers, v84.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(l_MenuItemEnum_0.AvatarRefinement.MakeupLayers);
            return;
        end;
    end, {
        v83, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v84 else nil, 
        if l_FFlagAXMakeupLayeringTooltipFTUX_0 then v101 else nil
    }) else nil;
    local v104 = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v2.useCallback(function() --[[ Line: 312 ]]
        -- upvalues: v83 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v84 (copy), l_SlotBasedEditorAnalytics_0 (ref), l_MenuItemEnum_0 (ref)
        v83.navigate(l_AvatarScreen_0.HeadRefinement);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v84 and v84.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(l_MenuItemEnum_0.AvatarRefinement.CustomizeHead, v84.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(l_MenuItemEnum_0.AvatarRefinement.CustomizeHead);
            return;
        end;
    end, {
        v83, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v84 else nil
    }) else nil;
    local v105 = nil;
    if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
        local v106 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v92 and v92.hasDynamicHead else if v92 then v92.supportsHeadShapes or false else false;
        local v107 = v93 and v106;
        local v108 = v92 and v92.tryOnAssetId ~= nil;
        v105 = v107 or v108;
    end;
    return v2.createElement(v3.View, {
        LayoutOrder = v81.LayoutOrder, 
        tag = "col gap-small auto-xy"
    }, {
        SkinColorButton = if v87 and v86 then v2.createElement(l_ContextualActionButton_0, {
            size = UDim.new(0, v82.Size.Size_1100), 
            onActivated = function() --[[ Line: 343 ]] --[[ Name: onActivated ]]
                -- upvalues: v83 (copy), l_AvatarScreen_0 (ref)
                v83.navigate(l_AvatarScreen_0.ColorAdjustment);
            end, 
            LayoutOrder = 1, 
            Selectable = true
        }, v2.createElement(l_ColorGradientCircle_0, {
            Colors = {
                v86
            }, 
            Size = UDim2.fromOffset(v82.Size.Size_500, v82.Size.Size_500), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        })) else nil, 
        HeadAdjustmentButton = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 and v105 then v2.createElement(l_IconOnlyMenu_0, {
            LayoutOrder = 3, 
            items = {
                {
                    type = "icon", 
                    id = l_MenuItemEnum_0.AvatarRefinement.CustomizeHead, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_off", 
                    iconSize = v82.Size.Size_600, 
                    onActivated = v104
                }
            }
        }) else nil, 
        MakeupLayering = if l_FFlagAXMakeupEquipping_0 and v99 then v2.createElement(v3.View, {
            tag = "auto-xy", 
            LayoutOrder = 2
        }, {
            MakeupLayeringButton = v2.createElement(l_IconOnlyMenu_0, {
                items = {
                    {
                        type = "icon", 
                        id = l_MenuItemEnum_0.AvatarRefinement.MakeupLayers, 
                        icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off", 
                        iconSize = v82.Size.Size_600, 
                        onActivated = v103
                    }
                }
            }), 
            MakeupLayeringTooltip = if l_FFlagAXMakeupLayeringTooltipFTUX_0 then v2.createElement(l_AXTooltip_0, {
                isOpen = v101.showTooltip, 
                popoverSide = v102, 
                tooltipText = v100.makeupLayeringTooltipText, 
                onTooltipActivated = v101.dismissTooltip
            }) else nil
        }) else nil, 
        AccessoryAdjustmentButton = if v88 and v84.opaque.name == l_AvatarScreen_0.Catalog and v89 then v2.createElement(l_ContextualActionButton_0, {
            size = UDim.new(0, v82.Size.Size_1100), 
            onActivated = function() --[[ Line: 406 ]] --[[ Name: onActivated ]]
                -- upvalues: v90 (ref), v83 (copy), l_AvatarScreen_0 (ref), v84 (copy), v85 (copy), v47 (ref), v89 (ref)
                if v90 and v90.shouldShowFirstTimeGlow() then
                    v90.completeFirstTimeGlow();
                end;
                v83.navigate(l_AvatarScreen_0.AdjustAccessoryView, {
                    fromRoute = v84.opaque.name
                });
                v85(v47(v89));
            end, 
            enableFocusAnimation = v90 and v90.shouldShowFirstTimeGlow(), 
            LayoutOrder = 4, 
            Selectable = true, 
            GroupTransparencyOverwrite = 0
        }, {
            Icon = v2.createElement(v3.View, {
                Size = UDim2.fromScale(1, 1), 
                Visible = true, 
                tag = "radius-circle position-center-center anchor-center-center clip"
            }, {
                IconImage = v2.createElement(v3.Image, {
                    Image = "icons/menu/transform", 
                    Size = UDim2.fromOffset(v82.Size.Size_800, v82.Size.Size_800), 
                    imageStyle = {
                        Color3 = v82.Color.Content.Emphasis.Color3, 
                        Transparency = v82.Color.Content.Emphasis.Transparency
                    }, 
                    tag = "position-center-center anchor-center-center radius-circle content-emphasis"
                })
            })
        }) else nil
    });
end));