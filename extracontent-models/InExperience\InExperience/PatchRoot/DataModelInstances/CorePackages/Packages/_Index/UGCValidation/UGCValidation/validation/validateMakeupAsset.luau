local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validation.validateInstanceTree);
local v3 = require(l_Parent_0.validation.validateModeration);
local v4 = require(l_Parent_0.validation.validateTags);
local v5 = require(l_Parent_0.validation.validatePropertyRequirements);
local v6 = require(l_Parent_0.validation.validateAttributes);
local v7 = require(l_Parent_0.validation.validateSingleInstance);
local v8 = require(l_Parent_0.validation.validateMakeupDecal);
local v9 = require(l_Parent_0.validation.validateWrapTextureTransfer);
local v10 = require(l_Parent_0.validation.ValidatePropertiesSensible);
local v11 = require(l_Parent_0.validation.validateDependencies);
local v12 = require(l_Parent_0.util.createMakeupSchema);
local v13 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v14 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
return function(v15) --[[ Line: 21 ]] --[[ Name: validateMakeupAsset ]]
    -- upvalues: v7 (copy), v12 (copy), v2 (copy), v14 (copy), v10 (copy), v11 (copy), v13 (copy), v5 (copy), v4 (copy), v6 (copy), v3 (copy), v8 (copy), v9 (copy)
    local l_instances_0 = v15.instances;
    local v17 = nil;
    local v18 = nil;
    local v19, v20 = v7(l_instances_0, v15);
    v17 = v19;
    v18 = v20;
    if not v17 then
        return false, v18;
    else
        v19 = l_instances_0[1];
        v20 = v12();
        local v21, v22 = v2(v20, v19, v15);
        v17 = v21;
        v18 = v22;
        if not v17 then
            return false, v18;
        else
            if v14() then
                v21, v22 = v10.validate(v19, v15);
                v17 = v21;
                v18 = v22;
                if not v17 then
                    return false, v18;
                end;
            end;
            v21, v22 = v11(v19, v15);
            v17 = v21;
            v18 = v22;
            if not v17 then
                return false, v18;
            else
                v21 = v13.new();
                v21:updateReasons(v5(v19, nil, v15));
                v21:updateReasons(v4(v19, v15));
                v21:updateReasons(v6(v19, v15));
                v21:updateReasons(v3(v19, {}, v15));
                v21:updateReasons(v8(v19, v15));
                v21:updateReasons(v9(v19, v15));
                return v21:getFinalResults();
            end;
        end;
    end;
end;