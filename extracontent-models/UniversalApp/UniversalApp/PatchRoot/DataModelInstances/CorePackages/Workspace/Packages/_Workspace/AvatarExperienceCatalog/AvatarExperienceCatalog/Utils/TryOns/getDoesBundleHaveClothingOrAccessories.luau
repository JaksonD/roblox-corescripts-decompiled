local v0 = {
    [tostring(Enum.AssetType.Torso.Value)] = true, 
    [tostring(Enum.AssetType.RightArm.Value)] = true, 
    [tostring(Enum.AssetType.LeftArm.Value)] = true, 
    [tostring(Enum.AssetType.LeftLeg.Value)] = true, 
    [tostring(Enum.AssetType.RightLeg.Value)] = true, 
    [tostring(Enum.AssetType.Head.Value)] = true, 
    [tostring(Enum.AssetType.MoodAnimation.Value)] = true, 
    [tostring(Enum.AssetType.DynamicHead.Value)] = true
};
return function(v1) --[[ Line: 21 ]] --[[ Name: getDoesBundleHaveClothingOrAccessories ]]
    -- upvalues: v0 (copy)
    if v1 then
        if v1.itemType ~= Enum.AvatarItemType.Bundle.Name then
            return false;
        elseif v1.bundleType and tostring(v1.bundleType) ~= tostring(Enum.BundleType.BodyParts.Value) then
            return false;
        else
            for _, v3 in v1.items do
                if v3.type == Enum.AvatarItemType.Asset.Name and v3.type == Enum.AvatarItemType.Asset.Name and v3.assetType and not v0[v3.assetType] then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;