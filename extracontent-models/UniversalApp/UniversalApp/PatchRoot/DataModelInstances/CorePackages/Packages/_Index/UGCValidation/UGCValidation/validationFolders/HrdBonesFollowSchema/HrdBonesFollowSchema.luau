local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.util.getAllInstancesIsA);
local v5 = require(l_Parent_0.util.R15plusUtils);
local v6 = {
    categories = {
        v2.UploadCategory.TORSO_AND_LIMBS, 
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v2.SharedDataMember.rootInstance
    }, 
    fflag = v5.checkFlagEnabledForAllowHrd
};
local v7 = game:DefineFastFlag("UGCValidationRemoveHRDBlocker", false);
local function v8(v9, v10, v11) --[[ Line: 16 ]] --[[ Name: fillBoneTreeFlatList ]]
    -- upvalues: v8 (copy)
    for _, v13 in v9:GetChildren() do
        local l_v10_0 = v10;
        if v13:IsA("Bone") then
            l_v10_0 = true;
        end;
        if l_v10_0 then
            table.insert(v11, v13);
        end;
        v8(v13, l_v10_0, v11);
    end;
end;
local function v24(v15, v16, v17) --[[ Line: 31 ]] --[[ Name: nameIsMappedInRigDescriptions ]]
    -- upvalues: v5 (copy)
    for _, v19 in v5.getHrdJointLabels() do
        if v15.Name == v19.Name then
            local l_v16_Joint_0 = v16:GetJoint(v19);
            return l_v16_Joint_0 and l_v16_Joint_0.UniqueId == v15.UniqueId;
        end;
    end;
    if v17 then
        for _, v22 in v5.getDrdJointLabels() do
            if ("%*Hand%*"):format(v17.Side.Name, v22.Name) == v15.Name then
                local l_v17_Joint_0 = v17:GetJoint(v22);
                return l_v17_Joint_0 and l_v17_Joint_0.UniqueId == v15.UniqueId;
            end;
        end;
    end;
    return false;
end;
v6.run = function(v25, v26) --[[ Line: 57 ]]
    -- upvalues: v4 (copy), v7 (copy), v3 (copy), v5 (copy), v8 (copy), v24 (copy)
    local l_rootInstance_0 = v26.rootInstance;
    for _, v29 in v4(l_rootInstance_0, "MeshPart") do
        local l_Name_0 = v29.Name;
        local l_HumanoidRigDescription_0 = v29:FindFirstChildWhichIsA("HumanoidRigDescription");
        local l_DigitsRigDescription_0 = v29:FindFirstChildWhichIsA("DigitsRigDescription");
        if l_HumanoidRigDescription_0 ~= nil and not v7 then
            v25:fail(v3.Keys.HrdCheck_TempR15BonesUploadNotAllowed);
        end;
        if l_HumanoidRigDescription_0 == nil then
            for _, v34 in (v4(v29, "Bone")) do
                v25:fail(v3.Keys.HrdCheck_BoneWithoutHrd, {
                    bonePath = v34:GetFullName()
                });
            end;
            if l_DigitsRigDescription_0 ~= nil then
                v25:fail(v3.Keys.HrdCheck_DrdWithoutHrd);
            end;
        else
            local v35 = v5.getAvatarBoneSchema(l_Name_0);
            local v36 = v5.getSchemaFlatHierarchyList(v35, {
                l_Name_0
            });
            local v37 = {};
            v8(v29, false, v37);
            local v38 = {
                [l_Name_0] = true
            };
            for _, v40 in v37 do
                local l_Name_1 = v40.Name;
                local v42 = v36[l_Name_1];
                if l_Name_1 ~= v5.JointRotationName then
                    if v42 == nil or v42.ClassName ~= v40.ClassName then
                        v25:fail(v3.Keys.HrdCheck_UndefinedInstanceInBoneTree, {
                            instName = l_Name_1, 
                            className = v40.ClassName
                        });
                    elseif v38[l_Name_1] then
                        v25:fail(v3.Keys.HrdCheck_DuplicateInstance, {
                            instName = l_Name_1
                        });
                    else
                        v38[l_Name_1] = true;
                        if v42.ClassName == "Bone" and not v24(v40, l_HumanoidRigDescription_0, l_DigitsRigDescription_0) then
                            v25:fail(v3.Keys.HrdCheck_BoneNotMappedInHRD, {
                                boneName = l_Name_1
                            });
                        end;
                    end;
                end;
            end;
            for _, v44 in v29:GetDescendants() do
                local v45 = v36[v44.Name];
                if v45 and v44:IsA("Attachment") and v44.Name ~= v5.JointRotationName then
                    local l_path_0 = v45.path;
                    local v47 = #l_path_0 - 1;
                    if v44.ClassName == "Attachment" then
                        while v47 > 1 and not v38[l_path_0[v47]] do
                            v47 = v47 - 1;
                        end;
                    end;
                    local v48 = v45.path[v47];
                    local l_Name_2 = v44.Parent.Name;
                    if l_Name_2 ~= v48 then
                        v25:fail(v3.Keys.HrdCheck_ImproperParent, {
                            instName = v44.Name, 
                            parentName = l_Name_2, 
                            expectedParentName = v48
                        });
                    end;
                end;
            end;
        end;
    end;
end;
return v6;