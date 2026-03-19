local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local v1 = require(l_script_FirstAncestor_0.Constants);
return function(v2) --[[ Line: 7 ]] --[[ Name: isLayeredClothingAssetType ]]
    -- upvalues: v1 (copy)
    return v1.LAYERED_ASSET_TYPES[v2] ~= nil;
end;