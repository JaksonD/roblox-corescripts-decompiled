local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.AlertSeverity);
local _ = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v3 = {
    [v1.Info] = "circle-i", 
    [v1.Warning] = "triangle-exclamation", 
    [v1.Success] = "circle-check", 
    [v1.Error] = "circle-x"
};
return {
    MAX_ACTION_COUNT = 3, 
    SEVERITY_TO_ICON = v3
};