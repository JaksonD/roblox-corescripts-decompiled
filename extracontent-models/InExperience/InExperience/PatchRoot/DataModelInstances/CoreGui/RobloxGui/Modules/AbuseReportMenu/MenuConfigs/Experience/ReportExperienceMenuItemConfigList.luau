local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_MenuConfigs_0 = l_script_FirstAncestor_0.MenuConfigs;
local v3 = require(l_MenuConfigs_0.Experience.OptionalAttachScreenshotMenuConfig);
local v4 = require(l_MenuConfigs_0.Experience.AbuseReasonMenuConfig);
local v5 = require(l_MenuConfigs_0.Experience.SubmitReportButtonMenuConfig);
return {
    v4, 
    v3, 
    require(l_MenuConfigs_0.Experience.FreeFormCommentMenuConfig), 
    v5
};