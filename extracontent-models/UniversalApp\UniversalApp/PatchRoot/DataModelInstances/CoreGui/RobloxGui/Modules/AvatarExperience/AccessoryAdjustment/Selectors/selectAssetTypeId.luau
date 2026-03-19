local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils;
local function v13(v7, v8) --[[ Line: 16 ]]
    for v9, v10 in v7 do
        for v11, _ in v10 do
            if v8 == v11 then
                return v9;
            end;
        end;
    end;
    return nil;
end;
local function v25(v14, v15, v16, v17) --[[ Line: 28 ]]
    for _, v19 in v14 do
        if v19.itemType == "Asset" and v19.itemId == v17 then
            return v19.itemSubType;
        elseif v19.itemType == "Bundle" then
            local v20 = v15[v19.itemId];
            if v20 then
                local l_items_0 = v20.items;
                if l_items_0 ~= nil then
                    for _, v23 in l_items_0 do
                        if v23.type == "Asset" and v23.id == v17 then
                            local v24 = v16[v23.id];
                            if v24 and v24.assetType then
                                return v24.assetType;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return nil;
end;
local v33 = l_memoize_0(function(v26, v27, v28, v29, v30) --[[ Line: 53 ]]
    -- upvalues: v25 (copy), v13 (copy)
    local v31 = v25(v26, v28, v29, v30);
    if v31 then
        return v31;
    else
        local v32 = v13(v27, v30);
        if v32 then
            return v32;
        else
            return nil;
        end;
    end;
end);
return function(v34) --[[ Line: 70 ]]
    -- upvalues: l_FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils_0 (copy), v25 (copy), v13 (copy), v33 (copy)
    local l_TryOnItems_0 = v34.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local l_BundleInfos_0 = v34.AvatarExperience.Common.BundleInfos;
    local l_AssetInfos_0 = v34.AvatarExperience.Common.AssetInfos;
    local l_EquippedAssets_0 = v34.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_SelectedAccessory_0 = v34.AvatarExperience.AccessoryAdjustment.SelectedAccessory;
    if l_FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils_0 then
        local v40 = v25(l_TryOnItems_0, l_BundleInfos_0, l_AssetInfos_0, l_SelectedAccessory_0);
        if v40 then
            return v40;
        else
            local v41 = v13(l_EquippedAssets_0, l_SelectedAccessory_0);
            if v41 then
                return v41;
            else
                return nil;
            end;
        end;
    else
        return v33(l_TryOnItems_0, l_EquippedAssets_0, l_BundleInfos_0, l_AssetInfos_0, l_SelectedAccessory_0);
    end;
end;