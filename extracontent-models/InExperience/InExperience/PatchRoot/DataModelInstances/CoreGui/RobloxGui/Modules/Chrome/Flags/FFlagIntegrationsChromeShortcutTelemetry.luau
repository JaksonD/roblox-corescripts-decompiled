local l_Chrome_0 = script.Parent.Parent.Parent.Chrome;
local v1 = require(l_Chrome_0.Flags.EnrolledConsoleExperienceControls);
local v2 = game:DefineFastFlag("IntegrationsChromeShortcutTelemetry", false);
return v1 or v2;