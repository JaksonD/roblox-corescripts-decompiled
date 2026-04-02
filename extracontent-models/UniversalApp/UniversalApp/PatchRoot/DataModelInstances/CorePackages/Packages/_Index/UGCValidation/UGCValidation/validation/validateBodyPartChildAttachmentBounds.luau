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
local v10 = require(l_Parent_0.util.R15plusUtils);
local v11 = require(l_Parent_0.util.getAttachmentCFrameInPartSpace);
local function v33(v12, v13, v14, v15, v16) --[[ Line: 21 ]] --[[ Name: validateInMeshSpace ]]
    -- upvalues: v11 (copy), v7 (copy), v2 (copy), v8 (copy), v5 (copy), v9 (copy)
    local v17 = v16.cframe * v11(v12);
    local v18 = v7.calculateBoundsCenters(v16.boundsData);
    local v19 = v7.calculateBoundsDimensions(v16.boundsData);
    if not v18 or not v19 then
        return false, {
            "Missing mesh data for " .. v13.Name
        };
    else
        local v20 = (v17.Position - v18) / (v19 / 2);
        local l_min_0 = v14.min;
        local l_max_0 = v14.max;
        for _, v24 in {
            "X", 
            "Y", 
            "Z"
        } do
            if v20[v24] < l_min_0[v24] or v20[v24] > l_max_0[v24] then
                v2.reportFailure(v2.ErrorType.validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition, nil, v15);
                local v25 = v8.clampAttachmentToBounds(v12, v16, v14, 0.001);
                assert(v18 and v19, "meshCenterOpt and meshDimensionsOpt must be defined");
                local v26, v27 = v8.calculateAcceptableBoundsLocalSpace(v14, v16, v19, v18);
                local l_Position_0 = v26.Position;
                local v29, v30, v31 = v26.Rotation:ToOrientation();
                local v32 = Vector3.new(math.deg(v29), math.deg(v30), (math.deg(v31)));
                return false, {
                    string.format("Attachment (%s) in %s is placed at position [%s] that is outside the valid range. The closest valid position is [%s]. (the attachment must be within the oriented bounding box - Position: [%s], Orientation: [%s], Size: [%s]%s)", v12.Name, v13.Name, v5(v12.CFrame.Position, 3), v5(v25.Position, 3), v5(l_Position_0, 3), v5(v32, 3), v5(v27, 3), if v9() ~= "" then ". See " .. v9() .. " for further explanation" else "")
                };
            end;
        end;
        return true;
    end;
end;
local function v44(v34, _, v36, v37, v38) --[[ Line: 88 ]] --[[ Name: checkAll ]]
    -- upvalues: v4 (copy), v10 (copy), v33 (copy)
    local v39 = v4.new();
    local l_v34_FirstChild_0 = v34:FindFirstChild(v36.rigAttachmentToParent.name, v10.checkFlagEnabledForAllowHrd());
    assert(l_v34_FirstChild_0);
    v39:updateReasons(v33(l_v34_FirstChild_0, v34, v36.rigAttachmentToParent.bounds, v37, v38));
    for v41, v42 in pairs(v36.otherAttachments) do
        local l_v34_FirstChild_1 = v34:FindFirstChild(v41, v10.checkFlagEnabledForAllowHrd());
        assert(l_v34_FirstChild_1);
        v39:updateReasons(v33(l_v34_FirstChild_1, v34, v42.bounds, v37, v38));
    end;
    return v39:getFinalResults();
end;
return function(v45, v46) --[[ Line: 131 ]] --[[ Name: validateBodyPartChildAttachmentBounds ]]
    -- upvalues: v3 (copy), v4 (copy), v6 (copy), v44 (copy), v2 (copy)
    local v47 = tick();
    local l_assetTypeEnum_0 = v46.assetTypeEnum;
    local l_isServer_0 = v46.isServer;
    assert(l_assetTypeEnum_0);
    local v50 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    assert(v50);
    local v51 = v4.new();
    local v52, v53, v54 = v6.calculateIndividualAssetPartsData(v45, v46);
    if not v52 then
        return v52, v53;
    else
        if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
            local v55 = v54[v45.Name];
            v51:updateReasons(v44(v45, l_isServer_0, v50.subParts.Head, v46, v55));
        else
            for v56, v57 in pairs(v50.subParts) do
                local l_v45_FirstChild_0 = v45:FindFirstChild(v56);
                assert(l_v45_FirstChild_0);
                local v59 = v54[v56];
                v51:updateReasons(v44(l_v45_FirstChild_0, l_isServer_0, v57, v46, v59));
            end;
        end;
        v2.recordScriptTime(script.Name, v47, v46);
        return v51:getFinalResults();
    end;
end;