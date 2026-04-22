local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_Players_0 = game:GetService("Players");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local v7 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v9 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v14 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v15 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v16 = require(l_Modules_0.LuaApp.Promise);
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v18 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v19 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_usePreferredInput_0 = v19.usePreferredInput;
local v21 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v21.Core.Style.useStyle;
local l_DarkTheme_0 = v21.App.Style.Themes.DarkTheme;
local l_Images_0 = v21.App.ImageSet.Images;
local l_ImageSetButton_0 = v21.Core.ImageSet.ImageSetButton;
local v26 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v27 = require(l_Modules_0.LuaApp.Components.Authentication.CollapsingTextInputValidator);
local v28 = require(l_Modules_0.LuaApp.Thunks.Authentication.PasswordValidator);
local v29 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.InputValidity);
local l_Button_0 = v21.App.Button.Button;
local l_LinkButton_0 = v21.App.Button.LinkButton;
local l_ButtonType_0 = v21.App.Button.Enum.ButtonType;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v35 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_DividerWithText_0 = v35.Components.DividerWithText;
local l_TextInputBoxWithBorder_0 = v35.Components.TextInputBoxWithBorder;
local l_AuthStatefulRoundCornerBorder_0 = v35.Components.AuthStatefulRoundCornerBorder;
local v39 = require(l_Modules_0.LuaApp.Components.Authentication.MultiPageSignupText);
local v40 = require(l_Modules_0.LuaApp.Components.Authentication.PageWithDisclaimerLinks);
local v41 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_1 = v41.Button;
local l_ButtonVariant_0 = v41.Enums.ButtonVariant;
local l_ButtonSize_0 = v41.Enums.ButtonSize;
local l_InputSize_0 = v41.Enums.InputSize;
local l_IconName_0 = v41.Enums.IconName;
local l_IconButton_0 = v41.IconButton;
local l_View_0 = v41.View;
local l_useTokens_0 = v41.Hooks.useTokens;
local v50 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v51 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v52 = require(l_Modules_0.LuaApp.Thunks.Authentication.RegisterPasskey);
local v53 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v54 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v55 = require(l_Modules_0.LuaApp.Thunks.Authentication.SetPassword);
local v56 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v57 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.UpdateUserEmail);
local v58 = require(l_Modules_0.LuaApp.Util.isStringEmail);
local v59 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v60 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol);
local l_Constants_0 = v60.Constants;
local l_default_0 = v60.CredentialsProtocol.default;
local l_GetUserAppLaunchInfo_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Http.Requests.GetUserAppLaunchInfo;
local l_GetAccountCreationMetadata_0 = require(l_CorePackages_0.Workspace.Packages.AuthSignup).Requests.GetAccountCreationMetadata;
local l_LaunchContext_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).Enums.LaunchContext;
local v66 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v68 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v70 = require(l_Modules_0.LuaApp.Experiment.IosAuthServiceExperiment);
local v71 = require(l_CorePackages_0.Workspace.Packages.ToastRodux);
local l_SetCurrentToastMessage_0 = v71.Actions.SetCurrentToastMessage;
local l_ToastType_0 = v71.Enums.ToastType;
local v74 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagEnableSavePasswordAfterRecovery_0 = v74.GetFFlagEnableSavePasswordAfterRecovery;
local l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 = v74.FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment;
local l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 = v74.FFlagEnableSignupFoundationalizeBackgroundAndText;
local l_FFlagEnableAddAuthMethodPageEmailSignup_0 = v74.FFlagEnableAddAuthMethodPageEmailSignup;
local v79 = game:DefineFastFlag("EnableAuthlessSignup", false);
local v80 = game:DefineFastFlag("CheckAndEnforceALNetworkCheck", false);
local v81 = game:DefineFastFlag("UseMultiPageSignupTextOnAddAuthMethodPage", false);
local v82 = game:DefineFastFlag("ShouldSkipPasskeySignupAutoFocus", false);
local v83 = game:DefineFastInt("LuaAppCmPasswordRegistrationDelay", 2);
local v84 = game:DefineFastFlag("PasskeySignupAndroidIterationEnabled", false);
local v85 = game:DefineFastFlag("EnableAuthedUsernameCMFix", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAndroidPasswordSuggestion");
local v87 = game:DefineFastFlag("AddAuthMethodUpdatedText", false);
local v88 = game:DefineFastString("AddAuthMethodEmailPlaceholder", "example@email.com");
local v89 = game:DefineFastFlag("EnableAddAuthMethodPageEmailSignupSetIsUnder13", false);
local v90 = game:DefineFastFlag("EnableAddAuthMethodPagePasskeyOrOTPText", false);
local v91 = game:DefineFastFlag("EnableStandardPasskeyButton", false);
local v92 = v81 and 24 or 60;
local v93 = {
    passwordFirst = {
        password = 4, 
        spacing = 5, 
        continue = 6, 
        divider = 7, 
        passkeyV2 = 8, 
        passkeyNonV2 = 7
    }, 
    passkeyFirst = {
        password = 6, 
        spacing = 7, 
        continue = 8, 
        divider = 5, 
        passkey = 4
    }, 
    showCreatePasswordButton = {
        passkey = 4, 
        divider = 5, 
        createPasswordButton = 6
    }, 
    showCreatePasswordButtonPasswordFirst = {
        createPasswordButton = 4, 
        divider = 5, 
        passkey = 6
    }, 
    showPasswordSectionOnly = {
        password = 4, 
        spacing = 5, 
        continue = 6
    }
};
if l_FFlagEnableAddAuthMethodPageEmailSignup_0 then
    v93.passwordFirst = {
        password = 4, 
        spacing = 5, 
        continue = 6, 
        divider = 8, 
        passkeyV2 = 9, 
        passkeyNonV2 = 8
    };
end;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v95 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v96 = require(l_CorePackages_0.Workspace.Packages.PasskeyUpsell);
local l_PasskeyUpsellScreen_0 = v96.Components.PasskeyUpsellScreen;
local l_PasskeyUpsellSource_0 = v96.Enums.PasskeyUpsellSource;
local l_FFlagAddReasonToEveryLogout_0 = v74.FFlagAddReasonToEveryLogout;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v74.FFlagDisableMemStorageServicePasswordEvent;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v103 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.iosAuthServiceSignupPasswordSave);
local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
l_GetTextBoundsParams_0.Text = "_unused";
l_GetTextBoundsParams_0.Font = Font.fromEnum(l_AppFonts_0.default:getDefault());
l_GetTextBoundsParams_0.Size = 19;
l_GetTextBoundsParams_0.Width = 0;
local _ = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
return function(_) --[[ Line: 164 ]]
    -- upvalues: v9 (copy), v10 (copy), l_AppGuiService_0 (copy), v13 (copy), v14 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_useAppPolicy_0 (copy), v7 (copy), v68 (copy), l_AppBtidLayers_0 (copy), l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 (copy), v95 (copy), v84 (copy), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (copy), l_FFlagEnableAddAuthMethodPageEmailSignup_0 (copy), v90 (copy), v79 (copy), v80 (copy), v91 (copy), v70 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), v18 (copy), l_usePreferredInput_0 (copy), v53 (copy), l_MemStorageService_0 (copy), v59 (copy), v66 (copy), v29 (copy), v58 (copy), v85 (copy), l_Players_0 (copy), v15 (copy), v57 (copy), v51 (copy), l_LaunchContext_0 (copy), v55 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), l_HttpService_0 (copy), v103 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_GetFFlagEnableSavePasswordAfterRecovery_0 (copy), v16 (copy), v83 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), v52 (copy), v50 (copy), v54 (copy), v82 (copy), v19 (copy), l_default_1 (copy), l_TelemetryConfigs_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_GetUserAppLaunchInfo_0 (copy), v89 (copy), v56 (copy), l_FFlagAddReasonToEveryLogout_0 (copy), l_GuiService_0 (copy), l_GetAccountCreationMetadata_0 (copy), l_PasskeyUpsellScreen_0 (copy), l_PasskeyUpsellSource_0 (copy), l_withLocalization_0 (copy), v87 (copy), v93 (copy), l_Button_1 (copy), l_ButtonVariant_0 (copy), v41 (copy), l_InputSize_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_LinkButton_0 (copy), v26 (copy), l_DarkTheme_0 (copy), v40 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_ButtonSize_0 (copy), v92 (copy), v81 (copy), v39 (copy), v27 (copy), l_game_EngineFeature_0 (copy), v28 (copy), l_TextInputBoxWithBorder_0 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), v88 (copy), l_DividerWithText_0 (copy)
    local v107 = v9(v10);
    local v108 = v9(l_AppGuiService_0);
    local v109 = v9(v13);
    local v110 = v9(v14);
    local v111 = v9(l_AppOmniRecommendationsRequest_0);
    local v113 = l_useAppPolicy_0(function(v112) --[[ Line: 170 ]]
        return v112;
    end);
    local v114, v115 = v7.useState(true);
    local v117 = v68.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AuthenticationStylingLayer
    }, function(v116) --[[ Line: 178 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldUseFoundationBackgroundColor = (v116[l_AppBtidLayers_0.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
        };
    end);
    local v118 = l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 and v117.shouldUseFoundationBackgroundColor;
    local v121 = v68.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.SignupLayer
    }, function(v119) --[[ Line: 190 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        local v120 = v119[l_AppBtidLayers_0.SignupLayer] or {};
        return {
            shouldUseV2FallbackScreen = v120.shouldUseV2FallbackScreen, 
            shouldSuppressPasskeyOnAddAuthMethodPage = v120.shouldSuppressPasskeyOnAddAuthMethodPage, 
            shouldWaitForPasswordRegistration = v120.shouldWaitForPasswordRegistration, 
            shouldDelayPasswordRegistration = v120.shouldDelayPasswordRegistration, 
            showPasskeyNudgingHeader = v120.showPasskeyNudgingHeader, 
            showPasskeyBeforePassword = v120.showPasskeyBeforePassword, 
            showPasskeyNudgingParagraph = v120.showPasskeyNudgingParagraph, 
            shouldRemoveOrDivider = v120.shouldRemoveOrDivider, 
            shouldUsePrimaryPasskeyButton = v120.shouldUsePrimaryPasskeyButton, 
            shouldUseSecondaryPasswordNextButton = v120.shouldUseSecondaryPasswordNextButton, 
            showPasskeyIconOnAddAuthMethodPage = v120.showPasskeyIconOnAddAuthMethodPage, 
            showPasswordLockIconOnAddAuthMethodPage = v120.showPasswordLockIconOnAddAuthMethodPage, 
            showPasskeyEducationalPage = v120.showPasskeyEducationalPage, 
            shouldShowCreateAPasswordButton = v120.shouldShowCreateAPasswordButton, 
            shouldDisablePasswordFocus = v120.shouldDisablePasswordFocus, 
            shouldShowEmailSignupO13 = v120.shouldShowEmailSignupO13, 
            shouldShowEmailSignupU13 = v120.shouldShowEmailSignupU13, 
            shouldShowPasskeyOrOTPText = v120.shouldShowPasskeyOrOTPText, 
            shouldShowSetupLaterInCornerWhenEmailProvided = v120.shouldShowSetupLaterInCornerWhenEmailProvided, 
            shouldShowSetupLaterInBottomRowWhenEmailProvided = v120.shouldShowSetupLaterInBottomRowWhenEmailProvided, 
            shouldUseStandardPasskeyButton = v120.shouldUseStandardPasskeyButton
        };
    end);
    local l_shouldUseV2FallbackScreen_0 = v121.shouldUseV2FallbackScreen;
    local v123 = v95() and v121.shouldSuppressPasskeyOnAddAuthMethodPage;
    local v124 = v84 and v121.shouldWaitForPasswordRegistration;
    local v125 = v84 and v121.shouldDelayPasswordRegistration;
    local v126 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.showPasskeyNudgingHeader;
    local v127 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.showPasskeyBeforePassword;
    local v128 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.showPasskeyNudgingParagraph;
    local v129 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.shouldRemoveOrDivider;
    local v130 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.shouldUsePrimaryPasskeyButton;
    local v131 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.shouldUseSecondaryPasswordNextButton;
    local v132 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.showPasskeyIconOnAddAuthMethodPage;
    local v133 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.showPasswordLockIconOnAddAuthMethodPage;
    local v134 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.showPasskeyEducationalPage;
    local v135 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.shouldShowCreateAPasswordButton;
    local v136 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v121.shouldDisablePasswordFocus;
    local v137 = l_FFlagEnableAddAuthMethodPageEmailSignup_0 and if v114 then v121.shouldShowEmailSignupU13 else v121.shouldShowEmailSignupO13;
    local v138 = v90 and v121.shouldShowPasskeyOrOTPText;
    local v139, v140 = v7.useState(false);
    local v141 = v79 and v137;
    if v80 then
        v141 = v141 and v139;
    end;
    local v142 = v141 and v121.shouldShowSetupLaterInCornerWhenEmailProvided;
    local v143 = v141 and v121.shouldShowSetupLaterInBottomRowWhenEmailProvided;
    local v144 = v91 and v121.shouldUseStandardPasskeyButton;
    local v145 = v137 and v114;
    local v146, v147 = v7.useState(true);
    local v148, v149 = v7.useState(false);
    local v150, v151 = v7.useState(true);
    local v152, v153 = v7.useState("");
    local v154, v155 = v7.useState("");
    local v156, v157 = v7.useState("");
    local v158, v159 = v7.useState(false);
    local v160, v161 = v7.useState("");
    local v162, v163 = v7.useState(false);
    local v164, v165 = v7.useState(true);
    local v166, v167 = v7.useState(false);
    local v168, v169 = v7.useState(false);
    local v170 = v7.useRef(nil);
    local v171 = v7.useRef(nil);
    local v172 = v70.useIsIosAuthServiceEnabled();
    local v173 = l_useStyle_0();
    local v174 = l_useTokens_0();
    local v175 = l_useDispatch_0();
    local v176 = v18.useFocusGuiObject();
    local v177 = l_usePreferredInput_0();
    local function v178() --[[ Line: 301 ]]
        -- upvalues: v53 (ref)
        v53.setSignupActionRequired("");
        v53.setPasskeySignupUsername("");
        v53.flush();
    end;
    local function v180() --[[ Line: 309 ]]
        -- upvalues: v53 (ref), v169 (copy), l_MemStorageService_0 (ref), v59 (ref), v66 (ref)
        local v179 = v53.getAuthenticatedTheme();
        if v179 ~= "" then
            v169(true);
            l_MemStorageService_0:Fire(v59.ThemeUpdate, v179);
        end;
        v66.ClearThemeOverride();
    end;
    local function v181() --[[ Line: 320 ]]
        -- upvalues: v147 (copy), v146 (copy)
        v147(not v146);
    end;
    local function v184(v182, v183) --[[ Line: 324 ]]
        -- upvalues: v153 (copy), v163 (copy), v29 (ref)
        v153(v182);
        v163(v183 == v29.Valid);
    end;
    local function v188(v185) --[[ Line: 329 ]]
        -- upvalues: v155 (copy), v58 (ref), v157 (copy), v159 (copy), v163 (copy)
        local l_Text_0 = v185.Text;
        v155(l_Text_0);
        local v187 = v58((tostring(l_Text_0)));
        if v187 or l_Text_0 == "" then
            v157("");
            v159(false);
        else
            v157("");
            v159(true);
        end;
        v163(v187);
    end;
    local function _() --[[ Line: 343 ]]
        -- upvalues: v85 (ref), v160 (copy), v53 (ref), l_Players_0 (ref)
        if v85 and v160 and v160 ~= "" then
            return v160;
        else
            local v189 = v53.getPasskeySignupUsername();
            if v189 and v189 ~= "" then
                return v189;
            elseif l_Players_0.LocalPlayer then
                return l_Players_0.LocalPlayer.Name or "";
            else
                return "";
            end;
        end;
    end;
    local function v210() --[[ Line: 361 ]]
        -- upvalues: v163 (copy), v109 (copy), v15 (ref), v137 (copy), v175 (copy), v57 (ref), v107 (copy), v154 (copy), v53 (ref), v169 (copy), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v51 (ref), v111 (copy), v110 (copy), v113 (copy), l_LaunchContext_0 (ref), v157 (copy), v159 (copy), v55 (ref), v152 (copy), v85 (ref), v160 (copy), l_Players_0 (ref), l_shouldUseV2FallbackScreen_0 (copy), v166 (copy), v172 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_HttpService_0 (ref), v103 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v124 (copy), v125 (copy), v16 (ref), v83 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v173 (copy)
        v163(false);
        v109.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.Continue);
        if v137 then
            v109.reportAuthButtonClick(v15.Context.SignupEmailOnAddAuthMethod, v15.Button.SubmitEmail);
            v175(v57(v107, v154, nil)):andThen(function() --[[ Line: 375 ]]
                -- upvalues: v109 (ref), v15 (ref), v53 (ref), v169 (ref), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v175 (ref), v51 (ref), v107 (ref), v111 (ref), v110 (ref), v113 (ref), l_LaunchContext_0 (ref), v163 (ref)
                v109.reportAuthModalShown(v15.Context.SignupEmailOnAddAuthMethod, v15.State.Success);
                v53.setSignupActionRequired("");
                v53.setPasskeySignupUsername("");
                v53.flush();
                local v191 = v53.getAuthenticatedTheme();
                if v191 ~= "" then
                    v169(true);
                    l_MemStorageService_0:Fire(v59.ThemeUpdate, v191);
                end;
                v66.ClearThemeOverride();
                v175(v51(v107, v111, v110, v113, l_LaunchContext_0.SignUp));
                v163(true);
            end, function(v192) --[[ Line: 387 ]]
                -- upvalues: v109 (ref), v15 (ref), v157 (ref), v159 (ref), v163 (ref)
                local v193 = v192 and v192.Message and v192.Message ~= "" and v192.Message or "";
                v109.reportAuthClientError(v15.Context.SignupEmailOnAddAuthMethod, v193);
                v157(v193);
                v159(true);
                v163(true);
            end);
            return;
        else
            v55(v107, v152):andThen(function(_) --[[ Line: 400 ]]
                -- upvalues: v53 (ref), v85 (ref), v160 (ref), l_Players_0 (ref), l_shouldUseV2FallbackScreen_0 (ref), v152 (ref), v166 (ref), v172 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v59 (ref), l_HttpService_0 (ref), v109 (ref), v15 (ref), v103 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v169 (ref), v66 (ref), v175 (ref), v51 (ref), v107 (ref), v111 (ref), v110 (ref), v113 (ref), l_LaunchContext_0 (ref), v163 (ref), v124 (ref), v125 (ref), v16 (ref), v83 (ref)
                v53.setSignupActionRequired("");
                v53.setPasskeySignupUsername("");
                v53.flush();
                local v195;
                if v85 and v160 and v160 ~= "" then
                    v195 = v160;
                else
                    local v196 = v53.getPasskeySignupUsername();
                    v195 = if v196 and v196 ~= "" then v196 else if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.Name or "" else "";
                end;
                if l_shouldUseV2FallbackScreen_0 and v195 and v152 then
                    local v197 = v166 and v172;
                    if not l_FFlagDisableMemStorageServicePasswordEvent_0 and not v197 then
                        l_MemStorageService_0:Fire(v59.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                            cvalue = v195, 
                            password = v152, 
                            authType = "signup"
                        }));
                    end;
                    if v166 then
                        local v198 = {
                            username = v195, 
                            password = v152
                        };
                        local v199 = l_HttpService_0:JSONEncode(v198);
                        local function v205() --[[ Line: 431 ]]
                            -- upvalues: v109 (ref), v15 (ref), v103 (ref), v195 (copy), l_default_0 (ref), v199 (copy), l_Constants_0 (ref), l_HttpService_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v172 (ref), v53 (ref), v169 (ref), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v175 (ref), v51 (ref), v107 (ref), v111 (ref), v110 (ref), v113 (ref), l_LaunchContext_0 (ref), v163 (ref)
                            v109.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordAttempted);
                            v103.reportAttempted(v195);
                            return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v199, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v200) --[[ Line: 445 ]]
                                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v109 (ref), v15 (ref), v103 (ref), v195 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v172 (ref), v53 (ref), v169 (ref), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v175 (ref), v51 (ref), v107 (ref), v111 (ref), v110 (ref), v113 (ref), l_LaunchContext_0 (ref), v163 (ref)
                                local v201 = if v200 then l_HttpService_0:JSONDecode(v200) else {};
                                if v201 and v201.errorCode == nil then
                                    l_Logger_0:info("Successfully registered password.");
                                    v109.reportAuthButtonClick(v15.Context.CMPasswordPasskeyFallback, v15.Button.SavePassword);
                                    v109.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordSuccess);
                                    v103.reportSuccess(v195);
                                else
                                    l_Logger_0:warning("Error registering password: " .. tostring(v201.errorMsg));
                                    v109.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordFailure, v201.errorMsg or "unknown");
                                    v103.reportFailure(v195, v201.errorMsg or "unknown");
                                end;
                                if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v172 then
                                    local v202 = v53.getAuthenticatedTheme();
                                    if v202 ~= "" then
                                        v169(true);
                                        l_MemStorageService_0:Fire(v59.ThemeUpdate, v202);
                                    end;
                                    v66.ClearThemeOverride();
                                    v175(v51(v107, v111, v110, v113, l_LaunchContext_0.SignUp));
                                    v163(true);
                                end;
                            end, function(v203) --[[ Line: 490 ]]
                                -- upvalues: l_Logger_0 (ref), v109 (ref), v15 (ref), v103 (ref), v195 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v172 (ref), v53 (ref), v169 (ref), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v175 (ref), v51 (ref), v107 (ref), v111 (ref), v110 (ref), v113 (ref), l_LaunchContext_0 (ref), v163 (ref)
                                l_Logger_0:warning("Error registering password: " .. tostring(v203));
                                v109.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordFailure, (tostring(v203)));
                                v103.reportFailure(v195, (tostring(v203)));
                                if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v172 then
                                    local v204 = v53.getAuthenticatedTheme();
                                    if v204 ~= "" then
                                        v169(true);
                                        l_MemStorageService_0:Fire(v59.ThemeUpdate, v204);
                                    end;
                                    v66.ClearThemeOverride();
                                    v175(v51(v107, v111, v110, v113, l_LaunchContext_0.SignUp));
                                    v163(true);
                                end;
                            end);
                        end;
                        if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v172 then
                            return v205();
                        else
                            local v206 = nil;
                            if v124 then
                                v206 = v205();
                                v206:await();
                            else
                                v206 = if v125 then v16.delay(v83):andThen(v205) else v205();
                            end;
                            return v206:andThen(function() --[[ Line: 537 ]]
                                -- upvalues: v53 (ref), v169 (ref), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v175 (ref), v51 (ref), v107 (ref), v111 (ref), v110 (ref), v113 (ref), l_LaunchContext_0 (ref), v163 (ref)
                                local v207 = v53.getAuthenticatedTheme();
                                if v207 ~= "" then
                                    v169(true);
                                    l_MemStorageService_0:Fire(v59.ThemeUpdate, v207);
                                end;
                                v66.ClearThemeOverride();
                                v175(v51(v107, v111, v110, v113, l_LaunchContext_0.SignUp));
                                v163(true);
                            end);
                        end;
                    else
                        v109.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordSkipped, v15.State.IosAuthServiceProtocolNotAvailable);
                        v103.reportSkipped(v15.State.IosAuthServiceProtocolNotAvailable);
                    end;
                end;
                local v208 = v53.getAuthenticatedTheme();
                if v208 ~= "" then
                    v169(true);
                    l_MemStorageService_0:Fire(v59.ThemeUpdate, v208);
                end;
                v66.ClearThemeOverride();
                v175(v51(v107, v111, v110, v113, l_LaunchContext_0.SignUp));
                v163(true);
                return v16.resolve();
            end, function(_) --[[ Line: 570 ]]
                -- upvalues: v175 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v173 (ref), v163 (ref)
                v175(l_SetCurrentToastMessage_0({
                    toastType = l_ToastType_0.NetworkingError, 
                    toastMessage = "Authentication.Login.Response.SomethingWentWrong", 
                    toastIconColorStyle = {
                        Color = v173.Theme.Alert.Color, 
                        Transparency = 0
                    }, 
                    slideIn = true
                }));
                v163(true);
            end);
            return;
        end;
    end;
    local function v214() --[[ Line: 585 ]]
        -- upvalues: v164 (copy), v165 (copy), v109 (copy), v15 (ref), v52 (ref), v107 (copy), v53 (ref), v169 (copy), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v175 (copy), v51 (ref), v111 (copy), v110 (copy), v113 (copy), l_LaunchContext_0 (ref), v16 (ref)
        if not v164 then
            return;
        else
            v165(false);
            v109.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.SetupPasskey);
            return v52(v107):andThen(function(_) --[[ Line: 597 ]]
                -- upvalues: v109 (ref), v15 (ref), v53 (ref), v169 (ref), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v175 (ref), v51 (ref), v107 (ref), v111 (ref), v110 (ref), v113 (ref), l_LaunchContext_0 (ref), v16 (ref)
                v109.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, "success");
                v53.setSignupActionRequired("");
                v53.setPasskeySignupUsername("");
                v53.flush();
                local v212 = v53.getAuthenticatedTheme();
                if v212 ~= "" then
                    v169(true);
                    l_MemStorageService_0:Fire(v59.ThemeUpdate, v212);
                end;
                v66.ClearThemeOverride();
                v175(v51(v107, v111, v110, v113, l_LaunchContext_0.SignUp));
                return v16.resolve();
            end, function(v213) --[[ Line: 609 ]]
                -- upvalues: v109 (ref), v15 (ref), v165 (ref), v16 (ref)
                if v213.name then
                    v109.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, v213.name);
                    if type(v213.body) == "string" then
                        v109.reportAuthClientError(v15.Context.SignupPasswordFallbackPasskeyCreated, v213.body, v213.source);
                    end;
                else
                    v109.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, "unknown");
                end;
                v165(true);
                return v16.resolve();
            end);
        end;
    end;
    local function v215() --[[ Line: 636 ]]
        -- upvalues: v109 (copy), v15 (ref), v53 (ref), v175 (copy), v50 (ref), v107 (copy), v108 (copy), v54 (ref)
        v109.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.Close);
        v53.setSignupActionRequired("");
        v53.setPasskeySignupUsername("");
        v53.flush();
        v175(v50(v107, v108, v54.MultiStepSignupCanceled));
    end;
    v7.useEffect(function() --[[ Line: 648 ]]
        -- upvalues: v82 (ref), v170 (copy), v136 (copy), v171 (copy), v177 (copy), v19 (ref), v176 (copy), v109 (copy), v15 (ref), v137 (copy), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
        if not v82 and v170.current then
            if v136 and v171.current then
                if v177 == v19.Input.Directional then
                    v176(v171.current);
                end;
            else
                v170.current:CaptureFocus();
            end;
        end;
        v109.reportAuthPageload(v15.Context.PasskeySignupPasswordFallback);
        if v137 then
            v109.reportAuthPageload(v15.Context.SignupEmailOnAddAuthMethod);
        end;
        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.AddAuthMethodPageMountTelemetryConfig, 1);
    end, {});
    v7.useEffect(function() --[[ Line: 674 ]]
        -- upvalues: v168 (copy), l_MemStorageService_0 (ref), v59 (ref), v66 (ref)
        if not v168 then
            l_MemStorageService_0:Fire(v59.ThemeUpdate, "dark");
            v66.SetDarkThemeOverride();
        end;
    end, {
        v173
    });
    v7.useEffect(function() --[[ Line: 683 ]]
        -- upvalues: l_shouldUseV2FallbackScreen_0 (copy), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), v109 (copy), v15 (ref), v167 (copy), l_Logger_0 (ref)
        if l_shouldUseV2FallbackScreen_0 then
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v216) --[[ Line: 690 ]]
                -- upvalues: v109 (ref), v15 (ref), v167 (ref)
                local v217 = false;
                if v216.password and v216.password.isAvailable then
                    v217 = true;
                end;
                v109.reportAuthPageload(v15.Context.CMPasswordPasskeySignup, (tostring(v217)));
                v167(v217);
            end):catch(function(v218) --[[ Line: 704 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error checking for available credential types. Error: ", v218);
            end);
        end;
    end, {
        l_shouldUseV2FallbackScreen_0
    });
    v7.useEffect(function() --[[ Line: 710 ]]
        -- upvalues: l_GetUserAppLaunchInfo_0 (ref), v107 (copy), v85 (ref), v161 (copy), v89 (ref), v115 (copy), v56 (ref), v53 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v175 (copy), v50 (ref), l_GuiService_0 (ref), v54 (ref)
        l_GetUserAppLaunchInfo_0(v107):andThen(function(v219) --[[ Line: 711 ]]
            -- upvalues: v85 (ref), v161 (ref), v89 (ref), v115 (ref), v56 (ref), v53 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v175 (ref), v50 (ref), v107 (ref), l_GuiService_0 (ref), v54 (ref)
            local v220 = nil;
            if v219 and v219.responseBody then
                v220 = v219.responseBody.name;
            end;
            if v220 and v220 ~= "" then
                if v85 then
                    v161(v220);
                end;
                if v89 then
                    v115(v56.fromUserInfoRequest(v219).isUnder13);
                    return;
                end;
            else
                v53.setSignupActionRequired("");
                v53.setPasskeySignupUsername("");
                v53.flush();
                if l_FFlagAddReasonToEveryLogout_0 then
                    v175(v50(v107, l_GuiService_0, v54.MultiStepSignupResetIncompleteState));
                    return;
                else
                    v175(v50(v107, l_GuiService_0));
                end;
            end;
        end):catch(function(_) --[[ Line: 732 ]]
            -- upvalues: v53 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v175 (ref), v50 (ref), v107 (ref), l_GuiService_0 (ref), v54 (ref)
            v53.setSignupActionRequired("");
            v53.setPasskeySignupUsername("");
            v53.flush();
            if l_FFlagAddReasonToEveryLogout_0 then
                v175(v50(v107, l_GuiService_0, v54.MultiStepSignupResetIncompleteState));
                return;
            else
                v175(v50(v107, l_GuiService_0));
                return;
            end;
        end);
    end, {});
    v7.useEffect(function() --[[ Line: 742 ]]
        -- upvalues: v80 (ref), v15 (ref), l_GetAccountCreationMetadata_0 (ref), v107 (copy), v140 (copy), v109 (copy)
        if v80 then
            local l_ALError_0 = v15.State.ALError;
            do
                local l_l_ALError_0_0 = l_ALError_0;
                l_GetAccountCreationMetadata_0(v107):andThen(function(v224) --[[ Line: 746 ]]
                    -- upvalues: l_l_ALError_0_0 (ref), v15 (ref), v140 (ref)
                    if v224 and v224.responseBody and v224.responseBody.isEligibleForALSignup == true then
                        l_l_ALError_0_0 = v15.State.ALCheckSuccess;
                        v140(true);
                        return;
                    else
                        l_l_ALError_0_0 = v15.State.ALCheckFail;
                        return;
                    end;
                end):catch(function() --[[ Line: 754 ]]
                    -- upvalues: l_l_ALError_0_0 (ref), v15 (ref)
                    l_l_ALError_0_0 = v15.State.ALError;
                end):finally(function() --[[ Line: 757 ]]
                    -- upvalues: v109 (ref), v15 (ref), l_l_ALError_0_0 (ref)
                    v109.reportAuthPageload(v15.Context.AddAuthMethodPage, l_l_ALError_0_0);
                end);
            end;
        end;
    end, {
        v107, 
        v109.reportAuthPageload
    });
    local v225;
    if v85 and v160 and v160 ~= "" then
        v225 = v160;
    else
        local v226 = v53.getPasskeySignupUsername();
        v225 = if v226 and v226 ~= "" then v226 else if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.Name or "" else "";
    end;
    local v229 = v7.useCallback(function(v227) --[[ Line: 766 ]]
        -- upvalues: v109 (copy), v15 (ref), v53 (ref), v169 (copy), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v175 (copy), v51 (ref), v107 (copy), v111 (copy), v110 (copy), v113 (copy), l_LaunchContext_0 (ref)
        v109.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v227);
        v53.setSignupActionRequired("");
        v53.setPasskeySignupUsername("");
        v53.flush();
        local v228 = v53.getAuthenticatedTheme();
        if v228 ~= "" then
            v169(true);
            l_MemStorageService_0:Fire(v59.ThemeUpdate, v228);
        end;
        v66.ClearThemeOverride();
        v175(v51(v107, v111, v110, v113, l_LaunchContext_0.SignUp));
    end, {
        v113, 
        v109.reportAuthButtonClick, 
        v175, 
        v107, 
        v111, 
        v178, 
        v180, 
        v110
    });
    if v134 and not v148 then
        return (v7.createElement(l_PasskeyUpsellScreen_0, {
            resetNavigationHistory = function(_) --[[ Line: 789 ]] --[[ Name: resetNavigationHistory ]]
                -- upvalues: v109 (copy), v15 (ref), v53 (ref), v169 (copy), l_MemStorageService_0 (ref), v59 (ref), v66 (ref), v175 (copy), v51 (ref), v107 (copy), v111 (copy), v110 (copy), v113 (copy), l_LaunchContext_0 (ref)
                v109.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreatedFromEducation, "success");
                v53.setSignupActionRequired("");
                v53.setPasskeySignupUsername("");
                v53.flush();
                local v231 = v53.getAuthenticatedTheme();
                if v231 ~= "" then
                    v169(true);
                    l_MemStorageService_0:Fire(v59.ThemeUpdate, v231);
                end;
                v66.ClearThemeOverride();
                v175(v51(v107, v111, v110, v113, l_LaunchContext_0.SignUp));
            end, 
            onDismiss = function() --[[ Line: 800 ]] --[[ Name: onDismiss ]]
                -- upvalues: v149 (copy)
                v149(true);
            end, 
            source = l_PasskeyUpsellSource_0.AddAuthMethodPage
        }));
    else
        local v232 = v173.Font.BaseSize * v173.Font.Header1.RelativeSize;
        return l_withLocalization_0({
            userGreetingHeaderText = {
                "Authentication.SignUp.Heading.UserGreetingWithName"; 
                username = v225
            }, 
            userGreetingHeaderTextWithPasskeyPassword = {
                "Authentication.SignUp.Heading.UserGreetingWithNameAndPasskeyPassword"; 
                username = v225
            }, 
            userPasswordOnlyGreetingHeaderText = {
                "Authentication.SignUp.Title"; 
                username = v225
            }, 
            continueText = "Authentication.SignUp.Label.Continue", 
            doneText = "CommonUI.Controls.Action.Done", 
            passwordHint = "Authentication.SignUp.Label.Use8CharPassword", 
            signUpLabel = "Authentication.SignUp.Action.CreateAccount", 
            oneMoreStepText = "Authentication.SignUp.Description.OneMoreStep", 
            setUpPasskeyLabel = "Authentication.SignUp.Label.SetUpPasskey", 
            createAPasskeyLabel = "Authentication.SignUp.Action.CreateAPasskey", 
            createAPasswordButtonText = "Authentication.SignUp.Heading.PasswordPage", 
            createAPasswordText = "Authentication.SignUp.Description.CreateAPassword", 
            ensureNeverLoseAccountText = "Authentication.SignUp.Description.EnsureNeverLoseAccount", 
            dividerText = "Authentication.SignUp.Description.Or", 
            secureAccountWithPasskeyText = "Authentication.SignUp.Description.SecureAccountWithPasskeyText", 
            createdAccountChooseSigninText = "Authentication.SignUp.Header.CreatedAccountChooseSignin", 
            createAccountPasskeyEmphasisDescriptionText = "Authentication.SignUp.Description.CreateAccountPasskeyEmphasisDescription", 
            emailLabelText = "Authentication.SignUp.Label.EnterYourEmail", 
            parentEmailLabelText = "Authentication.SignUp.Label.EnterYourParentsEmail", 
            invalidEmailText = "Feature.VerificationUpsell.Message.InvalidEmailAddress", 
            parentEmailDisclaimerText = "Authentication.SignUp.Description.ParentEmailDisclaimer", 
            createPasskeyOrOTPText = "Authentication.SignUp.Description.CreatePasskeyOrOTP", 
            setupLaterText = "Authentication.SignUp.Action.SetupLater"
        })(function(v233) --[[ Line: 837 ]]
            -- upvalues: l_shouldUseV2FallbackScreen_0 (copy), v225 (copy), v135 (copy), v150 (copy), v126 (copy), v87 (ref), v128 (copy), v138 (copy), v95 (ref), v123 (copy), v127 (copy), v93 (ref), v130 (copy), v7 (ref), l_Button_1 (ref), l_ButtonVariant_0 (ref), v132 (copy), v41 (ref), v214 (copy), v164 (copy), l_InputSize_0 (ref), v171 (copy), v144 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_LinkButton_0 (ref), v131 (copy), v133 (copy), v151 (copy), v26 (ref), v118 (copy), v174 (copy), l_DarkTheme_0 (ref), v40 (ref), v145 (copy), l_ImageSetButton_0 (ref), l_Images_0 (ref), v215 (copy), l_View_0 (ref), l_IconButton_0 (ref), l_IconName_0 (ref), l_ButtonSize_0 (ref), v173 (copy), v232 (copy), v79 (ref), v142 (copy), v229 (copy), v15 (ref), v92 (ref), v81 (ref), v39 (ref), v137 (copy), v27 (ref), l_game_EngineFeature_0 (ref), v184 (copy), v28 (ref), v146 (copy), v181 (copy), v170 (copy), l_TextInputBoxWithBorder_0 (ref), v158 (copy), l_AuthStatefulRoundCornerBorder_0 (ref), v188 (copy), v114 (copy), v156 (copy), v88 (ref), l_FFlagEnableAddAuthMethodPageEmailSignup_0 (ref), v210 (copy), v162 (copy), v129 (copy), l_DividerWithText_0 (ref), v143 (copy)
            local v234 = nil;
            v234 = if l_shouldUseV2FallbackScreen_0 and v225 then if not v135 or v150 then if v126 then if v87 then v233.createdAccountChooseSigninText else v233.userGreetingHeaderTextWithPasskeyPassword else v233.userGreetingHeaderText else v233.userGreetingHeaderText else v233.oneMoreStepText;
            local v235 = nil;
            v235 = if not v135 or v150 then if v128 and v138 then v233.createPasskeyOrOTPText else if v128 and v87 then v233.createAccountPasskeyEmphasisDescriptionText else if v128 then v233.secureAccountWithPasskeyText else v233.createAPasswordText else v233.createAPasswordText;
            if v95() and v123 then
                v234 = v233.userPasswordOnlyGreetingHeaderText;
                v235 = v233.ensureNeverLoseAccountText;
            end;
            local v236 = v127 and "passkeyFirst" or "passwordFirst";
            if v135 then
                v236 = v150 and v127 and "showCreatePasswordButton" or v150 and "showCreatePasswordButtonPasswordFirst" or "showPasswordSectionOnly";
            end;
            local v237 = v93[v236];
            local l_password_0 = v237.password;
            local l_spacing_0 = v237.spacing;
            local l_continue_0 = v237.continue;
            local l_divider_0 = v237.divider;
            local v242 = v237.passkey or if l_shouldUseV2FallbackScreen_0 then v237.passkeyV2 else v237.passkeyNonV2;
            local l_createPasswordButton_0 = v237.createPasswordButton;
            local v244 = nil;
            v244 = if l_shouldUseV2FallbackScreen_0 and v130 then v7.createElement(l_Button_1, {
                LayoutOrder = v242, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v233.createAPasskeyLabel, 
                icon = if v132 then v41.Enums.IconName.Key else nil, 
                onActivated = v214, 
                isDisabled = not v164, 
                size = l_InputSize_0.Large, 
                width = UDim.new(1, 0), 
                buttonRef = v171
            }) else if l_shouldUseV2FallbackScreen_0 and v144 then v7.createElement(l_Button_1, {
                LayoutOrder = v242, 
                variant = l_ButtonVariant_0.Standard, 
                text = v233.createAPasskeyLabel, 
                icon = if v132 then v41.Enums.IconName.Key else nil, 
                onActivated = v214, 
                isDisabled = not v164, 
                size = l_InputSize_0.Large, 
                width = UDim.new(1, 0), 
                buttonRef = v171
            }) else if l_shouldUseV2FallbackScreen_0 then v7.createElement(l_Button_0, {
                layoutOrder = v242, 
                buttonType = l_ButtonType_0.Secondary, 
                text = v233.createAPasskeyLabel, 
                size = UDim2.new(1, 0, 0, 48), 
                onActivated = v214, 
                isDisabled = not v164, 
                buttonRef = v171
            }) else v7.createElement(l_LinkButton_0, {
                layoutOrder = v242, 
                text = v233.setUpPasskeyLabel, 
                onActivated = v214, 
                isDisabled = not v164, 
                buttonRef = v171
            });
            local v245 = l_createPasswordButton_0 and v7.createElement(l_Button_1, {
                LayoutOrder = l_createPasswordButton_0, 
                variant = if v131 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Emphasis, 
                text = v233.createAPasswordButtonText, 
                icon = if v133 then v41.Enums.IconName.LockClosed else nil, 
                onActivated = function() --[[ Line: 942 ]] --[[ Name: onActivated ]]
                    -- upvalues: v151 (ref)
                    v151(false);
                end, 
                size = l_InputSize_0.Large, 
                width = UDim.new(1, 0)
            });
            return v7.createElement(v26, {
                BackgroundTransparency = 0, 
                includeStatusBar = true, 
                BackgroundColor3 = if v118 then v174.Color.Surface.Surface_0.Color3 else l_DarkTheme_0.BackgroundUIDefault.Color
            }, {
                PageContent = v7.createElement(v40, {
                    showFooter = v145
                }, {
                    HeaderFrameListLayout = v7.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    HeaderPadding = v7.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 25)
                    }), 
                    HeaderFrame = v7.createElement("Frame", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        LogoutButton = if not l_shouldUseV2FallbackScreen_0 then v7.createElement(l_ImageSetButton_0, {
                            Size = UDim2.new(0, 36, 0, 36), 
                            AutoButtonColor = false, 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(0, 12, 0.5, 0), 
                            AnchorPoint = Vector2.new(0, 0.5), 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = l_Images_0["icons/navigation/close"], 
                            ImageColor3 = l_DarkTheme_0.UIEmphasis.Color, 
                            ImageTransparency = 0, 
                            [v7.Event.Activated] = v215
                        }) else nil, 
                        HeaderBackButton = if not v135 or v150 then nil else v7.createElement(l_View_0, {
                            tag = "col", 
                            Size = UDim2.new(0, 36, 0, 36), 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(0, 12, 0.5, 0), 
                            AnchorPoint = Vector2.new(0, 0.5)
                        }, {
                            Button = v7.createElement(l_IconButton_0, {
                                icon = l_IconName_0.ChevronLargeLeft, 
                                variant = l_ButtonVariant_0.Utility, 
                                size = l_ButtonSize_0.Medium, 
                                onActivated = function() --[[ Line: 1004 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v151 (ref)
                                    v151(true);
                                end
                            })
                        }), 
                        Title = v7.createElement("TextLabel", {
                            Position = UDim2.new(0, 0, 0.5, 0), 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0, 0.5), 
                            BackgroundTransparency = 1, 
                            Text = v233.signUpLabel, 
                            TextWrapped = true, 
                            Font = v173.Font.CaptionHeader.Font, 
                            TextSize = v232, 
                            TextColor3 = l_DarkTheme_0.TextEmphasis.Color, 
                            TextTransparency = l_DarkTheme_0.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Center
                        }), 
                        SetupLaterButton = if v79 and v142 then v7.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(1, -12, 0.5, 0), 
                            AnchorPoint = Vector2.new(1, 0.5), 
                            AutomaticSize = Enum.AutomaticSize.XY
                        }, {
                            Button = v7.createElement(l_LinkButton_0, {
                                text = v233.setupLaterText, 
                                fontStyle = "CaptionHeader", 
                                colorStyleDefault = "TextDefault", 
                                colorStyleHover = "TextDefault", 
                                onActivated = function() --[[ Line: 1035 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v229 (ref), v15 (ref)
                                    v229(v15.Button.SetupLaterCornerButton);
                                end
                            })
                        }) else nil
                    }), 
                    Divider = v7.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        Position = UDim2.new(0.5, 0, 0, 48), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundTransparency = v118 and 1 or 0, 
                        BackgroundColor3 = l_DarkTheme_0.UIEmphasis.Color, 
                        LayoutOrder = 2
                    }), 
                    ContentFrame = v7.createElement("Frame", {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 1, -49), 
                        Position = UDim2.new(0.5, 0, 0, 49), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        ContainerListLayout = v7.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Top, 
                            Padding = UDim.new(0, 5)
                        }), 
                        ContentPadding = v7.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 24), 
                            PaddingRight = UDim.new(0, 24), 
                            PaddingTop = UDim.new(0, v92)
                        }), 
                        MultiPageSignupText = if v81 then v7.createElement(v39, {
                            layoutOrder = 1, 
                            titleText = v234, 
                            helpText = v235
                        }) else nil, 
                        InstructionsHeadingText = if v81 then nil else v7.createElement("TextLabel", {
                            Text = v234, 
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            BackgroundTransparency = 1, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextColor3 = v173.Theme.TextEmphasis.Color, 
                            Font = v173.Font.Header1.Font, 
                            TextSize = 24
                        }, {
                            UIPadding = v7.createElement("UIPadding", {
                                PaddingBottom = UDim.new(0, 36)
                            })
                        }), 
                        InstructionsHeadingBody = if v81 then nil else v7.createElement("TextLabel", {
                            Text = v235, 
                            LayoutOrder = 2, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            TextColor3 = v173.Theme.TextDefault.Color, 
                            Font = v173.Font.Header2.Font, 
                            TextSize = 14, 
                            TextWrapped = true
                        }, {}), 
                        Spacing = v7.createElement("Frame", {
                            LayoutOrder = 3, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 16)
                        }), 
                        PasswordValidator = if not v137 and l_password_0 then v7.createElement(v27, {
                            layoutOrder = l_password_0, 
                            titleTextKey = "CommonUI.Messages.Label.Password", 
                            summaryErrorTextKey = "Authentication.SignUp.Label.ErrorsWithPassword", 
                            prerequisiteMet = true, 
                            textInputType = l_game_EngineFeature_0 and Enum.TextInputType.NewPassword or Enum.TextInputType.Password, 
                            onInputTextChanged = v184, 
                            onInputTextValidated = v184, 
                            validator = v28, 
                            validatorAdditionalProps = {
                                username = v225
                            }, 
                            returnKeyType = Enum.ReturnKeyType.Next, 
                            hidePassword = v146, 
                            onToggleCallback = v181, 
                            showDetailedError = true, 
                            textBoxRef = v170
                        }) else nil, 
                        EmailInput = if v137 and l_password_0 then v7.createElement(l_TextInputBoxWithBorder_0, {
                            textInputType = Enum.TextInputType.Email, 
                            textInputHeight = 36, 
                            layoutOrder = l_password_0, 
                            borderState = if v158 then l_AuthStatefulRoundCornerBorder_0.BorderState.Error else l_AuthStatefulRoundCornerBorder_0.BorderState.Default, 
                            textBarColor = v173.Theme.BackgroundUIContrast.Color, 
                            onChangeTextCallback = v188, 
                            labelText = if v114 then v233.parentEmailLabelText else v233.emailLabelText, 
                            labelTextColor = v173.Theme.TextDefault.Color, 
                            errorText = if v156 ~= "" then v156 else if v158 then v233.invalidEmailText else nil, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            placeholderText = v88, 
                            placeholderTextColor = v173.Theme.TextDefault.Color
                        }) else nil, 
                        ParentEmailDisclaimer = if l_FFlagEnableAddAuthMethodPageEmailSignup_0 and v137 and v114 and l_continue_0 then v7.createElement("Frame", {
                            LayoutOrder = l_continue_0 + 1, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }, {
                            Padding = v7.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 4)
                            }), 
                            Label = v7.createElement("TextLabel", {
                                Text = v233.parentEmailDisclaimerText, 
                                TextColor3 = v173.Theme.TextDefault.Color, 
                                TextTransparency = v173.Theme.TextDefault.Transparency, 
                                Font = v173.Font.Footer.Font, 
                                TextSize = v173.Font.BaseSize * v173.Font.Footer.RelativeSize, 
                                TextWrapped = true, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y
                            })
                        }) else nil, 
                        Spacing2 = if l_spacing_0 then v7.createElement("Frame", {
                            LayoutOrder = l_spacing_0, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 8)
                        }) else nil, 
                        ContinueButton = if l_continue_0 then if v131 then v7.createElement(l_Button_1, {
                            LayoutOrder = l_continue_0, 
                            variant = l_ButtonVariant_0.Standard, 
                            text = if l_shouldUseV2FallbackScreen_0 then v233.doneText else v233.continueText, 
                            icon = if v133 then v41.Enums.IconName.LockClosed else nil, 
                            size = l_InputSize_0.Large, 
                            width = UDim.new(1, 0), 
                            onActivated = v210, 
                            isDisabled = not v162
                        }) else v7.createElement(l_Button_0, {
                            layoutOrder = l_continue_0, 
                            buttonType = l_ButtonType_0.PrimaryContextual, 
                            text = if l_shouldUseV2FallbackScreen_0 then v233.doneText else v233.continueText, 
                            size = UDim2.new(1, 0, 0, 48), 
                            onActivated = v210, 
                            isDisabled = not v162
                        }) else nil, 
                        DividerWithText = if not (not l_shouldUseV2FallbackScreen_0 or v123 or v129) and l_divider_0 then v7.createElement(l_DividerWithText_0, {
                            layoutOrder = l_divider_0, 
                            width = 0, 
                            height = 0, 
                            size = UDim2.new(1, 0, 0, 32), 
                            font = v173.Font.BodySmall.Font, 
                            fontSize = v173.Font.BaseSize * v173.Font.BodySmall.RelativeSize, 
                            color3 = v173.Theme.TextMuted.Color, 
                            transparency = v173.Theme.TextMuted.Transparency, 
                            text = v233.dividerText, 
                            padding = 8
                        }) else nil, 
                        CreatePasswordButton = v245, 
                        PasskeyButton = if not v123 and v242 then v244 else nil, 
                        SetupLaterBottomButton = if v79 and v143 then v7.createElement(l_Button_1, {
                            LayoutOrder = 11, 
                            variant = l_ButtonVariant_0.Utility, 
                            text = v233.setupLaterText, 
                            size = l_InputSize_0.Large, 
                            width = UDim.new(1, 0), 
                            onActivated = function() --[[ Line: 1245 ]] --[[ Name: onActivated ]]
                                -- upvalues: v229 (ref), v15 (ref)
                                v229(v15.Button.SetupLaterRowButton);
                            end
                        }) else nil
                    })
                })
            });
        end);
    end;
end;