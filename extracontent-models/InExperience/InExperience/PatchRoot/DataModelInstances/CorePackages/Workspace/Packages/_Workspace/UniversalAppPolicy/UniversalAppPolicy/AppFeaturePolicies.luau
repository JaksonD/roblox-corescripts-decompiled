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
local l_FFlagPartyVoiceEnableMicPermissionsBanner_0 = v8.FFlagPartyVoiceEnableMicPermissionsBanner;
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
local v40 = game:DefineFastFlag("LuaAppEnableRecommendedCarouselForDesktop", false);
local v41 = game:DefineFastFlag("DisableWebViewSupportInStudio", false);
local v42 = game:DefineFastFlag("DebugUseLegacyCrossPlayApi", false);
local v43 = game:DefineFastString("DebugOverrideCrossPlaySettingsKey", "");
local v44 = game:DefineFastString("DebugOverrideCrossPlayQueryParam", "");
local v45 = game:DefineFastFlag("DebugCrossPlaySystemUi", false);
local v46 = game:DefineFastString("DebugOverrideCrossPlayUri", "");
local v47 = game:DefineFastFlag("GuacAppPolicyDisableSignupCheckbox", false);
local v48 = game:DefineFastFlag("FlyoutDisablePremiumEntrypoint1", false);
local v49 = game:DefineFastFlag("GuacDisableBlackbirdEntrypoints", false);
local v50 = game:DefineFastFlag("FlyoutEnableGiftcardsWithRedeem", false);
local l_FFlagEnableLeftNavOnConsole_0 = v8.FFlagEnableLeftNavOnConsole;
local l_FFlagExpChatUseGuacForFOMOUpsell_0 = v8.FFlagExpChatUseGuacForFOMOUpsell;
local l_FFlagExpChatUseGuacForCrossAgeChat_0 = v8.FFlagExpChatUseGuacForCrossAgeChat;
local l_FFlagTCShareLinkSenderUI_0 = v8.FFlagTCShareLinkSenderUI;
local l_FFlagEnableAndroidTvAppPolicies_0 = v8.FFlagEnableAndroidTvAppPolicies;
local l_FFlagSduiAppPolicyBindings_0 = v8.FFlagSduiAppPolicyBindings;
local l_FFlagGuacStickyShortcutBarEnabled_0 = v8.FFlagGuacStickyShortcutBarEnabled;
game:DefineFastFlag("BehaviorCollectionControlEnabled", false);
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false);
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v8.GetFFlagNotificationsComplianceShouldRestrictStream;
return function(v59) --[[ Line: 75 ]] --[[ Name: AppFeaturePolicies ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v40 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_FFlagAppIaScrollAwayGuac_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GuiService_0 (copy), l_isRunningInStudio_0 (copy), v41 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), l_GetFFlagUseVoiceExitBetaLanguage_0 (copy), l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (copy), l_GetFFlagExpChatGuacChatDisabledReason_0 (copy), l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (copy), l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (copy), l_FFlagExpChatUseGuacForFOMOUpsell_0 (copy), l_FFlagExpChatUseGuacForCrossAgeChat_0 (copy), l_GetFFlagDisableCDLQrCodeForMaquettes_0 (copy), v4 (copy), v6 (copy), v42 (copy), v45 (copy), v46 (copy), v7 (copy), v43 (copy), v44 (copy), l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (copy), l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (copy), l_FFlagGuacCanRenderTransferOnProfile_0 (copy), l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy), l_UserInputService_0 (copy), l_FFlagLuaAppHomeVngAppUpsell_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), l_FFlagRenameParentEmailForVerificationUpsell_0 (copy), l_FFlagEnableAndroidTvAppPolicies_0 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (copy), l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (copy), l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (copy), l_FFlagEnableFriendsRenamingForAll_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (copy), l_FFlagEnableScreentimeMoreTimeOption_0 (copy), v48 (copy), v49 (copy), v50 (copy), v47 (copy), l_FFlagAuthSecExclusions_0 (copy), l_FFlagEnableMorePageExitButtonSupport_0 (copy), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagSduiAppPolicyBindings_0 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy)
    local function _(v60, v61) --[[ Line: 76 ]] --[[ Name: getVRDefaultPolicy ]]
        -- upvalues: v59 (copy), l_IsVRAppBuild_0 (ref)
        if v59[v60] ~= nil then
            return v59[v60];
        elseif l_IsVRAppBuild_0() then
            return v61;
        else
            return not v61;
        end;
    end;
    return {
        getFriendFinder = function() --[[ Line: 87 ]] --[[ Name: getFriendFinder ]]
            -- upvalues: v59 (copy)
            return v59.FriendFinder or false;
        end, 
        getGameDetailsMorePage = function() --[[ Line: 90 ]] --[[ Name: getGameDetailsMorePage ]]
            -- upvalues: v59 (copy)
            return v59.GameDetailsMorePage or false;
        end, 
        getGameDetailsSubtitle = function() --[[ Line: 93 ]] --[[ Name: getGameDetailsSubtitle ]]
            -- upvalues: v59 (copy)
            return v59.GameDetailsSubtitle or false;
        end, 
        getShowGlobalCounters = function() --[[ Line: 96 ]] --[[ Name: getShowGlobalCounters ]]
            -- upvalues: v59 (copy)
            return v59.GameDetailsShowGlobalCounters or false;
        end, 
        getGameDetailsPlayWithFriends = function() --[[ Line: 99 ]] --[[ Name: getGameDetailsPlayWithFriends ]]
            -- upvalues: v59 (copy)
            return v59.GameDetailsPlayWithFriends or false;
        end, 
        getGameInfoList = function() --[[ Line: 102 ]] --[[ Name: getGameInfoList ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoList or false;
        end, 
        getGamePlaysAndRatings = function() --[[ Line: 105 ]] --[[ Name: getGamePlaysAndRatings ]]
            -- upvalues: v59 (copy)
            return v59.GamePlaysAndRatings or false;
        end, 
        getNotifications = function() --[[ Line: 108 ]] --[[ Name: getNotifications ]]
            -- upvalues: v59 (copy)
            return v59.Notifications or false;
        end, 
        getRecommendedGames = function() --[[ Line: 111 ]] --[[ Name: getRecommendedGames ]]
            -- upvalues: v40 (ref), v59 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v40 then
                return v59.RecommendedGames or false;
            elseif l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v59.RecommendedGames or false;
            end;
        end, 
        getSearchBar = function() --[[ Line: 121 ]] --[[ Name: getSearchBar ]]
            -- upvalues: v59 (copy)
            return v59.SearchBar or false;
        end, 
        getMorePageContent = function() --[[ Line: 124 ]] --[[ Name: getMorePageContent ]]
            -- upvalues: v59 (copy)
            return v59.MorePageContent;
        end, 
        getAboutPageType = function() --[[ Line: 127 ]] --[[ Name: getAboutPageType ]]
            -- upvalues: v59 (copy)
            return v59.AboutPageType or "CJVAbout";
        end, 
        getSettingsPageType = function() --[[ Line: 130 ]] --[[ Name: getSettingsPageType ]]
            -- upvalues: v59 (copy)
            return v59.SettingsPageType or "Settings";
        end, 
        getSocialLinks = function() --[[ Line: 133 ]] --[[ Name: getSocialLinks ]]
            -- upvalues: v59 (copy)
            return v59.SocialLinks or false;
        end, 
        getSocialGroupLinks = function() --[[ Line: 136 ]] --[[ Name: getSocialGroupLinks ]]
            -- upvalues: v59 (copy)
            return v59.SocialGroupLinks or false;
        end, 
        getCommunityLinksEnabled = function() --[[ Line: 139 ]] --[[ Name: getCommunityLinksEnabled ]]
            -- upvalues: v59 (copy)
            return v59.CommunityLinksEnabled or false;
        end, 
        getGameInfoShowBadges = function() --[[ Line: 142 ]] --[[ Name: getGameInfoShowBadges ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowBadges or false;
        end, 
        getGameInfoShowCreated = function() --[[ Line: 145 ]] --[[ Name: getGameInfoShowCreated ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowCreated or false;
        end, 
        getGameInfoShowGamepasses = function() --[[ Line: 148 ]] --[[ Name: getGameInfoShowGamepasses ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowGamepasses or false;
        end, 
        getGameInfoShowGenre = function() --[[ Line: 151 ]] --[[ Name: getGameInfoShowGenre ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowGenre or false;
        end, 
        getGameInfoShowSubgenre = function() --[[ Line: 154 ]] --[[ Name: getGameInfoShowSubgenre ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowSubgenre or false;
        end, 
        getGameInfoShowMaxPlayers = function() --[[ Line: 157 ]] --[[ Name: getGameInfoShowMaxPlayers ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowMaxPlayers or false;
        end, 
        getGameInfoShowServers = function() --[[ Line: 160 ]] --[[ Name: getGameInfoShowServers ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowServers or false;
        end, 
        getGameInfoShowUpdated = function() --[[ Line: 163 ]] --[[ Name: getGameInfoShowUpdated ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowUpdated or false;
        end, 
        getGameInfoShowAgeRecommendation = function() --[[ Line: 166 ]] --[[ Name: getGameInfoShowAgeRecommendation ]]
            -- upvalues: v59 (copy)
            if v59.GameInfoShowAgeRecommendation == nil then
                return true;
            else
                return v59.GameInfoShowAgeRecommendation;
            end;
        end, 
        getGameInfoShowVoiceAndChatFeatures = function() --[[ Line: 172 ]] --[[ Name: getGameInfoShowVoiceAndChatFeatures ]]
            -- upvalues: v59 (copy)
            if v59.GameInfoShowVoiceAndChatFeatures == nil then
                return true;
            else
                return v59.GameInfoShowVoiceAndChatFeatures;
            end;
        end, 
        getSiteMessageBanner = function() --[[ Line: 178 ]] --[[ Name: getSiteMessageBanner ]]
            -- upvalues: v59 (copy)
            return v59.SiteMessageBanner or false;
        end, 
        getAlertRateLimit = function() --[[ Line: 181 ]] --[[ Name: getAlertRateLimit ]]
            -- upvalues: v59 (copy)
            return v59.AlertRateLimit or 300;
        end, 
        getSearchAutoComplete = function() --[[ Line: 185 ]] --[[ Name: getSearchAutoComplete ]]
            -- upvalues: v59 (copy)
            return v59.SearchAutoComplete or false;
        end, 
        getShowStudioCTA = function() --[[ Line: 188 ]] --[[ Name: getShowStudioCTA ]]
            -- upvalues: v59 (copy)
            return v59.ShowStudioCTA or false;
        end, 
        getAppIaScrollAwayEnabled = l_FFlagAppIaScrollAwayGuac_0 and function() --[[ Line: 192 ]]
            -- upvalues: v59 (copy)
            return v59.AppIaScrollAwayEnabled or false;
        end or nil, 
        getUseOmniRecommendation = function() --[[ Line: 196 ]] --[[ Name: getUseOmniRecommendation ]]
            -- upvalues: v59 (copy)
            if v59.UseOmniRecommendation == nil then
                return true;
            else
                return v59.UseOmniRecommendation;
            end;
        end, 
        getUseWidthBasedFormFactorRule = function() --[[ Line: 204 ]] --[[ Name: getUseWidthBasedFormFactorRule ]]
            -- upvalues: v59 (copy)
            return v59.UseWidthBasedFormFactorRule or false;
        end, 
        getShowYouTubeAgeAlert = function() --[[ Line: 207 ]] --[[ Name: getShowYouTubeAgeAlert ]]
            -- upvalues: v59 (copy)
            if v59.ShowYouTubeAgeAlert == nil then
                return true;
            else
                return v59.ShowYouTubeAgeAlert;
            end;
        end, 
        getShowVideoThumbnails = function() --[[ Line: 213 ]] --[[ Name: getShowVideoThumbnails ]]
            -- upvalues: v59 (copy)
            return v59.ShowVideoThumbnails or false;
        end, 
        getHomeIcon = function() --[[ Line: 216 ]] --[[ Name: getHomeIcon ]]
            -- upvalues: v59 (copy)
            return v59.HomeIcon or "LuaApp/icons/ic-roblox-close";
        end, 
        getGameInfoListShowRNVDeveloper = function() --[[ Line: 219 ]] --[[ Name: getGameInfoListShowRNVDeveloper ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoListShowRNVDeveloper or false;
        end, 
        getGameInfoListDeveloper = function() --[[ Line: 222 ]] --[[ Name: getGameInfoListDeveloper ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoListDeveloper or false;
        end, 
        getShowDisplayName = function() --[[ Line: 225 ]] --[[ Name: getShowDisplayName ]]
            -- upvalues: v59 (copy)
            if v59.ShowDisplayName == nil then
                return true;
            else
                return v59.ShowDisplayName;
            end;
        end, 
        getShowAlias = function() --[[ Line: 231 ]] --[[ Name: getShowAlias ]]
            -- upvalues: v59 (copy)
            if v59.ShowUserAlias == nil then
                return true;
            else
                return v59.ShowUserAlias;
            end;
        end, 
        getCatalogReportingDisabled = function() --[[ Line: 237 ]] --[[ Name: getCatalogReportingDisabled ]]
            -- upvalues: v59 (copy)
            return v59.CatalogReportingDisabled or false;
        end, 
        getGameReportingDisabled = function() --[[ Line: 240 ]] --[[ Name: getGameReportingDisabled ]]
            -- upvalues: v59 (copy)
            return v59.GameReportingDisabled or false;
        end, 
        getGamesPageCreationCenterTitle = function() --[[ Line: 243 ]] --[[ Name: getGamesPageCreationCenterTitle ]]
            -- upvalues: v59 (copy)
            return v59.GamesPageCreationCenterTitle or false;
        end, 
        shouldUseExternalBrowserForDisclaimerLinks = function() --[[ Line: 246 ]] --[[ Name: shouldUseExternalBrowserForDisclaimerLinks ]]
            -- upvalues: v59 (copy)
            return v59.UseExternalBrowserForDisclaimerLinks or false;
        end, 
        shouldUseExternalBrowserForMorePageItem = function() --[[ Line: 249 ]] --[[ Name: shouldUseExternalBrowserForMorePageItem ]]
            -- upvalues: v59 (copy)
            return v59.UseExternalBrowserForMoreLinks or false;
        end, 
        getCatalogShow3dView = function() --[[ Line: 252 ]] --[[ Name: getCatalogShow3dView ]]
            -- upvalues: v59 (copy)
            return v59.CatalogShow3dView or false;
        end, 
        getItemDetailsFullView = function() --[[ Line: 255 ]] --[[ Name: getItemDetailsFullView ]]
            -- upvalues: v59 (copy)
            return v59.ItemDetailsFullView or false;
        end, 
        getCatalogCommunityCreations = function() --[[ Line: 258 ]] --[[ Name: getCatalogCommunityCreations ]]
            -- upvalues: v59 (copy)
            return v59.CatalogCommunityCreations or false;
        end, 
        getCatalogPremiumCategory = function() --[[ Line: 261 ]] --[[ Name: getCatalogPremiumCategory ]]
            -- upvalues: v59 (copy)
            return v59.CatalogPremiumCategory or false;
        end, 
        getShowCatalogPremiumContent = function() --[[ Line: 264 ]] --[[ Name: getShowCatalogPremiumContent ]]
            -- upvalues: v59 (copy)
            return v59.CatalogPremiumContent or false;
        end, 
        getRobloxCreatedItemsCreatedByLuobu = function() --[[ Line: 267 ]] --[[ Name: getRobloxCreatedItemsCreatedByLuobu ]]
            -- upvalues: v59 (copy)
            if v59.RobloxCreatedItemsCreatedByLuobu == nil then
                return true;
            else
                return v59.RobloxCreatedItemsCreatedByLuobu;
            end;
        end, 
        getHomePageFriendSection = function() --[[ Line: 273 ]] --[[ Name: getHomePageFriendSection ]]
            -- upvalues: v59 (copy)
            return v59.HomePageFriendSection or false;
        end, 
        getHomePageProfileLink = function() --[[ Line: 276 ]] --[[ Name: getHomePageProfileLink ]]
            -- upvalues: v59 (copy)
            return v59.HomePageProfileLink or false;
        end, 
        getPurchasePromptIncludingWarning = function() --[[ Line: 279 ]] --[[ Name: getPurchasePromptIncludingWarning ]]
            -- upvalues: v59 (copy)
            if v59.PurchasePromptIncludingWarning == nil then
                return true;
            else
                return v59.PurchasePromptIncludingWarning;
            end;
        end, 
        getCheckUserAgreementsUpdatedOnLogin = function() --[[ Line: 285 ]] --[[ Name: getCheckUserAgreementsUpdatedOnLogin ]]
            -- upvalues: v59 (copy)
            if v59.CheckUserAgreementsUpdatedOnLogin == nil then
                return true;
            else
                return v59.CheckUserAgreementsUpdatedOnLogin;
            end;
        end, 
        getAddUserAgreementIdsToSignupRequest = function() --[[ Line: 291 ]] --[[ Name: getAddUserAgreementIdsToSignupRequest ]]
            -- upvalues: v59 (copy)
            return v59.AddUserAgreementIdsToSignupRequest or false;
        end, 
        RequireExplicitVoiceConsent = function() --[[ Line: 294 ]] --[[ Name: RequireExplicitVoiceConsent ]]
            -- upvalues: v59 (copy)
            return v59.RequireExplicitVoiceConsent or false;
        end, 
        getRequireExplicitAvatarVideoConsent = function() --[[ Line: 297 ]] --[[ Name: getRequireExplicitAvatarVideoConsent ]]
            -- upvalues: v59 (copy)
            return v59.RequireExplicitAvatarVideoConsent or false;
        end, 
        getShowVoiceUpsellV2 = function() --[[ Line: 300 ]] --[[ Name: getShowVoiceUpsellV2 ]]
            -- upvalues: v59 (copy)
            return v59.ShowVoiceUpsellV2 or false;
        end, 
        getShouldShowGroupsTile = function() --[[ Line: 303 ]] --[[ Name: getShouldShowGroupsTile ]]
            -- upvalues: v59 (copy)
            return v59.ShouldShowGroupsTile or false;
        end, 
        useLuobuAuthentication = function() --[[ Line: 306 ]] --[[ Name: useLuobuAuthentication ]]
            -- upvalues: v59 (copy)
            return v59.UseLuobuAuthentication or false;
        end, 
        useWechatQQAuthentication = function() --[[ Line: 309 ]] --[[ Name: useWechatQQAuthentication ]]
            -- upvalues: v59 (copy)
            return v59.UseWechatQQAuthentication or false;
        end, 
        useMSDKWebAuthentication = function() --[[ Line: 312 ]] --[[ Name: useMSDKWebAuthentication ]]
            -- upvalues: v59 (copy)
            return v59.UseMSDKWebAuthentication or false;
        end, 
        getQrFriendingEnabled = function() --[[ Line: 315 ]] --[[ Name: getQrFriendingEnabled ]]
            -- upvalues: v59 (copy)
            return v59.QrFriendingEnabled or false;
        end, 
        getShouldShowCameraPermissionInAgreementsPrompt = function() --[[ Line: 318 ]] --[[ Name: getShouldShowCameraPermissionInAgreementsPrompt ]]
            -- upvalues: v59 (copy)
            return v59.ShouldShowCameraPermissionInAgreementsPrompt or false;
        end, 
        getExperienceInviteShareLinkEnabled = function() --[[ Line: 321 ]] --[[ Name: getExperienceInviteShareLinkEnabled ]]
            -- upvalues: v59 (copy)
            return v59.ExperienceInviteShareLinkEnabled or false;
        end, 
        getCsatSurveyRestrictTextInput = function() --[[ Line: 324 ]] --[[ Name: getCsatSurveyRestrictTextInput ]]
            -- upvalues: v59 (copy)
            return v59.CsatSurveyRestrictTextInput or false;
        end, 
        useGridPageLayout = function() --[[ Line: 327 ]] --[[ Name: useGridPageLayout ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v59 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if l_IsVRAppBuild_0() then
                if v59.UseGridPageLayout ~= nil then
                    return v59.UseGridPageLayout;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif v59.UseGridPageLayout == nil then
                return l_isSubjectToDesktopPolicies_0();
            else
                return v59.UseGridPageLayout;
            end;
        end, 
        usePhoneSearchDiscoverEntry = function() --[[ Line: 338 ]] --[[ Name: usePhoneSearchDiscoverEntry ]]
            -- upvalues: v59 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v59.UsePhoneSearchDiscoverEntry == nil then
                return not l_isSubjectToDesktopPolicies_0();
            else
                return v59.UsePhoneSearchDiscoverEntry;
            end;
        end, 
        getShouldSystemBarUsuallyBePresent = function() --[[ Line: 345 ]] --[[ Name: getShouldSystemBarUsuallyBePresent ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v59 (copy), l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref)
            if l_IsVRAppBuild_0() then
                if v59.ShouldSystemBarUsuallyBePresentForVR ~= nil then
                    return v59.ShouldSystemBarUsuallyBePresentForVR;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
                return true;
            else
                return v59.ShouldSystemBarUsuallyBePresent or false;
            end;
        end, 
        getContactImporterEnabled = function() --[[ Line: 358 ]] --[[ Name: getContactImporterEnabled ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v59 (copy)
            if l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v59.ContactImporterEnabled or false;
            end;
        end, 
        getShouldShowSettingsPermissionsAdditionalInstructions = function() --[[ Line: 366 ]] --[[ Name: getShouldShowSettingsPermissionsAdditionalInstructions ]]
            -- upvalues: v59 (copy)
            return v59.shouldShowSettingsPermissionsAdditionalInstructions or false;
        end, 
        getUseVRFTUXPanel = function() --[[ Line: 370 ]] --[[ Name: getUseVRFTUXPanel ]]
            -- upvalues: v59 (copy), l_IsVRAppBuild_0 (ref)
            if v59.UseVRFTUXPanel ~= nil then
                return v59.UseVRFTUXPanel;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getWebViewSupport = function() --[[ Line: 373 ]] --[[ Name: getWebViewSupport ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v41 (ref), v59 (copy), l_IsVRAppBuild_0 (ref)
            if l_isRunningInStudio_0() then
                if v41 then
                    return false;
                else
                    return true;
                end;
            elseif v59.EnableWebViewSupport ~= nil then
                return v59.EnableWebViewSupport;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseLuafiedReportFlow = function() --[[ Line: 384 ]] --[[ Name: getUseLuafiedReportFlow ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), l_GetFFlagLuafiedReportEntryPoints_0 (ref), v59 (copy), l_GetFFlagEnableAbuseReport10ft_0 (ref)
            if l_IsVRAppBuild_0() and l_GetFFlagLuafiedReportEntryPoints_0() then
                if v59.UseLuafiedReportFlow ~= nil then
                    return v59.UseLuafiedReportFlow;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif l_GetFFlagEnableAbuseReport10ft_0() then
                return v59.UseLuafiedReportFlow or false;
            else
                return nil;
            end;
        end, 
        getThrottleFramerate = function() --[[ Line: 393 ]] --[[ Name: getThrottleFramerate ]]
            -- upvalues: v59 (copy), l_IsVRAppBuild_0 (ref)
            if v59.ThrottleFramerate ~= nil then
                return v59.ThrottleFramerate;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseRoundedCorners = function() --[[ Line: 396 ]] --[[ Name: getUseRoundedCorners ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v59 (copy)
            if l_IsVRAppBuild_0() then
                if v59.UseRoundedCorners ~= nil then
                    return v59.UseRoundedCorners;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            else
                return false;
            end;
        end, 
        getGameInfoShowChatFeatures = function() --[[ Line: 403 ]] --[[ Name: getGameInfoShowChatFeatures ]]
            -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (ref), v59 (copy)
            if l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return v59.GameInfoShowChatFeatures or false;
            else
                return false;
            end;
        end, 
        getDisplayCheckboxInVoiceConsent = function() --[[ Line: 409 ]] --[[ Name: getDisplayCheckboxInVoiceConsent ]]
            -- upvalues: l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (ref), v59 (copy)
            if l_GetFFlagSeamlessVoiceConsentToastPolicy_0() then
                return v59.DisplayCheckboxInVoiceConsent or false;
            else
                return false;
            end;
        end, 
        getExperienceChatAvailability = function() --[[ Line: 415 ]] --[[ Name: getExperienceChatAvailability ]]
            -- upvalues: l_GetFFlagExpChatGuacChatDisabledReason_0 (ref), v59 (copy)
            if l_GetFFlagExpChatGuacChatDisabledReason_0() then
                return v59.ExperienceChatAvailability or "unknown";
            else
                return "unknown";
            end;
        end, 
        getInCommsRegionBubble = function() --[[ Line: 421 ]] --[[ Name: getInCommsRegionBubble ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (ref), v59 (copy)
            if l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 then
                return v59.InCommsRegionBubble or false;
            else
                return false;
            end;
        end, 
        getShowInExpFAEUpsell = function() --[[ Line: 427 ]] --[[ Name: getShowInExpFAEUpsell ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (ref), v59 (copy)
            if l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 then
                return v59.ShowInExpFAEUpsell or false;
            else
                return false;
            end;
        end, 
        getShowFOMOUpsell = function() --[[ Line: 433 ]] --[[ Name: getShowFOMOUpsell ]]
            -- upvalues: l_FFlagExpChatUseGuacForFOMOUpsell_0 (ref), v59 (copy)
            if l_FFlagExpChatUseGuacForFOMOUpsell_0 then
                return v59.ShowFOMOUpsell or false;
            else
                return false;
            end;
        end, 
        getShowCrossAgeChat = function() --[[ Line: 440 ]] --[[ Name: getShowCrossAgeChat ]]
            -- upvalues: l_FFlagExpChatUseGuacForCrossAgeChat_0 (ref), v59 (copy)
            if l_FFlagExpChatUseGuacForCrossAgeChat_0 then
                return v59.ShowCrossAgeExpChat or false;
            else
                return false;
            end;
        end, 
        getAllowCameraMovements = function() --[[ Line: 447 ]] --[[ Name: getAllowCameraMovements ]]
            -- upvalues: v59 (copy), l_IsVRAppBuild_0 (ref)
            if v59.AllowCameraMovements ~= nil then
                return v59.AllowCameraMovements;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getShouldSkipAvatarLandingPage = function() --[[ Line: 450 ]] --[[ Name: getShouldSkipAvatarLandingPage ]]
            -- upvalues: v59 (copy), l_IsVRAppBuild_0 (ref)
            if v59.ShouldSkipAvatarLandingPage ~= nil then
                return v59.ShouldSkipAvatarLandingPage;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getShowPassesOnExperienceDetails = function() --[[ Line: 453 ]] --[[ Name: getShowPassesOnExperienceDetails ]]
            -- upvalues: v59 (copy)
            return v59.ShowPassesOnExperienceDetails or false;
        end, 
        getDisableCDLQrCodeForMaquettes = function() --[[ Line: 456 ]] --[[ Name: getDisableCDLQrCodeForMaquettes ]]
            -- upvalues: l_GetFFlagDisableCDLQrCodeForMaquettes_0 (ref), v59 (copy)
            if l_GetFFlagDisableCDLQrCodeForMaquettes_0() then
                return v59.DisableCDLQrCodeForMaquettes;
            else
                return false;
            end;
        end, 
        getDisableIAPEntryPoint = function() --[[ Line: 463 ]] --[[ Name: getDisableIAPEntryPoint ]]
            -- upvalues: v59 (copy)
            return v59.DisableIAPEntryPoint or false;
        end, 
        getEnforceAgeRestrictedLogin = function() --[[ Line: 466 ]] --[[ Name: getEnforceAgeRestrictedLogin ]]
            -- upvalues: v59 (copy)
            return v59.EnforceAgeRestrictedLogin or false;
        end, 
        getUrlAuthRoutes = function() --[[ Line: 469 ]] --[[ Name: getUrlAuthRoutes ]]
            -- upvalues: v59 (copy)
            local v63 = v59.Routes or {};
            if v63 then
                return v63.auth or {};
            else
                return {};
            end;
        end, 
        getShowDisconnectButton = function() --[[ Line: 478 ]] --[[ Name: getShowDisconnectButton ]]
            -- upvalues: v59 (copy)
            return v59.ShowDisconnectButton or false;
        end, 
        getUseSingleSignOn = function() --[[ Line: 481 ]] --[[ Name: getUseSingleSignOn ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v59 (copy)
            if l_isRunningInStudio_0() then
                return false;
            else
                return v59.UseSingleSignOn or false;
            end;
        end, 
        getGridCarouselSeeAllTilesEnabled = function() --[[ Line: 488 ]] --[[ Name: getGridCarouselSeeAllTilesEnabled ]]
            -- upvalues: v59 (copy)
            return v59.UseGridCarouselSeeAllTiles or false;
        end, 
        getSearchWithoutNavigatingEnabled = function() --[[ Line: 491 ]] --[[ Name: getSearchWithoutNavigatingEnabled ]]
            -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref), v59 (copy)
            if l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
                return false;
            else
                return v59.SingleSearchPageNoNavigation or false;
            end;
        end, 
        getGameListCategoryScrollListEnabled = function() --[[ Line: 497 ]] --[[ Name: getGameListCategoryScrollListEnabled ]]
            -- upvalues: v59 (copy)
            return v59.GetGamesListCategoryTabs or false;
        end, 
        getForceTheme = function() --[[ Line: 500 ]] --[[ Name: getForceTheme ]]
            -- upvalues: v4 (ref), v6 (ref), v59 (copy)
            local v65 = v4.List.map(v6, function(v64) --[[ Line: 501 ]]
                return v64:lower();
            end);
            if v59.ForceTheme and v4.List.find(v65, v59.ForceTheme:lower()) then
                return v59.ForceTheme;
            else
                return nil;
            end;
        end, 
        enableExperienceDetailsPanel = function() --[[ Line: 510 ]] --[[ Name: enableExperienceDetailsPanel ]]
            -- upvalues: v59 (copy)
            return v59.EnableExperienceDetailsPanel or false;
        end, 
        getDisableRegularLogin = function() --[[ Line: 513 ]] --[[ Name: getDisableRegularLogin ]]
            -- upvalues: v59 (copy)
            return not v59.EnableWebViewSupport and (not v59.EnableRegularLoginWithoutWebViewSupport or false);
        end, 
        getAllowPlatformAccountSwitching = function() --[[ Line: 516 ]] --[[ Name: getAllowPlatformAccountSwitching ]]
            -- upvalues: v59 (copy)
            return v59.AllowPlatformAccountSwitching or false;
        end, 
        useLegacyCrossPlayApi = function() --[[ Line: 519 ]] --[[ Name: useLegacyCrossPlayApi ]]
            -- upvalues: v42 (ref), v59 (copy)
            return v42 or v59.useLegacyCrossPlayApi or false;
        end, 
        useCrossPlaySystemUi = function() --[[ Line: 522 ]] --[[ Name: useCrossPlaySystemUi ]]
            -- upvalues: v45 (ref), v59 (copy)
            return v45 or v59.useCrossPlaySystemUi or false;
        end, 
        getCrossPlayUri = function() --[[ Line: 525 ]] --[[ Name: getCrossPlayUri ]]
            -- upvalues: v46 (ref), v59 (copy)
            if v46 ~= "" then
                return v46;
            else
                return v59.crossPlayUri or "";
            end;
        end, 
        getCrossPlayCapabilities = function() --[[ Line: 532 ]] --[[ Name: getCrossPlayCapabilities ]]
            -- upvalues: v4 (ref), v59 (copy), v7 (ref)
            return v4.List.foldLeft(v59.crossPlayCapabilities or {}, function(v66, v67) --[[ Line: 533 ]]
                -- upvalues: v4 (ref), v7 (ref)
                if v4.List.find(v66, v67) then
                    return v66;
                else
                    return v4.List.join(v66, {
                        v7[v67]
                    });
                end;
            end, {});
        end, 
        getCrossPlaySettingsKey = function() --[[ Line: 543 ]] --[[ Name: getCrossPlaySettingsKey ]]
            -- upvalues: v43 (ref), v59 (copy)
            if v43 ~= "" then
                return v43;
            else
                return v59.crossPlaySettingsKey or "";
            end;
        end, 
        getCrossPlayQueryParam = function() --[[ Line: 550 ]] --[[ Name: getCrossPlayQueryParam ]]
            -- upvalues: v44 (ref), v59 (copy)
            if v44 ~= "" then
                return v44;
            else
                return v59.crossPlayQueryParam or "";
            end;
        end, 
        getPromotionalEmailsCheckboxEnabled = function() --[[ Line: 557 ]] --[[ Name: getPromotionalEmailsCheckboxEnabled ]]
            -- upvalues: v59 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v59.PromotionalEmailsCheckboxEnabled or false;
            else
                return false;
            end;
        end, 
        getPromotionalEmailsOptInByDefault = function() --[[ Line: 564 ]] --[[ Name: getPromotionalEmailsOptInByDefault ]]
            -- upvalues: v59 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v59.PromotionalEmailsOptInByDefault or false;
            else
                return false;
            end;
        end, 
        getSupportsOverscan = function() --[[ Line: 571 ]] --[[ Name: getSupportsOverscan ]]
            -- upvalues: v59 (copy)
            return v59.SupportsOverscan or false;
        end, 
        getPlatformDisplayName = function() --[[ Line: 574 ]] --[[ Name: getPlatformDisplayName ]]
            -- upvalues: v59 (copy)
            return v59.platformDisplayName or "";
        end, 
        getPlatformAccountName = function() --[[ Line: 577 ]] --[[ Name: getPlatformAccountName ]]
            -- upvalues: v59 (copy)
            return v59.platformAccountName or nil;
        end, 
        getSupportsProfileSwitching = function() --[[ Line: 580 ]] --[[ Name: getSupportsProfileSwitching ]]
            -- upvalues: v59 (copy)
            return v59.supportsProfileSwitching or false;
        end, 
        getMountAllOmniFeedItems = function() --[[ Line: 583 ]] --[[ Name: getMountAllOmniFeedItems ]]
            -- upvalues: v59 (copy)
            return v59.mountAllOmniFeedItems or false;
        end, 
        getFriendCodeQrCodeScannerEnabled = function() --[[ Line: 586 ]] --[[ Name: getFriendCodeQrCodeScannerEnabled ]]
            -- upvalues: v59 (copy)
            return v59.FriendCodeQrCodeScannerEnabled or false;
        end, 
        getInviteFriendsDisabled = function() --[[ Line: 589 ]] --[[ Name: getInviteFriendsDisabled ]]
            -- upvalues: v59 (copy)
            return v59.InviteFriendsDisabled or false;
        end, 
        getRealNamesInDisplayNamesEnabled = function() --[[ Line: 592 ]] --[[ Name: getRealNamesInDisplayNamesEnabled ]]
            -- upvalues: v59 (copy)
            return v59.RealNamesInDisplayNamesEnabled or false;
        end, 
        getProfileShareLinkEnabled = function() --[[ Line: 595 ]] --[[ Name: getProfileShareLinkEnabled ]]
            -- upvalues: v59 (copy)
            return v59.ProfileShareLinkEnabled;
        end, 
        getProfileCopyLinkEnabled = function() --[[ Line: 598 ]] --[[ Name: getProfileCopyLinkEnabled ]]
            -- upvalues: v59 (copy)
            return v59.ProfileCopyLinkEnabled;
        end, 
        getEnablePremiumUserFeatures = function() --[[ Line: 601 ]] --[[ Name: getEnablePremiumUserFeatures ]]
            -- upvalues: l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (ref), v59 (copy)
            if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
                return v59.EnablePremiumUserFeatures or false;
            else
                return nil;
            end;
        end, 
        getEnableDualLogin = function() --[[ Line: 607 ]] --[[ Name: getEnableDualLogin ]]
            -- upvalues: v59 (copy)
            return v59.enableDualLogin or false;
        end, 
        getUseExternalBrowserForAgeGuidelines = function() --[[ Line: 611 ]] --[[ Name: getUseExternalBrowserForAgeGuidelines ]]
            -- upvalues: l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (ref), v59 (copy)
            if l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then
                return v59.UseExternalBrowserForAgeGuidelines or false;
            else
                return nil;
            end;
        end, 
        getEnableHomePageAgeBlock = function() --[[ Line: 618 ]] --[[ Name: getEnableHomePageAgeBlock ]]
            -- upvalues: v59 (copy)
            return v59.EnableHomePageAgeBlock or false;
        end, 
        getEnableUAppAccessBlock = function() --[[ Line: 621 ]] --[[ Name: getEnableUAppAccessBlock ]]
            -- upvalues: v59 (copy)
            return v59.EnableUAppAccessBlock or false;
        end, 
        getUAppBlockPageTextMapKey = function() --[[ Line: 624 ]] --[[ Name: getUAppBlockPageTextMapKey ]]
            -- upvalues: v59 (copy)
            return v59.UAppBlockPageTextMapKey or nil;
        end, 
        getUAppBlockPageShouldDisableLogOut = function() --[[ Line: 627 ]] --[[ Name: getUAppBlockPageShouldDisableLogOut ]]
            -- upvalues: v59 (copy)
            return v59.UAppBlockPageShouldDisableLogOut or nil;
        end, 
        getContactsToastEnabled = function() --[[ Line: 630 ]] --[[ Name: getContactsToastEnabled ]]
            -- upvalues: v59 (copy)
            return v59.ContactsToastEnabled or false;
        end, 
        getEnableProfileQrCode = function() --[[ Line: 633 ]] --[[ Name: getEnableProfileQrCode ]]
            -- upvalues: v59 (copy)
            return v59.EnableProfileQrCode or false;
        end, 
        getCanRenderTransferOnProfile = function() --[[ Line: 636 ]] --[[ Name: getCanRenderTransferOnProfile ]]
            -- upvalues: l_FFlagGuacCanRenderTransferOnProfile_0 (ref), v59 (copy)
            if l_FFlagGuacCanRenderTransferOnProfile_0 then
                return v59.CanRenderTransferOnProfile or false;
            else
                return false;
            end;
        end, 
        getShowVNGLoginWithExistingAccountQuickLoginButton = function() --[[ Line: 642 ]] --[[ Name: getShowVNGLoginWithExistingAccountQuickLoginButton ]]
            -- upvalues: v59 (copy)
            return v59.ShowVNGLoginWithExistingAccountQuickLoginButton or false;
        end, 
        getShowVNGAge12Badge = function() --[[ Line: 645 ]] --[[ Name: getShowVNGAge12Badge ]]
            -- upvalues: v59 (copy)
            return v59.ShowVNGAge12Badge or false;
        end, 
        getShowBrazilContentRatingLogo = function() --[[ Line: 648 ]] --[[ Name: getShowBrazilContentRatingLogo ]]
            -- upvalues: v59 (copy)
            return v59.ShowBrazilContentRatingLogo or false;
        end, 
        getUseVNGUserAgreementPopup = function() --[[ Line: 651 ]] --[[ Name: getUseVNGUserAgreementPopup ]]
            -- upvalues: v59 (copy)
            return v59.UseVNGUserAgreementPopup or false;
        end, 
        getRedirectBuyRobuxToVNG = function() --[[ Line: 654 ]] --[[ Name: getRedirectBuyRobuxToVNG ]]
            -- upvalues: v59 (copy)
            return v59.RedirectBuyRobuxToVNG or false;
        end, 
        getShowVNGTosForRobuxUpsell = function() --[[ Line: 657 ]] --[[ Name: getShowVNGTosForRobuxUpsell ]]
            -- upvalues: v59 (copy)
            return v59.ShowVNGTosForRobuxUpsell or false;
        end, 
        getBlockVNGU12SignUpOnClientSide = function() --[[ Line: 660 ]] --[[ Name: getBlockVNGU12SignUpOnClientSide ]]
            -- upvalues: v59 (copy)
            return v59.BlockVNGU12SignUpOnClientSide or false;
        end, 
        getUseAgeInput = function() --[[ Line: 663 ]] --[[ Name: getUseAgeInput ]]
            -- upvalues: v59 (copy)
            return v59.UseAgeInput or false;
        end, 
        getLoginUsernameOnly = function() --[[ Line: 666 ]] --[[ Name: getLoginUsernameOnly ]]
            -- upvalues: v59 (copy)
            return v59.LoginUsernameOnly or false;
        end, 
        getDisableEmailOTPLogin = function() --[[ Line: 669 ]] --[[ Name: getDisableEmailOTPLogin ]]
            -- upvalues: v59 (copy)
            return v59.DisableEmailOTPLogin or false;
        end, 
        getDisableLoginForgotButton = function() --[[ Line: 672 ]] --[[ Name: getDisableLoginForgotButton ]]
            -- upvalues: v59 (copy)
            return v59.DisableLoginForgotButton or false;
        end, 
        getDisableLogOutEmailUpsell = function() --[[ Line: 675 ]] --[[ Name: getDisableLogOutEmailUpsell ]]
            -- upvalues: v59 (copy)
            return v59.DisableLogOutEmailUpsell or false;
        end, 
        getVerifiedSignupCountry = function() --[[ Line: 678 ]] --[[ Name: getVerifiedSignupCountry ]]
            -- upvalues: v59 (copy)
            return v59.verifiedSignupCountry or false;
        end, 
        getParentalConsentAgreementId = function() --[[ Line: 682 ]] --[[ Name: getParentalConsentAgreementId ]]
            -- upvalues: v59 (copy)
            return v59.parentalConsentAgreementId or "";
        end, 
        getIsStrictComplianceEnabled = function() --[[ Line: 686 ]] --[[ Name: getIsStrictComplianceEnabled ]]
            -- upvalues: v59 (copy)
            return v59.isStrictComplianceEnabled or false;
        end, 
        getUseKoreaKISAUserAgreementPopup = function() --[[ Line: 690 ]] --[[ Name: getUseKoreaKISAUserAgreementPopup ]]
            -- upvalues: v59 (copy)
            return v59.useKoreaKISAUserAgreementPopup or false;
        end, 
        getEnableNotificationPreferencesPage = function() --[[ Line: 694 ]] --[[ Name: getEnableNotificationPreferencesPage ]]
            -- upvalues: l_GetFFlagEnableGateNotificationPreferencesTab_0 (ref), v59 (copy)
            if l_GetFFlagEnableGateNotificationPreferencesTab_0() then
                return v59.EnableNotificationPreferencesPage or false;
            else
                return nil;
            end;
        end, 
        getVNGFormRequired = function() --[[ Line: 701 ]] --[[ Name: getVNGFormRequired ]]
            -- upvalues: v59 (copy)
            return v59.VNGFormRequired or false;
        end, 
        getUpsellVoiceForPhoneVerification = function() --[[ Line: 704 ]] --[[ Name: getUpsellVoiceForPhoneVerification ]]
            -- upvalues: v59 (copy)
            return v59.UpsellVoiceForPhoneVerification or false;
        end, 
        getIsLinkedVRModeAvailable = function() --[[ Line: 707 ]] --[[ Name: getIsLinkedVRModeAvailable ]]
            -- upvalues: l_UserInputService_0 (ref)
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v69 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
                v69 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
            end;
            return v69;
        end, 
        getShouldShowPhoneUpsell = function() --[[ Line: 711 ]] --[[ Name: getShouldShowPhoneUpsell ]]
            -- upvalues: v59 (copy)
            return v59.ShouldShowPhoneUpsell or false;
        end, 
        getTermsOfUseLink = function() --[[ Line: 714 ]] --[[ Name: getTermsOfUseLink ]]
            -- upvalues: v59 (copy)
            return v59.TermsOfUseLink or "";
        end, 
        getPrivacyPolicyLink = function() --[[ Line: 717 ]] --[[ Name: getPrivacyPolicyLink ]]
            -- upvalues: v59 (copy)
            return v59.PrivacyPolicyLink or "";
        end, 
        getVngAppUpsell = function() --[[ Line: 720 ]] --[[ Name: getVngAppUpsell ]]
            -- upvalues: l_FFlagLuaAppHomeVngAppUpsell_0 (ref), v59 (copy)
            if l_FFlagLuaAppHomeVngAppUpsell_0 then
                return v59.VngAppUpsell or false;
            else
                return false;
            end;
        end, 
        getShouldHideContactImporterUpsell = function() --[[ Line: 727 ]] --[[ Name: getShouldHideContactImporterUpsell ]]
            -- upvalues: v59 (copy)
            return v59.ShouldHideContactImporterUpsell or false;
        end, 
        getContactImporterEncouraged = function() --[[ Line: 730 ]] --[[ Name: getContactImporterEncouraged ]]
            -- upvalues: v59 (copy)
            return v59.contactImporterEncouraged or false;
        end, 
        getFriendRequestNicknamesEnabled = function() --[[ Line: 733 ]] --[[ Name: getFriendRequestNicknamesEnabled ]]
            -- upvalues: l_FFlagFriendRequestNicknames_0 (ref), v59 (copy)
            if l_FFlagFriendRequestNicknames_0 then
                return v59.FriendRequestNicknamesEnabled or false;
            else
                return false;
            end;
        end, 
        getShouldShowVpcPlayButtonUpsells = l_FFlagLuaAppParentUpsellPolicy_0 and function() --[[ Line: 741 ]]
            -- upvalues: v59 (copy)
            return v59.shouldShowVpcPlayButtonUpsells or false;
        end or nil, 
        getRenamePaymentsToSpendingTab = function() --[[ Line: 745 ]] --[[ Name: getRenamePaymentsToSpendingTab ]]
            -- upvalues: v59 (copy)
            return v59.renamePaymentsToSpendingTab or false;
        end, 
        getNotificationsCanReceiveStream = function() --[[ Line: 750 ]] --[[ Name: getNotificationsCanReceiveStream ]]
            -- upvalues: l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (ref), v59 (copy)
            if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
                return v59.notificationsCanAccessStream or false;
            else
                return nil;
            end;
        end, 
        getNotificationsCanReceivePush = function() --[[ Line: 757 ]] --[[ Name: getNotificationsCanReceivePush ]]
            -- upvalues: v59 (copy)
            return v59.notificationsCanAccessPush or false;
        end, 
        getPushNotificationsUpsell = function() --[[ Line: 760 ]] --[[ Name: getPushNotificationsUpsell ]]
            -- upvalues: v59 (copy)
            return v59.ShouldShowPushNotificationsUpsell or false;
        end, 
        getNotificationsCanReceiveExperience = function() --[[ Line: 763 ]] --[[ Name: getNotificationsCanReceiveExperience ]]
            -- upvalues: v59 (copy)
            if v59.notificationsCanAccessExperience == nil then
                return true;
            else
                return v59.notificationsCanAccessExperience;
            end;
        end, 
        getDisableResellingCollectiblesForCompliance = function() --[[ Line: 769 ]] --[[ Name: getDisableResellingCollectiblesForCompliance ]]
            -- upvalues: v59 (copy)
            return v59.DisableResellingCollectiblesForCompliance or false;
        end, 
        getShowIllegalContentReportingUI = function() --[[ Line: 772 ]] --[[ Name: getShowIllegalContentReportingUI ]]
            -- upvalues: v59 (copy)
            return v59.ShowIllegalContentReportingUI or false;
        end, 
        getEligibleForContentPostFeed = function() --[[ Line: 775 ]] --[[ Name: getEligibleForContentPostFeed ]]
            -- upvalues: v59 (copy)
            return v59.EligibleForContentPostFeed or false;
        end, 
        getEligibleForExternalContentSharing = function() --[[ Line: 778 ]] --[[ Name: getEligibleForExternalContentSharing ]]
            -- upvalues: v59 (copy)
            return v59.EligibleForExternalContentSharing or false;
        end, 
        getEnableContinuousLoad = function() --[[ Line: 781 ]] --[[ Name: getEnableContinuousLoad ]]
            -- upvalues: v59 (copy)
            return v59.EnableContinuousLoad or false;
        end, 
        getEnableAggregateLikesFavoritesCount = function() --[[ Line: 784 ]] --[[ Name: getEnableAggregateLikesFavoritesCount ]]
            -- upvalues: v59 (copy)
            return v59.EnableAggregateLikesFavoritesCount or false;
        end, 
        getShowUpdatedCameraPath = function() --[[ Line: 787 ]] --[[ Name: getShowUpdatedCameraPath ]]
            -- upvalues: v59 (copy)
            return v59.showUpdatedCameraPath or false;
        end, 
        getRenameParentEmailForVerificationUpsell = function() --[[ Line: 790 ]] --[[ Name: getRenameParentEmailForVerificationUpsell ]]
            -- upvalues: l_FFlagRenameParentEmailForVerificationUpsell_0 (ref), v59 (copy)
            if l_FFlagRenameParentEmailForVerificationUpsell_0() then
                return v59.renameParentEmailForVerificationUpsell or false;
            else
                return false;
            end;
        end, 
        getKeystrokeCollectionEnabled = function() --[[ Line: 797 ]] --[[ Name: getKeystrokeCollectionEnabled ]]
            -- upvalues: v59 (copy)
            if game:GetFastFlag("BehaviorCollectionControlEnabled") then
                return v59.EnableKeystrokeCollection or false;
            else
                return false;
            end;
        end, 
        getCanUsePlatformChat = function() --[[ Line: 805 ]] --[[ Name: getCanUsePlatformChat ]]
            -- upvalues: v59 (copy)
            return v59.CanUsePlatformChat or false;
        end, 
        getCanSeeChatTab = function() --[[ Line: 809 ]] --[[ Name: getCanSeeChatTab ]]
            -- upvalues: v59 (copy)
            return v59.CanSeeChatTab or false;
        end, 
        getHidesGamesTab = function() --[[ Line: 814 ]] --[[ Name: getHidesGamesTab ]]
            -- upvalues: l_FFlagEnableAndroidTvAppPolicies_0 (ref), v59 (copy)
            if l_FFlagEnableAndroidTvAppPolicies_0 then
                return v59.HidesGamesTab or false;
            else
                return false;
            end;
        end, 
        getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 822 ]] --[[ Name: getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (ref), v59 (copy)
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return true;
            elseif v59.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil then
                return true;
            else
                return v59.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup;
            end;
        end, 
        getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 831 ]] --[[ Name: getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (ref), l_GetFFlagEnableMultiPageSignup_0 (ref), v59 (copy)
            local v70 = l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0();
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return v70;
            elseif v59.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then
                return v70;
            else
                return v59.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages;
            end;
        end, 
        getRobuxUpsellFlowMobile = function() --[[ Line: 841 ]] --[[ Name: getRobuxUpsellFlowMobile ]]
            -- upvalues: v59 (copy)
            return v59.useMobileRobuxUpsellFlow or false;
        end, 
        getUsePaymentPlatformMicrosoftStore = function() --[[ Line: 844 ]] --[[ Name: getUsePaymentPlatformMicrosoftStore ]]
            -- upvalues: l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (ref), v59 (copy)
            if l_FFlagEnableMicrosoftStorePaymentsPlatform_0 then
                return v59.usePaymentPlatformMicrosoftStore or false;
            else
                return false;
            end;
        end, 
        getMicSettingsDirectionsLocaleKey = function() --[[ Line: 851 ]] --[[ Name: getMicSettingsDirectionsLocaleKey ]]
            -- upvalues: l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (ref), v59 (copy)
            if l_FFlagPartyVoiceEnableMicPermissionsBanner_0 then
                return v59.micSettingsDirectionsLocaleKey or nil;
            else
                return nil;
            end;
        end, 
        getMicSettingsDeeplinkDirectionsLocaleKey = function() --[[ Line: 857 ]] --[[ Name: getMicSettingsDeeplinkDirectionsLocaleKey ]]
            -- upvalues: l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (ref), v59 (copy)
            if l_FFlagPartyVoiceEnableMicPermissionsBanner_0 then
                return v59.micSettingsDeeplinkDirectionsLocaleKey or nil;
            else
                return nil;
            end;
        end, 
        getRequiresAppRestartOnMicAccessChange = function() --[[ Line: 863 ]] --[[ Name: getRequiresAppRestartOnMicAccessChange ]]
            -- upvalues: l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (ref), v59 (copy)
            if l_FFlagPartyVoiceEnableMicPermissionsBanner_0 then
                return v59.requiresAppRestartOnMicAccessChange or false;
            else
                return false;
            end;
        end, 
        getRenameFriendsToConnections = function() --[[ Line: 869 ]] --[[ Name: getRenameFriendsToConnections ]]
            -- upvalues: l_FFlagEnableFriendsRenamingForAll_0 (ref), v59 (copy)
            if l_FFlagEnableFriendsRenamingForAll_0 then
                return true;
            else
                return v59.renameFriendsToConnections or false;
            end;
        end, 
        getShareSheetEnabled = function() --[[ Line: 875 ]] --[[ Name: getShareSheetEnabled ]]
            -- upvalues: l_FFlagTCShareLinkSenderUI_0 (ref), v59 (copy)
            if l_FFlagTCShareLinkSenderUI_0 then
                return v59.shareSheetEnabled or false;
            else
                return nil;
            end;
        end, 
        getCanAccessTrustedContacts = function() --[[ Line: 882 ]] --[[ Name: getCanAccessTrustedContacts ]]
            -- upvalues: v59 (copy)
            return v59.canAccessTrustedContacts or false;
        end, 
        getExperienceDetailsNoticeType = function() --[[ Line: 885 ]] --[[ Name: getExperienceDetailsNoticeType ]]
            -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (ref), v59 (copy)
            if l_FFlagLuaAppShowNoticeOnEdp_0 then
                return v59.experienceDetailsNoticeType or nil;
            else
                return nil;
            end;
        end, 
        getRequiresOSAFriendingEducation = function() --[[ Line: 891 ]] --[[ Name: getRequiresOSAFriendingEducation ]]
            -- upvalues: v59 (copy)
            return v59.requiresOSAFriendingEducation or false;
        end, 
        getSocialGraphSyncEnabled = function() --[[ Line: 894 ]] --[[ Name: getSocialGraphSyncEnabled ]]
            -- upvalues: v59 (copy)
            return v59.SocialGraphSyncEnabled or false;
        end, 
        getAccountDisambiguationDisabled = function() --[[ Line: 897 ]] --[[ Name: getAccountDisambiguationDisabled ]]
            -- upvalues: v59 (copy)
            return v59.AccountDisambiguationDisabled or false;
        end, 
        getHasWebViewSupportForFAE = function() --[[ Line: 900 ]] --[[ Name: getHasWebViewSupportForFAE ]]
            -- upvalues: v59 (copy)
            return v59.hasWebViewSupportForFAE or false;
        end, 
        getLinkedAuthEndpointsEnabled = function() --[[ Line: 903 ]] --[[ Name: getLinkedAuthEndpointsEnabled ]]
            -- upvalues: v59 (copy)
            return v59.LinkedAuthEndpointsEnabled or false;
        end, 
        getLinkingPlatform = function() --[[ Line: 906 ]] --[[ Name: getLinkingPlatform ]]
            -- upvalues: v59 (copy)
            return v59.LinkingPlatform or nil;
        end, 
        getUsePaymentPlatformMilkyWayStore = function() --[[ Line: 909 ]] --[[ Name: getUsePaymentPlatformMilkyWayStore ]]
            -- upvalues: l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (ref), v59 (copy)
            if l_FFlagEnableMilkyWayPaymentsPlatformV2_0 then
                return v59.usePaymentPlatformMilkyWayStore or false;
            else
                return false;
            end;
        end, 
        getScreentimeMoreTimeOptionEnabled = function() --[[ Line: 915 ]] --[[ Name: getScreentimeMoreTimeOptionEnabled ]]
            -- upvalues: l_FFlagEnableScreentimeMoreTimeOption_0 (ref), v59 (copy)
            if l_FFlagEnableScreentimeMoreTimeOption_0 then
                return v59.ScreentimeMoreTimeOptionEnabled or false;
            else
                return false;
            end;
        end, 
        getDisablePremiumEntrypoint = function() --[[ Line: 921 ]] --[[ Name: getDisablePremiumEntrypoint ]]
            -- upvalues: v48 (ref), v59 (copy)
            if v48 then
                return v59.DisablePremiumEntrypoint or v59.DisablePremiumEntryPoint or false;
            else
                return false;
            end;
        end, 
        getDisableBlackbirdEntrypoints = function() --[[ Line: 927 ]] --[[ Name: getDisableBlackbirdEntrypoints ]]
            -- upvalues: v49 (ref), v59 (copy)
            if v49 then
                return v59.DisableBlackbirdEntrypoints or false;
            else
                return false;
            end;
        end, 
        getEnableGiftcardsWithRedeem = function() --[[ Line: 933 ]] --[[ Name: getEnableGiftcardsWithRedeem ]]
            -- upvalues: v50 (ref), v59 (copy)
            if v50 then
                return v59.EnableGiftcardsWithRedeem or false;
            else
                return false;
            end;
        end, 
        getGiftCardSourceRefOverride = function() --[[ Line: 939 ]] --[[ Name: getGiftCardSourceRefOverride ]]
            -- upvalues: v59 (copy)
            return v59.GiftCardSourceRefOverride or "";
        end, 
        getSignupCheckboxDisabled = function() --[[ Line: 942 ]] --[[ Name: getSignupCheckboxDisabled ]]
            -- upvalues: v47 (ref), v59 (copy)
            if v47 then
                return v59.DisableSignupCheckbox or false;
            else
                return false;
            end;
        end, 
        getExcludeCrossDeviceSignIn = function() --[[ Line: 949 ]] --[[ Name: getExcludeCrossDeviceSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeCrossDeviceSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePasskeyLogin = function() --[[ Line: 955 ]] --[[ Name: getExcludePasskeyLogin ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludePasskeyLogin or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernamePasswordSignIn = function() --[[ Line: 962 ]] --[[ Name: getExcludeUsernamePasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeUsernamePasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeEmailPasswordSignIn = function() --[[ Line: 968 ]] --[[ Name: getExcludeEmailPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeEmailPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePhoneNumberPasswordSignIn = function() --[[ Line: 974 ]] --[[ Name: getExcludePhoneNumberPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludePhoneNumberPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeAccountSwitcher = function() --[[ Line: 980 ]] --[[ Name: getExcludeAccountSwitcher ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeAccountSwitcher or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernameUpdateModeration = function() --[[ Line: 986 ]] --[[ Name: getExcludeUsernameUpdateModeration ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeUsernameUpdateModeration or false;
            else
                return false;
            end;
        end, 
        getMorePageExitButtonEnabled = l_FFlagEnableMorePageExitButtonSupport_0 and function() --[[ Line: 993 ]]
            -- upvalues: v59 (copy)
            return v59.MorePageExitButtonEnabled or false;
        end or nil, 
        getMoreGridDirectionalLayoutPreferred = l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 and function() --[[ Line: 998 ]]
            -- upvalues: v59 (copy)
            return v59.MoreGridDirectionalLayoutPreferred or false;
        end or nil, 
        getShouldUseDMCCALegalDisclosureInApp = function() --[[ Line: 1002 ]] --[[ Name: getShouldUseDMCCALegalDisclosureInApp ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v59 (copy)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                return v59.ShouldUseDMCCALegalDisclosureInApp or false;
            else
                return false;
            end;
        end, 
        getCanAccessParty = function() --[[ Line: 1008 ]] --[[ Name: getCanAccessParty ]]
            -- upvalues: v59 (copy)
            if v59.CanAccessParty == nil then
                return true;
            else
                return v59.CanAccessParty;
            end;
        end, 
        getRedeemTileEnabled = function() --[[ Line: 1014 ]] --[[ Name: getRedeemTileEnabled ]]
            -- upvalues: v59 (copy)
            return v59.RedeemTileEnabled or false;
        end, 
        getShouldUseVibrationInsteadOfHaptics = function() --[[ Line: 1017 ]] --[[ Name: getShouldUseVibrationInsteadOfHaptics ]]
            -- upvalues: v59 (copy)
            return v59.ShouldUseVibrationInsteadOfHaptics or false;
        end, 
        getRawPolicy = l_FFlagSduiAppPolicyBindings_0 and function() --[[ Line: 1021 ]]
            -- upvalues: v59 (copy)
            return v59;
        end or nil, 
        getStickyShortcutBarEnabled = l_FFlagGuacStickyShortcutBarEnabled_0 and function() --[[ Line: 1026 ]]
            -- upvalues: v59 (copy)
            return v59.StickyShortcutBarEnabled or false;
        end or nil
    };
end;