local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_useDefaultFocusBehavior_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useDefaultFocusBehavior;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v8.App.Button.Button;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_withStyle_0 = v8.Style.withStyle;
local v12 = require(l_Modules_0.LuaApp.withLocalization);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local v14 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v15 = require(l_Modules_0.LuaApp.Thunks.NavigateSideways);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v17 = require(l_Modules_0.LuaApp.FitChildren);
local l_BirthdayPicker_0 = require(l_CorePackages_0.Workspace.Packages.AuthSignup).Components.BirthdayPicker;
local v19 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpLayout);
local v20 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBackAndNextButton);
local l_DateHelper_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateHelper;
local v22 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_Images_0 = v8.App.ImageSet.Images;
local v27 = require(l_Modules_0.LuaApp.Components.Authentication.MultiPageSignupText);
local l_Birthday_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Models.Birthday;
local v29 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpBirthday);
local v30 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v32 = UDim2.new(0, 36, 0, 36);
local v33 = l_Images_0["icons/navigation/close"];
local v34 = Vector2.new(540, 1080);
local v35 = v3.PureComponent:extend("BirthdayPage");
v35.init = function(v36) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_Birthday_0 (copy), v30 (copy), l_DateHelper_0 (copy)
    v36.state = {
        month = 0, 
        day = 0, 
        year = 0, 
        continueButtonEnabled = false
    };
    v36.isMounted = false;
    v36.closeButtonRef = v36.props.defaultRef;
    v36.confirmButtonRef = v3.createRef();
    v36.onContinueButtonActivated = function() --[[ Line: 72 ]]
        -- upvalues: v36 (copy), l_Birthday_0 (ref), v30 (ref)
        local l_authAnalytics_0 = v36.props.authAnalytics;
        local l_setSignUpBirthday_0 = v36.props.setSignUpBirthday;
        local l_month_0 = v36.state.month;
        local l_day_0 = v36.state.day;
        local l_year_0 = v36.state.year;
        if v36.state.continueButtonEnabled then
            local v42 = l_Birthday_0.new({
                Month = l_month_0, 
                Day = l_day_0, 
                Year = l_year_0
            });
            l_authAnalytics_0.reportBirthdaySelection(v30.Context.BirthdayScreen);
            l_setSignUpBirthday_0(v42);
            l_authAnalytics_0.reportContinueButtonClicked(v30.Context.BirthdayScreen);
            l_authAnalytics_0.reportAuthButtonClick(v30.Context.BirthdayScreen, v30.Button.Continue, (tostring(l_year_0)));
            v36.props.navigateToSinglePageSignUp(v42);
        end;
    end;
    v36.onCloseButtonClicked = function() --[[ Line: 101 ]]
        -- upvalues: v36 (copy), v30 (ref)
        v36.props.authAnalytics.reportAuthButtonClick(v30.Context.BirthdayScreen, v30.Button.Close);
        v36.props.navigateBack();
    end;
    v36.updateBirthday = function(v43, v44, v45) --[[ Line: 109 ]]
        -- upvalues: l_DateHelper_0 (ref), v36 (copy)
        local v46 = l_DateHelper_0:isValidDate(v43, v44, v45);
        spawn(function() --[[ Line: 112 ]]
            -- upvalues: v36 (ref), v43 (copy), v44 (copy), v45 (copy), v46 (copy)
            if v36.isMounted then
                v36:setState({
                    month = v43, 
                    day = v44, 
                    year = v45, 
                    continueButtonEnabled = v46
                });
            end;
        end);
    end;
    v36.renderCharacter = function() --[[ Line: 124 ]]
        -- upvalues: v3 (ref)
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Character = v3.createElement("ImageLabel", {
                Size = UDim2.new(0.9, 0, 0.9, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/builderman.png", 
                ZIndex = 2
            }), 
            Shadow = v3.createElement("ImageLabel", {
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/CharacterShadow.png", 
                Size = UDim2.new(1, 0, 0.25, 0), 
                Position = UDim2.new(0.5, 0, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 1
            })
        });
    end;
    v36.props.authAnalytics.reportScreenLoaded(v30.Context.BirthdayScreen);
end;
v35.didMount = function(v47) --[[ Line: 151 ]] --[[ Name: didMount ]]
    -- upvalues: v30 (copy)
    v47.isMounted = true;
    v47.props.authAnalytics.reportAuthPageload(v30.Context.BirthdayScreen);
end;
v35.willUnmount = function(v48) --[[ Line: 157 ]] --[[ Name: willUnmount ]]
    v48.isMounted = false;
end;
v35.render = function(v49) --[[ Line: 161 ]] --[[ Name: render ]]
    -- upvalues: v31 (copy), l_withStyle_0 (copy), v12 (copy), v3 (copy), v22 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v34 (copy), l_ImageSetButton_0 (copy), v32 (copy), v33 (copy), v27 (copy), l_BirthdayPicker_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v19 (copy), l_FormFactor_0 (copy), v17 (copy), v20 (copy)
    if v31() then
        return l_withStyle_0(function(v50) --[[ Line: 163 ]]
            -- upvalues: v12 (ref), v3 (ref), v22 (ref), l_ImageSetLabel_0 (ref), l_GetImageData_0 (ref), v49 (copy), v34 (ref), l_ImageSetButton_0 (ref), v32 (ref), v33 (ref), v27 (ref), l_BirthdayPicker_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref)
            return v12({
                continueText = "Authentication.SignUp.Label.Continue", 
                signUpText = "Authentication.SignUp.Action.CreateAccount", 
                helpText = "Authentication.SignUp.Description.BirthdayHelp", 
                headerText = "Authentication.SignUp.Heading.WhatsYourBirthday"
            })(function(v51) --[[ Line: 169 ]]
                -- upvalues: v3 (ref), v22 (ref), v50 (copy), l_ImageSetLabel_0 (ref), l_GetImageData_0 (ref), v49 (ref), v34 (ref), l_ImageSetButton_0 (ref), v32 (ref), v33 (ref), v27 (ref), l_BirthdayPicker_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref)
                return v3.createElement(v22, {
                    BackgroundTransparency = 1, 
                    includeStatusBar = true, 
                    renderFullscreenBackground = function() --[[ Line: 173 ]] --[[ Name: renderFullscreenBackground ]]
                        -- upvalues: v3 (ref), v50 (ref)
                        return v3.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = v50.Theme.BackgroundUIDefault.Color
                        });
                    end
                }, {
                    Container = v3.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(9, 9, 9, 9), 
                        Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                        ImageColor3 = v50.Theme.BackgroundUIDefault.Color, 
                        ClipsDescendants = true, 
                        [v3.Ref] = v49.props.containerRef
                    }, {
                        SizeConstraint = v3.createElement("UISizeConstraint", {
                            MaxSize = v34
                        }), 
                        HeaderFrame = v3.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 48), 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundTransparency = 1
                        }, {
                            CloseButton = v3.createElement(l_ImageSetButton_0, {
                                Size = v32, 
                                AutoButtonColor = false, 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1, 
                                Position = UDim2.new(0, 12, 0.5, 0), 
                                AnchorPoint = Vector2.new(0, 0.5), 
                                ScaleType = Enum.ScaleType.Fit, 
                                Image = v33, 
                                ImageColor3 = v50.Theme.UIEmphasis.Color, 
                                ImageTransparency = 0, 
                                [v3.Ref] = v49.closeButtonRef, 
                                [v3.Event.Activated] = v49.onCloseButtonClicked
                            }), 
                            Title = v3.createElement("TextLabel", {
                                Position = UDim2.new(0, 0, 0.5, 0), 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AnchorPoint = Vector2.new(0, 0.5), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                BackgroundTransparency = 1, 
                                Text = v51.signUpText or "", 
                                TextWrapped = true, 
                                Font = v50.Font.CaptionHeader.Font, 
                                TextSize = v50.Font.BaseSize * v50.Font.Header1.RelativeSize, 
                                TextColor3 = v50.Theme.TextEmphasis.Color, 
                                TextTransparency = v50.Theme.TextEmphasis.Transparency, 
                                TextXAlignment = Enum.TextXAlignment.Center
                            })
                        }), 
                        Divider = v3.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 1), 
                            Position = UDim2.new(0.5, 0, 0, 48), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = v50.Theme.UIEmphasis.Color
                        }), 
                        ContentFrame = v3.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, -49), 
                            Position = UDim2.new(0.5, 0, 0, 49), 
                            BackgroundTransparency = 1, 
                            AnchorPoint = Vector2.new(0.5, 0)
                        }, {
                            Padding = v3.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 24), 
                                PaddingRight = UDim.new(0, 24), 
                                PaddingTop = UDim.new(0, 24)
                            }), 
                            ListLayout = v3.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, 8)
                            }), 
                            MultiPageSignupText = v3.createElement(v27, {
                                layoutOrder = 1, 
                                titleText = v51.headerText, 
                                helpText = v51.helpText
                            }), 
                            PickerFrame = v3.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 2
                            }, {
                                BirthdayPadding = v3.createElement("UIPadding", {
                                    PaddingTop = UDim.new(0, 20), 
                                    PaddingBottom = UDim.new(0, 20)
                                }), 
                                BirthdayPicker = v3.createElement(l_BirthdayPicker_0, {
                                    updateBirthday = v49.updateBirthday, 
                                    NextSelectionUp = v49.closeButtonRef, 
                                    NextSelectionDown = v49.confirmButtonRef
                                })
                            }), 
                            ButtonPadding = v3.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 10), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 3
                            }), 
                            ConfirmBirthdayButton = v3.createElement(l_Button_0, {
                                layoutOrder = 4, 
                                buttonType = l_ButtonType_0.PrimaryContextual, 
                                isDisabled = not v49.state.continueButtonEnabled, 
                                size = UDim2.new(1, 0, 0, 36), 
                                text = v51.continueText, 
                                onActivated = v49.onContinueButtonActivated, 
                                [v3.Ref] = v49.confirmButtonRef
                            })
                        })
                    })
                });
            end);
        end);
    else
        return v3.createElement(v19, {
            titleTextKey = "Authentication.SignUp.Label.WhensYourBirthday", 
            renderWidget = function(v52) --[[ Line: 298 ]] --[[ Name: renderWidget ]]
                -- upvalues: v49 (copy), l_withStyle_0 (ref), v12 (ref), l_FormFactor_0 (ref), v3 (ref), v17 (ref), l_BirthdayPicker_0 (ref), v20 (ref)
                local l_formFactor_0 = v52.formFactor;
                local l_continueButtonEnabled_0 = v49.state.continueButtonEnabled;
                return l_withStyle_0(function(v55) --[[ Line: 302 ]]
                    -- upvalues: v12 (ref), l_formFactor_0 (copy), l_FormFactor_0 (ref), v3 (ref), v17 (ref), v49 (ref), l_BirthdayPicker_0 (ref), v20 (ref), l_continueButtonEnabled_0 (copy)
                    return v12({
                        continueText = "Authentication.SignUp.Label.Continue"
                    })(function(v56) --[[ Line: 305 ]]
                        -- upvalues: l_formFactor_0 (ref), l_FormFactor_0 (ref), v55 (copy), v3 (ref), v17 (ref), v49 (ref), l_BirthdayPicker_0 (ref), v20 (ref), l_continueButtonEnabled_0 (ref)
                        local v57 = 1;
                        if l_formFactor_0 == l_FormFactor_0.COMPACT then
                            v57 = v55.Theme.BackgroundDefault.Transparency;
                        end;
                        return v3.createElement(v17.FitImageLabel, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v17.FitAxis.Height, 
                            BackgroundColor3 = v55.Theme.BackgroundDefault.Color, 
                            BackgroundTransparency = v57, 
                            BorderSizePixel = 0, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(9, 9, 9, 9), 
                            ClipsDescendants = true, 
                            Image = "LuaApp/buttons/buttonFill", 
                            ImageColor3 = v55.Theme.BackgroundDefault.Color, 
                            ImageTransparency = v55.Theme.BackgroundDefault.Transparency, 
                            [v3.Ref] = v49.props.containerRef
                        }, {
                            ListLayout = v3.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Padding = v3.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 20), 
                                PaddingRight = UDim.new(0, 20), 
                                PaddingTop = UDim.new(0, 20), 
                                PaddingBottom = UDim.new(0, 20)
                            }), 
                            BirthdayPicker = v3.createElement(l_BirthdayPicker_0, {
                                layoutOrder = 1, 
                                updateBirthday = v49.updateBirthday, 
                                NextSelectionUp = v49.closeButtonRef, 
                                NextSelectionDown = v49.confirmButtonRef
                            }), 
                            AuthBackAndNextButton = v3.createElement(v20, {
                                layoutOrder = 2, 
                                size = UDim2.new(1, 0, 0, 36), 
                                nextButtonText = v56.continueText, 
                                nextButtonIsDisabled = not l_continueButtonEnabled_0, 
                                nextButtonOnActivated = v49.onContinueButtonActivated, 
                                [v3.Ref] = v49.confirmButtonRef
                            })
                        });
                    end);
                end);
            end, 
            renderCharacter = v49.renderCharacter, 
            widgetHeightIsDrivenByLayout = false, 
            showDisclaimerLinks = true
        });
    end;
end;
v35 = v4.connect(nil, function(v58) --[[ Line: 360 ]]
    -- upvalues: v29 (copy), v15 (copy), v13 (copy), v14 (copy)
    return {
        setSignUpBirthday = function(v59) --[[ Line: 362 ]] --[[ Name: setSignUpBirthday ]]
            -- upvalues: v58 (copy), v29 (ref)
            return v58(v29(v59));
        end, 
        navigateToSinglePageSignUp = function(v60) --[[ Line: 365 ]] --[[ Name: navigateToSinglePageSignUp ]]
            -- upvalues: v58 (copy), v15 (ref), v13 (ref)
            return v58(v15({
                name = v13.SinglePageSignUp, 
                extraProps = {
                    birthday = v60
                }
            }));
        end, 
        navigateBack = function() --[[ Line: 368 ]] --[[ Name: navigateBack ]]
            -- upvalues: v58 (copy), v14 (ref)
            return v58(v14());
        end
    };
end)(v35);
v35 = l_RoactServices_0.connect({
    authAnalytics = v5
})(v35);
return function(v61) --[[ Line: 378 ]]
    -- upvalues: l_useDefaultFocusBehavior_0 (copy), v3 (copy), v35 (ref), v2 (copy)
    local v62, v63 = l_useDefaultFocusBehavior_0();
    return v3.createElement(v35, v2.Dictionary.join(v61, {
        defaultRef = v62, 
        containerRef = v63
    }));
end;