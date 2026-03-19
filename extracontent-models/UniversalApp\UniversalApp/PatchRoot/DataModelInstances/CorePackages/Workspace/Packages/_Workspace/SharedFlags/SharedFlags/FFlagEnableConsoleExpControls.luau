local l_Parent_0 = script.Parent;
local l_FFlagEnableConsoleExpControlsIXP_0 = require(l_Parent_0:WaitForChild("FFlagEnableConsoleExpControlsIXP"));
local l_FFlagEnableInExperienceHandheldControls_0 = require(l_Parent_0:WaitForChild("FFlagEnableInExperienceHandheldControls"));
local v3 = game:DefineFastFlag("EnableConsoleExpControls684", false);
return l_FFlagEnableConsoleExpControlsIXP_0 or l_FFlagEnableInExperienceHandheldControls_0 or v3;