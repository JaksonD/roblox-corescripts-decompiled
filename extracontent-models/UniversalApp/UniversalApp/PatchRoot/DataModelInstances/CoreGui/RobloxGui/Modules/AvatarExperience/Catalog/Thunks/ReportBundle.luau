local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v6 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v7 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v8 = {
    toastMessage = "Feature.Catalog.Response.ReportSubmitted", 
    isLocalized = false, 
    toastType = v6.SuccessConfirmation
};
local v9 = {
    toastMessage = "Feature.ReportAbuse.Message.ErrorSubmitFailure", 
    isLocalized = false, 
    toastType = v6.NetworkingError
};
return function(v10, v11, v12, v13) --[[ Line: 25 ]]
    -- upvalues: l_PerformFetch_0 (copy), l_IsVRAppBuild_0 (copy), v5 (copy), v7 (copy), v8 (copy), l_Logging_0 (copy), v9 (copy)
    return l_PerformFetch_0.Single("reportBundleKey", function(v14) --[[ Line: 26 ]]
        -- upvalues: l_IsVRAppBuild_0 (ref), v12 (copy), v5 (ref), v10 (copy), v11 (copy), v13 (copy), v7 (ref), v8 (ref), l_Logging_0 (ref), v9 (ref)
        local l_LocalUserId_0 = v14:getState().LocalUserId;
        local v16 = "unknown";
        if l_IsVRAppBuild_0() then
            v16 = "vr";
        elseif v12 == Enum.Platform.Windows or v12 == Enum.Platform.OSX or v12 == Enum.Platform.UWP then
            v16 = "desktop";
        elseif v12 == Enum.Platform.IOS or v12 == Enum.Platform.Android then
            v16 = "mobile";
        elseif v12 == Enum.Platform.XBox360 or v12 == Enum.Platform.XBoxOne or v12 == Enum.Platform.PS3 or v12 == Enum.Platform.PS4 or v12 == Enum.Platform.PS5 or v12 == Enum.Platform.WiiU then
            v16 = "console";
        end;
        return v5.AbuseReportBundle(v10, l_LocalUserId_0, v11, v16, v13):andThen(function(_) --[[ Line: 49 ]]
            -- upvalues: v14 (copy), v7 (ref), v8 (ref)
            v14:dispatch(v7(v8));
        end, function(v18) --[[ Line: 51 ]]
            -- upvalues: l_Logging_0 (ref), v14 (copy), v7 (ref), v9 (ref)
            l_Logging_0.warn("WebApi failure in AbuseReportBundle: " .. tostring(v18));
            v14:dispatch(v7(v9));
        end);
    end);
end;