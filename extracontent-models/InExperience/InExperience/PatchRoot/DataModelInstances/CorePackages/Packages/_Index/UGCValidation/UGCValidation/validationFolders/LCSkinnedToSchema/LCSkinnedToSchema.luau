local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.validationSystem.ValidationEnums);
local v5 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
return {
    fflag = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning), 
    categories = {
        v4.UploadCategory.LAYERED_CLOTHING
    }, 
    requiredData = {
        v4.SharedDataMember.renderMeshesData
    }, 
    run = function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: l_UGCValidationService_0 (copy), v2 (copy), v5 (copy)
        local l_Handle_0 = v7.rootInstance:FindFirstChild("Handle");
        local l_Handle_1 = v7.renderMeshesData.Handle;
        if l_Handle_0 == nil or l_Handle_1 == nil then
            error("Schema should have ensured data exists for handle");
        end;
        local v10 = {};
        for _, v12 in l_Handle_1.editable:GetBones() do
            table.insert(v10, l_Handle_1.editable:GetBoneName(v12));
        end;
        local v13 = {
            l_UGCValidationService_0:GetSkinnedJointNamesFromEditableMesh(l_Handle_1.editable)
        };
        local l_l_UGCValidationService_0_EditableMeshSkinningTransferJointsInfo_0 = l_UGCValidationService_0:GetEditableMeshSkinningTransferJointsInfo(l_Handle_1.editable);
        local l_WrapLayer_0 = l_Handle_0:FindFirstChildOfClass("WrapLayer");
        assert(l_WrapLayer_0, "WrapLayer not found on handle");
        local v16 = l_WrapLayer_0.AutoSkin == Enum.WrapLayerAutoSkin.EnabledOverride;
        for _, v18 in v10 do
            if v2.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES[v18] then
                if not v16 then
                    v6:fail(v5.Keys.AccessorySkinning_TransferJointWithoutAutoSkin, {
                        jointName = v18
                    });
                end;
            elseif not v2.R15_STANDARD_JOINT_NAMES[v18] then
                v6:fail(v5.Keys.AccessorySkinning_ExtraJoint, {
                    jointName = v18
                });
            end;
        end;
        for _, v20 in l_l_UGCValidationService_0_EditableMeshSkinningTransferJointsInfo_0 do
            if not v20 then
                v6:fail(v5.Keys.AccessorySkinning_WeightNotFull);
                break;
            end;
        end;
        if v2.SkinningTransferRequiredTypes[v7.uploadEnum.assetType] then
            if not v16 then
                v6:fail(v5.Keys.AccessorySkinning_RequiredSkinningTransfer, {
                    assetType = v7.uploadEnum.assetType.Name
                });
            end;
            for v21, _ in v2.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES do
                if table.find(v13, v21) == nil then
                    v6:fail(v5.Keys.AccessorySkinning_MissingTransferJoint, {
                        assetType = v7.uploadEnum.assetType.Name, 
                        requiredJointName = v21
                    });
                end;
            end;
            for _, v24 in v13 do
                if v2.R15_STANDARD_JOINT_NAMES[v24] then
                    local v25 = {};
                    for v26, _ in v2.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES do
                        table.insert(v25, v26);
                    end;
                    v6:fail(v5.Keys.AccessorySkinning_NotLeaderOrFollower, {
                        jointName = v24, 
                        validJointNameList = table.concat(v25, ", ")
                    });
                end;
            end;
        end;
    end
};