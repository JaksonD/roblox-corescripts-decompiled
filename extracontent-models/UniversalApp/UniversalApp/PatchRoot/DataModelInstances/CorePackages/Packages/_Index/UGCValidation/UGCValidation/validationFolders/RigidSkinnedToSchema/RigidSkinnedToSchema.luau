local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
return {
    fflag = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning), 
    categories = {
        v2.UploadCategory.RIGID_ACCESSORY
    }, 
    requiredData = {
        v2.SharedDataMember.renderMeshesData
    }, 
    run = function(v4, v5) --[[ Line: 11 ]]
        -- upvalues: v3 (copy)
        local l_Handle_0 = v5.renderMeshesData.Handle;
        if l_Handle_0 == nil then
            error("Schema should have ensured data exists for handle");
        end;
        if #l_Handle_0.editable:GetBones() > 0 then
            v4:fail(v3.Keys.AccessorySkinning_RigidIsSkinned);
        end;
    end
};