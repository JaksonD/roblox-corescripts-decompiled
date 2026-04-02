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
v8.run = function(v10, v11) --[[ Line: 21 ]]
    -- upvalues: v9 (copy), v4 (copy), v6 (copy), v3 (copy), v7 (copy)
    local l_rootInstance_0 = v11.rootInstance;
    local v13 = v9 / 100;
    for _, v15 in (v4(l_rootInstance_0, "MeshPart")) do
        local v16 = v11.renderMeshesData[v15.Name];
        if v16 then
            local v17 = v16.originalSize * v16.scale * v13 / 2;
            local v18 = v15.CFrame:Inverse();
            for _, v20 in (v4(v15, "Bone")) do
                local l_Position_0 = (v18 * v20.WorldCFrame).Position;
                if not v6.isInRange(l_Position_0, -v17, v17) then
                    v10:fail(v3.Keys.HrdBone_OutOfBounds, {
                        bonePath = v20:GetFullName(), 
                        partName = v15.Name
                    });
                end;
                if not v7.fuzzyEq(v20.Transform, CFrame.identity) then
                    v10:fail(v3.Keys.HrdBone_TransformNotIdentity, {
                        bonePath = v20:GetFullName()
                    });
                end;
            end;
        end;
    end;
end;
return v8;