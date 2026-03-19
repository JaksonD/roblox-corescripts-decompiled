local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v3.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_FFlagAXCustomizeMakeupSupport_0 = v4.FFlagAXCustomizeMakeupSupport;
local v30 = l_memoize_0(function(v11, v12) --[[ Line: 25 ]]
    -- upvalues: v6 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy)
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = true;
    if not v11 or not v12 then
        return {}, v16;
    else
        for _, v18 in v12 do
            if v18.itemType == v6.ItemType.Asset then
                local l_itemSubType_0 = v18.itemSubType;
                if not v6.LCIgnoredForSorting[l_itemSubType_0] and v18.isLayered and (not l_FFlagAXCustomizeMakeupSupport_0 or not l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[l_itemSubType_0]) then
                    v15[l_itemSubType_0] = true;
                    v14[v18.itemId] = v18.order or v6.LayeredClothingOrder[l_itemSubType_0];
                    if v18.order and v18.order ~= v6.LayeredClothingOrder[l_itemSubType_0] then
                        v16 = false;
                    end;
                    table.insert(v13, {
                        id = v18.itemId, 
                        typeId = l_itemSubType_0
                    });
                end;
            elseif v18.bundleInfo then
                for v20, v21 in v18.bundleInfo do
                    local l_assetType_0 = v21.assetType;
                    local v23 = v6.LayeredAssetTypes[l_assetType_0] ~= nil;
                    if not v6.LCIgnoredForSorting[l_assetType_0] and v23 and (not l_FFlagAXCustomizeMakeupSupport_0 or not l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[l_assetType_0]) then
                        v15[l_assetType_0] = true;
                        v14[v20] = v21.order or v6.LayeredClothingOrder[l_assetType_0];
                        if v21.order and v21.order ~= v6.LayeredClothingOrder[l_assetType_0] then
                            v16 = false;
                        end;
                        table.insert(v13, {
                            id = v20, 
                            typeId = l_assetType_0
                        });
                    end;
                end;
            end;
        end;
        for v24, v25 in v11 do
            for v26, v27 in v25 do
                if not v15[v24] and not v6.LCIgnoredForSorting[v24] and v27.isLayered and (not l_FFlagAXCustomizeMakeupSupport_0 or not l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v24]) then
                    v14[v26] = v27.order or v6.LayeredClothingOrder[v24];
                    if v27.order and v27.order ~= v6.LayeredClothingOrder[v24] then
                        v16 = false;
                    end;
                    table.insert(v13, {
                        id = v26, 
                        typeId = v24
                    });
                end;
            end;
        end;
        if v16 then
            return {}, v16;
        else
            table.sort(v13, function(v28, v29) --[[ Line: 125 ]]
                -- upvalues: v14 (copy)
                return v14[v28.id] > v14[v29.id];
            end);
            return v13, v16;
        end;
    end;
end);
return function(v31) --[[ Line: 134 ]]
    -- upvalues: v30 (copy)
    local l_EquippedAssets_0 = v31.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_TryOnItems_0 = v31.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return v30(l_EquippedAssets_0, l_TryOnItems_0);
end;