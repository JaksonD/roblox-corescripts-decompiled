local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.ValidationRulesUtil);
local v4 = require(l_Parent_0.validationSystem.ValidationEnums);
local v5 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v6 = require(l_Parent_0.util.Vector3Utils);
local v7 = require(l_Parent_0.util.valueToString);
local v8 = {};
local v9 = game:DefineFastInt("LCPostDeformSizeMultiplierEyebrowEyelashHundredths", 100) / 100;
local v10 = {
    [Enum.AssetType.EyebrowAccessory] = v9, 
    [Enum.AssetType.EyelashAccessory] = v9
};
local v11 = game:DefineFastInt("LCPostDeformSizeMultiplierGeneralHundredths", 100) / 100;
v8.fflag = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationExactLCDeformationSize);
v8.categories = {
    v4.UploadCategory.LAYERED_CLOTHING
};
v8.requiredData = {
    v4.SharedDataMember.renderMeshesData
};
v8.run = function(v12, v13) --[[ Line: 28 ]]
    -- upvalues: v3 (copy), v10 (copy), v11 (copy), l_UGCValidationService_0 (copy), v6 (copy), v5 (copy), v7 (copy)
    local l_Handle_0 = v13.rootInstance:FindFirstChild("Handle");
    local l_Handle_1 = v13.renderMeshesData.Handle;
    local l_assetType_0 = v13.uploadEnum.assetType;
    if l_Handle_0 == nil or l_Handle_1 == nil then
        error("Schema should have ensured data exists for handle");
    end;
    local v17, v18 = v3:getLCSizeLimit(l_assetType_0, l_Handle_0);
    if not v17 or v18 == nil then
        error("Could not find matching attachment on Handle for " .. l_assetType_0.Name);
    end;
    local v19 = v18 * (v10[l_assetType_0] or v11);
    local l_l_UGCValidationService_0_LayeredClothingPostDeformationSize_0 = l_UGCValidationService_0:GetLayeredClothingPostDeformationSize(v13.rootInstance, l_Handle_1.editable, l_Handle_1.scale);
    if not v6.isFirstLessOrEqual(l_l_UGCValidationService_0_LayeredClothingPostDeformationSize_0, v19) then
        v12:fail(v5.Keys.LCDeformTooLarge, {
            maxSize = v7(v19)
        });
    end;
end;
return v8;