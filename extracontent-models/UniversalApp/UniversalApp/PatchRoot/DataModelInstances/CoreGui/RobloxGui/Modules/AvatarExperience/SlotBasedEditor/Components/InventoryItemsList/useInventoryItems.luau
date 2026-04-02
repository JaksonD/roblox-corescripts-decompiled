local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_InventoryItemType_0 = v6.Enums.InventoryItemType;
local l_AvatarEditorCategories_0 = v6.Enums.AvatarEditorCategories;
local l_InventorySorts_0 = v6.Enums.InventorySorts;
local l_InventoryFilters_0 = v6.Enums.InventoryFilters;
local l_isDurableItemExpired_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.isDurableItemExpired;
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(script.Parent.InventoryItemsList);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local v17 = v15() and game:DefineFastFlag("AXDisableEquippedItemUprankingInAllTab2", false);
local v18 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXUprankBundles);
local v19 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXPhotoboothIsStandalone_0 = v19.FFlagAXPhotoboothIsStandalone;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXRemoveExpiredItemsFromInventory_0 = v19.FFlagAXRemoveExpiredItemsFromInventory;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v19.FFlagAXInventoryDurablesExpiredFilter;
local v38 = l_FFlagAXInventoryDurablesExpiredFilter_0 and function(v24, v25) --[[ Line: 52 ]]
    -- upvalues: v12 (copy)
    local v26 = {};
    if v25.AssetTypeIdStrings then
        for _, v28 in v25.AssetTypeIdStrings do
            local v29 = v24.grantedAssetsByType[v28];
            if v29 then
                for _, v31 in v29 do
                    v26[v31] = true;
                end;
            end;
        end;
    end;
    if v25.BundleTypeIdStrings then
        for _, v33 in v25.BundleTypeIdStrings do
            local v34 = v12.BundleTypeIdStringToOutfitType[v33];
            local v35 = if v34 then v24.grantedOutfitsByType[v34] else nil;
            if v35 then
                for _, v37 in v35 do
                    v26[v37] = true;
                end;
            end;
        end;
    end;
    return v26;
end or nil;
return function(v39, v40, v41) --[[ Line: 79 ]] --[[ Name: useInventoryItems ]]
    -- upvalues: l_useSelector_0 (copy), l_FFlagAXRemoveExpiredItemsFromInventory_0 (copy), v2 (copy), v13 (copy), l_useSignalState_0 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), l_InventoryFilters_0 (copy), v17 (copy), l_AvatarEditorCategories_0 (copy), l_InventorySorts_0 (copy), l_InventoryItemType_0 (copy), l_FFlagAXPhotoboothIsStandalone_0 (copy), v12 (copy), v18 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v3 (copy), v38 (copy), l_isDurableItemExpired_0 (copy)
    local v42 = {};
    local v44 = l_useSelector_0(function(v43) --[[ Line: 86 ]]
        return v43.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    end);
    local v46 = l_useSelector_0(function(v45) --[[ Line: 90 ]]
        return v45.AvatarExperience.AvatarEditor.UprankedItems;
    end);
    local v47 = nil;
    if l_FFlagAXRemoveExpiredItemsFromInventory_0 then
        v47 = l_useSelector_0(function(v48) --[[ Line: 96 ]]
            return v48.AvatarExperience.Common.AssetInfos;
        end);
    end;
    local v50 = l_useSelector_0(function(v49) --[[ Line: 101 ]]
        return v49.AvatarExperience.AvatarEditor.GrantedItems;
    end);
    local v51 = v2.useMemo(function() --[[ Line: 105 ]]
        -- upvalues: v13 (ref), v44 (copy), v40 (copy)
        return v13.getEquippedAssetIdsForCategory(v44, v40);
    end, {
        v40
    });
    local v52 = l_useSignalState_0(v41.getSortAndFilters);
    local v53 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v52.filter == l_InventoryFilters_0.Expired else nil;
    if not l_FFlagAXInventoryDurablesExpiredFilter_0 or not v53 then
        if not v17 or v40.NavigationKey ~= l_AvatarEditorCategories_0.All or v52.sort == l_InventorySorts_0.RecentlyWorn then
            for _, v55 in v51 do
                table.insert(v42, {
                    itemId = v55, 
                    inventoryItemType = l_InventoryItemType_0.Asset
                });
            end;
        end;
        if l_FFlagAXPhotoboothIsStandalone_0 and v50 and v40.AssetTypeIdStrings or not l_FFlagAXPhotoboothIsStandalone_0 and v40.AssetTypeIdStrings then
            for _, v57 in v40.AssetTypeIdStrings do
                local v58 = v50.grantedAssetsByType[v57];
                if v58 then
                    for _, v60 in v58 do
                        table.insert(v42, {
                            itemId = v60, 
                            inventoryItemType = l_InventoryItemType_0.Asset
                        });
                    end;
                end;
            end;
        end;
        if l_FFlagAXPhotoboothIsStandalone_0 and v50 and v40.BundleTypeIdStrings or not l_FFlagAXPhotoboothIsStandalone_0 and v40.BundleTypeIdStrings then
            for _, v62 in v40.BundleTypeIdStrings do
                local v63 = v12.BundleTypeIdStringToOutfitType[v62];
                local v64 = if v63 then v50.grantedOutfitsByType[v63] else nil;
                if v64 then
                    for _, v66 in v64 do
                        table.insert(v42, {
                            itemId = v66, 
                            inventoryItemType = l_InventoryItemType_0.Outfit
                        });
                    end;
                end;
            end;
        end;
        if v18() and v46 and v40.NavigationKey ~= l_AvatarEditorCategories_0.All then
            for _, v68 in v46 do
                local v69 = tostring(v68.id);
                local v70 = v12.InventoryTypeToBundleTypeId[v68.inventoryType];
                if v70 and v40.BundleTypeIdStrings and v13.Contains(v40.BundleTypeIdStrings, v70) then
                    table.insert(v42, {
                        itemId = v69, 
                        inventoryItemType = l_InventoryItemType_0.Outfit
                    });
                end;
            end;
        end;
    end;
    local v71 = l_useSignalState_0(v39.getItems);
    if v71 then
        if not (l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0) then
            v42 = v3.List.join(v42, v71);
        else
            for _, v73 in v71 do
                local v75 = v3.List.findWhere(v42, function(v74) --[[ Line: 197 ]]
                    -- upvalues: v73 (copy)
                    return v74.itemId == v73.itemId;
                end);
                if v75 then
                    v42[v75] = v73;
                else
                    table.insert(v42, v73);
                end;
            end;
        end;
    else
        for _ = 1, v12.ShimmerCardsToDisplay do
            table.insert(v42, {});
        end;
    end;
    local v77 = if l_FFlagAXInventoryDurablesExpiredFilter_0 and v53 and v50 then v38(v50, v40) else nil;
    local v78 = {};
    local v79 = {
        [l_InventoryItemType_0.Asset] = {}, 
        [l_InventoryItemType_0.Outfit] = {}, 
        [l_InventoryItemType_0.Unknown] = {}
    };
    for _, v81 in v42 do
        local l_itemId_0 = v81.itemId;
        local l_inventoryItemType_0 = v81.inventoryItemType;
        if l_FFlagAXRemoveExpiredItemsFromInventory_0 and (not l_FFlagAXInventoryDurablesExpiredFilter_0 or not v53) and l_itemId_0 and l_inventoryItemType_0 == l_InventoryItemType_0.Asset then
            local v84 = nil;
            v84 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v47 and v47[l_itemId_0] else v47[l_itemId_0];
            if v84 and v84.expirationTime and l_isDurableItemExpired_0(v84.expirationTime) then
                continue;
            end;
        end;
        if not l_FFlagAXInventoryDurablesExpiredFilter_0 or not v53 or not l_itemId_0 or not v77 or not v77[l_itemId_0] then
            if not l_itemId_0 or not l_inventoryItemType_0 then
                table.insert(v78, v81);
            elseif not v79[l_inventoryItemType_0][l_itemId_0] then
                v79[l_inventoryItemType_0][l_itemId_0] = true;
                table.insert(v78, v81);
            end;
        end;
    end;
    return v78;
end;