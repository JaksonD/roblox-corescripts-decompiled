local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local v12 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v11.Style.withStyle;
local v14 = require(l_Modules_0.LuaApp.withLocalization);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_UserGender_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.UserGender;
local l_InputValidity_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.InputValidity;
local v18 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local l_BackgroundFill_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Components.BackgroundFill;
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_ImageSetButton_0 = v11.Core.ImageSet.ImageSetButton;
local l_Images_0 = v11.App.ImageSet.Images;
local v24 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBirthdayBar);
local v25 = require(l_Modules_0.LuaApp.Components.Authentication.CollapsingTextInputValidator);
local v26 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpGenderSelector);
local l_Button_0 = v11.App.Button.Button;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local v29 = require(l_Modules_0.LuaApp.EventStreamConstants);
local l_Birthday_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Models.Birthday;
local v31 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v32 = require(l_Modules_0.LuaApp.Thunks.Authentication.DisplayNameValidator);
local v33 = require(l_Modules_0.Luobu.Thunks.RequestSignUp);
local v34 = require(l_Modules_0.Luobu.Actions.SetSignUpInProgress);
local v35 = require(l_Modules_0.Luobu.Actions.SetSignUpInfo);
local v36 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v37 = Vector2.new(540, 1080);
local v38 = UDim2.new(0, 36, 0, 36);
local v39 = l_Images_0["icons/navigation/close"];
local v40 = v3.PureComponent:extend("LuobuSignUpPage");
v40.validateProps = v12.strictInterface({
    formFactor = v12.string, 
    isSignUpInProgress = v12.boolean, 
    prefilledDisplayName = v12.string, 
    voucher = v12.string, 
    authMethod = v12.string, 
    channelId = v12.number, 
    agreedUserAgreements = v12.array(v12.strictInterface({
        id = v12.string, 
        agreementType = v12.string, 
        clientType = v12.string, 
        displayUrl = v12.string, 
        regulationType = v12.string
    })), 
    setSignUpInProgress = v12.callback, 
    resetSignUpInfo = v12.callback, 
    navigateBack = v12.callback, 
    setBackNavigationDisabled = v12.callback, 
    requestSignUp = v12.callback, 
    networking = v12.callback, 
    authEventAnalytics = v12.table, 
    analytics = v12.table, 
    appPolicy = v12.table
});
local function _(v41) --[[ Line: 94 ]] --[[ Name: formatGenderForEndpoint ]]
    -- upvalues: l_UserGender_0 (copy)
    return ({
        [l_UserGender_0.Unknown] = 1, 
        [l_UserGender_0.Male] = 2, 
        [l_UserGender_0.Female] = 3
    })[v41];
end;
v40.init = function(v43) --[[ Line: 104 ]] --[[ Name: init ]]
    -- upvalues: l_UserGender_0 (copy), l_InputValidity_0 (copy), v10 (copy), l_Birthday_0 (copy), v29 (copy)
    v43.state = {
        birthday = nil, 
        displayName = "", 
        gender = l_UserGender_0.Unknown, 
        onScreenKeyboardHeight = 0, 
        displayNameValid = l_InputValidity_0.Unvalidated
    };
    v43.isMounted = false;
    v43.onBirthdaySelected = function(v44) --[[ Line: 115 ]]
        -- upvalues: v10 (ref), l_Birthday_0 (ref), v43 (copy)
        v10.assert(l_Birthday_0.is(v44), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.");
        v43:setState({
            birthday = v44
        });
    end;
    v43.onDisplayNameTextChanged = function(v45, v46) --[[ Line: 126 ]]
        -- upvalues: v43 (copy)
        v43:setState({
            displayName = v45, 
            displayNameValid = v46
        });
    end;
    v43.onDisplayNameTextBoxFocused = function() --[[ Line: 133 ]]
        -- upvalues: v43 (copy), v29 (ref)
        v43.props.authEventAnalytics.reportDisplayNameFocus(v29.Context.LuobuSignUpPage);
    end;
    v43.onGenderChanged = function(v47) --[[ Line: 137 ]]
        -- upvalues: v43 (copy)
        if v43.isMounted then
            v43:setState({
                gender = v47
            });
        end;
    end;
    v43.onSignUpClick = function() --[[ Line: 145 ]]
        -- upvalues: v43 (copy), v29 (ref), l_UserGender_0 (ref)
        local l_setSignUpInProgress_0 = v43.props.setSignUpInProgress;
        local l_setBackNavigationDisabled_0 = v43.props.setBackNavigationDisabled;
        l_setSignUpInProgress_0(true);
        l_setBackNavigationDisabled_0(true);
        local l_requestSignUp_0 = v43.props.requestSignUp;
        local l_networking_0 = v43.props.networking;
        local l_analytics_0 = v43.props.analytics;
        local l_appPolicy_0 = v43.props.appPolicy;
        v43.props.authEventAnalytics.reportSignUpButtonClicked(v29.Context.LuobuSignUpPage);
        local l_birthday_0 = v43.state.birthday;
        local l_displayName_0 = v43.state.displayName;
        local l_gender_0 = v43.state.gender;
        local l_authMethod_0 = v43.props.authMethod;
        local l_voucher_0 = v43.props.voucher;
        local l_channelId_0 = v43.props.channelId;
        local l_agreedUserAgreements_0 = v43.props.agreedUserAgreements;
        local v61, _ = l_requestSignUp_0(l_networking_0, l_analytics_0, l_appPolicy_0, l_authMethod_0, {
            birthday = l_birthday_0:FormatForEndpoint(), 
            displayName = l_displayName_0, 
            gender = ({
                [l_UserGender_0.Unknown] = 1, 
                [l_UserGender_0.Male] = 2, 
                [l_UserGender_0.Female] = 3
            })[l_gender_0], 
            voucher = l_voucher_0, 
            channelId = l_channelId_0, 
            agreementIds = l_agreedUserAgreements_0
        }):await();
        l_setBackNavigationDisabled_0(false);
        if not v61 then
            l_setSignUpInProgress_0(false);
        end;
    end;
end;
v40.didMount = function(v63) --[[ Line: 185 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    v63.isMounted = true;
    v63.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 189 ]]
        -- upvalues: l_UserInputService_0 (ref), v63 (copy)
        local v64 = l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        v63:setState({
            onScreenKeyboardHeight = v64
        });
    end);
end;
v40.willUnmount = function(v65) --[[ Line: 199 ]] --[[ Name: willUnmount ]]
    v65.props.resetSignUpInfo();
    v65.props.setSignUpInProgress(false);
    v65.isMounted = false;
    if v65.keyboardVisibleChanged then
        v65.keyboardVisibleChanged:disconnect();
        v65.keyboardVisibleChanged = nil;
    end;
end;
v40.render = function(v66) --[[ Line: 210 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), l_InputValidity_0 (copy), l_withStyle_0 (copy), v14 (copy), v3 (copy), v18 (copy), l_BackgroundFill_0 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v37 (copy), l_ImageSetButton_0 (copy), v38 (copy), v39 (copy), v24 (copy), v25 (copy), v32 (copy), v26 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v67 = 0;
    local v68 = 0;
    local v69 = v66.props.formFactor == l_FormFactor_0.WIDE;
    local v70 = v66.state.onScreenKeyboardHeight > 0;
    if v69 then
        if v70 then
            v67 = v66.state.onScreenKeyboardHeight + 10;
        else
            v67 = 48;
            v68 = 24;
        end;
    end;
    local l_isSignUpInProgress_0 = v66.props.isSignUpInProgress;
    local l_birthday_1 = v66.state.birthday;
    local l_gender_1 = v66.state.gender;
    local l_displayName_1 = v66.state.displayName;
    local l_displayNameValid_0 = v66.state.displayNameValid;
    local v76 = l_birthday_1 and l_displayName_1 and l_displayNameValid_0 == l_InputValidity_0.Valid;
    local v77 = "Authentication.SignUp.Label.ErrorsWithUsername";
    if not l_birthday_1 then
        v77 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst";
    end;
    local l_prefilledDisplayName_0 = v66.props.prefilledDisplayName;
    return l_withStyle_0(function(v79) --[[ Line: 242 ]]
        -- upvalues: v14 (ref), v3 (ref), v18 (ref), v69 (copy), l_BackgroundFill_0 (ref), l_isSignUpInProgress_0 (copy), l_ImageSetLabel_0 (ref), v67 (ref), v68 (ref), l_GetImageData_0 (ref), v37 (ref), l_ImageSetButton_0 (ref), v38 (ref), v39 (ref), v66 (copy), v24 (ref), v25 (ref), v77 (ref), l_birthday_1 (copy), v32 (ref), l_prefilledDisplayName_0 (copy), v26 (ref), l_gender_1 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v76 (copy)
        return v14({
            signUpText = "Authentication.SignUp.Action.CreateAccount"
        })(function(v80) --[[ Line: 245 ]]
            -- upvalues: v3 (ref), v18 (ref), v69 (ref), v79 (copy), l_BackgroundFill_0 (ref), l_isSignUpInProgress_0 (ref), l_ImageSetLabel_0 (ref), v67 (ref), v68 (ref), l_GetImageData_0 (ref), v37 (ref), l_ImageSetButton_0 (ref), v38 (ref), v39 (ref), v66 (ref), v24 (ref), v25 (ref), v77 (ref), l_birthday_1 (ref), v32 (ref), l_prefilledDisplayName_0 (ref), v26 (ref), l_gender_1 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v76 (ref)
            return v3.createElement(v18, {
                BackgroundTransparency = 1, 
                includeStatusBar = true, 
                renderFullscreenBackground = function() --[[ Line: 249 ]] --[[ Name: renderFullscreenBackground ]]
                    -- upvalues: v3 (ref), v69 (ref), v79 (ref), l_BackgroundFill_0 (ref)
                    return v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = v69 and 1 or 0, 
                        BackgroundColor3 = v79.Theme.BackgroundUIDefault.Color
                    }, {
                        Background = v69 and v3.createElement(l_BackgroundFill_0, {
                            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
                        }), 
                        Mask = v69 and v3.createElement("ImageLabel", {
                            ZIndex = 2, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundColor3 = Color3.new(0, 0, 0), 
                            BackgroundTransparency = 0.5
                        })
                    });
                end
            }, {
                UserInputSink = l_isSignUpInProgress_0 and v3.createElement("ImageButton", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = ""
                }), 
                Container = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 1, -v67), 
                    Position = UDim2.new(0.5, 0, 0, v68), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(9, 9, 9, 9), 
                    Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                    ImageColor3 = v79.Theme.BackgroundUIDefault.Color, 
                    ClipsDescendants = true
                }, {
                    SizeConstraint = v3.createElement("UISizeConstraint", {
                        MaxSize = v37
                    }), 
                    HeaderFrame = v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 48), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundTransparency = 1
                    }, {
                        BackButton = v3.createElement(l_ImageSetButton_0, {
                            Size = v38, 
                            AutoButtonColor = false, 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(0, 12, 0.5, 0), 
                            AnchorPoint = Vector2.new(0, 0.5), 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = v39, 
                            ImageColor3 = v79.Theme.UIEmphasis.Color, 
                            ImageTransparency = v79.Theme.BackgroundUIDefault.Transparency, 
                            [v3.Event.Activated] = v66.props.navigateBack
                        }), 
                        Title = v80.signUpText and v3.createElement("TextLabel", {
                            Position = UDim2.new(0, 0, 0.5, 0), 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0, 0.5), 
                            BackgroundTransparency = 1, 
                            Text = v80.signUpText or "", 
                            TextWrapped = true, 
                            Font = v79.Font.CaptionHeader.Font, 
                            TextSize = v79.Font.BaseSize * v79.Font.Header1.RelativeSize, 
                            TextColor3 = v79.Theme.TextEmphasis.Color, 
                            TextTransparency = v79.Theme.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Center
                        })
                    }), 
                    Divider = v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        Position = UDim2.new(0.5, 0, 0, 48), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v79.Theme.UIEmphasis.Color
                    }), 
                    ContentFrame = v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, -49), 
                        Position = UDim2.new(0.5, 0, 0, 49), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        ContentPadding = v3.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 24), 
                            PaddingRight = UDim.new(0, 24), 
                            PaddingTop = UDim.new(0, v69 and 25 or 48)
                        }), 
                        ListLayout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 5)
                        }), 
                        BirthdayBar = v3.createElement(v24, {
                            layoutOrder = 1, 
                            onBirthdaySelected = v66.onBirthdaySelected, 
                            autoFocusOnMount = false
                        }), 
                        DisplayNameValidator = v3.createElement(v25, {
                            layoutOrder = 2, 
                            titleTextKey = "Authentication.Login.Label.Username", 
                            summaryErrorTextKey = v77, 
                            prerequisiteMet = l_birthday_1 and true or false, 
                            onInputTextChanged = v66.onDisplaynameTextChanged, 
                            onInputTextValidated = v66.onDisplayNameTextChanged, 
                            validator = v32, 
                            validatorAdditionalProps = {
                                birthday = l_birthday_1 and l_birthday_1:FormatForEndpoint() or ""
                            }, 
                            returnKeyType = Enum.ReturnKeyType.Next, 
                            prefilledText = l_prefilledDisplayName_0
                        }), 
                        GenderSelector = v3.createElement(v26, {
                            layoutOrder = 3, 
                            gender = l_gender_1, 
                            onGenderChanged = v66.onGenderChanged
                        }), 
                        Spacing = v3.createElement("Frame", {
                            LayoutOrder = 4, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 38)
                        }), 
                        SignUpButton = v3.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimaryContextual, 
                            layoutOrder = 5, 
                            size = UDim2.new(1, 0, 0, 36), 
                            text = v80.signUpText, 
                            isDisabled = not v76, 
                            isLoading = l_isSignUpInProgress_0, 
                            onActivated = v66.onSignUpClick
                        })
                    })
                })
            });
        end);
    end);
end;
v40 = v4.connect(function(v81, _) --[[ Line: 393 ]]
    return {
        formFactor = v81.FormFactor, 
        isSignUpInProgress = v81.Luobu.SignUp.signUpInProgress, 
        prefilledDisplayName = v81.Luobu.SignUp.prefilledDisplayName, 
        voucher = v81.Luobu.SignUp.signUpVoucher, 
        authMethod = v81.Luobu.SignUp.authMethod, 
        channelId = v81.Luobu.SignUp.channelId, 
        agreedUserAgreements = v81.Luobu.SignUp.agreedUserAgreements
    };
end, function(v83) --[[ Line: 403 ]]
    -- upvalues: v34 (copy), v35 (copy), v31 (copy), v36 (copy), v33 (copy)
    return {
        setSignUpInProgress = function(v84) --[[ Line: 405 ]] --[[ Name: setSignUpInProgress ]]
            -- upvalues: v83 (copy), v34 (ref)
            return v83(v34(v84));
        end, 
        resetSignUpInfo = function() --[[ Line: 408 ]] --[[ Name: resetSignUpInfo ]]
            -- upvalues: v83 (copy), v35 (ref)
            return v83(v35("", "", "", ""));
        end, 
        navigateBack = function() --[[ Line: 411 ]] --[[ Name: navigateBack ]]
            -- upvalues: v83 (copy), v31 (ref)
            return v83(v31());
        end, 
        setBackNavigationDisabled = function(v85) --[[ Line: 414 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v83 (copy), v36 (ref)
            return v83(v36(v85));
        end, 
        requestSignUp = function(v86, v87, v88, v89, v90) --[[ Line: 417 ]] --[[ Name: requestSignUp ]]
            -- upvalues: v83 (copy), v33 (ref)
            return v83(v33(v86, v87, v88, v89, v90));
        end
    };
end)(v40);
v40 = l_RoactServices_0.connect({
    networking = v8, 
    authEventAnalytics = v5, 
    analytics = v6
})(v40);
return (l_RoactAppPolicy_0.connect(function(v91, _) --[[ Line: 429 ]]
    return {
        appPolicy = v91
    };
end)(v40));