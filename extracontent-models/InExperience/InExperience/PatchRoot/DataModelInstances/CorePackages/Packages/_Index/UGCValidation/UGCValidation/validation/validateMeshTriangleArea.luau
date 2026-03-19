local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.Analytics);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: validateMeshTriangleArea ]]
    -- upvalues: v2 (copy), l_UGCValidationService_0 (copy), v3 (copy)
    local v7 = tick();
    local v8 = if v6 then v6.isServer else nil;
    local v9, v10 = v2(function() --[[ Line: 20 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v5 (copy)
        return l_UGCValidationService_0:ValidateEditableMeshTriangleArea(v5.editableMesh);
    end, v6);
    if not v9 then
        v3.reportFailure(v3.ErrorType.validateMeshTriangleArea_FailedToLoadMesh, nil, v6);
        if v8 then
            error(string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", v5.fullName));
        end;
        return false, {
            string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", v5.fullName)
        };
    elseif not v10 then
        v3.reportFailure(v3.ErrorType.validateMeshTriangleArea_NoArea, nil, v6);
        return false, {
            string.format("Detected zero-area triangle in model mesh %s. You need to edit the mesh to remove zero-area triangles.", v5.fullName)
        };
    else
        v3.recordScriptTime(script.Name, v7, v6);
        return true;
    end;
end;