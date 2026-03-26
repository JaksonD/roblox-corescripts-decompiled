local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_InventoryItemType_0 = v9.Enums.InventoryItemType;
local l_InventoryItemAvailability_0 = v9.Enums.InventoryItemAvailability;
local l_CatalogItemCardStatusIconTypeEnum_0 = v10.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v16 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v20 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local v24 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v25 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v28 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v30 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v31 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_getRemainingTimeFromExpiration_0 = v9.Utils.getRemainingTimeFromExpiration;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v35 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_useSlotBasedEditorContext_0 = v9.Context.useSlotBasedEditorContext;
local l_SlotType_0 = v9.Enums.SlotType;
local v40 = game:DefineFastFlag("AXR15PromptBeforeApplyingAvatar", false);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXFixStaleModerationStatusFromGrant_0 = v11.FFlagAXFixStaleModerationStatusFromGrant;
local l_FFlagAXInventoryDurablesSupport_0 = v11.FFlagAXInventoryDurablesSupport;
local l_FFlagAXCustomizeMakeupSupport_0 = v11.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXBlockMakeupEquipR6_0 = v11.FFlagAXBlockMakeupEquipR6;
local l_FFlagAXMISEnableMultiShopping_0 = v11.FFlagAXMISEnableMultiShopping;
local _ = require(script.Parent.InventoryItemCard);
local l_useMakeupFtux_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Hooks.useMakeupFtux;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v10.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_MAX_MAKEUP_LAYERS_0 = v10.Constants.MAX_MAKEUP_LAYERS;
local l_selectEquippedLayeredMakeupAssets_0 = v10.State.Selectors.selectEquippedLayeredMakeupAssets;
local function v55(v54) --[[ Line: 97 ]] --[[ Name: selectIsR6 ]]
    -- upvalues: v17 (copy)
    return v54.AvatarExperience.AvatarEditor.Character.AvatarType == v17.AvatarType.R6;
end;
return function(v56) --[[ Line: 101 ]] --[[ Name: useInventoryItemCardProps ]]
    -- upvalues: v20 (copy), v21 (copy), v22 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_InventoryItemType_0 (copy), v16 (copy), l_useSelector_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_useMakeupFtux_0 (copy), l_selectEquippedLayeredMakeupAssets_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_getRemainingTimeFromExpiration_0 (copy), l_useLocalization_0 (copy), v55 (copy), v35 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXFixStaleModerationStatusFromGrant_0 (copy), v28 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v17 (copy), v23 (copy), l_useSlotBasedEditorContext_0 (copy), l_SlotType_0 (copy), v18 (copy), v30 (copy), v31 (copy), v26 (copy), v19 (copy), l_FFlagAXBlockMakeupEquipR6_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), v40 (copy), l_AvatarScreen_0 (copy), v25 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_InventoryItemAvailability_0 (copy), v37 (copy), v27 (copy), v24 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v3 (copy), v36 (copy), v29 (copy)
    local v57 = v20(v21);
    local v58 = v20(v22);
    local v59 = l_useDispatch_0();
    local v60 = l_useNavigation_0();
    local v61 = l_useAvatarRoute_0();
    local v62 = v2.useRef(nil);
    local v63 = v61 and v61.opaque and v61.opaque.name;
    local l_inventoryItemType_0 = v56.inventoryItemType;
    local v66 = v2.useCallback(function(v65) --[[ Line: 112 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v16 (ref), v56 (copy)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Asset then
            return (v16(v65.AvatarExperience.Common, v56.itemId, l_inventoryItemType_0));
        else
            return nil;
        end;
    end, {
        l_inventoryItemType_0, 
        v56.itemId
    });
    local v67 = l_useSelector_0(v66);
    local v68 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useMakeupFtux_0() else nil;
    local v69 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useSelector_0(l_selectEquippedLayeredMakeupAssets_0) else nil;
    local v70 = nil;
    if l_FFlagAXInventoryDurablesSupport_0 then
        local v71 = if v67 then l_getRemainingTimeFromExpiration_0(v67.expirationTime) else nil;
        local v72 = l_useLocalization_0({
            days = if v71 and v71.unit == "days" then {
                "Feature.Durables.TimeRemaining.Days"; 
                number = v71.value
            } else nil, 
            hours = if v71 and v71.unit == "hours" then {
                "Feature.Durables.TimeRemaining.Hours"; 
                number = v71.value
            } else nil, 
            minutes = if v71 and v71.unit == "minutes" then {
                "Feature.Durables.TimeRemaining.Minutes"; 
                number = v71.value
            } else nil
        });
        v70 = if v71 then v72[v71.unit] else nil;
    end;
    local v74 = v2.useCallback(function(v73) --[[ Line: 145 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v56 (copy)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit then
            return v73.AvatarExperience.AvatarEditor.OutfitInfos[v56.itemId];
        else
            return nil;
        end;
    end, {
        l_inventoryItemType_0, 
        v56.itemId
    });
    local v75 = l_useSelector_0(v74);
    local v76 = l_useSelector_0(v55);
    local v77 = l_useSelector_0(v35);
    local v78 = if v67 then v67.name else if v75 then v75.name else nil;
    local v79 = if v67 then v67.assetType else nil;
    local v80 = if l_FFlagAXModeratedItemsFlow_0 and v75 then v75.inventoryType else nil;
    local v81 = if v67 then v67.moderationStatus else nil;
    if l_FFlagAXFixStaleModerationStatusFromGrant_0 and not (v67 and v67.creatingUniverseId ~= nil and string.len(v67.creatingUniverseId) > 0) and v56.availabilityStatus ~= nil then
        v81 = v28.getModerationStatusFromAvailabilityStatus(v56.availabilityStatus);
    end;
    local v82 = if v67 then v67.updateCounter else nil;
    local v83 = if l_FFlagAXRootSlotBasedEditorFlag_0 then nil else v75 ~= nil and (v75.containsDynamicHead or v75.outfitType == v17.OutfitTypes.DynamicHead);
    local v87 = v2.useCallback(function(v84, v85, v86) --[[ Line: 178 ]]
        -- upvalues: v59 (copy), v23 (ref)
        v59(v23(v84, v85, v86));
    end, {
        v59
    });
    local v88 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useSlotBasedEditorContext_0() else nil;
    local v96 = v2.useCallback(function() --[[ Line: 186 ]]
        -- upvalues: v56 (copy), v79 (copy), v57 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v88 (copy), l_SlotType_0 (ref), v87 (copy), v59 (copy), v18 (ref), v60 (copy), v30 (ref), v63 (copy), v31 (ref), v26 (ref)
        if v56.itemId and v79 then
            local v89 = if v56.isSelected then v57.unequipAsset else v57.equipAsset;
            local v90 = nil;
            local v91 = nil;
            local v92 = nil;
            if l_FFlagAXCustomizeMakeupSupport_0 and v88 then
                local v93 = v88.signalStore.getSlotIndex();
                v92 = v88.signalStore.getSlots()[v93];
                if not v56.isSelected and v92 and v92.slotType == l_SlotType_0.LayeredSlot then
                    v90 = v92.layerIndex;
                    v91 = {};
                    for _, v95 in v92.assetTypes do
                        table.insert(v91, (tostring(v95.Value)));
                    end;
                end;
            end;
            v87(v89, v56.itemId, v79);
            v59(v18(v79, v56.itemId, v60, nil, v90, nil, if l_FFlagAXCustomizeMakeupSupport_0 then v91 else nil));
            v59(v30(v57, v63, v31.None));
            if l_FFlagAXCustomizeMakeupSupport_0 and v56.isSelected and v92 and v92.slotType ~= l_SlotType_0.LayeredSlot then
                v59(v26());
            end;
        end;
    end, if l_FFlagAXCustomizeMakeupSupport_0 then {
        v56.itemId, 
        v79, 
        v56.isSelected, 
        v57, 
        v87, 
        v59, 
        v60, 
        v63, 
        v88
    } else {
        v56.itemId, 
        v79, 
        v56.isSelected, 
        v57, 
        v87, 
        v59, 
        v60, 
        v63
    });
    local v98 = v2.useCallback(function() --[[ Line: 262 ]]
        -- upvalues: v75 (copy), v57 (copy), v60 (copy), v56 (copy), v59 (copy), v30 (ref), v63 (copy), v31 (ref), v19 (ref)
        if v75 then
            local v97 = {
                outfitInfo = v75, 
                analytics = v57, 
                navigation = v60, 
                isSelected = v56.isSelected
            };
            v59(v30(v57, v63, v31.None));
            v59(v19(v97));
        end;
    end, {
        v75, 
        v79, 
        v57, 
        v60, 
        v56.isSelected, 
        v59, 
        v63
    });
    local v107 = v2.useCallback(function() --[[ Line: 281 ]]
        -- upvalues: v56 (copy), v76 (copy), v79 (copy), v17 (ref), v75 (copy), l_FFlagAXBlockMakeupEquipR6_0 (ref), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (ref), v40 (ref), v60 (copy), l_AvatarScreen_0 (ref), v98 (copy), v96 (copy), v59 (copy), v25 (ref), v28 (ref)
        if not v56.itemId or not v76 or v56.isSelected then
            return false;
        else
            local v99 = v79 == v17.AssetTypeIdStrings.HairAccessory;
            local v100 = v75 and v75.outfitType == v17.OutfitTypes.Shoes;
            local v101 = v79 and v17.LayeredAssetTypes[v79] ~= nil;
            local v102 = if l_FFlagAXBlockMakeupEquipR6_0 then v79 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v79] else nil;
            local v103 = if v40 then v75 and v75.outfitType == v17.OutfitTypes.Avatar and v75.avatarType == v17.AvatarType.R15 else nil;
            if v101 and not v99 or v100 or v103 or v102 then
                v59(v25(function() --[[ Line: 299 ]]
                    -- upvalues: v60 (ref), l_AvatarScreen_0 (ref), v100 (copy), v103 (copy), v98 (ref), v96 (ref)
                    v60.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                        bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                        onSwitchSelected = if not not v100 or v103 then v98 else v96
                    });
                end));
                return true;
            else
                local v104 = v79 == v17.AssetTypeIdStrings.EmoteAnimation;
                local v105 = v28.isAnimationAssetType(v79);
                if v104 or v105 then
                    local v106 = v104 and "Feature.Avatar.Message.R15EmotesPrompt" or "Feature.Avatar.Message.R15AnimationsPrompt";
                    v59(v25(function() --[[ Line: 316 ]]
                        -- upvalues: v60 (ref), l_AvatarScreen_0 (ref), v106 (copy)
                        v60.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                            bodyTextKey = v106
                        });
                    end));
                    return false;
                else
                    return false;
                end;
            end;
        end;
    end, {
        v56.itemId, 
        v79, 
        v75, 
        v76, 
        v56.isSelected, 
        v60, 
        v96, 
        v98, 
        v59
    });
    local v114 = if l_FFlagAXCustomizeMakeupSupport_0 then v2.useCallback(function() --[[ Line: 341 ]]
        -- upvalues: v88 (copy), l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v79 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (ref), l_SlotType_0 (ref), v69 (copy), l_MAX_MAKEUP_LAYERS_0 (ref), v68 (copy), v56 (copy), v60 (copy), l_AvatarScreen_0 (ref), v96 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref)
        if not v88 then
            return false;
        else
            local v108 = v88.signalStore.getSlots();
            local v109 = v88.signalStore.getSlotIndex();
            local v110 = false;
            if l_inventoryItemType_0 == l_InventoryItemType_0.Asset then
                v110 = v79 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v79];
            end;
            local v111 = v109 and v108 and v108[v109] and v108[v109].slotType == l_SlotType_0.LayeredSlot;
            local v112 = v69 and #v69 == l_MAX_MAKEUP_LAYERS_0;
            if v68 and v68.shouldShowMakeupMax6LayersPrompt() and not v56.isSelected and v110 and v109 and not v111 and v112 then
                v60.navigate(l_AvatarScreen_0.MakeupMax6LayersPrompt, {
                    onConfirm = function(v113) --[[ Line: 368 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v68 (ref), v96 (ref)
                        if v113 then
                            v68.hideMakeupMax6LayersPrompt();
                        end;
                        v96();
                    end
                });
                if l_FFlagAXMISEnableMultiShopping_0 then
                    v68.incrementSeenMakeupMax6LayersPrompt();
                end;
                return true;
            else
                return false;
            end;
        end;
    end, {
        v68, 
        v79, 
        v56.isSelected, 
        v69, 
        v88, 
        v60, 
        v96, 
        l_inventoryItemType_0
    }) else nil;
    local v115 = v2.useCallback(function() --[[ Line: 399 ]]
        -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (ref), v107 (copy), v114 (copy), l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v56 (copy), v96 (copy), v75 (copy), v98 (copy)
        if if l_FFlagAXCustomizeMakeupSupport_0 then v107() or v114() else v107() then
            return;
        elseif l_inventoryItemType_0 == l_InventoryItemType_0.Asset and v56.itemId then
            v96();
            return;
        else
            if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit and v75 then
                v98();
            end;
            return;
        end;
    end, if l_FFlagAXCustomizeMakeupSupport_0 then {
        l_inventoryItemType_0, 
        v56.itemId, 
        v96, 
        v75, 
        v98, 
        v114
    } else {
        l_inventoryItemType_0, 
        v56.itemId, 
        v96, 
        v75, 
        v98
    });
    local v116 = nil;
    local v120 = v2.useCallback(function(v117) --[[ Line: 427 ]]
        -- upvalues: v79 (copy), v17 (ref), v80 (copy), l_FFlagAXModeratedItemsFlow_0 (ref), v60 (copy), l_AvatarScreen_0 (ref), l_inventoryItemType_0 (copy), v78 (copy)
        local v118 = if v79 then v17.AssetTypeIdStringToName[v79] else v80;
        local v119 = nil;
        if l_FFlagAXModeratedItemsFlow_0 then
            v119 = if v79 then v17.AssetTypeLocalized[v79] else "Feature.Catalog.Label.Bundle";
        end;
        v60.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = {
                {
                    category = if l_FFlagAXModeratedItemsFlow_0 then v118 else l_inventoryItemType_0, 
                    categoryLoc = v119, 
                    itemName = v78
                }
            }, 
            messageType = v117
        });
    end, {
        v60, 
        v81, 
        v78, 
        v79, 
        v80
    });
    if v28.isModerationPendingOrRejected(v81) then
        local v121 = if v81 == Enum.ModerationStatus.NotReviewed then l_CatalogItemCardStatusIconTypeEnum_0.PendingModeration else l_CatalogItemCardStatusIconTypeEnum_0.Moderated;
        v116 = {
            type = "placeholder", 
            iconType = v121
        };
        v115 = function() --[[ Line: 459 ]]
            -- upvalues: v28 (ref), v81 (ref), v120 (copy)
            local v122 = v28.getMessageTypeFromModerationStatus(v81);
            if not v122 then
                error("ItemsUnavailablePrompt prop messageType cannot be nil");
            end;
            v120(v122);
        end;
    end;
    if l_FFlagAXModeratedItemsFlow_0 and v56.availabilityStatus == l_InventoryItemAvailability_0.Unavailable then
        v116 = {
            type = "placeholder", 
            iconType = "Error"
        };
        v115 = function() --[[ Line: 474 ]]
            -- upvalues: v120 (copy)
            v120("UnavailableItems");
        end;
    end;
    local v123 = v75 and v75.creatingUniverseId ~= nil and string.len(v75.creatingUniverseId) > 0;
    local v124 = true;
    if l_inventoryItemType_0 ~= l_InventoryItemType_0.Asset then
        v124 = v123;
    end;
    local v127 = v2.useCallback(function() --[[ Line: 486 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v56 (copy), v77 (copy), v37 (ref), v60 (copy), l_AvatarScreen_0 (ref), v59 (copy), v25 (ref), v17 (ref), v27 (ref), v67 (copy), v58 (copy), v61 (copy), v24 (ref)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit then
            local v125 = {
                outfitId = v56.itemId, 
                ZIndex = 2, 
                showFullWithNoPeekView = not v77, 
                renderBottomBar = false, 
                NextSelectionLeft = if v77 then v56.resultsListRef else nil
            };
            v59(v25(function() --[[ Line: 497 ]]
                -- upvalues: v37 (ref), v60 (ref), l_AvatarScreen_0 (ref), v125 (copy)
                v37.closeFiltersAndItemDetails(v60);
                v37.closeTryOnManager(v60);
                v60.navigate(l_AvatarScreen_0.OutfitDetails, v125);
            end));
            return;
        else
            if l_inventoryItemType_0 == l_InventoryItemType_0.Asset and v56.itemId then
                local v126 = {
                    itemId = v56.itemId, 
                    itemType = v17.ItemType.Asset, 
                    itemSubType = v27.GetItemSubType(l_inventoryItemType_0, v67), 
                    priceInRobux = if v67 then v67.priceInRobux else nil, 
                    catalogAnalytics = v58, 
                    avatarRoute = v61, 
                    navigation = v60, 
                    itemDetailsPeekViewRefs = v56.itemDetailsPeekViewRefs, 
                    resultsListRef = v56.resultsListRef, 
                    showFullWithNoPeekView = true, 
                    closePreviousItemDetails = true
                };
                v59(v24(v126));
            end;
            return;
        end;
    end, {
        l_inventoryItemType_0, 
        v56.itemId, 
        v77, 
        v67, 
        v58, 
        v61, 
        v60, 
        v56.itemDetailsPeekViewRefs, 
        v56.resultsListRef, 
        v59
    });
    local v128 = {
        itemId = v56.itemId, 
        inventoryItemType = l_inventoryItemType_0, 
        itemName = v78 or "", 
        showDynamicHeadIcon = if l_FFlagAXRootSlotBasedEditorFlag_0 then nil else v83, 
        isSelected = v56.isSelected, 
        thumbnailRef = v62, 
        onActivated = v115, 
        onDetailsButtonActivated = if v124 then v127 else nil, 
        impressionsTag = v56.impressionsTag, 
        gridInformation = v56.gridInformation, 
        assetType = if v79 then tonumber(v79) else nil, 
        outfitType = if l_FFlagAXModeratedItemsFlow_0 then v80 else nil, 
        hideName = v56.hideName or false, 
        availabilityStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v56.availabilityStatus else nil, 
        moderationStatus = v81, 
        updateCounter = v82, 
        itemStatus = v116, 
        expirationTime = if l_FFlagAXInventoryDurablesSupport_0 then v70 else nil
    };
    v2.useEffect(function() --[[ Line: 561 ]]
        -- upvalues: v62 (copy), v3 (ref), v128 (copy), l_InventoryItemType_0 (ref), v36 (ref), v56 (copy), v29 (ref)
        if v62.current then
            local v129 = v3.Dictionary.join(v128, {
                itemType = v128.inventoryItemType == l_InventoryItemType_0.Asset and "Asset" or v128.inventoryItemType == l_InventoryItemType_0.Outfit and "Bundle" or nil
            });
            v62.current:SetAttribute(v129.impressionsTag, v129.itemId);
            local v130 = v36[v56.impressionsSchema];
            v29.writeItemAttributes(v130, v62.current, v129);
        end;
    end, {
        v128, 
        v56.impressionsSchema
    });
    return v128;
end;