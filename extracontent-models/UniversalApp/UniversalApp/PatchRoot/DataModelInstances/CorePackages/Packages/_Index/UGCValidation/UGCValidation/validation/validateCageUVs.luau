local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.flags.getFIntUniqueUVTolerance);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v7, v8, v9) --[[ Line: 17 ]] --[[ Name: validateCageUVs ]]
    -- upvalues: v4 (copy), v2 (copy), l_UGCValidationService_0 (copy), v5 (copy), v3 (copy)
    local v10 = tick();
    local l_isServer_0 = v9.isServer;
    local v12 = assert(v4.WRAP_TARGET_CAGE_MESH_UV_COUNTS[v8.Parent.Name], "WrapTarget is not parented to a MeshPart");
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16, v17 = v2(function() --[[ Line: 34 ]]
        -- upvalues: v15 (ref), l_UGCValidationService_0 (ref), v7 (copy), v12 (copy), v5 (ref)
        v15 = l_UGCValidationService_0:CalculateEditableMeshUniqueUVCount(v7.editableMesh);
        return math.abs(v15 - v12) <= v5();
    end, v9);
    v13 = v16;
    v14 = v17;
    if not v13 then
        v16 = string.format("Failed to execute UV check for '%s'. Make sure the UV map exists and try again.", v8:GetFullName());
        if l_isServer_0 then
            error(v16);
        end;
        v3.reportFailure(v3.ErrorType.validateCageUVs_TestExecutedSuccessfully, nil, v9);
        return false, {
            v16
        };
    elseif not v14 then
        v3.reportFailure(v3.ErrorType.validateCageUVs_TestPassed, nil, v9);
        return false, {
            string.format("%s.%s ( %s ) should have %d unique UVs, but has %d. Please make sure the mesh has the required number of unique UVs and try again.", v8:GetFullName(), v7.fieldName, if v7.contentId then v7.contentId else "", v12, v15)
        };
    else
        v3.recordScriptTime(script.Name, v10, v9);
        return true;
    end;
end;