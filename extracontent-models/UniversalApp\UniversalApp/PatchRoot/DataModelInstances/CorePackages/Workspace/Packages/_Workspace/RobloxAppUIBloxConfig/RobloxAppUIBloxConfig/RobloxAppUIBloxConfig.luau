local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_UIBlox_0 = v1.UIBlox;
return {
    useFoundationButton = l_UIBlox_0.GetFFlagUIBloxUseFoundationButton(), 
    setZIndexOnGridCells = game:DefineFastFlag("UIBloxUseNewZindex", false), 
    passRowAndColumnDataToItemInGridView = game:DefineFastFlag("UIBloxUseGridInfoForTile", false), 
    useProvidedRefForButton = true, 
    responsiveGridDisplayLinesNonNil = true, 
    enableTooltipV2HoverControllerReRenderFix = l_UIBlox_0.GetFFlagUIBloxEnableTooltipV2HoverControllerReRenderFix(), 
    enableTooltipV2BodyFontFix = l_UIBlox_0.GetFFlagUIBloxEnableTooltipV2BodyFontFix(), 
    enableOpenTypeSupport = v1.GetFFlagLuaAppEnableOpenTypeSupport(), 
    didMountUpdateFullPageModal = l_UIBlox_0.GetFFlagUIBloxDidMountUpdateFullPageModal(), 
    useTokenizedShortcutBar = l_UIBlox_0.FFlagUIBloxAppShortcutBarUseTokens, 
    enableScalingForSomeEdpIcons = true, 
    enableShortcutCustomization = v1.FFlagLuaAppEnableStickyShortcutBar, 
    enableActionBarButtonOverride = l_UIBlox_0.FFlagUIBloxEnableActionBarButtonOverride, 
    enablePanel3DSurfaceGuiRef = v1.FFlagLuaAppSupportFoundationOverlayInVR, 
    enableTooltipRichText = l_UIBlox_0.FFlagUIBloxEnableTooltipRichText, 
    fixCoplayFooterConditionalHooks = l_UIBlox_0.FFlagUIBloxFixCoplayFooterConditionalHooks, 
    useFoundationCheckbox = l_UIBlox_0.FFlagLuaAppUseFoundationCheckbox, 
    useFoundationLoading = l_UIBlox_0.FFlagLuaAppUseFoundationLoading, 
    disableTokenScaling = l_UIBlox_0.FFlagUIBloxDisableTokenScaling
};