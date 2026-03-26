local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RobloxLocaleIdKey_0 = require(l_CorePackages_0.Workspace.Packages.Localization).RobloxLocaleIdKey;
local v11 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_usePreferredInput_0 = v11.usePreferredInput;
local l_useBreakpointXOrSmaller_0 = v11.useBreakpointXOrSmaller;
local v14 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v16 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v17 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v21 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v22 = require(script.Parent.Enum.DisplayNameCounters);
local v23 = require(l_CorePackages_0.Packages.Cryo);
local v24 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v25 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v25.App.Button.Button;
local l_ButtonType_0 = v25.App.Button.Enum.ButtonType;
local l_Constants_0 = v25.App.Style.Constants;
local l_withStyle_0 = v25.Style.withStyle;
local v30 = require(l_Modules_0.LuaApp.withLocalization);
local l_withNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).withNavigationProps;
local v32 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_DisclaimerLinksVariant_0 = v32.Enums.DisclaimerLinksVariant;
local v34 = require(l_Modules_0.LuaApp.Components.Authentication.UnderAgeInteractiveAlert);
local v35 = require(l_Modules_0.LuaApp.FitChildren);
local v36 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v37 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v38 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBirthdayBar);
local l_AuditContentContext_0 = v32.Stores.AuditContentContext.AuditContentContext;
local v40 = require(l_Modules_0.LuaApp.Components.Authentication.CollapsingTextInputValidator);
local v41 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpGenderSelector);
local v42 = require(l_Modules_0.LuaApp.Components.Authentication.TitleAndParagraph);
local v43 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v44 = require(l_Modules_0.LuaApp.Components.Authentication.ContactInfoField);
local v45 = require(l_Modules_0.LuaApp.Components.Authentication.Birthday.BirthdayField);
local l_BackgroundFill_0 = v32.Components.BackgroundFill;
local l_AccountLinkingAlertType_0 = v32.Enums.AccountLinkingAlertType;
local l_GetCredentialsAvailabilityStore_0 = v32.Stores.GetCredentialsAvailabilityStore;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v50 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v51 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local l_useSignUpPageNavigationBindings_0 = v32.Hooks.useSignUpPageNavigationBindings;
local v53 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v54 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v55 = require(l_Modules_0.LuaApp.Thunks.Authentication.UsernameValidator);
local v56 = require(l_Modules_0.LuaApp.Thunks.Authentication.PasswordValidator);
local v57 = require(l_Modules_0.LuaApp.Thunks.Authentication.AuthIntent.GetMetaDataFromShareLink);
local v58 = require(l_Modules_0.LuaApp.Thunks.Authentication.AuthIntent.ApiFetchAuthMetaData);
local v59 = require(l_Modules_0.LuaApp.Thunks.Authentication.SignUpV2);
local v60 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v61 = require(script.Parent.Parent.Parent.Thunks.Authentication.User);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v63 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v64 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v65 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitchingErrorOverlay);
local v66 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v67 = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.LogoutAllLoggedInUsers);
local v68 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v69 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v70 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local v71 = require(l_Modules_0.LuaApp.Flags.FFlagBypassIXPKoreaCompliance);
local v72 = require(l_Modules_0.LuaApp.Flags.FFlagBypassGUACKoreaCompliance);
local v73 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenKISAPopUpAgreements);
local l_KISAComplianceUtils_0 = require(l_CorePackages_0.Workspace.Packages.AuthCompliance).KISAComplianceUtils;
local l_AnalyticsEvents_0 = require(l_CorePackages_0.Workspace.Packages.AuthCompliance).Analytics.AnalyticsEvents;
local l_EventConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthCompliance).Analytics.EventConstants;
local v77 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenEmailOtp);
local l_ValidateCode_0 = require(l_CorePackages_0.Workspace.Packages.OtpLogin).Thunks.ValidateCode;
local l_Constants_1 = require(l_CorePackages_0.Workspace.Packages.OtpLogin).Constants;
local v80 = require(l_CorePackages_0.Packages.Promise);
local l_ImageSetLabel_0 = v25.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_Images_0 = v25.App.ImageSet.Images;
local l_ImageSetButton_0 = v25.Core.ImageSet.ImageSetButton;
local l_Birthday_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Models.Birthday;
local l_DateHelper_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateHelper;
local v87 = require(l_Modules_0.LuaApp.Enum.UsernameValidationContext);
local v88 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v89 = require(l_Modules_0.LuaApp.Constants);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v91 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.CredentialType);
local v92 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.UserGender);
local v93 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.SignUpV2ErrorCodes);
local v94 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.InputValidity);
local v95 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.VerifiedSignupErrorCodes);
local v96 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.UsernameIssue);
local v97 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.IssueCondition);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local v102 = require(l_CorePackages_0.Packages.Foundation);
local l_Checkbox_0 = v102.Checkbox;
local l_InputSize_0 = v102.Enums.InputSize;
local l_View_0 = v102.View;
local l_Text_0 = v102.Text;
local l_useTokens_0 = v102.Hooks.useTokens;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_GetFFlagEnableTextFieldContentType_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType;
local v110 = require(l_Modules_0.LuaApp.Flags.GetFFlagMinimalSignupAuthEnabled);
local v111 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasswordlessSignupAuthEnabled);
local v112 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasskeySignupEnabled);
local l_FFlagFoundationStylingOnSignUp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFoundationStylingOnSignUp;
local v114 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingAtSignupEnabled);
local v115 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingAtSignupButtonClickEnabled);
local v116 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingForShareLinkMetadataAtSignupButtonClickEnabled);
local v117 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaLoginGenderSelector);
local v118 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingForGameJoinEnabled);
local v119 = require(l_Modules_0.LuaApp.Flags.GetFFlagIsAltAttemptLoggingAtSignup);
local v120 = require(l_Modules_0.LuaApp.Flags.FFlagKoreaKISAUnderAgeNumber);
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v122 = require(l_Modules_0.LuaApp.Flags.GetFFlagCredProtocolRegisterPasswordOnSignup);
local v123 = game:DefineFastFlag("UsePackageFetchSignupUserAgreements", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAndroidPasswordSuggestion");
local v125 = require(l_Modules_0.LuaApp.Flags.GetFFlagUsernameSuggestionRefreshButtonEnabled);
local v126 = require(l_Modules_0.LuaApp.Components.Authentication.SuggestionsFrame);
local v127 = require(l_Modules_0.LuaApp.Thunks.Authentication.UsernameSuggestor);
local v128 = {
    suggestionsShown = "usernameSuggestionsShown", 
    suggestableInput = "suggestableUsernameInput", 
    refreshButton = "usernameSuggestionRefreshButton"
};
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v130 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenCentralOverlayForAgreeToPhoneNumberVerification);
local v131 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenCentralOverlayForPhoneNumberVerification);
local v132 = require(l_Modules_0.LuaApp.Thunks.Authentication.GetVerifiedSignupChallenge);
local v133 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v134 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v135 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v136 = if v123 then require(l_CorePackages_0.Workspace.Packages.UserAgreements).FetchSignupUserAgreements else require(l_Modules_0.LuaApp.Http.Requests.FetchSignupUserAgreements);
local v137 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local l_UserAgreementsCounterNames_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementsCounterNames;
local v139 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpPageView);
local v140 = require(l_Modules_0.LuaApp.Components.Authentication.DisplayNameField);
local v141 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSignupBirthdayExperiments);
local v142 = game:DefineFastFlag("DisplayNamesOnSignupExperiment_v3", false);
local v143 = game:DefineFastFlag("MoveCredentialsProtocolCheckToDidMount", false);
local v144 = game:DefineFastFlag("HideUsernameAutofillSignupExperiment", false);
local v145 = game:DefineFastFlag("EnableDisplayNamesOnSignupExperimentv1_Dev", false);
local v146 = game:DefineFastInt("DisplayNameEligabilityAgeYears", 17);
local v147 = game:DefineFastFlag("DisplayNamesDiagLogging", false);
local v148 = require(l_Modules_0.LuaApp.Components.Authentication.Flags.FFlagSignupDisplayNameLogging);
local v149 = game:DefineFastFlag("DisablePasskeySignupForLuaDeepLinks", false);
local l_FFlagEnableAuthDeepLinkReceiver_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAuthDeepLinkReceiver;
local l_PreAuthDeepLinkUrlStore_0 = v32.Stores.PreAuthDeepLinkUrlStore;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local v153 = require(l_Modules_0.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance);
local l_GetFFlagEnablePreferredInputForSignUp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePreferredInputForSignUp;
local l_FFlagEnableSignUpExitModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSignUpExitModal;
local v156 = game:DefineFastFlag("FixSignUpConditionalHooks", false);
local l_FFlagHideBackButtonOnSignUpPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideBackButtonOnSignUpPage;
local l_FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp;
local l_FFlagUseBirthdayDropdownForGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseBirthdayDropdownForGamepad;
local v160 = game:DefineFastFlag("SignUpPageThemeSwitchFix", false);
local v161 = game:DefineFastFlag("UseBreakpointOnSignUp", false);
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign;
local l_GetFFlagEnableAuditForSinglePageSignUp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp;
local l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSignupFoundationalizeBackgroundAndText;
local v165 = game:DefineFastFlag("UseLongFormSignupComplianceTextByDefault", false);
local v166 = UDim2.new(0, 36, 0, 36);
local v167 = l_Images_0["icons/navigation/close"];
local v168 = Vector2.new(540, 1080);
game:DefineFastFlag("LuaVerifiedSignup2", false);
game:DefineFastFlag("LuaVerifiedSignupExperiment2", false);
game:DefineFastFlag("CheckSignupValidityOnRender", false);
local v169 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppSignUpPageRefactor);
local v170 = v7.PureComponent:extend("SinglePageSignUp");
v170.init = function(v171) --[[ Line: 266 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp_0 (copy), l_GetCredentialsAvailabilityStore_0 (copy), v94 (copy), v92 (copy), v7 (copy), v60 (copy), v61 (copy), v64 (copy), l_MemStorageService_0 (copy), v63 (copy), v67 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_GuiService_0 (copy), v160 (copy), v153 (copy), v70 (copy), v72 (copy), v71 (copy), l_AnalyticsEvents_0 (copy), l_EventConstants_0 (copy), l_KISAComplianceUtils_0 (copy), v23 (copy), v110 (copy), v111 (copy), v112 (copy), v141 (copy), v142 (copy), l_FFlagUseBirthdayDropdownForGamepad_0 (copy), v88 (copy), v24 (copy), l_Birthday_0 (copy), l_DateHelper_0 (copy), v128 (copy), v96 (copy), v97 (copy), v148 (copy), v132 (copy), v91 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v149 (copy), v122 (copy), v95 (copy), v93 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), v89 (copy), l_AccountLinkingAlertType_0 (copy), v115 (copy), v116 (copy), v57 (copy), l_HttpService_0 (copy), v118 (copy), l_ExperienceService_0 (copy), v147 (copy), v137 (copy), v22 (copy), l_UserAgreementsCounterNames_0 (copy), v120 (copy), v125 (copy), v146 (copy), l_Constants_1 (copy), l_ValidateCode_0 (copy), v80 (copy), v143 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy)
    local v172 = nil;
    local v173 = nil;
    if l_FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp_0 then
        local v174 = l_GetCredentialsAvailabilityStore_0(false);
        v172 = v174.getFido2Available(false);
        v173 = v174.getPasswordsAvailable(false);
    end;
    v171.state = {
        birthday = nil, 
        shouldHideBirthdayEntry = false, 
        username = "", 
        displayName = "", 
        password = "", 
        birthdayValid = v94.Unvalidated, 
        usernameValid = v94.Unvalidated, 
        passwordValid = v94.Unvalidated, 
        displayNameValid = v94.Unvalidated, 
        isSignUpButtonEnabled = false, 
        isSignUpInProgress = false, 
        gender = v92.Unknown, 
        onScreenKeyboardHeight = 0, 
        isUsernameAnimating = false, 
        isPasswordAnimating = false, 
        birthdayFocused = false, 
        contactMethod = "", 
        emailInput = "", 
        emailValid = false, 
        phoneCountryCode = {}, 
        phoneInput = "", 
        phoneValid = false, 
        verifiedSignupVoucher = "", 
        isCountryCodeSearchVisible = false, 
        hidePassword = nil, 
        agreements = {}, 
        passkeysAvailable = v172, 
        isCredentialsProtocolRegisterPasswordAvailable = v173, 
        pillClicked = false, 
        issueCondition = nil, 
        suggestionControlState = nil, 
        loadingSuggestions = false, 
        signUpError = false, 
        shouldShowUnderAgeAlert = false, 
        shouldShowVngTosAlert = false, 
        showU13AccountSwitcherAlert = false, 
        showParentAccountSwitcherAlert = false, 
        hasSetIneligibleAgeAtLeastOnce = false, 
        recommendedUsername = nil, 
        hasEditedUsername = false, 
        bypassDisplayNameField = false, 
        isUsernameFocused = false, 
        otpSessionToken = "", 
        otpCode = "", 
        signupAgreementsChecked = false
    };
    v171.backButtonRef = v7.createRef();
    v171.isAlreadyAuthenticated = false;
    if v60 == true then
        v171.isAlreadyAuthenticated = v61.fromLocalStorage().userId ~= -1;
    end;
    v171.resetDefaultTheme = function() --[[ Line: 335 ]]
        -- upvalues: v64 (ref), l_MemStorageService_0 (ref), v63 (ref)
        local v175 = v64.getAuthenticatedTheme();
        if v175 ~= "" then
            l_MemStorageService_0:Fire(v63.ThemeUpdate, v175);
        end;
    end;
    v171.logoutAllLoggedInUsersCallback = function() --[[ Line: 343 ]]
        -- upvalues: v171 (copy), v64 (ref), v61 (ref), v67 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_GuiService_0 (ref)
        local l_networking_0 = v171.props.networking;
        local v177 = v64.getAccountBlob();
        local v178 = v61.fromLocalStorage().userId ~= -1;
        v171:setState({
            signUpError = false, 
            isSignUpButtonEnabled = false, 
            isSignUpInProgress = false
        });
        v67(l_networking_0, v177):await();
        if v178 == true then
            v171.props.resetAppState();
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.CredentialValue, "");
            l_AppStorageService_0:Flush();
            v171.props.logoutWithoutShowConfirmation(l_networking_0, l_GuiService_0);
        end;
        v171:setState({
            signUpError = false
        });
        v171.props.closeCentralOverlay();
    end;
    v171.closeOverlayAndDisableSwitcherErrors = function() --[[ Line: 371 ]]
        -- upvalues: v171 (copy)
        v171.props.closeCentralOverlay();
    end;
    v171.onCloseButtonClicked = function() --[[ Line: 375 ]]
        -- upvalues: v160 (ref), v60 (ref), v171 (copy)
        if not v160 and v60 == true and v171.isAlreadyAuthenticated == true then
            v171.resetDefaultTheme();
        end;
        v171.props.navigateBack();
    end;
    v171.getShouldShowVNGAgreements = function() --[[ Line: 387 ]]
        -- upvalues: v171 (copy)
        return v171.props.appPolicy.getUseVNGUserAgreementPopup();
    end;
    v171.getShouldBlockVNGU12SignUpOnClientSide = function() --[[ Line: 391 ]]
        -- upvalues: v171 (copy)
        return v171.props.appPolicy.getBlockVNGU12SignUpOnClientSide();
    end;
    v171.getShouldUseAgeInput = function() --[[ Line: 395 ]]
        -- upvalues: v171 (copy), v153 (ref)
        return v171.props.appPolicy.getUseAgeInput() and v153;
    end;
    v171.getShouldShowKISAAgreements = function() --[[ Line: 399 ]]
        -- upvalues: v70 (ref), v171 (copy), v72 (ref), v71 (ref)
        return v70 and (v171.props.appPolicy.getUseKoreaKISAUserAgreementPopup() or v72) and (v171.props.shouldShowKoreanKISASignUpFlow or v71);
    end;
    v171.getShouldAddParentalConsentAgreementId = function() --[[ Line: 405 ]]
        -- upvalues: v171 (copy)
        return v171.props.appPolicy.getParentalConsentAgreementId();
    end;
    v171.getSignupCheckboxDisabled = function() --[[ Line: 409 ]]
        -- upvalues: v171 (copy)
        return v171.props.appPolicy.getSignupCheckboxDisabled();
    end;
    v171.launchKISATermsOfService = function(v179, v180) --[[ Line: 413 ]]
        -- upvalues: v171 (copy), l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), l_KISAComplianceUtils_0 (ref), v23 (ref)
        local v185 = {
            agreements = v171.state.agreements, 
            onAgreeFunction = function(v181) --[[ Line: 417 ]] --[[ Name: onAgreeFunction ]]
                -- upvalues: l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), l_KISAComplianceUtils_0 (ref), v23 (ref), v179 (copy), v171 (ref), v180 (copy)
                l_AnalyticsEvents_0.sendButtonClickEvent(l_EventConstants_0.ctx.kisaAgreements, l_EventConstants_0.origin.signup, l_EventConstants_0.btn.agree);
                local v182 = l_KISAComplianceUtils_0.getAgreedUserAgreements(v181);
                local v183 = v23.Dictionary.join(v179, {
                    agreementIds = v182
                });
                local v184 = v171.getShouldAddParentalConsentAgreementId();
                if v180 and v184 and v184 ~= "" then
                    table.insert(v183.agreementIds, v184);
                end;
                v171.requestSignUp(v183);
            end, 
            onAbandonFunction = v171.onAbandonKISASignUpFlow, 
            isUnderAgeFlow = v180
        };
        v171.props.openKISAUserAgreements(v185);
    end;
    v171.getIsSignUpButtonEnabled = function() --[[ Line: 442 ]]
        -- upvalues: v171 (copy), v110 (ref), v111 (ref), v112 (ref), v141 (ref), v94 (ref), v142 (ref), l_FFlagUseBirthdayDropdownForGamepad_0 (ref)
        local l_birthday_0 = v171.state.birthday;
        local l_username_0 = v171.state.username;
        local l_password_0 = v171.state.password;
        local l_displayName_0 = v171.state.displayName;
        local l_birthdayValid_0 = v171.state.birthdayValid;
        local l_usernameValid_0 = v171.state.usernameValid;
        local l_passwordValid_0 = v171.state.passwordValid;
        local l_displayNameValid_0 = v171.state.displayNameValid;
        local l_validBirthday_0 = v171.state.validBirthday;
        local v195 = v171.props.shouldUseMinimalSignup and v110();
        local v196 = v171.props.shouldUsePasswordlessSignup and v111();
        if v112() and v171.props.shouldUsePasskeySignup and not v171.state.passkeysAvailable then
            v196 = false;
        end;
        local v197 = v141() and v171.props.birthdayPickerVariant and v171.props.birthdayPickerVariant > 0;
        if not v171.getSignupCheckboxDisabled() and v171.props.shouldRequireSignupCheckbox and not v171.state.signupAgreementsChecked then
            return false;
        else
            local v198 = true;
            if l_usernameValid_0 == v94.Valid then
                v198 = true;
                if l_passwordValid_0 == v94.Valid then
                    v198 = v197 and l_birthdayValid_0 ~= v94.Valid or if v142 and v171.isDisplayNameFieldRequired() then l_displayNameValid_0 ~= v94.Valid else nil;
                end;
            end;
            if l_FFlagUseBirthdayDropdownForGamepad_0 and l_birthday_0 and l_validBirthday_0 == false then
                return false;
            elseif v195 and l_birthday_0 then
                if v197 and l_birthdayValid_0 ~= v94.Valid then
                    return false;
                else
                    return true;
                end;
            elseif v196 and l_birthday_0 and l_username_0 ~= "" and l_usernameValid_0 == v94.Valid then
                if v197 and l_birthdayValid_0 ~= v94.Valid then
                    return false;
                else
                    return true;
                end;
            elseif not l_birthday_0 or v198 or l_username_0 == "" or l_password_0 == "" or v142 and v171.isDisplayNameFieldRequired() and l_displayName_0 == "" or nil then
                return false;
            elseif l_validBirthday_0 == false then
                return false;
            else
                return true;
            end;
        end;
    end;
    v171.updateState = function(v199) --[[ Line: 527 ]]
        -- upvalues: v171 (copy)
        spawn(function() --[[ Line: 528 ]]
            -- upvalues: v171 (ref), v199 (copy)
            if v171.isMounted then
                v171:setState(v199);
            end;
        end);
    end;
    v171.getHidePassword = function() --[[ Line: 538 ]]
        -- upvalues: v171 (copy)
        if v171.state.hidePassword == nil then
            return not v171.props.arePasswordFieldsPlaintext;
        else
            return v171.state.hidePassword;
        end;
    end;
    v171.passwordVisibilityToggleCallback = function() --[[ Line: 545 ]]
        -- upvalues: v171 (copy), v88 (ref)
        local v200 = v171.getHidePassword();
        if v200 then
            v171.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.ShowPassword);
        else
            v171.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.HidePassword);
        end;
        v171:setState({
            hidePassword = not v200
        });
    end;
    v171.onBirthdaySelected = function(v201, v202) --[[ Line: 563 ]]
        -- upvalues: v24 (ref), l_Birthday_0 (ref), v171 (copy), v88 (ref)
        v24.assert(l_Birthday_0.is(v201), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.");
        v171.updateState({
            birthday = v201, 
            validBirthday = v202
        });
        if v171.useVerifiedSignup() then
            v171.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.ConfirmBirthday);
        end;
        v171.updateSignUpFieldFilled();
    end;
    v171.onAgeChanged = function(v203) --[[ Line: 584 ]]
        -- upvalues: v171 (copy), v94 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref)
        local v204 = tonumber(v203);
        if v204 == nil or v204 < 1 or v204 > 99 then
            v171.updateState({
                birthday = nil, 
                birthdayValid = v94.Invalid
            });
            return;
        else
            local v205 = DateTime.now():ToLocalTime();
            local v206 = l_Birthday_0.new({
                Year = v205.Year - v204, 
                Month = v205.Month, 
                Day = v205.Day
            });
            if v206.Month == 2 and v206.Day == 29 and not l_DateHelper_0:isLeapYear(v206.Year) then
                v206.Day = 28;
            end;
            if l_DateHelper_0:isValidDate(v206.Month, v206.Day, v206.Year) then
                v171.updateState({
                    birthday = v206, 
                    birthdayValid = v94.Valid
                });
                return;
            else
                v171.updateState({
                    birthday = nil, 
                    birthdayValid = v94.Invalid
                });
                return;
            end;
        end;
    end;
    v171.onAgeAndMonthChanged = function(v207, v208) --[[ Line: 615 ]]
        -- upvalues: v171 (copy), v94 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref)
        if v207 == nil or v207 < 1 or v207 > 99 then
            v171.updateState({
                birthday = nil, 
                birthdayValid = v94.Invalid
            });
            return;
        else
            local v209 = DateTime.now():ToLocalTime().Year - v207;
            local v210 = l_Birthday_0.new({
                Year = v209, 
                Month = v208, 
                Day = l_DateHelper_0:getLastDayOfTheMonthInYear(v208, v209)
            });
            if l_DateHelper_0:isValidDate(v210.Month, v210.Day, v210.Year) then
                v171.updateState({
                    birthday = v210, 
                    birthdayValid = v94.Valid
                });
                return;
            else
                v171.updateState({
                    birthday = nil, 
                    birthdayValid = v94.Invalid
                });
                return;
            end;
        end;
    end;
    v171.onMonthAndYearChanged = function(v211, v212) --[[ Line: 643 ]]
        -- upvalues: v171 (copy), v94 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref)
        local v213 = DateTime.now():ToLocalTime();
        if v212 == nil or v212 < v213.Year - 100 or v213.Year < v212 then
            v171.updateState({
                birthday = nil, 
                birthdayValid = v94.Invalid
            });
            return;
        else
            local v214 = l_Birthday_0.new({
                Year = v212, 
                Month = v211, 
                Day = l_DateHelper_0:getLastDayOfTheMonthInYear(v211, v212)
            });
            if l_DateHelper_0:isValidDate(v214.Month, v214.Day, v214.Year) then
                v171.updateState({
                    birthday = v214, 
                    birthdayValid = v94.Valid
                });
                return;
            else
                v171.updateState({
                    birthday = nil, 
                    birthdayValid = v94.Invalid
                });
                return;
            end;
        end;
    end;
    v171.usernameSuggestionClicked = function(v215, v216) --[[ Line: 671 ]]
        -- upvalues: v171 (copy), v88 (ref)
        v171.props.authEventAnalytics.reportUsernameSuggestionClicked(v88.Context.SinglePageSignUpScreen, v88.Button.UsernameSuggestion, v215, v216);
    end;
    v171.logRefreshButtonClicked = function() --[[ Line: 680 ]]
        -- upvalues: v171 (copy), v88 (ref), v128 (ref)
        v171.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v128.refreshButton);
    end;
    v171.usernameSuggestionsShown = function(v217, v218) --[[ Line: 687 ]]
        -- upvalues: v171 (copy), v88 (ref), v128 (ref)
        v171.props.authEventAnalytics.reportInteractWithActionAndSection(v88.Context.SinglePageSignUpScreen, v88.Field.Username, v88.ActionType.Shown, v128.suggestionsShown, v217, v218);
    end;
    v171.logSuggestableUsername = function(v219) --[[ Line: 698 ]]
        -- upvalues: v171 (copy), v88 (ref), v128 (ref)
        v171.props.authEventAnalytics.reportInteractWithAction(v88.Context.SinglePageSignUpScreen, v88.Field.Username, v88.ActionType.Shown, v128.suggestableInput, v219);
    end;
    v171.shouldSuggest = function() --[[ Line: 708 ]]
        -- upvalues: v171 (copy), v96 (ref), v97 (ref)
        local v220 = false;
        local l_issueCondition_0 = v171.state.issueCondition;
        if l_issueCondition_0 then
            v220 = l_issueCondition_0[v96.AlreadyInUse] == v97.Problematic;
            for v222, v223 in pairs(l_issueCondition_0) do
                if v222 ~= v96.AlreadyInUse and v223 == v97.Problematic then
                    return false;
                end;
            end;
        end;
        return v220;
    end;
    v171.onBirthdayFocused = function(v224) --[[ Line: 723 ]]
        -- upvalues: v171 (copy)
        if v171.isMounted then
            v171:setState({
                birthdayFocused = v224
            });
        end;
    end;
    v171.onUsernameTextChanged = function(v225, v226) --[[ Line: 731 ]]
        -- upvalues: v142 (ref), v171 (copy)
        local v227 = nil;
        if v142 and v171.shouldShowDisplayNameField() and not v171.state.hasEditedUsername then
            v227 = v171.state.recommendedUsername ~= v225;
        end;
        v171.updateState({
            username = v225, 
            usernameValid = v226, 
            hasEditedUsername = if v142 then v227 else nil
        });
        if v171.shouldSuggest() then
            v171.logSuggestableUsername(v225);
        end;
        v171.updateSignUpFieldFilled();
    end;
    v171.updateSignUpFieldFilled = function() --[[ Line: 753 ]]
        -- upvalues: v171 (copy)
        if v171.props.signUpStarted == nil then
            return;
        else
            local v228 = false;
            if v171.state.username ~= "" or v171.state.password ~= "" or v171.state.birthday ~= nil then
                v228 = true;
            end;
            if v228 ~= v171.state.signUpStarted then
                v171.props.setSignUpStarted(v228);
            end;
            return;
        end;
    end;
    v171.onDisplayNameTextChanged = function(v229, v230) --[[ Line: 768 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            displayName = v229, 
            displayNameValid = v230
        });
    end;
    v171.updateBypassDisplayNameField = function(v231) --[[ Line: 775 ]]
        -- upvalues: v171 (copy)
        v171:setState({
            bypassDisplayNameField = v231
        });
    end;
    v171.onUsernameTextValidated = function(v232, v233) --[[ Line: 781 ]]
        -- upvalues: v171 (copy), v94 (ref), v88 (ref)
        v171.onUsernameTextChanged(v232, v233);
        if v233 == v94.Valid then
            v171.props.authEventAnalytics.reportInteractWithAction(v88.Context.SinglePageSignUpScreen, v88.Field.Username, v88.ActionType.Submit, v233, v232);
        end;
    end;
    v171.onPasswordTextChanged = function(v234, v235) --[[ Line: 794 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            password = v234, 
            passwordValid = v235
        });
        v171.updateSignUpFieldFilled();
    end;
    v171.cachedScrollCanvasPositionY = 0;
    v171.cachedScrollCanvasInitialSizeY = 0;
    local v236, v237 = v7.createBinding(0);
    v171.scrollCanvasTargetPositionY = v236;
    v171.updateScrollCanvasTargetPositionY = v237;
    v171.scrollingFrameRef = v7.createRef();
    v171.ageTextFieldRef = v7.createRef();
    v171.usernameTextFieldRef = v7.createRef();
    v171.displayNameTextFieldRef = if v142 then v7.createRef() else nil;
    v171.passwordTextFieldRef = v7.createRef();
    v171.passwordFrameRef = v7.createRef();
    v171.onDisplayNameTextChangeCompletedFromKeyboard = function() --[[ Line: 814 ]]
        -- upvalues: v171 (copy), v148 (ref), v88 (ref)
        task.spawn(function() --[[ Line: 815 ]]
            -- upvalues: v171 (ref), v148 (ref), v88 (ref)
            if v171.displayNameTextFieldRef.current then
                v171.displayNameTextFieldRef.current:ReleaseFocus();
            end;
            task.defer(function() --[[ Line: 820 ]]
                -- upvalues: v171 (ref)
                if v171.usernameTextFieldRef.current then
                    v171.usernameTextFieldRef.current:CaptureFocus();
                end;
            end);
            if v148 then
                v171.props.authEventAnalytics.reportAuthButtonClick(v88.Context.SinglePageSignUpScreen, v88.Button.DisplayNameNext, v88.State.KeyboardInput);
            end;
        end);
    end;
    v171.onUsernameTextChangeCompletedFromKeyboard = function() --[[ Line: 836 ]]
        -- upvalues: v171 (copy), v88 (ref)
        spawn(function() --[[ Line: 837 ]]
            -- upvalues: v171 (ref), v88 (ref)
            if v171.usernameTextFieldRef.current then
                v171.usernameTextFieldRef.current:ReleaseFocus();
            end;
            if v171.passwordTextFieldRef.current then
                v171.passwordTextFieldRef.current:CaptureFocus();
            end;
            v171.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.UsernameNext);
        end);
    end;
    v171.onPasswordTextChangeCompletedFromKeyboard = function() --[[ Line: 852 ]]
        -- upvalues: v171 (copy), v88 (ref)
        spawn(function() --[[ Line: 853 ]]
            -- upvalues: v171 (ref), v88 (ref)
            if v171.passwordTextFieldRef.current then
                v171.passwordTextFieldRef.current:ReleaseFocus();
            end;
            v171.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.PasswordNext);
        end);
    end;
    v171.cacheScrollCanvasInitialSizeIfNecessary = function() --[[ Line: 867 ]]
        -- upvalues: v171 (copy)
        if v171.cachedScrollCanvasInitialSizeY == 0 then
            local l_Parent_0 = v171.scrollingFrameRef.current.Parent;
            local l_CanvasSize_0 = v171.scrollingFrameRef.current.CanvasSize;
            local v240 = l_Parent_0 and l_Parent_0.AbsoluteSize or Vector2.new(0, 0);
            v171.cachedScrollCanvasInitialSizeY = l_CanvasSize_0.Y.Scale * v240.Y + l_CanvasSize_0.Y.Offset;
        end;
    end;
    v171.agreeToPhoneNumberVerification = function() --[[ Line: 877 ]]
        -- upvalues: v171 (copy), v132 (ref)
        local l_agreeToPhoneNumberVerification_0 = v171.props.agreeToPhoneNumberVerification;
        local l_networking_1 = v171.props.networking;
        local v243 = v171.state.phoneCountryCode.prefix .. "," .. v171.state.phoneInput .. "," .. v171.state.phoneCountryCode.code;
        l_agreeToPhoneNumberVerification_0(l_networking_1, function() --[[ Line: 886 ]]
            -- upvalues: v132 (ref), l_networking_1 (copy), v243 (copy), v171 (ref)
            v132(l_networking_1, v243):andThen(function(v244) --[[ Line: 887 ]]
                -- upvalues: v171 (ref), v243 (ref)
                local l_challenge_0 = v244.challenge;
                v171.verifyPhoneNumber(l_challenge_0, v171.state.phoneInput, v243);
            end, function(v246) --[[ Line: 890 ]]
                -- upvalues: v171 (ref)
                if v246 == "Authentication.TwoStepVerification.Response.TooManyAttempts" or v246 == "Authentication.SignUp.Response.PhoneNumberAlreadyLinked" or v246 == "Authentication.SignUp.Response.InvalidPhoneNumber" then
                    v171.props.showErrorMessageToast(v246);
                    return;
                else
                    v171.props.showErrorToast();
                    return;
                end;
            end);
        end, v171.state.phoneInput);
    end;
    v171.onSignUpClick = function() --[[ Line: 905 ]]
        -- upvalues: v171 (copy), v91 (ref)
        if v171.useVerifiedSignup() and v171.state.contactMethod == v91.PhoneNumber then
            v171.agreeToPhoneNumberVerification();
            return;
        else
            v171.onSignUpButtonActivated();
            return;
        end;
    end;
    v171.verifyPhoneNumber = function(v247, v248, v249) --[[ Line: 913 ]]
        -- upvalues: v171 (copy)
        v171.props.verifyPhoneNumber(v171.props.networking, v171.verifyPhoneNumberCallback, v247, v248, v249, v171.useEmailOptionClickedCallback);
    end;
    v171.verifyPhoneNumberCallback = function(v250) --[[ Line: 928 ]]
        -- upvalues: v171 (copy)
        v171.verifiedSignupVoucher = v250;
        v171.onSignUpButtonActivated();
    end;
    v171.useEmailOptionClickedCallback = function() --[[ Line: 933 ]]
        -- upvalues: v171 (copy), v91 (ref)
        v171:setState({
            contactMethod = v91.Email
        });
    end;
    v171.phoneCountryCodeSelectorCallback = function(v251) --[[ Line: 939 ]]
        -- upvalues: v171 (copy)
        v171:setState({
            isCountryCodeSearchVisible = v251
        });
    end;
    v171.onTextBoxFocused = function(v252) --[[ Line: 947 ]]
        -- upvalues: v171 (copy)
        v171.cacheScrollCanvasInitialSizeIfNecessary();
        local v253 = math.clamp(v171.scrollingFrameRef.current.CanvasPosition.Y, 0, v171.cachedScrollCanvasInitialSizeY);
        if v171.isMounted then
            local v254 = v252.Y - v171.scrollingFrameRef.current.absolutePosition.Y + v253;
            v171.updateScrollCanvasTargetPositionY(v254);
        end;
    end;
    v171.onTextBoxFocusLost = function() --[[ Line: 958 ]]
        -- upvalues: v171 (copy)
        if v171.isMounted then
            v171.updateScrollCanvasTargetPositionY(0);
        end;
    end;
    v171.onUsernameTextBoxFocusLost = function() --[[ Line: 964 ]]
        -- upvalues: v171 (copy)
        v171.onTextBoxFocusLost();
        v171.updateState({
            isUsernameFocused = false
        });
    end;
    v171.onAnimationStateChangeCallback = function(v255, v256) --[[ Line: 974 ]]
        -- upvalues: v171 (copy)
        if v255 == Enum.TextInputType.Password then
            v171:setState({
                isPasswordAnimating = v256
            });
            return;
        else
            v171:setState({
                isUsernameAnimating = v256
            });
            return;
        end;
    end;
    v171.onFocusedTextBoxPositionChanged = function(v257) --[[ Line: 988 ]]
        -- upvalues: v171 (copy)
        if v171.state.isUsernameAnimating or v171.state.isPasswordAnimating then
            v171.onTextBoxFocused(v257);
        end;
    end;
    v171.getScrollingFrameCanvasPosition = function(v258) --[[ Line: 997 ]]
        -- upvalues: v171 (copy)
        if v258 > 0 then
            return Vector2.new(0, v258);
        elseif v171.scrollingFrameRef and v171.scrollingFrameRef.current then
            return v171.scrollingFrameRef.current.CanvasPosition;
        else
            return Vector2.new(0, 0);
        end;
    end;
    v171.onUsernameTextBoxFocused = function(v259) --[[ Line: 1009 ]]
        -- upvalues: v171 (copy), v88 (ref)
        v171:setState({
            isUsernameFocused = true
        });
        v171.props.authEventAnalytics.reportUsernameFocus(v88.Context.SinglePageSignUpScreen);
        v171.onTextBoxFocused(v259);
    end;
    v171.onDisplayNameTextBoxFocused = function(v260) --[[ Line: 1019 ]]
        -- upvalues: v148 (ref), v171 (copy), v88 (ref)
        if v148 then
            v171.props.authEventAnalytics.reportDisplayNameFocus(v88.Context.SinglePageSignUpScreen);
        end;
        v171.onTextBoxFocused(v260);
    end;
    v171.onPasswordTextBoxFocused = function(v261) --[[ Line: 1027 ]]
        -- upvalues: v171 (copy), v88 (ref)
        v171.props.authEventAnalytics.reportPasswordFocus(v88.Context.SinglePageSignUpScreen);
        v171.onTextBoxFocused(v261);
    end;
    v171.updateIsSignUpInProgress = function(v262) --[[ Line: 1032 ]]
        -- upvalues: v171 (copy)
        spawn(function() --[[ Line: 1033 ]]
            -- upvalues: v171 (ref), v262 (copy)
            if v171.isMounted then
                v171:setState({
                    isSignUpInProgress = v262
                });
            end;
        end);
    end;
    v171.requestSignUp = function(v263, v264) --[[ Line: 1042 ]]
        -- upvalues: v171 (copy), v91 (ref), l_FFlagEnableAuthDeepLinkReceiver_0 (ref), l_PreAuthDeepLinkUrlStore_0 (ref), l_LinkingProtocol_0 (ref), v149 (ref), v112 (ref), v122 (ref), v95 (ref), v93 (ref), v60 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v89 (ref), l_AccountLinkingAlertType_0 (ref)
        local l_networking_2 = v171.props.networking;
        local l_guiService_0 = v171.props.guiService;
        local l_analytics_0 = v171.props.analytics;
        local l_appPolicy_0 = v171.props.appPolicy;
        local l_omniRecommendationsRequest_0 = v171.props.omniRecommendationsRequest;
        local l_authEventAnalytics_0 = v171.props.authEventAnalytics;
        local l_signUp_0 = v171.props.signUp;
        local l_setBackNavigationDisabled_0 = v171.props.setBackNavigationDisabled;
        local function v275(v273, v274) --[[ Line: 1053 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v171 (ref), v263 (copy)
            if v273 then
                l_setBackNavigationDisabled_0(true);
                v171.requestSignUp(v263, v274);
                return;
            else
                v171.updateIsSignUpInProgress(false);
                return;
            end;
        end;
        local v276 = v171.useVerifiedSignup() and v171.state.contactMethod == v91.PhoneNumber;
        local v277 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        local v278 = v149 and v277 ~= nil and v277 ~= "";
        local v279 = not v171.state.passkeysAvailable or v278;
        local v280 = v112();
        l_signUp_0(l_networking_2, l_omniRecommendationsRequest_0, l_guiService_0, v275, v264, l_analytics_0, l_appPolicy_0, v263, v276, v171.props.shouldUsePasskeySignup and v280 and game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not v279, v171.props.shouldAutomaticallyPromptForPasskey, v122() and v171.state.isCredentialsProtocolRegisterPasswordAvailable, l_authEventAnalytics_0, v171.props.isIosAuthServiceEnabled):andThen(function() --[[ Line: 1107 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy)
            l_setBackNavigationDisabled_0(false);
        end, function(v281) --[[ Line: 1111 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v276 (copy), v95 (ref), v171 (ref), v93 (ref), v60 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v89 (ref), l_AccountLinkingAlertType_0 (ref)
            l_setBackNavigationDisabled_0(false);
            if v276 then
                if v281 ~= v95.Captcha then
                    v171.updateIsSignUpInProgress(false);
                    v171:setState({
                        signUpError = true
                    });
                end;
            else
                if v281 ~= v93.Captcha then
                    v171.updateIsSignUpInProgress(false);
                    v171:setState({
                        signUpError = true
                    });
                end;
                if v281 == v93.VNGAgeUnder12 then
                    v171:setState({
                        shouldShowUnderAgeAlert = true
                    });
                end;
                if v60 == true and v281 == v93.EmptyAccountSwitchBlobRequired then
                    v171.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.LogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v171.logoutAllLoggedInUsersCallback, v171.props.closeCentralOverlay, v89.Auth.AccountSwitcherSignupEmptyBlobRequiredError, v171.state.username);
                    v171:setState({
                        signUpError = false
                    });
                end;
                if v60 == true and v281 == v93.ParentEmptyAccountSwitchBlobRequired then
                    v171.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v171.logoutAllLoggedInUsersCallback, v171.props.closeCentralOverlay, v89.Auth.AccountSwitcherParentSignupEmptyBlobRequiredError, v171.state.username);
                    v171:setState({
                        signUpError = false
                    });
                end;
            end;
            if v281 == v93.AccountLinkingRequired then
                v171.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInAlreadyLinked);
                return;
            else
                if v281 == v93.AccountLinkingFailed then
                    v171.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInGenericError);
                end;
                return;
            end;
        end);
    end;
    v171.onSignUpButtonActivated = function() --[[ Line: 1197 ]]
        -- upvalues: v171 (copy), v88 (ref), v115 (ref), l_FFlagEnableAuthDeepLinkReceiver_0 (ref), l_PreAuthDeepLinkUrlStore_0 (ref), l_LinkingProtocol_0 (ref), v116 (ref), v57 (ref), l_HttpService_0 (ref), v118 (ref), l_ExperienceService_0 (ref), v147 (ref), v137 (ref), v22 (ref), v142 (ref), v91 (ref), l_UserAgreementsCounterNames_0 (ref), v120 (ref)
        local l_setBackNavigationDisabled_1 = v171.props.setBackNavigationDisabled;
        local l_birthday_1 = v171.state.birthday;
        local l_username_1 = v171.state.username;
        local l_password_1 = v171.state.password;
        local l_gender_0 = v171.state.gender;
        local v287 = v171.getIsSignUpButtonEnabled();
        local l_locale_0 = v171.locale;
        local l_emailInput_0 = v171.state.emailInput;
        local _ = function(v290) --[[ Line: 1208 ]]
            local v291 = {};
            for _, v293 in ipairs(v290) do
                table.insert(v291, v293.id);
            end;
            return v291;
        end;
        if v287 then
            v171.props.authEventAnalytics.reportSignUpButtonClicked(v88.Context.SinglePageSignUpScreen);
            if v171.getShouldBlockVNGU12SignUpOnClientSide() then
                local v295 = v171.getUserAge();
                if v295 == nil or v295 < 12 then
                    v171:setState({
                        shouldShowUnderAgeAlert = true
                    });
                    return;
                end;
            end;
            if v115() then
                local v296 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
                local v297 = "";
                do
                    local l_v297_0 = v297;
                    if v116() and v296 and string.find(v296, "share") then
                        local v299, v300, v301 = v296:match("code=(.-)&type=(.-)&stamp=(.*)");
                        if not v301 then
                            local v302, v303 = v296:match("code=(.-)&type=(.*)");
                            v299 = v302;
                            v300 = v303;
                        end;
                        if v299 and v300 then
                            v57(v171.props.networking, v299, v300):andThen(function(v304) --[[ Line: 1248 ]]
                                -- upvalues: l_v297_0 (ref), l_HttpService_0 (ref)
                                if v304 and v304 ~= nil then
                                    l_v297_0 = l_HttpService_0:JSONEncode(v304);
                                end;
                            end, function(v305) --[[ Line: 1252 ]]
                                warn("Error fetching share link metadata: ", v305);
                            end):await();
                        end;
                    elseif v118() then
                        local l_l_ExperienceService_0_PendingJoinAttempt_0 = l_ExperienceService_0:GetPendingJoinAttempt();
                        if l_l_ExperienceService_0_PendingJoinAttempt_0 and l_l_ExperienceService_0_PendingJoinAttempt_0 ~= nil then
                            l_v297_0 = l_HttpService_0:JSONEncode(l_l_ExperienceService_0_PendingJoinAttempt_0);
                        end;
                    end;
                    v171.props.authEventAnalytics.reportAuthButtonClick(v88.Context.SinglePageSignUpScreen, v88.Button.SignUp, l_v297_0, v296, v171.isAltAttempt);
                end;
            end;
            if v147 and v171.props.shouldSeeDisplayNamesOnSignup then
                if v171.state.recommendedUsername == l_username_1 then
                    v137(v22.SignUpWithRecommendedUsernames, 1);
                elseif v171.state.hasEditedUsername then
                    v137(v22.SignUpWithEditedUsernames, 1);
                end;
                if v171.state.bypassDisplayNameField then
                    v137(v22.SignupBypassingDisplayNames, 1);
                end;
            end;
            v171.updateIsSignUpInProgress(true);
            l_setBackNavigationDisabled_1(true);
            v171:setState({
                signUpError = false
            });
            local v307 = {
                birthday = l_birthday_1 and l_birthday_1:FormatForEndpoint() or "", 
                username = l_username_1, 
                password = l_password_1, 
                displayName = if v142 and v171.isDisplayNameFieldRequired() then v171.state.displayName else nil, 
                gender = l_gender_0, 
                locale = l_locale_0, 
                capturedAuditContent = v171.props.capturedAuditContent, 
                additionalAuditContent = v171.props.additionalAuditContent
            };
            local v308 = v171.useVerifiedSignup();
            if v308 and v171.state.contactMethod == v91.Email then
                v307.email = l_emailInput_0;
            elseif v308 and v171.state.contactMethod == v91.PhoneNumber then
                v307.verifiedSignupVoucher = v171.verifiedSignupVoucher;
            end;
            if v171.props.appPolicy.getAddUserAgreementIdsToSignupRequest() then
                local l_agreements_0 = v171.state.agreements;
                if #l_agreements_0 > 0 then
                    local v310 = {};
                    for _, v312 in ipairs(l_agreements_0) do
                        table.insert(v310, v312.id);
                    end;
                    v307.agreementIds = v310;
                else
                    v137(l_UserAgreementsCounterNames_0.AgreementsIdsEmptyOnSignup, 1);
                end;
            end;
            if v171.getShouldShowVNGAgreements() then
                v171.props.showVNGUserAgreementsPopup(v171.state.agreements, function(v313) --[[ Line: 1323 ]]
                    -- upvalues: v307 (copy), v171 (ref)
                    local l_v307_0 = v307;
                    local v315 = {};
                    for _, v317 in ipairs(v313) do
                        table.insert(v315, v317.id);
                    end;
                    l_v307_0.agreementIds = v315;
                    v171.requestSignUp(v307);
                end, function() --[[ Line: 1326 ]]
                    -- upvalues: v171 (ref), l_setBackNavigationDisabled_1 (copy)
                    v171.updateIsSignUpInProgress(false);
                    l_setBackNavigationDisabled_1(false);
                end);
                return;
            elseif v171.getShouldShowKISAAgreements() then
                local v318 = v171.getUserAge();
                if v318 and v318 < v120 then
                    v171.launchParentSignUpOtp(v307);
                    return;
                else
                    v171.launchKISATermsOfService(v307, false);
                    return;
                end;
            else
                v171.requestSignUp(v307);
            end;
        end;
    end;
    v171.onGenderChanged = function(v319) --[[ Line: 1345 ]]
        -- upvalues: v171 (copy)
        if v171.isMounted then
            v171.updateState({
                gender = v319
            });
        end;
    end;
    v171.validUsernameEntered = function(_) --[[ Line: 1353 ]]
        -- upvalues: v171 (copy), v94 (ref)
        local v321 = false;
        if v171.state.username ~= "" then
            v321 = v171.state.usernameValid ~= v94.Invalid;
        end;
        return v321;
    end;
    v171.validPasswordEntered = function() --[[ Line: 1357 ]]
        -- upvalues: v171 (copy), v94 (ref)
        local v322 = false;
        if v171.state.password ~= "" then
            v322 = v171.state.passwordValid ~= v94.Invalid;
        end;
        return v322;
    end;
    v171.useVerifiedSignup = function() --[[ Line: 1361 ]]
        -- upvalues: v171 (copy), l_GuiService_0 (ref)
        return game:GetFastFlag("LuaVerifiedSignup2") or game:GetFastFlag("LuaVerifiedSignupExperiment2") and v171.props.useVerifiedSignupPage and not l_GuiService_0:IsTenFootInterface();
    end;
    v171.useUsernameSuggestions = function() --[[ Line: 1368 ]]
        -- upvalues: v171 (copy)
        return v171.props.shouldUseUsernameSuggestions;
    end;
    v171.useRefreshButton = function() --[[ Line: 1372 ]]
        -- upvalues: v125 (ref), v171 (copy)
        return v125() and v171.props.enableRefreshButton;
    end;
    v171.getBirthdayVariant = function() --[[ Line: 1376 ]]
        -- upvalues: v171 (copy), v141 (ref)
        if v171.getShouldUseAgeInput() then
            return 1;
        elseif v141() and v171.props.birthdayPickerVariant ~= nil then
            return v171.props.birthdayPickerVariant;
        else
            return 0;
        end;
    end;
    v171.SetContactMethod = function(v323) --[[ Line: 1386 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            contactMethod = v323
        });
    end;
    v171.SetPhoneNumber = function(v324, v325, v326) --[[ Line: 1392 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            phoneCountryCode = v324, 
            phoneInput = v325, 
            phoneValid = v326
        });
    end;
    v171.SetEmail = function(v327, v328) --[[ Line: 1400 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            emailInput = v327, 
            emailValid = v328
        });
    end;
    v171.updatePillClicked = function() --[[ Line: 1408 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            pillClicked = true
        });
    end;
    v171.resetPillClicked = function() --[[ Line: 1414 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            pillClicked = false
        });
    end;
    v171.updateIssueCondition = function(v329) --[[ Line: 1420 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            issueCondition = v329
        });
    end;
    v171.updateSuggestionControlState = function(_, v331) --[[ Line: 1426 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            suggestionControlState = v331
        });
    end;
    v171.loadSuggestions = function() --[[ Line: 1432 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            loadingSuggestions = true
        });
    end;
    v171.finishSuggestions = function() --[[ Line: 1436 ]]
        -- upvalues: v171 (copy)
        v171.updateState({
            loadingSuggestions = false
        });
    end;
    v171.onSignUpContentFrameCanvasSizeChange = function(_) --[[ Line: 1440 ]]
        -- upvalues: v171 (copy)
        local v333 = v171.scrollCanvasTargetPositionY:getValue();
        v171.scrollingFrameRef.current.CanvasPosition = v171.getScrollingFrameCanvasPosition(v333);
    end;
    v171.getUserAge = function() --[[ Line: 1445 ]]
        -- upvalues: v171 (copy)
        if v171.state.birthday then
            return v171.state.birthday:GetAgeInYears();
        else
            return nil;
        end;
    end;
    v171.getUsernamePlaceholder = function(v334) --[[ Line: 1453 ]]
        -- upvalues: v171 (copy), v146 (ref)
        if v171.props.shouldSeeDisplayNamesOnSignup then
            if not v171.state.birthday then
                return "";
            elseif v171.getUserAge() >= v146 and not v171.state.hasSetIneligibleAgeAtLeastOnce then
                return v334.agedUpUsernamePlaceholder;
            else
                return v334.usernamePlaceholder;
            end;
        else
            return v334.usernamePlaceholder;
        end;
    end;
    v171.shouldShowUsernameField = function() --[[ Line: 1477 ]]
        -- upvalues: v171 (copy), v146 (ref)
        if v171.props.shouldSeeDisplayNamesOnSignup then
            if not v171.state.birthday or v171.getUserAge() < v146 or v171.state.hasSetIneligibleAgeAtLeastOnce then
                return true;
            else
                return v171.state.recommendedUsername ~= nil;
            end;
        else
            return true;
        end;
    end;
    v171.shouldShowDisplayNameField = function() --[[ Line: 1493 ]]
        -- upvalues: v171 (copy), v146 (ref)
        return v171.props.shouldSeeDisplayNamesOnSignup and v171.state.birthday and v171.getUserAge() >= v146 and not v171.state.hasSetIneligibleAgeAtLeastOnce;
    end;
    v171.isDisplayNameFieldRequired = function() --[[ Line: 1500 ]]
        -- upvalues: v171 (copy)
        return v171.shouldShowDisplayNameField() and not v171.state.bypassDisplayNameField;
    end;
    v171.isValidDisplayNameEntered = function() --[[ Line: 1504 ]]
        -- upvalues: v171 (copy), v94 (ref)
        local v335 = false;
        if v171.state.displayName ~= "" then
            v335 = v171.state.displayNameValid ~= v94.Invalid;
        end;
        return v335;
    end;
    v171.setUsernameRecommendation = function(v336) --[[ Line: 1508 ]]
        -- upvalues: v171 (copy)
        v171:setState(function(v337) --[[ Line: 1509 ]]
            -- upvalues: v336 (copy)
            return {
                recommendedUsername = if v337.recommendedUsername ~= nil and v336 == "" then nil else v336
            };
        end);
    end;
    v171.getUsernameGuidanceText = function(v338) --[[ Line: 1519 ]]
        -- upvalues: v171 (copy)
        if v171.shouldShowDisplayNameField() and v171.state.recommendedUsername ~= "" and v171.state.recommendedUsername ~= nil and not v171.state.hasEditedUsername and not v171.state.isUsernameFocused then
            return v338.autogeneratedUsernameGuidance;
        else
            return nil;
        end;
    end;
    v171.validateOtpCode = function(v339, v340, v341) --[[ Line: 1531 ]]
        -- upvalues: v171 (copy), l_Constants_1 (ref), l_ValidateCode_0 (ref), v80 (ref)
        v171.state.otpSessionToken = v339;
        v171.state.otpCode = v340;
        local l_networking_3 = v171.props.networking;
        local v343 = {
            origin = l_Constants_1.otpServiceOriginSignup, 
            contactType = l_Constants_1.otpServiceContactType, 
            passCode = v171.state.otpCode, 
            otpSessionToken = v171.state.otpSessionToken
        };
        local v344 = {
            otpSessionToken = tostring(v171.state.otpSessionToken), 
            otpContactType = l_Constants_1.otpServiceContactType
        };
        return l_ValidateCode_0(l_networking_3, v343)():andThen(function(_) --[[ Line: 1551 ]]
            -- upvalues: v171 (ref), v341 (copy), v344 (copy)
            v171.props.closeCentralOverlay();
            v341.otpSession = v344;
            v171.launchKISATermsOfService(v341, true);
        end):catch(function(v346) --[[ Line: 1556 ]]
            -- upvalues: v80 (ref)
            return v80.reject(v346);
        end);
    end;
    v171.onAbandonKISASignUpFlow = function() --[[ Line: 1561 ]]
        -- upvalues: l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), v171 (copy)
        l_AnalyticsEvents_0.sendButtonClickEvent(l_EventConstants_0.ctx.kisaAgreements, l_EventConstants_0.origin.signup, l_EventConstants_0.btn.cancel);
        v171.updateIsSignUpInProgress(false);
    end;
    v171.launchParentSignUpOtp = function(v347) --[[ Line: 1571 ]]
        -- upvalues: l_Constants_1 (ref), v171 (copy)
        local v350 = {
            origin = l_Constants_1.otpServiceOriginSignup, 
            codeLength = 6, 
            enterEmailTitleKey = l_Constants_1.translationKeys.parentEmailTitleKey, 
            enterEmailDescriptionKey = l_Constants_1.translationKeys.sendParentVerificationCodeKey, 
            enterCodeTitleKey = l_Constants_1.translationKeys.oneTimeCodeTitleKey, 
            enterCodeDescriptionKey = l_Constants_1.translationKeys.oneTimeCodeHelpDescriptionKey, 
            complianceCheckboxMessageKey = l_Constants_1.translationKeys.parentalConsentModalDescriptionKey, 
            onSubmitCode = function(v348, v349) --[[ Line: 1582 ]] --[[ Name: onSubmitCode ]]
                -- upvalues: v171 (ref), v347 (copy)
                return v171.validateOtpCode(v348, v349, v347);
            end, 
            onModalAbandoned = v171.onAbandonKISASignUpFlow, 
            screenSize = v171.props.screenSize
        };
        v171.props.openEmailOtp(v350);
    end;
    if not v143 then
        l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v351) --[[ Line: 1595 ]]
            -- upvalues: v171 (copy), v88 (ref)
            local v352 = v351.isAvailable or false;
            local v353 = false;
            if v351.password and v351.password.isAvailable then
                v353 = true;
            end;
            if v171.isMounted then
                v171:setState({
                    passkeysAvailable = v352, 
                    isCredentialsProtocolRegisterPasswordAvailable = v353
                });
            end;
            v171.props.authEventAnalytics.reportAuthPageload(v88.Context.PasskeySignup, (tostring(v352)));
            v171.props.authEventAnalytics.reportAuthPageload(v88.Context.CMPasswordSignup, (tostring(v353)));
        end):catch(function(v354) --[[ Line: 1621 ]]
            warn("Error checking for available credential types. Error: ", v354);
        end);
    end;
    v171.isMounted = false;
end;
v170.didMount = function(v355) --[[ Line: 1629 ]] --[[ Name: didMount ]]
    -- upvalues: v143 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), v88 (copy), v160 (copy), v60 (copy), l_MemStorageService_0 (copy), v63 (copy), l_UserInputService_0 (copy), v137 (copy), l_UserAgreementsCounterNames_0 (copy), v136 (copy), l_TelemetryConfigs_0 (copy), v114 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v119 (copy), v58 (copy)
    v355.isMounted = true;
    v355.isAltAttempt = nil;
    if v143 then
        l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v356) --[[ Line: 1636 ]]
            -- upvalues: v355 (copy), v88 (ref)
            local v357 = v356.isAvailable or false;
            local v358 = false;
            if v356.password and v356.password.isAvailable then
                v358 = true;
            end;
            if v355.isMounted then
                v355:setState({
                    passkeysAvailable = v357, 
                    isCredentialsProtocolRegisterPasswordAvailable = v358
                });
            end;
            v355.props.authEventAnalytics.reportAuthPageload(v88.Context.PasskeySignup, (tostring(v357)));
            v355.props.authEventAnalytics.reportAuthPageload(v88.Context.CMPasswordSignup, (tostring(v358)));
        end):catch(function(v359) --[[ Line: 1662 ]]
            warn("Error checking for available credential types. Error: ", v359);
        end);
    end;
    if not v160 and v60 == true and v355.isAlreadyAuthenticated == true then
        l_MemStorageService_0:Fire(v63.ThemeUpdate, "dark");
    end;
    v355.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 1679 ]]
        -- upvalues: l_UserInputService_0 (ref), v355 (copy)
        local v360 = l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        v355:setState({
            onScreenKeyboardHeight = v360
        });
    end);
    local v361 = v355.props.appPolicy.getAddUserAgreementIdsToSignupRequest();
    local v362 = v355.getShouldShowVNGAgreements();
    local v363 = v355.getShouldShowKISAAgreements();
    if v361 or v362 or v363 then
        local function v365(v364) --[[ Line: 1692 ]]
            -- upvalues: v137 (ref), l_UserAgreementsCounterNames_0 (ref), v355 (copy)
            if not v364 then
                v137(l_UserAgreementsCounterNames_0.FetchAgreementsHttpRequestFailureOnSignup, 1);
                return;
            elseif #v364 > 0 then
                v355.updateState({
                    agreements = v364
                });
                return;
            else
                v137(l_UserAgreementsCounterNames_0.FetchAgreementsEmptyResponseOnSignup, 1);
                return;
            end;
        end;
        v136(v355.props.networking, v355.props.analytics):andThen(v365, function() --[[ Line: 1709 ]]

        end);
    end;
    v355.props.authEventAnalytics.reportScreenLoaded(v88.Context.SinglePageSignUpScreen);
    v355.props.loggingProtocol:logEventOnce("signup_page_did_mount");
    v355.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SignupPageMountTelemetryConfig, 1, {
        version = 1
    });
    if v114() then
        local v366 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        if v119() then
            v58(v355.props.networking):andThen(function(v367) --[[ Line: 1727 ]]
                -- upvalues: v355 (copy), v88 (ref), v366 (copy)
                if v367 and v367.IsAltBrowserTracker ~= nil then
                    v355.isAltAttempt = v367.IsAltBrowserTracker;
                    v355.props.authEventAnalytics.reportAuthPageload(v88.Context.SinglePageSignUpScreen, v366, v355.isAltAttempt);
                end;
            end, function(_) --[[ Line: 1736 ]]
                -- upvalues: v355 (copy), v88 (ref), v366 (copy)
                warn("Error auth metadata: ", error);
                v355.props.authEventAnalytics.reportAuthPageload(v88.Context.SinglePageSignUpScreen, v366, v355.isAltAttempt);
            end);
        else
            v355.props.authEventAnalytics.reportAuthPageload(v88.Context.SinglePageSignUpScreen, v366, v355.isAltAttempt);
        end;
    end;
    if v355.props.focusedGuiObject and v355.backButtonRef and v355.backButtonRef.current then
        v355.props.focusGuiObject(v355.backButtonRef.current);
    end;
end;
v170.willUnmount = function(v369) --[[ Line: 1758 ]] --[[ Name: willUnmount ]]
    -- upvalues: v60 (copy)
    v369.isMounted = false;
    v369.isAltAttempt = nil;
    if v60 == true and v369.isAlreadyAuthenticated == true then
        v369.resetDefaultTheme();
    end;
    if v369.keyboardVisibleChanged then
        v369.keyboardVisibleChanged:disconnect();
        v369.keyboardVisibleChanged = nil;
    end;
end;
v170.didUpdate = function(v370, _, v372) --[[ Line: 1772 ]] --[[ Name: didUpdate ]]
    -- upvalues: v142 (copy), v146 (copy), v147 (copy), v137 (copy), v22 (copy)
    if v370.props.focusedGuiObject and v370.props.birthdayContainerRef.current and v370.props.focusedGuiObject:IsDescendantOf(v370.props.birthdayContainerRef.current) then
        v370.updateScrollCanvasTargetPositionY(10);
    else
        v370.updateScrollCanvasTargetPositionY(0);
    end;
    if v142 and v370.state.birthday ~= nil and not v370.state.hasSetIneligibleAgeAtLeastOnce and v370.getUserAge() < v146 then
        v370:setState({
            hasSetIneligibleAgeAtLeastOnce = true
        });
    end;
    if v147 and v370.props.shouldSeeDisplayNamesOnSignup then
        if v370.state.recommendedUsername ~= "" and v370.state.hasEditedUsername and v370.state.hasEditedUsername ~= v372.hasEditedUsername then
            v137(v22.ReccomendedNameEdited, 1);
        end;
        if v370.state.recommendedUsername ~= nil and v370.state.recommendedUsername ~= "" and v370.state.hasEditedUsername == true and v370.state.username == "" and v372.username ~= "" and v370.props.shouldSeeDisplayNamesOnSignup then
            v137(v22.ReccomendedNameManuallyCleared, 1);
        end;
        if v370.state.birthday ~= nil and v372.birthday ~= nil and v370.state.birthday ~= v372.birthday then
            if v370.getUserAge() >= v146 and v372.birthday:GetAgeInYears() < v146 then
                v137(v22.BirthdayChangedToAboveDisplayAge, 1);
            end;
            if v370.getUserAge() < v146 and v372.birthday:GetAgeInYears() >= v146 then
                v137(v22.BirthdayChangedToAboveDisplayAge, 1);
            end;
        end;
    end;
end;
v170.render = function(v373) --[[ Line: 1834 ]] --[[ Name: render ]]
    -- upvalues: v160 (copy), v60 (copy), v7 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy), v169 (copy)
    if v160 and v60 and v373.isAlreadyAuthenticated then
        return v7.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            Child = if v169() then v373:renderWithView() else v373:renderDeprecated()
        });
    elseif v169() then
        return v373:renderWithView();
    else
        return v373:renderDeprecated();
    end;
end;
v170.renderWithView = function(v374) --[[ Line: 1853 ]] --[[ Name: renderWithView ]]
    -- upvalues: v30 (copy), l_RobloxLocaleIdKey_0 (copy), v7 (copy), v139 (copy), v55 (copy), v56 (copy)
    local v375 = v374.getIsSignUpButtonEnabled();
    return v30({})(function(v376) --[[ Line: 1856 ]]
        -- upvalues: v374 (copy), l_RobloxLocaleIdKey_0 (ref), v7 (ref), v139 (ref), v375 (copy), v55 (ref), v56 (ref)
        v374.locale = v376[l_RobloxLocaleIdKey_0];
        return v7.createElement(v139, {
            navigateBack = v374.props.navigateBack, 
            useVerifiedSignup = v374.useVerifiedSignup, 
            useUsernameSuggestions = v374.useUsernameSuggestions, 
            useRefreshButton = v374.useRefreshButton, 
            onGenderChanged = v374.onGenderChanged, 
            getHidePassword = v374.getHidePassword, 
            passwordVisibilityToggleCallback = v374.passwordVisibilityToggleCallback, 
            onBirthdaySelected = v374.onBirthdaySelected, 
            onBirthdayFocused = v374.onBirthdayFocused, 
            onSignUpClick = v374.onSignUpClick, 
            usernameSuggestionClicked = v374.usernameSuggestionClicked, 
            usernameSuggestionsShown = v374.usernameSuggestionsShown, 
            shouldSuggest = v374.shouldSuggest, 
            updateIssueCondition = v374.updateIssueCondition, 
            updateSuggestionControlState = v374.updateSuggestionControlState, 
            logRefreshButtonClicked = v374.logRefreshButtonClicked, 
            loadSuggestions = v374.loadSuggestions, 
            finishSuggestions = v374.finishSuggestions, 
            validUsernameEntered = v374.validUsernameEntered, 
            validPasswordEntered = v374.validPasswordEntered, 
            onUsernameTextBoxFocused = v374.onUsernameTextBoxFocused, 
            onPasswordTextBoxFocused = v374.onPasswordTextBoxFocused, 
            onUsernameTextChanged = v374.onUsernameTextChanged, 
            onUsernameTextValidated = v374.onUsernameTextValidated, 
            onPasswordTextChanged = v374.onPasswordTextChanged, 
            onTextBoxFocusLost = v374.onTextBoxFocusLost, 
            onFocusedTextBoxPositionChanged = v374.onFocusedTextBoxPositionChanged, 
            onAnimationStateChangeCallback = v374.onAnimationStateChangeCallback, 
            onUsernameTextChangeCompletedFromKeyboard = v374.onUsernameTextChangeCompletedFromKeyboard, 
            onPasswordTextChangeCompletedFromKeyboard = v374.onPasswordTextChangeCompletedFromKeyboard, 
            phoneCountryCodeSelectorCallback = v374.phoneCountryCodeSelectorCallback, 
            SetContactMethod = v374.SetContactMethod, 
            SetPhoneNumber = v374.SetPhoneNumber, 
            SetEmail = v374.SetEmail, 
            isUsernameAnimating = v374.state.isUsernameAnimating, 
            isPasswordAnimating = v374.state.isPasswordAnimating, 
            birthday = v374.state.birthday, 
            username = v374.state.username, 
            isSignUpInProgress = v374.state.isSignUpInProgress, 
            onScreenKeyboardHeight = v374.state.onScreenKeyboardHeight, 
            usernameValid = v374.state.usernameValid, 
            passwordValid = v374.state.passwordValid, 
            issueCondition = v374.state.issueCondition, 
            loadingSuggestions = v374.state.loadingSuggestions, 
            isSignUpButtonEnabled = v375, 
            birthdayFocused = v374.state.birthdayFocused, 
            isCountryCodeSearchVisible = v374.state.isCountryCodeSearchVisible, 
            contactMethod = v374.state.contactMethod, 
            signUpError = v374.state.signUpError, 
            UsernameValidator = v55, 
            PasswordValidator = v56, 
            signUpContentFrameRef = v374.scrollingFrameRef, 
            ageTextFieldRef = v374.ageTextFieldRef, 
            usernameTextFieldRef = v374.usernameTextFieldRef, 
            passwordTextFieldRef = v374.passwordTextFieldRef, 
            passwordFrameRef = v374.passwordFrameRef, 
            onSignUpContentFrameCanvasSizeChange = v374.onSignUpContentFrameCanvasSizeChange, 
            scrollCanvasTargetPositionY = v374.scrollCanvasTargetPositionY, 
            updateScrollCanvasTargetPositionY = v374.updateScrollCanvasTargetPositionY, 
            getScrollingFrameCanvasPosition = v374.getScrollingFrameCanvasPosition
        });
    end);
end;
v170.renderDeprecated = function(v377) --[[ Line: 1942 ]] --[[ Name: renderDeprecated ]]
    -- upvalues: l_FormFactor_0 (copy), l_GetFFlagEnableTextFieldContentType_0 (copy), l_FFlagFoundationStylingOnSignUp_0 (copy), v142 (copy), l_DisclaimerLinksVariant_0 (copy), v110 (copy), v111 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v149 (copy), v112 (copy), v144 (copy), v167 (copy), l_withStyle_0 (copy), v30 (copy), l_RobloxLocaleIdKey_0 (copy), v165 (copy), v7 (copy), v37 (copy), l_BackgroundFill_0 (copy), v34 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v168 (copy), l_ImageSetButton_0 (copy), v166 (copy), l_Text_0 (copy), v36 (copy), v35 (copy), v38 (copy), v160 (copy), v60 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), v45 (copy), v94 (copy), v44 (copy), l_DateHelper_0 (copy), v8 (copy), v140 (copy), v40 (copy), v55 (copy), v87 (copy), v126 (copy), v127 (copy), l_game_EngineFeature_0 (copy), v56 (copy), v117 (copy), v41 (copy), v102 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_View_0 (copy), l_Checkbox_0 (copy), v88 (copy), l_InputSize_0 (copy), v42 (copy), v43 (copy)
    local l_birthday_2 = v377.state.birthday;
    local l_username_2 = v377.state.username;
    local v380 = v377.getIsSignUpButtonEnabled();
    local l_isSignUpInProgress_0 = v377.state.isSignUpInProgress;
    local l_gender_1 = v377.state.gender;
    local v383 = v377.props.formFactor == l_FormFactor_0.WIDE;
    local l_isCompactView_0 = v377.props.isCompactView;
    local v385 = 0;
    local v386 = 0;
    local v387 = v377.state.onScreenKeyboardHeight > 0;
    local l_contactMethod_0 = v377.state.contactMethod;
    local l_foundationTokens_0 = v377.props.foundationTokens;
    local l_shouldUseFoundationBackgroundColor_0 = v377.props.shouldUseFoundationBackgroundColor;
    local v391 = l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions;
    local v392 = not v377.validUsernameEntered();
    local v393 = v377.useVerifiedSignup();
    local v394 = v383 and v393 and 12 or 0;
    local v395 = "Authentication.SignUp.Label.ErrorsWithUsername";
    local v396 = "Authentication.SignUp.Label.ErrorsWithPassword";
    local v397 = v377.useUsernameSuggestions();
    local v398 = v377.useRefreshButton();
    local v399 = l_FFlagFoundationStylingOnSignUp_0 and l_isCompactView_0;
    if not l_birthday_2 then
        v395 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst";
        v396 = v395;
        v392 = true;
    elseif v142 and v377.isDisplayNameFieldRequired() and not v377.isValidDisplayNameEntered() then
        v392 = true;
        v396 = "Authentication.SignUp.Response.AgedUpDisplayNameSetFirst";
    elseif v392 then
        v396 = "Authentication.SignUp.Response.UsernameMustBeSetFirst";
    end;
    if v383 then
        if v387 then
            v385 = v377.state.onScreenKeyboardHeight + 10;
        else
            v385 = 48;
            v386 = 24;
        end;
    end;
    local v400 = nil;
    if v399 then
        v400 = l_DisclaimerLinksVariant_0.Default;
    end;
    local v401 = v110();
    local v402 = v377.props.shouldUseMinimalSignup and v401;
    local v403 = v377.props.shouldHideGenderOption and v401;
    local v404 = v377.props.shouldAutofocusOnBirthday and v401;
    local v405 = v111();
    local v406 = v377.props.shouldUsePasswordlessSignup and v405;
    local v407 = v377.getShouldShowVNGAgreements();
    local v408 = v377.getShouldShowKISAAgreements();
    local v409 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
    local v410 = v149 and v409 ~= nil and v409 ~= "";
    local v411 = not v377.state.passkeysAvailable or v410;
    if v112() and v377.props.shouldUsePasskeySignup and v411 then
        v406 = false;
    end;
    local v412 = v144 and v377.props.shouldDisableUsernameAutofill;
    local v413 = v112();
    local v414 = v377.props.shouldUsePasskeySignup and v413 and game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not v411;
    local l_v167_0 = v167;
    local function _(v416) --[[ Line: 2040 ]] --[[ Name: getVerificationLinkingText ]]
        -- upvalues: v377 (copy)
        local v417 = nil;
        local v418 = v377.props.appPolicy.getPlatformAccountName();
        if v418 and v377.props.appPolicy.getUseSingleSignOn() then
            v417 = {
                "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"; 
                platform = v418, 
                ctaButton = v416
            };
        end;
        return v417;
    end;
    return l_withStyle_0(function(v420) --[[ Line: 2053 ]]
        -- upvalues: v30 (ref), v142 (ref), v377 (copy), l_RobloxLocaleIdKey_0 (ref), v402 (copy), v383 (copy), v399 (copy), l_foundationTokens_0 (copy), v165 (ref), v414 (copy), v7 (ref), v37 (ref), l_shouldUseFoundationBackgroundColor_0 (copy), l_BackgroundFill_0 (ref), l_isSignUpInProgress_0 (copy), v34 (ref), l_ImageSetLabel_0 (ref), v385 (ref), v386 (ref), l_GetImageData_0 (ref), v168 (ref), l_ImageSetButton_0 (ref), v166 (ref), l_v167_0 (copy), l_Text_0 (ref), v36 (ref), v35 (ref), v394 (copy), v38 (ref), v393 (copy), v404 (copy), v160 (ref), v60 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v45 (ref), v94 (ref), v44 (ref), l_birthday_2 (copy), l_DateHelper_0 (ref), l_contactMethod_0 (copy), v8 (ref), v140 (ref), v40 (ref), v395 (ref), v412 (copy), v391 (copy), v397 (copy), v55 (ref), v87 (ref), v126 (ref), v127 (ref), v398 (copy), v406 (ref), v396 (ref), v392 (ref), l_game_EngineFeature_0 (ref), v56 (ref), l_username_2 (copy), v403 (copy), v117 (ref), v41 (ref), l_gender_1 (copy), v102 (ref), v380 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_View_0 (ref), l_Checkbox_0 (ref), v88 (ref), l_InputSize_0 (ref), v407 (copy), v408 (copy), v42 (ref), v43 (ref), l_FFlagFoundationStylingOnSignUp_0 (ref), v400 (ref), v387 (copy)
        return v30({
            signUpText = "Authentication.SignUp.Action.CreateAccount", 
            continueText = "Authentication.SignUp.Action.Continue", 
            usernamePlaceholder = "Authentication.SignUp.Message.Username.NoRealNameUse", 
            agedUpUsernamePlaceholder = "Authentication.Login.Label.AgedUpUsername", 
            passwordPlaceholder = "Authentication.SignUp.Label.PasswordPlaceholder", 
            autogeneratedUsernameGuidance = v142 and "Feature.DisplayName.Label.GeneratedUserName" or nil, 
            usernameHelperTitleText = "Authentication.SignUp.Heading.PickAUsername", 
            usernameHelperDescriptionText = "Authentication.SignUp.Description.UsernameHelp", 
            signUpAgreementFullCopyCheckboxText = "Authentication.SignUp.Description.AgreeToTermsWithGuardian.NoParameters", 
            signUpAgreementShortCopyCheckboxText = "Authentication.SignUp.Description.SignUpAgreement.ShortCopy"
        })(function(v421) --[[ Line: 2067 ]]
            -- upvalues: v377 (ref), l_RobloxLocaleIdKey_0 (ref), v402 (ref), v383 (ref), v399 (ref), l_foundationTokens_0 (ref), v142 (ref), v165 (ref), v414 (ref), v7 (ref), v37 (ref), l_shouldUseFoundationBackgroundColor_0 (ref), v420 (copy), l_BackgroundFill_0 (ref), l_isSignUpInProgress_0 (ref), v34 (ref), l_ImageSetLabel_0 (ref), v385 (ref), v386 (ref), l_GetImageData_0 (ref), v168 (ref), l_ImageSetButton_0 (ref), v166 (ref), l_v167_0 (ref), l_Text_0 (ref), v36 (ref), v35 (ref), v394 (ref), v38 (ref), v393 (ref), v404 (ref), v160 (ref), v60 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v45 (ref), v94 (ref), v44 (ref), l_birthday_2 (ref), l_DateHelper_0 (ref), l_contactMethod_0 (ref), v8 (ref), v140 (ref), v40 (ref), v395 (ref), v412 (ref), v391 (ref), v397 (ref), v55 (ref), v87 (ref), v126 (ref), v127 (ref), v398 (ref), v406 (ref), v396 (ref), v392 (ref), l_game_EngineFeature_0 (ref), v56 (ref), l_username_2 (ref), v403 (ref), v117 (ref), v41 (ref), l_gender_1 (ref), v102 (ref), v380 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_View_0 (ref), l_Checkbox_0 (ref), v88 (ref), l_InputSize_0 (ref), v407 (ref), v408 (ref), v42 (ref), v43 (ref), l_FFlagFoundationStylingOnSignUp_0 (ref), v400 (ref), v387 (ref)
            v377.locale = v421[l_RobloxLocaleIdKey_0];
            local v422 = not v402;
            local v423 = v383 and 25 or 48;
            local v424 = UDim2.new(0.5, 0, 0, 49);
            if v399 then
                v423 = v423 + l_foundationTokens_0.Padding.Medium;
                v424 = UDim2.new(0.5, 0, 0, 1 + l_foundationTokens_0.Padding.Medium);
            end;
            if v142 then
                v422 = v377.shouldShowUsernameField() and not v402;
            end;
            local v425 = not v377.getSignupCheckboxDisabled() and v377.props.shouldRequireSignupCheckbox;
            local v426 = v165 and "Authentication.SignUp.Description.SignUpAgreement.FullCopy.CreateAccount" or "Authentication.SignUp.Description.VerificationPage.CreateAccount";
            if v414 then
                v426 = "Authentication.SignUp.Description.VerificationPageMultiStep";
            else
                local l_signUpText_0 = v421.signUpText;
                local v428 = nil;
                local v429 = v377.props.appPolicy.getPlatformAccountName();
                if v429 and v377.props.appPolicy.getUseSingleSignOn() then
                    v428 = {
                        "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"; 
                        platform = v429, 
                        ctaButton = l_signUpText_0
                    };
                end;
                if v428 then
                    local l_signUpText_1 = v421.signUpText;
                    l_signUpText_0 = nil;
                    v428 = v377.props.appPolicy.getPlatformAccountName();
                    if v428 and v377.props.appPolicy.getUseSingleSignOn() then
                        l_signUpText_0 = {
                            "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"; 
                            platform = v428, 
                            ctaButton = l_signUpText_1
                        };
                    end;
                    v426 = l_signUpText_0;
                end;
            end;
            local v431 = "";
            if not v377.getSignupCheckboxDisabled() then
                if v377.props.signupLegalDisclaimerTextVariant == 1 then
                    if v425 then
                        v431 = v421.signUpAgreementFullCopyCheckboxText;
                    else
                        v426 = v414 and "Authentication.SignUp.Description.SignUpAgreement.FullCopy.Continue" or "Authentication.SignUp.Description.SignupAgreement.FullCopy.CreateAccount";
                    end;
                elseif v377.props.signupLegalDisclaimerTextVariant == 2 and v425 then
                    v431 = v421.signUpAgreementShortCopyCheckboxText;
                end;
            end;
            local v432 = true;
            if v377.props.shouldShowBackButton ~= nil then
                v432 = v377.props.shouldShowBackButton;
            end;
            local l_createElement_0 = v7.createElement;
            local l_v37_0 = v37;
            local v435 = {
                BackgroundTransparency = 1, 
                includeStatusBar = true, 
                buttonRef = v377.props.containerRef, 
                renderFullscreenBackground = function() --[[ Line: 2127 ]] --[[ Name: renderFullscreenBackground ]]
                    -- upvalues: v7 (ref), v383 (ref), l_shouldUseFoundationBackgroundColor_0 (ref), l_foundationTokens_0 (ref), v420 (ref), l_BackgroundFill_0 (ref)
                    return v7.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = v383 and 1 or 0, 
                        BackgroundColor3 = if l_shouldUseFoundationBackgroundColor_0 then l_foundationTokens_0.Color.Surface.Surface_0.Color3 else v420.Theme.BackgroundUIDefault.Color
                    }, {
                        Background = v383 and v7.createElement(l_BackgroundFill_0, {
                            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
                        }), 
                        Mask = v383 and v7.createElement("ImageLabel", {
                            ZIndex = 2, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundColor3 = Color3.new(0, 0, 0), 
                            BackgroundTransparency = 0.5
                        })
                    });
                end
            };
            local v436 = {
                UserInputSink = l_isSignUpInProgress_0 and v7.createElement("ImageButton", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = ""
                }), 
                UnderAgeAlert = v377.state.shouldShowUnderAgeAlert and v7.createElement(v34, {
                    ZIndex = 3, 
                    onDismiss = function() --[[ Line: 2156 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v377 (ref)
                        v377:setState({
                            shouldShowUnderAgeAlert = false
                        });
                    end
                })
            };
            local l_createElement_1 = v7.createElement;
            local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
            local v439 = {
                Size = UDim2.new(1, 0, 1, -v385), 
                Position = UDim2.new(0.5, 0, 0, v386), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                ImageColor3 = if l_shouldUseFoundationBackgroundColor_0 then l_foundationTokens_0.Color.Surface.Surface_0.Color3 else v420.Theme.BackgroundUIDefault.Color, 
                ClipsDescendants = true
            };
            local v440 = {
                SizeConstraint = v7.createElement("UISizeConstraint", {
                    MaxSize = v168
                }), 
                HeaderFrame = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1
                }, {
                    BackButton = v432 and v7.createElement(l_ImageSetButton_0, {
                        Size = v166, 
                        AutoButtonColor = false, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 12, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = l_v167_0, 
                        ImageColor3 = v420.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0, 
                        [v7.Event.Activated] = v377.onCloseButtonClicked, 
                        [v7.Ref] = v377.backButtonRef
                    }), 
                    Title = v421.signUpText and if v399 then v7.createElement(l_Text_0, {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Text = v421.signUpText or "", 
                        fontStyle = l_foundationTokens_0.Typography.HeadingSmall, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    }) else v7.createElement(v36, {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        fitAxis = v35.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        Text = v421.signUpText or "", 
                        TextWrapped = true, 
                        Font = v420.Font.CaptionHeader.Font, 
                        TextSize = v420.Font.BaseSize * v420.Font.Header1.RelativeSize, 
                        TextColor3 = v420.Theme.TextEmphasis.Color, 
                        TextTransparency = v420.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Divider = not v399 and v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0.5, 0, 0, 48), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = l_shouldUseFoundationBackgroundColor_0 and 1 or 0, 
                    BackgroundColor3 = v420.Theme.UIEmphasis.Color
                })
            };
            local l_createElement_2 = v7.createElement;
            local l_FitScrollingFrame_0 = v35.FitScrollingFrame;
            local v446 = {
                Size = UDim2.new(1, 0, 1, -(49 + v394)), 
                Position = v424, 
                AnchorPoint = Vector2.new(0.5, 0), 
                fitFields = {
                    CanvasSize = v35.FitAxis.Height
                }, 
                ScrollBarThickness = 0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Selectable = false, 
                ScrollingEnabled = not (v377.state.isUsernameAnimating or v377.state.isPasswordAnimating), 
                CanvasPosition = v377.scrollCanvasTargetPositionY:map(function(v443) --[[ Line: 2246 ]]
                    -- upvalues: v377 (ref)
                    return v377.getScrollingFrameCanvasPosition(v443);
                end), 
                [v7.Ref] = v377.scrollingFrameRef, 
                [v7.Change.CanvasSize] = function(_) --[[ Line: 2250 ]]
                    -- upvalues: v377 (ref)
                    local v445 = v377.scrollCanvasTargetPositionY:getValue();
                    v377.scrollingFrameRef.current.CanvasPosition = v377.getScrollingFrameCanvasPosition(v445);
                end
            };
            local v447 = {
                ContentPadding = v7.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, v423)
                }), 
                ListLayout = v7.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 5)
                })
            };
            local v448 = false;
            if v377.getBirthdayVariant() == 0 then
                v448 = v7.createElement(v38, {
                    layoutOrder = 1, 
                    onBirthdaySelected = v377.onBirthdaySelected, 
                    onBirthdayFocused = v377.onBirthdayFocused, 
                    autoFocusOnMount = v393 or v404, 
                    buttonRef = v377.props.defaultRef, 
                    preferredInput = v377.props.preferredInput, 
                    birthdayContainerRef = v377.props.birthdayContainerRef, 
                    forceDarkTheme = v160 and v60 and v377.isAlreadyAuthenticated, 
                    enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
                });
            end;
            v447.BirthdayBar = v448;
            v448 = false;
            if v377.getBirthdayVariant() ~= 0 then
                v448 = v7.createElement(v45, {
                    layoutOrder = 1, 
                    variant = v377.getBirthdayVariant(), 
                    textInputHeight = 36, 
                    hasBirthdayError = v377.state.birthdayValid == v94.Invalid, 
                    onAgeChange = v377.onAgeChanged, 
                    onAgeAndMonthChange = v377.onAgeAndMonthChanged, 
                    onMonthAndYearChange = v377.onMonthAndYearChanged, 
                    ageTextFieldRef = v377.ageTextFieldRef, 
                    screenSize = v377.props.screenSize
                });
            end;
            v447.AgeInput = v448;
            v447.ContactInfoField = v393 and v7.createElement(v44, {
                layoutOrder = 2, 
                Under13 = l_birthday_2 and l_DateHelper_0:isRecentOrFutureDate(l_birthday_2.Month, l_birthday_2.Day, l_birthday_2.Year + 13), 
                SetContactMethod = v377.SetContactMethod, 
                SetPhoneNumber = v377.SetPhoneNumber, 
                SetEmail = v377.SetEmail, 
                contactMethod = l_contactMethod_0, 
                phoneCountryCodeSelectorCallback = v377.phoneCountryCodeSelectorCallback
            });
            v447.BackgroundPanel = v393 and v7.createElement("Frame", {
                Size = UDim2.new(0, 0, 0, 6), 
                LayoutOrder = 3, 
                BackgroundTransparency = 1
            }, {
                LightPanel = v7.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 100000, 0, 100000), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    BackgroundColor3 = v420.Theme.UIDefault.Color, 
                    AnchorPoint = Vector2.new(0.5, 0)
                })
            });
            v447.DisplayName = if v142 and v377.shouldShowDisplayNameField() then v8.createElement(v140, {
                authEventAnalytics = v377.props.authEventAnalytics, 
                birthday = if l_birthday_2 then l_birthday_2:FormatForEndpoint() else "", 
                bypassDisplayNameField = v377.state.bypassDisplayNameField, 
                focusedTextBoxPositionChangedCallback = v377.onFocusedTextBoxPositionChanged, 
                layoutOrder = 4, 
                onAnimationStateChangeCallback = v377.onAnimationStateChangeCallback, 
                onDisplayNameTextChanged = v377.onDisplayNameTextChanged, 
                onReturnPressedFromOnScreenKeyboard = v377.onDisplayNameTextChangeCompletedFromKeyboard, 
                pillClicked = v377.state.pillClicked, 
                resetPillClicked = v377.resetPillClicked, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                setUsernameRecommendation = v377.setUsernameRecommendation, 
                shouldDisableRecommendation = v377.state.hasEditedUsername, 
                textBoxFocusedCallback = v377.onDisplayNameTextBoxFocused, 
                textBoxFocusLostCallback = v377.onTextBoxFocusLost, 
                textBoxRef = v377.displayNameTextFieldRef, 
                updateBypassDisplayNameField = v377.updateBypassDisplayNameField, 
                updatePillClicked = v377.updatePillClicked
            }) else nil;
            v447.UsernameValidator = v422 and v7.createElement(v40, {
                layoutOrder = v142 and 5 or 4, 
                titleTextKey = "Authentication.Login.Label.Username", 
                summaryErrorTextKey = v395, 
                prerequisiteMet = l_birthday_2 and true or false, 
                textInputType = if v412 then nil else v391, 
                onInputTextChanged = v377.onUsernameTextChanged, 
                onInputTextValidated = v397 and v377.onUsernameTextValidated or v377.onUsernameTextChanged, 
                validator = v55, 
                prefilledText = if v142 then v377.state.recommendedUsername else nil, 
                placeholderText = if v142 then v377.getUsernamePlaceholder(v421) else v421.usernamePlaceholder, 
                validatorAdditionalProps = {
                    birthday = l_birthday_2 and l_birthday_2:FormatForEndpoint() or "", 
                    context = v87.Signup
                }, 
                textBoxFocusedCallback = v377.onUsernameTextBoxFocused, 
                textBoxFocusLostCallback = if v142 then v377.onUsernameTextBoxFocusLost else v377.onTextBoxFocusLost, 
                focusedTextBoxPositionChangedCallback = v377.onFocusedTextBoxPositionChanged, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                onReturnPressedFromOnScreenKeyboard = v377.onUsernameTextChangeCompletedFromKeyboard, 
                onAnimationStateChangeCallback = v377.onAnimationStateChangeCallback, 
                textBoxRef = v377.usernameTextFieldRef, 
                pillClicked = v377.state.pillClicked, 
                updatePillClicked = v377.updatePillClicked, 
                resetPillClicked = v377.resetPillClicked, 
                issueCondition = v377.state.issueCondition, 
                updateIssueCondition = v377.updateIssueCondition, 
                loadingSuggestions = v377.state.loadingSuggestions, 
                paddingBottomOverride = v142 and v377.props.shouldSeeDisplayNamesOnSignup and v377.getUsernameGuidanceText(v421) and -5 or nil, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v447.UsernameGuidanceText = if v142 and v377.props.shouldSeeDisplayNamesOnSignup and v377.getUsernameGuidanceText(v421) then v7.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 5
            }, {
                Padding = v7.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 5)
                }), 
                Label = v7.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Font = v420.Font.CaptionBody.Font, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = v377.getUsernameGuidanceText(v421), 
                    TextColor3 = v420.Theme.TextDefault.Color, 
                    TextSize = v420.Font.BaseSize * v420.Font.CaptionBody.RelativeSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            }) else nil;
            v447.SuggestionsFrame = v422 and v397 and v7.createElement(v126, {
                layoutOrder = v142 and 5 or 4, 
                textBoxRef = v377.usernameTextFieldRef, 
                usernameValid = v377.state.usernameValid, 
                birthday = l_birthday_2 and l_birthday_2:FormatForEndpoint() or "", 
                suggest = v127, 
                context = v87.Signup, 
                pillClicked = v377.state.pillClicked, 
                updatePillClicked = v377.updatePillClicked, 
                resetPillClicked = v377.resetPillClicked, 
                issueCondition = v377.state.issueCondition, 
                usernameSuggestionClicked = v377.usernameSuggestionClicked, 
                usernameSuggestionsShown = v377.usernameSuggestionsShown, 
                shouldSuggest = v377.shouldSuggest, 
                updateSuggestionControlState = v377.updateSuggestionControlState, 
                useRefreshButton = v398, 
                logRefreshButtonClicked = v377.logRefreshButtonClicked, 
                loadSuggestions = v377.loadSuggestions, 
                finishSuggestions = v377.finishSuggestions, 
                loadingSuggestions = v377.state.loadingSuggestions, 
                padding = {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }
            });
            v447.PasswordValidator = not v402 and not v406 and v7.createElement(v40, {
                disabled = v377.state.birthdayFocused, 
                layoutOrder = v142 and 6 or 5, 
                titleTextKey = "CommonUI.Messages.Label.Password", 
                summaryErrorTextKey = v396, 
                prerequisiteMet = not v392, 
                textInputType = l_game_EngineFeature_0 and Enum.TextInputType.NewPassword or Enum.TextInputType.Password, 
                onInputTextChanged = v377.onPasswordTextChanged, 
                onInputTextValidated = v377.onPasswordTextChanged, 
                validator = v56, 
                placeholderText = v421.passwordPlaceholder, 
                validatorAdditionalProps = {
                    username = l_username_2
                }, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                textBoxFocusedCallback = v377.onPasswordTextBoxFocused, 
                textBoxFocusLostCallback = v377.onTextBoxFocusLost, 
                focusedTextBoxPositionChangedCallback = v377.onFocusedTextBoxPositionChanged, 
                onReturnPressedFromOnScreenKeyboard = v377.onPasswordTextChangeCompletedFromKeyboard, 
                onAnimationStateChangeCallback = v377.onAnimationStateChangeCallback, 
                textBoxRef = v377.passwordTextFieldRef, 
                centralOverlayBlocksInput = v393, 
                captureFocusOnTapStart = not v377.state.isCountryCodeSearchVisible
            });
            v447.GenderSelector = not v403 and v117() ~= 2 and v7.createElement(v41, {
                layoutOrder = v142 and 8 or 7, 
                gender = l_gender_1, 
                onGenderChanged = v377.onGenderChanged, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v447.Spacing = v7.createElement("Frame", {
                LayoutOrder = v142 and 9 or 8, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 38)
            });
            v447.SignUpButton = if v399 then v7.createElement(v102.Button, {
                variant = v102.Enums.ButtonVariant.Emphasis, 
                LayoutOrder = v142 and 10 or 9, 
                text = if v414 then v421.continueText else v421.signUpText, 
                size = v102.Enums.InputSize.Medium, 
                width = UDim.new(1, 0), 
                isDisabled = not v380, 
                isLoading = l_isSignUpInProgress_0, 
                onActivated = v377.onSignUpClick
            }) else v7.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                layoutOrder = v142 and 10 or 9, 
                size = UDim2.new(1, 0, 0, 36), 
                text = if v414 then v421.continueText else v421.signUpText, 
                isDisabled = not v380, 
                isLoading = l_isSignUpInProgress_0, 
                onActivated = v377.onSignUpClick
            });
            v447.CheckboxContainer = v425 and v8.createElement(l_View_0, {
                tag = "auto-xy padding-x-xxlarge padding-y-large row gap-medium", 
                LayoutOrder = v142 and 11 or 10
            }, {
                SignUpAgreementCheckbox = v8.createElement(l_Checkbox_0, {
                    isChecked = v377.state.signupAgreementsChecked, 
                    isDisabled = false, 
                    onActivated = function() --[[ Line: 2507 ]] --[[ Name: onActivated ]]
                        -- upvalues: v377 (ref), v88 (ref)
                        v377.props.authEventAnalytics.reportAuthFormInteraction(v88.Context.SinglePageSignUpScreen, v88.Field.TosCheckbox, (tostring(not v377.state.signupAgreementsChecked)));
                        v377:setState({
                            signupAgreementsChecked = not v377.state.signupAgreementsChecked
                        });
                    end, 
                    size = l_InputSize_0.Small, 
                    LayoutOrder = 1, 
                    label = ""
                }), 
                Text = v8.createElement(l_Text_0, {
                    tag = "text-body-small text-align-x-left text-wrap auto-xy shrink", 
                    LayoutOrder = 2, 
                    Text = v431
                })
            });
            v447.DisclaimerText = not (v407 or v408 or v425) and v7.createElement(v42, {
                layoutOrder = v142 and 11 or 10, 
                textXAlignment = Enum.TextXAlignment.Center, 
                paragraphTextKeys = {
                    v426
                }, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v447.DisclaimerLinks = not (v407 or v408) and v7.createElement(v43, {
                LayoutOrder = v142 and 12 or 11, 
                variant = if l_FFlagFoundationStylingOnSignUp_0 then v400 else nil, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v447.ScrollPadding = v387 and v7.createElement("Frame", {
                LayoutOrder = v142 and 13 or 12, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v377.state.onScreenKeyboardHeight * 2)
            });
            v440.SignUpContentFrame = l_createElement_2(l_FitScrollingFrame_0, v446, v447);
            v440.Footer = v393 and v383 and v7.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 12), 
                Position = UDim2.new(0, 0, 1, -12), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Rounding = v7.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 2, 0), 
                    Position = UDim2.new(0, 0, -1, 0), 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(9, 9, 9, 9), 
                    Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                    ImageColor3 = v420.Theme.UIDefault.Color
                })
            });
            v436.Container = l_createElement_1(l_l_ImageSetLabel_0_0, v439, v440);
            return l_createElement_0(l_v37_0, v435, v436);
        end);
    end);
end;
v170 = v9.connect(function(v449, _) --[[ Line: 2578 ]]
    return {
        formFactor = v449.FormFactor, 
        screenSize = v449.ScreenSize
    };
end, function(v451) --[[ Line: 2583 ]]
    -- upvalues: v59 (copy), v130 (copy), l_AnalyticsEvents_0 (copy), l_EventConstants_0 (copy), v73 (copy), v51 (copy), v50 (copy), v133 (copy), v131 (copy), v135 (copy), v134 (copy), v53 (copy), v54 (copy), v66 (copy), v65 (copy), v68 (copy), v69 (copy), v77 (copy)
    return {
        signUp = function(v452, v453, v454, v455, v456, v457, v458, v459, v460, v461, v462, v463, v464, v465) --[[ Line: 2585 ]] --[[ Name: signUp ]]
            -- upvalues: v451 (copy), v59 (ref)
            return v451(v59(v452, v453, v454, v455, v456, v457, v458, v459, v460, v461, v462, v463, v464, v465));
        end, 
        agreeToPhoneNumberVerification = function(_, v467, v468) --[[ Line: 2620 ]] --[[ Name: agreeToPhoneNumberVerification ]]
            -- upvalues: v451 (copy), v130 (ref)
            return v451(v130({
                verificationChallengeCallback = v467, 
                phoneNumber = v468
            }));
        end, 
        openKISAUserAgreements = function(v469) --[[ Line: 2627 ]] --[[ Name: openKISAUserAgreements ]]
            -- upvalues: l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), v451 (copy), v73 (ref)
            l_AnalyticsEvents_0.sendPageLoadEvent(l_EventConstants_0.ctx.kisaAgreements, l_EventConstants_0.origin.signup);
            return v451(v73(v469));
        end, 
        setBackNavigationDisabled = function(v470) --[[ Line: 2632 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v451 (copy), v51 (ref)
            return v451(v51(v470));
        end, 
        navigateBack = function() --[[ Line: 2635 ]] --[[ Name: navigateBack ]]
            -- upvalues: v451 (copy), v50 (ref)
            return v451(v50());
        end, 
        showErrorToast = function() --[[ Line: 2638 ]] --[[ Name: showErrorToast ]]
            -- upvalues: v451 (copy), v133 (ref)
            return v451(v133({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        verifyPhoneNumber = function(_, v472, v473, v474, v475, v476) --[[ Line: 2641 ]] --[[ Name: verifyPhoneNumber ]]
            -- upvalues: v451 (copy), v131 (ref)
            return v451(v131({
                verifyPhoneNumberCallback = v472, 
                phoneNumber = v474, 
                deliveryTarget = v475, 
                challenge = v473, 
                useEmailOptionClickedCallback = v476
            }));
        end, 
        showErrorMessageToast = function(v477) --[[ Line: 2657 ]] --[[ Name: showErrorMessageToast ]]
            -- upvalues: v451 (copy), v135 (ref), v134 (ref)
            return v451(v135({
                toastType = v134.NetworkingError, 
                toastMessage = v477
            }));
        end, 
        showVNGUserAgreementsPopup = function(v478, v479, v480) --[[ Line: 2663 ]] --[[ Name: showVNGUserAgreementsPopup ]]
            -- upvalues: v451 (copy), v53 (ref), v54 (ref)
            return v451(v53(v54.VNGUserAgreementsPopup, {
                agreements = v478, 
                isSignup = true, 
                agreementAccepted = v479, 
                agreementDeclined = v480
            }, {
                DisableBackButtonClose = true
            }));
        end, 
        showVNGDCForm = function() --[[ Line: 2673 ]] --[[ Name: showVNGDCForm ]]
            -- upvalues: v451 (copy), v53 (ref), v54 (ref)
            v451(v53(v54.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end, 
        closeCentralOverlay = function() --[[ Line: 2678 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v451 (copy), v66 (ref)
            return v451(v66());
        end, 
        openAccountSwitchingErrorOverlay = function(v481, v482, v483, v484, v485, v486, v487, v488) --[[ Line: 2681 ]] --[[ Name: openAccountSwitchingErrorOverlay ]]
            -- upvalues: v451 (copy), v65 (ref)
            return v451(v65(v481, v482, v483, v484, v485, v486, v487, v488, true));
        end, 
        resetAppState = function() --[[ Line: 2703 ]] --[[ Name: resetAppState ]]
            -- upvalues: v451 (copy), v68 (ref)
            return v451(v68());
        end, 
        logoutWithoutShowConfirmation = function(v489, v490) --[[ Line: 2706 ]] --[[ Name: logoutWithoutShowConfirmation ]]
            -- upvalues: v451 (copy), v69 (ref)
            return v451(v69(v489, v490));
        end, 
        openEmailOtp = function(v491) --[[ Line: 2710 ]] --[[ Name: openEmailOtp ]]
            -- upvalues: v451 (copy), v77 (ref)
            v451(v77(v491));
        end, 
        showAccountLinkingAlert = function(v492) --[[ Line: 2713 ]] --[[ Name: showAccountLinkingAlert ]]
            -- upvalues: v451 (copy), v53 (ref), v54 (ref)
            return v451(v53(v54.AccountLinkingAlert, {
                alertType = v492
            }));
        end
    };
end)(v170);
v170 = l_RoactServices_0.connect({
    networking = v19, 
    guiService = l_AppGuiService_0, 
    authEventAnalytics = v16, 
    analytics = v17, 
    loggingProtocol = l_AppLogging_0
})(v170);
v170 = l_RoactAppPolicy_0.connect(function(v493, _) --[[ Line: 2729 ]]
    return {
        appPolicy = v493
    };
end)(v170);
v170 = v21.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.SignupLayer, 
    l_AppBtidLayers_0.IosPasswordSavingLayer
}, function(v495, _) --[[ Line: 2738 ]]
    -- upvalues: l_AppBtidLayers_0 (copy), v142 (copy), v145 (copy)
    local v497 = v495[l_AppBtidLayers_0.SignupLayer] or {};
    local v498 = v495[l_AppBtidLayers_0.IosPasswordSavingLayer] or {};
    local v499 = if v142 then v497.shouldSeeDisplayNamesOnSignup else nil;
    if v145 then
        v499 = true;
    end;
    return {
        useVerifiedSignupPage = v497.contactMethodRequired, 
        arePasswordFieldsPlaintext = v497.ArePasswordFieldsPlaintext, 
        shouldUseUsernameSuggestions = v497.usernameSuggestionsEnabled, 
        enableRefreshButton = v497.suggestionRefreshButtonEnabled, 
        shouldUseMinimalSignup = v497.shouldUseMinimalSignup, 
        shouldHideGenderOption = v497.shouldHideGenderOption, 
        shouldAutofocusOnBirthday = v497.shouldAutofocusOnBirthday, 
        shouldUsePasswordlessSignup = v497.shouldUsePasswordlessSignup, 
        shouldUsePasskeySignup = v497.shouldUsePasskeySignup, 
        shouldAutomaticallyPromptForPasskey = v497.shouldAutomaticallyPromptForPasskey, 
        birthdayPickerVariant = v497.birthdayPickerVariant, 
        shouldSeeDisplayNamesOnSignup = v499, 
        shouldShowKoreanKISASignUpFlow = v497.shouldShowKoreanKISASignUpFlow, 
        shouldDisableUsernameAutofill = v497.shouldDisableUsernameAutofill, 
        shouldRequireSignupCheckbox = v497.shouldRequireSignupCheckbox, 
        signupLegalDisclaimerTextVariant = v497.signupLegalDisclaimerTextVariant, 
        isIosAuthServiceEnabled = v498.enableNewIosPasswordSaving or false
    };
end)(v170);
v170 = l_withNavigationProps_0(function(_, v501) --[[ Line: 2769 ]]
    return v501;
end)(v170);
local function v504(v502) --[[ Line: 2774 ]] --[[ Name: SinglePageSignUpWithAuditContent ]]
    -- upvalues: l_AuditContentContext_0 (copy), v7 (copy), v170 (ref), v23 (copy)
    local v503 = l_AuditContentContext_0.useAuditContentContext();
    return v7.createElement(v170, v23.Dictionary.join(v502, {
        capturedAuditContent = v503.capturedAuditContent, 
        additionalAuditContent = v503.additionalAuditContent
    }));
end;
return function(v505) --[[ Line: 2786 ]]
    -- upvalues: v14 (copy), v161 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), l_FFlagFoundationStylingOnSignUp_0 (copy), l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 (copy), l_useTokens_0 (copy), v21 (copy), l_AppBtidLayers_0 (copy), v8 (copy), l_GetFFlagEnablePreferredInputForSignUp_0 (copy), l_usePreferredInput_0 (copy), l_FFlagEnableSignUpExitModal_0 (copy), v156 (copy), l_useDispatch_0 (copy), v50 (copy), v53 (copy), v54 (copy), v66 (copy), l_useSignUpPageNavigationBindings_0 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), v7 (copy), l_AuditContentContext_0 (copy), v504 (copy), v23 (copy), l_FFlagHideBackButtonOnSignUpPage_0 (copy), v170 (ref)
    local v506 = v14.useFocusedGuiObject();
    local v507 = v14.useFocusGuiObject();
    local v508 = if v161 then l_useBreakpointXOrSmaller_0(v11.Keys.Medium) else nil;
    local v509 = if not not l_FFlagFoundationStylingOnSignUp_0 or l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 then l_useTokens_0() else nil;
    local v511 = v21.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AuthenticationStylingLayer
    }, function(v510) --[[ Line: 2796 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldUseFoundationBackgroundColor = (v510[l_AppBtidLayers_0.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
        };
    end);
    local v512 = l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 and v511.shouldUseFoundationBackgroundColor;
    local v513, v514 = v8.useState(false);
    local v515 = if l_GetFFlagEnablePreferredInputForSignUp_0() then l_usePreferredInput_0() else nil;
    local v516 = l_FFlagEnableSignUpExitModal_0 and v515 == v11.Input.Directional;
    local v517 = nil;
    if v156 then
        local v518 = l_useDispatch_0();
        local l_v518_0 = v518 --[[ copy: 12 -> 17 ]];
        local v520 = v8.useCallback(function() --[[ Line: 2814 ]]
            -- upvalues: v516 (copy), v513 (copy), l_v518_0 (copy), v50 (ref), v53 (ref), v54 (ref), v66 (ref), v507 (copy), v506 (copy)
            if not v516 then
                return;
            elseif not v513 then
                l_v518_0(v50());
                return;
            else
                l_v518_0(v53(v54.SignUpExitModal, {
                    onClose = function() --[[ Line: 2823 ]] --[[ Name: onClose ]]
                        -- upvalues: l_v518_0 (ref), v66 (ref), v507 (ref), v506 (ref)
                        l_v518_0(v66());
                        l_v518_0(function() --[[ Line: 2825 ]]
                            -- upvalues: v507 (ref), v506 (ref)
                            v507(v506);
                        end);
                    end, 
                    onConfirm = function() --[[ Line: 2829 ]] --[[ Name: onConfirm ]]
                        -- upvalues: l_v518_0 (ref), v66 (ref), v50 (ref)
                        l_v518_0(v66());
                        l_v518_0(v50());
                    end
                }));
                return;
            end;
        end, {
            v513, 
            v516, 
            v506, 
            v507, 
            v518
        });
        v517 = l_useSignUpPageNavigationBindings_0(if v516 then v520 else nil);
    elseif v516 then
        local v521 = l_useDispatch_0();
        local l_v521_0 = v521 --[[ copy: 12 -> 16 ]];
        local v523 = v8.useCallback(function() --[[ Line: 2848 ]]
            -- upvalues: v513 (copy), l_v521_0 (copy), v50 (ref), v53 (ref), v54 (ref), v66 (ref), v507 (copy), v506 (copy)
            if not v513 then
                l_v521_0(v50());
                return;
            else
                l_v521_0(v53(v54.SignUpExitModal, {
                    onClose = function() --[[ Line: 2854 ]] --[[ Name: onClose ]]
                        -- upvalues: l_v521_0 (ref), v66 (ref), v507 (ref), v506 (ref)
                        l_v521_0(v66());
                        l_v521_0(function() --[[ Line: 2856 ]]
                            -- upvalues: v507 (ref), v506 (ref)
                            v507(v506);
                        end);
                    end, 
                    onConfirm = function() --[[ Line: 2860 ]] --[[ Name: onConfirm ]]
                        -- upvalues: l_v521_0 (ref), v66 (ref), v50 (ref)
                        l_v521_0(v66());
                        l_v521_0(v50());
                    end
                }));
                return;
            end;
        end, {
            v513
        });
        v517 = l_useSignUpPageNavigationBindings_0(v523);
    else
        v517 = l_useSignUpPageNavigationBindings_0();
    end;
    local v524 = nil;
    local v525 = nil;
    local v526, v527 = v14.useDefaultFocusBehavior(v517);
    v524 = v526;
    v525 = v527;
    v526 = v8.useRef(nil);
    if l_GetFFlagEnableAuditForSinglePageSignUp_0() then
        return v7.createElement(l_AuditContentContext_0.Provider, nil, {
            SignUpPage = v7.createElement(v504, v23.Dictionary.join(v505, {
                signUpStarted = if v516 then v513 else nil, 
                setSignUpStarted = if v516 then v514 else nil, 
                shouldShowBackButton = if l_FFlagHideBackButtonOnSignUpPage_0 then not v516 else nil, 
                preferredInput = v515, 
                focusedGuiObject = v506, 
                focusGuiObject = v507, 
                defaultRef = v524, 
                containerRef = v525, 
                birthdayContainerRef = v526, 
                isCompactView = v508, 
                foundationTokens = v509, 
                shouldUseFoundationBackgroundColor = v512
            }))
        });
    else
        return v7.createElement(v170, v23.Dictionary.join(v505, {
            signUpStarted = if v516 then v513 else nil, 
            setSignUpStarted = if v516 then v514 else nil, 
            shouldShowBackButton = if l_FFlagHideBackButtonOnSignUpPage_0 then not v516 else nil, 
            preferredInput = v515, 
            focusedGuiObject = v506, 
            focusGuiObject = v507, 
            defaultRef = v524, 
            containerRef = v525, 
            birthdayContainerRef = v526, 
            isCompactView = v508, 
            foundationTokens = v509, 
            shouldUseFoundationBackgroundColor = v512
        }));
    end;
end;