local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.LuaApp.withLocalization);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_DividerWithText_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Components.DividerWithText;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v14 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v15 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v16 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagCrossDeviceInstructionExperiment);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCorrectedLoginInstructions);
local l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMaquettesShortLinkCDLInstructions;
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableQRCodeDisableForDualLayout);
local l_GetFFlagUseLargerCDLCodeFontForVR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseLargerCDLCodeFontForVR;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_RoactAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalytics;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v27 = require(l_Modules_0.LuaApp.FitChildren);
local v28 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_FFlagEnableMagicLogin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMagicLogin;
local v30 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v30.Button;
local l_ButtonVariant_0 = v30.Enums.ButtonVariant;
local l_InputSize_0 = v30.Enums.InputSize;
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_getIconSizeUDim2_0 = v4.App.ImageSet.getIconSizeUDim2;
local v38 = l_Images_0["icons/graphic/lock_xxlarge"];
local v39 = l_getIconSizeUDim2_0(l_IconSize_0.XLarge);
local v40 = l_getIconSize_0(l_IconSize_0.XLarge) * 4 / 3;
return function(v41) --[[ Line: 57 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_useAppPolicy_0 (copy), v15 (copy), v16 (copy), v13 (copy), v14 (copy), l_withStyle_0 (copy), l_GetFFlagUseLargerCDLCodeFontForVR_0 (copy), v40 (copy), v18 (copy), v3 (copy), v17 (copy), l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0 (copy), l_IsVRAppBuild_0 (copy), v19 (copy), v21 (copy), v2 (copy), l_FFlagEnableMagicLogin_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_ImageSetLabel_0 (copy), v39 (copy), v38 (copy), l_DividerWithText_0 (copy), l_LoadingSpinner_0 (copy), v28 (copy), v27 (copy)
    local l_isDualLayout_0 = v41.isDualLayout;
    local l_hideDeviceCode_0 = v41.hideDeviceCode;
    local l_showLockIcon_0 = v41.showLockIcon;
    local v45 = l_useDispatch_0();
    local v46 = l_useDesignTokens_0();
    local l_LoginView_0 = v46.LuaApps.LoginView;
    local l_EngagementScreen_0 = v46.LuaApps.EngagementScreen;
    local v49 = l_useRoactService_0(l_AppLinking_0);
    local v50 = l_useRoactService_0(l_RoactNetworking_0);
    local v51 = l_useRoactService_0(l_RoactAnalytics_0);
    local v53 = l_useAppPolicy_0(function(v52) --[[ Line: 69 ]]
        return v52;
    end);
    local function v54() --[[ Line: 73 ]] --[[ Name: MagicLoginOpenDiscoveryView ]]
        -- upvalues: v45 (copy), v15 (ref), v16 (ref), v13 (ref), v50 (copy), v51 (copy), v53 (copy), v14 (ref)
        v45(v15(v16.DeviceSelectorPeekView, {
            launchApp = function() --[[ Line: 75 ]] --[[ Name: launchApp ]]
                -- upvalues: v45 (ref), v13 (ref), v50 (ref), v51 (ref), v53 (ref), v14 (ref)
                return v45(v13(v50, nil, v51, v53, v14.Login));
            end
        }));
    end;
    return l_withStyle_0(function(v55) --[[ Line: 81 ]]
        -- upvalues: v41 (copy), l_GetFFlagUseLargerCDLCodeFontForVR_0 (ref), l_LoginView_0 (copy), l_isDualLayout_0 (copy), v40 (ref), v18 (ref), v49 (copy), v3 (ref), v17 (ref), l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0 (ref), l_IsVRAppBuild_0 (ref), v19 (ref), v21 (ref), v2 (ref), l_FFlagEnableMagicLogin_0 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), v54 (copy), l_InputSize_0 (ref), l_showLockIcon_0 (copy), l_ImageSetLabel_0 (ref), v39 (ref), v38 (ref), l_hideDeviceCode_0 (copy), v46 (copy), l_DividerWithText_0 (ref), l_EngagementScreen_0 (copy), l_LoadingSpinner_0 (ref), v28 (ref), v27 (ref)
        local l_DeviceCode_0 = v41.DeviceCode;
        local l_Font_0 = v55.Font.Title.Font;
        local l_Font_1 = v55.Font.Body.Font;
        local l_BaseSize_0 = v55.Font.BaseSize;
        local v60 = if l_GetFFlagUseLargerCDLCodeFontForVR_0() then l_LoginView_0.cdlDeviceCodeSize or l_BaseSize_0 * v55.Font.Title.RelativeSize else l_LoginView_0.textHeaderSize or l_BaseSize_0 * v55.Font.Title.RelativeSize;
        local v61 = l_LoginView_0.textBodySize or l_BaseSize_0 * v55.Font.Body.RelativeSize;
        local v62 = if l_isDualLayout_0 then l_LoginView_0.textSmallSize else l_BaseSize_0 * v55.Font.CaptionBody.RelativeSize;
        local v63 = l_LoginView_0.qrWidth or v40;
        local v64 = UDim2.fromOffset(v63, v63);
        local l_Transparency_0 = v55.Theme.TextEmphasis.Transparency;
        local l_Color_0 = v55.Theme.TextEmphasis.Color;
        local v67 = v18() and v41.QrCodeUrl and not v41.DisableQrCode;
        local v68 = not v41.DisableQrCode;
        if v41.isDualLayout then
            v67 = v41.QrCodeUrl and not v41.DisableQrCode;
        end;
        local v69 = nil;
        v69 = if v67 then v60 * 0.75 else v60 * 1.5;
        local l_leftAlignText_0 = v41.leftAlignText;
        if v41.isCrossApp and l_DeviceCode_0 ~= "" then
            v49:openURL("robloxglobal://navigation/crossdevice?code=" .. l_DeviceCode_0 .. "&" .. "source=vng");
        end;
        return v3({
            alertTitle = "Authentication.CrossDevice.Heading.LoginCode", 
            devicePrompt = "Authentication.CrossDevice.Label.DevicePrompt", 
            loginInstructions = "Authentication.CrossDevice.Label.LoginInstructions", 
            loginInstructionsV2 = "Authentication.CrossDevice.Label.LoginInstructionsV2", 
            loginLocation = "Authentication.CrossDevice.Label.LoginLocation", 
            loginLocationV2 = "Authentication.CrossDevice.Label.LoginLocationV2", 
            qrHeader = "Authentication.CrossDevice.Label.QrHeader", 
            qrHeaderDualLayout = "Authentication.CrossDevice.Label.QrCodeLogin", 
            qrInstructions = "Authentication.CrossDevice.Label.QrInstructions", 
            codeHeader = "Authentication.CrossDevice.Label.CodeHeader", 
            codeHeaderDualLayout = "Authentication.CrossDevice.Heading.QuickLogin", 
            orYouCan = "CommonUI.Features.Labels.OrYouCan", 
            confirmAndLoginAs = "Authentication.CrossDevice.Label.ConfirmAndLoginAs", 
            qrCodeError = "Authentication.CrossDevice.Label.QrCodeError", 
            shortlinkLoginInstructions = "Authentication.CrossDevice.Label.QuestCDLShortLinkInstruction"
        })(function(v71) --[[ Line: 140 ]]
            -- upvalues: v17 (ref), v41 (ref), l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0 (ref), l_IsVRAppBuild_0 (ref), v19 (ref), v21 (ref), l_isDualLayout_0 (ref), v68 (copy), v67 (ref), v2 (ref), l_FFlagEnableMagicLogin_0 (ref), l_Font_1 (copy), v61 (copy), l_Color_0 (copy), l_Transparency_0 (copy), l_leftAlignText_0 (copy), l_Button_0 (ref), l_ButtonVariant_0 (ref), v54 (ref), l_InputSize_0 (ref), l_showLockIcon_0 (ref), l_ImageSetLabel_0 (ref), v64 (copy), v39 (ref), v38 (ref), v55 (copy), l_LoginView_0 (ref), v62 (copy), l_hideDeviceCode_0 (ref), v46 (ref), l_DividerWithText_0 (ref), l_EngagementScreen_0 (ref), l_DeviceCode_0 (copy), l_Font_0 (copy), v60 (copy), v69 (ref), l_LoadingSpinner_0 (ref), v28 (ref), v27 (ref)
            local v72 = v17();
            local v73 = v72 and v41.AltMobileInstruction and v41.AltDesktopInstruction;
            local v74 = v72 and v41.AltTitle or if l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0() and l_IsVRAppBuild_0() then v71.shortlinkLoginInstructions else v71.devicePrompt;
            local v75 = v72 and v41.AltInstruction or if v19() then v71.loginInstructionsV2 else v71.loginInstructions;
            local v76 = nil;
            local v77 = nil;
            local v78 = nil;
            local v79 = nil;
            local v80 = if v21() then l_isDualLayout_0 and v68 else l_isDualLayout_0;
            if v80 then
                v78 = 3;
                v79 = 2;
                v76 = 6;
                v77 = 5;
            elseif v67 then
                v78 = 2;
                v79 = 3;
                v76 = 5;
                v77 = 6;
            else
                v76 = 2;
                v77 = 4;
            end;
            local v81 = if l_isDualLayout_0 then v71.qrHeaderDualLayout else v71.qrHeader;
            local v82 = if l_isDualLayout_0 then v71.codeHeaderDualLayout else v71.codeHeader;
            local v83 = nil;
            v83 = if v41.showConfirmLoginText then string.format(v71.confirmAndLoginAs, v41.DisplayName) else v71.qrInstructions;
            local l_createFragment_0 = v2.createFragment;
            local v85 = {
                MagicLoginHeader = if l_FFlagEnableMagicLogin_0 then v2.createElement("TextLabel", {
                    Text = "<b> Option 1 </b>", 
                    RichText = true, 
                    Font = l_Font_1, 
                    TextSize = v61, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextWrapped = true, 
                    TextXAlignment = if l_leftAlignText_0 then Enum.TextXAlignment.Left else nil, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = -1
                }) else nil, 
                MagicLoginDiscoveryButton = if l_FFlagEnableMagicLogin_0 then v2.createElement(l_Button_0, {
                    text = "Search Nearby Devices", 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = function() --[[ Line: 207 ]] --[[ Name: onActivated ]]
                        -- upvalues: v54 (ref)
                        v54();
                    end, 
                    isDisabled = false, 
                    size = l_InputSize_0.Large, 
                    LayoutOrder = 0
                }) else nil, 
                QrHeader = if not not v80 or v67 then v2.createElement("TextLabel", {
                    Text = l_FFlagEnableMagicLogin_0 and "<b>Option 2</b>" or "<b>" .. v81 .. "</b>", 
                    RichText = true, 
                    Font = l_Font_1, 
                    TextSize = v61, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextWrapped = true, 
                    TextXAlignment = if l_leftAlignText_0 then Enum.TextXAlignment.Left else nil, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }) else nil, 
                HeaderIcon = if not l_showLockIcon_0 or v67 then nil else v2.createElement(l_ImageSetLabel_0, {
                    Size = if v41.isDualLayout then v64 else v39, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v38, 
                    ImageColor3 = v55.Theme.UIEmphasis.Color, 
                    ImageTransparency = 0
                }), 
                QrErrorPadding = if not v80 or v67 then nil else v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, l_LoginView_0.qrErrorPadding), 
                    LayoutOrder = 3
                }), 
                QrImageFrame = v67 and v2.createElement("Frame", {
                    Size = v64, 
                    BackgroundColor3 = Color3.fromHex("#FFFFFF"), 
                    BackgroundTransparency = 0, 
                    LayoutOrder = v78
                }, {
                    QrImage = v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = v41.QrCodeUrl, 
                        ImageTransparency = 0
                    }), 
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingBottom = if l_isDualLayout_0 then l_LoginView_0.qrPadding else UDim.new(0, 4), 
                        PaddingLeft = if l_isDualLayout_0 then l_LoginView_0.qrPadding else UDim.new(0, 4), 
                        PaddingRight = if l_isDualLayout_0 then l_LoginView_0.qrPadding else UDim.new(0, 4), 
                        PaddingTop = if l_isDualLayout_0 then l_LoginView_0.qrPadding else UDim.new(0, 4)
                    })
                }), 
                QrInstructions = v67 and v2.createElement("TextLabel", {
                    Text = v83, 
                    Font = l_Font_1, 
                    TextSize = v62, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextWrapped = true, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextXAlignment = if l_leftAlignText_0 then Enum.TextXAlignment.Left else nil, 
                    TextYAlignment = if l_isDualLayout_0 and l_hideDeviceCode_0 then Enum.TextYAlignment.Top else nil, 
                    Size = if l_isDualLayout_0 and l_hideDeviceCode_0 then UDim2.new(1, 0, 0, 48) else UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v79
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingTop = if not l_isDualLayout_0 or l_hideDeviceCode_0 then nil else UDim.new(0, v46.Global.Space_200), 
                        PaddingBottom = if not l_isDualLayout_0 or l_hideDeviceCode_0 then if l_isDualLayout_0 and l_hideDeviceCode_0 then UDim.new(0, v46.Global.Space_200) else UDim.new(0, 24) else UDim.new(0, v46.Global.Space_300)
                    })
                }), 
                Divider = if not v80 or l_hideDeviceCode_0 then nil else v2.createElement(l_DividerWithText_0, {
                    layoutOrder = 4, 
                    width = 0, 
                    height = 0, 
                    size = UDim2.new(1, 0, 0, l_LoginView_0.dividerPadding * 2 + l_LoginView_0.dividerSize), 
                    font = l_Font_1, 
                    fontSize = v46.Semantic.Typography.Footer.FontSize, 
                    color3 = v46.Semantic.Color.Text.Muted.Color3, 
                    transparency = v46.Semantic.Color.Text.Muted.Transparency, 
                    text = v71.orYouCan, 
                    padding = l_EngagementScreen_0.dividerPadding
                }), 
                CodeHeader = if not (not not v80 or v67) or l_hideDeviceCode_0 then nil else v2.createElement("TextLabel", {
                    Text = l_FFlagEnableMagicLogin_0 and "<b>Option 3</b>" or "<b>" .. v82 .. "</b>", 
                    RichText = true, 
                    Font = l_Font_1, 
                    TextSize = v61, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = if l_leftAlignText_0 then Enum.TextXAlignment.Left else nil, 
                    TextWrapped = true, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                })
            };
            local v86;
            if not l_hideDeviceCode_0 then
                v86 = v2.createElement;
                local v87 = "TextLabel";
                local v88 = {
                    Text = l_DeviceCode_0, 
                    Font = l_Font_0, 
                    TextSize = v60, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = if l_leftAlignText_0 then Enum.TextXAlignment.Left else nil, 
                    Size = UDim2.new(1, 0, 0, v69), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v76
                };
                local v89 = {};
                local v90 = false;
                if l_DeviceCode_0 == "" then
                    v90 = v2.createElement(l_LoadingSpinner_0, {
                        position = UDim2.new(0.5, 0, 0.5, 0), 
                        size = UDim2.new(0, v69, 0, v69), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    });
                end;
                v89.Spinner = v90;
                v86 = v86(v87, v88, v89);
            else
                v86 = nil;
            end;
            v85.CodeDisplay = v86;
            v85.DevicePrompt = not v67 and not l_hideDeviceCode_0 and v2.createElement(v28, {
                Text = if v80 then v71.qrCodeError else v74, 
                Font = l_Font_1, 
                RichText = l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0() and l_IsVRAppBuild_0(), 
                TextSize = if l_isDualLayout_0 then v62 else v61, 
                TextColor3 = l_Color_0, 
                TextTransparency = l_Transparency_0, 
                TextWrapped = true, 
                TextXAlignment = if l_leftAlignText_0 then Enum.TextXAlignment.Left else nil, 
                AutomaticSize = if l_isDualLayout_0 then Enum.AutomaticSize.Y else nil, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                fitAxis = v27.FitAxis.Height, 
                LayoutOrder = l_isDualLayout_0 and 2 or 3
            }, {
                UIPadding = if l_isDualLayout_0 then v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v46.Global.Space_200)
                }) else nil
            });
            v85.Instructions = if l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0() and l_IsVRAppBuild_0() or l_hideDeviceCode_0 then nil else v2.createElement(v27.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v27.FitAxis.Height, 
                LayoutOrder = v77, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v73 and 12 or 0)
                }), 
                UIPadding = if l_isDualLayout_0 then v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v46.Global.Space_200), 
                    PaddingBottom = UDim.new(0, v46.Global.Space_200)
                }) else nil, 
                InstructionText = v2.createElement(v28, {
                    Text = v75, 
                    Font = l_Font_1, 
                    TextSize = v62, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = if l_leftAlignText_0 then Enum.TextXAlignment.Left else nil, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    fitAxis = v27.FitAxis.Height, 
                    LayoutOrder = 1
                }), 
                LocationText = not v73 and v2.createElement(v28, {
                    Text = if v19() then v71.loginLocationV2 else v71.loginLocation, 
                    RichText = true, 
                    Font = l_Font_1, 
                    TextSize = v62, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextWrapped = true, 
                    TextXAlignment = if l_leftAlignText_0 then Enum.TextXAlignment.Left else nil, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    fitAxis = v27.FitAxis.Height, 
                    LayoutOrder = 2
                }), 
                LocationList = v73 and v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -48, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    List = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 4)
                    }), 
                    Mobile = v2.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        Text = v41.AltMobileInstruction, 
                        RichText = true, 
                        Font = l_Font_1, 
                        TextSize = v62, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }), 
                    Desktop = v2.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        Text = v41.AltDesktopInstruction, 
                        RichText = true, 
                        Font = l_Font_1, 
                        TextSize = v62, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                })
            });
            return l_createFragment_0(v85);
        end);
    end);
end;