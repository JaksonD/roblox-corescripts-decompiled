local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetUserAssetsFromSellPageAndResellers);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.UpdateUserAssetPrice);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Models.UserAssetModel);
local v6 = require(l_CorePackages_0.Packages.Cryo);
return v2.createReducer({}, {
    [v3.name] = function(v7, v8) --[[ Line: 19 ]]
        -- upvalues: v5 (copy), v6 (copy)
        local v9 = {};
        for _, v11 in v8.userAssets do
            local v12 = tostring(v11.userAssetId);
            local v13 = v5.fromSellPageAndResellers(v11);
            local v14 = v7[v12];
            if v14 then
                v9[v12] = v6.Dictionary.join(v14, v13);
            else
                v9[v12] = v13;
            end;
        end;
        return v6.Dictionary.join(v7, v9);
    end, 
    [v4.name] = function(v15, v16) --[[ Line: 41 ]]
        -- upvalues: v5 (copy), v6 (copy)
        local v17 = tostring(v16.userAssetId);
        local l_priceInRobux_0 = v16.priceInRobux;
        local v19 = v5.fromPriceInRobux(v17, l_priceInRobux_0);
        local v20 = v15[v17];
        if v20 then
            return v6.Dictionary.join(v15, {
                [v17] = v6.Dictionary.join(v20, v19)
            });
        else
            return v6.Dictionary.join(v15, {
                [v17] = v19
            });
        end;
    end
});