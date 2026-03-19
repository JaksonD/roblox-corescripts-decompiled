local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local l_flags_0 = l_Parent_0.flags;
local v4 = require(l_flags_0.getFFlagUGCValidateLegFullBodySeparation);
local v5 = require(l_flags_0.GetFStringUGCValidateLegHipAttachmentRange);
local v6 = require(l_flags_0.GetFStringUGCValidateAllowedLegOverlapMultiplier);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v9 = require(l_util_0.FailureReasonsAccumulator);
local v10 = require(l_util_0.BoundsDataUtils);
local v11 = require(l_util_0.BoundsCalculator);
local v12 = {};
local function v17(v13, v14) --[[ Line: 23 ]] --[[ Name: validateAttachmentPosition ]]
    -- upvalues: v5 (copy)
    if v14 == Enum.AssetType.RightLeg then
        local v15 = v13.RightUpperLeg.Size.X * v5.asNumber();
        if v15 < v13.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X then
            return false, {
                string.format("RightUpperLeg.RightHipRigAttachment.CFrame.Position.X is %.2f and cannot be greater than %.2f. Please fix the Attachment.", v13.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X, v15)
            };
        end;
    elseif v14 == Enum.AssetType.LeftLeg then
        local v16 = -v13.LeftUpperLeg.Size.X * v5.asNumber();
        if v13.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X < v16 then
            return false, {
                string.format("LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X is %.2f and cannot be less than %.2f. Please fix the Attachment.", v13.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X, v16)
            };
        end;
    end;
    return true;
end;
v12.validateAsset = function(v18, v19) --[[ Line: 54 ]] --[[ Name: validateAsset ]]
    -- upvalues: v9 (copy), v17 (copy), v1 (copy)
    local v20 = tick();
    local l_assetTypeEnum_0 = v19.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    if l_assetTypeEnum_0 ~= Enum.AssetType.RightLeg and l_assetTypeEnum_0 ~= Enum.AssetType.LeftLeg then
        return true;
    else
        local v22 = v9.new();
        v22:updateReasons(v17(v18, l_assetTypeEnum_0));
        if not v22:getFinalResults() then
            v1.reportFailure(v1.ErrorType.validateLegsSeparation_InvalidAttachmentPosition, nil, v19);
        end;
        v1.recordScriptTime(script.Name, v20, v19);
        return v22:getFinalResults();
    end;
end;
local function v28(v23, v24) --[[ Line: 83 ]] --[[ Name: calculateBounds ]]
    -- upvalues: v10 (copy)
    local v25 = {};
    for _, v27 in v24 do
        v25 = v10.combineBounds(v25, v23[v27].boundsData);
    end;
    return v25;
end;
local function v44(v29, v30) --[[ Line: 91 ]] --[[ Name: validateFullBodyInternal ]]
    -- upvalues: v11 (copy), v28 (copy), v2 (copy), v10 (copy), v6 (copy)
    local v31, v32, v33 = v11.calculateIndividualFullBodyPartsData(v29, v30, nil, false);
    if not v31 then
        return false, v32;
    else
        local v34 = v28(v33, {
            v2.NAMED_R15_BODY_PARTS.LeftUpperLeg, 
            v2.NAMED_R15_BODY_PARTS.LeftLowerLeg, 
            v2.NAMED_R15_BODY_PARTS.LeftFoot
        });
        local v35 = v10.calculateBoundsCenters(v34);
        local v36 = v10.calculateBoundsDimensions(v34);
        local v37 = v28(v33, {
            v2.NAMED_R15_BODY_PARTS.RightUpperLeg, 
            v2.NAMED_R15_BODY_PARTS.RightLowerLeg, 
            v2.NAMED_R15_BODY_PARTS.RightFoot
        });
        local v38 = v10.calculateBoundsCenters(v37);
        local v39 = v10.calculateBoundsDimensions(v37);
        if not v35 or not v36 or not v38 or not v39 then
            return true;
        else
            local v40 = v38.X - v35.X;
            local v41 = (v36.X + v39.X) * 0.5 - v40;
            if v41 <= 0 then
                return true;
            else
                local v42 = v36.X * v6.asNumber();
                local v43 = v39.X * v6.asNumber();
                if v42 < v41 or v43 < v41 then
                    return false, {
                        string.format("The legs overlap by %.2f studs on the x axis. %.2f is the left leg maximum. %.2f is the right leg maximum. Please adjust the legs to reduce overlap.", v41, v42, v43)
                    };
                else
                    return true;
                end;
            end;
        end;
    end;
end;
v12.validateFullBody = function(v45, v46) --[[ Line: 144 ]] --[[ Name: validateFullBody ]]
    -- upvalues: v4 (copy), v9 (copy), v44 (copy), v1 (copy)
    if not v4() then
        return true;
    else
        local v47 = tick();
        local v48 = v9.new();
        v48:updateReasons(v44(v45, v46));
        if not v48:getFinalResults() then
            v1.reportFailure(v1.ErrorType.validateLegsSeparation_LegsOverlap, nil, v46);
        end;
        v1.recordScriptTime(script.Name, v47, v46);
        return v48:getFinalResults();
    end;
end;
return v12;