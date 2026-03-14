local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceControlBar").Parent;
local l_FFlagAXResetAvatarButton_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXResetAvatarButton;
local v2 = if l_FFlagAXResetAvatarButton_0 then {
    Enum.AssetType.Head, 
    Enum.AssetType.Face, 
    Enum.AssetType.Torso, 
    Enum.AssetType.RightArm, 
    Enum.AssetType.LeftArm, 
    Enum.AssetType.LeftLeg, 
    Enum.AssetType.RightLeg, 
    Enum.AssetType.HairAccessory, 
    Enum.AssetType.ClimbAnimation, 
    Enum.AssetType.FallAnimation, 
    Enum.AssetType.IdleAnimation, 
    Enum.AssetType.JumpAnimation, 
    Enum.AssetType.RunAnimation, 
    Enum.AssetType.SwimAnimation, 
    Enum.AssetType.WalkAnimation, 
    Enum.AssetType.EmoteAnimation, 
    Enum.AssetType.EyebrowAccessory, 
    Enum.AssetType.EyelashAccessory, 
    Enum.AssetType.MoodAnimation, 
    Enum.AssetType.DynamicHead
} else nil;
local v3 = {};
if l_FFlagAXResetAvatarButton_0 then
    for _, v5 in v2 do
        table.insert(v3, (tostring(v5.Value)));
    end;
end;
return {
    AssetTypesToKeep = v2, 
    AssetTypeStringsToKeep = v3
};