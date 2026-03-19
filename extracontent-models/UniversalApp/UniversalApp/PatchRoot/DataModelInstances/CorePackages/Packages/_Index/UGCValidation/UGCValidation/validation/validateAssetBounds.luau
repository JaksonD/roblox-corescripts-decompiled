local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.BoundsCalculator);
local v5 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v6 = require(l_Parent_0.validation.validateScaleType);
local function v17(v7, v8, v9, v10) --[[ Line: 16 ]] --[[ Name: forEachMeshPart ]]
    -- upvalues: v2 (copy)
    local v11 = v8 and v9;
    assert(v7 ~= nil ~= (v11 ~= nil));
    if v7 then
        for _, v13 in v7 do
            if not v10(v13) then
                return false;
            end;
        end;
    else
        local v14 = v2.ASSET_TYPE_INFO[v9];
        assert(v14);
        if Enum.AssetType.DynamicHead == v9 then
            return v10(v8);
        else
            for v15 in pairs(v14.subParts) do
                local l_v8_FirstChild_0 = v8:FindFirstChild(v15);
                assert(l_v8_FirstChild_0);
                if not v10(l_v8_FirstChild_0) then
                    return false;
                end;
            end;
        end;
    end;
    return true;
end;
local function v28(v18, v19, v20, v21) --[[ Line: 50 ]] --[[ Name: getScaleType ]]
    -- upvalues: v17 (copy), v1 (copy), v6 (copy)
    local v22 = v19 and v20;
    assert(v18 ~= nil ~= (v22 ~= nil));
    local v23 = nil;
    if not v17(v18, v19, v20, function(v24) --[[ Line: 60 ]]
        -- upvalues: v23 (ref)
        local l_AvatarPartScaleType_0 = v24:FindFirstChild("AvatarPartScaleType");
        assert(l_AvatarPartScaleType_0);
        if not v23 then
            v23 = l_AvatarPartScaleType_0;
            return true;
        else
            return v23.Value == l_AvatarPartScaleType_0.Value;
        end;
    end) then
        v1.reportFailure(v1.ErrorType.validateAssetBounds_InconsistentAvatarPartScaleType, nil, v21);
        return false, {
            "All MeshParts must have the same value in their AvatarPartScaleType child. Please verify the values match."
        }, nil;
    else
        local v26, v27 = v6(v23, v21);
        return v26, v27, if v26 then v23.Value else nil;
    end;
end;
local function v41(v29, v30, v31, v32) --[[ Line: 88 ]] --[[ Name: validateMinBoundsInternal ]]
    -- upvalues: v5 (copy), v1 (copy)
    local v33 = v5.new();
    local v34 = false;
    local v35 = v31.maxMeshCorner - v31.minMeshCorner;
    for _, v37 in {
        "X", 
        "Y", 
        "Z"
    } do
        local v38 = v35[v37];
        local v39 = v29[v37];
        local v40 = v39 <= v38;
        if not v40 and not v34 then
            v1.reportFailure(v1.ErrorType.validateAssetBounds_AssetSizeTooSmall, nil, v32);
            v34 = true;
        end;
        v33:updateReasons(v40, {
            string.format("%s meshes %s axis size of '%.2f' is smaller than the min allowed bounding box %s axis size of '%.2f'. You need to scale up the meshes.", if v30 then v30.Name else "Full body", v37, v38, v37, v39)
        });
    end;
    return v33:getFinalResults();
end;
local function v54(v42, v43, v44, v45) --[[ Line: 126 ]] --[[ Name: validateMaxBoundsInternal ]]
    -- upvalues: v5 (copy), v1 (copy)
    local v46 = v5.new();
    local v47 = false;
    local v48 = v44.maxOverall - v44.minOverall;
    for _, v50 in {
        "X", 
        "Y", 
        "Z"
    } do
        local v51 = v48[v50];
        local v52 = v42[v50];
        local v53 = v51 <= v52;
        if not v53 and not v47 then
            v1.reportFailure(v1.ErrorType.validateAssetBounds_AssetSizeTooBig, nil, v45);
            v47 = true;
        end;
        v46:updateReasons(v53, {
            string.format("%s meshes and joints %s axis size of '%.2f' is larger than the max allowed bounding box %s axis size of '%.2f'. You need to scale down the meshes/joints", if v43 then v43.Name else "Full body", v50, v51, v50, v52)
        });
    end;
    return v46:getFinalResults();
end;
return function(v55, v56, v57) --[[ Line: 164 ]] --[[ Name: validateAssetBounds ]]
    -- upvalues: v4 (copy), v28 (copy), v5 (copy), v2 (copy), v41 (copy), v54 (copy), v1 (copy)
    local v58 = tick();
    local l_assetTypeEnum_0 = v57.assetTypeEnum;
    local v60 = v56 and l_assetTypeEnum_0;
    assert(v55 ~= nil ~= (v60 ~= nil));
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    if v55 then
        local v64, v65, v66 = v4.calculateFullBodyBounds(v55, v57);
        v61 = v64;
        v62 = v65;
        v63 = v66;
    else
        local v67, v68, v69 = v4.calculateAssetBounds(v56, v57);
        v61 = v67;
        v62 = v68;
        v63 = v69;
    end;
    if not v61 then
        return v61, v62;
    else
        local l_v63_0 = v63;
        local v71 = nil;
        local v72, v73, v74 = v28(v55, v56, l_assetTypeEnum_0, v57);
        v61 = v72;
        v62 = v73;
        v71 = v74;
        if not v61 then
            return v61, v62;
        else
            v72 = v5.new();
            v73 = nil;
            v74 = nil;
            if v55 then
                v73 = v2.FULL_BODY_BOUNDS[v71].minSize;
                v74 = v2.FULL_BODY_BOUNDS[v71].maxSize;
            else
                v73 = v2.ASSET_TYPE_INFO[l_assetTypeEnum_0].bounds[v71].minSize;
                v74 = v2.ASSET_TYPE_INFO[l_assetTypeEnum_0].bounds[v71].maxSize;
            end;
            v72:updateReasons(v41(v73, l_assetTypeEnum_0, l_v63_0, v57));
            v72:updateReasons(v54(v74, l_assetTypeEnum_0, l_v63_0, v57));
            v1.recordScriptTime(script.Name, v58, v57);
            return v72:getFinalResults();
        end;
    end;
end;