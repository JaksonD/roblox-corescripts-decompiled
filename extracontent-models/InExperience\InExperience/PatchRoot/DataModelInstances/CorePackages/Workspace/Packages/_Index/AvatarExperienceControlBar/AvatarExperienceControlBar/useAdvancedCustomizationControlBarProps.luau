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
local l_SlotBasedEditorAnalytics_0 = v8.Surfaces.SlotBasedEditorAnalytics;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useNavigation_0 = v4.useNavigation;
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local v16 = require(l_script_FirstAncestor_0.Enums.MenuItemEnum);
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local l_IconName_0 = v3.Enums.IconName;
local l_IconVariant_0 = v3.Enums.IconVariant;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_Parent_0.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local v21 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXMigrateBuilderIcons_0 = v21.FFlagAXMigrateBuilderIcons;
local l_FFlagAXCustomizeMakeupSupport_0 = v21.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 = v21.FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent;
return function(v25) --[[ Line: 42 ]] --[[ Name: useAdvancedCustomizationControlBarProps ]]
    -- upvalues: l_useTokens_0 (copy), l_useNavigation_0 (copy), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), l_selectColorAdjustmentButtonColor_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), v16 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v9 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_IconName_0 (copy), l_IconVariant_0 (copy)
    local v26 = l_useTokens_0();
    local v27 = l_useNavigation_0();
    local v28 = if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then l_useAvatarRoute_0() else nil;
    local v29 = l_useSelector_0(l_selectColorAdjustmentButtonColor_0);
    local l_Size_600_0 = v26.Size.Size_600;
    local v31 = v25.avatarRoute and v25.avatarRoute.opaque and v25.avatarRoute.opaque.name;
    local v32 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v27 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v28 (copy), l_SlotBasedEditorAnalytics_0 (ref), v16 (ref)
        v27.navigate(l_AvatarScreen_0.AccessoryAdjustment);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v28 and v28.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v16.AvatarRefinement.AdjustAccessory, v28.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v16.AvatarRefinement.AdjustAccessory);
            return;
        end;
    end, {
        v27, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v28 else nil
    });
    local v33 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v27 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v28 (copy), l_SlotBasedEditorAnalytics_0 (ref), v16 (ref)
        v27.navigate(l_AvatarScreen_0.BodyShape);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v28 and v28.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v16.AvatarRefinement.BodyScale, v28.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v16.AvatarRefinement.BodyScale);
            return;
        end;
    end, {
        v27, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v28 else nil
    });
    local v34 = v2.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v27 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v28 (copy), l_SlotBasedEditorAnalytics_0 (ref), v16 (ref)
        v27.navigate(l_AvatarScreen_0.HeadRefinement);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v28 and v28.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v16.AvatarRefinement.CustomizeHead, v28.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v16.AvatarRefinement.CustomizeHead);
            return;
        end;
    end, {
        v27, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v28 else nil
    });
    local v35 = v2.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (ref), v28 (copy), l_AvatarScreen_0 (ref), v27 (copy), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v16 (ref)
        if l_FFlagAXCustomizeMakeupSupport_0 and v28 and v28.current and v28.current.name == l_AvatarScreen_0.LayeredMakeupSort then
            v27.pop();
        end;
        v27.navigate(l_AvatarScreen_0.LayeredClothingSort);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v28 and v28.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v16.AvatarRefinement.ClothingLayers, v28.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v16.AvatarRefinement.ClothingLayers);
            return;
        end;
    end, {
        v27, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v28 else nil
    });
    local v36 = if l_FFlagAXCustomizeMakeupSupport_0 then v2.useCallback(function() --[[ Line: 118 ]]
        -- upvalues: v28 (copy), l_AvatarScreen_0 (ref), v27 (copy), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v16 (ref)
        if v28 and v28.current and v28.current.name == l_AvatarScreen_0.LayeredClothingSort then
            v27.pop();
        end;
        v27.navigate(l_AvatarScreen_0.LayeredMakeupSort);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v28 and v28.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v16.AvatarRefinement.MakeupLayers, v28.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v16.AvatarRefinement.MakeupLayers);
            return;
        end;
    end, {
        v27, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v28 else nil
    }) else nil;
    local v37 = v2.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v27 (copy), l_AvatarScreen_0 (ref), l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 (ref), v28 (copy), l_SlotBasedEditorAnalytics_0 (ref), v16 (ref)
        v27.navigate(l_AvatarScreen_0.ColorAdjustment);
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 and v28 and v28.opaque then
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClickFromSurface(v16.AvatarRefinement.ColorAdjustment, v28.opaque.name);
            return;
        else
            l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(v16.AvatarRefinement.ColorAdjustment);
            return;
        end;
    end, {
        v27, 
        if l_FFlagAXAddSurfaceToAdvancedCustomizationControlBarClickEvent_0 then v28 else nil
    });
    local v38 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v9.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
    return {
        config = v2.useMemo(function() --[[ Line: 157 ]]
            -- upvalues: v16 (ref), v38 (copy), l_FFlagAXMigrateBuilderIcons_0 (ref), l_IconName_0 (ref), l_IconVariant_0 (ref), v32 (copy), v31 (copy), l_AvatarScreen_0 (ref), l_Size_600_0 (copy), v33 (copy), v34 (copy), v35 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v36 (copy), v29 (copy), v37 (copy)
            return {
                {
                    type = "icon", 
                    id = v16.AvatarRefinement.AdjustAccessory, 
                    icon = v38 and "icons/menu/transform-small" or if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HatFedora else "icons/menu/clothing/hats_off", 
                    activeIcon = v38 and "icons/menu/transform-small" or if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HatFedora else "icons/menu/clothing/hats_on", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v32, 
                    isActive = v31 == l_AvatarScreen_0.AccessoryAdjustment, 
                    iconSize = l_Size_600_0
                }, 
                {
                    type = "icon", 
                    id = v16.AvatarRefinement.BodyScale, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off", 
                    activeIcon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_on", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v33, 
                    isActive = v31 == l_AvatarScreen_0.BodyShape, 
                    iconSize = l_Size_600_0
                }, 
                {
                    type = "icon", 
                    id = v16.AvatarRefinement.CustomizeHead, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_off", 
                    activeIcon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_on", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v34, 
                    isActive = v31 == l_AvatarScreen_0.HeadRefinement, 
                    iconSize = l_Size_600_0
                }, 
                {
                    type = "icon", 
                    id = v16.AvatarRefinement.ClothingLayers, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ClothesHanger else "icons/menu/clothing/clothing_off", 
                    activeIcon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ClothesHanger else "icons/menu/clothing/clothing_on", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v35, 
                    isActive = v31 == l_AvatarScreen_0.LayeredClothingSort, 
                    iconSize = l_Size_600_0
                }, 
                if l_FFlagAXCustomizeMakeupSupport_0 then {
                    type = "icon", 
                    id = v16.AvatarRefinement.MakeupLayers, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_on", 
                    activeIcon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off", 
                    activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_IconVariant_0.Filled else nil, 
                    onActivated = v36, 
                    isActive = v31 == l_AvatarScreen_0.LayeredMakeupSort, 
                    iconSize = l_Size_600_0
                } else nil, 
                if v29 then {
                    type = "color", 
                    id = v16.AvatarRefinement.ColorAdjustment, 
                    colorSize = l_Size_600_0, 
                    colors = {
                        v29
                    }, 
                    onActivated = v37, 
                    isActive = v31 == l_AvatarScreen_0.ColorAdjustment, 
                    Selectable = true
                } else nil
            };
        end, {
            v31, 
            v32, 
            v33, 
            v34, 
            v35, 
            if l_FFlagAXCustomizeMakeupSupport_0 then v36 else nil, 
            v37, 
            v29
        })
    };
end;