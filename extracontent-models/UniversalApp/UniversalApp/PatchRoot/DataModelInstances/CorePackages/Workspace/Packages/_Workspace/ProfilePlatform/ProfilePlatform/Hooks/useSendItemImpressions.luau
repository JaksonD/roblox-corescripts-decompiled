local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_SendItemImpressions_0 = require(l_Parent_0.UnifiedLogging).SendItemImpressions;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v8 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v10 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return function(v11, v12, v13, v14, v15) --[[ Line: 21 ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_AppPage_0 (copy), v8 (copy), v2 (copy), v10 (copy), l_SendItemImpressions_0 (copy), l_dependencyArray_0 (copy)
    local v16 = l_useRoactService_0(l_AppEventIngestService_0);
    local v17 = l_useRoactService_0(l_RoactAnalytics_0);
    local l_ProfilePlatform_0 = l_AppPage_0.ProfilePlatform;
    local v19 = v8();
    return v2.useCallback(function(v20) --[[ Line: 34 ]]
        -- upvalues: v19 (copy), v10 (ref), v15 (copy), l_SendItemImpressions_0 (ref), v16 (copy), v17 (copy), v11 (copy), v12 (copy), l_ProfilePlatform_0 (copy), v13 (copy), v14 (copy)
        v19.fireAnalyticsEvent(v10.ProfileImpressionsSent, {
            component = v15
        });
        if l_SendItemImpressions_0 and l_SendItemImpressions_0.sendFromProfile then
            l_SendItemImpressions_0.sendFromProfile(v16, v17, v20, v11, v12, l_ProfilePlatform_0, v13, v14, v15);
        end;
    end, l_dependencyArray_0(v17, v14, v15, v13, v16, l_ProfilePlatform_0, v11, v12, l_SendItemImpressions_0));
end;