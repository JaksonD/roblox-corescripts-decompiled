local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.WrapTargetCageUVReferenceValues);
local v4 = require(l_Parent_0.flags.getFIntUGCValidateCageDuplicateUVThreshold);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationHyperlinksInCageQuality);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.Analytics);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v9, v10, v11, v12) --[[ Line: 19 ]] --[[ Name: validateCageUVDuplicates ]]
    -- upvalues: v3 (copy), v2 (copy), l_UGCValidationService_0 (copy), v7 (copy), v4 (copy), v5 (copy), v6 (copy)
    local v13 = {};
    for _, v15 in pairs(v3) do
        for _, v17 in pairs(v15) do
            table.insert(v13, v17);
        end;
    end;
    local function v24(v18, v19, v20) --[[ Line: 32 ]] --[[ Name: checkCageUV ]]
        -- upvalues: v2 (ref), l_UGCValidationService_0 (ref), v12 (copy), v7 (ref), v11 (copy), v4 (ref), v5 (ref)
        local v21, v22 = v2(function() --[[ Line: 37 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v18 (copy), v19 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshUVDuplicates(v18, v19.editableMesh);
        end, v12);
        if not v21 then
            v7.reportFailure(v7.ErrorType.validateCageUVDuplicate_FailedToExecute, nil, v12);
            return false, {
                (string.format("Failed to load UVs for Inner cage of '%s'. Make sure the UV map exists and try again.", v11.fullName))
            };
        elseif v4() < v22 then
            v7.reportFailure(v7.ErrorType.validateCageUVDuplicate_UnexpectedUVValue, nil, v12);
            local v23 = string.format("There are %d UV values in %s cage that do not belong to the template. Please correct the cage UV.", v22, v20 and "inner" or "outer");
            if v5() then
                v23 = v23 .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageExtraUvs)";
            end;
            return false, {
                v23
            };
        else
            return true;
        end;
    end;
    local v25 = v6.new();
    v25:updateReasons(v24(v13, v9, true));
    v25:updateReasons(v24(v13, v10, false));
    return v25:getFinalResults();
end;