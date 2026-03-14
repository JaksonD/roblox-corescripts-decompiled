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
game:DefineFastFlag("BehaviorCollectionControlEnabled", false);
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false);
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v8.GetFFlagNotificationsComplianceShouldRestrictStream;
return function(v56) --[[ Line: 72 ]] --[[ Name: AppFeaturePolicies ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v40 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_FFlagAppIaScrollAwayGuac_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GuiService_0 (copy), l_isRunningInStudio_0 (copy), v41 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), l_GetFFlagUseVoiceExitBetaLanguage_0 (copy), l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (copy), l_GetFFlagExpChatGuacChatDisabledReason_0 (copy), l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (copy), l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (copy), l_FFlagExpChatUseGuacForFOMOUpsell_0 (copy), l_FFlagExpChatUseGuacForCrossAgeChat_0 (copy), l_GetFFlagDisableCDLQrCodeForMaquettes_0 (copy), v4 (copy), v6 (copy), v42 (copy), v45 (copy), v46 (copy), v7 (copy), v43 (copy), v44 (copy), l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (copy), l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (copy), l_FFlagGuacCanRenderTransferOnProfile_0 (copy), l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy), l_UserInputService_0 (copy), l_FFlagLuaAppHomeVngAppUpsell_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), l_FFlagRenameParentEmailForVerificationUpsell_0 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (copy), l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (copy), l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (copy), l_FFlagEnableFriendsRenamingForAll_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (copy), l_FFlagEnableScreentimeMoreTimeOption_0 (copy), v48 (copy), v49 (copy), v50 (copy), v47 (copy), l_FFlagAuthSecExclusions_0 (copy), l_FFlagEnableMorePageExitButtonSupport_0 (copy), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy)
    local function _(v57, v58) --[[ Line: 73 ]] --[[ Name: getVRDefaultPolicy ]]
        -- upvalues: v56 (copy), l_IsVRAppBuild_0 (ref)
        if v56[v57] ~= nil then
            return v56[v57];
        elseif l_IsVRAppBuild_0() then
            return v58;
        else
            return not v58;
        end;
    end;
    return {
        getFriendFinder = function() --[[ Line: 84 ]] --[[ Name: getFriendFinder ]]
            -- upvalues: v56 (copy)
            return v56.FriendFinder or false;
        end, 
        getGameDetailsMorePage = function() --[[ Line: 87 ]] --[[ Name: getGameDetailsMorePage ]]
            -- upvalues: v56 (copy)
            return v56.GameDetailsMorePage or false;
        end, 
        getGameDetailsSubtitle = function() --[[ Line: 90 ]] --[[ Name: getGameDetailsSubtitle ]]
            -- upvalues: v56 (copy)
            return v56.GameDetailsSubtitle or false;
        end, 
        getShowGlobalCounters = function() --[[ Line: 93 ]] --[[ Name: getShowGlobalCounters ]]
            -- upvalues: v56 (copy)
            return v56.GameDetailsShowGlobalCounters or false;
        end, 
        getGameDetailsPlayWithFriends = function() --[[ Line: 96 ]] --[[ Name: getGameDetailsPlayWithFriends ]]
            -- upvalues: v56 (copy)
            return v56.GameDetailsPlayWithFriends or false;
        end, 
        getGameInfoList = function() --[[ Line: 99 ]] --[[ Name: getGameInfoList ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoList or false;
        end, 
        getGamePlaysAndRatings = function() --[[ Line: 102 ]] --[[ Name: getGamePlaysAndRatings ]]
            -- upvalues: v56 (copy)
            return v56.GamePlaysAndRatings or false;
        end, 
        getNotifications = function() --[[ Line: 105 ]] --[[ Name: getNotifications ]]
            -- upvalues: v56 (copy)
            return v56.Notifications or false;
        end, 
        getRecommendedGames = function() --[[ Line: 108 ]] --[[ Name: getRecommendedGames ]]
            -- upvalues: v40 (ref), v56 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v40 then
                return v56.RecommendedGames or false;
            elseif l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v56.RecommendedGames or false;
            end;
        end, 
        getSearchBar = function() --[[ Line: 118 ]] --[[ Name: getSearchBar ]]
            -- upvalues: v56 (copy)
            return v56.SearchBar or false;
        end, 
        getMorePageContent = function() --[[ Line: 121 ]] --[[ Name: getMorePageContent ]]
            -- upvalues: v56 (copy)
            return v56.MorePageContent;
        end, 
        getAboutPageType = function() --[[ Line: 124 ]] --[[ Name: getAboutPageType ]]
            -- upvalues: v56 (copy)
            return v56.AboutPageType or "CJVAbout";
        end, 
        getSettingsPageType = function() --[[ Line: 127 ]] --[[ Name: getSettingsPageType ]]
            -- upvalues: v56 (copy)
            return v56.SettingsPageType or "Settings";
        end, 
        getSocialLinks = function() --[[ Line: 130 ]] --[[ Name: getSocialLinks ]]
            -- upvalues: v56 (copy)
            return v56.SocialLinks or false;
        end, 
        getSocialGroupLinks = function() --[[ Line: 133 ]] --[[ Name: getSocialGroupLinks ]]
            -- upvalues: v56 (copy)
            return v56.SocialGroupLinks or false;
        end, 
        getCommunityLinksEnabled = function() --[[ Line: 136 ]] --[[ Name: getCommunityLinksEnabled ]]
            -- upvalues: v56 (copy)
            return v56.CommunityLinksEnabled or false;
        end, 
        getGameInfoShowBadges = function() --[[ Line: 139 ]] --[[ Name: getGameInfoShowBadges ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoShowBadges or false;
        end, 
        getGameInfoShowCreated = function() --[[ Line: 142 ]] --[[ Name: getGameInfoShowCreated ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoShowCreated or false;
        end, 
        getGameInfoShowGamepasses = function() --[[ Line: 145 ]] --[[ Name: getGameInfoShowGamepasses ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoShowGamepasses or false;
        end, 
        getGameInfoShowGenre = function() --[[ Line: 148 ]] --[[ Name: getGameInfoShowGenre ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoShowGenre or false;
        end, 
        getGameInfoShowSubgenre = function() --[[ Line: 151 ]] --[[ Name: getGameInfoShowSubgenre ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoShowSubgenre or false;
        end, 
        getGameInfoShowMaxPlayers = function() --[[ Line: 154 ]] --[[ Name: getGameInfoShowMaxPlayers ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoShowMaxPlayers or false;
        end, 
        getGameInfoShowServers = function() --[[ Line: 157 ]] --[[ Name: getGameInfoShowServers ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoShowServers or false;
        end, 
        getGameInfoShowUpdated = function() --[[ Line: 160 ]] --[[ Name: getGameInfoShowUpdated ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoShowUpdated or false;
        end, 
        getGameInfoShowAgeRecommendation = function() --[[ Line: 163 ]] --[[ Name: getGameInfoShowAgeRecommendation ]]
            -- upvalues: v56 (copy)
            if v56.GameInfoShowAgeRecommendation == nil then
                return true;
            else
                return v56.GameInfoShowAgeRecommendation;
            end;
        end, 
        getGameInfoShowVoiceAndChatFeatures = function() --[[ Line: 169 ]] --[[ Name: getGameInfoShowVoiceAndChatFeatures ]]
            -- upvalues: v56 (copy)
            if v56.GameInfoShowVoiceAndChatFeatures == nil then
                return true;
            else
                return v56.GameInfoShowVoiceAndChatFeatures;
            end;
        end, 
        getSiteMessageBanner = function() --[[ Line: 175 ]] --[[ Name: getSiteMessageBanner ]]
            -- upvalues: v56 (copy)
            return v56.SiteMessageBanner or false;
        end, 
        getAlertRateLimit = function() --[[ Line: 178 ]] --[[ Name: getAlertRateLimit ]]
            -- upvalues: v56 (copy)
            return v56.AlertRateLimit or 300;
        end, 
        getSearchAutoComplete = function() --[[ Line: 182 ]] --[[ Name: getSearchAutoComplete ]]
            -- upvalues: v56 (copy)
            return v56.SearchAutoComplete or false;
        end, 
        getShowStudioCTA = function() --[[ Line: 185 ]] --[[ Name: getShowStudioCTA ]]
            -- upvalues: v56 (copy)
            return v56.ShowStudioCTA or false;
        end, 
        getAppIaScrollAwayEnabled = l_FFlagAppIaScrollAwayGuac_0 and function() --[[ Line: 189 ]]
            -- upvalues: v56 (copy)
            return v56.AppIaScrollAwayEnabled or false;
        end or nil, 
        getUseOmniRecommendation = function() --[[ Line: 193 ]] --[[ Name: getUseOmniRecommendation ]]
            -- upvalues: v56 (copy)
            if v56.UseOmniRecommendation == nil then
                return true;
            else
                return v56.UseOmniRecommendation;
            end;
        end, 
        getUseWidthBasedFormFactorRule = function() --[[ Line: 201 ]] --[[ Name: getUseWidthBasedFormFactorRule ]]
            -- upvalues: v56 (copy)
            return v56.UseWidthBasedFormFactorRule or false;
        end, 
        getShowYouTubeAgeAlert = function() --[[ Line: 204 ]] --[[ Name: getShowYouTubeAgeAlert ]]
            -- upvalues: v56 (copy)
            if v56.ShowYouTubeAgeAlert == nil then
                return true;
            else
                return v56.ShowYouTubeAgeAlert;
            end;
        end, 
        getShowVideoThumbnails = function() --[[ Line: 210 ]] --[[ Name: getShowVideoThumbnails ]]
            -- upvalues: v56 (copy)
            return v56.ShowVideoThumbnails or false;
        end, 
        getHomeIcon = function() --[[ Line: 213 ]] --[[ Name: getHomeIcon ]]
            -- upvalues: v56 (copy)
            return v56.HomeIcon or "LuaApp/icons/ic-roblox-close";
        end, 
        getGameInfoListShowRNVDeveloper = function() --[[ Line: 216 ]] --[[ Name: getGameInfoListShowRNVDeveloper ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoListShowRNVDeveloper or false;
        end, 
        getGameInfoListDeveloper = function() --[[ Line: 219 ]] --[[ Name: getGameInfoListDeveloper ]]
            -- upvalues: v56 (copy)
            return v56.GameInfoListDeveloper or false;
        end, 
        getShowDisplayName = function() --[[ Line: 222 ]] --[[ Name: getShowDisplayName ]]
            -- upvalues: v56 (copy)
            if v56.ShowDisplayName == nil then
                return true;
            else
                return v56.ShowDisplayName;
            end;
        end, 
        getShowAlias = function() --[[ Line: 228 ]] --[[ Name: getShowAlias ]]
            -- upvalues: v56 (copy)
            if v56.ShowUserAlias == nil then
                return true;
            else
                return v56.ShowUserAlias;
            end;
        end, 
        getCatalogReportingDisabled = function() --[[ Line: 234 ]] --[[ Name: getCatalogReportingDisabled ]]
            -- upvalues: v56 (copy)
            return v56.CatalogReportingDisabled or false;
        end, 
        getGameReportingDisabled = function() --[[ Line: 237 ]] --[[ Name: getGameReportingDisabled ]]
            -- upvalues: v56 (copy)
            return v56.GameReportingDisabled or false;
        end, 
        getGamesPageCreationCenterTitle = function() --[[ Line: 240 ]] --[[ Name: getGamesPageCreationCenterTitle ]]
            -- upvalues: v56 (copy)
            return v56.GamesPageCreationCenterTitle or false;
        end, 
        shouldUseExternalBrowserForDisclaimerLinks = function() --[[ Line: 243 ]] --[[ Name: shouldUseExternalBrowserForDisclaimerLinks ]]
            -- upvalues: v56 (copy)
            return v56.UseExternalBrowserForDisclaimerLinks or false;
        end, 
        shouldUseExternalBrowserForMorePageItem = function() --[[ Line: 246 ]] --[[ Name: shouldUseExternalBrowserForMorePageItem ]]
            -- upvalues: v56 (copy)
            return v56.UseExternalBrowserForMoreLinks or false;
        end, 
        getCatalogShow3dView = function() --[[ Line: 249 ]] --[[ Name: getCatalogShow3dView ]]
            -- upvalues: v56 (copy)
            return v56.CatalogShow3dView or false;
        end, 
        getItemDetailsFullView = function() --[[ Line: 252 ]] --[[ Name: getItemDetailsFullView ]]
            -- upvalues: v56 (copy)
            return v56.ItemDetailsFullView or false;
        end, 
        getCatalogCommunityCreations = function() --[[ Line: 255 ]] --[[ Name: getCatalogCommunityCreations ]]
            -- upvalues: v56 (copy)
            return v56.CatalogCommunityCreations or false;
        end, 
        getCatalogPremiumCategory = function() --[[ Line: 258 ]] --[[ Name: getCatalogPremiumCategory ]]
            -- upvalues: v56 (copy)
            return v56.CatalogPremiumCategory or false;
        end, 
        getShowCatalogPremiumContent = function() --[[ Line: 261 ]] --[[ Name: getShowCatalogPremiumContent ]]
            -- upvalues: v56 (copy)
            return v56.CatalogPremiumContent or false;
        end, 
        getRobloxCreatedItemsCreatedByLuobu = function() --[[ Line: 264 ]] --[[ Name: getRobloxCreatedItemsCreatedByLuobu ]]
            -- upvalues: v56 (copy)
            if v56.RobloxCreatedItemsCreatedByLuobu == nil then
                return true;
            else
                return v56.RobloxCreatedItemsCreatedByLuobu;
            end;
        end, 
        getHomePageFriendSection = function() --[[ Line: 270 ]] --[[ Name: getHomePageFriendSection ]]
            -- upvalues: v56 (copy)
            return v56.HomePageFriendSection or false;
        end, 
        getHomePageProfileLink = function() --[[ Line: 273 ]] --[[ Name: getHomePageProfileLink ]]
            -- upvalues: v56 (copy)
            return v56.HomePageProfileLink or false;
        end, 
        getPurchasePromptIncludingWarning = function() --[[ Line: 276 ]] --[[ Name: getPurchasePromptIncludingWarning ]]
            -- upvalues: v56 (copy)
            if v56.PurchasePromptIncludingWarning == nil then
                return true;
            else
                return v56.PurchasePromptIncludingWarning;
            end;
        end, 
        getCheckUserAgreementsUpdatedOnLogin = function() --[[ Line: 282 ]] --[[ Name: getCheckUserAgreementsUpdatedOnLogin ]]
            -- upvalues: v56 (copy)
            if v56.CheckUserAgreementsUpdatedOnLogin == nil then
                return true;
            else
                return v56.CheckUserAgreementsUpdatedOnLogin;
            end;
        end, 
        getAddUserAgreementIdsToSignupRequest = function() --[[ Line: 288 ]] --[[ Name: getAddUserAgreementIdsToSignupRequest ]]
            -- upvalues: v56 (copy)
            return v56.AddUserAgreementIdsToSignupRequest or false;
        end, 
        RequireExplicitVoiceConsent = function() --[[ Line: 291 ]] --[[ Name: RequireExplicitVoiceConsent ]]
            -- upvalues: v56 (copy)
            return v56.RequireExplicitVoiceConsent or false;
        end, 
        getRequireExplicitAvatarVideoConsent = function() --[[ Line: 294 ]] --[[ Name: getRequireExplicitAvatarVideoConsent ]]
            -- upvalues: v56 (copy)
            return v56.RequireExplicitAvatarVideoConsent or false;
        end, 
        getShowVoiceUpsellV2 = function() --[[ Line: 297 ]] --[[ Name: getShowVoiceUpsellV2 ]]
            -- upvalues: v56 (copy)
            return v56.ShowVoiceUpsellV2 or false;
        end, 
        getShouldShowGroupsTile = function() --[[ Line: 300 ]] --[[ Name: getShouldShowGroupsTile ]]
            -- upvalues: v56 (copy)
            return v56.ShouldShowGroupsTile or false;
        end, 
        useLuobuAuthentication = function() --[[ Line: 303 ]] --[[ Name: useLuobuAuthentication ]]
            -- upvalues: v56 (copy)
            return v56.UseLuobuAuthentication or false;
        end, 
        useWechatQQAuthentication = function() --[[ Line: 306 ]] --[[ Name: useWechatQQAuthentication ]]
            -- upvalues: v56 (copy)
            return v56.UseWechatQQAuthentication or false;
        end, 
        useMSDKWebAuthentication = function() --[[ Line: 309 ]] --[[ Name: useMSDKWebAuthentication ]]
            -- upvalues: v56 (copy)
            return v56.UseMSDKWebAuthentication or false;
        end, 
        getQrFriendingEnabled = function() --[[ Line: 312 ]] --[[ Name: getQrFriendingEnabled ]]
            -- upvalues: v56 (copy)
            return v56.QrFriendingEnabled or false;
        end, 
        getShouldShowCameraPermissionInAgreementsPrompt = function() --[[ Line: 315 ]] --[[ Name: getShouldShowCameraPermissionInAgreementsPrompt ]]
            -- upvalues: v56 (copy)
            return v56.ShouldShowCameraPermissionInAgreementsPrompt or false;
        end, 
        getExperienceInviteShareLinkEnabled = function() --[[ Line: 318 ]] --[[ Name: getExperienceInviteShareLinkEnabled ]]
            -- upvalues: v56 (copy)
            return v56.ExperienceInviteShareLinkEnabled or false;
        end, 
        getCsatSurveyRestrictTextInput = function() --[[ Line: 321 ]] --[[ Name: getCsatSurveyRestrictTextInput ]]
            -- upvalues: v56 (copy)
            return v56.CsatSurveyRestrictTextInput or false;
        end, 
        useGridPageLayout = function() --[[ Line: 324 ]] --[[ Name: useGridPageLayout ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v56 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if l_IsVRAppBuild_0() then
                if v56.UseGridPageLayout ~= nil then
                    return v56.UseGridPageLayout;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif v56.UseGridPageLayout == nil then
                return l_isSubjectToDesktopPolicies_0();
            else
                return v56.UseGridPageLayout;
            end;
        end, 
        usePhoneSearchDiscoverEntry = function() --[[ Line: 335 ]] --[[ Name: usePhoneSearchDiscoverEntry ]]
            -- upvalues: v56 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v56.UsePhoneSearchDiscoverEntry == nil then
                return not l_isSubjectToDesktopPolicies_0();
            else
                return v56.UsePhoneSearchDiscoverEntry;
            end;
        end, 
        getShouldSystemBarUsuallyBePresent = function() --[[ Line: 342 ]] --[[ Name: getShouldSystemBarUsuallyBePresent ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v56 (copy), l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref)
            if l_IsVRAppBuild_0() then
                if v56.ShouldSystemBarUsuallyBePresentForVR ~= nil then
                    return v56.ShouldSystemBarUsuallyBePresentForVR;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
                return true;
            else
                return v56.ShouldSystemBarUsuallyBePresent or false;
            end;
        end, 
        getContactImporterEnabled = function() --[[ Line: 355 ]] --[[ Name: getContactImporterEnabled ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v56 (copy)
            if l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v56.ContactImporterEnabled or false;
            end;
        end, 
        getShouldShowSettingsPermissionsAdditionalInstructions = function() --[[ Line: 363 ]] --[[ Name: getShouldShowSettingsPermissionsAdditionalInstructions ]]
            -- upvalues: v56 (copy)
            return v56.shouldShowSettingsPermissionsAdditionalInstructions or false;
        end, 
        getUseVRFTUXPanel = function() --[[ Line: 367 ]] --[[ Name: getUseVRFTUXPanel ]]
            -- upvalues: v56 (copy), l_IsVRAppBuild_0 (ref)
            if v56.UseVRFTUXPanel ~= nil then
                return v56.UseVRFTUXPanel;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getWebViewSupport = function() --[[ Line: 370 ]] --[[ Name: getWebViewSupport ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v41 (ref), v56 (copy), l_IsVRAppBuild_0 (ref)
            if l_isRunningInStudio_0() then
                if v41 then
                    return false;
                else
                    return true;
                end;
            elseif v56.EnableWebViewSupport ~= nil then
                return v56.EnableWebViewSupport;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseLuafiedReportFlow = function() --[[ Line: 381 ]] --[[ Name: getUseLuafiedReportFlow ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), l_GetFFlagLuafiedReportEntryPoints_0 (ref), v56 (copy), l_GetFFlagEnableAbuseReport10ft_0 (ref)
            if l_IsVRAppBuild_0() and l_GetFFlagLuafiedReportEntryPoints_0() then
                if v56.UseLuafiedReportFlow ~= nil then
                    return v56.UseLuafiedReportFlow;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif l_GetFFlagEnableAbuseReport10ft_0() then
                return v56.UseLuafiedReportFlow or false;
            else
                return nil;
            end;
        end, 
        getThrottleFramerate = function() --[[ Line: 390 ]] --[[ Name: getThrottleFramerate ]]
            -- upvalues: v56 (copy), l_IsVRAppBuild_0 (ref)
            if v56.ThrottleFramerate ~= nil then
                return v56.ThrottleFramerate;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseRoundedCorners = function() --[[ Line: 393 ]] --[[ Name: getUseRoundedCorners ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v56 (copy)
            if l_IsVRAppBuild_0() then
                if v56.UseRoundedCorners ~= nil then
                    return v56.UseRoundedCorners;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            else
                return false;
            end;
        end, 
        getGameInfoShowChatFeatures = function() --[[ Line: 400 ]] --[[ Name: getGameInfoShowChatFeatures ]]
            -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (ref), v56 (copy)
            if l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return v56.GameInfoShowChatFeatures or false;
            else
                return false;
            end;
        end, 
        getDisplayCheckboxInVoiceConsent = function() --[[ Line: 406 ]] --[[ Name: getDisplayCheckboxInVoiceConsent ]]
            -- upvalues: l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (ref), v56 (copy)
            if l_GetFFlagSeamlessVoiceConsentToastPolicy_0() then
                return v56.DisplayCheckboxInVoiceConsent or false;
            else
                return false;
            end;
        end, 
        getExperienceChatAvailability = function() --[[ Line: 412 ]] --[[ Name: getExperienceChatAvailability ]]
            -- upvalues: l_GetFFlagExpChatGuacChatDisabledReason_0 (ref), v56 (copy)
            if l_GetFFlagExpChatGuacChatDisabledReason_0() then
                return v56.ExperienceChatAvailability or "unknown";
            else
                return "unknown";
            end;
        end, 
        getInCommsRegionBubble = function() --[[ Line: 418 ]] --[[ Name: getInCommsRegionBubble ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (ref), v56 (copy)
            if l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 then
                return v56.InCommsRegionBubble or false;
            else
                return false;
            end;
        end, 
        getShowInExpFAEUpsell = function() --[[ Line: 424 ]] --[[ Name: getShowInExpFAEUpsell ]]
            -- upvalues: l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (ref), v56 (copy)
            if l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 then
                return v56.ShowInExpFAEUpsell or false;
            else
                return false;
            end;
        end, 
        getShowFOMOUpsell = function() --[[ Line: 430 ]] --[[ Name: getShowFOMOUpsell ]]
            -- upvalues: l_FFlagExpChatUseGuacForFOMOUpsell_0 (ref), v56 (copy)
            if l_FFlagExpChatUseGuacForFOMOUpsell_0 then
                return v56.ShowFOMOUpsell or false;
            else
                return false;
            end;
        end, 
        getShowCrossAgeChat = function() --[[ Line: 437 ]] --[[ Name: getShowCrossAgeChat ]]
            -- upvalues: l_FFlagExpChatUseGuacForCrossAgeChat_0 (ref), v56 (copy)
            if l_FFlagExpChatUseGuacForCrossAgeChat_0 then
                return v56.ShowCrossAgeExpChat or false;
            else
                return false;
            end;
        end, 
        getAllowCameraMovements = function() --[[ Line: 444 ]] --[[ Name: getAllowCameraMovements ]]
            -- upvalues: v56 (copy), l_IsVRAppBuild_0 (ref)
            if v56.AllowCameraMovements ~= nil then
                return v56.AllowCameraMovements;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getShouldSkipAvatarLandingPage = function() --[[ Line: 447 ]] --[[ Name: getShouldSkipAvatarLandingPage ]]
            -- upvalues: v56 (copy), l_IsVRAppBuild_0 (ref)
            if v56.ShouldSkipAvatarLandingPage ~= nil then
                return v56.ShouldSkipAvatarLandingPage;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getShowPassesOnExperienceDetails = function() --[[ Line: 450 ]] --[[ Name: getShowPassesOnExperienceDetails ]]
            -- upvalues: v56 (copy)
            return v56.ShowPassesOnExperienceDetails or false;
        end, 
        getDisableCDLQrCodeForMaquettes = function() --[[ Line: 453 ]] --[[ Name: getDisableCDLQrCodeForMaquettes ]]
            -- upvalues: l_GetFFlagDisableCDLQrCodeForMaquettes_0 (ref), v56 (copy)
            if l_GetFFlagDisableCDLQrCodeForMaquettes_0() then
                return v56.DisableCDLQrCodeForMaquettes;
            else
                return false;
            end;
        end, 
        getDisableIAPEntryPoint = function() --[[ Line: 460 ]] --[[ Name: getDisableIAPEntryPoint ]]
            -- upvalues: v56 (copy)
            return v56.DisableIAPEntryPoint or false;
        end, 
        getEnforceAgeRestrictedLogin = function() --[[ Line: 463 ]] --[[ Name: getEnforceAgeRestrictedLogin ]]
            -- upvalues: v56 (copy)
            return v56.EnforceAgeRestrictedLogin or false;
        end, 
        getUrlAuthRoutes = function() --[[ Line: 466 ]] --[[ Name: getUrlAuthRoutes ]]
            -- upvalues: v56 (copy)
            local v60 = v56.Routes or {};
            if v60 then
                return v60.auth or {};
            else
                return {};
            end;
        end, 
        getShowDisconnectButton = function() --[[ Line: 475 ]] --[[ Name: getShowDisconnectButton ]]
            -- upvalues: v56 (copy)
            return v56.ShowDisconnectButton or false;
        end, 
        getUseSingleSignOn = function() --[[ Line: 478 ]] --[[ Name: getUseSingleSignOn ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v56 (copy)
            if l_isRunningInStudio_0() then
                return false;
            else
                return v56.UseSingleSignOn or false;
            end;
        end, 
        getGridCarouselSeeAllTilesEnabled = function() --[[ Line: 485 ]] --[[ Name: getGridCarouselSeeAllTilesEnabled ]]
            -- upvalues: v56 (copy)
            return v56.UseGridCarouselSeeAllTiles or false;
        end, 
        getSearchWithoutNavigatingEnabled = function() --[[ Line: 488 ]] --[[ Name: getSearchWithoutNavigatingEnabled ]]
            -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref), v56 (copy)
            if l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
                return false;
            else
                return v56.SingleSearchPageNoNavigation or false;
            end;
        end, 
        getGameListCategoryScrollListEnabled = function() --[[ Line: 494 ]] --[[ Name: getGameListCategoryScrollListEnabled ]]
            -- upvalues: v56 (copy)
            return v56.GetGamesListCategoryTabs or false;
        end, 
        getForceTheme = function() --[[ Line: 497 ]] --[[ Name: getForceTheme ]]
            -- upvalues: v4 (ref), v6 (ref), v56 (copy)
            local v62 = v4.List.map(v6, function(v61) --[[ Line: 498 ]]
                return v61:lower();
            end);
            if v56.ForceTheme and v4.List.find(v62, v56.ForceTheme:lower()) then
                return v56.ForceTheme;
            else
                return nil;
            end;
        end, 
        enableExperienceDetailsPanel = function() --[[ Line: 507 ]] --[[ Name: enableExperienceDetailsPanel ]]
            -- upvalues: v56 (copy)
            return v56.EnableExperienceDetailsPanel or false;
        end, 
        getDisableRegularLogin = function() --[[ Line: 510 ]] --[[ Name: getDisableRegularLogin ]]
            -- upvalues: v56 (copy)
            return not v56.EnableWebViewSupport and (not v56.EnableRegularLoginWithoutWebViewSupport or false);
        end, 
        getAllowPlatformAccountSwitching = function() --[[ Line: 513 ]] --[[ Name: getAllowPlatformAccountSwitching ]]
            -- upvalues: v56 (copy)
            return v56.AllowPlatformAccountSwitching or false;
        end, 
        useLegacyCrossPlayApi = function() --[[ Line: 516 ]] --[[ Name: useLegacyCrossPlayApi ]]
            -- upvalues: v42 (ref), v56 (copy)
            return v42 or v56.useLegacyCrossPlayApi or false;
        end, 
        useCrossPlaySystemUi = function() --[[ Line: 519 ]] --[[ Name: useCrossPlaySystemUi ]]
            -- upvalues: v45 (ref), v56 (copy)
            return v45 or v56.useCrossPlaySystemUi or false;
        end, 
        getCrossPlayUri = function() --[[ Line: 522 ]] --[[ Name: getCrossPlayUri ]]
            -- upvalues: v46 (ref), v56 (copy)
            if v46 ~= "" then
                return v46;
            else
                return v56.crossPlayUri or "";
            end;
        end, 
        getCrossPlayCapabilities = function() --[[ Line: 529 ]] --[[ Name: getCrossPlayCapabilities ]]
            -- upvalues: v4 (ref), v56 (copy), v7 (ref)
            return v4.List.foldLeft(v56.crossPlayCapabilities or {}, function(v63, v64) --[[ Line: 530 ]]
                -- upvalues: v4 (ref), v7 (ref)
                if v4.List.find(v63, v64) then
                    return v63;
                else
                    return v4.List.join(v63, {
                        v7[v64]
                    });
                end;
            end, {});
        end, 
        getCrossPlaySettingsKey = function() --[[ Line: 540 ]] --[[ Name: getCrossPlaySettingsKey ]]
            -- upvalues: v43 (ref), v56 (copy)
            if v43 ~= "" then
                return v43;
            else
                return v56.crossPlaySettingsKey or "";
            end;
        end, 
        getCrossPlayQueryParam = function() --[[ Line: 547 ]] --[[ Name: getCrossPlayQueryParam ]]
            -- upvalues: v44 (ref), v56 (copy)
            if v44 ~= "" then
                return v44;
            else
                return v56.crossPlayQueryParam or "";
            end;
        end, 
        getPromotionalEmailsCheckboxEnabled = function() --[[ Line: 554 ]] --[[ Name: getPromotionalEmailsCheckboxEnabled ]]
            -- upvalues: v56 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v56.PromotionalEmailsCheckboxEnabled or false;
            else
                return false;
            end;
        end, 
        getPromotionalEmailsOptInByDefault = function() --[[ Line: 561 ]] --[[ Name: getPromotionalEmailsOptInByDefault ]]
            -- upvalues: v56 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v56.PromotionalEmailsOptInByDefault or false;
            else
                return false;
            end;
        end, 
        getSupportsOverscan = function() --[[ Line: 568 ]] --[[ Name: getSupportsOverscan ]]
            -- upvalues: v56 (copy)
            return v56.SupportsOverscan or false;
        end, 
        getPlatformDisplayName = function() --[[ Line: 571 ]] --[[ Name: getPlatformDisplayName ]]
            -- upvalues: v56 (copy)
            return v56.platformDisplayName or "";
        end, 
        getPlatformAccountName = function() --[[ Line: 574 ]] --[[ Name: getPlatformAccountName ]]
            -- upvalues: v56 (copy)
            return v56.platformAccountName or nil;
        end, 
        getSupportsProfileSwitching = function() --[[ Line: 577 ]] --[[ Name: getSupportsProfileSwitching ]]
            -- upvalues: v56 (copy)
            return v56.supportsProfileSwitching or false;
        end, 
        getMountAllOmniFeedItems = function() --[[ Line: 580 ]] --[[ Name: getMountAllOmniFeedItems ]]
            -- upvalues: v56 (copy)
            return v56.mountAllOmniFeedItems or false;
        end, 
        getFriendCodeQrCodeScannerEnabled = function() --[[ Line: 583 ]] --[[ Name: getFriendCodeQrCodeScannerEnabled ]]
            -- upvalues: v56 (copy)
            return v56.FriendCodeQrCodeScannerEnabled or false;
        end, 
        getInviteFriendsDisabled = function() --[[ Line: 586 ]] --[[ Name: getInviteFriendsDisabled ]]
            -- upvalues: v56 (copy)
            return v56.InviteFriendsDisabled or false;
        end, 
        getRealNamesInDisplayNamesEnabled = function() --[[ Line: 589 ]] --[[ Name: getRealNamesInDisplayNamesEnabled ]]
            -- upvalues: v56 (copy)
            return v56.RealNamesInDisplayNamesEnabled or false;
        end, 
        getProfileShareLinkEnabled = function() --[[ Line: 592 ]] --[[ Name: getProfileShareLinkEnabled ]]
            -- upvalues: v56 (copy)
            return v56.ProfileShareLinkEnabled;
        end, 
        getProfileCopyLinkEnabled = function() --[[ Line: 595 ]] --[[ Name: getProfileCopyLinkEnabled ]]
            -- upvalues: v56 (copy)
            return v56.ProfileCopyLinkEnabled;
        end, 
        getEnablePremiumUserFeatures = function() --[[ Line: 598 ]] --[[ Name: getEnablePremiumUserFeatures ]]
            -- upvalues: l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (ref), v56 (copy)
            if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
                return v56.EnablePremiumUserFeatures or false;
            else
                return nil;
            end;
        end, 
        getEnableDualLogin = function() --[[ Line: 604 ]] --[[ Name: getEnableDualLogin ]]
            -- upvalues: v56 (copy)
            return v56.enableDualLogin or false;
        end, 
        getUseExternalBrowserForAgeGuidelines = function() --[[ Line: 608 ]] --[[ Name: getUseExternalBrowserForAgeGuidelines ]]
            -- upvalues: l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (ref), v56 (copy)
            if l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then
                return v56.UseExternalBrowserForAgeGuidelines or false;
            else
                return nil;
            end;
        end, 
        getEnableHomePageAgeBlock = function() --[[ Line: 615 ]] --[[ Name: getEnableHomePageAgeBlock ]]
            -- upvalues: v56 (copy)
            return v56.EnableHomePageAgeBlock or false;
        end, 
        getEnableUAppAccessBlock = function() --[[ Line: 618 ]] --[[ Name: getEnableUAppAccessBlock ]]
            -- upvalues: v56 (copy)
            return v56.EnableUAppAccessBlock or false;
        end, 
        getUAppBlockPageTextMapKey = function() --[[ Line: 621 ]] --[[ Name: getUAppBlockPageTextMapKey ]]
            -- upvalues: v56 (copy)
            return v56.UAppBlockPageTextMapKey or nil;
        end, 
        getUAppBlockPageShouldDisableLogOut = function() --[[ Line: 624 ]] --[[ Name: getUAppBlockPageShouldDisableLogOut ]]
            -- upvalues: v56 (copy)
            return v56.UAppBlockPageShouldDisableLogOut or nil;
        end, 
        getContactsToastEnabled = function() --[[ Line: 627 ]] --[[ Name: getContactsToastEnabled ]]
            -- upvalues: v56 (copy)
            return v56.ContactsToastEnabled or false;
        end, 
        getEnableProfileQrCode = function() --[[ Line: 630 ]] --[[ Name: getEnableProfileQrCode ]]
            -- upvalues: v56 (copy)
            return v56.EnableProfileQrCode or false;
        end, 
        getCanRenderTransferOnProfile = function() --[[ Line: 633 ]] --[[ Name: getCanRenderTransferOnProfile ]]
            -- upvalues: l_FFlagGuacCanRenderTransferOnProfile_0 (ref), v56 (copy)
            if l_FFlagGuacCanRenderTransferOnProfile_0 then
                return v56.CanRenderTransferOnProfile or false;
            else
                return false;
            end;
        end, 
        getShowVNGLoginWithExistingAccountQuickLoginButton = function() --[[ Line: 639 ]] --[[ Name: getShowVNGLoginWithExistingAccountQuickLoginButton ]]
            -- upvalues: v56 (copy)
            return v56.ShowVNGLoginWithExistingAccountQuickLoginButton or false;
        end, 
        getShowVNGAge12Badge = function() --[[ Line: 642 ]] --[[ Name: getShowVNGAge12Badge ]]
            -- upvalues: v56 (copy)
            return v56.ShowVNGAge12Badge or false;
        end, 
        getShowBrazilContentRatingLogo = function() --[[ Line: 645 ]] --[[ Name: getShowBrazilContentRatingLogo ]]
            -- upvalues: v56 (copy)
            return v56.ShowBrazilContentRatingLogo or false;
        end, 
        getUseVNGUserAgreementPopup = function() --[[ Line: 648 ]] --[[ Name: getUseVNGUserAgreementPopup ]]
            -- upvalues: v56 (copy)
            return v56.UseVNGUserAgreementPopup or false;
        end, 
        getRedirectBuyRobuxToVNG = function() --[[ Line: 651 ]] --[[ Name: getRedirectBuyRobuxToVNG ]]
            -- upvalues: v56 (copy)
            return v56.RedirectBuyRobuxToVNG or false;
        end, 
        getShowVNGTosForRobuxUpsell = function() --[[ Line: 654 ]] --[[ Name: getShowVNGTosForRobuxUpsell ]]
            -- upvalues: v56 (copy)
            return v56.ShowVNGTosForRobuxUpsell or false;
        end, 
        getBlockVNGU12SignUpOnClientSide = function() --[[ Line: 657 ]] --[[ Name: getBlockVNGU12SignUpOnClientSide ]]
            -- upvalues: v56 (copy)
            return v56.BlockVNGU12SignUpOnClientSide or false;
        end, 
        getUseAgeInput = function() --[[ Line: 660 ]] --[[ Name: getUseAgeInput ]]
            -- upvalues: v56 (copy)
            return v56.UseAgeInput or false;
        end, 
        getLoginUsernameOnly = function() --[[ Line: 663 ]] --[[ Name: getLoginUsernameOnly ]]
            -- upvalues: v56 (copy)
            return v56.LoginUsernameOnly or false;
        end, 
        getDisableEmailOTPLogin = function() --[[ Line: 666 ]] --[[ Name: getDisableEmailOTPLogin ]]
            -- upvalues: v56 (copy)
            return v56.DisableEmailOTPLogin or false;
        end, 
        getDisableLoginForgotButton = function() --[[ Line: 669 ]] --[[ Name: getDisableLoginForgotButton ]]
            -- upvalues: v56 (copy)
            return v56.DisableLoginForgotButton or false;
        end, 
        getDisableLogOutEmailUpsell = function() --[[ Line: 672 ]] --[[ Name: getDisableLogOutEmailUpsell ]]
            -- upvalues: v56 (copy)
            return v56.DisableLogOutEmailUpsell or false;
        end, 
        getVerifiedSignupCountry = function() --[[ Line: 675 ]] --[[ Name: getVerifiedSignupCountry ]]
            -- upvalues: v56 (copy)
            return v56.verifiedSignupCountry or false;
        end, 
        getParentalConsentAgreementId = function() --[[ Line: 679 ]] --[[ Name: getParentalConsentAgreementId ]]
            -- upvalues: v56 (copy)
            return v56.parentalConsentAgreementId or "";
        end, 
        getIsStrictComplianceEnabled = function() --[[ Line: 683 ]] --[[ Name: getIsStrictComplianceEnabled ]]
            -- upvalues: v56 (copy)
            return v56.isStrictComplianceEnabled or false;
        end, 
        getUseKoreaKISAUserAgreementPopup = function() --[[ Line: 687 ]] --[[ Name: getUseKoreaKISAUserAgreementPopup ]]
            -- upvalues: v56 (copy)
            return v56.useKoreaKISAUserAgreementPopup or false;
        end, 
        getEnableNotificationPreferencesPage = function() --[[ Line: 691 ]] --[[ Name: getEnableNotificationPreferencesPage ]]
            -- upvalues: l_GetFFlagEnableGateNotificationPreferencesTab_0 (ref), v56 (copy)
            if l_GetFFlagEnableGateNotificationPreferencesTab_0() then
                return v56.EnableNotificationPreferencesPage or false;
            else
                return nil;
            end;
        end, 
        getVNGFormRequired = function() --[[ Line: 698 ]] --[[ Name: getVNGFormRequired ]]
            -- upvalues: v56 (copy)
            return v56.VNGFormRequired or false;
        end, 
        getUpsellVoiceForPhoneVerification = function() --[[ Line: 701 ]] --[[ Name: getUpsellVoiceForPhoneVerification ]]
            -- upvalues: v56 (copy)
            return v56.UpsellVoiceForPhoneVerification or false;
        end, 
        getIsLinkedVRModeAvailable = function() --[[ Line: 704 ]] --[[ Name: getIsLinkedVRModeAvailable ]]
            -- upvalues: l_UserInputService_0 (ref)
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v66 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
                v66 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
            end;
            return v66;
        end, 
        getShouldShowPhoneUpsell = function() --[[ Line: 708 ]] --[[ Name: getShouldShowPhoneUpsell ]]
            -- upvalues: v56 (copy)
            return v56.ShouldShowPhoneUpsell or false;
        end, 
        getTermsOfUseLink = function() --[[ Line: 711 ]] --[[ Name: getTermsOfUseLink ]]
            -- upvalues: v56 (copy)
            return v56.TermsOfUseLink or "";
        end, 
        getPrivacyPolicyLink = function() --[[ Line: 714 ]] --[[ Name: getPrivacyPolicyLink ]]
            -- upvalues: v56 (copy)
            return v56.PrivacyPolicyLink or "";
        end, 
        getVngAppUpsell = function() --[[ Line: 717 ]] --[[ Name: getVngAppUpsell ]]
            -- upvalues: l_FFlagLuaAppHomeVngAppUpsell_0 (ref), v56 (copy)
            if l_FFlagLuaAppHomeVngAppUpsell_0 then
                return v56.VngAppUpsell or false;
            else
                return false;
            end;
        end, 
        getShouldHideContactImporterUpsell = function() --[[ Line: 724 ]] --[[ Name: getShouldHideContactImporterUpsell ]]
            -- upvalues: v56 (copy)
            return v56.ShouldHideContactImporterUpsell or false;
        end, 
        getContactImporterEncouraged = function() --[[ Line: 727 ]] --[[ Name: getContactImporterEncouraged ]]
            -- upvalues: v56 (copy)
            return v56.contactImporterEncouraged or false;
        end, 
        getFriendRequestNicknamesEnabled = function() --[[ Line: 730 ]] --[[ Name: getFriendRequestNicknamesEnabled ]]
            -- upvalues: l_FFlagFriendRequestNicknames_0 (ref), v56 (copy)
            if l_FFlagFriendRequestNicknames_0 then
                return v56.FriendRequestNicknamesEnabled or false;
            else
                return false;
            end;
        end, 
        getShouldShowVpcPlayButtonUpsells = l_FFlagLuaAppParentUpsellPolicy_0 and function() --[[ Line: 738 ]]
            -- upvalues: v56 (copy)
            return v56.shouldShowVpcPlayButtonUpsells or false;
        end or nil, 
        getRenamePaymentsToSpendingTab = function() --[[ Line: 742 ]] --[[ Name: getRenamePaymentsToSpendingTab ]]
            -- upvalues: v56 (copy)
            return v56.renamePaymentsToSpendingTab or false;
        end, 
        getNotificationsCanReceiveStream = function() --[[ Line: 747 ]] --[[ Name: getNotificationsCanReceiveStream ]]
            -- upvalues: l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (ref), v56 (copy)
            if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
                return v56.notificationsCanAccessStream or false;
            else
                return nil;
            end;
        end, 
        getNotificationsCanReceivePush = function() --[[ Line: 754 ]] --[[ Name: getNotificationsCanReceivePush ]]
            -- upvalues: v56 (copy)
            return v56.notificationsCanAccessPush or false;
        end, 
        getPushNotificationsUpsell = function() --[[ Line: 757 ]] --[[ Name: getPushNotificationsUpsell ]]
            -- upvalues: v56 (copy)
            return v56.ShouldShowPushNotificationsUpsell or false;
        end, 
        getNotificationsCanReceiveExperience = function() --[[ Line: 760 ]] --[[ Name: getNotificationsCanReceiveExperience ]]
            -- upvalues: v56 (copy)
            if v56.notificationsCanAccessExperience == nil then
                return true;
            else
                return v56.notificationsCanAccessExperience;
            end;
        end, 
        getDisableResellingCollectiblesForCompliance = function() --[[ Line: 766 ]] --[[ Name: getDisableResellingCollectiblesForCompliance ]]
            -- upvalues: v56 (copy)
            return v56.DisableResellingCollectiblesForCompliance or false;
        end, 
        getShowIllegalContentReportingUI = function() --[[ Line: 769 ]] --[[ Name: getShowIllegalContentReportingUI ]]
            -- upvalues: v56 (copy)
            return v56.ShowIllegalContentReportingUI or false;
        end, 
        getEligibleForContentPostFeed = function() --[[ Line: 772 ]] --[[ Name: getEligibleForContentPostFeed ]]
            -- upvalues: v56 (copy)
            return v56.EligibleForContentPostFeed or false;
        end, 
        getEligibleForExternalContentSharing = function() --[[ Line: 775 ]] --[[ Name: getEligibleForExternalContentSharing ]]
            -- upvalues: v56 (copy)
            return v56.EligibleForExternalContentSharing or false;
        end, 
        getEnableContinuousLoad = function() --[[ Line: 778 ]] --[[ Name: getEnableContinuousLoad ]]
            -- upvalues: v56 (copy)
            return v56.EnableContinuousLoad or false;
        end, 
        getEnableAggregateLikesFavoritesCount = function() --[[ Line: 781 ]] --[[ Name: getEnableAggregateLikesFavoritesCount ]]
            -- upvalues: v56 (copy)
            return v56.EnableAggregateLikesFavoritesCount or false;
        end, 
        getShowUpdatedCameraPath = function() --[[ Line: 784 ]] --[[ Name: getShowUpdatedCameraPath ]]
            -- upvalues: v56 (copy)
            return v56.showUpdatedCameraPath or false;
        end, 
        getRenameParentEmailForVerificationUpsell = function() --[[ Line: 787 ]] --[[ Name: getRenameParentEmailForVerificationUpsell ]]
            -- upvalues: l_FFlagRenameParentEmailForVerificationUpsell_0 (ref), v56 (copy)
            if l_FFlagRenameParentEmailForVerificationUpsell_0() then
                return v56.renameParentEmailForVerificationUpsell or false;
            else
                return false;
            end;
        end, 
        getKeystrokeCollectionEnabled = function() --[[ Line: 794 ]] --[[ Name: getKeystrokeCollectionEnabled ]]
            -- upvalues: v56 (copy)
            if game:GetFastFlag("BehaviorCollectionControlEnabled") then
                return v56.EnableKeystrokeCollection or false;
            else
                return false;
            end;
        end, 
        getCanUsePlatformChat = function() --[[ Line: 802 ]] --[[ Name: getCanUsePlatformChat ]]
            -- upvalues: v56 (copy)
            return v56.CanUsePlatformChat or false;
        end, 
        getCanSeeChatTab = function() --[[ Line: 806 ]] --[[ Name: getCanSeeChatTab ]]
            -- upvalues: v56 (copy)
            return v56.CanSeeChatTab or false;
        end, 
        getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 810 ]] --[[ Name: getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (ref), v56 (copy)
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return true;
            elseif v56.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil then
                return true;
            else
                return v56.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup;
            end;
        end, 
        getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 819 ]] --[[ Name: getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (ref), l_GetFFlagEnableMultiPageSignup_0 (ref), v56 (copy)
            local v67 = l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0();
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return v67;
            elseif v56.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then
                return v67;
            else
                return v56.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages;
            end;
        end, 
        getRobuxUpsellFlowMobile = function() --[[ Line: 829 ]] --[[ Name: getRobuxUpsellFlowMobile ]]
            -- upvalues: v56 (copy)
            return v56.useMobileRobuxUpsellFlow or false;
        end, 
        getUsePaymentPlatformMicrosoftStore = function() --[[ Line: 832 ]] --[[ Name: getUsePaymentPlatformMicrosoftStore ]]
            -- upvalues: l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (ref), v56 (copy)
            if l_FFlagEnableMicrosoftStorePaymentsPlatform_0 then
                return v56.usePaymentPlatformMicrosoftStore or false;
            else
                return false;
            end;
        end, 
        getMicSettingsDirectionsLocaleKey = function() --[[ Line: 839 ]] --[[ Name: getMicSettingsDirectionsLocaleKey ]]
            -- upvalues: l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (ref), v56 (copy)
            if l_FFlagPartyVoiceEnableMicPermissionsBanner_0 then
                return v56.micSettingsDirectionsLocaleKey or nil;
            else
                return nil;
            end;
        end, 
        getMicSettingsDeeplinkDirectionsLocaleKey = function() --[[ Line: 845 ]] --[[ Name: getMicSettingsDeeplinkDirectionsLocaleKey ]]
            -- upvalues: l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (ref), v56 (copy)
            if l_FFlagPartyVoiceEnableMicPermissionsBanner_0 then
                return v56.micSettingsDeeplinkDirectionsLocaleKey or nil;
            else
                return nil;
            end;
        end, 
        getRequiresAppRestartOnMicAccessChange = function() --[[ Line: 851 ]] --[[ Name: getRequiresAppRestartOnMicAccessChange ]]
            -- upvalues: l_FFlagPartyVoiceEnableMicPermissionsBanner_0 (ref), v56 (copy)
            if l_FFlagPartyVoiceEnableMicPermissionsBanner_0 then
                return v56.requiresAppRestartOnMicAccessChange or false;
            else
                return false;
            end;
        end, 
        getRenameFriendsToConnections = function() --[[ Line: 857 ]] --[[ Name: getRenameFriendsToConnections ]]
            -- upvalues: l_FFlagEnableFriendsRenamingForAll_0 (ref), v56 (copy)
            if l_FFlagEnableFriendsRenamingForAll_0 then
                return true;
            else
                return v56.renameFriendsToConnections or false;
            end;
        end, 
        getShareSheetEnabled = function() --[[ Line: 863 ]] --[[ Name: getShareSheetEnabled ]]
            -- upvalues: l_FFlagTCShareLinkSenderUI_0 (ref), v56 (copy)
            if l_FFlagTCShareLinkSenderUI_0 then
                return v56.shareSheetEnabled or false;
            else
                return nil;
            end;
        end, 
        getCanAccessTrustedContacts = function() --[[ Line: 870 ]] --[[ Name: getCanAccessTrustedContacts ]]
            -- upvalues: v56 (copy)
            return v56.canAccessTrustedContacts or false;
        end, 
        getExperienceDetailsNoticeType = function() --[[ Line: 873 ]] --[[ Name: getExperienceDetailsNoticeType ]]
            -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (ref), v56 (copy)
            if l_FFlagLuaAppShowNoticeOnEdp_0 then
                return v56.experienceDetailsNoticeType or nil;
            else
                return nil;
            end;
        end, 
        getRequiresOSAFriendingEducation = function() --[[ Line: 879 ]] --[[ Name: getRequiresOSAFriendingEducation ]]
            -- upvalues: v56 (copy)
            return v56.requiresOSAFriendingEducation or false;
        end, 
        getSocialGraphSyncEnabled = function() --[[ Line: 882 ]] --[[ Name: getSocialGraphSyncEnabled ]]
            -- upvalues: v56 (copy)
            return v56.SocialGraphSyncEnabled or false;
        end, 
        getAccountDisambiguationDisabled = function() --[[ Line: 885 ]] --[[ Name: getAccountDisambiguationDisabled ]]
            -- upvalues: v56 (copy)
            return v56.AccountDisambiguationDisabled or false;
        end, 
        getHasWebViewSupportForFAE = function() --[[ Line: 888 ]] --[[ Name: getHasWebViewSupportForFAE ]]
            -- upvalues: v56 (copy)
            return v56.hasWebViewSupportForFAE or false;
        end, 
        getLinkedAuthEndpointsEnabled = function() --[[ Line: 891 ]] --[[ Name: getLinkedAuthEndpointsEnabled ]]
            -- upvalues: v56 (copy)
            return v56.LinkedAuthEndpointsEnabled or false;
        end, 
        getLinkingPlatform = function() --[[ Line: 894 ]] --[[ Name: getLinkingPlatform ]]
            -- upvalues: v56 (copy)
            return v56.LinkingPlatform or nil;
        end, 
        getUsePaymentPlatformMilkyWayStore = function() --[[ Line: 897 ]] --[[ Name: getUsePaymentPlatformMilkyWayStore ]]
            -- upvalues: l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (ref), v56 (copy)
            if l_FFlagEnableMilkyWayPaymentsPlatformV2_0 then
                return v56.usePaymentPlatformMilkyWayStore or false;
            else
                return false;
            end;
        end, 
        getScreentimeMoreTimeOptionEnabled = function() --[[ Line: 903 ]] --[[ Name: getScreentimeMoreTimeOptionEnabled ]]
            -- upvalues: l_FFlagEnableScreentimeMoreTimeOption_0 (ref), v56 (copy)
            if l_FFlagEnableScreentimeMoreTimeOption_0 then
                return v56.ScreentimeMoreTimeOptionEnabled or false;
            else
                return false;
            end;
        end, 
        getDisablePremiumEntrypoint = function() --[[ Line: 909 ]] --[[ Name: getDisablePremiumEntrypoint ]]
            -- upvalues: v48 (ref), v56 (copy)
            if v48 then
                return v56.DisablePremiumEntrypoint or v56.DisablePremiumEntryPoint or false;
            else
                return false;
            end;
        end, 
        getDisableBlackbirdEntrypoints = function() --[[ Line: 915 ]] --[[ Name: getDisableBlackbirdEntrypoints ]]
            -- upvalues: v49 (ref), v56 (copy)
            if v49 then
                return v56.DisableBlackbirdEntrypoints or false;
            else
                return false;
            end;
        end, 
        getEnableGiftcardsWithRedeem = function() --[[ Line: 921 ]] --[[ Name: getEnableGiftcardsWithRedeem ]]
            -- upvalues: v50 (ref), v56 (copy)
            if v50 then
                return v56.EnableGiftcardsWithRedeem or false;
            else
                return false;
            end;
        end, 
        getGiftCardSourceRefOverride = function() --[[ Line: 927 ]] --[[ Name: getGiftCardSourceRefOverride ]]
            -- upvalues: v56 (copy)
            return v56.GiftCardSourceRefOverride or "";
        end, 
        getSignupCheckboxDisabled = function() --[[ Line: 930 ]] --[[ Name: getSignupCheckboxDisabled ]]
            -- upvalues: v47 (ref), v56 (copy)
            if v47 then
                return v56.DisableSignupCheckbox or false;
            else
                return false;
            end;
        end, 
        getExcludeCrossDeviceSignIn = function() --[[ Line: 937 ]] --[[ Name: getExcludeCrossDeviceSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v56 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v56.ExcludeCrossDeviceSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePasskeyLogin = function() --[[ Line: 943 ]] --[[ Name: getExcludePasskeyLogin ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v56 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v56.ExcludePasskeyLogin or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernamePasswordSignIn = function() --[[ Line: 950 ]] --[[ Name: getExcludeUsernamePasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v56 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v56.ExcludeUsernamePasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeEmailPasswordSignIn = function() --[[ Line: 956 ]] --[[ Name: getExcludeEmailPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v56 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v56.ExcludeEmailPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludePhoneNumberPasswordSignIn = function() --[[ Line: 962 ]] --[[ Name: getExcludePhoneNumberPasswordSignIn ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v56 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v56.ExcludePhoneNumberPasswordSignIn or false;
            else
                return false;
            end;
        end, 
        getExcludeAccountSwitcher = function() --[[ Line: 968 ]] --[[ Name: getExcludeAccountSwitcher ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v56 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v56.ExcludeAccountSwitcher or false;
            else
                return false;
            end;
        end, 
        getExcludeUsernameUpdateModeration = function() --[[ Line: 974 ]] --[[ Name: getExcludeUsernameUpdateModeration ]]
            -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v56 (copy)
            if l_FFlagAuthSecExclusions_0 then
                return v56.ExcludeUsernameUpdateModeration or false;
            else
                return false;
            end;
        end, 
        getMorePageExitButtonEnabled = l_FFlagEnableMorePageExitButtonSupport_0 and function() --[[ Line: 981 ]]
            -- upvalues: v56 (copy)
            return v56.MorePageExitButtonEnabled or false;
        end or nil, 
        getMoreGridDirectionalLayoutPreferred = l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 and function() --[[ Line: 986 ]]
            -- upvalues: v56 (copy)
            return v56.MoreGridDirectionalLayoutPreferred or false;
        end or nil, 
        getShouldUseDMCCALegalDisclosureInApp = function() --[[ Line: 990 ]] --[[ Name: getShouldUseDMCCALegalDisclosureInApp ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v56 (copy)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                return v56.ShouldUseDMCCALegalDisclosureInApp or false;
            else
                return false;
            end;
        end, 
        getCanAccessParty = function() --[[ Line: 996 ]] --[[ Name: getCanAccessParty ]]
            -- upvalues: v56 (copy)
            if v56.CanAccessParty == nil then
                return true;
            else
                return v56.CanAccessParty;
            end;
        end, 
        getRedeemTileEnabled = function() --[[ Line: 1002 ]] --[[ Name: getRedeemTileEnabled ]]
            -- upvalues: v56 (copy)
            return v56.RedeemTileEnabled or false;
        end, 
        getShouldUseVibrationInsteadOfHaptics = function() --[[ Line: 1005 ]] --[[ Name: getShouldUseVibrationInsteadOfHaptics ]]
            -- upvalues: v56 (copy)
            return v56.ShouldUseVibrationInsteadOfHaptics or false;
        end
    };
end;