local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local v1 = require(l_script_FirstAncestor_0.Constants);
return function(v2, v3, v4) --[[ Line: 22 ]] --[[ Name: createHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v1 (copy)
    local v5 = tonumber(v3);
    assert(v5 ~= nil, "assetIdAsNumber is not nil. Silence type checker.");
    v4 = v4 or {};
    return {
        AssetId = v5, 
        Order = v4.order, 
        AccessoryType = v4.type or v1.ASSET_TYPE_TO_ACCESSORY_TYPE[v2], 
        IsLayered = v4.isLayered, 
        Position = v4.position, 
        Rotation = v4.rotation, 
        Scale = v4.scale
    };
end;