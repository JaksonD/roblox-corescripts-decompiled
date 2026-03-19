local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v7 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v8 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.ToCPopupOccurance);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_Modules_0.LuaApp.Thunks.CloseVNGUserAgreementsPopup);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_withStyle_0 = v9.Core.Style.withStyle;
local v14 = require(l_Modules_0.LuaApp.withLocalization);
local v15 = require(l_Modules_0.LuaApp.Http.Requests.AgreeUpdatedUserAgreements);
local l_UserAgreementErrorCodes_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementErrorCodes;
local l_LogoutFromAllSessionsAndReauthenticate_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Thunks.LogoutFromAllSessionsAndReauthenticate;
local v18 = require(l_CorePackages_0.Packages.FitFrame);
local v19 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v20 = require(l_Modules_0.LuaApp.Components.UserAgreement.VNGBalanceTransferPrompt);
local l_Button_0 = v9.App.Button.Button;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v9.App.InputButton.Checkbox;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_Images_0 = v9.App.ImageSet.Images;
local l_StyledTextLabel_0 = v9.App.Text.StyledTextLabel;
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v28 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local l_UserAgreementsList_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementsList;
local l_FFlagVngLogoutGlobalAppSessionsOnConversion_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagVngLogoutGlobalAppSessionsOnConversion;
local l_GetFFlagVngTOSRevisedEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagVngTOSRevisedEnabled;
local l_FFlagAddReasonToEveryLogout_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddReasonToEveryLogout;
local v33 = Rect.new(8, 8, 9, 9);
local v34 = l_GetFFlagVngTOSRevisedEnabled_0() and 16 or 48;
local v35 = l_GetFFlagVngTOSRevisedEnabled_0() and 24 or 48;
local v36 = v2.PureComponent:extend("VNGUserAgreementsPopup");
v36.validateProps = v10.strictInterface({
    agreements = v10.array(v10.strictInterface({
        id = v10.string, 
        agreementType = v10.string, 
        clientType = v10.string, 
        displayUrl = v10.string, 
        regulationType = v10.string, 
        action = v10.optional(v10.string)
    })), 
    isSignup = v10.boolean, 
    formFactor = v10.string, 
    screenSize = v10.Vector2, 
    networking = v10.callback, 
    guiService = v10.union(v10.Instance, v10.table), 
    closePopup = v10.callback, 
    logout = v10.callback, 
    defaultChildRef = v10.optional(v10.any), 
    focusController = v10.optional(v10.any), 
    containerWidth = v10.optional(v10.integer), 
    closeCentralOverlayThunk = v10.optional(v10.callback), 
    agreementAccepted = v10.optional(v10.callback), 
    agreementDeclined = v10.optional(v10.callback)
});
v36.init = function(v37) --[[ Line: 113 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_FFlagVngLogoutGlobalAppSessionsOnConversion_0 (copy), l_LogoutFromAllSessionsAndReauthenticate_0 (copy), v15 (copy), l_UserAgreementErrorCodes_0 (copy)
    local v38, v39 = v2.createBinding(false);
    v37.buttonPressed = v38;
    v37.updateButtonPressed = v39;
    v37.state = {
        agreementsChecked = false, 
        acceptingAgreements = false, 
        showBalanceTransferAlert = false, 
        showError = false
    };
    v37.SetAgreementsCheckBox = function(v40) --[[ Line: 122 ]]
        -- upvalues: v37 (copy)
        v37:setState({
            agreementsChecked = v40
        });
    end;
    v37.SetAgreementsCheckBoxByTextButton = function() --[[ Line: 127 ]]
        -- upvalues: v37 (copy)
        v37:setState({
            agreementsChecked = not v37.state.agreementsChecked
        });
    end;
    v37.xClose = function() --[[ Line: 134 ]]
        -- upvalues: v37 (copy)
        if v37.props.isSignup then
            v37.props.closePopup();
            if v37.props.agreementDeclined then
                v37.props.agreementDeclined();
                return;
            end;
        else
            v37.props.logout(v37.props.networking, v37.props.guiService);
            v37.props.closePopup();
        end;
    end;
    v37.tryAgree = function() --[[ Line: 147 ]]
        -- upvalues: v37 (copy), l_FFlagVngLogoutGlobalAppSessionsOnConversion_0 (ref), l_LogoutFromAllSessionsAndReauthenticate_0 (ref), v15 (ref), l_UserAgreementErrorCodes_0 (ref)
        if not v37.state.agreementsChecked then
            return;
        else
            v37:setState({
                showError = false, 
                acceptingAgreements = true
            });
            local l_closePopup_0 = v37.props.closePopup;
            local l_agreements_0 = v37.props.agreements;
            if v37.props.isSignup then
                l_closePopup_0();
                if v37.props.agreementAccepted then
                    v37.props.agreementAccepted(l_agreements_0);
                    return;
                end;
            else
                local l_networking_0 = v37.props.networking;
                if l_FFlagVngLogoutGlobalAppSessionsOnConversion_0 then
                    local v44, _ = l_LogoutFromAllSessionsAndReauthenticate_0(l_networking_0):await();
                    if not v44 then
                        v37:setState({
                            acceptingAgreements = false, 
                            showError = true
                        });
                        return;
                    end;
                end;
                v15(l_networking_0, l_agreements_0, function(v46) --[[ Line: 184 ]]
                    -- upvalues: l_UserAgreementErrorCodes_0 (ref), v37 (ref), l_closePopup_0 (copy), l_agreements_0 (copy)
                    if v46 == l_UserAgreementErrorCodes_0.InvalidState then
                        v37:setState({
                            showBalanceTransferAlert = true
                        });
                    elseif v46 == l_UserAgreementErrorCodes_0.NoError then
                        l_closePopup_0();
                        if v37.props.agreementAccepted then
                            v37.props.agreementAccepted(l_agreements_0);
                        end;
                    else
                        v37:setState({
                            showError = true
                        });
                    end;
                    v37:setState({
                        acceptingAgreements = false
                    });
                end);
            end;
            return;
        end;
    end;
end;
v36.getLayoutInfo = function(_, v48, v49) --[[ Line: 210 ]] --[[ Name: getLayoutInfo ]]
    -- upvalues: v19 (copy), v33 (copy)
    if v48 then
        return v19, {
            Size = UDim2.new(0, 540, 0, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = "LuaApp/buttons/buttonFill", 
            ImageColor3 = v49.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v33, 
            AutomaticSize = Enum.AutomaticSize.Y
        };
    else
        return "Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v49.BackgroundUIDefault.Color
        };
    end;
end;
v36.renderBalanceTransferPrompt = function(v50, _) --[[ Line: 237 ]] --[[ Name: renderBalanceTransferPrompt ]]
    -- upvalues: v2 (copy), v20 (copy)
    return v2.createElement(v20, {
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        screenSize = v50.props.screenSize, 
        doneActivated = function() --[[ Line: 242 ]] --[[ Name: doneActivated ]]
            -- upvalues: v50 (copy)
            v50:setState({
                showBalanceTransferAlert = false
            });
        end
    });
end;
v36.renderWithProviders = function(v52, v53, v54) --[[ Line: 250 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FormFactor_0 (copy), v7 (copy), v8 (copy), v2 (copy), v18 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_StyledTextLabel_0 (copy), v34 (copy), v35 (copy), l_Checkbox_0 (copy), l_UserAgreementsList_0 (copy), l_GetFFlagVngTOSRevisedEnabled_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_Font_0 = v54.Font;
    local l_Theme_0 = v54.Theme;
    local l_screenSize_0 = v52.props.screenSize;
    local v58 = v52.props.formFactor == l_FormFactor_0.WIDE;
    local v59, v60 = v52:getLayoutInfo(v58, l_Theme_0);
    local l_title_0 = v53.title;
    local l_message_0 = v53.message;
    local l_agreeButton_0 = v53.agreeButton;
    local l_checkbox_0 = v53.checkbox;
    local l_errorMessage_0 = v53.errorMessage;
    v7.default:logRobloxTelemetryEvent(v8);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_screenSize_0.Y), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement(v59, v60, {
            ListLayout = v58 and v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v58 and 0 or 60), 
                PaddingBottom = UDim.new(0, v58 and 24 or 48)
            }), 
            Content = v2.createElement(v18.FitFrameVertical, {
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Title = v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 48), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    v2.createElement(l_IconButton_0, {
                        anchorPoint = Vector2.new(0, 0.5), 
                        size = UDim2.new(0, 36, 0, 36), 
                        position = UDim2.new(0, 8, 0.5, 0), 
                        icon = l_Images_0["icons/navigation/close"], 
                        onActivated = v52.xClose
                    }); 
                    TitleText = v2.createElement(l_StyledTextLabel_0, {
                        size = UDim2.new(1, 0, 0, 36), 
                        text = l_title_0, 
                        fontStyle = l_Font_0.Header1, 
                        colorStyle = l_Theme_0.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        textYAlignment = Enum.TextYAlignment.Bottom, 
                        textTruncate = Enum.TextTruncate.AtEnd
                    }), 
                    Divider = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        BorderSizePixel = 0
                    })
                }), 
                Message = v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v58 and 24 or v34), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, v58 and 12 or v35), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    MessageText = v2.createElement(l_StyledTextLabel_0, {
                        size = UDim2.new(1, 0, 0, 0), 
                        text = l_message_0, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        textTruncate = Enum.TextTruncate.None, 
                        automaticSize = Enum.AutomaticSize.Y
                    })
                }), 
                AgreementsContainer = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    CheckBox = v2.createElement(l_Checkbox_0, {
                        text = "", 
                        isSelected = v52.state.agreementsChecked, 
                        onActivated = v52.SetAgreementsCheckBox
                    }), 
                    MessageButton = v2.createElement("TextButton", {
                        Size = UDim2.new(1, -34, 1, 0), 
                        Position = UDim2.new(0, 34, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Text = l_checkbox_0, 
                        Font = l_Font_0.Body.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        [v2.Event.Activated] = v52.SetAgreementsCheckBoxByTextButton
                    })
                }), 
                SecondDivider = v2.createElement("Frame", {
                    LayoutOrder = 4, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 0), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    Divider = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        BorderSizePixel = 0
                    })
                }), 
                AgreementsList = v2.createElement(l_UserAgreementsList_0, {
                    LayoutOrder = 5, 
                    agreements = v52.props.agreements, 
                    margin = v18.Rect.quad(0, 24, 24, 24), 
                    verticalSpaceOffset = if not l_GetFFlagVngTOSRevisedEnabled_0() or v58 then nil else 80, 
                    useScrollableFrame = l_GetFFlagVngTOSRevisedEnabled_0() and not v58 or nil
                })
            }), 
            AgreeZone = v2.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 1, -10), 
                AnchorPoint = Vector2.new(0.5, 1), 
                ZIndex = 99
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 0), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 24)
                }); 
                v2.createElement(v18.FitFrameVertical, {
                    width = UDim.new(1, 0), 
                    BackgroundTransparency = 1
                }, {
                    ErrorLabel = v52.state.showError and v2.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Text = l_errorMessage_0, 
                        Font = l_Font_0.Body.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize * 0.8, 
                        TextColor3 = l_Theme_0.Alert.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true
                    }) or nil, 
                    AgreeButton = v2.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = UDim2.new(1, 0, 0, 48), 
                        anchorPoint = Vector2.new(0, 0), 
                        isDisabled = v52.state.acceptingAgreements or not v52.state.agreementsChecked, 
                        layoutOrder = 2, 
                        text = l_agreeButton_0, 
                        fontStyle = l_Font_0.SubHeader1, 
                        onActivated = v52.tryAgree
                    })
                })
            })
        })
    });
end;
v36.render = function(v66) --[[ Line: 466 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), l_GetFFlagVngTOSRevisedEnabled_0 (copy), l_withStyle_0 (copy)
    return v14({
        title = "CommonUI.UserAgreements.Popup.Agreement.TermsOfService", 
        message = if v66.props.isSignup then l_GetFFlagVngTOSRevisedEnabled_0() and "CommonUI.UserAgreements.Popup.VNSignupMessage" or "CommonUI.UserAgreements.Popup.SignupMessage" else "CommonUI.UserAgreements.Popup.ConvertToVNMessage", 
        agreeButton = "CommonUI.UserAgreements.Popup.Agree2", 
        checkbox = if l_GetFFlagVngTOSRevisedEnabled_0() then v66.props.isSignup and "CommonUI.UserAgreements.Popup.VNSignupCheckboxMessage" or "CommonUI.UserAgreements.Popup.ConvertToVNCheckboxMessage" else "CommonUI.UserAgreements.Popup.CheckboxMessage", 
        errorMessage = "CommonUI.UserAgreements.Popup.FailAndRetryMessage"
    })(function(v67) --[[ Line: 481 ]]
        -- upvalues: l_withStyle_0 (ref), v66 (copy)
        return l_withStyle_0(function(v68) --[[ Line: 482 ]]
            -- upvalues: v66 (ref), v67 (copy)
            if v66.state.showBalanceTransferAlert then
                return (v66:renderBalanceTransferPrompt(v67));
            else
                return (v66:renderWithProviders(v67, v68));
            end;
        end);
    end);
end;
v36 = v3.connect(function(v69) --[[ Line: 490 ]]
    return {
        screenSize = v69.ScreenSize, 
        formFactor = v69.FormFactor
    };
end, function(v70) --[[ Line: 495 ]]
    -- upvalues: v11 (copy), l_FFlagAddReasonToEveryLogout_0 (copy), v27 (copy), v28 (copy)
    return {
        closePopup = function() --[[ Line: 497 ]] --[[ Name: closePopup ]]
            -- upvalues: v70 (copy), v11 (ref)
            v70(v11());
        end, 
        logout = function(v71, v72) --[[ Line: 500 ]] --[[ Name: logout ]]
            -- upvalues: l_FFlagAddReasonToEveryLogout_0 (ref), v70 (copy), v27 (ref), v28 (ref)
            if l_FFlagAddReasonToEveryLogout_0 then
                v70(v27(v71, v72, v28.VngUserAgreement));
                return;
            else
                v70(v27(v71, v72));
                return;
            end;
        end
    };
end)(v36);
return (l_RoactServices_0.connect({
    networking = v5, 
    guiService = l_AppGuiService_0
})(v36));