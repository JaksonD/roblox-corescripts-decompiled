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
game:DefineFastFlag("BehaviorCollectionControlEnabled", false);
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false);
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v8.GetFFlagNotificationsComplianceShouldRestrictStream;
return function(v59) --[[ Line: 76 ]] --[[ Name: AppFeaturePolicies ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v39 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_FFlagAppIaScrollAwayGuac_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GuiService_0 (copy), l_isRunningInStudio_0 (copy), v40 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), l_GetFFlagUseVoiceExitBetaLanguage_0 (copy), l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (copy), l_GetFFlagExpChatGuacChatDisabledReason_0 (copy), l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (copy), l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (copy), l_FFlagExpChatUseGuacForFOMOUpsell_0 (copy), l_FFlagExpChatUseGuacForCrossAgeChat_0 (copy), l_GetFFlagDisableCDLQrCodeForMaquettes_0 (copy), v4 (copy), v6 (copy), v41 (copy), v44 (copy), v45 (copy), v7 (copy), v42 (copy), v43 (copy), l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (copy), l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (copy), l_FFlagGuacCanRenderTransferOnProfile_0 (copy), l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy), l_UserInputService_0 (copy), l_FFlagLuaAppHomeVngAppUpsell_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), v50 (copy), l_FFlagRenameParentEmailForVerificationUpsell_0 (copy), l_FFlagEnableAndroidTvAppPolicies_0 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (copy), l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (copy), l_FFlagEnableFriendsRenamingForAll_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (copy), l_FFlagEnableScreentimeMoreTimeOption_0 (copy), v47 (copy), v48 (copy), v49 (copy), v46 (copy), l_FFlagAuthSecExclusions_0 (copy), l_FFlagEnableMorePageExitButtonSupport_0 (copy), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagSduiAppPolicyBindings_0 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy)
    local function _(v60, v61) --[[ Line: 77 ]] --[[ Name: getVRDefaultPolicy ]]
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
        getFriendFinder = function() --[[ Line: 88 ]] --[[ Name: getFriendFinder ]]
            -- upvalues: v59 (copy)
            return v59.FriendFinder or false;
        end, 
        getGameDetailsMorePage = function() --[[ Line: 91 ]] --[[ Name: getGameDetailsMorePage ]]
            -- upvalues: v59 (copy)
            return v59.GameDetailsMorePage or false;
        end, 
        getGameDetailsSubtitle = function() --[[ Line: 94 ]] --[[ Name: getGameDetailsSubtitle ]]
            -- upvalues: v59 (copy)
            return v59.GameDetailsSubtitle or false;
        end, 
        getShowGlobalCounters = function() --[[ Line: 97 ]] --[[ Name: getShowGlobalCounters ]]
            -- upvalues: v59 (copy)
            return v59.GameDetailsShowGlobalCounters or false;
        end, 
        getGameDetailsPlayWithFriends = function() --[[ Line: 100 ]] --[[ Name: getGameDetailsPlayWithFriends ]]
            -- upvalues: v59 (copy)
            return v59.GameDetailsPlayWithFriends or false;
        end, 
        getGameInfoList = function() --[[ Line: 103 ]] --[[ Name: getGameInfoList ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoList or false;
        end, 
        getGamePlaysAndRatings = function() --[[ Line: 106 ]] --[[ Name: getGamePlaysAndRatings ]]
            -- upvalues: v59 (copy)
            return v59.GamePlaysAndRatings or false;
        end, 
        getNotifications = function() --[[ Line: 109 ]] --[[ Name: getNotifications ]]
            -- upvalues: v59 (copy)
            return v59.Notifications or false;
        end, 
        getRecommendedGames = function() --[[ Line: 112 ]] --[[ Name: getRecommendedGames ]]
            -- upvalues: v39 (ref), v59 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v39 then
                return v59.RecommendedGames or false;
            elseif l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v59.RecommendedGames or false;
            end;
        end, 
        getSearchBar = function() --[[ Line: 122 ]] --[[ Name: getSearchBar ]]
            -- upvalues: v59 (copy)
            return v59.SearchBar or false;
        end, 
        getMorePageContent = function() --[[ Line: 125 ]] --[[ Name: getMorePageContent ]]
            -- upvalues: v59 (copy)
            return v59.MorePageContent;
        end, 
        getAboutPageType = function() --[[ Line: 128 ]] --[[ Name: getAboutPageType ]]
            -- upvalues: v59 (copy)
            return v59.AboutPageType or "CJVAbout";
        end, 
        getSettingsPageType = function() --[[ Line: 131 ]] --[[ Name: getSettingsPageType ]]
            -- upvalues: v59 (copy)
            return v59.SettingsPageType or "Settings";
        end, 
        getSocialLinks = function() --[[ Line: 134 ]] --[[ Name: getSocialLinks ]]
            -- upvalues: v59 (copy)
            return v59.SocialLinks or false;
        end, 
        getSocialGroupLinks = function() --[[ Line: 137 ]] --[[ Name: getSocialGroupLinks ]]
            -- upvalues: v59 (copy)
            return v59.SocialGroupLinks or false;
        end, 
        getCommunityLinksEnabled = function() --[[ Line: 140 ]] --[[ Name: getCommunityLinksEnabled ]]
            -- upvalues: v59 (copy)
            return v59.CommunityLinksEnabled or false;
        end, 
        getGameInfoShowBadges = function() --[[ Line: 143 ]] --[[ Name: getGameInfoShowBadges ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowBadges or false;
        end, 
        getGameInfoShowCreated = function() --[[ Line: 146 ]] --[[ Name: getGameInfoShowCreated ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowCreated or false;
        end, 
        getGameInfoShowGamepasses = function() --[[ Line: 149 ]] --[[ Name: getGameInfoShowGamepasses ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowGamepasses or false;
        end, 
        getGameInfoShowGenre = function() --[[ Line: 152 ]] --[[ Name: getGameInfoShowGenre ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowGenre or false;
        end, 
        getGameInfoShowSubgenre = function() --[[ Line: 155 ]] --[[ Name: getGameInfoShowSubgenre ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowSubgenre or false;
        end, 
        getGameInfoShowMaxPlayers = function() --[[ Line: 158 ]] --[[ Name: getGameInfoShowMaxPlayers ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowMaxPlayers or false;
        end, 
        getGameInfoShowServers = function() --[[ Line: 161 ]] --[[ Name: getGameInfoShowServers ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowServers or false;
        end, 
        getGameInfoShowUpdated = function() --[[ Line: 164 ]] --[[ Name: getGameInfoShowUpdated ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoShowUpdated or false;
        end, 
        getGameInfoShowAgeRecommendation = function() --[[ Line: 167 ]] --[[ Name: getGameInfoShowAgeRecommendation ]]
            -- upvalues: v59 (copy)
            if v59.GameInfoShowAgeRecommendation == nil then
                return true;
            else
                return v59.GameInfoShowAgeRecommendation;
            end;
        end, 
        getGameInfoShowVoiceAndChatFeatures = function() --[[ Line: 173 ]] --[[ Name: getGameInfoShowVoiceAndChatFeatures ]]
            -- upvalues: v59 (copy)
            if v59.GameInfoShowVoiceAndChatFeatures == nil then
                return true;
            else
                return v59.GameInfoShowVoiceAndChatFeatures;
            end;
        end, 
        getSiteMessageBanner = function() --[[ Line: 179 ]] --[[ Name: getSiteMessageBanner ]]
            -- upvalues: v59 (copy)
            return v59.SiteMessageBanner or false;
        end, 
        getAlertRateLimit = function() --[[ Line: 182 ]] --[[ Name: getAlertRateLimit ]]
            -- upvalues: v59 (copy)
            return v59.AlertRateLimit or 300;
        end, 
        getSearchAutoComplete = function() --[[ Line: 186 ]] --[[ Name: getSearchAutoComplete ]]
            -- upvalues: v59 (copy)
            return v59.SearchAutoComplete or false;
        end, 
        getShowStudioCTA = function() --[[ Line: 189 ]] --[[ Name: getShowStudioCTA ]]
            -- upvalues: v59 (copy)
            return v59.ShowStudioCTA or false;
        end, 
        getAppIaScrollAwayEnabled = l_FFlagAppIaScrollAwayGuac_0 and function() --[[ Line: 193 ]]
            -- upvalues: v59 (copy)
            return v59.AppIaScrollAwayEnabled or false;
        end or nil, 
        getUseOmniRecommendation = function() --[[ Line: 197 ]] --[[ Name: getUseOmniRecommendation ]]
            -- upvalues: v59 (copy)
            if v59.UseOmniRecommendation == nil then
                return true;
            else
                return v59.UseOmniRecommendation;
            end;
        end, 
        getUseWidthBasedFormFactorRule = function() --[[ Line: 205 ]] --[[ Name: getUseWidthBasedFormFactorRule ]]
            -- upvalues: v59 (copy)
            return v59.UseWidthBasedFormFactorRule or false;
        end, 
        getShowYouTubeAgeAlert = function() --[[ Line: 208 ]] --[[ Name: getShowYouTubeAgeAlert ]]
            -- upvalues: v59 (copy)
            if v59.ShowYouTubeAgeAlert == nil then
                return true;
            else
                return v59.ShowYouTubeAgeAlert;
            end;
        end, 
        getShowVideoThumbnails = function() --[[ Line: 214 ]] --[[ Name: getShowVideoThumbnails ]]
            -- upvalues: v59 (copy)
            return v59.ShowVideoThumbnails or false;
        end, 
        getHomeIcon = function() --[[ Line: 217 ]] --[[ Name: getHomeIcon ]]
            -- upvalues: v59 (copy)
            return v59.HomeIcon or "LuaApp/icons/ic-roblox-close";
        end, 
        getGameInfoListShowRNVDeveloper = function() --[[ Line: 220 ]] --[[ Name: getGameInfoListShowRNVDeveloper ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoListShowRNVDeveloper or false;
        end, 
        getGameInfoListDeveloper = function() --[[ Line: 223 ]] --[[ Name: getGameInfoListDeveloper ]]
            -- upvalues: v59 (copy)
            return v59.GameInfoListDeveloper or false;
        end, 
        getShowDisplayName = function() --[[ Line: 226 ]] --[[ Name: getShowDisplayName ]]
            -- upvalues: v59 (copy)
            if v59.ShowDisplayName == nil then
                return true;
            else
                return v59.ShowDisplayName;
            end;
        end, 
        getShowAlias = function() --[[ Line: 232 ]] --[[ Name: getShowAlias ]]
            -- upvalues: v59 (copy)
            if v59.ShowUserAlias == nil then
                return true;
            else
                return v59.ShowUserAlias;
            end;
        end, 
        getCatalogReportingDisabled = function() --[[ Line: 238 ]] --[[ Name: getCatalogReportingDisabled ]]
            -- upvalues: v59 (copy)
            return v59.CatalogReportingDisabled or false;
        end, 
        getGameReportingDisabled = function() --[[ Line: 241 ]] --[[ Name: getGameReportingDisabled ]]
            -- upvalues: v59 (copy)
            return v59.GameReportingDisabled or false;
        end, 
        getGamesPageCreationCenterTitle = function() --[[ Line: 244 ]] --[[ Name: getGamesPageCreationCenterTitle ]]
            -- upvalues: v59 (copy)
            return v59.GamesPageCreationCenterTitle or false;
        end, 
        shouldUseExternalBrowserForDisclaimerLinks = function() --[[ Line: 247 ]] --[[ Name: shouldUseExternalBrowserForDisclaimerLinks ]]
            -- upvalues: v59 (copy)
            return v59.UseExternalBrowserForDisclaimerLinks or false;
        end, 
        shouldUseExternalBrowserForMorePageItem = function() --[[ Line: 250 ]] --[[ Name: shouldUseExternalBrowserForMorePageItem ]]
            -- upvalues: v59 (copy)
            return v59.UseExternalBrowserForMoreLinks or false;
        end, 
        getCatalogShow3dView = function() --[[ Line: 253 ]] --[[ Name: getCatalogShow3dView ]]
            -- upvalues: v59 (copy)
            return v59.CatalogShow3dView or false;
        end, 
        getItemDetailsFullView = function() --[[ Line: 256 ]] --[[ Name: getItemDetailsFullView ]]
            -- upvalues: v59 (copy)
            return v59.ItemDetailsFullView or false;
        end, 
        getCatalogCommunityCreations = function() --[[ Line: 259 ]] --[[ Name: getCatalogCommunityCreations ]]
            -- upvalues: v59 (copy)
            return v59.CatalogCommunityCreations or false;
        end, 
        getCatalogPremiumCategory = function() --[[ Line: 262 ]] --[[ Name: getCatalogPremiumCategory ]]
            -- upvalues: v59 (copy)
            return v59.CatalogPremiumCategory or false;
        end, 
        getShowCatalogPremiumContent = function() --[[ Line: 265 ]] --[[ Name: getShowCatalogPremiumContent ]]
            -- upvalues: v59 (copy)
            return v59.CatalogPremiumContent or false;
        end, 
        getRobloxCreatedItemsCreatedByLuobu = function() --[[ Line: 268 ]] --[[ Name: getRobloxCreatedItemsCreatedByLuobu ]]
            -- upvalues: v59 (copy)
            if v59.RobloxCreatedItemsCreatedByLuobu == nil then
                return true;
            else
                return v59.RobloxCreatedItemsCreatedByLuobu;
            end;
        end, 
        getHomePageFriendSection = function() --[[ Line: 274 ]] --[[ Name: getHomePageFriendSection ]]
            -- upvalues: v59 (copy)
            return v59.HomePageFriendSection or false;
        end, 
        getHomePageProfileLink = function() --[[ Line: 277 ]] --[[ Name: getHomePageProfileLink ]]
            -- upvalues: v59 (copy)
            return v59.HomePageProfileLink or false;
        end, 
        getPurchasePromptIncludingWarning = function() --[[ Line: 280 ]] --[[ Name: getPurchasePromptIncludingWarning ]]
            -- upvalues: v59 (copy)
            if v59.PurchasePromptIncludingWarning == nil then
                return true;
            else
                return v59.PurchasePromptIncludingWarning;
            end;
        end, 
        getCheckUserAgreementsUpdatedOnLogin = function() --[[ Line: 286 ]] --[[ Name: getCheckUserAgreementsUpdatedOnLogin ]]
            -- upvalues: v59 (copy)
            if v59.CheckUserAgreementsUpdatedOnLogin == nil then
                return true;
            else
                return v59.CheckUserAgreementsUpdatedOnLogin;
            end;
        end, 
        getAddUserAgreementIdsToSignupRequest = function() --[[ Line: 292 ]] --[[ Name: getAddUserAgreementIdsToSignupRequest ]]
            -- upvalues: v59 (copy)
            return v59.AddUserAgreementIdsToSignupRequest or false;
        end, 
        RequireExplicitVoiceConsent = function() --[[ Line: 295 ]] --[[ Name: RequireExplicitVoiceConsent ]]
            -- upvalues: v59 (copy)
            return v59.RequireExplicitVoiceConsent or false;
        end, 
        getRequireExplicitAvatarVideoConsent = function() --[[ Line: 298 ]] --[[ Name: getRequireExplicitAvatarVideoConsent ]]
            -- upvalues: v59 (copy)
            return v59.RequireExplicitAvatarVideoConsent or false;
        end, 
        getShowVoiceUpsellV2 = function() --[[ Line: 301 ]] --[[ Name: getShowVoiceUpsellV2 ]]
            -- upvalues: v59 (copy)
            return v59.ShowVoiceUpsellV2 or false;
        end, 
        getShouldShowGroupsTile = function() --[[ Line: 304 ]] --[[ Name: getShouldShowGroupsTile ]]
            -- upvalues: v59 (copy)
            return v59.ShouldShowGroupsTile or false;
        end, 
        useLuobuAuthentication = function() --[[ Line: 307 ]] --[[ Name: useLuobuAuthentication ]]
            -- upvalues: v59 (copy)
            return v59.UseLuobuAuthentication or false;
        end, 
        useWechatQQAuthentication = function() --[[ Line: 310 ]] --[[ Name: useWechatQQAuthentication ]]
            -- upvalues: v59 (copy)
            return v59.UseWechatQQAuthentication or false;
        end, 
        useMSDKWebAuthentication = function() --[[ Line: 313 ]] --[[ Name: useMSDKWebAuthentication ]]
            -- upvalues: v59 (copy)
            return v59.UseMSDKWebAuthentication or false;
        end, 
        getQrFriendingEnabled = function() --[[ Line: 316 ]] --[[ Name: getQrFriendingEnabled ]]
            -- upvalues: v59 (copy)
            return v59.QrFriendingEnabled or false;
        end, 
        getShouldShowCameraPermissionInAgreementsPrompt = function() --[[ Line: 319 ]] --[[ Name: getShouldShowCameraPermissionInAgreementsPrompt ]]
            -- upvalues: v59 (copy)
            return v59.ShouldShowCameraPermissionInAgreementsPrompt or false;
        end, 
        getExperienceInviteShareLinkEnabled = function() --[[ Line: 322 ]] --[[ Name: getExperienceInviteShareLinkEnabled ]]
            -- upvalues: v59 (copy)
            return v59.ExperienceInviteShareLinkEnabled or false;
        end, 
        getCsatSurveyRestrictTextInput = function() --[[ Line: 325 ]] --[[ Name: getCsatSurveyRestrictTextInput ]]
            -- upvalues: v59 (copy)
            return v59.CsatSurveyRestrictTextInput or false;
        end, 
        useGridPageLayout = function() --[[ Line: 328 ]] --[[ Name: useGridPageLayout ]]
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
        usePhoneSearchDiscoverEntry = function() --[[ Line: 339 ]] --[[ Name: usePhoneSearchDiscoverEntry ]]
            -- upvalues: v59 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v59.UsePhoneSearchDiscoverEntry == nil then
                return not l_isSubjectToDesktopPolicies_0();
            else
                return v59.UsePhoneSearchDiscoverEntry;
            end;
        end, 
        getShouldSystemBarUsuallyBePresent = function() --[[ Line: 346 ]] --[[ Name: getShouldSystemBarUsuallyBePresent ]]
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
        getContactImporterEnabled = function() --[[ Line: 359 ]] --[[ Name: getContactImporterEnabled ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v59 (copy)
            if l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v59.ContactImporterEnabled or false;
            end;
        end, 
        getShouldShowSettingsPermissionsAdditionalInstructions = function() --[[ Line: 367 ]] --[[ Name: getShouldShowSettingsPermissionsAdditionalInstructions ]]
            -- upvalues: v59 (copy)
            return v59.shouldShowSettingsPermissionsAdditionalInstructions or false;
        end, 
        getUseVRFTUXPanel = function() --[[ Line: 371 ]] --[[ Name: getUseVRFTUXPanel ]]
            -- upvalues: v59 (copy), l_IsVRAppBuild_0 (ref)
            if v59.UseVRFTUXPanel ~= nil then
                return v59.UseVRFTUXPanel;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getWebViewSupport = function() --[[ Line: 374 ]] --[[ Name: getWebViewSupport ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v40 (ref), v59 (copy), l_IsVRAppBuild_0 (ref)
            if l_isRunningInStudio_0() then
                if v40 then
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
        getUseLuafiedReportFlow = function() --[[ Line: 385 ]] --[[ Name: getUseLuafiedReportFlow ]]
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
        getThrottleFramerate = function() --[[ Line: 394 ]] --[[ Name: getThrottleFramerate ]]
            -- upvalues: v59 (copy), l_IsVRAppBuild_0 (ref)
            if v59.ThrottleFramerate ~= nil then
                return v59.ThrottleFramerate;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseRoundedCorners = function() --[[ Line: 397 ]] --[[ Name: getUseRoundedCorners ]]
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
        getGameInfoShowChatFeatures = function() --[[ Line: 404 ]] --[[ Name: getGameInfoShowChatFeatures ]]
            -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (ref), v59 (copy)
            if l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return v59.GameInfoShowChatFeatures or false;
            else
                return false;
            end;
        end, 
        getDisplayCheckboxInVoiceConsent = function() --[[ Line: 410 ]] --[[ Name: getDisplayCheckboxInVoiceConsent ]]
            -- upvalues: l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (ref), v59 (copy)
            if l_GetFFlagSeamlessVoiceConsentToastPolicy_0() then
                return v59.DisplayCheckboxInVoiceConsent or false;
            else
                return false;
            end;
        end, 
        getExperienceChatAvailability = function() --[[ Line: 416 ]] --[[ Name: getExperienceChatAvailability ]]
            -- upvalues: l_GetFFlagExpChatGuacChatDisabledReason_0 (ref), v59 (copy)
            if l_GetFFlagExpChatGuacChatDisabledReason_0() then
                return v59.ExperienceChatAvailability or "unknown";
            else
                return "unknown";
            end;
        end, 
        getInCommsRegionBubble = function() --[[ Line: 422 ]] --[[ Name: getInCommsRegionBubble ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (ref), v59 (copy)
            if l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 then
                return v59.InCommsRegionBubble or false;
            else
                return false;
            end;
        end, 
        getShowInExpFAEUpsell = function() --[[ Line: 428 ]] --[[ Name: getShowInExpFAEUpsell ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (ref), v59 (copy)
            if l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 then
                return v59.ShowInExpFAEUpsell or false;
            else
                return false;
            end;
        end, 
        getShowFOMOUpsell = function() --[[ Line: 434 ]] --[[ Name: getShowFOMOUpsell ]]
            -- upvalues: l_FFlagExpChatUseGuacForFOMOUpsell_0 (ref), v59 (copy)
            if l_FFlagExpChatUseGuacForFOMOUpsell_0 then
                return v59.ShowFOMOUpsell or false;
            else
                return false;
            end;
        end, 
        getShowCrossAgeChat = function() --[[ Line: 441 ]] --[[ Name: getShowCrossAgeChat ]]
            -- upvalues: l_FFlagExpChatUseGuacForCrossAgeChat_0 (ref), v59 (copy)
            if l_FFlagExpChatUseGuacForCrossAgeChat_0 then
                return v59.ShowCrossAgeExpChat or false;
            else
                return false;
            end;
        end, 
        getAllowCameraMovements = function() --[[ Line: 448 ]] --[[ Name: getAllowCameraMovements ]]
            -- upvalues: v59 (copy), l_IsVRAppBuild_0 (ref)
            if v59.AllowCameraMovements ~= nil then
                return v59.AllowCameraMovements;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getShouldSkipAvatarLandingPage = function() --[[ Line: 451 ]] --[[ Name: getShouldSkipAvatarLandingPage ]]
            -- upvalues: v59 (copy), l_IsVRAppBuild_0 (ref)
            if v59.ShouldSkipAvatarLandingPage ~= nil then
                return v59.ShouldSkipAvatarLandingPage;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getShowPassesOnExperienceDetails = function() --[[ Line: 454 ]] --[[ Name: getShowPassesOnExperienceDetails ]]
            -- upvalues: v59 (copy)
            return v59.ShowPassesOnExperienceDetails or false;
        end, 
        getDisableCDLQrCodeForMaquettes = function() --[[ Line: 457 ]] --[[ Name: getDisableCDLQrCodeForMaquettes ]]
            -- upvalues: l_GetFFlagDisableCDLQrCodeForMaquettes_0 (ref), v59 (copy)
            if l_GetFFlagDisableCDLQrCodeForMaquettes_0() then
                return v59.DisableCDLQrCodeForMaquettes;
            else
                return false;
            end;
        end, 
        getDisableIAPEntryPoint = function() --[[ Line: 464 ]] --[[ Name: getDisableIAPEntryPoint ]]
            -- upvalues: v59 (copy)
            return v59.DisableIAPEntryPoint or false;
        end, 
        getEnforceAgeRestrictedLogin = function() --[[ Line: 467 ]] --[[ Name: getEnforceAgeRestrictedLogin ]]
            -- upvalues: v59 (copy)
            return v59.EnforceAgeRestrictedLogin or false;
        end, 
        getUrlAuthRoutes = function() --[[ Line: 470 ]] --[[ Name: getUrlAuthRoutes ]]
            -- upvalues: v59 (copy)
            local v63 = v59.Routes or {};
            if v63 then
                return v63.auth or {};
            else
                return {};
            end;
        end, 
        getShowDisconnectButton = function() --[[ Line: 479 ]] --[[ Name: getShowDisconnectButton ]]
            -- upvalues: v59 (copy)
            return v59.ShowDisconnectButton or false;
        end, 
        getUseSingleSignOn = function() --[[ Line: 482 ]] --[[ Name: getUseSingleSignOn ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v59 (copy)
            if l_isRunningInStudio_0() then
                return false;
            else
                return v59.UseSingleSignOn or false;
            end;
        end, 
        getGridCarouselSeeAllTilesEnabled = function() --[[ Line: 489 ]] --[[ Name: getGridCarouselSeeAllTilesEnabled ]]
            -- upvalues: v59 (copy)
            return v59.UseGridCarouselSeeAllTiles or false;
        end, 
        getSearchWithoutNavigatingEnabled = function() --[[ Line: 492 ]] --[[ Name: getSearchWithoutNavigatingEnabled ]]
            -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref), v59 (copy)
            if l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
                return false;
            else
                return v59.SingleSearchPageNoNavigation or false;
            end;
        end, 
        getGameListCategoryScrollListEnabled = function() --[[ Line: 498 ]] --[[ Name: getGameListCategoryScrollListEnabled ]]
            -- upvalues: v59 (copy)
            return v59.GetGamesListCategoryTabs or false;
        end, 
        getForceTheme = function() --[[ Line: 501 ]] --[[ Name: getForceTheme ]]
            -- upvalues: v4 (ref), v6 (ref), v59 (copy)
            local v65 = v4.List.map(v6, function(v64) --[[ Line: 502 ]]
                return v64:lower();
            end);
            if v59.ForceTheme and v4.List.find(v65, v59.ForceTheme:lower()) then
                return v59.ForceTheme;
            else
                return nil;
            end;
        end, 
        enableExperienceDetailsPanel = function() --[[ Line: 511 ]] --[[ Name: enableExperienceDetailsPanel ]]
            -- upvalues: v59 (copy)
            return v59.EnableExperienceDetailsPanel or false;
        end, 
        getDisableRegularLogin = function() --[[ Line: 514 ]] --[[ Name: getDisableRegularLogin ]]
            -- upvalues: v59 (copy)
            return not v59.EnableWebViewSupport and (not v59.EnableRegularLoginWithoutWebViewSupport or false);
        end, 
        getAllowPlatformAccountSwitching = function() --[[ Line: 517 ]] --[[ Name: getAllowPlatformAccountSwitching ]]
            -- upvalues: v59 (copy)
            return v59.AllowPlatformAccountSwitching or false;
        end, 
        useLegacyCrossPlayApi = function() --[[ Line: 520 ]] --[[ Name: useLegacyCrossPlayApi ]]
            -- upvalues: v41 (ref), v59 (copy)
            return v41 or v59.useLegacyCrossPlayApi or false;
        end, 
        useCrossPlaySystemUi = function() --[[ Line: 523 ]] --[[ Name: useCrossPlaySystemUi ]]
            -- upvalues: v44 (ref), v59 (copy)
            return v44 or v59.useCrossPlaySystemUi or false;
        end, 
        getCrossPlayUri = function() --[[ Line: 526 ]] --[[ Name: getCrossPlayUri ]]
            -- upvalues: v45 (ref), v59 (copy)
            if v45 ~= "" then
                return v45;
            else
                return v59.crossPlayUri or "";
            end;
        end, 
        getCrossPlayCapabilities = function() --[[ Line: 533 ]] --[[ Name: getCrossPlayCapabilities ]]
            -- upvalues: v4 (ref), v59 (copy), v7 (ref)
            return v4.List.foldLeft(v59.crossPlayCapabilities or {}, function(v66, v67) --[[ Line: 534 ]]
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
        getCrossPlaySettingsKey = function() --[[ Line: 544 ]] --[[ Name: getCrossPlaySettingsKey ]]
            -- upvalues: v42 (ref), v59 (copy)
            if v42 ~= "" then
                return v42;
            else
                return v59.crossPlaySettingsKey or "";
            end;
        end, 
        getCrossPlayQueryParam = function() --[[ Line: 551 ]] --[[ Name: getCrossPlayQueryParam ]]
            -- upvalues: v43 (ref), v59 (copy)
            if v43 ~= "" then
                return v43;
            else
                return v59.crossPlayQueryParam or "";
            end;
        end, 
        getPromotionalEmailsCheckboxEnabled = function() --[[ Line: 558 ]] --[[ Name: getPromotionalEmailsCheckboxEnabled ]]
            -- upvalues: v59 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v59.PromotionalEmailsCheckboxEnabled or false;
            else
                return false;
            end;
        end, 
        getPromotionalEmailsOptInByDefault = function() --[[ Line: 565 ]] --[[ Name: getPromotionalEmailsOptInByDefault ]]
            -- upvalues: v59 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v59.PromotionalEmailsOptInByDefault or false;
            else
                return false;
            end;
        end, 
        getSupportsOverscan = function() --[[ Line: 572 ]] --[[ Name: getSupportsOverscan ]]
            -- upvalues: v59 (copy)
            return v59.SupportsOverscan or false;
        end, 
        getPlatformDisplayName = function() --[[ Line: 575 ]] --[[ Name: getPlatformDisplayName ]]
            -- upvalues: v59 (copy)
            return v59.platformDisplayName or "";
        end, 
        getPlatformAccountName = function() --[[ Line: 578 ]] --[[ Name: getPlatformAccountName ]]
            -- upvalues: v59 (copy)
            return v59.platformAccountName or nil;
        end, 
        getSupportsProfileSwitching = function() --[[ Line: 581 ]] --[[ Name: getSupportsProfileSwitching ]]
            -- upvalues: v59 (copy)
            return v59.supportsProfileSwitching or false;
        end, 
        getMountAllOmniFeedItems = function() --[[ Line: 584 ]] --[[ Name: getMountAllOmniFeedItems ]]
            -- upvalues: v59 (copy)
            return v59.mountAllOmniFeedItems or false;
        end, 
        getFriendCodeQrCodeScannerEnabled = function() --[[ Line: 587 ]] --[[ Name: getFriendCodeQrCodeScannerEnabled ]]
            -- upvalues: v59 (copy)
            return v59.FriendCodeQrCodeScannerEnabled or false;
        end, 
        getInviteFriendsDisabled = function() --[[ Line: 590 ]] --[[ Name: getInviteFriendsDisabled ]]
            -- upvalues: v59 (copy)
            return v59.InviteFriendsDisabled or false;
        end, 
        getRealNamesInDisplayNamesEnabled = function() --[[ Line: 593 ]] --[[ Name: getRealNamesInDisplayNamesEnabled ]]
            -- upvalues: v59 (copy)
            return v59.RealNamesInDisplayNamesEnabled or false;
        end, 
        getProfileShareLinkEnabled = function() --[[ Line: 596 ]] --[[ Name: getProfileShareLinkEnabled ]]
            -- upvalues: v59 (copy)
            return v59.ProfileShareLinkEnabled;
        end, 
        getProfileCopyLinkEnabled = function() --[[ Line: 599 ]] --[[ Name: getProfileCopyLinkEnabled ]]
            -- upvalues: v59 (copy)
            return v59.ProfileCopyLinkEnabled;
        end, 
        getEnablePremiumUserFeatures = function() --[[ Line: 602 ]] --[[ Name: getEnablePremiumUserFeatures ]]
            -- upvalues: l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (ref), v59 (copy)
            if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
                return v59.EnablePremiumUserFeatures or false;
            else
                return nil;
            end;
        end, 
        getEnableDualLogin = function() --[[ Line: 608 ]] --[[ Name: getEnableDualLogin ]]
            -- upvalues: v59 (copy)
            return v59.enableDualLogin or false;
        end, 
        getUseExternalBrowserForAgeGuidelines = function() --[[ Line: 612 ]] --[[ Name: getUseExternalBrowserForAgeGuidelines ]]
            -- upvalues: l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (ref), v59 (copy)
            if l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then
                return v59.UseExternalBrowserForAgeGuidelines or false;
            else
                return nil;
            end;
        end, 
        getEnableHomePageAgeBlock = function() --[[ Line: 619 ]] --[[ Name: getEnableHomePageAgeBlock ]]
            -- upvalues: v59 (copy)
            return v59.EnableHomePageAgeBlock or false;
        end, 
        getEnableUAppAccessBlock = function() --[[ Line: 622 ]] --[[ Name: getEnableUAppAccessBlock ]]
            -- upvalues: v59 (copy)
            return v59.EnableUAppAccessBlock or false;
        end, 
        getUAppBlockPageTextMapKey = function() --[[ Line: 625 ]] --[[ Name: getUAppBlockPageTextMapKey ]]
            -- upvalues: v59 (copy)
            return v59.UAppBlockPageTextMapKey or nil;
        end, 
        getUAppBlockPageShouldDisableLogOut = function() --[[ Line: 628 ]] --[[ Name: getUAppBlockPageShouldDisableLogOut ]]
            -- upvalues: v59 (copy)
            return v59.UAppBlockPageShouldDisableLogOut or nil;
        end, 
        getContactsToastEnabled = function() --[[ Line: 631 ]] --[[ Name: getContactsToastEnabled ]]
            -- upvalues: v59 (copy)
            return v59.ContactsToastEnabled or false;
        end, 
        getEnableProfileQrCode = function() --[[ Line: 634 ]] --[[ Name: getEnableProfileQrCode ]]
            -- upvalues: v59 (copy)
            return v59.EnableProfileQrCode or false;
        end, 
        getCanRenderTransferOnProfile = function() --[[ Line: 637 ]] --[[ Name: getCanRenderTransferOnProfile ]]
            -- upvalues: l_FFlagGuacCanRenderTransferOnProfile_0 (ref), v59 (copy)
            if l_FFlagGuacCanRenderTransferOnProfile_0 then
                return v59.CanRenderTransferOnProfile or false;
            else
                return false;
            end;
        end, 
        getShowVNGLoginWithExistingAccountQuickLoginButton = function() --[[ Line: 643 ]] --[[ Name: getShowVNGLoginWithExistingAccountQuickLoginButton ]]
            -- upvalues: v59 (copy)
            return v59.ShowVNGLoginWithExistingAccountQuickLoginButton or false;
        end, 
        getShowVNGAge12Badge = function() --[[ Line: 646 ]] --[[ Name: getShowVNGAge12Badge ]]
            -- upvalues: v59 (copy)
            return v59.ShowVNGAge12Badge or false;
        end, 
        getShowBrazilContentRatingLogo = function() --[[ Line: 649 ]] --[[ Name: getShowBrazilContentRatingLogo ]]
            -- upvalues: v59 (copy)
            return v59.ShowBrazilContentRatingLogo or false;
        end, 
        getUseVNGUserAgreementPopup = function() --[[ Line: 652 ]] --[[ Name: getUseVNGUserAgreementPopup ]]
            -- upvalues: v59 (copy)
            return v59.UseVNGUserAgreementPopup or false;
        end, 
        getRedirectBuyRobuxToVNG = function() --[[ Line: 655 ]] --[[ Name: getRedirectBuyRobuxToVNG ]]
            -- upvalues: v59 (copy)
            return v59.RedirectBuyRobuxToVNG or false;
        end, 
        getShowVNGTosForRobuxUpsell = function() --[[ Line: 658 ]] --[[ Name: getShowVNGTosForRobuxUpsell ]]
            -- upvalues: v59 (copy)
            return v59.ShowVNGTosForRobuxUpsell or false;
        end, 
        getBlockVNGU12SignUpOnClientSide = function() --[[ Line: 661 ]] --[[ Name: getBlockVNGU12SignUpOnClientSide ]]
            -- upvalues: v59 (copy)
            return v59.BlockVNGU12SignUpOnClientSide or false;
        end, 
        getUseAgeInput = function() --[[ Line: 664 ]] --[[ Name: getUseAgeInput ]]
            -- upvalues: v59 (copy)
            return v59.UseAgeInput or false;
        end, 
        getLoginUsernameOnly = function() --[[ Line: 667 ]] --[[ Name: getLoginUsernameOnly ]]
            -- upvalues: v59 (copy)
            return v59.LoginUsernameOnly or false;
        end, 
        getDisableEmailOTPLogin = function() --[[ Line: 670 ]] --[[ Name: getDisableEmailOTPLogin ]]
            -- upvalues: v59 (copy)
            return v59.DisableEmailOTPLogin or false;
        end, 
        getDisableLoginForgotButton = function() --[[ Line: 673 ]] --[[ Name: getDisableLoginForgotButton ]]
            -- upvalues: v59 (copy)
            return v59.DisableLoginForgotButton or false;
        end, 
        getDisableLogOutEmailUpsell = function() --[[ Line: 676 ]] --[[ Name: getDisableLogOutEmailUpsell ]]
            -- upvalues: v59 (copy)
            return v59.DisableLogOutEmailUpsell or false;
        end, 
        getVerifiedSignupCountry = function() --[[ Line: 679 ]] --[[ Name: getVerifiedSignupCountry ]]
            -- upvalues: v59 (copy)
            return v59.verifiedSignupCountry or false;
        end, 
        getParentalConsentAgreementId = function() --[[ Line: 683 ]] --[[ Name: getParentalConsentAgreementId ]]
            -- upvalues: v59 (copy)
            return v59.parentalConsentAgreementId or "";
        end, 
        getIsStrictComplianceEnabled = function() --[[ Line: 687 ]] --[[ Name: getIsStrictComplianceEnabled ]]
            -- upvalues: v59 (copy)
            return v59.isStrictComplianceEnabled or false;
        end, 
        getUseKoreaKISAUserAgreementPopup = function() --[[ Line: 691 ]] --[[ Name: getUseKoreaKISAUserAgreementPopup ]]
            -- upvalues: v59 (copy)
            return v59.useKoreaKISAUserAgreementPopup or false;
        end, 
        getEnableNotificationPreferencesPage = function() --[[ Line: 695 ]] --[[ Name: getEnableNotificationPreferencesPage ]]
            -- upvalues: l_GetFFlagEnableGateNotificationPreferencesTab_0 (ref), v59 (copy)
            if l_GetFFlagEnableGateNotificationPreferencesTab_0() then
                return v59.EnableNotificationPreferencesPage or false;
            else
                return nil;
            end;
        end, 
        getVNGFormRequired = function() --[[ Line: 702 ]] --[[ Name: getVNGFormRequired ]]
            -- upvalues: v59 (copy)
            return v59.VNGFormRequired or false;
        end, 
        getUpsellVoiceForPhoneVerification = function() --[[ Line: 705 ]] --[[ Name: getUpsellVoiceForPhoneVerification ]]
            -- upvalues: v59 (copy)
            return v59.UpsellVoiceForPhoneVerification or false;
        end, 
        getIsLinkedVRModeAvailable = function() --[[ Line: 708 ]] --[[ Name: getIsLinkedVRModeAvailable ]]
            -- upvalues: l_UserInputService_0 (ref)
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v69 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
                v69 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
            end;
            return v69;
        end, 
        getShouldShowPhoneUpsell = function() --[[ Line: 712 ]] --[[ Name: getShouldShowPhoneUpsell ]]
            -- upvalues: v59 (copy)
            return v59.ShouldShowPhoneUpsell or false;
        end, 
        getTermsOfUseLink = function() --[[ Line: 715 ]] --[[ Name: getTermsOfUseLink ]]
            -- upvalues: v59 (copy)
            return v59.TermsOfUseLink or "";
        end, 
        getPrivacyPolicyLink = function() --[[ Line: 718 ]] --[[ Name: getPrivacyPolicyLink ]]
            -- upvalues: v59 (copy)
            return v59.PrivacyPolicyLink or "";
        end, 
        getVngAppUpsell = function() --[[ Line: 721 ]] --[[ Name: getVngAppUpsell ]]
            -- upvalues: l_FFlagLuaAppHomeVngAppUpsell_0 (ref), v59 (copy)
            if l_FFlagLuaAppHomeVngAppUpsell_0 then
                return v59.VngAppUpsell or false;
            else
                return false;
            end;
        end, 
        getShouldHideContactImporterUpsell = function() --[[ Line: 728 ]] --[[ Name: getShouldHideContactImporterUpsell ]]
            -- upvalues: v59 (copy)
            return v59.ShouldHideContactImporterUpsell or false;
        end, 
        getContactImporterEncouraged = function() --[[ Line: 731 ]] --[[ Name: getContactImporterEncouraged ]]
            -- upvalues: v59 (copy)
            return v59.contactImporterEncouraged or false;
        end, 
        getFriendRequestNicknamesEnabled = function() --[[ Line: 734 ]] --[[ Name: getFriendRequestNicknamesEnabled ]]
            -- upvalues: l_FFlagFriendRequestNicknames_0 (ref), v59 (copy)
            if l_FFlagFriendRequestNicknames_0 then
                return v59.FriendRequestNicknamesEnabled or false;
            else
                return false;
            end;
        end, 
        getShouldShowVpcPlayButtonUpsells = l_FFlagLuaAppParentUpsellPolicy_0 and function() --[[ Line: 742 ]]
            -- upvalues: v59 (copy)
            return v59.shouldShowVpcPlayButtonUpsells or false;
        end or nil, 
        getRenamePaymentsToSpendingTab = function() --[[ Line: 746 ]] --[[ Name: getRenamePaymentsToSpendingTab ]]
            -- upvalues: v59 (copy)
            return v59.renamePaymentsToSpendingTab or false;
        end, 
        getNotificationsCanReceiveStream = function() --[[ Line: 751 ]] --[[ Name: getNotificationsCanReceiveStream ]]
            -- upvalues: l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (ref), v59 (copy)
            if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
                return v59.notificationsCanAccessStream or false;
            else
                return nil;
            end;
        end, 
        getNotificationsCanReceivePush = function() --[[ Line: 758 ]] --[[ Name: getNotificationsCanReceivePush ]]
            -- upvalues: v59 (copy)
            return v59.notificationsCanAccessPush or false;
        end, 
        getPushNotificationsUpsell = function() --[[ Line: 761 ]] --[[ Name: getPushNotificationsUpsell ]]
            -- upvalues: v59 (copy)
            return v59.ShouldShowPushNotificationsUpsell or false;
        end, 
        getNotificationsCanReceiveExperience = function() --[[ Line: 764 ]] --[[ Name: getNotificationsCanReceiveExperience ]]
            -- upvalues: v59 (copy)
            if v59.notificationsCanAccessExperience == nil then
                return true;
            else
                return v59.notificationsCanAccessExperience;
            end;
        end, 
        getDisableResellingCollectiblesForCompliance = function() --[[ Line: 770 ]] --[[ Name: getDisableResellingCollectiblesForCompliance ]]
            -- upvalues: v59 (copy)
            return v59.DisableResellingCollectiblesForCompliance or false;
        end, 
        getShowIllegalContentReportingUI = function() --[[ Line: 773 ]] --[[ Name: getShowIllegalContentReportingUI ]]
            -- upvalues: v50 (ref), v59 (copy)
            return v50 or v59.ShowIllegalContentReportingUI or false;
        end, 
        getEligibleForContentPostFeed = function() --[[ Line: 776 ]] --[[ Name: getEligibleForContentPostFeed ]]
            -- upvalues: v59 (copy)
            return v59.EligibleForContentPostFeed or false;
        end, 
        getEligibleForExternalContentSharing = function() --[[ Line: 779 ]] --[[ Name: getEligibleForExternalContentSharing ]]
            -- upvalues: v59 (copy)
            return v59.EligibleForExternalContentSharing or false;
        end, 
        getEnableContinuousLoad = function() --[[ Line: 782 ]] --[[ Name: getEnableContinuousLoad ]]
            -- upvalues: v59 (copy)
            return v59.EnableContinuousLoad or false;
        end, 
        getEnableAggregateLikesFavoritesCount = function() --[[ Line: 785 ]] --[[ Name: getEnableAggregateLikesFavoritesCount ]]
            -- upvalues: v59 (copy)
            return v59.EnableAggregateLikesFavoritesCount or false;
        end, 
        getShowUpdatedCameraPath = function() --[[ Line: 788 ]] --[[ Name: getShowUpdatedCameraPath ]]
            -- upvalues: v59 (copy)
            return v59.showUpdatedCameraPath or false;
        end, 
        getRenameParentEmailForVerificationUpsell = function() --[[ Line: 791 ]] --[[ Name: getRenameParentEmailForVerificationUpsell ]]
            -- upvalues: l_FFlagRenameParentEmailForVerificationUpsell_0 (ref), v59 (copy)
            if l_FFlagRenameParentEmailForVerificationUpsell_0() then
                return v59.renameParentEmailForVerificationUpsell or false;
            else
                return false;
            end;
        end, 
        getKeystrokeCollectionEnabled = function() --[[ Line: 798 ]] --[[ Name: getKeystrokeCollectionEnabled ]]
            -- upvalues: v59 (copy)
            if game:GetFastFlag("BehaviorCollectionControlEnabled") then
                return v59.EnableKeystrokeCollection or false;
            else
                return false;
            end;
        end, 
        getCanUsePlatformChat = function() --[[ Line: 806 ]] --[[ Name: getCanUsePlatformChat ]]
            -- upvalues: v59 (copy)
            return v59.CanUsePlatformChat or false;
        end, 
        getCanSeeChatTab = function() --[[ Line: 810 ]] --[[ Name: getCanSeeChatTab ]]
            -- upvalues: v59 (copy)
            return v59.CanSeeChatTab or false;
        end, 
        getHidesGamesTab = function() --[[ Line: 815 ]] --[[ Name: getHidesGamesTab ]]
            -- upvalues: l_FFlagEnableAndroidTvAppPolicies_0 (ref), v59 (copy)
            if l_FFlagEnableAndroidTvAppPolicies_0 then
                return v59.HidesGamesTab or false;
            else
                return false;
            end;
        end, 
        getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 823 ]] --[[ Name: getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (ref), v59 (copy)
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return true;
            elseif v59.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil then
                return true;
            else
                return v59.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup;
            end;
        end, 
        getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 832 ]] --[[ Name: getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
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
        getRobuxUpsellFlowMobile = function() --[[ Line: 842 ]] --[[ Name: getRobuxUpsellFlowMobile ]]
            -- upvalues: v59 (copy)
            return v59.useMobileRobuxUpsellFlow or false;
        end, 
        getUsePaymentPlatformMicrosoftStore = function() --[[ Line: 845 ]] --[[ Name: getUsePaymentPlatformMicrosoftStore ]]
            -- upvalues: l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (ref), v59 (copy)
            if l_FFlagEnableMicrosoftStorePaymentsPlatform_0 then
                return v59.usePaymentPlatformMicrosoftStore or false;
            else
                return false;
            end;
        end, 
        getMicSettingsDirectionsLocaleKey = function() --[[ Line: 852 ]] --[[ Name: getMicSettingsDirectionsLocaleKey ]]
            -- upvalues: v59 (copy)
            return v59.micSettingsDirectionsLocaleKey or nil;
        end, 
        getMicSettingsDeeplinkDirectionsLocaleKey = function() --[[ Line: 855 ]] --[[ Name: getMicSettingsDeeplinkDirectionsLocaleKey ]]
            -- upvalues: v59 (copy)
            return v59.micSettingsDeeplinkDirectionsLocaleKey or nil;
        end, 
        getRequiresAppRestartOnMicAccessChange = function() --[[ Line: 858 ]] --[[ Name: getRequiresAppRestartOnMicAccessChange ]]
            -- upvalues: v59 (copy)
            return v59.requiresAppRestartOnMicAccessChange or false;
        end, 
        getRenameFriendsToConnections = function() --[[ Line: 861 ]] --[[ Name: getRenameFriendsToConnections ]]
            -- upvalues: l_FFlagEnableFriendsRenamingForAll_0 (ref), v59 (copy)
            if l_FFlagEnableFriendsRenamingForAll_0 then
                return true;
            else
                return v59.renameFriendsToConnections or false;
            end;
        end, 
        getShareSheetEnabled = function() --[[ Line: 867 ]] --[[ Name: getShareSheetEnabled ]]
            -- upvalues: l_FFlagTCShareLinkSenderUI_0 (ref), v59 (copy)
            if l_FFlagTCShareLinkSenderUI_0 then
                return v59.shareSheetEnabled or false;
            else
                return nil;
            end;
        end, 
        getCanAccessTrustedContacts = function() --[[ Line: 874 ]] --[[ Name: getCanAccessTrustedContacts ]]
            -- upvalues: v59 (copy)
            return v59.canAccessTrustedContacts or false;
        end, 
        getExperienceDetailsNoticeType = function() --[[ Line: 877 ]] --[[ Name: getExperienceDetailsNoticeType ]]
            -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (ref), v59 (copy)
            if l_FFlagLuaAppShowNoticeOnEdp_0 then
                return v59.experienceDetailsNoticeType or nil;
            else
                return nil;
            end;
        end, 
        getRequiresOSAFriendingEducation = function() --[[ Line: 883 ]] --[[ Name: getRequiresOSAFriendingEducation ]]
            -- upvalues: v59 (copy)
            return v59.requiresOSAFriendingEducation or false;
        end, 
        getSocialGraphSyncEnabled = function() --[[ Line: 886 ]] --[[ Name: getSocialGraphSyncEnabled ]]
            -- upvalues: v59 (copy)
            return v59.SocialGraphSyncEnabled or false;
        end, 
        getAccountDisambiguationDisabled = function() --[[ Line: 889 ]] --[[ Name: getAccountDisambiguationDisabled ]]
            -- upvalues: v59 (copy)
            return v59.AccountDisambiguationDisabled or false;
        end, 
        getHasWebViewSupportForFAE = function() --[[ Line: 892 ]] --[[ Name: getHasWebViewSupportForFAE ]]
            -- upvalues: v59 (copy)
            return v59.hasWebViewSupportForFAE or false;
        end, 
        getLinkedAuthEndpointsEnabled = function() --[[ Line: 895 ]] --[[ Name: getLinkedAuthEndpointsEnabled ]]
            -- upvalues: v59 (copy)
            return v59.LinkedAuthEndpointsEnabled or false;
        end, 
        getLinkingPlatform = function() --[[ Line: 898 ]] --[[ Name: getLinkingPlatform ]]
            -- upvalues: v59 (copy)
            return v59.LinkingPlatform or nil;
        end, 
        getUsePaymentPlatformMilkyWayStore = function() --[[ Line: 901 ]] --[[ Name: getUsePaymentPlatformMilkyWayStore ]]
            -- upvalues: l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (ref), v59 (copy)
            if l_FFlagEnableMilkyWayPaymentsPlatformV2_0 then
                return v59.usePaymentPlatformMilkyWayStore or false;
            else
                return false;
            end;
        end, 
        getScreentimeMoreTimeOptionEnabled = function() --[[ Line: 907 ]] --[[ Name: getScreentimeMoreTimeOptionEnabled ]]
            -- upvalues: l_FFlagEnableScreentimeMoreTimeOption_0 (ref), v59 (copy)
            if l_FFlagEnableScreentimeMoreTimeOption_0 then
                return v59.ScreentimeMoreTimeOptionEnabled or false;
            else
                return false;
            end;
        end, 
        getDisablePremiumEntrypoint = function() --[[ Line: 913 ]] --[[ Name: getDisablePremiumEntrypoint ]]
            -- upvalues: v47 (ref), v59 (copy)
            if v47 then
                return v59.DisablePremiumEntrypoint or v59.DisablePremiumEntryPoint or false;
            else
                return false;
            end;
        end, 
        getDisableBlackbirdEntrypoints = function() --[[ Line: 919 ]] --[[ Name: getDisableBlackbirdEntrypoints ]]
            -- upvalues: v48 (ref), v59 (copy)
            if v48 then
                return v59.DisableBlackbirdEntrypoints or false;
            else
                return false;
            end;
        end, 
        getEnableGiftcardsWithRedeem = function() --[[ Line: 925 ]] --[[ Name: getEnableGiftcardsWithRedeem ]]
            -- upvalues: v49 (ref), v59 (copy)
            if v49 then
                return v59.EnableGiftcardsWithRedeem or false;
            else
                return false;
            end;
        end, 
        getGiftCardSourceRefOverride = function() --[[ Line: 931 ]] --[[ Name: getGiftCardSourceRefOverride ]]
            -- upvalues: v59 (copy)
            return v59.GiftCardSourceRefOverride or "";
        end, 
        getSignupCheckboxDisabled = function() --[[ Line: 934 ]] --[[ Name: getSignupCheckboxDisabled ]]
            -- upvalues: v46 (ref), v59 (copy)
            if v46 then
                return v59.DisableSignupCheckbox or false;
            else
                return false;
            end;
        end, 
        getExcludeCrossDeviceSignIn = function() --[[ Line: 941 ]] --[[ Name: getExcludeCrossDeviceSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeCrossDeviceSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePasskeyLogin = function() --[[ Line: 947 ]] --[[ Name: getExcludePasskeyLogin ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludePasskeyLogin or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernamePasswordSignIn = function() --[[ Line: 954 ]] --[[ Name: getExcludeUsernamePasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeUsernamePasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeEmailPasswordSignIn = function() --[[ Line: 960 ]] --[[ Name: getExcludeEmailPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeEmailPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePhoneNumberPasswordSignIn = function() --[[ Line: 966 ]] --[[ Name: getExcludePhoneNumberPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludePhoneNumberPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeAccountSwitcher = function() --[[ Line: 972 ]] --[[ Name: getExcludeAccountSwitcher ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeAccountSwitcher or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernameUpdateModeration = function() --[[ Line: 978 ]] --[[ Name: getExcludeUsernameUpdateModeration ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v59 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v59.ExcludeUsernameUpdateModeration or false;
            else
                return false;
            end;
        end, 
        getMorePageExitButtonEnabled = l_FFlagEnableMorePageExitButtonSupport_0 and function() --[[ Line: 985 ]]
            -- upvalues: v59 (copy)
            return v59.MorePageExitButtonEnabled or false;
        end or nil, 
        getMoreGridDirectionalLayoutPreferred = l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 and function() --[[ Line: 990 ]]
            -- upvalues: v59 (copy)
            return v59.MoreGridDirectionalLayoutPreferred or false;
        end or nil, 
        getShouldUseDMCCALegalDisclosureInApp = function() --[[ Line: 994 ]] --[[ Name: getShouldUseDMCCALegalDisclosureInApp ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v59 (copy)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                return v59.ShouldUseDMCCALegalDisclosureInApp or false;
            else
                return false;
            end;
        end, 
        getCanAccessParty = function() --[[ Line: 1000 ]] --[[ Name: getCanAccessParty ]]
            -- upvalues: v59 (copy)
            if v59.CanAccessParty == nil then
                return true;
            else
                return v59.CanAccessParty;
            end;
        end, 
        getRedeemTileEnabled = function() --[[ Line: 1006 ]] --[[ Name: getRedeemTileEnabled ]]
            -- upvalues: v59 (copy)
            return v59.RedeemTileEnabled or false;
        end, 
        getShouldUseVibrationInsteadOfHaptics = function() --[[ Line: 1009 ]] --[[ Name: getShouldUseVibrationInsteadOfHaptics ]]
            -- upvalues: v59 (copy)
            return v59.ShouldUseVibrationInsteadOfHaptics or false;
        end, 
        getRawPolicy = l_FFlagSduiAppPolicyBindings_0 and function() --[[ Line: 1013 ]]
            -- upvalues: v59 (copy)
            return v59;
        end or nil, 
        getStickyShortcutBarEnabled = l_FFlagGuacStickyShortcutBarEnabled_0 and function() --[[ Line: 1018 ]]
            -- upvalues: v59 (copy)
            return v59.StickyShortcutBarEnabled or false;
        end or nil
    };
end;