local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.PreventSaveAvatar);
return v2.createReducer(false, {
    [v3.name] = function(_, v5) --[[ Line: 10 ]]
        return v5.preventSaveAvatar;
    end
});