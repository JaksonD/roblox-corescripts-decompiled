local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.util.getAllInstancesIsA);
local v5 = require(l_Parent_0.util.getAllInstancesWithName);
local v6 = require(l_Parent_0.util.R15plusUtils);
return {
    categories = {
        v2.UploadCategory.TORSO_AND_LIMBS, 
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v2.SharedDataMember.rootInstance
    }, 
    fflag = v6.checkFlagEnabledForAllowHrd, 
    run = function(v7, v8) --[[ Line: 16 ]]
        -- upvalues: v4 (copy), v6 (copy), v5 (copy), v3 (copy)
        local l_rootInstance_0 = v8.rootInstance;
        for _, v11 in v4(l_rootInstance_0, "MeshPart") do
            local v12 = v6.getAvatarBoneSchema(v11.Name);
            for v13, v14 in (v6.getNameWhitelistOfClassInSchema(v12, "Attachment")) do
                if v14 then
                    local v15 = v5(v11, v13);
                    if #v15 ~= 1 or v15[1].ClassName ~= "Attachment" then
                        v7:fail(v3.Keys.MissingRequiredAttachment, {
                            attName = v13, 
                            partName = v11.Name
                        });
                    end;
                end;
            end;
        end;
    end
};