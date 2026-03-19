local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantAsset);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeAsset);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantOutfit);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeOutfit);
local v9 = {
    grantedAssetsByType = {}, 
    grantedOutfitsByType = {}
};
return v2.createReducer(v9, {
    [v5.name] = function(v10, v11) --[[ Line: 38 ]]
        -- upvalues: v3 (copy)
        local v12 = v10.grantedAssetsByType[tostring(v11.assetTypeId)] or {};
        local v13 = v3.Dictionary.join(v10.grantedAssetsByType, {
            [tostring(v11.assetTypeId)] = v3.List.join({
                (tostring(v11.assetId))
            }, v12)
        });
        return v3.Dictionary.join(v10, {
            grantedAssetsByType = v13
        });
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 48 ]]
        -- upvalues: v3 (copy)
        local v16 = v14.grantedAssetsByType[tostring(v15.assetTypeId)] or {};
        local v17 = v3.Dictionary.join(v14.grantedAssetsByType, {
            [tostring(v15.assetTypeId)] = v3.List.removeValue(v16, (tostring(v15.assetId)))
        });
        return v3.Dictionary.join(v14, {
            grantedAssetsByType = v17
        });
    end, 
    [v7.name] = function(v18, v19) --[[ Line: 58 ]]
        -- upvalues: v3 (copy)
        local v20 = v18.grantedOutfitsByType[v19.outfitType] or {};
        local v21 = v3.Dictionary.join(v18.grantedOutfitsByType, {
            [tostring(v19.outfitType)] = v3.List.join({
                (tostring(v19.outfitId))
            }, v20)
        });
        return v3.Dictionary.join(v18, {
            grantedOutfitsByType = v21
        });
    end, 
    [v8.name] = function(v22, v23) --[[ Line: 68 ]]
        -- upvalues: v3 (copy)
        local v24 = {};
        for v25, v26 in v22.grantedOutfitsByType do
            v24[v25] = v3.List.removeValue(v26, (tostring(v23.outfitId)));
        end;
        return v3.Dictionary.join(v22, {
            grantedOutfitsByType = v24
        });
    end
});