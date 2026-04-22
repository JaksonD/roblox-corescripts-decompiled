local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_UIBlox_0 = v1.UIBlox;
return {
    useFoundationButton = true, 
    enableTooltipV2HoverControllerReRenderFix = l_UIBlox_0.GetFFlagUIBloxEnableTooltipV2HoverControllerReRenderFix(), 
    enableTooltipV2BodyFontFix = l_UIBlox_0.GetFFlagUIBloxEnableTooltipV2BodyFontFix(), 
    enableOpenTypeSupport = v1.GetFFlagLuaAppEnableOpenTypeSupport(), 
    didMountUpdateFullPageModal = l_UIBlox_0.GetFFlagUIBloxDidMountUpdateFullPageModal(), 
    useTokenizedShortcutBar = v1.FFlagEnableConsoleExpControls, 
    useFoundationCheckbox = l_UIBlox_0.FFlagLuaAppUseFoundationCheckbox, 
    useFoundationLoading = l_UIBlox_0.FFlagLuaAppUseFoundationLoading, 
    disableTokenScaling = l_UIBlox_0.FFlagUIBloxDisableTokenScaling, 
    enableFoundationTokenMapping = l_UIBlox_0.FFlagUIBloxEnableFoundationTokenMapping, 
    useColorTokensForThemeMapping = l_UIBlox_0.FFlagUIBloxUseColorTokensForThemeMapping
};