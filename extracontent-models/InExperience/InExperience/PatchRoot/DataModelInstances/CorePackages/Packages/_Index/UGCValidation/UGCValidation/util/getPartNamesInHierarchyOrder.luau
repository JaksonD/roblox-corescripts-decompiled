return function(v0) --[[ Line: 5 ]] --[[ Name: getPartNamesInHierarchyOrder ]]
    if Enum.AssetType.LeftArm == v0 then
        return {
            "LeftUpperArm", 
            "LeftLowerArm", 
            "LeftHand"
        };
    elseif Enum.AssetType.RightArm == v0 then
        return {
            "RightUpperArm", 
            "RightLowerArm", 
            "RightHand"
        };
    elseif Enum.AssetType.LeftLeg == v0 then
        return {
            "LeftUpperLeg", 
            "LeftLowerLeg", 
            "LeftFoot"
        };
    elseif Enum.AssetType.RightLeg == v0 then
        return {
            "RightUpperLeg", 
            "RightLowerLeg", 
            "RightFoot"
        };
    elseif Enum.AssetType.DynamicHead == v0 then
        return {
            "Head"
        };
    elseif Enum.AssetType.Torso == v0 then
        return {
            "LowerTorso", 
            "UpperTorso"
        };
    else
        assert(false, "Invalid asset type");
        return {};
    end;
end;