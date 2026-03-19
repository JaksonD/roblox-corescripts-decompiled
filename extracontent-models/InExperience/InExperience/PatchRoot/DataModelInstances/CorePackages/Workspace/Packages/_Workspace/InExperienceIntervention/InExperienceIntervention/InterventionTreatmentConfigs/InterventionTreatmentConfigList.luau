local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.ChatToastNudgeConfig);
local v3 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.ChatTimeoutConfig);
local v4 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.ChatDialogNudgeConfig);
local v5 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.PartyChatDialogNudgeConfig);
local v6 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.PartyChatDialogTimeoutConfig);
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local v8 = {
    v2, 
    v4, 
    v3
};
if l_getFFlagAppChatEnableIntervention_0() then
    table.insert(v8, v5);
    table.insert(v8, v6);
end;
return v8;