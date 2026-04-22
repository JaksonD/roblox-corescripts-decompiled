local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.util.getAllInstancesIsA);
local v5 = require(l_Parent_0.util.R15plusUtils);
local v6 = require(l_Parent_0.util.Vector3Utils);
local v7 = require(l_Parent_0.util.CFrameUtils);
local v8 = {};
local v9 = game:DefineFastInt("UGCValidationBoneCFrameBoundsMultiplierHundredths", 110);
v8.categories = {
    v2.UploadCategory.TORSO_AND_LIMBS, 
    v2.UploadCategory.DYNAMIC_HEAD
};
v8.requiredData = {
    v2.SharedDataMember.rootInstance, 
    v2.SharedDataMember.renderMeshesData
};
v8.fflag = v5.checkFlagEnabledForAllowHrd;
local v10 = game:DefineFastInt("UGCValidationMinimumJointDistanceHundredths", 5) / 100;
v8.run = function(v11, v12) --[[ Line: 22 ]]
    -- upvalues: v9 (copy), v4 (copy), v6 (copy), v3 (copy), v7 (copy), v10 (copy)
    local l_rootInstance_0 = v12.rootInstance;
    local v14 = v9 / 100;
    for _, v16 in (v4(l_rootInstance_0, "MeshPart")) do
        local v17 = v12.renderMeshesData[v16.Name];
        if v17 then
            local v18 = v17.originalSize * v17.scale * v14 / 2;
            local v19 = v16.CFrame:Inverse();
            for _, v21 in (v4(v16, "Bone")) do
                local l_Position_0 = (v19 * v21.WorldCFrame).Position;
                if not v6.isInRange(l_Position_0, -v18, v18) then
                    v11:fail(v3.Keys.HrdBone_OutOfBounds, {
                        bonePath = v21:GetFullName(), 
                        partName = v16.Name
                    });
                end;
                if not v7.fuzzyEq(v21.Transform, CFrame.identity) then
                    v11:fail(v3.Keys.HrdBone_TransformNotIdentity, {
                        bonePath = v21:GetFullName()
                    });
                end;
                if v21.Parent:IsA("Bone") and v21.Position.Magnitude < v10 then
                    v11:fail(v3.Keys.HrdBone_TooCloseToParent, {
                        bonePath = v21:GetFullName()
                    });
                end;
            end;
        end;
    end;
end;
return v8;