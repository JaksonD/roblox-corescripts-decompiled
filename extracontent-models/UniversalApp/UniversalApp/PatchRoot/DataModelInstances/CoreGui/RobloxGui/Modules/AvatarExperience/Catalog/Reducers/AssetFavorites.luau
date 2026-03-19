local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetFavorite);
return v3.createReducer({}, {
    [v5.name] = function(v6, v7) --[[ Line: 19 ]]
        -- upvalues: v4 (copy)
        local l_assetId_0 = v7.assetId;
        return v4.Dictionary.join(v6, {
            [l_assetId_0] = v7.isFavorited
        });
    end
});