local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
return game:DefineFastFlag("TopBarDeprecateChatRodux2", false) and l_FFlagEnableConsoleExpControls_0 and l_Enabled_0();