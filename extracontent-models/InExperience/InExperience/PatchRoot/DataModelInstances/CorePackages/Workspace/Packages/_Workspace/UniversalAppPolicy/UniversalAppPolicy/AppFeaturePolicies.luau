local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local v4 = require(l_Parent_0.Cryo);
local l_Constants_0 = require(l_Parent_0.Style).Constants;
local v6 = v4.Dictionary.values(l_Constants_0.ThemeName);
local v7 = require(script.Parent.Enum.CrossPlayCapabilities);
local v8 = require(l_Parent_0.SharedFlags);
local l_isSubjectToDesktopPolicies_0 = v8.isSubjectToDesktopPolicies;
local l_isRunningInStudio_0 = require(l_Parent_0.AppCommonLib).isRunningInStudio;
local l_GetFFlagUseVoiceExitBetaLanguage_0 = v8.GetFFlagUseVoiceExitBetaLanguage;
local l_GetFFlagDisableCDLQrCodeForMaquettes_0 = v8.GetFFlagDisableCDLQrCodeForMaquettes;
local l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 = v8.GetFFlagUseEnablePremiumUserFeaturesAppPolicy;
local l_GetFFlagLuafiedReportEntryPoints_0 = v8.GetFFlagLuafiedReportEntryPoints;
local l_GetFFlagEnableAbuseReport10ft_0 = v8.GetFFlagEnableAbuseReport10ft;
local l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 = v8.GetFFlagUseExternalBrowserForAgeGuidelines10ft;
local l_GetFFlagEnableGateNotificationPreferencesTab_0 = v8.GetFFlagEnableGateNotificationPreferencesTab;
local l_FFlagLuaAppHomeVngAppUpsell_0 = v8.FFlagLuaAppHomeVngAppUpsell;
local l_FFlagFriendRequestNicknames_0 = v8.FFlagFriendRequestNicknames;
local l_FFlagLuaAppParentUpsellPolicy_0 = v8.FFlagLuaAppParentUpsellPolicy;
local l_FFlagRenameParentEmailForVerificationUpsell_0 = v8.FFlagRenameParentEmailForVerificationUpsell;
local l_GetFFlagSeamlessVoiceConsentToastPolicy_0 = v8.GetFFlagSeamlessVoiceConsentToastPolicy;
local l_GetFFlagEnableMultiPageSignup_0 = v8.GetFFlagEnableMultiPageSignup;
local l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 = v8.GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup;
local l_FFlagEnableMicrosoftStorePaymentsPlatform_0 = v8.FFlagEnableMicrosoftStorePaymentsPlatform;
local l_FFlagEnableMilkyWayPaymentsPlatformV2_0 = v8.FFlagEnableMilkyWayPaymentsPlatformV2;
local l_FFlagLuaAppShowNoticeOnEdp_0 = v8.FFlagLuaAppShowNoticeOnEdp;
local l_FFlagAppIaScrollAwayGuac_0 = v8.FFlagAppIaScrollAwayGuac;
local l_FFlagEnableScreentimeMoreTimeOption_0 = v8.FFlagEnableScreentimeMoreTimeOption;
local l_FFlagEnableFriendsRenamingForAll_0 = v8.FFlagEnableFriendsRenamingForAll;
local l_GetFFlagExpChatGuacChatDisabledReason_0 = v8.GetFFlagExpChatGuacChatDisabledReason;
local l_FFlagGuacCanRenderTransferOnProfile_0 = v8.FFlagGuacCanRenderTransferOnProfile;
local l_FFlagAuthSecExclusions_0 = v8.FFlagAuthSecExclusions;
local l_FFlagEnableMorePageExitButtonSupport_0 = v8.FFlagEnableMorePageExitButtonSupport;
local l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 = v8.FFlagEnableMorePageDirectionalLayoutRolloutFix;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = v8.FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 = v8.FFlagAEGIS2UseGuacToShowEnabledMessage;
local l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 = v8.FFlagAEGIS2UseGuacToShowFAEUpsell;
local v39 = game:DefineFastFlag("LuaAppEnableRecommendedCarouselForDesktop", false);
local v40 = game:DefineFastFlag("DisableWebViewSupportInStudio", false);
local v41 = game:DefineFastFlag("DebugUseLegacyCrossPlayApi", false);
local v42 = game:DefineFastString("DebugOverrideCrossPlaySettingsKey", "");
local v43 = game:DefineFastString("DebugOverrideCrossPlayQueryParam", "");
local v44 = game:DefineFastFlag("DebugCrossPlaySystemUi", false);
local v45 = game:DefineFastString("DebugOverrideCrossPlayUri", "");
local v46 = game:DefineFastFlag("GuacAppPolicyDisableSignupCheckbox", false);
local v47 = game:DefineFastFlag("FlyoutDisablePremiumEntrypoint1", false);
local v48 = game:DefineFastFlag("GuacDisableBlackbirdEntrypoints", false);
local v49 = game:DefineFastFlag("FlyoutEnableGiftcardsWithRedeem", false);
local v50 = game:DefineFastFlag("DebugForceShowIllegalContentReportingUI", false);
local l_FFlagEnableLeftNavOnConsole_0 = v8.FFlagEnableLeftNavOnConsole;
local l_FFlagExpChatUseGuacForFOMOUpsell_0 = v8.FFlagExpChatUseGuacForFOMOUpsell;
local l_FFlagExpChatUseGuacForCrossAgeChat_0 = v8.FFlagExpChatUseGuacForCrossAgeChat;
local l_FFlagTCShareLinkSenderUI_0 = v8.FFlagTCShareLinkSenderUI;
local l_FFlagEnableAndroidTvAppPolicies_0 = v8.FFlagEnableAndroidTvAppPolicies;
local l_FFlagSduiAppPolicyBindings_0 = v8.FFlagSduiAppPolicyBindings;
local l_FFlagGuacStickyShortcutBarEnabled_0 = v8.FFlagGuacStickyShortcutBarEnabled;
local l_FFlagEnableCoreContentAccountType_0 = v8.FFlagEnableCoreContentAccountType;
local l_FFlagEnableCoreContentBadge_0 = v8.FFlagEnableCoreContentBadge;
game:DefineFastFlag("BehaviorCollectionControlEnabled", false);
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false);
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v8.GetFFlagNotificationsComplianceShouldRestrictStream;
return function(v61) --[[ Line: 78 ]] --[[ Name: AppFeaturePolicies ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v39 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_FFlagAppIaScrollAwayGuac_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GuiService_0 (copy), l_isRunningInStudio_0 (copy), v40 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), l_GetFFlagUseVoiceExitBetaLanguage_0 (copy), l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (copy), l_GetFFlagExpChatGuacChatDisabledReason_0 (copy), l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (copy), l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (copy), l_FFlagExpChatUseGuacForFOMOUpsell_0 (copy), l_FFlagExpChatUseGuacForCrossAgeChat_0 (copy), l_GetFFlagDisableCDLQrCodeForMaquettes_0 (copy), v4 (copy), v6 (copy), v41 (copy), v44 (copy), v45 (copy), v7 (copy), v42 (copy), v43 (copy), l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (copy), l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (copy), l_FFlagGuacCanRenderTransferOnProfile_0 (copy), l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy), l_UserInputService_0 (copy), l_FFlagLuaAppHomeVngAppUpsell_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), v50 (copy), l_FFlagRenameParentEmailForVerificationUpsell_0 (copy), l_FFlagEnableAndroidTvAppPolicies_0 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (copy), l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (copy), l_FFlagEnableFriendsRenamingForAll_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (copy), l_FFlagEnableScreentimeMoreTimeOption_0 (copy), v47 (copy), v48 (copy), v49 (copy), v46 (copy), l_FFlagAuthSecExclusions_0 (copy), l_FFlagEnableMorePageExitButtonSupport_0 (copy), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagSduiAppPolicyBindings_0 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy), l_FFlagEnableCoreContentAccountType_0 (copy), l_FFlagEnableCoreContentBadge_0 (copy)
    local function _(v62, v63) --[[ Line: 79 ]] --[[ Name: getVRDefaultPolicy ]]
        -- upvalues: v61 (copy), l_IsVRAppBuild_0 (ref)
        if v61[v62] ~= nil then
            return v61[v62];
        elseif l_IsVRAppBuild_0() then
            return v63;
        else
            return not v63;
        end;
    end;
    return {
        getFriendFinder = function() --[[ Line: 90 ]] --[[ Name: getFriendFinder ]]
            -- upvalues: v61 (copy)
            return v61.FriendFinder or false;
        end, 
        getGameDetailsMorePage = function() --[[ Line: 93 ]] --[[ Name: getGameDetailsMorePage ]]
            -- upvalues: v61 (copy)
            return v61.GameDetailsMorePage or false;
        end, 
        getGameDetailsSubtitle = function() --[[ Line: 96 ]] --[[ Name: getGameDetailsSubtitle ]]
            -- upvalues: v61 (copy)
            return v61.GameDetailsSubtitle or false;
        end, 
        getShowGlobalCounters = function() --[[ Line: 99 ]] --[[ Name: getShowGlobalCounters ]]
            -- upvalues: v61 (copy)
            return v61.GameDetailsShowGlobalCounters or false;
        end, 
        getGameDetailsPlayWithFriends = function() --[[ Line: 102 ]] --[[ Name: getGameDetailsPlayWithFriends ]]
            -- upvalues: v61 (copy)
            return v61.GameDetailsPlayWithFriends or false;
        end, 
        getGameInfoList = function() --[[ Line: 105 ]] --[[ Name: getGameInfoList ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoList or false;
        end, 
        getGamePlaysAndRatings = function() --[[ Line: 108 ]] --[[ Name: getGamePlaysAndRatings ]]
            -- upvalues: v61 (copy)
            return v61.GamePlaysAndRatings or false;
        end, 
        getNotifications = function() --[[ Line: 111 ]] --[[ Name: getNotifications ]]
            -- upvalues: v61 (copy)
            return v61.Notifications or false;
        end, 
        getRecommendedGames = function() --[[ Line: 114 ]] --[[ Name: getRecommendedGames ]]
            -- upvalues: v39 (ref), v61 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v39 then
                return v61.RecommendedGames or false;
            elseif l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v61.RecommendedGames or false;
            end;
        end, 
        getSearchBar = function() --[[ Line: 124 ]] --[[ Name: getSearchBar ]]
            -- upvalues: v61 (copy)
            return v61.SearchBar or false;
        end, 
        getMorePageContent = function() --[[ Line: 127 ]] --[[ Name: getMorePageContent ]]
            -- upvalues: v61 (copy)
            return v61.MorePageContent;
        end, 
        getAboutPageType = function() --[[ Line: 130 ]] --[[ Name: getAboutPageType ]]
            -- upvalues: v61 (copy)
            return v61.AboutPageType or "CJVAbout";
        end, 
        getSettingsPageType = function() --[[ Line: 133 ]] --[[ Name: getSettingsPageType ]]
            -- upvalues: v61 (copy)
            return v61.SettingsPageType or "Settings";
        end, 
        getSocialLinks = function() --[[ Line: 136 ]] --[[ Name: getSocialLinks ]]
            -- upvalues: v61 (copy)
            return v61.SocialLinks or false;
        end, 
        getSocialGroupLinks = function() --[[ Line: 139 ]] --[[ Name: getSocialGroupLinks ]]
            -- upvalues: v61 (copy)
            return v61.SocialGroupLinks or false;
        end, 
        getCommunityLinksEnabled = function() --[[ Line: 142 ]] --[[ Name: getCommunityLinksEnabled ]]
            -- upvalues: v61 (copy)
            return v61.CommunityLinksEnabled or false;
        end, 
        getGameInfoShowBadges = function() --[[ Line: 145 ]] --[[ Name: getGameInfoShowBadges ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoShowBadges or false;
        end, 
        getGameInfoShowCreated = function() --[[ Line: 148 ]] --[[ Name: getGameInfoShowCreated ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoShowCreated or false;
        end, 
        getGameInfoShowGamepasses = function() --[[ Line: 151 ]] --[[ Name: getGameInfoShowGamepasses ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoShowGamepasses or false;
        end, 
        getGameInfoShowGenre = function() --[[ Line: 154 ]] --[[ Name: getGameInfoShowGenre ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoShowGenre or false;
        end, 
        getGameInfoShowSubgenre = function() --[[ Line: 157 ]] --[[ Name: getGameInfoShowSubgenre ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoShowSubgenre or false;
        end, 
        getGameInfoShowMaxPlayers = function() --[[ Line: 160 ]] --[[ Name: getGameInfoShowMaxPlayers ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoShowMaxPlayers or false;
        end, 
        getGameInfoShowServers = function() --[[ Line: 163 ]] --[[ Name: getGameInfoShowServers ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoShowServers or false;
        end, 
        getGameInfoShowUpdated = function() --[[ Line: 166 ]] --[[ Name: getGameInfoShowUpdated ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoShowUpdated or false;
        end, 
        getGameInfoShowAgeRecommendation = function() --[[ Line: 169 ]] --[[ Name: getGameInfoShowAgeRecommendation ]]
            -- upvalues: v61 (copy)
            if v61.GameInfoShowAgeRecommendation == nil then
                return true;
            else
                return v61.GameInfoShowAgeRecommendation;
            end;
        end, 
        getGameInfoShowVoiceAndChatFeatures = function() --[[ Line: 175 ]] --[[ Name: getGameInfoShowVoiceAndChatFeatures ]]
            -- upvalues: v61 (copy)
            if v61.GameInfoShowVoiceAndChatFeatures == nil then
                return true;
            else
                return v61.GameInfoShowVoiceAndChatFeatures;
            end;
        end, 
        getSiteMessageBanner = function() --[[ Line: 181 ]] --[[ Name: getSiteMessageBanner ]]
            -- upvalues: v61 (copy)
            return v61.SiteMessageBanner or false;
        end, 
        getAlertRateLimit = function() --[[ Line: 184 ]] --[[ Name: getAlertRateLimit ]]
            -- upvalues: v61 (copy)
            return v61.AlertRateLimit or 300;
        end, 
        getSearchAutoComplete = function() --[[ Line: 188 ]] --[[ Name: getSearchAutoComplete ]]
            -- upvalues: v61 (copy)
            return v61.SearchAutoComplete or false;
        end, 
        getShowStudioCTA = function() --[[ Line: 191 ]] --[[ Name: getShowStudioCTA ]]
            -- upvalues: v61 (copy)
            return v61.ShowStudioCTA or false;
        end, 
        getAppIaScrollAwayEnabled = l_FFlagAppIaScrollAwayGuac_0 and function() --[[ Line: 195 ]]
            -- upvalues: v61 (copy)
            return v61.AppIaScrollAwayEnabled or false;
        end or nil, 
        getUseOmniRecommendation = function() --[[ Line: 199 ]] --[[ Name: getUseOmniRecommendation ]]
            -- upvalues: v61 (copy)
            if v61.UseOmniRecommendation == nil then
                return true;
            else
                return v61.UseOmniRecommendation;
            end;
        end, 
        getUseWidthBasedFormFactorRule = function() --[[ Line: 207 ]] --[[ Name: getUseWidthBasedFormFactorRule ]]
            -- upvalues: v61 (copy)
            return v61.UseWidthBasedFormFactorRule or false;
        end, 
        getShowYouTubeAgeAlert = function() --[[ Line: 210 ]] --[[ Name: getShowYouTubeAgeAlert ]]
            -- upvalues: v61 (copy)
            if v61.ShowYouTubeAgeAlert == nil then
                return true;
            else
                return v61.ShowYouTubeAgeAlert;
            end;
        end, 
        getShowVideoThumbnails = function() --[[ Line: 216 ]] --[[ Name: getShowVideoThumbnails ]]
            -- upvalues: v61 (copy)
            return v61.ShowVideoThumbnails or false;
        end, 
        getHomeIcon = function() --[[ Line: 219 ]] --[[ Name: getHomeIcon ]]
            -- upvalues: v61 (copy)
            return v61.HomeIcon or "LuaApp/icons/ic-roblox-close";
        end, 
        getGameInfoListShowRNVDeveloper = function() --[[ Line: 222 ]] --[[ Name: getGameInfoListShowRNVDeveloper ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoListShowRNVDeveloper or false;
        end, 
        getGameInfoListDeveloper = function() --[[ Line: 225 ]] --[[ Name: getGameInfoListDeveloper ]]
            -- upvalues: v61 (copy)
            return v61.GameInfoListDeveloper or false;
        end, 
        getShowDisplayName = function() --[[ Line: 228 ]] --[[ Name: getShowDisplayName ]]
            -- upvalues: v61 (copy)
            if v61.ShowDisplayName == nil then
                return true;
            else
                return v61.ShowDisplayName;
            end;
        end, 
        getShowAlias = function() --[[ Line: 234 ]] --[[ Name: getShowAlias ]]
            -- upvalues: v61 (copy)
            if v61.ShowUserAlias == nil then
                return true;
            else
                return v61.ShowUserAlias;
            end;
        end, 
        getCatalogReportingDisabled = function() --[[ Line: 240 ]] --[[ Name: getCatalogReportingDisabled ]]
            -- upvalues: v61 (copy)
            return v61.CatalogReportingDisabled or false;
        end, 
        getGameReportingDisabled = function() --[[ Line: 243 ]] --[[ Name: getGameReportingDisabled ]]
            -- upvalues: v61 (copy)
            return v61.GameReportingDisabled or false;
        end, 
        getGamesPageCreationCenterTitle = function() --[[ Line: 246 ]] --[[ Name: getGamesPageCreationCenterTitle ]]
            -- upvalues: v61 (copy)
            return v61.GamesPageCreationCenterTitle or false;
        end, 
        shouldUseExternalBrowserForDisclaimerLinks = function() --[[ Line: 249 ]] --[[ Name: shouldUseExternalBrowserForDisclaimerLinks ]]
            -- upvalues: v61 (copy)
            return v61.UseExternalBrowserForDisclaimerLinks or false;
        end, 
        shouldUseExternalBrowserForMorePageItem = function() --[[ Line: 252 ]] --[[ Name: shouldUseExternalBrowserForMorePageItem ]]
            -- upvalues: v61 (copy)
            return v61.UseExternalBrowserForMoreLinks or false;
        end, 
        getCatalogShow3dView = function() --[[ Line: 255 ]] --[[ Name: getCatalogShow3dView ]]
            -- upvalues: v61 (copy)
            return v61.CatalogShow3dView or false;
        end, 
        getItemDetailsFullView = function() --[[ Line: 258 ]] --[[ Name: getItemDetailsFullView ]]
            -- upvalues: v61 (copy)
            return v61.ItemDetailsFullView or false;
        end, 
        getCatalogCommunityCreations = function() --[[ Line: 261 ]] --[[ Name: getCatalogCommunityCreations ]]
            -- upvalues: v61 (copy)
            return v61.CatalogCommunityCreations or false;
        end, 
        getCatalogPremiumCategory = function() --[[ Line: 264 ]] --[[ Name: getCatalogPremiumCategory ]]
            -- upvalues: v61 (copy)
            return v61.CatalogPremiumCategory or false;
        end, 
        getShowCatalogPremiumContent = function() --[[ Line: 267 ]] --[[ Name: getShowCatalogPremiumContent ]]
            -- upvalues: v61 (copy)
            return v61.CatalogPremiumContent or false;
        end, 
        getRobloxCreatedItemsCreatedByLuobu = function() --[[ Line: 270 ]] --[[ Name: getRobloxCreatedItemsCreatedByLuobu ]]
            -- upvalues: v61 (copy)
            if v61.RobloxCreatedItemsCreatedByLuobu == nil then
                return true;
            else
                return v61.RobloxCreatedItemsCreatedByLuobu;
            end;
        end, 
        getHomePageFriendSection = function() --[[ Line: 276 ]] --[[ Name: getHomePageFriendSection ]]
            -- upvalues: v61 (copy)
            return v61.HomePageFriendSection or false;
        end, 
        getHomePageProfileLink = function() --[[ Line: 279 ]] --[[ Name: getHomePageProfileLink ]]
            -- upvalues: v61 (copy)
            return v61.HomePageProfileLink or false;
        end, 
        getPurchasePromptIncludingWarning = function() --[[ Line: 282 ]] --[[ Name: getPurchasePromptIncludingWarning ]]
            -- upvalues: v61 (copy)
            if v61.PurchasePromptIncludingWarning == nil then
                return true;
            else
                return v61.PurchasePromptIncludingWarning;
            end;
        end, 
        getCheckUserAgreementsUpdatedOnLogin = function() --[[ Line: 288 ]] --[[ Name: getCheckUserAgreementsUpdatedOnLogin ]]
            -- upvalues: v61 (copy)
            if v61.CheckUserAgreementsUpdatedOnLogin == nil then
                return true;
            else
                return v61.CheckUserAgreementsUpdatedOnLogin;
            end;
        end, 
        getAddUserAgreementIdsToSignupRequest = function() --[[ Line: 294 ]] --[[ Name: getAddUserAgreementIdsToSignupRequest ]]
            -- upvalues: v61 (copy)
            return v61.AddUserAgreementIdsToSignupRequest or false;
        end, 
        RequireExplicitVoiceConsent = function() --[[ Line: 297 ]] --[[ Name: RequireExplicitVoiceConsent ]]
            -- upvalues: v61 (copy)
            return v61.RequireExplicitVoiceConsent or false;
        end, 
        getRequireExplicitAvatarVideoConsent = function() --[[ Line: 300 ]] --[[ Name: getRequireExplicitAvatarVideoConsent ]]
            -- upvalues: v61 (copy)
            return v61.RequireExplicitAvatarVideoConsent or false;
        end, 
        getShowVoiceUpsellV2 = function() --[[ Line: 303 ]] --[[ Name: getShowVoiceUpsellV2 ]]
            -- upvalues: v61 (copy)
            return v61.ShowVoiceUpsellV2 or false;
        end, 
        getShouldShowGroupsTile = function() --[[ Line: 306 ]] --[[ Name: getShouldShowGroupsTile ]]
            -- upvalues: v61 (copy)
            return v61.ShouldShowGroupsTile or false;
        end, 
        useLuobuAuthentication = function() --[[ Line: 309 ]] --[[ Name: useLuobuAuthentication ]]
            -- upvalues: v61 (copy)
            return v61.UseLuobuAuthentication or false;
        end, 
        useWechatQQAuthentication = function() --[[ Line: 312 ]] --[[ Name: useWechatQQAuthentication ]]
            -- upvalues: v61 (copy)
            return v61.UseWechatQQAuthentication or false;
        end, 
        useMSDKWebAuthentication = function() --[[ Line: 315 ]] --[[ Name: useMSDKWebAuthentication ]]
            -- upvalues: v61 (copy)
            return v61.UseMSDKWebAuthentication or false;
        end, 
        getQrFriendingEnabled = function() --[[ Line: 318 ]] --[[ Name: getQrFriendingEnabled ]]
            -- upvalues: v61 (copy)
            return v61.QrFriendingEnabled or false;
        end, 
        getShouldShowCameraPermissionInAgreementsPrompt = function() --[[ Line: 321 ]] --[[ Name: getShouldShowCameraPermissionInAgreementsPrompt ]]
            -- upvalues: v61 (copy)
            return v61.ShouldShowCameraPermissionInAgreementsPrompt or false;
        end, 
        getExperienceInviteShareLinkEnabled = function() --[[ Line: 324 ]] --[[ Name: getExperienceInviteShareLinkEnabled ]]
            -- upvalues: v61 (copy)
            return v61.ExperienceInviteShareLinkEnabled or false;
        end, 
        getCsatSurveyRestrictTextInput = function() --[[ Line: 327 ]] --[[ Name: getCsatSurveyRestrictTextInput ]]
            -- upvalues: v61 (copy)
            return v61.CsatSurveyRestrictTextInput or false;
        end, 
        useGridPageLayout = function() --[[ Line: 330 ]] --[[ Name: useGridPageLayout ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v61 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if l_IsVRAppBuild_0() then
                if v61.UseGridPageLayout ~= nil then
                    return v61.UseGridPageLayout;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif v61.UseGridPageLayout == nil then
                return l_isSubjectToDesktopPolicies_0();
            else
                return v61.UseGridPageLayout;
            end;
        end, 
        usePhoneSearchDiscoverEntry = function() --[[ Line: 341 ]] --[[ Name: usePhoneSearchDiscoverEntry ]]
            -- upvalues: v61 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v61.UsePhoneSearchDiscoverEntry == nil then
                return not l_isSubjectToDesktopPolicies_0();
            else
                return v61.UsePhoneSearchDiscoverEntry;
            end;
        end, 
        getShouldSystemBarUsuallyBePresent = function() --[[ Line: 348 ]] --[[ Name: getShouldSystemBarUsuallyBePresent ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v61 (copy), l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref)
            if l_IsVRAppBuild_0() then
                if v61.ShouldSystemBarUsuallyBePresentForVR ~= nil then
                    return v61.ShouldSystemBarUsuallyBePresentForVR;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
                return true;
            else
                return v61.ShouldSystemBarUsuallyBePresent or false;
            end;
        end, 
        getContactImporterEnabled = function() --[[ Line: 361 ]] --[[ Name: getContactImporterEnabled ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v61 (copy)
            if l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v61.ContactImporterEnabled or false;
            end;
        end, 
        getShouldShowSettingsPermissionsAdditionalInstructions = function() --[[ Line: 369 ]] --[[ Name: getShouldShowSettingsPermissionsAdditionalInstructions ]]
            -- upvalues: v61 (copy)
            return v61.shouldShowSettingsPermissionsAdditionalInstructions or false;
        end, 
        getUseVRFTUXPanel = function() --[[ Line: 373 ]] --[[ Name: getUseVRFTUXPanel ]]
            -- upvalues: v61 (copy), l_IsVRAppBuild_0 (ref)
            if v61.UseVRFTUXPanel ~= nil then
                return v61.UseVRFTUXPanel;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getWebViewSupport = function() --[[ Line: 376 ]] --[[ Name: getWebViewSupport ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v40 (ref), v61 (copy), l_IsVRAppBuild_0 (ref)
            if l_isRunningInStudio_0() then
                if v40 then
                    return false;
                else
                    return true;
                end;
            elseif v61.EnableWebViewSupport ~= nil then
                return v61.EnableWebViewSupport;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseLuafiedReportFlow = function() --[[ Line: 387 ]] --[[ Name: getUseLuafiedReportFlow ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), l_GetFFlagLuafiedReportEntryPoints_0 (ref), v61 (copy), l_GetFFlagEnableAbuseReport10ft_0 (ref)
            if l_IsVRAppBuild_0() and l_GetFFlagLuafiedReportEntryPoints_0() then
                if v61.UseLuafiedReportFlow ~= nil then
                    return v61.UseLuafiedReportFlow;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif l_GetFFlagEnableAbuseReport10ft_0() then
                return v61.UseLuafiedReportFlow or false;
            else
                return nil;
            end;
        end, 
        getThrottleFramerate = function() --[[ Line: 396 ]] --[[ Name: getThrottleFramerate ]]
            -- upvalues: v61 (copy), l_IsVRAppBuild_0 (ref)
            if v61.ThrottleFramerate ~= nil then
                return v61.ThrottleFramerate;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseRoundedCorners = function() --[[ Line: 399 ]] --[[ Name: getUseRoundedCorners ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v61 (copy)
            if l_IsVRAppBuild_0() then
                if v61.UseRoundedCorners ~= nil then
                    return v61.UseRoundedCorners;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            else
                return false;
            end;
        end, 
        getGameInfoShowChatFeatures = function() --[[ Line: 406 ]] --[[ Name: getGameInfoShowChatFeatures ]]
            -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (ref), v61 (copy)
            if l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return v61.GameInfoShowChatFeatures or false;
            else
                return false;
            end;
        end, 
        getDisplayCheckboxInVoiceConsent = function() --[[ Line: 412 ]] --[[ Name: getDisplayCheckboxInVoiceConsent ]]
            -- upvalues: l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (ref), v61 (copy)
            if l_GetFFlagSeamlessVoiceConsentToastPolicy_0() then
                return v61.DisplayCheckboxInVoiceConsent or false;
            else
                return false;
            end;
        end, 
        getExperienceChatAvailability = function() --[[ Line: 418 ]] --[[ Name: getExperienceChatAvailability ]]
            -- upvalues: l_GetFFlagExpChatGuacChatDisabledReason_0 (ref), v61 (copy)
            if l_GetFFlagExpChatGuacChatDisabledReason_0() then
                return v61.ExperienceChatAvailability or "unknown";
            else
                return "unknown";
            end;
        end, 
        getInCommsRegionBubble = function() --[[ Line: 424 ]] --[[ Name: getInCommsRegionBubble ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (ref), v61 (copy)
            if l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 then
                return v61.InCommsRegionBubble or false;
            else
                return false;
            end;
        end, 
        getShowInExpFAEUpsell = function() --[[ Line: 430 ]] --[[ Name: getShowInExpFAEUpsell ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (ref), v61 (copy)
            if l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 then
                return v61.ShowInExpFAEUpsell or false;
            else
                return false;
            end;
        end, 
        getShowFOMOUpsell = function() --[[ Line: 436 ]] --[[ Name: getShowFOMOUpsell ]]
            -- upvalues: l_FFlagExpChatUseGuacForFOMOUpsell_0 (ref), v61 (copy)
            if l_FFlagExpChatUseGuacForFOMOUpsell_0 then
                return v61.ShowFOMOUpsell or false;
            else
                return false;
            end;
        end, 
        getShowCrossAgeChat = function() --[[ Line: 443 ]] --[[ Name: getShowCrossAgeChat ]]
            -- upvalues: l_FFlagExpChatUseGuacForCrossAgeChat_0 (ref), v61 (copy)
            if l_FFlagExpChatUseGuacForCrossAgeChat_0 then
                return v61.ShowCrossAgeExpChat or false;
            else
                return false;
            end;
        end, 
        getAllowCameraMovements = function() --[[ Line: 450 ]] --[[ Name: getAllowCameraMovements ]]
            -- upvalues: v61 (copy), l_IsVRAppBuild_0 (ref)
            if v61.AllowCameraMovements ~= nil then
                return v61.AllowCameraMovements;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getShouldSkipAvatarLandingPage = function() --[[ Line: 453 ]] --[[ Name: getShouldSkipAvatarLandingPage ]]
            -- upvalues: v61 (copy), l_IsVRAppBuild_0 (ref)
            if v61.ShouldSkipAvatarLandingPage ~= nil then
                return v61.ShouldSkipAvatarLandingPage;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getShowPassesOnExperienceDetails = function() --[[ Line: 456 ]] --[[ Name: getShowPassesOnExperienceDetails ]]
            -- upvalues: v61 (copy)
            return v61.ShowPassesOnExperienceDetails or false;
        end, 
        getDisableCDLQrCodeForMaquettes = function() --[[ Line: 459 ]] --[[ Name: getDisableCDLQrCodeForMaquettes ]]
            -- upvalues: l_GetFFlagDisableCDLQrCodeForMaquettes_0 (ref), v61 (copy)
            if l_GetFFlagDisableCDLQrCodeForMaquettes_0() then
                return v61.DisableCDLQrCodeForMaquettes;
            else
                return false;
            end;
        end, 
        getDisableIAPEntryPoint = function() --[[ Line: 466 ]] --[[ Name: getDisableIAPEntryPoint ]]
            -- upvalues: v61 (copy)
            return v61.DisableIAPEntryPoint or false;
        end, 
        getEnforceAgeRestrictedLogin = function() --[[ Line: 469 ]] --[[ Name: getEnforceAgeRestrictedLogin ]]
            -- upvalues: v61 (copy)
            return v61.EnforceAgeRestrictedLogin or false;
        end, 
        getUrlAuthRoutes = function() --[[ Line: 472 ]] --[[ Name: getUrlAuthRoutes ]]
            -- upvalues: v61 (copy)
            local v65 = v61.Routes or {};
            if v65 then
                return v65.auth or {};
            else
                return {};
            end;
        end, 
        getShowDisconnectButton = function() --[[ Line: 481 ]] --[[ Name: getShowDisconnectButton ]]
            -- upvalues: v61 (copy)
            return v61.ShowDisconnectButton or false;
        end, 
        getUseSingleSignOn = function() --[[ Line: 484 ]] --[[ Name: getUseSingleSignOn ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v61 (copy)
            if l_isRunningInStudio_0() then
                return false;
            else
                return v61.UseSingleSignOn or false;
            end;
        end, 
        getGridCarouselSeeAllTilesEnabled = function() --[[ Line: 491 ]] --[[ Name: getGridCarouselSeeAllTilesEnabled ]]
            -- upvalues: v61 (copy)
            return v61.UseGridCarouselSeeAllTiles or false;
        end, 
        getSearchWithoutNavigatingEnabled = function() --[[ Line: 494 ]] --[[ Name: getSearchWithoutNavigatingEnabled ]]
            -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref), v61 (copy)
            if l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
                return false;
            else
                return v61.SingleSearchPageNoNavigation or false;
            end;
        end, 
        getGameListCategoryScrollListEnabled = function() --[[ Line: 500 ]] --[[ Name: getGameListCategoryScrollListEnabled ]]
            -- upvalues: v61 (copy)
            return v61.GetGamesListCategoryTabs or false;
        end, 
        getForceTheme = function() --[[ Line: 503 ]] --[[ Name: getForceTheme ]]
            -- upvalues: v4 (ref), v6 (ref), v61 (copy)
            local v67 = v4.List.map(v6, function(v66) --[[ Line: 504 ]]
                return v66:lower();
            end);
            if v61.ForceTheme and v4.List.find(v67, v61.ForceTheme:lower()) then
                return v61.ForceTheme;
            else
                return nil;
            end;
        end, 
        enableExperienceDetailsPanel = function() --[[ Line: 513 ]] --[[ Name: enableExperienceDetailsPanel ]]
            -- upvalues: v61 (copy)
            return v61.EnableExperienceDetailsPanel or false;
        end, 
        getDisableRegularLogin = function() --[[ Line: 516 ]] --[[ Name: getDisableRegularLogin ]]
            -- upvalues: v61 (copy)
            return not v61.EnableWebViewSupport and (not v61.EnableRegularLoginWithoutWebViewSupport or false);
        end, 
        getAllowPlatformAccountSwitching = function() --[[ Line: 519 ]] --[[ Name: getAllowPlatformAccountSwitching ]]
            -- upvalues: v61 (copy)
            return v61.AllowPlatformAccountSwitching or false;
        end, 
        useLegacyCrossPlayApi = function() --[[ Line: 522 ]] --[[ Name: useLegacyCrossPlayApi ]]
            -- upvalues: v41 (ref), v61 (copy)
            return v41 or v61.useLegacyCrossPlayApi or false;
        end, 
        useCrossPlaySystemUi = function() --[[ Line: 525 ]] --[[ Name: useCrossPlaySystemUi ]]
            -- upvalues: v44 (ref), v61 (copy)
            return v44 or v61.useCrossPlaySystemUi or false;
        end, 
        getCrossPlayUri = function() --[[ Line: 528 ]] --[[ Name: getCrossPlayUri ]]
            -- upvalues: v45 (ref), v61 (copy)
            if v45 ~= "" then
                return v45;
            else
                return v61.crossPlayUri or "";
            end;
        end, 
        getCrossPlayCapabilities = function() --[[ Line: 535 ]] --[[ Name: getCrossPlayCapabilities ]]
            -- upvalues: v4 (ref), v61 (copy), v7 (ref)
            return v4.List.foldLeft(v61.crossPlayCapabilities or {}, function(v68, v69) --[[ Line: 536 ]]
                -- upvalues: v4 (ref), v7 (ref)
                if v4.List.find(v68, v69) then
                    return v68;
                else
                    return v4.List.join(v68, {
                        v7[v69]
                    });
                end;
            end, {});
        end, 
        getCrossPlaySettingsKey = function() --[[ Line: 546 ]] --[[ Name: getCrossPlaySettingsKey ]]
            -- upvalues: v42 (ref), v61 (copy)
            if v42 ~= "" then
                return v42;
            else
                return v61.crossPlaySettingsKey or "";
            end;
        end, 
        getCrossPlayQueryParam = function() --[[ Line: 553 ]] --[[ Name: getCrossPlayQueryParam ]]
            -- upvalues: v43 (ref), v61 (copy)
            if v43 ~= "" then
                return v43;
            else
                return v61.crossPlayQueryParam or "";
            end;
        end, 
        getPromotionalEmailsCheckboxEnabled = function() --[[ Line: 560 ]] --[[ Name: getPromotionalEmailsCheckboxEnabled ]]
            -- upvalues: v61 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v61.PromotionalEmailsCheckboxEnabled or false;
            else
                return false;
            end;
        end, 
        getPromotionalEmailsOptInByDefault = function() --[[ Line: 567 ]] --[[ Name: getPromotionalEmailsOptInByDefault ]]
            -- upvalues: v61 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v61.PromotionalEmailsOptInByDefault or false;
            else
                return false;
            end;
        end, 
        getSupportsOverscan = function() --[[ Line: 574 ]] --[[ Name: getSupportsOverscan ]]
            -- upvalues: v61 (copy)
            return v61.SupportsOverscan or false;
        end, 
        getPlatformDisplayName = function() --[[ Line: 577 ]] --[[ Name: getPlatformDisplayName ]]
            -- upvalues: v61 (copy)
            return v61.platformDisplayName or "";
        end, 
        getPlatformAccountName = function() --[[ Line: 580 ]] --[[ Name: getPlatformAccountName ]]
            -- upvalues: v61 (copy)
            return v61.platformAccountName or nil;
        end, 
        getSupportsProfileSwitching = function() --[[ Line: 583 ]] --[[ Name: getSupportsProfileSwitching ]]
            -- upvalues: v61 (copy)
            return v61.supportsProfileSwitching or false;
        end, 
        getMountAllOmniFeedItems = function() --[[ Line: 586 ]] --[[ Name: getMountAllOmniFeedItems ]]
            -- upvalues: v61 (copy)
            return v61.mountAllOmniFeedItems or false;
        end, 
        getFriendCodeQrCodeScannerEnabled = function() --[[ Line: 589 ]] --[[ Name: getFriendCodeQrCodeScannerEnabled ]]
            -- upvalues: v61 (copy)
            return v61.FriendCodeQrCodeScannerEnabled or false;
        end, 
        getInviteFriendsDisabled = function() --[[ Line: 592 ]] --[[ Name: getInviteFriendsDisabled ]]
            -- upvalues: v61 (copy)
            return v61.InviteFriendsDisabled or false;
        end, 
        getRealNamesInDisplayNamesEnabled = function() --[[ Line: 595 ]] --[[ Name: getRealNamesInDisplayNamesEnabled ]]
            -- upvalues: v61 (copy)
            return v61.RealNamesInDisplayNamesEnabled or false;
        end, 
        getProfileShareLinkEnabled = function() --[[ Line: 598 ]] --[[ Name: getProfileShareLinkEnabled ]]
            -- upvalues: v61 (copy)
            return v61.ProfileShareLinkEnabled;
        end, 
        getProfileCopyLinkEnabled = function() --[[ Line: 601 ]] --[[ Name: getProfileCopyLinkEnabled ]]
            -- upvalues: v61 (copy)
            return v61.ProfileCopyLinkEnabled;
        end, 
        getEnablePremiumUserFeatures = function() --[[ Line: 604 ]] --[[ Name: getEnablePremiumUserFeatures ]]
            -- upvalues: l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (ref), v61 (copy)
            if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
                return v61.EnablePremiumUserFeatures or false;
            else
                return nil;
            end;
        end, 
        getEnableDualLogin = function() --[[ Line: 610 ]] --[[ Name: getEnableDualLogin ]]
            -- upvalues: v61 (copy)
            return v61.enableDualLogin or false;
        end, 
        getUseExternalBrowserForAgeGuidelines = function() --[[ Line: 614 ]] --[[ Name: getUseExternalBrowserForAgeGuidelines ]]
            -- upvalues: l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (ref), v61 (copy)
            if l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then
                return v61.UseExternalBrowserForAgeGuidelines or false;
            else
                return nil;
            end;
        end, 
        getEnableHomePageAgeBlock = function() --[[ Line: 621 ]] --[[ Name: getEnableHomePageAgeBlock ]]
            -- upvalues: v61 (copy)
            return v61.EnableHomePageAgeBlock or false;
        end, 
        getEnableUAppAccessBlock = function() --[[ Line: 624 ]] --[[ Name: getEnableUAppAccessBlock ]]
            -- upvalues: v61 (copy)
            return v61.EnableUAppAccessBlock or false;
        end, 
        getUAppBlockPageTextMapKey = function() --[[ Line: 627 ]] --[[ Name: getUAppBlockPageTextMapKey ]]
            -- upvalues: v61 (copy)
            return v61.UAppBlockPageTextMapKey or nil;
        end, 
        getUAppBlockPageShouldDisableLogOut = function() --[[ Line: 630 ]] --[[ Name: getUAppBlockPageShouldDisableLogOut ]]
            -- upvalues: v61 (copy)
            return v61.UAppBlockPageShouldDisableLogOut or nil;
        end, 
        getContactsToastEnabled = function() --[[ Line: 633 ]] --[[ Name: getContactsToastEnabled ]]
            -- upvalues: v61 (copy)
            return v61.ContactsToastEnabled or false;
        end, 
        getEnableProfileQrCode = function() --[[ Line: 636 ]] --[[ Name: getEnableProfileQrCode ]]
            -- upvalues: v61 (copy)
            return v61.EnableProfileQrCode or false;
        end, 
        getCanRenderTransferOnProfile = function() --[[ Line: 639 ]] --[[ Name: getCanRenderTransferOnProfile ]]
            -- upvalues: l_FFlagGuacCanRenderTransferOnProfile_0 (ref), v61 (copy)
            if l_FFlagGuacCanRenderTransferOnProfile_0 then
                return v61.CanRenderTransferOnProfile or false;
            else
                return false;
            end;
        end, 
        getShowVNGLoginWithExistingAccountQuickLoginButton = function() --[[ Line: 645 ]] --[[ Name: getShowVNGLoginWithExistingAccountQuickLoginButton ]]
            -- upvalues: v61 (copy)
            return v61.ShowVNGLoginWithExistingAccountQuickLoginButton or false;
        end, 
        getShowVNGAge12Badge = function() --[[ Line: 648 ]] --[[ Name: getShowVNGAge12Badge ]]
            -- upvalues: v61 (copy)
            return v61.ShowVNGAge12Badge or false;
        end, 
        getShowBrazilContentRatingLogo = function() --[[ Line: 651 ]] --[[ Name: getShowBrazilContentRatingLogo ]]
            -- upvalues: v61 (copy)
            return v61.ShowBrazilContentRatingLogo or false;
        end, 
        getUseVNGUserAgreementPopup = function() --[[ Line: 654 ]] --[[ Name: getUseVNGUserAgreementPopup ]]
            -- upvalues: v61 (copy)
            return v61.UseVNGUserAgreementPopup or false;
        end, 
        getRedirectBuyRobuxToVNG = function() --[[ Line: 657 ]] --[[ Name: getRedirectBuyRobuxToVNG ]]
            -- upvalues: v61 (copy)
            return v61.RedirectBuyRobuxToVNG or false;
        end, 
        getShowVNGTosForRobuxUpsell = function() --[[ Line: 660 ]] --[[ Name: getShowVNGTosForRobuxUpsell ]]
            -- upvalues: v61 (copy)
            return v61.ShowVNGTosForRobuxUpsell or false;
        end, 
        getBlockVNGU12SignUpOnClientSide = function() --[[ Line: 663 ]] --[[ Name: getBlockVNGU12SignUpOnClientSide ]]
            -- upvalues: v61 (copy)
            return v61.BlockVNGU12SignUpOnClientSide or false;
        end, 
        getUseAgeInput = function() --[[ Line: 666 ]] --[[ Name: getUseAgeInput ]]
            -- upvalues: v61 (copy)
            return v61.UseAgeInput or false;
        end, 
        getLoginUsernameOnly = function() --[[ Line: 669 ]] --[[ Name: getLoginUsernameOnly ]]
            -- upvalues: v61 (copy)
            return v61.LoginUsernameOnly or false;
        end, 
        getDisableEmailOTPLogin = function() --[[ Line: 672 ]] --[[ Name: getDisableEmailOTPLogin ]]
            -- upvalues: v61 (copy)
            return v61.DisableEmailOTPLogin or false;
        end, 
        getDisableLoginForgotButton = function() --[[ Line: 675 ]] --[[ Name: getDisableLoginForgotButton ]]
            -- upvalues: v61 (copy)
            return v61.DisableLoginForgotButton or false;
        end, 
        getDisableLogOutEmailUpsell = function() --[[ Line: 678 ]] --[[ Name: getDisableLogOutEmailUpsell ]]
            -- upvalues: v61 (copy)
            return v61.DisableLogOutEmailUpsell or false;
        end, 
        getVerifiedSignupCountry = function() --[[ Line: 681 ]] --[[ Name: getVerifiedSignupCountry ]]
            -- upvalues: v61 (copy)
            return v61.verifiedSignupCountry or false;
        end, 
        getParentalConsentAgreementId = function() --[[ Line: 685 ]] --[[ Name: getParentalConsentAgreementId ]]
            -- upvalues: v61 (copy)
            return v61.parentalConsentAgreementId or "";
        end, 
        getIsStrictComplianceEnabled = function() --[[ Line: 689 ]] --[[ Name: getIsStrictComplianceEnabled ]]
            -- upvalues: v61 (copy)
            return v61.isStrictComplianceEnabled or false;
        end, 
        getUseKoreaKISAUserAgreementPopup = function() --[[ Line: 693 ]] --[[ Name: getUseKoreaKISAUserAgreementPopup ]]
            -- upvalues: v61 (copy)
            return v61.useKoreaKISAUserAgreementPopup or false;
        end, 
        getEnableNotificationPreferencesPage = function() --[[ Line: 697 ]] --[[ Name: getEnableNotificationPreferencesPage ]]
            -- upvalues: l_GetFFlagEnableGateNotificationPreferencesTab_0 (ref), v61 (copy)
            if l_GetFFlagEnableGateNotificationPreferencesTab_0() then
                return v61.EnableNotificationPreferencesPage or false;
            else
                return nil;
            end;
        end, 
        getVNGFormRequired = function() --[[ Line: 704 ]] --[[ Name: getVNGFormRequired ]]
            -- upvalues: v61 (copy)
            return v61.VNGFormRequired or false;
        end, 
        getUpsellVoiceForPhoneVerification = function() --[[ Line: 707 ]] --[[ Name: getUpsellVoiceForPhoneVerification ]]
            -- upvalues: v61 (copy)
            return v61.UpsellVoiceForPhoneVerification or false;
        end, 
        getIsLinkedVRModeAvailable = function() --[[ Line: 710 ]] --[[ Name: getIsLinkedVRModeAvailable ]]
            -- upvalues: l_UserInputService_0 (ref)
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v71 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
                v71 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
            end;
            return v71;
        end, 
        getShouldShowPhoneUpsell = function() --[[ Line: 714 ]] --[[ Name: getShouldShowPhoneUpsell ]]
            -- upvalues: v61 (copy)
            return v61.ShouldShowPhoneUpsell or false;
        end, 
        getTermsOfUseLink = function() --[[ Line: 717 ]] --[[ Name: getTermsOfUseLink ]]
            -- upvalues: v61 (copy)
            return v61.TermsOfUseLink or "";
        end, 
        getPrivacyPolicyLink = function() --[[ Line: 720 ]] --[[ Name: getPrivacyPolicyLink ]]
            -- upvalues: v61 (copy)
            return v61.PrivacyPolicyLink or "";
        end, 
        getVngAppUpsell = function() --[[ Line: 723 ]] --[[ Name: getVngAppUpsell ]]
            -- upvalues: l_FFlagLuaAppHomeVngAppUpsell_0 (ref), v61 (copy)
            if l_FFlagLuaAppHomeVngAppUpsell_0 then
                return v61.VngAppUpsell or false;
            else
                return false;
            end;
        end, 
        getShouldHideContactImporterUpsell = function() --[[ Line: 730 ]] --[[ Name: getShouldHideContactImporterUpsell ]]
            -- upvalues: v61 (copy)
            return v61.ShouldHideContactImporterUpsell or false;
        end, 
        getContactImporterEncouraged = function() --[[ Line: 733 ]] --[[ Name: getContactImporterEncouraged ]]
            -- upvalues: v61 (copy)
            return v61.contactImporterEncouraged or false;
        end, 
        getFriendRequestNicknamesEnabled = function() --[[ Line: 736 ]] --[[ Name: getFriendRequestNicknamesEnabled ]]
            -- upvalues: l_FFlagFriendRequestNicknames_0 (ref), v61 (copy)
            if l_FFlagFriendRequestNicknames_0 then
                return v61.FriendRequestNicknamesEnabled or false;
            else
                return false;
            end;
        end, 
        getShouldShowVpcPlayButtonUpsells = l_FFlagLuaAppParentUpsellPolicy_0 and function() --[[ Line: 744 ]]
            -- upvalues: v61 (copy)
            return v61.shouldShowVpcPlayButtonUpsells or false;
        end or nil, 
        getRenamePaymentsToSpendingTab = function() --[[ Line: 748 ]] --[[ Name: getRenamePaymentsToSpendingTab ]]
            -- upvalues: v61 (copy)
            return v61.renamePaymentsToSpendingTab or false;
        end, 
        getNotificationsCanReceiveStream = function() --[[ Line: 753 ]] --[[ Name: getNotificationsCanReceiveStream ]]
            -- upvalues: l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (ref), v61 (copy)
            if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
                return v61.notificationsCanAccessStream or false;
            else
                return nil;
            end;
        end, 
        getNotificationsCanReceivePush = function() --[[ Line: 760 ]] --[[ Name: getNotificationsCanReceivePush ]]
            -- upvalues: v61 (copy)
            return v61.notificationsCanAccessPush or false;
        end, 
        getPushNotificationsUpsell = function() --[[ Line: 763 ]] --[[ Name: getPushNotificationsUpsell ]]
            -- upvalues: v61 (copy)
            return v61.ShouldShowPushNotificationsUpsell or false;
        end, 
        getNotificationsCanReceiveExperience = function() --[[ Line: 766 ]] --[[ Name: getNotificationsCanReceiveExperience ]]
            -- upvalues: v61 (copy)
            if v61.notificationsCanAccessExperience == nil then
                return true;
            else
                return v61.notificationsCanAccessExperience;
            end;
        end, 
        getDisableResellingCollectiblesForCompliance = function() --[[ Line: 772 ]] --[[ Name: getDisableResellingCollectiblesForCompliance ]]
            -- upvalues: v61 (copy)
            return v61.DisableResellingCollectiblesForCompliance or false;
        end, 
        getShowIllegalContentReportingUI = function() --[[ Line: 775 ]] --[[ Name: getShowIllegalContentReportingUI ]]
            -- upvalues: v50 (ref), v61 (copy)
            return v50 or v61.ShowIllegalContentReportingUI or false;
        end, 
        getEligibleForContentPostFeed = function() --[[ Line: 778 ]] --[[ Name: getEligibleForContentPostFeed ]]
            -- upvalues: v61 (copy)
            return v61.EligibleForContentPostFeed or false;
        end, 
        getEligibleForExternalContentSharing = function() --[[ Line: 781 ]] --[[ Name: getEligibleForExternalContentSharing ]]
            -- upvalues: v61 (copy)
            return v61.EligibleForExternalContentSharing or false;
        end, 
        getEnableContinuousLoad = function() --[[ Line: 784 ]] --[[ Name: getEnableContinuousLoad ]]
            -- upvalues: v61 (copy)
            return v61.EnableContinuousLoad or false;
        end, 
        getEnableAggregateLikesFavoritesCount = function() --[[ Line: 787 ]] --[[ Name: getEnableAggregateLikesFavoritesCount ]]
            -- upvalues: v61 (copy)
            return v61.EnableAggregateLikesFavoritesCount or false;
        end, 
        getShowUpdatedCameraPath = function() --[[ Line: 790 ]] --[[ Name: getShowUpdatedCameraPath ]]
            -- upvalues: v61 (copy)
            return v61.showUpdatedCameraPath or false;
        end, 
        getRenameParentEmailForVerificationUpsell = function() --[[ Line: 793 ]] --[[ Name: getRenameParentEmailForVerificationUpsell ]]
            -- upvalues: l_FFlagRenameParentEmailForVerificationUpsell_0 (ref), v61 (copy)
            if l_FFlagRenameParentEmailForVerificationUpsell_0() then
                return v61.renameParentEmailForVerificationUpsell or false;
            else
                return false;
            end;
        end, 
        getKeystrokeCollectionEnabled = function() --[[ Line: 800 ]] --[[ Name: getKeystrokeCollectionEnabled ]]
            -- upvalues: v61 (copy)
            if game:GetFastFlag("BehaviorCollectionControlEnabled") then
                return v61.EnableKeystrokeCollection or false;
            else
                return false;
            end;
        end, 
        getCanUsePlatformChat = function() --[[ Line: 808 ]] --[[ Name: getCanUsePlatformChat ]]
            -- upvalues: v61 (copy)
            return v61.CanUsePlatformChat or false;
        end, 
        getCanSeeChatTab = function() --[[ Line: 812 ]] --[[ Name: getCanSeeChatTab ]]
            -- upvalues: v61 (copy)
            return v61.CanSeeChatTab or false;
        end, 
        getHidesGamesTab = function() --[[ Line: 817 ]] --[[ Name: getHidesGamesTab ]]
            -- upvalues: l_FFlagEnableAndroidTvAppPolicies_0 (ref), v61 (copy)
            if l_FFlagEnableAndroidTvAppPolicies_0 then
                return v61.HidesGamesTab or false;
            else
                return false;
            end;
        end, 
        getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 825 ]] --[[ Name: getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (ref), v61 (copy)
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return true;
            elseif v61.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil then
                return true;
            else
                return v61.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup;
            end;
        end, 
        getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 834 ]] --[[ Name: getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (ref), l_GetFFlagEnableMultiPageSignup_0 (ref), v61 (copy)
            local v72 = l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0();
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return v72;
            elseif v61.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then
                return v72;
            else
                return v61.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages;
            end;
        end, 
        getRobuxUpsellFlowMobile = function() --[[ Line: 844 ]] --[[ Name: getRobuxUpsellFlowMobile ]]
            -- upvalues: v61 (copy)
            return v61.useMobileRobuxUpsellFlow or false;
        end, 
        getUsePaymentPlatformMicrosoftStore = function() --[[ Line: 847 ]] --[[ Name: getUsePaymentPlatformMicrosoftStore ]]
            -- upvalues: l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (ref), v61 (copy)
            if l_FFlagEnableMicrosoftStorePaymentsPlatform_0 then
                return v61.usePaymentPlatformMicrosoftStore or false;
            else
                return false;
            end;
        end, 
        getMicSettingsDirectionsLocaleKey = function() --[[ Line: 854 ]] --[[ Name: getMicSettingsDirectionsLocaleKey ]]
            -- upvalues: v61 (copy)
            return v61.micSettingsDirectionsLocaleKey or nil;
        end, 
        getMicSettingsDeeplinkDirectionsLocaleKey = function() --[[ Line: 857 ]] --[[ Name: getMicSettingsDeeplinkDirectionsLocaleKey ]]
            -- upvalues: v61 (copy)
            return v61.micSettingsDeeplinkDirectionsLocaleKey or nil;
        end, 
        getRequiresAppRestartOnMicAccessChange = function() --[[ Line: 860 ]] --[[ Name: getRequiresAppRestartOnMicAccessChange ]]
            -- upvalues: v61 (copy)
            return v61.requiresAppRestartOnMicAccessChange or false;
        end, 
        getRenameFriendsToConnections = function() --[[ Line: 863 ]] --[[ Name: getRenameFriendsToConnections ]]
            -- upvalues: l_FFlagEnableFriendsRenamingForAll_0 (ref), v61 (copy)
            if l_FFlagEnableFriendsRenamingForAll_0 then
                return true;
            else
                return v61.renameFriendsToConnections or false;
            end;
        end, 
        getShareSheetEnabled = function() --[[ Line: 869 ]] --[[ Name: getShareSheetEnabled ]]
            -- upvalues: l_FFlagTCShareLinkSenderUI_0 (ref), v61 (copy)
            if l_FFlagTCShareLinkSenderUI_0 then
                return v61.shareSheetEnabled or false;
            else
                return nil;
            end;
        end, 
        getCanAccessTrustedContacts = function() --[[ Line: 876 ]] --[[ Name: getCanAccessTrustedContacts ]]
            -- upvalues: v61 (copy)
            return v61.canAccessTrustedContacts or false;
        end, 
        getExperienceDetailsNoticeType = function() --[[ Line: 879 ]] --[[ Name: getExperienceDetailsNoticeType ]]
            -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (ref), v61 (copy)
            if l_FFlagLuaAppShowNoticeOnEdp_0 then
                return v61.experienceDetailsNoticeType or nil;
            else
                return nil;
            end;
        end, 
        getRequiresOSAFriendingEducation = function() --[[ Line: 885 ]] --[[ Name: getRequiresOSAFriendingEducation ]]
            -- upvalues: v61 (copy)
            return v61.requiresOSAFriendingEducation or false;
        end, 
        getSocialGraphSyncEnabled = function() --[[ Line: 888 ]] --[[ Name: getSocialGraphSyncEnabled ]]
            -- upvalues: v61 (copy)
            return v61.SocialGraphSyncEnabled or false;
        end, 
        getAccountDisambiguationDisabled = function() --[[ Line: 891 ]] --[[ Name: getAccountDisambiguationDisabled ]]
            -- upvalues: v61 (copy)
            return v61.AccountDisambiguationDisabled or false;
        end, 
        getHasWebViewSupportForFAE = function() --[[ Line: 894 ]] --[[ Name: getHasWebViewSupportForFAE ]]
            -- upvalues: v61 (copy)
            return v61.hasWebViewSupportForFAE or false;
        end, 
        getLinkedAuthEndpointsEnabled = function() --[[ Line: 897 ]] --[[ Name: getLinkedAuthEndpointsEnabled ]]
            -- upvalues: v61 (copy)
            return v61.LinkedAuthEndpointsEnabled or false;
        end, 
        getLinkingPlatform = function() --[[ Line: 900 ]] --[[ Name: getLinkingPlatform ]]
            -- upvalues: v61 (copy)
            return v61.LinkingPlatform or nil;
        end, 
        getUsePaymentPlatformMilkyWayStore = function() --[[ Line: 903 ]] --[[ Name: getUsePaymentPlatformMilkyWayStore ]]
            -- upvalues: l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (ref), v61 (copy)
            if l_FFlagEnableMilkyWayPaymentsPlatformV2_0 then
                return v61.usePaymentPlatformMilkyWayStore or false;
            else
                return false;
            end;
        end, 
        getScreentimeMoreTimeOptionEnabled = function() --[[ Line: 909 ]] --[[ Name: getScreentimeMoreTimeOptionEnabled ]]
            -- upvalues: l_FFlagEnableScreentimeMoreTimeOption_0 (ref), v61 (copy)
            if l_FFlagEnableScreentimeMoreTimeOption_0 then
                return v61.ScreentimeMoreTimeOptionEnabled or false;
            else
                return false;
            end;
        end, 
        getDisablePremiumEntrypoint = function() --[[ Line: 915 ]] --[[ Name: getDisablePremiumEntrypoint ]]
            -- upvalues: v47 (ref), v61 (copy)
            if v47 then
                return v61.DisablePremiumEntrypoint or v61.DisablePremiumEntryPoint or false;
            else
                return false;
            end;
        end, 
        getDisableBlackbirdEntrypoints = function() --[[ Line: 921 ]] --[[ Name: getDisableBlackbirdEntrypoints ]]
            -- upvalues: v48 (ref), v61 (copy)
            if v48 then
                return v61.DisableBlackbirdEntrypoints or false;
            else
                return false;
            end;
        end, 
        getEnableGiftcardsWithRedeem = function() --[[ Line: 927 ]] --[[ Name: getEnableGiftcardsWithRedeem ]]
            -- upvalues: v49 (ref), v61 (copy)
            if v49 then
                return v61.EnableGiftcardsWithRedeem or false;
            else
                return false;
            end;
        end, 
        getGiftCardSourceRefOverride = function() --[[ Line: 933 ]] --[[ Name: getGiftCardSourceRefOverride ]]
            -- upvalues: v61 (copy)
            return v61.GiftCardSourceRefOverride or "";
        end, 
        getSignupCheckboxDisabled = function() --[[ Line: 936 ]] --[[ Name: getSignupCheckboxDisabled ]]
            -- upvalues: v46 (ref), v61 (copy)
            if v46 then
                return v61.DisableSignupCheckbox or false;
            else
                return false;
            end;
        end, 
        getExcludeCrossDeviceSignIn = function() --[[ Line: 943 ]] --[[ Name: getExcludeCrossDeviceSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v61 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v61.ExcludeCrossDeviceSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePasskeyLogin = function() --[[ Line: 949 ]] --[[ Name: getExcludePasskeyLogin ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v61 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v61.ExcludePasskeyLogin or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernamePasswordSignIn = function() --[[ Line: 956 ]] --[[ Name: getExcludeUsernamePasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v61 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v61.ExcludeUsernamePasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeEmailPasswordSignIn = function() --[[ Line: 962 ]] --[[ Name: getExcludeEmailPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v61 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v61.ExcludeEmailPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePhoneNumberPasswordSignIn = function() --[[ Line: 968 ]] --[[ Name: getExcludePhoneNumberPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v61 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v61.ExcludePhoneNumberPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeAccountSwitcher = function() --[[ Line: 974 ]] --[[ Name: getExcludeAccountSwitcher ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v61 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v61.ExcludeAccountSwitcher or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernameUpdateModeration = function() --[[ Line: 980 ]] --[[ Name: getExcludeUsernameUpdateModeration ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v61 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v61.ExcludeUsernameUpdateModeration or false;
            else
                return false;
            end;
        end, 
        getMorePageExitButtonEnabled = l_FFlagEnableMorePageExitButtonSupport_0 and function() --[[ Line: 987 ]]
            -- upvalues: v61 (copy)
            return v61.MorePageExitButtonEnabled or false;
        end or nil, 
        getMoreGridDirectionalLayoutPreferred = l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 and function() --[[ Line: 992 ]]
            -- upvalues: v61 (copy)
            return v61.MoreGridDirectionalLayoutPreferred or false;
        end or nil, 
        getShouldUseDMCCALegalDisclosureInApp = function() --[[ Line: 996 ]] --[[ Name: getShouldUseDMCCALegalDisclosureInApp ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v61 (copy)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                return v61.ShouldUseDMCCALegalDisclosureInApp or false;
            else
                return false;
            end;
        end, 
        getCanAccessParty = function() --[[ Line: 1002 ]] --[[ Name: getCanAccessParty ]]
            -- upvalues: v61 (copy)
            if v61.CanAccessParty == nil then
                return true;
            else
                return v61.CanAccessParty;
            end;
        end, 
        getRedeemTileEnabled = function() --[[ Line: 1008 ]] --[[ Name: getRedeemTileEnabled ]]
            -- upvalues: v61 (copy)
            return v61.RedeemTileEnabled or false;
        end, 
        getShouldUseVibrationInsteadOfHaptics = function() --[[ Line: 1011 ]] --[[ Name: getShouldUseVibrationInsteadOfHaptics ]]
            -- upvalues: v61 (copy)
            return v61.ShouldUseVibrationInsteadOfHaptics or false;
        end, 
        getRawPolicy = l_FFlagSduiAppPolicyBindings_0 and function() --[[ Line: 1015 ]]
            -- upvalues: v61 (copy)
            return v61;
        end or nil, 
        getStickyShortcutBarEnabled = l_FFlagGuacStickyShortcutBarEnabled_0 and function() --[[ Line: 1020 ]]
            -- upvalues: v61 (copy)
            return v61.StickyShortcutBarEnabled or false;
        end or nil, 
        getAccountType = l_FFlagEnableCoreContentAccountType_0 and function() --[[ Line: 1025 ]]
            -- upvalues: v61 (copy)
            return v61.AccountType;
        end or nil, 
        getCoreContentBadgeText = l_FFlagEnableCoreContentBadge_0 and function() --[[ Line: 1030 ]]
            -- upvalues: v61 (copy)
            return v61.CoreContentBadgeText;
        end or nil
    };
end;