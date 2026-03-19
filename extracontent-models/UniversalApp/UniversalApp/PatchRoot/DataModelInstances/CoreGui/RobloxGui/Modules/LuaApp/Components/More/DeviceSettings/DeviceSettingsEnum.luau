local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagSystemTrayEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSystemTrayEnabled;
return {
    SettingDescription = "SettingDescription", 
    MasterVolume = "MasterVolume", 
    PartyVoiceVolumeDivider = "PartyVoiceVolumeDivider", 
    PartyVoiceVolume = "PartyVoiceVolume", 
    DeviceLevelThemeDivider = "DeviceLevelThemeDivider", 
    DeviceLevelTheme = "DeviceLevelTheme", 
    PreferredTransparencyDivider = "PreferredTransparencyDivider", 
    PreferredTransparency = "PreferredTransparency", 
    HapticsDivider = "HapticsDivider", 
    Haptics = "Haptics", 
    ReducedMotionDivider = "ReducedMotionDivider", 
    ReducedMotion = "ReducedMotion", 
    PreferredTextSizeDivider = "PreferredTextSizeDivider", 
    PreferredTextSize = "PreferredTextSize", 
    UINavigationKeyBindDivider = "UINavigationKeyBindDivider", 
    UINavigationKeyBind = "UINavigationKeyBind", 
    ReadAloudDivider = "ReadAloudDivider", 
    ReadAloud = "ReadAloud", 
    LaunchAtStartupDivider = l_GetFFlagSystemTrayEnabled_0() and "LaunchAtStartupDivider" or nil, 
    LaunchAtStartup = l_GetFFlagSystemTrayEnabled_0() and "LaunchAtStartup" or nil, 
    MinimizeToTrayDivider = l_GetFFlagSystemTrayEnabled_0() and "MinimizeToTrayDivider" or nil, 
    MinimizeToTray = l_GetFFlagSystemTrayEnabled_0() and "MinimizeToTray" or nil
};