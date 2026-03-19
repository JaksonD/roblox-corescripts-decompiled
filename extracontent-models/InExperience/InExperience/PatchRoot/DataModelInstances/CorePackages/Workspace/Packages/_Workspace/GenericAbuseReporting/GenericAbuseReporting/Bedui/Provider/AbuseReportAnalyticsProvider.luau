local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportAnalyticsContext);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local _ = require(l_script_FirstAncestor_0.Bedui.Utils.BeduiAnalytics);
return function(v6) --[[ Line: 18 ]] --[[ Name: AbuseReportAnalyticsProvider ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v7, v8 = v2.useState(false);
    return v2.createElement(v3.Provider, {
        value = {
            abuseVector = v6.abuseVector, 
            isReportSubmitted = v7, 
            setIsReportSubmitted = v8
        }
    }, v6.children);
end;