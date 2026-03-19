local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.AppBlox);
local v5 = require(l_Parent_0.AuthAnalytics);
local v6 = require(l_Parent_0.AuthCommon);
local v7 = require(l_Parent_0.FitFrame);
local v8 = require(l_Parent_0.Cryo);
local v9 = require(l_Parent_0.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_Parent_0.ExperimentLayers).AppBtidLayers;
local v11 = require(l_script_FirstAncestor_0.Enums.AuthenticationMethodType);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_FullscreenPageWithSafeArea_0 = v4.FullscreenPageWithSafeArea;
local v16 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v16.Core.Style.useStyle;
local l_IconButton_0 = v16.App.Button.IconButton;
local l_Images_0 = v16.App.ImageSet.Images;
local l_Toast_0 = v16.App.Dialog.Toast;
local l_StyledTextLabel_0 = v16.App.Text.StyledTextLabel;
local v23 = require(l_script_FirstAncestor_0.Components.AuthenticationMethod);
local v24 = require(l_script_FirstAncestor_0.Components.NeedHelpButton);
local v25 = require(l_script_FirstAncestor_0.Components.UserIdentifierHeading);
local v26 = require(l_script_FirstAncestor_0.Enums.UserIdentifierType);
local v27 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v28 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v29 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local l_authFormInteraction_0 = v5.Events.authFormInteraction;
local l_authPageload_0 = v5.Events.authPageload;
local l_authButtonClick_0 = v5.Events.authButtonClick;
local l_EventStreamConstants_0 = v5.EventStreamConstants;
local l_GetUserByUsername_0 = v6.Thunks.GetUserByUsername;
local v35 = game:DefineFastFlag("FixAuthScreenOrDividerOrder", false);
AuthenticationScreen = function(v36) --[[ Line: 55 ]] --[[ Name: AuthenticationScreen ]]
    -- upvalues: v3 (copy), v28 (copy), l_useDesignTokens_0 (copy), l_useStyle_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v9 (copy), l_AppBtidLayers_0 (copy), v29 (copy), v27 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_HttpService_0 (copy), v26 (copy), l_GetUserByUsername_0 (copy), v8 (copy), v11 (copy), l_authFormInteraction_0 (copy), l_authButtonClick_0 (copy), l_useLocalization_0 (copy), v23 (copy), v35 (copy), l_StyledTextLabel_0 (copy), l_Images_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_Toast_0 (copy), v7 (copy), l_IconButton_0 (copy), v25 (copy), v24 (copy)
    local v37 = v3.useContext(v28);
    local l_state_0 = v37.state;
    local l_utils_0 = v37.utils;
    local v40 = l_useDesignTokens_0();
    local v41 = l_useStyle_0();
    local v42 = l_useRoactService_0(l_RoactNetworking_0);
    local v43, v44 = v3.useState(nil);
    local v45, v46 = v3.useState(nil);
    local v47 = v3.useRef(nil);
    local v49 = v9.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.LoginLayer
    }, function(v48) --[[ Line: 70 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldFilterCredentialsForPrefill = (v48[l_AppBtidLayers_0.LoginLayer] or {}).shouldFilterCredentialsForPrefill or false
        };
    end);
    local function v51(v50) --[[ Line: 78 ]]
        -- upvalues: v37 (copy), v29 (ref), v27 (ref)
        v37.dispatch({
            type = v29.SetComponentState, 
            data = {
                component = v27.AuthenticationScreen, 
                payload = v50
            }
        });
    end;
    local function v53(v52) --[[ Line: 88 ]]
        -- upvalues: v37 (copy), v29 (ref), v27 (ref)
        v37.dispatch({
            type = v29.SetComponentState, 
            data = {
                component = v27.LoginScreenV2, 
                payload = v52
            }
        });
    end;
    local v54 = l_state_0 and l_state_0.componentState[v27.AuthenticationScreen].errorType or nil;
    local v55 = l_state_0 and l_state_0.componentState[v27.AuthenticationScreen].errorKey or "";
    local function v57(v56) --[[ Line: 101 ]]
        -- upvalues: v51 (copy)
        v51({
            errorKey = v56
        });
    end;
    local function _(v58) --[[ Line: 109 ]]
        -- upvalues: v51 (copy)
        v51({
            errorType = v58
        });
    end;
    local function _(v60) --[[ Line: 115 ]]
        -- upvalues: v51 (copy)
        v51({
            password = v60
        });
    end;
    local function v63(v62) --[[ Line: 121 ]]
        -- upvalues: v37 (copy), v29 (ref), v27 (ref)
        v37.dispatch({
            type = v29.SetComponentState, 
            data = {
                component = v27.EmailOtpScreen, 
                payload = {
                    sessionToken = v62
                }
            }
        });
    end;
    local function _(v64) --[[ Line: 133 ]]
        -- upvalues: v63 (copy), v36 (copy), v27 (ref)
        v63(v64);
        v36.navigation.navigate(v27.EmailOtpScreen);
    end;
    local function _() --[[ Line: 138 ]]
        -- upvalues: v53 (copy)
        v53({
            userIdentifier = "", 
            shouldAttemptCredentialPrefill = false
        });
    end;
    local v67 = l_state_0 and l_state_0.userIdentifier or "";
    local v68, v69 = v3.useState(false);
    v3.useEffect(function() --[[ Line: 151 ]]
        -- upvalues: l_utils_0 (copy), l_state_0 (copy), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_HttpService_0 (ref)
        local v70 = {
            isAuthenticated = l_utils_0.isUserAuthenticated(), 
            userIdentifierType = l_state_0.userIdentifierType, 
            authenticationMethods = table.concat(l_state_0.availableLoginMethods, ",")
        };
        l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_HttpService_0:JSONEncode(v70));
    end, {});
    v3.useEffect(function() --[[ Line: 161 ]]
        -- upvalues: l_state_0 (copy), v26 (ref), l_GetUserByUsername_0 (ref), v42 (copy), v67 (copy), v44 (copy), v46 (copy)
        if l_state_0.userIdentifierType == v26.Username then
            l_GetUserByUsername_0(v42, v67)():andThen(function(v71) --[[ Line: 164 ]]
                -- upvalues: v44 (ref), v46 (ref)
                v44(v71.id);
                v46(v71.displayName);
            end):catch(function(_) --[[ Line: 167 ]]

            end);
        end;
    end, {});
    local v73 = {
        setInProgress = v69, 
        setErrorKey = v57, 
        navigation = v36.navigation, 
        isLoginByOtp = false, 
        eventContext = l_EventStreamConstants_0.Context.LoginFormV2Auth
    };
    local v74 = v8.Dictionary.join(v73, {
        onCredentialsPopupAbandoned = function() --[[ Line: 184 ]] --[[ Name: onCredentialsPopupAbandoned ]]
            -- upvalues: v47 (copy)
            spawn(function() --[[ Line: 185 ]]
                -- upvalues: v47 (ref)
                wait(0.1);
                if v47.current then
                    v47.current.focus();
                end;
            end);
        end
    });
    local v75 = l_state_0 and l_state_0.credentialsProtocolStatus.shouldShowAuthScreenCredentialsPopup;
    local v76 = l_state_0 and l_state_0.credentialsProtocolStatus.shouldShowAuthScreenUserSpecificPasskeyPopup;
    v3.useEffect(function() --[[ Line: 203 ]]
        -- upvalues: v75 (copy), l_state_0 (copy), l_utils_0 (copy), v49 (copy), v74 (copy), v37 (copy), v29 (ref), v76 (copy), v8 (ref), v11 (ref), v47 (copy)
        if v75 then
            local v77 = l_state_0 and l_state_0.credentialsProtocolStatus.fido2Supported;
            local v78 = l_state_0 and l_state_0.credentialsProtocolStatus.passwordsSupported;
            if l_state_0 and l_state_0.credentialsProtocolStatus.v2InterfaceSupported then
                l_utils_0.showGenericCredentialLoginPopup(v77, v78, v49.shouldFilterCredentialsForPrefill, v74);
            elseif v77 then
                l_utils_0.showPasskeyLoginPopup(v74, v49.shouldFilterCredentialsForPrefill, true);
            end;
            v37.dispatch({
                type = v29.UpdateCredentialsProtocolStatus, 
                data = {
                    shouldShowAuthScreenCredentialsPopup = false, 
                    shouldShowAuthScreenUserSpecificPasskeyPopup = false
                }
            });
            return;
        elseif v76 and v8.List.find(l_state_0.availableLoginMethods, v11.Passkey) ~= nil then
            if l_state_0.credentialsProtocolStatus.fido2Supported then
                l_utils_0.showPasskeyLoginPopup(v74, true, true);
            end;
            v37.dispatch({
                type = v29.UpdateCredentialsProtocolStatus, 
                data = {
                    shouldShowAuthScreenUserSpecificPasskeyPopup = false
                }
            });
            return;
        else
            if v47.current then
                v47.current.focus();
            end;
            return;
        end;
    end, {});
    local v86 = {
        [v11.Password] = function(v79) --[[ Line: 253 ]]
            -- upvalues: v69 (copy), v11 (ref), v51 (copy), l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref), l_authButtonClick_0 (ref), l_utils_0 (copy), v73 (copy)
            if v79 ~= "" then
                v69(true);
                local l_Password_0 = v11.Password;
                v51({
                    errorType = l_Password_0
                });
                v51({
                    errorKey = ""
                });
                l_authFormInteraction_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Field.Password, nil, nil, nil);
                l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Button.Password, nil, nil);
                l_utils_0.handleLoginWithFormData(nil, v79, nil, nil, nil, false, v73);
            end;
        end, 
        [v11.Passkey] = function(_) --[[ Line: 275 ]]
            -- upvalues: v11 (ref), v51 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_utils_0 (copy), v73 (copy)
            local l_Passkey_0 = v11.Passkey;
            v51({
                errorType = l_Passkey_0
            });
            v51({
                errorKey = ""
            });
            l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Button.Passkey, nil, nil);
            l_utils_0.showPasskeyLoginPopup(v73, true, false);
        end, 
        [v11.EmailOtp] = function(_) --[[ Line: 286 ]]
            -- upvalues: v69 (copy), v11 (ref), v51 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v63 (copy), v36 (copy), v27 (ref), l_utils_0 (copy), v73 (copy)
            v69(true);
            local l_EmailOtp_0 = v11.EmailOtp;
            v51({
                errorType = l_EmailOtp_0
            });
            v51({
                errorKey = ""
            });
            l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Button.EmailOtp, nil, nil);
            l_EmailOtp_0 = function(v85) --[[ Line: 297 ]]
                -- upvalues: v69 (ref), v63 (ref), v36 (ref), v27 (ref)
                v69(false);
                v63(v85);
                v36.navigation.navigate(v27.EmailOtpScreen);
            end;
            l_utils_0.handleSendEmailOtp(l_EmailOtp_0, v73);
        end
    };
    local v87 = l_useLocalization_0({
        toastErrorText = v55 ~= "" and v54 ~= v11.Password and v55 or nil, 
        signInHeadingText = "Authentication.Login.Heading.SignIn", 
        passkeyDescriptionText = "Authentication.Login.Description.PasskeyDescription", 
        passkeyLoginIncompatibleText = "Authentication.Login.Description.PasskeyLoginIncompatibleDevice", 
        orText = "Authentication.SignUp.Description.Or"
    });
    local v94 = (function(v88) --[[ Line: 313 ]]
        -- upvalues: l_state_0 (copy), v8 (ref), v11 (ref), v3 (ref), v23 (ref), v35 (ref), v86 (copy), v68 (copy), v69 (copy), v47 (copy), v40 (copy), l_StyledTextLabel_0 (ref), v87 (copy), v41 (copy)
        if not l_state_0.credentialsProtocolStatus.fido2Supported and #v88 > 1 and v8.List.find(v88, v11.Passkey) ~= nil then
            v88 = v8.List.filter(v88, function(v89) --[[ Line: 320 ]]
                -- upvalues: v11 (ref)
                return v89 ~= v11.Passkey;
            end);
        end;
        local v90 = false;
        if #v88 > 1 then
            v90 = v88[1] == v11.Password;
        end;
        local v93 = v8.List.map(v88, function(v91, v92) --[[ Line: 326 ]]
            -- upvalues: v3 (ref), v23 (ref), v35 (ref), v90 (copy), v86 (ref), v68 (ref), v69 (ref), v47 (ref)
            return v3.createElement(v23, {
                layoutOrder = if v35 and v90 and v92 > 1 then v92 + 1 else v92, 
                isFirstItemInList = v92 == 1, 
                authMethod = v91, 
                onSubmit = v86[v91], 
                isLoginInProgress = v68, 
                setIsLoginInProgress = v69, 
                textBoxRef = v47
            });
        end);
        if v35 and v90 or not v35 and #v88 > 1 and v88[1] == v11.Password then
            table.insert(v93, v3.createElement("Frame", {
                LayoutOrder = v35 and 2 or 1.5, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v40.Global.Space_100), 
                    PaddingBottom = UDim.new(0, v40.Global.Space_200)
                }), 
                ListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                DividerText = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v87.orText, 
                    fontStyle = v41.Font.Header2, 
                    colorStyle = v41.Theme.TextDefault, 
                    textXAlignment = Enum.TextXAlignment.Center
                })
            }));
            return v93;
        else
            if #v88 == 1 and v88[1] == v11.Passkey then
                table.insert(v93, v3.createElement("Frame", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, v40.Global.Space_200)
                    }), 
                    TextLabel = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 0, 
                        text = if l_state_0.credentialsProtocolStatus.fido2Supported then v87.passkeyDescriptionText else v87.passkeyLoginIncompatibleText, 
                        fontStyle = v41.Font.Body, 
                        colorStyle = v41.Theme.TextDefault, 
                        automaticSize = Enum.AutomaticSize.XY, 
                        fluidSizing = true, 
                        lineHeight = 1
                    })
                }));
            end;
            return v93;
        end;
    end)(l_state_0.availableLoginMethods);
    local v95 = v3.useMemo(function() --[[ Line: 411 ]]
        -- upvalues: v87 (copy), l_Images_0 (ref), v40 (copy)
        return {
            toastTitle = v87.toastErrorText, 
            iconImage = l_Images_0["icons/status/error_large"], 
            iconSize = Vector2.new(v40.Global.Size_300, v40.Global.Size_300), 
            iconColorStyle = {
                Color = v40.Global.Color.Red.Color3, 
                Transparency = 0
            }
        };
    end, {
        v87.toastErrorText
    });
    local v96 = false;
    if #l_state_0.availableLoginMethods == 1 then
        v96 = l_state_0.availableLoginMethods[1] == v11.Password;
    end;
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v41.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v40.Global.Space_100), 
            PaddingBottom = UDim.new(0, v40.Global.Space_100), 
            PaddingLeft = UDim.new(0, v40.Global.Space_100), 
            PaddingRight = UDim.new(0, v40.Global.Space_100)
        }), 
        ErrorToastFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0.5, 0), 
            ZIndex = 100
        }, {
            ErrorToast = v87.toastErrorText and v3.createElement(l_Toast_0, {
                toastContent = v95, 
                duration = 3
            })
        }), 
        Wrapper = v3.createElement(v7.FitFrameVertical, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
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
                    onActivated = function() --[[ Line: 464 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v51 (copy), v53 (copy), v36 (copy), v27 (ref)
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Button.Back);
                        v51({
                            errorKey = ""
                        });
                        v51({
                            errorType = nil
                        });
                        v51({
                            password = ""
                        });
                        v53({
                            userIdentifier = "", 
                            shouldAttemptCredentialPrefill = false
                        });
                        v36.navigation.navigate(v27.LoginScreenV2);
                    end, 
                    size = UDim2.new(0, 36, 0, 36), 
                    isDisabled = v68
                }), 
                SignInHeadingFrame = v3.createElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AutomaticSize = Enum.AutomaticSize.X
                }, {
                    SignInHeadingText = v3.createElement(l_StyledTextLabel_0, {
                        text = v87.signInHeadingText, 
                        fontStyle = v41.Font.Header1, 
                        colorStyle = v41.Theme.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Center
                    })
                })
            }), 
            ButtonSpacing = v3.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v40.Global.Space_100), 
                BackgroundTransparency = 1
            }), 
            Content = v3.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v40.Global.Space_100), 
                    PaddingRight = UDim.new(0, v40.Global.Space_100), 
                    PaddingBottom = UDim.new(0, v40.Global.Space_200), 
                    PaddingTop = UDim.new(0, v40.Global.Space_200)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v40.Global.Space_20)
                }), 
                Heading = v3.createElement(v25, {
                    layoutOrder = 1, 
                    userIdentifier = v67, 
                    userId = v43, 
                    displayName = v45
                }), 
                AuthenticationComponents = v3.createElement(v7.FitFrameVertical, {
                    LayoutOrder = 2, 
                    width = UDim.new(1, 0), 
                    BackgroundTransparency = 1
                }, v94), 
                HelpButtonFrame = v3.createElement("Frame", {
                    LayoutOrder = 3, 
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
                        isDisabled = v68, 
                        originPage = l_EventStreamConstants_0.Context.LoginFormV2Auth, 
                        textKey = v96 and "Authentication.Login.Label.ForgotYourPassword" or "Authentication.Login.Label.TroubleSigningIn", 
                        identifierAutofill = v67
                    })
                })
            })
        })
    });
end;
return AuthenticationScreen;