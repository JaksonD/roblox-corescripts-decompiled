local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
game:DefineFastString("InExperienceMenuIXPLayer", l_AppUserLayers_0.ExperienceMenuSettingsExposureLayer);
return function() --[[ Line: 6 ]]
    return game:GetFastString("InExperienceMenuIXPLayer");
end;