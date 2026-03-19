local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Models.SortResults);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.AppendUserInventoryRecommendations);
return v4.createReducer({}, {
    [v6.name] = function(v7, v8) --[[ Line: 36 ]]
        -- upvalues: v3 (copy)
        local v9 = v7[v8.searchUuid];
        if not v9 or v8.forceUpdate then
            local v10 = v3.Dictionary.join(v8.sortResults, {
                initialStorageTime = tick()
            });
            return v3.Dictionary.join(v7, {
                [v8.searchUuid] = v10
            });
        else
            local v11 = {
                items = v3.List.join(v9.items, v8.sortResults.items), 
                initialStorageTime = v9.initialStorageTime, 
                nextPageCursor = v8.sortResults.nextPageCursor, 
                previousPageCursor = v8.sortResults.previousPageCursor, 
                keyword = v8.sortResults.keyword
            };
            return v3.Dictionary.join(v7, {
                [v8.searchUuid] = v11
            });
        end;
    end
});