local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.LuaApp.Actions.Authentication.SetHumanoidDescriptionProperties);
return v2.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 10 ]]
        -- upvalues: v3 (copy)
        local l_tableOfHumanoidDescriptionProperties_0 = v6.tableOfHumanoidDescriptionProperties;
        return v3.Dictionary.join(v5, l_tableOfHumanoidDescriptionProperties_0);
    end
});