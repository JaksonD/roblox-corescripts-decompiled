local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local l_FFlagTopBarSignalizeHealthBar_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar;
return game:DefineFastFlag("TopBarDeprecateCoreGuiRodux2", false) and l_FFlagTopBarSignalizeHealthBar_0 and l_FFlagEnableConsoleExpControls_0 and l_Enabled_0();