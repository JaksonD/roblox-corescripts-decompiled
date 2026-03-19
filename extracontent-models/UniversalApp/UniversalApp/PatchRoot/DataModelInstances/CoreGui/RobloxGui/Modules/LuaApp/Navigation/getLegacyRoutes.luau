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
local v26 = {
    SafetySupportPage = l_createLazyComponent_0(function() --[[ Line: 36 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.SafetySupportPage);
    end), 
    DeviceSettingsPage = l_createLazyComponent_0(function() --[[ Line: 39 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.DeviceSettings.DeviceSettingsPage);
    end), 
    AppInformation = l_createLazyComponent_0(function() --[[ Line: 42 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.AppInformationPage);
    end), 
    DevSubsPage = l_createLazyComponent_0(function() --[[ Line: 45 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.More.DevSubsPage);
    end), 
    TencentNoticeCenterPage = l_createLazyComponent_0(function() --[[ Line: 48 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeCenterPage);
    end), 
    TencentNoticeContentPage = l_createLazyComponent_0(function() --[[ Line: 51 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeContentPage);
    end)
};
local v27 = {
    CharacterSelectionPage = l_createLazyComponent_0(function() --[[ Line: 56 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.CharacterSelectPage);
    end), 
    UsernameSelectionPage = l_createLazyComponent_0(function() --[[ Line: 59 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.UsernameSelectionPage);
    end), 
    PasswordSelectionPage = l_createLazyComponent_0(function() --[[ Line: 62 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.PasswordSelectionPage);
    end), 
    LoginV2MonoWrapper = l_createLazyComponent_0(function() --[[ Line: 65 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.LoginV2MonoWrapper);
    end), 
    AccountRecoveryMonoWrapper = l_createLazyComponent_0(function() --[[ Line: 68 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.AccountSecurity.AccountRecoveryMonoWrapper);
    end), 
    UAppBlockPage = l_createLazyComponent_0(function() --[[ Line: 71 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.UAppBlockPage);
    end), 
    LandingPage = l_createLazyComponent_0(function() --[[ Line: 74 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.LandingPage);
    end), 
    LuobuLandingPage = l_createLazyComponent_0(function() --[[ Line: 77 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.Authentication.LuobuLandingPage);
    end), 
    BirthdayPage = l_createLazyComponent_0(function() --[[ Line: 80 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.BirthdayPage);
    end), 
    LuobuSignUpPage = l_createLazyComponent_0(function() --[[ Line: 83 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.Luobu.Components.Authentication.LuobuSignUpPage);
    end), 
    AddAuthMethodPage = l_createLazyComponent_0(function() --[[ Line: 86 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.Authentication.AddAuthMethodPage);
    end), 
    PasskeyUpsellScreen = l_createLazyComponent_0(function() --[[ Line: 89 ]]
        -- upvalues: l_CorePackages_0 (copy)
        return require(l_CorePackages_0.Workspace.Packages.PasskeyUpsell).Components.PasskeyUpsellScreen;
    end), 
    CaptchaPageBrowserServiceWrapper = l_createLazyComponent_0(function() --[[ Line: 92 ]]
        -- upvalues: l_Modules_0 (copy)
        return require(l_Modules_0.LuaApp.Components.CaptchaPageBrowserServiceWrapper);
    end), 
    NotApprovedPage = l_createLazyComponent_0(function() --[[ Line: 95 ]]
        -- upvalues: l_CorePackages_0 (copy)
        return require(l_CorePackages_0.Workspace.Packages.NotApprovedPage).NotApprovedPageV2;
    end)
};
local v28 = l_createLazyComponent_0(function() --[[ Line: 99 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector);
end);
local v29 = l_createLazyComponent_0(function() --[[ Line: 102 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Passes.PassesPage);
end);
local v30 = l_createLazyComponent_0(function() --[[ Line: 105 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.InviteLinkExpiredModal.api).InviteLinkExpiredModal;
end);
local v31 = l_createLazyComponent_0(function() --[[ Line: 108 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ShareLinkInvalidModal.api).ShareLinkInvalidModal;
end);
local v32 = l_createLazyComponent_0(function() --[[ Line: 111 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ProfileQRCodePage.api).ProfileQRCodeEntryPoint;
end);
local v33 = l_createLazyComponent_0(function() --[[ Line: 114 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.SocialMessageToast.api).RootScreen;
end);
local v34 = l_createLazyComponent_0(function() --[[ Line: 117 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.EditProfile).EditUsernameWrapper;
end);
local v35 = l_createLazyComponent_0(function() --[[ Line: 120 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSelectorPeekView;
end);
local v36 = l_createLazyComponent_0(function() --[[ Line: 123 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSwitchingAddAccountPeekView;
end);
local v37 = l_createLazyComponent_0(function() --[[ Line: 126 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.VirtualEvents).ShareEventModal;
end);
local v38 = l_createLazyComponent_0(function() --[[ Line: 129 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.VerifiedBadges).AboutVerifiedBadgeModal;
end);
local v39 = l_createLazyComponent_0(function() --[[ Line: 132 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.VirtualEvents.EventDetailsWrapper);
end);
local v40 = l_createLazyComponent_0(function() --[[ Line: 135 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.VirtualEvents.EventNotificationsModalWrapper);
end);
local v41 = l_createLazyComponent_0(function() --[[ Line: 138 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.YouTubePageWrapper);
end);
local v42 = l_createLazyComponent_0(function() --[[ Line: 141 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.GenericWebPageWrapper);
end);
local v43 = l_createLazyComponent_0(function() --[[ Line: 144 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.GenericNativePageWrapper);
end);
local v44 = l_createLazyComponent_0(function() --[[ Line: 147 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.ShareTargetGame.Components.ShareTargetGameEntrypoint);
end);
local v45 = l_createLazyComponent_0(function() --[[ Line: 150 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Authentication.WeChatLoginWrapper);
end);
local v46 = l_createLazyComponent_0(function() --[[ Line: 153 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativeViewUserProfileWrapper);
end);
local v47 = l_createLazyComponent_0(function() --[[ Line: 156 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativeViewProfileWrapper);
end);
local v48 = l_createLazyComponent_0(function() --[[ Line: 159 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativePageWithUrlWrapper);
end);
local v49 = l_createLazyComponent_0(function() --[[ Line: 162 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativeReportAbuseWrapper);
end);
local v50 = l_createLazyComponent_0(function() --[[ Line: 165 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.NativePurchaseRobuxPageWrapper);
end);
local v51 = l_createLazyComponent_0(function() --[[ Line: 168 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.More.AccountInfoPage);
end);
local v52 = l_createLazyComponent_0(function() --[[ Line: 171 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ShareSheetWrapper);
end);
local v53 = l_createLazyComponent_0(function() --[[ Line: 174 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.SdkShareWrapper);
end);
local v54 = l_createLazyComponent_0(function() --[[ Line: 177 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.Luobu.Components.More.TencentHelp.TencentHelpWrapper);
end);
local v55 = l_createLazyComponent_0(function() --[[ Line: 180 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.TutorialUpsell).Components.TutorialUpsellScreen;
end);
local v56 = l_createLazyComponent_0(function() --[[ Line: 183 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Authentication.VerificationUpsell.PhoneVerificationNativeWrapper);
end);
local v57 = l_createLazyComponent_0(function() --[[ Line: 186 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.SettingsNativeWrapper);
end);
local v58 = l_createLazyComponent_0(function() --[[ Line: 189 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.More.ParentVerificationPage);
end);
local v59 = l_createLazyComponent_0(function() --[[ Line: 192 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
end);
local v60 = l_createLazyComponent_0(function() --[[ Line: 195 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Challenge.HybridOverlayPage);
end);
local v61 = l_createLazyComponent_0(function() --[[ Line: 198 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Challenge.HybridWebView);
end);
local v62 = l_createLazyComponent_0(function() --[[ Line: 201 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).ChallengeDialogModalContainer;
end);
local v63 = l_createLazyComponent_0(function() --[[ Line: 204 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AvatarExperienceWrapper);
end);
local v64 = l_createLazyComponent_0(function() --[[ Line: 207 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AmpUpsell).IDVUpsellContainer;
end);
local v65 = l_createLazyComponent_0(function() --[[ Line: 210 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AmpUpsell).VPCUpsellContainer;
end);
local v66 = l_createLazyComponent_0(function() --[[ Line: 213 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AmpUpsell.RobloxSubscriptionUpsellScreen);
end);
local v67 = l_createLazyComponent_0(function() --[[ Line: 216 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AgeVerification.AgeVerificationModal);
end);
local v68 = l_createLazyComponent_0(function() --[[ Line: 219 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.RobuxUpsell.RobuxUpsellContainer);
end);
local v69 = l_createLazyComponent_0(function() --[[ Line: 222 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Subscription.Purchase.SubscriptionPurchaseContainer);
end);
local v70 = l_createLazyComponent_0(function() --[[ Line: 225 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.BuyRobux.BuyRobuxContainer);
end);
local v71 = l_createLazyComponent_0(function() --[[ Line: 228 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportContainer);
end);
local v72 = l_createLazyComponent_0(function() --[[ Line: 231 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.Games.SponsoredTooltipPeekView);
end);
local v73 = l_createLazyComponent_0(function() --[[ Line: 234 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.AppBlox).InfoPeekView;
end);
local v74 = l_createLazyComponent_0(function() --[[ Line: 237 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AmpUpsell.AccountSettingsUpsellWrapper);
end);
local v75 = l_createLazyComponent_0(function() --[[ Line: 240 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.AmpUpsell.AmpWizardContainerWrapper);
end);
local v76 = l_createLazyComponent_0(function() --[[ Line: 243 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).VoiceTrialUpsell;
end);
local v77 = {
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
local v78 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local v79 = game:DefineFastFlag("ModerationVerificationEnabled2", false);
local l_FFlagEnableLuaLoginRevamp_0 = v20.FFlagEnableLuaLoginRevamp;
local l_GetFFlagEnableLuafiedRecoveryFlow_0 = v20.GetFFlagEnableLuafiedRecoveryFlow;
local v82 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard);
local l_GetFFlagEnableSecurityAlertDeeplink_0 = v20.GetFFlagEnableSecurityAlertDeeplink;
local l_FFlagPasskeyUpsellEnabled_0 = v20.FFlagPasskeyUpsellEnabled;
local l_FFlagTutorialUpsellEnabled_0 = v20.FFlagTutorialUpsellEnabled;
local l_FFlagEnableNapDedicatedPage_0 = v20.FFlagEnableNapDedicatedPage;
local function v90(v87) --[[ Line: 271 ]] --[[ Name: getLegacyNavigationOptions ]]
    -- upvalues: v18 (copy), v78 (copy), l_AppPage_0 (copy), l_AvatarScreen_0 (copy)
    local v88 = (v18[v87] or {}).renderUnderlyingPage or false;
    local l_v88_0 = v88;
    if v78() and v87 == l_AppPage_0.GameDetail or v87 == l_AvatarScreen_0.ItemDetails or v87 == l_AppPage_0.SocialMessageToast or v87 == l_AppPage_0.AccountSelectorPeekView or v87 == l_AppPage_0.AccountSwitchingAddAccountPeekView or v87 == l_AppPage_0.AvatarExperienceWrapperTransparent or v87 == l_AppPage_0.SponsoredTooltipPeekView or v87 == l_AppPage_0.InfoPeekView then
        l_v88_0 = false;
    end;
    return {
        transparent = v88, 
        overlayEnabled = l_v88_0
    };
end;
return function(_) --[[ Line: 295 ]]
    -- upvalues: l_AppPage_0 (copy), v13 (copy), v27 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), l_GetFFlagEnableLuafiedRecoveryFlow_0 (copy), v14 (copy), v45 (copy), v28 (copy), l_FFlagShareTargetGameCleanup_0 (copy), v44 (copy), v26 (copy), v39 (copy), v3 (copy), v35 (copy), v36 (copy), v37 (copy), v40 (copy), v2 (copy), v54 (copy), v42 (copy), v77 (copy), v57 (copy), v48 (copy), v15 (copy), v41 (copy), v43 (copy), v63 (copy), v59 (copy), v16 (copy), v25 (copy), l_FFlagEnableBlackbird_0 (copy), l_GetFStringBlackbirdUrl_0 (copy), v50 (copy), v17 (copy), v46 (copy), v47 (copy), v68 (copy), v69 (copy), v52 (copy), v53 (copy), v49 (copy), v56 (copy), v34 (copy), v60 (copy), v62 (copy), v71 (copy), v67 (copy), v61 (copy), v30 (copy), v31 (copy), v32 (copy), v51 (copy), v79 (copy), v58 (copy), v38 (copy), v33 (copy), v29 (copy), v74 (copy), v75 (copy), v64 (copy), v65 (copy), v66 (copy), l_FFlagPasskeyUpsellEnabled_0 (copy), l_FFlagTutorialUpsellEnabled_0 (copy), v55 (copy), v72 (copy), v73 (copy), v82 (copy), v76 (copy), l_GetFFlagEnableSecurityAlertDeeplink_0 (copy), v12 (copy), v90 (copy), l_Modules_0 (copy), l_createLazyComponent_0 (copy), l_IsVRAppBuild_0 (copy), l_GuiService_0 (copy), v70 (copy), v24 (copy), l_ScreenKind_0 (copy), l_GlobalNavDisplayOption_0 (copy), l_CorePackages_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy)
    local v278 = {
        [l_AppPage_0.None] = function() --[[ Line: 297 ]]
            return nil;
        end, 
        [l_AppPage_0.UAppBlock] = function(v92) --[[ Line: 300 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.UAppBlockPage, l_AppPage_0.UAppBlock, v92);
        end, 
        [l_AppPage_0.LoginV2] = function(v93) --[[ Line: 303 ]]
            -- upvalues: l_FFlagEnableLuaLoginRevamp_0 (ref), v13 (ref), v27 (ref), l_AppPage_0 (ref)
            if l_FFlagEnableLuaLoginRevamp_0 then
                return v13(v27.LoginV2MonoWrapper, l_AppPage_0.Login, v93);
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.AccountRecovery] = function(v94) --[[ Line: 309 ]]
            -- upvalues: l_GetFFlagEnableLuafiedRecoveryFlow_0 (ref), v13 (ref), v27 (ref), l_AppPage_0 (ref)
            if l_GetFFlagEnableLuafiedRecoveryFlow_0() then
                return v13(v27.AccountRecoveryMonoWrapper, l_AppPage_0.AccountRecovery, v94);
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.CharacterSelectionPage] = function(v95) --[[ Line: 319 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.CharacterSelectionPage, l_AppPage_0.CharacterSelectionPage, v95);
        end, 
        [l_AppPage_0.UsernameSelectionPage] = function(v96) --[[ Line: 326 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.UsernameSelectionPage, l_AppPage_0.UsernameSelectionPage, v96);
        end, 
        [l_AppPage_0.PasswordSelectionPage] = function(v97) --[[ Line: 329 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.PasswordSelectionPage, l_AppPage_0.PasswordSelectionPage, v97);
        end, 
        [l_AppPage_0.LuobuSignUpPage] = function(v98) --[[ Line: 332 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.LuobuSignUpPage, l_AppPage_0.LuobuSignUpPage, v98);
        end, 
        [l_AppPage_0.WeChatLoginWrapper] = function(v99) --[[ Line: 335 ]]
            -- upvalues: v14 (ref), v13 (ref), v45 (ref), l_AppPage_0 (ref)
            if v14.WeChatLoginEnabled() then
                return v13(v45, l_AppPage_0.WeChatLoginWrapper, v99);
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.GameDetail] = function(v100) --[[ Line: 341 ]]
            -- upvalues: v13 (ref), v28 (ref), l_AppPage_0 (ref)
            return v13(v28, l_AppPage_0.GameDetail, v100);
        end, 
        [l_AppPage_0.ShareGameToChat] = if l_FFlagShareTargetGameCleanup_0 then nil else function(v101, v102) --[[ Line: 346 ]]
            -- upvalues: v13 (ref), v44 (ref), l_AppPage_0 (ref)
            return v13(v44, l_AppPage_0.ShareGameToChat, v101, {
                placeId = v102
            });
        end, 
        [l_AppPage_0.Birthday] = function(v103) --[[ Line: 351 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.BirthdayPage, l_AppPage_0.Birthday, v103);
        end, 
        [l_AppPage_0.SafetySupport] = function(v104) --[[ Line: 354 ]]
            -- upvalues: v13 (ref), v26 (ref), l_AppPage_0 (ref)
            return v13(v26.SafetySupportPage, l_AppPage_0.SafetySupport, v104);
        end, 
        [l_AppPage_0.Accessibility] = function(v105) --[[ Line: 357 ]]
            -- upvalues: v13 (ref), v26 (ref), l_AppPage_0 (ref)
            return v13(v26.DeviceSettingsPage, l_AppPage_0.Accessibility, v105);
        end, 
        [l_AppPage_0.AppInformation] = function(v106) --[[ Line: 360 ]]
            -- upvalues: v13 (ref), v26 (ref), l_AppPage_0 (ref)
            return v13(v26.AppInformation, l_AppPage_0.AppInformation, v106);
        end, 
        [l_AppPage_0.DevSubs] = function(v107, v108) --[[ Line: 363 ]]
            -- upvalues: v13 (ref), v26 (ref), l_AppPage_0 (ref)
            local v109 = v108 and {
                selectedGame = v108
            };
            return v13(v26.DevSubsPage, l_AppPage_0.DevSubs, v107, v109);
        end, 
        [l_AppPage_0.EventDetails] = function(v110, v111, v112) --[[ Line: 367 ]]
            -- upvalues: v13 (ref), v39 (ref), l_AppPage_0 (ref), v3 (ref)
            return v13(v39, l_AppPage_0.EventDetails, v110, v3.Dictionary.join(v112 or {}, {
                virtualEventId = v111
            }));
        end, 
        [l_AppPage_0.AccountSelectorPeekView] = function(v113, _, v115) --[[ Line: 375 ]]
            -- upvalues: v13 (ref), v35 (ref), l_AppPage_0 (ref)
            return v13(v35, l_AppPage_0.AccountSelectorPeekView, v113, v115);
        end, 
        [l_AppPage_0.AccountSwitchingAddAccountPeekView] = function(v116, _, v118) --[[ Line: 383 ]]
            -- upvalues: v13 (ref), v36 (ref), l_AppPage_0 (ref)
            return v13(v36, l_AppPage_0.AccountSwitchingAddAccountPeekView, v116, v118);
        end, 
        [l_AppPage_0.ShareVirtualEventModal] = function(v119, _, v121) --[[ Line: 391 ]]
            -- upvalues: v13 (ref), v37 (ref), l_AppPage_0 (ref)
            return v13(v37, l_AppPage_0.ShareVirtualEventModal, v119, v121);
        end, 
        [l_AppPage_0.EventNotificationsModal] = function(v122, _, v124) --[[ Line: 394 ]]
            -- upvalues: v13 (ref), v40 (ref), l_AppPage_0 (ref)
            return v13(v40, l_AppPage_0.EventNotificationsModal, v122, v124);
        end, 
        [l_AppPage_0.TencentHelp] = function(v125, v126, v127) --[[ Line: 402 ]]
            -- upvalues: v2 (ref), v54 (ref)
            return v2.createElement(v54, {
                navigationProps = v125, 
                detail = v126, 
                extraProps = v127
            });
        end, 
        [l_AppPage_0.TencentNoticeCenter] = function(v128) --[[ Line: 409 ]]
            -- upvalues: v13 (ref), v26 (ref), l_AppPage_0 (ref)
            return v13(v26.TencentNoticeCenterPage, l_AppPage_0.TencentNoticeCenter, v128);
        end, 
        [l_AppPage_0.TencentNoticeContent] = function(v129, _, v131) --[[ Line: 412 ]]
            -- upvalues: v13 (ref), v26 (ref), l_AppPage_0 (ref)
            return v13(v26.TencentNoticeContentPage, l_AppPage_0.TencentNoticeContent, v129, v131);
        end, 
        [l_AppPage_0.GenericWebPage] = function(v132, v133, v134) --[[ Line: 420 ]]
            -- upvalues: v2 (ref), v42 (ref)
            return v2.createElement(v42, {
                isVisible = v132.isVisible, 
                DisplayOrder = v132.displayOrder, 
                url = v133, 
                title = v134.title, 
                titleKey = v134.titleKey, 
                searchParams = v134.searchParams, 
                transitionAnimation = v134 and v134.transitionAnimation or nil, 
                onClose = v134 and v134.onClose or nil
            });
        end, 
        [l_AppPage_0.GenericOpaqueWebPage] = function(v135, v136, v137) --[[ Line: 432 ]]
            -- upvalues: v2 (ref), v42 (ref)
            return v2.createElement(v42, {
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
        [l_AppPage_0.SettingsSubPage] = function(v138, v139, v140) --[[ Line: 444 ]]
            -- upvalues: v77 (ref), v2 (ref), v57 (ref), v48 (ref), v15 (ref)
            if v77.GetFFlagLuaAppUseSettingsNativeWrapper() then
                return v2.createElement(v57, {
                    url = v139, 
                    titleKey = v140.titleKey, 
                    windowCloseCallback = v140 and v140.onClose or nil, 
                    isVisible = v138.isVisible, 
                    displayOrder = v138.displayOrder
                });
            else
                return v2.createElement(v48, {
                    isVisible = v138.isVisible, 
                    DisplayOrder = v138.displayOrder, 
                    notificationType = v140.notificationType or v15.OPEN_SETTINGS_WEBVIEW, 
                    url = v139, 
                    title = v140.title, 
                    titleKey = v140.titleKey, 
                    searchParams = if v77.GetFFlagEnableUnifiedStaticWebViews() then v140.searchParams else nil, 
                    transitionAnimation = v140 and v140.transitionAnimation or nil, 
                    onClose = v140 and v140.onClose or nil
                });
            end;
        end, 
        [l_AppPage_0.YouTubePlayer] = function(v141, v142, v143) --[[ Line: 467 ]]
            -- upvalues: v2 (ref), v41 (ref)
            return v2.createElement(v41, {
                isVisible = v141.isVisible, 
                DisplayOrder = v141.displayOrder, 
                url = v142, 
                title = v143.title, 
                transitionAnimation = v143 and v143.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.ScanQrCode] = function(v144, _, v146) --[[ Line: 476 ]]
            -- upvalues: v2 (ref), v43 (ref), v15 (ref)
            return v2.createElement(v43, {
                isVisible = v144.isVisible, 
                DisplayOrder = v144.displayOrder, 
                transitionAnimation = v146 and v146.transitionAnimation or nil, 
                notificationType = v15.SCAN_QR_CODE
            });
        end, 
        [l_AppPage_0.AvatarExperienceWrapper] = function(v147, _, v149) --[[ Line: 484 ]]
            -- upvalues: v13 (ref), v63 (ref), l_AppPage_0 (ref)
            return v13(v63, l_AppPage_0.AvatarExperienceWrapper, v147, v149);
        end, 
        [l_AppPage_0.AvatarExperienceWrapperTransparent] = function(v150, _, v152) --[[ Line: 492 ]]
            -- upvalues: v13 (ref), v63 (ref), l_AppPage_0 (ref)
            return v13(v63, l_AppPage_0.AvatarExperienceWrapperTransparent, v150, v152);
        end, 
        [l_AppPage_0.BuildersClub] = function(v153, _, v155) --[[ Line: 500 ]]
            -- upvalues: v77 (ref), v2 (ref), v59 (ref), v16 (ref), v25 (ref), v43 (ref), v15 (ref)
            if v77.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v59, {
                    url = v16.fromString("www:premium/membership")(), 
                    titleKey = "CommonUI.Features.Label.Premium", 
                    transitionAnimation = v155.transitionAnimation, 
                    hasBackButton = not v25() and nil, 
                    overlayProps = {
                        isVisible = v153.isVisible, 
                        DisplayOrder = v153.displayOrder
                    }
                });
            else
                return v2.createElement(v43, {
                    isVisible = v153.isVisible, 
                    DisplayOrder = v153.displayOrder, 
                    notificationType = v15.OPEN_BUILDERS_CLUB, 
                    titleTextLocalizationKey = "CommonUI.Features.Label.Premium", 
                    transitionAnimation = v155 and v155.transitionAnimation or nil
                });
            end;
        end, 
        [l_AppPage_0.Blackbird] = l_FFlagEnableBlackbird_0 and function(v156, _, v158) --[[ Line: 524 ]]
            -- upvalues: v77 (ref), v2 (ref), v59 (ref), v16 (ref), l_GetFStringBlackbirdUrl_0 (ref), v25 (ref)
            if v77.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v59, {
                    url = v16.fromString(l_GetFStringBlackbirdUrl_0())(), 
                    titleKey = "CommonUI.Features.Label.X", 
                    transitionAnimation = v158.transitionAnimation, 
                    hasBackButton = not v25() and nil, 
                    overlayProps = {
                        isVisible = v156.isVisible, 
                        DisplayOrder = v156.displayOrder
                    }
                });
            else
                return nil;
            end;
        end or nil, 
        [l_AppPage_0.Payment] = function(v159, v160, v161) --[[ Line: 545 ]]
            -- upvalues: v2 (ref), v50 (ref), v77 (ref), v16 (ref)
            return v2.createElement(v50, {
                url = if v77.GetFFlagEnableUnifiedStaticWebViews() and v161 and v161.analyticId ~= nil then v16.fromString("www:upgrades/paymentmethods?ap={productId}&analyticId={analyticId}")({
                    productId = v160, 
                    analyticId = v161.analyticId
                }) else if v77.GetFFlagEnableUnifiedStaticWebViews() then v16.fromString("www:upgrades/paymentmethods?ap={productId}")({
                    productId = v160
                }) else nil, 
                isVisible = v159.isVisible, 
                DisplayOrder = v159.displayOrder, 
                transitionAnimation = v161 and v161.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.Notifications] = function(v162, _, v164) --[[ Line: 564 ]]
            -- upvalues: v77 (ref), v2 (ref), v59 (ref), v16 (ref), v17 (ref), v43 (ref), v15 (ref)
            if v77.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v59, {
                    url = v16.fromString("www:notificationstream/embedded")(), 
                    titleKey = "Feature.AccountSettings.Heading.Tab.Notifications", 
                    windowType = v17.Dialog, 
                    transitionAnimation = v164.transitionAnimation, 
                    searchParams = v164.searchParams, 
                    windowCloseCallback = v164.onClose, 
                    overlayProps = {
                        isVisible = v162.isVisible, 
                        DisplayOrder = v162.displayOrder
                    }
                });
            else
                return v2.createElement(v43, {
                    isVisible = v162.isVisible, 
                    DisplayOrder = v162.displayOrder, 
                    notificationType = v15.VIEW_NOTIFICATIONS, 
                    transitionAnimation = v164 and v164.transitionAnimation or nil, 
                    titleTextLocalizationKey = "Feature.AccountSettings.Heading.Tab.Notifications", 
                    onClose = v164 and v164.onClose or nil
                });
            end;
        end, 
        [l_AppPage_0.LogoutConfirmation] = function(v165, _, v167) --[[ Line: 590 ]]
            -- upvalues: v2 (ref), v43 (ref), v15 (ref)
            return v2.createElement(v43, {
                isVisible = v165.isVisible, 
                DisplayOrder = v165.displayOrder, 
                notificationType = v15.ACTION_LOG_OUT, 
                transitionAnimation = v167 and v167.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.AddFriends] = function(v168, _, v170) --[[ Line: 598 ]]
            -- upvalues: v77 (ref), v2 (ref), v59 (ref), v16 (ref), v43 (ref), v15 (ref)
            if v77.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v59, {
                    url = v16.fromString("www:users/friends#!/friend-requests?onlyShowContents=true")(), 
                    titleKey = "CommonUI.Features.Label.Friends", 
                    transitionAnimation = v170.transitionAnimation, 
                    searchParams = {
                        searchType = "Players"
                    }, 
                    windowCloseCallback = v170.onClose, 
                    overlayProps = {
                        isVisible = v168.isVisible, 
                        DisplayOrder = v168.displayOrder
                    }
                });
            else
                return v2.createElement(v43, {
                    isVisible = v168.isVisible, 
                    DisplayOrder = v168.displayOrder, 
                    notificationType = v15.UNIVERSAL_FRIENDS, 
                    transitionAnimation = v170 and v170.transitionAnimation or nil, 
                    titleTextLocalizationKey = "CommonUI.Features.Label.Friends", 
                    onClose = v170 and v170.onClose or nil
                });
            end;
        end, 
        [l_AppPage_0.ViewUserProfile] = function(v171, v172, v173) --[[ Line: 625 ]]
            -- upvalues: v2 (ref), v46 (ref)
            return v2.createElement(v46, {
                isVisible = v171.isVisible, 
                DisplayOrder = v171.displayOrder, 
                userId = v172, 
                onClose = v173 and v173.onClose or nil
            });
        end, 
        [l_AppPage_0.ViewProfile] = function(v174, v175) --[[ Line: 633 ]]
            -- upvalues: v2 (ref), v47 (ref)
            return v2.createElement(v47, {
                isVisible = v174.isVisible, 
                DisplayOrder = v174.displayOrder, 
                url = v175
            });
        end, 
        [l_AppPage_0.LoginNative] = function(v176, _, v178) --[[ Line: 640 ]]
            -- upvalues: v2 (ref), v43 (ref), v15 (ref)
            return v2.createElement(v43, {
                isVisible = v176.isVisible, 
                DisplayOrder = v176.displayOrder, 
                notificationType = v15.ACTION_LOG_IN, 
                transitionAnimation = v178 and v178.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.CaptchaNative] = function(v179, _, v181) --[[ Line: 648 ]]
            -- upvalues: v2 (ref), v27 (ref)
            local v182 = v181.captchaType == "signup";
            if v181.captchaType == "login" or v182 then
                local v183 = {
                    isVisible = v179.isVisible, 
                    DisplayOrder = v179.displayOrder, 
                    captchaType = v181.captchaType, 
                    cvalueType = v181.cvalueType, 
                    cvalue = v181.cvalue, 
                    dxBlob = v181.dxBlob, 
                    captchaId = v181.captchaId, 
                    captchaCallback = v181.captchaCallback, 
                    backNavigationDisabledWhileLoading = v181.backNavigationDisabledWhileLoading, 
                    transitionAnimation = v181 and v181.transitionAnimation or nil, 
                    webViewVisible = false
                };
                return v2.createElement(v27.CaptchaPageBrowserServiceWrapper, v183);
            else
                return v2.createElement(v27.CaptchaPageBrowserServiceWrapper, {
                    isVisible = v179.isVisible, 
                    DisplayOrder = v179.displayOrder, 
                    captchaType = v181.captchaType, 
                    cvalueType = v181.cvalueType, 
                    cvalue = v181.cvalue, 
                    captchaCallback = v181.captchaCallback, 
                    backNavigationDisabledWhileLoading = v181.backNavigationDisabledWhileLoading, 
                    transitionAnimation = v181 and v181.transitionAnimation or nil, 
                    webViewVisible = false
                });
            end;
        end, 
        [l_AppPage_0.RobuxUpsell] = function(v184, _, v186) --[[ Line: 680 ]]
            -- upvalues: v13 (ref), v68 (ref), l_AppPage_0 (ref)
            return v13(v68, l_AppPage_0.RobuxUpsell, v184, v186);
        end, 
        [l_AppPage_0.SubscriptionPurchase] = function(v187, _, v189) --[[ Line: 683 ]]
            -- upvalues: v13 (ref), v69 (ref), l_AppPage_0 (ref)
            return v13(v69, l_AppPage_0.SubscriptionPurchase, v187, v189);
        end, 
        [l_AppPage_0.ShareSheet] = function(v190, _, v192) --[[ Line: 691 ]]
            -- upvalues: v2 (ref), v52 (ref)
            return v2.createElement(v52, {
                isVisible = v190.isVisible, 
                DisplayOrder = v190.displayOrder, 
                data = v192
            });
        end, 
        [l_AppPage_0.SdkShare] = function(v193, _, v195) --[[ Line: 698 ]]
            -- upvalues: v2 (ref), v53 (ref)
            return v2.createElement(v53, {
                isVisible = v193.isVisible, 
                DisplayOrder = v193.displayOrder, 
                data = v195
            });
        end, 
        [l_AppPage_0.ReportAbuse] = function(v196, v197, v198) --[[ Line: 705 ]]
            -- upvalues: v2 (ref), v49 (ref)
            return v2.createElement(v49, {
                isVisible = v196.isVisible, 
                DisplayOrder = v196.displayOrder, 
                url = v197, 
                onClose = v198 and v198.onClose or nil
            });
        end, 
        [l_AppPage_0.PhoneVerification] = function(_, _, v201) --[[ Line: 713 ]]
            -- upvalues: v2 (ref), v56 (ref)
            return v2.createElement(v56, v201);
        end, 
        [l_AppPage_0.EditUsername] = function(_, _, v204) --[[ Line: 716 ]]
            -- upvalues: v2 (ref), v34 (ref)
            return v2.createElement(v34, v204);
        end, 
        [l_AppPage_0.ChallengeHybridOverlayPage] = function(v205, _, v207) --[[ Line: 719 ]]
            -- upvalues: v13 (ref), v60 (ref), l_AppPage_0 (ref)
            return v13(v60, l_AppPage_0.ChallengeHybridOverlayPage, v205, v207);
        end, 
        [l_AppPage_0.ChallengeDialogModalContainer] = v77.GetFFlagLuaAppChallengeDialogContainerPageEnabled() and function(v208, _, v210) --[[ Line: 728 ]]
            -- upvalues: v13 (ref), v62 (ref), l_AppPage_0 (ref)
            return v13(v62, l_AppPage_0.ChallengeDialogModalContainer, v208, v210);
        end or nil, 
        [l_AppPage_0.ReportDialog] = function(v211) --[[ Line: 737 ]]
            -- upvalues: v13 (ref), v71 (ref), l_AppPage_0 (ref)
            return v13(v71, l_AppPage_0.ReportDialog, v211);
        end, 
        [l_AppPage_0.AgeVerificationRequired] = function(v212, v213) --[[ Line: 740 ]]
            -- upvalues: v13 (ref), v67 (ref), l_AppPage_0 (ref)
            local v214 = v213 and {
                universeId = v213
            } or nil;
            return v13(v67, l_AppPage_0.AgeVerificationRequired, v212, v214);
        end, 
        [l_AppPage_0.ChallengeHybridWebView] = function(v215, _, v217) --[[ Line: 752 ]]
            -- upvalues: v2 (ref), v61 (ref), v3 (ref)
            return v2.createElement(v61, v3.Dictionary.join(v217, {
                appContainerNavigation = v215
            }));
        end, 
        [l_AppPage_0.InviteLinkExpiredModal] = function(v218, _, v220) --[[ Line: 760 ]]
            -- upvalues: v13 (ref), v30 (ref), l_AppPage_0 (ref)
            return v13(v30, l_AppPage_0.InviteLinkExpiredModal, v218, v220);
        end, 
        [l_AppPage_0.ShareLinkInvalidModal] = function(v221, _, v223) --[[ Line: 768 ]]
            -- upvalues: v13 (ref), v31 (ref), l_AppPage_0 (ref)
            return v13(v31, l_AppPage_0.ShareLinkInvalidModal, v221, v223);
        end, 
        [l_AppPage_0.ProfileQRCodePage] = function(v224, _, v226) --[[ Line: 776 ]]
            -- upvalues: v13 (ref), v32 (ref), l_AppPage_0 (ref)
            return v13(v32, l_AppPage_0.ProfileQRCodePage, v224, v226);
        end, 
        [l_AppPage_0.AccountInfo] = function(v227, v228, v229) --[[ Line: 779 ]]
            -- upvalues: v77 (ref), v2 (ref), v51 (ref), v3 (ref)
            if v77.FFlagFetchUserNameOnCloseAccountInfo then
                return v2.createElement(v51, v3.Dictionary.join(v229, {
                    isVisible = v227.isVisible, 
                    displayOrder = v227.displayOrder, 
                    url = v228
                }));
            else
                return nil;
            end;
        end, 
        [l_AppPage_0.ParentVerification] = function(_, v231) --[[ Line: 794 ]]
            -- upvalues: v79 (ref), v2 (ref), v58 (ref), v16 (ref)
            if v79 then
                return v2.createElement(v58, {
                    url = v231
                });
            else
                return v2.createElement(v58, {
                    url = v16.fromString("www:parents/account-setup")()
                });
            end;
        end, 
        [l_AppPage_0.EmailVerification] = function(_, v233) --[[ Line: 805 ]]
            -- upvalues: v79 (ref), v2 (ref), v58 (ref), v16 (ref)
            if v79 then
                return v2.createElement(v58, {
                    url = v233
                });
            else
                return v2.createElement(v58, {
                    url = v16.fromString("www:")()
                });
            end;
        end, 
        [l_AppPage_0.VerifiedBadgeModal] = function(v234, _, v236) --[[ Line: 816 ]]
            -- upvalues: v13 (ref), v38 (ref), l_AppPage_0 (ref)
            return v13(v38, l_AppPage_0.VerifiedBadgeModal, v234, v236);
        end, 
        [l_AppPage_0.SocialMessageToast] = function(v237, _, v239) --[[ Line: 819 ]]
            -- upvalues: v13 (ref), v33 (ref), l_AppPage_0 (ref)
            return v13(v33, l_AppPage_0.SocialMessageToast, v237, v239);
        end, 
        [l_AppPage_0.PassesPage] = function(v240, v241, v242) --[[ Line: 822 ]]
            -- upvalues: v3 (ref), v13 (ref), v29 (ref), l_AppPage_0 (ref)
            local v243 = {
                universeId = v241
            };
            if v242 then
                v243 = v3.Dictionary.join(v242, v243);
            end;
            return v13(v29, l_AppPage_0.PassesPage, v240, v243);
        end, 
        [l_AppPage_0.AccountSettingsUpsell] = v77.GetFFlagEnableAccountSettingsUpsell() and function(v244, _, v246) --[[ Line: 832 ]]
            -- upvalues: v13 (ref), v74 (ref), l_AppPage_0 (ref)
            return v13(v74, l_AppPage_0.AccountSettingsUpsell, v244, v246);
        end or nil, 
        [l_AppPage_0.AmpWizardContainer] = v77.GetFFlagEnableAmpUpsellWizard() and function(v247, _, v249) --[[ Line: 842 ]]
            -- upvalues: v13 (ref), v75 (ref), l_AppPage_0 (ref)
            return v13(v75, l_AppPage_0.AmpWizardContainer, v247, v249);
        end or nil, 
        [l_AppPage_0.IDVUpsellContainer] = v77.GetFFlagEnableAmpIDVUpsellSupport() and function(v250, _, v252) --[[ Line: 852 ]]
            -- upvalues: v13 (ref), v64 (ref), l_AppPage_0 (ref)
            return v13(v64, l_AppPage_0.IDVUpsellContainer, v250, v252);
        end or nil, 
        [l_AppPage_0.VPCUpsellContainer] = function(v253, _, v255) --[[ Line: 856 ]]
            -- upvalues: v13 (ref), v65 (ref), l_AppPage_0 (ref)
            return v13(v65, l_AppPage_0.VPCUpsellContainer, v253, v255);
        end, 
        [l_AppPage_0.RobloxSubscriptionUpsell] = v77.GetFFlagEnableAmpSubscriptionUpsell() and function(v256, _, v258) --[[ Line: 860 ]]
            -- upvalues: v13 (ref), v66 (ref), l_AppPage_0 (ref)
            return v13(v66, l_AppPage_0.RobloxSubscriptionUpsell, v256, v258);
        end or nil, 
        [l_AppPage_0.AddAuthMethodPage] = function(v259) --[[ Line: 869 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.AddAuthMethodPage, l_AppPage_0.AddAuthMethodPage, v259);
        end, 
        [l_AppPage_0.PasskeyUpsellScreen] = l_FFlagPasskeyUpsellEnabled_0 and function(v260, _, v262) --[[ Line: 873 ]]
            -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
            return v13(v27.PasskeyUpsellScreen, l_AppPage_0.PasskeyUpsellScreen, v260, v262);
        end or nil, 
        [l_AppPage_0.TutorialUpsellScreen] = l_FFlagTutorialUpsellEnabled_0 and function(v263, _, v265) --[[ Line: 883 ]]
            -- upvalues: v13 (ref), v55 (ref), l_AppPage_0 (ref)
            return v13(v55, l_AppPage_0.TutorialUpsellScreen, v263, v265);
        end or nil, 
        [l_AppPage_0.SponsoredTooltipPeekView] = function(v266, _, v268) --[[ Line: 892 ]]
            -- upvalues: v13 (ref), v72 (ref), l_AppPage_0 (ref)
            return v13(v72, l_AppPage_0.SponsoredTooltipPeekView, v266, v268);
        end, 
        [l_AppPage_0.InfoPeekView] = function(v269, _, v271) --[[ Line: 900 ]]
            -- upvalues: v13 (ref), v73 (ref), l_AppPage_0 (ref)
            return v13(v73, l_AppPage_0.InfoPeekView, v269, v271);
        end, 
        [l_AppPage_0.VoiceTrialUpsell] = v82() and function(v272, _, v274) --[[ Line: 904 ]]
            -- upvalues: v13 (ref), v76 (ref), l_AppPage_0 (ref)
            return v13(v76, l_AppPage_0.VoiceTrialUpsell, v272, v274);
        end or nil, 
        [l_AppPage_0.SecurityAlertInfo] = l_GetFFlagEnableSecurityAlertDeeplink_0() and function(v275, v276, v277) --[[ Line: 909 ]]
            -- upvalues: v2 (ref), v48 (ref), v15 (ref), v77 (ref)
            return v2.createElement(v48, {
                isVisible = v275.isVisible, 
                DisplayOrder = v275.displayOrder, 
                titleKey = "Feature.SecurityFeedback.Header.NewLogin", 
                notificationType = v15.OPEN_CUSTOM_WEBVIEW, 
                url = v276, 
                searchParams = if v77.GetFFlagEnableUnifiedStaticWebViews() then v277.searchParams else nil, 
                transitionAnimation = v277 and v277.transitionAnimation or nil, 
                onClose = v277 and v277.onClose or nil
            });
        end or nil
    };
    local v279 = {};
    for v280, v281 in v278 do
        table.insert(v279, {
            [v280] = {
                screen = v12(v281, v280), 
                navigationOptions = v90(v280)
            }
        });
    end;
    table.insert(v279, {
        [l_AppPage_0.AvatarExperienceRoot] = {
            getScreen = function() --[[ Line: 938 ]] --[[ Name: getScreen ]]
                -- upvalues: l_Modules_0 (ref)
                return require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootContainer);
            end, 
            navigationOptions = {
                hasSubNavigation = true
            }
        }
    });
    table.insert(v279, {
        [l_AppPage_0.Chat] = l_createLazyComponent_0(function() --[[ Line: 948 ]]
            -- upvalues: l_Modules_0 (ref)
            return require(l_Modules_0.LuaApp.Components.SocialTab.SocialTabUniversalAppWrapper.Container);
        end)
    });
    table.insert(v279, {
        [l_AppPage_0.PurchaseRobux] = {
            screen = v12(function(v282, v283, v284) --[[ Line: 955 ]]
                -- upvalues: v77 (ref), l_IsVRAppBuild_0 (ref), l_GuiService_0 (ref), v13 (ref), v70 (ref), l_AppPage_0 (ref), v24 (ref), v16 (ref), v2 (ref), v50 (ref)
                if v77.GetFFlagLuaAppLuaBuyRobuxPage() and l_IsVRAppBuild_0() or l_GuiService_0:IsTenFootInterface() then
                    return v13(v70, l_AppPage_0.PurchaseRobux, v282, v284);
                else
                    local v285 = nil;
                    if v24 then
                        v285 = v16.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId|}&product_id={productId|}")(v284);
                    end;
                    return v2.createElement(v50, {
                        url = if v24 then v285 else if v77.GetFFlagEnableUnifiedStaticWebViews() then v16.fromString("www:Upgrades/Robux.aspx")() else if v283 then v16.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId}")({
                            analyticId = v283
                        }) else nil, 
                        isVisible = v282.isVisible, 
                        DisplayOrder = v282.displayOrder, 
                        transitionAnimation = v284 and v284.transitionAnimation or nil
                    });
                end;
            end, l_AppPage_0.PurchaseRobux), 
            navigationOptions = v3.Dictionary.join({
                screenKind = l_ScreenKind_0.FullScreen, 
                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
            }, (v90(l_AppPage_0.PurchaseRobux)))
        }
    });
    table.insert(v279, {
        [l_AppPage_0.ReportScreen] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 993 ]]
                -- upvalues: l_CorePackages_0 (ref)
                return require(l_CorePackages_0.Workspace.Packages.AbuseReporting).ReportScreen;
            end), 
            navigationOptions = {
                screenKind = l_ScreenKind_0.FullScreen, 
                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
            }
        }
    });
    table.insert(v279, {
        [l_AppPage_0.ChallengeNativeWrapper] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 1005 ]]
                -- upvalues: l_Modules_0 (ref)
                return require(l_Modules_0.LuaApp.Components.Challenge.NativeWrapper);
            end), 
            navigationOptions = {
                transparent = v77.GetFFlagEnableTransparentNativeChallengeWrapper() and true or nil, 
                globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
            }
        }
    });
    table.insert(v279, {
        [l_AppPage_0.FAEUpsell] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 1017 ]]
                -- upvalues: l_CorePackages_0 (ref)
                return require(l_CorePackages_0.Workspace.Packages.AmpUpsell).FAEUpsellContainer;
            end), 
            navigationOptions = v90(l_AppPage_0.FAEUpsell)
        }
    });
    if l_FFlagEnableNapDedicatedPage_0 then
        table.insert(v279, {
            [l_AppPage_0.NotApprovedPage] = {
                screen = v12(function(v286, _, v288) --[[ Line: 1028 ]]
                    -- upvalues: v13 (ref), v27 (ref), l_AppPage_0 (ref)
                    return v13(v27.NotApprovedPage, l_AppPage_0.NotApprovedPage, v286, v288);
                end, l_AppPage_0.NotApprovedPage), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        });
    end;
    return v279;
end;