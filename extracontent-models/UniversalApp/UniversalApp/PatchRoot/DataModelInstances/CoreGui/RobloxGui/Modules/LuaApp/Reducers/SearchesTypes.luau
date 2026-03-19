local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
return v3.createReducer({}, {
    [v5.name] = function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v6, {
            [v7.searchUuid] = v7.searchType
        });
    end
});