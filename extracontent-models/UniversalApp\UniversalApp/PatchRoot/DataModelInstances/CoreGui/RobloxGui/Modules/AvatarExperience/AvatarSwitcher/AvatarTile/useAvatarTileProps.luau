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
local l_InventoryItemAvailability_0 = v10.Enums.InventoryItemAvailability;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v47(v46) --[[ Line: 83 ]] --[[ Name: getItemStatus ]]
    -- upvalues: l_InventoryItemAvailability_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy)
    if v46 and v46.availabilityStatus == l_InventoryItemAvailability_0.Unavailable then
        return {
            type = "placeholder", 
            iconType = "Error"
        };
    elseif v46 and v46.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems then
        return {
            type = "icon", 
            iconType = "Unavailable"
        };
    elseif l_FFlagAXInventoryDurablesSupport_0 and v46 and v46.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems then
        return {
            type = "icon", 
            iconType = "Info"
        };
    else
        return nil;
    end;
end;
local function v49(v48) --[[ Line: 119 ]]
    return v48.AvatarExperience.Common.AssetInfos;
end;
return function(v50, v51) --[[ Line: 123 ]] --[[ Name: useAvatarTileProps ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v15 (copy), l_useDispatch_0 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), v16 (copy), v23 (copy), v21 (copy), v22 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v17 (copy), v5 (copy), v4 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), l_useSelector_0 (copy), v49 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v38 (copy), v27 (copy), v30 (copy), l_AvatarScreen_0 (copy), v18 (copy), l_FFlagAXSlotAvatarThumbnailPromptFix_0 (copy), v24 (copy), v25 (copy), l_InventoryItemAvailability_0 (copy), v20 (copy), v26 (copy), v29 (copy), v28 (copy), v7 (copy), l_ImpressionEnums_0 (copy), v33 (copy), v32 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLogConstants_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v39 (copy), v47 (copy)
    local v52 = l_useAvatarRoute_0();
    local v53 = l_useNavigation_0();
    local v54 = v15();
    local v55 = l_useDispatch_0();
    local v56 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v16(v23) else nil;
    local v57 = v16(v21);
    local v58 = v16(v22);
    local v59 = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableExpiredUserLookCheckout_0 then v16(v17) else nil;
    local v60 = v5.useFocusGuiObject();
    local v61 = v4.usePreferredInput();
    local v62 = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then l_useSelector_0(v49, l_getUseSelectorDeepEquals_0()) else nil;
    local v64 = v2.useCallback(function(v63) --[[ Line: 141 ]]
        -- upvalues: v38 (ref), v50 (copy)
        if v38 then
            return v63.AvatarExperience.AvatarEditor.OutfitInfos[v50.itemId];
        else
            return v63.AvatarExperience.AvatarEditor.OutfitInfos[v50.itemId] or {};
        end;
    end, {
        v50.itemId
    });
    local v65 = l_useSelector_0(v64, l_getUseSelectorDeepEquals_0());
    local v69 = v2.useCallback(function(v66, v67) --[[ Line: 151 ]]
        -- upvalues: v54 (copy), v51 (copy), v55 (copy), v27 (ref), v58 (copy), v52 (copy), v30 (ref)
        if v54 then
            if v66 then
                v54.setSelectedItemInstance(nil);
            else
                local l_current_0 = v51.current;
                if l_current_0 and v67 then
                    v54.setSelectedItemInstance(l_current_0);
                end;
            end;
        end;
        if not v66 and v67 then
            v55(v27(v58, v52.opaque.name, v30.None));
        end;
    end, {
        v54, 
        v55, 
        v58, 
        v52
    });
    local v70 = v2.useCallback(function() --[[ Line: 169 ]]
        -- upvalues: v61 (copy), v4 (ref), v60 (copy), v51 (copy)
        if v61 == v4.Input.Directional then
            v60(v51);
        end;
    end, {
        v61, 
        v60
    });
    local v72 = v2.useCallback(function() --[[ Line: 175 ]]
        -- upvalues: v53 (copy), l_AvatarScreen_0 (ref), v65 (copy), v70 (copy), v69 (copy), v50 (copy)
        v53.navigate(l_AvatarScreen_0.EquipOutfitConfirmation, {
            outfitInfo = v65, 
            onOverlayClosed = v70, 
            onEquip = function(v71) --[[ Line: 179 ]] --[[ Name: onEquip ]]
                -- upvalues: v69 (ref), v50 (ref)
                v69(v50.isSelected, v71 or false);
            end
        });
    end, {
        v50.isSelected, 
        v65, 
        v70, 
        v53, 
        v69
    });
    local v80 = v2.useCallback(function(v73) --[[ Line: 186 ]]
        -- upvalues: v65 (copy), v62 (copy), v18 (ref), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref)
        local v74 = {};
        for v75, v76 in v65.assets do
            for v77, v78 in v76 do
                local v79 = v62[v77];
                if v78.availabilityStatus == v73 then
                    table.insert(v74, {
                        categoryLoc = v18.AssetTypeLocalized[v75], 
                        itemName = v79.name, 
                        itemId = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v79.id else nil, 
                        itemSubType = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v75 else nil, 
                        order = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v78.order else nil
                    });
                end;
            end;
        end;
        return v74;
    end, {
        v65, 
        v62
    });
    local v82 = v2.useCallback(function() --[[ Line: 206 ]]
        -- upvalues: v38 (ref), v65 (copy), l_FFlagAXSlotAvatarThumbnailPromptFix_0 (ref), v50 (copy), v55 (copy), v24 (ref), v72 (copy), v25 (ref), v57 (copy), v53 (copy), v69 (copy)
        if v38 and (not v65 or not v65.assets) then
            return;
        elseif not l_FFlagAXSlotAvatarThumbnailPromptFix_0 and not v50.hasItemFromCurrentPageEquipped then
            v55(v24(v72));
            return;
        else
            local v81 = v55(v25({
                outfitInfo = v65, 
                analytics = v57, 
                navigation = v53, 
                isSelected = v50.isSelected
            }));
            v69(v50.isSelected, v81 or false);
            return;
        end;
    end, {
        v65, 
        v50.isSelected, 
        v50.hasItemFromCurrentPageEquipped, 
        v57, 
        v53, 
        v69, 
        if not l_FFlagAXSlotAvatarThumbnailPromptFix_0 then v72 else nil, 
        v55
    });
    local function _(v83) --[[ Line: 239 ]] --[[ Name: onActivatedWithUnavailableItems ]]
        -- upvalues: v53 (copy), l_AvatarScreen_0 (ref), v80 (copy), l_InventoryItemAvailability_0 (ref)
        v53.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = v80(l_InventoryItemAvailability_0.Unavailable), 
            messageType = "UnavailableItems", 
            onConfirm = v83
        });
    end;
    local function v87(v85) --[[ Line: 248 ]] --[[ Name: onActivatedWithRevokedItems ]]
        -- upvalues: v20 (ref), v65 (copy), l_InventoryItemAvailability_0 (ref), v55 (copy), v26 (ref), v57 (copy), v50 (copy), v59 (copy), v53 (copy), l_AvatarScreen_0 (ref), v80 (copy)
        local v86 = v20.filterOutfitAssetsWithStatus(v65, l_InventoryItemAvailability_0.Revoked);
        v55(v26(v57, v50.itemId, v86, nil, v59));
        v53.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = v80(l_InventoryItemAvailability_0.Revoked), 
            messageType = "RevokedItems", 
            onConfirm = v85
        });
    end;
    local function v93(v88) --[[ Line: 263 ]] --[[ Name: onActivatedWithPartiallyExpiredItems ]]
        -- upvalues: l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v80 (copy), l_InventoryItemAvailability_0 (ref), v55 (copy), v29 (ref), v18 (ref), v28 (ref), v59 (copy), v56 (copy), v53 (copy), l_AvatarScreen_0 (ref), v20 (ref), v65 (copy), v26 (ref), v57 (copy), v50 (copy)
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            local v89 = v80(l_InventoryItemAvailability_0.Expired);
            if #v89 > 0 then
                for _, v91 in v89 do
                    v55(v29(v18.ItemType.Asset, v91.itemSubType, v91.itemId, true, v91.order));
                    v55(v28(v59, v56, v91.itemId, v18.ItemType.Asset));
                end;
                v53.navigate(l_AvatarScreen_0.ExpiredUserLookCheckout);
                return;
            end;
        else
            local v92 = v20.filterOutfitAssetsWithStatus(v65, l_InventoryItemAvailability_0.Expired);
            v55(v26(v57, v50.itemId, v92, true, v59));
            v53.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                items = nil, 
                messageType = "PartiallyExpiredItems", 
                onConfirm = v88
            });
        end;
    end;
    v2.useEffect(function() --[[ Line: 297 ]]
        -- upvalues: v51 (copy), v65 (copy), v38 (ref), v7 (ref), v50 (copy), l_ImpressionEnums_0 (ref), v33 (ref), v32 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v51.current and v65 and (v38 or not v7.isEmpty(v65)) then
            local v94 = {
                itemId = v50.itemId, 
                itemType = "Bundle", 
                surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
            };
            v51.current:SetAttribute(v50.impressionsTag, v50.itemId);
            local v95 = v33[v50.impressionsSchema];
            v32.writeItemAttributes(v95, v51.current, v94);
            l_addUnifiedEventLogging_0(v51, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
                itemId = v50.itemId, 
                gridPositionRow = if v50.gridInformation then v50.gridInformation.row else nil, 
                gridPositionColumn = if v50.gridInformation then v50.gridInformation.column else nil
            }, {
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
        end;
    end, {
        v50.itemId, 
        v65, 
        v50.gridInformation
    });
    local l_v82_0 = v82;
    if l_FFlagAXModeratedItemsFlow_0 then
        local v97 = v65 and v65.availabilityStatus;
        local v98 = true;
        if v97 ~= l_InventoryItemAvailability_0.Unavailable then
            v98 = v97 == l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems;
        end;
        local v99 = nil;
        if l_FFlagAXInventoryDurablesSupport_0 then
            v99 = v97 == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems;
        end;
        if v98 then
            local v100 = v80(l_InventoryItemAvailability_0.Unavailable);
            local v101 = v80(l_InventoryItemAvailability_0.Revoked);
            local v102 = v100 and #v100 > 0;
            local v103 = v101 and #v101 > 0;
            l_v82_0 = function() --[[ Line: 337 ]]
                -- upvalues: v102 (copy), v103 (copy), v87 (copy), v82 (copy), v53 (copy), l_AvatarScreen_0 (ref), v80 (copy), l_InventoryItemAvailability_0 (ref)
                if v102 and v103 then
                    local function v104() --[[ Line: 342 ]]
                        -- upvalues: v87 (ref), v82 (ref)
                        v87(v82);
                    end;
                    v53.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                        items = v80(l_InventoryItemAvailability_0.Unavailable), 
                        messageType = "UnavailableItems", 
                        onConfirm = v104
                    });
                    return;
                elseif v102 then
                    local l_v82_1 = v82;
                    v53.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                        items = v80(l_InventoryItemAvailability_0.Unavailable), 
                        messageType = "UnavailableItems", 
                        onConfirm = l_v82_1
                    });
                    return;
                else
                    if v103 then
                        v87(v82);
                    end;
                    return;
                end;
            end;
        elseif l_FFlagAXInventoryDurablesSupport_0 and v99 then
            l_v82_0 = function() --[[ Line: 352 ]]
                -- upvalues: v82 (copy), v93 (copy)
                v82();
                v93();
            end;
        end;
    end;
    if l_FFlagAXEnableModeratedItemsFlowForDurables_0 and l_FFlagAXInventoryDurablesSupport_0 and not l_FFlagAXModeratedItemsFlow_0 then
        local v106 = v65 and v65.availabilityStatus;
        local _ = nil;
        if v106 == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems then
            l_v82_0 = function() --[[ Line: 371 ]]
                -- upvalues: v82 (copy), v93 (copy)
                v82();
                v93();
            end;
        end;
    end;
    return {
        item = v65, 
        onActivated = l_v82_0, 
        isSelected = v50.isSelected, 
        itemId = v50.itemId, 
        index = v50.index, 
        itemWidth = v50.itemWidth, 
        hasItemFromCurrentPageEquipped = v50.hasItemFromCurrentPageEquipped, 
        impressionsTag = v50.impressionsTag, 
        squareAspectRatio = if v39() then v50.squareAspectRatio else nil, 
        outfitUpdateCounter = if l_FFlagAXSlotAvatarThumbnailPromptFix_0 and v65 and v65.updateCounter then v65.updateCounter else 0, 
        itemStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v47(v65) else nil
    };
end;