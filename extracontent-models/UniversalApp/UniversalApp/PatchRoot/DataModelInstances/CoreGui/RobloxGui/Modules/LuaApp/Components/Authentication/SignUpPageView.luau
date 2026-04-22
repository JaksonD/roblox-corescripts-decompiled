local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetButton_0 = v7.Core.ImageSet.ImageSetButton;
local l_Button_0 = v7.App.Button.Button;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v15 = require(l_Modules_0.LuaApp.FitChildren);
local v16 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_useTextSizeOffset_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTextSizeOffset;
local v18 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useAnimatedScrollToSelection_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useAnimatedScrollToSelection;
local v22 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local v23 = require(l_Modules_0.LuaApp.Enum.UsernameValidationContext);
local _ = require(l_Modules_0.LuaApp.Components.Authentication.Enum.InputValidity);
local v25 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBirthdayBar);
local v26 = require(l_Modules_0.LuaApp.Components.Authentication.GenderDropdownSelector);
local v27 = require(l_Modules_0.LuaApp.Components.Authentication.BirthdateDropdownSelector);
local v28 = require(l_Modules_0.LuaApp.Components.Authentication.CollapsingTextInputValidator);
local v29 = require(l_Modules_0.LuaApp.Components.Authentication.SuggestionsFrame);
local v30 = require(l_Modules_0.LuaApp.Thunks.Authentication.UsernameSuggestor);
local v31 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpGenderSelector);
local v32 = require(l_Modules_0.LuaApp.Components.Authentication.TitleAndParagraph);
local v33 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v34 = require(l_Modules_0.LuaApp.Components.Authentication.ContactInfoField);
local l_BackgroundFill_0 = v22.Components.BackgroundFill;
local v36 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v37 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useSignUpPageNavigationBindings_0 = v22.Hooks.useSignUpPageNavigationBindings;
local l_DateHelper_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateHelper;
local l_GetFFlagEnableTextFieldContentType_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType;
local v41 = require(l_Modules_0.LuaApp.Flags.GetFFlagRefactorAuthPageForTenFoot);
local l_GetFFlagLuaAppEnable10ftSignUpView_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnable10ftSignUpView;
local v43 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaLoginGenderSelector);
local v44 = UDim2.new(0, 36, 0, 36);
local v45 = Vector2.new(540, 1080);
local v46 = Vector2.new(850, 1080);
local v47 = game:DefineFastFlag("EnableUsernameNextSelectionDown", false);
local v48 = game:DefineFastFlag("AuthRefactorConsoleDisclaimerText", false);
return function(v49) --[[ Line: 168 ]]
    -- upvalues: l_useStyle_0 (copy), l_useUiModeInfo_0 (copy), v41 (copy), l_UiMode_0 (copy), l_GetFFlagLuaAppEnable10ftSignUpView_0 (copy), l_useDesignTokens_0 (copy), v37 (copy), v18 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), v2 (copy), v3 (copy), l_useSignUpPageNavigationBindings_0 (copy), l_BackgroundFill_0 (copy), l_GetFFlagEnableTextFieldContentType_0 (copy), v48 (copy), l_useTextSizeOffset_0 (copy), l_useAnimatedScrollToSelection_0 (copy), v36 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v46 (copy), v45 (copy), l_ImageSetButton_0 (copy), v44 (copy), l_Images_0 (copy), v16 (copy), v15 (copy), v25 (copy), v27 (copy), v26 (copy), v34 (copy), l_DateHelper_0 (copy), v28 (copy), v23 (copy), v47 (copy), v29 (copy), v30 (copy), v43 (copy), v31 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v32 (copy), v33 (copy)
    local v50 = l_useStyle_0();
    local v51 = l_useUiModeInfo_0();
    local v52 = v41() and v51.uiMode == l_UiMode_0.TenFoot or v51.uiMode == l_UiMode_0.VR;
    local v53 = l_GetFFlagLuaAppEnable10ftSignUpView_0() or v51.uiMode == l_UiMode_0.VR;
    local v54 = if v53 then l_useDesignTokens_0() else nil;
    local v55 = if v53 and v54 then v54.LuaApps.SignUpView else nil;
    local v57 = v37(function(v56) --[[ Line: 176 ]]
        return v56.getPlatformAccountName();
    end);
    local v58 = v18({
        signUpText = "Authentication.SignUp.Action.CreateAccount", 
        usernamePlaceholder = "Authentication.SignUp.Message.Username.NoRealNameUse", 
        passwordPlaceholder = "Authentication.SignUp.Label.PasswordPlaceholder", 
        unknownError = "Feature.Reauthentication.Message.Error.Default"
    });
    local v60 = l_useSelector_0(function(v59) --[[ Line: 187 ]]
        return v59.FormFactor;
    end) == l_FormFactor_0.WIDE;
    local v61 = v2.useRef(nil);
    local v62 = v3.useFocusedGuiObject();
    local v63 = v3.useFocusGuiObject();
    local v64 = l_useSignUpPageNavigationBindings_0();
    local v65 = nil;
    local v66 = nil;
    if not v52 then
        local v67, v68 = v3.useDefaultFocusBehavior(v64);
        v65 = v67;
        v66 = v68;
    else
        local v69, v70 = v3.useDefaultFocusBehavior();
        v65 = v69;
        v66 = v70;
    end;
    local v71, v72 = v2.useState(false);
    local v73 = v2.useCallback(function() --[[ Line: 204 ]]
        -- upvalues: v72 (copy)
        v72(true);
    end);
    local v74 = v2.useCallback(function() --[[ Line: 207 ]]
        -- upvalues: v72 (copy)
        v72(false);
    end);
    local v75 = v2.useCallback(function() --[[ Line: 210 ]]
        -- upvalues: v2 (ref), v60 (copy), v50 (copy), l_BackgroundFill_0 (ref)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v60 and 1 or 0, 
            BackgroundColor3 = v50.Theme.BackgroundUIDefault.Color
        }, {
            Background = v60 and v2.createElement(l_BackgroundFill_0, {
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
            }), 
            Mask = v60 and v2.createElement("ImageLabel", {
                ZIndex = 2, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = 0.5
            })
        });
    end, {
        v60, 
        v50
    });
    local v76 = v49.useUsernameSuggestions();
    local l_birthday_0 = v49.birthday;
    local v78 = 0;
    local v79 = 0;
    local v80 = v49.onScreenKeyboardHeight > 0;
    local v81 = v49.useVerifiedSignup();
    local v82 = v60 and v81 and 12 or 0;
    local v83 = true;
    local v84 = true;
    local v85 = not v49.validUsernameEntered();
    local v86 = "Authentication.SignUp.Label.ErrorsWithUsername";
    local v87 = "Authentication.SignUp.Label.ErrorsWithPassword";
    if not l_birthday_0 then
        v86 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst";
        v87 = v86;
        v85 = true;
        v83 = false;
    elseif v85 then
        v87 = "Authentication.SignUp.Response.UsernameMustBeSetFirst";
        v84 = false;
    end;
    if v60 then
        if v80 then
            v78 = v49.onScreenKeyboardHeight + 10;
        else
            v78 = 48;
            v79 = 24;
        end;
    end;
    local v88 = l_birthday_0 and true or false;
    local v89 = l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions;
    local v90 = 36;
    local v91 = v50.Font.BaseSize * v50.Font.Header1.RelativeSize;
    local v92 = v50.Font.BaseSize * v50.Font.CaptionBody.RelativeSize;
    local v93 = 5;
    local v94 = 1;
    local v95 = nil;
    local v96 = {
        "Authentication.SignUp.Description.VerificationPage"
    };
    local v97 = {
        {}
    };
    if v52 and v57 then
        if v48 then
            v96 = {
                {
                    "Authentication.SignUp.Description.VerificationLinkingText"; 
                    platform = v57
                }
            };
        else
            v96 = {
                "Authentication.SignUp.Description.VerificationLinkingText"
            };
            v97 = {
                {
                    platform = v57
                }
            };
        end;
    end;
    if v53 and v55 then
        v79 = v55.marginTop;
        v92 = v55.textCaptionHeaderSize;
        v91 = v55.textHeaderSize;
        v90 = v55.buttonHeight;
        v93 = v55.contentPadding;
        v94 = v55.headerPadding;
        v95 = {
            Size = UDim2.fromScale(1, 1), 
            TextSize = v55.buttonTextSize
        };
    end;
    v2.useEffect(function() --[[ Line: 314 ]]
        -- upvalues: v62 (copy), v61 (copy), v63 (copy)
        if v62 and v61.current then
            v63(v61.current);
        end;
    end, {});
    local _ = nil;
    local _ = nil;
    local v100 = nil;
    v100 = l_useTextSizeOffset_0();
    local v101, v102 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, v78 + 49 + v100);
    v101 = {
        BorderSizePixel = 0, 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasPosition = v101, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ScrollBarImageTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0, 49), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.new(1, 0, 1, -(49 + v82 + v79 + v100)), 
        [v2.Change.CanvasSize] = v49.onSignUpContentFrameCanvasSizeChange, 
        [v2.Event.SelectionChanged] = v102, 
        ref = v49.signUpContentFrameRef, 
        LayoutOrder = 3, 
        Selectable = false, 
        BackgroundTransparency = 1
    };
    return v2.createElement(v36, {
        BackgroundTransparency = 1, 
        includeStatusBar = true, 
        buttonRef = v66, 
        renderFullscreenBackground = if v52 then nil else v75
    }, {
        UserInputSink = v49.isSignUpInProgress and v2.createElement("ImageButton", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Image = ""
        }), 
        Container = v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(1, 0, 1, -v78), 
            Position = UDim2.new(0.5, 0, 0, v79), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(9, 9, 9, 9), 
            Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
            ImageColor3 = v50.Theme.BackgroundUIDefault.Color, 
            ImageTransparency = v52 and 1 or 0, 
            ClipsDescendants = true
        }, {
            ContainerListLayout = if v53 then v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v94)
            }) else nil, 
            SizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = if v52 then v46 else v45
            }), 
            HeaderFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 48), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = if v53 then Enum.AutomaticSize.Y else nil
            }, {
                BackButton = if v51.uiMode ~= l_UiMode_0.VR and v53 then nil else v2.createElement(l_ImageSetButton_0, {
                    Size = v44, 
                    AutoButtonColor = false, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 12, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = l_Images_0["icons/navigation/close"], 
                    ImageColor3 = v50.Theme.UIEmphasis.Color, 
                    ImageTransparency = 0, 
                    [v2.Event.Activated] = v49.navigateBack, 
                    ref = v61
                }), 
                Title = v58.signUpText and v2.createElement(v16, {
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    fitAxis = v15.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v58.signUpText or "", 
                    TextWrapped = true, 
                    Font = v50.Font.CaptionHeader.Font, 
                    TextSize = v91, 
                    TextColor3 = v50.Theme.TextEmphasis.Color, 
                    TextTransparency = v50.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Center
                })
            }), 
            Divider = if not v53 then v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0.5, 0, 0, 48), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = v50.Theme.UIEmphasis.Color, 
                LayoutOrder = 2
            }) else nil, 
            SignUpContentFrame = v2.createElement("ScrollingFrame", v101, {
                ContentPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, v60 and 25 or 48)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v93)
                }), 
                BirthdayBar = if v52 then nil else v2.createElement(v25, {
                    layoutOrder = 1, 
                    onBirthdaySelected = v49.onBirthdaySelected, 
                    onBirthdayFocused = v49.onBirthdayFocused, 
                    autoFocusOnMount = v81, 
                    buttonRef = v65
                }), 
                BirthdayGenderPicker = if v52 then v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 140), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    ZIndex = 2, 
                    ref = v65
                }, {
                    BirthdayPicker = v2.createElement(v27, {
                        onBirthdaySelected = v49.onBirthdaySelected, 
                        alignment = Enum.HorizontalAlignment.Left, 
                        layoutOrder = 1
                    }), 
                    GenderSelector = v2.createElement(v26, {
                        onGenderChanged = v49.onGenderChanged, 
                        alignment = Enum.HorizontalAlignment.Right, 
                        layoutOrder = 2
                    })
                }) else nil, 
                ContactInfoField = v81 and v2.createElement(v34, {
                    layoutOrder = 2, 
                    Under13 = l_birthday_0 and l_DateHelper_0:isRecentOrFutureDate(l_birthday_0.Month, l_birthday_0.Day, l_birthday_0.Year + 13), 
                    SetContactMethod = v49.SetContactMethod, 
                    SetPhoneNumber = v49.SetPhoneNumber, 
                    SetEmail = v49.SetEmail, 
                    contactMethod = v49.contactMethod, 
                    phoneCountryCodeSelectorCallback = v49.phoneCountryCodeSelectorCallback
                }), 
                BackgroundPanel = v81 and v2.createElement("Frame", {
                    Size = UDim2.new(0, 0, 0, 6), 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1
                }, {
                    LightPanel = v2.createElement("Frame", {
                        BorderSizePixel = 0, 
                        Size = UDim2.new(0, 100000, 0, 100000), 
                        Position = UDim2.new(0, 0, 1, 0), 
                        BackgroundColor3 = v50.Theme.UIDefault.Color, 
                        AnchorPoint = Vector2.new(0.5, 0)
                    })
                }), 
                UsernameValidator = v2.createElement(v28, {
                    layoutOrder = 4, 
                    titleTextKey = "Authentication.Login.Label.Username", 
                    summaryErrorTextKey = v86, 
                    prerequisiteMet = v88, 
                    textInputType = v89, 
                    onInputTextChanged = v49.onUsernameTextChanged, 
                    onInputTextValidated = v76 and v49.onUsernameTextValidated or v49.onUsernameTextChanged, 
                    validator = v49.UsernameValidator, 
                    placeholderText = v58.usernamePlaceholder, 
                    validatorAdditionalProps = {
                        birthday = l_birthday_0 and l_birthday_0:FormatForEndpoint() or "", 
                        context = v23.Signup
                    }, 
                    textBoxFocusedCallback = v49.onUsernameTextBoxFocused, 
                    textBoxFocusLostCallback = v49.onTextBoxFocusLost, 
                    focusedTextBoxPositionChangedCallback = v49.onFocusedTextBoxPositionChanged, 
                    returnKeyType = Enum.ReturnKeyType.Next, 
                    onReturnPressedFromOnScreenKeyboard = v49.onUsernameTextChangeCompletedFromKeyboard, 
                    onAnimationStateChangeCallback = v49.onAnimationStateChangeCallback, 
                    textBoxRef = v49.usernameTextFieldRef, 
                    pillClicked = v71, 
                    updatePillClicked = v73, 
                    resetPillClicked = v74, 
                    issueCondition = v49.issueCondition, 
                    updateIssueCondition = v49.updateIssueCondition, 
                    loadingSuggestions = v49.loadingSuggestions, 
                    tokens = v55, 
                    showDetailedError = v83, 
                    NextSelectionDown = if not v47 or v76 then nil else v49.passwordTextFieldRef
                }), 
                SuggestionsFrame = v76 and v2.createElement(v29, {
                    layoutOrder = 4, 
                    textBoxRef = v49.usernameTextFieldRef, 
                    usernameValid = v49.usernameValid, 
                    birthday = l_birthday_0 and l_birthday_0:FormatForEndpoint() or "", 
                    suggest = v30, 
                    context = v23.Signup, 
                    pillClicked = v71, 
                    updatePillClicked = v73, 
                    resetPillClicked = v74, 
                    issueCondition = v49.issueCondition, 
                    usernameSuggestionClicked = v49.usernameSuggestionClicked, 
                    usernameSuggestionsShown = v49.usernameSuggestionsShown, 
                    shouldSuggest = v49.shouldSuggest, 
                    updateSuggestionControlState = v49.updateSuggestionControlState, 
                    useRefreshButton = v49.useRefreshButton, 
                    logRefreshButtonClicked = v49.logRefreshButtonClicked, 
                    loadSuggestions = v49.loadSuggestions, 
                    finishSuggestions = v49.finishSuggestions, 
                    loadingSuggestions = v49.loadingSuggestions
                }), 
                PasswordValidator = v2.createElement(v28, {
                    disabled = v49.birthdayFocused, 
                    layoutOrder = 5, 
                    titleTextKey = "CommonUI.Messages.Label.Password", 
                    summaryErrorTextKey = v87, 
                    prerequisiteMet = not v85, 
                    textInputType = Enum.TextInputType.Password, 
                    onInputTextChanged = v49.onPasswordTextChanged, 
                    onInputTextValidated = v49.onPasswordTextChanged, 
                    validator = v49.PasswordValidator, 
                    placeholderText = v58.passwordPlaceholder, 
                    validatorAdditionalProps = {
                        username = v49.username
                    }, 
                    returnKeyType = Enum.ReturnKeyType.Next, 
                    textBoxFocusedCallback = v49.onPasswordTextBoxFocused, 
                    textBoxFocusLostCallback = v49.onTextBoxFocusLost, 
                    focusedTextBoxPositionChangedCallback = v49.onFocusedTextBoxPositionChanged, 
                    onReturnPressedFromOnScreenKeyboard = v49.onPasswordTextChangeCompletedFromKeyboard, 
                    onAnimationStateChangeCallback = v49.onAnimationStateChangeCallback, 
                    textBoxRef = v49.passwordTextFieldRef, 
                    centralOverlayBlocksInput = v81, 
                    captureFocusOnTapStart = not v49.isCountryCodeSearchVisible, 
                    tokens = v55, 
                    showDetailedError = v84, 
                    IsKeyboardOverlayUsed = not (v51.uiMode == l_UiMode_0.VR)
                }), 
                GenderSelector = if v52 then nil else v43() ~= 2 and v2.createElement(v31, {
                    layoutOrder = 7, 
                    onGenderChanged = v49.onGenderChanged
                }), 
                Spacing = if not v52 then v2.createElement("Frame", {
                    LayoutOrder = 8, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 38)
                }) else nil, 
                ErrorLabel = if v49.signUpError then v2.createElement(v16, {
                    LayoutOrder = 9, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v15.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v58.unknownError, 
                    TextWrapped = true, 
                    Font = v50.Font.CaptionBody.Font, 
                    TextSize = v92, 
                    TextColor3 = v50.Theme.Alert.Color, 
                    TextTransparency = v50.Theme.TextDefault.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else nil, 
                SignUpPageButton = v2.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    layoutOrder = 10, 
                    size = UDim2.new(1, 0, 0, v90), 
                    text = v58.signUpText, 
                    isDisabled = not v49.isSignUpButtonEnabled, 
                    isLoading = v49.isSignUpInProgress, 
                    onActivated = v49.onSignUpClick, 
                    buttonTextOverride = v95
                }), 
                DisclaimerText = v2.createElement(v32, {
                    layoutOrder = 11, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    paragraphTextKeys = v96, 
                    paragraphTextArgs = v97
                }), 
                DisclaimerLinks = v2.createElement(v33, {
                    isDualLayout = v53, 
                    fillDirection = Enum.FillDirection.Horizontal, 
                    LayoutOrder = 12
                }), 
                ScrollPadding = v80 and v2.createElement("Frame", {
                    LayoutOrder = 13, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v49.onScreenKeyboardHeight * 2)
                })
            }), 
            Footer = v81 and v60 and v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 12), 
                Position = UDim2.new(0, 0, 1, -12), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Rounding = v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 2, 0), 
                    Position = UDim2.new(0, 0, -1, 0), 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(9, 9, 9, 9), 
                    Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                    ImageColor3 = v50.Theme.UIDefault.Color
                })
            })
        })
    });
end;