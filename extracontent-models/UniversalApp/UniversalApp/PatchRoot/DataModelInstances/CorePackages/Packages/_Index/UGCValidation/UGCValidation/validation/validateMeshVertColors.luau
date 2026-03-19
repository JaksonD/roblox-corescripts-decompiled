local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.Analytics);
return function(v5, v6, v7) --[[ Line: 10 ]] --[[ Name: validateMeshVertexColors ]]
    -- upvalues: v3 (copy), l_UGCValidationService_0 (copy), v4 (copy)
    local v8 = tick();
    local l_isServer_0 = v7.isServer;
    local v10, v11 = v3(function() --[[ Line: 19 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v5 (copy), v6 (copy)
        return l_UGCValidationService_0:ValidateEditableMeshVertColors(v5.editableMesh, v6);
    end, v7);
    if not v10 then
        v4.reportFailure(v4.ErrorType.validateMeshVertexColors_FailedToLoadMesh, nil, v7);
        local v12 = string.format("Failed to load vertex color map for model mesh %s. Make sure it exists and try again.", v5.fullName);
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(v12);
        end;
        return false, {
            v12
        };
    elseif not v11 then
        v4.reportFailure(v4.ErrorType.validateMeshVertexColors_NonNeutralVertexColors, nil, v7);
        return false, {
            string.format("Invalid vertex color found in mesh model '%s'. You need to edit the color map to be all white %s and try again.", v5.fullName, v6 and "with no transarency" or "")
        };
    else
        v4.recordScriptTime(script.Name, v8, v7);
        return true;
    end;
end;