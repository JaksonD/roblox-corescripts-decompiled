local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting");
local v2 = {
    ThemeName = {
        Dark = "Dark", 
        Light = "Light"
    }, 
    FontName = {
        Gotham = "Gotham"
    }, 
    DeviceType = {
        Desktop = "Desktop", 
        Tablet = "Tablet", 
        Phone = "Phone", 
        Console = "Console", 
        VR = "VR", 
        Unknown = "Unknown"
    }, 
    Layout = {
        ActionBar = {
            PositionOffset = 24
        }
    }
};
v2.DefaultThemeName = v2.ThemeName.Light;
v2.DefaultFontName = v2.FontName.Gotham;
v2.DefaultDeviceType = v2.DeviceType.Desktop;
v2.DefaultSettings = {
    preferredTransparency = 1, 
    reducedMotion = false, 
    preferredTextSize = if v1 then Enum.PreferredTextSize.Medium else nil, 
    scale = 1
};
return v2;