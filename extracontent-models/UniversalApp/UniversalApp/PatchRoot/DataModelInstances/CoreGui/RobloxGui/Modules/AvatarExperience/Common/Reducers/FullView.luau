local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.SetFullView);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_FullViewPageDefaults_0 = require(l_Modules_0.AvatarExperience.Common.Constants).FullViewPageDefaults;
return v2.createReducer(l_FullViewPageDefaults_0, {
    [v5.name] = function(v8, v9) --[[ Line: 28 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v8, {
            [v9.avatarScreen] = v9.fullViewStatus
        });
    end
});