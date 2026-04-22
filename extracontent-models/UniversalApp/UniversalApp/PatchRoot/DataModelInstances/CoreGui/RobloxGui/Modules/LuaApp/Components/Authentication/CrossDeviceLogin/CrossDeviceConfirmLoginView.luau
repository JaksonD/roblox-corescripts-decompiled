local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v13 = require(l_CorePackages_0.Packages.Foundation);
local l_Image_0 = v13.Image;
local l_useTokens_0 = v13.Hooks.useTokens;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v17 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v18 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v19 = require(l_Modules_0.LuaApp.FitChildren);
local v20 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_Button_0 = v7.App.Button.Button;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local v23 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDevicePhoneLayout);
local v24 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceTabletLayout);
local l_GetFFlagEnableAuthsecImageUpdate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAuthsecImageUpdate;
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeRefresh);
local l_Images_0 = v7.App.ImageSet.Images;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v7.App.ImageSet.getIconSize;
local l_getIconSizeUDim2_0 = v7.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local v32 = l_Images_0["icons/graphic/devices_xxlarge"];
local v33 = l_getIconSize_0(l_IconSize_0.XLarge);
local v34 = l_Images_0["icons/status/alert"];
local v35 = l_getIconSizeUDim2_0(l_IconSize_0.Medium);
local v36 = v4.PureComponent:extend("CrossDeviceConfirmLoginView");
local v37 = require(l_Modules_0.LuaApp.EventStreamConstants);
v36.init = function(v38) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v37 (copy), l_RbxAnalyticsService_0 (copy)
    v38:setState({
        isConfirming = false
    });
    v38.getVerifyCodeImage = function(v39) --[[ Line: 58 ]]
        -- upvalues: v13 (ref)
        if v39 == v13.Enums.Theme.Dark then
            return "icons/graphic/verifyCode_dark";
        else
            return "icons/graphic/verifyCode_light";
        end;
    end;
    v38.confirming = false;
    v38.confirmButtonPressed = function() --[[ Line: 67 ]]
        -- upvalues: v38 (copy), v37 (ref)
        if not v38.confirming then
            v38.confirming = true;
            v38:setState({
                isConfirming = true
            });
            v38.props.authAnalytics.reportButtonClicked(v37.Context.ApproveQuickLogin, v37.Button.GrantAccess);
            v38.props.confirmDeviceAccess(v38.props.networking, v38.props.deviceCode):andThen(function(_) --[[ Line: 77 ]]
                -- upvalues: v38 (ref)
                v38.confirmCallback(true);
            end, function(_) --[[ Line: 79 ]]
                -- upvalues: v38 (ref)
                v38.confirmCallback(false);
            end);
        end;
    end;
    v38.confirmCallback = function(v42) --[[ Line: 85 ]]
        -- upvalues: v38 (copy), l_RbxAnalyticsService_0 (ref)
        if v38.confirming then
            v38.confirming = false;
            v38:setState({
                isConfirming = false
            });
            v38.props.openConfirmationModal(v42, v38.props.closeCallback, v38.props.retryCallback, v38.props.deviceString);
            if v38.props.source == "vng" then
                l_RbxAnalyticsService_0:ReportCounter("CrossAppLoginSuccess", 1);
                v38.props.linking:openURL("robloxvng://");
            end;
        end;
    end;
    v38.closeButtonPressed = function() --[[ Line: 106 ]]
        -- upvalues: v38 (copy)
        v38.props.cancelLoginCode(v38.props.networking, v38.props.deviceCode);
        if v38.props.closeCallback then
            v38.props.closeCallback();
        end;
    end;
end;
v36.didMount = function(v43) --[[ Line: 114 ]] --[[ Name: didMount ]]
    -- upvalues: v37 (copy)
    v43.props.authAnalytics.reportScreenLoaded(v37.Context.ApproveQuickLogin);
end;
v36.willUnmount = function(v44) --[[ Line: 118 ]] --[[ Name: willUnmount ]]
    v44.confirming = false;
end;
v36.render = function(v45) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: v26 (copy), l_withStyle_0 (copy), v9 (copy), v4 (copy), v24 (copy), v23 (copy), l_GetFFlagEnableAuthsecImageUpdate_0 (copy), l_Image_0 (copy), l_ImageSetLabel_0 (copy), v32 (copy), v19 (copy), v33 (copy), v35 (copy), v34 (copy), v20 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_isWideView_0 = v45.props.isWideView;
    local l_isConfirming_0 = v45.state.isConfirming;
    local v48 = v26() and "Authentication.CrossDevice.Label.Confirm" or "Authentication.CrossDevice.Action.ConfirmLogin";
    return l_withStyle_0(function(v49) --[[ Line: 129 ]]
        -- upvalues: v9 (ref), v48 (copy), v45 (copy), l_isWideView_0 (copy), v4 (ref), v24 (ref), v23 (ref), l_GetFFlagEnableAuthsecImageUpdate_0 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), v32 (ref), v19 (ref), v33 (ref), v35 (ref), v34 (ref), v20 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_isConfirming_0 (copy)
        return v9({
            heading = "Authentication.CrossDevice.Heading.Warning", 
            confirmation1 = "Authentication.CrossDevice.Label.ConfirmationMessage1", 
            confirmation2 = "Authentication.CrossDevice.Label.ConfirmationMessage2", 
            confirmation3 = "Authentication.CrossDevice.Label.ConfirmationMessage3", 
            confirm = v48, 
            cancel = "Authentication.CrossDevice.Action.CancelLogin"
        })(function(v50) --[[ Line: 137 ]]
            -- upvalues: v45 (ref), l_isWideView_0 (ref), v49 (copy), v4 (ref), v24 (ref), v23 (ref), l_GetFFlagEnableAuthsecImageUpdate_0 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), v32 (ref), v19 (ref), v33 (ref), v35 (ref), v34 (ref), v20 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_isConfirming_0 (ref)
            local l_designTokens_0 = v45.props.designTokens;
            local v52 = UDim2.fromOffset(l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize, l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize);
            local l_Font_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.Font;
            local l_FontSize_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.FontSize;
            local l_Color3_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Color3;
            local v56 = l_isWideView_0 and v45.props.tokens.Size.Size_2000 * 2 or v45.props.tokens.Size.Size_2000 * 4;
            local v57 = l_isWideView_0 and v45.props.tokens.Size.Size_2200 or v45.props.tokens.Size.Size_2200 * 2;
            local v58 = not l_isWideView_0 and v45.props.tokens.Size.Size_350 or 0;
            local l_Font_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.Font;
            local l_FontSize_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.FontSize;
            local l_Color3_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyTextColor.Color3;
            local l_Transparency_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Transparency;
            local l_Font_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.Font;
            local l_FontSize_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.FontSize;
            local l_Color3_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertColor.Color3;
            local l_BaseSize_0 = v49.Font.BaseSize;
            local l_Color_0 = v49.Theme.UIEmphasis.Color;
            return v4.createElement(l_isWideView_0 and v24 or v23, {
                TabletHeaderText = v50.tabletHeader, 
                Style = v49, 
                HighKeyboardMode = v45.props.highKeyboardMode, 
                Icon = l_GetFFlagEnableAuthsecImageUpdate_0() and v4.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = l_isWideView_0 and v52 or UDim2.new(0, v56, 0, v57 - v58), 
                    BackgroundTransparency = 1
                }, {
                    Image = v4.createElement(l_Image_0, {
                        Image = v45.getVerifyCodeImage(v45.props.tokens.Config.ColorMode.Name), 
                        ScaleType = Enum.ScaleType.Fit, 
                        Size = UDim2.new(0, v56, 0, v57), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                }) or v4.createElement(l_ImageSetLabel_0, {
                    Size = v52, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v32, 
                    ImageColor3 = l_Color_0, 
                    ImageTransparency = 0
                }), 
                WarningText = v4.createElement(v19.FitFrame, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, l_isWideView_0 and -50 - v33 or -20, 0, 0), 
                    fitAxis = v19.FitAxis.Height, 
                    BackgroundTransparency = 1
                }, {
                    Align = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Padding = UDim.new(0, 6), 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    TopWarning = not l_GetFFlagEnableAuthsecImageUpdate_0() and v4.createElement(v19.FitFrame, {
                        fitAxis = v19.FitAxis.Height, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        ListLayout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = l_isWideView_0 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 0), 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        WarningIcon1 = v4.createElement(l_ImageSetLabel_0, {
                            Size = v35, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = v34, 
                            ImageColor3 = l_Color_0, 
                            ImageTransparency = 0
                        }), 
                        WarningText = v4.createElement(v20, {
                            LayoutOrder = 2, 
                            Size = UDim2.new(0, l_BaseSize_0, 1, 0), 
                            Text = v50.heading, 
                            TextWrapped = true, 
                            Font = l_Font_0, 
                            TextSize = l_FontSize_0, 
                            TextColor3 = l_Color3_0, 
                            TextTransparency = l_Transparency_0, 
                            TextXAlignment = l_isWideView_0 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                            fitAxis = v19.FitAxis.Width, 
                            BackgroundTransparency = 1
                        }), 
                        WarningIcon2 = v4.createElement(l_ImageSetLabel_0, {
                            Size = v35, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3, 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = v34, 
                            ImageColor3 = l_Color_0, 
                            ImageTransparency = 0
                        })
                    }) or nil, 
                    Warning1 = v4.createElement(v20, {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = string.format(v50.confirmation1, v45.props.deviceString), 
                        TextWrapped = true, 
                        Font = l_Font_1, 
                        TextSize = l_FontSize_1, 
                        TextColor3 = l_Color3_1, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v19.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }), 
                    Warning2 = v4.createElement(v20, {
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v50.confirmation2, 
                        TextWrapped = true, 
                        Font = l_Font_2, 
                        TextSize = l_FontSize_2, 
                        TextColor3 = l_Color3_2, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v19.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }), 
                    Warning3 = v4.createElement(v20, {
                        LayoutOrder = 5, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v50.confirmation3, 
                        TextWrapped = true, 
                        Font = l_Font_1, 
                        TextSize = l_FontSize_1, 
                        TextColor3 = l_Color3_1, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v19.FitAxis.Height, 
                        BackgroundTransparency = 1
                    })
                }), 
                LoginButton = v4.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v50.confirm, 
                    onActivated = v45.confirmButtonPressed, 
                    isLoading = l_isConfirming_0
                }), 
                CancelButton = v4.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v50.cancel, 
                    onActivated = v45.closeButtonPressed
                })
            });
        end);
    end);
end;
v36 = l_RoactServices_0.connect({
    networking = v11, 
    authAnalytics = v18, 
    linking = l_AppLinking_0
})(v36);
local v79 = v6.connect(function(v68, _) --[[ Line: 310 ]]
    return {
        screenSize = v68.ScreenSize
    };
end, function(v70) --[[ Line: 314 ]]
    -- upvalues: v17 (copy)
    return {
        confirmDeviceAccess = function(v71, v72) --[[ Line: 316 ]] --[[ Name: confirmDeviceAccess ]]
            -- upvalues: v70 (copy), v17 (ref)
            return v70(v17.ConfirmDeviceAccess(v71, v72));
        end, 
        cancelLoginCode = function(v73, v74) --[[ Line: 319 ]] --[[ Name: cancelLoginCode ]]
            -- upvalues: v70 (copy), v17 (ref)
            return v70(v17.CancelLoginCode(v73, v74));
        end, 
        openConfirmationModal = function(v75, v76, v77, v78) --[[ Line: 322 ]] --[[ Name: openConfirmationModal ]]
            -- upvalues: v70 (copy), v17 (ref)
            return v70(v17.OpenConfirmationOverlay(v75, v76, v77, v78));
        end
    };
end)(v36);
return function(v80) --[[ Line: 331 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), v5 (copy), v79 (copy), v3 (copy)
    local v81 = l_useDesignTokens_0();
    local v82 = l_useTokens_0();
    return v5.createElement(v79, v3.Dictionary.join(v80, {
        designTokens = v81, 
        tokens = v82
    }));
end;