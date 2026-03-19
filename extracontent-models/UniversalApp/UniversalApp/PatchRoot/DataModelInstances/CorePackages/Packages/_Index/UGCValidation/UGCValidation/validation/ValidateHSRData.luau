local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local l_validation_0 = l_Parent_0.validation;
local v4 = require(l_validation_0.validateTags);
local v5 = require(l_validation_0.validateAttributes);
local v6 = require(l_validation_0.ValidatePropertiesSensible);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v9 = require(l_util_0.FailureReasonsAccumulator);
local v10 = require(l_util_0.ParseContentIds);
local v11 = require(l_Parent_0.util.pcallDeferred);
local v12 = {};
local v13 = require(l_Parent_0.flags.getFFlagUGCValidateHSRMeshIds);
v12.validateHiddenSurfaceRemovalAsset = function(v14, v15) --[[ Line: 31 ]] --[[ Name: validateHiddenSurfaceRemovalAsset ]]
    -- upvalues: v2 (copy), v9 (copy), v4 (copy), v5 (copy), v6 (copy)
    if #v14 ~= 1 then
        v2.reportFailure(v2.ErrorType.validateHSR_FileDataInvalid, nil, v15);
        return false, {
            "WrapLayer HSR asset does not have exactly 1 root"
        };
    else
        local v16 = v14[1];
        if not v16:IsA("HiddenSurfaceRemovalAsset") then
            v2.reportFailure(v2.ErrorType.validateHSR_FileDataInvalid, nil, v15);
            return false, {
                "WrapLayer HSR asset does not have a HiddenSurfaceRemovalAsset as the root Instance"
            };
        else
            local v17 = v9.new();
            v17:updateReasons(#v16:GetDescendants() == 0, {
                "WrapLayer HSR asset has children under the HiddenSurfaceRemovalAsset root Instance"
            });
            v17:updateReasons(v4(v16, v15));
            v17:updateReasons(v5(v16, v15));
            v17:updateReasons(v6.validate(v16, v15));
            if not v17:getFinalResults() then
                v2.reportFailure(v2.ErrorType.validateHSR_FileDataInvalid, nil, v15);
            end;
            return v17:getFinalResults();
        end;
    end;
end;
v12.validateHSRMeshIdData = function(v18, v19, v20) --[[ Line: 62 ]] --[[ Name: validateHSRMeshIdData ]]
    -- upvalues: v13 (copy), v11 (copy), l_UGCValidationService_0 (copy), v2 (copy)
    if not v13() then
        return true;
    elseif #v19 ~= 1 then
        return false, {
            "WrapLayer HSR asset does not have exactly 1 root"
        };
    else
        local v21 = v19[1];
        if not v21:IsA("HiddenSurfaceRemovalAsset") then
            return false, {
                "WrapLayer HSR asset does not have a HiddenSurfaceRemovalAsset as the root Instance"
            };
        else
            local v22, v23 = v11(function() --[[ Line: 81 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v18 (copy), v21 (copy)
                return l_UGCValidationService_0:ValidateHSRMeshIds(v18, v21);
            end, v20);
            if not v22 then
                return false, {
                    "Error occurred while validating HSR Mesh Ids"
                };
            elseif not v23 then
                v2.reportFailure(v2.ErrorType.validataHSR_HSRMeshIdsMismatch, nil, v20);
                return false, {
                    "Invalid HSR data detected. Please re-generate the asset using the Accessory Fitting Tool and try again."
                };
            else
                return true;
            end;
        end;
    end;
end;
v12.validateInstance = function(v24, v25) --[[ Line: 98 ]] --[[ Name: validateInstance ]]
    -- upvalues: v2 (copy), v10 (copy), v13 (copy), v12 (copy), v9 (copy)
    if not v24:IsA("WrapLayer") then
        return true;
    else
        local v26 = v25.isServer and true or false;
        local l_HSRAssetId_0 = v24.HSRAssetId;
        if not l_HSRAssetId_0 or l_HSRAssetId_0 == "" then
            if v26 then
                v2.reportFailure(v2.ErrorType.validateHSR_FileDataInvalid, nil, v25);
                return false, {
                    "WrapLayer HSRAssetId is required"
                };
            else
                return true;
            end;
        elseif not v10.tryGetAssetIdFromContentId(l_HSRAssetId_0) then
            v2.reportFailure(v2.ErrorType.validateHSR_FileDataInvalid, nil, v25);
            return false, {
                "WrapLayer HSRAssetId contains an invalid url"
            };
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 124 ]]
                -- upvalues: l_HSRAssetId_0 (copy)
                return game:GetObjectsAllOrNone(l_HSRAssetId_0);
            end);
            if not l_status_0 then
                if v26 then
                    error("Failed to load WrapLayer HSR asset");
                end;
                v2.reportFailure(v2.ErrorType.validateHSR_FileDataInvalid, nil, v25);
                return false, {
                    "Failed to load WrapLayer HSR asset"
                };
            elseif not v13() then
                return v12.validateHiddenSurfaceRemovalAsset(l_result_0, v25);
            else
                local v30 = v9.new();
                v30:updateReasons(v12.validateHiddenSurfaceRemovalAsset(l_result_0, v25));
                if v30:getFinalResults() then
                    v30:updateReasons(v12.validateHSRMeshIdData(v24, l_result_0, v25));
                end;
                if not v30:getFinalResults() then
                    v2.reportFailure(v2.ErrorType.validateHSR_FileDataInvalid, nil, v25);
                end;
                return v30:getFinalResults();
            end;
        end;
    end;
end;
v12.validate = function(v31, v32) --[[ Line: 160 ]] --[[ Name: validate ]]
    -- upvalues: v9 (copy), v12 (copy), v2 (copy)
    local v33 = tick();
    local v34 = v9.new();
    v34:updateReasons(v12.validateInstance(v31, v32));
    v2.recordScriptTime(script.Name, v33, v32);
    return v34:getFinalResults();
end;
return v12;