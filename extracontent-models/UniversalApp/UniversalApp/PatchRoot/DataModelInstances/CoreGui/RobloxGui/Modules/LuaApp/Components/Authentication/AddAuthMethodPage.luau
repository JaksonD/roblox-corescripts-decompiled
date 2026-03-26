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
local v40 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_1 = v40.Button;
local l_ButtonVariant_0 = v40.Enums.ButtonVariant;
local l_ButtonSize_0 = v40.Enums.ButtonSize;
local l_InputSize_0 = v40.Enums.InputSize;
local l_IconName_0 = v40.Enums.IconName;
local l_IconButton_0 = v40.IconButton;
local l_View_0 = v40.View;
local l_useTokens_0 = v40.Hooks.useTokens;
local v49 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v50 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v51 = require(l_Modules_0.LuaApp.Thunks.Authentication.RegisterPasskey);
local v52 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v53 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v54 = require(l_Modules_0.LuaApp.Thunks.Authentication.SetPassword);
local v55 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v56 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.UpdateUserEmail);
local v57 = require(l_Modules_0.LuaApp.Util.isStringEmail);
local v58 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v59 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol);
local l_Constants_0 = v59.Constants;
local l_default_0 = v59.CredentialsProtocol.default;
local l_GetUserAppLaunchInfo_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Http.Requests.GetUserAppLaunchInfo;
local l_LaunchContext_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).Enums.LaunchContext;
local v64 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v66 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v68 = require(l_Modules_0.LuaApp.Experiment.IosAuthServiceExperiment);
local v69 = require(l_CorePackages_0.Workspace.Packages.ToastRodux);
local l_SetCurrentToastMessage_0 = v69.Actions.SetCurrentToastMessage;
local l_ToastType_0 = v69.Enums.ToastType;
local v72 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagEnableSavePasswordAfterRecovery_0 = v72.GetFFlagEnableSavePasswordAfterRecovery;
local l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 = v72.FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment;
local l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 = v72.FFlagEnableSignupFoundationalizeBackgroundAndText;
local l_FFlagEnableAddAuthMethodPageEmailSignup_0 = v72.FFlagEnableAddAuthMethodPageEmailSignup;
local l_FFlagEnableAddAuthMethodPageEmailSignupParentText_0 = v72.FFlagEnableAddAuthMethodPageEmailSignupParentText;
local v78 = game:DefineFastFlag("UseMultiPageSignupTextOnAddAuthMethodPage", false);
local v79 = game:DefineFastFlag("ShouldSkipPasskeySignupAutoFocus", false);
local v80 = game:DefineFastInt("LuaAppCmPasswordRegistrationDelay", 2);
local v81 = game:DefineFastFlag("PasskeySignupAndroidIterationEnabled", false);
local v82 = game:DefineFastFlag("EnableAuthedUsernameCMFix", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAndroidPasswordSuggestion");
local v84 = game:DefineFastFlag("AddAuthMethodUpdatedText", false);
local v85 = game:DefineFastString("AddAuthMethodEmailPlaceholder", "example@email.com");
local v86 = v78 and 24 or 60;
local v87 = {
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
local v89 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v90 = require(l_CorePackages_0.Workspace.Packages.PasskeyUpsell);
local l_PasskeyUpsellScreen_0 = v90.Components.PasskeyUpsellScreen;
local l_PasskeyUpsellSource_0 = v90.Enums.PasskeyUpsellSource;
local l_FFlagAddReasonToEveryLogout_0 = v72.FFlagAddReasonToEveryLogout;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v72.FFlagDisableMemStorageServicePasswordEvent;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v97 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.iosAuthServiceSignupPasswordSave);
local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
l_GetTextBoundsParams_0.Text = "_unused";
l_GetTextBoundsParams_0.Font = Font.fromEnum(l_AppFonts_0.default:getDefault());
l_GetTextBoundsParams_0.Size = 19;
l_GetTextBoundsParams_0.Width = 0;
local _ = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
return function(_) --[[ Line: 150 ]]
    -- upvalues: v9 (copy), v10 (copy), l_AppGuiService_0 (copy), v13 (copy), v14 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_useAppPolicy_0 (copy), v7 (copy), v66 (copy), l_AppBtidLayers_0 (copy), l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 (copy), v89 (copy), v81 (copy), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (copy), l_FFlagEnableAddAuthMethodPageEmailSignup_0 (copy), l_FFlagEnableAddAuthMethodPageEmailSignupParentText_0 (copy), v68 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), v18 (copy), l_usePreferredInput_0 (copy), v52 (copy), l_MemStorageService_0 (copy), v58 (copy), v64 (copy), v29 (copy), v57 (copy), v82 (copy), l_Players_0 (copy), v15 (copy), v56 (copy), v50 (copy), l_LaunchContext_0 (copy), v54 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), l_HttpService_0 (copy), v97 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_GetFFlagEnableSavePasswordAfterRecovery_0 (copy), v16 (copy), v80 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), v51 (copy), v49 (copy), v53 (copy), v79 (copy), v19 (copy), l_default_1 (copy), l_TelemetryConfigs_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_GetUserAppLaunchInfo_0 (copy), v55 (copy), l_FFlagAddReasonToEveryLogout_0 (copy), l_GuiService_0 (copy), l_PasskeyUpsellScreen_0 (copy), l_PasskeyUpsellSource_0 (copy), l_withLocalization_0 (copy), v84 (copy), v87 (copy), l_Button_1 (copy), l_ButtonVariant_0 (copy), v40 (copy), l_InputSize_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_LinkButton_0 (copy), v26 (copy), l_DarkTheme_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_ButtonSize_0 (copy), v86 (copy), v78 (copy), v39 (copy), v27 (copy), l_game_EngineFeature_0 (copy), v28 (copy), l_TextInputBoxWithBorder_0 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), v85 (copy), l_DividerWithText_0 (copy)
    local v101 = v9(v10);
    local v102 = v9(l_AppGuiService_0);
    local v103 = v9(v13);
    local v104 = v9(v14);
    local v105 = v9(l_AppOmniRecommendationsRequest_0);
    local v107 = l_useAppPolicy_0(function(v106) --[[ Line: 156 ]]
        return v106;
    end);
    local v108, v109 = v7.useState(true);
    local v111 = v66.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AuthenticationStylingLayer
    }, function(v110) --[[ Line: 164 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldUseFoundationBackgroundColor = (v110[l_AppBtidLayers_0.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
        };
    end);
    local v112 = l_FFlagEnableSignupFoundationalizeBackgroundAndText_0 and v111.shouldUseFoundationBackgroundColor;
    local v115 = v66.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.SignupLayer
    }, function(v113) --[[ Line: 176 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        local v114 = v113[l_AppBtidLayers_0.SignupLayer] or {};
        return {
            shouldUseV2FallbackScreen = v114.shouldUseV2FallbackScreen, 
            shouldSuppressPasskeyOnAddAuthMethodPage = v114.shouldSuppressPasskeyOnAddAuthMethodPage, 
            shouldWaitForPasswordRegistration = v114.shouldWaitForPasswordRegistration, 
            shouldDelayPasswordRegistration = v114.shouldDelayPasswordRegistration, 
            showPasskeyNudgingHeader = v114.showPasskeyNudgingHeader, 
            showPasskeyBeforePassword = v114.showPasskeyBeforePassword, 
            showPasskeyNudgingParagraph = v114.showPasskeyNudgingParagraph, 
            shouldRemoveOrDivider = v114.shouldRemoveOrDivider, 
            shouldUsePrimaryPasskeyButton = v114.shouldUsePrimaryPasskeyButton, 
            shouldUseSecondaryPasswordNextButton = v114.shouldUseSecondaryPasswordNextButton, 
            showPasskeyIconOnAddAuthMethodPage = v114.showPasskeyIconOnAddAuthMethodPage, 
            showPasswordLockIconOnAddAuthMethodPage = v114.showPasswordLockIconOnAddAuthMethodPage, 
            showPasskeyEducationalPage = v114.showPasskeyEducationalPage, 
            shouldShowCreateAPasswordButton = v114.shouldShowCreateAPasswordButton, 
            shouldDisablePasswordFocus = v114.shouldDisablePasswordFocus, 
            shouldShowEmailSignup = v114.shouldShowEmailSignup
        };
    end);
    local l_shouldUseV2FallbackScreen_0 = v115.shouldUseV2FallbackScreen;
    local v117 = v89() and v115.shouldSuppressPasskeyOnAddAuthMethodPage;
    local v118 = v81 and v115.shouldWaitForPasswordRegistration;
    local v119 = v81 and v115.shouldDelayPasswordRegistration;
    local v120 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.showPasskeyNudgingHeader;
    local v121 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.showPasskeyBeforePassword;
    local v122 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.showPasskeyNudgingParagraph;
    local v123 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.shouldRemoveOrDivider;
    local v124 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.shouldUsePrimaryPasskeyButton;
    local v125 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.shouldUseSecondaryPasswordNextButton;
    local v126 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.showPasskeyIconOnAddAuthMethodPage;
    local v127 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.showPasswordLockIconOnAddAuthMethodPage;
    local v128 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.showPasskeyEducationalPage;
    local v129 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.shouldShowCreateAPasswordButton;
    local v130 = l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v115.shouldDisablePasswordFocus;
    local v131 = l_FFlagEnableAddAuthMethodPageEmailSignup_0 and v115.shouldShowEmailSignup and (l_FFlagEnableAddAuthMethodPageEmailSignupParentText_0 or not v108);
    local v132, v133 = v7.useState(true);
    local v134, v135 = v7.useState(false);
    local v136, v137 = v7.useState(true);
    local v138, v139 = v7.useState("");
    local v140, v141 = v7.useState("");
    local v142, v143 = v7.useState("");
    local v144, v145 = v7.useState(false);
    local v146, v147 = v7.useState("");
    local v148, v149 = v7.useState(false);
    local v150, v151 = v7.useState(true);
    local v152, v153 = v7.useState(false);
    local v154, v155 = v7.useState(false);
    local v156 = v7.useRef(nil);
    local v157 = v7.useRef(nil);
    local v158 = v68.useIsIosAuthServiceEnabled();
    local v159 = l_useStyle_0();
    local v160 = l_useTokens_0();
    local v161 = l_useDispatch_0();
    local v162 = v18.useFocusGuiObject();
    local v163 = l_usePreferredInput_0();
    local function _() --[[ Line: 264 ]]
        -- upvalues: v52 (ref)
        v52.setSignupActionRequired("");
        v52.setPasskeySignupUsername("");
        v52.flush();
    end;
    local function _() --[[ Line: 272 ]]
        -- upvalues: v52 (ref), v155 (copy), l_MemStorageService_0 (ref), v58 (ref), v64 (ref)
        local v165 = v52.getAuthenticatedTheme();
        if v165 ~= "" then
            v155(true);
            l_MemStorageService_0:Fire(v58.ThemeUpdate, v165);
        end;
        v64.ClearThemeOverride();
    end;
    local function v167() --[[ Line: 283 ]]
        -- upvalues: v133 (copy), v132 (copy)
        v133(not v132);
    end;
    local function v170(v168, v169) --[[ Line: 287 ]]
        -- upvalues: v139 (copy), v149 (copy), v29 (ref)
        v139(v168);
        v149(v169 == v29.Valid);
    end;
    local function v174(v171) --[[ Line: 292 ]]
        -- upvalues: v141 (copy), v57 (ref), v143 (copy), v145 (copy), v149 (copy)
        local l_Text_0 = v171.Text;
        v141(l_Text_0);
        local v173 = v57((tostring(l_Text_0)));
        if v173 or l_Text_0 == "" then
            v143("");
            v145(false);
        else
            v143("");
            v145(true);
        end;
        v149(v173);
    end;
    local function _() --[[ Line: 306 ]]
        -- upvalues: v82 (ref), v146 (copy), v52 (ref), l_Players_0 (ref)
        if v82 and v146 and v146 ~= "" then
            return v146;
        else
            local v175 = v52.getPasskeySignupUsername();
            if v175 and v175 ~= "" then
                return v175;
            elseif l_Players_0.LocalPlayer then
                return l_Players_0.LocalPlayer.Name or "";
            else
                return "";
            end;
        end;
    end;
    local function v196() --[[ Line: 324 ]]
        -- upvalues: v149 (copy), v103 (copy), v15 (ref), v131 (copy), v161 (copy), v56 (ref), v101 (copy), v140 (copy), v52 (ref), v155 (copy), l_MemStorageService_0 (ref), v58 (ref), v64 (ref), v50 (ref), v105 (copy), v104 (copy), v107 (copy), l_LaunchContext_0 (ref), v143 (copy), v145 (copy), v54 (ref), v138 (copy), v82 (ref), v146 (copy), l_Players_0 (ref), l_shouldUseV2FallbackScreen_0 (copy), v152 (copy), v158 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_HttpService_0 (ref), v97 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v118 (copy), v119 (copy), v16 (ref), v80 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v159 (copy)
        v149(false);
        v103.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.Continue);
        if v131 then
            v103.reportAuthButtonClick(v15.Context.SignupEmailOnAddAuthMethod, v15.Button.SubmitEmail);
            v161(v56(v101, v140, nil)):andThen(function() --[[ Line: 338 ]]
                -- upvalues: v103 (ref), v15 (ref), v52 (ref), v155 (ref), l_MemStorageService_0 (ref), v58 (ref), v64 (ref), v161 (ref), v50 (ref), v101 (ref), v105 (ref), v104 (ref), v107 (ref), l_LaunchContext_0 (ref), v149 (ref)
                v103.reportAuthModalShown(v15.Context.SignupEmailOnAddAuthMethod, v15.State.Success);
                v52.setSignupActionRequired("");
                v52.setPasskeySignupUsername("");
                v52.flush();
                local v177 = v52.getAuthenticatedTheme();
                if v177 ~= "" then
                    v155(true);
                    l_MemStorageService_0:Fire(v58.ThemeUpdate, v177);
                end;
                v64.ClearThemeOverride();
                v161(v50(v101, v105, v104, v107, l_LaunchContext_0.SignUp));
                v149(true);
            end, function(v178) --[[ Line: 350 ]]
                -- upvalues: v103 (ref), v15 (ref), v143 (ref), v145 (ref), v149 (ref)
                local v179 = v178 and v178.Message and v178.Message ~= "" and v178.Message or "";
                v103.reportAuthClientError(v15.Context.SignupEmailOnAddAuthMethod, v179);
                v143(v179);
                v145(true);
                v149(true);
            end);
            return;
        else
            v54(v101, v138):andThen(function(_) --[[ Line: 363 ]]
                -- upvalues: v52 (ref), v82 (ref), v146 (ref), l_Players_0 (ref), l_shouldUseV2FallbackScreen_0 (ref), v138 (ref), v152 (ref), v158 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), l_HttpService_0 (ref), v103 (ref), v15 (ref), v97 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v155 (ref), v64 (ref), v161 (ref), v50 (ref), v101 (ref), v105 (ref), v104 (ref), v107 (ref), l_LaunchContext_0 (ref), v149 (ref), v118 (ref), v119 (ref), v16 (ref), v80 (ref)
                v52.setSignupActionRequired("");
                v52.setPasskeySignupUsername("");
                v52.flush();
                local v181;
                if v82 and v146 and v146 ~= "" then
                    v181 = v146;
                else
                    local v182 = v52.getPasskeySignupUsername();
                    v181 = if v182 and v182 ~= "" then v182 else if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.Name or "" else "";
                end;
                if l_shouldUseV2FallbackScreen_0 and v181 and v138 then
                    local v183 = v152 and v158;
                    if not l_FFlagDisableMemStorageServicePasswordEvent_0 and not v183 then
                        l_MemStorageService_0:Fire(v58.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                            cvalue = v181, 
                            password = v138, 
                            authType = "signup"
                        }));
                    end;
                    if v152 then
                        local v184 = {
                            username = v181, 
                            password = v138
                        };
                        local v185 = l_HttpService_0:JSONEncode(v184);
                        local function v191() --[[ Line: 394 ]]
                            -- upvalues: v103 (ref), v15 (ref), v97 (ref), v181 (copy), l_default_0 (ref), v185 (copy), l_Constants_0 (ref), l_HttpService_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v158 (ref), v52 (ref), v155 (ref), l_MemStorageService_0 (ref), v58 (ref), v64 (ref), v161 (ref), v50 (ref), v101 (ref), v105 (ref), v104 (ref), v107 (ref), l_LaunchContext_0 (ref), v149 (ref)
                            v103.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordAttempted);
                            v97.reportAttempted(v181);
                            return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v185, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v186) --[[ Line: 408 ]]
                                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v103 (ref), v15 (ref), v97 (ref), v181 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v158 (ref), v52 (ref), v155 (ref), l_MemStorageService_0 (ref), v58 (ref), v64 (ref), v161 (ref), v50 (ref), v101 (ref), v105 (ref), v104 (ref), v107 (ref), l_LaunchContext_0 (ref), v149 (ref)
                                local v187 = if v186 then l_HttpService_0:JSONDecode(v186) else {};
                                if v187 and v187.errorCode == nil then
                                    l_Logger_0:info("Successfully registered password.");
                                    v103.reportAuthButtonClick(v15.Context.CMPasswordPasskeyFallback, v15.Button.SavePassword);
                                    v103.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordSuccess);
                                    v97.reportSuccess(v181);
                                else
                                    l_Logger_0:warning("Error registering password: " .. tostring(v187.errorMsg));
                                    v103.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordFailure, v187.errorMsg or "unknown");
                                    v97.reportFailure(v181, v187.errorMsg or "unknown");
                                end;
                                if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v158 then
                                    local v188 = v52.getAuthenticatedTheme();
                                    if v188 ~= "" then
                                        v155(true);
                                        l_MemStorageService_0:Fire(v58.ThemeUpdate, v188);
                                    end;
                                    v64.ClearThemeOverride();
                                    v161(v50(v101, v105, v104, v107, l_LaunchContext_0.SignUp));
                                    v149(true);
                                end;
                            end, function(v189) --[[ Line: 453 ]]
                                -- upvalues: l_Logger_0 (ref), v103 (ref), v15 (ref), v97 (ref), v181 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v158 (ref), v52 (ref), v155 (ref), l_MemStorageService_0 (ref), v58 (ref), v64 (ref), v161 (ref), v50 (ref), v101 (ref), v105 (ref), v104 (ref), v107 (ref), l_LaunchContext_0 (ref), v149 (ref)
                                l_Logger_0:warning("Error registering password: " .. tostring(v189));
                                v103.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordFailure, (tostring(v189)));
                                v97.reportFailure(v181, (tostring(v189)));
                                if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v158 then
                                    local v190 = v52.getAuthenticatedTheme();
                                    if v190 ~= "" then
                                        v155(true);
                                        l_MemStorageService_0:Fire(v58.ThemeUpdate, v190);
                                    end;
                                    v64.ClearThemeOverride();
                                    v161(v50(v101, v105, v104, v107, l_LaunchContext_0.SignUp));
                                    v149(true);
                                end;
                            end);
                        end;
                        if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v158 then
                            return v191();
                        else
                            local v192 = nil;
                            if v118 then
                                v192 = v191();
                                v192:await();
                            else
                                v192 = if v119 then v16.delay(v80):andThen(v191) else v191();
                            end;
                            return v192:andThen(function() --[[ Line: 500 ]]
                                -- upvalues: v52 (ref), v155 (ref), l_MemStorageService_0 (ref), v58 (ref), v64 (ref), v161 (ref), v50 (ref), v101 (ref), v105 (ref), v104 (ref), v107 (ref), l_LaunchContext_0 (ref), v149 (ref)
                                local v193 = v52.getAuthenticatedTheme();
                                if v193 ~= "" then
                                    v155(true);
                                    l_MemStorageService_0:Fire(v58.ThemeUpdate, v193);
                                end;
                                v64.ClearThemeOverride();
                                v161(v50(v101, v105, v104, v107, l_LaunchContext_0.SignUp));
                                v149(true);
                            end);
                        end;
                    else
                        v103.reportAuthButtonClick(v15.Context.IosAuthServicePasswordFallback, v15.Button.IosAuthServiceSavePasswordSkipped, v15.State.IosAuthServiceProtocolNotAvailable);
                        v97.reportSkipped(v15.State.IosAuthServiceProtocolNotAvailable);
                    end;
                end;
                local v194 = v52.getAuthenticatedTheme();
                if v194 ~= "" then
                    v155(true);
                    l_MemStorageService_0:Fire(v58.ThemeUpdate, v194);
                end;
                v64.ClearThemeOverride();
                v161(v50(v101, v105, v104, v107, l_LaunchContext_0.SignUp));
                v149(true);
                return v16.resolve();
            end, function(_) --[[ Line: 533 ]]
                -- upvalues: v161 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v159 (ref), v149 (ref)
                v161(l_SetCurrentToastMessage_0({
                    toastType = l_ToastType_0.NetworkingError, 
                    toastMessage = "Authentication.Login.Response.SomethingWentWrong", 
                    toastIconColorStyle = {
                        Color = v159.Theme.Alert.Color, 
                        Transparency = 0
                    }, 
                    slideIn = true
                }));
                v149(true);
            end);
            return;
        end;
    end;
    local function v200() --[[ Line: 548 ]]
        -- upvalues: v150 (copy), v151 (copy), v103 (copy), v15 (ref), v51 (ref), v101 (copy), v52 (ref), v155 (copy), l_MemStorageService_0 (ref), v58 (ref), v64 (ref), v161 (copy), v50 (ref), v105 (copy), v104 (copy), v107 (copy), l_LaunchContext_0 (ref), v16 (ref)
        if not v150 then
            return;
        else
            v151(false);
            v103.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.SetupPasskey);
            return v51(v101):andThen(function(_) --[[ Line: 560 ]]
                -- upvalues: v103 (ref), v15 (ref), v52 (ref), v155 (ref), l_MemStorageService_0 (ref), v58 (ref), v64 (ref), v161 (ref), v50 (ref), v101 (ref), v105 (ref), v104 (ref), v107 (ref), l_LaunchContext_0 (ref), v16 (ref)
                v103.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, "success");
                v52.setSignupActionRequired("");
                v52.setPasskeySignupUsername("");
                v52.flush();
                local v198 = v52.getAuthenticatedTheme();
                if v198 ~= "" then
                    v155(true);
                    l_MemStorageService_0:Fire(v58.ThemeUpdate, v198);
                end;
                v64.ClearThemeOverride();
                v161(v50(v101, v105, v104, v107, l_LaunchContext_0.SignUp));
                return v16.resolve();
            end, function(v199) --[[ Line: 572 ]]
                -- upvalues: v103 (ref), v15 (ref), v151 (ref), v16 (ref)
                if v199.name then
                    v103.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, v199.name);
                    if type(v199.body) == "string" then
                        v103.reportAuthClientError(v15.Context.SignupPasswordFallbackPasskeyCreated, v199.body, v199.source);
                    end;
                else
                    v103.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreated, "unknown");
                end;
                v151(true);
                return v16.resolve();
            end);
        end;
    end;
    local function v201() --[[ Line: 599 ]]
        -- upvalues: v103 (copy), v15 (ref), v52 (ref), v161 (copy), v49 (ref), v101 (copy), v102 (copy), v53 (ref)
        v103.reportAuthButtonClick(v15.Context.PasskeySignupPasswordFallback, v15.Button.Close);
        v52.setSignupActionRequired("");
        v52.setPasskeySignupUsername("");
        v52.flush();
        v161(v49(v101, v102, v53.MultiStepSignupCanceled));
    end;
    v7.useEffect(function() --[[ Line: 611 ]]
        -- upvalues: v79 (ref), v156 (copy), v130 (copy), v157 (copy), v163 (copy), v19 (ref), v162 (copy), v103 (copy), v15 (ref), v131 (copy), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
        if not v79 and v156.current then
            if v130 and v157.current then
                if v163 == v19.Input.Directional then
                    v162(v157.current);
                end;
            else
                v156.current:CaptureFocus();
            end;
        end;
        v103.reportAuthPageload(v15.Context.PasskeySignupPasswordFallback);
        if v131 then
            v103.reportAuthPageload(v15.Context.SignupEmailOnAddAuthMethod);
        end;
        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.AddAuthMethodPageMountTelemetryConfig, 1);
    end, {});
    v7.useEffect(function() --[[ Line: 637 ]]
        -- upvalues: v154 (copy), l_MemStorageService_0 (ref), v58 (ref), v64 (ref)
        if not v154 then
            l_MemStorageService_0:Fire(v58.ThemeUpdate, "dark");
            v64.SetDarkThemeOverride();
        end;
    end, {
        v159
    });
    v7.useEffect(function() --[[ Line: 646 ]]
        -- upvalues: l_shouldUseV2FallbackScreen_0 (copy), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), v103 (copy), v15 (ref), v153 (copy), l_Logger_0 (ref)
        if l_shouldUseV2FallbackScreen_0 then
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v202) --[[ Line: 653 ]]
                -- upvalues: v103 (ref), v15 (ref), v153 (ref)
                local v203 = false;
                if v202.password and v202.password.isAvailable then
                    v203 = true;
                end;
                v103.reportAuthPageload(v15.Context.CMPasswordPasskeySignup, (tostring(v203)));
                v153(v203);
            end):catch(function(v204) --[[ Line: 667 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error checking for available credential types. Error: ", v204);
            end);
        end;
    end, {
        l_shouldUseV2FallbackScreen_0
    });
    v7.useEffect(function() --[[ Line: 673 ]]
        -- upvalues: l_GetUserAppLaunchInfo_0 (ref), v101 (copy), v82 (ref), v147 (copy), l_FFlagEnableAddAuthMethodPageEmailSignupParentText_0 (ref), v109 (copy), v55 (ref), v52 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v161 (copy), v49 (ref), l_GuiService_0 (ref), v53 (ref)
        l_GetUserAppLaunchInfo_0(v101):andThen(function(v205) --[[ Line: 674 ]]
            -- upvalues: v82 (ref), v147 (ref), l_FFlagEnableAddAuthMethodPageEmailSignupParentText_0 (ref), v109 (ref), v55 (ref), v52 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v161 (ref), v49 (ref), v101 (ref), l_GuiService_0 (ref), v53 (ref)
            local v206 = nil;
            if v205 and v205.responseBody then
                v206 = v205.responseBody.name;
            end;
            if v206 and v206 ~= "" then
                if v82 then
                    v147(v206);
                end;
                if l_FFlagEnableAddAuthMethodPageEmailSignupParentText_0 then
                    v109(v55.fromUserInfoRequest(v205).isUnder13);
                    return;
                end;
            else
                v52.setSignupActionRequired("");
                v52.setPasskeySignupUsername("");
                v52.flush();
                if l_FFlagAddReasonToEveryLogout_0 then
                    v161(v49(v101, l_GuiService_0, v53.MultiStepSignupResetIncompleteState));
                    return;
                else
                    v161(v49(v101, l_GuiService_0));
                end;
            end;
        end):catch(function(_) --[[ Line: 695 ]]
            -- upvalues: v52 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v161 (ref), v49 (ref), v101 (ref), l_GuiService_0 (ref), v53 (ref)
            v52.setSignupActionRequired("");
            v52.setPasskeySignupUsername("");
            v52.flush();
            if l_FFlagAddReasonToEveryLogout_0 then
                v161(v49(v101, l_GuiService_0, v53.MultiStepSignupResetIncompleteState));
                return;
            else
                v161(v49(v101, l_GuiService_0));
                return;
            end;
        end);
    end, {});
    local v208;
    if v82 and v146 and v146 ~= "" then
        v208 = v146;
    else
        local v209 = v52.getPasskeySignupUsername();
        v208 = if v209 and v209 ~= "" then v209 else if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.Name or "" else "";
    end;
    if v128 and not v134 then
        return (v7.createElement(l_PasskeyUpsellScreen_0, {
            resetNavigationHistory = function(_) --[[ Line: 709 ]] --[[ Name: resetNavigationHistory ]]
                -- upvalues: v103 (copy), v15 (ref), v52 (ref), v155 (copy), l_MemStorageService_0 (ref), v58 (ref), v64 (ref), v161 (copy), v50 (ref), v101 (copy), v105 (copy), v104 (copy), v107 (copy), l_LaunchContext_0 (ref)
                v103.reportAuthModalShown(v15.Context.SignupPasswordFallbackPasskeyCreatedFromEducation, "success");
                v52.setSignupActionRequired("");
                v52.setPasskeySignupUsername("");
                v52.flush();
                local v211 = v52.getAuthenticatedTheme();
                if v211 ~= "" then
                    v155(true);
                    l_MemStorageService_0:Fire(v58.ThemeUpdate, v211);
                end;
                v64.ClearThemeOverride();
                v161(v50(v101, v105, v104, v107, l_LaunchContext_0.SignUp));
            end, 
            onDismiss = function() --[[ Line: 720 ]] --[[ Name: onDismiss ]]
                -- upvalues: v135 (copy)
                v135(true);
            end, 
            source = l_PasskeyUpsellSource_0.AddAuthMethodPage
        }));
    else
        local v212 = v159.Font.BaseSize * v159.Font.Header1.RelativeSize;
        return l_withLocalization_0({
            userGreetingHeaderText = {
                "Authentication.SignUp.Heading.UserGreetingWithName"; 
                username = v208
            }, 
            userGreetingHeaderTextWithPasskeyPassword = {
                "Authentication.SignUp.Heading.UserGreetingWithNameAndPasskeyPassword"; 
                username = v208
            }, 
            userPasswordOnlyGreetingHeaderText = {
                "Authentication.SignUp.Title"; 
                username = v208
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
            emailLabelText = l_FFlagEnableAddAuthMethodPageEmailSignupParentText_0 and v108 and "Authentication.SignUp.Label.EnterYourParentsEmail" or "Authentication.SignUp.Label.EnterYourEmail", 
            invalidEmailText = "Feature.VerificationUpsell.Message.InvalidEmailAddress"
        })(function(v213) --[[ Line: 754 ]]
            -- upvalues: l_shouldUseV2FallbackScreen_0 (copy), v208 (copy), v129 (copy), v136 (copy), v120 (copy), v84 (ref), v122 (copy), v89 (ref), v117 (copy), v121 (copy), v87 (ref), v124 (copy), v7 (ref), l_Button_1 (ref), l_ButtonVariant_0 (ref), v126 (copy), v40 (ref), v200 (copy), v150 (copy), l_InputSize_0 (ref), v157 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_LinkButton_0 (ref), v125 (copy), v127 (copy), v137 (copy), v26 (ref), v112 (copy), v160 (copy), l_DarkTheme_0 (ref), l_ImageSetButton_0 (ref), l_Images_0 (ref), v201 (copy), l_View_0 (ref), l_IconButton_0 (ref), l_IconName_0 (ref), l_ButtonSize_0 (ref), v159 (copy), v212 (copy), v86 (ref), v78 (ref), v39 (ref), v131 (copy), v27 (ref), l_game_EngineFeature_0 (ref), v170 (copy), v28 (ref), v132 (copy), v167 (copy), v156 (copy), l_TextInputBoxWithBorder_0 (ref), v144 (copy), l_AuthStatefulRoundCornerBorder_0 (ref), v174 (copy), v142 (copy), v85 (ref), v196 (copy), v148 (copy), v123 (copy), l_DividerWithText_0 (ref)
            local v214 = nil;
            v214 = if l_shouldUseV2FallbackScreen_0 and v208 then if not v129 or v136 then if v120 then if v84 then v213.createdAccountChooseSigninText else v213.userGreetingHeaderTextWithPasskeyPassword else v213.userGreetingHeaderText else v213.userGreetingHeaderText else v213.oneMoreStepText;
            local v215 = nil;
            v215 = if not v129 or v136 then if v122 then if v84 then v213.createAccountPasskeyEmphasisDescriptionText else v213.secureAccountWithPasskeyText else v213.createAPasswordText else v213.createAPasswordText;
            if v89() and v117 then
                v214 = v213.userPasswordOnlyGreetingHeaderText;
                v215 = v213.ensureNeverLoseAccountText;
            end;
            local v216 = v121 and "passkeyFirst" or "passwordFirst";
            if v129 then
                v216 = v136 and v121 and "showCreatePasswordButton" or v136 and "showCreatePasswordButtonPasswordFirst" or "showPasswordSectionOnly";
            end;
            local v217 = v87[v216];
            local l_password_0 = v217.password;
            local l_spacing_0 = v217.spacing;
            local l_continue_0 = v217.continue;
            local l_divider_0 = v217.divider;
            local v222 = v217.passkey or if l_shouldUseV2FallbackScreen_0 then v217.passkeyV2 else v217.passkeyNonV2;
            local l_createPasswordButton_0 = v217.createPasswordButton;
            local v224 = nil;
            v224 = if l_shouldUseV2FallbackScreen_0 and v124 then v7.createElement(l_Button_1, {
                LayoutOrder = v222, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v213.createAPasskeyLabel, 
                icon = if v126 then v40.Enums.IconName.Key else nil, 
                onActivated = v200, 
                isDisabled = not v150, 
                size = l_InputSize_0.Large, 
                width = UDim.new(1, 0), 
                buttonRef = v157
            }) else if l_shouldUseV2FallbackScreen_0 then v7.createElement(l_Button_0, {
                layoutOrder = v222, 
                buttonType = l_ButtonType_0.Secondary, 
                text = v213.createAPasskeyLabel, 
                size = UDim2.new(1, 0, 0, 48), 
                onActivated = v200, 
                isDisabled = not v150, 
                buttonRef = v157
            }) else v7.createElement(l_LinkButton_0, {
                layoutOrder = v222, 
                text = v213.setUpPasskeyLabel, 
                onActivated = v200, 
                isDisabled = not v150, 
                buttonRef = v157
            });
            local v225 = l_createPasswordButton_0 and v7.createElement(l_Button_1, {
                LayoutOrder = l_createPasswordButton_0, 
                variant = if v125 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Emphasis, 
                text = v213.createAPasswordButtonText, 
                icon = if v127 then v40.Enums.IconName.LockClosed else nil, 
                onActivated = function() --[[ Line: 845 ]] --[[ Name: onActivated ]]
                    -- upvalues: v137 (ref)
                    v137(false);
                end, 
                size = l_InputSize_0.Large, 
                width = UDim.new(1, 0)
            });
            return v7.createElement(v26, {
                BackgroundTransparency = 0, 
                includeStatusBar = true, 
                BackgroundColor3 = if v112 then v160.Color.Surface.Surface_0.Color3 else l_DarkTheme_0.BackgroundUIDefault.Color
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
                        [v7.Event.Activated] = v201
                    }) else nil, 
                    HeaderBackButton = if not v129 or v136 then nil else v7.createElement(l_View_0, {
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
                            onActivated = function() --[[ Line: 904 ]] --[[ Name: onActivated ]]
                                -- upvalues: v137 (ref)
                                v137(true);
                            end
                        })
                    }), 
                    Title = v7.createElement("TextLabel", {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Text = v213.signUpLabel, 
                        TextWrapped = true, 
                        Font = v159.Font.CaptionHeader.Font, 
                        TextSize = v212, 
                        TextColor3 = l_DarkTheme_0.TextEmphasis.Color, 
                        TextTransparency = l_DarkTheme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Divider = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0.5, 0, 0, 48), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = v112 and 1 or 0, 
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
                        PaddingTop = UDim.new(0, v86)
                    }), 
                    MultiPageSignupText = if v78 then v7.createElement(v39, {
                        layoutOrder = 1, 
                        titleText = v214, 
                        helpText = v215
                    }) else nil, 
                    InstructionsHeadingText = if v78 then nil else v7.createElement("TextLabel", {
                        Text = v214, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = v159.Theme.TextEmphasis.Color, 
                        Font = v159.Font.Header1.Font, 
                        TextSize = 24
                    }, {
                        UIPadding = v7.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 36)
                        })
                    }), 
                    InstructionsHeadingBody = if v78 then nil else v7.createElement("TextLabel", {
                        Text = v215, 
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextColor3 = v159.Theme.TextDefault.Color, 
                        Font = v159.Font.Header2.Font, 
                        TextSize = 14, 
                        TextWrapped = true
                    }, {}), 
                    Spacing = v7.createElement("Frame", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 16)
                    }), 
                    PasswordValidator = if not v131 and l_password_0 then v7.createElement(v27, {
                        layoutOrder = l_password_0, 
                        titleTextKey = "CommonUI.Messages.Label.Password", 
                        summaryErrorTextKey = "Authentication.SignUp.Label.ErrorsWithPassword", 
                        prerequisiteMet = true, 
                        textInputType = l_game_EngineFeature_0 and Enum.TextInputType.NewPassword or Enum.TextInputType.Password, 
                        onInputTextChanged = v170, 
                        onInputTextValidated = v170, 
                        validator = v28, 
                        validatorAdditionalProps = {
                            username = v208
                        }, 
                        returnKeyType = Enum.ReturnKeyType.Next, 
                        hidePassword = v132, 
                        onToggleCallback = v167, 
                        showDetailedError = true, 
                        textBoxRef = v156
                    }) else nil, 
                    EmailInput = if v131 and l_password_0 then v7.createElement(l_TextInputBoxWithBorder_0, {
                        textInputType = Enum.TextInputType.Email, 
                        textInputHeight = 36, 
                        layoutOrder = l_password_0, 
                        borderState = if v144 then l_AuthStatefulRoundCornerBorder_0.BorderState.Error else l_AuthStatefulRoundCornerBorder_0.BorderState.Default, 
                        textBarColor = v159.Theme.BackgroundUIContrast.Color, 
                        onChangeTextCallback = v174, 
                        labelText = v213.emailLabelText, 
                        labelTextColor = v159.Theme.TextDefault.Color, 
                        errorText = if v142 ~= "" then v142 else if v144 then v213.invalidEmailText else nil, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        placeholderText = v85, 
                        placeholderTextColor = v159.Theme.TextDefault.Color
                    }) else nil, 
                    Spacing2 = if l_spacing_0 then v7.createElement("Frame", {
                        LayoutOrder = l_spacing_0, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 8)
                    }) else nil, 
                    ContinueButton = if l_continue_0 then if v125 then v7.createElement(l_Button_1, {
                        LayoutOrder = l_continue_0, 
                        variant = l_ButtonVariant_0.Standard, 
                        text = if l_shouldUseV2FallbackScreen_0 then v213.doneText else v213.continueText, 
                        icon = if v127 then v40.Enums.IconName.LockClosed else nil, 
                        size = l_InputSize_0.Large, 
                        width = UDim.new(1, 0), 
                        onActivated = v196, 
                        isDisabled = not v148
                    }) else v7.createElement(l_Button_0, {
                        layoutOrder = l_continue_0, 
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        text = if l_shouldUseV2FallbackScreen_0 then v213.doneText else v213.continueText, 
                        size = UDim2.new(1, 0, 0, 48), 
                        onActivated = v196, 
                        isDisabled = not v148
                    }) else nil, 
                    DividerWithText = if not (not l_shouldUseV2FallbackScreen_0 or v117 or v123) and l_divider_0 then v7.createElement(l_DividerWithText_0, {
                        layoutOrder = l_divider_0, 
                        width = 0, 
                        height = 0, 
                        size = UDim2.new(1, 0, 0, 32), 
                        font = v159.Font.BodySmall.Font, 
                        fontSize = v159.Font.BaseSize * v159.Font.BodySmall.RelativeSize, 
                        color3 = v159.Theme.TextMuted.Color, 
                        transparency = v159.Theme.TextMuted.Transparency, 
                        text = v213.dividerText, 
                        padding = 8
                    }) else nil, 
                    CreatePasswordButton = v225, 
                    PasskeyButton = if not v117 and v222 then v224 else nil
                })
            });
        end);
    end;
end;