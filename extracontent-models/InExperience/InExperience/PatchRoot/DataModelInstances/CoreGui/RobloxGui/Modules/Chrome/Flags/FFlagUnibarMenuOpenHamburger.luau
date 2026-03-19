local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v1.FFlagEnableConsoleExpControls;
local l_FFlagUnibarMenuOpenHamburgerGamepadIXP_0 = v1.FFlagUnibarMenuOpenHamburgerGamepadIXP;
local v4 = game:DefineFastFlag("UnibarMenuOpenHamburger", false);
return l_FFlagEnableConsoleExpControls_0 and (l_FFlagUnibarMenuOpenHamburgerGamepadIXP_0 or v4);