local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFIntUGCValidateCageMeshDistanceThreshold);
return function(v6, v7, v8, v9, v10, v11) --[[ Line: 16 ]] --[[ Name: validateCageMeshDistance ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v2 (copy), v5 (copy)
    local v12, v13 = v4(function() --[[ Line: 24 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy)
        return l_UGCValidationService_0:CalculateAverageEditableCageMeshDistance(v6.editableMesh, v7.editableMesh, v8.editableMesh, v9, v10);
    end, v11);
    if not v12 then
        v2.reportFailure(v2.ErrorType.validateCageMeshDistance_FailedToExecute, nil, v11);
        return false, {
            string.format("Failed to execute cage mesh distance validation for '%s'. Make sure the cage mesh exists and try again.", v8.fullName)
        };
    else
        local v14 = {};
        local v15 = true;
        if v13 * 100 > v5() or v13 < 0 then
            v15 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshDistance_OuterCageToMeshDistance, nil, v11);
            if v13 < 0 then
                table.insert(v14, "Average distance between outer cage to mesh is too high. Mesh seems to be outside of the outer cage." .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)");
            else
                table.insert(v14, string.format("Average distance between outer cage to mesh is too high (%.2f). Make adjustment to cage to fit the mesh better.", v13) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)");
            end;
        end;
        return v15, v14;
    end;
end;