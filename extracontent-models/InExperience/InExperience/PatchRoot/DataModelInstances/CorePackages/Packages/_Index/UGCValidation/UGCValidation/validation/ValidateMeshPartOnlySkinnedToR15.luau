local l_Parent_0 = script.Parent.Parent;
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v2 = require(l_Parent_0.Analytics);
local l_util_0 = l_Parent_0.util;
local v4 = require(l_Parent_0.Constants);
local _ = require(l_util_0.Types);
local v6 = require(l_util_0.pcallDeferred);
local v7 = require(l_Parent_0.util.getEditableMeshFromContext);
local v8 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning);
local v9 = require(l_Parent_0.flags.getFFlagUGCValidationEnableR15plusSkinning);
local v18 = {
    validateMeshPart = function(v10, v11) --[[ Line: 22 ]] --[[ Name: validateMeshPart ]]
        -- upvalues: v8 (copy), v9 (copy), v7 (copy), v2 (copy), v6 (copy), l_UGCValidationService_0 (copy), v4 (copy)
        if v8() and v9() then
            error("ValidateMeshPartOnlySkinnedToR15 is deprecated. Use RigidSkinnedToSchema / LCSkinnedToSchema / BodySkinnedToSchema instead.");
        end;
        local v12, v13 = v7(v10, "MeshId", v11);
        if not v12 then
            v2.reportFailure(v2.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, v11);
            return false, {
                (("Could not get editable mesh data for %*. Please retry later or make a bug report."):format(v10))
            };
        else
            local v14, v15 = v6(function() --[[ Line: 46 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v13 (copy)
                return {
                    l_UGCValidationService_0:GetSkinnedJointNamesFromEditableMesh(v13)
                };
            end, v11);
            if not v14 then
                v2.reportFailure(v2.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, v11);
                return false, {
                    (("Could not get skinning data for %*. Please retry later or make a bug report."):format(v10))
                };
            else
                for _, v17 in v15 do
                    if v4.R15_STANDARD_JOINT_NAMES[v17] == nil then
                        v2.reportFailure(v2.ErrorType.validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints, nil, v11);
                        return false, {
                            (("%* is skinned to a non-standard joint %*. This part may only be skinned to standard R15 joints."):format(v10, v17))
                        };
                    end;
                end;
                return true;
            end;
        end;
    end
};
v18.validateBodyParts = function(v19, v20) --[[ Line: 76 ]] --[[ Name: validateBodyParts ]]
    -- upvalues: v8 (copy), v9 (copy), v4 (copy), v18 (copy)
    if v8() and v9() then
        error("ValidateMeshPartOnlySkinnedToR15 is deprecated. Use RigidSkinnedToSchema / LCSkinnedToSchema / BodySkinnedToSchema instead.");
    end;
    for _, v22 in v4.R15_BODY_PARTS do
        local l_v19_FirstChild_0 = v19:FindFirstChild(v22);
        if l_v19_FirstChild_0 then
            local v24, v25 = v18.validateMeshPart(l_v19_FirstChild_0, v20);
            if not v24 then
                return v24, v25;
            end;
        end;
    end;
    return true;
end;
return v18;