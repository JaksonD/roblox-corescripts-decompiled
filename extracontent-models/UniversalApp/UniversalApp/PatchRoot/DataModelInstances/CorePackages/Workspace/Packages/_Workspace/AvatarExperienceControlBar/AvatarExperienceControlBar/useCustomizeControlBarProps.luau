local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserLib);
local v4 = require(l_Parent_0.Navigation);
local v5 = require(l_Parent_0.AvatarExperienceNavigation);
local v6 = require(l_Parent_0.Responsive);
local v7 = require(l_Parent_0.Localization);
local v8 = require(l_Parent_0.AvatarExperienceCommon);
local v9 = require(l_Parent_0.AvatarExperienceAnalytics);
local v10 = require(l_Parent_0.IXPUtils);
local v11 = require(l_Parent_0.Foundation);
local l_selectColorAdjustmentButtonColor_0 = v8.State.Selectors.selectColorAdjustmentButtonColor;
local l_selectHasDynamicHead_0 = v8.State.Selectors.selectHasDynamicHead;
local l_SlotBasedEditorAnalytics_0 = v9.Surfaces.SlotBasedEditorAnalytics;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = v4.useNavigation;
local v17 = require(l_script_FirstAncestor_0.Hooks.useSemanticTokens);
local l_useLocalization_0 = v7.Hooks.useLocalization;
local v19 = require(script.Parent.UndoRedoBar.useUndoRedoBarViewModel);
local l_IconName_0 = v11.Enums.IconName;
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v3.Utils.Constants;
local v24 = require(l_script_FirstAncestor_0.Enums.MenuItemEnum);
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local v26 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXAvatarSharingEntryPoint_0 = v26.FFlagAXAvatarSharingEntryPoint;
local l_FFlagAXPhotoboothFunctionality_0 = v26.FFlagAXPhotoboothFunctionality;
local l_FFlagAXMigrateBuilderIcons_0 = v26.FFlagAXMigrateBuilderIcons;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_Parent_0.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXResetAvatarButton_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXResetAvatarButton;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local l_FFlagAXHideHeadAdjustmentForDefaultHead_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXHideHeadAdjustmentForDefaultHead;
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local function v37(v36) --[[ Line: 50 ]] --[[ Name: selectUserId ]]
    return v36.LocalUserId;
end;
return function(v38) --[[ Line: 64 ]] --[[ Name: useCustomizeControlBarProps ]]
    -- upvalues: v17 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), l_selectColorAdjustmentButtonColor_0 (copy), v6 (copy), v37 (copy), l_useLocalization_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_FFlagAXAvatarSharingEntryPoint_0 (copy), l_FFlagAXPhotoboothFunctionality_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), v24 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v10 (copy), l_FFlagAXHideHeadAdjustmentForDefaultHead_0 (copy), l_selectHasDynamicHead_0 (copy), l_FFlagAXResetAvatarButton_0 (copy), v19 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_IconName_0 (copy)
    local v39 = v17();
    local v40 = l_useNavigation_0();
    local v41 = l_useSelector_0(l_selectColorAdjustmentButtonColor_0);
    local v42 = v6.useOrientation() == v6.Keys.Portrait;
    local v43 = l_useSelector_0(v37);
    local v44 = l_useLocalization_0({
        adjustAccessory = "Feature.Avatar.Label.Title.AccessoryAdjustment", 
        bodyShape = "Feature.Avatar.Label.Title.BodyShape", 
        clothingLayering = "Feature.Avatar.Label.Title.ClothingLayering", 
        makeupLayering = l_FFlagAXCustomizeMakeupSupport_0 and "Feature.Avatar.Label.Title.MakeupLayering" or nil, 
        headAdjustment = "Feature.Avatar.Label.Title.HeadAdjustment", 
        inventory = "Feature.Avatar.Label.Title.Inventory", 
        emotes = "Feature.Avatar.Label.Title.Emotes", 
        profilePhoto = "Feature.Avatar.Label.Title.ProfilePhoto", 
        skinColor = "Feature.Avatar.ColorAdjustmentPage.Title", 
        shareAvatar = l_FFlagAXAvatarSharingEntryPoint_0 and "Feature.Avatar.Action.ShareAvatar" or nil, 
        myPublishedAvatars = l_FFlagAXAvatarSharingEntryPoint_0 and "Feature.Avatar.Action.MyPublishedAvatars" or nil, 
        photobooth = l_FFlagAXPhotoboothFunctionality_0 and "Feature.Avatar.Label.Photobooth" or nil
    });
    local v45 = v2.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        v40.navigate(l_AvatarScreen_0.AvatarSwitcher);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.Main.AvatarSwitcher);
    end, {
        v40
    });
    local v46 = v2.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        v40.navigate(l_AvatarScreen_0.AccessoryAdjustment);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.AvatarRefinement.AdjustAccessory);
    end, {
        v40
    });
    local v47 = v2.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        v40.navigate(l_AvatarScreen_0.BodyShape);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.AvatarRefinement.BodyScale);
    end, {
        v40
    });
    local v48 = v2.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        v40.navigate(l_AvatarScreen_0.HeadRefinement);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.AvatarRefinement.CustomizeHead);
    end, {
        v40
    });
    local v49 = v2.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        v40.navigate(l_AvatarScreen_0.LayeredClothingSort);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.AvatarRefinement.ClothingLayers);
    end, {
        v40
    });
    local v50 = if l_FFlagAXCustomizeMakeupSupport_0 then v2.useCallback(function() --[[ Line: 114 ]]
        -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        v40.navigate(l_AvatarScreen_0.LayeredMakeupSort);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.AvatarRefinement.MakeupLayers);
    end, {
        v40
    }) else nil;
    local v51 = v2.useCallback(function() --[[ Line: 120 ]]
        -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        v40.navigate(l_AvatarScreen_0.ColorAdjustment);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.AvatarRefinement.ColorAdjustment);
    end, {
        v40
    });
    local v52 = nil;
    local v53 = nil;
    if l_FFlagAXAvatarSharingEntryPoint_0 then
        v52 = v2.useCallback(function() --[[ Line: 127 ]]
            -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
            local v54 = if v40.state and v40.state.key then v40.state.key else nil;
            v40.navigate(l_AvatarScreen_0.LookComposerPage, {
                prevNavPage = v54
            });
            l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.SharedCommunityAvatars.ShareAvatar);
        end, {
            v40
        });
        v53 = v2.useCallback(function() --[[ Line: 135 ]]
            -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
            v40.navigate(l_AvatarScreen_0.MySharedAvatars);
            l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.SharedCommunityAvatars.MyPublishedAvatars);
        end, {
            v40
        });
    end;
    local v55 = v2.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v38 (copy), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        if v38.onInventoryActivated then
            v38.onInventoryActivated();
        end;
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.More.Inventory);
    end, {
        v38.onInventoryActivated
    });
    local v56 = v2.useCallback(function() --[[ Line: 148 ]]
        -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        v40.navigate(l_AvatarScreen_0.EditEmotes);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.More.Emotes);
    end, {
        v40
    });
    local v58 = v2.useCallback(function() --[[ Line: 153 ]]
        -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
        local v57 = if v40.state and v40.state.key then v40.state.key else nil;
        v40.navigate(l_AvatarScreen_0.ProfilePictureEditorEmotes, {
            prevNavPage = v57
        });
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.More.ProfilePhoto);
    end, {
        v40
    });
    local v59 = nil;
    if l_FFlagAXPhotoboothFunctionality_0 then
        v59 = v2.useCallback(function() --[[ Line: 164 ]]
            -- upvalues: v40 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
            v40.navigate(l_AvatarScreen_0.Photobooth);
            l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.Photobooth.Photobooth);
        end, {
            v40
        });
    end;
    local v60 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v10.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
    local v61 = if l_FFlagAXHideHeadAdjustmentForDefaultHead_0 then l_useSelector_0(l_selectHasDynamicHead_0) else nil;
    local v62 = if l_FFlagAXResetAvatarButton_0 then v19() else nil;
    return {
        config = v2.useMemo(function() --[[ Line: 179 ]]
            -- upvalues: v24 (ref), v38 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v43 (copy), l_AvatarHeadShot_0 (ref), l_FFlagAXRootSlotBasedEditorFlag_0 (ref), v58 (copy), v45 (copy), l_FFlagAXMigrateBuilderIcons_0 (ref), l_IconName_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v44 (copy), v60 (copy), v39 (copy), v46 (copy), v47 (copy), v48 (copy), l_FFlagAXHideHeadAdjustmentForDefaultHead_0 (ref), v61 (copy), v49 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v50 (copy), v41 (copy), v51 (copy), l_FFlagAXAvatarSharingEntryPoint_0 (ref), v52 (ref), v53 (ref), v55 (copy), v42 (copy), v56 (copy), l_FFlagAXPhotoboothFunctionality_0 (ref), v59 (ref), l_FFlagAXResetAvatarButton_0 (ref), v62 (copy)
            local v63 = {
                {
                    type = "image", 
                    id = v24.Main.AvatarSwitcher, 
                    thumbnailUrl = if v38.thumbnailUrl then v38.thumbnailUrl else l_getRbxthumbWithTypeSizeAndOptions_0(v43, l_AvatarHeadShot_0, 150, true, true), 
                    onActivated = if l_FFlagAXRootSlotBasedEditorFlag_0 then v58 else v45, 
                    hideIndicator = l_FFlagAXRootSlotBasedEditorFlag_0 and true or nil, 
                    enableFocusAnimation = if v38.focusAnimation then v38.focusAnimation.enabled and v38.focusAnimation.menuItemId == v24.Main.AvatarSwitcher else nil
                }, 
                {
                    type = "icon", 
                    id = v24.Main.AvatarRefinement, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PersonStandingGear else "icons/menu/customize", 
                    onActivated = function() --[[ Line: 206 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
                        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.Main.AvatarRefinement);
                    end, 
                    children = {
                        {
                            type = "icon", 
                            id = v24.AvatarRefinement.AdjustAccessory, 
                            text = v44.adjustAccessory, 
                            icon = v60 and "icons/menu/transform-small" or if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HatFedora else "icons/menu/clothing/hats_off", 
                            iconSize = v39.defaultLegacyIconSize, 
                            onActivated = v46
                        }, 
                        {
                            type = "icon", 
                            id = v24.AvatarRefinement.BodyScale, 
                            text = v44.bodyShape, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off", 
                            iconSize = v39.defaultLegacyIconSize, 
                            onActivated = v47
                        }, 
                        {
                            type = "icon", 
                            id = v24.AvatarRefinement.CustomizeHead, 
                            text = v44.headAdjustment, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_off", 
                            iconSize = v39.defaultLegacyIconSize, 
                            onActivated = v48, 
                            visible = if l_FFlagAXHideHeadAdjustmentForDefaultHead_0 then v61 else nil
                        }, 
                        {
                            type = "icon", 
                            id = v24.AvatarRefinement.ClothingLayers, 
                            text = v44.clothingLayering, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ClothesHanger else "icons/menu/clothing/clothing_off", 
                            iconSize = v39.defaultLegacyIconSize, 
                            onActivated = v49
                        }, 
                        if l_FFlagAXCustomizeMakeupSupport_0 then {
                            type = "icon", 
                            id = v24.AvatarRefinement.MakeupLayers, 
                            text = v44.makeupLayering, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off", 
                            iconSize = v39.defaultLegacyIconSize, 
                            onActivated = v50
                        } else nil, 
                        if v41 then {
                            type = "color", 
                            id = v24.AvatarRefinement.ColorAdjustment, 
                            text = v44.skinColor, 
                            colors = {
                                v41
                            }, 
                            colorSize = v39.defaultLegacyIconSize, 
                            onActivated = v51
                        } else nil
                    }
                }, 
                if l_FFlagAXAvatarSharingEntryPoint_0 then {
                    type = "icon", 
                    id = v24.Main.SharedCommunityAvatars, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.CirclePlus else "icons/actions/edit/add", 
                    onActivated = function() --[[ Line: 282 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
                        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.Main.SharedCommunityAvatars);
                    end, 
                    children = {
                        {
                            type = "icon", 
                            id = v24.SharedCommunityAvatars.ShareAvatar, 
                            text = v44.shareAvatar, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PlusLarge else "icons/common/plus_heavy", 
                            iconSize = v39.defaultLegacyIconSize, 
                            onActivated = v52
                        }, 
                        {
                            type = "icon", 
                            id = v24.SharedCommunityAvatars.MyPublishedAvatars, 
                            text = v44.myPublishedAvatars, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.Person else "icons/actions/friend_sort/my_profile", 
                            iconSize = v39.defaultLegacyIconSize, 
                            onActivated = v53
                        }
                    }
                } else nil, 
                if not l_FFlagAXRootSlotBasedEditorFlag_0 then {
                    type = "icon", 
                    id = v24.Main.More, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ThreeBarsHorizontal else "icons/common/hamburgermenu", 
                    onActivated = function() --[[ Line: 316 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v24 (ref)
                        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v24.Main.More);
                    end, 
                    visible = not l_FFlagAXRootSlotBasedEditorFlag_0, 
                    children = {
                        {
                            type = "icon", 
                            id = v24.More.Inventory, 
                            text = v44.inventory, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.Backpack else "icons/menu/inventoryOff", 
                            onActivated = v55, 
                            visible = v42
                        }, 
                        if not l_FFlagAXRootSlotBasedEditorFlag_0 then {
                            type = "icon", 
                            id = v24.More.Emotes, 
                            text = v44.emotes, 
                            icon = "icons/controls/emoteOff", 
                            onActivated = v56
                        } else nil, 
                        if l_FFlagAXPhotoboothFunctionality_0 then {
                            type = "icon", 
                            id = v24.Photobooth.Photobooth, 
                            text = if v44.photobooth then v44.photobooth else "Photobooth", 
                            icon = "icons/controls/screenshot", 
                            onActivated = v59
                        } else nil
                    }
                } else nil
            };
            if l_FFlagAXResetAvatarButton_0 and v38.showUndoRedo then
                table.insert(v63, {
                    type = "divider", 
                    id = v24.UndoRedoDivider
                });
                for _, v65 in v62.items do
                    table.insert(v63, v65);
                end;
            end;
            return v63;
        end, {
            v43, 
            v45, 
            v46, 
            v47, 
            v48, 
            v49, 
            v55, 
            v56, 
            v58, 
            v51, 
            v41, 
            v42, 
            v38.thumbnailUrl, 
            v38.focusAnimation, 
            if l_FFlagAXResetAvatarButton_0 then v38.showUndoRedo else nil, 
            if l_FFlagAXResetAvatarButton_0 then v62 else nil, 
            if l_FFlagAXHideHeadAdjustmentForDefaultHead_0 then v61 else nil
        })
    };
end;