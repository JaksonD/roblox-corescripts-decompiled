local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFIntUGCValidateCageMeshDistanceThreshold);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationHyperlinksInCageQuality);
return function(v7, v8, v9, v10, v11, v12) --[[ Line: 17 ]] --[[ Name: validateCageMeshDistance ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v13, v14 = v4(function() --[[ Line: 25 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
        return l_UGCValidationService_0:CalculateAverageEditableCageMeshDistance(v7.editableMesh, v8.editableMesh, v9.editableMesh, v10, v11);
    end, v12);
    if not v13 then
        v2.reportFailure(v2.ErrorType.validateCageMeshDistance_FailedToExecute, nil, v12);
        return false, {
            string.format("Failed to execute cage mesh distance validation for '%s'. Make sure the cage mesh exists and try again.", v9.fullName)
        };
    else
        local v15 = {};
        local v16 = true;
        if v14 * 100 > v5() or v14 < 0 then
            v16 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshDistance_OuterCageToMeshDistance, nil, v12);
            if v14 < 0 then
                local v17 = "Average distance between outer cage to mesh is too high. Mesh seems to be outside of the outer cage.";
                if v6() then
                    v17 = v17 .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)";
                end;
                table.insert(v15, v17);
            else
                local v18 = string.format("Average distance between outer cage to mesh is too high (%.2f). Make adjustment to cage to fit the mesh better.", v14);
                if v6() then
                    v18 = v18 .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)";
                end;
                table.insert(v15, v18);
            end;
        end;
        return v16, v15;
    end;
end;