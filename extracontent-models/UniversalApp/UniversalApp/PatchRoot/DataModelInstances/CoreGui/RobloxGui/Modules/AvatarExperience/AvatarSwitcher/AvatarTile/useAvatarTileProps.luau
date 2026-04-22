local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v5 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_getUseSelectorDeepEquals_0 = v8.Utils.getUseSelectorDeepEquals;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_useAvatarRoute_0 = v6.AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useAdaptiveScrolling_0 = v8.Hooks.useAdaptiveScrolling;
local v17 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v18 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v19 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AvatarScreen_0 = v6.Enums.AvatarScreen;
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v23 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.UpdateSavedOutfit);
local v28 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v30 = require(l_Modules_0.AvatarExperience.Common.Actions.ToggleTryOn);
local l_FullView_0 = v8.Enums.FullView;
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local l_ImpressionsUtil_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil;
local l_OrganicEventImpressionsSchema_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_FFlagAXSlotAvatarThumbnailPromptFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotAvatarThumbnailPromptFix;
local v39 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarTileNoDefaultOutfitInfo);
local v40 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXInventoryDurablesSupport_0 = v10.FFlagAXInventoryDurablesSupport;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v10.FFlagAXEnableExpiredUserLookCheckout;
local v45 = game:DefineFastFlag("AXFixUseAvatarTileFocusRef", false);
local l_FFlagAXFixFocusGuiObjectFocusRef_0 = v10.FFlagAXFixFocusGuiObjectFocusRef;
local l_FFlagAXBlockMakeupEquipR6_0 = v10.FFlagAXBlockMakeupEquipR6;
local l_InventoryItemAvailability_0 = v11.Enums.InventoryItemAvailability;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v51(v50) --[[ Line: 88 ]] --[[ Name: getItemStatus ]]
    -- upvalues: l_InventoryItemAvailability_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy)
    if v50 and v50.availabilityStatus == l_InventoryItemAvailability_0.Unavailable then
        return {
            type = "placeholder", 
            iconType = "Error"
        };
    elseif v50 and v50.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems then
        return {
            type = "icon", 
            iconType = "Unavailable"
        };
    elseif l_FFlagAXInventoryDurablesSupport_0 and v50 and v50.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems then
        return {
            type = "icon", 
            iconType = "Info"
        };
    else
        return nil;
    end;
end;
local function v53(v52) --[[ Line: 124 ]]
    return v52.AvatarExperience.Common.AssetInfos;
end;
local function v55(v54) --[[ Line: 129 ]] --[[ Name: selectIsR6 ]]
    -- upvalues: v19 (copy)
    return v54.AvatarExperience.AvatarEditor.Character.AvatarType == v19.AvatarType.R6;
end;
return function(v56, v57) --[[ Line: 133 ]] --[[ Name: useAvatarTileProps ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useAdaptiveScrolling_0 (copy), l_useDispatch_0 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), v17 (copy), v24 (copy), v22 (copy), v23 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v18 (copy), v5 (copy), v4 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), l_useSelector_0 (copy), v53 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v39 (copy), v28 (copy), l_FullView_0 (copy), l_FFlagAXFixFocusGuiObjectFocusRef_0 (copy), v45 (copy), l_AvatarScreen_0 (copy), v19 (copy), l_FFlagAXBlockMakeupEquipR6_0 (copy), v55 (copy), v26 (copy), l_InventoryItemAvailability_0 (copy), l_NavigateWithLock_0 (copy), l_FFlagAXSlotAvatarThumbnailPromptFix_0 (copy), v21 (copy), v27 (copy), v30 (copy), v29 (copy), v7 (copy), l_ImpressionEnums_0 (copy), l_OrganicEventImpressionsSchema_0 (copy), l_ImpressionsUtil_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLogConstants_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v40 (copy), v51 (copy)
    local v58 = l_useAvatarRoute_0();
    local v59 = l_useNavigation_0();
    local v60 = l_useAdaptiveScrolling_0();
    local v61 = l_useDispatch_0();
    local v62 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v17(v24) else nil;
    local v63 = v17(v22);
    local v64 = v17(v23);
    local v65 = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableExpiredUserLookCheckout_0 then v17(v18) else nil;
    local v66 = v5.useFocusGuiObject();
    local v67 = v4.usePreferredInput();
    local v68 = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then l_useSelector_0(v53, l_getUseSelectorDeepEquals_0()) else nil;
    local v70 = v2.useCallback(function(v69) --[[ Line: 151 ]]
        -- upvalues: v39 (ref), v56 (copy)
        if v39 then
            return v69.AvatarExperience.AvatarEditor.OutfitInfos[v56.itemId];
        else
            return v69.AvatarExperience.AvatarEditor.OutfitInfos[v56.itemId] or {};
        end;
    end, {
        v56.itemId
    });
    local v71 = l_useSelector_0(v70, l_getUseSelectorDeepEquals_0());
    local v75 = v2.useCallback(function(v72, v73) --[[ Line: 161 ]]
        -- upvalues: v60 (copy), v57 (copy), v61 (copy), v28 (ref), v64 (copy), v58 (copy), l_FullView_0 (ref)
        if v60 then
            if v72 then
                v60.setSelectedItemInstance(nil);
            else
                local l_current_0 = v57.current;
                if l_current_0 and v73 then
                    v60.setSelectedItemInstance(l_current_0);
                end;
            end;
        end;
        if not v72 and v73 then
            v61(v28(v64, v58.opaque.name, l_FullView_0.None));
        end;
    end, {
        v60, 
        v61, 
        v64, 
        v58
    });
    local v76 = v2.useCallback(function() --[[ Line: 179 ]]
        -- upvalues: v67 (copy), v4 (ref), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), v66 (copy), v57 (copy), v45 (ref)
        if v67 == v4.Input.Directional then
            if l_FFlagAXFixFocusGuiObjectFocusRef_0 then
                v66(v57.current);
                return;
            else
                v66(if v45 then v57.current else v57);
            end;
        end;
    end, {
        v67, 
        v66
    });
    local v78 = v2.useCallback(function() --[[ Line: 189 ]]
        -- upvalues: v59 (copy), l_AvatarScreen_0 (ref), v71 (copy), v76 (copy), v75 (copy), v56 (copy)
        v59.navigate(l_AvatarScreen_0.EquipOutfitConfirmation, {
            outfitInfo = v71, 
            onOverlayClosed = v76, 
            onEquip = function(v77) --[[ Line: 193 ]] --[[ Name: onEquip ]]
                -- upvalues: v75 (ref), v56 (ref)
                v75(v56.isSelected, v77 or false);
            end
        });
    end, {
        v56.isSelected, 
        v71, 
        v76, 
        v59, 
        v75
    });
    local v86 = v2.useCallback(function(v79) --[[ Line: 200 ]]
        -- upvalues: v71 (copy), v68 (copy), v19 (ref), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref)
        local v80 = {};
        for v81, v82 in v71.assets do
            for v83, v84 in v82 do
                local v85 = v68[v83];
                if v84.availabilityStatus == v79 then
                    table.insert(v80, {
                        categoryLoc = v19.AssetTypeLocalized[v81], 
                        itemName = v85.name, 
                        itemId = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v85.id else nil, 
                        itemSubType = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v81 else nil, 
                        order = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v84.order else nil
                    });
                end;
            end;
        end;
        return v80;
    end, {
        v71, 
        v68
    });
    local v87 = if l_FFlagAXBlockMakeupEquipR6_0 then l_useSelector_0(v55) else nil;
    local v93 = v2.useCallback(function(_) --[[ Line: 221 ]]
        -- upvalues: v39 (ref), v71 (copy), v61 (copy), v26 (ref), v63 (copy), v59 (copy), v56 (copy), v75 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v86 (copy), l_InventoryItemAvailability_0 (ref), l_AvatarScreen_0 (ref), l_FFlagAXBlockMakeupEquipR6_0 (ref), v87 (copy), v19 (ref), l_NavigateWithLock_0 (ref), l_FFlagAXSlotAvatarThumbnailPromptFix_0 (ref), v78 (copy)
        if v39 and (not v71 or not v71.assets) then
            return;
        else
            local function v90() --[[ Line: 229 ]] --[[ Name: equip ]]
                -- upvalues: v61 (ref), v26 (ref), v71 (ref), v63 (ref), v59 (ref), v56 (ref), v75 (ref)
                local v89 = v61(v26({
                    outfitInfo = v71, 
                    analytics = v63, 
                    navigation = v59, 
                    isSelected = v56.isSelected
                }));
                v75(v56.isSelected, v89 or false);
            end;
            if l_FFlagAXEnableExpiredUserLookCheckout_0 then
                local v91 = v86(l_InventoryItemAvailability_0.Expired);
                v59.navigate(l_AvatarScreen_0.ExpiredUserLookActionBar, {
                    expiredItemCount = if #v91 > 0 then #v91 else 0, 
                    expiredItems = if #v91 > 0 then v91 else nil
                });
            end;
            if l_FFlagAXBlockMakeupEquipR6_0 and v87 and v71.outfitType == v19.OutfitTypes.Makeup then
                v61(l_NavigateWithLock_0(function() --[[ Line: 248 ]]
                    -- upvalues: v59 (ref), l_AvatarScreen_0 (ref), v90 (copy)
                    v59.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                        bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                        onSwitchSelected = v90
                    });
                end));
                return;
            elseif not l_FFlagAXSlotAvatarThumbnailPromptFix_0 and not v56.hasItemFromCurrentPageEquipped then
                v61(l_NavigateWithLock_0(v78));
                return;
            else
                local v92 = v61(v26({
                    outfitInfo = v71, 
                    analytics = v63, 
                    navigation = v59, 
                    isSelected = v56.isSelected
                }));
                v75(v56.isSelected, v92 or false);
                return;
            end;
        end;
    end, {
        v71, 
        v56.isSelected, 
        v56.hasItemFromCurrentPageEquipped, 
        v63, 
        v59, 
        v75, 
        if not l_FFlagAXSlotAvatarThumbnailPromptFix_0 then v78 else nil, 
        if l_FFlagAXBlockMakeupEquipR6_0 then v87 else nil, 
        v61, 
        v86, 
        v65, 
        v56.itemId
    });
    local function _(v94) --[[ Line: 281 ]] --[[ Name: onActivatedWithUnavailableItems ]]
        -- upvalues: v59 (copy), l_AvatarScreen_0 (ref), v86 (copy), l_InventoryItemAvailability_0 (ref)
        v59.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = v86(l_InventoryItemAvailability_0.Unavailable), 
            messageType = "UnavailableItems", 
            onConfirm = v94
        });
    end;
    local function v98(v96) --[[ Line: 290 ]] --[[ Name: onActivatedWithRevokedItems ]]
        -- upvalues: v21 (ref), v71 (copy), l_InventoryItemAvailability_0 (ref), v61 (copy), v27 (ref), v63 (copy), v56 (copy), v65 (copy), v59 (copy), l_AvatarScreen_0 (ref), v86 (copy)
        local v97 = v21.filterOutfitAssetsWithStatus(v71, l_InventoryItemAvailability_0.Revoked);
        v61(v27(v63, v56.itemId, v97, nil, v65));
        v59.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
            items = v86(l_InventoryItemAvailability_0.Revoked), 
            messageType = "RevokedItems", 
            onConfirm = v96
        });
    end;
    local function v104(v99) --[[ Line: 305 ]] --[[ Name: onActivatedWithPartiallyExpiredItems ]]
        -- upvalues: l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v86 (copy), l_InventoryItemAvailability_0 (ref), v61 (copy), v30 (ref), v19 (ref), v29 (ref), v65 (copy), v62 (copy), v59 (copy), l_AvatarScreen_0 (ref), v21 (ref), v71 (copy), v27 (ref), v63 (copy), v56 (copy)
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            local v100 = v86(l_InventoryItemAvailability_0.Expired);
            if #v100 > 0 then
                for _, v102 in v100 do
                    v61(v30(v19.ItemType.Asset, v102.itemSubType, v102.itemId, true, v102.order));
                    v61(v29(v65, v62, v102.itemId, v19.ItemType.Asset));
                end;
                v59.navigate(l_AvatarScreen_0.ExpiredUserLookActionBar, {
                    expiredItemCount = #v100, 
                    expiredItems = v100
                });
                return;
            end;
        else
            local v103 = v21.filterOutfitAssetsWithStatus(v71, l_InventoryItemAvailability_0.Expired);
            v61(v27(v63, v56.itemId, v103, true, v65));
            v59.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                items = nil, 
                messageType = "PartiallyExpiredItems", 
                onConfirm = v99
            });
        end;
    end;
    v2.useEffect(function() --[[ Line: 342 ]]
        -- upvalues: v57 (copy), v71 (copy), v39 (ref), v7 (ref), v56 (copy), l_ImpressionEnums_0 (ref), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), l_OrganicEventImpressionsSchema_0 (ref), l_ImpressionsUtil_0 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v57.current and v71 and (v39 or not v7.isEmpty(v71)) then
            local v105 = {
                itemId = v56.itemId, 
                itemType = "Bundle", 
                surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
            };
            if l_FFlagAXFixFocusGuiObjectFocusRef_0 and v56.impressionsTag then
                v57.current:SetAttribute(v56.impressionsTag, v56.itemId);
            else
                v57.current:SetAttribute(v56.impressionsTag, v56.itemId);
            end;
            local v106 = l_OrganicEventImpressionsSchema_0[v56.impressionsSchema];
            l_ImpressionsUtil_0.writeItemAttributes(v106, v57.current, v105);
            l_addUnifiedEventLogging_0(v57, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
                itemId = v56.itemId, 
                gridPositionRow = if v56.gridInformation then v56.gridInformation.row else nil, 
                gridPositionColumn = if v56.gridInformation then v56.gridInformation.column else nil
            }, {
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
        end;
    end, {
        v56.itemId, 
        v71, 
        v56.gridInformation
    });
    local l_v93_0 = v93;
    if l_FFlagAXModeratedItemsFlow_0 then
        local v108 = v71 and v71.availabilityStatus;
        local v109 = true;
        if v108 ~= l_InventoryItemAvailability_0.Unavailable then
            v109 = v108 == l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems;
        end;
        local v110 = nil;
        if l_FFlagAXInventoryDurablesSupport_0 then
            v110 = v108 == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems;
        end;
        if v109 then
            local v111 = v86(l_InventoryItemAvailability_0.Unavailable);
            local v112 = v86(l_InventoryItemAvailability_0.Revoked);
            local v113 = v111 and #v111 > 0;
            local v114 = v112 and #v112 > 0;
            l_v93_0 = function() --[[ Line: 386 ]]
                -- upvalues: v113 (copy), v114 (copy), v98 (copy), v93 (copy), v59 (copy), l_AvatarScreen_0 (ref), v86 (copy), l_InventoryItemAvailability_0 (ref)
                if v113 and v114 then
                    local function v115() --[[ Line: 391 ]]
                        -- upvalues: v98 (ref), v93 (ref)
                        v98(v93);
                    end;
                    v59.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                        items = v86(l_InventoryItemAvailability_0.Unavailable), 
                        messageType = "UnavailableItems", 
                        onConfirm = v115
                    });
                    return;
                elseif v113 then
                    local l_v93_1 = v93;
                    v59.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                        items = v86(l_InventoryItemAvailability_0.Unavailable), 
                        messageType = "UnavailableItems", 
                        onConfirm = l_v93_1
                    });
                    return;
                else
                    if v114 then
                        v98(v93);
                    end;
                    return;
                end;
            end;
        elseif l_FFlagAXInventoryDurablesSupport_0 and v110 then
            l_v93_0 = function() --[[ Line: 401 ]]
                -- upvalues: v93 (copy), v104 (copy)
                v93();
                v104();
            end;
        end;
    end;
    if l_FFlagAXEnableModeratedItemsFlowForDurables_0 and l_FFlagAXInventoryDurablesSupport_0 and not l_FFlagAXModeratedItemsFlow_0 then
        local v117 = v71 and v71.availabilityStatus;
        local _ = nil;
        if v117 == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems then
            l_v93_0 = function() --[[ Line: 420 ]]
                -- upvalues: v93 (copy), v104 (copy)
                v93();
                v104();
            end;
        end;
    end;
    return {
        item = v71, 
        onActivated = l_v93_0, 
        isSelected = v56.isSelected, 
        itemId = v56.itemId, 
        index = v56.index, 
        itemWidth = v56.itemWidth, 
        hasItemFromCurrentPageEquipped = v56.hasItemFromCurrentPageEquipped, 
        impressionsTag = v56.impressionsTag, 
        squareAspectRatio = if v40() then v56.squareAspectRatio else nil, 
        outfitUpdateCounter = if l_FFlagAXSlotAvatarThumbnailPromptFix_0 and v71 and v71.updateCounter then v71.updateCounter else 0, 
        itemStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v51(v71) else nil
    };
end;