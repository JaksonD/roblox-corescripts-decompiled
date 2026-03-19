local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_CorePackages_0.Packages.Cryo);
return {
    componentType = "dropdown", 
    getIsVisible = function(_) --[[ Line: 9 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    getMenuItems = function(v6) --[[ Line: 12 ]] --[[ Name: getMenuItems ]]
        -- upvalues: v2 (copy), v4 (copy)
        local v7 = if v6.methodOfAbuse == "Voice Chat" then v2.PlayerVoiceAbuseTypes else v2.PlayerAbuseTypes;
        return v4.Dictionary.values(v7);
    end, 
    onUpdateSelectedOption = function(v8, _, v10, v11) --[[ Line: 18 ]] --[[ Name: onUpdateSelectedOption ]]
        -- upvalues: v2 (copy)
        v11.analyticsDispatch({
            type = v2.AnalyticsActions.IncrementReasonChanged
        });
        v11.analyticsDispatch({
            type = v2.AnalyticsActions.SetReasonSelection, 
            selection = v8
        });
        v10({
            type = v2.PlayerMenuActions.UpdateAbuseReason, 
            abuseReason = v8
        });
    end, 
    fieldLabel = "ReasonForAbuse", 
    componentName = "AbuseReason"
};