local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local v9 = require(l_CorePackages_0.Workspace.Packages.GenericAbuseReporting);
local l_AbuseVector_0 = v9.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v9.Thunks.OpenDynamicAbuseReport;
local v12 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v14 = require(l_CorePackages_0.Packages.Promise);
local v15 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v16 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_FFlagEnableAbuseReportRevampFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAbuseReportRevampFlow;
local v18 = game:DefineFastFlag("EnableAbuseReportRevampLooks", false);
local v19 = {
    toastMessage = "Feature.Catalog.Response.ReportSubmitted", 
    isLocalized = false, 
    toastType = v15.SuccessConfirmation
};
local v20 = {
    toastMessage = "Feature.ReportAbuse.Message.ErrorSubmitFailure", 
    isLocalized = false, 
    toastType = v15.InformationMessage
};
return function(v21) --[[ Line: 41 ]]
    -- upvalues: l_PerformFetch_0 (copy), v12 (copy), v4 (copy), v14 (copy), l_UserInputService_0 (copy), l_IsVRAppBuild_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v18 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), v13 (copy), v16 (copy), v19 (copy), l_Logging_0 (copy), v20 (copy)
    return l_PerformFetch_0.Single("reportLookKey", function(v22) --[[ Line: 42 ]]
        -- upvalues: v12 (ref), v4 (ref), v14 (ref), l_UserInputService_0 (ref), l_IsVRAppBuild_0 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v18 (ref), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_CloseCentralOverlay_0 (ref), v13 (ref), v21 (copy), v16 (ref), v19 (ref), l_Logging_0 (ref), v20 (ref)
        local v23 = v22:getState();
        local l_LocalUserId_0 = v23.LocalUserId;
        local l_LookId_0 = v23.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        local v26 = v23.AvatarExperience.Common.Widgets.HydratedWidgetData[v12.ContentType.Look];
        local v27 = if v26 and l_LookId_0 then v26[l_LookId_0] else nil;
        local v29 = if v27 then v4.List.map(v27.assets, function(v28) --[[ Line: 49 ]]
            return (tostring(v28.id));
        end) else nil;
        if not l_LookId_0 then
            return v14.reject("Attempt to report a look, but no look is currently displayed");
        else
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v31 = "unknown";
            if l_IsVRAppBuild_0() then
                v31 = "vr";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                v31 = "desktop";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS or l_l_UserInputService_0_Platform_0 == Enum.Platform.Android or l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
                v31 = "mobile";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.XBox360 or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS3 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 or l_l_UserInputService_0_Platform_0 == Enum.Platform.WiiU then
                v31 = "console";
            end;
            local v32 = v27 and v27.curator and v27.curator.id ~= 1;
            local v33 = v32 and "COMMUNITY_LOOKS" or "LOOKS";
            local v34 = {
                ENTRY_POINT = v31, 
                REPORTED_ABUSE_CATEGORY = "ABUSE_CATEGORY_OTHER", 
                REPORTED_ABUSE_VECTOR = v33, 
                REPORTER_COMMENT = "", 
                SUBMITTER_USER_ID = l_LocalUserId_0, 
                REPORT_TARGET_LOOK_ID = l_LookId_0, 
                REPORT_TARGET_LOOK_INCLUDED_ASSET_ID = v29
            };
            if l_FFlagEnableAbuseReportRevampFlow_0 and v18 then
                v22:dispatch(l_OpenDynamicAbuseReport_0({
                    abuseVector = if v32 then l_AbuseVector_0.CommunityLooks else l_AbuseVector_0.Looks, 
                    targetId = {
                        lookId = l_LookId_0, 
                        lookAssetsIds = v29
                    }, 
                    onClose = function() --[[ Line: 96 ]] --[[ Name: onClose ]]
                        -- upvalues: v22 (copy), l_CloseCentralOverlay_0 (ref)
                        v22:dispatch(l_CloseCentralOverlay_0());
                    end
                }));
                return v14.resolve();
            else
                return v13.AbuseReport(v21, v34):andThen(function(_) --[[ Line: 103 ]]
                    -- upvalues: v22 (copy), v16 (ref), v19 (ref)
                    v22:dispatch(v16(v19));
                end, function(v36) --[[ Line: 105 ]]
                    -- upvalues: l_Logging_0 (ref), v22 (copy), v16 (ref), v20 (ref)
                    l_Logging_0.warn("WebApi failure in AbuseReport: " .. tostring(v36));
                    v22:dispatch(v16(v20));
                end);
            end;
        end;
    end);
end;