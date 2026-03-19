local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.util.prettyPrintVector3);
local v6 = require(l_Parent_0.util.BoundsCalculator);
local v7 = require(l_Parent_0.util.BoundsDataUtils);
local v8 = require(l_Parent_0.util.MeshSpaceUtils);
local v9 = require(l_Parent_0.flags.getFStringUGCValidationAttachmentErrorLink);
local function v31(v10, v11, v12, v13, v14) --[[ Line: 16 ]] --[[ Name: validateInMeshSpace ]]
    -- upvalues: v7 (copy), v2 (copy), v8 (copy), v5 (copy), v9 (copy)
    local v15 = v14.cframe * v10.CFrame;
    local v16 = v7.calculateBoundsCenters(v14.boundsData);
    local v17 = v7.calculateBoundsDimensions(v14.boundsData);
    if not v16 or not v17 then
        return false, {
            "Missing mesh data for " .. v11.Name
        };
    else
        local v18 = (v15.Position - v16) / (v17 / 2);
        local l_min_0 = v12.min;
        local l_max_0 = v12.max;
        for _, v22 in {
            "X", 
            "Y", 
            "Z"
        } do
            if v18[v22] < l_min_0[v22] or v18[v22] > l_max_0[v22] then
                v2.reportFailure(v2.ErrorType.validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition, nil, v13);
                local v23 = v8.clampAttachmentToBounds(v10, v14, v12, 0.001);
                assert(v16 and v17, "meshCenterOpt and meshDimensionsOpt must be defined");
                local v24, v25 = v8.calculateAcceptableBoundsLocalSpace(v12, v14, v17, v16);
                local l_Position_0 = v24.Position;
                local v27, v28, v29 = v24.Rotation:ToOrientation();
                local v30 = Vector3.new(math.deg(v27), math.deg(v28), (math.deg(v29)));
                return false, {
                    string.format("Attachment (%s) in %s is placed at position [%s] that is outside the valid range. The closest valid position is [%s]. (the attachment must be within the oriented bounding box - Position: [%s], Orientation: [%s], Size: [%s]%s)", v10.Name, v11.Name, v5(v10.CFrame.Position, 3), v5(v23.Position, 3), v5(l_Position_0, 3), v5(v30, 3), v5(v25, 3), if v9() ~= "" then ". See " .. v9() .. " for further explanation" else "")
                };
            end;
        end;
        return true;
    end;
end;
local function v42(v32, _, v34, v35, v36) --[[ Line: 83 ]] --[[ Name: checkAll ]]
    -- upvalues: v4 (copy), v31 (copy)
    local v37 = v4.new();
    local l_v32_FirstChild_0 = v32:FindFirstChild(v34.rigAttachmentToParent.name);
    assert(l_v32_FirstChild_0);
    v37:updateReasons(v31(l_v32_FirstChild_0, v32, v34.rigAttachmentToParent.bounds, v35, v36));
    for v39, v40 in pairs(v34.otherAttachments) do
        local l_v32_FirstChild_1 = v32:FindFirstChild(v39);
        assert(l_v32_FirstChild_1);
        v37:updateReasons(v31(l_v32_FirstChild_1, v32, v40.bounds, v35, v36));
    end;
    return v37:getFinalResults();
end;
return function(v43, v44) --[[ Line: 123 ]] --[[ Name: validateBodyPartChildAttachmentBounds ]]
    -- upvalues: v3 (copy), v4 (copy), v6 (copy), v42 (copy), v2 (copy)
    local v45 = tick();
    local l_assetTypeEnum_0 = v44.assetTypeEnum;
    local l_isServer_0 = v44.isServer;
    assert(l_assetTypeEnum_0);
    local v48 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    assert(v48);
    local v49 = v4.new();
    local v50, v51, v52 = v6.calculateIndividualAssetPartsData(v43, v44);
    if not v50 then
        return v50, v51;
    else
        if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
            local v53 = v52[v43.Name];
            v49:updateReasons(v42(v43, l_isServer_0, v48.subParts.Head, v44, v53));
        else
            for v54, v55 in pairs(v48.subParts) do
                local l_v43_FirstChild_0 = v43:FindFirstChild(v54);
                assert(l_v43_FirstChild_0);
                local v57 = v52[v54];
                v49:updateReasons(v42(l_v43_FirstChild_0, l_isServer_0, v55, v44, v57));
            end;
        end;
        v2.recordScriptTime(script.Name, v45, v44);
        return v49:getFinalResults();
    end;
end;