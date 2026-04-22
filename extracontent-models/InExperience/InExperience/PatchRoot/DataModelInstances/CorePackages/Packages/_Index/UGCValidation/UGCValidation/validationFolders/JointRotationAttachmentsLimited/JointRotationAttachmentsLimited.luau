local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.util.getDiffBetweenOrientations);
local v5 = require(l_Parent_0.util.valueToString);
local v6 = require(l_Parent_0.util.getAllInstancesWithName);
local v7 = require(l_Parent_0.util.R15plusUtils);
local v8 = {
    categories = {
        v2.UploadCategory.TORSO_AND_LIMBS, 
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v2.SharedDataMember.rootInstance
    }, 
    fflag = v7.checkFlagEnabledForAllowHrd
};
local v9 = game:DefineFastInt("UGCValidationJointRotationMaximumHundredthPositionOffset", 1);
local v10 = game:DefineFastInt("UGCValidationJointRotationMaximumDegreeOrientationOffset", 1);
local v11 = {
    [Enum.AssetType.Torso] = {
        RightShoulderRigAttachment = CFrame.fromOrientation(0, 0, 0), 
        LeftShoulderRigAttachment = CFrame.fromOrientation(0, 3.141592653589793, 0)
    }, 
    [Enum.AssetType.RightArm] = {
        RightShoulderRigAttachment = CFrame.fromOrientation(0, 0, -1.5707963267948966)
    }, 
    [Enum.AssetType.LeftArm] = {
        LeftShoulderRigAttachment = CFrame.fromOrientation(0, 3.141592653589793, -1.5707963267948966)
    }
};
v8.run = function(v12, v13) --[[ Line: 36 ]]
    -- upvalues: v6 (copy), v7 (copy), v3 (copy), v11 (copy), v4 (copy), v10 (copy), v5 (copy), v9 (copy)
    local l_rootInstance_0 = v13.rootInstance;
    local v15 = {
        LeftShoulderRigAttachment = 0, 
        RightShoulderRigAttachment = 0
    };
    for _, v17 in v6(l_rootInstance_0, v7.JointRotationName) do
        local l_Parent_1 = v17.Parent;
        if v17.ClassName ~= "Attachment" or not l_Parent_1:IsA("Attachment") then
            v12:fail(v3.Keys.JointRotAtt_WrongInstanceClass, {
                instPath = v17:GetFullName()
            });
        elseif v15[l_Parent_1.Name] == nil then
            v12:fail(v3.Keys.JointRotAtt_UnrecognizedParent, {
                parentPath = l_Parent_1:GetFullName()
            });
        elseif v15[l_Parent_1.Name] == 1 then
            v12:fail(v3.Keys.JointRotAtt_MultipleAttachments, {
                parentPath = l_Parent_1:GetFullName()
            });
        else
            local l_Name_0 = l_Parent_1.Name;
            v15[l_Name_0] = v15[l_Name_0] + 1;
            if v11[v13.uploadEnum.assetType] ~= nil and v11[v13.uploadEnum.assetType][l_Parent_1.Name] ~= nil then
                l_Name_0 = v11[v13.uploadEnum.assetType][l_Parent_1.Name];
                local l_CFrame_0 = v17.CFrame;
                if v4(l_Name_0, l_CFrame_0) > v10 then
                    local v21 = Vector3.new(l_Name_0:ToOrientation());
                    v21 = Vector3.new(math.deg(v21.X), math.deg(v21.Y), (math.deg(v21.Z)));
                    v12:fail(v3.Keys.JointRotAtt_Rotated, {
                        instPath = v17:GetFullName(), 
                        expectedOrientation = v5(v21)
                    });
                end;
                if (l_CFrame_0.Position - Vector3.new(0, 0, 0, 0)).Magnitude > v9 / 100 then
                    v12:fail(v3.Keys.JointRotAtt_Moved, {
                        instPath = v17:GetFullName(), 
                        expectedPosition = v5((Vector3.new(0, 0, 0, 0)))
                    });
                end;
            end;
        end;
    end;
end;
return v8;