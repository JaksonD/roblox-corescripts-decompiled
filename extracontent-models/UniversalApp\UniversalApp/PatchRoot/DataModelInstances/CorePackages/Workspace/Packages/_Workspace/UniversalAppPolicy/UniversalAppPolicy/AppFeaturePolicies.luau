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
game:DefineFastFlag("BehaviorCollectionControlEnabled", false);
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false);
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v8.GetFFlagNotificationsComplianceShouldRestrictStream;
return function(v57) --[[ Line: 73 ]] --[[ Name: AppFeaturePolicies ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v40 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_FFlagAppIaScrollAwayGuac_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GuiService_0 (copy), l_isRunningInStudio_0 (copy), v41 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), l_GetFFlagUseVoiceExitBetaLanguage_0 (copy), l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (copy), l_GetFFlagExpChatGuacChatDisabledReason_0 (copy), l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (copy), l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (copy), l_FFlagExpChatUseGuacForFOMOUpsell_0 (copy), l_FFlagExpChatUseGuacForCrossAgeChat_0 (copy), l_GetFFlagDisableCDLQrCodeForMaquettes_0 (copy), v4 (copy), v6 (copy), v42 (copy), v45 (copy), v46 (copy), v7 (copy), v43 (copy), v44 (copy), l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (copy), l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (copy), l_FFlagGuacCanRenderTransferOnProfile_0 (copy), l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy), l_UserInputService_0 (copy), l_FFlagLuaAppHomeVngAppUpsell_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), l_FFlagRenameParentEmailForVerificationUpsell_0 (copy), l_FFlagEnableAndroidTvAppPolicies_0 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (copy), l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (copy), l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (copy), l_FFlagEnableFriendsRenamingForAll_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (copy), l_FFlagEnableScreentimeMoreTimeOption_0 (copy), v48 (copy), v49 (copy), v50 (copy), v47 (copy), l_FFlagAuthSecExclusions_0 (copy), l_FFlagEnableMorePageExitButtonSupport_0 (copy), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy)
    local function _(v58, v59) --[[ Line: 74 ]] --[[ Name: getVRDefaultPolicy ]]
        -- upvalues: v57 (copy), l_IsVRAppBuild_0 (ref)
        if v57[v58] ~= nil then
            return v57[v58];
        elseif l_IsVRAppBuild_0() then
            return v59;
        else
            return not v59;
        end;
    end;
    return {
        getFriendFinder = function() --[[ Line: 85 ]] --[[ Name: getFriendFinder ]]
            -- upvalues: v57 (copy)
            return v57.FriendFinder or false;
        end, 
        getGameDetailsMorePage = function() --[[ Line: 88 ]] --[[ Name: getGameDetailsMorePage ]]
            -- upvalues: v57 (copy)
            return v57.GameDetailsMorePage or false;
        end, 
        getGameDetailsSubtitle = function() --[[ Line: 91 ]] --[[ Name: getGameDetailsSubtitle ]]
            -- upvalues: v57 (copy)
            return v57.GameDetailsSubtitle or false;
        end, 
        getShowGlobalCounters = function() --[[ Line: 94 ]] --[[ Name: getShowGlobalCounters ]]
            -- upvalues: v57 (copy)
            return v57.GameDetailsShowGlobalCounters or false;
        end, 
        getGameDetailsPlayWithFriends = function() --[[ Line: 97 ]] --[[ Name: getGameDetailsPlayWithFriends ]]
            -- upvalues: v57 (copy)
            return v57.GameDetailsPlayWithFriends or false;
        end, 
        getGameInfoList = function() --[[ Line: 100 ]] --[[ Name: getGameInfoList ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoList or false;
        end, 
        getGamePlaysAndRatings = function() --[[ Line: 103 ]] --[[ Name: getGamePlaysAndRatings ]]
            -- upvalues: v57 (copy)
            return v57.GamePlaysAndRatings or false;
        end, 
        getNotifications = function() --[[ Line: 106 ]] --[[ Name: getNotifications ]]
            -- upvalues: v57 (copy)
            return v57.Notifications or false;
        end, 
        getRecommendedGames = function() --[[ Line: 109 ]] --[[ Name: getRecommendedGames ]]
            -- upvalues: v40 (ref), v57 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v40 then
                return v57.RecommendedGames or false;
            elseif l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v57.RecommendedGames or false;
            end;
        end, 
        getSearchBar = function() --[[ Line: 119 ]] --[[ Name: getSearchBar ]]
            -- upvalues: v57 (copy)
            return v57.SearchBar or false;
        end, 
        getMorePageContent = function() --[[ Line: 122 ]] --[[ Name: getMorePageContent ]]
            -- upvalues: v57 (copy)
            return v57.MorePageContent;
        end, 
        getAboutPageType = function() --[[ Line: 125 ]] --[[ Name: getAboutPageType ]]
            -- upvalues: v57 (copy)
            return v57.AboutPageType or "CJVAbout";
        end, 
        getSettingsPageType = function() --[[ Line: 128 ]] --[[ Name: getSettingsPageType ]]
            -- upvalues: v57 (copy)
            return v57.SettingsPageType or "Settings";
        end, 
        getSocialLinks = function() --[[ Line: 131 ]] --[[ Name: getSocialLinks ]]
            -- upvalues: v57 (copy)
            return v57.SocialLinks or false;
        end, 
        getSocialGroupLinks = function() --[[ Line: 134 ]] --[[ Name: getSocialGroupLinks ]]
            -- upvalues: v57 (copy)
            return v57.SocialGroupLinks or false;
        end, 
        getCommunityLinksEnabled = function() --[[ Line: 137 ]] --[[ Name: getCommunityLinksEnabled ]]
            -- upvalues: v57 (copy)
            return v57.CommunityLinksEnabled or false;
        end, 
        getGameInfoShowBadges = function() --[[ Line: 140 ]] --[[ Name: getGameInfoShowBadges ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoShowBadges or false;
        end, 
        getGameInfoShowCreated = function() --[[ Line: 143 ]] --[[ Name: getGameInfoShowCreated ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoShowCreated or false;
        end, 
        getGameInfoShowGamepasses = function() --[[ Line: 146 ]] --[[ Name: getGameInfoShowGamepasses ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoShowGamepasses or false;
        end, 
        getGameInfoShowGenre = function() --[[ Line: 149 ]] --[[ Name: getGameInfoShowGenre ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoShowGenre or false;
        end, 
        getGameInfoShowSubgenre = function() --[[ Line: 152 ]] --[[ Name: getGameInfoShowSubgenre ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoShowSubgenre or false;
        end, 
        getGameInfoShowMaxPlayers = function() --[[ Line: 155 ]] --[[ Name: getGameInfoShowMaxPlayers ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoShowMaxPlayers or false;
        end, 
        getGameInfoShowServers = function() --[[ Line: 158 ]] --[[ Name: getGameInfoShowServers ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoShowServers or false;
        end, 
        getGameInfoShowUpdated = function() --[[ Line: 161 ]] --[[ Name: getGameInfoShowUpdated ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoShowUpdated or false;
        end, 
        getGameInfoShowAgeRecommendation = function() --[[ Line: 164 ]] --[[ Name: getGameInfoShowAgeRecommendation ]]
            -- upvalues: v57 (copy)
            if v57.GameInfoShowAgeRecommendation == nil then
                return true;
            else
                return v57.GameInfoShowAgeRecommendation;
            end;
        end, 
        getGameInfoShowVoiceAndChatFeatures = function() --[[ Line: 170 ]] --[[ Name: getGameInfoShowVoiceAndChatFeatures ]]
            -- upvalues: v57 (copy)
            if v57.GameInfoShowVoiceAndChatFeatures == nil then
                return true;
            else
                return v57.GameInfoShowVoiceAndChatFeatures;
            end;
        end, 
        getSiteMessageBanner = function() --[[ Line: 176 ]] --[[ Name: getSiteMessageBanner ]]
            -- upvalues: v57 (copy)
            return v57.SiteMessageBanner or false;
        end, 
        getAlertRateLimit = function() --[[ Line: 179 ]] --[[ Name: getAlertRateLimit ]]
            -- upvalues: v57 (copy)
            return v57.AlertRateLimit or 300;
        end, 
        getSearchAutoComplete = function() --[[ Line: 183 ]] --[[ Name: getSearchAutoComplete ]]
            -- upvalues: v57 (copy)
            return v57.SearchAutoComplete or false;
        end, 
        getShowStudioCTA = function() --[[ Line: 186 ]] --[[ Name: getShowStudioCTA ]]
            -- upvalues: v57 (copy)
            return v57.ShowStudioCTA or false;
        end, 
        getAppIaScrollAwayEnabled = l_FFlagAppIaScrollAwayGuac_0 and function() --[[ Line: 190 ]]
            -- upvalues: v57 (copy)
            return v57.AppIaScrollAwayEnabled or false;
        end or nil, 
        getUseOmniRecommendation = function() --[[ Line: 194 ]] --[[ Name: getUseOmniRecommendation ]]
            -- upvalues: v57 (copy)
            if v57.UseOmniRecommendation == nil then
                return true;
            else
                return v57.UseOmniRecommendation;
            end;
        end, 
        getUseWidthBasedFormFactorRule = function() --[[ Line: 202 ]] --[[ Name: getUseWidthBasedFormFactorRule ]]
            -- upvalues: v57 (copy)
            return v57.UseWidthBasedFormFactorRule or false;
        end, 
        getShowYouTubeAgeAlert = function() --[[ Line: 205 ]] --[[ Name: getShowYouTubeAgeAlert ]]
            -- upvalues: v57 (copy)
            if v57.ShowYouTubeAgeAlert == nil then
                return true;
            else
                return v57.ShowYouTubeAgeAlert;
            end;
        end, 
        getShowVideoThumbnails = function() --[[ Line: 211 ]] --[[ Name: getShowVideoThumbnails ]]
            -- upvalues: v57 (copy)
            return v57.ShowVideoThumbnails or false;
        end, 
        getHomeIcon = function() --[[ Line: 214 ]] --[[ Name: getHomeIcon ]]
            -- upvalues: v57 (copy)
            return v57.HomeIcon or "LuaApp/icons/ic-roblox-close";
        end, 
        getGameInfoListShowRNVDeveloper = function() --[[ Line: 217 ]] --[[ Name: getGameInfoListShowRNVDeveloper ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoListShowRNVDeveloper or false;
        end, 
        getGameInfoListDeveloper = function() --[[ Line: 220 ]] --[[ Name: getGameInfoListDeveloper ]]
            -- upvalues: v57 (copy)
            return v57.GameInfoListDeveloper or false;
        end, 
        getShowDisplayName = function() --[[ Line: 223 ]] --[[ Name: getShowDisplayName ]]
            -- upvalues: v57 (copy)
            if v57.ShowDisplayName == nil then
                return true;
            else
                return v57.ShowDisplayName;
            end;
        end, 
        getShowAlias = function() --[[ Line: 229 ]] --[[ Name: getShowAlias ]]
            -- upvalues: v57 (copy)
            if v57.ShowUserAlias == nil then
                return true;
            else
                return v57.ShowUserAlias;
            end;
        end, 
        getCatalogReportingDisabled = function() --[[ Line: 235 ]] --[[ Name: getCatalogReportingDisabled ]]
            -- upvalues: v57 (copy)
            return v57.CatalogReportingDisabled or false;
        end, 
        getGameReportingDisabled = function() --[[ Line: 238 ]] --[[ Name: getGameReportingDisabled ]]
            -- upvalues: v57 (copy)
            return v57.GameReportingDisabled or false;
        end, 
        getGamesPageCreationCenterTitle = function() --[[ Line: 241 ]] --[[ Name: getGamesPageCreationCenterTitle ]]
            -- upvalues: v57 (copy)
            return v57.GamesPageCreationCenterTitle or false;
        end, 
        shouldUseExternalBrowserForDisclaimerLinks = function() --[[ Line: 244 ]] --[[ Name: shouldUseExternalBrowserForDisclaimerLinks ]]
            -- upvalues: v57 (copy)
            return v57.UseExternalBrowserForDisclaimerLinks or false;
        end, 
        shouldUseExternalBrowserForMorePageItem = function() --[[ Line: 247 ]] --[[ Name: shouldUseExternalBrowserForMorePageItem ]]
            -- upvalues: v57 (copy)
            return v57.UseExternalBrowserForMoreLinks or false;
        end, 
        getCatalogShow3dView = function() --[[ Line: 250 ]] --[[ Name: getCatalogShow3dView ]]
            -- upvalues: v57 (copy)
            return v57.CatalogShow3dView or false;
        end, 
        getItemDetailsFullView = function() --[[ Line: 253 ]] --[[ Name: getItemDetailsFullView ]]
            -- upvalues: v57 (copy)
            return v57.ItemDetailsFullView or false;
        end, 
        getCatalogCommunityCreations = function() --[[ Line: 256 ]] --[[ Name: getCatalogCommunityCreations ]]
            -- upvalues: v57 (copy)
            return v57.CatalogCommunityCreations or false;
        end, 
        getCatalogPremiumCategory = function() --[[ Line: 259 ]] --[[ Name: getCatalogPremiumCategory ]]
            -- upvalues: v57 (copy)
            return v57.CatalogPremiumCategory or false;
        end, 
        getShowCatalogPremiumContent = function() --[[ Line: 262 ]] --[[ Name: getShowCatalogPremiumContent ]]
            -- upvalues: v57 (copy)
            return v57.CatalogPremiumContent or false;
        end, 
        getRobloxCreatedItemsCreatedByLuobu = function() --[[ Line: 265 ]] --[[ Name: getRobloxCreatedItemsCreatedByLuobu ]]
            -- upvalues: v57 (copy)
            if v57.RobloxCreatedItemsCreatedByLuobu == nil then
                return true;
            else
                return v57.RobloxCreatedItemsCreatedByLuobu;
            end;
        end, 
        getHomePageFriendSection = function() --[[ Line: 271 ]] --[[ Name: getHomePageFriendSection ]]
            -- upvalues: v57 (copy)
            return v57.HomePageFriendSection or false;
        end, 
        getHomePageProfileLink = function() --[[ Line: 274 ]] --[[ Name: getHomePageProfileLink ]]
            -- upvalues: v57 (copy)
            return v57.HomePageProfileLink or false;
        end, 
        getPurchasePromptIncludingWarning = function() --[[ Line: 277 ]] --[[ Name: getPurchasePromptIncludingWarning ]]
            -- upvalues: v57 (copy)
            if v57.PurchasePromptIncludingWarning == nil then
                return true;
            else
                return v57.PurchasePromptIncludingWarning;
            end;
        end, 
        getCheckUserAgreementsUpdatedOnLogin = function() --[[ Line: 283 ]] --[[ Name: getCheckUserAgreementsUpdatedOnLogin ]]
            -- upvalues: v57 (copy)
            if v57.CheckUserAgreementsUpdatedOnLogin == nil then
                return true;
            else
                return v57.CheckUserAgreementsUpdatedOnLogin;
            end;
        end, 
        getAddUserAgreementIdsToSignupRequest = function() --[[ Line: 289 ]] --[[ Name: getAddUserAgreementIdsToSignupRequest ]]
            -- upvalues: v57 (copy)
            return v57.AddUserAgreementIdsToSignupRequest or false;
        end, 
        RequireExplicitVoiceConsent = function() --[[ Line: 292 ]] --[[ Name: RequireExplicitVoiceConsent ]]
            -- upvalues: v57 (copy)
            return v57.RequireExplicitVoiceConsent or false;
        end, 
        getRequireExplicitAvatarVideoConsent = function() --[[ Line: 295 ]] --[[ Name: getRequireExplicitAvatarVideoConsent ]]
            -- upvalues: v57 (copy)
            return v57.RequireExplicitAvatarVideoConsent or false;
        end, 
        getShowVoiceUpsellV2 = function() --[[ Line: 298 ]] --[[ Name: getShowVoiceUpsellV2 ]]
            -- upvalues: v57 (copy)
            return v57.ShowVoiceUpsellV2 or false;
        end, 
        getShouldShowGroupsTile = function() --[[ Line: 301 ]] --[[ Name: getShouldShowGroupsTile ]]
            -- upvalues: v57 (copy)
            return v57.ShouldShowGroupsTile or false;
        end, 
        useLuobuAuthentication = function() --[[ Line: 304 ]] --[[ Name: useLuobuAuthentication ]]
            -- upvalues: v57 (copy)
            return v57.UseLuobuAuthentication or false;
        end, 
        useWechatQQAuthentication = function() --[[ Line: 307 ]] --[[ Name: useWechatQQAuthentication ]]
            -- upvalues: v57 (copy)
            return v57.UseWechatQQAuthentication or false;
        end, 
        useMSDKWebAuthentication = function() --[[ Line: 310 ]] --[[ Name: useMSDKWebAuthentication ]]
            -- upvalues: v57 (copy)
            return v57.UseMSDKWebAuthentication or false;
        end, 
        getQrFriendingEnabled = function() --[[ Line: 313 ]] --[[ Name: getQrFriendingEnabled ]]
            -- upvalues: v57 (copy)
            return v57.QrFriendingEnabled or false;
        end, 
        getShouldShowCameraPermissionInAgreementsPrompt = function() --[[ Line: 316 ]] --[[ Name: getShouldShowCameraPermissionInAgreementsPrompt ]]
            -- upvalues: v57 (copy)
            return v57.ShouldShowCameraPermissionInAgreementsPrompt or false;
        end, 
        getExperienceInviteShareLinkEnabled = function() --[[ Line: 319 ]] --[[ Name: getExperienceInviteShareLinkEnabled ]]
            -- upvalues: v57 (copy)
            return v57.ExperienceInviteShareLinkEnabled or false;
        end, 
        getCsatSurveyRestrictTextInput = function() --[[ Line: 322 ]] --[[ Name: getCsatSurveyRestrictTextInput ]]
            -- upvalues: v57 (copy)
            return v57.CsatSurveyRestrictTextInput or false;
        end, 
        useGridPageLayout = function() --[[ Line: 325 ]] --[[ Name: useGridPageLayout ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v57 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if l_IsVRAppBuild_0() then
                if v57.UseGridPageLayout ~= nil then
                    return v57.UseGridPageLayout;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif v57.UseGridPageLayout == nil then
                return l_isSubjectToDesktopPolicies_0();
            else
                return v57.UseGridPageLayout;
            end;
        end, 
        usePhoneSearchDiscoverEntry = function() --[[ Line: 336 ]] --[[ Name: usePhoneSearchDiscoverEntry ]]
            -- upvalues: v57 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v57.UsePhoneSearchDiscoverEntry == nil then
                return not l_isSubjectToDesktopPolicies_0();
            else
                return v57.UsePhoneSearchDiscoverEntry;
            end;
        end, 
        getShouldSystemBarUsuallyBePresent = function() --[[ Line: 343 ]] --[[ Name: getShouldSystemBarUsuallyBePresent ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v57 (copy), l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref)
            if l_IsVRAppBuild_0() then
                if v57.ShouldSystemBarUsuallyBePresentForVR ~= nil then
                    return v57.ShouldSystemBarUsuallyBePresentForVR;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
                return true;
            else
                return v57.ShouldSystemBarUsuallyBePresent or false;
            end;
        end, 
        getContactImporterEnabled = function() --[[ Line: 356 ]] --[[ Name: getContactImporterEnabled ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v57 (copy)
            if l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v57.ContactImporterEnabled or false;
            end;
        end, 
        getShouldShowSettingsPermissionsAdditionalInstructions = function() --[[ Line: 364 ]] --[[ Name: getShouldShowSettingsPermissionsAdditionalInstructions ]]
            -- upvalues: v57 (copy)
            return v57.shouldShowSettingsPermissionsAdditionalInstructions or false;
        end, 
        getUseVRFTUXPanel = function() --[[ Line: 368 ]] --[[ Name: getUseVRFTUXPanel ]]
            -- upvalues: v57 (copy), l_IsVRAppBuild_0 (ref)
            if v57.UseVRFTUXPanel ~= nil then
                return v57.UseVRFTUXPanel;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getWebViewSupport = function() --[[ Line: 371 ]] --[[ Name: getWebViewSupport ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v41 (ref), v57 (copy), l_IsVRAppBuild_0 (ref)
            if l_isRunningInStudio_0() then
                if v41 then
                    return false;
                else
                    return true;
                end;
            elseif v57.EnableWebViewSupport ~= nil then
                return v57.EnableWebViewSupport;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseLuafiedReportFlow = function() --[[ Line: 382 ]] --[[ Name: getUseLuafiedReportFlow ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), l_GetFFlagLuafiedReportEntryPoints_0 (ref), v57 (copy), l_GetFFlagEnableAbuseReport10ft_0 (ref)
            if l_IsVRAppBuild_0() and l_GetFFlagLuafiedReportEntryPoints_0() then
                if v57.UseLuafiedReportFlow ~= nil then
                    return v57.UseLuafiedReportFlow;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif l_GetFFlagEnableAbuseReport10ft_0() then
                return v57.UseLuafiedReportFlow or false;
            else
                return nil;
            end;
        end, 
        getThrottleFramerate = function() --[[ Line: 391 ]] --[[ Name: getThrottleFramerate ]]
            -- upvalues: v57 (copy), l_IsVRAppBuild_0 (ref)
            if v57.ThrottleFramerate ~= nil then
                return v57.ThrottleFramerate;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseRoundedCorners = function() --[[ Line: 394 ]] --[[ Name: getUseRoundedCorners ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v57 (copy)
            if l_IsVRAppBuild_0() then
                if v57.UseRoundedCorners ~= nil then
                    return v57.UseRoundedCorners;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            else
                return false;
            end;
        end, 
        getGameInfoShowChatFeatures = function() --[[ Line: 401 ]] --[[ Name: getGameInfoShowChatFeatures ]]
            -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (ref), v57 (copy)
            if l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return v57.GameInfoShowChatFeatures or false;
            else
                return false;
            end;
        end, 
        getDisplayCheckboxInVoiceConsent = function() --[[ Line: 407 ]] --[[ Name: getDisplayCheckboxInVoiceConsent ]]
            -- upvalues: l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (ref), v57 (copy)
            if l_GetFFlagSeamlessVoiceConsentToastPolicy_0() then
                return v57.DisplayCheckboxInVoiceConsent or false;
            else
                return false;
            end;
        end, 
        getExperienceChatAvailability = function() --[[ Line: 413 ]] --[[ Name: getExperienceChatAvailability ]]
            -- upvalues: l_GetFFlagExpChatGuacChatDisabledReason_0 (ref), v57 (copy)
            if l_GetFFlagExpChatGuacChatDisabledReason_0() then
                return v57.ExperienceChatAvailability or "unknown";
            else
                return "unknown";
            end;
        end, 
        getInCommsRegionBubble = function() --[[ Line: 419 ]] --[[ Name: getInCommsRegionBubble ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (ref), v57 (copy)
            if l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 then
                return v57.InCommsRegionBubble or false;
            else
                return false;
            end;
        end, 
        getShowInExpFAEUpsell = function() --[[ Line: 425 ]] --[[ Name: getShowInExpFAEUpsell ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (ref), v57 (copy)
            if l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 then
                return v57.ShowInExpFAEUpsell or false;
            else
                return false;
            end;
        end, 
        getShowFOMOUpsell = function() --[[ Line: 431 ]] --[[ Name: getShowFOMOUpsell ]]
            -- upvalues: l_FFlagExpChatUseGuacForFOMOUpsell_0 (ref), v57 (copy)
            if l_FFlagExpChatUseGuacForFOMOUpsell_0 then
                return v57.ShowFOMOUpsell or false;
            else
                return false;
            end;
        end, 
        getShowCrossAgeChat = function() --[[ Line: 438 ]] --[[ Name: getShowCrossAgeChat ]]
            -- upvalues: l_FFlagExpChatUseGuacForCrossAgeChat_0 (ref), v57 (copy)
            if l_FFlagExpChatUseGuacForCrossAgeChat_0 then
                return v57.ShowCrossAgeExpChat or false;
            else
                return false;
            end;
        end, 
        getAllowCameraMovements = function() --[[ Line: 445 ]] --[[ Name: getAllowCameraMovements ]]
            -- upvalues: v57 (copy), l_IsVRAppBuild_0 (ref)
            if v57.AllowCameraMovements ~= nil then
                return v57.AllowCameraMovements;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getShouldSkipAvatarLandingPage = function() --[[ Line: 448 ]] --[[ Name: getShouldSkipAvatarLandingPage ]]
            -- upvalues: v57 (copy), l_IsVRAppBuild_0 (ref)
            if v57.ShouldSkipAvatarLandingPage ~= nil then
                return v57.ShouldSkipAvatarLandingPage;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getShowPassesOnExperienceDetails = function() --[[ Line: 451 ]] --[[ Name: getShowPassesOnExperienceDetails ]]
            -- upvalues: v57 (copy)
            return v57.ShowPassesOnExperienceDetails or false;
        end, 
        getDisableCDLQrCodeForMaquettes = function() --[[ Line: 454 ]] --[[ Name: getDisableCDLQrCodeForMaquettes ]]
            -- upvalues: l_GetFFlagDisableCDLQrCodeForMaquettes_0 (ref), v57 (copy)
            if l_GetFFlagDisableCDLQrCodeForMaquettes_0() then
                return v57.DisableCDLQrCodeForMaquettes;
            else
                return false;
            end;
        end, 
        getDisableIAPEntryPoint = function() --[[ Line: 461 ]] --[[ Name: getDisableIAPEntryPoint ]]
            -- upvalues: v57 (copy)
            return v57.DisableIAPEntryPoint or false;
        end, 
        getEnforceAgeRestrictedLogin = function() --[[ Line: 464 ]] --[[ Name: getEnforceAgeRestrictedLogin ]]
            -- upvalues: v57 (copy)
            return v57.EnforceAgeRestrictedLogin or false;
        end, 
        getUrlAuthRoutes = function() --[[ Line: 467 ]] --[[ Name: getUrlAuthRoutes ]]
            -- upvalues: v57 (copy)
            local v61 = v57.Routes or {};
            if v61 then
                return v61.auth or {};
            else
                return {};
            end;
        end, 
        getShowDisconnectButton = function() --[[ Line: 476 ]] --[[ Name: getShowDisconnectButton ]]
            -- upvalues: v57 (copy)
            return v57.ShowDisconnectButton or false;
        end, 
        getUseSingleSignOn = function() --[[ Line: 479 ]] --[[ Name: getUseSingleSignOn ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v57 (copy)
            if l_isRunningInStudio_0() then
                return false;
            else
                return v57.UseSingleSignOn or false;
            end;
        end, 
        getGridCarouselSeeAllTilesEnabled = function() --[[ Line: 486 ]] --[[ Name: getGridCarouselSeeAllTilesEnabled ]]
            -- upvalues: v57 (copy)
            return v57.UseGridCarouselSeeAllTiles or false;
        end, 
        getSearchWithoutNavigatingEnabled = function() --[[ Line: 489 ]] --[[ Name: getSearchWithoutNavigatingEnabled ]]
            -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref), v57 (copy)
            if l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
                return false;
            else
                return v57.SingleSearchPageNoNavigation or false;
            end;
        end, 
        getGameListCategoryScrollListEnabled = function() --[[ Line: 495 ]] --[[ Name: getGameListCategoryScrollListEnabled ]]
            -- upvalues: v57 (copy)
            return v57.GetGamesListCategoryTabs or false;
        end, 
        getForceTheme = function() --[[ Line: 498 ]] --[[ Name: getForceTheme ]]
            -- upvalues: v4 (ref), v6 (ref), v57 (copy)
            local v63 = v4.List.map(v6, function(v62) --[[ Line: 499 ]]
                return v62:lower();
            end);
            if v57.ForceTheme and v4.List.find(v63, v57.ForceTheme:lower()) then
                return v57.ForceTheme;
            else
                return nil;
            end;
        end, 
        enableExperienceDetailsPanel = function() --[[ Line: 508 ]] --[[ Name: enableExperienceDetailsPanel ]]
            -- upvalues: v57 (copy)
            return v57.EnableExperienceDetailsPanel or false;
        end, 
        getDisableRegularLogin = function() --[[ Line: 511 ]] --[[ Name: getDisableRegularLogin ]]
            -- upvalues: v57 (copy)
            return not v57.EnableWebViewSupport and (not v57.EnableRegularLoginWithoutWebViewSupport or false);
        end, 
        getAllowPlatformAccountSwitching = function() --[[ Line: 514 ]] --[[ Name: getAllowPlatformAccountSwitching ]]
            -- upvalues: v57 (copy)
            return v57.AllowPlatformAccountSwitching or false;
        end, 
        useLegacyCrossPlayApi = function() --[[ Line: 517 ]] --[[ Name: useLegacyCrossPlayApi ]]
            -- upvalues: v42 (ref), v57 (copy)
            return v42 or v57.useLegacyCrossPlayApi or false;
        end, 
        useCrossPlaySystemUi = function() --[[ Line: 520 ]] --[[ Name: useCrossPlaySystemUi ]]
            -- upvalues: v45 (ref), v57 (copy)
            return v45 or v57.useCrossPlaySystemUi or false;
        end, 
        getCrossPlayUri = function() --[[ Line: 523 ]] --[[ Name: getCrossPlayUri ]]
            -- upvalues: v46 (ref), v57 (copy)
            if v46 ~= "" then
                return v46;
            else
                return v57.crossPlayUri or "";
            end;
        end, 
        getCrossPlayCapabilities = function() --[[ Line: 530 ]] --[[ Name: getCrossPlayCapabilities ]]
            -- upvalues: v4 (ref), v57 (copy), v7 (ref)
            return v4.List.foldLeft(v57.crossPlayCapabilities or {}, function(v64, v65) --[[ Line: 531 ]]
                -- upvalues: v4 (ref), v7 (ref)
                if v4.List.find(v64, v65) then
                    return v64;
                else
                    return v4.List.join(v64, {
                        v7[v65]
                    });
                end;
            end, {});
        end, 
        getCrossPlaySettingsKey = function() --[[ Line: 541 ]] --[[ Name: getCrossPlaySettingsKey ]]
            -- upvalues: v43 (ref), v57 (copy)
            if v43 ~= "" then
                return v43;
            else
                return v57.crossPlaySettingsKey or "";
            end;
        end, 
        getCrossPlayQueryParam = function() --[[ Line: 548 ]] --[[ Name: getCrossPlayQueryParam ]]
            -- upvalues: v44 (ref), v57 (copy)
            if v44 ~= "" then
                return v44;
            else
                return v57.crossPlayQueryParam or "";
            end;
        end, 
        getPromotionalEmailsCheckboxEnabled = function() --[[ Line: 555 ]] --[[ Name: getPromotionalEmailsCheckboxEnabled ]]
            -- upvalues: v57 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v57.PromotionalEmailsCheckboxEnabled or false;
            else
                return false;
            end;
        end, 
        getPromotionalEmailsOptInByDefault = function() --[[ Line: 562 ]] --[[ Name: getPromotionalEmailsOptInByDefault ]]
            -- upvalues: v57 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v57.PromotionalEmailsOptInByDefault or false;
            else
                return false;
            end;
        end, 
        getSupportsOverscan = function() --[[ Line: 569 ]] --[[ Name: getSupportsOverscan ]]
            -- upvalues: v57 (copy)
            return v57.SupportsOverscan or false;
        end, 
        getPlatformDisplayName = function() --[[ Line: 572 ]] --[[ Name: getPlatformDisplayName ]]
            -- upvalues: v57 (copy)
            return v57.platformDisplayName or "";
        end, 
        getPlatformAccountName = function() --[[ Line: 575 ]] --[[ Name: getPlatformAccountName ]]
            -- upvalues: v57 (copy)
            return v57.platformAccountName or nil;
        end, 
        getSupportsProfileSwitching = function() --[[ Line: 578 ]] --[[ Name: getSupportsProfileSwitching ]]
            -- upvalues: v57 (copy)
            return v57.supportsProfileSwitching or false;
        end, 
        getMountAllOmniFeedItems = function() --[[ Line: 581 ]] --[[ Name: getMountAllOmniFeedItems ]]
            -- upvalues: v57 (copy)
            return v57.mountAllOmniFeedItems or false;
        end, 
        getFriendCodeQrCodeScannerEnabled = function() --[[ Line: 584 ]] --[[ Name: getFriendCodeQrCodeScannerEnabled ]]
            -- upvalues: v57 (copy)
            return v57.FriendCodeQrCodeScannerEnabled or false;
        end, 
        getInviteFriendsDisabled = function() --[[ Line: 587 ]] --[[ Name: getInviteFriendsDisabled ]]
            -- upvalues: v57 (copy)
            return v57.InviteFriendsDisabled or false;
        end, 
        getRealNamesInDisplayNamesEnabled = function() --[[ Line: 590 ]] --[[ Name: getRealNamesInDisplayNamesEnabled ]]
            -- upvalues: v57 (copy)
            return v57.RealNamesInDisplayNamesEnabled or false;
        end, 
        getProfileShareLinkEnabled = function() --[[ Line: 593 ]] --[[ Name: getProfileShareLinkEnabled ]]
            -- upvalues: v57 (copy)
            return v57.ProfileShareLinkEnabled;
        end, 
        getProfileCopyLinkEnabled = function() --[[ Line: 596 ]] --[[ Name: getProfileCopyLinkEnabled ]]
            -- upvalues: v57 (copy)
            return v57.ProfileCopyLinkEnabled;
        end, 
        getEnablePremiumUserFeatures = function() --[[ Line: 599 ]] --[[ Name: getEnablePremiumUserFeatures ]]
            -- upvalues: l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (ref), v57 (copy)
            if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
                return v57.EnablePremiumUserFeatures or false;
            else
                return nil;
            end;
        end, 
        getEnableDualLogin = function() --[[ Line: 605 ]] --[[ Name: getEnableDualLogin ]]
            -- upvalues: v57 (copy)
            return v57.enableDualLogin or false;
        end, 
        getUseExternalBrowserForAgeGuidelines = function() --[[ Line: 609 ]] --[[ Name: getUseExternalBrowserForAgeGuidelines ]]
            -- upvalues: l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (ref), v57 (copy)
            if l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then
                return v57.UseExternalBrowserForAgeGuidelines or false;
            else
                return nil;
            end;
        end, 
        getEnableHomePageAgeBlock = function() --[[ Line: 616 ]] --[[ Name: getEnableHomePageAgeBlock ]]
            -- upvalues: v57 (copy)
            return v57.EnableHomePageAgeBlock or false;
        end, 
        getEnableUAppAccessBlock = function() --[[ Line: 619 ]] --[[ Name: getEnableUAppAccessBlock ]]
            -- upvalues: v57 (copy)
            return v57.EnableUAppAccessBlock or false;
        end, 
        getUAppBlockPageTextMapKey = function() --[[ Line: 622 ]] --[[ Name: getUAppBlockPageTextMapKey ]]
            -- upvalues: v57 (copy)
            return v57.UAppBlockPageTextMapKey or nil;
        end, 
        getUAppBlockPageShouldDisableLogOut = function() --[[ Line: 625 ]] --[[ Name: getUAppBlockPageShouldDisableLogOut ]]
            -- upvalues: v57 (copy)
            return v57.UAppBlockPageShouldDisableLogOut or nil;
        end, 
        getContactsToastEnabled = function() --[[ Line: 628 ]] --[[ Name: getContactsToastEnabled ]]
            -- upvalues: v57 (copy)
            return v57.ContactsToastEnabled or false;
        end, 
        getEnableProfileQrCode = function() --[[ Line: 631 ]] --[[ Name: getEnableProfileQrCode ]]
            -- upvalues: v57 (copy)
            return v57.EnableProfileQrCode or false;
        end, 
        getCanRenderTransferOnProfile = function() --[[ Line: 634 ]] --[[ Name: getCanRenderTransferOnProfile ]]
            -- upvalues: l_FFlagGuacCanRenderTransferOnProfile_0 (ref), v57 (copy)
            if l_FFlagGuacCanRenderTransferOnProfile_0 then
                return v57.CanRenderTransferOnProfile or false;
            else
                return false;
            end;
        end, 
        getShowVNGLoginWithExistingAccountQuickLoginButton = function() --[[ Line: 640 ]] --[[ Name: getShowVNGLoginWithExistingAccountQuickLoginButton ]]
            -- upvalues: v57 (copy)
            return v57.ShowVNGLoginWithExistingAccountQuickLoginButton or false;
        end, 
        getShowVNGAge12Badge = function() --[[ Line: 643 ]] --[[ Name: getShowVNGAge12Badge ]]
            -- upvalues: v57 (copy)
            return v57.ShowVNGAge12Badge or false;
        end, 
        getShowBrazilContentRatingLogo = function() --[[ Line: 646 ]] --[[ Name: getShowBrazilContentRatingLogo ]]
            -- upvalues: v57 (copy)
            return v57.ShowBrazilContentRatingLogo or false;
        end, 
        getUseVNGUserAgreementPopup = function() --[[ Line: 649 ]] --[[ Name: getUseVNGUserAgreementPopup ]]
            -- upvalues: v57 (copy)
            return v57.UseVNGUserAgreementPopup or false;
        end, 
        getRedirectBuyRobuxToVNG = function() --[[ Line: 652 ]] --[[ Name: getRedirectBuyRobuxToVNG ]]
            -- upvalues: v57 (copy)
            return v57.RedirectBuyRobuxToVNG or false;
        end, 
        getShowVNGTosForRobuxUpsell = function() --[[ Line: 655 ]] --[[ Name: getShowVNGTosForRobuxUpsell ]]
            -- upvalues: v57 (copy)
            return v57.ShowVNGTosForRobuxUpsell or false;
        end, 
        getBlockVNGU12SignUpOnClientSide = function() --[[ Line: 658 ]] --[[ Name: getBlockVNGU12SignUpOnClientSide ]]
            -- upvalues: v57 (copy)
            return v57.BlockVNGU12SignUpOnClientSide or false;
        end, 
        getUseAgeInput = function() --[[ Line: 661 ]] --[[ Name: getUseAgeInput ]]
            -- upvalues: v57 (copy)
            return v57.UseAgeInput or false;
        end, 
        getLoginUsernameOnly = function() --[[ Line: 664 ]] --[[ Name: getLoginUsernameOnly ]]
            -- upvalues: v57 (copy)
            return v57.LoginUsernameOnly or false;
        end, 
        getDisableEmailOTPLogin = function() --[[ Line: 667 ]] --[[ Name: getDisableEmailOTPLogin ]]
            -- upvalues: v57 (copy)
            return v57.DisableEmailOTPLogin or false;
        end, 
        getDisableLoginForgotButton = function() --[[ Line: 670 ]] --[[ Name: getDisableLoginForgotButton ]]
            -- upvalues: v57 (copy)
            return v57.DisableLoginForgotButton or false;
        end, 
        getDisableLogOutEmailUpsell = function() --[[ Line: 673 ]] --[[ Name: getDisableLogOutEmailUpsell ]]
            -- upvalues: v57 (copy)
            return v57.DisableLogOutEmailUpsell or false;
        end, 
        getVerifiedSignupCountry = function() --[[ Line: 676 ]] --[[ Name: getVerifiedSignupCountry ]]
            -- upvalues: v57 (copy)
            return v57.verifiedSignupCountry or false;
        end, 
        getParentalConsentAgreementId = function() --[[ Line: 680 ]] --[[ Name: getParentalConsentAgreementId ]]
            -- upvalues: v57 (copy)
            return v57.parentalConsentAgreementId or "";
        end, 
        getIsStrictComplianceEnabled = function() --[[ Line: 684 ]] --[[ Name: getIsStrictComplianceEnabled ]]
            -- upvalues: v57 (copy)
            return v57.isStrictComplianceEnabled or false;
        end, 
        getUseKoreaKISAUserAgreementPopup = function() --[[ Line: 688 ]] --[[ Name: getUseKoreaKISAUserAgreementPopup ]]
            -- upvalues: v57 (copy)
            return v57.useKoreaKISAUserAgreementPopup or false;
        end, 
        getEnableNotificationPreferencesPage = function() --[[ Line: 692 ]] --[[ Name: getEnableNotificationPreferencesPage ]]
            -- upvalues: l_GetFFlagEnableGateNotificationPreferencesTab_0 (ref), v57 (copy)
            if l_GetFFlagEnableGateNotificationPreferencesTab_0() then
                return v57.EnableNotificationPreferencesPage or false;
            else
                return nil;
            end;
        end, 
        getVNGFormRequired = function() --[[ Line: 699 ]] --[[ Name: getVNGFormRequired ]]
            -- upvalues: v57 (copy)
            return v57.VNGFormRequired or false;
        end, 
        getUpsellVoiceForPhoneVerification = function() --[[ Line: 702 ]] --[[ Name: getUpsellVoiceForPhoneVerification ]]
            -- upvalues: v57 (copy)
            return v57.UpsellVoiceForPhoneVerification or false;
        end, 
        getIsLinkedVRModeAvailable = function() --[[ Line: 705 ]] --[[ Name: getIsLinkedVRModeAvailable ]]
            -- upvalues: l_UserInputService_0 (ref)
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v67 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
                v67 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
            end;
            return v67;
        end, 
        getShouldShowPhoneUpsell = function() --[[ Line: 709 ]] --[[ Name: getShouldShowPhoneUpsell ]]
            -- upvalues: v57 (copy)
            return v57.ShouldShowPhoneUpsell or false;
        end, 
        getTermsOfUseLink = function() --[[ Line: 712 ]] --[[ Name: getTermsOfUseLink ]]
            -- upvalues: v57 (copy)
            return v57.TermsOfUseLink or "";
        end, 
        getPrivacyPolicyLink = function() --[[ Line: 715 ]] --[[ Name: getPrivacyPolicyLink ]]
            -- upvalues: v57 (copy)
            return v57.PrivacyPolicyLink or "";
        end, 
        getVngAppUpsell = function() --[[ Line: 718 ]] --[[ Name: getVngAppUpsell ]]
            -- upvalues: l_FFlagLuaAppHomeVngAppUpsell_0 (ref), v57 (copy)
            if l_FFlagLuaAppHomeVngAppUpsell_0 then
                return v57.VngAppUpsell or false;
            else
                return false;
            end;
        end, 
        getShouldHideContactImporterUpsell = function() --[[ Line: 725 ]] --[[ Name: getShouldHideContactImporterUpsell ]]
            -- upvalues: v57 (copy)
            return v57.ShouldHideContactImporterUpsell or false;
        end, 
        getContactImporterEncouraged = function() --[[ Line: 728 ]] --[[ Name: getContactImporterEncouraged ]]
            -- upvalues: v57 (copy)
            return v57.contactImporterEncouraged or false;
        end, 
        getFriendRequestNicknamesEnabled = function() --[[ Line: 731 ]] --[[ Name: getFriendRequestNicknamesEnabled ]]
            -- upvalues: l_FFlagFriendRequestNicknames_0 (ref), v57 (copy)
            if l_FFlagFriendRequestNicknames_0 then
                return v57.FriendRequestNicknamesEnabled or false;
            else
                return false;
            end;
        end, 
        getShouldShowVpcPlayButtonUpsells = l_FFlagLuaAppParentUpsellPolicy_0 and function() --[[ Line: 739 ]]
            -- upvalues: v57 (copy)
            return v57.shouldShowVpcPlayButtonUpsells or false;
        end or nil, 
        getRenamePaymentsToSpendingTab = function() --[[ Line: 743 ]] --[[ Name: getRenamePaymentsToSpendingTab ]]
            -- upvalues: v57 (copy)
            return v57.renamePaymentsToSpendingTab or false;
        end, 
        getNotificationsCanReceiveStream = function() --[[ Line: 748 ]] --[[ Name: getNotificationsCanReceiveStream ]]
            -- upvalues: l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (ref), v57 (copy)
            if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
                return v57.notificationsCanAccessStream or false;
            else
                return nil;
            end;
        end, 
        getNotificationsCanReceivePush = function() --[[ Line: 755 ]] --[[ Name: getNotificationsCanReceivePush ]]
            -- upvalues: v57 (copy)
            return v57.notificationsCanAccessPush or false;
        end, 
        getPushNotificationsUpsell = function() --[[ Line: 758 ]] --[[ Name: getPushNotificationsUpsell ]]
            -- upvalues: v57 (copy)
            return v57.ShouldShowPushNotificationsUpsell or false;
        end, 
        getNotificationsCanReceiveExperience = function() --[[ Line: 761 ]] --[[ Name: getNotificationsCanReceiveExperience ]]
            -- upvalues: v57 (copy)
            if v57.notificationsCanAccessExperience == nil then
                return true;
            else
                return v57.notificationsCanAccessExperience;
            end;
        end, 
        getDisableResellingCollectiblesForCompliance = function() --[[ Line: 767 ]] --[[ Name: getDisableResellingCollectiblesForCompliance ]]
            -- upvalues: v57 (copy)
            return v57.DisableResellingCollectiblesForCompliance or false;
        end, 
        getShowIllegalContentReportingUI = function() --[[ Line: 770 ]] --[[ Name: getShowIllegalContentReportingUI ]]
            -- upvalues: v57 (copy)
            return v57.ShowIllegalContentReportingUI or false;
        end, 
        getEligibleForContentPostFeed = function() --[[ Line: 773 ]] --[[ Name: getEligibleForContentPostFeed ]]
            -- upvalues: v57 (copy)
            return v57.EligibleForContentPostFeed or false;
        end, 
        getEligibleForExternalContentSharing = function() --[[ Line: 776 ]] --[[ Name: getEligibleForExternalContentSharing ]]
            -- upvalues: v57 (copy)
            return v57.EligibleForExternalContentSharing or false;
        end, 
        getEnableContinuousLoad = function() --[[ Line: 779 ]] --[[ Name: getEnableContinuousLoad ]]
            -- upvalues: v57 (copy)
            return v57.EnableContinuousLoad or false;
        end, 
        getEnableAggregateLikesFavoritesCount = function() --[[ Line: 782 ]] --[[ Name: getEnableAggregateLikesFavoritesCount ]]
            -- upvalues: v57 (copy)
            return v57.EnableAggregateLikesFavoritesCount or false;
        end, 
        getShowUpdatedCameraPath = function() --[[ Line: 785 ]] --[[ Name: getShowUpdatedCameraPath ]]
            -- upvalues: v57 (copy)
            return v57.showUpdatedCameraPath or false;
        end, 
        getRenameParentEmailForVerificationUpsell = function() --[[ Line: 788 ]] --[[ Name: getRenameParentEmailForVerificationUpsell ]]
            -- upvalues: l_FFlagRenameParentEmailForVerificationUpsell_0 (ref), v57 (copy)
            if l_FFlagRenameParentEmailForVerificationUpsell_0() then
                return v57.renameParentEmailForVerificationUpsell or false;
            else
                return false;
            end;
        end, 
        getKeystrokeCollectionEnabled = function() --[[ Line: 795 ]] --[[ Name: getKeystrokeCollectionEnabled ]]
            -- upvalues: v57 (copy)
            if game:GetFastFlag("BehaviorCollectionControlEnabled") then
                return v57.EnableKeystrokeCollection or false;
            else
                return false;
            end;
        end, 
        getCanUsePlatformChat = function() --[[ Line: 803 ]] --[[ Name: getCanUsePlatformChat ]]
            -- upvalues: v57 (copy)
            return v57.CanUsePlatformChat or false;
        end, 
        getCanSeeChatTab = function() --[[ Line: 807 ]] --[[ Name: getCanSeeChatTab ]]
            -- upvalues: v57 (copy)
            return v57.CanSeeChatTab or false;
        end, 
        getHidesGamesTab = function() --[[ Line: 812 ]] --[[ Name: getHidesGamesTab ]]
            -- upvalues: l_FFlagEnableAndroidTvAppPolicies_0 (ref), v57 (copy)
            if l_FFlagEnableAndroidTvAppPolicies_0 then
                return v57.HidesGamesTab or false;
            else
                return false;
            end;
        end, 
        getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 820 ]] --[[ Name: getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (ref), v57 (copy)
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return true;
            elseif v57.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil then
                return true;
            else
                return v57.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup;
            end;
        end, 
        getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 829 ]] --[[ Name: getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (ref), l_GetFFlagEnableMultiPageSignup_0 (ref), v57 (copy)
            local v68 = l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0();
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return v68;
            elseif v57.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then
                return v68;
            else
                return v57.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages;
            end;
        end, 
        getRobuxUpsellFlowMobile = function() --[[ Line: 839 ]] --[[ Name: getRobuxUpsellFlowMobile ]]
            -- upvalues: v57 (copy)
            return v57.useMobileRobuxUpsellFlow or false;
        end, 
        getUsePaymentPlatformMicrosoftStore = function() --[[ Line: 842 ]] --[[ Name: getUsePaymentPlatformMicrosoftStore ]]
            -- upvalues: l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (ref), v57 (copy)
            if l_FFlagEnableMicrosoftStorePaymentsPlatform_0 then
                return v57.usePaymentPlatformMicrosoftStore or false;
            else
                return false;
            end;
        end, 
        getMicSettingsDirectionsLocaleKey = function() --[[ Line: 849 ]] --[[ Name: getMicSettingsDirectionsLocaleKey ]]
            -- upvalues: l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (ref), v57 (copy)
            if l_FFlagPartyVoiceEnableMicPermissionsBanner_0 then
                return v57.micSettingsDirectionsLocaleKey or nil;
            else
                return nil;
            end;
        end, 
        getMicSettingsDeeplinkDirectionsLocaleKey = function() --[[ Line: 855 ]] --[[ Name: getMicSettingsDeeplinkDirectionsLocaleKey ]]
            -- upvalues: l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (ref), v57 (copy)
            if l_FFlagPartyVoiceEnableMicPermissionsBanner_0 then
                return v57.micSettingsDeeplinkDirectionsLocaleKey or nil;
            else
                return nil;
            end;
        end, 
        getRequiresAppRestartOnMicAccessChange = function() --[[ Line: 861 ]] --[[ Name: getRequiresAppRestartOnMicAccessChange ]]
            -- upvalues: l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (ref), v57 (copy)
            if l_FFlagPartyVoiceEnableMicPermissionsBanner_0 then
                return v57.requiresAppRestartOnMicAccessChange or false;
            else
                return false;
            end;
        end, 
        getRenameFriendsToConnections = function() --[[ Line: 867 ]] --[[ Name: getRenameFriendsToConnections ]]
            -- upvalues: l_FFlagEnableFriendsRenamingForAll_0 (ref), v57 (copy)
            if l_FFlagEnableFriendsRenamingForAll_0 then
                return true;
            else
                return v57.renameFriendsToConnections or false;
            end;
        end, 
        getShareSheetEnabled = function() --[[ Line: 873 ]] --[[ Name: getShareSheetEnabled ]]
            -- upvalues: l_FFlagTCShareLinkSenderUI_0 (ref), v57 (copy)
            if l_FFlagTCShareLinkSenderUI_0 then
                return v57.shareSheetEnabled or false;
            else
                return nil;
            end;
        end, 
        getCanAccessTrustedContacts = function() --[[ Line: 880 ]] --[[ Name: getCanAccessTrustedContacts ]]
            -- upvalues: v57 (copy)
            return v57.canAccessTrustedContacts or false;
        end, 
        getExperienceDetailsNoticeType = function() --[[ Line: 883 ]] --[[ Name: getExperienceDetailsNoticeType ]]
            -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (ref), v57 (copy)
            if l_FFlagLuaAppShowNoticeOnEdp_0 then
                return v57.experienceDetailsNoticeType or nil;
            else
                return nil;
            end;
        end, 
        getRequiresOSAFriendingEducation = function() --[[ Line: 889 ]] --[[ Name: getRequiresOSAFriendingEducation ]]
            -- upvalues: v57 (copy)
            return v57.requiresOSAFriendingEducation or false;
        end, 
        getSocialGraphSyncEnabled = function() --[[ Line: 892 ]] --[[ Name: getSocialGraphSyncEnabled ]]
            -- upvalues: v57 (copy)
            return v57.SocialGraphSyncEnabled or false;
        end, 
        getAccountDisambiguationDisabled = function() --[[ Line: 895 ]] --[[ Name: getAccountDisambiguationDisabled ]]
            -- upvalues: v57 (copy)
            return v57.AccountDisambiguationDisabled or false;
        end, 
        getHasWebViewSupportForFAE = function() --[[ Line: 898 ]] --[[ Name: getHasWebViewSupportForFAE ]]
            -- upvalues: v57 (copy)
            return v57.hasWebViewSupportForFAE or false;
        end, 
        getLinkedAuthEndpointsEnabled = function() --[[ Line: 901 ]] --[[ Name: getLinkedAuthEndpointsEnabled ]]
            -- upvalues: v57 (copy)
            return v57.LinkedAuthEndpointsEnabled or false;
        end, 
        getLinkingPlatform = function() --[[ Line: 904 ]] --[[ Name: getLinkingPlatform ]]
            -- upvalues: v57 (copy)
            return v57.LinkingPlatform or nil;
        end, 
        getUsePaymentPlatformMilkyWayStore = function() --[[ Line: 907 ]] --[[ Name: getUsePaymentPlatformMilkyWayStore ]]
            -- upvalues: l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (ref), v57 (copy)
            if l_FFlagEnableMilkyWayPaymentsPlatformV2_0 then
                return v57.usePaymentPlatformMilkyWayStore or false;
            else
                return false;
            end;
        end, 
        getScreentimeMoreTimeOptionEnabled = function() --[[ Line: 913 ]] --[[ Name: getScreentimeMoreTimeOptionEnabled ]]
            -- upvalues: l_FFlagEnableScreentimeMoreTimeOption_0 (ref), v57 (copy)
            if l_FFlagEnableScreentimeMoreTimeOption_0 then
                return v57.ScreentimeMoreTimeOptionEnabled or false;
            else
                return false;
            end;
        end, 
        getDisablePremiumEntrypoint = function() --[[ Line: 919 ]] --[[ Name: getDisablePremiumEntrypoint ]]
            -- upvalues: v48 (ref), v57 (copy)
            if v48 then
                return v57.DisablePremiumEntrypoint or v57.DisablePremiumEntryPoint or false;
            else
                return false;
            end;
        end, 
        getDisableBlackbirdEntrypoints = function() --[[ Line: 925 ]] --[[ Name: getDisableBlackbirdEntrypoints ]]
            -- upvalues: v49 (ref), v57 (copy)
            if v49 then
                return v57.DisableBlackbirdEntrypoints or false;
            else
                return false;
            end;
        end, 
        getEnableGiftcardsWithRedeem = function() --[[ Line: 931 ]] --[[ Name: getEnableGiftcardsWithRedeem ]]
            -- upvalues: v50 (ref), v57 (copy)
            if v50 then
                return v57.EnableGiftcardsWithRedeem or false;
            else
                return false;
            end;
        end, 
        getGiftCardSourceRefOverride = function() --[[ Line: 937 ]] --[[ Name: getGiftCardSourceRefOverride ]]
            -- upvalues: v57 (copy)
            return v57.GiftCardSourceRefOverride or "";
        end, 
        getSignupCheckboxDisabled = function() --[[ Line: 940 ]] --[[ Name: getSignupCheckboxDisabled ]]
            -- upvalues: v47 (ref), v57 (copy)
            if v47 then
                return v57.DisableSignupCheckbox or false;
            else
                return false;
            end;
        end, 
        getExcludeCrossDeviceSignIn = function() --[[ Line: 947 ]] --[[ Name: getExcludeCrossDeviceSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v57 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v57.ExcludeCrossDeviceSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePasskeyLogin = function() --[[ Line: 953 ]] --[[ Name: getExcludePasskeyLogin ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v57 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v57.ExcludePasskeyLogin or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernamePasswordSignIn = function() --[[ Line: 960 ]] --[[ Name: getExcludeUsernamePasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v57 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v57.ExcludeUsernamePasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeEmailPasswordSignIn = function() --[[ Line: 966 ]] --[[ Name: getExcludeEmailPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v57 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v57.ExcludeEmailPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePhoneNumberPasswordSignIn = function() --[[ Line: 972 ]] --[[ Name: getExcludePhoneNumberPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v57 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v57.ExcludePhoneNumberPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeAccountSwitcher = function() --[[ Line: 978 ]] --[[ Name: getExcludeAccountSwitcher ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v57 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v57.ExcludeAccountSwitcher or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernameUpdateModeration = function() --[[ Line: 984 ]] --[[ Name: getExcludeUsernameUpdateModeration ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v57 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v57.ExcludeUsernameUpdateModeration or false;
            else
                return false;
            end;
        end, 
        getMorePageExitButtonEnabled = l_FFlagEnableMorePageExitButtonSupport_0 and function() --[[ Line: 991 ]]
            -- upvalues: v57 (copy)
            return v57.MorePageExitButtonEnabled or false;
        end or nil, 
        getMoreGridDirectionalLayoutPreferred = l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 and function() --[[ Line: 996 ]]
            -- upvalues: v57 (copy)
            return v57.MoreGridDirectionalLayoutPreferred or false;
        end or nil, 
        getShouldUseDMCCALegalDisclosureInApp = function() --[[ Line: 1000 ]] --[[ Name: getShouldUseDMCCALegalDisclosureInApp ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v57 (copy)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                return v57.ShouldUseDMCCALegalDisclosureInApp or false;
            else
                return false;
            end;
        end, 
        getCanAccessParty = function() --[[ Line: 1006 ]] --[[ Name: getCanAccessParty ]]
            -- upvalues: v57 (copy)
            if v57.CanAccessParty == nil then
                return true;
            else
                return v57.CanAccessParty;
            end;
        end, 
        getRedeemTileEnabled = function() --[[ Line: 1012 ]] --[[ Name: getRedeemTileEnabled ]]
            -- upvalues: v57 (copy)
            return v57.RedeemTileEnabled or false;
        end, 
        getShouldUseVibrationInsteadOfHaptics = function() --[[ Line: 1015 ]] --[[ Name: getShouldUseVibrationInsteadOfHaptics ]]
            -- upvalues: v57 (copy)
            return v57.ShouldUseVibrationInsteadOfHaptics or false;
        end
    };
end;