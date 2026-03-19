local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Navigation);
local v5 = require(l_Parent_0.AvatarExperienceNavigation);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Parent_0.AvatarExperienceCommon);
local v8 = require(l_Parent_0.AvatarExperienceAnalytics);
local v9 = require(l_Parent_0.IXPUtils);
local l_selectColorAdjustmentButtonColor_0 = v7.State.Selectors.selectColorAdjustmentButtonColor;
local l_selectHasDynamicHead_0 = v7.State.Selectors.selectHasDynamicHead;
local l_SlotBasedEditorAnalytics_0 = v8.Surfaces.SlotBasedEditorAnalytics;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useNavigation_0 = v4.useNavigation;
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local v17 = require(l_script_FirstAncestor_0.Enums.MenuItemEnum);
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local l_IconName_0 = v3.Enums.IconName;
local l_IconVariant_0 = v3.Enums.IconVariant;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_Parent_0.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local v22 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXMigrateBuilderIcons_0 = v22.FFlagAXMigrateBuilderIcons;
local l_FFlagAXCustomizeMakeupSupport_0 = v22.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 = v22.FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent;
local l_FFlagAXHideHeadAdjustmentForDefaultHead_0 = v22.FFlagAXHideHeadAdjustmentForDefaultHead;
return function(v27) --[[ Line: 44 ]] --[[ Name: useAdvancedCustomizationControlBarProps ]]
    -- upvalues: l_useTokens_0 (copy), l_useNavigation_0 (copy), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), l_selectColorAdjustmentButtonColor_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), v17 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_FFlagAXHideHeadAdjustmentForDefaultHead_0 (copy), l_selectHasDynamicHead_0 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v9 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_IconName_0 (copy), l_IconVariant_0 (copy)
    local v28 = l_useTokens_0();
    local v29 = l_useNavigation_0();
    local v30 = if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then l_useAvatarRoute_0() else nil;
    local v31 = l_useSelector_0(l_selectColorAdjustmentButtonColor_0);
    local l_Size_600_0 = v28.Size.Size_600;
    local v33 = v27.avatarRoute and v27.avatarRoute.opaque and v27.avatarRoute.opaque.name;
    local v34 = v2.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v29 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v30 (copy), l_SlotBasedEditorAnalytics_0 (ref), v17 (ref)
        v29.navigate(l_AvatarScreen_0.AccessoryAdjustment);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v30 and v30.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v17.AvatarRefinement.AdjustAccessory, v30.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v17.AvatarRefinement.AdjustAccessory);
            return;
        end;
    end, {
        v29, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v30 else nil
    });
    local v35 = v2.useCallback(function() --[[ Line: 69 ]]
        -- upvalues: v29 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v30 (copy), l_SlotBasedEditorAnalytics_0 (ref), v17 (ref)
        v29.navigate(l_AvatarScreen_0.BodyShape);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v30 and v30.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v17.AvatarRefinement.BodyScale, v30.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v17.AvatarRefinement.BodyScale);
            return;
        end;
    end, {
        v29, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v30 else nil
    });
    local v36 = v2.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v29 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v30 (copy), l_SlotBasedEditorAnalytics_0 (ref), v17 (ref)
        v29.navigate(l_AvatarScreen_0.HeadRefinement);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v30 and v30.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v17.AvatarRefinement.CustomizeHead, v30.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v17.AvatarRefinement.CustomizeHead);
            return;
        end;
    end, {
        v29, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v30 else nil
    });
    local v37 = v2.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (ref), v30 (copy), l_AvatarScreen_0 (ref), v29 (copy), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v17 (ref)
        if l_FFlagAXCustomizeMakeupSupport_0 and v30 and v30.current and v30.current.name == l_AvatarScreen_0.LayeredMakeupSort then
            v29.pop();
        end;
        v29.navigate(l_AvatarScreen_0.LayeredClothingSort);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v30 and v30.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v17.AvatarRefinement.ClothingLayers, v30.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v17.AvatarRefinement.ClothingLayers);
            return;
        end;
    end, {
        v29, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v30 else nil
    });
    local v38 = if l_FFlagAXCustomizeMakeupSupport_0 then v2.useCallback(function() --[[ Line: 120 ]]
        -- upvalues: v30 (copy), l_AvatarScreen_0 (ref), v29 (copy), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v17 (ref)
        if v30 and v30.current and v30.current.name == l_AvatarScreen_0.LayeredClothingSort then
            v29.pop();
        end;
        v29.navigate(l_AvatarScreen_0.LayeredMakeupSort);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v30 and v30.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v17.AvatarRefinement.MakeupLayers, v30.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v17.AvatarRefinement.MakeupLayers);
            return;
        end;
    end, {
        v29, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v30 else nil
    }) else nil;
    local v39 = v2.useCallback(function() --[[ Line: 140 ]]
        -- upvalues: v29 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v30 (copy), l_SlotBasedEditorAnalytics_0 (ref), v17 (ref)
        v29.navigate(l_AvatarScreen_0.ColorAdjustment);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v30 and v30.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v17.AvatarRefinement.ColorAdjustment, v30.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v17.AvatarRefinement.ColorAdjustment);
            return;
        end;
    end, {
        v29, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v30 else nil
    });
    local v40 = if l_FFlagAXHideHeadAdjustmentForDefaultHead_0 then l_useSelector_0(l_selectHasDynamicHead_0) else nil;
    local v41 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v9.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
    return {
        config = v2.useMemo(function() --[[ Line: 161 ]]
            -- upvalues: v17 (ref), v41 (copy), l_FFlagAXMigrateBuilderIcons_0 (ref), l_IconName_0 (ref), l_IconVariant_0 (ref), v34 (copy), v33 (copy), l_AvatarScreen_0 (ref), l_Size_600_0 (copy), v35 (copy), v36 (copy), l_FFlagAXHideHeadAdjustmentForDefaultHead_0 (ref), v40 (copy), v37 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v38 (copy), v31 (copy), v39 (copy)
            return {
                {
                    type = "icon", 
                    id = v17.AvatarRefinement.AdjustAccessory, 
                    icon = v41 and "icons/menu/transform-small" or if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HatFedora else "icons/menu/clothing/hats_off", 
                    activeIcon = v41 and "icons/menu/transform-small" or if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HatFedora else "icons/menu/clothing/hats_on", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v34, 
                    isActive = v33 == l_AvatarScreen_0.AccessoryAdjustment, 
                    iconSize = l_Size_600_0
                }, 
                {
                    type = "icon", 
                    id = v17.AvatarRefinement.BodyScale, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off", 
                    activeIcon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_on", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v35, 
                    isActive = v33 == l_AvatarScreen_0.BodyShape, 
                    iconSize = l_Size_600_0
                }, 
                {
                    type = "icon", 
                    id = v17.AvatarRefinement.CustomizeHead, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_off", 
                    activeIcon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_on", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v36, 
                    isActive = v33 == l_AvatarScreen_0.HeadRefinement, 
                    iconSize = l_Size_600_0, 
                    visible = if l_FFlagAXHideHeadAdjustmentForDefaultHead_0 then v40 else nil
                }, 
                {
                    type = "icon", 
                    id = v17.AvatarRefinement.ClothingLayers, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ClothesHanger else "icons/menu/clothing/clothing_off", 
                    activeIcon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ClothesHanger else "icons/menu/clothing/clothing_on", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v37, 
                    isActive = v33 == l_AvatarScreen_0.LayeredClothingSort, 
                    iconSize = l_Size_600_0
                }, 
                if l_FFlagAXCustomizeMakeupSupport_0 then {
                    type = "icon", 
                    id = v17.AvatarRefinement.MakeupLayers, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_on", 
                    activeIcon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v38, 
                    isActive = v33 == l_AvatarScreen_0.LayeredMakeupSort, 
                    iconSize = l_Size_600_0
                } else nil, 
                if v31 then {
                    type = "color", 
                    id = v17.AvatarRefinement.ColorAdjustment, 
                    colorSize = l_Size_600_0, 
                    colors = {
                        v31
                    }, 
                    onActivated = v39, 
                    isActive = v33 == l_AvatarScreen_0.ColorAdjustment, 
                    Selectable = true
                } else nil
            };
        end, {
            v33, 
            v34, 
            v35, 
            v36, 
            v37, 
            if l_FFlagAXCustomizeMakeupSupport_0 then v38 else nil, 
            v39, 
            v31, 
            if l_FFlagAXHideHeadAdjustmentForDefaultHead_0 then v40 else nil
        })
    };
end;