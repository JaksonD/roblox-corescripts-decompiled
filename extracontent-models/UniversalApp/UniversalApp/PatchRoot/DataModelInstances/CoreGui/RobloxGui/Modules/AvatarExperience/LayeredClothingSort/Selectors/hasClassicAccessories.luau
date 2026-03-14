local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v6 = {
    [v4.AssetTypeIdStrings.TShirt] = true, 
    [v4.AssetTypeIdStrings.Pants] = true, 
    [v4.AssetTypeIdStrings.Shirt] = true
};
local v10 = l_memoize_0(function(v7) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), v6 (copy)
    for v8, v9 in v7 do
        if not v2.isEmpty(v9) and v6[v8] then
            return true;
        end;
    end;
    return false;
end);
return function(v11) --[[ Line: 30 ]]
    -- upvalues: v10 (copy)
    local l_EquippedAssets_0 = v11.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    if not l_EquippedAssets_0 then
        return false;
    else
        return v10(l_EquippedAssets_0);
    end;
end;