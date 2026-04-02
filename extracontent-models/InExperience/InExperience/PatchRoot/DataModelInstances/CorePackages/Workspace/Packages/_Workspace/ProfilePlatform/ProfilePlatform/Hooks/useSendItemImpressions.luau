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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v12, v13, v14, v15, v16) --[[ Line: 23 ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_AppPage_0 (copy), v8 (copy), v2 (copy), v10 (copy), l_SendItemImpressions_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v17 = l_useRoactService_0(l_AppEventIngestService_0);
    local v18 = l_useRoactService_0(l_RoactAnalytics_0);
    local l_ProfilePlatform_0 = l_AppPage_0.ProfilePlatform;
    local v20 = v8();
    return v2.useCallback(function(v21) --[[ Line: 36 ]]
        -- upvalues: v20 (copy), v10 (ref), v16 (copy), l_SendItemImpressions_0 (ref), v17 (copy), v18 (copy), v12 (copy), v13 (copy), l_ProfilePlatform_0 (copy), v14 (copy), v15 (copy)
        v20.fireAnalyticsEvent(v10.ProfileImpressionsSent, {
            component = v16
        });
        if l_SendItemImpressions_0 and l_SendItemImpressions_0.sendFromProfile then
            l_SendItemImpressions_0.sendFromProfile(v17, v18, v21, v12, v13, l_ProfilePlatform_0, v14, v15, v16);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v18, 
        v15, 
        v16, 
        v14, 
        v17, 
        l_ProfilePlatform_0, 
        v12, 
        v13, 
        l_SendItemImpressions_0
    } else l_dependencyArray_0(v18, v15, v16, v14, v17, l_ProfilePlatform_0, v12, v13, l_SendItemImpressions_0));
end;