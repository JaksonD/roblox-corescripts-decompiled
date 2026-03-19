local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useStore_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_InventoryItemType_0 = v10.Enums.InventoryItemType;
local l_InventoryItemAvailability_0 = v10.Enums.InventoryItemAvailability;
local l_CatalogItemCardStatusIconTypeEnum_0 = v11.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v17 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v21 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local v25 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v26 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v28 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v30 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v31 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_getRemainingTimeFromExpiration_0 = v10.Utils.getRemainingTimeFromExpiration;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v35 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_useSlotBasedEditorContext_0 = v10.Context.useSlotBasedEditorContext;
local l_buildSlots_0 = v10.Utils.buildSlots;
local l_Constants_0 = v10.Constants;
local l_SlotType_0 = v10.Enums.SlotType;
local v42 = game:DefineFastFlag("AXR15PromptBeforeApplyingAvatar", false);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXFixStaleModerationStatusFromGrant_0 = v12.FFlagAXFixStaleModerationStatusFromGrant;
local l_FFlagAXInventoryDurablesSupport_0 = v12.FFlagAXInventoryDurablesSupport;
local l_FFlagAXCustomizeMakeupSupport_0 = v12.FFlagAXCustomizeMakeupSupport;
local _ = require(script.Parent.InventoryItemCard);
local function v51(v50) --[[ Line: 88 ]] --[[ Name: selectIsR6 ]]
    -- upvalues: v18 (copy)
    return v50.AvatarExperience.AvatarEditor.Character.AvatarType == v18.AvatarType.R6;
end;
return function(v52) --[[ Line: 92 ]] --[[ Name: useInventoryItemCardProps ]]
    -- upvalues: v21 (copy), v22 (copy), v23 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_InventoryItemType_0 (copy), v17 (copy), l_useSelector_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_getRemainingTimeFromExpiration_0 (copy), l_useLocalization_0 (copy), v51 (copy), v35 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXFixStaleModerationStatusFromGrant_0 (copy), v28 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v18 (copy), v24 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_useSlotBasedEditorContext_0 (copy), l_useStore_0 (copy), l_buildSlots_0 (copy), l_Constants_0 (copy), l_SlotType_0 (copy), v19 (copy), v30 (copy), v31 (copy), v20 (copy), v42 (copy), l_AvatarScreen_0 (copy), v26 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_InventoryItemAvailability_0 (copy), v37 (copy), v27 (copy), v25 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v3 (copy), v36 (copy), v29 (copy)
    local v53 = v21(v22);
    local v54 = v21(v23);
    local v55 = l_useDispatch_0();
    local v56 = l_useNavigation_0();
    local v57 = l_useAvatarRoute_0();
    local v58 = v2.useRef(nil);
    local v59 = v57 and v57.opaque and v57.opaque.name;
    local l_inventoryItemType_0 = v52.inventoryItemType;
    local v62 = v2.useCallback(function(v61) --[[ Line: 103 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v17 (ref), v52 (copy)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Asset then
            return (v17(v61.AvatarExperience.Common, v52.itemId, l_inventoryItemType_0));
        else
            return nil;
        end;
    end, {
        l_inventoryItemType_0, 
        v52.itemId
    });
    local v63 = l_useSelector_0(v62);
    local v64 = nil;
    if l_FFlagAXInventoryDurablesSupport_0 then
        local v65 = if v63 then l_getRemainingTimeFromExpiration_0(v63.expirationTime) else nil;
        local v66 = l_useLocalization_0({
            days = if v65 and v65.unit == "days" then {
                "Feature.Durables.TimeRemaining.Days"; 
                number = v65.value
            } else nil, 
            hours = if v65 and v65.unit == "hours" then {
                "Feature.Durables.TimeRemaining.Hours"; 
                number = v65.value
            } else nil, 
            minutes = if v65 and v65.unit == "minutes" then {
                "Feature.Durables.TimeRemaining.Minutes"; 
                number = v65.value
            } else nil
        });
        v64 = if v65 then v66[v65.unit] else nil;
    end;
    local v68 = v2.useCallback(function(v67) --[[ Line: 131 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v52 (copy)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit then
            return v67.AvatarExperience.AvatarEditor.OutfitInfos[v52.itemId];
        else
            return nil;
        end;
    end, {
        l_inventoryItemType_0, 
        v52.itemId
    });
    local v69 = l_useSelector_0(v68);
    local v70 = l_useSelector_0(v51);
    local v71 = l_useSelector_0(v35);
    local v72 = if v63 then v63.name else if v69 then v69.name else nil;
    local v73 = if v63 then v63.assetType else nil;
    local v74 = if l_FFlagAXModeratedItemsFlow_0 and v69 then v69.inventoryType else nil;
    local v75 = if v63 then v63.moderationStatus else nil;
    if l_FFlagAXFixStaleModerationStatusFromGrant_0 and v52.availabilityStatus ~= nil then
        v75 = v28.getModerationStatusFromAvailabilityStatus(v52.availabilityStatus);
    end;
    local v76 = if v63 then v63.updateCounter else nil;
    local v77 = if l_FFlagAXRootSlotBasedEditorFlag_0 then nil else v69 ~= nil and (v69.containsDynamicHead or v69.outfitType == v18.OutfitTypes.DynamicHead);
    local v81 = v2.useCallback(function(v78, v79, v80) --[[ Line: 157 ]]
        -- upvalues: v55 (copy), v24 (ref)
        v55(v24(v78, v79, v80));
    end, {
        v55
    });
    local v82 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useSlotBasedEditorContext_0() else nil;
    local v83 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useStore_0() else nil;
    local v93 = v2.useCallback(function() --[[ Line: 165 ]]
        -- upvalues: v52 (copy), v73 (copy), v53 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v83 (copy), v82 (copy), l_buildSlots_0 (ref), l_Constants_0 (ref), l_SlotType_0 (ref), v81 (copy), v55 (copy), v19 (ref), v56 (copy), v30 (ref), v59 (copy), v31 (ref)
        if v52.itemId and v73 then
            local v84 = if v52.isSelected then v53.unequipAsset else v53.equipAsset;
            local v85 = nil;
            local v86 = nil;
            if l_FFlagAXCustomizeMakeupSupport_0 then
                local v87 = v83:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets or {};
                if not v52.isSelected and v82 then
                    local l_slotIndex_0 = v82.slotIndex;
                    local l_slotCategory_0 = v82.slotCategory;
                    local v90 = l_buildSlots_0(l_Constants_0.SlotEditorCategories[l_slotCategory_0].slots, v87)[l_slotIndex_0];
                    if v90 and v90.slotType == l_SlotType_0.LayeredSlot then
                        v85 = v90.layerIndex;
                        v86 = {};
                        for _, v92 in v90.assetTypes do
                            table.insert(v86, (tostring(v92.Value)));
                        end;
                    end;
                end;
            end;
            v81(v84, v52.itemId, v73);
            v55(v19(v73, v52.itemId, v56, nil, v85, nil, if l_FFlagAXCustomizeMakeupSupport_0 then v86 else nil));
            v55(v30(v53, v59, v31.None));
        end;
    end, if l_FFlagAXCustomizeMakeupSupport_0 then {
        v52.itemId, 
        v73, 
        v52.isSelected, 
        v53, 
        v81, 
        v55, 
        v56, 
        v59, 
        v82, 
        v83
    } else {
        v52.itemId, 
        v73, 
        v52.isSelected, 
        v53, 
        v81, 
        v55, 
        v56, 
        v59
    });
    local v95 = v2.useCallback(function() --[[ Line: 239 ]]
        -- upvalues: v69 (copy), v53 (copy), v56 (copy), v52 (copy), v55 (copy), v30 (ref), v59 (copy), v31 (ref), v20 (ref)
        if v69 then
            local v94 = {
                outfitInfo = v69, 
                analytics = v53, 
                navigation = v56, 
                isSelected = v52.isSelected
            };
            v55(v30(v53, v59, v31.None));
            v55(v20(v94));
        end;
    end, {
        v69, 
        v73, 
        v53, 
        v56, 
        v52.isSelected, 
        v55, 
        v59
    });
    local v103 = v2.useCallback(function() --[[ Line: 258 ]]
        -- upvalues: v52 (copy), v70 (copy), v73 (copy), v18 (ref), v69 (copy), v42 (ref), v56 (copy), l_AvatarScreen_0 (ref), v95 (copy), v93 (copy), v55 (copy), v26 (ref), v28 (ref)
        if not v52.itemId or not v70 or v52.isSelected then
            return false;
        else
            local v96 = v73 == v18.AssetTypeIdStrings.HairAccessory;
            local v97 = v69 and v69.outfitType == v18.OutfitTypes.Shoes;
            local v98 = v73 and v18.LayeredAssetTypes[v73] ~= nil;
            local v99 = if v42 then v69 and v69.outfitType == v18.OutfitTypes.Avatar and v69.avatarType == v18.AvatarType.R15 else nil;
            if v98 and not v96 or v97 or v99 then
                v55(v26(function() --[[ Line: 273 ]]
                    -- upvalues: v56 (ref), l_AvatarScreen_0 (ref), v97 (copy), v99 (copy), v95 (ref), v93 (ref)
                    v56.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                        bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                        onSwitchSelected = if not not v97 or v99 then v95 else v93
                    });
                end));
                return true;
            else
                local v100 = v73 == v18.AssetTypeIdStrings.EmoteAnimation;
                local v101 = v28.isAnimationAssetType(v73);
                if v100 or v101 then
                    local v102 = v100 and "Feature.Avatar.Message.R15EmotesPrompt" or "Feature.Avatar.Message.R15AnimationsPrompt";
                    v55(v26(function() --[[ Line: 290 ]]
                        -- upvalues: v56 (ref), l_AvatarScreen_0 (ref), v102 (copy)
                        v56.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                            bodyTextKey = v102
                        });
                    end));
                    return false;
                else
                    return false;
                end;
            end;
        end;
    end, {
        v52.itemId, 
        v73, 
        v69, 
        v70, 
        v52.isSelected, 
        v56, 
        v93, 
        v95, 
        v55
    });
    local v104 = v2.useCallback(function() --[[ Line: 313 ]]
        -- upvalues: v103 (copy), l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v52 (copy), v93 (copy), v69 (copy), v95 (copy)
        if v103() then
            return;
        elseif l_inventoryItemType_0 == l_InventoryItemType_0.Asset and v52.itemId then
            v93();
            return;
        else
            if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit and v69 then
                v95();
            end;
            return;
        end;
    end, {
        l_inventoryItemType_0, 
        v52.itemId, 
        v93, 
        v69, 
        v95
    });
    local v105 = nil;
    local v109 = v2.useCallback(function(v106) --[[ Line: 328 ]]
        -- upvalues: v73 (copy), v18 (ref), v74 (copy), l_FFlagAXModeratedItemsFlow_0 (ref), v56 (copy), l_AvatarScreen_0 (ref), l_inventoryItemType_0 (copy), v72 (copy)
        local v107 = if v73 then v18.AssetTypeIdStringToName[v73] else v74;
        local v108 = nil;
        if l_FFlagAXModeratedItemsFlow_0 then
            v108 = if v73 then v18.AssetTypeLocalized[v73] else "Feature.Catalog.Label.Bundle";
        end;
        v56.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = {
                {
                    category = if l_FFlagAXModeratedItemsFlow_0 then v107 else l_inventoryItemType_0, 
                    categoryLoc = v108, 
                    itemName = v72
                }
            }, 
            messageType = v106
        });
    end, {
        v56, 
        v75, 
        v72, 
        v73, 
        v74
    });
    if v28.isModerationPendingOrRejected(v75) then
        local v110 = if v75 == Enum.ModerationStatus.NotReviewed then l_CatalogItemCardStatusIconTypeEnum_0.PendingModeration else l_CatalogItemCardStatusIconTypeEnum_0.Moderated;
        v105 = {
            type = "placeholder", 
            iconType = v110
        };
        v104 = function() --[[ Line: 360 ]]
            -- upvalues: v28 (ref), v75 (ref), v109 (copy)
            local v111 = v28.getMessageTypeFromModerationStatus(v75);
            if not v111 then
                error("ItemsUnavailablePrompt prop messageType cannot be nil");
            end;
            v109(v111);
        end;
    end;
    if l_FFlagAXModeratedItemsFlow_0 and v52.availabilityStatus == l_InventoryItemAvailability_0.Unavailable then
        v105 = {
            type = "placeholder", 
            iconType = "Error"
        };
        v104 = function() --[[ Line: 375 ]]
            -- upvalues: v109 (copy)
            v109("UnavailableItems");
        end;
    end;
    local v112 = v69 and v69.creatingUniverseId ~= nil and string.len(v69.creatingUniverseId) > 0;
    local v113 = true;
    if l_inventoryItemType_0 ~= l_InventoryItemType_0.Asset then
        v113 = v112;
    end;
    local v116 = v2.useCallback(function() --[[ Line: 387 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v52 (copy), v71 (copy), v37 (ref), v56 (copy), l_AvatarScreen_0 (ref), v55 (copy), v26 (ref), v18 (ref), v27 (ref), v63 (copy), v54 (copy), v57 (copy), v25 (ref)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit then
            local v114 = {
                outfitId = v52.itemId, 
                ZIndex = 2, 
                showFullWithNoPeekView = not v71, 
                renderBottomBar = false, 
                NextSelectionLeft = if v71 then v52.resultsListRef else nil
            };
            v55(v26(function() --[[ Line: 398 ]]
                -- upvalues: v37 (ref), v56 (ref), l_AvatarScreen_0 (ref), v114 (copy)
                v37.closeFiltersAndItemDetails(v56);
                v37.closeTryOnManager(v56);
                v56.navigate(l_AvatarScreen_0.OutfitDetails, v114);
            end));
            return;
        else
            if l_inventoryItemType_0 == l_InventoryItemType_0.Asset and v52.itemId then
                local v115 = {
                    itemId = v52.itemId, 
                    itemType = v18.ItemType.Asset, 
                    itemSubType = v27.GetItemSubType(l_inventoryItemType_0, v63), 
                    priceInRobux = if v63 then v63.priceInRobux else nil, 
                    catalogAnalytics = v54, 
                    avatarRoute = v57, 
                    navigation = v56, 
                    itemDetailsPeekViewRefs = v52.itemDetailsPeekViewRefs, 
                    resultsListRef = v52.resultsListRef, 
                    showFullWithNoPeekView = true, 
                    closePreviousItemDetails = true
                };
                v55(v25(v115));
            end;
            return;
        end;
    end, {
        l_inventoryItemType_0, 
        v52.itemId, 
        v71, 
        v63, 
        v54, 
        v57, 
        v56, 
        v52.itemDetailsPeekViewRefs, 
        v52.resultsListRef, 
        v55
    });
    local v117 = {
        itemId = v52.itemId, 
        inventoryItemType = l_inventoryItemType_0, 
        itemName = v72, 
        showDynamicHeadIcon = if l_FFlagAXRootSlotBasedEditorFlag_0 then nil else v77, 
        isSelected = v52.isSelected, 
        thumbnailRef = v58, 
        onActivated = v104, 
        onDetailsButtonActivated = if v113 then v116 else nil, 
        impressionsTag = v52.impressionsTag, 
        gridInformation = v52.gridInformation, 
        assetType = v73, 
        outfitType = if l_FFlagAXModeratedItemsFlow_0 then v74 else nil, 
        hideName = v52.hideName or false, 
        availabilityStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v52.availabilityStatus else nil, 
        moderationStatus = v75, 
        updateCounter = v76, 
        itemStatus = v105, 
        expirationTime = if l_FFlagAXInventoryDurablesSupport_0 then v64 else nil
    };
    v2.useEffect(function() --[[ Line: 462 ]]
        -- upvalues: v58 (copy), v3 (ref), v117 (copy), l_InventoryItemType_0 (ref), v36 (ref), v52 (copy), v29 (ref)
        if v58.current then
            local v118 = v3.Dictionary.join(v117, {
                itemType = v117.inventoryItemType == l_InventoryItemType_0.Asset and "Asset" or v117.inventoryItemType == l_InventoryItemType_0.Outfit and "Bundle" or nil
            });
            v58.current:SetAttribute(v118.impressionsTag, v118.itemId);
            local v119 = v36[v52.impressionsSchema];
            v29.writeItemAttributes(v119, v58.current, v118);
        end;
    end, {
        v117, 
        v52.impressionsSchema
    });
    return v117;
end;