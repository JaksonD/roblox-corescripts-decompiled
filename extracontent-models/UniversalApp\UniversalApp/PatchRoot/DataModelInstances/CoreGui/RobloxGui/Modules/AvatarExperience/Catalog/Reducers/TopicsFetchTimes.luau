local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTopics);
return v3.createReducer({}, {
    [v6.name] = function(v7, v8) --[[ Line: 21 ]]
        -- upvalues: v5 (copy), v4 (copy)
        local v9 = v5.getTopicRequestKey(v8.selectedTopics, v8.initialItems, v8.searchKeyword);
        local v10 = tick();
        return v4.Dictionary.join(v7, {
            [v9] = v10
        });
    end
});