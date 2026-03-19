local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_CorePackages_0.Packages.Cryo);
return {
    componentType = "modalSelector", 
    getIsVisible = function(_) --[[ Line: 9 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    getMenuItems = function(v6, v7) --[[ Line: 12 ]] --[[ Name: getMenuItems ]]
        -- upvalues: v2 (copy), v4 (copy)
        local v8 = if v6.methodOfAbuse == v2.AbuseMethods.VoiceChat then v2.PlayerVoiceAbuseTypes else v2.PlayerAbuseTypes;
        local v9 = v4.Dictionary.values(v8);
        return v4.List.map(v9, function(v10) --[[ Line: 17 ]]
            -- upvalues: v7 (copy)
            return {
                label = v7[v10], 
                identifier = v10
            };
        end);
    end, 
    getSelectedValue = function(v11) --[[ Line: 24 ]] --[[ Name: getSelectedValue ]]
        return v11.abuseReason;
    end, 
    onUpdateSelectedOption = function(v12, _, v14, v15) --[[ Line: 27 ]] --[[ Name: onUpdateSelectedOption ]]
        -- upvalues: v2 (copy)
        v15.analyticsDispatch({
            type = v2.AnalyticsActions.IncrementReasonChanged
        });
        v15.analyticsDispatch({
            type = v2.AnalyticsActions.SetReasonSelection, 
            selection = v12.identifier
        });
        v14({
            type = v2.PlayerMenuActions.UpdateAbuseReason, 
            abuseReason = v12.identifier
        });
    end, 
    fieldLabel = "ReasonForAbuse", 
    componentName = "AbuseReason"
};