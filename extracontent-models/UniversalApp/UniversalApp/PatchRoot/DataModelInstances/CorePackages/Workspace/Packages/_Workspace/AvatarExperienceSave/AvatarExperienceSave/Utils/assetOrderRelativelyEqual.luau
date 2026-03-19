local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local _ = require(l_script_FirstAncestor_0.Context.AvatarSaveContext);
return function(v2, v3, v4) --[[ Line: 17 ]] --[[ Name: assetOrderRelativeEqual ]]
    local v5 = {};
    local l_EquippedAssets_0 = v2.equipped.EquippedAssets;
    local l_EquippedAssets_1 = v3.equipped.EquippedAssets;
    if l_EquippedAssets_0 == nil and l_EquippedAssets_1 == nil then
        return true;
    elseif l_EquippedAssets_0 == nil or l_EquippedAssets_1 == nil then
        return false;
    else
        for v8, v9 in l_EquippedAssets_0 do
            if v4[v8] ~= nil then
                for v10, v11 in v9 do
                    if v11.order ~= nil then
                        table.insert(v5, {
                            itemId = v10, 
                            assetTypeId = v8, 
                            order = v11.order
                        });
                    end;
                end;
            end;
        end;
        local v12 = v2.tryOn.OutfitTryOn.TryOnItems or {};
        for _, v14 in v12 do
            if v4[v14.itemSubType] ~= nil and v14.order ~= nil then
                table.insert(v5, {
                    itemId = v14.itemId, 
                    assetTypeId = v14.itemSubType, 
                    order = v14.order
                });
            end;
        end;
        table.sort(v5, function(v15, v16) --[[ Line: 61 ]]
            return v15.order < v16.order;
        end);
        v12 = nil;
        for _, v18 in v5 do
            if v12 == nil then
                v12 = v18.order;
            end;
            if l_EquippedAssets_1[v18.assetTypeId] ~= nil and l_EquippedAssets_1[v18.assetTypeId][v18.itemId] ~= nil then
                if l_EquippedAssets_1[v18.assetTypeId][v18.itemId].order == nil or l_EquippedAssets_1[v18.assetTypeId][v18.itemId].order < v12 then
                    return false;
                else
                    v12 = l_EquippedAssets_1[v18.assetTypeId][v18.itemId].order;
                end;
            else
                local v19 = false;
                local v20 = v3.tryOn.OutfitTryOn.TryOnItems or {};
                for _, v22 in v20 do
                    if v18.itemId == v22.itemId then
                        if v22.order == nil or v22.order < v12 then
                            return false;
                        else
                            v19 = true;
                            v12 = v22.order;
                            break;
                        end;
                    end;
                end;
                if not v19 then
                    return false;
                end;
            end;
        end;
        return true;
    end;
end;