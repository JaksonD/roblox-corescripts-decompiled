local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
return {
    componentType = "dropdown", 
    getIsVisible = function(_) --[[ Line: 7 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    getMenuItems = function(_) --[[ Line: 10 ]] --[[ Name: getMenuItems ]]
        return {};
    end, 
    onUpdateSelectedOption = function(_, _) --[[ Line: 13 ]] --[[ Name: onUpdateSelectedOption ]]

    end, 
    readonlyValue = v2.InappropriateContentAbuseReason, 
    fieldLabel = "ReasonForAbuse", 
    componentName = "AbuseReason"
};