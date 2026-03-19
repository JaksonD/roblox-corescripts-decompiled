local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResellerCursor);
local v6 = {
    nextPageCursor = nil, 
    hasMoreRows = nil
};
return v3.createReducer(v6, {
    [v5.name] = function(v7, v8) --[[ Line: 23 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v7, {
            nextPageCursor = v8.cursor, 
            hasMoreRows = v8.cursor ~= nil
        });
    end
});