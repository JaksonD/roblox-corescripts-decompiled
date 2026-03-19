local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local function v6(v2) --[[ Line: 4 ]] --[[ Name: getBodiesInTryOns ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    for v4, v5 in v2 do
        if v5.itemType == v1.ItemType.Bundle and v1.BundleTypeIdStringToNameForBackend[v5.itemSubType] == "Body" then
            table.insert(v3, v4);
        end;
    end;
    return v3;
end;
return function(v7) --[[ Line: 17 ]] --[[ Name: selectTryOnBodyIds ]]
    -- upvalues: v6 (copy)
    local l_OutfitTryOn_0 = v7.AvatarExperience.AvatarScene.OutfitTryOn;
    if l_OutfitTryOn_0 and l_OutfitTryOn_0.TryOnItems then
        return (v6(l_OutfitTryOn_0.TryOnItems));
    else
        return {};
    end;
end;