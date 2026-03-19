local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendSearchInCatalog);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchInCatalog);
return v4.createReducer({}, {
    [v5.name] = function(v8, v9) --[[ Line: 23 ]]
        -- upvalues: v3 (copy)
        local v10 = v8[v9.searchUuid];
        if not v10 then
            return v3.Dictionary.join(v8, {
                [v9.searchUuid] = v9.searchInCatalog
            });
        else
            local l_items_0 = v10.items;
            local v12 = v3.List.join(l_items_0, v9.searchInCatalog.items);
            v9.searchInCatalog.items = v12;
            return v3.Dictionary.join(v8, {
                [v9.searchUuid] = v9.searchInCatalog
            });
        end;
    end, 
    [v6.name] = function(v13, v14) --[[ Line: 40 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v13, {
            [v14.searchUuid] = v3.None
        });
    end, 
    [v7.name] = function(v15, v16) --[[ Line: 46 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v15, {
            [v16.searchUuid] = v16.searchInCatalog
        });
    end
});