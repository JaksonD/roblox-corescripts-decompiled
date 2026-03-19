local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v6 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearCurrentSort);
local v7 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.AddRemovedItem);
local v8 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems);
local v9 = {
    OrderedList = {}, 
    RemovedList = {}
};
return v2.createReducer(v9, {
    [v5.name] = function(v10, v11) --[[ Line: 40 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v10, {
            OrderedList = v11.currentSort
        });
    end, 
    [v6.name] = function(v12, _) --[[ Line: 45 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v12, {
            OrderedList = {}, 
            RemovedList = {}
        });
    end, 
    [v7.name] = function(v14, v15) --[[ Line: 51 ]]
        -- upvalues: v3 (copy)
        local v16 = v14.RemovedList or {};
        return v3.Dictionary.join(v14, {
            RemovedList = v3.Dictionary.join(v16, {
                [v15.removedAssetId] = v15.removedAssetTypeId
            })
        });
    end, 
    [v8.name] = function(v17, _) --[[ Line: 59 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v17, {
            RemovedList = {}
        });
    end
});