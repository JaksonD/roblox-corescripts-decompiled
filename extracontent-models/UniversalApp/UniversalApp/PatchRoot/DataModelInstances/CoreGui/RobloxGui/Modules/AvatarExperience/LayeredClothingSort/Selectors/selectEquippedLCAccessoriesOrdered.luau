local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = l_memoize_0(function(v5) --[[ Line: 12 ]]
    -- upvalues: v4 (copy)
    local v6 = {};
    local v7 = {};
    for _, v9 in v5 do
        local v10 = v4.AccessoryTypeEnumToAssetTypeId[v9.AccessoryType];
        if not v4.LCIgnoredForSorting[v10] and v9.IsLayered then
            v7[tostring(v9.AssetId)] = v9.Order or v4.LayeredClothingOrder[v10];
            table.insert(v6, {
                id = tostring(v9.AssetId), 
                typeId = v10
            });
        end;
    end;
    table.sort(v6, function(v11, v12) --[[ Line: 29 ]]
        -- upvalues: v7 (copy)
        return v7[v11.id] > v7[v12.id];
    end);
    return v6;
end);
return function(v14) --[[ Line: 43 ]]
    -- upvalues: v13 (copy)
    local l_CurrentCharacter_0 = v14.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_0 then
        return {};
    else
        local l_Accessories_0 = l_CurrentCharacter_0.Humanoid.HumanoidDescription:GetAccessories(false);
        return v13(l_Accessories_0);
    end;
end;