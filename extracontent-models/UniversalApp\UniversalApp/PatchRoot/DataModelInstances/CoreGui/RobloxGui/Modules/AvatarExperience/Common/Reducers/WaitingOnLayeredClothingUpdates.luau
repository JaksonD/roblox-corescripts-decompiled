local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.FinishedWaitingOnLCUpdate);
return v2.createReducer(false, {
    [v3.name] = function(_, _) --[[ Line: 17 ]]
        return true;
    end, 
    [v4.name] = function(_, _) --[[ Line: 21 ]]
        return false;
    end
});