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
local l_GetFFlagEnableSavePasswordAfterRecovery_0 = v66.GetFFlagEnableSavePasswordAfterRecovery;
local l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 = v66.FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment;
local l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 = v66.FFlagEnableSignupFoundationalizeBackgroundAndText;
local v70 = game:DefineFastFlag("UseMultiPageSignupTextOnAddAuthMethodPage", false);
local v71 = game:DefineFastFlag("ShouldSkipPasskeySignupAutoFocus", false);
local v72 = game:DefineFastInt("LuaAppCmPasswordRegistrationDelay", 2);
local v73 = game:DefineFastFlag("PasskeySignupAndroidIterationEnabled", false);
local v74 = game:DefineFastFlag("EnableAuthedUsernameCMFix", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAndroidPasswordSuggestion");
local v76 = v70 and 24 or 60;
local v77 = {
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
local v79 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v80 = require(l_CorePackages_0.Workspace.Packages.PasskeyUpsell);
local l_PasskeyUpsellScreen_0 = v80.Components.PasskeyUpsellScreen;
local l_PasskeyUpsellSource_0 = v80.Enums.PasskeyUpsellSource;
local l_FFlagAddReasonToEveryLogout_0 = v66.FFlagAddReasonToEveryLogout;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v66.FFlagDisableMemStorageServicePasswordEvent;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v87 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.iosAuthServiceSignupPasswordSave);
local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
l_GetTextBoundsParams_0.Text = "_unused";
l_GetTextBoundsParams_0.Font = Font.fromEnum(l_AppFonts_0.default:getDefault());
l_GetTextBoundsParams_0.Size = 19;
l_GetTextBoundsParams_0.Width = 0;
local _ = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
return function(_) --[[ Line: 139 ]]
    -- upvalues: v9 (copy), v10 (copy), l_AppGuiService_0 (copy), v13 (copy), v14 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_useAppPolicy_0 (copy), v60 (copy), l_AppBtidLayers_0 (copy), l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 (copy), v79 (copy), v73 (copy), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (copy), v7 (copy), v62 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), v18 (copy), l_usePreferredInput_0 (copy), v49 (copy), l_MemStorageService_0 (copy), v52 (copy), v58 (copy), v29 (copy), v74 (copy), l_Players_0 (copy), v15 (copy), v51 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), l_HttpService_0 (copy), v87 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_GetFFlagEnableSavePasswordAfterRecovery_0 (copy), v47 (copy), l_LaunchContext_0 (copy), v16 (copy), v72 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), v48 (copy), v46 (copy), v50 (copy), v71 (copy), v19 (copy), l_default_1 (copy), l_TelemetryConfigs_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_GetUserAppLaunchInfo_0 (copy), l_FFlagAddReasonToEveryLogout_0 (copy), l_GuiService_0 (copy), l_PasskeyUpsellScreen_0 (copy), l_PasskeyUpsellSource_0 (copy), l_withLocalization_0 (copy), v77 (copy), l_Button_1 (copy), l_ButtonVariant_0 (copy), v37 (copy), l_InputSize_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_LinkButton_0 (copy), v26 (copy), l_DarkTheme_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_ButtonSize_0 (copy), v76 (copy), v70 (copy), v36 (copy), v27 (copy), l_game_EngineFeature_0 (copy), v28 (copy), l_DividerWithText_0 (copy)
    local v91 = v9(v10);
    local v92 = v9(l_AppGuiService_0);
    local v93 = v9(v13);
    local v94 = v9(v14);
    local v95 = v9(l_AppOmniRecommendationsRequest_0);
    local v97 = l_useAppPolicy_0(function(v96) --[[ Line: 145 ]]
        return v96;
    end);
    local v99 = v60.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AuthenticationStylingLayer
    }, function(v98) --[[ Line: 151 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldUseFoundationBackgroundColor = (v98[l_AppBtidLayers_0.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
        };
    end);
    local v100 = l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 and v99.shouldUseFoundationBackgroundColor;
    local v103 = v60.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.SignupLayer
    }, function(v101) --[[ Line: 163 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        local v102 = v101[l_AppBtidLayers_0.SignupLayer] or {};
        return {
            shouldUseV2FallbackScreen = v102.shouldUseV2FallbackScreen, 
            shouldSuppressPasskeyOnAddAuthMethodPage = v102.shouldSuppressPasskeyOnAddAuthMethodPage, 
            shouldWaitForPasswordRegistration = v102.shouldWaitForPasswordRegistration, 
            shouldDelayPasswordRegistration = v102.shouldDelayPasswordRegistration, 
            showPasskeyNudgingHeader = v102.showPasskeyNudgingHeader, 
            showPasskeyBeforePassword = v102.showPasskeyBeforePassword, 
            showPasskeyNudgingParagraph = v102.showPasskeyNudgingParagraph, 
            shouldRemoveOrDivider = v102.shouldRemoveOrDivider, 
            shouldUsePrimaryPasskeyButton = v102.shouldUsePrimaryPasskeyButton, 
            shouldUseSecondaryPasswordNextButton = v102.shouldUseSecondaryPasswordNextButton, 
            showPasskeyIconOnAddAuthMethodPage = v102.showPasskeyIconOnAddAuthMethodPage, 
            showPasswordLockIconOnAddAuthMethodPage = v102.showPasswordLockIconOnAddAuthMethodPage, 
            showPasskeyEducationalPage = v102.showPasskeyEducationalPage, 
            shouldShowCreateAPasswordButton = v102.shouldShowCreateAPasswordButton, 
            shouldDisablePasswordFocus = v102.shouldDisablePasswordFocus
        };
    end);
    local l_shouldUseV2FallbackScreen_0 = v103.shouldUseV2FallbackScreen;
    local v105 = v79() and v103.shouldSuppressPasskeyOnAddAuthMethodPage;
    local v106 = v73 and v103.shouldWaitForPasswordRegistration;
    local v107 = v73 and v103.shouldDelayPasswordRegistration;
    local v108 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.showPasskeyNudgingHeader;
    local v109 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.showPasskeyBeforePassword;
    local v110 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.showPasskeyNudgingParagraph;
    local v111 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.shouldRemoveOrDivider;
    local v112 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.shouldUsePrimaryPasskeyButton;
    local v113 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.shouldUseSecondaryPasswordNextButton;
    local v114 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.showPasskeyIconOnAddAuthMethodPage;
    local v115 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.showPasswordLockIconOnAddAuthMethodPage;
    local v116 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.showPasskeyEducationalPage;
    local v117 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.shouldShowCreateAPasswordButton;
    local v118 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v103.shouldDisablePasswordFocus;
    local v119, v120 = v7.useState(true);
    local v121, v122 = v7.useState(false);
    local v123, v124 = v7.useState(true);
    local v125, v126 = v7.useState("");
    local v127, v128 = v7.useState("");
    local v129, v130 = v7.useState(false);
    local v131, v132 = v7.useState(true);
    local v133, v134 = v7.useState(false);
    local v135, v136 = v7.useState(false);
    local v137 = v7.useRef(nil);
    local v138 = v7.useRef(nil);
    local v139 = v62.useIsIosAuthServiceEnabled();
    local v140 = l_useStyle_0();
    local v141 = l_useTokens_0();
    local v142 = l_useDispatch_0();
    local v143 = v18.useFocusGuiObject();
    local v144 = l_usePreferredInput_0();
    local function _() --[[ Line: 244 ]]
        -- upvalues: v49 (ref)
        v49.setSignupActionRequired("");
        v49.setPasskeySignupUsername("");
        v49.flush();
    end;
    local function _() --[[ Line: 252 ]]
        -- upvalues: v49 (ref), v136 (copy), l_MemStorageService_0 (ref), v52 (ref), v58 (ref)
        local v146 = v49.getAuthenticatedTheme();
        if v146 ~= "" then
            v136(true);
            l_MemStorageService_0:Fire(v52.ThemeUpdate, v146);
        end;
        v58.ClearThemeOverride();
    end;
    local function v148() --[[ Line: 263 ]]
        -- upvalues: v120 (copy), v119 (copy)
        v120(not v119);
    end;
    local function v151(v149, v150) --[[ Line: 267 ]]
        -- upvalues: v126 (copy), v130 (copy), v29 (ref)
        v126(v149);
        v130(v150 == v29.Valid);
    end;
    local function _() --[[ Line: 272 ]]
        -- upvalues: v74 (ref), v127 (copy), v49 (ref), l_Players_0 (ref)
        if v74 and v127 and v127 ~= "" then
            return v127;
        else
            local v152 = v49.getPasskeySignupUsername();
            if v152 and v152 ~= "" then
                return v152;
            elseif l_Players_0.LocalPlayer then
                return l_Players_0.LocalPlayer.Name or "";
            else
                return "";
            end;
        end;
    end;
    local function v170() --[[ Line: 290 ]]
        -- upvalues: v130 (copy), v93 (copy), v15 (ref), v51 (ref), v91 (copy), v125 (copy), v49 (ref), v74 (ref), v127 (copy), l_Players_0 (ref), l_shouldUseV2FallbackScreen_0 (copy), v133 (copy), v139 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v52 (ref), l_HttpService_0 (ref), v87 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v136 (copy), v58 (ref), v142 (copy), v47 (ref), v95 (copy), v94 (copy), v97 (copy), l_LaunchContext_0 (ref), v106 (copy), v107 (copy), v16 (ref), v72 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v140 (copy)
        v130(false);
        v93.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.Continue);
        v51(v91, v125):andThen(function(_) --[[ Line: 298 ]]
            -- upvalues: v49 (ref), v74 (ref), v127 (ref), l_Players_0 (ref), l_shouldUseV2FallbackScreen_0 (ref), v125 (ref), v133 (ref), v139 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v52 (ref), l_HttpService_0 (ref), v93 (ref), v15 (ref), v87 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v136 (ref), v58 (ref), v142 (ref), v47 (ref), v91 (ref), v95 (ref), v94 (ref), v97 (ref), l_LaunchContext_0 (ref), v130 (ref), v106 (ref), v107 (ref), v16 (ref), v72 (ref)
            v49.setSignupActionRequired("");
            v49.setPasskeySignupUsername("");
            v49.flush();
            local v155;
            if v74 and v127 and v127 ~= "" then
                v155 = v127;
            else
                local v156 = v49.getPasskeySignupUsername();
                v155 = if v156 and v156 ~= "" then v156 else if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.Name or "" else "";
            end;
            if l_shouldUseV2FallbackScreen_0 and v155 and v125 then
                local v157 = v133 and v139;
                if not l_FFlagDisableMemStorageServicePasswordEvent_0 and not v157 then
                    l_MemStorageService_0:Fire(v52.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                        cvalue = v155, 
                        password = v125, 
                        authType = "signup"
                    }));
                end;
                if v133 then
                    local v158 = {
                        username = v155, 
                        password = v125
                    };
                    local v159 = l_HttpService_0:JSONEncode(v158);
                    local function v165() --[[ Line: 329 ]]
                        -- upvalues: v93 (ref), v15 (ref), v87 (ref), v155 (copy), l_default_0 (ref), v159 (copy), l_Constants_0 (ref), l_HttpService_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v139 (ref), v49 (ref), v136 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v142 (ref), v47 (ref), v91 (ref), v95 (ref), v94 (ref), v97 (ref), l_LaunchContext_0 (ref), v130 (ref)
                        v93.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordAttempted);
                        v87.reportAttempted(v155);
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v159, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v160) --[[ Line: 341 ]]
                            -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v93 (ref), v15 (ref), v87 (ref), v155 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v139 (ref), v49 (ref), v136 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v142 (ref), v47 (ref), v91 (ref), v95 (ref), v94 (ref), v97 (ref), l_LaunchContext_0 (ref), v130 (ref)
                            local v161 = if v160 then l_HttpService_0:JSONDecode(v160) else {};
                            if v161 and v161.errorCode == nil then
                                l_Logger_0:info("Successfully registered password.");
                                v93.reportAuthButtonClick(v15.Context.CMPasswordPasskeyFallback, v15.Button.SavePassword);
                                v93.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordSuccess);
                                v87.reportSuccess(v155);
                            else
                                l_Logger_0:warning("Error registering password: " .. tostring(v161.errorMsg));
                                v93.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordFailure, v161.errorMsg or "unknown");
                                v87.reportFailure(v155, v161.errorMsg or "unknown");
                            end;
                            if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v139 then
                                local v162 = v49.getAuthenticatedTheme();
                                if v162 ~= "" then
                                    v136(true);
                                    l_MemStorageService_0:Fire(v52.ThemeUpdate, v162);
                                end;
                                v58.ClearThemeOverride();
                                v142(v47(v91, v95, v94, v97, l_LaunchContext_0.SignUp));
                                v130(true);
                            end;
                        end, function(v163) --[[ Line: 386 ]]
                            -- upvalues: l_Logger_0 (ref), v93 (ref), v15 (ref), v87 (ref), v155 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v139 (ref), v49 (ref), v136 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v142 (ref), v47 (ref), v91 (ref), v95 (ref), v94 (ref), v97 (ref), l_LaunchContext_0 (ref), v130 (ref)
                            l_Logger_0:warning("Error registering password: " .. tostring(v163));
                            v93.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordFailure, (tostring(v163)));
                            v87.reportFailure(v155, (tostring(v163)));
                            if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v139 then
                                local v164 = v49.getAuthenticatedTheme();
                                if v164 ~= "" then
                                    v136(true);
                                    l_MemStorageService_0:Fire(v52.ThemeUpdate, v164);
                                end;
                                v58.ClearThemeOverride();
                                v142(v47(v91, v95, v94, v97, l_LaunchContext_0.SignUp));
                                v130(true);
                            end;
                        end);
                    end;
                    if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v139 then
                        return v165();
                    else
                        local v166 = nil;
                        if v106 then
                            v166 = v165();
                            v166:await();
                        else
                            v166 = if v107 then v16.delay(v72):andThen(v165) else v165();
                        end;
                        return v166:andThen(function() --[[ Line: 433 ]]
                            -- upvalues: v49 (ref), v136 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v142 (ref), v47 (ref), v91 (ref), v95 (ref), v94 (ref), v97 (ref), l_LaunchContext_0 (ref), v130 (ref)
                            local v167 = v49.getAuthenticatedTheme();
                            if v167 ~= "" then
                                v136(true);
                                l_MemStorageService_0:Fire(v52.ThemeUpdate, v167);
                            end;
                            v58.ClearThemeOverride();
                            v142(v47(v91, v95, v94, v97, l_LaunchContext_0.SignUp));
                            v130(true);
                        end);
                    end;
                else
                    v93.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordSkipped, v15.State.IosAuthServiceProtocolNotAvailable);
                    v87.reportSkipped(v15.State.IosAuthServiceProtocolNotAvailable);
                end;
            end;
            local v168 = v49.getAuthenticatedTheme();
            if v168 ~= "" then
                v136(true);
                l_MemStorageService_0:Fire(v52.ThemeUpdate, v168);
            end;
            v58.ClearThemeOverride();
            v142(v47(v91, v95, v94, v97, l_LaunchContext_0.SignUp));
            v130(true);
            return v16.resolve();
        end, function(_) --[[ Line: 464 ]]
            -- upvalues: v142 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v140 (ref), v130 (ref)
            v142(l_SetCurrentToastMessage_0({
                toastType = l_ToastType_0.NetworkingError, 
                toastMessage = "Authentication.Login.Response.SomethingWentWrong", 
                toastIconColorStyle = {
                    Color = v140.Theme.Alert.Color, 
                    Transparency = 0
                }, 
                slideIn = true
            }));
            v130(true);
        end);
    end;
    local function v174() --[[ Line: 478 ]]
        -- upvalues: v131 (copy), v132 (copy), v93 (copy), v15 (ref), v48 (ref), v91 (copy), v49 (ref), v136 (copy), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v142 (copy), v47 (ref), v95 (copy), v94 (copy), v97 (copy), l_LaunchContext_0 (ref), v16 (ref)
        if not v131 then
            return;
        else
            v132(false);
            v93.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.SetupPasskey);
            return v48(v91):andThen(function(_) --[[ Line: 490 ]]
                -- upvalues: v93 (ref), v15 (ref), v49 (ref), v136 (ref), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v142 (ref), v47 (ref), v91 (ref), v95 (ref), v94 (ref), v97 (ref), l_LaunchContext_0 (ref), v16 (ref)
                v93.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, "success");
                v49.setSignupActionRequired("");
                v49.setPasskeySignupUsername("");
                v49.flush();
                local v172 = v49.getAuthenticatedTheme();
                if v172 ~= "" then
                    v136(true);
                    l_MemStorageService_0:Fire(v52.ThemeUpdate, v172);
                end;
                v58.ClearThemeOverride();
                v142(v47(v91, v95, v94, v97, l_LaunchContext_0.SignUp));
                return v16.resolve();
            end, function(v173) --[[ Line: 502 ]]
                -- upvalues: v93 (ref), v15 (ref), v132 (ref), v16 (ref)
                if v173.name then
                    v93.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, v173.name);
                    if type(v173.body) == "string" then
                        v93.reportAuthClientError(v15.Context.SignupPasswordFallbackPasskeyCreated, v173.body, v173.source);
                    end;
                else
                    v93.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, "unknown");
                end;
                v132(true);
                return v16.resolve();
            end);
        end;
    end;
    local function v175() --[[ Line: 529 ]]
        -- upvalues: v93 (copy), v15 (ref), v49 (ref), v142 (copy), v46 (ref), v91 (copy), v92 (copy), v50 (ref)
        v93.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.Close);
        v49.setSignupActionRequired("");
        v49.setPasskeySignupUsername("");
        v49.flush();
        v142(v46(v91, v92, v50.MultiStepSignupCanceled));
    end;
    v7.useEffect(function() --[[ Line: 541 ]]
        -- upvalues: v71 (ref), v137 (copy), v118 (copy), v138 (copy), v144 (copy), v19 (ref), v143 (copy), v93 (copy), v15 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
        if not v71 and v137.current then
            if v118 and v138.current then
                if v144 == v19.Input.Directional then
                    v143(v138.current);
                end;
            else
                v137.current:CaptureFocus();
            end;
        end;
        v93.reportAuthPageload(v15.Context.PasskeySignupPasswordFallback);
        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.AddAuthMethodPageMountTelemetryConfig, 1);
    end, {});
    v7.useEffect(function() --[[ Line: 563 ]]
        -- upvalues: v135 (copy), l_MemStorageService_0 (ref), v52 (ref), v58 (ref)
        if not v135 then
            l_MemStorageService_0:Fire(v52.ThemeUpdate, "dark");
            v58.SetDarkThemeOverride();
        end;
    end, {
        v140
    });
    v7.useEffect(function() --[[ Line: 572 ]]
        -- upvalues: l_shouldUseV2FallbackScreen_0 (copy), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), v93 (copy), v15 (ref), v134 (copy), l_Logger_0 (ref)
        if l_shouldUseV2FallbackScreen_0 then
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v176) --[[ Line: 579 ]]
                -- upvalues: v93 (ref), v15 (ref), v134 (ref)
                local v177 = false;
                if v176.password and v176.password.isAvailable then
                    v177 = true;
                end;
                v93.reportAuthPageload(v15.Context.CMPasswordPasskeySignup, (tostring(v177)));
                v134(v177);
            end):catch(function(v178) --[[ Line: 593 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error checking for available credential types. Error: ", v178);
            end);
        end;
    end, {
        l_shouldUseV2FallbackScreen_0
    });
    v7.useEffect(function() --[[ Line: 599 ]]
        -- upvalues: l_GetUserAppLaunchInfo_0 (ref), v91 (copy), v74 (ref), v128 (copy), v49 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v142 (copy), v46 (ref), l_GuiService_0 (ref), v50 (ref)
        l_GetUserAppLaunchInfo_0(v91):andThen(function(v179) --[[ Line: 600 ]]
            -- upvalues: v74 (ref), v128 (ref), v49 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v142 (ref), v46 (ref), v91 (ref), l_GuiService_0 (ref), v50 (ref)
            local v180 = nil;
            if v179 and v179.responseBody then
                v180 = v179.responseBody.name;
            end;
            if v180 and v180 ~= "" then
                if v74 then
                    v128(v180);
                    return;
                end;
            else
                v49.setSignupActionRequired("");
                v49.setPasskeySignupUsername("");
                v49.flush();
                if l_FFlagAddReasonToEveryLogout_0 then
                    v142(v46(v91, l_GuiService_0, v50.MultiStepSignupResetIncompleteState));
                    return;
                else
                    v142(v46(v91, l_GuiService_0));
                end;
            end;
        end):catch(function(_) --[[ Line: 618 ]]
            -- upvalues: v49 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v142 (ref), v46 (ref), v91 (ref), l_GuiService_0 (ref), v50 (ref)
            v49.setSignupActionRequired("");
            v49.setPasskeySignupUsername("");
            v49.flush();
            if l_FFlagAddReasonToEveryLogout_0 then
                v142(v46(v91, l_GuiService_0, v50.MultiStepSignupResetIncompleteState));
                return;
            else
                v142(v46(v91, l_GuiService_0));
                return;
            end;
        end);
    end, {});
    local v182;
    if v74 and v127 and v127 ~= "" then
        v182 = v127;
    else
        local v183 = v49.getPasskeySignupUsername();
        v182 = if v183 and v183 ~= "" then v183 else if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.Name or "" else "";
    end;
    if v116 and not v121 then
        return (v7.createElement(l_PasskeyUpsellScreen_0, {
            resetNavigationHistory = function(_) --[[ Line: 632 ]] --[[ Name: resetNavigationHistory ]]
                -- upvalues: v93 (copy), v15 (ref), v49 (ref), v136 (copy), l_MemStorageService_0 (ref), v52 (ref), v58 (ref), v142 (copy), v47 (ref), v91 (copy), v95 (copy), v94 (copy), v97 (copy), l_LaunchContext_0 (ref)
                v93.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreatedFromEducation, "success");
                v49.setSignupActionRequired("");
                v49.setPasskeySignupUsername("");
                v49.flush();
                local v185 = v49.getAuthenticatedTheme();
                if v185 ~= "" then
                    v136(true);
                    l_MemStorageService_0:Fire(v52.ThemeUpdate, v185);
                end;
                v58.ClearThemeOverride();
                v142(v47(v91, v95, v94, v97, l_LaunchContext_0.SignUp));
            end, 
            onDismiss = function() --[[ Line: 643 ]] --[[ Name: onDismiss ]]
                -- upvalues: v122 (copy)
                v122(true);
            end, 
            source = l_PasskeyUpsellSource_0.AddAuthMethodPage
        }));
    else
        local v186 = v140.Font.BaseSize * v140.Font.Header1.RelativeSize;
        return l_withLocalization_0({
            userGreetingHeaderText = {
                "Authentication.SignUp.Heading.UserGreetingWithName"; 
                username = v182
            }, 
            userGreetingHeaderTextWithPasskeyPassword = {
                "Authentication.SignUp.Heading.UserGreetingWithNameAndPasskeyPassword"; 
                username = v182
            }, 
            userPasswordOnlyGreetingHeaderText = {
                "Authentication.SignUp.Title"; 
                username = v182
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
        })(function(v187) --[[ Line: 671 ]]
            -- upvalues: l_shouldUseV2FallbackScreen_0 (copy), v182 (copy), v117 (copy), v123 (copy), v108 (copy), v110 (copy), v79 (ref), v105 (copy), v109 (copy), v77 (ref), v112 (copy), v7 (ref), l_Button_1 (ref), l_ButtonVariant_0 (ref), v114 (copy), v37 (ref), v174 (copy), v131 (copy), l_InputSize_0 (ref), v138 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_LinkButton_0 (ref), v113 (copy), v115 (copy), v124 (copy), v26 (ref), v100 (copy), v141 (copy), l_DarkTheme_0 (ref), l_ImageSetButton_0 (ref), l_Images_0 (ref), v175 (copy), l_View_0 (ref), l_IconButton_0 (ref), l_IconName_0 (ref), l_ButtonSize_0 (ref), v140 (copy), v186 (copy), v76 (ref), v70 (ref), v36 (ref), v27 (ref), l_game_EngineFeature_0 (ref), v151 (copy), v28 (ref), v119 (copy), v148 (copy), v137 (copy), v170 (copy), v129 (copy), v111 (copy), l_DividerWithText_0 (ref)
            local v188 = nil;
            v188 = if l_shouldUseV2FallbackScreen_0 and v182 then if not v117 or v123 then if v108 then v187.userGreetingHeaderTextWithPasskeyPassword else v187.userGreetingHeaderText else v187.userGreetingHeaderText else v187.oneMoreStepText;
            local v189 = nil;
            v189 = if not v117 or v123 then if v110 then v187.secureAccountWithPasskeyText else v187.createAPasswordText else v187.createAPasswordText;
            if v79() and v105 then
                v188 = v187.userPasswordOnlyGreetingHeaderText;
                v189 = v187.ensureNeverLoseAccountText;
            end;
            local v190 = v109 and "passkeyFirst" or "passwordFirst";
            if v117 then
                v190 = v123 and v109 and "showCreatePasswordButton" or v123 and "showCreatePasswordButtonPasswordFirst" or "showPasswordSectionOnly";
            end;
            local v191 = v77[v190];
            local l_password_0 = v191.password;
            local l_spacing_0 = v191.spacing;
            local l_continue_0 = v191.continue;
            local l_divider_0 = v191.divider;
            local v196 = v191.passkey or if l_shouldUseV2FallbackScreen_0 then v191.passkeyV2 else v191.passkeyNonV2;
            local l_createPasswordButton_0 = v191.createPasswordButton;
            local v198 = nil;
            v198 = if l_shouldUseV2FallbackScreen_0 and v112 then v7.createElement(l_Button_1, {
                LayoutOrder = v196, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v187.createAPasskeyLabel, 
                icon = if v114 then v37.Enums.IconName.Key else nil, 
                onActivated = v174, 
                isDisabled = not v131, 
                size = l_InputSize_0.Large, 
                width = UDim.new(1, 0), 
                buttonRef = v138
            }) else if l_shouldUseV2FallbackScreen_0 then v7.createElement(l_Button_0, {
                layoutOrder = v196, 
                buttonType = l_ButtonType_0.Secondary, 
                text = v187.createAPasskeyLabel, 
                size = UDim2.new(1, 0, 0, 48), 
                onActivated = v174, 
                isDisabled = not v131, 
                buttonRef = v138
            }) else v7.createElement(l_LinkButton_0, {
                layoutOrder = v196, 
                text = v187.setUpPasskeyLabel, 
                onActivated = v174, 
                isDisabled = not v131, 
                buttonRef = v138
            });
            local v199 = l_createPasswordButton_0 and v7.createElement(l_Button_1, {
                LayoutOrder = l_createPasswordButton_0, 
                variant = if v113 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Emphasis, 
                text = v187.createAPasswordButtonText, 
                icon = if v115 then v37.Enums.IconName.LockClosed else nil, 
                onActivated = function() --[[ Line: 758 ]] --[[ Name: onActivated ]]
                    -- upvalues: v124 (ref)
                    v124(false);
                end, 
                size = l_InputSize_0.Large, 
                width = UDim.new(1, 0)
            });
            return v7.createElement(v26, {
                BackgroundTransparency = 0, 
                includeStatusBar = true, 
                BackgroundColor3 = if v100 then v141.Color.Surface.Surface_0.Color3 else l_DarkTheme_0.BackgroundUIDefault.Color
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
                        [v7.Event.Activated] = v175
                    }) else nil, 
                    HeaderBackButton = if not v117 or v123 then nil else v7.createElement(l_View_0, {
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
                            onActivated = function() --[[ Line: 817 ]] --[[ Name: onActivated ]]
                                -- upvalues: v124 (ref)
                                v124(true);
                            end
                        })
                    }), 
                    Title = v7.createElement("TextLabel", {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Text = v187.signUpLabel, 
                        TextWrapped = true, 
                        Font = v140.Font.CaptionHeader.Font, 
                        TextSize = v186, 
                        TextColor3 = l_DarkTheme_0.TextEmphasis.Color, 
                        TextTransparency = l_DarkTheme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Divider = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0.5, 0, 0, 48), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = v100 and 1 or 0, 
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
                        PaddingTop = UDim.new(0, v76)
                    }), 
                    MultiPageSignupText = if v70 then v7.createElement(v36, {
                        layoutOrder = 1, 
                        titleText = v188, 
                        helpText = v189
                    }) else nil, 
                    InstructionsHeadingText = if v70 then nil else v7.createElement("TextLabel", {
                        Text = v188, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = v140.Theme.TextEmphasis.Color, 
                        Font = v140.Font.Header1.Font, 
                        TextSize = 24
                    }, {
                        UIPadding = v7.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 36)
                        })
                    }), 
                    InstructionsHeadingBody = if v70 then nil else v7.createElement("TextLabel", {
                        Text = v189, 
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextColor3 = v140.Theme.TextDefault.Color, 
                        Font = v140.Font.Header2.Font, 
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
                        onInputTextChanged = v151, 
                        onInputTextValidated = v151, 
                        validator = v28, 
                        validatorAdditionalProps = {
                            username = v182
                        }, 
                        returnKeyType = Enum.ReturnKeyType.Next, 
                        hidePassword = v119, 
                        onToggleCallback = v148, 
                        showDetailedError = true, 
                        textBoxRef = v137
                    }) else nil, 
                    Spacing2 = if l_spacing_0 then v7.createElement("Frame", {
                        LayoutOrder = l_spacing_0, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 8)
                    }) else nil, 
                    ContinueButton = if l_continue_0 then if v113 then v7.createElement(l_Button_1, {
                        LayoutOrder = l_continue_0, 
                        variant = l_ButtonVariant_0.Standard, 
                        text = if l_shouldUseV2FallbackScreen_0 then v187.doneText else v187.continueText, 
                        icon = if v115 then v37.Enums.IconName.LockClosed else nil, 
                        size = l_InputSize_0.Large, 
                        width = UDim.new(1, 0), 
                        onActivated = v170, 
                        isDisabled = not v129
                    }) else v7.createElement(l_Button_0, {
                        layoutOrder = l_continue_0, 
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        text = if l_shouldUseV2FallbackScreen_0 then v187.doneText else v187.continueText, 
                        size = UDim2.new(1, 0, 0, 48), 
                        onActivated = v170, 
                        isDisabled = not v129
                    }) else nil, 
                    DividerWithText = if not (not l_shouldUseV2FallbackScreen_0 or v105 or v111) and l_divider_0 then v7.createElement(l_DividerWithText_0, {
                        layoutOrder = l_divider_0, 
                        width = 0, 
                        height = 0, 
                        size = UDim2.new(1, 0, 0, 32), 
                        font = v140.Font.BodySmall.Font, 
                        fontSize = v140.Font.BaseSize * v140.Font.BodySmall.RelativeSize, 
                        color3 = v140.Theme.TextMuted.Color, 
                        transparency = v140.Theme.TextMuted.Transparency, 
                        text = v187.dividerText, 
                        padding = 8
                    }) else nil, 
                    CreatePasswordButton = v199, 
                    PasskeyButton = if not v105 and v196 then v198 else nil
                })
            });
        end);
    end;
end;