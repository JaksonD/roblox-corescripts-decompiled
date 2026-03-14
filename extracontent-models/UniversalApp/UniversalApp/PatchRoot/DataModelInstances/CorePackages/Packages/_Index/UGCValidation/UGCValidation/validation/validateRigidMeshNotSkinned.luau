local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.Analytics);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v5, v6) --[[ Line: 13 ]] --[[ Name: validateRigidMeshNotSkinned ]]
    -- upvalues: v2 (copy), l_UGCValidationService_0 (copy), v3 (copy)
    local v7, v8 = v2(function() --[[ Line: 17 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v5 (copy)
        return l_UGCValidationService_0:DoesMeshHaveSkinningData(v5);
    end, v6);
    if not v7 then
        v3.reportFailure(v3.ErrorType.validateRigidMeshSkinning_FailedToDownload, nil, v6);
        return false, {
            "Could not verify underlying mesh data. Please try again or make a bug report."
        };
    elseif v8 then
        v3.reportFailure(v3.ErrorType.validateRigidMeshSkinning_BonesFoundInMesh, nil, v6);
        return false, {
            "This accessory mesh has underlying skinning data, which is not supported for rigid accessories. Ensure that you are not importing bones when loading the mesh into Studio."
        };
    else
        return true;
    end;
end;