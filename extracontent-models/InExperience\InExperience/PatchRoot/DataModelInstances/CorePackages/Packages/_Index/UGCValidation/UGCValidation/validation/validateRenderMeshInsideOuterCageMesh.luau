local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.flags.getFIntUGCValidateRenderMeshInsideOuterCageMeshThreshold);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.pcallDeferred);
return function(v6, v7, v8, v9) --[[ Line: 17 ]] --[[ Name: validateRenderMeshInsideOuterCageMesh ]]
    -- upvalues: v5 (copy), l_UGCValidationService_0 (copy), v2 (copy), v3 (copy)
    local v10 = tick();
    local v11, v12 = v5(function() --[[ Line: 28 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v7 (copy), v8 (copy), v6 (copy)
        return l_UGCValidationService_0:CalculateEditableMeshInsideMeshPercentage(v7.editableMesh, v8.editableMesh, v6.CageOrigin:Inverse(), (Vector3.new(1, 1, 1, 0)));
    end, v9);
    if not v11 then
        local v13 = string.format("Failed to execute render mesh inside outer mesh check for '%s' and '%s'. Make sure the meshes exists and try again.", v7.fullName, v8.fullName);
        if v9.isServer then
            error(v13);
        end;
        v2.reportFailure(v2.ErrorType.validateRenderMeshInsideOuterCageMesh_FailedToExecute, nil, v9);
        return false, {
            v13
        };
    else
        v12 = v12 * 100;
        if v12 < v3() then
            v2.reportFailure(v2.ErrorType.validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded, nil, v9);
            return false, {
                string.format("Validation detected %d%% of the accessory is outside its outer cage. Make adjustments to have more of the accessory placed between the cages", 100 - math.floor(v12)) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageInsideMesh)"
            };
        else
            v2.recordScriptTime(script.Name, v10, v9);
            return true;
        end;
    end;
end;