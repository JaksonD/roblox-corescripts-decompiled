local l_Parent_0 = script.Parent.Parent;
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v2 = require(l_Parent_0.Analytics);
local l_util_0 = l_Parent_0.util;
local v4 = require(l_Parent_0.Constants);
local _ = require(l_util_0.Types);
local v6 = require(l_util_0.pcallDeferred);
local v7 = require(l_Parent_0.util.getEditableMeshFromContext);
local v16 = {
    validateMeshPart = function(v8, v9) --[[ Line: 18 ]] --[[ Name: validateMeshPart ]]
        -- upvalues: v7 (copy), v2 (copy), v6 (copy), l_UGCValidationService_0 (copy), v4 (copy)
        local v10, v11 = v7(v8, "MeshId", v9);
        if not v10 then
            v2.reportFailure(v2.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, v9);
            return false, {
                (("Could not get editable mesh data for %*. Please retry later or make a bug report."):format(v8))
            };
        else
            local v12, v13 = v6(function() --[[ Line: 33 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v11 (copy)
                return {
                    l_UGCValidationService_0:GetSkinnedJointNamesFromEditableMesh(v11)
                };
            end, v9);
            if not v12 then
                v2.reportFailure(v2.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, v9);
                return false, {
                    (("Could not get skinning data for %*. Please retry later or make a bug report."):format(v8))
                };
            else
                for _, v15 in v13 do
                    if v4.R15_STANDARD_JOINT_NAMES[v15] == nil then
                        v2.reportFailure(v2.ErrorType.validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints, nil, v9);
                        return false, {
                            (("%* is skinned to a non-standard joint %*. This part may only be skinned to standard R15 joints."):format(v8, v15))
                        };
                    end;
                end;
                return true;
            end;
        end;
    end
};
v16.validateBodyParts = function(v17, v18) --[[ Line: 63 ]] --[[ Name: validateBodyParts ]]
    -- upvalues: v4 (copy), v16 (copy)
    for _, v20 in v4.R15_BODY_PARTS do
        local l_v17_FirstChild_0 = v17:FindFirstChild(v20);
        if l_v17_FirstChild_0 then
            local v22, v23 = v16.validateMeshPart(l_v17_FirstChild_0, v18);
            if not v22 then
                return v22, v23;
            end;
        end;
    end;
    return true;
end;
return v16;