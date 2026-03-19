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
local l_Images_0 = v7.App.ImageSet.Images;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v7.App.ImageSet.getIconSize;
local l_getIconSizeUDim2_0 = v7.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local v31 = l_Images_0["icons/graphic/devices_xxlarge"];
local v32 = l_getIconSize_0(l_IconSize_0.XLarge);
local v33 = l_Images_0["icons/status/alert"];
local v34 = l_getIconSizeUDim2_0(l_IconSize_0.Medium);
local v35 = v4.PureComponent:extend("CrossDeviceConfirmLoginView");
local v36 = require(l_Modules_0.LuaApp.EventStreamConstants);
v35.init = function(v37) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v36 (copy), l_RbxAnalyticsService_0 (copy)
    v37:setState({
        isConfirming = false
    });
    v37.getVerifyCodeImage = function(v38) --[[ Line: 56 ]]
        -- upvalues: v13 (ref)
        if v38 == v13.Enums.Theme.Dark then
            return "icons/graphic/verifyCode_dark";
        else
            return "icons/graphic/verifyCode_light";
        end;
    end;
    v37.confirming = false;
    v37.confirmButtonPressed = function() --[[ Line: 65 ]]
        -- upvalues: v37 (copy), v36 (ref)
        if not v37.confirming then
            v37.confirming = true;
            v37:setState({
                isConfirming = true
            });
            v37.props.authAnalytics.reportButtonClicked(v36.Context.ApproveQuickLogin, v36.Button.GrantAccess);
            v37.props.confirmDeviceAccess(v37.props.networking, v37.props.deviceCode):andThen(function(_) --[[ Line: 75 ]]
                -- upvalues: v37 (ref)
                v37.confirmCallback(true);
            end, function(_) --[[ Line: 77 ]]
                -- upvalues: v37 (ref)
                v37.confirmCallback(false);
            end);
        end;
    end;
    v37.confirmCallback = function(v41) --[[ Line: 83 ]]
        -- upvalues: v37 (copy), l_RbxAnalyticsService_0 (ref)
        if v37.confirming then
            v37.confirming = false;
            v37:setState({
                isConfirming = false
            });
            v37.props.openConfirmationModal(v41, v37.props.closeCallback, v37.props.retryCallback, v37.props.deviceString);
            if v37.props.source == "vng" then
                l_RbxAnalyticsService_0:ReportCounter("CrossAppLoginSuccess", 1);
                v37.props.linking:openURL("robloxvng://");
            end;
        end;
    end;
    v37.closeButtonPressed = function() --[[ Line: 104 ]]
        -- upvalues: v37 (copy)
        v37.props.cancelLoginCode(v37.props.networking, v37.props.deviceCode);
        if v37.props.closeCallback then
            v37.props.closeCallback();
        end;
    end;
end;
v35.didMount = function(v42) --[[ Line: 112 ]] --[[ Name: didMount ]]
    -- upvalues: v36 (copy)
    v42.props.authAnalytics.reportScreenLoaded(v36.Context.ApproveQuickLogin);
end;
v35.willUnmount = function(v43) --[[ Line: 116 ]] --[[ Name: willUnmount ]]
    v43.confirming = false;
end;
v35.render = function(v44) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v9 (copy), v4 (copy), v24 (copy), v23 (copy), l_GetFFlagEnableAuthsecImageUpdate_0 (copy), l_Image_0 (copy), l_ImageSetLabel_0 (copy), v31 (copy), v19 (copy), v32 (copy), v34 (copy), v33 (copy), v20 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_isWideView_0 = v44.props.isWideView;
    local l_isConfirming_0 = v44.state.isConfirming;
    return l_withStyle_0(function(v47) --[[ Line: 124 ]]
        -- upvalues: v9 (ref), v44 (copy), l_isWideView_0 (copy), v4 (ref), v24 (ref), v23 (ref), l_GetFFlagEnableAuthsecImageUpdate_0 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), v31 (ref), v19 (ref), v32 (ref), v34 (ref), v33 (ref), v20 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_isConfirming_0 (copy)
        return v9({
            heading = "Authentication.CrossDevice.Heading.Warning", 
            confirmation1 = "Authentication.CrossDevice.Label.ConfirmationMessage1", 
            confirmation2 = "Authentication.CrossDevice.Label.ConfirmationMessage2", 
            confirmation3 = "Authentication.CrossDevice.Label.ConfirmationMessage3", 
            confirm = "Authentication.CrossDevice.Action.ConfirmLogin", 
            cancel = "Authentication.CrossDevice.Action.CancelLogin"
        })(function(v48) --[[ Line: 132 ]]
            -- upvalues: v44 (ref), l_isWideView_0 (ref), v47 (copy), v4 (ref), v24 (ref), v23 (ref), l_GetFFlagEnableAuthsecImageUpdate_0 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), v31 (ref), v19 (ref), v32 (ref), v34 (ref), v33 (ref), v20 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_isConfirming_0 (ref)
            local l_designTokens_0 = v44.props.designTokens;
            local v50 = UDim2.fromOffset(l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize, l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize);
            local l_Font_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.Font;
            local l_FontSize_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.FontSize;
            local l_Color3_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Color3;
            local v54 = l_isWideView_0 and v44.props.tokens.Size.Size_2000 * 2 or v44.props.tokens.Size.Size_2000 * 4;
            local v55 = l_isWideView_0 and v44.props.tokens.Size.Size_2200 or v44.props.tokens.Size.Size_2200 * 2;
            local v56 = not l_isWideView_0 and v44.props.tokens.Size.Size_350 or 0;
            local l_Font_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.Font;
            local l_FontSize_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.FontSize;
            local l_Color3_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyTextColor.Color3;
            local l_Transparency_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Transparency;
            local l_Font_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.Font;
            local l_FontSize_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.FontSize;
            local l_Color3_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertColor.Color3;
            local l_BaseSize_0 = v47.Font.BaseSize;
            local l_Color_0 = v47.Theme.UIEmphasis.Color;
            return v4.createElement(l_isWideView_0 and v24 or v23, {
                TabletHeaderText = v48.tabletHeader, 
                Style = v47, 
                HighKeyboardMode = v44.props.highKeyboardMode, 
                Icon = l_GetFFlagEnableAuthsecImageUpdate_0() and v4.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = l_isWideView_0 and v50 or UDim2.new(0, v54, 0, v55 - v56), 
                    BackgroundTransparency = 1
                }, {
                    Image = v4.createElement(l_Image_0, {
                        Image = v44.getVerifyCodeImage(v44.props.tokens.Config.ColorMode.Name), 
                        ScaleType = Enum.ScaleType.Fit, 
                        Size = UDim2.new(0, v54, 0, v55), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                }) or v4.createElement(l_ImageSetLabel_0, {
                    Size = v50, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v31, 
                    ImageColor3 = l_Color_0, 
                    ImageTransparency = 0
                }), 
                WarningText = v4.createElement(v19.FitFrame, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, l_isWideView_0 and -50 - v32 or -20, 0, 0), 
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
                            Size = v34, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = v33, 
                            ImageColor3 = l_Color_0, 
                            ImageTransparency = 0
                        }), 
                        WarningText = v4.createElement(v20, {
                            LayoutOrder = 2, 
                            Size = UDim2.new(0, l_BaseSize_0, 1, 0), 
                            Text = v48.heading, 
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
                            Size = v34, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3, 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = v33, 
                            ImageColor3 = l_Color_0, 
                            ImageTransparency = 0
                        })
                    }) or nil, 
                    Warning1 = v4.createElement(v20, {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = string.format(v48.confirmation1, v44.props.deviceString), 
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
                        Text = v48.confirmation2, 
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
                        Text = v48.confirmation3, 
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
                    text = v48.confirm, 
                    onActivated = v44.confirmButtonPressed, 
                    isLoading = l_isConfirming_0
                }), 
                CancelButton = v4.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v48.cancel, 
                    onActivated = v44.closeButtonPressed
                })
            });
        end);
    end);
end;
v35 = l_RoactServices_0.connect({
    networking = v11, 
    authAnalytics = v18, 
    linking = l_AppLinking_0
})(v35);
local v77 = v6.connect(function(v66, _) --[[ Line: 305 ]]
    return {
        screenSize = v66.ScreenSize
    };
end, function(v68) --[[ Line: 309 ]]
    -- upvalues: v17 (copy)
    return {
        confirmDeviceAccess = function(v69, v70) --[[ Line: 311 ]] --[[ Name: confirmDeviceAccess ]]
            -- upvalues: v68 (copy), v17 (ref)
            return v68(v17.ConfirmDeviceAccess(v69, v70));
        end, 
        cancelLoginCode = function(v71, v72) --[[ Line: 314 ]] --[[ Name: cancelLoginCode ]]
            -- upvalues: v68 (copy), v17 (ref)
            return v68(v17.CancelLoginCode(v71, v72));
        end, 
        openConfirmationModal = function(v73, v74, v75, v76) --[[ Line: 317 ]] --[[ Name: openConfirmationModal ]]
            -- upvalues: v68 (copy), v17 (ref)
            return v68(v17.OpenConfirmationOverlay(v73, v74, v75, v76));
        end
    };
end)(v35);
return function(v78) --[[ Line: 326 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), v5 (copy), v77 (copy), v3 (copy)
    local v79 = l_useDesignTokens_0();
    local v80 = l_useTokens_0();
    return v5.createElement(v77, v3.Dictionary.join(v78, {
        designTokens = v79, 
        tokens = v80
    }));
end;