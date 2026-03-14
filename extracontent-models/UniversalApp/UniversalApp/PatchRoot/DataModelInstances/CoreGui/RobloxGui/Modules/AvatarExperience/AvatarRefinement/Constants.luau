local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild() and 1.3 or 1;
local v3 = {
    Tile = {
        Size = v2 * 50, 
        SelectedSize = v2 * 58, 
        Padding = v2 * 6, 
        ContextWidth = v2 * 42, 
        ShownContextWidth = v2 * 33, 
        MoreIconSize = v2 * 34, 
        ArrowSize = UDim2.fromOffset(28, 22)
    }, 
    VerticalList = {
        Width = v2 * 62, 
        HeightScale = 0.8, 
        Padding = 13
    }, 
    NoItem = {
        TextSize = 12, 
        BottomPadding = 0, 
        IconSize = 30
    }, 
    LongPressSeconds = 0.25, 
    RightMargin = 12
};
local v4 = {
    Tile = {
        Size = 80, 
        SelectedSize = 88, 
        Padding = 6, 
        ContextWidth = 64, 
        ShownContextWidth = 51, 
        MoreIconSize = 52, 
        ArrowSize = UDim2.fromOffset(42, 33)
    }, 
    VerticalList = {
        Width = 92, 
        HeightScale = 0.8, 
        Padding = 13
    }, 
    NoItem = {
        TextSize = 20, 
        BottomPadding = -72, 
        IconSize = 48
    }, 
    LongPressSeconds = 0.0625, 
    RightMargin = 80
};
return l_GuiService_0:IsTenFootInterface() and v4 or v3;