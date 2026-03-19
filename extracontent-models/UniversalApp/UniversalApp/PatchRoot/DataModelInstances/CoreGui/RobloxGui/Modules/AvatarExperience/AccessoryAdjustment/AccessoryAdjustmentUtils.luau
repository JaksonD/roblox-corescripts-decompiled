local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Constants);
local v2 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType);
local v3 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = {
    sliderInfoToVector3s = function(v5) --[[ Line: 11 ]]
        -- upvalues: v2 (copy)
        return Vector3.new(v5[v2.PositionX], v5[v2.PositionY], v5[v2.PositionZ]), Vector3.new(v5[v2.RotationX], v5[v2.RotationY], v5[v2.RotationZ]), (Vector3.new(v5[v2.Scale], v5[v2.Scale], v5[v2.Scale]));
    end, 
    vector3sToSliderInfo = function(v6, v7, v8) --[[ Line: 32 ]]
        -- upvalues: v2 (copy)
        return {
            [v2.PositionX] = v6.X, 
            [v2.PositionY] = v6.Y, 
            [v2.PositionZ] = v6.Z, 
            [v2.RotationX] = v7.X, 
            [v2.RotationY] = v7.Y, 
            [v2.RotationZ] = v7.Z, 
            [v2.Scale] = v8.X
        };
    end
};
v9.getEquippedSliderValues = function(v10, v11) --[[ Line: 51 ]]
    -- upvalues: v9 (copy)
    for _, v13 in v10 do
        for v14, v15 in v13 do
            if v14 == v11 then
                local v16 = if v15.position then v15.position else Vector3.new();
                local v17 = if v15.rotation then v15.rotation else Vector3.new();
                local v18 = if v15.scale then v15.scale else Vector3.new(1, 1, 1, 0);
                return v9.vector3sToSliderInfo(v16, v17, v18);
            end;
        end;
    end;
    return nil;
end;
v9.getTryOnAdjustments = function(v19) --[[ Line: 68 ]]
    -- upvalues: v9 (copy)
    local v20 = if v19.position then v19.position else Vector3.new();
    local v21 = if v19.rotation then v19.rotation else Vector3.new();
    local v22 = if v19.scale then v19.scale else Vector3.new(1, 1, 1, 0);
    return v9.vector3sToSliderInfo(v20, v21, v22);
end;
v9.getTryOnSliderValues = function(v23, v24) --[[ Line: 78 ]]
    -- upvalues: v9 (copy), v1 (copy)
    for _, v26 in v23 do
        local v27 = false;
        if v26.itemType == "Asset" then
            v27 = v26.itemId == v24;
        end;
        if v27 then
            return v9.getTryOnAdjustments(v26);
        elseif v26.itemType == "Bundle" then
            for _, v29 in v23 do
                if v29.bundleInfo and v29.bundleInfo[v24] then
                    local v30 = v29.bundleInfo[v24];
                    return v9.getTryOnAdjustments(v30);
                end;
            end;
        end;
    end;
    return v1.DefaultSliderValues;
end;
local function _(v31) --[[ Line: 98 ]] --[[ Name: checkTryOnItemForAdjustment ]]
    return v31.position and v31.position ~= Vector3.new() or v31.rotation and v31.rotation ~= Vector3.new() or v31.scale and v31.scale ~= Vector3.new(1, 1, 1, 0) or false;
end;
v9.checkTryOnHasAdjustments = function(v33, v34) --[[ Line: 108 ]]
    for _, v36 in v33 do
        local v37 = false;
        if v36.itemType == "Asset" then
            v37 = v36.itemId == v34;
        end;
        if v37 then
            return v36.position and v36.position ~= Vector3.new() or v36.rotation and v36.rotation ~= Vector3.new() or v36.scale and v36.scale ~= Vector3.new(1, 1, 1, 0) or false;
        elseif v36.itemType == "Bundle" then
            for _, v39 in v33 do
                if v39.bundleInfo and v39.bundleInfo[v34] then
                    local v40 = v39.bundleInfo[v34];
                    return v40.position and v40.position ~= Vector3.new() or v40.rotation and v40.rotation ~= Vector3.new() or v40.scale and v40.scale ~= Vector3.new(1, 1, 1, 0) or false;
                end;
            end;
        end;
    end;
    return false;
end;
v9.getSliderValuesWithDefault = function(v41, v42, v43) --[[ Line: 132 ]]
    -- upvalues: v9 (copy), v1 (copy)
    return v9.getEquippedSliderValues(v41, v43) or v9.getTryOnSliderValues(v42, v43) or v1.DefaultSliderValues;
end;
v9.checkSliderValuesChanged = function(v44, v45) --[[ Line: 141 ]]
    -- upvalues: v3 (copy)
    local v46 = false;
    for v47, v48 in v45 do
        if not v3.fuzzyEq(v44[v47], v48) then
            v46 = true;
        end;
    end;
    return v46;
end;
v9.getAdjustableAccessories = function(v49, v50) --[[ Line: 155 ]]
    -- upvalues: v4 (copy), v3 (copy)
    local l_v49_Accessories_0 = v49:GetAccessories(true);
    local v52 = {};
    local v53 = {};
    for _, v55 in v50 do
        v53[tostring(v55)] = true;
    end;
    for _, v57 in l_v49_Accessories_0 do
        if v53[v4.AccessoryTypeEnumToAssetTypeId[v57.AccessoryType]] and not v57.IsLayered then
            local v58 = v3.getSelectedAccessoryDescription(v49, v57.AssetId);
            if v58 then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 169 ]]
                    -- upvalues: v58 (copy)
                    return v58:GetAppliedInstance();
                end);
                if l_status_0 then
                    local l_Handle_0 = l_result_0:FindFirstChild("Handle");
                    if l_Handle_0 and l_Handle_0:IsA("MeshPart") and l_Handle_0.HasSkinnedMesh then
                        continue;
                    end;
                end;
            end;
            table.insert(v52, (tostring(v57.AssetId)));
        end;
    end;
    return v52;
end;
return v9;