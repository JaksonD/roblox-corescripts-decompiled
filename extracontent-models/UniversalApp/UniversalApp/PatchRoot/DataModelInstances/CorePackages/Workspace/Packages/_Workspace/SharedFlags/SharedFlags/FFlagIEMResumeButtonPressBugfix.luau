local l_Parent_0 = script.Parent;
local l_FFlagIEMFocusNavToButtons_0 = require(l_Parent_0:WaitForChild("FFlagIEMFocusNavToButtons"));
local v2 = game:DefineFastFlag("IEMResumeButtonPressBugfix", false);
return l_FFlagIEMFocusNavToButtons_0 and v2;