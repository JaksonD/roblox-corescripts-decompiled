local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_LinkButton_0 = v5.App.Button.LinkButton;
local l_PartialPageModal_0 = v5.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = v5.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local v11 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_AuthStatefulRoundCornerBorder_0 = v11.Components.AuthStatefulRoundCornerBorder;
local l_TextInputBoxWithBorder_0 = v11.Components.TextInputBoxWithBorder;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v16 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v16.Hooks.useTokens;
local v18 = require(l_CorePackages_0.Packages.Cryo);
local v19 = require(l_Modules_0.LuaApp.FitChildren);
local v20 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_GetFFlagEnableAuthsecImageUpdate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAuthsecImageUpdate;
local l_UserInputService_0 = game:GetService("UserInputService");
local v23 = require(script.Parent.EmailVerificationUpsellLink);
local v24 = v2.PureComponent:extend(script.Name);
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_getIconSizeUDim2_0 = v5.App.ImageSet.getIconSizeUDim2;
local v28 = l_Images_0["icons/graphic/lock_xxlarge"];
local v29 = l_getIconSizeUDim2_0(l_IconSize_0.XLarge);
v24.defaultProps = {
    shouldShowPrivacyPolicyLink = function() --[[ Line: 54 ]] --[[ Name: shouldShowPrivacyPolicyLink ]]
        return false;
    end, 
    primaryButtonType = l_ButtonType_0.PrimarySystem, 
    secondaryButtonType = l_ButtonType_0.Secondary
};
v24.init = function(v30) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), v2 (copy), v23 (copy), v16 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), v4 (copy), v20 (copy), v19 (copy), l_TextInputBoxWithBorder_0 (copy), l_GetFFlagEnableAuthsecImageUpdate_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_GetImageData_0 (copy)
    v30.state = {
        onScreenKeyboardHeight = 0
    };
    v30.getLinks = function() --[[ Line: 66 ]]
        -- upvalues: v18 (ref), v30 (copy), v2 (ref), v23 (ref)
        local v33 = v18.List.map(v30.props.links, function(v31, v32) --[[ Line: 67 ]]
            -- upvalues: v2 (ref), v23 (ref)
            return v2.createElement(v23, {
                textKey = v31.textKey, 
                layoutOrder = v32, 
                onActivatedCallback = v31.onClicked, 
                isPrimaryLink = v31.isPrimaryLink
            });
        end);
        return v2.createFragment(v33);
    end;
    v30.getEnvelopeIconImage = function(v34) --[[ Line: 79 ]]
        -- upvalues: v16 (ref)
        if v34 == v16.Enums.Theme.Dark then
            return "icons/graphic/envelope_dark";
        else
            return "icons/graphic/envelope_light";
        end;
    end;
    v30.getButtonStackProps = function() --[[ Line: 87 ]]
        -- upvalues: v30 (copy), v18 (ref)
        local v35 = {};
        local l_primaryButtonText_0 = v30.props.primaryButtonText;
        local l_secondaryButtonText_0 = v30.props.secondaryButtonText;
        local l_onPrimaryButtonActivated_0 = v30.props.onPrimaryButtonActivated;
        local l_onSecondaryButtonActivated_0 = v30.props.onSecondaryButtonActivated;
        local l_primaryButtonType_0 = v30.props.primaryButtonType;
        local l_secondaryButtonType_0 = v30.props.secondaryButtonType;
        local l_isPrimaryButtonDisabled_0 = v30.state.isPrimaryButtonDisabled;
        if l_primaryButtonText_0 then
            v35 = {
                {
                    buttonType = l_primaryButtonType_0, 
                    props = {
                        onActivated = l_onPrimaryButtonActivated_0, 
                        text = l_primaryButtonText_0, 
                        isDisabled = l_isPrimaryButtonDisabled_0
                    }
                }
            };
        end;
        if l_secondaryButtonText_0 then
            local v43 = {
                {
                    buttonType = l_secondaryButtonType_0, 
                    props = {
                        onActivated = l_onSecondaryButtonActivated_0, 
                        text = l_secondaryButtonText_0
                    }
                }
            };
            v35 = v18.List.join(v43, v35);
        end;
        return {
            buttonHeight = 48, 
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttons = v35
        };
    end;
    v30.getUpdatedModalMiddleContent = function(v44, v45) --[[ Line: 134 ]]
        -- upvalues: v30 (copy), l_AuthStatefulRoundCornerBorder_0 (ref), v4 (ref), v20 (ref), v19 (ref), l_TextInputBoxWithBorder_0 (ref), v23 (ref)
        local l_errorMessage_0 = v30.props.errorMessage;
        local v47 = l_errorMessage_0 and l_errorMessage_0 ~= "";
        local l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ContentPadding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24)
            }), 
            ListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 24)
            }), 
            BodyText = v4.createElement(v20, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Text = v30.props.bodyText, 
                TextSize = v44.Font.Body.RelativeSize * v44.Font.BaseSize, 
                TextColor3 = v44.Theme.TextDefault.Color, 
                TextTransparency = v44.Theme.TextDefault.Transparency, 
                Font = v44.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                fitAxis = v19.FitAxis.Height, 
                TextWrapped = true, 
                Size = UDim2.new(0, v45, 0, 0)
            }), 
            TextBox = v30.props.textInputType and v4.createElement(l_TextInputBoxWithBorder_0, {
                textInputType = v30.props.textInputType, 
                textInputHeight = 48, 
                layoutOrder = 3, 
                borderState = l_Default_0, 
                textBarColor = v44.Theme.BackgroundMuted.Color, 
                placeholderText = v30.props.textFieldPlaceholderText, 
                placeholderTextColor = v44.Theme.TextMuted.Color, 
                onChangeTextCallback = v30.props.onChangeTextCallback, 
                onFocused = v30.props.onEmailFocused, 
                labelText = v30.props.textFieldLabelText, 
                labelTextColor = v44.Theme.TextDefault.Color, 
                errorText = v47 and l_errorMessage_0, 
                Size = UDim2.new(1, 0, 0, 0)
            }), 
            LegalLinks = if v30.props.shouldShowPrivacyPolicyLink() then v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 4
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 12)
                }), 
                LinksList = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 24)
                }), 
                TermsButton = v4.createElement(v23, {
                    textKey = v30.props.termsOfServiceLinkKey, 
                    onActivatedCallback = v30.props.onTermsOfServiceLinkActivated, 
                    isPrimaryLink = false, 
                    textPadding = 0, 
                    layoutOrder = 1, 
                    shouldUseAutomaticSize = true
                }), 
                PrivacyPolicyButton = v30.props.shouldShowPrivacyPolicyLink() and v4.createElement(v23, {
                    textKey = v30.props.privacyPolicyLinkKey, 
                    onActivatedCallback = v30.props.onPrivacyPolicyLinkActivated, 
                    isPrimaryLink = false, 
                    textPadding = 0, 
                    layoutOrder = 2, 
                    shouldUseAutomaticSize = true
                })
            }) else nil, 
            Links = v30.props.links and v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, #v30.props.links * 36), 
                BackgroundTransparency = 1, 
                LayoutOrder = 5
            }, {
                LinksList = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 12)
                }); 
                v30.getLinks()
            })
        });
    end;
    v30.getIcon = function(v49, v50, v51) --[[ Line: 232 ]]
        -- upvalues: l_GetFFlagEnableAuthsecImageUpdate_0 (ref), v2 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v30 (copy), l_GetImageData_0 (ref)
        if l_GetFFlagEnableAuthsecImageUpdate_0() then
            return v2.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.new(0, v49, 0, v50 - v51), 
                BackgroundTransparency = 1
            }, {
                Image = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, v49, 0, v50), 
                    ScaleType = Enum.ScaleType.Fit, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Image = l_Images_0[v30.getEnvelopeIconImage(v30.props.tokens.Config.ColorMode.Name)]
                })
            });
        else
            return v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, 100, 0, 100), 
                ScaleType = Enum.ScaleType.Fit, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Image = l_GetImageData_0("LuaApp/graphic/verificationUpsellModal") or "LuaApp/graphic/verificationUpsellModal"
            });
        end;
    end;
end;
v24.didMount = function(v52) --[[ Line: 262 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    v52.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function() --[[ Line: 264 ]]
        -- upvalues: l_UserInputService_0 (ref), v52 (copy)
        local v53 = l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        v52:setState({
            onScreenKeyboardHeight = v53
        });
    end);
end;
v24.willUnmount = function(v54) --[[ Line: 274 ]] --[[ Name: willUnmount ]]
    if v54.keyboardVisibleChanged then
        v54.keyboardVisibleChanged:disconnect();
    end;
    v54.keyboardVisibleChanged = nil;
end;
v24.render = function(v55) --[[ Line: 281 ]] --[[ Name: render ]]
    -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), l_withStyle_0 (copy), v2 (copy), l_PartialPageModal_0 (copy), v19 (copy), l_ImageSetLabel_0 (copy), v29 (copy), v28 (copy), v20 (copy), l_TextInputBoxWithBorder_0 (copy), l_LinkButton_0 (copy)
    local l_screenSize_0 = v55.props.screenSize;
    local v57 = l_getPartialPageModalMiddleContentWidth_0(l_screenSize_0.X);
    local v58 = v55.state.onScreenKeyboardHeight > 0;
    local v59 = v55.props.tokens.Size.Size_2000 * 4;
    local v60 = v55.props.tokens.Size.Size_2200 * 2;
    local l_Size_1200_0 = v55.props.tokens.Size.Size_1200;
    local l_title_0 = v55.props.title;
    local l_bodyText_0 = v55.props.bodyText;
    local l_textInputType_0 = v55.props.textInputType;
    local l_textFieldLabelText_0 = v55.props.textFieldLabelText;
    local l_textFieldPlaceholderText_0 = v55.props.textFieldPlaceholderText;
    local l_errorMessage_1 = v55.props.errorMessage;
    local l_links_0 = v55.props.links;
    local l_onEmailFocused_0 = v55.props.onEmailFocused;
    local l_onChangeTextCallback_0 = v55.props.onChangeTextCallback;
    local l_onCloseClickedCallback_0 = v55.props.onCloseClickedCallback;
    local l_isEmailModalCalledFromHomePage_0 = v55.props.isEmailModalCalledFromHomePage;
    local v73 = l_errorMessage_1 and l_errorMessage_1 ~= "";
    local l_Default_1 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
    if v73 then
        l_Default_1 = l_AuthStatefulRoundCornerBorder_0.BorderState.Error;
    end;
    return l_withStyle_0(function(v75) --[[ Line: 313 ]]
        -- upvalues: v2 (ref), l_PartialPageModal_0 (ref), l_title_0 (copy), l_screenSize_0 (copy), v58 (copy), v55 (copy), l_onCloseClickedCallback_0 (copy), v57 (copy), v19 (ref), l_isEmailModalCalledFromHomePage_0 (copy), l_ImageSetLabel_0 (ref), v29 (ref), v28 (ref), v59 (copy), v60 (copy), l_Size_1200_0 (copy), v20 (ref), l_bodyText_0 (copy), l_textInputType_0 (copy), l_TextInputBoxWithBorder_0 (ref), l_Default_1 (ref), l_textFieldPlaceholderText_0 (copy), l_onChangeTextCallback_0 (copy), l_onEmailFocused_0 (copy), l_textFieldLabelText_0 (copy), v73 (copy), l_errorMessage_1 (copy), l_LinkButton_0 (ref), l_links_0 (copy)
        return v2.createElement(l_PartialPageModal_0, {
            title = l_title_0, 
            screenSize = l_screenSize_0, 
            position = v58 and UDim2.new(0.5, 0, 1, -v55.state.onScreenKeyboardHeight) or nil, 
            anchorPoint = v58 and Vector2.new(0.5, 1) or nil, 
            buttonStackProps = v55.getButtonStackProps(), 
            onCloseClicked = l_onCloseClickedCallback_0
        }, {
            Middle = if v55.props.useUpdatedModalDesign then v55.getUpdatedModalMiddleContent(v75, v57) else v2.createElement(v19.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v19.FitAxis.Height, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                ContentPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 24)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 24)
                }), 
                UIBloxLockImage = l_isEmailModalCalledFromHomePage_0 and v2.createElement(l_ImageSetLabel_0, {
                    Size = v29, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v28, 
                    ImageColor3 = v75.Theme.UIEmphasis.Color, 
                    ImageTransparency = 0
                }), 
                Icon = not l_isEmailModalCalledFromHomePage_0 and v55.getIcon(v59, v60, l_Size_1200_0), 
                BodyText = v2.createElement(v20, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = l_bodyText_0, 
                    TextSize = v75.Font.Body.RelativeSize * v75.Font.BaseSize, 
                    TextColor3 = v75.Theme.TextDefault.Color, 
                    TextTransparency = v75.Theme.TextDefault.Transparency, 
                    Font = v75.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    fitAxis = v19.FitAxis.Height, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v57, 0, 0)
                }), 
                TextBox = l_textInputType_0 and v2.createElement(l_TextInputBoxWithBorder_0, {
                    textInputType = l_textInputType_0, 
                    textInputHeight = 36, 
                    layoutOrder = 3, 
                    borderState = l_Default_1, 
                    placeholderText = l_textFieldPlaceholderText_0, 
                    onChangeTextCallback = l_onChangeTextCallback_0, 
                    onFocused = l_onEmailFocused_0, 
                    labelText = l_textFieldLabelText_0, 
                    errorText = v73 and l_errorMessage_1, 
                    Size = UDim2.new(1, 0, 0, 0)
                }), 
                PrivacyPolicyButton = v55.props.shouldShowPrivacyPolicyLink() and v2.createElement(l_LinkButton_0, {
                    text = v55.props.privacyPolicyLinkText, 
                    onActivated = v55.props.onPrivacyPolicyLinkActivated, 
                    layoutOrder = 4, 
                    fontStyle = "CaptionBody"
                }), 
                Links = l_links_0 and v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, #l_links_0 * 36), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5
                }, {
                    LinksList = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 12)
                    }), 
                    TopPadding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24)
                    }); 
                    v55.getLinks()
                })
            })
        });
    end);
end;
local v78 = v3.connect(function(v76, _) --[[ Line: 410 ]]
    return {
        screenSize = v76.ScreenSize
    };
end)(v24);
return function(v79) --[[ Line: 417 ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), v78 (copy), v18 (copy)
    local v80 = l_useTokens_0();
    return v4.createElement(v78, v18.Dictionary.join(v79, {
        tokens = v80
    }));
end;