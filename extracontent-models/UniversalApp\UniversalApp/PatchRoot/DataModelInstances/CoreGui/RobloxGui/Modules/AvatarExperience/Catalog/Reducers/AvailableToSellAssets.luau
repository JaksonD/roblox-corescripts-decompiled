local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAvailableToSellAssetsFromFetchSellData);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AddAvailableToSellAsset);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveAvailableToSellAsset);
local v6 = require(l_CorePackages_0.Packages.Cryo);
return v2.createReducer({}, {
    [v3.name] = function(v7, v8) --[[ Line: 21 ]]
        -- upvalues: v6 (copy)
        local l_assetId_0 = v8.assetId;
        local l_userAssetIdList_0 = v8.userAssetIdList;
        return v6.Dictionary.join(v7, {
            [l_assetId_0] = l_userAssetIdList_0
        });
    end, 
    [v4.name] = function(v11, v12) --[[ Line: 34 ]]
        -- upvalues: v6 (copy)
        local l_assetId_1 = v12.assetId;
        local v14 = {
            v12.userAssetId
        };
        local v15 = v11[l_assetId_1];
        if v15 then
            v14 = v6.List.join(v15, v14);
        end;
        return v6.Dictionary.join(v11, {
            [l_assetId_1] = v14
        });
    end, 
    [v5.name] = function(v16, v17) --[[ Line: 53 ]]
        -- upvalues: v6 (copy)
        local l_assetId_2 = v17.assetId;
        local v19 = v16[l_assetId_2];
        if not v19 then
            return v16;
        else
            local v20 = v6.List.removeValue(v19, v17.userAssetId);
            return v6.Dictionary.join(v16, {
                [l_assetId_2] = v20
            });
        end;
    end
});