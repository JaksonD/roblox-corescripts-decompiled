local l_Parent_0 = script:FindFirstAncestor("TenFootUiCommon").Parent;
local _ = require(l_Parent_0.React);
local _ = require(l_Parent_0.Navigation);
local v3 = {
    ShowAll = "ShowAll", 
    TabGroupOnly = "TabGroupOnly", 
    OptionGroupOnly = "OptionGroupOnly", 
    HideAll = "HideAll"
};
return {
    ScreenKind = {
        Default = "Default", 
        FullScreen = "FullScreen"
    }, 
    GlobalNavDisplayOption = v3
};