local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.pcallDeferred);
local v7 = require(l_Parent_0.util.getEditableMeshFromContext);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidationEyebrowEyelashSupport);
local v9 = game:DefineFastFlag("EyebrowEyelashRequiresSpecialJoints", false);
return function(v10, v11) --[[ Line: 19 ]] --[[ Name: validateSkinningTransfer ]]
    -- upvalues: v6 (copy), v7 (copy), l_UGCValidationService_0 (copy), v2 (copy), v3 (copy), v8 (copy), v9 (copy), v4 (copy)
    local l_assetTypeEnum_0 = v11.assetTypeEnum;
    local v15, v16 = v6(function() --[[ Line: 25 ]]
        -- upvalues: v7 (ref), v10 (copy), v11 (copy), l_UGCValidationService_0 (ref)
        local v13, v14 = v7(v10, "MeshId", v11);
        if not v13 then
            error("Failed to retrieve MeshContent");
        end;
        return l_UGCValidationService_0:GetEditableMeshSkinningTransferJointsInfo(v14);
    end, v11);
    if not v15 then
        v2.reportFailure(v2.ErrorType.validateSkinningTransfer_FailedToExecute, nil, v11);
        return false, {
            string.format("Failed to execute skinning transfer check for '%s'. Make sure the mesh exists and try again.", v10:GetFullName())
        };
    else
        local v17 = next(v16) ~= nil;
        if v17 then
            local v18 = {};
            for v19 in v16 do
                table.insert(v18, v19);
            end;
            local v20 = table.concat(v18, ", ");
            if v3.isBodyPart(l_assetTypeEnum_0) then
                v2.reportFailure(v2.ErrorType.validateSkinningTransfer_BodyPartsWithSpecialJoints, nil, v11);
                return false, {
                    string.format("Invalid joints [%s] found in body mesh '%s'. Please remove the joints and try again.", v20, v10:GetFullName())
                };
            else
                local l_WrapLayer_0 = v10:FindFirstChildOfClass("WrapLayer");
                assert(l_WrapLayer_0, "MeshPart isn't a body part, so it must be an accessory with a WrapLayer");
                if l_WrapLayer_0.AutoSkin ~= Enum.WrapLayerAutoSkin.EnabledOverride then
                    v2.reportFailure(v2.ErrorType.validateSkinningTransfer_SkinningTransferOverride, nil, v11);
                    return false, {
                        string.format("Skinning Transfer joints [%s] found in '%s'. WrapLayer.AutoSkin must be set to EnabledOverride when joints are present.", v20, v10:GetFullName())
                    };
                end;
            end;
        end;
        if v8() and v9 and not v17 and v4.SkinningTransferRequiredTypes[l_assetTypeEnum_0] then
            v2.reportFailure(v2.ErrorType.validateSkinningTransfer_RequiredAssetTypes, nil, v11);
            return false, {
                string.format("No Skinning Transfer joints found in '%s'. Accessories of type %s are required to use Skinning Transfer with RBX_Leader and RBX_Follower joints.", v10:GetFullName(), l_assetTypeEnum_0.Name)
            };
        else
            for v22, v23 in v16 do
                if not v23 then
                    v2.reportFailure(v2.ErrorType.validateSkinningTransfer_Weights, nil, v11);
                    return false, {
                        string.format("Vert(s) in mesh '%s' are only partially weighted to joint %s. Vert(s) must be fully weighted to this joint.", v10:GetFullName(), v22)
                    };
                end;
            end;
            return true;
        end;
    end;
end;