local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.IsExperienceMenuABTestEnabled);
local l_FStringSocialCaptureIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringSocialCaptureIXPLayer;
local l_FStringSocialCaptureTakenIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringSocialCaptureTakenIXPLayer;
local v4 = require(script.Parent.Parent.Flags.GetFFlagEnableNewInviteMenuIXP);
local l_GetFStringLargerRobuxUpsellIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer;
local l_GetFStringLuaAppExperienceMenuLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringLuaAppExperienceMenuLayer;
local v7 = require(script.Parent.Parent.Flags.GetFStringLuaAppConsoleExperienceMenuLayer);
local l_GetFFlagReportAnythingAnnotationIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportAnythingAnnotationIXP;
local l_GetFStringReportAnythingAnnotationIXPLayerName_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringReportAnythingAnnotationIXPLayerName;
local l_GetFFlagReportTabShareIXPLayerWithMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportTabShareIXPLayerWithMenu;
local v11 = require(script.Parent.Parent.Flags.GetFStringChatTranslationLayerName);
local v12 = require(script.Parent.Parent.Flags.GetFFlagChatTranslationSettingEnabled);
local v13 = require(script.Parent.Parent.Flags.GetFFlagVoiceUserAgencyEnableIXP);
local v14 = require(script.Parent.Parent.Flags.GetFStringVoiceUserAgencyIXPLayerName);
local v15 = require(script.Parent.Parent.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local l_getFStringDesktopToastNotificationLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFStringDesktopToastNotificationLayer;
local l_GetFStringGameInviteMenuLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringGameInviteMenuLayer;
local v18 = require(script.Parent.Parent.Flags.GetFFlagUXForCameraPerformanceIXPEnabled);
local v19 = require(script.Parent.Parent.Flags.GetFStringUXForCameraPerformanceIXPLayerName);
local v20 = require(script.Parent.Parent.Flags.GetFStringVoiceExposureIXPLayerName);
local l_GetFStringAndroidPhoneVerificationLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringAndroidPhoneVerificationLayer;
local l_GetFStringIOSPhoneVerificationLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringIOSPhoneVerificationLayer;
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local l_getFStringAppChatInExperienceIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFStringAppChatInExperienceIXPLayer;
local l_FStringReportMenuIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringReportMenuIXPLayer;
local l_FStringReportingIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringReportingIXPLayer;
local l_FStringEARReportMenuIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringEARReportMenuIXPLayer;
return function() --[[ Line: 45 ]]
    -- upvalues: l_getFStringDesktopToastNotificationLayer_0 (copy), l_FStringReportMenuIXPLayer_0 (copy), l_FStringReportingIXPLayer_0 (copy), l_FStringEARReportMenuIXPLayer_0 (copy), l_FStringSocialCaptureIXPLayer_0 (copy), l_FStringSocialCaptureTakenIXPLayer_0 (copy), v1 (copy), v4 (copy), l_GetFFlagReportTabShareIXPLayerWithMenu_0 (copy), l_GetFStringLuaAppExperienceMenuLayer_0 (copy), v7 (copy), l_GetFStringLargerRobuxUpsellIxpLayer_0 (copy), l_GetFFlagReportAnythingAnnotationIXP_0 (copy), l_GetFStringReportAnythingAnnotationIXPLayerName_0 (copy), v12 (copy), v11 (copy), v13 (copy), v14 (copy), v15 (copy), l_GetFStringGameInviteMenuLayer_0 (copy), v18 (copy), v19 (copy), v20 (copy), l_GetFStringAndroidPhoneVerificationLayer_0 (copy), l_GetFStringIOSPhoneVerificationLayer_0 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), l_getFStringAppChatInExperienceIXPLayer_0 (copy)
    local v28 = {
        "AbuseReports", 
        l_getFStringDesktopToastNotificationLayer_0(), 
        l_FStringReportMenuIXPLayer_0, 
        l_FStringReportingIXPLayer_0, 
        l_FStringEARReportMenuIXPLayer_0, 
        l_FStringSocialCaptureIXPLayer_0, 
        l_FStringSocialCaptureTakenIXPLayer_0
    };
    if v1() or v4() or l_GetFFlagReportTabShareIXPLayerWithMenu_0() then
        table.insert(v28, l_GetFStringLuaAppExperienceMenuLayer_0());
        table.insert(v28, v7());
    end;
    if l_GetFStringLargerRobuxUpsellIxpLayer_0() then
        table.insert(v28, l_GetFStringLargerRobuxUpsellIxpLayer_0());
    end;
    if l_GetFFlagReportAnythingAnnotationIXP_0() then
        table.insert(v28, l_GetFStringReportAnythingAnnotationIXPLayerName_0());
    end;
    if v12() and #v11() > 0 then
        table.insert(v28, v11());
    end;
    if v13() then
        table.insert(v28, v14());
    end;
    if v15() then
        table.insert(v28, l_GetFStringGameInviteMenuLayer_0());
    end;
    if v18() then
        table.insert(v28, v19());
    end;
    table.insert(v28, v20());
    if l_GetFStringAndroidPhoneVerificationLayer_0() then
        table.insert(v28, l_GetFStringAndroidPhoneVerificationLayer_0());
    end;
    if l_GetFStringIOSPhoneVerificationLayer_0() then
        table.insert(v28, l_GetFStringIOSPhoneVerificationLayer_0());
    end;
    if l_GetFFlagEnableAppChatInExperience_0() then
        table.insert(v28, l_getFStringAppChatInExperienceIXPLayer_0());
    end;
    return v28;
end;