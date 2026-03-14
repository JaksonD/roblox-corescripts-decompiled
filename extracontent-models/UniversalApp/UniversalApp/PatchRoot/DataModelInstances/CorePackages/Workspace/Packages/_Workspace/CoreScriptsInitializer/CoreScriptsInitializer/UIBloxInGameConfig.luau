local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_UIBlox_0 = v1.UIBlox;
return {
    useFoundationButton = game:DefineFastFlag("UIBloxUseFoundationButtonInGame2", false), 
    enableTooltipV2HoverControllerReRenderFix = l_UIBlox_0.GetFFlagUIBloxEnableTooltipV2HoverControllerReRenderFix(), 
    enableTooltipV2BodyFontFix = l_UIBlox_0.GetFFlagUIBloxEnableTooltipV2BodyFontFix(), 
    enableOpenTypeSupport = v1.GetFFlagLuaAppEnableOpenTypeSupport(), 
    didMountUpdateFullPageModal = l_UIBlox_0.GetFFlagUIBloxDidMountUpdateFullPageModal(), 
    enablePanel3DSurfaceGuiRef = v1.FFlagLuaAppSupportFoundationOverlayInVR, 
    useTokenizedShortcutBar = v1.FFlagEnableConsoleExpControls, 
    useProvidedRefForButton = true
};