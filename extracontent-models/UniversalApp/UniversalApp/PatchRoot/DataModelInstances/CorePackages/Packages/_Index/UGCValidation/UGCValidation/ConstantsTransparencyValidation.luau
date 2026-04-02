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
local v14 = {
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
v14.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.DynamicHead] = {
    [v14.CAMERA_ANGLES.Front] = v1() / 100, 
    [v14.CAMERA_ANGLES.Back] = v1() / 100, 
    [v14.CAMERA_ANGLES.Left] = v1() / 100, 
    [v14.CAMERA_ANGLES.Right] = v1() / 100, 
    [v14.CAMERA_ANGLES.Top] = v1() / 100, 
    [v14.CAMERA_ANGLES.Bottom] = v1() / 100
};
v14.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.Torso] = {
    [v14.CAMERA_ANGLES.Front] = v2() / 100, 
    [v14.CAMERA_ANGLES.Back] = v3() / 100, 
    [v14.CAMERA_ANGLES.Left] = v4() / 100, 
    [v14.CAMERA_ANGLES.Right] = v4() / 100, 
    [v14.CAMERA_ANGLES.Top] = v5() / 100, 
    [v14.CAMERA_ANGLES.Bottom] = v5() / 100
};
local v15 = {
    [v14.CAMERA_ANGLES.Front] = v6() / 100, 
    [v14.CAMERA_ANGLES.Back] = v7() / 100, 
    [v14.CAMERA_ANGLES.Left] = v8() / 100, 
    [v14.CAMERA_ANGLES.Right] = v8() / 100, 
    [v14.CAMERA_ANGLES.Top] = v9() / 100, 
    [v14.CAMERA_ANGLES.Bottom] = v9() / 100
};
v14.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.LeftArm] = v15;
v14.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.RightArm] = v15;
local v16 = {
    [v14.CAMERA_ANGLES.Front] = v10() / 100, 
    [v14.CAMERA_ANGLES.Back] = v11() / 100, 
    [v14.CAMERA_ANGLES.Left] = v12() / 100, 
    [v14.CAMERA_ANGLES.Right] = v12() / 100, 
    [v14.CAMERA_ANGLES.Top] = v13() / 100, 
    [v14.CAMERA_ANGLES.Bottom] = v13() / 100
};
v14.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.LeftLeg] = v16;
v14.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.RightLeg] = v16;
v14.ASSET_TRANSPARENCY_RASTER_SIZE = 100;
return v14;