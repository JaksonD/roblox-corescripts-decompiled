local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local v1 = require(l_script_FirstAncestor_0.Utils.getEquippedAssetIdsByAssetTypeId);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local v4 = require(l_script_FirstAncestor_0.Enums.HeadShape);
local l_FFlagDynamicHeadsMigration_0 = v3.FFlagDynamicHeadsMigration;
local function _(v6) --[[ Line: 9 ]] --[[ Name: isClassicFaceEquipped ]]
    -- upvalues: v1 (copy)
    return #v1(v6, (tostring(Enum.AssetType.Face.Value))) > 0;
end;
return function(v8) --[[ Line: 15 ]] --[[ Name: getDefaultSelectedHeadShapeName ]]
    -- upvalues: v1 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v4 (copy)
    local l_isTryingOnItems_0 = v8.isTryingOnItems;
    local l_equippedAssets_0 = v8.equippedAssets;
    local v11 = if #v1(l_equippedAssets_0, (tostring(Enum.AssetType.Face.Value))) > 0 then v8.defaultHeadShapeName else nil;
    if l_isTryingOnItems_0 and l_FFlagDynamicHeadsMigration_0 then
        return v8.lastTryOnHeadShapeName or v8.defaultHeadShapeName or v8.equippedHeadShapeName or v11;
    elseif l_isTryingOnItems_0 then
        return v8.lastTryOnHeadShapeName or v8.equippedHeadShapeName or v11;
    else
        return v8.equippedHeadShapeName or v4.Default;
    end;
end;