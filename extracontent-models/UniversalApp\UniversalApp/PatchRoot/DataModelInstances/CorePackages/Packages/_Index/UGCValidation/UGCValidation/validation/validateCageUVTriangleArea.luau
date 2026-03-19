local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.Analytics);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: validateCageUVTriangleArea ]]
    -- upvalues: v3 (copy), l_UGCValidationService_0 (copy), v4 (copy)
    local v7 = tick();
    local l_isServer_0 = v6.isServer;
    local v9, v10 = v3(function() --[[ Line: 20 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v5 (copy)
        return l_UGCValidationService_0:ValidateEditableMeshCageUVTriangleArea(v5.editableMesh);
    end, v6);
    if not v9 then
        if l_isServer_0 then
            error(string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", v5.fullName));
        end;
        v4.reportFailure(v4.ErrorType.validateCageUVTriangleArea_FailedToLoadMesh, nil, v6);
        return false, {
            string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", v5.fullName)
        };
    elseif not v10 then
        v4.reportFailure(v4.ErrorType.validateCageUVTriangleArea_ZeroAreaTriangle, nil, v6);
        return false, {
            string.format("Detected zero-area triangle in UV map of '%s'. You need to edit the UV map to fix this issue.", v5.fullName)
        };
    else
        v4.recordScriptTime(script.Name, v7, v6);
        return true;
    end;
end;