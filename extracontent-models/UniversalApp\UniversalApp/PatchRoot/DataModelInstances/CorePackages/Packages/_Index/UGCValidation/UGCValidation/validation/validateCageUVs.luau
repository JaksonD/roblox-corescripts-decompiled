local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v6 = require(l_Parent_0.flags.getFIntUniqueUVTolerance);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v8, v9, v10) --[[ Line: 18 ]] --[[ Name: validateCageUVs ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), l_UGCValidationService_0 (copy), v6 (copy), v3 (copy)
    local v11 = tick();
    local l_isServer_0 = v10.isServer;
    if not v5() then
        return true;
    else
        local v13 = assert(v4.WRAP_TARGET_CAGE_MESH_UV_COUNTS[v9.Parent.Name], "WrapTarget is not parented to a MeshPart");
        local v14 = nil;
        local v15 = nil;
        local v16 = nil;
        local v17, v18 = v2(function() --[[ Line: 39 ]]
            -- upvalues: v16 (ref), l_UGCValidationService_0 (ref), v8 (copy), v13 (copy), v6 (ref)
            v16 = l_UGCValidationService_0:CalculateEditableMeshUniqueUVCount(v8.editableMesh);
            return math.abs(v16 - v13) <= v6();
        end, v10);
        v14 = v17;
        v15 = v18;
        if not v14 then
            v17 = string.format("Failed to execute UV check for '%s'. Make sure the UV map exists and try again.", v9:GetFullName());
            if l_isServer_0 then
                error(v17);
            end;
            v3.reportFailure(v3.ErrorType.validateCageUVs_TestExecutedSuccessfully, nil, v10);
            return false, {
                v17
            };
        elseif not v15 then
            v3.reportFailure(v3.ErrorType.validateCageUVs_TestPassed, nil, v10);
            return false, {
                string.format("%s.%s ( %s ) should have %d unique UVs, but has %d. Please make sure the mesh has the required number of unique UVs and try again.", v9:GetFullName(), v8.fieldName, if v8.contentId then v8.contentId else "", v13, v16)
            };
        else
            v3.recordScriptTime(script.Name, v11, v10);
            return true;
        end;
    end;
end;