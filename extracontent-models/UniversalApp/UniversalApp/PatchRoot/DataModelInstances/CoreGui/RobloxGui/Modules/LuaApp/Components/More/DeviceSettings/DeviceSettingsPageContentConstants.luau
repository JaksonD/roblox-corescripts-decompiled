local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent;
local v2 = require(l_CorePackages_0.Packages.ReactUtils).createNextOrder();
local v3 = require(l_Parent_0.DeviceSettingsEnum);
local l_GetFFlagSystemTrayEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSystemTrayEnabled;
local v5 = {
    [v3.SettingDescription] = v2(), 
    [v3.MasterVolume] = v2(), 
    [v3.PartyVoiceVolumeDivider] = v2(), 
    [v3.PartyVoiceVolume] = v2(), 
    [v3.DeviceLevelThemeDivider] = v2(), 
    [v3.DeviceLevelTheme] = v2(), 
    [v3.PreferredTransparencyDivider] = v2(), 
    [v3.PreferredTransparency] = v2(), 
    [v3.HapticsDivider] = v2(), 
    [v3.Haptics] = v2(), 
    [v3.ReducedMotionDivider] = v2(), 
    [v3.ReducedMotion] = v2(), 
    [v3.PreferredTextSizeDivider] = v2(), 
    [v3.PreferredTextSize] = v2(), 
    [v3.UINavigationKeyBindDivider] = v2(), 
    [v3.UINavigationKeyBind] = v2(), 
    [v3.ReadAloudDivider] = v2(), 
    [v3.ReadAloud] = v2()
};
if l_GetFFlagSystemTrayEnabled_0() then
    v5[v3.LaunchAtStartupDivider] = v2();
    v5[v3.LaunchAtStartup] = v2();
    v5[v3.MinimizeToTrayDivider] = v2();
    v5[v3.MinimizeToTray] = v2();
end;
local v6 = {
    Dark = "dark", 
    Light = "light", 
    System = "system"
};
return {
    LAYOUT_ORDER = v5, 
    DeviceLevelThemeKey = v6, 
    CONTEXTUAL_SLIDER_BASE_WIDTH = 310
};