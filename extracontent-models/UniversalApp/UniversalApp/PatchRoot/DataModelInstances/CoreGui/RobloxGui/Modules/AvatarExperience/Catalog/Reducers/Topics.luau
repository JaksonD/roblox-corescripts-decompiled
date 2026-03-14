local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTopics);
return v4.createReducer({}, {
    [v6.name] = function(v7, v8) --[[ Line: 19 ]]
        -- upvalues: v3 (copy), v5 (copy)
        local v9 = v3.getTopicRequestKey(v8.selectedTopics, v8.initialItems, v8.searchKeyword);
        return v5.Dictionary.join(v7, {
            [v9] = v8.newTopics
        });
    end
});