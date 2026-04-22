local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagIEMFocusNavToButtons_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagIEMFocusNavToButtons;
local v2 = game:DefineFastFlag("ReportFocusNavIEMButtons2", false);
return l_FFlagIEMFocusNavToButtons_0 and v2;