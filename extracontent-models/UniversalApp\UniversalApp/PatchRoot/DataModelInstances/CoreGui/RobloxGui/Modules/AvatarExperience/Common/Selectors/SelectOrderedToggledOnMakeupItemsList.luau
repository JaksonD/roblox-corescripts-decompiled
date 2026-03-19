local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v3.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_LAYERED_MAKEUP_ORDER_0 = v3.Constants.LAYERED_MAKEUP_ORDER;
local v26 = l_memoize_0(function(v10, v11) --[[ Line: 24 ]]
    -- upvalues: v5 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy)
    local v12 = {};
    local v13 = {};
    for _, v15 in v11 do
        if v15.itemType == v5.ItemType.Asset then
            local l_itemSubType_0 = v15.itemSubType;
            if l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[l_itemSubType_0] then
                v13[v15.itemId] = v15.order or l_LAYERED_MAKEUP_ORDER_0[l_itemSubType_0];
                table.insert(v12, {
                    id = v15.itemId, 
                    typeId = l_itemSubType_0
                });
            end;
        elseif v15.bundleInfo then
            for v17, v18 in v15.bundleInfo do
                local l_assetType_0 = v18.assetType;
                if l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[l_assetType_0] then
                    v13[v17] = v18.order or l_LAYERED_MAKEUP_ORDER_0[l_assetType_0];
                    table.insert(v12, {
                        id = v17, 
                        typeId = l_assetType_0
                    });
                end;
            end;
        end;
    end;
    for v20, v21 in v10 do
        for v22, v23 in v21 do
            if l_LAYERED_MAKEUP_ORDER_0[v20] then
                v13[v22] = v23.order or l_LAYERED_MAKEUP_ORDER_0[v20];
                table.insert(v12, {
                    id = v22, 
                    typeId = v20
                });
            end;
        end;
    end;
    table.sort(v12, function(v24, v25) --[[ Line: 71 ]]
        -- upvalues: v13 (copy)
        return v13[v24.id] > v13[v25.id];
    end);
    return v12;
end);
return function(v27) --[[ Line: 79 ]]
    -- upvalues: v26 (copy)
    local l_EquippedAssets_0 = v27.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_TryOnItems_0 = v27.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return v26(l_EquippedAssets_0, l_TryOnItems_0);
end;