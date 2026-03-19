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
local l_FFlagHideBackButtonOnSignUpPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideBackButtonOnSignUpPage;
local l_FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp;
local l_FFlagUseBirthdayDropdownForGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseBirthdayDropdownForGamepad;
local v159 = game:DefineFastFlag("SignUpPageThemeSwitchFix", false);
local v160 = game:DefineFastFlag("UseBreakpointOnSignUp", false);
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign;
local l_GetFFlagEnableAuditForSinglePageSignUp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp;
local l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSignupFoundationalizeBackgroundAndText;
local v164 = game:DefineFastFlag("UseLongFormSignupComplianceTextByDefault", false);
local v165 = UDim2.new(0, 36, 0, 36);
local v166 = l_Images_0["icons/navigation/close"];
local v167 = Vector2.new(540, 1080);
game:DefineFastFlag("LuaVerifiedSignup2", false);
game:DefineFastFlag("LuaVerifiedSignupExperiment2", false);
game:DefineFastFlag("CheckSignupValidityOnRender", false);
local v168 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppSignUpPageRefactor);
local v169 = v7.PureComponent:extend("SinglePageSignUp");
v169.init = function(v170) --[[ Line: 265 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp_0 (copy), l_GetCredentialsAvailabilityStore_0 (copy), v94 (copy), v92 (copy), v7 (copy), v60 (copy), v61 (copy), v64 (copy), l_MemStorageService_0 (copy), v63 (copy), v67 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_GuiService_0 (copy), v159 (copy), v153 (copy), v70 (copy), v72 (copy), v71 (copy), l_AnalyticsEvents_0 (copy), l_EventConstants_0 (copy), l_KISAComplianceUtils_0 (copy), v23 (copy), v110 (copy), v111 (copy), v112 (copy), v141 (copy), v142 (copy), l_FFlagUseBirthdayDropdownForGamepad_0 (copy), v88 (copy), v24 (copy), l_Birthday_0 (copy), l_DateHelper_0 (copy), v128 (copy), v96 (copy), v97 (copy), v148 (copy), v132 (copy), v91 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v149 (copy), v122 (copy), v95 (copy), v93 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), v89 (copy), l_AccountLinkingAlertType_0 (copy), v115 (copy), v116 (copy), v57 (copy), l_HttpService_0 (copy), v118 (copy), l_ExperienceService_0 (copy), v147 (copy), v137 (copy), v22 (copy), l_UserAgreementsCounterNames_0 (copy), v120 (copy), v125 (copy), v146 (copy), l_Constants_1 (copy), l_ValidateCode_0 (copy), v80 (copy), v143 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy)
    local v171 = nil;
    local v172 = nil;
    if l_FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp_0 then
        local v173 = l_GetCredentialsAvailabilityStore_0(false);
        v171 = v173.getFido2Available(false);
        v172 = v173.getPasswordsAvailable(false);
    end;
    v170.state = {
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
        passkeysAvailable = v171, 
        isCredentialsProtocolRegisterPasswordAvailable = v172, 
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
    v170.backButtonRef = v7.createRef();
    v170.isAlreadyAuthenticated = false;
    if v60 == true then
        v170.isAlreadyAuthenticated = v61.fromLocalStorage().userId ~= -1;
    end;
    v170.resetDefaultTheme = function() --[[ Line: 334 ]]
        -- upvalues: v64 (ref), l_MemStorageService_0 (ref), v63 (ref)
        local v174 = v64.getAuthenticatedTheme();
        if v174 ~= "" then
            l_MemStorageService_0:Fire(v63.ThemeUpdate, v174);
        end;
    end;
    v170.logoutAllLoggedInUsersCallback = function() --[[ Line: 342 ]]
        -- upvalues: v170 (copy), v64 (ref), v61 (ref), v67 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_GuiService_0 (ref)
        local l_networking_0 = v170.props.networking;
        local v176 = v64.getAccountBlob();
        local v177 = v61.fromLocalStorage().userId ~= -1;
        v170:setState({
            signUpError = false, 
            isSignUpButtonEnabled = false, 
            isSignUpInProgress = false
        });
        v67(l_networking_0, v176):await();
        if v177 == true then
            v170.props.resetAppState();
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.CredentialValue, "");
            l_AppStorageService_0:Flush();
            v170.props.logoutWithoutShowConfirmation(l_networking_0, l_GuiService_0);
        end;
        v170:setState({
            signUpError = false
        });
        v170.props.closeCentralOverlay();
    end;
    v170.closeOverlayAndDisableSwitcherErrors = function() --[[ Line: 370 ]]
        -- upvalues: v170 (copy)
        v170.props.closeCentralOverlay();
    end;
    v170.onCloseButtonClicked = function() --[[ Line: 374 ]]
        -- upvalues: v159 (ref), v60 (ref), v170 (copy)
        if not v159 and v60 == true and v170.isAlreadyAuthenticated == true then
            v170.resetDefaultTheme();
        end;
        v170.props.navigateBack();
    end;
    v170.getShouldShowVNGAgreements = function() --[[ Line: 386 ]]
        -- upvalues: v170 (copy)
        return v170.props.appPolicy.getUseVNGUserAgreementPopup();
    end;
    v170.getShouldBlockVNGU12SignUpOnClientSide = function() --[[ Line: 390 ]]
        -- upvalues: v170 (copy)
        return v170.props.appPolicy.getBlockVNGU12SignUpOnClientSide();
    end;
    v170.getShouldUseAgeInput = function() --[[ Line: 394 ]]
        -- upvalues: v170 (copy), v153 (ref)
        return v170.props.appPolicy.getUseAgeInput() and v153;
    end;
    v170.getShouldShowKISAAgreements = function() --[[ Line: 398 ]]
        -- upvalues: v70 (ref), v170 (copy), v72 (ref), v71 (ref)
        return v70 and (v170.props.appPolicy.getUseKoreaKISAUserAgreementPopup() or v72) and (v170.props.shouldShowKoreanKISASignUpFlow or v71);
    end;
    v170.getShouldAddParentalConsentAgreementId = function() --[[ Line: 404 ]]
        -- upvalues: v170 (copy)
        return v170.props.appPolicy.getParentalConsentAgreementId();
    end;
    v170.getSignupCheckboxDisabled = function() --[[ Line: 408 ]]
        -- upvalues: v170 (copy)
        return v170.props.appPolicy.getSignupCheckboxDisabled();
    end;
    v170.launchKISATermsOfService = function(v178, v179) --[[ Line: 412 ]]
        -- upvalues: v170 (copy), l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), l_KISAComplianceUtils_0 (ref), v23 (ref)
        local v184 = {
            agreements = v170.state.agreements, 
            onAgreeFunction = function(v180) --[[ Line: 416 ]] --[[ Name: onAgreeFunction ]]
                -- upvalues: l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), l_KISAComplianceUtils_0 (ref), v23 (ref), v178 (copy), v170 (ref), v179 (copy)
                l_AnalyticsEvents_0.sendButtonClickEvent(l_EventConstants_0.ctx.kisaAgreements, l_EventConstants_0.origin.signup, l_EventConstants_0.btn.agree);
                local v181 = l_KISAComplianceUtils_0.getAgreedUserAgreements(v180);
                local v182 = v23.Dictionary.join(v178, {
                    agreementIds = v181
                });
                local v183 = v170.getShouldAddParentalConsentAgreementId();
                if v179 and v183 and v183 ~= "" then
                    table.insert(v182.agreementIds, v183);
                end;
                v170.requestSignUp(v182);
            end, 
            onAbandonFunction = v170.onAbandonKISASignUpFlow, 
            isUnderAgeFlow = v179
        };
        v170.props.openKISAUserAgreements(v184);
    end;
    v170.getIsSignUpButtonEnabled = function() --[[ Line: 441 ]]
        -- upvalues: v170 (copy), v110 (ref), v111 (ref), v112 (ref), v141 (ref), v94 (ref), v142 (ref), l_FFlagUseBirthdayDropdownForGamepad_0 (ref)
        local l_birthday_0 = v170.state.birthday;
        local l_username_0 = v170.state.username;
        local l_password_0 = v170.state.password;
        local l_displayName_0 = v170.state.displayName;
        local l_birthdayValid_0 = v170.state.birthdayValid;
        local l_usernameValid_0 = v170.state.usernameValid;
        local l_passwordValid_0 = v170.state.passwordValid;
        local l_displayNameValid_0 = v170.state.displayNameValid;
        local l_validBirthday_0 = v170.state.validBirthday;
        local v194 = v170.props.shouldUseMinimalSignup and v110();
        local v195 = v170.props.shouldUsePasswordlessSignup and v111();
        if v112() and v170.props.shouldUsePasskeySignup and not v170.state.passkeysAvailable then
            v195 = false;
        end;
        local v196 = v141() and v170.props.birthdayPickerVariant and v170.props.birthdayPickerVariant > 0;
        if not v170.getSignupCheckboxDisabled() and v170.props.shouldRequireSignupCheckbox and not v170.state.signupAgreementsChecked then
            return false;
        else
            local v197 = true;
            if l_usernameValid_0 == v94.Valid then
                v197 = true;
                if l_passwordValid_0 == v94.Valid then
                    v197 = v196 and l_birthdayValid_0 ~= v94.Valid or if v142 and v170.isDisplayNameFieldRequired() then l_displayNameValid_0 ~= v94.Valid else nil;
                end;
            end;
            if l_FFlagUseBirthdayDropdownForGamepad_0 and l_birthday_0 and l_validBirthday_0 == false then
                return false;
            elseif v194 and l_birthday_0 then
                if v196 and l_birthdayValid_0 ~= v94.Valid then
                    return false;
                else
                    return true;
                end;
            elseif v195 and l_birthday_0 and l_username_0 ~= "" and l_usernameValid_0 == v94.Valid then
                if v196 and l_birthdayValid_0 ~= v94.Valid then
                    return false;
                else
                    return true;
                end;
            elseif not l_birthday_0 or v197 or l_username_0 == "" or l_password_0 == "" or v142 and v170.isDisplayNameFieldRequired() and l_displayName_0 == "" or nil then
                return false;
            elseif l_validBirthday_0 == false then
                return false;
            else
                return true;
            end;
        end;
    end;
    v170.updateState = function(v198) --[[ Line: 526 ]]
        -- upvalues: v170 (copy)
        spawn(function() --[[ Line: 527 ]]
            -- upvalues: v170 (ref), v198 (copy)
            if v170.isMounted then
                v170:setState(v198);
            end;
        end);
    end;
    v170.getHidePassword = function() --[[ Line: 537 ]]
        -- upvalues: v170 (copy)
        if v170.state.hidePassword == nil then
            return not v170.props.arePasswordFieldsPlaintext;
        else
            return v170.state.hidePassword;
        end;
    end;
    v170.passwordVisibilityToggleCallback = function() --[[ Line: 544 ]]
        -- upvalues: v170 (copy), v88 (ref)
        local v199 = v170.getHidePassword();
        if v199 then
            v170.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.ShowPassword);
        else
            v170.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.HidePassword);
        end;
        v170:setState({
            hidePassword = not v199
        });
    end;
    v170.onBirthdaySelected = function(v200, v201) --[[ Line: 562 ]]
        -- upvalues: v24 (ref), l_Birthday_0 (ref), v170 (copy), v88 (ref)
        v24.assert(l_Birthday_0.is(v200), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.");
        v170.updateState({
            birthday = v200, 
            validBirthday = v201
        });
        if v170.useVerifiedSignup() then
            v170.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.ConfirmBirthday);
        end;
        v170.updateSignUpFieldFilled();
    end;
    v170.onAgeChanged = function(v202) --[[ Line: 583 ]]
        -- upvalues: v170 (copy), v94 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref)
        local v203 = tonumber(v202);
        if v203 == nil or v203 < 1 or v203 > 99 then
            v170.updateState({
                birthday = nil, 
                birthdayValid = v94.Invalid
            });
            return;
        else
            local v204 = DateTime.now():ToLocalTime();
            local v205 = l_Birthday_0.new({
                Year = v204.Year - v203, 
                Month = v204.Month, 
                Day = v204.Day
            });
            if v205.Month == 2 and v205.Day == 29 and not l_DateHelper_0:isLeapYear(v205.Year) then
                v205.Day = 28;
            end;
            if l_DateHelper_0:isValidDate(v205.Month, v205.Day, v205.Year) then
                v170.updateState({
                    birthday = v205, 
                    birthdayValid = v94.Valid
                });
                return;
            else
                v170.updateState({
                    birthday = nil, 
                    birthdayValid = v94.Invalid
                });
                return;
            end;
        end;
    end;
    v170.onAgeAndMonthChanged = function(v206, v207) --[[ Line: 614 ]]
        -- upvalues: v170 (copy), v94 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref)
        if v206 == nil or v206 < 1 or v206 > 99 then
            v170.updateState({
                birthday = nil, 
                birthdayValid = v94.Invalid
            });
            return;
        else
            local v208 = DateTime.now():ToLocalTime().Year - v206;
            local v209 = l_Birthday_0.new({
                Year = v208, 
                Month = v207, 
                Day = l_DateHelper_0:getLastDayOfTheMonthInYear(v207, v208)
            });
            if l_DateHelper_0:isValidDate(v209.Month, v209.Day, v209.Year) then
                v170.updateState({
                    birthday = v209, 
                    birthdayValid = v94.Valid
                });
                return;
            else
                v170.updateState({
                    birthday = nil, 
                    birthdayValid = v94.Invalid
                });
                return;
            end;
        end;
    end;
    v170.onMonthAndYearChanged = function(v210, v211) --[[ Line: 642 ]]
        -- upvalues: v170 (copy), v94 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref)
        local v212 = DateTime.now():ToLocalTime();
        if v211 == nil or v211 < v212.Year - 100 or v212.Year < v211 then
            v170.updateState({
                birthday = nil, 
                birthdayValid = v94.Invalid
            });
            return;
        else
            local v213 = l_Birthday_0.new({
                Year = v211, 
                Month = v210, 
                Day = l_DateHelper_0:getLastDayOfTheMonthInYear(v210, v211)
            });
            if l_DateHelper_0:isValidDate(v213.Month, v213.Day, v213.Year) then
                v170.updateState({
                    birthday = v213, 
                    birthdayValid = v94.Valid
                });
                return;
            else
                v170.updateState({
                    birthday = nil, 
                    birthdayValid = v94.Invalid
                });
                return;
            end;
        end;
    end;
    v170.usernameSuggestionClicked = function(v214, v215) --[[ Line: 670 ]]
        -- upvalues: v170 (copy), v88 (ref)
        v170.props.authEventAnalytics.reportUsernameSuggestionClicked(v88.Context.SinglePageSignUpScreen, v88.Button.UsernameSuggestion, v214, v215);
    end;
    v170.logRefreshButtonClicked = function() --[[ Line: 679 ]]
        -- upvalues: v170 (copy), v88 (ref), v128 (ref)
        v170.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v128.refreshButton);
    end;
    v170.usernameSuggestionsShown = function(v216, v217) --[[ Line: 686 ]]
        -- upvalues: v170 (copy), v88 (ref), v128 (ref)
        v170.props.authEventAnalytics.reportInteractWithActionAndSection(v88.Context.SinglePageSignUpScreen, v88.Field.Username, v88.ActionType.Shown, v128.suggestionsShown, v216, v217);
    end;
    v170.logSuggestableUsername = function(v218) --[[ Line: 697 ]]
        -- upvalues: v170 (copy), v88 (ref), v128 (ref)
        v170.props.authEventAnalytics.reportInteractWithAction(v88.Context.SinglePageSignUpScreen, v88.Field.Username, v88.ActionType.Shown, v128.suggestableInput, v218);
    end;
    v170.shouldSuggest = function() --[[ Line: 707 ]]
        -- upvalues: v170 (copy), v96 (ref), v97 (ref)
        local v219 = false;
        local l_issueCondition_0 = v170.state.issueCondition;
        if l_issueCondition_0 then
            v219 = l_issueCondition_0[v96.AlreadyInUse] == v97.Problematic;
            for v221, v222 in pairs(l_issueCondition_0) do
                if v221 ~= v96.AlreadyInUse and v222 == v97.Problematic then
                    return false;
                end;
            end;
        end;
        return v219;
    end;
    v170.onBirthdayFocused = function(v223) --[[ Line: 722 ]]
        -- upvalues: v170 (copy)
        if v170.isMounted then
            v170:setState({
                birthdayFocused = v223
            });
        end;
    end;
    v170.onUsernameTextChanged = function(v224, v225) --[[ Line: 730 ]]
        -- upvalues: v142 (ref), v170 (copy)
        local v226 = nil;
        if v142 and v170.shouldShowDisplayNameField() and not v170.state.hasEditedUsername then
            v226 = v170.state.recommendedUsername ~= v224;
        end;
        v170.updateState({
            username = v224, 
            usernameValid = v225, 
            hasEditedUsername = if v142 then v226 else nil
        });
        if v170.shouldSuggest() then
            v170.logSuggestableUsername(v224);
        end;
        v170.updateSignUpFieldFilled();
    end;
    v170.updateSignUpFieldFilled = function() --[[ Line: 752 ]]
        -- upvalues: v170 (copy)
        if v170.props.signUpStarted == nil then
            return;
        else
            local v227 = false;
            if v170.state.username ~= "" or v170.state.password ~= "" or v170.state.birthday ~= nil then
                v227 = true;
            end;
            if v227 ~= v170.state.signUpStarted then
                v170.props.setSignUpStarted(v227);
            end;
            return;
        end;
    end;
    v170.onDisplayNameTextChanged = function(v228, v229) --[[ Line: 767 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            displayName = v228, 
            displayNameValid = v229
        });
    end;
    v170.updateBypassDisplayNameField = function(v230) --[[ Line: 774 ]]
        -- upvalues: v170 (copy)
        v170:setState({
            bypassDisplayNameField = v230
        });
    end;
    v170.onUsernameTextValidated = function(v231, v232) --[[ Line: 780 ]]
        -- upvalues: v170 (copy), v94 (ref), v88 (ref)
        v170.onUsernameTextChanged(v231, v232);
        if v232 == v94.Valid then
            v170.props.authEventAnalytics.reportInteractWithAction(v88.Context.SinglePageSignUpScreen, v88.Field.Username, v88.ActionType.Submit, v232, v231);
        end;
    end;
    v170.onPasswordTextChanged = function(v233, v234) --[[ Line: 793 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            password = v233, 
            passwordValid = v234
        });
        v170.updateSignUpFieldFilled();
    end;
    v170.cachedScrollCanvasPositionY = 0;
    v170.cachedScrollCanvasInitialSizeY = 0;
    local v235, v236 = v7.createBinding(0);
    v170.scrollCanvasTargetPositionY = v235;
    v170.updateScrollCanvasTargetPositionY = v236;
    v170.scrollingFrameRef = v7.createRef();
    v170.ageTextFieldRef = v7.createRef();
    v170.usernameTextFieldRef = v7.createRef();
    v170.displayNameTextFieldRef = if v142 then v7.createRef() else nil;
    v170.passwordTextFieldRef = v7.createRef();
    v170.passwordFrameRef = v7.createRef();
    v170.onDisplayNameTextChangeCompletedFromKeyboard = function() --[[ Line: 813 ]]
        -- upvalues: v170 (copy), v148 (ref), v88 (ref)
        task.spawn(function() --[[ Line: 814 ]]
            -- upvalues: v170 (ref), v148 (ref), v88 (ref)
            if v170.displayNameTextFieldRef.current then
                v170.displayNameTextFieldRef.current:ReleaseFocus();
            end;
            task.defer(function() --[[ Line: 819 ]]
                -- upvalues: v170 (ref)
                if v170.usernameTextFieldRef.current then
                    v170.usernameTextFieldRef.current:CaptureFocus();
                end;
            end);
            if v148 then
                v170.props.authEventAnalytics.reportAuthButtonClick(v88.Context.SinglePageSignUpScreen, v88.Button.DisplayNameNext, v88.State.KeyboardInput);
            end;
        end);
    end;
    v170.onUsernameTextChangeCompletedFromKeyboard = function() --[[ Line: 835 ]]
        -- upvalues: v170 (copy), v88 (ref)
        spawn(function() --[[ Line: 836 ]]
            -- upvalues: v170 (ref), v88 (ref)
            if v170.usernameTextFieldRef.current then
                v170.usernameTextFieldRef.current:ReleaseFocus();
            end;
            if v170.passwordTextFieldRef.current then
                v170.passwordTextFieldRef.current:CaptureFocus();
            end;
            v170.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.UsernameNext);
        end);
    end;
    v170.onPasswordTextChangeCompletedFromKeyboard = function() --[[ Line: 851 ]]
        -- upvalues: v170 (copy), v88 (ref)
        spawn(function() --[[ Line: 852 ]]
            -- upvalues: v170 (ref), v88 (ref)
            if v170.passwordTextFieldRef.current then
                v170.passwordTextFieldRef.current:ReleaseFocus();
            end;
            v170.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.PasswordNext);
        end);
    end;
    v170.cacheScrollCanvasInitialSizeIfNecessary = function() --[[ Line: 866 ]]
        -- upvalues: v170 (copy)
        if v170.cachedScrollCanvasInitialSizeY == 0 then
            local l_Parent_0 = v170.scrollingFrameRef.current.Parent;
            local l_CanvasSize_0 = v170.scrollingFrameRef.current.CanvasSize;
            local v239 = l_Parent_0 and l_Parent_0.AbsoluteSize or Vector2.new(0, 0);
            v170.cachedScrollCanvasInitialSizeY = l_CanvasSize_0.Y.Scale * v239.Y + l_CanvasSize_0.Y.Offset;
        end;
    end;
    v170.agreeToPhoneNumberVerification = function() --[[ Line: 876 ]]
        -- upvalues: v170 (copy), v132 (ref)
        local l_agreeToPhoneNumberVerification_0 = v170.props.agreeToPhoneNumberVerification;
        local l_networking_1 = v170.props.networking;
        local v242 = v170.state.phoneCountryCode.prefix .. "," .. v170.state.phoneInput .. "," .. v170.state.phoneCountryCode.code;
        l_agreeToPhoneNumberVerification_0(l_networking_1, function() --[[ Line: 885 ]]
            -- upvalues: v132 (ref), l_networking_1 (copy), v242 (copy), v170 (ref)
            v132(l_networking_1, v242):andThen(function(v243) --[[ Line: 886 ]]
                -- upvalues: v170 (ref), v242 (ref)
                local l_challenge_0 = v243.challenge;
                v170.verifyPhoneNumber(l_challenge_0, v170.state.phoneInput, v242);
            end, function(v245) --[[ Line: 889 ]]
                -- upvalues: v170 (ref)
                if v245 == "Authentication.TwoStepVerification.Response.TooManyAttempts" or v245 == "Authentication.SignUp.Response.PhoneNumberAlreadyLinked" or v245 == "Authentication.SignUp.Response.InvalidPhoneNumber" then
                    v170.props.showErrorMessageToast(v245);
                    return;
                else
                    v170.props.showErrorToast();
                    return;
                end;
            end);
        end, v170.state.phoneInput);
    end;
    v170.onSignUpClick = function() --[[ Line: 904 ]]
        -- upvalues: v170 (copy), v91 (ref)
        if v170.useVerifiedSignup() and v170.state.contactMethod == v91.PhoneNumber then
            v170.agreeToPhoneNumberVerification();
            return;
        else
            v170.onSignUpButtonActivated();
            return;
        end;
    end;
    v170.verifyPhoneNumber = function(v246, v247, v248) --[[ Line: 912 ]]
        -- upvalues: v170 (copy)
        v170.props.verifyPhoneNumber(v170.props.networking, v170.verifyPhoneNumberCallback, v246, v247, v248, v170.useEmailOptionClickedCallback);
    end;
    v170.verifyPhoneNumberCallback = function(v249) --[[ Line: 927 ]]
        -- upvalues: v170 (copy)
        v170.verifiedSignupVoucher = v249;
        v170.onSignUpButtonActivated();
    end;
    v170.useEmailOptionClickedCallback = function() --[[ Line: 932 ]]
        -- upvalues: v170 (copy), v91 (ref)
        v170:setState({
            contactMethod = v91.Email
        });
    end;
    v170.phoneCountryCodeSelectorCallback = function(v250) --[[ Line: 938 ]]
        -- upvalues: v170 (copy)
        v170:setState({
            isCountryCodeSearchVisible = v250
        });
    end;
    v170.onTextBoxFocused = function(v251) --[[ Line: 946 ]]
        -- upvalues: v170 (copy)
        v170.cacheScrollCanvasInitialSizeIfNecessary();
        local v252 = math.clamp(v170.scrollingFrameRef.current.CanvasPosition.Y, 0, v170.cachedScrollCanvasInitialSizeY);
        if v170.isMounted then
            local v253 = v251.Y - v170.scrollingFrameRef.current.absolutePosition.Y + v252;
            v170.updateScrollCanvasTargetPositionY(v253);
        end;
    end;
    v170.onTextBoxFocusLost = function() --[[ Line: 957 ]]
        -- upvalues: v170 (copy)
        if v170.isMounted then
            v170.updateScrollCanvasTargetPositionY(0);
        end;
    end;
    v170.onUsernameTextBoxFocusLost = function() --[[ Line: 963 ]]
        -- upvalues: v170 (copy)
        v170.onTextBoxFocusLost();
        v170.updateState({
            isUsernameFocused = false
        });
    end;
    v170.onAnimationStateChangeCallback = function(v254, v255) --[[ Line: 973 ]]
        -- upvalues: v170 (copy)
        if v254 == Enum.TextInputType.Password then
            v170:setState({
                isPasswordAnimating = v255
            });
            return;
        else
            v170:setState({
                isUsernameAnimating = v255
            });
            return;
        end;
    end;
    v170.onFocusedTextBoxPositionChanged = function(v256) --[[ Line: 987 ]]
        -- upvalues: v170 (copy)
        if v170.state.isUsernameAnimating or v170.state.isPasswordAnimating then
            v170.onTextBoxFocused(v256);
        end;
    end;
    v170.getScrollingFrameCanvasPosition = function(v257) --[[ Line: 996 ]]
        -- upvalues: v170 (copy)
        if v257 > 0 then
            return Vector2.new(0, v257);
        elseif v170.scrollingFrameRef and v170.scrollingFrameRef.current then
            return v170.scrollingFrameRef.current.CanvasPosition;
        else
            return Vector2.new(0, 0);
        end;
    end;
    v170.onUsernameTextBoxFocused = function(v258) --[[ Line: 1008 ]]
        -- upvalues: v170 (copy), v88 (ref)
        v170:setState({
            isUsernameFocused = true
        });
        v170.props.authEventAnalytics.reportUsernameFocus(v88.Context.SinglePageSignUpScreen);
        v170.onTextBoxFocused(v258);
    end;
    v170.onDisplayNameTextBoxFocused = function(v259) --[[ Line: 1018 ]]
        -- upvalues: v148 (ref), v170 (copy), v88 (ref)
        if v148 then
            v170.props.authEventAnalytics.reportDisplayNameFocus(v88.Context.SinglePageSignUpScreen);
        end;
        v170.onTextBoxFocused(v259);
    end;
    v170.onPasswordTextBoxFocused = function(v260) --[[ Line: 1026 ]]
        -- upvalues: v170 (copy), v88 (ref)
        v170.props.authEventAnalytics.reportPasswordFocus(v88.Context.SinglePageSignUpScreen);
        v170.onTextBoxFocused(v260);
    end;
    v170.updateIsSignUpInProgress = function(v261) --[[ Line: 1031 ]]
        -- upvalues: v170 (copy)
        spawn(function() --[[ Line: 1032 ]]
            -- upvalues: v170 (ref), v261 (copy)
            if v170.isMounted then
                v170:setState({
                    isSignUpInProgress = v261
                });
            end;
        end);
    end;
    v170.requestSignUp = function(v262, v263) --[[ Line: 1041 ]]
        -- upvalues: v170 (copy), v91 (ref), l_FFlagEnableAuthDeepLinkReceiver_0 (ref), l_PreAuthDeepLinkUrlStore_0 (ref), l_LinkingProtocol_0 (ref), v149 (ref), v112 (ref), v122 (ref), v95 (ref), v93 (ref), v60 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v89 (ref), l_AccountLinkingAlertType_0 (ref)
        local l_networking_2 = v170.props.networking;
        local l_guiService_0 = v170.props.guiService;
        local l_analytics_0 = v170.props.analytics;
        local l_appPolicy_0 = v170.props.appPolicy;
        local l_omniRecommendationsRequest_0 = v170.props.omniRecommendationsRequest;
        local l_authEventAnalytics_0 = v170.props.authEventAnalytics;
        local l_signUp_0 = v170.props.signUp;
        local l_setBackNavigationDisabled_0 = v170.props.setBackNavigationDisabled;
        local function v274(v272, v273) --[[ Line: 1052 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v170 (ref), v262 (copy)
            if v272 then
                l_setBackNavigationDisabled_0(true);
                v170.requestSignUp(v262, v273);
                return;
            else
                v170.updateIsSignUpInProgress(false);
                return;
            end;
        end;
        local v275 = v170.useVerifiedSignup() and v170.state.contactMethod == v91.PhoneNumber;
        local v276 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        local v277 = v149 and v276 ~= nil and v276 ~= "";
        local v278 = not v170.state.passkeysAvailable or v277;
        local v279 = v112();
        l_signUp_0(l_networking_2, l_omniRecommendationsRequest_0, l_guiService_0, v274, v263, l_analytics_0, l_appPolicy_0, v262, v275, v170.props.shouldUsePasskeySignup and v279 and game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not v278, v170.props.shouldAutomaticallyPromptForPasskey, v122() and v170.state.isCredentialsProtocolRegisterPasswordAvailable, l_authEventAnalytics_0, v170.props.isIosAuthServiceEnabled):andThen(function() --[[ Line: 1106 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy)
            l_setBackNavigationDisabled_0(false);
        end, function(v280) --[[ Line: 1110 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v275 (copy), v95 (ref), v170 (ref), v93 (ref), v60 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v89 (ref), l_AccountLinkingAlertType_0 (ref)
            l_setBackNavigationDisabled_0(false);
            if v275 then
                if v280 ~= v95.Captcha then
                    v170.updateIsSignUpInProgress(false);
                    v170:setState({
                        signUpError = true
                    });
                end;
            else
                if v280 ~= v93.Captcha then
                    v170.updateIsSignUpInProgress(false);
                    v170:setState({
                        signUpError = true
                    });
                end;
                if v280 == v93.VNGAgeUnder12 then
                    v170:setState({
                        shouldShowUnderAgeAlert = true
                    });
                end;
                if v60 == true and v280 == v93.EmptyAccountSwitchBlobRequired then
                    v170.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.LogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v170.logoutAllLoggedInUsersCallback, v170.props.closeCentralOverlay, v89.Auth.AccountSwitcherSignupEmptyBlobRequiredError, v170.state.username);
                    v170:setState({
                        signUpError = false
                    });
                end;
                if v60 == true and v280 == v93.ParentEmptyAccountSwitchBlobRequired then
                    v170.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v170.logoutAllLoggedInUsersCallback, v170.props.closeCentralOverlay, v89.Auth.AccountSwitcherParentSignupEmptyBlobRequiredError, v170.state.username);
                    v170:setState({
                        signUpError = false
                    });
                end;
            end;
            if v280 == v93.AccountLinkingRequired then
                v170.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInAlreadyLinked);
                return;
            else
                if v280 == v93.AccountLinkingFailed then
                    v170.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInGenericError);
                end;
                return;
            end;
        end);
    end;
    v170.onSignUpButtonActivated = function() --[[ Line: 1196 ]]
        -- upvalues: v170 (copy), v88 (ref), v115 (ref), l_FFlagEnableAuthDeepLinkReceiver_0 (ref), l_PreAuthDeepLinkUrlStore_0 (ref), l_LinkingProtocol_0 (ref), v116 (ref), v57 (ref), l_HttpService_0 (ref), v118 (ref), l_ExperienceService_0 (ref), v147 (ref), v137 (ref), v22 (ref), v142 (ref), v91 (ref), l_UserAgreementsCounterNames_0 (ref), v120 (ref)
        local l_setBackNavigationDisabled_1 = v170.props.setBackNavigationDisabled;
        local l_birthday_1 = v170.state.birthday;
        local l_username_1 = v170.state.username;
        local l_password_1 = v170.state.password;
        local l_gender_0 = v170.state.gender;
        local v286 = v170.getIsSignUpButtonEnabled();
        local l_locale_0 = v170.locale;
        local l_emailInput_0 = v170.state.emailInput;
        local _ = function(v289) --[[ Line: 1207 ]]
            local v290 = {};
            for _, v292 in ipairs(v289) do
                table.insert(v290, v292.id);
            end;
            return v290;
        end;
        if v286 then
            v170.props.authEventAnalytics.reportSignUpButtonClicked(v88.Context.SinglePageSignUpScreen);
            if v170.getShouldBlockVNGU12SignUpOnClientSide() then
                local v294 = v170.getUserAge();
                if v294 == nil or v294 < 12 then
                    v170:setState({
                        shouldShowUnderAgeAlert = true
                    });
                    return;
                end;
            end;
            if v115() then
                local v295 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
                local v296 = "";
                do
                    local l_v296_0 = v296;
                    if v116() and v295 and string.find(v295, "share") then
                        local v298, v299, v300 = v295:match("code=(.-)&type=(.-)&stamp=(.*)");
                        if not v300 then
                            local v301, v302 = v295:match("code=(.-)&type=(.*)");
                            v298 = v301;
                            v299 = v302;
                        end;
                        if v298 and v299 then
                            v57(v170.props.networking, v298, v299):andThen(function(v303) --[[ Line: 1247 ]]
                                -- upvalues: l_v296_0 (ref), l_HttpService_0 (ref)
                                if v303 and v303 ~= nil then
                                    l_v296_0 = l_HttpService_0:JSONEncode(v303);
                                end;
                            end, function(v304) --[[ Line: 1251 ]]
                                warn("Error fetching share link metadata: ", v304);
                            end):await();
                        end;
                    elseif v118() then
                        local l_l_ExperienceService_0_PendingJoinAttempt_0 = l_ExperienceService_0:GetPendingJoinAttempt();
                        if l_l_ExperienceService_0_PendingJoinAttempt_0 and l_l_ExperienceService_0_PendingJoinAttempt_0 ~= nil then
                            l_v296_0 = l_HttpService_0:JSONEncode(l_l_ExperienceService_0_PendingJoinAttempt_0);
                        end;
                    end;
                    v170.props.authEventAnalytics.reportAuthButtonClick(v88.Context.SinglePageSignUpScreen, v88.Button.SignUp, l_v296_0, v295, v170.isAltAttempt);
                end;
            end;
            if v147 and v170.props.shouldSeeDisplayNamesOnSignup then
                if v170.state.recommendedUsername == l_username_1 then
                    v137(v22.SignUpWithRecommendedUsernames, 1);
                elseif v170.state.hasEditedUsername then
                    v137(v22.SignUpWithEditedUsernames, 1);
                end;
                if v170.state.bypassDisplayNameField then
                    v137(v22.SignupBypassingDisplayNames, 1);
                end;
            end;
            v170.updateIsSignUpInProgress(true);
            l_setBackNavigationDisabled_1(true);
            v170:setState({
                signUpError = false
            });
            local v306 = {
                birthday = l_birthday_1 and l_birthday_1:FormatForEndpoint() or "", 
                username = l_username_1, 
                password = l_password_1, 
                displayName = if v142 and v170.isDisplayNameFieldRequired() then v170.state.displayName else nil, 
                gender = l_gender_0, 
                locale = l_locale_0, 
                capturedAuditContent = v170.props.capturedAuditContent, 
                additionalAuditContent = v170.props.additionalAuditContent
            };
            local v307 = v170.useVerifiedSignup();
            if v307 and v170.state.contactMethod == v91.Email then
                v306.email = l_emailInput_0;
            elseif v307 and v170.state.contactMethod == v91.PhoneNumber then
                v306.verifiedSignupVoucher = v170.verifiedSignupVoucher;
            end;
            if v170.props.appPolicy.getAddUserAgreementIdsToSignupRequest() then
                local l_agreements_0 = v170.state.agreements;
                if #l_agreements_0 > 0 then
                    local v309 = {};
                    for _, v311 in ipairs(l_agreements_0) do
                        table.insert(v309, v311.id);
                    end;
                    v306.agreementIds = v309;
                else
                    v137(l_UserAgreementsCounterNames_0.AgreementsIdsEmptyOnSignup, 1);
                end;
            end;
            if v170.getShouldShowVNGAgreements() then
                v170.props.showVNGUserAgreementsPopup(v170.state.agreements, function(v312) --[[ Line: 1322 ]]
                    -- upvalues: v306 (copy), v170 (ref)
                    local l_v306_0 = v306;
                    local v314 = {};
                    for _, v316 in ipairs(v312) do
                        table.insert(v314, v316.id);
                    end;
                    l_v306_0.agreementIds = v314;
                    v170.requestSignUp(v306);
                end, function() --[[ Line: 1325 ]]
                    -- upvalues: v170 (ref), l_setBackNavigationDisabled_1 (copy)
                    v170.updateIsSignUpInProgress(false);
                    l_setBackNavigationDisabled_1(false);
                end);
                return;
            elseif v170.getShouldShowKISAAgreements() then
                local v317 = v170.getUserAge();
                if v317 and v317 < v120 then
                    v170.launchParentSignUpOtp(v306);
                    return;
                else
                    v170.launchKISATermsOfService(v306, false);
                    return;
                end;
            else
                v170.requestSignUp(v306);
            end;
        end;
    end;
    v170.onGenderChanged = function(v318) --[[ Line: 1344 ]]
        -- upvalues: v170 (copy)
        if v170.isMounted then
            v170.updateState({
                gender = v318
            });
        end;
    end;
    v170.validUsernameEntered = function(_) --[[ Line: 1352 ]]
        -- upvalues: v170 (copy), v94 (ref)
        local v320 = false;
        if v170.state.username ~= "" then
            v320 = v170.state.usernameValid ~= v94.Invalid;
        end;
        return v320;
    end;
    v170.validPasswordEntered = function() --[[ Line: 1356 ]]
        -- upvalues: v170 (copy), v94 (ref)
        local v321 = false;
        if v170.state.password ~= "" then
            v321 = v170.state.passwordValid ~= v94.Invalid;
        end;
        return v321;
    end;
    v170.useVerifiedSignup = function() --[[ Line: 1360 ]]
        -- upvalues: v170 (copy), l_GuiService_0 (ref)
        return game:GetFastFlag("LuaVerifiedSignup2") or game:GetFastFlag("LuaVerifiedSignupExperiment2") and v170.props.useVerifiedSignupPage and not l_GuiService_0:IsTenFootInterface();
    end;
    v170.useUsernameSuggestions = function() --[[ Line: 1367 ]]
        -- upvalues: v170 (copy)
        return v170.props.shouldUseUsernameSuggestions;
    end;
    v170.useRefreshButton = function() --[[ Line: 1371 ]]
        -- upvalues: v125 (ref), v170 (copy)
        return v125() and v170.props.enableRefreshButton;
    end;
    v170.getBirthdayVariant = function() --[[ Line: 1375 ]]
        -- upvalues: v170 (copy), v141 (ref)
        if v170.getShouldUseAgeInput() then
            return 1;
        elseif v141() and v170.props.birthdayPickerVariant ~= nil then
            return v170.props.birthdayPickerVariant;
        else
            return 0;
        end;
    end;
    v170.SetContactMethod = function(v322) --[[ Line: 1385 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            contactMethod = v322
        });
    end;
    v170.SetPhoneNumber = function(v323, v324, v325) --[[ Line: 1391 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            phoneCountryCode = v323, 
            phoneInput = v324, 
            phoneValid = v325
        });
    end;
    v170.SetEmail = function(v326, v327) --[[ Line: 1399 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            emailInput = v326, 
            emailValid = v327
        });
    end;
    v170.updatePillClicked = function() --[[ Line: 1407 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            pillClicked = true
        });
    end;
    v170.resetPillClicked = function() --[[ Line: 1413 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            pillClicked = false
        });
    end;
    v170.updateIssueCondition = function(v328) --[[ Line: 1419 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            issueCondition = v328
        });
    end;
    v170.updateSuggestionControlState = function(_, v330) --[[ Line: 1425 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            suggestionControlState = v330
        });
    end;
    v170.loadSuggestions = function() --[[ Line: 1431 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            loadingSuggestions = true
        });
    end;
    v170.finishSuggestions = function() --[[ Line: 1435 ]]
        -- upvalues: v170 (copy)
        v170.updateState({
            loadingSuggestions = false
        });
    end;
    v170.onSignUpContentFrameCanvasSizeChange = function(_) --[[ Line: 1439 ]]
        -- upvalues: v170 (copy)
        local v332 = v170.scrollCanvasTargetPositionY:getValue();
        v170.scrollingFrameRef.current.CanvasPosition = v170.getScrollingFrameCanvasPosition(v332);
    end;
    v170.getUserAge = function() --[[ Line: 1444 ]]
        -- upvalues: v170 (copy)
        if v170.state.birthday then
            return v170.state.birthday:GetAgeInYears();
        else
            return nil;
        end;
    end;
    v170.getUsernamePlaceholder = function(v333) --[[ Line: 1452 ]]
        -- upvalues: v170 (copy), v146 (ref)
        if v170.props.shouldSeeDisplayNamesOnSignup then
            if not v170.state.birthday then
                return "";
            elseif v170.getUserAge() >= v146 and not v170.state.hasSetIneligibleAgeAtLeastOnce then
                return v333.agedUpUsernamePlaceholder;
            else
                return v333.usernamePlaceholder;
            end;
        else
            return v333.usernamePlaceholder;
        end;
    end;
    v170.shouldShowUsernameField = function() --[[ Line: 1476 ]]
        -- upvalues: v170 (copy), v146 (ref)
        if v170.props.shouldSeeDisplayNamesOnSignup then
            if not v170.state.birthday or v170.getUserAge() < v146 or v170.state.hasSetIneligibleAgeAtLeastOnce then
                return true;
            else
                return v170.state.recommendedUsername ~= nil;
            end;
        else
            return true;
        end;
    end;
    v170.shouldShowDisplayNameField = function() --[[ Line: 1492 ]]
        -- upvalues: v170 (copy), v146 (ref)
        return v170.props.shouldSeeDisplayNamesOnSignup and v170.state.birthday and v170.getUserAge() >= v146 and not v170.state.hasSetIneligibleAgeAtLeastOnce;
    end;
    v170.isDisplayNameFieldRequired = function() --[[ Line: 1499 ]]
        -- upvalues: v170 (copy)
        return v170.shouldShowDisplayNameField() and not v170.state.bypassDisplayNameField;
    end;
    v170.isValidDisplayNameEntered = function() --[[ Line: 1503 ]]
        -- upvalues: v170 (copy), v94 (ref)
        local v334 = false;
        if v170.state.displayName ~= "" then
            v334 = v170.state.displayNameValid ~= v94.Invalid;
        end;
        return v334;
    end;
    v170.setUsernameRecommendation = function(v335) --[[ Line: 1507 ]]
        -- upvalues: v170 (copy)
        v170:setState(function(v336) --[[ Line: 1508 ]]
            -- upvalues: v335 (copy)
            return {
                recommendedUsername = if v336.recommendedUsername ~= nil and v335 == "" then nil else v335
            };
        end);
    end;
    v170.getUsernameGuidanceText = function(v337) --[[ Line: 1518 ]]
        -- upvalues: v170 (copy)
        if v170.shouldShowDisplayNameField() and v170.state.recommendedUsername ~= "" and v170.state.recommendedUsername ~= nil and not v170.state.hasEditedUsername and not v170.state.isUsernameFocused then
            return v337.autogeneratedUsernameGuidance;
        else
            return nil;
        end;
    end;
    v170.validateOtpCode = function(v338, v339, v340) --[[ Line: 1530 ]]
        -- upvalues: v170 (copy), l_Constants_1 (ref), l_ValidateCode_0 (ref), v80 (ref)
        v170.state.otpSessionToken = v338;
        v170.state.otpCode = v339;
        local l_networking_3 = v170.props.networking;
        local v342 = {
            origin = l_Constants_1.otpServiceOriginSignup, 
            contactType = l_Constants_1.otpServiceContactType, 
            passCode = v170.state.otpCode, 
            otpSessionToken = v170.state.otpSessionToken
        };
        local v343 = {
            otpSessionToken = tostring(v170.state.otpSessionToken), 
            otpContactType = l_Constants_1.otpServiceContactType
        };
        return l_ValidateCode_0(l_networking_3, v342)():andThen(function(_) --[[ Line: 1550 ]]
            -- upvalues: v170 (ref), v340 (copy), v343 (copy)
            v170.props.closeCentralOverlay();
            v340.otpSession = v343;
            v170.launchKISATermsOfService(v340, true);
        end):catch(function(v345) --[[ Line: 1555 ]]
            -- upvalues: v80 (ref)
            return v80.reject(v345);
        end);
    end;
    v170.onAbandonKISASignUpFlow = function() --[[ Line: 1560 ]]
        -- upvalues: l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), v170 (copy)
        l_AnalyticsEvents_0.sendButtonClickEvent(l_EventConstants_0.ctx.kisaAgreements, l_EventConstants_0.origin.signup, l_EventConstants_0.btn.cancel);
        v170.updateIsSignUpInProgress(false);
    end;
    v170.launchParentSignUpOtp = function(v346) --[[ Line: 1570 ]]
        -- upvalues: l_Constants_1 (ref), v170 (copy)
        local v349 = {
            origin = l_Constants_1.otpServiceOriginSignup, 
            codeLength = 6, 
            enterEmailTitleKey = l_Constants_1.translationKeys.parentEmailTitleKey, 
            enterEmailDescriptionKey = l_Constants_1.translationKeys.sendParentVerificationCodeKey, 
            enterCodeTitleKey = l_Constants_1.translationKeys.oneTimeCodeTitleKey, 
            enterCodeDescriptionKey = l_Constants_1.translationKeys.oneTimeCodeHelpDescriptionKey, 
            complianceCheckboxMessageKey = l_Constants_1.translationKeys.parentalConsentModalDescriptionKey, 
            onSubmitCode = function(v347, v348) --[[ Line: 1581 ]] --[[ Name: onSubmitCode ]]
                -- upvalues: v170 (ref), v346 (copy)
                return v170.validateOtpCode(v347, v348, v346);
            end, 
            onModalAbandoned = v170.onAbandonKISASignUpFlow, 
            screenSize = v170.props.screenSize
        };
        v170.props.openEmailOtp(v349);
    end;
    if not v143 then
        l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v350) --[[ Line: 1594 ]]
            -- upvalues: v170 (copy), v88 (ref)
            local v351 = v350.isAvailable or false;
            local v352 = false;
            if v350.password and v350.password.isAvailable then
                v352 = true;
            end;
            if v170.isMounted then
                v170:setState({
                    passkeysAvailable = v351, 
                    isCredentialsProtocolRegisterPasswordAvailable = v352
                });
            end;
            v170.props.authEventAnalytics.reportAuthPageload(v88.Context.PasskeySignup, (tostring(v351)));
            v170.props.authEventAnalytics.reportAuthPageload(v88.Context.CMPasswordSignup, (tostring(v352)));
        end):catch(function(v353) --[[ Line: 1620 ]]
            warn("Error checking for available credential types. Error: ", v353);
        end);
    end;
    v170.isMounted = false;
end;
v169.didMount = function(v354) --[[ Line: 1628 ]] --[[ Name: didMount ]]
    -- upvalues: v143 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), v88 (copy), v159 (copy), v60 (copy), l_MemStorageService_0 (copy), v63 (copy), l_UserInputService_0 (copy), v137 (copy), l_UserAgreementsCounterNames_0 (copy), v136 (copy), l_TelemetryConfigs_0 (copy), v114 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v119 (copy), v58 (copy)
    v354.isMounted = true;
    v354.isAltAttempt = nil;
    if v143 then
        l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v355) --[[ Line: 1635 ]]
            -- upvalues: v354 (copy), v88 (ref)
            local v356 = v355.isAvailable or false;
            local v357 = false;
            if v355.password and v355.password.isAvailable then
                v357 = true;
            end;
            if v354.isMounted then
                v354:setState({
                    passkeysAvailable = v356, 
                    isCredentialsProtocolRegisterPasswordAvailable = v357
                });
            end;
            v354.props.authEventAnalytics.reportAuthPageload(v88.Context.PasskeySignup, (tostring(v356)));
            v354.props.authEventAnalytics.reportAuthPageload(v88.Context.CMPasswordSignup, (tostring(v357)));
        end):catch(function(v358) --[[ Line: 1661 ]]
            warn("Error checking for available credential types. Error: ", v358);
        end);
    end;
    if not v159 and v60 == true and v354.isAlreadyAuthenticated == true then
        l_MemStorageService_0:Fire(v63.ThemeUpdate, "dark");
    end;
    v354.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 1678 ]]
        -- upvalues: l_UserInputService_0 (ref), v354 (copy)
        local v359 = l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        v354:setState({
            onScreenKeyboardHeight = v359
        });
    end);
    local v360 = v354.props.appPolicy.getAddUserAgreementIdsToSignupRequest();
    local v361 = v354.getShouldShowVNGAgreements();
    local v362 = v354.getShouldShowKISAAgreements();
    if v360 or v361 or v362 then
        local function v364(v363) --[[ Line: 1691 ]]
            -- upvalues: v137 (ref), l_UserAgreementsCounterNames_0 (ref), v354 (copy)
            if not v363 then
                v137(l_UserAgreementsCounterNames_0.FetchAgreementsHttpRequestFailureOnSignup, 1);
                return;
            elseif #v363 > 0 then
                v354.updateState({
                    agreements = v363
                });
                return;
            else
                v137(l_UserAgreementsCounterNames_0.FetchAgreementsEmptyResponseOnSignup, 1);
                return;
            end;
        end;
        v136(v354.props.networking, v354.props.analytics):andThen(v364, function() --[[ Line: 1708 ]]

        end);
    end;
    v354.props.authEventAnalytics.reportScreenLoaded(v88.Context.SinglePageSignUpScreen);
    v354.props.loggingProtocol:logEventOnce("signup_page_did_mount");
    v354.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SignupPageMountTelemetryConfig, 1, {
        version = 1
    });
    if v114() then
        local v365 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        if v119() then
            v58(v354.props.networking):andThen(function(v366) --[[ Line: 1726 ]]
                -- upvalues: v354 (copy), v88 (ref), v365 (copy)
                if v366 and v366.IsAltBrowserTracker ~= nil then
                    v354.isAltAttempt = v366.IsAltBrowserTracker;
                    v354.props.authEventAnalytics.reportAuthPageload(v88.Context.SinglePageSignUpScreen, v365, v354.isAltAttempt);
                end;
            end, function(_) --[[ Line: 1735 ]]
                -- upvalues: v354 (copy), v88 (ref), v365 (copy)
                warn("Error auth metadata: ", error);
                v354.props.authEventAnalytics.reportAuthPageload(v88.Context.SinglePageSignUpScreen, v365, v354.isAltAttempt);
            end);
        else
            v354.props.authEventAnalytics.reportAuthPageload(v88.Context.SinglePageSignUpScreen, v365, v354.isAltAttempt);
        end;
    end;
    if v354.props.focusedGuiObject and v354.backButtonRef and v354.backButtonRef.current then
        v354.props.focusGuiObject(v354.backButtonRef.current);
    end;
end;
v169.willUnmount = function(v368) --[[ Line: 1757 ]] --[[ Name: willUnmount ]]
    -- upvalues: v60 (copy)
    v368.isMounted = false;
    v368.isAltAttempt = nil;
    if v60 == true and v368.isAlreadyAuthenticated == true then
        v368.resetDefaultTheme();
    end;
    if v368.keyboardVisibleChanged then
        v368.keyboardVisibleChanged:disconnect();
        v368.keyboardVisibleChanged = nil;
    end;
end;
v169.didUpdate = function(v369, _, v371) --[[ Line: 1771 ]] --[[ Name: didUpdate ]]
    -- upvalues: v142 (copy), v146 (copy), v147 (copy), v137 (copy), v22 (copy)
    if v369.props.focusedGuiObject and v369.props.birthdayContainerRef.current and v369.props.focusedGuiObject:IsDescendantOf(v369.props.birthdayContainerRef.current) then
        v369.updateScrollCanvasTargetPositionY(10);
    else
        v369.updateScrollCanvasTargetPositionY(0);
    end;
    if v142 and v369.state.birthday ~= nil and not v369.state.hasSetIneligibleAgeAtLeastOnce and v369.getUserAge() < v146 then
        v369:setState({
            hasSetIneligibleAgeAtLeastOnce = true
        });
    end;
    if v147 and v369.props.shouldSeeDisplayNamesOnSignup then
        if v369.state.recommendedUsername ~= "" and v369.state.hasEditedUsername and v369.state.hasEditedUsername ~= v371.hasEditedUsername then
            v137(v22.ReccomendedNameEdited, 1);
        end;
        if v369.state.recommendedUsername ~= nil and v369.state.recommendedUsername ~= "" and v369.state.hasEditedUsername == true and v369.state.username == "" and v371.username ~= "" and v369.props.shouldSeeDisplayNamesOnSignup then
            v137(v22.ReccomendedNameManuallyCleared, 1);
        end;
        if v369.state.birthday ~= nil and v371.birthday ~= nil and v369.state.birthday ~= v371.birthday then
            if v369.getUserAge() >= v146 and v371.birthday:GetAgeInYears() < v146 then
                v137(v22.BirthdayChangedToAboveDisplayAge, 1);
            end;
            if v369.getUserAge() < v146 and v371.birthday:GetAgeInYears() >= v146 then
                v137(v22.BirthdayChangedToAboveDisplayAge, 1);
            end;
        end;
    end;
end;
v169.render = function(v372) --[[ Line: 1833 ]] --[[ Name: render ]]
    -- upvalues: v159 (copy), v60 (copy), v7 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy), v168 (copy)
    if v159 and v60 and v372.isAlreadyAuthenticated then
        return v7.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            Child = if v168() then v372:renderWithView() else v372:renderDeprecated()
        });
    elseif v168() then
        return v372:renderWithView();
    else
        return v372:renderDeprecated();
    end;
end;
v169.renderWithView = function(v373) --[[ Line: 1852 ]] --[[ Name: renderWithView ]]
    -- upvalues: v30 (copy), l_RobloxLocaleIdKey_0 (copy), v7 (copy), v139 (copy), v55 (copy), v56 (copy)
    local v374 = v373.getIsSignUpButtonEnabled();
    return v30({})(function(v375) --[[ Line: 1855 ]]
        -- upvalues: v373 (copy), l_RobloxLocaleIdKey_0 (ref), v7 (ref), v139 (ref), v374 (copy), v55 (ref), v56 (ref)
        v373.locale = v375[l_RobloxLocaleIdKey_0];
        return v7.createElement(v139, {
            navigateBack = v373.props.navigateBack, 
            useVerifiedSignup = v373.useVerifiedSignup, 
            useUsernameSuggestions = v373.useUsernameSuggestions, 
            useRefreshButton = v373.useRefreshButton, 
            onGenderChanged = v373.onGenderChanged, 
            getHidePassword = v373.getHidePassword, 
            passwordVisibilityToggleCallback = v373.passwordVisibilityToggleCallback, 
            onBirthdaySelected = v373.onBirthdaySelected, 
            onBirthdayFocused = v373.onBirthdayFocused, 
            onSignUpClick = v373.onSignUpClick, 
            usernameSuggestionClicked = v373.usernameSuggestionClicked, 
            usernameSuggestionsShown = v373.usernameSuggestionsShown, 
            shouldSuggest = v373.shouldSuggest, 
            updateIssueCondition = v373.updateIssueCondition, 
            updateSuggestionControlState = v373.updateSuggestionControlState, 
            logRefreshButtonClicked = v373.logRefreshButtonClicked, 
            loadSuggestions = v373.loadSuggestions, 
            finishSuggestions = v373.finishSuggestions, 
            validUsernameEntered = v373.validUsernameEntered, 
            validPasswordEntered = v373.validPasswordEntered, 
            onUsernameTextBoxFocused = v373.onUsernameTextBoxFocused, 
            onPasswordTextBoxFocused = v373.onPasswordTextBoxFocused, 
            onUsernameTextChanged = v373.onUsernameTextChanged, 
            onUsernameTextValidated = v373.onUsernameTextValidated, 
            onPasswordTextChanged = v373.onPasswordTextChanged, 
            onTextBoxFocusLost = v373.onTextBoxFocusLost, 
            onFocusedTextBoxPositionChanged = v373.onFocusedTextBoxPositionChanged, 
            onAnimationStateChangeCallback = v373.onAnimationStateChangeCallback, 
            onUsernameTextChangeCompletedFromKeyboard = v373.onUsernameTextChangeCompletedFromKeyboard, 
            onPasswordTextChangeCompletedFromKeyboard = v373.onPasswordTextChangeCompletedFromKeyboard, 
            phoneCountryCodeSelectorCallback = v373.phoneCountryCodeSelectorCallback, 
            SetContactMethod = v373.SetContactMethod, 
            SetPhoneNumber = v373.SetPhoneNumber, 
            SetEmail = v373.SetEmail, 
            isUsernameAnimating = v373.state.isUsernameAnimating, 
            isPasswordAnimating = v373.state.isPasswordAnimating, 
            birthday = v373.state.birthday, 
            username = v373.state.username, 
            isSignUpInProgress = v373.state.isSignUpInProgress, 
            onScreenKeyboardHeight = v373.state.onScreenKeyboardHeight, 
            usernameValid = v373.state.usernameValid, 
            passwordValid = v373.state.passwordValid, 
            issueCondition = v373.state.issueCondition, 
            loadingSuggestions = v373.state.loadingSuggestions, 
            isSignUpButtonEnabled = v374, 
            birthdayFocused = v373.state.birthdayFocused, 
            isCountryCodeSearchVisible = v373.state.isCountryCodeSearchVisible, 
            contactMethod = v373.state.contactMethod, 
            signUpError = v373.state.signUpError, 
            UsernameValidator = v55, 
            PasswordValidator = v56, 
            signUpContentFrameRef = v373.scrollingFrameRef, 
            ageTextFieldRef = v373.ageTextFieldRef, 
            usernameTextFieldRef = v373.usernameTextFieldRef, 
            passwordTextFieldRef = v373.passwordTextFieldRef, 
            passwordFrameRef = v373.passwordFrameRef, 
            onSignUpContentFrameCanvasSizeChange = v373.onSignUpContentFrameCanvasSizeChange, 
            scrollCanvasTargetPositionY = v373.scrollCanvasTargetPositionY, 
            updateScrollCanvasTargetPositionY = v373.updateScrollCanvasTargetPositionY, 
            getScrollingFrameCanvasPosition = v373.getScrollingFrameCanvasPosition
        });
    end);
end;
v169.renderDeprecated = function(v376) --[[ Line: 1941 ]] --[[ Name: renderDeprecated ]]
    -- upvalues: l_FormFactor_0 (copy), l_GetFFlagEnableTextFieldContentType_0 (copy), l_FFlagFoundationStylingOnSignUp_0 (copy), v142 (copy), l_DisclaimerLinksVariant_0 (copy), v110 (copy), v111 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v149 (copy), v112 (copy), v144 (copy), v166 (copy), l_withStyle_0 (copy), v30 (copy), l_RobloxLocaleIdKey_0 (copy), v164 (copy), v7 (copy), v37 (copy), l_BackgroundFill_0 (copy), v34 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v167 (copy), l_ImageSetButton_0 (copy), v165 (copy), l_Text_0 (copy), v36 (copy), v35 (copy), v38 (copy), v159 (copy), v60 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), v45 (copy), v94 (copy), v44 (copy), l_DateHelper_0 (copy), v8 (copy), v140 (copy), v40 (copy), v55 (copy), v87 (copy), v126 (copy), v127 (copy), l_game_EngineFeature_0 (copy), v56 (copy), v117 (copy), v41 (copy), v102 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_View_0 (copy), l_Checkbox_0 (copy), v88 (copy), l_InputSize_0 (copy), v42 (copy), v43 (copy)
    local l_birthday_2 = v376.state.birthday;
    local l_username_2 = v376.state.username;
    local v379 = v376.getIsSignUpButtonEnabled();
    local l_isSignUpInProgress_0 = v376.state.isSignUpInProgress;
    local l_gender_1 = v376.state.gender;
    local v382 = v376.props.formFactor == l_FormFactor_0.WIDE;
    local l_isCompactView_0 = v376.props.isCompactView;
    local v384 = 0;
    local v385 = 0;
    local v386 = v376.state.onScreenKeyboardHeight > 0;
    local l_contactMethod_0 = v376.state.contactMethod;
    local l_foundationTokens_0 = v376.props.foundationTokens;
    local l_shouldUseFoundationBackgroundColor_0 = v376.props.shouldUseFoundationBackgroundColor;
    local v390 = l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions;
    local v391 = not v376.validUsernameEntered();
    local v392 = v376.useVerifiedSignup();
    local v393 = v382 and v392 and 12 or 0;
    local v394 = "Authentication.SignUp.Label.ErrorsWithUsername";
    local v395 = "Authentication.SignUp.Label.ErrorsWithPassword";
    local v396 = v376.useUsernameSuggestions();
    local v397 = v376.useRefreshButton();
    local v398 = l_FFlagFoundationStylingOnSignUp_0 and l_isCompactView_0;
    if not l_birthday_2 then
        v394 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst";
        v395 = v394;
        v391 = true;
    elseif v142 and v376.isDisplayNameFieldRequired() and not v376.isValidDisplayNameEntered() then
        v391 = true;
        v395 = "Authentication.SignUp.Response.AgedUpDisplayNameSetFirst";
    elseif v391 then
        v395 = "Authentication.SignUp.Response.UsernameMustBeSetFirst";
    end;
    if v382 then
        if v386 then
            v384 = v376.state.onScreenKeyboardHeight + 10;
        else
            v384 = 48;
            v385 = 24;
        end;
    end;
    local v399 = nil;
    if v398 then
        v399 = l_DisclaimerLinksVariant_0.Default;
    end;
    local v400 = v110();
    local v401 = v376.props.shouldUseMinimalSignup and v400;
    local v402 = v376.props.shouldHideGenderOption and v400;
    local v403 = v376.props.shouldAutofocusOnBirthday and v400;
    local v404 = v111();
    local v405 = v376.props.shouldUsePasswordlessSignup and v404;
    local v406 = v376.getShouldShowVNGAgreements();
    local v407 = v376.getShouldShowKISAAgreements();
    local v408 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
    local v409 = v149 and v408 ~= nil and v408 ~= "";
    local v410 = not v376.state.passkeysAvailable or v409;
    if v112() and v376.props.shouldUsePasskeySignup and v410 then
        v405 = false;
    end;
    local v411 = v144 and v376.props.shouldDisableUsernameAutofill;
    local v412 = v112();
    local v413 = v376.props.shouldUsePasskeySignup and v412 and game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not v410;
    local l_v166_0 = v166;
    local function _(v415) --[[ Line: 2039 ]] --[[ Name: getVerificationLinkingText ]]
        -- upvalues: v376 (copy)
        local v416 = nil;
        local v417 = v376.props.appPolicy.getPlatformAccountName();
        if v417 and v376.props.appPolicy.getUseSingleSignOn() then
            v416 = {
                "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"; 
                platform = v417, 
                ctaButton = v415
            };
        end;
        return v416;
    end;
    return l_withStyle_0(function(v419) --[[ Line: 2052 ]]
        -- upvalues: v30 (ref), v142 (ref), v376 (copy), l_RobloxLocaleIdKey_0 (ref), v401 (copy), v382 (copy), v398 (copy), l_foundationTokens_0 (copy), v164 (ref), v413 (copy), v7 (ref), v37 (ref), l_shouldUseFoundationBackgroundColor_0 (copy), l_BackgroundFill_0 (ref), l_isSignUpInProgress_0 (copy), v34 (ref), l_ImageSetLabel_0 (ref), v384 (ref), v385 (ref), l_GetImageData_0 (ref), v167 (ref), l_ImageSetButton_0 (ref), v165 (ref), l_v166_0 (copy), l_Text_0 (ref), v36 (ref), v35 (ref), v393 (copy), v38 (ref), v392 (copy), v403 (copy), v159 (ref), v60 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v45 (ref), v94 (ref), v44 (ref), l_birthday_2 (copy), l_DateHelper_0 (ref), l_contactMethod_0 (copy), v8 (ref), v140 (ref), v40 (ref), v394 (ref), v411 (copy), v390 (copy), v396 (copy), v55 (ref), v87 (ref), v126 (ref), v127 (ref), v397 (copy), v405 (ref), v395 (ref), v391 (ref), l_game_EngineFeature_0 (ref), v56 (ref), l_username_2 (copy), v402 (copy), v117 (ref), v41 (ref), l_gender_1 (copy), v102 (ref), v379 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_View_0 (ref), l_Checkbox_0 (ref), v88 (ref), l_InputSize_0 (ref), v406 (copy), v407 (copy), v42 (ref), v43 (ref), l_FFlagFoundationStylingOnSignUp_0 (ref), v399 (ref), v386 (copy)
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
        })(function(v420) --[[ Line: 2066 ]]
            -- upvalues: v376 (ref), l_RobloxLocaleIdKey_0 (ref), v401 (ref), v382 (ref), v398 (ref), l_foundationTokens_0 (ref), v142 (ref), v164 (ref), v413 (ref), v7 (ref), v37 (ref), l_shouldUseFoundationBackgroundColor_0 (ref), v419 (copy), l_BackgroundFill_0 (ref), l_isSignUpInProgress_0 (ref), v34 (ref), l_ImageSetLabel_0 (ref), v384 (ref), v385 (ref), l_GetImageData_0 (ref), v167 (ref), l_ImageSetButton_0 (ref), v165 (ref), l_v166_0 (ref), l_Text_0 (ref), v36 (ref), v35 (ref), v393 (ref), v38 (ref), v392 (ref), v403 (ref), v159 (ref), v60 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v45 (ref), v94 (ref), v44 (ref), l_birthday_2 (ref), l_DateHelper_0 (ref), l_contactMethod_0 (ref), v8 (ref), v140 (ref), v40 (ref), v394 (ref), v411 (ref), v390 (ref), v396 (ref), v55 (ref), v87 (ref), v126 (ref), v127 (ref), v397 (ref), v405 (ref), v395 (ref), v391 (ref), l_game_EngineFeature_0 (ref), v56 (ref), l_username_2 (ref), v402 (ref), v117 (ref), v41 (ref), l_gender_1 (ref), v102 (ref), v379 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_View_0 (ref), l_Checkbox_0 (ref), v88 (ref), l_InputSize_0 (ref), v406 (ref), v407 (ref), v42 (ref), v43 (ref), l_FFlagFoundationStylingOnSignUp_0 (ref), v399 (ref), v386 (ref)
            v376.locale = v420[l_RobloxLocaleIdKey_0];
            local v421 = not v401;
            local v422 = v382 and 25 or 48;
            local v423 = UDim2.new(0.5, 0, 0, 49);
            if v398 then
                v422 = v422 + l_foundationTokens_0.Padding.Medium;
                v423 = UDim2.new(0.5, 0, 0, 1 + l_foundationTokens_0.Padding.Medium);
            end;
            if v142 then
                v421 = v376.shouldShowUsernameField() and not v401;
            end;
            local v424 = not v376.getSignupCheckboxDisabled() and v376.props.shouldRequireSignupCheckbox;
            local v425 = v164 and "Authentication.SignUp.Description.SignUpAgreement.FullCopy.CreateAccount" or "Authentication.SignUp.Description.VerificationPage.CreateAccount";
            if v413 then
                v425 = "Authentication.SignUp.Description.VerificationPageMultiStep";
            else
                local l_signUpText_0 = v420.signUpText;
                local v427 = nil;
                local v428 = v376.props.appPolicy.getPlatformAccountName();
                if v428 and v376.props.appPolicy.getUseSingleSignOn() then
                    v427 = {
                        "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"; 
                        platform = v428, 
                        ctaButton = l_signUpText_0
                    };
                end;
                if v427 then
                    local l_signUpText_1 = v420.signUpText;
                    l_signUpText_0 = nil;
                    v427 = v376.props.appPolicy.getPlatformAccountName();
                    if v427 and v376.props.appPolicy.getUseSingleSignOn() then
                        l_signUpText_0 = {
                            "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"; 
                            platform = v427, 
                            ctaButton = l_signUpText_1
                        };
                    end;
                    v425 = l_signUpText_0;
                end;
            end;
            local v430 = "";
            if not v376.getSignupCheckboxDisabled() then
                if v376.props.signupLegalDisclaimerTextVariant == 1 then
                    if v424 then
                        v430 = v420.signUpAgreementFullCopyCheckboxText;
                    else
                        v425 = v413 and "Authentication.SignUp.Description.SignUpAgreement.FullCopy.Continue" or "Authentication.SignUp.Description.SignupAgreement.FullCopy.CreateAccount";
                    end;
                elseif v376.props.signupLegalDisclaimerTextVariant == 2 and v424 then
                    v430 = v420.signUpAgreementShortCopyCheckboxText;
                end;
            end;
            local v431 = true;
            if v376.props.shouldShowBackButton ~= nil then
                v431 = v376.props.shouldShowBackButton;
            end;
            local l_createElement_0 = v7.createElement;
            local l_v37_0 = v37;
            local v434 = {
                BackgroundTransparency = 1, 
                includeStatusBar = true, 
                buttonRef = v376.props.containerRef, 
                renderFullscreenBackground = function() --[[ Line: 2126 ]] --[[ Name: renderFullscreenBackground ]]
                    -- upvalues: v7 (ref), v382 (ref), l_shouldUseFoundationBackgroundColor_0 (ref), l_foundationTokens_0 (ref), v419 (ref), l_BackgroundFill_0 (ref)
                    return v7.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = v382 and 1 or 0, 
                        BackgroundColor3 = if l_shouldUseFoundationBackgroundColor_0 then l_foundationTokens_0.Color.Surface.Surface_0.Color3 else v419.Theme.BackgroundUIDefault.Color
                    }, {
                        Background = v382 and v7.createElement(l_BackgroundFill_0, {
                            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
                        }), 
                        Mask = v382 and v7.createElement("ImageLabel", {
                            ZIndex = 2, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundColor3 = Color3.new(0, 0, 0), 
                            BackgroundTransparency = 0.5
                        })
                    });
                end
            };
            local v435 = {
                UserInputSink = l_isSignUpInProgress_0 and v7.createElement("ImageButton", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = ""
                }), 
                UnderAgeAlert = v376.state.shouldShowUnderAgeAlert and v7.createElement(v34, {
                    ZIndex = 3, 
                    onDismiss = function() --[[ Line: 2155 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v376 (ref)
                        v376:setState({
                            shouldShowUnderAgeAlert = false
                        });
                    end
                })
            };
            local l_createElement_1 = v7.createElement;
            local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
            local v438 = {
                Size = UDim2.new(1, 0, 1, -v384), 
                Position = UDim2.new(0.5, 0, 0, v385), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                ImageColor3 = if l_shouldUseFoundationBackgroundColor_0 then l_foundationTokens_0.Color.Surface.Surface_0.Color3 else v419.Theme.BackgroundUIDefault.Color, 
                ClipsDescendants = true
            };
            local v439 = {
                SizeConstraint = v7.createElement("UISizeConstraint", {
                    MaxSize = v167
                }), 
                HeaderFrame = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1
                }, {
                    BackButton = v431 and v7.createElement(l_ImageSetButton_0, {
                        Size = v165, 
                        AutoButtonColor = false, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 12, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = l_v166_0, 
                        ImageColor3 = v419.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0, 
                        [v7.Event.Activated] = v376.onCloseButtonClicked, 
                        [v7.Ref] = v376.backButtonRef
                    }), 
                    Title = v420.signUpText and if v398 then v7.createElement(l_Text_0, {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Text = v420.signUpText or "", 
                        fontStyle = l_foundationTokens_0.Typography.HeadingSmall, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    }) else v7.createElement(v36, {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        fitAxis = v35.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        Text = v420.signUpText or "", 
                        TextWrapped = true, 
                        Font = v419.Font.CaptionHeader.Font, 
                        TextSize = v419.Font.BaseSize * v419.Font.Header1.RelativeSize, 
                        TextColor3 = v419.Theme.TextEmphasis.Color, 
                        TextTransparency = v419.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Divider = not v398 and v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0.5, 0, 0, 48), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = l_shouldUseFoundationBackgroundColor_0 and 1 or 0, 
                    BackgroundColor3 = v419.Theme.UIEmphasis.Color
                })
            };
            local l_createElement_2 = v7.createElement;
            local l_FitScrollingFrame_0 = v35.FitScrollingFrame;
            local v445 = {
                Size = UDim2.new(1, 0, 1, -(49 + v393)), 
                Position = v423, 
                AnchorPoint = Vector2.new(0.5, 0), 
                fitFields = {
                    CanvasSize = v35.FitAxis.Height
                }, 
                ScrollBarThickness = 0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Selectable = false, 
                ScrollingEnabled = not (v376.state.isUsernameAnimating or v376.state.isPasswordAnimating), 
                CanvasPosition = v376.scrollCanvasTargetPositionY:map(function(v442) --[[ Line: 2245 ]]
                    -- upvalues: v376 (ref)
                    return v376.getScrollingFrameCanvasPosition(v442);
                end), 
                [v7.Ref] = v376.scrollingFrameRef, 
                [v7.Change.CanvasSize] = function(_) --[[ Line: 2249 ]]
                    -- upvalues: v376 (ref)
                    local v444 = v376.scrollCanvasTargetPositionY:getValue();
                    v376.scrollingFrameRef.current.CanvasPosition = v376.getScrollingFrameCanvasPosition(v444);
                end
            };
            local v446 = {
                ContentPadding = v7.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, v422)
                }), 
                ListLayout = v7.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 5)
                })
            };
            local v447 = false;
            if v376.getBirthdayVariant() == 0 then
                v447 = v7.createElement(v38, {
                    layoutOrder = 1, 
                    onBirthdaySelected = v376.onBirthdaySelected, 
                    onBirthdayFocused = v376.onBirthdayFocused, 
                    autoFocusOnMount = v392 or v403, 
                    buttonRef = v376.props.defaultRef, 
                    preferredInput = v376.props.preferredInput, 
                    birthdayContainerRef = v376.props.birthdayContainerRef, 
                    forceDarkTheme = v159 and v60 and v376.isAlreadyAuthenticated, 
                    enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
                });
            end;
            v446.BirthdayBar = v447;
            v447 = false;
            if v376.getBirthdayVariant() ~= 0 then
                v447 = v7.createElement(v45, {
                    layoutOrder = 1, 
                    variant = v376.getBirthdayVariant(), 
                    textInputHeight = 36, 
                    hasBirthdayError = v376.state.birthdayValid == v94.Invalid, 
                    onAgeChange = v376.onAgeChanged, 
                    onAgeAndMonthChange = v376.onAgeAndMonthChanged, 
                    onMonthAndYearChange = v376.onMonthAndYearChanged, 
                    ageTextFieldRef = v376.ageTextFieldRef, 
                    screenSize = v376.props.screenSize
                });
            end;
            v446.AgeInput = v447;
            v446.ContactInfoField = v392 and v7.createElement(v44, {
                layoutOrder = 2, 
                Under13 = l_birthday_2 and l_DateHelper_0:isRecentOrFutureDate(l_birthday_2.Month, l_birthday_2.Day, l_birthday_2.Year + 13), 
                SetContactMethod = v376.SetContactMethod, 
                SetPhoneNumber = v376.SetPhoneNumber, 
                SetEmail = v376.SetEmail, 
                contactMethod = l_contactMethod_0, 
                phoneCountryCodeSelectorCallback = v376.phoneCountryCodeSelectorCallback
            });
            v446.BackgroundPanel = v392 and v7.createElement("Frame", {
                Size = UDim2.new(0, 0, 0, 6), 
                LayoutOrder = 3, 
                BackgroundTransparency = 1
            }, {
                LightPanel = v7.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 100000, 0, 100000), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    BackgroundColor3 = v419.Theme.UIDefault.Color, 
                    AnchorPoint = Vector2.new(0.5, 0)
                })
            });
            v446.DisplayName = if v142 and v376.shouldShowDisplayNameField() then v8.createElement(v140, {
                authEventAnalytics = v376.props.authEventAnalytics, 
                birthday = if l_birthday_2 then l_birthday_2:FormatForEndpoint() else "", 
                bypassDisplayNameField = v376.state.bypassDisplayNameField, 
                focusedTextBoxPositionChangedCallback = v376.onFocusedTextBoxPositionChanged, 
                layoutOrder = 4, 
                onAnimationStateChangeCallback = v376.onAnimationStateChangeCallback, 
                onDisplayNameTextChanged = v376.onDisplayNameTextChanged, 
                onReturnPressedFromOnScreenKeyboard = v376.onDisplayNameTextChangeCompletedFromKeyboard, 
                pillClicked = v376.state.pillClicked, 
                resetPillClicked = v376.resetPillClicked, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                setUsernameRecommendation = v376.setUsernameRecommendation, 
                shouldDisableRecommendation = v376.state.hasEditedUsername, 
                textBoxFocusedCallback = v376.onDisplayNameTextBoxFocused, 
                textBoxFocusLostCallback = v376.onTextBoxFocusLost, 
                textBoxRef = v376.displayNameTextFieldRef, 
                updateBypassDisplayNameField = v376.updateBypassDisplayNameField, 
                updatePillClicked = v376.updatePillClicked
            }) else nil;
            v446.UsernameValidator = v421 and v7.createElement(v40, {
                layoutOrder = v142 and 5 or 4, 
                titleTextKey = "Authentication.Login.Label.Username", 
                summaryErrorTextKey = v394, 
                prerequisiteMet = l_birthday_2 and true or false, 
                textInputType = if v411 then nil else v390, 
                onInputTextChanged = v376.onUsernameTextChanged, 
                onInputTextValidated = v396 and v376.onUsernameTextValidated or v376.onUsernameTextChanged, 
                validator = v55, 
                prefilledText = if v142 then v376.state.recommendedUsername else nil, 
                placeholderText = if v142 then v376.getUsernamePlaceholder(v420) else v420.usernamePlaceholder, 
                validatorAdditionalProps = {
                    birthday = l_birthday_2 and l_birthday_2:FormatForEndpoint() or "", 
                    context = v87.Signup
                }, 
                textBoxFocusedCallback = v376.onUsernameTextBoxFocused, 
                textBoxFocusLostCallback = if v142 then v376.onUsernameTextBoxFocusLost else v376.onTextBoxFocusLost, 
                focusedTextBoxPositionChangedCallback = v376.onFocusedTextBoxPositionChanged, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                onReturnPressedFromOnScreenKeyboard = v376.onUsernameTextChangeCompletedFromKeyboard, 
                onAnimationStateChangeCallback = v376.onAnimationStateChangeCallback, 
                textBoxRef = v376.usernameTextFieldRef, 
                pillClicked = v376.state.pillClicked, 
                updatePillClicked = v376.updatePillClicked, 
                resetPillClicked = v376.resetPillClicked, 
                issueCondition = v376.state.issueCondition, 
                updateIssueCondition = v376.updateIssueCondition, 
                loadingSuggestions = v376.state.loadingSuggestions, 
                paddingBottomOverride = v142 and v376.props.shouldSeeDisplayNamesOnSignup and v376.getUsernameGuidanceText(v420) and -5 or nil, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v446.UsernameGuidanceText = if v142 and v376.props.shouldSeeDisplayNamesOnSignup and v376.getUsernameGuidanceText(v420) then v7.createElement("Frame", {
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
                    Font = v419.Font.CaptionBody.Font, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = v376.getUsernameGuidanceText(v420), 
                    TextColor3 = v419.Theme.TextDefault.Color, 
                    TextSize = v419.Font.BaseSize * v419.Font.CaptionBody.RelativeSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            }) else nil;
            v446.SuggestionsFrame = v421 and v396 and v7.createElement(v126, {
                layoutOrder = v142 and 5 or 4, 
                textBoxRef = v376.usernameTextFieldRef, 
                usernameValid = v376.state.usernameValid, 
                birthday = l_birthday_2 and l_birthday_2:FormatForEndpoint() or "", 
                suggest = v127, 
                context = v87.Signup, 
                pillClicked = v376.state.pillClicked, 
                updatePillClicked = v376.updatePillClicked, 
                resetPillClicked = v376.resetPillClicked, 
                issueCondition = v376.state.issueCondition, 
                usernameSuggestionClicked = v376.usernameSuggestionClicked, 
                usernameSuggestionsShown = v376.usernameSuggestionsShown, 
                shouldSuggest = v376.shouldSuggest, 
                updateSuggestionControlState = v376.updateSuggestionControlState, 
                useRefreshButton = v397, 
                logRefreshButtonClicked = v376.logRefreshButtonClicked, 
                loadSuggestions = v376.loadSuggestions, 
                finishSuggestions = v376.finishSuggestions, 
                loadingSuggestions = v376.state.loadingSuggestions, 
                padding = {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }
            });
            v446.PasswordValidator = not v401 and not v405 and v7.createElement(v40, {
                disabled = v376.state.birthdayFocused, 
                layoutOrder = v142 and 6 or 5, 
                titleTextKey = "CommonUI.Messages.Label.Password", 
                summaryErrorTextKey = v395, 
                prerequisiteMet = not v391, 
                textInputType = l_game_EngineFeature_0 and Enum.TextInputType.NewPassword or Enum.TextInputType.Password, 
                onInputTextChanged = v376.onPasswordTextChanged, 
                onInputTextValidated = v376.onPasswordTextChanged, 
                validator = v56, 
                placeholderText = v420.passwordPlaceholder, 
                validatorAdditionalProps = {
                    username = l_username_2
                }, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                textBoxFocusedCallback = v376.onPasswordTextBoxFocused, 
                textBoxFocusLostCallback = v376.onTextBoxFocusLost, 
                focusedTextBoxPositionChangedCallback = v376.onFocusedTextBoxPositionChanged, 
                onReturnPressedFromOnScreenKeyboard = v376.onPasswordTextChangeCompletedFromKeyboard, 
                onAnimationStateChangeCallback = v376.onAnimationStateChangeCallback, 
                textBoxRef = v376.passwordTextFieldRef, 
                centralOverlayBlocksInput = v392, 
                captureFocusOnTapStart = not v376.state.isCountryCodeSearchVisible
            });
            v446.GenderSelector = not v402 and v117() ~= 2 and v7.createElement(v41, {
                layoutOrder = v142 and 8 or 7, 
                gender = l_gender_1, 
                onGenderChanged = v376.onGenderChanged, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v446.Spacing = v7.createElement("Frame", {
                LayoutOrder = v142 and 9 or 8, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 38)
            });
            v446.SignUpButton = if v398 then v7.createElement(v102.Button, {
                variant = v102.Enums.ButtonVariant.Emphasis, 
                LayoutOrder = v142 and 10 or 9, 
                text = if v413 then v420.continueText else v420.signUpText, 
                size = v102.Enums.InputSize.Medium, 
                width = UDim.new(1, 0), 
                isDisabled = not v379, 
                isLoading = l_isSignUpInProgress_0, 
                onActivated = v376.onSignUpClick
            }) else v7.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                layoutOrder = v142 and 10 or 9, 
                size = UDim2.new(1, 0, 0, 36), 
                text = if v413 then v420.continueText else v420.signUpText, 
                isDisabled = not v379, 
                isLoading = l_isSignUpInProgress_0, 
                onActivated = v376.onSignUpClick
            });
            v446.CheckboxContainer = v424 and v8.createElement(l_View_0, {
                tag = "auto-xy padding-x-xxlarge padding-y-large row gap-medium", 
                LayoutOrder = v142 and 11 or 10
            }, {
                SignUpAgreementCheckbox = v8.createElement(l_Checkbox_0, {
                    isChecked = v376.state.signupAgreementsChecked, 
                    isDisabled = false, 
                    onActivated = function() --[[ Line: 2506 ]] --[[ Name: onActivated ]]
                        -- upvalues: v376 (ref), v88 (ref)
                        v376.props.authEventAnalytics.reportAuthFormInteraction(v88.Context.SinglePageSignUpScreen, v88.Field.TosCheckbox, (tostring(not v376.state.signupAgreementsChecked)));
                        v376:setState({
                            signupAgreementsChecked = not v376.state.signupAgreementsChecked
                        });
                    end, 
                    size = l_InputSize_0.Small, 
                    LayoutOrder = 1, 
                    label = ""
                }), 
                Text = v8.createElement(l_Text_0, {
                    tag = "text-body-small text-align-x-left text-wrap auto-xy shrink", 
                    LayoutOrder = 2, 
                    Text = v430
                })
            });
            v446.DisclaimerText = not (v406 or v407 or v424) and v7.createElement(v42, {
                layoutOrder = v142 and 11 or 10, 
                textXAlignment = Enum.TextXAlignment.Center, 
                paragraphTextKeys = {
                    v425
                }, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v446.DisclaimerLinks = not (v406 or v407) and v7.createElement(v43, {
                LayoutOrder = v142 and 12 or 11, 
                variant = if l_FFlagFoundationStylingOnSignUp_0 then v399 else nil, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v446.ScrollPadding = v386 and v7.createElement("Frame", {
                LayoutOrder = v142 and 13 or 12, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v376.state.onScreenKeyboardHeight * 2)
            });
            v439.SignUpContentFrame = l_createElement_2(l_FitScrollingFrame_0, v445, v446);
            v439.Footer = v392 and v382 and v7.createElement("Frame", {
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
                    ImageColor3 = v419.Theme.UIDefault.Color
                })
            });
            v435.Container = l_createElement_1(l_l_ImageSetLabel_0_0, v438, v439);
            return l_createElement_0(l_v37_0, v434, v435);
        end);
    end);
end;
v169 = v9.connect(function(v448, _) --[[ Line: 2577 ]]
    return {
        formFactor = v448.FormFactor, 
        screenSize = v448.ScreenSize
    };
end, function(v450) --[[ Line: 2582 ]]
    -- upvalues: v59 (copy), v130 (copy), l_AnalyticsEvents_0 (copy), l_EventConstants_0 (copy), v73 (copy), v51 (copy), v50 (copy), v133 (copy), v131 (copy), v135 (copy), v134 (copy), v53 (copy), v54 (copy), v66 (copy), v65 (copy), v68 (copy), v69 (copy), v77 (copy)
    return {
        signUp = function(v451, v452, v453, v454, v455, v456, v457, v458, v459, v460, v461, v462, v463, v464) --[[ Line: 2584 ]] --[[ Name: signUp ]]
            -- upvalues: v450 (copy), v59 (ref)
            return v450(v59(v451, v452, v453, v454, v455, v456, v457, v458, v459, v460, v461, v462, v463, v464));
        end, 
        agreeToPhoneNumberVerification = function(_, v466, v467) --[[ Line: 2619 ]] --[[ Name: agreeToPhoneNumberVerification ]]
            -- upvalues: v450 (copy), v130 (ref)
            return v450(v130({
                verificationChallengeCallback = v466, 
                phoneNumber = v467
            }));
        end, 
        openKISAUserAgreements = function(v468) --[[ Line: 2626 ]] --[[ Name: openKISAUserAgreements ]]
            -- upvalues: l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), v450 (copy), v73 (ref)
            l_AnalyticsEvents_0.sendPageLoadEvent(l_EventConstants_0.ctx.kisaAgreements, l_EventConstants_0.origin.signup);
            return v450(v73(v468));
        end, 
        setBackNavigationDisabled = function(v469) --[[ Line: 2631 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v450 (copy), v51 (ref)
            return v450(v51(v469));
        end, 
        navigateBack = function() --[[ Line: 2634 ]] --[[ Name: navigateBack ]]
            -- upvalues: v450 (copy), v50 (ref)
            return v450(v50());
        end, 
        showErrorToast = function() --[[ Line: 2637 ]] --[[ Name: showErrorToast ]]
            -- upvalues: v450 (copy), v133 (ref)
            return v450(v133({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        verifyPhoneNumber = function(_, v471, v472, v473, v474, v475) --[[ Line: 2640 ]] --[[ Name: verifyPhoneNumber ]]
            -- upvalues: v450 (copy), v131 (ref)
            return v450(v131({
                verifyPhoneNumberCallback = v471, 
                phoneNumber = v473, 
                deliveryTarget = v474, 
                challenge = v472, 
                useEmailOptionClickedCallback = v475
            }));
        end, 
        showErrorMessageToast = function(v476) --[[ Line: 2656 ]] --[[ Name: showErrorMessageToast ]]
            -- upvalues: v450 (copy), v135 (ref), v134 (ref)
            return v450(v135({
                toastType = v134.NetworkingError, 
                toastMessage = v476
            }));
        end, 
        showVNGUserAgreementsPopup = function(v477, v478, v479) --[[ Line: 2662 ]] --[[ Name: showVNGUserAgreementsPopup ]]
            -- upvalues: v450 (copy), v53 (ref), v54 (ref)
            return v450(v53(v54.VNGUserAgreementsPopup, {
                agreements = v477, 
                isSignup = true, 
                agreementAccepted = v478, 
                agreementDeclined = v479
            }, {
                DisableBackButtonClose = true
            }));
        end, 
        showVNGDCForm = function() --[[ Line: 2672 ]] --[[ Name: showVNGDCForm ]]
            -- upvalues: v450 (copy), v53 (ref), v54 (ref)
            v450(v53(v54.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end, 
        closeCentralOverlay = function() --[[ Line: 2677 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v450 (copy), v66 (ref)
            return v450(v66());
        end, 
        openAccountSwitchingErrorOverlay = function(v480, v481, v482, v483, v484, v485, v486, v487) --[[ Line: 2680 ]] --[[ Name: openAccountSwitchingErrorOverlay ]]
            -- upvalues: v450 (copy), v65 (ref)
            return v450(v65(v480, v481, v482, v483, v484, v485, v486, v487, true));
        end, 
        resetAppState = function() --[[ Line: 2702 ]] --[[ Name: resetAppState ]]
            -- upvalues: v450 (copy), v68 (ref)
            return v450(v68());
        end, 
        logoutWithoutShowConfirmation = function(v488, v489) --[[ Line: 2705 ]] --[[ Name: logoutWithoutShowConfirmation ]]
            -- upvalues: v450 (copy), v69 (ref)
            return v450(v69(v488, v489));
        end, 
        openEmailOtp = function(v490) --[[ Line: 2709 ]] --[[ Name: openEmailOtp ]]
            -- upvalues: v450 (copy), v77 (ref)
            v450(v77(v490));
        end, 
        showAccountLinkingAlert = function(v491) --[[ Line: 2712 ]] --[[ Name: showAccountLinkingAlert ]]
            -- upvalues: v450 (copy), v53 (ref), v54 (ref)
            return v450(v53(v54.AccountLinkingAlert, {
                alertType = v491
            }));
        end
    };
end)(v169);
v169 = l_RoactServices_0.connect({
    networking = v19, 
    guiService = l_AppGuiService_0, 
    authEventAnalytics = v16, 
    analytics = v17, 
    loggingProtocol = l_AppLogging_0
})(v169);
v169 = l_RoactAppPolicy_0.connect(function(v492, _) --[[ Line: 2728 ]]
    return {
        appPolicy = v492
    };
end)(v169);
v169 = v21.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.SignupLayer, 
    l_AppBtidLayers_0.IosPasswordSavingLayer
}, function(v494, _) --[[ Line: 2737 ]]
    -- upvalues: l_AppBtidLayers_0 (copy), v142 (copy), v145 (copy)
    local v496 = v494[l_AppBtidLayers_0.SignupLayer] or {};
    local v497 = v494[l_AppBtidLayers_0.IosPasswordSavingLayer] or {};
    local v498 = if v142 then v496.shouldSeeDisplayNamesOnSignup else nil;
    if v145 then
        v498 = true;
    end;
    return {
        useVerifiedSignupPage = v496.contactMethodRequired, 
        arePasswordFieldsPlaintext = v496.ArePasswordFieldsPlaintext, 
        shouldUseUsernameSuggestions = v496.usernameSuggestionsEnabled, 
        enableRefreshButton = v496.suggestionRefreshButtonEnabled, 
        shouldUseMinimalSignup = v496.shouldUseMinimalSignup, 
        shouldHideGenderOption = v496.shouldHideGenderOption, 
        shouldAutofocusOnBirthday = v496.shouldAutofocusOnBirthday, 
        shouldUsePasswordlessSignup = v496.shouldUsePasswordlessSignup, 
        shouldUsePasskeySignup = v496.shouldUsePasskeySignup, 
        shouldAutomaticallyPromptForPasskey = v496.shouldAutomaticallyPromptForPasskey, 
        birthdayPickerVariant = v496.birthdayPickerVariant, 
        shouldSeeDisplayNamesOnSignup = v498, 
        shouldShowKoreanKISASignUpFlow = v496.shouldShowKoreanKISASignUpFlow, 
        shouldDisableUsernameAutofill = v496.shouldDisableUsernameAutofill, 
        shouldRequireSignupCheckbox = v496.shouldRequireSignupCheckbox, 
        signupLegalDisclaimerTextVariant = v496.signupLegalDisclaimerTextVariant, 
        isIosAuthServiceEnabled = v497.enableNewIosPasswordSaving or false
    };
end)(v169);
v169 = l_withNavigationProps_0(function(_, v500) --[[ Line: 2768 ]]
    return v500;
end)(v169);
local function v503(v501) --[[ Line: 2773 ]] --[[ Name: SinglePageSignUpWithAuditContent ]]
    -- upvalues: l_AuditContentContext_0 (copy), v7 (copy), v169 (ref), v23 (copy)
    local v502 = l_AuditContentContext_0.useAuditContentContext();
    return v7.createElement(v169, v23.Dictionary.join(v501, {
        capturedAuditContent = v502.capturedAuditContent, 
        additionalAuditContent = v502.additionalAuditContent
    }));
end;
return function(v504) --[[ Line: 2785 ]]
    -- upvalues: v14 (copy), v160 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), l_FFlagFoundationStylingOnSignUp_0 (copy), l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 (copy), l_useTokens_0 (copy), v21 (copy), l_AppBtidLayers_0 (copy), v8 (copy), l_GetFFlagEnablePreferredInputForSignUp_0 (copy), l_usePreferredInput_0 (copy), l_FFlagEnableSignUpExitModal_0 (copy), l_useDispatch_0 (copy), v50 (copy), v53 (copy), v54 (copy), v66 (copy), l_useSignUpPageNavigationBindings_0 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), v7 (copy), l_AuditContentContext_0 (copy), v503 (copy), v23 (copy), l_FFlagHideBackButtonOnSignUpPage_0 (copy), v169 (ref)
    local v505 = v14.useFocusedGuiObject();
    local v506 = v14.useFocusGuiObject();
    local v507 = if v160 then l_useBreakpointXOrSmaller_0(v11.Keys.Medium) else nil;
    local v508 = if not not l_FFlagFoundationStylingOnSignUp_0 or l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 then l_useTokens_0() else nil;
    local v510 = v21.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AuthenticationStylingLayer
    }, function(v509) --[[ Line: 2795 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldUseFoundationBackgroundColor = (v509[l_AppBtidLayers_0.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
        };
    end);
    local v511 = l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 and v510.shouldUseFoundationBackgroundColor;
    local v512, v513 = v8.useState(false);
    local v514 = if l_GetFFlagEnablePreferredInputForSignUp_0() then l_usePreferredInput_0() else nil;
    local v515 = l_FFlagEnableSignUpExitModal_0 and v514 == v11.Input.Directional;
    local v516 = nil;
    if v515 then
        local v517 = l_useDispatch_0();
        local l_v517_0 = v517 --[[ copy: 12 -> 16 ]];
        local v519 = v8.useCallback(function() --[[ Line: 2812 ]]
            -- upvalues: v512 (copy), l_v517_0 (copy), v50 (ref), v53 (ref), v54 (ref), v66 (ref), v506 (copy), v505 (copy)
            if not v512 then
                l_v517_0(v50());
                return;
            else
                l_v517_0(v53(v54.SignUpExitModal, {
                    onClose = function() --[[ Line: 2818 ]] --[[ Name: onClose ]]
                        -- upvalues: l_v517_0 (ref), v66 (ref), v506 (ref), v505 (ref)
                        l_v517_0(v66());
                        l_v517_0(function() --[[ Line: 2820 ]]
                            -- upvalues: v506 (ref), v505 (ref)
                            v506(v505);
                        end);
                    end, 
                    onConfirm = function() --[[ Line: 2824 ]] --[[ Name: onConfirm ]]
                        -- upvalues: l_v517_0 (ref), v66 (ref), v50 (ref)
                        l_v517_0(v66());
                        l_v517_0(v50());
                    end
                }));
                return;
            end;
        end, {
            v512
        });
        v516 = l_useSignUpPageNavigationBindings_0(v519);
    else
        v516 = l_useSignUpPageNavigationBindings_0();
    end;
    local v520 = nil;
    local v521 = nil;
    local v522, v523 = v14.useDefaultFocusBehavior(v516);
    v520 = v522;
    v521 = v523;
    v522 = v8.useRef(nil);
    if l_GetFFlagEnableAuditForSinglePageSignUp_0() then
        return v7.createElement(l_AuditContentContext_0.Provider, nil, {
            SignUpPage = v7.createElement(v503, v23.Dictionary.join(v504, {
                signUpStarted = if v515 then v512 else nil, 
                setSignUpStarted = if v515 then v513 else nil, 
                shouldShowBackButton = if l_FFlagHideBackButtonOnSignUpPage_0 then not v515 else nil, 
                preferredInput = v514, 
                focusedGuiObject = v505, 
                focusGuiObject = v506, 
                defaultRef = v520, 
                containerRef = v521, 
                birthdayContainerRef = v522, 
                isCompactView = v507, 
                foundationTokens = v508, 
                shouldUseFoundationBackgroundColor = v511
            }))
        });
    else
        return v7.createElement(v169, v23.Dictionary.join(v504, {
            signUpStarted = if v515 then v512 else nil, 
            setSignUpStarted = if v515 then v513 else nil, 
            shouldShowBackButton = if l_FFlagHideBackButtonOnSignUpPage_0 then not v515 else nil, 
            preferredInput = v514, 
            focusedGuiObject = v505, 
            focusGuiObject = v506, 
            defaultRef = v520, 
            containerRef = v521, 
            birthdayContainerRef = v522, 
            isCompactView = v507, 
            foundationTokens = v508, 
            shouldUseFoundationBackgroundColor = v511
        }));
    end;
end;