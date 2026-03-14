local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFIntUGCValidationVertexDensityThreshold);
local v5 = require(l_Parent_0.Analytics);
return function(v6, v7, v8) --[[ Line: 11 ]] --[[ Name: validateMaxCubeDensity ]]
    -- upvalues: v3 (copy), l_UGCValidationService_0 (copy), v5 (copy), v4 (copy)
    local v9 = tick();
    local l_isServer_0 = v7.isServer;
    local v11, v12 = v3(function() --[[ Line: 19 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v6 (copy), v8 (copy)
        return l_UGCValidationService_0:GetEditableMeshMaxNearbyVerticesCollisions(v6.editableMesh, v8);
    end, v7);
    if not v11 then
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(string.format("Failed to execute vertex density check for '%s'. Make sure mesh exists and try again.", v6.fullName));
        end;
        v5.reportFailure(v5.ErrorType.validateVertexDensity_FailedToExecute, nil, v7);
        return false, {
            string.format("Failed to execute vertex density check for '%s'. Make sure mesh exists and try again.", v6.fullName)
        };
    elseif v4() < v12 then
        v5.reportFailure(v5.ErrorType.validateVertexDensity_MaxDensityExceeded, nil, v7);
        return false, {
            "The maximum vertex density has been exceeded. Reduce the number of vertices that are very close to each other."
        };
    else
        v5.recordScriptTime(script.Name, v9, v7);
        return true;
    end;
end;