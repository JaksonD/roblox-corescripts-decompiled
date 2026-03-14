local l_Parent_0 = script.Parent;
local l_FFlagEnableConsoleExpControls_0 = require(l_Parent_0:WaitForChild("FFlagEnableConsoleExpControls"));
local v2 = game:DefineFastFlag("ChromeShortcutAddRespawnLeaveToIEM", false);
return l_FFlagEnableConsoleExpControls_0 and v2;