local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleMarketplaceResaleParameters);
local v6 = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleMarketplaceResaleParametersInfo);
return v3.createReducer({}, {
    [v5.name] = function(v7, v8) --[[ Line: 39 ]]
        -- upvalues: v4 (copy), v6 (copy), v2 (copy)
        v4.isType(v8.collectibleItemId, "string", "collectibleItemId must be a string.");
        v4.isType(v8.resaleParametersInfo, "table", "resaleParametersInfo must be a table.");
        local l_collectibleItemId_0 = v8.collectibleItemId;
        local v10 = v6.fromGetCollectibleMarketplaceResaleParameters(v8.resaleParametersInfo, v8.itemSubTypeNameString);
        local v11 = v7[l_collectibleItemId_0];
        if v11 then
            local v12 = v2.Dictionary.join(v11, v10);
            return (v2.Dictionary.join(v7, {
                [l_collectibleItemId_0] = v12
            }));
        else
            return (v2.Dictionary.join(v7, {
                [l_collectibleItemId_0] = v10
            }));
        end;
    end
});