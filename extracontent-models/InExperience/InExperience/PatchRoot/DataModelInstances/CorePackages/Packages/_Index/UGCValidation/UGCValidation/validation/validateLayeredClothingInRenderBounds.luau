local l_Parent_0 = script.Parent.Parent;
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v2 = require(l_Parent_0.Analytics);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v5 = require(l_util_0.pcallDeferred);
local v6 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationLCOOB);
local v7 = require(l_Parent_0.flags.getFFlagEnforceMaxSizeOffsetForLC);
return function(v8, v9) --[[ Line: 17 ]]
    -- upvalues: v6 (copy), v7 (copy), v5 (copy), l_UGCValidationService_0 (copy), v2 (copy)
    if v9.allowEditableInstances then
        return true;
    elseif not v6() then
        return false, {
            "Engine feature 'EngineUGCValidationLCOOB' is not enabled. Skipping validation for layered clothing out of bounds."
        };
    else
        local l_Handle_0 = v8:FindFirstChild("Handle");
        if not l_Handle_0 then
            return false, {
                "Accessory does not have a Handle. Cannot validate layered clothing out of bounds."
            };
        else
            local l_WrapLayer_0 = l_Handle_0:FindFirstChildWhichIsA("WrapLayer");
            if not l_WrapLayer_0 then
                return false, {
                    "Accessory does not have a WrapLayer. Cannot validate layered clothing out of bounds."
                };
            else
                if v7() then
                    if l_WrapLayer_0.MaxSize ~= Vector3.new(0, 0, 0, 0) then
                        return false, {
                            "Accessory has a non-zero MaxSize."
                        };
                    elseif l_WrapLayer_0.Offset ~= Vector3.new(0, 0, 0, 0) then
                        return false, {
                            "Accessory has a non-zero Offset."
                        };
                    end;
                else
                    l_WrapLayer_0.MaxSize = Vector3.new(0, 0, 0, 0);
                    l_WrapLayer_0.Offset = Vector3.new(0, 0, 0, 0);
                end;
                local v12 = tick();
                local v13, v14 = v5(function() --[[ Line: 51 ]]
                    -- upvalues: l_UGCValidationService_0 (ref), v8 (copy)
                    return l_UGCValidationService_0:IsDeformedLayeredClothingOutOfRenderBounds(v8);
                end, v9);
                if not v13 then
                    v2.reportFailure(v2.ErrorType.validateDeformedLayeredClothingInRenderBounds_FailedToExecute, nil, v9);
                    return false, {
                        (string.format("Unable to validate if deformed layered clothing %s is out of render bounds.", v8.Name))
                    };
                else
                    v2.recordScriptTime(script.Name, v12, v9);
                    if v14 then
                        v2.reportFailure(v2.ErrorType.validateDeformedLayeredClothingInRenderBounds_ClothingOutOfBounds, nil, v9);
                        return false, {
                            (string.format("Layered clothing validation failed for '%s'. When deformed, layered clothing becomes too large.", v8.Name))
                        };
                    else
                        return true;
                    end;
                end;
            end;
        end;
    end;
end;