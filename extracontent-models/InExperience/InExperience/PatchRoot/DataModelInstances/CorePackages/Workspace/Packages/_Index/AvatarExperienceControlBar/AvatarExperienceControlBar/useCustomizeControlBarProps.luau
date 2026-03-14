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
local l_SlotBasedEditorAnalytics_0 = v9.Surfaces.SlotBasedEditorAnalytics;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = v4.useNavigation;
local v16 = require(l_script_FirstAncestor_0.Hooks.useSemanticTokens);
local l_useLocalization_0 = v7.Hooks.useLocalization;
local v18 = require(script.Parent.UndoRedoBar.useUndoRedoBarViewModel);
local l_IconName_0 = v11.Enums.IconName;
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v3.Utils.Constants;
local v23 = require(l_script_FirstAncestor_0.Enums.MenuItemEnum);
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local v25 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXAvatarSharingEntryPoint_0 = v25.FFlagAXAvatarSharingEntryPoint;
local l_FFlagAXPhotoboothFunctionality_0 = v25.FFlagAXPhotoboothFunctionality;
local l_FFlagAXMigrateBuilderIcons_0 = v25.FFlagAXMigrateBuilderIcons;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_Parent_0.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXResetAvatarButton_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXResetAvatarButton;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local function v35(v34) --[[ Line: 47 ]] --[[ Name: selectUserId ]]
    return v34.LocalUserId;
end;
return function(v36) --[[ Line: 61 ]] --[[ Name: useCustomizeControlBarProps ]]
    -- upvalues: v16 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), l_selectColorAdjustmentButtonColor_0 (copy), v6 (copy), v35 (copy), l_useLocalization_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_FFlagAXAvatarSharingEntryPoint_0 (copy), l_FFlagAXPhotoboothFunctionality_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), v23 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v10 (copy), l_FFlagAXResetAvatarButton_0 (copy), v18 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_IconName_0 (copy)
    local v37 = v16();
    local v38 = l_useNavigation_0();
    local v39 = l_useSelector_0(l_selectColorAdjustmentButtonColor_0);
    local v40 = v6.useOrientation() == v6.Keys.Portrait;
    local v41 = l_useSelector_0(v35);
    local v42 = l_useLocalization_0({
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
    local v43 = v2.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        v38.navigate(l_AvatarScreen_0.AvatarSwitcher);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.Main.AvatarSwitcher);
    end, {
        v38
    });
    local v44 = v2.useCallback(function() --[[ Line: 90 ]]
        -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        v38.navigate(l_AvatarScreen_0.AccessoryAdjustment);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.AvatarRefinement.AdjustAccessory);
    end, {
        v38
    });
    local v45 = v2.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        v38.navigate(l_AvatarScreen_0.BodyShape);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.AvatarRefinement.BodyScale);
    end, {
        v38
    });
    local v46 = v2.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        v38.navigate(l_AvatarScreen_0.HeadRefinement);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.AvatarRefinement.CustomizeHead);
    end, {
        v38
    });
    local v47 = v2.useCallback(function() --[[ Line: 105 ]]
        -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        v38.navigate(l_AvatarScreen_0.LayeredClothingSort);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.AvatarRefinement.ClothingLayers);
    end, {
        v38
    });
    local v48 = if l_FFlagAXCustomizeMakeupSupport_0 then v2.useCallback(function() --[[ Line: 111 ]]
        -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        v38.navigate(l_AvatarScreen_0.LayeredMakeupSort);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.AvatarRefinement.MakeupLayers);
    end, {
        v38
    }) else nil;
    local v49 = v2.useCallback(function() --[[ Line: 117 ]]
        -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        v38.navigate(l_AvatarScreen_0.ColorAdjustment);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.AvatarRefinement.ColorAdjustment);
    end, {
        v38
    });
    local v50 = nil;
    local v51 = nil;
    if l_FFlagAXAvatarSharingEntryPoint_0 then
        v50 = v2.useCallback(function() --[[ Line: 124 ]]
            -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
            local v52 = if v38.state and v38.state.key then v38.state.key else nil;
            v38.navigate(l_AvatarScreen_0.LookComposerPage, {
                prevNavPage = v52
            });
            l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.SharedCommunityAvatars.ShareAvatar);
        end, {
            v38
        });
        v51 = v2.useCallback(function() --[[ Line: 132 ]]
            -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
            v38.navigate(l_AvatarScreen_0.MySharedAvatars);
            l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.SharedCommunityAvatars.MyPublishedAvatars);
        end, {
            v38
        });
    end;
    local v53 = v2.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v36 (copy), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        if v36.onInventoryActivated then
            v36.onInventoryActivated();
        end;
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.More.Inventory);
    end, {
        v36.onInventoryActivated
    });
    local v54 = v2.useCallback(function() --[[ Line: 145 ]]
        -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        v38.navigate(l_AvatarScreen_0.EditEmotes);
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.More.Emotes);
    end, {
        v38
    });
    local v56 = v2.useCallback(function() --[[ Line: 150 ]]
        -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
        local v55 = if v38.state and v38.state.key then v38.state.key else nil;
        v38.navigate(l_AvatarScreen_0.ProfilePictureEditorEmotes, {
            prevNavPage = v55
        });
        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.More.ProfilePhoto);
    end, {
        v38
    });
    local v57 = nil;
    if l_FFlagAXPhotoboothFunctionality_0 then
        v57 = v2.useCallback(function() --[[ Line: 161 ]]
            -- upvalues: v38 (copy), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
            v38.navigate(l_AvatarScreen_0.Photobooth);
            l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.Photobooth.Photobooth);
        end, {
            v38
        });
    end;
    local v58 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v10.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
    local v59 = if l_FFlagAXResetAvatarButton_0 then v18() else nil;
    return {
        config = v2.useMemo(function() --[[ Line: 174 ]]
            -- upvalues: v23 (ref), v36 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v41 (copy), l_AvatarHeadShot_0 (ref), l_FFlagAXRootSlotBasedEditorFlag_0 (ref), v56 (copy), v43 (copy), l_FFlagAXMigrateBuilderIcons_0 (ref), l_IconName_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v42 (copy), v58 (copy), v37 (copy), v44 (copy), v45 (copy), v46 (copy), v47 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v48 (copy), v39 (copy), v49 (copy), l_FFlagAXAvatarSharingEntryPoint_0 (ref), v50 (ref), v51 (ref), v53 (copy), v40 (copy), v54 (copy), l_FFlagAXPhotoboothFunctionality_0 (ref), v57 (ref), l_FFlagAXResetAvatarButton_0 (ref), v59 (copy)
            local v60 = {
                {
                    type = "image", 
                    id = v23.Main.AvatarSwitcher, 
                    thumbnailUrl = if v36.thumbnailUrl then v36.thumbnailUrl else l_getRbxthumbWithTypeSizeAndOptions_0(v41, l_AvatarHeadShot_0, 150, true, true), 
                    onActivated = if l_FFlagAXRootSlotBasedEditorFlag_0 then v56 else v43, 
                    hideIndicator = l_FFlagAXRootSlotBasedEditorFlag_0 and true or nil, 
                    enableFocusAnimation = if v36.focusAnimation then v36.focusAnimation.enabled and v36.focusAnimation.menuItemId == v23.Main.AvatarSwitcher else nil
                }, 
                {
                    type = "icon", 
                    id = v23.Main.AvatarRefinement, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PersonStandingGear else "icons/menu/customize", 
                    onActivated = function() --[[ Line: 201 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
                        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.Main.AvatarRefinement);
                    end, 
                    children = {
                        {
                            type = "icon", 
                            id = v23.AvatarRefinement.AdjustAccessory, 
                            text = v42.adjustAccessory, 
                            icon = v58 and "icons/menu/transform-small" or if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HatFedora else "icons/menu/clothing/hats_off", 
                            iconSize = v37.defaultLegacyIconSize, 
                            onActivated = v44
                        }, 
                        {
                            type = "icon", 
                            id = v23.AvatarRefinement.BodyScale, 
                            text = v42.bodyShape, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off", 
                            iconSize = v37.defaultLegacyIconSize, 
                            onActivated = v45
                        }, 
                        {
                            type = "icon", 
                            id = v23.AvatarRefinement.CustomizeHead, 
                            text = v42.headAdjustment, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_off", 
                            iconSize = v37.defaultLegacyIconSize, 
                            onActivated = v46
                        }, 
                        {
                            type = "icon", 
                            id = v23.AvatarRefinement.ClothingLayers, 
                            text = v42.clothingLayering, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ClothesHanger else "icons/menu/clothing/clothing_off", 
                            iconSize = v37.defaultLegacyIconSize, 
                            onActivated = v47
                        }, 
                        if l_FFlagAXCustomizeMakeupSupport_0 then {
                            type = "icon", 
                            id = v23.AvatarRefinement.MakeupLayers, 
                            text = v42.makeupLayering, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off", 
                            iconSize = v37.defaultLegacyIconSize, 
                            onActivated = v48
                        } else nil, 
                        if v39 then {
                            type = "color", 
                            id = v23.AvatarRefinement.ColorAdjustment, 
                            text = v42.skinColor, 
                            colors = {
                                v39
                            }, 
                            colorSize = v37.defaultLegacyIconSize, 
                            onActivated = v49
                        } else nil
                    }
                }, 
                if l_FFlagAXAvatarSharingEntryPoint_0 then {
                    type = "icon", 
                    id = v23.Main.SharedCommunityAvatars, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.CirclePlus else "icons/actions/edit/add", 
                    onActivated = function() --[[ Line: 276 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
                        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.Main.SharedCommunityAvatars);
                    end, 
                    children = {
                        {
                            type = "icon", 
                            id = v23.SharedCommunityAvatars.ShareAvatar, 
                            text = v42.shareAvatar, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.PlusLarge else "icons/common/plus_heavy", 
                            iconSize = v37.defaultLegacyIconSize, 
                            onActivated = v50
                        }, 
                        {
                            type = "icon", 
                            id = v23.SharedCommunityAvatars.MyPublishedAvatars, 
                            text = v42.myPublishedAvatars, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.Person else "icons/actions/friend_sort/my_profile", 
                            iconSize = v37.defaultLegacyIconSize, 
                            onActivated = v51
                        }
                    }
                } else nil, 
                if not l_FFlagAXRootSlotBasedEditorFlag_0 then {
                    type = "icon", 
                    id = v23.Main.More, 
                    icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ThreeBarsHorizontal else "icons/common/hamburgermenu", 
                    onActivated = function() --[[ Line: 310 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v23 (ref)
                        l_SlotBasedEditorAnalytics_0.trackControlBarClick(v23.Main.More);
                    end, 
                    visible = not l_FFlagAXRootSlotBasedEditorFlag_0, 
                    children = {
                        {
                            type = "icon", 
                            id = v23.More.Inventory, 
                            text = v42.inventory, 
                            icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.Backpack else "icons/menu/inventoryOff", 
                            onActivated = v53, 
                            visible = v40
                        }, 
                        if not l_FFlagAXRootSlotBasedEditorFlag_0 then {
                            type = "icon", 
                            id = v23.More.Emotes, 
                            text = v42.emotes, 
                            icon = "icons/controls/emoteOff", 
                            onActivated = v54
                        } else nil, 
                        if l_FFlagAXPhotoboothFunctionality_0 then {
                            type = "icon", 
                            id = v23.Photobooth.Photobooth, 
                            text = if v42.photobooth then v42.photobooth else "Photobooth", 
                            icon = "icons/controls/screenshot", 
                            onActivated = v57
                        } else nil
                    }
                } else nil
            };
            if l_FFlagAXResetAvatarButton_0 and v36.showUndoRedo then
                table.insert(v60, {
                    type = "divider", 
                    id = v23.UndoRedoDivider
                });
                for _, v62 in v59.items do
                    table.insert(v60, v62);
                end;
            end;
            return v60;
        end, {
            v41, 
            v43, 
            v44, 
            v45, 
            v46, 
            v47, 
            v53, 
            v54, 
            v56, 
            v49, 
            v39, 
            v40, 
            v36.thumbnailUrl, 
            v36.focusAnimation, 
            if l_FFlagAXResetAvatarButton_0 then v36.showUndoRedo else nil, 
            if l_FFlagAXResetAvatarButton_0 then v59 else nil
        })
    };
end;