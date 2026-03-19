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
local _ = require(script.Parent.InventoryItemCard);
local l_useMakeupFtux_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Hooks.useMakeupFtux;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v10.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_MAX_MAKEUP_LAYERS_0 = v10.Constants.MAX_MAKEUP_LAYERS;
local l_selectEquippedLayeredMakeupAssets_0 = v10.State.Selectors.selectEquippedLayeredMakeupAssets;
local function v53(v52) --[[ Line: 94 ]] --[[ Name: selectIsR6 ]]
    -- upvalues: v17 (copy)
    return v52.AvatarExperience.AvatarEditor.Character.AvatarType == v17.AvatarType.R6;
end;
return function(v54) --[[ Line: 98 ]] --[[ Name: useInventoryItemCardProps ]]
    -- upvalues: v20 (copy), v21 (copy), v22 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_InventoryItemType_0 (copy), v16 (copy), l_useSelector_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_useMakeupFtux_0 (copy), l_selectEquippedLayeredMakeupAssets_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_getRemainingTimeFromExpiration_0 (copy), l_useLocalization_0 (copy), v53 (copy), v35 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXFixStaleModerationStatusFromGrant_0 (copy), v28 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v17 (copy), v23 (copy), l_useSlotBasedEditorContext_0 (copy), l_SlotType_0 (copy), v18 (copy), v30 (copy), v31 (copy), v26 (copy), v19 (copy), v40 (copy), l_AvatarScreen_0 (copy), v25 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_InventoryItemAvailability_0 (copy), v37 (copy), v27 (copy), v24 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v3 (copy), v36 (copy), v29 (copy)
    local v55 = v20(v21);
    local v56 = v20(v22);
    local v57 = l_useDispatch_0();
    local v58 = l_useNavigation_0();
    local v59 = l_useAvatarRoute_0();
    local v60 = v2.useRef(nil);
    local v61 = v59 and v59.opaque and v59.opaque.name;
    local l_inventoryItemType_0 = v54.inventoryItemType;
    local v64 = v2.useCallback(function(v63) --[[ Line: 109 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v16 (ref), v54 (copy)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Asset then
            return (v16(v63.AvatarExperience.Common, v54.itemId, l_inventoryItemType_0));
        else
            return nil;
        end;
    end, {
        l_inventoryItemType_0, 
        v54.itemId
    });
    local v65 = l_useSelector_0(v64);
    local v66 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useMakeupFtux_0() else nil;
    local v67 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useSelector_0(l_selectEquippedLayeredMakeupAssets_0) else nil;
    local v68 = nil;
    if l_FFlagAXInventoryDurablesSupport_0 then
        local v69 = if v65 then l_getRemainingTimeFromExpiration_0(v65.expirationTime) else nil;
        local v70 = l_useLocalization_0({
            days = if v69 and v69.unit == "days" then {
                "Feature.Durables.TimeRemaining.Days"; 
                number = v69.value
            } else nil, 
            hours = if v69 and v69.unit == "hours" then {
                "Feature.Durables.TimeRemaining.Hours"; 
                number = v69.value
            } else nil, 
            minutes = if v69 and v69.unit == "minutes" then {
                "Feature.Durables.TimeRemaining.Minutes"; 
                number = v69.value
            } else nil
        });
        v68 = if v69 then v70[v69.unit] else nil;
    end;
    local v72 = v2.useCallback(function(v71) --[[ Line: 142 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v54 (copy)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit then
            return v71.AvatarExperience.AvatarEditor.OutfitInfos[v54.itemId];
        else
            return nil;
        end;
    end, {
        l_inventoryItemType_0, 
        v54.itemId
    });
    local v73 = l_useSelector_0(v72);
    local v74 = l_useSelector_0(v53);
    local v75 = l_useSelector_0(v35);
    local v76 = if v65 then v65.name else if v73 then v73.name else nil;
    local v77 = if v65 then v65.assetType else nil;
    local v78 = if l_FFlagAXModeratedItemsFlow_0 and v73 then v73.inventoryType else nil;
    local v79 = if v65 then v65.moderationStatus else nil;
    if l_FFlagAXFixStaleModerationStatusFromGrant_0 and not (v65 and v65.creatingUniverseId ~= nil and string.len(v65.creatingUniverseId) > 0) and v54.availabilityStatus ~= nil then
        v79 = v28.getModerationStatusFromAvailabilityStatus(v54.availabilityStatus);
    end;
    local v80 = if v65 then v65.updateCounter else nil;
    local v81 = if l_FFlagAXRootSlotBasedEditorFlag_0 then nil else v73 ~= nil and (v73.containsDynamicHead or v73.outfitType == v17.OutfitTypes.DynamicHead);
    local v85 = v2.useCallback(function(v82, v83, v84) --[[ Line: 175 ]]
        -- upvalues: v57 (copy), v23 (ref)
        v57(v23(v82, v83, v84));
    end, {
        v57
    });
    local v86 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useSlotBasedEditorContext_0() else nil;
    local v94 = v2.useCallback(function() --[[ Line: 183 ]]
        -- upvalues: v54 (copy), v77 (copy), v55 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v86 (copy), l_SlotType_0 (ref), v85 (copy), v57 (copy), v18 (ref), v58 (copy), v30 (ref), v61 (copy), v31 (ref), v26 (ref)
        if v54.itemId and v77 then
            local v87 = if v54.isSelected then v55.unequipAsset else v55.equipAsset;
            local v88 = nil;
            local v89 = nil;
            local v90 = nil;
            if l_FFlagAXCustomizeMakeupSupport_0 and v86 then
                local v91 = v86.signalStore.getSlotIndex();
                v90 = v86.signalStore.getSlots()[v91];
                if not v54.isSelected and v90 and v90.slotType == l_SlotType_0.LayeredSlot then
                    v88 = v90.layerIndex;
                    v89 = {};
                    for _, v93 in v90.assetTypes do
                        table.insert(v89, (tostring(v93.Value)));
                    end;
                end;
            end;
            v85(v87, v54.itemId, v77);
            v57(v18(v77, v54.itemId, v58, nil, v88, nil, if l_FFlagAXCustomizeMakeupSupport_0 then v89 else nil));
            v57(v30(v55, v61, v31.None));
            if l_FFlagAXCustomizeMakeupSupport_0 and v54.isSelected and v90 and v90.slotType ~= l_SlotType_0.LayeredSlot then
                v57(v26());
            end;
        end;
    end, if l_FFlagAXCustomizeMakeupSupport_0 then {
        v54.itemId, 
        v77, 
        v54.isSelected, 
        v55, 
        v85, 
        v57, 
        v58, 
        v61, 
        v86
    } else {
        v54.itemId, 
        v77, 
        v54.isSelected, 
        v55, 
        v85, 
        v57, 
        v58, 
        v61
    });
    local v96 = v2.useCallback(function() --[[ Line: 259 ]]
        -- upvalues: v73 (copy), v55 (copy), v58 (copy), v54 (copy), v57 (copy), v30 (ref), v61 (copy), v31 (ref), v19 (ref)
        if v73 then
            local v95 = {
                outfitInfo = v73, 
                analytics = v55, 
                navigation = v58, 
                isSelected = v54.isSelected
            };
            v57(v30(v55, v61, v31.None));
            v57(v19(v95));
        end;
    end, {
        v73, 
        v77, 
        v55, 
        v58, 
        v54.isSelected, 
        v57, 
        v61
    });
    local v104 = v2.useCallback(function() --[[ Line: 278 ]]
        -- upvalues: v54 (copy), v74 (copy), v77 (copy), v17 (ref), v73 (copy), v40 (ref), v58 (copy), l_AvatarScreen_0 (ref), v96 (copy), v94 (copy), v57 (copy), v25 (ref), v28 (ref)
        if not v54.itemId or not v74 or v54.isSelected then
            return false;
        else
            local v97 = v77 == v17.AssetTypeIdStrings.HairAccessory;
            local v98 = v73 and v73.outfitType == v17.OutfitTypes.Shoes;
            local v99 = v77 and v17.LayeredAssetTypes[v77] ~= nil;
            local v100 = if v40 then v73 and v73.outfitType == v17.OutfitTypes.Avatar and v73.avatarType == v17.AvatarType.R15 else nil;
            if v99 and not v97 or v98 or v100 then
                v57(v25(function() --[[ Line: 293 ]]
                    -- upvalues: v58 (ref), l_AvatarScreen_0 (ref), v98 (copy), v100 (copy), v96 (ref), v94 (ref)
                    v58.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                        bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                        onSwitchSelected = if not not v98 or v100 then v96 else v94
                    });
                end));
                return true;
            else
                local v101 = v77 == v17.AssetTypeIdStrings.EmoteAnimation;
                local v102 = v28.isAnimationAssetType(v77);
                if v101 or v102 then
                    local v103 = v101 and "Feature.Avatar.Message.R15EmotesPrompt" or "Feature.Avatar.Message.R15AnimationsPrompt";
                    v57(v25(function() --[[ Line: 310 ]]
                        -- upvalues: v58 (ref), l_AvatarScreen_0 (ref), v103 (copy)
                        v58.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                            bodyTextKey = v103
                        });
                    end));
                    return false;
                else
                    return false;
                end;
            end;
        end;
    end, {
        v54.itemId, 
        v77, 
        v73, 
        v74, 
        v54.isSelected, 
        v58, 
        v94, 
        v96, 
        v57
    });
    local v111 = if l_FFlagAXCustomizeMakeupSupport_0 then v2.useCallback(function() --[[ Line: 335 ]]
        -- upvalues: v86 (copy), l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v77 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (ref), l_SlotType_0 (ref), v67 (copy), l_MAX_MAKEUP_LAYERS_0 (ref), v66 (copy), v54 (copy), v58 (copy), l_AvatarScreen_0 (ref), v94 (copy)
        if not v86 then
            return false;
        else
            local v105 = v86.signalStore.getSlots();
            local v106 = v86.signalStore.getSlotIndex();
            local v107 = false;
            if l_inventoryItemType_0 == l_InventoryItemType_0.Asset then
                v107 = v77 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v77];
            end;
            local v108 = v106 and v105 and v105[v106] and v105[v106].slotType == l_SlotType_0.LayeredSlot;
            local v109 = v67 and #v67 == l_MAX_MAKEUP_LAYERS_0;
            if v66 and v66.shouldShowMakeupMax6LayersPrompt() and not v54.isSelected and v107 and v106 and not v108 and v109 then
                v58.navigate(l_AvatarScreen_0.MakeupMax6LayersPrompt, {
                    onConfirm = function(v110) --[[ Line: 362 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v66 (ref), v94 (ref)
                        if v110 then
                            v66.hideMakeupMax6LayersPrompt();
                        end;
                        v94();
                    end
                });
                return true;
            else
                return false;
            end;
        end;
    end, {
        v66, 
        v77, 
        v54.isSelected, 
        v67, 
        v86, 
        v58, 
        v94, 
        l_inventoryItemType_0
    }) else nil;
    local v112 = v2.useCallback(function() --[[ Line: 388 ]]
        -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (ref), v104 (copy), v111 (copy), l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v54 (copy), v94 (copy), v73 (copy), v96 (copy)
        if if l_FFlagAXCustomizeMakeupSupport_0 then v104() or v111() else v104() then
            return;
        elseif l_inventoryItemType_0 == l_InventoryItemType_0.Asset and v54.itemId then
            v94();
            return;
        else
            if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit and v73 then
                v96();
            end;
            return;
        end;
    end, if l_FFlagAXCustomizeMakeupSupport_0 then {
        l_inventoryItemType_0, 
        v54.itemId, 
        v94, 
        v73, 
        v96, 
        v111
    } else {
        l_inventoryItemType_0, 
        v54.itemId, 
        v94, 
        v73, 
        v96
    });
    local v113 = nil;
    local v117 = v2.useCallback(function(v114) --[[ Line: 416 ]]
        -- upvalues: v77 (copy), v17 (ref), v78 (copy), l_FFlagAXModeratedItemsFlow_0 (ref), v58 (copy), l_AvatarScreen_0 (ref), l_inventoryItemType_0 (copy), v76 (copy)
        local v115 = if v77 then v17.AssetTypeIdStringToName[v77] else v78;
        local v116 = nil;
        if l_FFlagAXModeratedItemsFlow_0 then
            v116 = if v77 then v17.AssetTypeLocalized[v77] else "Feature.Catalog.Label.Bundle";
        end;
        v58.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = {
                {
                    category = if l_FFlagAXModeratedItemsFlow_0 then v115 else l_inventoryItemType_0, 
                    categoryLoc = v116, 
                    itemName = v76
                }
            }, 
            messageType = v114
        });
    end, {
        v58, 
        v79, 
        v76, 
        v77, 
        v78
    });
    if v28.isModerationPendingOrRejected(v79) then
        local v118 = if v79 == Enum.ModerationStatus.NotReviewed then l_CatalogItemCardStatusIconTypeEnum_0.PendingModeration else l_CatalogItemCardStatusIconTypeEnum_0.Moderated;
        v113 = {
            type = "placeholder", 
            iconType = v118
        };
        v112 = function() --[[ Line: 448 ]]
            -- upvalues: v28 (ref), v79 (ref), v117 (copy)
            local v119 = v28.getMessageTypeFromModerationStatus(v79);
            if not v119 then
                error("ItemsUnavailablePrompt prop messageType cannot be nil");
            end;
            v117(v119);
        end;
    end;
    if l_FFlagAXModeratedItemsFlow_0 and v54.availabilityStatus == l_InventoryItemAvailability_0.Unavailable then
        v113 = {
            type = "placeholder", 
            iconType = "Error"
        };
        v112 = function() --[[ Line: 463 ]]
            -- upvalues: v117 (copy)
            v117("UnavailableItems");
        end;
    end;
    local v120 = v73 and v73.creatingUniverseId ~= nil and string.len(v73.creatingUniverseId) > 0;
    local v121 = true;
    if l_inventoryItemType_0 ~= l_InventoryItemType_0.Asset then
        v121 = v120;
    end;
    local v124 = v2.useCallback(function() --[[ Line: 475 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v54 (copy), v75 (copy), v37 (ref), v58 (copy), l_AvatarScreen_0 (ref), v57 (copy), v25 (ref), v17 (ref), v27 (ref), v65 (copy), v56 (copy), v59 (copy), v24 (ref)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit then
            local v122 = {
                outfitId = v54.itemId, 
                ZIndex = 2, 
                showFullWithNoPeekView = not v75, 
                renderBottomBar = false, 
                NextSelectionLeft = if v75 then v54.resultsListRef else nil
            };
            v57(v25(function() --[[ Line: 486 ]]
                -- upvalues: v37 (ref), v58 (ref), l_AvatarScreen_0 (ref), v122 (copy)
                v37.closeFiltersAndItemDetails(v58);
                v37.closeTryOnManager(v58);
                v58.navigate(l_AvatarScreen_0.OutfitDetails, v122);
            end));
            return;
        else
            if l_inventoryItemType_0 == l_InventoryItemType_0.Asset and v54.itemId then
                local v123 = {
                    itemId = v54.itemId, 
                    itemType = v17.ItemType.Asset, 
                    itemSubType = v27.GetItemSubType(l_inventoryItemType_0, v65), 
                    priceInRobux = if v65 then v65.priceInRobux else nil, 
                    catalogAnalytics = v56, 
                    avatarRoute = v59, 
                    navigation = v58, 
                    itemDetailsPeekViewRefs = v54.itemDetailsPeekViewRefs, 
                    resultsListRef = v54.resultsListRef, 
                    showFullWithNoPeekView = true, 
                    closePreviousItemDetails = true
                };
                v57(v24(v123));
            end;
            return;
        end;
    end, {
        l_inventoryItemType_0, 
        v54.itemId, 
        v75, 
        v65, 
        v56, 
        v59, 
        v58, 
        v54.itemDetailsPeekViewRefs, 
        v54.resultsListRef, 
        v57
    });
    local v125 = {
        itemId = v54.itemId, 
        inventoryItemType = l_inventoryItemType_0, 
        itemName = v76 or "", 
        showDynamicHeadIcon = if l_FFlagAXRootSlotBasedEditorFlag_0 then nil else v81, 
        isSelected = v54.isSelected, 
        thumbnailRef = v60, 
        onActivated = v112, 
        onDetailsButtonActivated = if v121 then v124 else nil, 
        impressionsTag = v54.impressionsTag, 
        gridInformation = v54.gridInformation, 
        assetType = if v77 then tonumber(v77) else nil, 
        outfitType = if l_FFlagAXModeratedItemsFlow_0 then v78 else nil, 
        hideName = v54.hideName or false, 
        availabilityStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v54.availabilityStatus else nil, 
        moderationStatus = v79, 
        updateCounter = v80, 
        itemStatus = v113, 
        expirationTime = if l_FFlagAXInventoryDurablesSupport_0 then v68 else nil
    };
    v2.useEffect(function() --[[ Line: 550 ]]
        -- upvalues: v60 (copy), v3 (ref), v125 (copy), l_InventoryItemType_0 (ref), v36 (ref), v54 (copy), v29 (ref)
        if v60.current then
            local v126 = v3.Dictionary.join(v125, {
                itemType = v125.inventoryItemType == l_InventoryItemType_0.Asset and "Asset" or v125.inventoryItemType == l_InventoryItemType_0.Outfit and "Bundle" or nil
            });
            v60.current:SetAttribute(v126.impressionsTag, v126.itemId);
            local v127 = v36[v54.impressionsSchema];
            v29.writeItemAttributes(v127, v60.current, v126);
        end;
    end, {
        v125, 
        v54.impressionsSchema
    });
    return v125;
end;