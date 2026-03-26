local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v5 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_useAvatarRoute_0 = v6.AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local v15 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v16 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AvatarScreen_0 = v6.Enums.AvatarScreen;
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v22 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v24 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.UpdateSavedOutfit);
local v27 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v29 = require(l_Modules_0.AvatarExperience.Common.Actions.ToggleTryOn);
local v30 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_FFlagAXSlotAvatarThumbnailPromptFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotAvatarThumbnailPromptFix;
local v38 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarTileNoDefaultOutfitInfo);
local v39 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXInventoryDurablesSupport_0 = v9.FFlagAXInventoryDurablesSupport;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v9.FFlagAXEnableExpiredUserLookCheckout;
local v44 = game:DefineFastFlag("AXFixUseAvatarTileFocusRef", false);
local l_FFlagAXFixFocusGuiObjectFocusRef_0 = v9.FFlagAXFixFocusGuiObjectFocusRef;
local l_FFlagAXBlockMakeupEquipR6_0 = v9.FFlagAXBlockMakeupEquipR6;
local l_InventoryItemAvailability_0 = v10.Enums.InventoryItemAvailability;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v50(v49) --[[ Line: 87 ]] --[[ Name: getItemStatus ]]
    -- upvalues: l_InventoryItemAvailability_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy)
    if v49 and v49.availabilityStatus == l_InventoryItemAvailability_0.Unavailable then
        return {
            type = "placeholder", 
            iconType = "Error"
        };
    elseif v49 and v49.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems then
        return {
            type = "icon", 
            iconType = "Unavailable"
        };
    elseif l_FFlagAXInventoryDurablesSupport_0 and v49 and v49.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems then
        return {
            type = "icon", 
            iconType = "Info"
        };
    else
        return nil;
    end;
end;
local function v52(v51) --[[ Line: 123 ]]
    return v51.AvatarExperience.Common.AssetInfos;
end;
local function v54(v53) --[[ Line: 128 ]] --[[ Name: selectIsR6 ]]
    -- upvalues: v18 (copy)
    return v53.AvatarExperience.AvatarEditor.Character.AvatarType == v18.AvatarType.R6;
end;
return function(v55, v56) --[[ Line: 132 ]] --[[ Name: useAvatarTileProps ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v15 (copy), l_useDispatch_0 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), v16 (copy), v23 (copy), v21 (copy), v22 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v17 (copy), v5 (copy), v4 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), l_useSelector_0 (copy), v52 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v38 (copy), v27 (copy), v30 (copy), l_FFlagAXFixFocusGuiObjectFocusRef_0 (copy), v44 (copy), l_AvatarScreen_0 (copy), v18 (copy), l_FFlagAXBlockMakeupEquipR6_0 (copy), v54 (copy), v25 (copy), v24 (copy), l_FFlagAXSlotAvatarThumbnailPromptFix_0 (copy), l_InventoryItemAvailability_0 (copy), v20 (copy), v26 (copy), v29 (copy), v28 (copy), v7 (copy), l_ImpressionEnums_0 (copy), v33 (copy), v32 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLogConstants_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v39 (copy), v50 (copy)
    local v57 = l_useAvatarRoute_0();
    local v58 = l_useNavigation_0();
    local v59 = v15();
    local v60 = l_useDispatch_0();
    local v61 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v16(v23) else nil;
    local v62 = v16(v21);
    local v63 = v16(v22);
    local v64 = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableExpiredUserLookCheckout_0 then v16(v17) else nil;
    local v65 = v5.useFocusGuiObject();
    local v66 = v4.usePreferredInput();
    local v67 = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then l_useSelector_0(v52, l_getUseSelectorDeepEquals_0()) else nil;
    local v69 = v2.useCallback(function(v68) --[[ Line: 150 ]]
        -- upvalues: v38 (ref), v55 (copy)
        if v38 then
            return v68.AvatarExperience.AvatarEditor.OutfitInfos[v55.itemId];
        else
            return v68.AvatarExperience.AvatarEditor.OutfitInfos[v55.itemId] or {};
        end;
    end, {
        v55.itemId
    });
    local v70 = l_useSelector_0(v69, l_getUseSelectorDeepEquals_0());
    local v74 = v2.useCallback(function(v71, v72) --[[ Line: 160 ]]
        -- upvalues: v59 (copy), v56 (copy), v60 (copy), v27 (ref), v63 (copy), v57 (copy), v30 (ref)
        if v59 then
            if v71 then
                v59.setSelectedItemInstance(nil);
            else
                local l_current_0 = v56.current;
                if l_current_0 and v72 then
                    v59.setSelectedItemInstance(l_current_0);
                end;
            end;
        end;
        if not v71 and v72 then
            v60(v27(v63, v57.opaque.name, v30.None));
        end;
    end, {
        v59, 
        v60, 
        v63, 
        v57
    });
    local v75 = v2.useCallback(function() --[[ Line: 178 ]]
        -- upvalues: v66 (copy), v4 (ref), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), v65 (copy), v56 (copy), v44 (ref)
        if v66 == v4.Input.Directional then
            if l_FFlagAXFixFocusGuiObjectFocusRef_0 then
                v65(v56.current);
                return;
            else
                v65(if v44 then v56.current else v56);
            end;
        end;
    end, {
        v66, 
        v65
    });
    local v77 = v2.useCallback(function() --[[ Line: 188 ]]
        -- upvalues: v58 (copy), l_AvatarScreen_0 (ref), v70 (copy), v75 (copy), v74 (copy), v55 (copy)
        v58.navigate(l_AvatarScreen_0.EquipOutfitConfirmation, {
            outfitInfo = v70, 
            onOverlayClosed = v75, 
            onEquip = function(v76) --[[ Line: 192 ]] --[[ Name: onEquip ]]
                -- upvalues: v74 (ref), v55 (ref)
                v74(v55.isSelected, v76 or false);
            end
        });
    end, {
        v55.isSelected, 
        v70, 
        v75, 
        v58, 
        v74
    });
    local v85 = v2.useCallback(function(v78) --[[ Line: 199 ]]
        -- upvalues: v70 (copy), v67 (copy), v18 (ref), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref)
        local v79 = {};
        for v80, v81 in v70.assets do
            for v82, v83 in v81 do
                local v84 = v67[v82];
                if v83.availabilityStatus == v78 then
                    table.insert(v79, {
                        categoryLoc = v18.AssetTypeLocalized[v80], 
                        itemName = v84.name, 
                        itemId = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v84.id else nil, 
                        itemSubType = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v80 else nil, 
                        order = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v83.order else nil
                    });
                end;
            end;
        end;
        return v79;
    end, {
        v70, 
        v67
    });
    local v86 = if l_FFlagAXBlockMakeupEquipR6_0 then l_useSelector_0(v54) else nil;
    local v90 = v2.useCallback(function() --[[ Line: 220 ]]
        -- upvalues: v38 (ref), v70 (copy), v60 (copy), v25 (ref), v62 (copy), v58 (copy), v55 (copy), v74 (copy), l_FFlagAXBlockMakeupEquipR6_0 (ref), v86 (copy), v18 (ref), l_AvatarScreen_0 (ref), v24 (ref), l_FFlagAXSlotAvatarThumbnailPromptFix_0 (ref), v77 (copy)
        if v38 and (not v70 or not v70.assets) then
            return;
        else
            local function v88() --[[ Line: 228 ]] --[[ Name: equip ]]
                -- upvalues: v60 (ref), v25 (ref), v70 (ref), v62 (ref), v58 (ref), v55 (ref), v74 (ref)
                local v87 = v60(v25({
                    outfitInfo = v70, 
                    analytics = v62, 
                    navigation = v58, 
                    isSelected = v55.isSelected
                }));
                v74(v55.isSelected, v87 or false);
            end;
            if l_FFlagAXBlockMakeupEquipR6_0 and v86 and v70.outfitType == v18.OutfitTypes.Makeup then
                v60(v24(function() --[[ Line: 239 ]]
                    -- upvalues: v58 (ref), l_AvatarScreen_0 (ref), v88 (copy)
                    v58.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                        bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                        onSwitchSelected = v88
                    });
                end));
                return;
            elseif not l_FFlagAXSlotAvatarThumbnailPromptFix_0 and not v55.hasItemFromCurrentPageEquipped then
                v60(v24(v77));
                return;
            else
                local v89 = v60(v25({
                    outfitInfo = v70, 
                    analytics = v62, 
                    navigation = v58, 
                    isSelected = v55.isSelected
                }));
                v74(v55.isSelected, v89 or false);
                return;
            end;
        end;
    end, {
        v70, 
        v55.isSelected, 
        v55.hasItemFromCurrentPageEquipped, 
        v62, 
        v58, 
        v74, 
        if not l_FFlagAXSlotAvatarThumbnailPromptFix_0 then v77 else nil, 
        if l_FFlagAXBlockMakeupEquipR6_0 then v86 else nil, 
        v60
    });
    local function _(v91) --[[ Line: 269 ]] --[[ Name: onActivatedWithUnavailableItems ]]
        -- upvalues: v58 (copy), l_AvatarScreen_0 (ref), v85 (copy), l_InventoryItemAvailability_0 (ref)
        v58.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = v85(l_InventoryItemAvailability_0.Unavailable), 
            messageType = "UnavailableItems", 
            onConfirm = v91
        });
    end;
    local function v95(v93) --[[ Line: 278 ]] --[[ Name: onActivatedWithRevokedItems ]]
        -- upvalues: v20 (ref), v70 (copy), l_InventoryItemAvailability_0 (ref), v60 (copy), v26 (ref), v62 (copy), v55 (copy), v64 (copy), v58 (copy), l_AvatarScreen_0 (ref), v85 (copy)
        local v94 = v20.filterOutfitAssetsWithStatus(v70, l_InventoryItemAvailability_0.Revoked);
        v60(v26(v62, v55.itemId, v94, nil, v64));
        v58.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = v85(l_InventoryItemAvailability_0.Revoked), 
            messageType = "RevokedItems", 
            onConfirm = v93
        });
    end;
    local function v101(v96) --[[ Line: 293 ]] --[[ Name: onActivatedWithPartiallyExpiredItems ]]
        -- upvalues: l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v85 (copy), l_InventoryItemAvailability_0 (ref), v60 (copy), v29 (ref), v18 (ref), v28 (ref), v64 (copy), v61 (copy), v58 (copy), l_AvatarScreen_0 (ref), v20 (ref), v70 (copy), v26 (ref), v62 (copy), v55 (copy)
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            local v97 = v85(l_InventoryItemAvailability_0.Expired);
            if #v97 > 0 then
                for _, v99 in v97 do
                    v60(v29(v18.ItemType.Asset, v99.itemSubType, v99.itemId, true, v99.order));
                    v60(v28(v64, v61, v99.itemId, v18.ItemType.Asset));
                end;
                v58.navigate(l_AvatarScreen_0.ExpiredUserLookCheckout);
                return;
            end;
        else
            local v100 = v20.filterOutfitAssetsWithStatus(v70, l_InventoryItemAvailability_0.Expired);
            v60(v26(v62, v55.itemId, v100, true, v64));
            v58.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                items = nil, 
                messageType = "PartiallyExpiredItems", 
                onConfirm = v96
            });
        end;
    end;
    v2.useEffect(function() --[[ Line: 327 ]]
        -- upvalues: v56 (copy), v70 (copy), v38 (ref), v7 (ref), v55 (copy), l_ImpressionEnums_0 (ref), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), v33 (ref), v32 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v56.current and v70 and (v38 or not v7.isEmpty(v70)) then
            local v102 = {
                itemId = v55.itemId, 
                itemType = "Bundle", 
                surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
            };
            if l_FFlagAXFixFocusGuiObjectFocusRef_0 and v55.impressionsTag then
                v56.current:SetAttribute(v55.impressionsTag, v55.itemId);
            else
                v56.current:SetAttribute(v55.impressionsTag, v55.itemId);
            end;
            local v103 = v33[v55.impressionsSchema];
            v32.writeItemAttributes(v103, v56.current, v102);
            l_addUnifiedEventLogging_0(v56, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
                itemId = v55.itemId, 
                gridPositionRow = if v55.gridInformation then v55.gridInformation.row else nil, 
                gridPositionColumn = if v55.gridInformation then v55.gridInformation.column else nil
            }, {
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
        end;
    end, {
        v55.itemId, 
        v70, 
        v55.gridInformation
    });
    local l_v90_0 = v90;
    if l_FFlagAXModeratedItemsFlow_0 then
        local v105 = v70 and v70.availabilityStatus;
        local v106 = true;
        if v105 ~= l_InventoryItemAvailability_0.Unavailable then
            v106 = v105 == l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems;
        end;
        local v107 = nil;
        if l_FFlagAXInventoryDurablesSupport_0 then
            v107 = v105 == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems;
        end;
        if v106 then
            local v108 = v85(l_InventoryItemAvailability_0.Unavailable);
            local v109 = v85(l_InventoryItemAvailability_0.Revoked);
            local v110 = v108 and #v108 > 0;
            local v111 = v109 and #v109 > 0;
            l_v90_0 = function() --[[ Line: 371 ]]
                -- upvalues: v110 (copy), v111 (copy), v95 (copy), v90 (copy), v58 (copy), l_AvatarScreen_0 (ref), v85 (copy), l_InventoryItemAvailability_0 (ref)
                if v110 and v111 then
                    local function v112() --[[ Line: 376 ]]
                        -- upvalues: v95 (ref), v90 (ref)
                        v95(v90);
                    end;
                    v58.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                        items = v85(l_InventoryItemAvailability_0.Unavailable), 
                        messageType = "UnavailableItems", 
                        onConfirm = v112
                    });
                    return;
                elseif v110 then
                    local l_v90_1 = v90;
                    v58.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                        items = v85(l_InventoryItemAvailability_0.Unavailable), 
                        messageType = "UnavailableItems", 
                        onConfirm = l_v90_1
                    });
                    return;
                else
                    if v111 then
                        v95(v90);
                    end;
                    return;
                end;
            end;
        elseif l_FFlagAXInventoryDurablesSupport_0 and v107 then
            l_v90_0 = function() --[[ Line: 386 ]]
                -- upvalues: v90 (copy), v101 (copy)
                v90();
                v101();
            end;
        end;
    end;
    if l_FFlagAXEnableModeratedItemsFlowForDurables_0 and l_FFlagAXInventoryDurablesSupport_0 and not l_FFlagAXModeratedItemsFlow_0 then
        local v114 = v70 and v70.availabilityStatus;
        local _ = nil;
        if v114 == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems then
            l_v90_0 = function() --[[ Line: 405 ]]
                -- upvalues: v90 (copy), v101 (copy)
                v90();
                v101();
            end;
        end;
    end;
    return {
        item = v70, 
        onActivated = l_v90_0, 
        isSelected = v55.isSelected, 
        itemId = v55.itemId, 
        index = v55.index, 
        itemWidth = v55.itemWidth, 
        hasItemFromCurrentPageEquipped = v55.hasItemFromCurrentPageEquipped, 
        impressionsTag = v55.impressionsTag, 
        squareAspectRatio = if v39() then v55.squareAspectRatio else nil, 
        outfitUpdateCounter = if l_FFlagAXSlotAvatarThumbnailPromptFix_0 and v70 and v70.updateCounter then v70.updateCounter else 0, 
        itemStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v50(v70) else nil
    };
end;