local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local v3 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
return game:DefineFastFlag("TopBarDeprecateGameInfoRodux", false) and l_FFlagEnableConsoleExpControls_0 and not v3;