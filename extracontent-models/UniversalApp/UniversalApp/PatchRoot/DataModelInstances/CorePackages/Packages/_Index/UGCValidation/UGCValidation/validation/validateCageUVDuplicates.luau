local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.WrapTargetCageUVReferenceValues);
local v4 = require(l_Parent_0.flags.getFIntUGCValidateCageDuplicateUVThreshold);
local v5 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v6 = require(l_Parent_0.Analytics);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v8, v9, v10, v11) --[[ Line: 18 ]] --[[ Name: validateCageUVDuplicates ]]
    -- upvalues: v3 (copy), v2 (copy), l_UGCValidationService_0 (copy), v6 (copy), v4 (copy), v5 (copy)
    local v12 = {};
    for _, v14 in pairs(v3) do
        for _, v16 in pairs(v14) do
            table.insert(v12, v16);
        end;
    end;
    local function v22(v17, v18, v19) --[[ Line: 31 ]] --[[ Name: checkCageUV ]]
        -- upvalues: v2 (ref), l_UGCValidationService_0 (ref), v11 (copy), v6 (ref), v10 (copy), v4 (ref)
        local v20, v21 = v2(function() --[[ Line: 36 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v17 (copy), v18 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshUVDuplicates(v17, v18.editableMesh);
        end, v11);
        if not v20 then
            v6.reportFailure(v6.ErrorType.validateCageUVDuplicate_FailedToExecute, nil, v11);
            return false, {
                (string.format("Failed to load UVs for Inner cage of '%s'. Make sure the UV map exists and try again.", v10.fullName))
            };
        elseif v4() < v21 then
            v6.reportFailure(v6.ErrorType.validateCageUVDuplicate_UnexpectedUVValue, nil, v11);
            return false, {
                string.format("There are %d UV values in %s cage that do not belong to the template. Please correct the cage UV.", v21, v19 and "inner" or "outer") .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageExtraUvs)"
            };
        else
            return true;
        end;
    end;
    local v23 = v5.new();
    v23:updateReasons(v22(v12, v8, true));
    v23:updateReasons(v22(v12, v9, false));
    return v23:getFinalResults();
end;