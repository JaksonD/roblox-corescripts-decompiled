local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleItemInfo);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResellersInstances);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResaleData);
local v10 = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local l_FetchCollectibleItemDataBatchedSuccess_0 = v6.State.Actions.FetchCollectibleItemDataBatchedSuccess;
local l_FFlagAXMISEnableMultiShopping_0 = v5.FFlagAXMISEnableMultiShopping;
return v3.createReducer({}, {
    [v7.name] = function(v13, v14) --[[ Line: 23 ]]
        -- upvalues: v2 (copy), v10 (copy), v4 (copy)
        v2.isType(v14.collectibleItemId, "string", "collectibleItemId must be a string.");
        v2.isType(v14.collectibleItemData, "table", "collectibleItemData must be a table.");
        local l_collectibleItemId_0 = v14.collectibleItemId;
        local v16 = v10.fromGetCollectibleItemData(v14.collectibleItemData);
        local v17 = v13[l_collectibleItemId_0];
        if v17 then
            local v18 = v4.Dictionary.join(v17, v16);
            return v4.Dictionary.join(v13, {
                [l_collectibleItemId_0] = v18
            });
        else
            return v4.Dictionary.join(v13, {
                [l_collectibleItemId_0] = v16
            });
        end;
    end, 
    [v8.name] = function(v19, v20) --[[ Line: 39 ]]
        -- upvalues: v2 (copy), v10 (copy), v4 (copy)
        v2.isType(v20.collectibleItemId, "string", "collectibleItemId must be a string.");
        v2.isType(v20.collectibleItemInstances, "table", "collectibleItemData must be a table.");
        local l_collectibleItemId_1 = v20.collectibleItemId;
        local v22 = v10.fromGetResellers(v20.collectibleItemInstances);
        local v23 = v19[l_collectibleItemId_1];
        if v23 then
            local v24 = v4.Dictionary.join(v23, v22);
            return v4.Dictionary.join(v19, {
                [l_collectibleItemId_1] = v24
            });
        else
            return v4.Dictionary.join(v19, {
                [l_collectibleItemId_1] = v22
            });
        end;
    end, 
    [v9.name] = function(v25, v26) --[[ Line: 55 ]]
        -- upvalues: v2 (copy), v10 (copy), v4 (copy)
        v2.isType(v26.collectibleItemId, "string", "collectibleItemId must be a string.");
        v2.isType(v26.resaleData, "table", "resaleData must be a table.");
        local l_collectibleItemId_2 = v26.collectibleItemId;
        local v28 = v10.fromGetResaleData(v26.resaleData);
        local v29 = v25[l_collectibleItemId_2];
        if v29 then
            local v30 = v4.Dictionary.join(v29, v28);
            return v4.Dictionary.join(v25, {
                [l_collectibleItemId_2] = v30
            });
        else
            return v4.Dictionary.join(v25, {
                [l_collectibleItemId_2] = v28
            });
        end;
    end, 
    [l_FetchCollectibleItemDataBatchedSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v31, v32) --[[ Line: 72 ]]
        -- upvalues: v10 (copy), v4 (copy)
        v31 = v31 or {};
        local l_collectibleItemData_0 = v32.collectibleItemData;
        local v34 = {};
        for _, v36 in l_collectibleItemData_0 do
            local l_collectibleItemId_3 = v36.collectibleItemId;
            local v38 = v10.fromGetCollectibleItemData(v36);
            local v39 = v31[l_collectibleItemId_3] or {};
            v34[l_collectibleItemId_3] = v4.Dictionary.join(v39, v38);
        end;
        return v4.Dictionary.join(v31, v34);
    end or nil
});