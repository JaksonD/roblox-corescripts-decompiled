local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.WrapTargetCageUVReferenceValues);
local v4 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v5 = require(l_Parent_0.Analytics);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v7, v8, v9) --[[ Line: 21 ]] --[[ Name: validateCageUVValues ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), l_UGCValidationService_0 (copy), v5 (copy)
    local v10 = tick();
    local l_isServer_0 = v9.isServer;
    if not v4() then
        return true;
    else
        local v12 = assert(v3[v8.Parent.Name], "WrapTarget is not parented to a MeshPart");
        local v13, v14 = v2(function() --[[ Line: 38 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v12 (copy), v7 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshUVValuesInReference(v12, v7.editableMesh);
        end, v9);
        if not v13 then
            v5.reportFailure(v5.ErrorType.validateCageUVValues_FailedToLoadMesh, nil, v9);
            local v15 = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", v8:GetFullName());
            if l_isServer_0 then
                error(v15);
            end;
            return false, {
                v15
            };
        elseif not v14 then
            v5.reportFailure(v5.ErrorType.validateCageUVValues_UnexpectedUVValue, nil, v9);
            return false, {
                string.format("Found invalid UV value outside [0, 1] range for '%s'. You need to edit the UV map to fix this issue.", v8:GetFullName())
            };
        else
            v5.recordScriptTime(script.Name, v10, v9);
            return true;
        end;
    end;
end;