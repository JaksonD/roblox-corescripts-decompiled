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
local v23 = require(l_Modules_0.LuaApp.Flags.FFlagReworkPurchaseRobuxPage);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility);
local l_FFlagLuaAppEnableStratusStreamingTestOnly_0 = v20.FFlagLuaAppEnableStratusStreamingTestOnly;
local v26 = l_createLazyComponent_0(function() --[[ Line: 36 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.VideoServerScreen).VideoServerScreenContainer;
end);
local v27 = {
    SafetySupportPage = l_createLazyComponent_0(function() --[[ Line: 41 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.SafetySupportPage);
    end), 
    DeviceSettingsPage = l_createLazyComponent_0(function() --[[ Line: 44 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.DeviceSettings.DeviceSettingsPage);
    end), 
    AppInformation = l_createLazyComponent_0(function() --[[ Line: 47 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.AppInformationPage);
    end), 
    DevSubsPage = l_createLazyComponent_0(function() --[[ Line: 50 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.DevSubsPage);
    end), 
    TencentNoticeCenterPage = l_createLazyComponent_0(function() --[[ Line: 53 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeCenterPage);
    end), 
    TencentNoticeContentPage = l_createLazyComponent_0(function() --[[ Line: 56 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeContentPage);
    end)
};
local v28 = {
    CharacterSelectionPage = l_createLazyComponent_0(function() --[[ Line: 61 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.CharacterSelectPage);
    end), 
    UsernameSelectionPage = l_createLazyComponent_0(function() --[[ Line: 64 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.UsernameSelectionPage);
    end), 
    PasswordSelectionPage = l_createLazyComponent_0(function() --[[ Line: 67 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.PasswordSelectionPage);
    end), 
    LoginV2MonoWrapper = l_createLazyComponent_0(function() --[[ Line: 70 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.LoginV2MonoWrapper);
    end), 
    AccountRecoveryMonoWrapper = l_createLazyComponent_0(function() --[[ Line: 73 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.AccountSecurity.AccountRecoveryMonoWrapper);
    end), 
    UAppBlockPage = l_createLazyComponent_0(function() --[[ Line: 76 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.UAppBlockPage);
    end), 
    LandingPage = l_createLazyComponent_0(function() --[[ Line: 79 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.LandingPage);
    end), 
    LuobuLandingPage = l_createLazyComponent_0(function() --[[ Line: 82 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.Authentication.LuobuLandingPage);
    end), 
    BirthdayPage = l_createLazyComponent_0(function() --[[ Line: 85 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.BirthdayPage);
    end), 
    LuobuSignUpPage = l_createLazyComponent_0(function() --[[ Line: 88 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.Authentication.LuobuSignUpPage);
    end), 
    AddAuthMethodPage = l_createLazyComponent_0(function() --[[ Line: 91 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.AddAuthMethodPage);
    end), 
    PasskeyUpsellScreen = l_createLazyComponent_0(function() --[[ Line: 94 ]]
        -- upvalues: l_CorePackages_0 (copy)
        return require(l_CorePackages_0.Workspace.Packages.PasskeyUpsell).Components.PasskeyUpsellScreen;
    end), 
    CaptchaPageBrowserServiceWrapper = l_createLazyComponent_0(function() --[[ Line: 97 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.CaptchaPageBrowserServiceWrapper);
    end), 
    NotApprovedPage = l_createLazyComponent_0(function() --[[ Line: 100 ]]
        -- upvalues: l_CorePackages_0 (copy)
        return require(l_CorePackages_0.Workspace.Packages.NotApprovedPage).NotApprovedPageV2;
    end)
};
local v29 = l_createLazyComponent_0(function() --[[ Line: 104 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector);
end);
local v30 = l_createLazyComponent_0(function() --[[ Line: 107 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.BlackbirdPageWrapper);
end);
local v31 = l_createLazyComponent_0(function() --[[ Line: 110 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Passes.PassesPage);
end);
local v32 = l_createLazyComponent_0(function() --[[ Line: 113 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.InviteLinkExpiredModal.api).InviteLinkExpiredModal;
end);
local v33 = l_createLazyComponent_0(function() --[[ Line: 116 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ShareLinkInvalidModal.api).ShareLinkInvalidModal;
end);
local v34 = l_createLazyComponent_0(function() --[[ Line: 119 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ProfileQRCodePage.api).ProfileQRCodeEntryPoint;
end);
local v35 = l_createLazyComponent_0(function() --[[ Line: 122 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.SocialMessageToast.api).RootScreen;
end);
local v36 = l_createLazyComponent_0(function() --[[ Line: 125 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.EditProfile).EditUsernameWrapper;
end);
local v37 = l_createLazyComponent_0(function() --[[ Line: 128 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSelectorPeekView;
end);
local v38 = l_createLazyComponent_0(function() --[[ Line: 131 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSwitchingAddAccountPeekView;
end);
local v39 = l_createLazyComponent_0(function() --[[ Line: 134 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.VirtualEvents).ShareEventModal;
end);
local v40 = l_createLazyComponent_0(function() --[[ Line: 137 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.VerifiedBadges).AboutVerifiedBadgeModal;
end);
local v41 = l_createLazyComponent_0(function() --[[ Line: 140 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.VirtualEvents.EventDetailsWrapper);
end);
local v42 = l_createLazyComponent_0(function() --[[ Line: 143 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.VirtualEvents.EventNotificationsModalWrapper);
end);
local v43 = l_createLazyComponent_0(function() --[[ Line: 146 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.YouTubePageWrapper);
end);
local v44 = l_createLazyComponent_0(function() --[[ Line: 149 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.GenericWebPageWrapper);
end);
local v45 = l_createLazyComponent_0(function() --[[ Line: 152 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.GenericNativePageWrapper);
end);
local v46 = l_createLazyComponent_0(function() --[[ Line: 155 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.ShareTargetGame.Components.ShareTargetGameEntrypoint);
end);
local v47 = l_createLazyComponent_0(function() --[[ Line: 158 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Authentication.WeChatLoginWrapper);
end);
local v48 = l_createLazyComponent_0(function() --[[ Line: 161 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativeViewUserProfileWrapper);
end);
local v49 = l_createLazyComponent_0(function() --[[ Line: 164 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativeViewProfileWrapper);
end);
local v50 = l_createLazyComponent_0(function() --[[ Line: 167 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativePageWithUrlWrapper);
end);
local v51 = l_createLazyComponent_0(function() --[[ Line: 170 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativeReportAbuseWrapper);
end);
local v52 = l_createLazyComponent_0(function() --[[ Line: 173 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativePurchaseRobuxPageWrapper);
end);
local v53 = l_createLazyComponent_0(function() --[[ Line: 176 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.More.AccountInfoPage);
end);
local v54 = l_createLazyComponent_0(function() --[[ Line: 179 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ShareSheetWrapper);
end);
local v55 = l_createLazyComponent_0(function() --[[ Line: 182 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.SdkShareWrapper);
end);
local v56 = l_createLazyComponent_0(function() --[[ Line: 185 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.Luobu.Components.More.TencentHelp.TencentHelpWrapper);
end);
local v57 = l_createLazyComponent_0(function() --[[ Line: 188 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.TutorialUpsell).Components.TutorialUpsellScreen;
end);
local v58 = l_createLazyComponent_0(function() --[[ Line: 191 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Authentication.VerificationUpsell.PhoneVerificationNativeWrapper);
end);
local v59 = l_createLazyComponent_0(function() --[[ Line: 194 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.SettingsNativeWrapper);
end);
local v60 = l_createLazyComponent_0(function() --[[ Line: 197 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.More.ParentVerificationPage);
end);
local v61 = l_createLazyComponent_0(function() --[[ Line: 200 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
end);
local v62 = l_createLazyComponent_0(function() --[[ Line: 203 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Challenge.HybridOverlayPage);
end);
local v63 = l_createLazyComponent_0(function() --[[ Line: 206 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Challenge.HybridWebView);
end);
local v64 = l_createLazyComponent_0(function() --[[ Line: 209 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).ChallengeDialogModalContainer;
end);
local v65 = l_createLazyComponent_0(function() --[[ Line: 212 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AvatarExperienceWrapper);
end);
local v66 = l_createLazyComponent_0(function() --[[ Line: 215 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AmpUpsell).IDVUpsellContainer;
end);
local v67 = l_createLazyComponent_0(function() --[[ Line: 218 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AmpUpsell).VPCUpsellContainer;
end);
local v68 = l_createLazyComponent_0(function() --[[ Line: 221 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AmpUpsell.RobloxSubscriptionUpsellScreen);
end);
local v69 = l_createLazyComponent_0(function() --[[ Line: 224 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AgeVerification.AgeVerificationModal);
end);
local v70 = l_createLazyComponent_0(function() --[[ Line: 227 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.RobuxUpsell.RobuxUpsellContainer);
end);
local v71 = l_createLazyComponent_0(function() --[[ Line: 230 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Subscription.Purchase.SubscriptionPurchaseContainer);
end);
local v72 = l_createLazyComponent_0(function() --[[ Line: 233 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.BuyRobux.BuyRobuxContainer);
end);
local v73 = l_createLazyComponent_0(function() --[[ Line: 236 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportContainer);
end);
local v74 = l_createLazyComponent_0(function() --[[ Line: 239 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Games.SponsoredTooltipPeekView);
end);
local v75 = l_createLazyComponent_0(function() --[[ Line: 242 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AppBlox).InfoPeekView;
end);
local v76 = l_createLazyComponent_0(function() --[[ Line: 245 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AmpUpsell.AccountSettingsUpsellWrapper);
end);
local v77 = l_createLazyComponent_0(function() --[[ Line: 248 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AmpUpsell.AmpWizardContainerWrapper);
end);
local v78 = l_createLazyComponent_0(function() --[[ Line: 251 ]]
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
local function v93(v90) --[[ Line: 280 ]] --[[ Name: getLegacyNavigationOptions ]]
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
return function(_) --[[ Line: 304 ]]
    -- upvalues: l_AppPage_0 (copy), l_FFlagLuaAppEnableStratusStreamingTestOnly_0 (copy), v2 (copy), v26 (copy), v13 (copy), v28 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), l_GetFFlagEnableLuafiedRecoveryFlow_0 (copy), v14 (copy), v47 (copy), v29 (copy), l_FFlagShareTargetGameCleanup_0 (copy), v46 (copy), v27 (copy), l_FFlagLuaAppSduiEventDetailsEnabled_0 (copy), v41 (copy), v3 (copy), v37 (copy), v38 (copy), v39 (copy), v42 (copy), v56 (copy), v44 (copy), v79 (copy), v59 (copy), v50 (copy), v15 (copy), v43 (copy), v45 (copy), v65 (copy), v61 (copy), v16 (copy), v24 (copy), l_FFlagEnableBlackbird_0 (copy), v30 (copy), v52 (copy), v17 (copy), v48 (copy), v49 (copy), v70 (copy), v71 (copy), v54 (copy), v55 (copy), v51 (copy), v58 (copy), v36 (copy), v62 (copy), v64 (copy), v73 (copy), v69 (copy), v63 (copy), v32 (copy), v33 (copy), v34 (copy), v53 (copy), v81 (copy), v60 (copy), v40 (copy), v35 (copy), v31 (copy), v76 (copy), v77 (copy), v66 (copy), v67 (copy), v68 (copy), l_FFlagPasskeyUpsellEnabled_0 (copy), l_FFlagTutorialUpsellEnabled_0 (copy), v57 (copy), v74 (copy), v75 (copy), v84 (copy), v78 (copy), l_GetFFlagEnableSecurityAlertDeeplink_0 (copy), v12 (copy), v93 (copy), l_Modules_0 (copy), l_createLazyComponent_0 (copy), l_IsVRAppBuild_0 (copy), l_GuiService_0 (copy), v72 (copy), v23 (copy), l_ScreenKind_0 (copy), l_GlobalNavDisplayOption_0 (copy), l_CorePackages_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy)
    local v281 = {
        [l_AppPage_0.None] = function() --[[ Line: 306 ]]
            return nil;
        end, 
        [l_AppPage_0.VideoServer] = l_FFlagLuaAppEnableStratusStreamingTestOnly_0 and function() --[[ Line: 310 ]]
            -- upvalues: v2 (ref), v26 (ref)
            return v2.createElement(v26);
        end or nil, 
        [l_AppPage_0.UAppBlock] = function(v95) --[[ Line: 314 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.UAppBlockPage, l_AppPage_0.UAppBlock, v95);
        end, 
        [l_AppPage_0.LoginV2] = function(v96) --[[ Line: 317 ]]
            -- upvalues: l_FFlagEnableLuaLoginRevamp_0 (ref), v13 (ref), v28 (ref), l_AppPage_0 (ref)
            if l_FFlagEnableLuaLoginRevamp_0 then
                return v13(v28.LoginV2MonoWrapper, l_AppPage_0.Login, v96);
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.AccountRecovery] = function(v97) --[[ Line: 323 ]]
            -- upvalues: l_GetFFlagEnableLuafiedRecoveryFlow_0 (ref), v13 (ref), v28 (ref), l_AppPage_0 (ref)
            if l_GetFFlagEnableLuafiedRecoveryFlow_0() then
                return v13(v28.AccountRecoveryMonoWrapper, l_AppPage_0.AccountRecovery, v97);
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.CharacterSelectionPage] = function(v98) --[[ Line: 333 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.CharacterSelectionPage, l_AppPage_0.CharacterSelectionPage, v98);
        end, 
        [l_AppPage_0.UsernameSelectionPage] = function(v99) --[[ Line: 340 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.UsernameSelectionPage, l_AppPage_0.UsernameSelectionPage, v99);
        end, 
        [l_AppPage_0.PasswordSelectionPage] = function(v100) --[[ Line: 343 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.PasswordSelectionPage, l_AppPage_0.PasswordSelectionPage, v100);
        end, 
        [l_AppPage_0.LuobuSignUpPage] = function(v101) --[[ Line: 346 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.LuobuSignUpPage, l_AppPage_0.LuobuSignUpPage, v101);
        end, 
        [l_AppPage_0.WeChatLoginWrapper] = function(v102) --[[ Line: 349 ]]
            -- upvalues: v14 (ref), v13 (ref), v47 (ref), l_AppPage_0 (ref)
            if v14.WeChatLoginEnabled() then
                return v13(v47, l_AppPage_0.WeChatLoginWrapper, v102);
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.GameDetail] = function(v103) --[[ Line: 355 ]]
            -- upvalues: v13 (ref), v29 (ref), l_AppPage_0 (ref)
            return v13(v29, l_AppPage_0.GameDetail, v103);
        end, 
        [l_AppPage_0.ShareGameToChat] = if l_FFlagShareTargetGameCleanup_0 then nil else function(v104, v105) --[[ Line: 360 ]]
            -- upvalues: v13 (ref), v46 (ref), l_AppPage_0 (ref)
            return v13(v46, l_AppPage_0.ShareGameToChat, v104, {
                placeId = v105
            });
        end, 
        [l_AppPage_0.Birthday] = function(v106) --[[ Line: 365 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.BirthdayPage, l_AppPage_0.Birthday, v106);
        end, 
        [l_AppPage_0.SafetySupport] = function(v107) --[[ Line: 368 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.SafetySupportPage, l_AppPage_0.SafetySupport, v107);
        end, 
        [l_AppPage_0.Accessibility] = function(v108) --[[ Line: 371 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.DeviceSettingsPage, l_AppPage_0.Accessibility, v108);
        end, 
        [l_AppPage_0.AppInformation] = function(v109) --[[ Line: 374 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.AppInformation, l_AppPage_0.AppInformation, v109);
        end, 
        [l_AppPage_0.DevSubs] = function(v110, v111) --[[ Line: 377 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            local v112 = v111 and {
                selectedGame = v111
            };
            return v13(v27.DevSubsPage, l_AppPage_0.DevSubs, v110, v112);
        end, 
        [l_AppPage_0.EventDetails] = not l_FFlagLuaAppSduiEventDetailsEnabled_0 and function(v113, v114, v115) --[[ Line: 382 ]]
            -- upvalues: v13 (ref), v41 (ref), l_AppPage_0 (ref), v3 (ref)
            return v13(v41, l_AppPage_0.EventDetails, v113, v3.Dictionary.join(v115 or {}, {
                virtualEventId = v114
            }));
        end or nil, 
        [l_AppPage_0.AccountSelectorPeekView] = function(v116, _, v118) --[[ Line: 391 ]]
            -- upvalues: v13 (ref), v37 (ref), l_AppPage_0 (ref)
            return v13(v37, l_AppPage_0.AccountSelectorPeekView, v116, v118);
        end, 
        [l_AppPage_0.AccountSwitchingAddAccountPeekView] = function(v119, _, v121) --[[ Line: 399 ]]
            -- upvalues: v13 (ref), v38 (ref), l_AppPage_0 (ref)
            return v13(v38, l_AppPage_0.AccountSwitchingAddAccountPeekView, v119, v121);
        end, 
        [l_AppPage_0.ShareVirtualEventModal] = function(v122, _, v124) --[[ Line: 407 ]]
            -- upvalues: v13 (ref), v39 (ref), l_AppPage_0 (ref)
            return v13(v39, l_AppPage_0.ShareVirtualEventModal, v122, v124);
        end, 
        [l_AppPage_0.EventNotificationsModal] = function(v125, _, v127) --[[ Line: 410 ]]
            -- upvalues: v13 (ref), v42 (ref), l_AppPage_0 (ref)
            return v13(v42, l_AppPage_0.EventNotificationsModal, v125, v127);
        end, 
        [l_AppPage_0.TencentHelp] = function(v128, v129, v130) --[[ Line: 418 ]]
            -- upvalues: v2 (ref), v56 (ref)
            return v2.createElement(v56, {
                navigationProps = v128, 
                detail = v129, 
                extraProps = v130
            });
        end, 
        [l_AppPage_0.TencentNoticeCenter] = function(v131) --[[ Line: 425 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.TencentNoticeCenterPage, l_AppPage_0.TencentNoticeCenter, v131);
        end, 
        [l_AppPage_0.TencentNoticeContent] = function(v132, _, v134) --[[ Line: 428 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.TencentNoticeContentPage, l_AppPage_0.TencentNoticeContent, v132, v134);
        end, 
        [l_AppPage_0.GenericWebPage] = function(v135, v136, v137) --[[ Line: 436 ]]
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
        [l_AppPage_0.GenericOpaqueWebPage] = function(v138, v139, v140) --[[ Line: 448 ]]
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
        [l_AppPage_0.SettingsSubPage] = function(v141, v142, v143) --[[ Line: 460 ]]
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
        [l_AppPage_0.YouTubePlayer] = function(v144, v145, v146) --[[ Line: 483 ]]
            -- upvalues: v2 (ref), v43 (ref)
            return v2.createElement(v43, {
                isVisible = v144.isVisible, 
                DisplayOrder = v144.displayOrder, 
                url = v145, 
                title = v146.title, 
                transitionAnimation = v146 and v146.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.ScanQrCode] = function(v147, _, v149) --[[ Line: 492 ]]
            -- upvalues: v2 (ref), v45 (ref), v15 (ref)
            return v2.createElement(v45, {
                isVisible = v147.isVisible, 
                DisplayOrder = v147.displayOrder, 
                transitionAnimation = v149 and v149.transitionAnimation or nil, 
                notificationType = v15.SCAN_QR_CODE
            });
        end, 
        [l_AppPage_0.AvatarExperienceWrapper] = function(v150, _, v152) --[[ Line: 500 ]]
            -- upvalues: v13 (ref), v65 (ref), l_AppPage_0 (ref)
            return v13(v65, l_AppPage_0.AvatarExperienceWrapper, v150, v152);
        end, 
        [l_AppPage_0.AvatarExperienceWrapperTransparent] = function(v153, _, v155) --[[ Line: 508 ]]
            -- upvalues: v13 (ref), v65 (ref), l_AppPage_0 (ref)
            return v13(v65, l_AppPage_0.AvatarExperienceWrapperTransparent, v153, v155);
        end, 
        [l_AppPage_0.BuildersClub] = function(v156, _, v158) --[[ Line: 516 ]]
            -- upvalues: v79 (ref), v2 (ref), v61 (ref), v16 (ref), v24 (ref), v45 (ref), v15 (ref)
            if v79.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v61, {
                    url = v16.fromString("www:premium/membership")(), 
                    titleKey = "CommonUI.Features.Label.Premium", 
                    transitionAnimation = v158.transitionAnimation, 
                    hasBackButton = not v24() and nil, 
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
        [l_AppPage_0.Blackbird] = l_FFlagEnableBlackbird_0 and function(v159, _, v161) --[[ Line: 540 ]]
            -- upvalues: v2 (ref), v30 (ref)
            return v2.createElement(v30, {
                isVisible = v159.isVisible, 
                DisplayOrder = v159.displayOrder, 
                transitionAnimation = v161.transitionAnimation
            });
        end or nil, 
        [l_AppPage_0.Payment] = function(v162, v163, v164) --[[ Line: 548 ]]
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
        [l_AppPage_0.Notifications] = function(v165, _, v167) --[[ Line: 567 ]]
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
        [l_AppPage_0.LogoutConfirmation] = function(v168, _, v170) --[[ Line: 593 ]]
            -- upvalues: v2 (ref), v45 (ref), v15 (ref)
            return v2.createElement(v45, {
                isVisible = v168.isVisible, 
                DisplayOrder = v168.displayOrder, 
                notificationType = v15.ACTION_LOG_OUT, 
                transitionAnimation = v170 and v170.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.AddFriends] = function(v171, _, v173) --[[ Line: 601 ]]
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
        [l_AppPage_0.ViewUserProfile] = function(v174, v175, v176) --[[ Line: 628 ]]
            -- upvalues: v2 (ref), v48 (ref)
            return v2.createElement(v48, {
                isVisible = v174.isVisible, 
                DisplayOrder = v174.displayOrder, 
                userId = v175, 
                onClose = v176 and v176.onClose or nil
            });
        end, 
        [l_AppPage_0.ViewProfile] = function(v177, v178) --[[ Line: 636 ]]
            -- upvalues: v2 (ref), v49 (ref)
            return v2.createElement(v49, {
                isVisible = v177.isVisible, 
                DisplayOrder = v177.displayOrder, 
                url = v178
            });
        end, 
        [l_AppPage_0.LoginNative] = function(v179, _, v181) --[[ Line: 643 ]]
            -- upvalues: v2 (ref), v45 (ref), v15 (ref)
            return v2.createElement(v45, {
                isVisible = v179.isVisible, 
                DisplayOrder = v179.displayOrder, 
                notificationType = v15.ACTION_LOG_IN, 
                transitionAnimation = v181 and v181.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.CaptchaNative] = function(v182, _, v184) --[[ Line: 651 ]]
            -- upvalues: v2 (ref), v28 (ref)
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
                return v2.createElement(v28.CaptchaPageBrowserServiceWrapper, v186);
            else
                return v2.createElement(v28.CaptchaPageBrowserServiceWrapper, {
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
        [l_AppPage_0.RobuxUpsell] = function(v187, _, v189) --[[ Line: 683 ]]
            -- upvalues: v13 (ref), v70 (ref), l_AppPage_0 (ref)
            return v13(v70, l_AppPage_0.RobuxUpsell, v187, v189);
        end, 
        [l_AppPage_0.SubscriptionPurchase] = function(v190, _, v192) --[[ Line: 686 ]]
            -- upvalues: v13 (ref), v71 (ref), l_AppPage_0 (ref)
            return v13(v71, l_AppPage_0.SubscriptionPurchase, v190, v192);
        end, 
        [l_AppPage_0.ShareSheet] = function(v193, _, v195) --[[ Line: 694 ]]
            -- upvalues: v2 (ref), v54 (ref)
            return v2.createElement(v54, {
                isVisible = v193.isVisible, 
                DisplayOrder = v193.displayOrder, 
                data = v195
            });
        end, 
        [l_AppPage_0.SdkShare] = function(v196, _, v198) --[[ Line: 701 ]]
            -- upvalues: v2 (ref), v55 (ref)
            return v2.createElement(v55, {
                isVisible = v196.isVisible, 
                DisplayOrder = v196.displayOrder, 
                data = v198
            });
        end, 
        [l_AppPage_0.ReportAbuse] = function(v199, v200, v201) --[[ Line: 708 ]]
            -- upvalues: v2 (ref), v51 (ref)
            return v2.createElement(v51, {
                isVisible = v199.isVisible, 
                DisplayOrder = v199.displayOrder, 
                url = v200, 
                onClose = v201 and v201.onClose or nil
            });
        end, 
        [l_AppPage_0.PhoneVerification] = function(_, _, v204) --[[ Line: 716 ]]
            -- upvalues: v2 (ref), v58 (ref)
            return v2.createElement(v58, v204);
        end, 
        [l_AppPage_0.EditUsername] = function(_, _, v207) --[[ Line: 719 ]]
            -- upvalues: v2 (ref), v36 (ref)
            return v2.createElement(v36, v207);
        end, 
        [l_AppPage_0.ChallengeHybridOverlayPage] = function(v208, _, v210) --[[ Line: 722 ]]
            -- upvalues: v13 (ref), v62 (ref), l_AppPage_0 (ref)
            return v13(v62, l_AppPage_0.ChallengeHybridOverlayPage, v208, v210);
        end, 
        [l_AppPage_0.ChallengeDialogModalContainer] = v79.GetFFlagLuaAppChallengeDialogContainerPageEnabled() and function(v211, _, v213) --[[ Line: 731 ]]
            -- upvalues: v13 (ref), v64 (ref), l_AppPage_0 (ref)
            return v13(v64, l_AppPage_0.ChallengeDialogModalContainer, v211, v213);
        end or nil, 
        [l_AppPage_0.ReportDialog] = function(v214) --[[ Line: 740 ]]
            -- upvalues: v13 (ref), v73 (ref), l_AppPage_0 (ref)
            return v13(v73, l_AppPage_0.ReportDialog, v214);
        end, 
        [l_AppPage_0.AgeVerificationRequired] = function(v215, v216) --[[ Line: 743 ]]
            -- upvalues: v13 (ref), v69 (ref), l_AppPage_0 (ref)
            local v217 = v216 and {
                universeId = v216
            } or nil;
            return v13(v69, l_AppPage_0.AgeVerificationRequired, v215, v217);
        end, 
        [l_AppPage_0.ChallengeHybridWebView] = function(v218, _, v220) --[[ Line: 755 ]]
            -- upvalues: v2 (ref), v63 (ref), v3 (ref)
            return v2.createElement(v63, v3.Dictionary.join(v220, {
                appContainerNavigation = v218
            }));
        end, 
        [l_AppPage_0.InviteLinkExpiredModal] = function(v221, _, v223) --[[ Line: 763 ]]
            -- upvalues: v13 (ref), v32 (ref), l_AppPage_0 (ref)
            return v13(v32, l_AppPage_0.InviteLinkExpiredModal, v221, v223);
        end, 
        [l_AppPage_0.ShareLinkInvalidModal] = function(v224, _, v226) --[[ Line: 771 ]]
            -- upvalues: v13 (ref), v33 (ref), l_AppPage_0 (ref)
            return v13(v33, l_AppPage_0.ShareLinkInvalidModal, v224, v226);
        end, 
        [l_AppPage_0.ProfileQRCodePage] = function(v227, _, v229) --[[ Line: 779 ]]
            -- upvalues: v13 (ref), v34 (ref), l_AppPage_0 (ref)
            return v13(v34, l_AppPage_0.ProfileQRCodePage, v227, v229);
        end, 
        [l_AppPage_0.AccountInfo] = function(v230, v231, v232) --[[ Line: 782 ]]
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
        [l_AppPage_0.ParentVerification] = function(_, v234) --[[ Line: 797 ]]
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
        [l_AppPage_0.EmailVerification] = function(_, v236) --[[ Line: 808 ]]
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
        [l_AppPage_0.VerifiedBadgeModal] = function(v237, _, v239) --[[ Line: 819 ]]
            -- upvalues: v13 (ref), v40 (ref), l_AppPage_0 (ref)
            return v13(v40, l_AppPage_0.VerifiedBadgeModal, v237, v239);
        end, 
        [l_AppPage_0.SocialMessageToast] = function(v240, _, v242) --[[ Line: 822 ]]
            -- upvalues: v13 (ref), v35 (ref), l_AppPage_0 (ref)
            return v13(v35, l_AppPage_0.SocialMessageToast, v240, v242);
        end, 
        [l_AppPage_0.PassesPage] = function(v243, v244, v245) --[[ Line: 825 ]]
            -- upvalues: v3 (ref), v13 (ref), v31 (ref), l_AppPage_0 (ref)
            local v246 = {
                universeId = v244
            };
            if v245 then
                v246 = v3.Dictionary.join(v245, v246);
            end;
            return v13(v31, l_AppPage_0.PassesPage, v243, v246);
        end, 
        [l_AppPage_0.AccountSettingsUpsell] = v79.GetFFlagEnableAccountSettingsUpsell() and function(v247, _, v249) --[[ Line: 835 ]]
            -- upvalues: v13 (ref), v76 (ref), l_AppPage_0 (ref)
            return v13(v76, l_AppPage_0.AccountSettingsUpsell, v247, v249);
        end or nil, 
        [l_AppPage_0.AmpWizardContainer] = v79.GetFFlagEnableAmpUpsellWizard() and function(v250, _, v252) --[[ Line: 845 ]]
            -- upvalues: v13 (ref), v77 (ref), l_AppPage_0 (ref)
            return v13(v77, l_AppPage_0.AmpWizardContainer, v250, v252);
        end or nil, 
        [l_AppPage_0.IDVUpsellContainer] = v79.GetFFlagEnableAmpIDVUpsellSupport() and function(v253, _, v255) --[[ Line: 855 ]]
            -- upvalues: v13 (ref), v66 (ref), l_AppPage_0 (ref)
            return v13(v66, l_AppPage_0.IDVUpsellContainer, v253, v255);
        end or nil, 
        [l_AppPage_0.VPCUpsellContainer] = function(v256, _, v258) --[[ Line: 859 ]]
            -- upvalues: v13 (ref), v67 (ref), l_AppPage_0 (ref)
            return v13(v67, l_AppPage_0.VPCUpsellContainer, v256, v258);
        end, 
        [l_AppPage_0.RobloxSubscriptionUpsell] = v79.GetFFlagEnableAmpSubscriptionUpsell() and function(v259, _, v261) --[[ Line: 863 ]]
            -- upvalues: v13 (ref), v68 (ref), l_AppPage_0 (ref)
            return v13(v68, l_AppPage_0.RobloxSubscriptionUpsell, v259, v261);
        end or nil, 
        [l_AppPage_0.AddAuthMethodPage] = function(v262) --[[ Line: 872 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.AddAuthMethodPage, l_AppPage_0.AddAuthMethodPage, v262);
        end, 
        [l_AppPage_0.PasskeyUpsellScreen] = l_FFlagPasskeyUpsellEnabled_0 and function(v263, _, v265) --[[ Line: 876 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28.PasskeyUpsellScreen, l_AppPage_0.PasskeyUpsellScreen, v263, v265);
        end or nil, 
        [l_AppPage_0.TutorialUpsellScreen] = l_FFlagTutorialUpsellEnabled_0 and function(v266, _, v268) --[[ Line: 886 ]]
            -- upvalues: v13 (ref), v57 (ref), l_AppPage_0 (ref)
            return v13(v57, l_AppPage_0.TutorialUpsellScreen, v266, v268);
        end or nil, 
        [l_AppPage_0.SponsoredTooltipPeekView] = function(v269, _, v271) --[[ Line: 895 ]]
            -- upvalues: v13 (ref), v74 (ref), l_AppPage_0 (ref)
            return v13(v74, l_AppPage_0.SponsoredTooltipPeekView, v269, v271);
        end, 
        [l_AppPage_0.InfoPeekView] = function(v272, _, v274) --[[ Line: 903 ]]
            -- upvalues: v13 (ref), v75 (ref), l_AppPage_0 (ref)
            return v13(v75, l_AppPage_0.InfoPeekView, v272, v274);
        end, 
        [l_AppPage_0.VoiceTrialUpsell] = v84() and function(v275, _, v277) --[[ Line: 907 ]]
            -- upvalues: v13 (ref), v78 (ref), l_AppPage_0 (ref)
            return v13(v78, l_AppPage_0.VoiceTrialUpsell, v275, v277);
        end or nil, 
        [l_AppPage_0.SecurityAlertInfo] = l_GetFFlagEnableSecurityAlertDeeplink_0() and function(v278, v279, v280) --[[ Line: 912 ]]
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
            getScreen = function() --[[ Line: 941 ]] --[[ Name: getScreen ]]
                -- upvalues: l_Modules_0 (ref)
                return require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootContainer);
            end, 
            navigationOptions = {
                hasSubNavigation = true
            }
        }
    });
    table.insert(v282, {
        [l_AppPage_0.Chat] = l_createLazyComponent_0(function() --[[ Line: 951 ]]
            -- upvalues: l_Modules_0 (ref)
            return require(l_Modules_0.LuaApp.Components.SocialTab.SocialTabUniversalAppWrapper.Container);
        end)
    });
    table.insert(v282, {
        [l_AppPage_0.PurchaseRobux] = {
            screen = v12(function(v285, v286, v287) --[[ Line: 958 ]]
                -- upvalues: v79 (ref), l_IsVRAppBuild_0 (ref), l_GuiService_0 (ref), v13 (ref), v72 (ref), l_AppPage_0 (ref), v23 (ref), v16 (ref), v2 (ref), v52 (ref)
                if v79.GetFFlagLuaAppLuaBuyRobuxPage() and l_IsVRAppBuild_0() or l_GuiService_0:IsTenFootInterface() then
                    return v13(v72, l_AppPage_0.PurchaseRobux, v285, v287);
                else
                    local v288 = nil;
                    if v23 then
                        v288 = v16.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId|}&product_id={productId|}")(v287);
                    end;
                    return v2.createElement(v52, {
                        url = if v23 then v288 else if v79.GetFFlagEnableUnifiedStaticWebViews() then v16.fromString("www:Upgrades/Robux.aspx")() else if v286 then v16.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId}")({
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
            screen = l_createLazyComponent_0(function() --[[ Line: 996 ]]
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
            screen = l_createLazyComponent_0(function() --[[ Line: 1008 ]]
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
            screen = l_createLazyComponent_0(function() --[[ Line: 1020 ]]
                -- upvalues: l_CorePackages_0 (ref)
                return require(l_CorePackages_0.Workspace.Packages.AmpUpsell).FAEUpsellContainer;
            end), 
            navigationOptions = v93(l_AppPage_0.FAEUpsell)
        }
    });
    if l_FFlagEnableNapDedicatedPage_0 then
        table.insert(v282, {
            [l_AppPage_0.NotApprovedPage] = {
                screen = v12(function(v289, _, v291) --[[ Line: 1031 ]]
                    -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
                    return v13(v28.NotApprovedPage, l_AppPage_0.NotApprovedPage, v289, v291);
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