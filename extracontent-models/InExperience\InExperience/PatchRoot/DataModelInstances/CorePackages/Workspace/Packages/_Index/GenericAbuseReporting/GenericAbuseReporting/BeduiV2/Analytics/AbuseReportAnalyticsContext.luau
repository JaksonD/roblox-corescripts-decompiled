local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v4 = v2.createContext(nil);
return {
    AbuseReportAnalyticsContext = v4, 
    AbuseReportAnalyticsProvider = function(v5) --[[ Line: 25 ]] --[[ Name: AbuseReportAnalyticsProvider ]]
        -- upvalues: v2 (copy), v4 (copy)
        return v2.createElement(v4.Provider, {
            value = v5.analytics
        }, v5.children);
    end, 
    useAbuseReportAnalytics = function() --[[ Line: 35 ]] --[[ Name: useAbuseReportAnalytics ]]
        -- upvalues: v2 (copy), v4 (copy)
        local v6 = v2.useContext(v4);
        if not v6 then
            error("Invalid use of `useAbuseReportAnalytics` hook. Ensure your component has an ancestor wrapped in `AbuseReportAnalyticsProvider`");
        end;
        return v6;
    end
};