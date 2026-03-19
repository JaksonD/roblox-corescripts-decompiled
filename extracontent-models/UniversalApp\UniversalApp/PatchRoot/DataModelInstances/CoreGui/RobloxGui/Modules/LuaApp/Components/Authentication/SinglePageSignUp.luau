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
local v164 = UDim2.new(0, 36, 0, 36);
local v165 = l_Images_0["icons/navigation/close"];
local v166 = Vector2.new(540, 1080);
game:DefineFastFlag("LuaVerifiedSignup2", false);
game:DefineFastFlag("LuaVerifiedSignupExperiment2", false);
game:DefineFastFlag("CheckSignupValidityOnRender", false);
local v167 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppSignUpPageRefactor);
local v168 = v7.PureComponent:extend("SinglePageSignUp");
v168.init = function(v169) --[[ Line: 263 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp_0 (copy), l_GetCredentialsAvailabilityStore_0 (copy), v94 (copy), v92 (copy), v7 (copy), v60 (copy), v61 (copy), v64 (copy), l_MemStorageService_0 (copy), v63 (copy), v67 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_GuiService_0 (copy), v159 (copy), v153 (copy), v70 (copy), v72 (copy), v71 (copy), l_AnalyticsEvents_0 (copy), l_EventConstants_0 (copy), l_KISAComplianceUtils_0 (copy), v23 (copy), v110 (copy), v111 (copy), v112 (copy), v141 (copy), v142 (copy), l_FFlagUseBirthdayDropdownForGamepad_0 (copy), v88 (copy), v24 (copy), l_Birthday_0 (copy), l_DateHelper_0 (copy), v128 (copy), v96 (copy), v97 (copy), v148 (copy), v132 (copy), v91 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v149 (copy), v122 (copy), v95 (copy), v93 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), v89 (copy), l_AccountLinkingAlertType_0 (copy), v115 (copy), v116 (copy), v57 (copy), l_HttpService_0 (copy), v118 (copy), l_ExperienceService_0 (copy), v147 (copy), v137 (copy), v22 (copy), l_UserAgreementsCounterNames_0 (copy), v120 (copy), v125 (copy), v146 (copy), l_Constants_1 (copy), l_ValidateCode_0 (copy), v80 (copy), v143 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy)
    local v170 = nil;
    local v171 = nil;
    if l_FFlagUsePrefetchedCredProtocolIsAvailableOnSignUp_0 then
        local v172 = l_GetCredentialsAvailabilityStore_0(false);
        v170 = v172.getFido2Available(false);
        v171 = v172.getPasswordsAvailable(false);
    end;
    v169.state = {
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
        passkeysAvailable = v170, 
        isCredentialsProtocolRegisterPasswordAvailable = v171, 
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
    v169.backButtonRef = v7.createRef();
    v169.isAlreadyAuthenticated = false;
    if v60 == true then
        v169.isAlreadyAuthenticated = v61.fromLocalStorage().userId ~= -1;
    end;
    v169.resetDefaultTheme = function() --[[ Line: 332 ]]
        -- upvalues: v64 (ref), l_MemStorageService_0 (ref), v63 (ref)
        local v173 = v64.getAuthenticatedTheme();
        if v173 ~= "" then
            l_MemStorageService_0:Fire(v63.ThemeUpdate, v173);
        end;
    end;
    v169.logoutAllLoggedInUsersCallback = function() --[[ Line: 340 ]]
        -- upvalues: v169 (copy), v64 (ref), v61 (ref), v67 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_GuiService_0 (ref)
        local l_networking_0 = v169.props.networking;
        local v175 = v64.getAccountBlob();
        local v176 = v61.fromLocalStorage().userId ~= -1;
        v169:setState({
            signUpError = false, 
            isSignUpButtonEnabled = false, 
            isSignUpInProgress = false
        });
        v67(l_networking_0, v175):await();
        if v176 == true then
            v169.props.resetAppState();
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.CredentialValue, "");
            l_AppStorageService_0:Flush();
            v169.props.logoutWithoutShowConfirmation(l_networking_0, l_GuiService_0);
        end;
        v169:setState({
            signUpError = false
        });
        v169.props.closeCentralOverlay();
    end;
    v169.closeOverlayAndDisableSwitcherErrors = function() --[[ Line: 368 ]]
        -- upvalues: v169 (copy)
        v169.props.closeCentralOverlay();
    end;
    v169.onCloseButtonClicked = function() --[[ Line: 372 ]]
        -- upvalues: v159 (ref), v60 (ref), v169 (copy)
        if not v159 and v60 == true and v169.isAlreadyAuthenticated == true then
            v169.resetDefaultTheme();
        end;
        v169.props.navigateBack();
    end;
    v169.getShouldShowVNGAgreements = function() --[[ Line: 384 ]]
        -- upvalues: v169 (copy)
        return v169.props.appPolicy.getUseVNGUserAgreementPopup();
    end;
    v169.getShouldBlockVNGU12SignUpOnClientSide = function() --[[ Line: 388 ]]
        -- upvalues: v169 (copy)
        return v169.props.appPolicy.getBlockVNGU12SignUpOnClientSide();
    end;
    v169.getShouldUseAgeInput = function() --[[ Line: 392 ]]
        -- upvalues: v169 (copy), v153 (ref)
        return v169.props.appPolicy.getUseAgeInput() and v153;
    end;
    v169.getShouldShowKISAAgreements = function() --[[ Line: 396 ]]
        -- upvalues: v70 (ref), v169 (copy), v72 (ref), v71 (ref)
        return v70 and (v169.props.appPolicy.getUseKoreaKISAUserAgreementPopup() or v72) and (v169.props.shouldShowKoreanKISASignUpFlow or v71);
    end;
    v169.getShouldAddParentalConsentAgreementId = function() --[[ Line: 402 ]]
        -- upvalues: v169 (copy)
        return v169.props.appPolicy.getParentalConsentAgreementId();
    end;
    v169.getSignupCheckboxDisabled = function() --[[ Line: 406 ]]
        -- upvalues: v169 (copy)
        return v169.props.appPolicy.getSignupCheckboxDisabled();
    end;
    v169.launchKISATermsOfService = function(v177, v178) --[[ Line: 410 ]]
        -- upvalues: v169 (copy), l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), l_KISAComplianceUtils_0 (ref), v23 (ref)
        local v183 = {
            agreements = v169.state.agreements, 
            onAgreeFunction = function(v179) --[[ Line: 414 ]] --[[ Name: onAgreeFunction ]]
                -- upvalues: l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), l_KISAComplianceUtils_0 (ref), v23 (ref), v177 (copy), v169 (ref), v178 (copy)
                l_AnalyticsEvents_0.sendButtonClickEvent(l_EventConstants_0.ctx.kisaAgreements, l_EventConstants_0.origin.signup, l_EventConstants_0.btn.agree);
                local v180 = l_KISAComplianceUtils_0.getAgreedUserAgreements(v179);
                local v181 = v23.Dictionary.join(v177, {
                    agreementIds = v180
                });
                local v182 = v169.getShouldAddParentalConsentAgreementId();
                if v178 and v182 and v182 ~= "" then
                    table.insert(v181.agreementIds, v182);
                end;
                v169.requestSignUp(v181);
            end, 
            onAbandonFunction = v169.onAbandonKISASignUpFlow, 
            isUnderAgeFlow = v178
        };
        v169.props.openKISAUserAgreements(v183);
    end;
    v169.getIsSignUpButtonEnabled = function() --[[ Line: 439 ]]
        -- upvalues: v169 (copy), v110 (ref), v111 (ref), v112 (ref), v141 (ref), v94 (ref), v142 (ref), l_FFlagUseBirthdayDropdownForGamepad_0 (ref)
        local l_birthday_0 = v169.state.birthday;
        local l_username_0 = v169.state.username;
        local l_password_0 = v169.state.password;
        local l_displayName_0 = v169.state.displayName;
        local l_birthdayValid_0 = v169.state.birthdayValid;
        local l_usernameValid_0 = v169.state.usernameValid;
        local l_passwordValid_0 = v169.state.passwordValid;
        local l_displayNameValid_0 = v169.state.displayNameValid;
        local l_validBirthday_0 = v169.state.validBirthday;
        local v193 = v169.props.shouldUseMinimalSignup and v110();
        local v194 = v169.props.shouldUsePasswordlessSignup and v111();
        if v112() and v169.props.shouldUsePasskeySignup and not v169.state.passkeysAvailable then
            v194 = false;
        end;
        local v195 = v141() and v169.props.birthdayPickerVariant and v169.props.birthdayPickerVariant > 0;
        if not v169.getSignupCheckboxDisabled() and v169.props.shouldRequireSignupCheckbox and not v169.state.signupAgreementsChecked then
            return false;
        else
            local v196 = true;
            if l_usernameValid_0 == v94.Valid then
                v196 = true;
                if l_passwordValid_0 == v94.Valid then
                    v196 = v195 and l_birthdayValid_0 ~= v94.Valid or if v142 and v169.isDisplayNameFieldRequired() then l_displayNameValid_0 ~= v94.Valid else nil;
                end;
            end;
            if l_FFlagUseBirthdayDropdownForGamepad_0 and l_birthday_0 and l_validBirthday_0 == false then
                return false;
            elseif v193 and l_birthday_0 then
                if v195 and l_birthdayValid_0 ~= v94.Valid then
                    return false;
                else
                    return true;
                end;
            elseif v194 and l_birthday_0 and l_username_0 ~= "" and l_usernameValid_0 == v94.Valid then
                if v195 and l_birthdayValid_0 ~= v94.Valid then
                    return false;
                else
                    return true;
                end;
            elseif not l_birthday_0 or v196 or l_username_0 == "" or l_password_0 == "" or v142 and v169.isDisplayNameFieldRequired() and l_displayName_0 == "" or nil then
                return false;
            elseif l_validBirthday_0 == false then
                return false;
            else
                return true;
            end;
        end;
    end;
    v169.updateState = function(v197) --[[ Line: 524 ]]
        -- upvalues: v169 (copy)
        spawn(function() --[[ Line: 525 ]]
            -- upvalues: v169 (ref), v197 (copy)
            if v169.isMounted then
                v169:setState(v197);
            end;
        end);
    end;
    v169.getHidePassword = function() --[[ Line: 535 ]]
        -- upvalues: v169 (copy)
        if v169.state.hidePassword == nil then
            return not v169.props.arePasswordFieldsPlaintext;
        else
            return v169.state.hidePassword;
        end;
    end;
    v169.passwordVisibilityToggleCallback = function() --[[ Line: 542 ]]
        -- upvalues: v169 (copy), v88 (ref)
        local v198 = v169.getHidePassword();
        if v198 then
            v169.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.ShowPassword);
        else
            v169.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.HidePassword);
        end;
        v169:setState({
            hidePassword = not v198
        });
    end;
    v169.onBirthdaySelected = function(v199, v200) --[[ Line: 560 ]]
        -- upvalues: v24 (ref), l_Birthday_0 (ref), v169 (copy), v88 (ref)
        v24.assert(l_Birthday_0.is(v199), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.");
        v169.updateState({
            birthday = v199, 
            validBirthday = v200
        });
        if v169.useVerifiedSignup() then
            v169.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.ConfirmBirthday);
        end;
        v169.updateSignUpFieldFilled();
    end;
    v169.onAgeChanged = function(v201) --[[ Line: 581 ]]
        -- upvalues: v169 (copy), v94 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref)
        local v202 = tonumber(v201);
        if v202 == nil or v202 < 1 or v202 > 99 then
            v169.updateState({
                birthday = nil, 
                birthdayValid = v94.Invalid
            });
            return;
        else
            local v203 = DateTime.now():ToLocalTime();
            local v204 = l_Birthday_0.new({
                Year = v203.Year - v202, 
                Month = v203.Month, 
                Day = v203.Day
            });
            if v204.Month == 2 and v204.Day == 29 and not l_DateHelper_0:isLeapYear(v204.Year) then
                v204.Day = 28;
            end;
            if l_DateHelper_0:isValidDate(v204.Month, v204.Day, v204.Year) then
                v169.updateState({
                    birthday = v204, 
                    birthdayValid = v94.Valid
                });
                return;
            else
                v169.updateState({
                    birthday = nil, 
                    birthdayValid = v94.Invalid
                });
                return;
            end;
        end;
    end;
    v169.onAgeAndMonthChanged = function(v205, v206) --[[ Line: 612 ]]
        -- upvalues: v169 (copy), v94 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref)
        if v205 == nil or v205 < 1 or v205 > 99 then
            v169.updateState({
                birthday = nil, 
                birthdayValid = v94.Invalid
            });
            return;
        else
            local v207 = DateTime.now():ToLocalTime().Year - v205;
            local v208 = l_Birthday_0.new({
                Year = v207, 
                Month = v206, 
                Day = l_DateHelper_0:getLastDayOfTheMonthInYear(v206, v207)
            });
            if l_DateHelper_0:isValidDate(v208.Month, v208.Day, v208.Year) then
                v169.updateState({
                    birthday = v208, 
                    birthdayValid = v94.Valid
                });
                return;
            else
                v169.updateState({
                    birthday = nil, 
                    birthdayValid = v94.Invalid
                });
                return;
            end;
        end;
    end;
    v169.onMonthAndYearChanged = function(v209, v210) --[[ Line: 640 ]]
        -- upvalues: v169 (copy), v94 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref)
        local v211 = DateTime.now():ToLocalTime();
        if v210 == nil or v210 < v211.Year - 100 or v211.Year < v210 then
            v169.updateState({
                birthday = nil, 
                birthdayValid = v94.Invalid
            });
            return;
        else
            local v212 = l_Birthday_0.new({
                Year = v210, 
                Month = v209, 
                Day = l_DateHelper_0:getLastDayOfTheMonthInYear(v209, v210)
            });
            if l_DateHelper_0:isValidDate(v212.Month, v212.Day, v212.Year) then
                v169.updateState({
                    birthday = v212, 
                    birthdayValid = v94.Valid
                });
                return;
            else
                v169.updateState({
                    birthday = nil, 
                    birthdayValid = v94.Invalid
                });
                return;
            end;
        end;
    end;
    v169.usernameSuggestionClicked = function(v213, v214) --[[ Line: 668 ]]
        -- upvalues: v169 (copy), v88 (ref)
        v169.props.authEventAnalytics.reportUsernameSuggestionClicked(v88.Context.SinglePageSignUpScreen, v88.Button.UsernameSuggestion, v213, v214);
    end;
    v169.logRefreshButtonClicked = function() --[[ Line: 677 ]]
        -- upvalues: v169 (copy), v88 (ref), v128 (ref)
        v169.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v128.refreshButton);
    end;
    v169.usernameSuggestionsShown = function(v215, v216) --[[ Line: 684 ]]
        -- upvalues: v169 (copy), v88 (ref), v128 (ref)
        v169.props.authEventAnalytics.reportInteractWithActionAndSection(v88.Context.SinglePageSignUpScreen, v88.Field.Username, v88.ActionType.Shown, v128.suggestionsShown, v215, v216);
    end;
    v169.logSuggestableUsername = function(v217) --[[ Line: 695 ]]
        -- upvalues: v169 (copy), v88 (ref), v128 (ref)
        v169.props.authEventAnalytics.reportInteractWithAction(v88.Context.SinglePageSignUpScreen, v88.Field.Username, v88.ActionType.Shown, v128.suggestableInput, v217);
    end;
    v169.shouldSuggest = function() --[[ Line: 705 ]]
        -- upvalues: v169 (copy), v96 (ref), v97 (ref)
        local v218 = false;
        local l_issueCondition_0 = v169.state.issueCondition;
        if l_issueCondition_0 then
            v218 = l_issueCondition_0[v96.AlreadyInUse] == v97.Problematic;
            for v220, v221 in pairs(l_issueCondition_0) do
                if v220 ~= v96.AlreadyInUse and v221 == v97.Problematic then
                    return false;
                end;
            end;
        end;
        return v218;
    end;
    v169.onBirthdayFocused = function(v222) --[[ Line: 720 ]]
        -- upvalues: v169 (copy)
        if v169.isMounted then
            v169:setState({
                birthdayFocused = v222
            });
        end;
    end;
    v169.onUsernameTextChanged = function(v223, v224) --[[ Line: 728 ]]
        -- upvalues: v142 (ref), v169 (copy)
        local v225 = nil;
        if v142 and v169.shouldShowDisplayNameField() and not v169.state.hasEditedUsername then
            v225 = v169.state.recommendedUsername ~= v223;
        end;
        v169.updateState({
            username = v223, 
            usernameValid = v224, 
            hasEditedUsername = if v142 then v225 else nil
        });
        if v169.shouldSuggest() then
            v169.logSuggestableUsername(v223);
        end;
        v169.updateSignUpFieldFilled();
    end;
    v169.updateSignUpFieldFilled = function() --[[ Line: 750 ]]
        -- upvalues: v169 (copy)
        if v169.props.signUpStarted == nil then
            return;
        else
            local v226 = false;
            if v169.state.username ~= "" or v169.state.password ~= "" or v169.state.birthday ~= nil then
                v226 = true;
            end;
            if v226 ~= v169.state.signUpStarted then
                v169.props.setSignUpStarted(v226);
            end;
            return;
        end;
    end;
    v169.onDisplayNameTextChanged = function(v227, v228) --[[ Line: 765 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            displayName = v227, 
            displayNameValid = v228
        });
    end;
    v169.updateBypassDisplayNameField = function(v229) --[[ Line: 772 ]]
        -- upvalues: v169 (copy)
        v169:setState({
            bypassDisplayNameField = v229
        });
    end;
    v169.onUsernameTextValidated = function(v230, v231) --[[ Line: 778 ]]
        -- upvalues: v169 (copy), v94 (ref), v88 (ref)
        v169.onUsernameTextChanged(v230, v231);
        if v231 == v94.Valid then
            v169.props.authEventAnalytics.reportInteractWithAction(v88.Context.SinglePageSignUpScreen, v88.Field.Username, v88.ActionType.Submit, v231, v230);
        end;
    end;
    v169.onPasswordTextChanged = function(v232, v233) --[[ Line: 791 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            password = v232, 
            passwordValid = v233
        });
        v169.updateSignUpFieldFilled();
    end;
    v169.cachedScrollCanvasPositionY = 0;
    v169.cachedScrollCanvasInitialSizeY = 0;
    local v234, v235 = v7.createBinding(0);
    v169.scrollCanvasTargetPositionY = v234;
    v169.updateScrollCanvasTargetPositionY = v235;
    v169.scrollingFrameRef = v7.createRef();
    v169.ageTextFieldRef = v7.createRef();
    v169.usernameTextFieldRef = v7.createRef();
    v169.displayNameTextFieldRef = if v142 then v7.createRef() else nil;
    v169.passwordTextFieldRef = v7.createRef();
    v169.passwordFrameRef = v7.createRef();
    v169.onDisplayNameTextChangeCompletedFromKeyboard = function() --[[ Line: 811 ]]
        -- upvalues: v169 (copy), v148 (ref), v88 (ref)
        task.spawn(function() --[[ Line: 812 ]]
            -- upvalues: v169 (ref), v148 (ref), v88 (ref)
            if v169.displayNameTextFieldRef.current then
                v169.displayNameTextFieldRef.current:ReleaseFocus();
            end;
            task.defer(function() --[[ Line: 817 ]]
                -- upvalues: v169 (ref)
                if v169.usernameTextFieldRef.current then
                    v169.usernameTextFieldRef.current:CaptureFocus();
                end;
            end);
            if v148 then
                v169.props.authEventAnalytics.reportAuthButtonClick(v88.Context.SinglePageSignUpScreen, v88.Button.DisplayNameNext, v88.State.KeyboardInput);
            end;
        end);
    end;
    v169.onUsernameTextChangeCompletedFromKeyboard = function() --[[ Line: 833 ]]
        -- upvalues: v169 (copy), v88 (ref)
        spawn(function() --[[ Line: 834 ]]
            -- upvalues: v169 (ref), v88 (ref)
            if v169.usernameTextFieldRef.current then
                v169.usernameTextFieldRef.current:ReleaseFocus();
            end;
            if v169.passwordTextFieldRef.current then
                v169.passwordTextFieldRef.current:CaptureFocus();
            end;
            v169.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.UsernameNext);
        end);
    end;
    v169.onPasswordTextChangeCompletedFromKeyboard = function() --[[ Line: 849 ]]
        -- upvalues: v169 (copy), v88 (ref)
        spawn(function() --[[ Line: 850 ]]
            -- upvalues: v169 (ref), v88 (ref)
            if v169.passwordTextFieldRef.current then
                v169.passwordTextFieldRef.current:ReleaseFocus();
            end;
            v169.props.authEventAnalytics.reportButtonClicked(v88.Context.SinglePageSignUpScreen, v88.Button.PasswordNext);
        end);
    end;
    v169.cacheScrollCanvasInitialSizeIfNecessary = function() --[[ Line: 864 ]]
        -- upvalues: v169 (copy)
        if v169.cachedScrollCanvasInitialSizeY == 0 then
            local l_Parent_0 = v169.scrollingFrameRef.current.Parent;
            local l_CanvasSize_0 = v169.scrollingFrameRef.current.CanvasSize;
            local v238 = l_Parent_0 and l_Parent_0.AbsoluteSize or Vector2.new(0, 0);
            v169.cachedScrollCanvasInitialSizeY = l_CanvasSize_0.Y.Scale * v238.Y + l_CanvasSize_0.Y.Offset;
        end;
    end;
    v169.agreeToPhoneNumberVerification = function() --[[ Line: 874 ]]
        -- upvalues: v169 (copy), v132 (ref)
        local l_agreeToPhoneNumberVerification_0 = v169.props.agreeToPhoneNumberVerification;
        local l_networking_1 = v169.props.networking;
        local v241 = v169.state.phoneCountryCode.prefix .. "," .. v169.state.phoneInput .. "," .. v169.state.phoneCountryCode.code;
        l_agreeToPhoneNumberVerification_0(l_networking_1, function() --[[ Line: 883 ]]
            -- upvalues: v132 (ref), l_networking_1 (copy), v241 (copy), v169 (ref)
            v132(l_networking_1, v241):andThen(function(v242) --[[ Line: 884 ]]
                -- upvalues: v169 (ref), v241 (ref)
                local l_challenge_0 = v242.challenge;
                v169.verifyPhoneNumber(l_challenge_0, v169.state.phoneInput, v241);
            end, function(v244) --[[ Line: 887 ]]
                -- upvalues: v169 (ref)
                if v244 == "Authentication.TwoStepVerification.Response.TooManyAttempts" or v244 == "Authentication.SignUp.Response.PhoneNumberAlreadyLinked" or v244 == "Authentication.SignUp.Response.InvalidPhoneNumber" then
                    v169.props.showErrorMessageToast(v244);
                    return;
                else
                    v169.props.showErrorToast();
                    return;
                end;
            end);
        end, v169.state.phoneInput);
    end;
    v169.onSignUpClick = function() --[[ Line: 902 ]]
        -- upvalues: v169 (copy), v91 (ref)
        if v169.useVerifiedSignup() and v169.state.contactMethod == v91.PhoneNumber then
            v169.agreeToPhoneNumberVerification();
            return;
        else
            v169.onSignUpButtonActivated();
            return;
        end;
    end;
    v169.verifyPhoneNumber = function(v245, v246, v247) --[[ Line: 910 ]]
        -- upvalues: v169 (copy)
        v169.props.verifyPhoneNumber(v169.props.networking, v169.verifyPhoneNumberCallback, v245, v246, v247, v169.useEmailOptionClickedCallback);
    end;
    v169.verifyPhoneNumberCallback = function(v248) --[[ Line: 925 ]]
        -- upvalues: v169 (copy)
        v169.verifiedSignupVoucher = v248;
        v169.onSignUpButtonActivated();
    end;
    v169.useEmailOptionClickedCallback = function() --[[ Line: 930 ]]
        -- upvalues: v169 (copy), v91 (ref)
        v169:setState({
            contactMethod = v91.Email
        });
    end;
    v169.phoneCountryCodeSelectorCallback = function(v249) --[[ Line: 936 ]]
        -- upvalues: v169 (copy)
        v169:setState({
            isCountryCodeSearchVisible = v249
        });
    end;
    v169.onTextBoxFocused = function(v250) --[[ Line: 944 ]]
        -- upvalues: v169 (copy)
        v169.cacheScrollCanvasInitialSizeIfNecessary();
        local v251 = math.clamp(v169.scrollingFrameRef.current.CanvasPosition.Y, 0, v169.cachedScrollCanvasInitialSizeY);
        if v169.isMounted then
            local v252 = v250.Y - v169.scrollingFrameRef.current.absolutePosition.Y + v251;
            v169.updateScrollCanvasTargetPositionY(v252);
        end;
    end;
    v169.onTextBoxFocusLost = function() --[[ Line: 955 ]]
        -- upvalues: v169 (copy)
        if v169.isMounted then
            v169.updateScrollCanvasTargetPositionY(0);
        end;
    end;
    v169.onUsernameTextBoxFocusLost = function() --[[ Line: 961 ]]
        -- upvalues: v169 (copy)
        v169.onTextBoxFocusLost();
        v169.updateState({
            isUsernameFocused = false
        });
    end;
    v169.onAnimationStateChangeCallback = function(v253, v254) --[[ Line: 971 ]]
        -- upvalues: v169 (copy)
        if v253 == Enum.TextInputType.Password then
            v169:setState({
                isPasswordAnimating = v254
            });
            return;
        else
            v169:setState({
                isUsernameAnimating = v254
            });
            return;
        end;
    end;
    v169.onFocusedTextBoxPositionChanged = function(v255) --[[ Line: 985 ]]
        -- upvalues: v169 (copy)
        if v169.state.isUsernameAnimating or v169.state.isPasswordAnimating then
            v169.onTextBoxFocused(v255);
        end;
    end;
    v169.getScrollingFrameCanvasPosition = function(v256) --[[ Line: 994 ]]
        -- upvalues: v169 (copy)
        if v256 > 0 then
            return Vector2.new(0, v256);
        elseif v169.scrollingFrameRef and v169.scrollingFrameRef.current then
            return v169.scrollingFrameRef.current.CanvasPosition;
        else
            return Vector2.new(0, 0);
        end;
    end;
    v169.onUsernameTextBoxFocused = function(v257) --[[ Line: 1006 ]]
        -- upvalues: v169 (copy), v88 (ref)
        v169:setState({
            isUsernameFocused = true
        });
        v169.props.authEventAnalytics.reportUsernameFocus(v88.Context.SinglePageSignUpScreen);
        v169.onTextBoxFocused(v257);
    end;
    v169.onDisplayNameTextBoxFocused = function(v258) --[[ Line: 1016 ]]
        -- upvalues: v148 (ref), v169 (copy), v88 (ref)
        if v148 then
            v169.props.authEventAnalytics.reportDisplayNameFocus(v88.Context.SinglePageSignUpScreen);
        end;
        v169.onTextBoxFocused(v258);
    end;
    v169.onPasswordTextBoxFocused = function(v259) --[[ Line: 1024 ]]
        -- upvalues: v169 (copy), v88 (ref)
        v169.props.authEventAnalytics.reportPasswordFocus(v88.Context.SinglePageSignUpScreen);
        v169.onTextBoxFocused(v259);
    end;
    v169.updateIsSignUpInProgress = function(v260) --[[ Line: 1029 ]]
        -- upvalues: v169 (copy)
        spawn(function() --[[ Line: 1030 ]]
            -- upvalues: v169 (ref), v260 (copy)
            if v169.isMounted then
                v169:setState({
                    isSignUpInProgress = v260
                });
            end;
        end);
    end;
    v169.requestSignUp = function(v261, v262) --[[ Line: 1039 ]]
        -- upvalues: v169 (copy), v91 (ref), l_FFlagEnableAuthDeepLinkReceiver_0 (ref), l_PreAuthDeepLinkUrlStore_0 (ref), l_LinkingProtocol_0 (ref), v149 (ref), v112 (ref), v122 (ref), v95 (ref), v93 (ref), v60 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v89 (ref), l_AccountLinkingAlertType_0 (ref)
        local l_networking_2 = v169.props.networking;
        local l_guiService_0 = v169.props.guiService;
        local l_analytics_0 = v169.props.analytics;
        local l_appPolicy_0 = v169.props.appPolicy;
        local l_omniRecommendationsRequest_0 = v169.props.omniRecommendationsRequest;
        local l_authEventAnalytics_0 = v169.props.authEventAnalytics;
        local l_signUp_0 = v169.props.signUp;
        local l_setBackNavigationDisabled_0 = v169.props.setBackNavigationDisabled;
        local function v273(v271, v272) --[[ Line: 1050 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v169 (ref), v261 (copy)
            if v271 then
                l_setBackNavigationDisabled_0(true);
                v169.requestSignUp(v261, v272);
                return;
            else
                v169.updateIsSignUpInProgress(false);
                return;
            end;
        end;
        local v274 = v169.useVerifiedSignup() and v169.state.contactMethod == v91.PhoneNumber;
        local v275 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        local v276 = v149 and v275 ~= nil and v275 ~= "";
        local v277 = not v169.state.passkeysAvailable or v276;
        local v278 = v112();
        l_signUp_0(l_networking_2, l_omniRecommendationsRequest_0, l_guiService_0, v273, v262, l_analytics_0, l_appPolicy_0, v261, v274, v169.props.shouldUsePasskeySignup and v278 and game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not v277, v169.props.shouldAutomaticallyPromptForPasskey, v122() and v169.state.isCredentialsProtocolRegisterPasswordAvailable, l_authEventAnalytics_0, v169.props.isIosAuthServiceEnabled):andThen(function() --[[ Line: 1104 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy)
            l_setBackNavigationDisabled_0(false);
        end, function(v279) --[[ Line: 1108 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v274 (copy), v95 (ref), v169 (ref), v93 (ref), v60 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v89 (ref), l_AccountLinkingAlertType_0 (ref)
            l_setBackNavigationDisabled_0(false);
            if v274 then
                if v279 ~= v95.Captcha then
                    v169.updateIsSignUpInProgress(false);
                    v169:setState({
                        signUpError = true
                    });
                end;
            else
                if v279 ~= v93.Captcha then
                    v169.updateIsSignUpInProgress(false);
                    v169:setState({
                        signUpError = true
                    });
                end;
                if v279 == v93.VNGAgeUnder12 then
                    v169:setState({
                        shouldShowUnderAgeAlert = true
                    });
                end;
                if v60 == true and v279 == v93.EmptyAccountSwitchBlobRequired then
                    v169.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.LogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v169.logoutAllLoggedInUsersCallback, v169.props.closeCentralOverlay, v89.Auth.AccountSwitcherSignupEmptyBlobRequiredError, v169.state.username);
                    v169:setState({
                        signUpError = false
                    });
                end;
                if v60 == true and v279 == v93.ParentEmptyAccountSwitchBlobRequired then
                    v169.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v169.logoutAllLoggedInUsersCallback, v169.props.closeCentralOverlay, v89.Auth.AccountSwitcherParentSignupEmptyBlobRequiredError, v169.state.username);
                    v169:setState({
                        signUpError = false
                    });
                end;
            end;
            if v279 == v93.AccountLinkingRequired then
                v169.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInAlreadyLinked);
                return;
            else
                if v279 == v93.AccountLinkingFailed then
                    v169.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInGenericError);
                end;
                return;
            end;
        end);
    end;
    v169.onSignUpButtonActivated = function() --[[ Line: 1194 ]]
        -- upvalues: v169 (copy), v88 (ref), v115 (ref), l_FFlagEnableAuthDeepLinkReceiver_0 (ref), l_PreAuthDeepLinkUrlStore_0 (ref), l_LinkingProtocol_0 (ref), v116 (ref), v57 (ref), l_HttpService_0 (ref), v118 (ref), l_ExperienceService_0 (ref), v147 (ref), v137 (ref), v22 (ref), v142 (ref), v91 (ref), l_UserAgreementsCounterNames_0 (ref), v120 (ref)
        local l_setBackNavigationDisabled_1 = v169.props.setBackNavigationDisabled;
        local l_birthday_1 = v169.state.birthday;
        local l_username_1 = v169.state.username;
        local l_password_1 = v169.state.password;
        local l_gender_0 = v169.state.gender;
        local v285 = v169.getIsSignUpButtonEnabled();
        local l_locale_0 = v169.locale;
        local l_emailInput_0 = v169.state.emailInput;
        local _ = function(v288) --[[ Line: 1205 ]]
            local v289 = {};
            for _, v291 in ipairs(v288) do
                table.insert(v289, v291.id);
            end;
            return v289;
        end;
        if v285 then
            v169.props.authEventAnalytics.reportSignUpButtonClicked(v88.Context.SinglePageSignUpScreen);
            if v169.getShouldBlockVNGU12SignUpOnClientSide() then
                local v293 = v169.getUserAge();
                if v293 == nil or v293 < 12 then
                    v169:setState({
                        shouldShowUnderAgeAlert = true
                    });
                    return;
                end;
            end;
            if v115() then
                local v294 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
                local v295 = "";
                do
                    local l_v295_0 = v295;
                    if v116() and v294 and string.find(v294, "share") then
                        local v297, v298, v299 = v294:match("code=(.-)&type=(.-)&stamp=(.*)");
                        if not v299 then
                            local v300, v301 = v294:match("code=(.-)&type=(.*)");
                            v297 = v300;
                            v298 = v301;
                        end;
                        if v297 and v298 then
                            v57(v169.props.networking, v297, v298):andThen(function(v302) --[[ Line: 1245 ]]
                                -- upvalues: l_v295_0 (ref), l_HttpService_0 (ref)
                                if v302 and v302 ~= nil then
                                    l_v295_0 = l_HttpService_0:JSONEncode(v302);
                                end;
                            end, function(_) --[[ Line: 1249 ]]
                                warn("Error fetching share link metadata: ", error);
                            end):await();
                        end;
                    elseif v118() then
                        local l_l_ExperienceService_0_PendingJoinAttempt_0 = l_ExperienceService_0:GetPendingJoinAttempt();
                        if l_l_ExperienceService_0_PendingJoinAttempt_0 and l_l_ExperienceService_0_PendingJoinAttempt_0 ~= nil then
                            l_v295_0 = l_HttpService_0:JSONEncode(l_l_ExperienceService_0_PendingJoinAttempt_0);
                        end;
                    end;
                    v169.props.authEventAnalytics.reportAuthButtonClick(v88.Context.SinglePageSignUpScreen, v88.Button.SignUp, l_v295_0, v294, v169.isAltAttempt);
                end;
            end;
            if v147 and v169.props.shouldSeeDisplayNamesOnSignup then
                if v169.state.recommendedUsername == l_username_1 then
                    v137(v22.SignUpWithRecommendedUsernames, 1);
                elseif v169.state.hasEditedUsername then
                    v137(v22.SignUpWithEditedUsernames, 1);
                end;
                if v169.state.bypassDisplayNameField then
                    v137(v22.SignupBypassingDisplayNames, 1);
                end;
            end;
            v169.updateIsSignUpInProgress(true);
            l_setBackNavigationDisabled_1(true);
            v169:setState({
                signUpError = false
            });
            local v305 = {
                birthday = l_birthday_1 and l_birthday_1:FormatForEndpoint() or "", 
                username = l_username_1, 
                password = l_password_1, 
                displayName = if v142 and v169.isDisplayNameFieldRequired() then v169.state.displayName else nil, 
                gender = l_gender_0, 
                locale = l_locale_0, 
                capturedAuditContent = v169.props.capturedAuditContent, 
                additionalAuditContent = v169.props.additionalAuditContent
            };
            local v306 = v169.useVerifiedSignup();
            if v306 and v169.state.contactMethod == v91.Email then
                v305.email = l_emailInput_0;
            elseif v306 and v169.state.contactMethod == v91.PhoneNumber then
                v305.verifiedSignupVoucher = v169.verifiedSignupVoucher;
            end;
            if v169.props.appPolicy.getAddUserAgreementIdsToSignupRequest() then
                local l_agreements_0 = v169.state.agreements;
                if #l_agreements_0 > 0 then
                    local v308 = {};
                    for _, v310 in ipairs(l_agreements_0) do
                        table.insert(v308, v310.id);
                    end;
                    v305.agreementIds = v308;
                else
                    v137(l_UserAgreementsCounterNames_0.AgreementsIdsEmptyOnSignup, 1);
                end;
            end;
            if v169.getShouldShowVNGAgreements() then
                v169.props.showVNGUserAgreementsPopup(v169.state.agreements, function(v311) --[[ Line: 1320 ]]
                    -- upvalues: v305 (copy), v169 (ref)
                    local l_v305_0 = v305;
                    local v313 = {};
                    for _, v315 in ipairs(v311) do
                        table.insert(v313, v315.id);
                    end;
                    l_v305_0.agreementIds = v313;
                    v169.requestSignUp(v305);
                end, function() --[[ Line: 1323 ]]
                    -- upvalues: v169 (ref), l_setBackNavigationDisabled_1 (copy)
                    v169.updateIsSignUpInProgress(false);
                    l_setBackNavigationDisabled_1(false);
                end);
                return;
            elseif v169.getShouldShowKISAAgreements() then
                local v316 = v169.getUserAge();
                if v316 and v316 < v120 then
                    v169.launchParentSignUpOtp(v305);
                    return;
                else
                    v169.launchKISATermsOfService(v305, false);
                    return;
                end;
            else
                v169.requestSignUp(v305);
            end;
        end;
    end;
    v169.onGenderChanged = function(v317) --[[ Line: 1342 ]]
        -- upvalues: v169 (copy)
        if v169.isMounted then
            v169.updateState({
                gender = v317
            });
        end;
    end;
    v169.validUsernameEntered = function(_) --[[ Line: 1350 ]]
        -- upvalues: v169 (copy), v94 (ref)
        local v319 = false;
        if v169.state.username ~= "" then
            v319 = v169.state.usernameValid ~= v94.Invalid;
        end;
        return v319;
    end;
    v169.validPasswordEntered = function() --[[ Line: 1354 ]]
        -- upvalues: v169 (copy), v94 (ref)
        local v320 = false;
        if v169.state.password ~= "" then
            v320 = v169.state.passwordValid ~= v94.Invalid;
        end;
        return v320;
    end;
    v169.useVerifiedSignup = function() --[[ Line: 1358 ]]
        -- upvalues: v169 (copy), l_GuiService_0 (ref)
        return game:GetFastFlag("LuaVerifiedSignup2") or game:GetFastFlag("LuaVerifiedSignupExperiment2") and v169.props.useVerifiedSignupPage and not l_GuiService_0:IsTenFootInterface();
    end;
    v169.useUsernameSuggestions = function() --[[ Line: 1365 ]]
        -- upvalues: v169 (copy)
        return v169.props.shouldUseUsernameSuggestions;
    end;
    v169.useRefreshButton = function() --[[ Line: 1369 ]]
        -- upvalues: v125 (ref), v169 (copy)
        return v125() and v169.props.enableRefreshButton;
    end;
    v169.getBirthdayVariant = function() --[[ Line: 1373 ]]
        -- upvalues: v169 (copy), v141 (ref)
        if v169.getShouldUseAgeInput() then
            return 1;
        elseif v141() and v169.props.birthdayPickerVariant ~= nil then
            return v169.props.birthdayPickerVariant;
        else
            return 0;
        end;
    end;
    v169.SetContactMethod = function(v321) --[[ Line: 1383 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            contactMethod = v321
        });
    end;
    v169.SetPhoneNumber = function(v322, v323, v324) --[[ Line: 1389 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            phoneCountryCode = v322, 
            phoneInput = v323, 
            phoneValid = v324
        });
    end;
    v169.SetEmail = function(v325, v326) --[[ Line: 1397 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            emailInput = v325, 
            emailValid = v326
        });
    end;
    v169.updatePillClicked = function() --[[ Line: 1405 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            pillClicked = true
        });
    end;
    v169.resetPillClicked = function() --[[ Line: 1411 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            pillClicked = false
        });
    end;
    v169.updateIssueCondition = function(v327) --[[ Line: 1417 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            issueCondition = v327
        });
    end;
    v169.updateSuggestionControlState = function(_, v329) --[[ Line: 1423 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            suggestionControlState = v329
        });
    end;
    v169.loadSuggestions = function() --[[ Line: 1429 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            loadingSuggestions = true
        });
    end;
    v169.finishSuggestions = function() --[[ Line: 1433 ]]
        -- upvalues: v169 (copy)
        v169.updateState({
            loadingSuggestions = false
        });
    end;
    v169.onSignUpContentFrameCanvasSizeChange = function(_) --[[ Line: 1437 ]]
        -- upvalues: v169 (copy)
        local v331 = v169.scrollCanvasTargetPositionY:getValue();
        v169.scrollingFrameRef.current.CanvasPosition = v169.getScrollingFrameCanvasPosition(v331);
    end;
    v169.getUserAge = function() --[[ Line: 1442 ]]
        -- upvalues: v169 (copy)
        if v169.state.birthday then
            return v169.state.birthday:GetAgeInYears();
        else
            return nil;
        end;
    end;
    v169.getUsernamePlaceholder = function(v332) --[[ Line: 1450 ]]
        -- upvalues: v169 (copy), v146 (ref)
        if v169.props.shouldSeeDisplayNamesOnSignup then
            if not v169.state.birthday then
                return "";
            elseif v169.getUserAge() >= v146 and not v169.state.hasSetIneligibleAgeAtLeastOnce then
                return v332.agedUpUsernamePlaceholder;
            else
                return v332.usernamePlaceholder;
            end;
        else
            return v332.usernamePlaceholder;
        end;
    end;
    v169.shouldShowUsernameField = function() --[[ Line: 1474 ]]
        -- upvalues: v169 (copy), v146 (ref)
        if v169.props.shouldSeeDisplayNamesOnSignup then
            if not v169.state.birthday or v169.getUserAge() < v146 or v169.state.hasSetIneligibleAgeAtLeastOnce then
                return true;
            else
                return v169.state.recommendedUsername ~= nil;
            end;
        else
            return true;
        end;
    end;
    v169.shouldShowDisplayNameField = function() --[[ Line: 1490 ]]
        -- upvalues: v169 (copy), v146 (ref)
        return v169.props.shouldSeeDisplayNamesOnSignup and v169.state.birthday and v169.getUserAge() >= v146 and not v169.state.hasSetIneligibleAgeAtLeastOnce;
    end;
    v169.isDisplayNameFieldRequired = function() --[[ Line: 1497 ]]
        -- upvalues: v169 (copy)
        return v169.shouldShowDisplayNameField() and not v169.state.bypassDisplayNameField;
    end;
    v169.isValidDisplayNameEntered = function() --[[ Line: 1501 ]]
        -- upvalues: v169 (copy), v94 (ref)
        local v333 = false;
        if v169.state.displayName ~= "" then
            v333 = v169.state.displayNameValid ~= v94.Invalid;
        end;
        return v333;
    end;
    v169.setUsernameRecommendation = function(v334) --[[ Line: 1505 ]]
        -- upvalues: v169 (copy)
        v169:setState(function(v335) --[[ Line: 1506 ]]
            -- upvalues: v334 (copy)
            return {
                recommendedUsername = if v335.recommendedUsername ~= nil and v334 == "" then nil else v334
            };
        end);
    end;
    v169.getUsernameGuidanceText = function(v336) --[[ Line: 1516 ]]
        -- upvalues: v169 (copy)
        if v169.shouldShowDisplayNameField() and v169.state.recommendedUsername ~= "" and v169.state.recommendedUsername ~= nil and not v169.state.hasEditedUsername and not v169.state.isUsernameFocused then
            return v336.autogeneratedUsernameGuidance;
        else
            return nil;
        end;
    end;
    v169.validateOtpCode = function(v337, v338, v339) --[[ Line: 1528 ]]
        -- upvalues: v169 (copy), l_Constants_1 (ref), l_ValidateCode_0 (ref), v80 (ref)
        v169.state.otpSessionToken = v337;
        v169.state.otpCode = v338;
        local l_networking_3 = v169.props.networking;
        local v341 = {
            origin = l_Constants_1.otpServiceOriginSignup, 
            contactType = l_Constants_1.otpServiceContactType, 
            passCode = v169.state.otpCode, 
            otpSessionToken = v169.state.otpSessionToken
        };
        local v342 = {
            otpSessionToken = tostring(v169.state.otpSessionToken), 
            otpContactType = l_Constants_1.otpServiceContactType
        };
        return l_ValidateCode_0(l_networking_3, v341)():andThen(function(_) --[[ Line: 1548 ]]
            -- upvalues: v169 (ref), v339 (copy), v342 (copy)
            v169.props.closeCentralOverlay();
            v339.otpSession = v342;
            v169.launchKISATermsOfService(v339, true);
        end):catch(function(v344) --[[ Line: 1553 ]]
            -- upvalues: v80 (ref)
            return v80.reject(v344);
        end);
    end;
    v169.onAbandonKISASignUpFlow = function() --[[ Line: 1558 ]]
        -- upvalues: l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), v169 (copy)
        l_AnalyticsEvents_0.sendButtonClickEvent(l_EventConstants_0.ctx.kisaAgreements, l_EventConstants_0.origin.signup, l_EventConstants_0.btn.cancel);
        v169.updateIsSignUpInProgress(false);
    end;
    v169.launchParentSignUpOtp = function(v345) --[[ Line: 1568 ]]
        -- upvalues: l_Constants_1 (ref), v169 (copy)
        local v348 = {
            origin = l_Constants_1.otpServiceOriginSignup, 
            codeLength = 6, 
            enterEmailTitleKey = l_Constants_1.translationKeys.parentEmailTitleKey, 
            enterEmailDescriptionKey = l_Constants_1.translationKeys.sendParentVerificationCodeKey, 
            enterCodeTitleKey = l_Constants_1.translationKeys.oneTimeCodeTitleKey, 
            enterCodeDescriptionKey = l_Constants_1.translationKeys.oneTimeCodeHelpDescriptionKey, 
            complianceCheckboxMessageKey = l_Constants_1.translationKeys.parentalConsentModalDescriptionKey, 
            onSubmitCode = function(v346, v347) --[[ Line: 1579 ]] --[[ Name: onSubmitCode ]]
                -- upvalues: v169 (ref), v345 (copy)
                return v169.validateOtpCode(v346, v347, v345);
            end, 
            onModalAbandoned = v169.onAbandonKISASignUpFlow, 
            screenSize = v169.props.screenSize
        };
        v169.props.openEmailOtp(v348);
    end;
    if not v143 then
        l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v349) --[[ Line: 1592 ]]
            -- upvalues: v169 (copy), v88 (ref)
            local v350 = v349.isAvailable or false;
            local v351 = false;
            if v349.password and v349.password.isAvailable then
                v351 = true;
            end;
            if v169.isMounted then
                v169:setState({
                    passkeysAvailable = v350, 
                    isCredentialsProtocolRegisterPasswordAvailable = v351
                });
            end;
            v169.props.authEventAnalytics.reportAuthPageload(v88.Context.PasskeySignup, (tostring(v350)));
            v169.props.authEventAnalytics.reportAuthPageload(v88.Context.CMPasswordSignup, (tostring(v351)));
        end):catch(function(v352) --[[ Line: 1618 ]]
            warn("Error checking for available credential types. Error: ", v352);
        end);
    end;
    v169.isMounted = false;
end;
v168.didMount = function(v353) --[[ Line: 1626 ]] --[[ Name: didMount ]]
    -- upvalues: v143 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), v88 (copy), v159 (copy), v60 (copy), l_MemStorageService_0 (copy), v63 (copy), l_UserInputService_0 (copy), v137 (copy), l_UserAgreementsCounterNames_0 (copy), v136 (copy), l_TelemetryConfigs_0 (copy), v114 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v119 (copy), v58 (copy)
    v353.isMounted = true;
    v353.isAltAttempt = nil;
    if v143 then
        l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v354) --[[ Line: 1633 ]]
            -- upvalues: v353 (copy), v88 (ref)
            local v355 = v354.isAvailable or false;
            local v356 = false;
            if v354.password and v354.password.isAvailable then
                v356 = true;
            end;
            if v353.isMounted then
                v353:setState({
                    passkeysAvailable = v355, 
                    isCredentialsProtocolRegisterPasswordAvailable = v356
                });
            end;
            v353.props.authEventAnalytics.reportAuthPageload(v88.Context.PasskeySignup, (tostring(v355)));
            v353.props.authEventAnalytics.reportAuthPageload(v88.Context.CMPasswordSignup, (tostring(v356)));
        end):catch(function(v357) --[[ Line: 1659 ]]
            warn("Error checking for available credential types. Error: ", v357);
        end);
    end;
    if not v159 and v60 == true and v353.isAlreadyAuthenticated == true then
        l_MemStorageService_0:Fire(v63.ThemeUpdate, "dark");
    end;
    v353.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 1676 ]]
        -- upvalues: l_UserInputService_0 (ref), v353 (copy)
        local v358 = l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        v353:setState({
            onScreenKeyboardHeight = v358
        });
    end);
    local v359 = v353.props.appPolicy.getAddUserAgreementIdsToSignupRequest();
    local v360 = v353.getShouldShowVNGAgreements();
    local v361 = v353.getShouldShowKISAAgreements();
    if v359 or v360 or v361 then
        local function v363(v362) --[[ Line: 1689 ]]
            -- upvalues: v137 (ref), l_UserAgreementsCounterNames_0 (ref), v353 (copy)
            if not v362 then
                v137(l_UserAgreementsCounterNames_0.FetchAgreementsHttpRequestFailureOnSignup, 1);
                return;
            elseif #v362 > 0 then
                v353.updateState({
                    agreements = v362
                });
                return;
            else
                v137(l_UserAgreementsCounterNames_0.FetchAgreementsEmptyResponseOnSignup, 1);
                return;
            end;
        end;
        v136(v353.props.networking, v353.props.analytics):andThen(v363, function() --[[ Line: 1706 ]]

        end);
    end;
    v353.props.authEventAnalytics.reportScreenLoaded(v88.Context.SinglePageSignUpScreen);
    v353.props.loggingProtocol:logEventOnce("signup_page_did_mount");
    v353.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SignupPageMountTelemetryConfig, 1, {
        version = 1
    });
    if v114() then
        local v364 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        if v119() then
            v58(v353.props.networking):andThen(function(v365) --[[ Line: 1724 ]]
                -- upvalues: v353 (copy), v88 (ref), v364 (copy)
                if v365 and v365.IsAltBrowserTracker ~= nil then
                    v353.isAltAttempt = v365.IsAltBrowserTracker;
                    v353.props.authEventAnalytics.reportAuthPageload(v88.Context.SinglePageSignUpScreen, v364, v353.isAltAttempt);
                end;
            end, function(_) --[[ Line: 1733 ]]
                -- upvalues: v353 (copy), v88 (ref), v364 (copy)
                warn("Error auth metadata: ", error);
                v353.props.authEventAnalytics.reportAuthPageload(v88.Context.SinglePageSignUpScreen, v364, v353.isAltAttempt);
            end);
        else
            v353.props.authEventAnalytics.reportAuthPageload(v88.Context.SinglePageSignUpScreen, v364, v353.isAltAttempt);
        end;
    end;
    if v353.props.focusedGuiObject and v353.backButtonRef and v353.backButtonRef.current then
        v353.props.focusGuiObject(v353.backButtonRef.current);
    end;
end;
v168.willUnmount = function(v367) --[[ Line: 1755 ]] --[[ Name: willUnmount ]]
    -- upvalues: v60 (copy)
    v367.isMounted = false;
    v367.isAltAttempt = nil;
    if v60 == true and v367.isAlreadyAuthenticated == true then
        v367.resetDefaultTheme();
    end;
    if v367.keyboardVisibleChanged then
        v367.keyboardVisibleChanged:disconnect();
        v367.keyboardVisibleChanged = nil;
    end;
end;
v168.didUpdate = function(v368, _, v370) --[[ Line: 1769 ]] --[[ Name: didUpdate ]]
    -- upvalues: v142 (copy), v146 (copy), v147 (copy), v137 (copy), v22 (copy)
    if v368.props.focusedGuiObject and v368.props.birthdayContainerRef.current and v368.props.focusedGuiObject:IsDescendantOf(v368.props.birthdayContainerRef.current) then
        v368.updateScrollCanvasTargetPositionY(10);
    else
        v368.updateScrollCanvasTargetPositionY(0);
    end;
    if v142 and v368.state.birthday ~= nil and not v368.state.hasSetIneligibleAgeAtLeastOnce and v368.getUserAge() < v146 then
        v368:setState({
            hasSetIneligibleAgeAtLeastOnce = true
        });
    end;
    if v147 and v368.props.shouldSeeDisplayNamesOnSignup then
        if v368.state.recommendedUsername ~= "" and v368.state.hasEditedUsername and v368.state.hasEditedUsername ~= v370.hasEditedUsername then
            v137(v22.ReccomendedNameEdited, 1);
        end;
        if v368.state.recommendedUsername ~= nil and v368.state.recommendedUsername ~= "" and v368.state.hasEditedUsername == true and v368.state.username == "" and v370.username ~= "" and v368.props.shouldSeeDisplayNamesOnSignup then
            v137(v22.ReccomendedNameManuallyCleared, 1);
        end;
        if v368.state.birthday ~= nil and v370.birthday ~= nil and v368.state.birthday ~= v370.birthday then
            if v368.getUserAge() >= v146 and v370.birthday:GetAgeInYears() < v146 then
                v137(v22.BirthdayChangedToAboveDisplayAge, 1);
            end;
            if v368.getUserAge() < v146 and v370.birthday:GetAgeInYears() >= v146 then
                v137(v22.BirthdayChangedToAboveDisplayAge, 1);
            end;
        end;
    end;
end;
v168.render = function(v371) --[[ Line: 1831 ]] --[[ Name: render ]]
    -- upvalues: v159 (copy), v60 (copy), v7 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy), v167 (copy)
    if v159 and v60 and v371.isAlreadyAuthenticated then
        return v7.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            Child = if v167() then v371:renderWithView() else v371:renderDeprecated()
        });
    elseif v167() then
        return v371:renderWithView();
    else
        return v371:renderDeprecated();
    end;
end;
v168.renderWithView = function(v372) --[[ Line: 1850 ]] --[[ Name: renderWithView ]]
    -- upvalues: v30 (copy), l_RobloxLocaleIdKey_0 (copy), v7 (copy), v139 (copy), v55 (copy), v56 (copy)
    local v373 = v372.getIsSignUpButtonEnabled();
    return v30({})(function(v374) --[[ Line: 1853 ]]
        -- upvalues: v372 (copy), l_RobloxLocaleIdKey_0 (ref), v7 (ref), v139 (ref), v373 (copy), v55 (ref), v56 (ref)
        v372.locale = v374[l_RobloxLocaleIdKey_0];
        return v7.createElement(v139, {
            navigateBack = v372.props.navigateBack, 
            useVerifiedSignup = v372.useVerifiedSignup, 
            useUsernameSuggestions = v372.useUsernameSuggestions, 
            useRefreshButton = v372.useRefreshButton, 
            onGenderChanged = v372.onGenderChanged, 
            getHidePassword = v372.getHidePassword, 
            passwordVisibilityToggleCallback = v372.passwordVisibilityToggleCallback, 
            onBirthdaySelected = v372.onBirthdaySelected, 
            onBirthdayFocused = v372.onBirthdayFocused, 
            onSignUpClick = v372.onSignUpClick, 
            usernameSuggestionClicked = v372.usernameSuggestionClicked, 
            usernameSuggestionsShown = v372.usernameSuggestionsShown, 
            shouldSuggest = v372.shouldSuggest, 
            updateIssueCondition = v372.updateIssueCondition, 
            updateSuggestionControlState = v372.updateSuggestionControlState, 
            logRefreshButtonClicked = v372.logRefreshButtonClicked, 
            loadSuggestions = v372.loadSuggestions, 
            finishSuggestions = v372.finishSuggestions, 
            validUsernameEntered = v372.validUsernameEntered, 
            validPasswordEntered = v372.validPasswordEntered, 
            onUsernameTextBoxFocused = v372.onUsernameTextBoxFocused, 
            onPasswordTextBoxFocused = v372.onPasswordTextBoxFocused, 
            onUsernameTextChanged = v372.onUsernameTextChanged, 
            onUsernameTextValidated = v372.onUsernameTextValidated, 
            onPasswordTextChanged = v372.onPasswordTextChanged, 
            onTextBoxFocusLost = v372.onTextBoxFocusLost, 
            onFocusedTextBoxPositionChanged = v372.onFocusedTextBoxPositionChanged, 
            onAnimationStateChangeCallback = v372.onAnimationStateChangeCallback, 
            onUsernameTextChangeCompletedFromKeyboard = v372.onUsernameTextChangeCompletedFromKeyboard, 
            onPasswordTextChangeCompletedFromKeyboard = v372.onPasswordTextChangeCompletedFromKeyboard, 
            phoneCountryCodeSelectorCallback = v372.phoneCountryCodeSelectorCallback, 
            SetContactMethod = v372.SetContactMethod, 
            SetPhoneNumber = v372.SetPhoneNumber, 
            SetEmail = v372.SetEmail, 
            isUsernameAnimating = v372.state.isUsernameAnimating, 
            isPasswordAnimating = v372.state.isPasswordAnimating, 
            birthday = v372.state.birthday, 
            username = v372.state.username, 
            isSignUpInProgress = v372.state.isSignUpInProgress, 
            onScreenKeyboardHeight = v372.state.onScreenKeyboardHeight, 
            usernameValid = v372.state.usernameValid, 
            passwordValid = v372.state.passwordValid, 
            issueCondition = v372.state.issueCondition, 
            loadingSuggestions = v372.state.loadingSuggestions, 
            isSignUpButtonEnabled = v373, 
            birthdayFocused = v372.state.birthdayFocused, 
            isCountryCodeSearchVisible = v372.state.isCountryCodeSearchVisible, 
            contactMethod = v372.state.contactMethod, 
            signUpError = v372.state.signUpError, 
            UsernameValidator = v55, 
            PasswordValidator = v56, 
            signUpContentFrameRef = v372.scrollingFrameRef, 
            ageTextFieldRef = v372.ageTextFieldRef, 
            usernameTextFieldRef = v372.usernameTextFieldRef, 
            passwordTextFieldRef = v372.passwordTextFieldRef, 
            passwordFrameRef = v372.passwordFrameRef, 
            onSignUpContentFrameCanvasSizeChange = v372.onSignUpContentFrameCanvasSizeChange, 
            scrollCanvasTargetPositionY = v372.scrollCanvasTargetPositionY, 
            updateScrollCanvasTargetPositionY = v372.updateScrollCanvasTargetPositionY, 
            getScrollingFrameCanvasPosition = v372.getScrollingFrameCanvasPosition
        });
    end);
end;
v168.renderDeprecated = function(v375) --[[ Line: 1939 ]] --[[ Name: renderDeprecated ]]
    -- upvalues: l_FormFactor_0 (copy), l_GetFFlagEnableTextFieldContentType_0 (copy), l_FFlagFoundationStylingOnSignUp_0 (copy), v142 (copy), l_DisclaimerLinksVariant_0 (copy), v110 (copy), v111 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v149 (copy), v112 (copy), v144 (copy), v165 (copy), l_withStyle_0 (copy), v30 (copy), l_RobloxLocaleIdKey_0 (copy), v7 (copy), v37 (copy), l_BackgroundFill_0 (copy), v34 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v166 (copy), l_ImageSetButton_0 (copy), v164 (copy), l_Text_0 (copy), v36 (copy), v35 (copy), v38 (copy), v159 (copy), v60 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), v45 (copy), v94 (copy), v44 (copy), l_DateHelper_0 (copy), v8 (copy), v140 (copy), v40 (copy), v55 (copy), v87 (copy), v126 (copy), v127 (copy), l_game_EngineFeature_0 (copy), v56 (copy), v117 (copy), v41 (copy), v102 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_View_0 (copy), l_Checkbox_0 (copy), v88 (copy), l_InputSize_0 (copy), v42 (copy), v43 (copy)
    local l_birthday_2 = v375.state.birthday;
    local l_username_2 = v375.state.username;
    local v378 = v375.getIsSignUpButtonEnabled();
    local l_isSignUpInProgress_0 = v375.state.isSignUpInProgress;
    local l_gender_1 = v375.state.gender;
    local v381 = v375.props.formFactor == l_FormFactor_0.WIDE;
    local l_isCompactView_0 = v375.props.isCompactView;
    local v383 = 0;
    local v384 = 0;
    local v385 = v375.state.onScreenKeyboardHeight > 0;
    local l_contactMethod_0 = v375.state.contactMethod;
    local l_foundationTokens_0 = v375.props.foundationTokens;
    local l_shouldUseFoundationBackgroundColor_0 = v375.props.shouldUseFoundationBackgroundColor;
    local v389 = l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions;
    local v390 = not v375.validUsernameEntered();
    local v391 = v375.useVerifiedSignup();
    local v392 = v381 and v391 and 12 or 0;
    local v393 = "Authentication.SignUp.Label.ErrorsWithUsername";
    local v394 = "Authentication.SignUp.Label.ErrorsWithPassword";
    local v395 = v375.useUsernameSuggestions();
    local v396 = v375.useRefreshButton();
    local v397 = l_FFlagFoundationStylingOnSignUp_0 and l_isCompactView_0;
    if not l_birthday_2 then
        v393 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst";
        v394 = v393;
        v390 = true;
    elseif v142 and v375.isDisplayNameFieldRequired() and not v375.isValidDisplayNameEntered() then
        v390 = true;
        v394 = "Authentication.SignUp.Response.AgedUpDisplayNameSetFirst";
    elseif v390 then
        v394 = "Authentication.SignUp.Response.UsernameMustBeSetFirst";
    end;
    if v381 then
        if v385 then
            v383 = v375.state.onScreenKeyboardHeight + 10;
        else
            v383 = 48;
            v384 = 24;
        end;
    end;
    local v398 = nil;
    if v397 then
        v398 = l_DisclaimerLinksVariant_0.Default;
    end;
    local v399 = v110();
    local v400 = v375.props.shouldUseMinimalSignup and v399;
    local v401 = v375.props.shouldHideGenderOption and v399;
    local v402 = v375.props.shouldAutofocusOnBirthday and v399;
    local v403 = v111();
    local v404 = v375.props.shouldUsePasswordlessSignup and v403;
    local v405 = v375.getShouldShowVNGAgreements();
    local v406 = v375.getShouldShowKISAAgreements();
    local v407 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
    local v408 = v149 and v407 ~= nil and v407 ~= "";
    local v409 = not v375.state.passkeysAvailable or v408;
    if v112() and v375.props.shouldUsePasskeySignup and v409 then
        v404 = false;
    end;
    local v410 = v144 and v375.props.shouldDisableUsernameAutofill;
    local v411 = v112();
    local v412 = v375.props.shouldUsePasskeySignup and v411 and game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not v409;
    local l_v165_0 = v165;
    local function _(v414) --[[ Line: 2037 ]] --[[ Name: getVerificationLinkingText ]]
        -- upvalues: v375 (copy)
        local v415 = nil;
        local v416 = v375.props.appPolicy.getPlatformAccountName();
        if v416 and v375.props.appPolicy.getUseSingleSignOn() then
            v415 = {
                "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"; 
                platform = v416, 
                ctaButton = v414
            };
        end;
        return v415;
    end;
    return l_withStyle_0(function(v418) --[[ Line: 2050 ]]
        -- upvalues: v30 (ref), v142 (ref), v375 (copy), l_RobloxLocaleIdKey_0 (ref), v400 (copy), v381 (copy), v397 (copy), l_foundationTokens_0 (copy), v412 (copy), v7 (ref), v37 (ref), l_shouldUseFoundationBackgroundColor_0 (copy), l_BackgroundFill_0 (ref), l_isSignUpInProgress_0 (copy), v34 (ref), l_ImageSetLabel_0 (ref), v383 (ref), v384 (ref), l_GetImageData_0 (ref), v166 (ref), l_ImageSetButton_0 (ref), v164 (ref), l_v165_0 (copy), l_Text_0 (ref), v36 (ref), v35 (ref), v392 (copy), v38 (ref), v391 (copy), v402 (copy), v159 (ref), v60 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v45 (ref), v94 (ref), v44 (ref), l_birthday_2 (copy), l_DateHelper_0 (ref), l_contactMethod_0 (copy), v8 (ref), v140 (ref), v40 (ref), v393 (ref), v410 (copy), v389 (copy), v395 (copy), v55 (ref), v87 (ref), v126 (ref), v127 (ref), v396 (copy), v404 (ref), v394 (ref), v390 (ref), l_game_EngineFeature_0 (ref), v56 (ref), l_username_2 (copy), v401 (copy), v117 (ref), v41 (ref), l_gender_1 (copy), v102 (ref), v378 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_View_0 (ref), l_Checkbox_0 (ref), v88 (ref), l_InputSize_0 (ref), v405 (copy), v406 (copy), v42 (ref), v43 (ref), l_FFlagFoundationStylingOnSignUp_0 (ref), v398 (ref), v385 (copy)
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
        })(function(v419) --[[ Line: 2064 ]]
            -- upvalues: v375 (ref), l_RobloxLocaleIdKey_0 (ref), v400 (ref), v381 (ref), v397 (ref), l_foundationTokens_0 (ref), v142 (ref), v412 (ref), v7 (ref), v37 (ref), l_shouldUseFoundationBackgroundColor_0 (ref), v418 (copy), l_BackgroundFill_0 (ref), l_isSignUpInProgress_0 (ref), v34 (ref), l_ImageSetLabel_0 (ref), v383 (ref), v384 (ref), l_GetImageData_0 (ref), v166 (ref), l_ImageSetButton_0 (ref), v164 (ref), l_v165_0 (ref), l_Text_0 (ref), v36 (ref), v35 (ref), v392 (ref), v38 (ref), v391 (ref), v402 (ref), v159 (ref), v60 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v45 (ref), v94 (ref), v44 (ref), l_birthday_2 (ref), l_DateHelper_0 (ref), l_contactMethod_0 (ref), v8 (ref), v140 (ref), v40 (ref), v393 (ref), v410 (ref), v389 (ref), v395 (ref), v55 (ref), v87 (ref), v126 (ref), v127 (ref), v396 (ref), v404 (ref), v394 (ref), v390 (ref), l_game_EngineFeature_0 (ref), v56 (ref), l_username_2 (ref), v401 (ref), v117 (ref), v41 (ref), l_gender_1 (ref), v102 (ref), v378 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_View_0 (ref), l_Checkbox_0 (ref), v88 (ref), l_InputSize_0 (ref), v405 (ref), v406 (ref), v42 (ref), v43 (ref), l_FFlagFoundationStylingOnSignUp_0 (ref), v398 (ref), v385 (ref)
            v375.locale = v419[l_RobloxLocaleIdKey_0];
            local v420 = not v400;
            local v421 = v381 and 25 or 48;
            local v422 = UDim2.new(0.5, 0, 0, 49);
            if v397 then
                v421 = v421 + l_foundationTokens_0.Padding.Medium;
                v422 = UDim2.new(0.5, 0, 0, 1 + l_foundationTokens_0.Padding.Medium);
            end;
            if v142 then
                v420 = v375.shouldShowUsernameField() and not v400;
            end;
            local v423 = not v375.getSignupCheckboxDisabled() and v375.props.shouldRequireSignupCheckbox;
            local v424 = "Authentication.SignUp.Description.VerificationPage.CreateAccount";
            if v412 then
                v424 = "Authentication.SignUp.Description.VerificationPageMultiStep";
            else
                local l_signUpText_0 = v419.signUpText;
                local v426 = nil;
                local v427 = v375.props.appPolicy.getPlatformAccountName();
                if v427 and v375.props.appPolicy.getUseSingleSignOn() then
                    v426 = {
                        "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"; 
                        platform = v427, 
                        ctaButton = l_signUpText_0
                    };
                end;
                if v426 then
                    local l_signUpText_1 = v419.signUpText;
                    l_signUpText_0 = nil;
                    v426 = v375.props.appPolicy.getPlatformAccountName();
                    if v426 and v375.props.appPolicy.getUseSingleSignOn() then
                        l_signUpText_0 = {
                            "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"; 
                            platform = v426, 
                            ctaButton = l_signUpText_1
                        };
                    end;
                    v424 = l_signUpText_0;
                end;
            end;
            local v429 = "";
            if not v375.getSignupCheckboxDisabled() then
                if v375.props.signupLegalDisclaimerTextVariant == 1 then
                    if v423 then
                        v429 = v419.signUpAgreementFullCopyCheckboxText;
                    else
                        v424 = v412 and "Authentication.SignUp.Description.SignUpAgreement.FullCopy.Continue" or "Authentication.SignUp.Description.SignupAgreement.FullCopy.CreateAccount";
                    end;
                elseif v375.props.signupLegalDisclaimerTextVariant == 2 and v423 then
                    v429 = v419.signUpAgreementShortCopyCheckboxText;
                end;
            end;
            local v430 = true;
            if v375.props.shouldShowBackButton ~= nil then
                v430 = v375.props.shouldShowBackButton;
            end;
            local l_createElement_0 = v7.createElement;
            local l_v37_0 = v37;
            local v433 = {
                BackgroundTransparency = 1, 
                includeStatusBar = true, 
                buttonRef = v375.props.containerRef, 
                renderFullscreenBackground = function() --[[ Line: 2122 ]] --[[ Name: renderFullscreenBackground ]]
                    -- upvalues: v7 (ref), v381 (ref), l_shouldUseFoundationBackgroundColor_0 (ref), l_foundationTokens_0 (ref), v418 (ref), l_BackgroundFill_0 (ref)
                    return v7.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = v381 and 1 or 0, 
                        BackgroundColor3 = if l_shouldUseFoundationBackgroundColor_0 then l_foundationTokens_0.Color.Surface.Surface_0.Color3 else v418.Theme.BackgroundUIDefault.Color
                    }, {
                        Background = v381 and v7.createElement(l_BackgroundFill_0, {
                            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
                        }), 
                        Mask = v381 and v7.createElement("ImageLabel", {
                            ZIndex = 2, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundColor3 = Color3.new(0, 0, 0), 
                            BackgroundTransparency = 0.5
                        })
                    });
                end
            };
            local v434 = {
                UserInputSink = l_isSignUpInProgress_0 and v7.createElement("ImageButton", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = ""
                }), 
                UnderAgeAlert = v375.state.shouldShowUnderAgeAlert and v7.createElement(v34, {
                    ZIndex = 3, 
                    onDismiss = function() --[[ Line: 2151 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v375 (ref)
                        v375:setState({
                            shouldShowUnderAgeAlert = false
                        });
                    end
                })
            };
            local l_createElement_1 = v7.createElement;
            local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
            local v437 = {
                Size = UDim2.new(1, 0, 1, -v383), 
                Position = UDim2.new(0.5, 0, 0, v384), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                ImageColor3 = if l_shouldUseFoundationBackgroundColor_0 then l_foundationTokens_0.Color.Surface.Surface_0.Color3 else v418.Theme.BackgroundUIDefault.Color, 
                ClipsDescendants = true
            };
            local v438 = {
                SizeConstraint = v7.createElement("UISizeConstraint", {
                    MaxSize = v166
                }), 
                HeaderFrame = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1
                }, {
                    BackButton = v430 and v7.createElement(l_ImageSetButton_0, {
                        Size = v164, 
                        AutoButtonColor = false, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 12, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = l_v165_0, 
                        ImageColor3 = v418.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0, 
                        [v7.Event.Activated] = v375.onCloseButtonClicked, 
                        [v7.Ref] = v375.backButtonRef
                    }), 
                    Title = v419.signUpText and if v397 then v7.createElement(l_Text_0, {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Text = v419.signUpText or "", 
                        fontStyle = l_foundationTokens_0.Typography.HeadingSmall, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    }) else v7.createElement(v36, {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        fitAxis = v35.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        Text = v419.signUpText or "", 
                        TextWrapped = true, 
                        Font = v418.Font.CaptionHeader.Font, 
                        TextSize = v418.Font.BaseSize * v418.Font.Header1.RelativeSize, 
                        TextColor3 = v418.Theme.TextEmphasis.Color, 
                        TextTransparency = v418.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Divider = not v397 and v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0.5, 0, 0, 48), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = l_shouldUseFoundationBackgroundColor_0 and 1 or 0, 
                    BackgroundColor3 = v418.Theme.UIEmphasis.Color
                })
            };
            local l_createElement_2 = v7.createElement;
            local l_FitScrollingFrame_0 = v35.FitScrollingFrame;
            local v444 = {
                Size = UDim2.new(1, 0, 1, -(49 + v392)), 
                Position = v422, 
                AnchorPoint = Vector2.new(0.5, 0), 
                fitFields = {
                    CanvasSize = v35.FitAxis.Height
                }, 
                ScrollBarThickness = 0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Selectable = false, 
                ScrollingEnabled = not (v375.state.isUsernameAnimating or v375.state.isPasswordAnimating), 
                CanvasPosition = v375.scrollCanvasTargetPositionY:map(function(v441) --[[ Line: 2241 ]]
                    -- upvalues: v375 (ref)
                    return v375.getScrollingFrameCanvasPosition(v441);
                end), 
                [v7.Ref] = v375.scrollingFrameRef, 
                [v7.Change.CanvasSize] = function(_) --[[ Line: 2245 ]]
                    -- upvalues: v375 (ref)
                    local v443 = v375.scrollCanvasTargetPositionY:getValue();
                    v375.scrollingFrameRef.current.CanvasPosition = v375.getScrollingFrameCanvasPosition(v443);
                end
            };
            local v445 = {
                ContentPadding = v7.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, v421)
                }), 
                ListLayout = v7.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 5)
                })
            };
            local v446 = false;
            if v375.getBirthdayVariant() == 0 then
                v446 = v7.createElement(v38, {
                    layoutOrder = 1, 
                    onBirthdaySelected = v375.onBirthdaySelected, 
                    onBirthdayFocused = v375.onBirthdayFocused, 
                    autoFocusOnMount = v391 or v402, 
                    buttonRef = v375.props.defaultRef, 
                    preferredInput = v375.props.preferredInput, 
                    birthdayContainerRef = v375.props.birthdayContainerRef, 
                    forceDarkTheme = v159 and v60 and v375.isAlreadyAuthenticated, 
                    enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
                });
            end;
            v445.BirthdayBar = v446;
            v446 = false;
            if v375.getBirthdayVariant() ~= 0 then
                v446 = v7.createElement(v45, {
                    layoutOrder = 1, 
                    variant = v375.getBirthdayVariant(), 
                    textInputHeight = 36, 
                    hasBirthdayError = v375.state.birthdayValid == v94.Invalid, 
                    onAgeChange = v375.onAgeChanged, 
                    onAgeAndMonthChange = v375.onAgeAndMonthChanged, 
                    onMonthAndYearChange = v375.onMonthAndYearChanged, 
                    ageTextFieldRef = v375.ageTextFieldRef, 
                    screenSize = v375.props.screenSize
                });
            end;
            v445.AgeInput = v446;
            v445.ContactInfoField = v391 and v7.createElement(v44, {
                layoutOrder = 2, 
                Under13 = l_birthday_2 and l_DateHelper_0:isRecentOrFutureDate(l_birthday_2.Month, l_birthday_2.Day, l_birthday_2.Year + 13), 
                SetContactMethod = v375.SetContactMethod, 
                SetPhoneNumber = v375.SetPhoneNumber, 
                SetEmail = v375.SetEmail, 
                contactMethod = l_contactMethod_0, 
                phoneCountryCodeSelectorCallback = v375.phoneCountryCodeSelectorCallback
            });
            v445.BackgroundPanel = v391 and v7.createElement("Frame", {
                Size = UDim2.new(0, 0, 0, 6), 
                LayoutOrder = 3, 
                BackgroundTransparency = 1
            }, {
                LightPanel = v7.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 100000, 0, 100000), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    BackgroundColor3 = v418.Theme.UIDefault.Color, 
                    AnchorPoint = Vector2.new(0.5, 0)
                })
            });
            v445.DisplayName = if v142 and v375.shouldShowDisplayNameField() then v8.createElement(v140, {
                authEventAnalytics = v375.props.authEventAnalytics, 
                birthday = if l_birthday_2 then l_birthday_2:FormatForEndpoint() else "", 
                bypassDisplayNameField = v375.state.bypassDisplayNameField, 
                focusedTextBoxPositionChangedCallback = v375.onFocusedTextBoxPositionChanged, 
                layoutOrder = 4, 
                onAnimationStateChangeCallback = v375.onAnimationStateChangeCallback, 
                onDisplayNameTextChanged = v375.onDisplayNameTextChanged, 
                onReturnPressedFromOnScreenKeyboard = v375.onDisplayNameTextChangeCompletedFromKeyboard, 
                pillClicked = v375.state.pillClicked, 
                resetPillClicked = v375.resetPillClicked, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                setUsernameRecommendation = v375.setUsernameRecommendation, 
                shouldDisableRecommendation = v375.state.hasEditedUsername, 
                textBoxFocusedCallback = v375.onDisplayNameTextBoxFocused, 
                textBoxFocusLostCallback = v375.onTextBoxFocusLost, 
                textBoxRef = v375.displayNameTextFieldRef, 
                updateBypassDisplayNameField = v375.updateBypassDisplayNameField, 
                updatePillClicked = v375.updatePillClicked
            }) else nil;
            v445.UsernameValidator = v420 and v7.createElement(v40, {
                layoutOrder = v142 and 5 or 4, 
                titleTextKey = "Authentication.Login.Label.Username", 
                summaryErrorTextKey = v393, 
                prerequisiteMet = l_birthday_2 and true or false, 
                textInputType = if v410 then nil else v389, 
                onInputTextChanged = v375.onUsernameTextChanged, 
                onInputTextValidated = v395 and v375.onUsernameTextValidated or v375.onUsernameTextChanged, 
                validator = v55, 
                prefilledText = if v142 then v375.state.recommendedUsername else nil, 
                placeholderText = if v142 then v375.getUsernamePlaceholder(v419) else v419.usernamePlaceholder, 
                validatorAdditionalProps = {
                    birthday = l_birthday_2 and l_birthday_2:FormatForEndpoint() or "", 
                    context = v87.Signup
                }, 
                textBoxFocusedCallback = v375.onUsernameTextBoxFocused, 
                textBoxFocusLostCallback = if v142 then v375.onUsernameTextBoxFocusLost else v375.onTextBoxFocusLost, 
                focusedTextBoxPositionChangedCallback = v375.onFocusedTextBoxPositionChanged, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                onReturnPressedFromOnScreenKeyboard = v375.onUsernameTextChangeCompletedFromKeyboard, 
                onAnimationStateChangeCallback = v375.onAnimationStateChangeCallback, 
                textBoxRef = v375.usernameTextFieldRef, 
                pillClicked = v375.state.pillClicked, 
                updatePillClicked = v375.updatePillClicked, 
                resetPillClicked = v375.resetPillClicked, 
                issueCondition = v375.state.issueCondition, 
                updateIssueCondition = v375.updateIssueCondition, 
                loadingSuggestions = v375.state.loadingSuggestions, 
                paddingBottomOverride = v142 and v375.props.shouldSeeDisplayNamesOnSignup and v375.getUsernameGuidanceText(v419) and -5 or nil, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v445.UsernameGuidanceText = if v142 and v375.props.shouldSeeDisplayNamesOnSignup and v375.getUsernameGuidanceText(v419) then v7.createElement("Frame", {
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
                    Font = v418.Font.CaptionBody.Font, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = v375.getUsernameGuidanceText(v419), 
                    TextColor3 = v418.Theme.TextDefault.Color, 
                    TextSize = v418.Font.BaseSize * v418.Font.CaptionBody.RelativeSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            }) else nil;
            v445.SuggestionsFrame = v420 and v395 and v7.createElement(v126, {
                layoutOrder = v142 and 5 or 4, 
                textBoxRef = v375.usernameTextFieldRef, 
                usernameValid = v375.state.usernameValid, 
                birthday = l_birthday_2 and l_birthday_2:FormatForEndpoint() or "", 
                suggest = v127, 
                context = v87.Signup, 
                pillClicked = v375.state.pillClicked, 
                updatePillClicked = v375.updatePillClicked, 
                resetPillClicked = v375.resetPillClicked, 
                issueCondition = v375.state.issueCondition, 
                usernameSuggestionClicked = v375.usernameSuggestionClicked, 
                usernameSuggestionsShown = v375.usernameSuggestionsShown, 
                shouldSuggest = v375.shouldSuggest, 
                updateSuggestionControlState = v375.updateSuggestionControlState, 
                useRefreshButton = v396, 
                logRefreshButtonClicked = v375.logRefreshButtonClicked, 
                loadSuggestions = v375.loadSuggestions, 
                finishSuggestions = v375.finishSuggestions, 
                loadingSuggestions = v375.state.loadingSuggestions, 
                padding = {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }
            });
            v445.PasswordValidator = not v400 and not v404 and v7.createElement(v40, {
                disabled = v375.state.birthdayFocused, 
                layoutOrder = v142 and 6 or 5, 
                titleTextKey = "CommonUI.Messages.Label.Password", 
                summaryErrorTextKey = v394, 
                prerequisiteMet = not v390, 
                textInputType = l_game_EngineFeature_0 and Enum.TextInputType.NewPassword or Enum.TextInputType.Password, 
                onInputTextChanged = v375.onPasswordTextChanged, 
                onInputTextValidated = v375.onPasswordTextChanged, 
                validator = v56, 
                placeholderText = v419.passwordPlaceholder, 
                validatorAdditionalProps = {
                    username = l_username_2
                }, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                textBoxFocusedCallback = v375.onPasswordTextBoxFocused, 
                textBoxFocusLostCallback = v375.onTextBoxFocusLost, 
                focusedTextBoxPositionChangedCallback = v375.onFocusedTextBoxPositionChanged, 
                onReturnPressedFromOnScreenKeyboard = v375.onPasswordTextChangeCompletedFromKeyboard, 
                onAnimationStateChangeCallback = v375.onAnimationStateChangeCallback, 
                textBoxRef = v375.passwordTextFieldRef, 
                centralOverlayBlocksInput = v391, 
                captureFocusOnTapStart = not v375.state.isCountryCodeSearchVisible
            });
            v445.GenderSelector = not v401 and v117() ~= 2 and v7.createElement(v41, {
                layoutOrder = v142 and 8 or 7, 
                gender = l_gender_1, 
                onGenderChanged = v375.onGenderChanged, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v445.Spacing = v7.createElement("Frame", {
                LayoutOrder = v142 and 9 or 8, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 38)
            });
            v445.SignUpButton = if v397 then v7.createElement(v102.Button, {
                variant = v102.Enums.ButtonVariant.Emphasis, 
                LayoutOrder = v142 and 10 or 9, 
                text = if v412 then v419.continueText else v419.signUpText, 
                size = v102.Enums.InputSize.Medium, 
                width = UDim.new(1, 0), 
                isDisabled = not v378, 
                isLoading = l_isSignUpInProgress_0, 
                onActivated = v375.onSignUpClick
            }) else v7.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                layoutOrder = v142 and 10 or 9, 
                size = UDim2.new(1, 0, 0, 36), 
                text = if v412 then v419.continueText else v419.signUpText, 
                isDisabled = not v378, 
                isLoading = l_isSignUpInProgress_0, 
                onActivated = v375.onSignUpClick
            });
            v445.CheckboxContainer = v423 and v8.createElement(l_View_0, {
                tag = "auto-xy padding-x-xxlarge padding-y-large row gap-medium", 
                LayoutOrder = v142 and 11 or 10
            }, {
                SignUpAgreementCheckbox = v8.createElement(l_Checkbox_0, {
                    isChecked = v375.state.signupAgreementsChecked, 
                    isDisabled = false, 
                    onActivated = function() --[[ Line: 2502 ]] --[[ Name: onActivated ]]
                        -- upvalues: v375 (ref), v88 (ref)
                        v375.props.authEventAnalytics.reportAuthFormInteraction(v88.Context.SinglePageSignUpScreen, v88.Field.TosCheckbox, (tostring(not v375.state.signupAgreementsChecked)));
                        v375:setState({
                            signupAgreementsChecked = not v375.state.signupAgreementsChecked
                        });
                    end, 
                    size = l_InputSize_0.Small, 
                    LayoutOrder = 1, 
                    label = ""
                }), 
                Text = v8.createElement(l_Text_0, {
                    tag = "text-body-small text-align-x-left text-wrap auto-xy shrink", 
                    LayoutOrder = 2, 
                    Text = v429
                })
            });
            v445.DisclaimerText = not (v405 or v406 or v423) and v7.createElement(v42, {
                layoutOrder = v142 and 11 or 10, 
                textXAlignment = Enum.TextXAlignment.Center, 
                paragraphTextKeys = {
                    v424
                }, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v445.DisclaimerLinks = not (v405 or v406) and v7.createElement(v43, {
                LayoutOrder = v142 and 12 or 11, 
                variant = if l_FFlagFoundationStylingOnSignUp_0 then v398 else nil, 
                enableAuditContentCapture = l_GetFFlagEnableAuditForSinglePageSignUp_0()
            });
            v445.ScrollPadding = v385 and v7.createElement("Frame", {
                LayoutOrder = v142 and 13 or 12, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v375.state.onScreenKeyboardHeight * 2)
            });
            v438.SignUpContentFrame = l_createElement_2(l_FitScrollingFrame_0, v444, v445);
            v438.Footer = v391 and v381 and v7.createElement("Frame", {
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
                    ImageColor3 = v418.Theme.UIDefault.Color
                })
            });
            v434.Container = l_createElement_1(l_l_ImageSetLabel_0_0, v437, v438);
            return l_createElement_0(l_v37_0, v433, v434);
        end);
    end);
end;
v168 = v9.connect(function(v447, _) --[[ Line: 2573 ]]
    return {
        formFactor = v447.FormFactor, 
        screenSize = v447.ScreenSize
    };
end, function(v449) --[[ Line: 2578 ]]
    -- upvalues: v59 (copy), v130 (copy), l_AnalyticsEvents_0 (copy), l_EventConstants_0 (copy), v73 (copy), v51 (copy), v50 (copy), v133 (copy), v131 (copy), v135 (copy), v134 (copy), v53 (copy), v54 (copy), v66 (copy), v65 (copy), v68 (copy), v69 (copy), v77 (copy)
    return {
        signUp = function(v450, v451, v452, v453, v454, v455, v456, v457, v458, v459, v460, v461, v462, v463) --[[ Line: 2580 ]] --[[ Name: signUp ]]
            -- upvalues: v449 (copy), v59 (ref)
            return v449(v59(v450, v451, v452, v453, v454, v455, v456, v457, v458, v459, v460, v461, v462, v463));
        end, 
        agreeToPhoneNumberVerification = function(_, v465, v466) --[[ Line: 2615 ]] --[[ Name: agreeToPhoneNumberVerification ]]
            -- upvalues: v449 (copy), v130 (ref)
            return v449(v130({
                verificationChallengeCallback = v465, 
                phoneNumber = v466
            }));
        end, 
        openKISAUserAgreements = function(v467) --[[ Line: 2622 ]] --[[ Name: openKISAUserAgreements ]]
            -- upvalues: l_AnalyticsEvents_0 (ref), l_EventConstants_0 (ref), v449 (copy), v73 (ref)
            l_AnalyticsEvents_0.sendPageLoadEvent(l_EventConstants_0.ctx.kisaAgreements, l_EventConstants_0.origin.signup);
            return v449(v73(v467));
        end, 
        setBackNavigationDisabled = function(v468) --[[ Line: 2627 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v449 (copy), v51 (ref)
            return v449(v51(v468));
        end, 
        navigateBack = function() --[[ Line: 2630 ]] --[[ Name: navigateBack ]]
            -- upvalues: v449 (copy), v50 (ref)
            return v449(v50());
        end, 
        showErrorToast = function() --[[ Line: 2633 ]] --[[ Name: showErrorToast ]]
            -- upvalues: v449 (copy), v133 (ref)
            return v449(v133({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        verifyPhoneNumber = function(_, v470, v471, v472, v473, v474) --[[ Line: 2636 ]] --[[ Name: verifyPhoneNumber ]]
            -- upvalues: v449 (copy), v131 (ref)
            return v449(v131({
                verifyPhoneNumberCallback = v470, 
                phoneNumber = v472, 
                deliveryTarget = v473, 
                challenge = v471, 
                useEmailOptionClickedCallback = v474
            }));
        end, 
        showErrorMessageToast = function(v475) --[[ Line: 2652 ]] --[[ Name: showErrorMessageToast ]]
            -- upvalues: v449 (copy), v135 (ref), v134 (ref)
            return v449(v135({
                toastType = v134.NetworkingError, 
                toastMessage = v475
            }));
        end, 
        showVNGUserAgreementsPopup = function(v476, v477, v478) --[[ Line: 2658 ]] --[[ Name: showVNGUserAgreementsPopup ]]
            -- upvalues: v449 (copy), v53 (ref), v54 (ref)
            return v449(v53(v54.VNGUserAgreementsPopup, {
                agreements = v476, 
                isSignup = true, 
                agreementAccepted = v477, 
                agreementDeclined = v478
            }, {
                DisableBackButtonClose = true
            }));
        end, 
        showVNGDCForm = function() --[[ Line: 2668 ]] --[[ Name: showVNGDCForm ]]
            -- upvalues: v449 (copy), v53 (ref), v54 (ref)
            v449(v53(v54.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end, 
        closeCentralOverlay = function() --[[ Line: 2673 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v449 (copy), v66 (ref)
            return v449(v66());
        end, 
        openAccountSwitchingErrorOverlay = function(v479, v480, v481, v482, v483, v484, v485, v486) --[[ Line: 2676 ]] --[[ Name: openAccountSwitchingErrorOverlay ]]
            -- upvalues: v449 (copy), v65 (ref)
            return v449(v65(v479, v480, v481, v482, v483, v484, v485, v486, true));
        end, 
        resetAppState = function() --[[ Line: 2698 ]] --[[ Name: resetAppState ]]
            -- upvalues: v449 (copy), v68 (ref)
            return v449(v68());
        end, 
        logoutWithoutShowConfirmation = function(v487, v488) --[[ Line: 2701 ]] --[[ Name: logoutWithoutShowConfirmation ]]
            -- upvalues: v449 (copy), v69 (ref)
            return v449(v69(v487, v488));
        end, 
        openEmailOtp = function(v489) --[[ Line: 2705 ]] --[[ Name: openEmailOtp ]]
            -- upvalues: v449 (copy), v77 (ref)
            v449(v77(v489));
        end, 
        showAccountLinkingAlert = function(v490) --[[ Line: 2708 ]] --[[ Name: showAccountLinkingAlert ]]
            -- upvalues: v449 (copy), v53 (ref), v54 (ref)
            return v449(v53(v54.AccountLinkingAlert, {
                alertType = v490
            }));
        end
    };
end)(v168);
v168 = l_RoactServices_0.connect({
    networking = v19, 
    guiService = l_AppGuiService_0, 
    authEventAnalytics = v16, 
    analytics = v17, 
    loggingProtocol = l_AppLogging_0
})(v168);
v168 = l_RoactAppPolicy_0.connect(function(v491, _) --[[ Line: 2724 ]]
    return {
        appPolicy = v491
    };
end)(v168);
v168 = v21.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.SignupLayer, 
    l_AppBtidLayers_0.IosPasswordSavingLayer
}, function(v493, _) --[[ Line: 2733 ]]
    -- upvalues: l_AppBtidLayers_0 (copy), v142 (copy), v145 (copy)
    local v495 = v493[l_AppBtidLayers_0.SignupLayer] or {};
    local v496 = v493[l_AppBtidLayers_0.IosPasswordSavingLayer] or {};
    local v497 = if v142 then v495.shouldSeeDisplayNamesOnSignup else nil;
    if v145 then
        v497 = true;
    end;
    return {
        useVerifiedSignupPage = v495.contactMethodRequired, 
        arePasswordFieldsPlaintext = v495.ArePasswordFieldsPlaintext, 
        shouldUseUsernameSuggestions = v495.usernameSuggestionsEnabled, 
        enableRefreshButton = v495.suggestionRefreshButtonEnabled, 
        shouldUseMinimalSignup = v495.shouldUseMinimalSignup, 
        shouldHideGenderOption = v495.shouldHideGenderOption, 
        shouldAutofocusOnBirthday = v495.shouldAutofocusOnBirthday, 
        shouldUsePasswordlessSignup = v495.shouldUsePasswordlessSignup, 
        shouldUsePasskeySignup = v495.shouldUsePasskeySignup, 
        shouldAutomaticallyPromptForPasskey = v495.shouldAutomaticallyPromptForPasskey, 
        birthdayPickerVariant = v495.birthdayPickerVariant, 
        shouldSeeDisplayNamesOnSignup = v497, 
        shouldShowKoreanKISASignUpFlow = v495.shouldShowKoreanKISASignUpFlow, 
        shouldDisableUsernameAutofill = v495.shouldDisableUsernameAutofill, 
        shouldRequireSignupCheckbox = v495.shouldRequireSignupCheckbox, 
        signupLegalDisclaimerTextVariant = v495.signupLegalDisclaimerTextVariant, 
        isIosAuthServiceEnabled = v496.enableNewIosPasswordSaving or false
    };
end)(v168);
v168 = l_withNavigationProps_0(function(_, v499) --[[ Line: 2764 ]]
    return v499;
end)(v168);
local function v502(v500) --[[ Line: 2769 ]] --[[ Name: SinglePageSignUpWithAuditContent ]]
    -- upvalues: l_AuditContentContext_0 (copy), v7 (copy), v168 (ref), v23 (copy)
    local v501 = l_AuditContentContext_0.useAuditContentContext();
    return v7.createElement(v168, v23.Dictionary.join(v500, {
        capturedAuditContent = v501.capturedAuditContent, 
        additionalAuditContent = v501.additionalAuditContent
    }));
end;
return function(v503) --[[ Line: 2781 ]]
    -- upvalues: v14 (copy), v160 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), l_FFlagFoundationStylingOnSignUp_0 (copy), l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 (copy), l_useTokens_0 (copy), v21 (copy), l_AppBtidLayers_0 (copy), v8 (copy), l_GetFFlagEnablePreferredInputForSignUp_0 (copy), l_usePreferredInput_0 (copy), l_FFlagEnableSignUpExitModal_0 (copy), l_useDispatch_0 (copy), v50 (copy), v53 (copy), v54 (copy), v66 (copy), l_useSignUpPageNavigationBindings_0 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), v7 (copy), l_AuditContentContext_0 (copy), v502 (copy), v23 (copy), l_FFlagHideBackButtonOnSignUpPage_0 (copy), v168 (ref)
    local v504 = v14.useFocusedGuiObject();
    local v505 = v14.useFocusGuiObject();
    local v506 = if v160 then l_useBreakpointXOrSmaller_0(v11.Keys.Medium) else nil;
    local v507 = if not not l_FFlagFoundationStylingOnSignUp_0 or l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 then l_useTokens_0() else nil;
    local v509 = v21.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AuthenticationStylingLayer
    }, function(v508) --[[ Line: 2791 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldUseFoundationBackgroundColor = (v508[l_AppBtidLayers_0.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
        };
    end);
    local v510 = l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 and v509.shouldUseFoundationBackgroundColor;
    local v511, v512 = v8.useState(false);
    local v513 = if l_GetFFlagEnablePreferredInputForSignUp_0() then l_usePreferredInput_0() else nil;
    local v514 = l_FFlagEnableSignUpExitModal_0 and v513 == v11.Input.Directional;
    local v515 = nil;
    if v514 then
        local v516 = l_useDispatch_0();
        local l_v516_0 = v516 --[[ copy: 12 -> 16 ]];
        local v518 = v8.useCallback(function() --[[ Line: 2808 ]]
            -- upvalues: v511 (copy), l_v516_0 (copy), v50 (ref), v53 (ref), v54 (ref), v66 (ref), v505 (copy), v504 (copy)
            if not v511 then
                l_v516_0(v50());
                return;
            else
                l_v516_0(v53(v54.SignUpExitModal, {
                    onClose = function() --[[ Line: 2814 ]] --[[ Name: onClose ]]
                        -- upvalues: l_v516_0 (ref), v66 (ref), v505 (ref), v504 (ref)
                        l_v516_0(v66());
                        l_v516_0(function() --[[ Line: 2816 ]]
                            -- upvalues: v505 (ref), v504 (ref)
                            v505(v504);
                        end);
                    end, 
                    onConfirm = function() --[[ Line: 2820 ]] --[[ Name: onConfirm ]]
                        -- upvalues: l_v516_0 (ref), v66 (ref), v50 (ref)
                        l_v516_0(v66());
                        l_v516_0(v50());
                    end
                }));
                return;
            end;
        end, {
            v511
        });
        v515 = l_useSignUpPageNavigationBindings_0(v518);
    else
        v515 = l_useSignUpPageNavigationBindings_0();
    end;
    local v519 = nil;
    local v520 = nil;
    local v521, v522 = v14.useDefaultFocusBehavior(v515);
    v519 = v521;
    v520 = v522;
    v521 = v8.useRef(nil);
    if l_GetFFlagEnableAuditForSinglePageSignUp_0() then
        return v7.createElement(l_AuditContentContext_0.Provider, nil, {
            SignUpPage = v7.createElement(v502, v23.Dictionary.join(v503, {
                signUpStarted = if v514 then v511 else nil, 
                setSignUpStarted = if v514 then v512 else nil, 
                shouldShowBackButton = if l_FFlagHideBackButtonOnSignUpPage_0 then not v514 else nil, 
                preferredInput = v513, 
                focusedGuiObject = v504, 
                focusGuiObject = v505, 
                defaultRef = v519, 
                containerRef = v520, 
                birthdayContainerRef = v521, 
                isCompactView = v506, 
                foundationTokens = v507, 
                shouldUseFoundationBackgroundColor = v510
            }))
        });
    else
        return v7.createElement(v168, v23.Dictionary.join(v503, {
            signUpStarted = if v514 then v511 else nil, 
            setSignUpStarted = if v514 then v512 else nil, 
            shouldShowBackButton = if l_FFlagHideBackButtonOnSignUpPage_0 then not v514 else nil, 
            preferredInput = v513, 
            focusedGuiObject = v504, 
            focusGuiObject = v505, 
            defaultRef = v519, 
            containerRef = v520, 
            birthdayContainerRef = v521, 
            isCompactView = v506, 
            foundationTokens = v507, 
            shouldUseFoundationBackgroundColor = v510
        }));
    end;
end;