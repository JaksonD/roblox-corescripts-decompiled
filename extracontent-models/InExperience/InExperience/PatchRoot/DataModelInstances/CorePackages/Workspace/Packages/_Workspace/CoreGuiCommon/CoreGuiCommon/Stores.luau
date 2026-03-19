local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreGuiCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagAddUILessMode_0 = require(l_Parent_0.SharedFlags).FFlagAddUILessMode;
local l_FFlagTopBarSignalizeMenuOpen_0 = require(l_script_FirstAncestor_0.Flags).FFlagTopBarSignalizeMenuOpen;
local l_FFlagTopBarSignalizeKeepOutAreas_0 = require(l_script_FirstAncestor_0.Flags).FFlagTopBarSignalizeKeepOutAreas;
local l_FFlagTopBarSignalizeHealthBar_0 = require(l_script_FirstAncestor_0.Flags).FFlagTopBarSignalizeHealthBar;
return {
    GetUILessStore = if l_FFlagAddUILessMode_0 then require(script.GetUILessStore) else nil, 
    GetInspectAndBuyStore = if l_FFlagTopBarSignalizeMenuOpen_0 then require(script.GetInspectAndBuyStore) else nil, 
    GetKeepOutAreasStore = if l_FFlagTopBarSignalizeKeepOutAreas_0 then require(script.GetKeepOutAreasStore) else nil, 
    GetLocalHumanoidStore = if l_FFlagTopBarSignalizeHealthBar_0 then require(script.GetLocalHumanoidStore) else nil
};