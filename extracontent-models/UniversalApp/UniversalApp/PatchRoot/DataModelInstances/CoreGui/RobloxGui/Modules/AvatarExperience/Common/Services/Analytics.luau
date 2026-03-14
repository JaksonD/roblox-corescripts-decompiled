local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Analytics.open3DFullView);
local v4 = require(l_Modules_0.AvatarExperience.Common.Analytics.close3DFullView);
local l_AnalyticsService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService;
local v6 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounter);
local l_reportAvatarEventCounterV1_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterV1;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Constants;
local l_FFlagAXMigrateReportAvatarEventCounter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateReportAvatarEventCounter;
local v10 = {};
local v11 = nil;
v10.get = function(_) --[[ Line: 24 ]] --[[ Name: get ]]
    -- upvalues: v11 (ref), l_AnalyticsService_0 (copy), v3 (copy), v4 (copy), l_FFlagAXMigrateReportAvatarEventCounter_0 (copy), l_reportAvatarEventCounterV1_0 (copy), l_Constants_0 (copy), v6 (copy)
    if v11 then
        return v11;
    else
        local l_l_AnalyticsService_0_0 = l_AnalyticsService_0;
        local v19 = {
            open3DFullView = function(v14) --[[ Line: 33 ]] --[[ Name: open3DFullView ]]
                -- upvalues: v3 (ref), l_l_AnalyticsService_0_0 (copy)
                v3(l_l_AnalyticsService_0_0.EventStream, v14);
            end, 
            close3DFullView = function(v15) --[[ Line: 37 ]] --[[ Name: close3DFullView ]]
                -- upvalues: v4 (ref), l_l_AnalyticsService_0_0 (copy)
                v4(l_l_AnalyticsService_0_0.EventStream, v15);
            end, 
            toggleCameraInEditorAndShop = function(v16, v17) --[[ Line: 42 ]] --[[ Name: toggleCameraInEditorAndShop ]]
                -- upvalues: l_l_AnalyticsService_0_0 (copy), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v6 (ref)
                local v18 = v16 and "Button Enabled" or "Button Disabled";
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("CameraInEditorAndCatalogButton", "CameraInEditorAndCatalogButton_Toggle", {
                    actionName = v18, 
                    pageName = v17
                });
                if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                    l_reportAvatarEventCounterV1_0(if v16 then l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXCameraEnabled else l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXCameraDisabled);
                    return;
                else
                    v6(l_l_AnalyticsService_0_0, if v16 then l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXCameraEnabled else l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXCameraDisabled);
                    return;
                end;
            end
        };
        v11 = v19;
        return v19;
    end;
end;
return v10;