local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_InventoryItemAvailability_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability;
return function(v6, v7) --[[ Line: 31 ]]
    -- upvalues: l_InventoryItemAvailability_0 (copy), v2 (copy), v3 (copy), l_AvatarScreen_0 (copy)
    return function(v8) --[[ Line: 32 ]]
        -- upvalues: l_InventoryItemAvailability_0 (ref), v2 (ref), v3 (ref), v6 (copy), l_AvatarScreen_0 (ref), v7 (copy)
        local v9 = v8:getState();
        local l_EquippedAssets_0 = v9.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local l_AssetInfos_0 = v9.AvatarExperience.Common.AssetInfos;
        if not l_EquippedAssets_0 or not l_AssetInfos_0 then
            return;
        else
            local v12 = {};
            for _, v14 in l_EquippedAssets_0 do
                for v15, v16 in v14 do
                    local v17 = l_AssetInfos_0[v15];
                    if v16.availabilityStatus == l_InventoryItemAvailability_0.Unavailable or v16.availabilityStatus == l_InventoryItemAvailability_0.Revoked then
                        table.insert(v12, {
                            categoryLoc = v2.AssetTypeLocalized[v17.assetType], 
                            assetTypeId = v17.assetType, 
                            itemName = v17.name, 
                            assetId = v15
                        });
                    end;
                end;
            end;
            if #v12 > 0 then
                for _, v19 in v12 do
                    v8:dispatch(v3(v19.assetTypeId, v19.assetId));
                end;
                if v6 then
                    v6.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                        messageType = "ItemsRemovedFromAvatar", 
                        items = v12, 
                        onConfirm = v7
                    });
                end;
            end;
            return;
        end;
    end;
end;