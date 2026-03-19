local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getFIntMaxTotalSurfaceArea);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.Analytics);
return function(v6, v7, v8) --[[ Line: 16 ]] --[[ Name: validateTotalSurfaceArea ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v5 (copy), v2 (copy)
    local v9 = tick();
    local l_isServer_0 = v8.isServer;
    local v11, v12 = v4(function() --[[ Line: 25 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v6 (copy), v7 (copy)
        return l_UGCValidationService_0:CalculateEditableMeshTotalSurfaceArea(v6.editableMesh, v7);
    end, v8);
    if not v11 then
        local v13 = string.format("Failed to execute max total surface area check for '%s'. Make sure mesh exists and try again.", v6.fullName);
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(v13);
        end;
        v5.reportFailure(v5.ErrorType.validateTotalSurfaceArea_FailedToExecute, nil, v8);
        return false, {
            v13
        };
    elseif v2() < v12 then
        v5.reportFailure(v5.ErrorType.validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded, nil, v8);
        return false, {
            string.format("The total surface area of model mesh '%s' is %.2f, it cannot be greater than %d. You must reduce the number and/or size of all triangles.", v6.fullName, v12, v2())
        };
    else
        v5.recordScriptTime(script.Name, v9, v8);
        return true;
    end;
end;