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
local function v7(v8, v9, v10) --[[ Line: 15 ]] --[[ Name: fillBoneTreeFlatList ]]
    -- upvalues: v7 (copy)
    for _, v12 in v8:GetChildren() do
        local l_v9_0 = v9;
        if v12:IsA("Bone") then
            l_v9_0 = true;
        end;
        if l_v9_0 then
            table.insert(v10, v12);
        end;
        v7(v12, l_v9_0, v10);
    end;
end;
local function v23(v14, v15, v16) --[[ Line: 30 ]] --[[ Name: nameIsMappedInRigDescriptions ]]
    -- upvalues: v5 (copy)
    for _, v18 in v5.getHrdJointLabels() do
        if v14.Name == v18.Name then
            local l_v15_Joint_0 = v15:GetJoint(v18);
            return l_v15_Joint_0 and l_v15_Joint_0.UniqueId == v14.UniqueId;
        end;
    end;
    if v16 then
        for _, v21 in v5.getDrdJointLabels() do
            if ("%*Hand%*"):format(v16.Side.Name, v21.Name) == v14.Name then
                local l_v16_Joint_0 = v16:GetJoint(v21);
                return l_v16_Joint_0 and l_v16_Joint_0.UniqueId == v14.UniqueId;
            end;
        end;
    end;
    return false;
end;
v6.run = function(v24, v25) --[[ Line: 56 ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), v7 (copy), v23 (copy)
    local l_rootInstance_0 = v25.rootInstance;
    for _, v28 in v4(l_rootInstance_0, "MeshPart") do
        local l_Name_0 = v28.Name;
        local l_HumanoidRigDescription_0 = v28:FindFirstChildWhichIsA("HumanoidRigDescription");
        local l_DigitsRigDescription_0 = v28:FindFirstChildWhichIsA("DigitsRigDescription");
        if l_HumanoidRigDescription_0 == nil then
            for _, v33 in (v4(v28, "Bone")) do
                v24:fail(v3.Keys.HrdCheck_BoneWithoutHrd, {
                    bonePath = v33:GetFullName()
                });
            end;
            if l_DigitsRigDescription_0 ~= nil then
                v24:fail(v3.Keys.HrdCheck_DrdWithoutHrd);
            end;
        else
            local v34 = v5.getAvatarBoneSchema(l_Name_0);
            local v35 = v5.getSchemaFlatHierarchyList(v34, {
                l_Name_0
            });
            local v36 = {};
            v7(v28, false, v36);
            local v37 = {
                [l_Name_0] = true
            };
            for _, v39 in v36 do
                local l_Name_1 = v39.Name;
                local v41 = v35[l_Name_1];
                if l_Name_1 ~= v5.JointRotationName then
                    if v41 == nil or v41.ClassName ~= v39.ClassName then
                        v24:fail(v3.Keys.HrdCheck_UndefinedInstanceInBoneTree, {
                            instName = l_Name_1, 
                            className = v39.ClassName
                        });
                    elseif v37[l_Name_1] then
                        v24:fail(v3.Keys.HrdCheck_DuplicateInstance, {
                            instName = l_Name_1
                        });
                    else
                        v37[l_Name_1] = true;
                        if v41.ClassName == "Bone" and not v23(v39, l_HumanoidRigDescription_0, l_DigitsRigDescription_0) then
                            v24:fail(v3.Keys.HrdCheck_BoneNotMappedInHRD, {
                                boneName = l_Name_1
                            });
                        end;
                    end;
                end;
            end;
            for _, v43 in v28:GetDescendants() do
                local v44 = v35[v43.Name];
                if v44 and v43:IsA("Attachment") and v43.Name ~= v5.JointRotationName then
                    local l_path_0 = v44.path;
                    local v46 = #l_path_0 - 1;
                    if v43.ClassName == "Attachment" then
                        while v46 > 1 and not v37[l_path_0[v46]] do
                            v46 = v46 - 1;
                        end;
                    end;
                    local v47 = v44.path[v46];
                    local l_Name_2 = v43.Parent.Name;
                    if l_Name_2 ~= v47 then
                        v24:fail(v3.Keys.HrdCheck_ImproperParent, {
                            instName = v43.Name, 
                            parentName = l_Name_2, 
                            expectedParentName = v47
                        });
                    end;
                end;
            end;
        end;
    end;
end;
return v6;