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
local l_isDurableItemExpired_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.isDurableItemExpired;
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(script.Parent.InventoryItemsList);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local v16 = v14() and game:DefineFastFlag("AXDisableEquippedItemUprankingInAllTab2", false);
local v17 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXUprankBundles);
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXPhotoboothIsStandalone_0 = v18.FFlagAXPhotoboothIsStandalone;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXRemoveExpiredItemsFromInventory_0 = v18.FFlagAXRemoveExpiredItemsFromInventory;
return function(v22, v23, v24) --[[ Line: 47 ]] --[[ Name: useInventoryItems ]]
    -- upvalues: l_useSelector_0 (copy), l_FFlagAXRemoveExpiredItemsFromInventory_0 (copy), v2 (copy), v12 (copy), l_useSignalState_0 (copy), v16 (copy), l_AvatarEditorCategories_0 (copy), l_InventorySorts_0 (copy), l_InventoryItemType_0 (copy), l_FFlagAXPhotoboothIsStandalone_0 (copy), v11 (copy), v17 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v3 (copy), l_isDurableItemExpired_0 (copy)
    local v25 = {};
    local v27 = l_useSelector_0(function(v26) --[[ Line: 54 ]]
        return v26.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    end);
    local v29 = l_useSelector_0(function(v28) --[[ Line: 58 ]]
        return v28.AvatarExperience.AvatarEditor.UprankedItems;
    end);
    local v30 = nil;
    if l_FFlagAXRemoveExpiredItemsFromInventory_0 then
        v30 = l_useSelector_0(function(v31) --[[ Line: 64 ]]
            return v31.AvatarExperience.Common.AssetInfos;
        end);
    end;
    local v32 = v2.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: v12 (ref), v27 (copy), v23 (copy)
        return v12.getEquippedAssetIdsForCategory(v27, v23);
    end, {
        v23
    });
    local v33 = l_useSignalState_0(v24.getSortAndFilters);
    if not v16 or v23.NavigationKey ~= l_AvatarEditorCategories_0.All or v33.sort == l_InventorySorts_0.RecentlyWorn then
        for _, v35 in v32 do
            table.insert(v25, {
                itemId = v35, 
                inventoryItemType = l_InventoryItemType_0.Asset
            });
        end;
    end;
    local v37 = l_useSelector_0(function(v36) --[[ Line: 91 ]]
        return v36.AvatarExperience.AvatarEditor.GrantedItems;
    end);
    if l_FFlagAXPhotoboothIsStandalone_0 and v37 and v23.AssetTypeIdStrings or not l_FFlagAXPhotoboothIsStandalone_0 and v23.AssetTypeIdStrings then
        for _, v39 in v23.AssetTypeIdStrings do
            local v40 = v37.grantedAssetsByType[v39];
            if v40 then
                for _, v42 in v40 do
                    table.insert(v25, {
                        itemId = v42, 
                        inventoryItemType = l_InventoryItemType_0.Asset
                    });
                end;
            end;
        end;
    end;
    if l_FFlagAXPhotoboothIsStandalone_0 and v37 and v23.BundleTypeIdStrings or not l_FFlagAXPhotoboothIsStandalone_0 and v23.BundleTypeIdStrings then
        for _, v44 in v23.BundleTypeIdStrings do
            local v45 = v11.BundleTypeIdStringToOutfitType[v44];
            local v46 = if v45 then v37.grantedOutfitsByType[v45] else nil;
            if v46 then
                for _, v48 in v46 do
                    table.insert(v25, {
                        itemId = v48, 
                        inventoryItemType = l_InventoryItemType_0.Outfit
                    });
                end;
            end;
        end;
    end;
    if v17() and v29 and v23.NavigationKey ~= l_AvatarEditorCategories_0.All then
        for _, v50 in v29 do
            local v51 = tostring(v50.id);
            local v52 = v11.InventoryTypeToBundleTypeId[v50.inventoryType];
            if v52 and v23.BundleTypeIdStrings and v12.Contains(v23.BundleTypeIdStrings, v52) then
                table.insert(v25, {
                    itemId = v51, 
                    inventoryItemType = l_InventoryItemType_0.Outfit
                });
            end;
        end;
    end;
    local v53 = l_useSignalState_0(v22.getItems);
    if v53 then
        if not (l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0) then
            v25 = v3.List.join(v25, v53);
        else
            for _, v55 in v53 do
                local v57 = v3.List.findWhere(v25, function(v56) --[[ Line: 157 ]]
                    -- upvalues: v55 (copy)
                    return v56.itemId == v55.itemId;
                end);
                if v57 then
                    v25[v57] = v55;
                else
                    table.insert(v25, v55);
                end;
            end;
        end;
    else
        for _ = 1, v11.ShimmerCardsToDisplay do
            table.insert(v25, {});
        end;
    end;
    local v59 = {};
    local v60 = {
        [l_InventoryItemType_0.Asset] = {}, 
        [l_InventoryItemType_0.Outfit] = {}, 
        [l_InventoryItemType_0.Unknown] = {}
    };
    for _, v62 in v25 do
        local l_itemId_0 = v62.itemId;
        local l_inventoryItemType_0 = v62.inventoryItemType;
        if l_FFlagAXRemoveExpiredItemsFromInventory_0 and l_itemId_0 and l_inventoryItemType_0 == l_InventoryItemType_0.Asset then
            local v65 = v30[l_itemId_0];
            if v65 and v65.expirationTime and l_isDurableItemExpired_0(v65.expirationTime) then
                continue;
            end;
        end;
        if not l_itemId_0 or not l_inventoryItemType_0 then
            table.insert(v59, v62);
        elseif not v60[l_inventoryItemType_0][l_itemId_0] then
            v60[l_inventoryItemType_0][l_itemId_0] = true;
            table.insert(v59, v62);
        end;
    end;
    return v59;
end;