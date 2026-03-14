local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonStatus);
local v6 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonErrorOccurred);
local v7 = {
    enabled = false, 
    errorOccurred = false
};
return (v2.createReducer(v7, {
    [v5.name] = function(v8, v9) --[[ Line: 25 ]]
        -- upvalues: v1 (copy)
        return (v1.Dictionary.join(v8, {
            enabled = v9.status
        }));
    end, 
    [v6.name] = function(v10, v11) --[[ Line: 32 ]]
        -- upvalues: v1 (copy)
        return (v1.Dictionary.join(v10, {
            errorOccurred = v11.errorOccurred
        }));
    end
}));