local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local function v16(v10, v11, v12, v13, v14, v15) --[[ Line: 34 ]] --[[ Name: separateSortedAssets ]]
    if v10[v12.typeId] and v10[v12.typeId][v12.id] then
        v13[v12.id] = {
            assetTypeId = v12.typeId, 
            order = #v11 - v15
        };
        return;
    else
        v14[v12.id] = #v11 - v15;
        return;
    end;
end;
local v42 = l_memoize_0(function(v17, v18, v19, v20, v21, v22, v23, v24) --[[ Line: 53 ]]
    -- upvalues: v5 (copy), v6 (copy), v16 (copy)
    local v25 = {};
    local v26 = nil;
    local v27 = {};
    local v28 = {};
    if v18 == v5.ItemType.Bundle then
        if v22 and v22.items then
            assert(v22, "silence type checker");
            assert(v22.items, "silence type checker");
            for _, v30 in v22.items do
                local v31 = v24[v30.id] and v24[v30.id].assetType;
                if v31 then
                    local v32 = v5.LayeredAssetTypes[v31] ~= nil;
                    if not v21 and not v5.LCIgnoredForSorting[v31] and v32 then
                        local v33, v34 = v6.getTableAndOrderAfterEquippingIntoSort(v20, {
                            id = v30.id, 
                            typeId = v31
                        });
                        v26 = v34;
                        v20 = v33;
                    end;
                    v25[tostring(v30.id)] = {
                        assetType = v31, 
                        order = v26 or v5.LayeredClothingOrder[v31]
                    };
                end;
            end;
            for v35, v36 in pairs(v20) do
                if v25[v36.id] == nil then
                    v16(v23, v20, v36, v27, v28, v35);
                end;
            end;
        end;
    else
        local v37 = v5.LayeredAssetTypes[v19] ~= nil;
        if not v21 and not v5.LCIgnoredForSorting[v19] and v37 then
            local v38, v39 = v6.getTableAndOrderAfterEquippingIntoSort(v20, {
                id = v17, 
                typeId = v19
            });
            v26 = v39;
            for v40, v41 in v38 do
                if v41.id ~= v17 then
                    v16(v23, v38, v41, v27, v28, v40);
                end;
            end;
        end;
    end;
    return {
        overrideOrder = v26, 
        bundleInfoMapping = v25, 
        equippedAssetsToSetOrder = v27, 
        itemIdToOrderMap = v28
    };
end);
return function(v43, v44, v45, v46, v47, v48) --[[ Line: 153 ]]
    -- upvalues: v4 (copy), v42 (copy)
    local l_EquippedAssets_0 = v43.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AssetInfos_0 = v43.AvatarExperience.Common.AssetInfos;
    local v51 = v4.getBundleInfoFromState(v43, v44);
    return v42(v44, v45, v46, v47, v48, v51, l_EquippedAssets_0, l_AssetInfos_0);
end;