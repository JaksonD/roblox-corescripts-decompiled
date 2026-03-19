local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.util.getExpectedPartSize);
local v6 = require(l_Parent_0.util.BoundsCalculator);
local v7 = {
    [Enum.AssetType.Torso] = true, 
    [Enum.AssetType.LeftArm] = true, 
    [Enum.AssetType.RightArm] = true, 
    [Enum.AssetType.RightLeg] = true, 
    [Enum.AssetType.LeftLeg] = true
};
local v8 = {
    UpperTorso = true
};
local v9 = {
    [Enum.AssetType.LeftLeg] = true, 
    [Enum.AssetType.RightLeg] = true
};
local function v14(v10, v11, v12, v13) --[[ Line: 35 ]] --[[ Name: reportFailure_lowerAboveUpper ]]
    -- upvalues: v2 (copy)
    v2.reportFailure(v2.ErrorType.validateBodyAttPosRelativeToParent_PartAboveParent, nil, v13);
    return false, {
        string.format("%s cannot extend above %s. You can adjust how the parts are put together by moving %s", v11.Name, v10.Name, v12)
    };
end;
local function v19(v15, v16, v17, v18) --[[ Line: 58 ]] --[[ Name: reportFailure_upperBelowLower ]]
    -- upvalues: v2 (copy)
    v2.reportFailure(v2.ErrorType.validateBodyAttPosRelativeToParent_ParentBelowPart, nil, v18);
    return false, {
        string.format("%s cannot extend below %s. You can adjust how the parts are put together by moving %s", v15.Name, v16.Name, v17)
    };
end;
local v41 = {
    validateSinglePartBasedOnBBoxes = function(v20, v21, v22, v23, v24) --[[ Line: 81 ]] --[[ Name: validateSinglePartBasedOnBBoxes ]]
        -- upvalues: v4 (copy), v14 (copy), v19 (copy)
        local v25 = v4.new();
        local l_boundsData_0 = v22[v20.Name].boundsData;
        local l_boundsData_1 = v22[v21.Name].boundsData;
        if l_boundsData_1.maxOverall and l_boundsData_0.maxOverall and l_boundsData_1.maxOverall.Y > l_boundsData_0.maxOverall.Y then
            v25:updateReasons(v14(v20, v21, v23, v24));
        end;
        if l_boundsData_0.minOverall and l_boundsData_1.minOverall and l_boundsData_0.minOverall.Y < l_boundsData_1.minOverall.Y then
            v25:updateReasons(v19(v20, v21, v23, v24));
        end;
        return v25:getFinalResults();
    end, 
    validateSinglePartBasedOnAttachmentYPos = function(v28, v29, v30, v31) --[[ Line: 107 ]] --[[ Name: validateSinglePartBasedOnAttachmentYPos ]]
        -- upvalues: v4 (copy), v5 (copy), v14 (copy), v19 (copy)
        local v32 = v4.new();
        local l_v29_FirstChild_0 = v29:FindFirstChild(v30);
        local l_v28_FirstChild_0 = v28:FindFirstChild(v30);
        assert(l_v29_FirstChild_0);
        assert(l_v28_FirstChild_0);
        local v35 = v5(v29, v31);
        local v36 = v5(v28, v31);
        local l_Y_0 = (v35 / 2 - l_v29_FirstChild_0.Position).Y;
        local l_Y_1 = (v35 / 2 + l_v29_FirstChild_0.Position).Y;
        local l_Y_2 = (v36 / 2 - l_v28_FirstChild_0.Position).Y;
        local l_Y_3 = (v36 / 2 + l_v28_FirstChild_0.Position).Y;
        if l_Y_2 < l_Y_0 then
            v32:updateReasons(v14(v28, v29, v30, v31));
        end;
        if l_Y_1 < l_Y_3 then
            v32:updateReasons(v19(v28, v29, v30, v31));
        end;
        return v32:getFinalResults();
    end
};
v41.runValidation = function(v42, v43) --[[ Line: 142 ]] --[[ Name: runValidation ]]
    -- upvalues: v3 (copy), v7 (copy), v6 (copy), v4 (copy), v8 (copy), v41 (copy), v9 (copy), v2 (copy)
    local v44 = tick();
    local l_assetTypeEnum_0 = v43.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    local v46 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    assert(v46);
    if not v7[l_assetTypeEnum_0] then
        return true;
    else
        local v47, v48, v49 = v6.calculateIndividualAssetPartsData(v42, v43);
        if not v47 then
            return false, v48;
        else
            assert(v49);
            local v50 = v4.new();
            for v51, v52 in pairs(v46.subParts) do
                local v53 = v3.BODYPART_TO_PARENT[v51];
                if v53 ~= nil then
                    local l_v42_FirstChild_0 = v42:FindFirstChild(v51);
                    local l_v42_FirstChild_1 = v42:FindFirstChild(v53);
                    assert(l_v42_FirstChild_0);
                    assert(l_v42_FirstChild_1);
                    local l_l_v42_FirstChild_1_0 = l_v42_FirstChild_1;
                    local l_l_v42_FirstChild_0_0 = l_v42_FirstChild_0;
                    if v8[v51] then
                        l_l_v42_FirstChild_1_0 = l_v42_FirstChild_0;
                        l_l_v42_FirstChild_0_0 = l_v42_FirstChild_1;
                    end;
                    local l_name_0 = v52.rigAttachmentToParent.name;
                    local v59, v60 = v41.validateSinglePartBasedOnBBoxes(l_l_v42_FirstChild_1_0, l_l_v42_FirstChild_0_0, v49, l_name_0, v43);
                    v50:updateReasons(v59, v60);
                    if v59 and v9[l_assetTypeEnum_0] then
                        v50:updateReasons(v41.validateSinglePartBasedOnAttachmentYPos(l_l_v42_FirstChild_1_0, l_l_v42_FirstChild_0_0, l_name_0, v43));
                    end;
                end;
            end;
            v2.recordScriptTime(script.Name, v44, v43);
            return v50:getFinalResults();
        end;
    end;
end;
return v41;