local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableInExperienceHandheldControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableInExperienceHandheldControls;
local l_Chrome_0 = script.Parent.Parent.Parent.Chrome;
local v3 = require(l_Chrome_0.Flags.FFlagUnibarMenuOpenHamburger);
local v4 = require(l_Chrome_0.Flags.FFlagUnibarMenuOpenSubmenu);
local v5 = require(script.Parent.Parent.Parent.IsExperienceMenuABTestEnabled);
local v6 = v3 or v4;
return v5() and v6 or l_FFlagEnableInExperienceHandheldControls_0;