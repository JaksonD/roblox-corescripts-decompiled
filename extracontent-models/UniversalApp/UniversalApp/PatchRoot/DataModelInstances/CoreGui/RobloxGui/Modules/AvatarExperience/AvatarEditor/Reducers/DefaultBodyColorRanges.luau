local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.ReducerUtils);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetDefaultBodyColorRanges);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return (v2.createReducer({}, {
    [v5.name] = function(_, v8) --[[ Line: 22 ]]
        -- upvalues: v4 (copy)
        return (v4.convertDefaultBodyColorRanges(v8.defaultBodyColorRanges));
    end
}));