local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.validationSystem.ValidationEnums);
local v4 = require(l_Parent_0.util.R15plusUtils);
local v5 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
return {
    fflag = require(l_Parent_0.flags.getFFlagUGCValidationEnableR15plusSkinning), 
    categories = {
        v3.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v3.SharedDataMember.renderMeshesData
    }, 
    run = function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v5 (copy)
        local v8 = v4.getJointNameWhitelist();
        local l_Head_0 = v7.renderMeshesData.Head;
        for _, v11 in {
            l_UGCValidationService_0:GetFacsDrivenJointNamesFromEditableMesh(l_Head_0.editable)
        } do
            if v8[v11] then
                v6:fail(v5.Keys.UnallowedFacsJoints, {
                    jointName = v11
                });
            end;
        end;
    end
};