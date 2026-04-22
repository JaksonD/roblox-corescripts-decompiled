local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.validationSystem.ValidationEnums);
local v4 = require(l_Parent_0.util.R15plusUtils);
local v5 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v6 = require(l_Parent_0.Constants);
return {
    fflag = require(l_Parent_0.flags.getFFlagUGCValidationEnableR15plusSkinning), 
    categories = {
        v3.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v3.SharedDataMember.renderMeshesData
    }, 
    run = function(v7, v8) --[[ Line: 14 ]]
        -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v6 (copy), v5 (copy)
        local v9 = v4.getJointNameWhitelist();
        local l_Head_0 = v8.renderMeshesData.Head;
        for _, v12 in {
            l_UGCValidationService_0:GetFacsDrivenJointNamesFromEditableMesh(l_Head_0.editable)
        } do
            if v9[v12] or v6.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES[v12] then
                v7:fail(v5.Keys.UnallowedFacsJoints, {
                    jointName = v12
                });
            end;
        end;
    end
};