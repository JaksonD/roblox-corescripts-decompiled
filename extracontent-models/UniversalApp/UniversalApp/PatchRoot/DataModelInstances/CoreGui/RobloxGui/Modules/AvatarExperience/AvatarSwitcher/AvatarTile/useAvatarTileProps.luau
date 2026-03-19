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
local l_InventoryItemAvailability_0 = v10.Enums.InventoryItemAvailability;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v48(v47) --[[ Line: 85 ]] --[[ Name: getItemStatus ]]
    -- upvalues: l_InventoryItemAvailability_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy)
    if v47 and v47.availabilityStatus == l_InventoryItemAvailability_0.Unavailable then
        return {
            type = "placeholder", 
            iconType = "Error"
        };
    elseif v47 and v47.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems then
        return {
            type = "icon", 
            iconType = "Unavailable"
        };
    elseif l_FFlagAXInventoryDurablesSupport_0 and v47 and v47.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems then
        return {
            type = "icon", 
            iconType = "Info"
        };
    else
        return nil;
    end;
end;
local function v50(v49) --[[ Line: 121 ]]
    return v49.AvatarExperience.Common.AssetInfos;
end;
return function(v51, v52) --[[ Line: 125 ]] --[[ Name: useAvatarTileProps ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v15 (copy), l_useDispatch_0 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), v16 (copy), v23 (copy), v21 (copy), v22 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v17 (copy), v5 (copy), v4 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), l_useSelector_0 (copy), v50 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v38 (copy), v27 (copy), v30 (copy), v44 (copy), l_AvatarScreen_0 (copy), v18 (copy), l_FFlagAXSlotAvatarThumbnailPromptFix_0 (copy), v24 (copy), v25 (copy), l_InventoryItemAvailability_0 (copy), v20 (copy), v26 (copy), v29 (copy), v28 (copy), v7 (copy), l_ImpressionEnums_0 (copy), v33 (copy), v32 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLogConstants_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v39 (copy), v48 (copy)
    local v53 = l_useAvatarRoute_0();
    local v54 = l_useNavigation_0();
    local v55 = v15();
    local v56 = l_useDispatch_0();
    local v57 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v16(v23) else nil;
    local v58 = v16(v21);
    local v59 = v16(v22);
    local v60 = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableExpiredUserLookCheckout_0 then v16(v17) else nil;
    local v61 = v5.useFocusGuiObject();
    local v62 = v4.usePreferredInput();
    local v63 = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then l_useSelector_0(v50, l_getUseSelectorDeepEquals_0()) else nil;
    local v65 = v2.useCallback(function(v64) --[[ Line: 143 ]]
        -- upvalues: v38 (ref), v51 (copy)
        if v38 then
            return v64.AvatarExperience.AvatarEditor.OutfitInfos[v51.itemId];
        else
            return v64.AvatarExperience.AvatarEditor.OutfitInfos[v51.itemId] or {};
        end;
    end, {
        v51.itemId
    });
    local v66 = l_useSelector_0(v65, l_getUseSelectorDeepEquals_0());
    local v70 = v2.useCallback(function(v67, v68) --[[ Line: 153 ]]
        -- upvalues: v55 (copy), v52 (copy), v56 (copy), v27 (ref), v59 (copy), v53 (copy), v30 (ref)
        if v55 then
            if v67 then
                v55.setSelectedItemInstance(nil);
            else
                local l_current_0 = v52.current;
                if l_current_0 and v68 then
                    v55.setSelectedItemInstance(l_current_0);
                end;
            end;
        end;
        if not v67 and v68 then
            v56(v27(v59, v53.opaque.name, v30.None));
        end;
    end, {
        v55, 
        v56, 
        v59, 
        v53
    });
    local v71 = v2.useCallback(function() --[[ Line: 171 ]]
        -- upvalues: v62 (copy), v4 (ref), v61 (copy), v44 (ref), v52 (copy)
        if v62 == v4.Input.Directional then
            v61(if v44 then v52.current else v52);
        end;
    end, {
        v62, 
        v61
    });
    local v73 = v2.useCallback(function() --[[ Line: 177 ]]
        -- upvalues: v54 (copy), l_AvatarScreen_0 (ref), v66 (copy), v71 (copy), v70 (copy), v51 (copy)
        v54.navigate(l_AvatarScreen_0.EquipOutfitConfirmation, {
            outfitInfo = v66, 
            onOverlayClosed = v71, 
            onEquip = function(v72) --[[ Line: 181 ]] --[[ Name: onEquip ]]
                -- upvalues: v70 (ref), v51 (ref)
                v70(v51.isSelected, v72 or false);
            end
        });
    end, {
        v51.isSelected, 
        v66, 
        v71, 
        v54, 
        v70
    });
    local v81 = v2.useCallback(function(v74) --[[ Line: 188 ]]
        -- upvalues: v66 (copy), v63 (copy), v18 (ref), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref)
        local v75 = {};
        for v76, v77 in v66.assets do
            for v78, v79 in v77 do
                local v80 = v63[v78];
                if v79.availabilityStatus == v74 then
                    table.insert(v75, {
                        categoryLoc = v18.AssetTypeLocalized[v76], 
                        itemName = v80.name, 
                        itemId = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v80.id else nil, 
                        itemSubType = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v76 else nil, 
                        order = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v79.order else nil
                    });
                end;
            end;
        end;
        return v75;
    end, {
        v66, 
        v63
    });
    local v83 = v2.useCallback(function() --[[ Line: 208 ]]
        -- upvalues: v38 (ref), v66 (copy), l_FFlagAXSlotAvatarThumbnailPromptFix_0 (ref), v51 (copy), v56 (copy), v24 (ref), v73 (copy), v25 (ref), v58 (copy), v54 (copy), v70 (copy)
        if v38 and (not v66 or not v66.assets) then
            return;
        elseif not l_FFlagAXSlotAvatarThumbnailPromptFix_0 and not v51.hasItemFromCurrentPageEquipped then
            v56(v24(v73));
            return;
        else
            local v82 = v56(v25({
                outfitInfo = v66, 
                analytics = v58, 
                navigation = v54, 
                isSelected = v51.isSelected
            }));
            v70(v51.isSelected, v82 or false);
            return;
        end;
    end, {
        v66, 
        v51.isSelected, 
        v51.hasItemFromCurrentPageEquipped, 
        v58, 
        v54, 
        v70, 
        if not l_FFlagAXSlotAvatarThumbnailPromptFix_0 then v73 else nil, 
        v56
    });
    local function _(v84) --[[ Line: 241 ]] --[[ Name: onActivatedWithUnavailableItems ]]
        -- upvalues: v54 (copy), l_AvatarScreen_0 (ref), v81 (copy), l_InventoryItemAvailability_0 (ref)
        v54.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = v81(l_InventoryItemAvailability_0.Unavailable), 
            messageType = "UnavailableItems", 
            onConfirm = v84
        });
    end;
    local function v88(v86) --[[ Line: 250 ]] --[[ Name: onActivatedWithRevokedItems ]]
        -- upvalues: v20 (ref), v66 (copy), l_InventoryItemAvailability_0 (ref), v56 (copy), v26 (ref), v58 (copy), v51 (copy), v60 (copy), v54 (copy), l_AvatarScreen_0 (ref), v81 (copy)
        local v87 = v20.filterOutfitAssetsWithStatus(v66, l_InventoryItemAvailability_0.Revoked);
        v56(v26(v58, v51.itemId, v87, nil, v60));
        v54.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = v81(l_InventoryItemAvailability_0.Revoked), 
            messageType = "RevokedItems", 
            onConfirm = v86
        });
    end;
    local function v94(v89) --[[ Line: 265 ]] --[[ Name: onActivatedWithPartiallyExpiredItems ]]
        -- upvalues: l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v81 (copy), l_InventoryItemAvailability_0 (ref), v56 (copy), v29 (ref), v18 (ref), v28 (ref), v60 (copy), v57 (copy), v54 (copy), l_AvatarScreen_0 (ref), v20 (ref), v66 (copy), v26 (ref), v58 (copy), v51 (copy)
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            local v90 = v81(l_InventoryItemAvailability_0.Expired);
            if #v90 > 0 then
                for _, v92 in v90 do
                    v56(v29(v18.ItemType.Asset, v92.itemSubType, v92.itemId, true, v92.order));
                    v56(v28(v60, v57, v92.itemId, v18.ItemType.Asset));
                end;
                v54.navigate(l_AvatarScreen_0.ExpiredUserLookCheckout);
                return;
            end;
        else
            local v93 = v20.filterOutfitAssetsWithStatus(v66, l_InventoryItemAvailability_0.Expired);
            v56(v26(v58, v51.itemId, v93, true, v60));
            v54.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                items = nil, 
                messageType = "PartiallyExpiredItems", 
                onConfirm = v89
            });
        end;
    end;
    v2.useEffect(function() --[[ Line: 299 ]]
        -- upvalues: v52 (copy), v66 (copy), v38 (ref), v7 (ref), v51 (copy), l_ImpressionEnums_0 (ref), v33 (ref), v32 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v52.current and v66 and (v38 or not v7.isEmpty(v66)) then
            local v95 = {
                itemId = v51.itemId, 
                itemType = "Bundle", 
                surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
            };
            v52.current:SetAttribute(v51.impressionsTag, v51.itemId);
            local v96 = v33[v51.impressionsSchema];
            v32.writeItemAttributes(v96, v52.current, v95);
            l_addUnifiedEventLogging_0(v52, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
                itemId = v51.itemId, 
                gridPositionRow = if v51.gridInformation then v51.gridInformation.row else nil, 
                gridPositionColumn = if v51.gridInformation then v51.gridInformation.column else nil
            }, {
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
        end;
    end, {
        v51.itemId, 
        v66, 
        v51.gridInformation
    });
    local l_v83_0 = v83;
    if l_FFlagAXModeratedItemsFlow_0 then
        local v98 = v66 and v66.availabilityStatus;
        local v99 = true;
        if v98 ~= l_InventoryItemAvailability_0.Unavailable then
            v99 = v98 == l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems;
        end;
        local v100 = nil;
        if l_FFlagAXInventoryDurablesSupport_0 then
            v100 = v98 == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems;
        end;
        if v99 then
            local v101 = v81(l_InventoryItemAvailability_0.Unavailable);
            local v102 = v81(l_InventoryItemAvailability_0.Revoked);
            local v103 = v101 and #v101 > 0;
            local v104 = v102 and #v102 > 0;
            l_v83_0 = function() --[[ Line: 339 ]]
                -- upvalues: v103 (copy), v104 (copy), v88 (copy), v83 (copy), v54 (copy), l_AvatarScreen_0 (ref), v81 (copy), l_InventoryItemAvailability_0 (ref)
                if v103 and v104 then
                    local function v105() --[[ Line: 344 ]]
                        -- upvalues: v88 (ref), v83 (ref)
                        v88(v83);
                    end;
                    v54.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                        items = v81(l_InventoryItemAvailability_0.Unavailable), 
                        messageType = "UnavailableItems", 
                        onConfirm = v105
                    });
                    return;
                elseif v103 then
                    local l_v83_1 = v83;
                    v54.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                        items = v81(l_InventoryItemAvailability_0.Unavailable), 
                        messageType = "UnavailableItems", 
                        onConfirm = l_v83_1
                    });
                    return;
                else
                    if v104 then
                        v88(v83);
                    end;
                    return;
                end;
            end;
        elseif l_FFlagAXInventoryDurablesSupport_0 and v100 then
            l_v83_0 = function() --[[ Line: 354 ]]
                -- upvalues: v83 (copy), v94 (copy)
                v83();
                v94();
            end;
        end;
    end;
    if l_FFlagAXEnableModeratedItemsFlowForDurables_0 and l_FFlagAXInventoryDurablesSupport_0 and not l_FFlagAXModeratedItemsFlow_0 then
        local v107 = v66 and v66.availabilityStatus;
        local _ = nil;
        if v107 == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems then
            l_v83_0 = function() --[[ Line: 373 ]]
                -- upvalues: v83 (copy), v94 (copy)
                v83();
                v94();
            end;
        end;
    end;
    return {
        item = v66, 
        onActivated = l_v83_0, 
        isSelected = v51.isSelected, 
        itemId = v51.itemId, 
        index = v51.index, 
        itemWidth = v51.itemWidth, 
        hasItemFromCurrentPageEquipped = v51.hasItemFromCurrentPageEquipped, 
        impressionsTag = v51.impressionsTag, 
        squareAspectRatio = if v39() then v51.squareAspectRatio else nil, 
        outfitUpdateCounter = if l_FFlagAXSlotAvatarThumbnailPromptFix_0 and v66 and v66.updateCounter then v66.updateCounter else 0, 
        itemStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v48(v66) else nil
    };
end;