local l_Modules_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_game_EngineFeature_0 = game:GetEngineFeature("PartyVoiceVolume");
local v3 = require(l_Modules_0.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting);
local l_FFlagBadgeVisibilitySettingEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled;
local l_FFlagEnableModerateChatRemoteEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent;
local v6 = require(l_Modules_0.Settings.Flags.FFlagIEMSettingsGroups);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v8 = require(l_CorePackages_0.Packages.ReactUtils);
local v9 = game:DefineFastInt("ChatModerationFrameLayoutOrder", 9);
local v10 = {
    OverscanAdjustButton = 1
};
if l_FFlagEnableModerateChatRemoteEvent_0 then
    v10.ChatModerationFrame = v9;
end;
v10.ShiftLockFrame = 10;
v10.CameraModeFrame = 11;
v10.MovementModeFrame = 12;
v10.FramerateCap = 13;
v10.GamepadSensitivityFrame = 14;
v10.CameraInvertedFrame = 90;
v10.CameraDeviceFrame = 91;
v10.MouseAdvancedFrame = 50;
v10.VoiceConnectDisconnectSelector = 17;
v10.VoiceConnectFrame = 18;
v10.VoiceDisconnectFrame = 19;
if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
    v10.PlayerChoiceTranslationFrame = 20;
    v10.LanguageSelectorFrame = 21;
    v10.ChatTranslationFrame = 30;
    v10.ChatLanguageSelectorFrame = 31;
    v10.ChatTranslationToggleFrame = 32;
    v10.FeedbackModeButton = 40;
else
    v10.LanguageSelectorFrame = 20;
    v10.FeedbackModeButton = 30;
    v10.ChatTranslationFrame = 40;
    v10.ChatLanguageSelectorFrame = 41;
    v10.ChatTranslationToggleFrame = 42;
end;
if l_isInExperienceUIVREnabled_0 then
    v10.VRComfortSettingFrame = 54;
    v10.VRVignetteEnabledFrame = 55;
    v10.VRSteppedRotationEnabledFrame = 56;
    v10.VRThirdPersonFixedCamEnabledFrame = 57;
    v10.VRSafetyBubbleModeFrame = 58;
end;
v10.DeviceFrameInput = 60;
v10.DeviceFrameOutput = 61;
v10.VolumeFrame = 62;
if l_game_EngineFeature_0 then
    v10.PartyVoiceVolumeFrame = 63;
end;
v10.HapticsFrame = l_game_EngineFeature_0 and 64 or 63;
v10.FullScreenFrame = 70;
v10.GraphicsEnablerFrame = 71;
v10.GraphicsQualityFrame = 72;
v10.ReducedMotionFrame = 73;
v10.PreferredTransparencyFrame = 74;
v10.PreferredTextSizeFrame = 75;
v10.UiNavigationKeyBindEnabledFrame = 76;
v10.PerformanceStatsFrame = 80;
v10.MicroProfilerFrame = 81;
v10.VREnabledFrame = 100;
v10.DeveloperConsoleButton = 101;
if v3() then
    v10.PlayerNamesEnabledFrame = 105;
end;
if l_FFlagBadgeVisibilitySettingEnabled_0 then
    v10.BadgeVisibilityFrame = 106;
end;
v10.UiToggleRow = 200;
v10.UiToggleRowCustom = 200;
v10.UiToggleRowBillboards = 201;
v10.UiToggleRowNameplates = 202;
v10.FreecamToggleRow = 203;
v10.InformationFrame = 999;
local v11 = nil;
if v6 then
    local v12 = v8.createNextOrder();
    v11 = {
        AudioHeader = v12(), 
        VolumeFrame = v12(), 
        PartyVoiceVolumeFrame = v12(), 
        DeviceFrameInput = v12(), 
        DeviceFrameOutput = v12(), 
        AudioDivider = v12(), 
        LanguageHeader = v12(), 
        ChatModerationFrame = v12(), 
        VoiceConnectDisconnectSelector = v12(), 
        VoiceConnectFrame = v12(), 
        VoiceDisconnectFrame = v12(), 
        PlayerChoiceTranslationFrame = if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then v12() else nil, 
        LanguageSelectorFrame = v12(), 
        FeedbackModeButton = v12(), 
        ChatTranslationFrame = v12(), 
        ChatLanguageSelectorFrame = v12(), 
        ChatTranslationToggleFrame = v12(), 
        LanguageDivider = v12(), 
        DisplayHeader = v12(), 
        OverscanAdjustButton = v12(), 
        FullScreenFrame = v12(), 
        PreferredTransparencyFrame = v12(), 
        PreferredTextSizeFrame = v12(), 
        VRComfortSettingFrame = if l_isInExperienceUIVREnabled_0 then v12() else nil, 
        VRVignetteEnabledFrame = if l_isInExperienceUIVREnabled_0 then v12() else nil, 
        VRSteppedRotationEnabledFrame = if l_isInExperienceUIVREnabled_0 then v12() else nil, 
        VRThirdPersonFixedCamEnabledFrame = if l_isInExperienceUIVREnabled_0 then v12() else nil, 
        VRSafetyBubbleModeFrame = if l_isInExperienceUIVREnabled_0 then v12() else nil, 
        PerformanceStatsFrame = v12(), 
        MicroProfilerFrame = v12(), 
        GraphicsEnablerFrame = v12(), 
        GraphicsQualityFrame = v12(), 
        HapticsFrame = v12(), 
        ReducedMotionFrame = v12(), 
        FramerateCap = v12(), 
        VREnabledFrame = v12(), 
        DisplayDivider = v12(), 
        ViewAndControlsHeader = v12(), 
        CameraModeFrame = v12(), 
        CameraInvertedFrame = v12(), 
        CameraSensitivityFrame = v12(), 
        MouseAdvancedFrame = v12(), 
        GamepadSensitivityFrame = v12(), 
        MovementModeFrame = v12(), 
        ShiftLockFrame = v12(), 
        CameraDeviceFrame = v12(), 
        UiNavigationKeyBindEnabledFrame = v12(), 
        DeveloperConsoleButton = v12(), 
        PlayerNamesEnabledFrame = if v3() then v12() else nil, 
        BadgeVisibilityFrame = if l_FFlagBadgeVisibilitySettingEnabled_0 then v12() else nil, 
        UiToggleRow = v12(), 
        UiToggleRowCustom = v12(), 
        UiToggleRowBillboards = v12(), 
        UiToggleRowNameplates = v12(), 
        FreecamToggleRow = v12(), 
        InformationFrame = v12()
    };
end;
local _ = function() --[[ Line: 184 ]] --[[ Name: getLayoutOrder ]]
    -- upvalues: v6 (copy), v11 (ref), v10 (copy)
    local _ = {};
    if v6 then
        return v11;
    else
        return v10;
    end;
end;
local v15 = {};
local _ = {};
v15.SETTINGS_MENU_LAYOUT_ORDER = if v6 then v11 else v10;
return v15;