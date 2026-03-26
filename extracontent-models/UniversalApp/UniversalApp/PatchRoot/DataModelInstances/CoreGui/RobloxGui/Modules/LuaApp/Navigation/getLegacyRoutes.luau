local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local v8 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v8.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v8.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v12 = require(l_Modules_0.LuaApp.Navigation.wrapAppPageForRoactNavigation);
local v13 = require(l_Modules_0.LuaApp.Navigation.wrapPageInScreenGui);
local v14 = require(l_Modules_0.LuaApp.FlagSettings);
local v15 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v16 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v17 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local v18 = require(l_Modules_0.LuaApp.AppPageProperties);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v20 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagShareTargetGameCleanup_0 = v20.FFlagShareTargetGameCleanup;
local l_FFlagEnableBlackbird_0 = v20.FFlagEnableBlackbird;
local l_GetFStringBlackbirdUrl_0 = v20.GetFStringBlackbirdUrl;
local v24 = require(l_Modules_0.LuaApp.Flags.FFlagReworkPurchaseRobuxPage);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility);
local l_FFlagLuaAppEnableStratusStreamingTestOnly_0 = v20.FFlagLuaAppEnableStratusStreamingTestOnly;
local v27 = l_createLazyComponent_0(function() --[[ Line: 37 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.VideoServerScreen).VideoServerScreenContainer;
end);
local v28 = {
    SafetySupportPage = l_createLazyComponent_0(function() --[[ Line: 42 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.SafetySupportPage);
    end), 
    DeviceSettingsPage = l_createLazyComponent_0(function() --[[ Line: 45 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.DeviceSettings.DeviceSettingsPage);
    end), 
    AppInformation = l_createLazyComponent_0(function() --[[ Line: 48 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.AppInformationPage);
    end), 
    DevSubsPage = l_createLazyComponent_0(function() --[[ Line: 51 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.DevSubsPage);
    end), 
    TencentNoticeCenterPage = l_createLazyComponent_0(function() --[[ Line: 54 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeCenterPage);
    end), 
    TencentNoticeContentPage = l_createLazyComponent_0(function() --[[ Line: 57 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeContentPage);
    end)
};
local v29 = {
    CharacterSelectionPage = l_createLazyComponent_0(function() --[[ Line: 62 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.CharacterSelectPage);
    end), 
    UsernameSelectionPage = l_createLazyComponent_0(function() --[[ Line: 65 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.UsernameSelectionPage);
    end), 
    PasswordSelectionPage = l_createLazyComponent_0(function() --[[ Line: 68 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.PasswordSelectionPage);
    end), 
    LoginV2MonoWrapper = l_createLazyComponent_0(function() --[[ Line: 71 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.LoginV2MonoWrapper);
    end), 
    AccountRecoveryMonoWrapper = l_createLazyComponent_0(function() --[[ Line: 74 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.AccountSecurity.AccountRecoveryMonoWrapper);
    end), 
    UAppBlockPage = l_createLazyComponent_0(function() --[[ Line: 77 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.UAppBlockPage);
    end), 
    LandingPage = l_createLazyComponent_0(function() --[[ Line: 80 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.LandingPage);
    end), 
    LuobuLandingPage = l_createLazyComponent_0(function() --[[ Line: 83 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.Authentication.LuobuLandingPage);
    end), 
    BirthdayPage = l_createLazyComponent_0(function() --[[ Line: 86 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.BirthdayPage);
    end), 
    LuobuSignUpPage = l_createLazyComponent_0(function() --[[ Line: 89 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.Authentication.LuobuSignUpPage);
    end), 
    AddAuthMethodPage = l_createLazyComponent_0(function() --[[ Line: 92 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.AddAuthMethodPage);
    end), 
    PasskeyUpsellScreen = l_createLazyComponent_0(function() --[[ Line: 95 ]]
        -- upvalues: l_CorePackages_0 (copy)
        return require(l_CorePackages_0.Workspace.Packages.PasskeyUpsell).Components.PasskeyUpsellScreen;
    end), 
    CaptchaPageBrowserServiceWrapper = l_createLazyComponent_0(function() --[[ Line: 98 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.CaptchaPageBrowserServiceWrapper);
    end), 
    NotApprovedPage = l_createLazyComponent_0(function() --[[ Line: 101 ]]
        -- upvalues: l_CorePackages_0 (copy)
        return require(l_CorePackages_0.Workspace.Packages.NotApprovedPage).NotApprovedPageV2;
    end)
};
local v30 = l_createLazyComponent_0(function() --[[ Line: 105 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector);
end);
local v31 = l_createLazyComponent_0(function() --[[ Line: 108 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Passes.PassesPage);
end);
local v32 = l_createLazyComponent_0(function() --[[ Line: 111 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.InviteLinkExpiredModal.api).InviteLinkExpiredModal;
end);
local v33 = l_createLazyComponent_0(function() --[[ Line: 114 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ShareLinkInvalidModal.api).ShareLinkInvalidModal;
end);
local v34 = l_createLazyComponent_0(function() --[[ Line: 117 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ProfileQRCodePage.api).ProfileQRCodeEntryPoint;
end);
local v35 = l_createLazyComponent_0(function() --[[ Line: 120 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.SocialMessageToast.api).RootScreen;
end);
local v36 = l_createLazyComponent_0(function() --[[ Line: 123 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.EditProfile).EditUsernameWrapper;
end);
local v37 = l_createLazyComponent_0(function() --[[ Line: 126 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSelectorPeekView;
end);
local v38 = l_createLazyComponent_0(function() --[[ Line: 129 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSwitchingAddAccountPeekView;
end);
local v39 = l_createLazyComponent_0(function() --[[ Line: 132 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.VirtualEvents).ShareEventModal;
end);
local v40 = l_createLazyComponent_0(function() --[[ Line: 135 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.VerifiedBadges).AboutVerifiedBadgeModal;
end);
local v41 = l_createLazyComponent_0(function() --[[ Line: 138 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.VirtualEvents.EventDetailsWrapper);
end);
local v42 = l_createLazyComponent_0(function() --[[ Line: 141 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.VirtualEvents.EventNotificationsModalWrapper);
end);
local v43 = l_createLazyComponent_0(function() --[[ Line: 144 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.YouTubePageWrapper);
end);
local v44 = l_createLazyComponent_0(function() --[[ Line: 147 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.GenericWebPageWrapper);
end);
local v45 = l_createLazyComponent_0(function() --[[ Line: 150 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.GenericNativePageWrapper);
end);
local v46 = l_createLazyComponent_0(function() --[[ Line: 153 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.ShareTargetGame.Components.ShareTargetGameEntrypoint);
end);
local v47 = l_createLazyComponent_0(function() --[[ Line: 156 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Authentication.WeChatLoginWrapper);
end);
local v48 = l_createLazyComponent_0(function() --[[ Line: 159 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativeViewUserProfileWrapper);
end);
local v49 = l_createLazyComponent_0(function() --[[ Line: 162 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativeViewProfileWrapper);
end);
local v50 = l_createLazyComponent_0(function() --[[ Line: 165 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativePageWithUrlWrapper);
end);
local v51 = l_createLazyComponent_0(function() --[[ Line: 168 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativeReportAbuseWrapper);
end);
local v52 = l_createLazyComponent_0(function() --[[ Line: 171 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativePurchaseRobuxPageWrapper);
end);
local v53 = l_createLazyComponent_0(function() --[[ Line: 174 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.More.AccountInfoPage);
end);
local v54 = l_createLazyComponent_0(function() --[[ Line: 177 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ShareSheetWrapper);
end);
local v55 = l_createLazyComponent_0(function() --[[ Line: 180 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.SdkShareWrapper);
end);
local v56 = l_createLazyComponent_0(function() --[[ Line: 183 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.Luobu.Components.More.TencentHelp.TencentHelpWrapper);
end);
local v57 = l_createLazyComponent_0(function() --[[ Line: 186 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.TutorialUpsell).Components.TutorialUpsellScreen;
end);
local v58 = l_createLazyComponent_0(function() --[[ Line: 189 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Authentication.VerificationUpsell.PhoneVerificationNativeWrapper);
end);
local v59 = l_createLazyComponent_0(function() --[[ Line: 192 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.SettingsNativeWrapper);
end);
local v60 = l_createLazyComponent_0(function() --[[ Line: 195 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.More.ParentVerificationPage);
end);
local v61 = l_createLazyComponent_0(function() --[[ Line: 198 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
end);
local v62 = l_createLazyComponent_0(function() --[[ Line: 201 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Challenge.HybridOverlayPage);
end);
local v63 = l_createLazyComponent_0(function() --[[ Line: 204 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Challenge.HybridWebView);
end);
local v64 = l_createLazyComponent_0(function() --[[ Line: 207 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).ChallengeDialogModalContainer;
end);
local v65 = l_createLazyComponent_0(function() --[[ Line: 210 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AvatarExperienceWrapper);
end);
local v66 = l_createLazyComponent_0(function() --[[ Line: 213 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AmpUpsell).IDVUpsellContainer;
end);
local v67 = l_createLazyComponent_0(function() --[[ Line: 216 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AmpUpsell).VPCUpsellContainer;
end);
local v68 = l_createLazyComponent_0(function() --[[ Line: 219 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AmpUpsell.RobloxSubscriptionUpsellScreen);
end);
local v69 = l_createLazyComponent_0(function() --[[ Line: 222 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AgeVerification.AgeVerificationModal);
end);
local v70 = l_createLazyComponent_0(function() --[[ Line: 225 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.RobuxUpsell.RobuxUpsellContainer);
end);
local v71 = l_createLazyComponent_0(function() --[[ Line: 228 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Subscription.Purchase.SubscriptionPurchaseContainer);
end);
local v72 = l_createLazyComponent_0(function() --[[ Line: 231 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.BuyRobux.BuyRobuxContainer);
end);
local v73 = l_createLazyComponent_0(function() --[[ Line: 234 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportContainer);
end);
local v74 = l_createLazyComponent_0(function() --[[ Line: 237 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Games.SponsoredTooltipPeekView);
end);
local v75 = l_createLazyComponent_0(function() --[[ Line: 240 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AppBlox).InfoPeekView;
end);
local v76 = l_createLazyComponent_0(function() --[[ Line: 243 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AmpUpsell.AccountSettingsUpsellWrapper);
end);
local v77 = l_createLazyComponent_0(function() --[[ Line: 246 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AmpUpsell.AmpWizardContainerWrapper);
end);
local v78 = l_createLazyComponent_0(function() --[[ Line: 249 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).VoiceTrialUpsell;
end);
local v79 = {
    FFlagFetchUserNameOnCloseAccountInfo = require(l_Modules_0.LuaApp.Flags.FFlagFetchUserNameOnCloseAccountInfo), 
    GetFFlagEnableUnifiedStaticWebViews = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews), 
    GetFFlagLuaAppUseSettingsNativeWrapper = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseSettingsNativeWrapper), 
    GetFFlagLuaAppLuaBuyRobuxPage = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLuaBuyRobuxPage), 
    GetFFlagEnableAccountSettingsUpsell = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableAccountSettingsUpsell), 
    GetFFlagEnableAmpUpsellWizard = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableAmpUpsellWizard), 
    GetFFlagEnableAmpIDVUpsellSupport = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpIDVUpsellSupport, 
    GetFFlagEnableAmpSubscriptionUpsell = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpSubscriptionUpsell, 
    GetFFlagLuaAppChallengeDialogContainerPageEnabled = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogContainerPageEnabled, 
    GetFFlagEnableTransparentNativeChallengeWrapper = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableTransparentNativeChallengeWrapper)
};
local v80 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local v81 = game:DefineFastFlag("ModerationVerificationEnabled2", false);
local l_FFlagEnableLuaLoginRevamp_0 = v20.FFlagEnableLuaLoginRevamp;
local l_GetFFlagEnableLuafiedRecoveryFlow_0 = v20.GetFFlagEnableLuafiedRecoveryFlow;
local v84 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard);
local l_GetFFlagEnableSecurityAlertDeeplink_0 = v20.GetFFlagEnableSecurityAlertDeeplink;
local l_FFlagPasskeyUpsellEnabled_0 = v20.FFlagPasskeyUpsellEnabled;
local l_FFlagTutorialUpsellEnabled_0 = v20.FFlagTutorialUpsellEnabled;
local l_FFlagEnableNapDedicatedPage_0 = v20.FFlagEnableNapDedicatedPage;
local l_FFlagLuaAppSduiEventDetailsEnabled_0 = v20.FFlagLuaAppSduiEventDetailsEnabled;
local function v93(v90) --[[ Line: 278 ]] --[[ Name: getLegacyNavigationOptions ]]
    -- upvalues: v18 (copy), v80 (copy), l_AppPage_0 (copy), l_AvatarScreen_0 (copy)
    local v91 = (v18[v90] or {}).renderUnderlyingPage or false;
    local l_v91_0 = v91;
    if v80() and v90 == l_AppPage_0.GameDetail or v90 == l_AvatarScreen_0.ItemDetails or v90 == l_AppPage_0.SocialMessageToast or v90 == l_AppPage_0.AccountSelectorPeekView or v90 == l_AppPage_0.AccountSwitchingAddAccountPeekView or v90 == l_AppPage_0.AvatarExperienceWrapperTransparent or v90 == l_AppPage_0.SponsoredTooltipPeekView or v90 == l_AppPage_0.InfoPeekView then
        l_v91_0 = false;
    end;
    return {
        transparent = v91, 
        overlayEnabled = l_v91_0
    };
end;
return function(_) --[[ Line: 302 ]]
    -- upvalues: l_AppPage_0 (copy), l_FFlagLuaAppEnableStratusStreamingTestOnly_0 (copy), v2 (copy), v27 (copy), v13 (copy), v29 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), l_GetFFlagEnableLuafiedRecoveryFlow_0 (copy), v14 (copy), v47 (copy), v30 (copy), l_FFlagShareTargetGameCleanup_0 (copy), v46 (copy), v28 (copy), l_FFlagLuaAppSduiEventDetailsEnabled_0 (copy), v41 (copy), v3 (copy), v37 (copy), v38 (copy), v39 (copy), v42 (copy), v56 (copy), v44 (copy), v79 (copy), v59 (copy), v50 (copy), v15 (copy), v43 (copy), v45 (copy), v65 (copy), v61 (copy), v16 (copy), v25 (copy), l_FFlagEnableBlackbird_0 (copy), l_GetFStringBlackbirdUrl_0 (copy), v52 (copy), v17 (copy), v48 (copy), v49 (copy), v70 (copy), v71 (copy), v54 (copy), v55 (copy), v51 (copy), v58 (copy), v36 (copy), v62 (copy), v64 (copy), v73 (copy), v69 (copy), v63 (copy), v32 (copy), v33 (copy), v34 (copy), v53 (copy), v81 (copy), v60 (copy), v40 (copy), v35 (copy), v31 (copy), v76 (copy), v77 (copy), v66 (copy), v67 (copy), v68 (copy), l_FFlagPasskeyUpsellEnabled_0 (copy), l_FFlagTutorialUpsellEnabled_0 (copy), v57 (copy), v74 (copy), v75 (copy), v84 (copy), v78 (copy), l_GetFFlagEnableSecurityAlertDeeplink_0 (copy), v12 (copy), v93 (copy), l_Modules_0 (copy), l_createLazyComponent_0 (copy), l_IsVRAppBuild_0 (copy), l_GuiService_0 (copy), v72 (copy), v24 (copy), l_ScreenKind_0 (copy), l_GlobalNavDisplayOption_0 (copy), l_CorePackages_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy)
    local v281 = {
        [l_AppPage_0.None] = function() --[[ Line: 304 ]]
            return nil;
        end, 
        [l_AppPage_0.VideoServer] = l_FFlagLuaAppEnableStratusStreamingTestOnly_0 and function() --[[ Line: 308 ]]
            -- upvalues: v2 (ref), v27 (ref)
            return v2.createElement(v27);
        end or nil, 
        [l_AppPage_0.UAppBlock] = function(v95) --[[ Line: 312 ]]
            -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
            return v13(v29.UAppBlockPage, l_AppPage_0.UAppBlock, v95);
        end, 
        [l_AppPage_0.LoginV2] = function(v96) --[[ Line: 315 ]]
            -- upvalues: l_FFlagEnableLuaLoginRevamp_0 (ref), v13 (ref), v29 (ref), l_AppPage_0 (ref)
            if l_FFlagEnableLuaLoginRevamp_0 then
                return v13(v29.LoginV2MonoWrapper, l_AppPage_0.Login, v96);
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.AccountRecovery] = function(v97) --[[ Line: 321 ]]
            -- upvalues: l_GetFFlagEnableLuafiedRecoveryFlow_0 (ref), v13 (ref), v29 (ref), l_AppPage_0 (ref)
            if l_GetFFlagEnableLuafiedRecoveryFlow_0() then
                return v13(v29.AccountRecoveryMonoWrapper, l_AppPage_0.AccountRecovery, v97);
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.CharacterSelectionPage] = function(v98) --[[ Line: 331 ]]
            -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
            return v13(v29.CharacterSelectionPage, l_AppPage_0.CharacterSelectionPage, v98);
        end, 
        [l_AppPage_0.UsernameSelectionPage] = function(v99) --[[ Line: 338 ]]
            -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
            return v13(v29.UsernameSelectionPage, l_AppPage_0.UsernameSelectionPage, v99);
        end, 
        [l_AppPage_0.PasswordSelectionPage] = function(v100) --[[ Line: 341 ]]
            -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
            return v13(v29.PasswordSelectionPage, l_AppPage_0.PasswordSelectionPage, v100);
        end, 
        [l_AppPage_0.LuobuSignUpPage] = function(v101) --[[ Line: 344 ]]
            -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
            return v13(v29.LuobuSignUpPage, l_AppPage_0.LuobuSignUpPage, v101);
        end, 
        [l_AppPage_0.WeChatLoginWrapper] = function(v102) --[[ Line: 347 ]]
            -- upvalues: v14 (ref), v13 (ref), v47 (ref), l_AppPage_0 (ref)
            if v14.WeChatLoginEnabled() then
                return v13(v47, l_AppPage_0.WeChatLoginWrapper, v102);
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.GameDetail] = function(v103) --[[ Line: 353 ]]
            -- upvalues: v13 (ref), v30 (ref), l_AppPage_0 (ref)
            return v13(v30, l_AppPage_0.GameDetail, v103);
        end, 
        [l_AppPage_0.ShareGameToChat] = if l_FFlagShareTargetGameCleanup_0 then nil else function(v104, v105) --[[ Line: 358 ]]
            -- upvalues: v13 (ref), v46 (ref), l_AppPage_0 (ref)
            return v13(v46, l_AppPage_0.ShareGameToChat, v104, {
                placeId = v105
            });
        end, 
        [l_AppPage_0.Birthday] = function(v106) --[[ Line: 363 ]]
            -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
            return v13(v29.BirthdayPage, l_AppPage_0.Birthday, v106);
        end, 
        [l_AppPage_0.SafetySupport] = function(v107) --[[ Line: 366 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.SafetySupportPage, l_AppPage_0.SafetySupport, v107);
        end, 
        [l_AppPage_0.Accessibility] = function(v108) --[[ Line: 369 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.DeviceSettingsPage, l_AppPage_0.Accessibility, v108);
        end, 
        [l_AppPage_0.AppInformation] = function(v109) --[[ Line: 372 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.AppInformation, l_AppPage_0.AppInformation, v109);
        end, 
        [l_AppPage_0.DevSubs] = function(v110, v111) --[[ Line: 375 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            local v112 = v111 and {
                selectedGame = v111
            };
            return v13(v28.DevSubsPage, l_AppPage_0.DevSubs, v110, v112);
        end, 
        [l_AppPage_0.EventDetails] = not l_FFlagLuaAppSduiEventDetailsEnabled_0 and function(v113, v114, v115) --[[ Line: 380 ]]
            -- upvalues: v13 (ref), v41 (ref), l_AppPage_0 (ref), v3 (ref)
            return v13(v41, l_AppPage_0.EventDetails, v113, v3.Dictionary.join(v115 or {}, {
                virtualEventId = v114
            }));
        end or nil, 
        [l_AppPage_0.AccountSelectorPeekView] = function(v116, _, v118) --[[ Line: 389 ]]
            -- upvalues: v13 (ref), v37 (ref), l_AppPage_0 (ref)
            return v13(v37, l_AppPage_0.AccountSelectorPeekView, v116, v118);
        end, 
        [l_AppPage_0.AccountSwitchingAddAccountPeekView] = function(v119, _, v121) --[[ Line: 397 ]]
            -- upvalues: v13 (ref), v38 (ref), l_AppPage_0 (ref)
            return v13(v38, l_AppPage_0.AccountSwitchingAddAccountPeekView, v119, v121);
        end, 
        [l_AppPage_0.ShareVirtualEventModal] = function(v122, _, v124) --[[ Line: 405 ]]
            -- upvalues: v13 (ref), v39 (ref), l_AppPage_0 (ref)
            return v13(v39, l_AppPage_0.ShareVirtualEventModal, v122, v124);
        end, 
        [l_AppPage_0.EventNotificationsModal] = function(v125, _, v127) --[[ Line: 408 ]]
            -- upvalues: v13 (ref), v42 (ref), l_AppPage_0 (ref)
            return v13(v42, l_AppPage_0.EventNotificationsModal, v125, v127);
        end, 
        [l_AppPage_0.TencentHelp] = function(v128, v129, v130) --[[ Line: 416 ]]
            -- upvalues: v2 (ref), v56 (ref)
            return v2.createElement(v56, {
                navigationProps = v128, 
                detail = v129, 
                extraProps = v130
            });
        end, 
        [l_AppPage_0.TencentNoticeCenter] = function(v131) --[[ Line: 423 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.TencentNoticeCenterPage, l_AppPage_0.TencentNoticeCenter, v131);
        end, 
        [l_AppPage_0.TencentNoticeContent] = function(v132, _, v134) --[[ Line: 426 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.TencentNoticeContentPage, l_AppPage_0.TencentNoticeContent, v132, v134);
        end, 
        [l_AppPage_0.GenericWebPage] = function(v135, v136, v137) --[[ Line: 434 ]]
            -- upvalues: v2 (ref), v44 (ref)
            return v2.createElement(v44, {
                isVisible = v135.isVisible, 
                DisplayOrder = v135.displayOrder, 
                url = v136, 
                title = v137.title, 
                titleKey = v137.titleKey, 
                searchParams = v137.searchParams, 
                transitionAnimation = v137 and v137.transitionAnimation or nil, 
                onClose = v137 and v137.onClose or nil
            });
        end, 
        [l_AppPage_0.GenericOpaqueWebPage] = function(v138, v139, v140) --[[ Line: 446 ]]
            -- upvalues: v2 (ref), v44 (ref)
            return v2.createElement(v44, {
                isVisible = v138.isVisible, 
                DisplayOrder = v138.displayOrder, 
                url = v139, 
                title = v140.title, 
                titleKey = v140.titleKey, 
                searchParams = v140.searchParams, 
                transitionAnimation = v140 and v140.transitionAnimation or nil, 
                onClose = v140 and v140.onClose or nil
            });
        end, 
        [l_AppPage_0.SettingsSubPage] = function(v141, v142, v143) --[[ Line: 458 ]]
            -- upvalues: v79 (ref), v2 (ref), v59 (ref), v50 (ref), v15 (ref)
            if v79.GetFFlagLuaAppUseSettingsNativeWrapper() then
                return v2.createElement(v59, {
                    url = v142, 
                    titleKey = v143.titleKey, 
                    windowCloseCallback = v143 and v143.onClose or nil, 
                    isVisible = v141.isVisible, 
                    displayOrder = v141.displayOrder
                });
            else
                return v2.createElement(v50, {
                    isVisible = v141.isVisible, 
                    DisplayOrder = v141.displayOrder, 
                    notificationType = v143.notificationType or v15.OPEN_SETTINGS_WEBVIEW, 
                    url = v142, 
                    title = v143.title, 
                    titleKey = v143.titleKey, 
                    searchParams = if v79.GetFFlagEnableUnifiedStaticWebViews() then v143.searchParams else nil, 
                    transitionAnimation = v143 and v143.transitionAnimation or nil, 
                    onClose = v143 and v143.onClose or nil
                });
            end;
        end, 
        [l_AppPage_0.YouTubePlayer] = function(v144, v145, v146) --[[ Line: 481 ]]
            -- upvalues: v2 (ref), v43 (ref)
            return v2.createElement(v43, {
                isVisible = v144.isVisible, 
                DisplayOrder = v144.displayOrder, 
                url = v145, 
                title = v146.title, 
                transitionAnimation = v146 and v146.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.ScanQrCode] = function(v147, _, v149) --[[ Line: 490 ]]
            -- upvalues: v2 (ref), v45 (ref), v15 (ref)
            return v2.createElement(v45, {
                isVisible = v147.isVisible, 
                DisplayOrder = v147.displayOrder, 
                transitionAnimation = v149 and v149.transitionAnimation or nil, 
                notificationType = v15.SCAN_QR_CODE
            });
        end, 
        [l_AppPage_0.AvatarExperienceWrapper] = function(v150, _, v152) --[[ Line: 498 ]]
            -- upvalues: v13 (ref), v65 (ref), l_AppPage_0 (ref)
            return v13(v65, l_AppPage_0.AvatarExperienceWrapper, v150, v152);
        end, 
        [l_AppPage_0.AvatarExperienceWrapperTransparent] = function(v153, _, v155) --[[ Line: 506 ]]
            -- upvalues: v13 (ref), v65 (ref), l_AppPage_0 (ref)
            return v13(v65, l_AppPage_0.AvatarExperienceWrapperTransparent, v153, v155);
        end, 
        [l_AppPage_0.BuildersClub] = function(v156, _, v158) --[[ Line: 514 ]]
            -- upvalues: v79 (ref), v2 (ref), v61 (ref), v16 (ref), v25 (ref), v45 (ref), v15 (ref)
            if v79.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v61, {
                    url = v16.fromString("www:premium/membership")(), 
                    titleKey = "CommonUI.Features.Label.Premium", 
                    transitionAnimation = v158.transitionAnimation, 
                    hasBackButton = not v25() and nil, 
                    overlayProps = {
                        isVisible = v156.isVisible, 
                        DisplayOrder = v156.displayOrder
                    }
                });
            else
                return v2.createElement(v45, {
                    isVisible = v156.isVisible, 
                    DisplayOrder = v156.displayOrder, 
                    notificationType = v15.OPEN_BUILDERS_CLUB, 
                    titleTextLocalizationKey = "CommonUI.Features.Label.Premium", 
                    transitionAnimation = v158 and v158.transitionAnimation or nil
                });
            end;
        end, 
        [l_AppPage_0.Blackbird] = l_FFlagEnableBlackbird_0 and function(v159, _, v161) --[[ Line: 538 ]]
            -- upvalues: v79 (ref), v2 (ref), v61 (ref), v16 (ref), l_GetFStringBlackbirdUrl_0 (ref), v25 (ref)
            if v79.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v61, {
                    url = v16.fromString(l_GetFStringBlackbirdUrl_0())(), 
                    titleKey = "CommonUI.Features.Label.X", 
                    transitionAnimation = v161.transitionAnimation, 
                    hasBackButton = not v25() and nil, 
                    overlayProps = {
                        isVisible = v159.isVisible, 
                        DisplayOrder = v159.displayOrder
                    }
                });
            else
                return nil;
            end;
        end or nil, 
        [l_AppPage_0.Payment] = function(v162, v163, v164) --[[ Line: 559 ]]
            -- upvalues: v2 (ref), v52 (ref), v79 (ref), v16 (ref)
            return v2.createElement(v52, {
                url = if v79.GetFFlagEnableUnifiedStaticWebViews() and v164 and v164.analyticId ~= nil then v16.fromString("www:upgrades/paymentmethods?ap={productId}&analyticId={analyticId}")({
                    productId = v163, 
                    analyticId = v164.analyticId
                }) else if v79.GetFFlagEnableUnifiedStaticWebViews() then v16.fromString("www:upgrades/paymentmethods?ap={productId}")({
                    productId = v163
                }) else nil, 
                isVisible = v162.isVisible, 
                DisplayOrder = v162.displayOrder, 
                transitionAnimation = v164 and v164.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.Notifications] = function(v165, _, v167) --[[ Line: 578 ]]
            -- upvalues: v79 (ref), v2 (ref), v61 (ref), v16 (ref), v17 (ref), v45 (ref), v15 (ref)
            if v79.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v61, {
                    url = v16.fromString("www:notificationstream/embedded")(), 
                    titleKey = "Feature.AccountSettings.Heading.Tab.Notifications", 
                    windowType = v17.Dialog, 
                    transitionAnimation = v167.transitionAnimation, 
                    searchParams = v167.searchParams, 
                    windowCloseCallback = v167.onClose, 
                    overlayProps = {
                        isVisible = v165.isVisible, 
                        DisplayOrder = v165.displayOrder
                    }
                });
            else
                return v2.createElement(v45, {
                    isVisible = v165.isVisible, 
                    DisplayOrder = v165.displayOrder, 
                    notificationType = v15.VIEW_NOTIFICATIONS, 
                    transitionAnimation = v167 and v167.transitionAnimation or nil, 
                    titleTextLocalizationKey = "Feature.AccountSettings.Heading.Tab.Notifications", 
                    onClose = v167 and v167.onClose or nil
                });
            end;
        end, 
        [l_AppPage_0.LogoutConfirmation] = function(v168, _, v170) --[[ Line: 604 ]]
            -- upvalues: v2 (ref), v45 (ref), v15 (ref)
            return v2.createElement(v45, {
                isVisible = v168.isVisible, 
                DisplayOrder = v168.displayOrder, 
                notificationType = v15.ACTION_LOG_OUT, 
                transitionAnimation = v170 and v170.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.AddFriends] = function(v171, _, v173) --[[ Line: 612 ]]
            -- upvalues: v79 (ref), v2 (ref), v61 (ref), v16 (ref), v45 (ref), v15 (ref)
            if v79.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v61, {
                    url = v16.fromString("www:users/friends#!/friend-requests?onlyShowContents=true")(), 
                    titleKey = "CommonUI.Features.Label.Friends", 
                    transitionAnimation = v173.transitionAnimation, 
                    searchParams = {
                        searchType = "Players"
                    }, 
                    windowCloseCallback = v173.onClose, 
                    overlayProps = {
                        isVisible = v171.isVisible, 
                        DisplayOrder = v171.displayOrder
                    }
                });
            else
                return v2.createElement(v45, {
                    isVisible = v171.isVisible, 
                    DisplayOrder = v171.displayOrder, 
                    notificationType = v15.UNIVERSAL_FRIENDS, 
                    transitionAnimation = v173 and v173.transitionAnimation or nil, 
                    titleTextLocalizationKey = "CommonUI.Features.Label.Friends", 
                    onClose = v173 and v173.onClose or nil
                });
            end;
        end, 
        [l_AppPage_0.ViewUserProfile] = function(v174, v175, v176) --[[ Line: 639 ]]
            -- upvalues: v2 (ref), v48 (ref)
            return v2.createElement(v48, {
                isVisible = v174.isVisible, 
                DisplayOrder = v174.displayOrder, 
                userId = v175, 
                onClose = v176 and v176.onClose or nil
            });
        end, 
        [l_AppPage_0.ViewProfile] = function(v177, v178) --[[ Line: 647 ]]
            -- upvalues: v2 (ref), v49 (ref)
            return v2.createElement(v49, {
                isVisible = v177.isVisible, 
                DisplayOrder = v177.displayOrder, 
                url = v178
            });
        end, 
        [l_AppPage_0.LoginNative] = function(v179, _, v181) --[[ Line: 654 ]]
            -- upvalues: v2 (ref), v45 (ref), v15 (ref)
            return v2.createElement(v45, {
                isVisible = v179.isVisible, 
                DisplayOrder = v179.displayOrder, 
                notificationType = v15.ACTION_LOG_IN, 
                transitionAnimation = v181 and v181.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.CaptchaNative] = function(v182, _, v184) --[[ Line: 662 ]]
            -- upvalues: v2 (ref), v29 (ref)
            local v185 = v184.captchaType == "signup";
            if v184.captchaType == "login" or v185 then
                local v186 = {
                    isVisible = v182.isVisible, 
                    DisplayOrder = v182.displayOrder, 
                    captchaType = v184.captchaType, 
                    cvalueType = v184.cvalueType, 
                    cvalue = v184.cvalue, 
                    dxBlob = v184.dxBlob, 
                    captchaId = v184.captchaId, 
                    captchaCallback = v184.captchaCallback, 
                    backNavigationDisabledWhileLoading = v184.backNavigationDisabledWhileLoading, 
                    transitionAnimation = v184 and v184.transitionAnimation or nil, 
                    webViewVisible = false
                };
                return v2.createElement(v29.CaptchaPageBrowserServiceWrapper, v186);
            else
                return v2.createElement(v29.CaptchaPageBrowserServiceWrapper, {
                    isVisible = v182.isVisible, 
                    DisplayOrder = v182.displayOrder, 
                    captchaType = v184.captchaType, 
                    cvalueType = v184.cvalueType, 
                    cvalue = v184.cvalue, 
                    captchaCallback = v184.captchaCallback, 
                    backNavigationDisabledWhileLoading = v184.backNavigationDisabledWhileLoading, 
                    transitionAnimation = v184 and v184.transitionAnimation or nil, 
                    webViewVisible = false
                });
            end;
        end, 
        [l_AppPage_0.RobuxUpsell] = function(v187, _, v189) --[[ Line: 694 ]]
            -- upvalues: v13 (ref), v70 (ref), l_AppPage_0 (ref)
            return v13(v70, l_AppPage_0.RobuxUpsell, v187, v189);
        end, 
        [l_AppPage_0.SubscriptionPurchase] = function(v190, _, v192) --[[ Line: 697 ]]
            -- upvalues: v13 (ref), v71 (ref), l_AppPage_0 (ref)
            return v13(v71, l_AppPage_0.SubscriptionPurchase, v190, v192);
        end, 
        [l_AppPage_0.ShareSheet] = function(v193, _, v195) --[[ Line: 705 ]]
            -- upvalues: v2 (ref), v54 (ref)
            return v2.createElement(v54, {
                isVisible = v193.isVisible, 
                DisplayOrder = v193.displayOrder, 
                data = v195
            });
        end, 
        [l_AppPage_0.SdkShare] = function(v196, _, v198) --[[ Line: 712 ]]
            -- upvalues: v2 (ref), v55 (ref)
            return v2.createElement(v55, {
                isVisible = v196.isVisible, 
                DisplayOrder = v196.displayOrder, 
                data = v198
            });
        end, 
        [l_AppPage_0.ReportAbuse] = function(v199, v200, v201) --[[ Line: 719 ]]
            -- upvalues: v2 (ref), v51 (ref)
            return v2.createElement(v51, {
                isVisible = v199.isVisible, 
                DisplayOrder = v199.displayOrder, 
                url = v200, 
                onClose = v201 and v201.onClose or nil
            });
        end, 
        [l_AppPage_0.PhoneVerification] = function(_, _, v204) --[[ Line: 727 ]]
            -- upvalues: v2 (ref), v58 (ref)
            return v2.createElement(v58, v204);
        end, 
        [l_AppPage_0.EditUsername] = function(_, _, v207) --[[ Line: 730 ]]
            -- upvalues: v2 (ref), v36 (ref)
            return v2.createElement(v36, v207);
        end, 
        [l_AppPage_0.ChallengeHybridOverlayPage] = function(v208, _, v210) --[[ Line: 733 ]]
            -- upvalues: v13 (ref), v62 (ref), l_AppPage_0 (ref)
            return v13(v62, l_AppPage_0.ChallengeHybridOverlayPage, v208, v210);
        end, 
        [l_AppPage_0.ChallengeDialogModalContainer] = v79.GetFFlagLuaAppChallengeDialogContainerPageEnabled() and function(v211, _, v213) --[[ Line: 742 ]]
            -- upvalues: v13 (ref), v64 (ref), l_AppPage_0 (ref)
            return v13(v64, l_AppPage_0.ChallengeDialogModalContainer, v211, v213);
        end or nil, 
        [l_AppPage_0.ReportDialog] = function(v214) --[[ Line: 751 ]]
            -- upvalues: v13 (ref), v73 (ref), l_AppPage_0 (ref)
            return v13(v73, l_AppPage_0.ReportDialog, v214);
        end, 
        [l_AppPage_0.AgeVerificationRequired] = function(v215, v216) --[[ Line: 754 ]]
            -- upvalues: v13 (ref), v69 (ref), l_AppPage_0 (ref)
            local v217 = v216 and {
                universeId = v216
            } or nil;
            return v13(v69, l_AppPage_0.AgeVerificationRequired, v215, v217);
        end, 
        [l_AppPage_0.ChallengeHybridWebView] = function(v218, _, v220) --[[ Line: 766 ]]
            -- upvalues: v2 (ref), v63 (ref), v3 (ref)
            return v2.createElement(v63, v3.Dictionary.join(v220, {
                appContainerNavigation = v218
            }));
        end, 
        [l_AppPage_0.InviteLinkExpiredModal] = function(v221, _, v223) --[[ Line: 774 ]]
            -- upvalues: v13 (ref), v32 (ref), l_AppPage_0 (ref)
            return v13(v32, l_AppPage_0.InviteLinkExpiredModal, v221, v223);
        end, 
        [l_AppPage_0.ShareLinkInvalidModal] = function(v224, _, v226) --[[ Line: 782 ]]
            -- upvalues: v13 (ref), v33 (ref), l_AppPage_0 (ref)
            return v13(v33, l_AppPage_0.ShareLinkInvalidModal, v224, v226);
        end, 
        [l_AppPage_0.ProfileQRCodePage] = function(v227, _, v229) --[[ Line: 790 ]]
            -- upvalues: v13 (ref), v34 (ref), l_AppPage_0 (ref)
            return v13(v34, l_AppPage_0.ProfileQRCodePage, v227, v229);
        end, 
        [l_AppPage_0.AccountInfo] = function(v230, v231, v232) --[[ Line: 793 ]]
            -- upvalues: v79 (ref), v2 (ref), v53 (ref), v3 (ref)
            if v79.FFlagFetchUserNameOnCloseAccountInfo then
                return v2.createElement(v53, v3.Dictionary.join(v232, {
                    isVisible = v230.isVisible, 
                    displayOrder = v230.displayOrder, 
                    url = v231
                }));
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.ParentVerification] = function(_, v234) --[[ Line: 808 ]]
            -- upvalues: v81 (ref), v2 (ref), v60 (ref), v16 (ref)
            if v81 then
                return v2.createElement(v60, {
                    url = v234
                });
            else
                return v2.createElement(v60, {
                    url = v16.fromString("www:parents/account-setup")()
                });
            end;
        end, 
        [l_AppPage_0.EmailVerification] = function(_, v236) --[[ Line: 819 ]]
            -- upvalues: v81 (ref), v2 (ref), v60 (ref), v16 (ref)
            if v81 then
                return v2.createElement(v60, {
                    url = v236
                });
            else
                return v2.createElement(v60, {
                    url = v16.fromString("www:")()
                });
            end;
        end, 
        [l_AppPage_0.VerifiedBadgeModal] = function(v237, _, v239) --[[ Line: 830 ]]
            -- upvalues: v13 (ref), v40 (ref), l_AppPage_0 (ref)
            return v13(v40, l_AppPage_0.VerifiedBadgeModal, v237, v239);
        end, 
        [l_AppPage_0.SocialMessageToast] = function(v240, _, v242) --[[ Line: 833 ]]
            -- upvalues: v13 (ref), v35 (ref), l_AppPage_0 (ref)
            return v13(v35, l_AppPage_0.SocialMessageToast, v240, v242);
        end, 
        [l_AppPage_0.PassesPage] = function(v243, v244, v245) --[[ Line: 836 ]]
            -- upvalues: v3 (ref), v13 (ref), v31 (ref), l_AppPage_0 (ref)
            local v246 = {
                universeId = v244
            };
            if v245 then
                v246 = v3.Dictionary.join(v245, v246);
            end;
            return v13(v31, l_AppPage_0.PassesPage, v243, v246);
        end, 
        [l_AppPage_0.AccountSettingsUpsell] = v79.GetFFlagEnableAccountSettingsUpsell() and function(v247, _, v249) --[[ Line: 846 ]]
            -- upvalues: v13 (ref), v76 (ref), l_AppPage_0 (ref)
            return v13(v76, l_AppPage_0.AccountSettingsUpsell, v247, v249);
        end or nil, 
        [l_AppPage_0.AmpWizardContainer] = v79.GetFFlagEnableAmpUpsellWizard() and function(v250, _, v252) --[[ Line: 856 ]]
            -- upvalues: v13 (ref), v77 (ref), l_AppPage_0 (ref)
            return v13(v77, l_AppPage_0.AmpWizardContainer, v250, v252);
        end or nil, 
        [l_AppPage_0.IDVUpsellContainer] = v79.GetFFlagEnableAmpIDVUpsellSupport() and function(v253, _, v255) --[[ Line: 866 ]]
            -- upvalues: v13 (ref), v66 (ref), l_AppPage_0 (ref)
            return v13(v66, l_AppPage_0.IDVUpsellContainer, v253, v255);
        end or nil, 
        [l_AppPage_0.VPCUpsellContainer] = function(v256, _, v258) --[[ Line: 870 ]]
            -- upvalues: v13 (ref), v67 (ref), l_AppPage_0 (ref)
            return v13(v67, l_AppPage_0.VPCUpsellContainer, v256, v258);
        end, 
        [l_AppPage_0.RobloxSubscriptionUpsell] = v79.GetFFlagEnableAmpSubscriptionUpsell() and function(v259, _, v261) --[[ Line: 874 ]]
            -- upvalues: v13 (ref), v68 (ref), l_AppPage_0 (ref)
            return v13(v68, l_AppPage_0.RobloxSubscriptionUpsell, v259, v261);
        end or nil, 
        [l_AppPage_0.AddAuthMethodPage] = function(v262) --[[ Line: 883 ]]
            -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
            return v13(v29.AddAuthMethodPage, l_AppPage_0.AddAuthMethodPage, v262);
        end, 
        [l_AppPage_0.PasskeyUpsellScreen] = l_FFlagPasskeyUpsellEnabled_0 and function(v263, _, v265) --[[ Line: 887 ]]
            -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
            return v13(v29.PasskeyUpsellScreen, l_AppPage_0.PasskeyUpsellScreen, v263, v265);
        end or nil, 
        [l_AppPage_0.TutorialUpsellScreen] = l_FFlagTutorialUpsellEnabled_0 and function(v266, _, v268) --[[ Line: 897 ]]
            -- upvalues: v13 (ref), v57 (ref), l_AppPage_0 (ref)
            return v13(v57, l_AppPage_0.TutorialUpsellScreen, v266, v268);
        end or nil, 
        [l_AppPage_0.SponsoredTooltipPeekView] = function(v269, _, v271) --[[ Line: 906 ]]
            -- upvalues: v13 (ref), v74 (ref), l_AppPage_0 (ref)
            return v13(v74, l_AppPage_0.SponsoredTooltipPeekView, v269, v271);
        end, 
        [l_AppPage_0.InfoPeekView] = function(v272, _, v274) --[[ Line: 914 ]]
            -- upvalues: v13 (ref), v75 (ref), l_AppPage_0 (ref)
            return v13(v75, l_AppPage_0.InfoPeekView, v272, v274);
        end, 
        [l_AppPage_0.VoiceTrialUpsell] = v84() and function(v275, _, v277) --[[ Line: 918 ]]
            -- upvalues: v13 (ref), v78 (ref), l_AppPage_0 (ref)
            return v13(v78, l_AppPage_0.VoiceTrialUpsell, v275, v277);
        end or nil, 
        [l_AppPage_0.SecurityAlertInfo] = l_GetFFlagEnableSecurityAlertDeeplink_0() and function(v278, v279, v280) --[[ Line: 923 ]]
            -- upvalues: v2 (ref), v50 (ref), v15 (ref), v79 (ref)
            return v2.createElement(v50, {
                isVisible = v278.isVisible, 
                DisplayOrder = v278.displayOrder, 
                titleKey = "Feature.SecurityFeedback.Header.NewLogin", 
                notificationType = v15.OPEN_CUSTOM_WEBVIEW, 
                url = v279, 
                searchParams = if v79.GetFFlagEnableUnifiedStaticWebViews() then v280.searchParams else nil, 
                transitionAnimation = v280 and v280.transitionAnimation or nil, 
                onClose = v280 and v280.onClose or nil
            });
        end or nil
    };
    local v282 = {};
    for v283, v284 in v281 do
        table.insert(v282, {
            [v283] = {
                screen = v12(v284, v283), 
                navigationOptions = v93(v283)
            }
        });
    end;
    table.insert(v282, {
        [l_AppPage_0.AvatarExperienceRoot] = {
            getScreen = function() --[[ Line: 952 ]] --[[ Name: getScreen ]]
                -- upvalues: l_Modules_0 (ref)
                return require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootContainer);
            end, 
            navigationOptions = {
                hasSubNavigation = true
            }
        }
    });
    table.insert(v282, {
        [l_AppPage_0.Chat] = l_createLazyComponent_0(function() --[[ Line: 962 ]]
            -- upvalues: l_Modules_0 (ref)
            return require(l_Modules_0.LuaApp.Components.SocialTab.SocialTabUniversalAppWrapper.Container);
        end)
    });
    table.insert(v282, {
        [l_AppPage_0.PurchaseRobux] = {
            screen = v12(function(v285, v286, v287) --[[ Line: 969 ]]
                -- upvalues: v79 (ref), l_IsVRAppBuild_0 (ref), l_GuiService_0 (ref), v13 (ref), v72 (ref), l_AppPage_0 (ref), v24 (ref), v16 (ref), v2 (ref), v52 (ref)
                if v79.GetFFlagLuaAppLuaBuyRobuxPage() and l_IsVRAppBuild_0() or l_GuiService_0:IsTenFootInterface() then
                    return v13(v72, l_AppPage_0.PurchaseRobux, v285, v287);
                else
                    local v288 = nil;
                    if v24 then
                        v288 = v16.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId|}&product_id={productId|}")(v287);
                    end;
                    return v2.createElement(v52, {
                        url = if v24 then v288 else if v79.GetFFlagEnableUnifiedStaticWebViews() then v16.fromString("www:Upgrades/Robux.aspx")() else if v286 then v16.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId}")({
                            analyticId = v286
                        }) else nil, 
                        isVisible = v285.isVisible, 
                        DisplayOrder = v285.displayOrder, 
                        transitionAnimation = v287 and v287.transitionAnimation or nil
                    });
                end;
            end, l_AppPage_0.PurchaseRobux), 
            navigationOptions = v3.Dictionary.join({
                screenKind = l_ScreenKind_0.FullScreen, 
                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
            }, (v93(l_AppPage_0.PurchaseRobux)))
        }
    });
    table.insert(v282, {
        [l_AppPage_0.ReportScreen] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 1007 ]]
                -- upvalues: l_CorePackages_0 (ref)
                return require(l_CorePackages_0.Workspace.Packages.AbuseReporting).ReportScreen;
            end), 
            navigationOptions = {
                screenKind = l_ScreenKind_0.FullScreen, 
                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
            }
        }
    });
    table.insert(v282, {
        [l_AppPage_0.ChallengeNativeWrapper] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 1019 ]]
                -- upvalues: l_Modules_0 (ref)
                return require(l_Modules_0.LuaApp.Components.Challenge.NativeWrapper);
            end), 
            navigationOptions = {
                transparent = v79.GetFFlagEnableTransparentNativeChallengeWrapper() and true or nil, 
                globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
            }
        }
    });
    table.insert(v282, {
        [l_AppPage_0.FAEUpsell] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 1031 ]]
                -- upvalues: l_CorePackages_0 (ref)
                return require(l_CorePackages_0.Workspace.Packages.AmpUpsell).FAEUpsellContainer;
            end), 
            navigationOptions = v93(l_AppPage_0.FAEUpsell)
        }
    });
    if l_FFlagEnableNapDedicatedPage_0 then
        table.insert(v282, {
            [l_AppPage_0.NotApprovedPage] = {
                screen = v12(function(v289, _, v291) --[[ Line: 1042 ]]
                    -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
                    return v13(v29.NotApprovedPage, l_AppPage_0.NotApprovedPage, v289, v291);
                end, l_AppPage_0.NotApprovedPage), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        });
    end;
    return v282;
end;