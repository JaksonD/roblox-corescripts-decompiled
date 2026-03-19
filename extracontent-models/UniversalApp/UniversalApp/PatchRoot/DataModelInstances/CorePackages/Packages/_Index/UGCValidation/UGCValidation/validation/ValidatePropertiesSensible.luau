local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local l_util_0 = l_Parent_0.util;
local v4 = require(l_util_0.FailureReasonsAccumulator);
local _ = require(l_util_0.Types);
local v6 = require(l_Parent_0.flags.getFIntUGCValidateMaxHSRDataLen);
local v7 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v8 = {};
local v9 = nil;
local function _() --[[ Line: 23 ]] --[[ Name: createPropertyLengthRestrictions ]]
    -- upvalues: v9 (ref), v6 (copy)
    if v9 then
        return;
    else
        v9 = {
            HiddenSurfaceRemovalAsset = {
                HSRData = v6()
            }
        };
        return;
    end;
end;
v8.resetPropertyLengthRestrictions = function() --[[ Line: 33 ]] --[[ Name: resetPropertyLengthRestrictions ]]
    -- upvalues: v9 (ref)
    v9 = nil;
end;
local function v14(v11) --[[ Line: 37 ]] --[[ Name: validateIndividual ]]
    -- upvalues: l_UGCValidationService_0 (copy), v9 (ref)
    local v12, v13 = l_UGCValidationService_0:ValidatePropertiesSensible(v11, v9[v11.ClassName]);
    if not v12 then
        return false, {
            string.format("%s %s has invalid properties: %s. These properties may be numeric values with NaNs or Infs, or strings/BinaryStrings longer than the max number of characters.", v11.ClassName, v11:GetFullName(), table.concat(v13, ", "))
        };
    else
        return true;
    end;
end;
v8.validate = function(v15, v16) --[[ Line: 58 ]] --[[ Name: validate ]]
    -- upvalues: v7 (copy), v9 (ref), v6 (copy), v4 (copy), v14 (copy), v2 (copy)
    if not v7() then
        return true;
    else
        local v17 = tick();
        if not v9 then
            v9 = {
                HiddenSurfaceRemovalAsset = {
                    HSRData = v6()
                }
            };
        end;
        local v18 = v4.new();
        local l_v15_Descendants_0 = v15:GetDescendants();
        table.insert(l_v15_Descendants_0, v15);
        for _, v21 in l_v15_Descendants_0 do
            v18:updateReasons(v14(v21));
        end;
        if not v18:getFinalResults() then
            v2.reportFailure(v2.ErrorType.validatePropertiesSensible_IncorrectPropertiesFound, nil, v16);
        end;
        v2.recordScriptTime(script.Name, v17, v16);
        return v18:getFinalResults();
    end;
end;
return v8;