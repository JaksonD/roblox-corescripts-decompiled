local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.Analytics);
local v5 = require(l_Parent_0.Constants);
return function(v6, v7, v8) --[[ Line: 12 ]] --[[ Name: validateMeshTriangles ]]
    -- upvalues: v3 (copy), l_UGCValidationService_0 (copy), v5 (copy), v4 (copy)
    local l_isServer_0 = v8.isServer;
    local v10, v11 = v3(function() --[[ Line: 19 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v6 (copy)
        return l_UGCValidationService_0:GetEditableMeshTriCount(v6.editableMesh);
    end, v8);
    if v7 == nil then
        v7 = v5.MAX_HAT_TRIANGLES;
    end;
    if not v10 then
        v4.reportFailure(v4.ErrorType.validateMeshTriangles_FailedToLoadMesh, nil, v8);
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", v6.fullName));
        end;
        return false, {
            string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", v6.fullName)
        };
    elseif v7 < v11 then
        v4.reportFailure(v4.ErrorType.validateMeshTriangles_TooManyTriangles, nil, v8);
        return false, {
            string.format("Model mesh %s resolution of %d is higher than max support value of %d. You need to retopologize your model and try again.", v6.fullName, v11, v7)
        };
    else
        return true;
    end;
end;