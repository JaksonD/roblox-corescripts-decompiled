local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResellableInstances);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.UpdateCollectibleResellableInstance);
local v6 = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInstance);
return v2.createReducer({}, {
    [v4.name] = function(v7, v8) --[[ Line: 24 ]]
        -- upvalues: v6 (copy), v3 (copy)
        local l_collectibleItemId_0 = v8.collectibleItemId;
        local v10 = {};
        for _, v12 in v8.collectibleItemInstances do
            local v13 = v6.fromGetCollectibleItemInstances(v12);
            v10[v13.collectibleInstanceId] = v13;
        end;
        return v3.Dictionary.join(v7, {
            [l_collectibleItemId_0] = v10
        });
    end, 
    [v5.name] = function(v14, v15) --[[ Line: 36 ]]
        -- upvalues: v3 (copy)
        local l_collectibleItemId_1 = v15.collectibleItemId;
        local l_collectibleInstanceId_0 = v15.collectibleInstanceId;
        local l_collectibleInstanceData_0 = v15.collectibleInstanceData;
        local v19 = v14[l_collectibleItemId_1];
        if not v19 then
            return v14;
        else
            v19 = v3.Dictionary.join(v19, {
                [l_collectibleInstanceId_0] = l_collectibleInstanceData_0
            });
            return v3.Dictionary.join(v14, {
                [l_collectibleItemId_1] = v19
            });
        end;
    end
});