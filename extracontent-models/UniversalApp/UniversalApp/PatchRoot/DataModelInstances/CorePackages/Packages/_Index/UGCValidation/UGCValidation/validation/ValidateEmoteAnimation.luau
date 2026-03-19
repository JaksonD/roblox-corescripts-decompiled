local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v4 = require(l_util_0.createEmoteSchema);
local v5 = require(l_util_0.FailureReasonsAccumulator);
local v6 = require(l_util_0.pcallDeferred);
local l_validation_0 = l_Parent_0.validation;
local v8 = require(l_validation_0.validateSingleInstance);
local v9 = require(l_validation_0.validateInstanceTree);
local v10 = require(l_validation_0.validateTags);
local v11 = require(l_validation_0.validateAttributes);
local v12 = require(l_validation_0.validateDependencies);
local v13 = require(l_validation_0.validateModeration);
local v14 = require(l_validation_0.ValidateCurveAnimation);
local v15 = require(l_validation_0.ValidatePropertiesSensible);
local v16 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v17 = {};
local function v21(v18, v19, v20) --[[ Line: 31 ]] --[[ Name: reportError ]]
    -- upvalues: v1 (copy)
    if v20.isServer ~= nil and v20.isServer then
        error(v18);
    end;
    v1.reportFailure(v19, nil, v20);
    return false, {
        v18
    };
end;
v17.validateStructure = function(v22) --[[ Line: 46 ]] --[[ Name: validateStructure ]]
    -- upvalues: v8 (copy), v9 (copy), v4 (copy)
    local v23, v24 = v8(v22.instances or {}, v22);
    if not v23 then
        return false, v24;
    else
        v24 = v22.instances[1];
        local v25, v26 = v9(v4(), v24, v22);
        if not v25 then
            return false, v26;
        else
            return true, nil, v24;
        end;
    end;
end;
v17.validate = function(v27) --[[ Line: 67 ]] --[[ Name: validate ]]
    -- upvalues: v17 (copy), v16 (copy), v15 (copy), v12 (copy), v6 (copy), v21 (copy), v1 (copy), v5 (copy), v10 (copy), v11 (copy), v14 (copy), v13 (copy)
    local v28 = nil;
    local v29, v30, v31 = v17.validateStructure(v27);
    if not v29 then
        return false, v30;
    else
        v28 = v31;
        if v16() then
            v29, v30 = v15.validate(v28, v27);
            if not v29 then
                return false, v30;
            end;
        end;
        v29, v30 = v12(v28, v27);
        if not v29 then
            return false, v30;
        else
            v29 = nil;
            v30, v31 = v6(function() --[[ Line: 93 ]]
                -- upvalues: v28 (ref)
                return (game:GetObjectsAllOrNone(v28.AnimationId));
            end, v27);
            if not v30 or not v31 then
                return v21("Could not download Curve animation.", v1.ErrorType.validateEmoteAnimation_FailedToDownloadCurveAnimation, v27);
            elseif #v31 == 1 then
                v29 = v31[1];
                v30 = v5.new();
                v30:updateReasons(v10(v28, v27));
                v30:updateReasons(v11(v28, v27));
                v30:updateReasons(v14.validate(v29, v27));
                v30:updateReasons(v13(v28, v27.restrictedUserIds, v27));
                return v30:getFinalResults();
            else
                v1.reportFailure(v1.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, v27);
                return false, {
                    "Downloaded Curve animation did not have exactly one root. Please fix the animation."
                };
            end;
        end;
    end;
end;
return v17;