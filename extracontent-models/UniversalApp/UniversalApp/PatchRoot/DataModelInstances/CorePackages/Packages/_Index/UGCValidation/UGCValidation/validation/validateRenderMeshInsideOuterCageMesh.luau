local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.flags.getFIntUGCValidateRenderMeshInsideOuterCageMeshThreshold);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationHyperlinksInCageQuality);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.pcallDeferred);
return function(v7, v8, v9, v10) --[[ Line: 18 ]] --[[ Name: validateRenderMeshInsideOuterCageMesh ]]
    -- upvalues: v6 (copy), l_UGCValidationService_0 (copy), v2 (copy), v3 (copy), v4 (copy)
    local v11 = tick();
    local v12, v13 = v6(function() --[[ Line: 29 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v8 (copy), v9 (copy), v7 (copy)
        return l_UGCValidationService_0:CalculateEditableMeshInsideMeshPercentage(v8.editableMesh, v9.editableMesh, v7.CageOrigin:Inverse(), (Vector3.new(1, 1, 1, 0)));
    end, v10);
    if not v12 then
        local v14 = string.format("Failed to execute render mesh inside outer mesh check for '%s' and '%s'. Make sure the meshes exists and try again.", v8.fullName, v9.fullName);
        if v10.isServer then
            error(v14);
        end;
        v2.reportFailure(v2.ErrorType.validateRenderMeshInsideOuterCageMesh_FailedToExecute, nil, v10);
        return false, {
            v14
        };
    else
        v13 = v13 * 100;
        if v13 < v3() then
            v2.reportFailure(v2.ErrorType.validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded, nil, v10);
            local v15 = string.format("Validation detected %d%% of the accessory is outside its outer cage. Make adjustments to have more of the accessory placed between the cages", 100 - math.floor(v13));
            if v4() then
                v15 = v15 .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageInsideMesh)";
            end;
            return false, {
                v15
            };
        else
            v2.recordScriptTime(script.Name, v11, v10);
            return true;
        end;
    end;
end;