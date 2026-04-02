local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.WrapTargetCageUVReferenceValues);
local v4 = require(l_Parent_0.Analytics);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v6, v7, v8) --[[ Line: 19 ]] --[[ Name: validateCageUVValues ]]
    -- upvalues: v3 (copy), v2 (copy), l_UGCValidationService_0 (copy), v4 (copy)
    local v9 = tick();
    local l_isServer_0 = v8.isServer;
    local v11 = assert(v3[v7.Parent.Name], "WrapTarget is not parented to a MeshPart");
    local v12, v13 = v2(function() --[[ Line: 32 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v11 (copy), v6 (copy)
        return l_UGCValidationService_0:ValidateEditableMeshUVValuesInReference(v11, v6.editableMesh);
    end, v8);
    if not v12 then
        v4.reportFailure(v4.ErrorType.validateCageUVValues_FailedToLoadMesh, nil, v8);
        local v14 = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", v7:GetFullName());
        if l_isServer_0 then
            error(v14);
        end;
        return false, {
            v14
        };
    elseif not v13 then
        v4.reportFailure(v4.ErrorType.validateCageUVValues_UnexpectedUVValue, nil, v8);
        return false, {
            string.format("Found invalid UV value outside [0, 1] range for '%s'. You need to edit the UV map to fix this issue.", v7:GetFullName())
        };
    else
        v4.recordScriptTime(script.Name, v9, v8);
        return true;
    end;
end;