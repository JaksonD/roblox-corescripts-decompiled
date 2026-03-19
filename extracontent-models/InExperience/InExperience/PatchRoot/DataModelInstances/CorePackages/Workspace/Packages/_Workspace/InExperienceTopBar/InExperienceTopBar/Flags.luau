local l_Parent_0 = script:FindFirstAncestor("InExperienceTopBar").Parent;
local l_Enabled_0 = require(l_Parent_0.Chrome).Enabled;
local v2 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v2.FFlagEnableConsoleExpControls;
local l_FFlagAddUILessMode_0 = v2.FFlagAddUILessMode;
local v5 = require(l_Parent_0.CoreGuiCommon);
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v5.Flags.FFlagTopBarSignalizeKeepOutAreas;
local l_FFlagTopBarSignalizeMenuOpen_0 = v5.Flags.FFlagTopBarSignalizeMenuOpen;
local l_FFlagTopBarSignalizeScreenSize_0 = v5.Flags.FFlagTopBarSignalizeScreenSize;
local v9 = game:DefineFastFlag("TopBarSignalizeSetCores", false);
local v10 = game:DefineFastFlag("TopBarRefactor2", false);
return {
    FFlagTopBarSignalizeSetCores = v9, 
    FFlagTopBarRefactor = v10 and l_Enabled_0() and l_FFlagTopBarSignalizeKeepOutAreas_0 and l_FFlagTopBarSignalizeMenuOpen_0 and l_FFlagTopBarSignalizeScreenSize_0 and l_FFlagEnableConsoleExpControls_0 and not l_FFlagAddUILessMode_0
};