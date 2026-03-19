local l_script_FirstAncestor_0 = script:FindFirstAncestor("InAppIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.PartyChatDialogNudgeConfig);
local v3 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.PartyChatDialogTimeoutConfig);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local v6 = {};
if l_getFFlagAppChatEnableIntervention_0() then
    table.insert(v6, v2);
    table.insert(v6, v3);
end;
return v6;