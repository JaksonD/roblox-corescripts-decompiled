local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_GetFFlagUseLargerCDLCodeFontForVR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseLargerCDLCodeFontForVR;
local l_TextService_0 = game:GetService("TextService");
local l_Images_0 = v4.App.ImageSet.Images;
return function(v8, v9) --[[ Line: 16 ]] --[[ Name: makeLoginViewTokenMapper ]]
    -- upvalues: l_TextService_0 (copy), l_Images_0 (copy), l_UiMode_0 (copy), l_GetFFlagUseLargerCDLCodeFontForVR_0 (copy)
    local v10 = l_TextService_0:GetTextSize("", v9.Global.FontSize_200, Enum.Font.BuilderSans, Vector2.new(1e999, 1e999)).Y + 11;
    local v11 = {
        loginContentsPadding = 30, 
        marginY = 40, 
        textboxHeight = v10, 
        textboxLabelPadding = 12, 
        textboxPaddingX = 10, 
        textboxPaddingY = 7, 
        continueButtonHeight = 48, 
        crossdeviceButtonHeight = 48, 
        qrWidth = 128, 
        thumbnailSize = 160, 
        spacerSize = 12, 
        boxPadding = 4, 
        linkAccountPadding = v9.Global.Space_200, 
        errorTextSize = v9.Global.FontSize_25, 
        errorTextPadding = v9.Global.Space_100, 
        disclaimerPadding = v9.Global.Space_300, 
        textboxLabelHeight = v9.Global.FontSize_200, 
        textboxTextSize = 16, 
        lockPadding = 98, 
        loginTextSize = v9.Global.FontSize_200, 
        qrPadding = UDim.new(0, v9.Global.Space_200), 
        dividerPadding = 0, 
        dividerSize = 0, 
        disclaimerIconSize = v9.Global.Size_350, 
        disclaimerIconPadding = v9.Global.Space_200, 
        disclaimerElementHeight = 84, 
        linkIcon = l_Images_0["icons/navigation/externallink_medium"], 
        qrErrorPadding = 280, 
        dualLayoutPadding = 140, 
        credentialPaddingRight = 100, 
        xOffset = 166, 
        textSmallSize = v9.Global.FontSize_100, 
        forgotLinkHeight = 30, 
        quickLinkCodeViewBottomPadding = v9.Global.Space_600, 
        quickLinkCodeViewTopPadding = v9.Global.Space_400, 
        quickLinkCodeViewCodeBoxHorizontalPadding = v9.Global.Space_200, 
        quickLinkCodeViewCodeBoxVertialPadding = v9.Global.Space_100, 
        quickLinkCodeViewCodeTextSize = v9.Global.Size_300
    };
    if v8.uiMode == l_UiMode_0.TenFoot or v8.uiMode == l_UiMode_0.VR then
        v11.textboxHeight = v9.Global.Space_600;
        v11.textboxLabelPadding = v9.Global.Space_200;
        v11.continueButtonHeight = v9.Global.Space_600;
        v11.textHeaderSize = v9.Global.FontSize_200;
        v11.cdlDeviceCodeSize = if l_GetFFlagUseLargerCDLCodeFontForVR_0() and v8.uiMode == l_UiMode_0.VR then v9.Global.FontSize_1000 else v9.Global.FontSize_200;
        v11.textBodySize = v9.Global.FontSize_200;
        v11.loginContentsPadding = v9.Global.Space_400;
        v11.qrWidth = 280;
        v11.boxPadding = v9.Global.Space_200;
        v11.textboxTextSize = v9.Global.FontSize_100;
        v11.qrPadding = UDim.new(0, v9.Global.Space_400);
        v11.dividerPadding = v9.Global.Space_400;
        v11.dividerSize = v9.Global.Space_150;
        v11.dualLayoutPadding = v9.Global.Space_300;
        v11.credentialPaddingRight = v9.Global.Space_600;
        v11.errorTextSize = v9.Global.FontSize_100;
        v11.errorTextPadding = v9.Global.Space_100;
    end;
    return v11;
end;