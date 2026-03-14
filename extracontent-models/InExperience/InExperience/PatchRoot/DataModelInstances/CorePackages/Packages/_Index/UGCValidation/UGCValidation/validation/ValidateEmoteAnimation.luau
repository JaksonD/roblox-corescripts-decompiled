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
local l_flags_0 = l_Parent_0.flags;
local v17 = require(l_flags_0.getFFlagUGCValidateNoDoubleRoots);
local v18 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v19 = {};
local function v23(v20, v21, v22) --[[ Line: 33 ]] --[[ Name: reportError ]]
    -- upvalues: v1 (copy)
    if v22.isServer ~= nil and v22.isServer then
        error(v20);
    end;
    v1.reportFailure(v21, nil, v22);
    return false, {
        v20
    };
end;
v19.validateStructure = function(v24) --[[ Line: 48 ]] --[[ Name: validateStructure ]]
    -- upvalues: v8 (copy), v9 (copy), v4 (copy)
    local v25, v26 = v8(v24.instances or {}, v24);
    if not v25 then
        return false, v26;
    else
        v26 = v24.instances[1];
        local v27, v28 = v9(v4(), v26, v24);
        if not v27 then
            return false, v28;
        else
            return true, nil, v26;
        end;
    end;
end;
v19.validate = function(v29) --[[ Line: 69 ]] --[[ Name: validate ]]
    -- upvalues: v19 (copy), v18 (copy), v15 (copy), v12 (copy), v6 (copy), v17 (copy), v23 (copy), v1 (copy), v5 (copy), v10 (copy), v11 (copy), v14 (copy), v13 (copy)
    local v30 = nil;
    local v31, v32, v33 = v19.validateStructure(v29);
    if not v31 then
        return false, v32;
    else
        v30 = v33;
        if v18() then
            v31, v32 = v15.validate(v30, v29);
            if not v31 then
                return false, v32;
            end;
        end;
        v31, v32 = v12(v30, v29);
        if not v31 then
            return false, v32;
        else
            v31 = nil;
            v32, v33 = v6(function() --[[ Line: 95 ]]
                -- upvalues: v30 (ref), v17 (ref)
                local l_game_ObjectsAllOrNone_0 = game:GetObjectsAllOrNone(v30.AnimationId);
                if v17() then
                    return l_game_ObjectsAllOrNone_0;
                elseif l_game_ObjectsAllOrNone_0 and #l_game_ObjectsAllOrNone_0 > 0 then
                    return l_game_ObjectsAllOrNone_0[1];
                else
                    return nil;
                end;
            end, v29);
            if not v32 or not v33 then
                return v23("Could not download Curve animation.", v1.ErrorType.validateEmoteAnimation_FailedToDownloadCurveAnimation, v29);
            else
                if v17() then
                    if #v33 == 1 then
                        v31 = v33[1];
                    else
                        v1.reportFailure(v1.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, v29);
                        return false, {
                            "Downloaded Curve animation did not have exactly one root. Please fix the animation."
                        };
                    end;
                else
                    v31 = v33;
                end;
                v32 = v5.new();
                v32:updateReasons(v10(v30, v29));
                v32:updateReasons(v11(v30, v29));
                v32:updateReasons(v14.validate(v31, v29));
                v32:updateReasons(v13(v30, v29.restrictedUserIds, v29));
                return v32:getFinalResults();
            end;
        end;
    end;
end;
return v19;