local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local v1 = require(l_script_FirstAncestor_0.Enums.ItemTypeEnum);
local v2 = require(l_script_FirstAncestor_0.Constants);
local function v7(v3) --[[ Line: 6 ]] --[[ Name: getBodiesInTryOns ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {};
    for _, v6 in v3 do
        if v6.itemType == v1.Bundle and v6.itemSubType == v2.BODY_BUNDLE_TYPE_ID then
            table.insert(v4, v6.itemId);
        end;
    end;
    return v4;
end;
return function(v8) --[[ Line: 19 ]] --[[ Name: selectTryOnBodyIds ]]
    -- upvalues: v7 (copy)
    local l_OutfitTryOn_0 = v8.AvatarExperience.AvatarScene.OutfitTryOn;
    if l_OutfitTryOn_0 and l_OutfitTryOn_0.TryOnItems then
        return (v7(l_OutfitTryOn_0.TryOnItems));
    else
        return {};
    end;
end;