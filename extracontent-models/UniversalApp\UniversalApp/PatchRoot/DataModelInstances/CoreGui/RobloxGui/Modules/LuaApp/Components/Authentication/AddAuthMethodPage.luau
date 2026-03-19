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
local l_DividerWithText_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Components.DividerWithText;
local v36 = require(l_Modules_0.LuaApp.Components.Authentication.MultiPageSignupText);
local v37 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_1 = v37.Button;
local l_ButtonVariant_0 = v37.Enums.ButtonVariant;
local l_ButtonSize_0 = v37.Enums.ButtonSize;
local l_InputSize_0 = v37.Enums.InputSize;
local l_IconName_0 = v37.Enums.IconName;
local l_IconButton_0 = v37.IconButton;
local l_View_0 = v37.View;
local l_useTokens_0 = v37.Hooks.useTokens;
local v46 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v47 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v48 = require(l_Modules_0.LuaApp.Thunks.Authentication.RegisterPasskey);
local v49 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v50 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v51 = require(l_Modules_0.LuaApp.Thunks.Authentication.SetPassword);
local v52 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v53 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol);
local l_Constants_0 = v53.Constants;
local l_default_0 = v53.CredentialsProtocol.default;
local l_GetUserAppLaunchInfo_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Http.Requests.GetUserAppLaunchInfo;
local l_LaunchContext_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).Enums.LaunchContext;
local v58 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v60 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v62 = require(l_Modules_0.LuaApp.Experiment.IosAuthServiceExperiment);
local v63 = require(l_CorePackages_0.Workspace.Packages.ToastRodux);
local l_SetCurrentToastMessage_0 = v63.Actions.SetCurrentToastMessage;
local l_ToastType_0 = v63.Enums.ToastType;
local v66 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableCredentialsProtocolLoggingFix_0 = v66.FFlagEnableCredentialsProtocolLoggingFix;
local l_GetFFlagEnableSavePasswordAfterRecovery_0 = v66.GetFFlagEnableSavePasswordAfterRecovery;
local l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 = v66.FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment;
local l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 = v66.FFlagEnableSignupFoundationalizeBackgroundAndText;
local v71 = game:DefineFastFlag("UseMultiPageSignupTextOnAddAuthMethodPage", false);
local v72 = game:DefineFastFlag("ShouldSkipPasskeySignupAutoFocus", false);
local v73 = game:DefineFastInt("LuaAppCmPasswordRegistrationDelay", 2);
local v74 = game:DefineFastFlag("PasskeySignupAndroidIterationEnabled", false);
local v75 = game:DefineFastFlag("EnableAuthedUsernameCMFix", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAndroidPasswordSuggestion");
local v77 = v71 and 24 or 60;
local v78 = {
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
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v80 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v81 = require(l_CorePackages_0.Workspace.Packages.PasskeyUpsell);
local l_PasskeyUpsellScreen_0 = v81.Components.PasskeyUpsellScreen;
local l_PasskeyUpsellSource_0 = v81.Enums.PasskeyUpsellSource;
local l_FFlagAddReasonToEveryLogout_0 = v66.FFlagAddReasonToEveryLogout;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v66.FFlagDisableMemStorageServicePasswordEvent;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v88 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.iosAuthServiceSignupPasswordSave);
local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
l_GetTextBoundsParams_0.Text = "_unused";
l_GetTextBoundsParams_0.Font = Font.fromEnum(l_AppFonts_0.default:getDefault());
l_GetTextBoundsParams_0.Size = 19;
l_GetTextBoundsParams_0.Width = 0;
local _ = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
return function(_) --[[ Line: 140 ]]
    -- upvalues: v9 (copy), v10 (copy), l_AppGuiService_0 (copy), v13 (copy), v14 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_useAppPolicy_0 (copy), v60 (copy), l_AppBtidLayers_0 (copy), l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 (copy), v80 (copy), v74 (copy), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (copy), v7 (copy), v62 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), v18 (copy), l_usePreferredInput_0 (copy), v49 (copy), l_MemStorageService_0 (copy), v52 (copy), v58 (copy), v29 (copy), v75 (copy), l_Players_0 (copy), v15 (copy), v51 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), l_HttpService_0 (copy), v88 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_FFlagEnableCredentialsProtocolLoggingFix_0 (copy), l_GetFFlagEnableSavePasswordAfterRecovery_0 (copy), v47 (copy), l_LaunchContext_0 (copy), v16 (copy), v73 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), v48 (copy), v46 (copy), v50 (copy), v72 (copy), v19 (copy), l_default_1 (copy), l_TelemetryConfigs_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_GetUserAppLaunchInfo_0 (copy), l_FFlagAddReasonToEveryLogout_0 (copy), l_GuiService_0 (copy), l_PasskeyUpsellScreen_0 (copy), l_PasskeyUpsellSource_0 (copy), l_withLocalization_0 (copy), v78 (copy), l_Button_1 (copy), l_ButtonVariant_0 (copy), v37 (copy), l_InputSize_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_LinkButton_0 (copy), v26 (copy), l_DarkTheme_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_ButtonSize_0 (copy), v77 (copy), v71 (copy), v36 (copy), v27 (copy), l_game_EngineFeature_0 (copy), v28 (copy), l_DividerWithText_0 (copy)
    local v92 = v9(v10);
    local v93 = v9(l_AppGuiService_0);
    local v94 = v9(v13);
    local v95 = v9(v14);
    local v96 = v9(l_AppOmniRecommendationsRequest_0);
    local v98 = l_useAppPolicy_0(function(v97) --[[ Line: 146 ]]
        return v97;
    end);
    local v100 = v60.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AuthenticationStylingLayer
    }, function(v99) --[[ Line: 152 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldUseFoundationBackgroundColor = (v99[l_AppBtidLayers_0.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
        };
    end);
    local v101 = l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 and v100.shouldUseFoundationBackgroundColor;
    local v104 = v60.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.SignupLayer
    }, function(v102) --[[ Line: 164 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        local v103 = v102[l_AppBtidLayers_0.SignupLayer] or {};
        return {
            shouldUseV2FallbackScreen = v103.shouldUseV2FallbackScreen, 
            shouldSuppressPasskeyOnAddAuthMethodPage = v103.shouldSuppressPasskeyOnAddAuthMethodPage, 
            shouldWaitForPasswordRegistration = v103.shouldWaitForPasswordRegistration, 
            shouldDelayPasswordRegistration = v103.shouldDelayPasswordRegistration, 
            showPasskeyNudgingHeader = v103.showPasskeyNudgingHeader, 
            showPasskeyBeforePassword = v103.showPasskeyBeforePassword, 
            showPasskeyNudgingParagraph = v103.showPasskeyNudgingParagraph, 
            shouldRemoveOrDivider = v103.shouldRemoveOrDivider, 
            shouldUsePrimaryPasskeyButton = v103.shouldUsePrimaryPasskeyButton, 
            shouldUseSecondaryPasswordNextButton = v103.shouldUseSecondaryPasswordNextButton, 
            showPasskeyIconOnAddAuthMethodPage = v103.showPasskeyIconOnAddAuthMethodPage, 
            showPasswordLockIconOnAddAuthMethodPage = v103.showPasswordLockIconOnAddAuthMethodPage, 
            showPasskeyEducationalPage = v103.showPasskeyEducationalPage, 
            shouldShowCreateAPasswordButton = v103.shouldShowCreateAPasswordButton, 
            shouldDisablePasswordFocus = v103.shouldDisablePasswordFocus
        };
    end);
    local l_shouldUseV2FallbackScreen_0 = v104.shouldUseV2FallbackScreen;
    local v106 = v80() and v104.shouldSuppressPasskeyOnAddAuthMethodPage;
    local v107 = v74 and v104.shouldWaitForPasswordRegistration;
    local v108 = v74 and v104.shouldDelayPasswordRegistration;
    local v109 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.showPasskeyNudgingHeader;
    local v110 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.showPasskeyBeforePassword;
    local v111 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.showPasskeyNudgingParagraph;
    local v112 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.shouldRemoveOrDivider;
    local v113 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.shouldUsePrimaryPasskeyButton;
    local v114 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.shouldUseSecondaryPasswordNextButton;
    local v115 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.showPasskeyIconOnAddAuthMethodPage;
    local v116 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.showPasswordLockIconOnAddAuthMethodPage;
    local v117 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.showPasskeyEducationalPage;
    local v118 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.shouldShowCreateAPasswordButton;
    local v119 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v104.shouldDisablePasswordFocus;
    local v120, v121 = v7.useState(true);
    local v122, v123 = v7.useState(false);
    local v124, v125 = v7.useState(true);
    local v126, v127 = v7.useState("");
    local v128, v129 = v7.useState("");
    local v130, v131 = v7.useState(false);
    local v132, v133 = v7.useState(true);
    local v134, v135 = v7.useState(false);
    local v136, v137 = v7.useState(false);
    local v138 = v7.useRef(nil);
    local v139 = v7.useRef(nil);
    local v140 = v62.useIsIosAuthServiceEnabled();
    local v141 = l_useStyle_0();
    local v142 = l_useTokens_0();
    local v143 = l_useDispatch_0();
    local v144 = v18.useFocusGuiObject();
    local v145 = l_usePreferredInput_0();
    local function _() --[[ Line: 245 ]]
        -- upvalues: v49 (ref)
        v49.setSignupActionRequired("");
        v49.setPasskeySignupUsername("");
        v49.flush();
    end;
    local function _() --[[ Line: 253 ]]
        -- upvalues: v49 (ref), v137 (copy), l_MemStorageService_0 (ref), v52 (ref), v58 (ref)
        local v147 = v49.getAuthenticatedTheme();
        if v147 ~= "" then
            v137(true);
            l_MemStorageService_0:Fire(v52.ThemeUpdate, v147);
        end;
        v58.ClearThemeOverride();
    end;
    local function v149() --[[ Line: 264 ]]
        -- upvalues: v121 (copy), v120 (copy)
        v121(not v120);
    end;
    local function v152(v150, v151) --[[ Line: 268 ]]
        -- upvalues: v127 (copy), v131 (copy), v29 (ref)
        v127(v150);
        v131(v151 == v29.Valid);
    end;
    local function _() --[[ Line: 273 ]]
        -- upvalues: v75 (ref), v128 (copy), v49 (ref), l_Players_0 (ref)
        if v75 and v128 and v128 ~= "" then
            return v128;
        else
            local v153 = v49.getPasskeySignupUsername();
            if v153 and v153 ~= "" then
                return v153;
            elseif l_Players_0.LocalPlayer then
                return l_Players_0.LocalPlayer.Name or "";
            else
                return "";
            end;
        end;
    end;
    local function v171() --[[ Line: 291 ]]
        -- upvalues: v131 (copy), v94 (copy), v15 (ref), v51 (ref), v92 (copy), v126 (copy), v49 (ref), v75 (ref), v128 (copy), l_Players_0 (ref), l_shouldUseV2FallbackScreen_0 (copy), v134 (copy), v140 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v52 (ref), l_HttpService_0 (ref), v88 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v137 (copy), v58 (ref), v143 (copy), v47 (ref), v96 (copy), v95 (copy), v98 (copy), l_LaunchContext_0 (ref), v107 (copy), v108 (copy), v16 (ref), v73 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v141 (copy)
        v131(false);
        v94.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.Continue);
        v51(v92, v126):andThen(function(_) --[[ Line: 299 ]]
            -- upvalues: v49 (ref), v75 (ref), v128 (ref), l_Players_0 (ref), l_shouldUseV2FallbackScreen_0 (ref), v126 (ref), v134 (ref), v140 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v52 (ref), l_HttpService_0 (ref), v94 (ref), v15 (ref), v88 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v137 (ref), v58 (ref), v143 (ref), v47 (ref), v92 (ref), v96 (ref), v95 (ref), v98 (ref), l_LaunchContext_0 (ref), v131 (ref), v107 (ref), v108 (ref), v16 (ref), v73 (ref)
            v49.setSignupActionRequired("");
            v49.setPasskeySignupUsername("");
            v49.flush();
            local v156;
            if v75 and v128 and v128 ~= "" then
                v156 = v128;
            else
                local v157 = v49.getPasskeySignupUsername();
                v156 = if v157 and v157 ~= "" then v157 else if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.Name or "" else "";
            end;
            if l_shouldUseV2FallbackScreen_0 and v156 and v126 then
                local v158 = v134 and v140;
                if not l_FFlagDisableMemStorageServicePasswordEvent_0 and not v158 then
                    l_MemStorageService_0:Fire(v52.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                        cvalue = v156, 
                        password = v126, 
                        authType = "signup"
                    }));
                end;
                if v134 then
                    local v159 = {
                        username = v156, 
                        password = v126
                    };
                    local v160 = l_HttpService_0:JSONEncode(v159);
                    local function v166() --[[ Line: 330 ]]
                        -- upvalues: v94 (ref), v15 (ref), v88 (ref), v156 (copy), l_default_0 (ref), v160 (copy), l_Constants_0 (ref), l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v140 (ref), v49 (ref), v137 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v143 (ref), v47 (ref), v92 (ref), v96 (ref), v95 (ref), v98 (ref), l_LaunchContext_0 (ref), v131 (ref)
                        v94.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordAttempted);
                        v88.reportAttempted(v156);
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v160, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v161) --[[ Line: 342 ]]
                            -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v94 (ref), v15 (ref), v88 (ref), v156 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v140 (ref), v49 (ref), v137 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v143 (ref), v47 (ref), v92 (ref), v96 (ref), v95 (ref), v98 (ref), l_LaunchContext_0 (ref), v131 (ref)
                            local v162 = if v161 then l_HttpService_0:JSONDecode(v161) else {};
                            if v162 and v162.errorCode == nil then
                                l_Logger_0:info("Successfully registered password.");
                                v94.reportAuthButtonClick(v15.Context.CMPasswordPasskeyFallback, v15.Button.SavePassword);
                                v94.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordSuccess);
                                v88.reportSuccess(v156);
                            else
                                if l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                                    l_Logger_0:warning("Error registering password: " .. tostring(v162.errorMsg));
                                else
                                    l_Logger_0:warning("Error registering password: ", v162.errorMsg);
                                end;
                                v94.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordFailure, v162.errorMsg or "unknown");
                                v88.reportFailure(v156, v162.errorMsg or "unknown");
                            end;
                            if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v140 then
                                local v163 = v49.getAuthenticatedTheme();
                                if v163 ~= "" then
                                    v137(true);
                                    l_MemStorageService_0:Fire(v52.ThemeUpdate, v163);
                                end;
                                v58.ClearThemeOverride();
                                v143(v47(v92, v96, v95, v98, l_LaunchContext_0.SignUp));
                                v131(true);
                            end;
                        end, function(v164) --[[ Line: 391 ]]
                            -- upvalues: l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), l_Logger_0 (ref), v94 (ref), v15 (ref), v88 (ref), v156 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v140 (ref), v49 (ref), v137 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v143 (ref), v47 (ref), v92 (ref), v96 (ref), v95 (ref), v98 (ref), l_LaunchContext_0 (ref), v131 (ref)
                            if l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                                l_Logger_0:warning("Error registering password: " .. tostring(v164));
                            else
                                l_Logger_0:warning("Error registering password: ", v164);
                            end;
                            v94.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordFailure, (tostring(v164)));
                            v88.reportFailure(v156, (tostring(v164)));
                            if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v140 then
                                local v165 = v49.getAuthenticatedTheme();
                                if v165 ~= "" then
                                    v137(true);
                                    l_MemStorageService_0:Fire(v52.ThemeUpdate, v165);
                                end;
                                v58.ClearThemeOverride();
                                v143(v47(v92, v96, v95, v98, l_LaunchContext_0.SignUp));
                                v131(true);
                            end;
                        end);
                    end;
                    if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v140 then
                        return v166();
                    else
                        local v167 = nil;
                        if v107 then
                            v167 = v166();
                            v167:await();
                        else
                            v167 = if v108 then v16.delay(v73):andThen(v166) else v166();
                        end;
                        return v167:andThen(function() --[[ Line: 442 ]]
                            -- upvalues: v49 (ref), v137 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v143 (ref), v47 (ref), v92 (ref), v96 (ref), v95 (ref), v98 (ref), l_LaunchContext_0 (ref), v131 (ref)
                            local v168 = v49.getAuthenticatedTheme();
                            if v168 ~= "" then
                                v137(true);
                                l_MemStorageService_0:Fire(v52.ThemeUpdate, v168);
                            end;
                            v58.ClearThemeOverride();
                            v143(v47(v92, v96, v95, v98, l_LaunchContext_0.SignUp));
                            v131(true);
                        end);
                    end;
                else
                    v94.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordSkipped, v15.State.IosAuthServiceProtocolNotAvailable);
                    v88.reportSkipped(v15.State.IosAuthServiceProtocolNotAvailable);
                end;
            end;
            local v169 = v49.getAuthenticatedTheme();
            if v169 ~= "" then
                v137(true);
                l_MemStorageService_0:Fire(v52.ThemeUpdate, v169);
            end;
            v58.ClearThemeOverride();
            v143(v47(v92, v96, v95, v98, l_LaunchContext_0.SignUp));
            v131(true);
            return v16.resolve();
        end, function(_) --[[ Line: 473 ]]
            -- upvalues: v143 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v141 (ref), v131 (ref)
            v143(l_SetCurrentToastMessage_0({
                toastType = l_ToastType_0.NetworkingError, 
                toastMessage = "Authentication.Login.Response.SomethingWentWrong", 
                toastIconColorStyle = {
                    Color = v141.Theme.Alert.Color, 
                    Transparency = 0
                }, 
                slideIn = true
            }));
            v131(true);
        end);
    end;
    local function v175() --[[ Line: 487 ]]
        -- upvalues: v132 (copy), v133 (copy), v94 (copy), v15 (ref), v48 (ref), v92 (copy), v49 (ref), v137 (copy), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v143 (copy), v47 (ref), v96 (copy), v95 (copy), v98 (copy), l_LaunchContext_0 (ref), v16 (ref)
        if not v132 then
            return;
        else
            v133(false);
            v94.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.SetupPasskey);
            return v48(v92):andThen(function(_) --[[ Line: 499 ]]
                -- upvalues: v94 (ref), v15 (ref), v49 (ref), v137 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v143 (ref), v47 (ref), v92 (ref), v96 (ref), v95 (ref), v98 (ref), l_LaunchContext_0 (ref), v16 (ref)
                v94.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, "success");
                v49.setSignupActionRequired("");
                v49.setPasskeySignupUsername("");
                v49.flush();
                local v173 = v49.getAuthenticatedTheme();
                if v173 ~= "" then
                    v137(true);
                    l_MemStorageService_0:Fire(v52.ThemeUpdate, v173);
                end;
                v58.ClearThemeOverride();
                v143(v47(v92, v96, v95, v98, l_LaunchContext_0.SignUp));
                return v16.resolve();
            end, function(v174) --[[ Line: 511 ]]
                -- upvalues: v94 (ref), v15 (ref), v133 (ref), v16 (ref)
                if v174.name then
                    v94.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, v174.name);
                    if type(v174.body) == "string" then
                        v94.reportAuthClientError(v15.Context.SignupPasswordFallbackPasskeyCreated, v174.body, v174.source);
                    end;
                else
                    v94.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, "unknown");
                end;
                v133(true);
                return v16.resolve();
            end);
        end;
    end;
    local function v176() --[[ Line: 538 ]]
        -- upvalues: v94 (copy), v15 (ref), v49 (ref), v143 (copy), v46 (ref), v92 (copy), v93 (copy), v50 (ref)
        v94.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.Close);
        v49.setSignupActionRequired("");
        v49.setPasskeySignupUsername("");
        v49.flush();
        v143(v46(v92, v93, v50.MultiStepSignupCanceled));
    end;
    v7.useEffect(function() --[[ Line: 550 ]]
        -- upvalues: v72 (ref), v138 (copy), v119 (copy), v139 (copy), v145 (copy), v19 (ref), v144 (copy), v94 (copy), v15 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
        if not v72 and v138.current then
            if v119 and v139.current then
                if v145 == v19.Input.Directional then
                    v144(v139.current);
                end;
            else
                v138.current:CaptureFocus();
            end;
        end;
        v94.reportAuthPageload(v15.Context.PasskeySignupPasswordFallback);
        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.AddAuthMethodPageMountTelemetryConfig, 1);
    end, {});
    v7.useEffect(function() --[[ Line: 572 ]]
        -- upvalues: v136 (copy), l_MemStorageService_0 (ref), v52 (ref), v58 (ref)
        if not v136 then
            l_MemStorageService_0:Fire(v52.ThemeUpdate, "dark");
            v58.SetDarkThemeOverride();
        end;
    end, {
        v141
    });
    v7.useEffect(function() --[[ Line: 581 ]]
        -- upvalues: l_shouldUseV2FallbackScreen_0 (copy), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), v94 (copy), v15 (ref), v135 (copy), l_Logger_0 (ref)
        if l_shouldUseV2FallbackScreen_0 then
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v177) --[[ Line: 588 ]]
                -- upvalues: v94 (ref), v15 (ref), v135 (ref)
                local v178 = false;
                if v177.password and v177.password.isAvailable then
                    v178 = true;
                end;
                v94.reportAuthPageload(v15.Context.CMPasswordPasskeySignup, (tostring(v178)));
                v135(v178);
            end):catch(function(v179) --[[ Line: 602 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error checking for available credential types. Error: ", v179);
            end);
        end;
    end, {
        l_shouldUseV2FallbackScreen_0
    });
    v7.useEffect(function() --[[ Line: 608 ]]
        -- upvalues: l_GetUserAppLaunchInfo_0 (ref), v92 (copy), v75 (ref), v129 (copy), v49 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v143 (copy), v46 (ref), l_GuiService_0 (ref), v50 (ref)
        l_GetUserAppLaunchInfo_0(v92):andThen(function(v180) --[[ Line: 609 ]]
            -- upvalues: v75 (ref), v129 (ref), v49 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v143 (ref), v46 (ref), v92 (ref), l_GuiService_0 (ref), v50 (ref)
            local v181 = nil;
            if v180 and v180.responseBody then
                v181 = v180.responseBody.name;
            end;
            if v181 and v181 ~= "" then
                if v75 then
                    v129(v181);
                    return;
                end;
            else
                v49.setSignupActionRequired("");
                v49.setPasskeySignupUsername("");
                v49.flush();
                if l_FFlagAddReasonToEveryLogout_0 then
                    v143(v46(v92, l_GuiService_0, v50.MultiStepSignupResetIncompleteState));
                    return;
                else
                    v143(v46(v92, l_GuiService_0));
                end;
            end;
        end):catch(function(_) --[[ Line: 627 ]]
            -- upvalues: v49 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v143 (ref), v46 (ref), v92 (ref), l_GuiService_0 (ref), v50 (ref)
            v49.setSignupActionRequired("");
            v49.setPasskeySignupUsername("");
            v49.flush();
            if l_FFlagAddReasonToEveryLogout_0 then
                v143(v46(v92, l_GuiService_0, v50.MultiStepSignupResetIncompleteState));
                return;
            else
                v143(v46(v92, l_GuiService_0));
                return;
            end;
        end);
    end, {});
    local v183;
    if v75 and v128 and v128 ~= "" then
        v183 = v128;
    else
        local v184 = v49.getPasskeySignupUsername();
        v183 = if v184 and v184 ~= "" then v184 else if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.Name or "" else "";
    end;
    if v117 and not v122 then
        return (v7.createElement(l_PasskeyUpsellScreen_0, {
            resetNavigationHistory = function(_) --[[ Line: 641 ]] --[[ Name: resetNavigationHistory ]]
                -- upvalues: v94 (copy), v15 (ref), v49 (ref), v137 (copy), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v143 (copy), v47 (ref), v92 (copy), v96 (copy), v95 (copy), v98 (copy), l_LaunchContext_0 (ref)
                v94.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreatedFromEducation, "success");
                v49.setSignupActionRequired("");
                v49.setPasskeySignupUsername("");
                v49.flush();
                local v186 = v49.getAuthenticatedTheme();
                if v186 ~= "" then
                    v137(true);
                    l_MemStorageService_0:Fire(v52.ThemeUpdate, v186);
                end;
                v58.ClearThemeOverride();
                v143(v47(v92, v96, v95, v98, l_LaunchContext_0.SignUp));
            end, 
            onDismiss = function() --[[ Line: 652 ]] --[[ Name: onDismiss ]]
                -- upvalues: v123 (copy)
                v123(true);
            end, 
            source = l_PasskeyUpsellSource_0.AddAuthMethodPage
        }));
    else
        local v187 = v141.Font.BaseSize * v141.Font.Header1.RelativeSize;
        return l_withLocalization_0({
            userGreetingHeaderText = {
                "Authentication.SignUp.Heading.UserGreetingWithName"; 
                username = v183
            }, 
            userGreetingHeaderTextWithPasskeyPassword = {
                "Authentication.SignUp.Heading.UserGreetingWithNameAndPasskeyPassword"; 
                username = v183
            }, 
            userPasswordOnlyGreetingHeaderText = {
                "Authentication.SignUp.Title"; 
                username = v183
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
            secureAccountWithPasskeyText = "Authentication.SignUp.Description.SecureAccountWithPasskeyText"
        })(function(v188) --[[ Line: 680 ]]
            -- upvalues: l_shouldUseV2FallbackScreen_0 (copy), v183 (copy), v118 (copy), v124 (copy), v109 (copy), v111 (copy), v80 (ref), v106 (copy), v110 (copy), v78 (ref), v113 (copy), v7 (ref), l_Button_1 (ref), l_ButtonVariant_0 (ref), v115 (copy), v37 (ref), v175 (copy), v132 (copy), l_InputSize_0 (ref), v139 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_LinkButton_0 (ref), v114 (copy), v116 (copy), v125 (copy), v26 (ref), v101 (copy), v142 (copy), l_DarkTheme_0 (ref), l_ImageSetButton_0 (ref), l_Images_0 (ref), v176 (copy), l_View_0 (ref), l_IconButton_0 (ref), l_IconName_0 (ref), l_ButtonSize_0 (ref), v141 (copy), v187 (copy), v77 (ref), v71 (ref), v36 (ref), v27 (ref), l_game_EngineFeature_0 (ref), v152 (copy), v28 (ref), v120 (copy), v149 (copy), v138 (copy), v171 (copy), v130 (copy), v112 (copy), l_DividerWithText_0 (ref)
            local v189 = nil;
            v189 = if l_shouldUseV2FallbackScreen_0 and v183 then if not v118 or v124 then if v109 then v188.userGreetingHeaderTextWithPasskeyPassword else v188.userGreetingHeaderText else v188.userGreetingHeaderText else v188.oneMoreStepText;
            local v190 = nil;
            v190 = if not v118 or v124 then if v111 then v188.secureAccountWithPasskeyText else v188.createAPasswordText else v188.createAPasswordText;
            if v80() and v106 then
                v189 = v188.userPasswordOnlyGreetingHeaderText;
                v190 = v188.ensureNeverLoseAccountText;
            end;
            local v191 = v110 and "passkeyFirst" or "passwordFirst";
            if v118 then
                v191 = v124 and v110 and "showCreatePasswordButton" or v124 and "showCreatePasswordButtonPasswordFirst" or "showPasswordSectionOnly";
            end;
            local v192 = v78[v191];
            local l_password_0 = v192.password;
            local l_spacing_0 = v192.spacing;
            local l_continue_0 = v192.continue;
            local l_divider_0 = v192.divider;
            local v197 = v192.passkey or if l_shouldUseV2FallbackScreen_0 then v192.passkeyV2 else v192.passkeyNonV2;
            local l_createPasswordButton_0 = v192.createPasswordButton;
            local v199 = nil;
            v199 = if l_shouldUseV2FallbackScreen_0 and v113 then v7.createElement(l_Button_1, {
                LayoutOrder = v197, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v188.createAPasskeyLabel, 
                icon = if v115 then v37.Enums.IconName.Key else nil, 
                onActivated = v175, 
                isDisabled = not v132, 
                size = l_InputSize_0.Large, 
                width = UDim.new(1, 0), 
                buttonRef = v139
            }) else if l_shouldUseV2FallbackScreen_0 then v7.createElement(l_Button_0, {
                layoutOrder = v197, 
                buttonType = l_ButtonType_0.Secondary, 
                text = v188.createAPasskeyLabel, 
                size = UDim2.new(1, 0, 0, 48), 
                onActivated = v175, 
                isDisabled = not v132, 
                buttonRef = v139
            }) else v7.createElement(l_LinkButton_0, {
                layoutOrder = v197, 
                text = v188.setUpPasskeyLabel, 
                onActivated = v175, 
                isDisabled = not v132, 
                buttonRef = v139
            });
            local v200 = l_createPasswordButton_0 and v7.createElement(l_Button_1, {
                LayoutOrder = l_createPasswordButton_0, 
                variant = if v114 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Emphasis, 
                text = v188.createAPasswordButtonText, 
                icon = if v116 then v37.Enums.IconName.LockClosed else nil, 
                onActivated = function() --[[ Line: 767 ]] --[[ Name: onActivated ]]
                    -- upvalues: v125 (ref)
                    v125(false);
                end, 
                size = l_InputSize_0.Large, 
                width = UDim.new(1, 0)
            });
            return v7.createElement(v26, {
                BackgroundTransparency = 0, 
                includeStatusBar = true, 
                BackgroundColor3 = if v101 then v142.Color.Surface.Surface_0.Color3 else l_DarkTheme_0.BackgroundUIDefault.Color
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
                        [v7.Event.Activated] = v176
                    }) else nil, 
                    HeaderBackButton = if not v118 or v124 then nil else v7.createElement(l_View_0, {
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
                            onActivated = function() --[[ Line: 826 ]] --[[ Name: onActivated ]]
                                -- upvalues: v125 (ref)
                                v125(true);
                            end
                        })
                    }), 
                    Title = v7.createElement("TextLabel", {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Text = v188.signUpLabel, 
                        TextWrapped = true, 
                        Font = v141.Font.CaptionHeader.Font, 
                        TextSize = v187, 
                        TextColor3 = l_DarkTheme_0.TextEmphasis.Color, 
                        TextTransparency = l_DarkTheme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Divider = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0.5, 0, 0, 48), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = v101 and 1 or 0, 
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
                        PaddingTop = UDim.new(0, v77)
                    }), 
                    MultiPageSignupText = if v71 then v7.createElement(v36, {
                        layoutOrder = 1, 
                        titleText = v189, 
                        helpText = v190
                    }) else nil, 
                    InstructionsHeadingText = if v71 then nil else v7.createElement("TextLabel", {
                        Text = v189, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = v141.Theme.TextEmphasis.Color, 
                        Font = v141.Font.Header1.Font, 
                        TextSize = 24
                    }, {
                        UIPadding = v7.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 36)
                        })
                    }), 
                    InstructionsHeadingBody = if v71 then nil else v7.createElement("TextLabel", {
                        Text = v190, 
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextColor3 = v141.Theme.TextDefault.Color, 
                        Font = v141.Font.Header2.Font, 
                        TextSize = 14, 
                        TextWrapped = true
                    }, {}), 
                    Spacing = v7.createElement("Frame", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 16)
                    }), 
                    PasswordValidator = if l_password_0 then v7.createElement(v27, {
                        layoutOrder = l_password_0, 
                        titleTextKey = "CommonUI.Messages.Label.Password", 
                        summaryErrorTextKey = "Authentication.SignUp.Label.ErrorsWithPassword", 
                        prerequisiteMet = true, 
                        textInputType = l_game_EngineFeature_0 and Enum.TextInputType.NewPassword or Enum.TextInputType.Password, 
                        onInputTextChanged = v152, 
                        onInputTextValidated = v152, 
                        validator = v28, 
                        validatorAdditionalProps = {
                            username = v183
                        }, 
                        returnKeyType = Enum.ReturnKeyType.Next, 
                        hidePassword = v120, 
                        onToggleCallback = v149, 
                        showDetailedError = true, 
                        textBoxRef = v138
                    }) else nil, 
                    Spacing2 = if l_spacing_0 then v7.createElement("Frame", {
                        LayoutOrder = l_spacing_0, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 8)
                    }) else nil, 
                    ContinueButton = if l_continue_0 then if v114 then v7.createElement(l_Button_1, {
                        LayoutOrder = l_continue_0, 
                        variant = l_ButtonVariant_0.Standard, 
                        text = if l_shouldUseV2FallbackScreen_0 then v188.doneText else v188.continueText, 
                        icon = if v116 then v37.Enums.IconName.LockClosed else nil, 
                        size = l_InputSize_0.Large, 
                        width = UDim.new(1, 0), 
                        onActivated = v171, 
                        isDisabled = not v130
                    }) else v7.createElement(l_Button_0, {
                        layoutOrder = l_continue_0, 
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        text = if l_shouldUseV2FallbackScreen_0 then v188.doneText else v188.continueText, 
                        size = UDim2.new(1, 0, 0, 48), 
                        onActivated = v171, 
                        isDisabled = not v130
                    }) else nil, 
                    DividerWithText = if not (not l_shouldUseV2FallbackScreen_0 or v106 or v112) and l_divider_0 then v7.createElement(l_DividerWithText_0, {
                        layoutOrder = l_divider_0, 
                        width = 0, 
                        height = 0, 
                        size = UDim2.new(1, 0, 0, 32), 
                        font = v141.Font.BodySmall.Font, 
                        fontSize = v141.Font.BaseSize * v141.Font.BodySmall.RelativeSize, 
                        color3 = v141.Theme.TextMuted.Color, 
                        transparency = v141.Theme.TextMuted.Transparency, 
                        text = v188.dividerText, 
                        padding = 8
                    }) else nil, 
                    CreatePasswordButton = v200, 
                    PasskeyButton = if not v106 and v197 then v199 else nil
                })
            });
        end);
    end;
end;