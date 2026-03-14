local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagEnableInGameMenuChromeABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInGameMenuChromeABTest;
return function() --[[ Line: 5 ]]
    -- upvalues: l_GetFFlagEnableInGameMenuChromeABTest_0 (copy)
    return game:GetEngineFeature("ExperienceMenuABTest") and l_GetFFlagEnableInGameMenuChromeABTest_0();
end;