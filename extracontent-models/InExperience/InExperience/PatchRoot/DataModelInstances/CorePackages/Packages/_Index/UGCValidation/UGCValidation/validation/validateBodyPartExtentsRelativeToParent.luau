local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.util.getExpectedPartSize);
local v6 = require(l_Parent_0.util.BoundsCalculator);
local v7 = require(l_Parent_0.util.R15plusUtils);
local v8 = require(l_Parent_0.util.getAttachmentCFrameInPartSpace);
local v9 = {
    [Enum.AssetType.Torso] = true, 
    [Enum.AssetType.LeftArm] = true, 
    [Enum.AssetType.RightArm] = true, 
    [Enum.AssetType.RightLeg] = true, 
    [Enum.AssetType.LeftLeg] = true
};
local v10 = {
    UpperTorso = true
};
local v11 = {
    [Enum.AssetType.LeftLeg] = true, 
    [Enum.AssetType.RightLeg] = true
};
local function v16(v12, v13, v14, v15) --[[ Line: 40 ]] --[[ Name: reportFailure_lowerAboveUpper ]]
    -- upvalues: v2 (copy)
    v2.reportFailure(v2.ErrorType.validateBodyAttPosRelativeToParent_PartAboveParent, nil, v15);
    return false, {
        string.format("%s cannot extend above %s. You can adjust how the parts are put together by moving %s", v13.Name, v12.Name, v14)
    };
end;
local function v21(v17, v18, v19, v20) --[[ Line: 63 ]] --[[ Name: reportFailure_upperBelowLower ]]
    -- upvalues: v2 (copy)
    v2.reportFailure(v2.ErrorType.validateBodyAttPosRelativeToParent_ParentBelowPart, nil, v20);
    return false, {
        string.format("%s cannot extend below %s. You can adjust how the parts are put together by moving %s", v17.Name, v18.Name, v19)
    };
end;
local v45 = {
    validateSinglePartBasedOnBBoxes = function(v22, v23, v24, v25, v26) --[[ Line: 86 ]] --[[ Name: validateSinglePartBasedOnBBoxes ]]
        -- upvalues: v4 (copy), v16 (copy), v21 (copy)
        local v27 = v4.new();
        local l_boundsData_0 = v24[v22.Name].boundsData;
        local l_boundsData_1 = v24[v23.Name].boundsData;
        if l_boundsData_1.maxOverall and l_boundsData_0.maxOverall and l_boundsData_1.maxOverall.Y > l_boundsData_0.maxOverall.Y then
            v27:updateReasons(v16(v22, v23, v25, v26));
        end;
        if l_boundsData_0.minOverall and l_boundsData_1.minOverall and l_boundsData_0.minOverall.Y < l_boundsData_1.minOverall.Y then
            v27:updateReasons(v21(v22, v23, v25, v26));
        end;
        return v27:getFinalResults();
    end, 
    validateSinglePartBasedOnAttachmentYPos = function(v30, v31, v32, v33) --[[ Line: 112 ]] --[[ Name: validateSinglePartBasedOnAttachmentYPos ]]
        -- upvalues: v4 (copy), v7 (copy), v5 (copy), v8 (copy), v16 (copy), v21 (copy)
        local v34 = v4.new();
        local l_v31_FirstChild_0 = v31:FindFirstChild(v32, v7.checkFlagEnabledForAllowHrd());
        local l_v30_FirstChild_0 = v30:FindFirstChild(v32, v7.checkFlagEnabledForAllowHrd());
        assert(l_v31_FirstChild_0);
        assert(l_v30_FirstChild_0);
        local v37 = v5(v31, v33);
        local v38 = v5(v30, v33);
        local l_Position_0 = v8(l_v31_FirstChild_0).Position;
        local l_Position_1 = v8(l_v30_FirstChild_0).Position;
        local l_Y_0 = (v37 / 2 - l_Position_0).Y;
        local l_Y_1 = (v37 / 2 + l_Position_0).Y;
        local l_Y_2 = (v38 / 2 - l_Position_1).Y;
        local l_Y_3 = (v38 / 2 + l_Position_1).Y;
        if l_Y_2 < l_Y_0 then
            v34:updateReasons(v16(v30, v31, v32, v33));
        end;
        if l_Y_1 < l_Y_3 then
            v34:updateReasons(v21(v30, v31, v32, v33));
        end;
        return v34:getFinalResults();
    end
};
v45.runValidation = function(v46, v47) --[[ Line: 150 ]] --[[ Name: runValidation ]]
    -- upvalues: v3 (copy), v9 (copy), v6 (copy), v4 (copy), v10 (copy), v45 (copy), v11 (copy), v2 (copy)
    local v48 = tick();
    local l_assetTypeEnum_0 = v47.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    local v50 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    assert(v50);
    if not v9[l_assetTypeEnum_0] then
        return true;
    else
        local v51, v52, v53 = v6.calculateIndividualAssetPartsData(v46, v47);
        if not v51 then
            return false, v52;
        else
            assert(v53);
            local v54 = v4.new();
            for v55, v56 in pairs(v50.subParts) do
                local v57 = v3.BODYPART_TO_PARENT[v55];
                if v57 ~= nil then
                    local l_v46_FirstChild_0 = v46:FindFirstChild(v55);
                    local l_v46_FirstChild_1 = v46:FindFirstChild(v57);
                    assert(l_v46_FirstChild_0);
                    assert(l_v46_FirstChild_1);
                    local l_l_v46_FirstChild_1_0 = l_v46_FirstChild_1;
                    local l_l_v46_FirstChild_0_0 = l_v46_FirstChild_0;
                    if v10[v55] then
                        l_l_v46_FirstChild_1_0 = l_v46_FirstChild_0;
                        l_l_v46_FirstChild_0_0 = l_v46_FirstChild_1;
                    end;
                    local l_name_0 = v56.rigAttachmentToParent.name;
                    local v63, v64 = v45.validateSinglePartBasedOnBBoxes(l_l_v46_FirstChild_1_0, l_l_v46_FirstChild_0_0, v53, l_name_0, v47);
                    v54:updateReasons(v63, v64);
                    if v63 and v11[l_assetTypeEnum_0] then
                        v54:updateReasons(v45.validateSinglePartBasedOnAttachmentYPos(l_l_v46_FirstChild_1_0, l_l_v46_FirstChild_0_0, l_name_0, v47));
                    end;
                end;
            end;
            v2.recordScriptTime(script.Name, v48, v47);
            return v54:getFinalResults();
        end;
    end;
end;
return v45;