local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.util.getEditableMeshFromContext);
local v5 = require(l_Parent_0.flags.getFIntFacsJointMaximumDistRatioDirect);
local v6 = require(l_Parent_0.flags.getFIntFacsJointMaximumDistRatioAccumulated);
local _ = require(l_Parent_0.util.Types);
return function(v8, v9) --[[ Line: 10 ]] --[[ Name: validateFacsJointBounds ]]
    -- upvalues: v3 (copy), v4 (copy), l_UGCValidationService_0 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v12, v13 = v3(function() --[[ Line: 14 ]]
        -- upvalues: v4 (ref), v8 (copy), v9 (copy), l_UGCValidationService_0 (ref)
        local v10, v11 = v4(v8, "MeshId", v9);
        if not v10 then
            error("Failed to retrieve MeshContent");
        end;
        return l_UGCValidationService_0:GetMaximalJointDistancesWithinFacs(v11);
    end, v9);
    if not v12 then
        v2.reportFailure(v2.ErrorType.validateFACSJointTransformsWithinBounds_Error, nil, v9);
        return false, {
            "Failed to validate facial animation joint bounds, please try again later"
        };
    else
        local v14, v15, v16, v17 = unpack(v13);
        if v5() / 100 < v14 then
            return false, {
                (("Head facial animation %* results in joints being moved substantially outside of the head. Please edit your facial animations and try again."):format(v15))
            };
        elseif v6() / 100 < v16 then
            return false, {
                (("Head facial animations can be combined to extend the joint %* far outside the head. Please edit your facial animations and try again."):format(v17))
            };
        else
            return true;
        end;
    end;
end;