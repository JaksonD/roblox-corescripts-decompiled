local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.AppBlox);
local v5 = require(l_Parent_0.AuthAnalytics);
local v6 = require(l_Parent_0.OtpLogin);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_authPageload_0 = v5.Events.authPageload;
local l_authButtonClick_0 = v5.Events.authButtonClick;
local l_EventStreamConstants_0 = v5.EventStreamConstants;
local l_FullscreenPageWithSafeArea_0 = v4.FullscreenPageWithSafeArea;
local v12 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v12.Core.Style.useStyle;
local l_IconButton_0 = v12.App.Button.IconButton;
local l_Images_0 = v12.App.ImageSet.Images;
local l_StyledTextLabel_0 = v12.App.Text.StyledTextLabel;
local l_TextInput_0 = require(l_Parent_0.Foundation).TextInput;
local v19 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v20 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v21 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local v22 = require(l_script_FirstAncestor_0.Components.UserIdentifierHeading);
local v23 = require(l_script_FirstAncestor_0.Components.ResendEmailOtpButton);
local v24 = require(l_script_FirstAncestor_0.Components.NeedHelpButton);
local l_Constants_0 = v6.Constants;
EmailOtpScreen = function(v26) --[[ Line: 43 ]] --[[ Name: EmailOtpScreen ]]
    -- upvalues: v3 (copy), v20 (copy), l_useDesignTokens_0 (copy), l_useStyle_0 (copy), v21 (copy), v19 (copy), l_EventStreamConstants_0 (copy), l_useLocalization_0 (copy), l_authButtonClick_0 (copy), l_UserInputService_0 (copy), l_authPageload_0 (copy), l_Constants_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_StyledTextLabel_0 (copy), v22 (copy), l_TextInput_0 (copy), v23 (copy), v24 (copy)
    local v27 = v3.useContext(v20);
    local v28 = l_useDesignTokens_0();
    local v29 = l_useStyle_0();
    local l_state_0 = v27.state;
    local l_utils_0 = v27.utils;
    local v32, v33 = v3.useState(false);
    local v34 = l_state_0 and l_state_0.userIdentifier or "";
    local function v36(v35) --[[ Line: 54 ]]
        -- upvalues: v27 (copy), v21 (ref), v19 (ref)
        v27.dispatch({
            type = v21.SetComponentState, 
            data = {
                component = v19.EmailOtpScreen, 
                payload = v35
            }
        });
    end;
    local v37 = l_state_0 and l_state_0.componentState[v19.EmailOtpScreen].sessionToken or "";
    local function _(v38) --[[ Line: 65 ]]
        -- upvalues: v36 (copy)
        v36({
            sessionToken = v38
        });
    end;
    local v40 = l_state_0 and l_state_0.componentState[v19.EmailOtpScreen].emailOtp or "";
    local function _(v41) --[[ Line: 72 ]]
        -- upvalues: v36 (copy)
        v36({
            emailOtp = v41
        });
    end;
    local v43, v44 = v3.useState(v40);
    local v45 = l_state_0 and l_state_0.componentState[v19.EmailOtpScreen].errorKey or "";
    local function v47(v46) --[[ Line: 81 ]]
        -- upvalues: v36 (copy)
        v36({
            errorKey = v46
        });
    end;
    local function _(v48) --[[ Line: 87 ]]
        -- upvalues: v44 (copy)
        v44(v48);
    end;
    local v50 = {
        setInProgress = v33, 
        setErrorKey = v47, 
        navigation = v26.navigation, 
        isLoginByOtp = true, 
        eventContext = l_EventStreamConstants_0.Context.LoginFormV2EmailOtp
    };
    local v51 = l_useLocalization_0({
        emailOtpLabelText = "Authentication.Login.Label.EnterOneTimeCodeLoginHelp", 
        signInHeadingText = "Authentication.Login.Heading.SignIn", 
        errorText = if v45 ~= "" then v45 else nil
    });
    local function v53() --[[ Line: 106 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_utils_0 (copy), v37 (copy), v36 (copy), v50 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2EmailOtp, l_EventStreamConstants_0.Button.ResendCode, nil, nil);
        l_utils_0.handleResendEmailOtp(v37, function(v52) --[[ Line: 113 ]]
            -- upvalues: v36 (ref)
            v36({
                sessionToken = v52
            });
        end, v50);
    end;
    local function _() --[[ Line: 118 ]]
        -- upvalues: l_UserInputService_0 (ref)
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
    end;
    v3.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2EmailOtp);
    end, {});
    v3.useEffect(function() --[[ Line: 130 ]]
        -- upvalues: v43 (copy), l_Constants_0 (ref), v33 (copy), l_UserInputService_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v36 (copy), l_utils_0 (copy), v37 (copy), v50 (copy)
        if #v43 == l_Constants_0.DEFAULT_CODE_LENGTH then
            v33(true);
            local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
            if l_l_UserInputService_0_FocusedTextBox_1 then
                l_l_UserInputService_0_FocusedTextBox_1:ReleaseFocus();
            end;
            l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2EmailOtp, l_EventStreamConstants_0.Button.OtpSubmit, nil, nil);
            v36({
                emailOtp = v43
            });
            l_utils_0.handleLoginWithOtp(v37, v43, nil, nil, v50):finally(function() --[[ Line: 141 ]]
                -- upvalues: v36 (ref)
                v36({
                    emailOtp = ""
                });
            end);
        end;
    end, {
        v43
    });
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v29.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v28.Global.Space_100), 
            PaddingLeft = UDim.new(0, v28.Global.Space_100), 
            PaddingRight = UDim.new(0, v28.Global.Space_100), 
            PaddingBottom = UDim.new(0, v28.Global.Space_100)
        }), 
        Wrapper = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Header = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                BackButton = v3.createElement(l_IconButton_0, {
                    layoutOrder = 1, 
                    icon = l_Images_0["icons/actions/cycleLeft"], 
                    onActivated = function() --[[ Line: 175 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v36 (copy), v26 (copy), v19 (ref)
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2EmailOtp, l_EventStreamConstants_0.Button.Back);
                        v36({
                            errorKey = ""
                        });
                        v36({
                            emailOtp = ""
                        });
                        v36({
                            sessionToken = ""
                        });
                        v26.navigation.navigate(v19.AuthenticationScreen);
                    end, 
                    size = UDim2.new(0, 36, 0, 36), 
                    isDisabled = v32
                }), 
                SignInHeadingFrame = v3.createElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AutomaticSize = Enum.AutomaticSize.X
                }, {
                    SignInHeadingText = v3.createElement(l_StyledTextLabel_0, {
                        text = v51.signInHeadingText, 
                        fontStyle = v29.Font.Header1, 
                        colorStyle = v29.Theme.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Center
                    })
                })
            }), 
            ButtonSpacing = v3.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v28.Global.Space_100), 
                BackgroundTransparency = 1
            }), 
            Content = v3.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v28.Global.Space_100), 
                    PaddingRight = UDim.new(0, v28.Global.Space_100), 
                    PaddingTop = UDim.new(0, v28.Global.Space_200)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v28.Global.Space_20)
                }), 
                Heading = v3.createElement(v22, {
                    layoutOrder = 1, 
                    userIdentifier = v34
                }), 
                OneTimeCodeLabel = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v51.emailOtpLabelText, 
                    fontStyle = v29.Font.Body, 
                    colorStyle = v29.Theme.TextEmphasis
                }), 
                EmailOtpTextField = v3.createElement(l_TextInput_0, {
                    LayoutOrder = 3, 
                    text = v40, 
                    label = "", 
                    width = UDim.new(1, 0), 
                    onChanged = function(v57) --[[ Line: 240 ]] --[[ Name: onChanged ]]
                        -- upvalues: v44 (copy)
                        v44(v57);
                    end, 
                    isDisabled = v32, 
                    textInputType = Enum.TextInputType.OneTimePassword
                }), 
                ErrorTextSpacing = v51.errorText and v3.createElement("Frame", {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v28.Global.Space_50), 
                    BackgroundTransparency = 1
                }), 
                ErrorTextLabel = v51.errorText and v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 5, 
                    text = v51.errorText, 
                    fontStyle = v29.Font.BodySmall, 
                    colorStyle = v29.Theme.Alert, 
                    automaticSize = Enum.AutomaticSize.XY, 
                    textWrapped = true
                }), 
                ButtonSpacing = v3.createElement("Frame", {
                    LayoutOrder = 6, 
                    Size = UDim2.new(1, 0, 0, v28.Global.Space_200), 
                    BackgroundTransparency = 1
                }), 
                ResendOtpButton = v3.createElement(v23, {
                    layoutOrder = 7, 
                    onPress = v53, 
                    isLoading = v32
                }), 
                HelpButtonFrame = v3.createElement("Frame", {
                    LayoutOrder = 8, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    HelpButton = v3.createElement(v24, {
                        layoutOrder = 1, 
                        isDisabled = v32, 
                        originPage = l_EventStreamConstants_0.Context.LoginFormV2Auth, 
                        textKey = "Authentication.Login.Action.NeedHelp", 
                        identifierAutofill = v34
                    })
                })
            })
        })
    });
end;
return EmailOtpScreen;