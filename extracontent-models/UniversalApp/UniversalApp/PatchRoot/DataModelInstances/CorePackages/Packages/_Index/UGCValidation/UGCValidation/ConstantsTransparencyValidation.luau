local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.flags.getFIntUGCValidationHeadThreshold);
local v2 = require(l_Parent_0.flags.getFIntUGCValidationTorsoThresholdFront);
local v3 = require(l_Parent_0.flags.getFIntUGCValidationTorsoThresholdBack);
local v4 = require(l_Parent_0.flags.getFIntUGCValidationTorsoThresholdSide);
local v5 = require(l_Parent_0.flags.getFIntUGCValidationTorsoThresholdTopBottom);
local v6 = require(l_Parent_0.flags.getFIntUGCValidationArmThresholdFront);
local v7 = require(l_Parent_0.flags.getFIntUGCValidationArmThresholdBack);
local v8 = require(l_Parent_0.flags.getFIntUGCValidationArmThresholdSide);
local v9 = require(l_Parent_0.flags.getFIntUGCValidationArmThresholdTopBottom);
local v10 = require(l_Parent_0.flags.getFIntUGCValidationLegThresholdFront);
local v11 = require(l_Parent_0.flags.getFIntUGCValidationLegThresholdBack);
local v12 = require(l_Parent_0.flags.getFIntUGCValidationLegThresholdSide);
local v13 = require(l_Parent_0.flags.getFIntUGCValidationLegThresholdTopBottom);
local v14 = require(l_Parent_0.flags.getFFlagUGCValidateMinBoundsVisibility);
local v15 = require(l_Parent_0.flags.getFStringUGCValidationVisibilityDistributionAspect);
local v16 = require(l_Parent_0.flags.getFIntUGCValidationVisibilityDistributionSliceMax);
local v17 = require(l_Parent_0.flags.getFIntUGCValidationVisibilityDistributionWeight);
local v18 = {
    CAMERA_ANGLES = {
        Front = "Front", 
        Back = "Back", 
        Left = "Left", 
        Right = "Right", 
        Top = "Top", 
        Bottom = "Bottom"
    }, 
    ASSET_TRANSPARENCY_THRESHOLDS = {}
};
v18.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.DynamicHead] = {
    [v18.CAMERA_ANGLES.Front] = v1() / 100, 
    [v18.CAMERA_ANGLES.Back] = v1() / 100, 
    [v18.CAMERA_ANGLES.Left] = v1() / 100, 
    [v18.CAMERA_ANGLES.Right] = v1() / 100, 
    [v18.CAMERA_ANGLES.Top] = v1() / 100, 
    [v18.CAMERA_ANGLES.Bottom] = v1() / 100
};
v18.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.Torso] = {
    [v18.CAMERA_ANGLES.Front] = v2() / 100, 
    [v18.CAMERA_ANGLES.Back] = v3() / 100, 
    [v18.CAMERA_ANGLES.Left] = v4() / 100, 
    [v18.CAMERA_ANGLES.Right] = v4() / 100, 
    [v18.CAMERA_ANGLES.Top] = v5() / 100, 
    [v18.CAMERA_ANGLES.Bottom] = v5() / 100
};
local v19 = {
    [v18.CAMERA_ANGLES.Front] = v6() / 100, 
    [v18.CAMERA_ANGLES.Back] = v7() / 100, 
    [v18.CAMERA_ANGLES.Left] = v8() / 100, 
    [v18.CAMERA_ANGLES.Right] = v8() / 100, 
    [v18.CAMERA_ANGLES.Top] = v9() / 100, 
    [v18.CAMERA_ANGLES.Bottom] = v9() / 100
};
v18.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.LeftArm] = v19;
v18.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.RightArm] = v19;
local v20 = {
    [v18.CAMERA_ANGLES.Front] = v10() / 100, 
    [v18.CAMERA_ANGLES.Back] = v11() / 100, 
    [v18.CAMERA_ANGLES.Left] = v12() / 100, 
    [v18.CAMERA_ANGLES.Right] = v12() / 100, 
    [v18.CAMERA_ANGLES.Top] = v13() / 100, 
    [v18.CAMERA_ANGLES.Bottom] = v13() / 100
};
v18.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.LeftLeg] = v20;
v18.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.RightLeg] = v20;
v18.ASSET_TRANSPARENCY_RASTER_SIZE = 100;
if v14() then
    v18.AREA_OF_INTEREST_TARGET_PIXELS = 600;
    v18.ASSET_TRANSPARENCY_MAX_RASTER_SIZE = 300;
    v18.DISTRIBUTION_ASPECT_CUTOFF = tonumber(v15());
    v18.DISTRIBUTION_SLICE_MAX = v16() / 100;
    v18.DISTRIBUTION_SCORE_WEIGHT = v17() / 100;
end;
return v18;