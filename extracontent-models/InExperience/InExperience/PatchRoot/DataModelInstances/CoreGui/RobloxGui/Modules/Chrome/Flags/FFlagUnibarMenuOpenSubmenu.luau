local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local v2 = game:DefineFastFlag("UnibarMenuOpenSubmenu", false);
return l_FFlagEnableConsoleExpControls_0 and v2;