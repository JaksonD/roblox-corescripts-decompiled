local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local _ = require(l_CorePackages_0.Packages.React);
local l_createLazyComponent_0 = v4.Components.createLazyComponent;
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableConfirmSignOutV2);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableOtpEmailLogin);
local l_GetFFlagEdpPlayerFeedbackEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled;
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptEnabled);
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal);
local v14 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign;
local v16 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow;
local l_FFlagLuaAppHomeVngAppUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_GetFFlagEnableReminderOfNormsABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableReminderOfNormsABTest;
local l_GetFFlagEnableInAppBugReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInAppBugReporting;
local l_FFlagInAppInterventionEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagInAppInterventionEnabled;
local l_FFlagEnableAbuseReportRevampFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAbuseReportRevampFlow;
local l_FFlagEnableMagicLogin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMagicLogin;
local l_FFlagAXWearTimeSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXWearTimeSupport;
local l_FFlagLuaAppsServerTriggeredModals_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppsServerTriggeredModals;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableCommsFAEUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableCommsFAEUpsell;
local l_FFlagEnableSignUpExitModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSignUpExitModal;
local l_FFlagEnableSystemTrayModals_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSystemTrayModals;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
return {
    OverlayComponent = {
        [v3.VerifyPhoneNumber] = l_createLazyComponent_0(function() --[[ Line: 50 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.VerifyPhoneNumber);
        end), 
        [v3.VerifiedEnableVoice] = l_createLazyComponent_0(function() --[[ Line: 53 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Verification.IdentityVerification.VerifiedEnableVoiceModal);
        end), 
        [v3.UserAgreementsUpdatedPopup] = l_createLazyComponent_0(function() --[[ Line: 56 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.UserAgreement.UserAgreementsUpdatedPopup);
        end), 
        [v3.VNGUserAgreementsPopup] = l_createLazyComponent_0(function() --[[ Line: 59 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.UserAgreement.VNGUserAgreementsPopup);
        end), 
        [v3.UserAgreementsSecondPrompt] = l_createLazyComponent_0(function() --[[ Line: 62 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.Luobu.Components.Authentication.UserAgreementsSecondPrompt);
        end), 
        [v3.UserAgreementsPrompt] = l_createLazyComponent_0(function() --[[ Line: 65 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.Luobu.Components.Authentication.UserAgreementsPrompt);
        end), 
        [v3.TencentNoticePopup] = l_createLazyComponent_0(function() --[[ Line: 68 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.Luobu.Components.TencentNoticePopup.TencentNoticePopup);
        end), 
        [v3.SimpleTextAlertPrompt] = l_createLazyComponent_0(function() --[[ Line: 71 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.Luobu.Components.Authentication.SimpleTextAlertPrompt);
        end), 
        [v3.SignUpBirthdayPickerOverlay] = l_createLazyComponent_0(function() --[[ Line: 74 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.SignUpBirthdayPickerOverlay);
        end), 
        [v3.PurchaseGameRobuxShortfall] = l_createLazyComponent_0(function() --[[ Line: 77 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.GameDetails.PurchaseGameRobuxShortfallPrompt);
        end), 
        [v3.PurchaseGame] = l_createLazyComponent_0(function() --[[ Line: 80 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.GameDetails.PurchaseGamePrompt);
        end), 
        [v3.PlacesList] = l_createLazyComponent_0(function() --[[ Line: 83 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Home.PlacesListContextualMenu);
        end), 
        [v3.PeopleList] = l_createLazyComponent_0(function() --[[ Line: 86 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Home.PeopleListContextualMenuFn);
        end), 
        [v3.LoginPasswordResetPrompt] = l_createLazyComponent_0(function() --[[ Line: 89 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.PasswordResetPrompt);
        end), 
        [v3.LoginEmailVerificationPrompt] = l_createLazyComponent_0(function() --[[ Line: 92 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.LoginEmailVerificationPrompt);
        end), 
        [v3.UpdateRequiredPrompt] = l_createLazyComponent_0(function() --[[ Line: 95 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.UpdateRequiredPrompt);
        end), 
        [v3.LeaveRobloxAlert] = l_createLazyComponent_0(function() --[[ Line: 98 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.GameDetails.LeaveRobloxAlert);
        end), 
        [v3.ReportLogsOverlay] = l_createLazyComponent_0(function() --[[ Line: 101 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.More.ReportLogsOverlay);
        end), 
        [v3.GameDetailsPlayWithFriends] = l_createLazyComponent_0(function() --[[ Line: 104 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsPlayWithFriendsContextualMenu);
        end), 
        [v3.GameDetailMore] = l_createLazyComponent_0(function() --[[ Line: 107 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailMoreContextualMenu);
        end), 
        [v3.GameDetailsSquad] = if l_GetFFlagIsSquadEnabled_0() then l_createLazyComponent_0(function() --[[ Line: 111 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsSquadContextualMenu);
        end) else nil, 
        [v3.ExperienceGuidelinesExplained] = l_createLazyComponent_0(function() --[[ Line: 115 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.ExperienceGuidelines.ExperienceGuidelinesExplained);
        end), 
        [v3.FindFriendsModal] = l_createLazyComponent_0(function() --[[ Line: 118 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.ContactImporter.api).FindFriendsModal;
        end), 
        [v3.EmailVerificationUpsellOverlay] = l_createLazyComponent_0(function() --[[ Line: 121 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.VerificationUpsell.EmailVerificationUpsellOverlay);
        end), 
        [v3.PhoneVerificationUpsellOverlay] = l_createLazyComponent_0(function() --[[ Line: 124 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneVerificationUpsellOverlay;
        end), 
        [v3.PhoneVerificationUpsellOverlayWrapper] = l_createLazyComponent_0(function() --[[ Line: 127 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneVerificationUpsellOverlayWrapper;
        end), 
        [v3.VoicePhoneVerificationUpsellOverlayWrapper] = l_createLazyComponent_0(function() --[[ Line: 130 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).VoicePhoneVerificationUpsellOverlayWrapper;
        end), 
        [v3.DevSubMore] = l_createLazyComponent_0(function() --[[ Line: 133 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.DevSubMoreMenu);
        end), 
        [v3.DevSubConfirmCancel] = l_createLazyComponent_0(function() --[[ Line: 136 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.DevSubConfirmCancelPrompt);
        end), 
        [v3.CrossDeviceLoginConfirmation] = l_createLazyComponent_0(function() --[[ Line: 139 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginConfirmationPrompt);
        end), 
        [v3.CrossDeviceCodePrompt] = l_createLazyComponent_0(function() --[[ Line: 142 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodePrompt);
        end), 
        [v3.ContactsList] = l_createLazyComponent_0(function() --[[ Line: 145 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.ContactImporter.api).ContactsList;
        end), 
        [v3.ConfirmSignOut] = l_createLazyComponent_0(function() --[[ Line: 148 ]]
            -- upvalues: v7 (copy), l_Modules_0 (copy)
            if v7() then
                return require(l_Modules_0.LuaApp.Components.Authentication.ConfirmSignOutV2);
            else
                return require(l_Modules_0.LuaApp.Components.Authentication.ConfirmSignOut);
            end;
        end), 
        [v3.CameraPermissionPrompt] = l_createLazyComponent_0(function() --[[ Line: 155 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.CameraPermissionPrompt);
        end), 
        [v3.AgreeToPhoneNumberVerification] = l_createLazyComponent_0(function() --[[ Line: 158 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.AgreeToPhoneNumberVerification);
        end), 
        [v3.AccountAuthenticationFailureOverlay] = l_createLazyComponent_0(function() --[[ Line: 161 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.AccountAuthenticationFailureOverlay);
        end), 
        [v3.PurchasePass] = l_createLazyComponent_0(function() --[[ Line: 164 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Passes.PurchasePassPrompt);
        end), 
        [v3.PurchasePassInsufficientRobux] = l_createLazyComponent_0(function() --[[ Line: 167 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Passes.PurchasePassInsufficientRobuxPrompt);
        end), 
        [v3.PurchaseDeveloperProduct] = l_createLazyComponent_0(function() --[[ Line: 170 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.DeveloperProduct.PurchaseDeveloperProductPrompt);
        end), 
        [v3.PurchaseDeveloperProductInsufficientRobux] = l_createLazyComponent_0(function() --[[ Line: 173 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.DeveloperProduct.PurchaseDeveloperProductInsufficientRobuxPrompt);
        end), 
        [v3.PurchaseDeveloperProductPendingProductsLimitExceeded] = l_createLazyComponent_0(function() --[[ Line: 176 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.DeveloperProduct.PurchaseDeveloperProductPendingProductsLimitExceededPrompt);
        end), 
        [v3.PurchaseDeveloperProductSuccess] = l_createLazyComponent_0(function() --[[ Line: 181 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.DeveloperProduct.PurchaseDeveloperProductSuccessPrompt);
        end), 
        [v3.AccountSecurityPromptOverlay] = if v11() then l_createLazyComponent_0(function() --[[ Line: 185 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.AccountSecurity.PromptOverlay);
        end) else nil, 
        [v3.DiscoverabilityUpsell] = l_createLazyComponent_0(function() --[[ Line: 189 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.DiscoverabilityModal.api).DiscoverabilityOverlay;
        end), 
        [v3.SurveyPrompt] = l_createLazyComponent_0(function() --[[ Line: 192 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.OnPlatformSurveys.SurveyPrompt);
        end), 
        [v3.PlayerContextualMenu] = l_createLazyComponent_0(function() --[[ Line: 195 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.PlayerContextualMenu).Component;
        end), 
        [v3.GamepadDisconnected] = l_createLazyComponent_0(function() --[[ Line: 198 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadDisconnectedModal;
        end), 
        [v3.IapExperienceAnimator] = l_createLazyComponent_0(function() --[[ Line: 201 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.IAPExperience).Animator;
        end), 
        [v3.AccountSelector] = if v8() then l_createLazyComponent_0(function() --[[ Line: 205 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSelectorOverlay;
        end) else nil, 
        [v3.AccountSwitcher] = if l_GetFFlagEnableAccountSwitcherFoundationDesign_0() then l_createLazyComponent_0(function() --[[ Line: 210 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSwitchingSelectAccount;
        end) else nil, 
        [v3.EmailOtp] = if v9() then l_createLazyComponent_0(function() --[[ Line: 215 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.OtpLogin).EmailOtpOverlay;
        end) else nil, 
        [v3.VngContactInfoFormWebviewPopup] = l_createLazyComponent_0(function() --[[ Line: 219 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Vng.VngContactInfoFormWebviewPopup);
        end), 
        [v3.NewAppAvailableModal] = if v13() then l_createLazyComponent_0(function() --[[ Line: 223 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Authentication.NewAppAvailableInteractiveAlert);
        end) else nil, 
        [v3.AccountSwitchingErrorOverlay] = if v14 then l_createLazyComponent_0(function() --[[ Line: 228 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AccountSwitching).AccountSwitchingErrorOverlay;
        end) else nil, 
        [v3.CloseOnlyInteractiveAlert] = l_createLazyComponent_0(function() --[[ Line: 232 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AppBlox).CloseOnlyInteractiveAlert;
        end), 
        [v3.ConfirmationDialog] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then l_createLazyComponent_0(function() --[[ Line: 236 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AppBlox).ConfirmationDialog;
        end) else nil, 
        [v3.UpsellModal] = l_createLazyComponent_0(function() --[[ Line: 240 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AppBlox).UpsellModal;
        end), 
        [v3.SquadPrompt] = if l_GetFFlagIsSquadEnabled_0() then l_createLazyComponent_0(function() --[[ Line: 244 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.SquadsCore).SquadPrompt;
        end) else nil, 
        [v3.VngComplianceLoadingPopup] = if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then l_createLazyComponent_0(function() --[[ Line: 249 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Vng.VngComplianceLoadingPopup);
        end) else nil, 
        [v3.KISAPopUpAgreements] = if v16 then l_createLazyComponent_0(function() --[[ Line: 254 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AuthCompliance).KISAPopUpAgreements;
        end) else nil, 
        [v3.ItemsReceivedAlert] = l_createLazyComponent_0(function() --[[ Line: 258 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.ItemsReceivedAlert).ItemsReceivedAlert;
        end), 
        [v3.VngAppUpsell] = if l_FFlagLuaAppHomeVngAppUpsell_0 then l_createLazyComponent_0(function() --[[ Line: 262 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.Personalization.Home.VngAppUpsell.VngAppUpsellOverlay);
        end) else nil, 
        [v3.SearchPageOverlay] = if l_FFlagSearchOmniAutocompletePage_0 then l_createLazyComponent_0(function() --[[ Line: 267 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.Personalization.Search.SearchPageOverlay);
        end) else nil, 
        [v3.GamePlayerFeedbackForm] = if l_GetFFlagEdpPlayerFeedbackEnabled_0() then l_createLazyComponent_0(function() --[[ Line: 272 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.PlayerFeedback).GamePlayerFeedbackFormModal;
        end) else nil, 
        [v3.ReminderOfNormsPopup] = if l_GetFFlagEnableReminderOfNormsABTest_0() then l_createLazyComponent_0(function() --[[ Line: 277 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Moderation.ReminderOfNormsPopup);
        end) else nil, 
        [v3.GameFilterMenuDropdown] = l_createLazyComponent_0(function() --[[ Line: 281 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.GameFilters).FilterMenuDropdown;
        end), 
        [v3.SettingsPermissionInteractiveAlert] = l_createLazyComponent_0(function() --[[ Line: 284 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.SocialCommon).Components.SettingsPermissionInteractiveAlert;
        end), 
        [v3.BugReporter] = if l_GetFFlagEnableInAppBugReporting_0() then l_createLazyComponent_0(function() --[[ Line: 288 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.BugReporting).BugReporterModalContainer;
        end) else nil, 
        [v3.InAppIntervention] = if l_FFlagInAppInterventionEnabled_0 then l_createLazyComponent_0(function() --[[ Line: 293 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.InAppIntervention).InAppInterventionContainer;
        end) else nil, 
        [v3.DynamicAbuseReport] = if l_FFlagEnableAbuseReportRevampFlow_0 then l_createLazyComponent_0(function() --[[ Line: 298 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.GenericAbuseReporting).UXFlows.DynamicReportContainer;
        end) else nil, 
        [v3.NotApprovedPage] = l_createLazyComponent_0(function() --[[ Line: 302 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.NotApprovedPage).NotApprovedPage;
        end), 
        [v3.AccountReactivationPrompt] = l_createLazyComponent_0(function() --[[ Line: 305 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.NotApprovedPage).AccountReactivationPrompt;
        end), 
        [v3.MagicLoginApprovePopup] = if l_FFlagEnableMagicLogin_0 then l_createLazyComponent_0(function() --[[ Line: 309 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.LoginV2).Components.MagicLoginApprovePopup;
        end) else nil, 
        [v3.MagicLoginRequestPopup] = if l_FFlagEnableMagicLogin_0 then l_createLazyComponent_0(function() --[[ Line: 314 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.LoginV2).Components.MagicLoginRequestPopup;
        end) else nil, 
        [v3.DeviceSelectorPeekView] = if l_FFlagEnableMagicLogin_0 then l_createLazyComponent_0(function() --[[ Line: 319 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.LoginV2).Components.DeviceSelectorPeekView;
        end) else nil, 
        [v3.AccountLinkingAlert] = l_createLazyComponent_0(function() --[[ Line: 323 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AuthCommon).Components.AccountLinkingAlert;
        end), 
        [v3.CheckboxFeedbackFormModal] = l_createLazyComponent_0(function() --[[ Line: 326 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AppBlox).CheckboxFeedbackFormModal;
        end), 
        [v3.ProvideFeedbackToast] = l_createLazyComponent_0(function() --[[ Line: 329 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AppBlox).ProvideFeedbackToast;
        end), 
        [v3.WearTimeInfoModal] = if l_FFlagAXWearTimeSupport_0 then l_createLazyComponent_0(function() --[[ Line: 333 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.WearTimeInfoModal;
        end) else nil, 
        [v3.EconomicRestrictionPrompt] = l_createLazyComponent_0(function() --[[ Line: 337 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.Fraud.EconomicRestrictionPrompt);
        end), 
        [v3.UnifiedProductPurchaseModal] = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then l_createLazyComponent_0(function() --[[ Line: 341 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.PurchasePrompt).UnifiedPurchasePromptContainer;
        end) else nil, 
        [v3.AccountLockModal] = l_createLazyComponent_0(function() --[[ Line: 345 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AccountLockModal).AccountLockModal;
        end), 
        [v3.SduiModal] = if l_FFlagLuaAppsServerTriggeredModals_0 then l_createLazyComponent_0(function() --[[ Line: 349 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.ServerTriggeredModals).SduiModal;
        end) else nil, 
        [v3.SignUpExitModal] = if l_FFlagEnableSignUpExitModal_0 then l_createLazyComponent_0(function() --[[ Line: 354 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.AuthSignup).Components.SignUpExitModal;
        end) else nil, 
        [v3.SocialUpsellOverlay] = if l_FFlagEnableCommsFAEUpsell_0 then l_createLazyComponent_0(function() --[[ Line: 359 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.SocialUpsell).InAppSocialUpsellOverlayWrapper;
        end) else nil, 
        [v3.NotificationsModal] = if l_FFlagEnableSystemTrayModals_0 then l_createLazyComponent_0(function() --[[ Line: 364 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.NotificationsModal);
        end) else nil, 
        [v3.SystemTrayModal] = if l_FFlagEnableSystemTrayModals_0 then l_createLazyComponent_0(function() --[[ Line: 369 ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.SystemTrayModal);
        end) else nil, 
        [v3.WhyThisAdModal] = if l_FFlagLuaAppEnableWhyThisAdModal_0 then l_createLazyComponent_0(function() --[[ Line: 374 ]]
            -- upvalues: l_CorePackages_0 (copy)
            return require(l_CorePackages_0.Workspace.Packages.SponsoredTiles).WhyThisAdModal;
        end) else nil
    }
};