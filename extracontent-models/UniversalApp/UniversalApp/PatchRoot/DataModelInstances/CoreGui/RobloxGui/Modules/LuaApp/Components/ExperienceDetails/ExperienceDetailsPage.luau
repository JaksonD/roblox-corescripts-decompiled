local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_IXPService_0 = game:GetService("IXPService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = game:DefineFastFlag("LuaAppRemoveEDPLoadingState", false);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.Packages.Promise);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Packages.Foundation);
local v11 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useTokens_0 = v10.Hooks.useTokens;
local l_ButtonSize_0 = v10.Enums.ButtonSize;
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local l_RetrievalStatus_0 = v14.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v14.App.Indicator.EmptyState;
local l_LoadingStateContainer_0 = v14.App.Container.LoadingStateContainer;
local l_StyledTextLabel_0 = v14.App.Text.StyledTextLabel;
local l_withStyle_0 = v14.Core.Style.withStyle;
local l_DetailsPageSelector_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).DetailsPageSelector;
local l_ContentPosition_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).ContentPosition;
local l_useCloseWithBackButton_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).useCloseWithBackButton;
local l_Images_0 = v14.App.ImageSet.Images;
local l_PlayerCount_0 = v14.App.Indicator.PlayerCount;
local l_TooltipOrientation_0 = v14.App.Dialog.Enum.TooltipOrientation;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v27 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v29 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v30 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v31 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_DeviceType_0 = v30.DeviceType;
local l_UiMode_0 = v30.UiMode;
local l_useUiModeInfo_0 = v31.useUiModeInfo;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local l_GameStats_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameStats;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v42 = require(script.Parent.ExperienceDetailsExperimentation);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v44 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_ExperienceCommunityLink_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Components.ExperienceCommunityLink;
local v46 = require(l_CorePackages_0.Packages.InputHandlers);
local v47 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v47.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v47.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v47.FocusNavigationEventNameEnum;
local l_AgeRecommendationDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).AgeRecommendations.AgeRecommendationDetails;
local l_ExperienceDetailsNoticeType_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).ExperienceDetailsNoticeType;
local l_EnumGameDetailErrorTypes_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).EnumGameDetailErrorTypes;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_ExperienceRatings_0 = l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceRatings;
local l_getPlayButtonProps_0 = l_Modules_0.LuaApp.Common.Experience.getPlayButtonProps;
local l_PlayButton_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).PlayButton;
local l_checkAndFormatPossibleLink_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).checkAndFormatPossibleLink;
local l_RetrievalStatus_1 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v61 = require(l_Modules_1.LuaApp.Constants);
local v62 = require(l_Modules_1.LuaApp.Enum.TransitionAnimation);
local v63 = require(l_Modules_1.LuaApp.openExternalBrowser);
local v64 = require(l_Modules_1.LuaApp.Components.VirtualEvents.EventsListWrapper);
local v65 = require(l_Modules_1.LuaApp.Components.GameDetails.GameRefundPolicy);
local v66 = require(l_Modules_1.LuaApp.Components.GameDetails.GameDetailNotificationsButtonHint);
local v67 = require(script.Parent.ExperienceDescription);
local v68 = require(script.Parent.IgrsRatingLabel);
local v69 = require(script.Parent.ExperienceLogoTray);
local v70 = require(script.Parent.ExperienceInfoTable);
local v71 = require(script.Parent.ExperienceDetailsLoadingStatePage);
local v72 = require(script.Parent.ExperienceMediaGallery);
local v73 = require(script.Parent.ExperienceTagsContainer);
local v74 = require(script.Parent.RecommendedExperienceCarousel);
local v75 = require(script.Parent.ExperienceSongsCarousel);
local v76 = require(l_Modules_1.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters);
local v77 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local v78 = require(script.Parent.EdpSduiUtils);
local v79 = require(script.Parent.Hooks.useEdpServerIxpVariables);
local v80 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.EdpSocialLinksImpressionsDetector);
local v81 = require(l_CorePackages_0.Workspace.Packages.GameDetailTelemetry);
local l_EDPTTIConstants_0 = v81.EDPTTIConstants;
local l_FFlagEDPTTITrackingEnabled_0 = v81.FFlagEDPTTITrackingEnabled;
local v84 = require(script.Parent.useEDPTTITracking);
local l_useFirstMediaCarouselImageUri_0 = require(script.Parent.useFirstMediaCarouselImageUri).useFirstMediaCarouselImageUri;
local l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTenftUiDetailsMoreDropupMenu;
local l_GetFFlagExpDetailsUseSelectionBumpers_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagExpDetailsUseSelectionBumpers;
local v88 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local v89 = require(l_Modules_1.LuaApp.Flags.GetFFlagLuaAppEnableNotificationsEDPTooltip);
local v90 = require(l_Modules_1.LuaApp.Flags.GetFIntNotificationsEDPTooltipTimeLimit);
local l_GetFFlagConsoleApplyTokenizationEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagConsoleApplyTokenizationEdp;
local l_FFlagLuaAppEnablePlaySquadButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton;
local l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability;
local l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry;
local l_FFlagLuaAppEdpFixDefaultBanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpFixDefaultBanner;
local l_FFlagSongEdpCarouselIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp;
local l_FFlagLuaAppShowNoticeOnEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppShowNoticeOnEdp;
local l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppExperienceDetailsLayoutOrderConfig;
local l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp;
local l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableConsolidatedGameRefundPolicy;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp;
local v105 = require(l_Modules_1.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation);
local v106 = require(l_Modules_1.LuaApp.Flags.FFlagCreatorSubtitleNavigationIXPEnabled);
local v107 = require(l_Modules_1.LuaApp.Flags.FStringCreatorSubtitleNavigationExperimentLayer);
local l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry;
local l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonNonMobileEdp;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppFixEdpInitialFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppFixEdpInitialFocus;
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp;
local l_FFlagLuaAppGameStatsFallbackRendering_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppGameStatsFallbackRendering;
local l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp;
local l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp;
local l_FFlagLuaAppAddIgrsRatingToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp;
local l_FFlagLuaAppIgrsRatingPropMemoization_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppIgrsRatingPropMemoization;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local v122 = l_FFlagLuaAppGameStatsFallbackRendering_0 and "--" or nil;
local v123 = {
    MediaGalleryMediaFirst = 100, 
    EventsListRedesign = 200, 
    Description = 300, 
    MediaGallery = 400, 
    IgrsRatingLabel = l_FFlagLuaAppAddIgrsRatingToEdp_0 and 450 or nil, 
    ExperienceRatings = 500, 
    PlaysAndVisits = 600, 
    CommunityLink = 700, 
    ExperienceInfoTable = 800, 
    RefundPolicy = 900, 
    LogoTraySection = 1000, 
    Notice = 1200, 
    RecommendedExperiences = 1300, 
    ExperienceSongsCarousel = 1400, 
    SduiFeedItemsDefault = 1500
};
local v124 = {
    MediaGallery = 100, 
    EventsListRedesign = 200, 
    Description = 300, 
    IgrsRatingLabel = l_FFlagLuaAppAddIgrsRatingToEdp_0 and 350 or nil, 
    RecommendedExperiences = 500, 
    ExperienceSongsCarousel = 600, 
    ExperienceRatings = 700, 
    PlaysAndVisits = 800, 
    CommunityLink = 900, 
    ExperienceInfoTable = 1000, 
    RefundPolicy = 1100, 
    LogoTraySection = 1200, 
    Notice = 1300, 
    SduiFeedItemsDefault = 1500
};
local v125 = v6.PureComponent:extend("ExperienceDetailsPage");
v125.validateProps = v9.strictInterface({
    universeId = v9.string, 
    referralSource = v9.optional(v9.string), 
    experienceJoinData = if l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 then v9.optional(v9.table) else nil, 
    placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v9.optional(v9.string) else nil, 
    onClose = v9.callback, 
    thumbnail = v9.optional(v9.table), 
    bannerImageId = v9.optional(v9.string), 
    defaultBannerUrl = if l_FFlagLuaAppEdpFixDefaultBanner_0 then v9.optional(v9.string) else nil, 
    gameInfo = v9.optional(v9.table), 
    gameDetail = v9.optional(v9.table), 
    gameDetailError = v9.optional(v9.table), 
    creatorVerified = v9.optional(v9.boolean), 
    gameDetailsPageDataStatus = v9.optional(v9.string), 
    gameProductInfo = v9.optional(v9.table), 
    socialLinks = v9.optional(v9.table), 
    ageRecommendations = v9.optional(l_AgeRecommendationDetails_0.validateModel), 
    communityLink = v9.optional(v9.table), 
    gameFollowings = v9.optional(v9.table), 
    sduiFeedItemConfigs = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v9.optional(v9.table) else nil, 
    communityLinksEnabled = v9.optional(v9.boolean), 
    communityLinkVariant = v9.optional(v9.string), 
    enableNotificationsDiscoverability = v9.optional(v9.boolean), 
    mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v9.optional(v9.boolean) else nil, 
    mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v9.optional(v9.boolean) else nil, 
    showSongCarousel = if l_FFlagSongEdpCarouselIxp_0 then v9.optional(v9.boolean) else nil, 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v9.optional(v9.boolean) else nil, 
    shouldInterleaveSduiIxp = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v9.optional(v9.boolean) else nil, 
    edpServerIxpVariables = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v9.optional(v9.table) else nil, 
    hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v9.optional(v9.boolean) else nil, 
    hasUnifiedPlayButtonIxp = if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then v9.optional(v9.boolean) else nil, 
    fetchGameDetailsPageData = v9.callback, 
    openLeaveRobloxAlertUIBlox = v9.callback, 
    openMoreContextualMenu = v9.callback, 
    openShareContextualMenu = v9.callback, 
    closeAlert = v9.callback, 
    openVerifiedBadgeModal = v9.optional(v9.callback), 
    openCreatorPage = if v105 then nil else v9.callback, 
    openCommunityProfilePage = if v105 then v9.optional(v9.callback) else nil, 
    openUserProfilePage = if v105 then v9.optional(v9.callback) else nil, 
    openExperienceGuidelinesExplained = v9.callback, 
    toggleFollowExperience = v9.optional(v9.callback), 
    openRefundPolicyLearnMorePage = v9.callback, 
    openWebview = if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v9.callback else nil, 
    onMediaGalleryPreviewActivated = if not l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 or l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v9.optional(v9.callback), 
    onMediaGalleryThumbnailActivated = if not l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 or l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v9.optional(v9.callback), 
    onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v9.optional(v9.callback) else nil, 
    onMediaGalleryEnterFullscreen = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v9.optional(v9.callback) else nil, 
    onMediaGalleryExitFullscreen = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v9.optional(v9.callback) else nil, 
    linking = v9.table, 
    playabilityStatus = v9.optional(v9.table), 
    playButtonState = v9.string, 
    onPlayButtonActivated = v9.callback, 
    onPlaySquadButtonActivated = if l_FFlagLuaAppEnablePlaySquadButton_0 then v9.callback else nil, 
    playButtonContextualMessage = v9.optional(v9.string), 
    deviceType = v9.optional(v9.string), 
    detailsPageConfiguration = v9.optional(v9.table), 
    viewWidth = v9.optional(v9.number), 
    viewHeight = v9.optional(v9.number), 
    setControllerBarNavigation = v9.optional(v9.callback), 
    uiModeInfo = v9.optional(v9.any), 
    focusGuiObject = v9.optional(v9.callback), 
    tokens = v9.strictInterface({
        thumbnailSize = v9.optional(v9.number), 
        thumbnailMargin = v9.optional(v9.number), 
        thumbnailShadowHeight = v9.optional(v9.number), 
        sideMargin = v9.optional(v9.number), 
        headerItemPadding = v9.optional(v9.number), 
        headerDescriptionMaxRows = v9.optional(v9.number), 
        headerDescriptionLineHeight = v9.optional(v9.number), 
        actionBarButtonBackgroundColor = v9.optional(v9.table), 
        actionBarTextButtonPadding = v9.optional(v9.Vector2), 
        headerGradientHeight = v9.optional(v9.number), 
        headerBarBackgroundHeight = v9.optional(v9.number), 
        headerBottomMargin = v9.optional(v9.number), 
        animationConfig = v9.optional(v9.table), 
        itemPadding = v9.optional(v9.number), 
        safeAreaSize = v9.optional(v9.Vector2), 
        trailingWhitespace = v9.optional(v9.number), 
        iconSize = v9.optional(v9.number), 
        expandableAreaHeightOffset = if l_GetFFlagConsoleApplyTokenizationEdp_0() then v9.optional(v9.number) else nil, 
        actionBarHeight = v9.optional(v9.number)
    }), 
    webViewSupport = v9.boolean, 
    notificationsCanEnableExperience = v9.optional(v9.boolean), 
    experienceDetailsNoticeType = if l_FFlagLuaAppShowNoticeOnEdp_0 then v9.optional(v9.string) else nil, 
    iconButtonSize = v9.optional(v9.UDim2), 
    textButtonSize = v9.optional(v9.UDim2), 
    playButtonSize = v9.optional(v9.UDim2), 
    actionBarHeight = v9.optional(v9.number), 
    statsAndInfoRef = v9.optional(v9.table), 
    playButtonRef = v9.optional(v9.union(v9.table, v9.callback)), 
    containerRef = v9.optional(v9.union(v9.table, v9.callback)), 
    foundationTokens = v9.optional(v9.table), 
    disableStickyActionBar = v9.optional(v9.boolean)
});
local function _(v126) --[[ Line: 344 ]] --[[ Name: createImageURL ]]
    if v126 then
        return "rbxassetid://" .. v126;
    else
        return "";
    end;
end;
local v128 = {
    showEventsList = true, 
    showLogoTraySection = true, 
    showCornerGradientPropEnabled = false, 
    showCommunityLink = false
};
v125.init = function(v129) --[[ Line: 359 ]] --[[ Name: init ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), l_abbreviateCount_0 (copy), l_UiMode_0 (copy), l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_memoize_0 (copy), l_Text_0 (copy), l_FFlagLuaAppGameStatsFallbackRendering_0 (copy), v6 (copy), l_StyledTextLabel_0 (copy), v89 (copy), l_withStyle_0 (copy), v88 (copy), v106 (copy), l_IXPServiceWrapper_0 (copy), v107 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), v62 (copy), v105 (copy), v29 (copy), v5 (copy), v73 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameStats_0 (copy), l_PlayerCount_0 (copy), v122 (copy), l_Images_0 (copy), v67 (copy), l_RetrievalStatus_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), v68 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (copy), v61 (copy), v63 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), v44 (copy), v69 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), v80 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (copy), v72 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_ExperienceRatings_0 (copy), v70 (copy), v64 (copy), v74 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), v75 (copy), l_ExperienceCommunityLink_0 (copy), l_checkAndFormatPossibleLink_0 (copy), l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (copy), v65 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (copy), v123 (copy), v124 (copy), l_ContentPosition_0 (copy), l_GetFFlagExpDetailsUseSelectionBumpers_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v42 (copy), l_ExperienceDetailsNoticeType_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v46 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_AppStorageService_0 (copy)
    local v130 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v129.applyTokenScaling = function(v131) --[[ Line: 361 ]]
        -- upvalues: v129 (copy)
        return v131 * v129.props.foundationTokens.Stroke.Standard;
    end;
    v129.getAbbreviateCount = function(v132) --[[ Line: 366 ]]
        -- upvalues: l_abbreviateCount_0 (ref), v130 (copy)
        return l_abbreviateCount_0(v132, v130:GetLocale());
    end;
    v129.upperString = function(v133) --[[ Line: 369 ]]
        -- upvalues: v130 (copy)
        return string.upper(v130:Format(v133));
    end;
    v129.onPlayButtonActivated = function() --[[ Line: 373 ]]
        -- upvalues: v129 (copy)
        return v129.props.onPlayButtonActivated();
    end;
    v129.openMoreContextualMenu = function(v134) --[[ Line: 377 ]]
        -- upvalues: v129 (copy), l_UiMode_0 (ref), l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
        local l_universeId_0 = v129.props.universeId;
        local v136 = nil;
        local v137 = nil;
        local v138 = v129.props.uiModeInfo and v129.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        if l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0() and v138 then
            v136 = Vector2.new(0, 1);
            v137 = UDim2.fromOffset(v134.AbsolutePosition.X, v134.AbsolutePosition.Y - 12);
        else
            v137 = UDim2.fromOffset(v134.AbsolutePosition.X + v134.AbsoluteSize.X - 300, v134.AbsolutePosition.Y + v134.AbsoluteSize.Y + 12);
        end;
        return v129.props.openMoreContextualMenu(l_universeId_0, v137, v136, if l_FFlagHideCloseButtonEdp_0 then v129.props.hideCloseButton else nil);
    end;
    v129.getTextHeight = l_memoize_0(function(v139, v140, v141, v142) --[[ Line: 404 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextHeight(v139, v140, v141, v142);
    end);
    v129.openShareContextualMenu = function(v143) --[[ Line: 408 ]]
        -- upvalues: v129 (copy), l_FFlagHideCloseButtonEdp_0 (ref)
        local l_universeId_1 = v129.props.universeId;
        local v145 = UDim2.fromOffset(v143.AbsolutePosition.X + v143.AbsoluteSize.X - 300, v143.AbsolutePosition.Y + v143.AbsoluteSize.Y + 12);
        return v129.props.openShareContextualMenu(l_universeId_1, v145, if l_FFlagHideCloseButtonEdp_0 then v129.props.hideCloseButton else nil);
    end;
    v129.getPlaysAnsVisitsInfo = function(v146, v147) --[[ Line: 422 ]]
        -- upvalues: l_FFlagLuaAppGameStatsFallbackRendering_0 (ref)
        return {
            plays = v146 and v146.playing or v147 and v147.playerCount or if l_FFlagLuaAppGameStatsFallbackRendering_0 then nil else 0, 
            visits = v146 and v146.visits or if l_FFlagLuaAppGameStatsFallbackRendering_0 then nil else 0, 
            totalUpVotes = v147 and v147.totalUpVotes or 0, 
            totalDownVotes = v147 and v147.totalDownVotes or 1
        };
    end;
    v129.getStyledTextLabel = function(v148, v149, v150) --[[ Line: 433 ]]
        -- upvalues: v6 (ref), l_StyledTextLabel_0 (ref)
        if v148 then
            return v6.createElement(l_StyledTextLabel_0, {
                text = v148, 
                fontStyle = v149, 
                colorStyle = v150, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 1, 
                richText = false, 
                lineHeight = 1
            });
        else
            return nil;
        end;
    end;
    v129.toggleFollowExperience = function() --[[ Line: 449 ]]
        -- upvalues: v89 (ref), v129 (copy)
        if v89() then
            v129:setState({
                isNotificationsTooltipActive = false
            });
        end;
        if not v129.props.gameFollowings then
            return;
        else
            local l_universeId_2 = v129.props.universeId;
            local l_isFollowed_0 = v129.props.gameFollowings.isFollowed;
            if v129.props.toggleFollowExperience then
                v129.props.toggleFollowExperience(l_universeId_2, not l_isFollowed_0);
            end;
            return;
        end;
    end;
    v129.renderSubtitleTextOverride = function(v153, v154, v155, _, v157, v158) --[[ Line: 468 ]]
        -- upvalues: l_withStyle_0 (ref), v88 (ref), v106 (ref), l_IXPServiceWrapper_0 (ref), v107 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v130 (copy), v62 (ref), v6 (ref), v105 (ref), v129 (copy), v29 (ref)
        local function _(v159) --[[ Line: 476 ]]
            -- upvalues: l_withStyle_0 (ref), v88 (ref), v106 (ref), l_IXPServiceWrapper_0 (ref), v107 (ref), v158 (copy), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v155 (copy), v154 (copy), v130 (ref), v62 (ref), v6 (ref), v105 (ref), v129 (ref)
            return l_withStyle_0(function(v160) --[[ Line: 477 ]]
                -- upvalues: v88 (ref), v106 (ref), l_IXPServiceWrapper_0 (ref), v107 (ref), v159 (copy), v158 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v155 (ref), v154 (ref), v130 (ref), v62 (ref), v6 (ref), v105 (ref), v129 (ref)
                local v161 = if v88 then v160.Tokens.Semantic.Typography.Subheader else v160.Font.Header2;
                local v162 = if v88 then v161.FontSize else v161.RelativeSize * v160.Font.BaseSize;
                local l_TextMuted_0 = v160.Theme.TextMuted;
                if v106 then
                    l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v107);
                end;
                if v159 and v158 then
                    local v164 = {
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.game.info.creator({
                            creatorType = v155, 
                            creatorId = v154
                        }), 
                        extraProps = {
                            title = v130:Format("Feature.GameDetails.Label.Developer"), 
                            transitionAnimation = v62.SlideInFromRight
                        }
                    };
                    return v6.createElement("TextButton", {
                        Text = v159, 
                        Font = v161.Font, 
                        TextColor3 = l_TextMuted_0.Color, 
                        LayoutOrder = 2, 
                        AutoButtonColor = false, 
                        LineHeight = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextSize = v162, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = function() --[[ Line: 515 ]]
                            -- upvalues: v105 (ref), v155 (ref), v129 (ref), v154 (ref), v164 (copy)
                            if v105 then
                                if v155 == "User" then
                                    v129.props.openUserProfilePage(v154, "ExperienceDetailsPage:SubTitle");
                                    return;
                                elseif v155 == "Group" then
                                    v129.props.openCommunityProfilePage(v154, "ExperienceDetailsPage:SubTitle");
                                    return;
                                end;
                            else
                                v129.props.openCreatorPage(v164);
                            end;
                        end
                    });
                else
                    return v129.getStyledTextLabel(v159, v161, l_TextMuted_0);
                end;
            end);
        end;
        return v6.createElement(v29.EmojiWrapper, {
            emoji = if v157 then v29.emoji.verified else "", 
            layoutOrder = 2, 
            onActivated = if v157 and v158 then v129.props.openVerifiedBadgeModal else nil
        }, {
            userText = l_withStyle_0(function(v166) --[[ Line: 477 ]]
                -- upvalues: v88 (ref), v106 (ref), l_IXPServiceWrapper_0 (ref), v107 (ref), v153 (copy), v158 (copy), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v155 (copy), v154 (copy), v130 (ref), v62 (ref), v6 (ref), v105 (ref), v129 (ref)
                local v167 = if v88 then v166.Tokens.Semantic.Typography.Subheader else v166.Font.Header2;
                local v168 = if v88 then v167.FontSize else v167.RelativeSize * v166.Font.BaseSize;
                local l_TextMuted_1 = v166.Theme.TextMuted;
                if v106 then
                    l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v107);
                end;
                if v153 and v158 then
                    local v170 = {
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.game.info.creator({
                            creatorType = v155, 
                            creatorId = v154
                        }), 
                        extraProps = {
                            title = v130:Format("Feature.GameDetails.Label.Developer"), 
                            transitionAnimation = v62.SlideInFromRight
                        }
                    };
                    return v6.createElement("TextButton", {
                        Text = v153, 
                        Font = v167.Font, 
                        TextColor3 = l_TextMuted_1.Color, 
                        LayoutOrder = 2, 
                        AutoButtonColor = false, 
                        LineHeight = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextSize = v168, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = function() --[[ Line: 515 ]]
                            -- upvalues: v105 (ref), v155 (ref), v129 (ref), v154 (ref), v170 (copy)
                            if v105 then
                                if v155 == "User" then
                                    v129.props.openUserProfilePage(v154, "ExperienceDetailsPage:SubTitle");
                                    return;
                                elseif v155 == "Group" then
                                    v129.props.openCommunityProfilePage(v154, "ExperienceDetailsPage:SubTitle");
                                    return;
                                end;
                            else
                                v129.props.openCreatorPage(v170);
                            end;
                        end
                    });
                else
                    return v129.getStyledTextLabel(v153, v167, l_TextMuted_1);
                end;
            end)
        });
    end;
    v129.renderTextOverride = function(v171, _, _, v174) --[[ Line: 542 ]]
        -- upvalues: l_withStyle_0 (ref), v88 (ref), v129 (copy), v6 (ref), v29 (ref)
        local function _(v175) --[[ Line: 543 ]]
            -- upvalues: l_withStyle_0 (ref), v88 (ref), v129 (ref)
            return l_withStyle_0(function(v176) --[[ Line: 544 ]]
                -- upvalues: v88 (ref), v129 (ref), v175 (copy)
                local v177 = if v88 then v176.Tokens.Semantic.Typography.Subheader else v176.Font.Header2;
                local l_TextEmphasis_0 = v176.Theme.TextEmphasis;
                return v129.getStyledTextLabel(v175, v177, l_TextEmphasis_0);
            end);
        end;
        return v6.createElement(v29.EmojiWrapper, {
            emoji = if v174 then v29.emoji.verified else "", 
            layoutOrder = 0, 
            size = UDim2.fromScale(0, 1)
        }, {
            userText = l_withStyle_0(function(v180) --[[ Line: 544 ]]
                -- upvalues: v88 (ref), v129 (ref), v171 (copy)
                local v181 = if v88 then v180.Tokens.Semantic.Typography.Subheader else v180.Font.Header2;
                local l_TextEmphasis_1 = v180.Theme.TextEmphasis;
                return v129.getStyledTextLabel(v171, v181, l_TextEmphasis_1);
            end)
        });
    end;
    v129.renderExperienceGuidelines = l_memoize_0(function(v183) --[[ Line: 562 ]]
        -- upvalues: v5 (ref), v73 (ref), l_FFlagHideCloseButtonEdp_0 (ref), v129 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1
        }, {
            UIPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4)
            }), 
            ExperienceTagsContainer = v5.createElement(v73, {
                areTagsInteractable = true, 
                includeAgeRecommendations = true, 
                universeId = v183, 
                LayoutOrder = 1, 
                hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v129.props.hideCloseButton else nil, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v129.props.shouldHydrateLegacyIxp else nil
            })
        });
    end);
    v129.renderInlinePlayerCountAndLikes = l_memoize_0(function(v184, v185, v186) --[[ Line: 586 ]]
        -- upvalues: v6 (ref), l_GameStats_0 (ref)
        return v6.createElement("Frame", {
            Size = UDim2.new(0, 120, 0, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            GameStats = v6.createElement(l_GameStats_0, {
                stats = {
                    playerCount = v184, 
                    totalUpVotes = v185, 
                    totalDownVotes = v186
                }
            })
        });
    end);
    v129.renderBriefDescription = function(v187, v188) --[[ Line: 602 ]]
        -- upvalues: l_withStyle_0 (ref), v88 (ref), v129 (copy), v6 (ref), l_StyledTextLabel_0 (ref)
        return l_withStyle_0(function(v189) --[[ Line: 603 ]]
            -- upvalues: v187 (copy), v88 (ref), v129 (ref), v188 (copy), v6 (ref), l_StyledTextLabel_0 (ref)
            local l_Font_0 = v189.Font;
            local l_headerDescriptionLineHeight_0 = v187.headerDescriptionLineHeight;
            local v192 = l_headerDescriptionLineHeight_0 * math.floor(l_Font_0.BaseSize * l_Font_0.Body.RelativeSize) * v187.headerDescriptionMaxRows;
            local v193 = if v88 then v189.Tokens.Semantic.Typography.Body.FontSize else l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            local v194 = if v88 then v189.Tokens.Semantic.Typography.Body.Font else l_Font_0.Body.Font;
            local v195 = v129.getTextHeight(v188, v194, v193, UDim2.new(1, 0, 0, v192));
            return v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, (math.min(v195, v192))), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                ClipsDescendants = true
            }, {
                GameDescriptionText = v6.createElement(l_StyledTextLabel_0, {
                    text = v188, 
                    fontStyle = if v88 then v189.Tokens.Semantic.Typography.Body else l_Font_0.Body, 
                    colorStyle = v189.Theme.TextEmphasis, 
                    size = UDim2.fromScale(1, 1), 
                    richText = false, 
                    fluidSizing = false, 
                    lineHeight = l_headerDescriptionLineHeight_0
                })
            });
        end);
    end;
    v129.renderInfoContent = function(v196, v197, v198, v199, v200, v201, v202, v203, v204, v205) --[[ Line: 638 ]]
        -- upvalues: v129 (copy), l_UiMode_0 (ref), v105 (ref), v6 (ref)
        local v206 = v129.props.uiModeInfo and v129.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        local v207 = v196 and v196.headerItemPadding or 0;
        local v208 = v206 and v202 ~= nil and #v202 > 0;
        local v209 = not v206;
        return function() --[[ Line: 657 ]]
            -- upvalues: v105 (ref), v129 (ref), v198 (copy), v199 (copy), v200 (copy), v197 (copy), v201 (copy), l_UiMode_0 (ref), v6 (ref), v207 (copy), v206 (copy), v203 (copy), v204 (copy), v205 (copy), v208 (copy), v196 (copy), v202 (copy), v209 (copy)
            local v210 = if v105 then v129.renderSubtitleTextOverride(v198, v199, v200, v197, v201, v129.props.uiModeInfo.uiMode ~= l_UiMode_0.TenFoot) else v129.renderSubtitleTextOverride(v198, v199, v200, v197, v201);
            return v6.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v6.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, v207)
                }), 
                SubtitleText = v210, 
                Padding = if v207 then v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v207)
                }) else nil, 
                PlayStats = if v206 then v129.renderInlinePlayerCountAndLikes(v203, v204, v205) else nil, 
                Description = if v208 then v129.renderBriefDescription(v196, v202) else nil, 
                ExperienceGuidelinesComponent = if v209 then v129.renderExperienceGuidelines(v197) else nil
            });
        end;
    end;
    v129.renderPlaysAndVisits = l_memoize_0(function(v211, v212) --[[ Line: 696 ]]
        -- upvalues: v6 (ref), l_PlayerCount_0 (ref), l_FFlagLuaAppGameStatsFallbackRendering_0 (ref), v122 (ref), v129 (copy), l_Images_0 (ref)
        return function() --[[ Line: 697 ]]
            -- upvalues: v6 (ref), l_PlayerCount_0 (ref), l_FFlagLuaAppGameStatsFallbackRendering_0 (ref), v211 (copy), v122 (ref), v129 (ref), l_Images_0 (ref), v212 (copy)
            return v6.createElement(l_PlayerCount_0, {
                layoutOrder = 1, 
                countLeft = {
                    countText = if l_FFlagLuaAppGameStatsFallbackRendering_0 and v211 == nil then v122 else v129.getAbbreviateCount(v211), 
                    labelText = v129.upperString("Feature.GameDetails.Label.Playing"), 
                    icon = l_Images_0["icons/status/games/people-playing_large"]
                }, 
                countRight = {
                    countText = if l_FFlagLuaAppGameStatsFallbackRendering_0 and v212 == nil then v122 else v129.getAbbreviateCount(v212), 
                    labelText = v129.upperString("Feature.GameDetails.Label.Visits"), 
                    icon = l_Images_0["icons/status/games/sessions_large"]
                }
            });
        end;
    end);
    v129.onFocusChanged = function(v213) --[[ Line: 718 ]]
        -- upvalues: v129 (copy)
        if v129.props.setControllerBarNavigation then
            local v214 = not v213;
            v129.props.setControllerBarNavigation(v214);
        end;
    end;
    v129.renderDescription = l_memoize_0(function(v215, v216) --[[ Line: 725 ]]
        -- upvalues: v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v129 (copy)
        return function() --[[ Line: 726 ]]
            -- upvalues: v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v215 (copy), v216 (copy), v129 (ref)
            return v6.createElement(v67, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(v215), 
                descriptionText = v216, 
                onFocusChanged = v129.onFocusChanged
            });
        end;
    end);
    if l_FFlagLuaAppShowNoticeOnEdp_0 then
        v129.renderNotice = l_memoize_0(function(v217) --[[ Line: 736 ]]
            -- upvalues: l_withLocalization_0 (ref), v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v129 (copy)
            return function() --[[ Line: 737 ]]
                -- upvalues: l_withLocalization_0 (ref), v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v217 (copy), v129 (ref)
                return l_withLocalization_0({
                    noticeHeader = "Feature.ExperienceDetails.Body.NotesTitle", 
                    noticeText = "Feature.ExperienceDetails.Notes.InExperiencePurchase"
                })(function(v218) --[[ Line: 741 ]]
                    -- upvalues: v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v217 (ref), v129 (ref)
                    return v6.createElement(v67, {
                        dataStatus = l_RetrievalStatus_0.fromRawValue(v217), 
                        headerText = v218.noticeHeader, 
                        descriptionText = v218.noticeText, 
                        onFocusChanged = v129.onFocusChanged
                    });
                end);
            end;
        end);
    end;
    v129.renderIgrsRatingLabel = if l_FFlagLuaAppAddIgrsRatingToEdp_0 then l_memoize_0(function(v219, v220, v221, v222, v223) --[[ Line: 754 ]]
        -- upvalues: v5 (ref), v68 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v61 (ref), v130 (copy), v129 (copy), v63 (ref)
        return function() --[[ Line: 755 ]]
            -- upvalues: v5 (ref), v68 (ref), v219 (copy), v220 (copy), v221 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v222 (copy), v61 (ref), v130 (ref), v129 (ref), v63 (ref), v223 (copy)
            return v5.createElement(v68, {
                igrsRating = v219, 
                igrsRatingDisplayMessage = v220, 
                onActivated = v221 and function() --[[ Line: 760 ]]
                    -- upvalues: l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v222 (ref), v61 (ref), v130 (ref), v129 (ref)
                    if l_FFlagLuaAppIgrsRatingPropMemoization_0 then
                        v222(v61.INDONESIAN_CONTENT_MATURITY_URL, v130:Format("Feature.GameDetails.Label.ContentMaturity"));
                        return;
                    else
                        v129.props.openWebview(v61.INDONESIAN_CONTENT_MATURITY_URL, v130:Format("Feature.GameDetails.Label.ContentMaturity"));
                        return;
                    end;
                end or function() --[[ Line: 773 ]]
                    -- upvalues: v63 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v223 (ref), v129 (ref), v61 (ref)
                    v63(if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v223 else v129.props.linking, v61.INDONESIAN_CONTENT_MATURITY_URL);
                end
            });
        end;
    end) else nil;
    v129.renderLogoTray = l_memoize_0(function(v224, v225) --[[ Line: 784 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (ref), v129 (copy), v5 (ref), v44 (ref), v6 (ref), v69 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v80 (ref), l_AppPage_0 (ref)
        return function() --[[ Line: 785 ]]
            -- upvalues: l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (ref), v129 (ref), v5 (ref), v44 (ref), v6 (ref), v69 (ref), v224 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v225 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v80 (ref), l_AppPage_0 (ref)
            if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then
                local v226 = ("EXPERIENCE_SOCIAL_LINKS_%*"):format(v129.props.universeId);
                local v227 = v5.createRef();
                local v228 = v44.Signal.new();
                return v5.createElement(v5.Fragment, nil, {
                    ExperienceLogoTray = v6.createElement(v69, {
                        socialLinks = v224, 
                        linking = if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v225 else v129.props.linking, 
                        openLeaveRobloxAlertUIBlox = v129.props.openLeaveRobloxAlertUIBlox, 
                        closeAlert = v129.props.closeAlert, 
                        impressionsTag = v226, 
                        forwardRef = v227, 
                        onAbsolutePositionChanged = function(_) --[[ Line: 797 ]]
                            -- upvalues: v228 (copy)
                            v228:fire();
                        end, 
                        universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v129.props.universeId else nil
                    }), 
                    EdpSocialLinksImpressionsDetector = v6.createElement(v80, {
                        parentRef = v227, 
                        scrollViewPositionChangedSignal = v228, 
                        pageContext = l_AppPage_0.ExperienceDetail, 
                        impressionsTag = v226, 
                        socialLinks = v224, 
                        universeId = v129.props.universeId
                    })
                });
            else
                return v6.createElement(v69, {
                    socialLinks = v224, 
                    linking = if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v225 else v129.props.linking, 
                    openLeaveRobloxAlertUIBlox = v129.props.openLeaveRobloxAlertUIBlox, 
                    closeAlert = v129.props.closeAlert, 
                    universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v129.props.universeId else nil
                });
            end;
        end;
    end);
    local function _(v230) --[[ Line: 833 ]] --[[ Name: handleControllerBarInMediaGalleryFullscreen ]]
        -- upvalues: v129 (copy)
        if v129.props.setControllerBarNavigation then
            v129.props.setControllerBarNavigation(v230);
        end;
    end;
    v129.onMediaGalleryPreviewActivated = function(v232, v233) --[[ Line: 839 ]]
        -- upvalues: v129 (copy), l_UiMode_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (ref)
        local v234 = v129.props.uiModeInfo and v129.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        if not v129.state.isFullscreen and v234 and v129.props.setControllerBarNavigation then
            v129.props.setControllerBarNavigation(false);
        end;
        v129:setState({
            isFullscreen = true, 
            mediaGalleryShowIndex = v232, 
            currentIndex = if v234 then v232 else nil
        });
        if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and v129.props.onMediaGalleryEnterFullscreen then
            v129.props.onMediaGalleryEnterFullscreen(v232, v233);
            return;
        else
            if l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 and v129.props.onMediaGalleryPreviewActivated then
                v129.props.onMediaGalleryPreviewActivated(v232);
            end;
            return;
        end;
    end;
    v129.renderMediaGallery = l_memoize_0(function(v235, v236) --[[ Line: 858 ]]
        -- upvalues: v129 (copy), l_UiMode_0 (ref), v6 (ref), v72 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref)
        if v129.props.uiModeInfo and v129.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            return function() --[[ Line: 861 ]]
                -- upvalues: v6 (ref), v72 (ref), v129 (ref), v235 (copy), v236 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(v72, {
                    tokens = v129.props.tokens, 
                    deviceType = v129.props.deviceType, 
                    universeId = v235, 
                    onPreviewActivated = v129.onMediaGalleryPreviewActivated, 
                    isFullscreenState = v236, 
                    exitFullscreen = v129.onClose, 
                    onSelectionGained = v129.onSelectionGained, 
                    mediaGalleryGainFocused = v129.mediaGalleryGainFocused, 
                    uiMode = v129.props.uiModeInfo.uiMode, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v129.props.shouldHydrateLegacyIxp else nil
                });
            end;
        else
            return function() --[[ Line: 878 ]]
                -- upvalues: v6 (ref), v72 (ref), v129 (ref), v235 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), v236 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(v72, {
                    deviceType = v129.props.deviceType, 
                    universeId = v235, 
                    startIndex = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v129.state.mediaGalleryShowIndex else nil, 
                    onPreviewActivated = v129.onMediaGalleryPreviewActivated, 
                    onThumbnailActivated = if not l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 or l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v129.props.onMediaGalleryThumbnailActivated, 
                    onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v129.props.onMediaGalleryMediaChanged else nil, 
                    isOccluded = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and (l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryVideoPreview_0) then v236 else nil, 
                    mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v129.props.mediaGalleryRedesignEnabledIxp else nil, 
                    mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v129.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v129.props.shouldHydrateLegacyIxp else nil
                });
            end;
        end;
    end);
    v129.renderExperienceRating = l_memoize_0(function(v237) --[[ Line: 909 ]]
        -- upvalues: v6 (ref), l_ExperienceRatings_0 (ref), v129 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
        return function() --[[ Line: 910 ]]
            -- upvalues: v6 (ref), l_ExperienceRatings_0 (ref), v237 (copy), v129 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
            return v6.createElement(l_ExperienceRatings_0, {
                universeId = v237, 
                height = math.floor((v129.applyTokenScaling(72))), 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v129.props.shouldHydrateLegacyIxp else nil, 
                styleProps = {
                    statWidgetIconSize = math.floor((v129.applyTokenScaling(48)))
                }
            });
        end;
    end);
    v129.renderExperienceInfoTable = l_memoize_0(function(v238) --[[ Line: 924 ]]
        -- upvalues: v6 (ref), v129 (copy), v70 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
        return function() --[[ Line: 925 ]]
            -- upvalues: v6 (ref), v129 (ref), v70 (ref), v238 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
            return v6.createElement("Folder", {
                [v6.Ref] = v129.props.statsAndInfoRef
            }, v6.createElement(v70, {
                renderTextOverride = v129.renderTextOverride, 
                universeId = v238, 
                key = "ExperienceInfoTable", 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v129.props.shouldHydrateLegacyIxp else nil, 
                hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v129.props.hideCloseButton else nil
            }));
        end;
    end);
    v129.renderEventsList = l_memoize_0(function(v239, v240) --[[ Line: 944 ]]
        -- upvalues: v6 (ref), v64 (ref)
        return function() --[[ Line: 945 ]]
            -- upvalues: v6 (ref), v64 (ref), v239 (copy), v240 (copy)
            return v6.createElement(v64, {
                universeId = v239, 
                referralSource = "expDetailsPage", 
                defaultThumbnail = if v240 then "rbxassetid://" .. v240 else nil
            });
        end;
    end);
    v129.renderRecommendedExperiencesCarousel = l_memoize_0(function(v241) --[[ Line: 954 ]]
        -- upvalues: v6 (ref), v74 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v129 (copy), l_AppPage_0 (ref)
        return function() --[[ Line: 955 ]]
            -- upvalues: v6 (ref), v74 (ref), v241 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v129 (ref), l_AppPage_0 (ref)
            return v6.createElement(v74, {
                universeId = v241, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v129.props.shouldHydrateLegacyIxp else nil, 
                pageContext = l_AppPage_0.ExperienceDetail
            });
        end;
    end);
    if l_FFlagSongEdpCarouselIxp_0 then
        v129.renderExperienceSongsCarousel = l_memoize_0(function(v242, v243) --[[ Line: 967 ]]
            -- upvalues: v5 (ref), v75 (ref)
            return function() --[[ Line: 968 ]]
                -- upvalues: v5 (ref), v75 (ref), v242 (copy), v243 (copy)
                return v5.createElement(v75, {
                    universeId = v242, 
                    fractionalItemAmount = 0, 
                    universeTitle = v243 or "", 
                    collectionOrder = 2, 
                    clipsDescendants = true
                });
            end;
        end);
    end;
    v129.renderCommunityLink = l_memoize_0(function(v244, v245, v246) --[[ Line: 980 ]]
        -- upvalues: v5 (ref), l_ExperienceCommunityLink_0 (ref)
        return function() --[[ Line: 981 ]]
            -- upvalues: v5 (ref), l_ExperienceCommunityLink_0 (ref), v244 (copy), v245 (copy), v246 (copy)
            return v5.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16)
                }), 
                ExperienceCommunityLink = v5.createElement(l_ExperienceCommunityLink_0, {
                    communityInfo = v244, 
                    experienceName = v245 or "", 
                    universeId = v246
                })
            });
        end;
    end);
    v129.linkStartStyle = l_memoize_0(function(v247) --[[ Line: 999 ]]
        local l_Color3_0 = v247.Tokens.Semantic.Color.Text.Link.Color3;
        return (("<font color=\"%*\"><b>"):format((string.format("rgb(%d, %d, %d)", math.round(l_Color3_0.R * 255), math.round(l_Color3_0.G * 255), (math.round(l_Color3_0.B * 255))))));
    end);
    v129.checkAndFormatPossibleLink = l_memoize_0(function(v249, v250) --[[ Line: 1011 ]]
        -- upvalues: l_checkAndFormatPossibleLink_0 (ref), v129 (copy)
        return l_checkAndFormatPossibleLink_0(v250, nil, nil, v129.linkStartStyle(v249), "</b></font>");
    end);
    v129.renderRefundPolicy = l_memoize_0(function(v251) --[[ Line: 1017 ]]
        -- upvalues: l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (ref), l_withStyle_0 (ref), v6 (ref), v65 (ref), v129 (copy), v5 (ref)
        return function() --[[ Line: 1018 ]]
            -- upvalues: l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (ref), l_withStyle_0 (ref), v6 (ref), v65 (ref), v251 (copy), v129 (ref), v5 (ref)
            if l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 then
                return l_withStyle_0(function(v252) --[[ Line: 1020 ]]
                    -- upvalues: v6 (ref), v65 (ref), v251 (ref)
                    return v6.createElement(v65, {
                        refundPolicy = v251, 
                        paddingTop = v252.Tokens.Global.Space_300
                    });
                end);
            else
                return l_withStyle_0(function(v253) --[[ Line: 1027 ]]
                    -- upvalues: v129 (ref), v251 (ref), v5 (ref)
                    local l_Body_0 = v253.Tokens.Semantic.Typography.Body;
                    local l_Muted_0 = v253.Tokens.Semantic.Color.Text.Muted;
                    local v256, v257 = v129.checkAndFormatPossibleLink(v253, v251.policyText);
                    return v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        UIPadding = v5.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, v253.Tokens.Global.Space_300)
                        }), 
                        RefundPolicy = v5.createElement("TextButton", {
                            BackgroundTransparency = 1, 
                            Text = v257, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Font = l_Body_0.Font, 
                            TextSize = l_Body_0.FontSize, 
                            TextColor3 = l_Muted_0.Color3, 
                            TextTransparency = l_Muted_0.Transparency, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            RichText = v256, 
                            [v5.Event.Activated] = function(_) --[[ Line: 1054 ]]
                                -- upvalues: v129 (ref), v251 (ref)
                                v129.props.openRefundPolicyLearnMorePage(v251.learnMoreUrl);
                            end
                        })
                    });
                end);
            end;
        end;
    end);
    v129.getBodyComponentListProps = l_memoize_0(function(v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v280) --[[ Line: 1064 ]]
        -- upvalues: v129 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (ref), v123 (ref), v124 (ref), l_ContentPosition_0 (ref), l_GetFFlagExpDetailsUseSelectionBumpers_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v42 (ref), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_ExperienceDetailsNoticeType_0 (ref), l_FFlagSongEdpCarouselIxp_0 (ref)
        local v281 = v269.showLogoTraySection and v265 and next(v265);
        local v282 = v269.showCommunityLink and v267 and v268 == "banner" and v266;
        local l_showEventsList_0 = v269.showEventsList;
        local v284 = v129.props.webViewSupport and v273 ~= nil;
        local v285 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.Description else 20;
        local v286 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.MediaGallery else 40;
        local v287 = if not v271 then v285 else v286;
        local v288 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.EventsListRedesign else v287 - 10;
        local v289 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.EventsListRedesign else 10;
        local l_Left_0 = l_ContentPosition_0.Left;
        local v291 = {
            MediaGallery = {
                portraitLayoutOrder = if not v271 then if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.MediaGalleryMediaFirst else 5 else v285, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.MediaGallery else 10, 
                landscapePosition = l_ContentPosition_0.Right, 
                showCornerGradient = not v269.showCornerGradientPropEnabled and nil, 
                useSelectionBumper = l_GetFFlagExpDetailsUseSelectionBumpers_0() and true or nil, 
                renderComponent = v129.renderMediaGallery(v259, v270)
            }, 
            Description = {
                portraitLayoutOrder = v287, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.Description else 20, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v129.renderDescription(v260, v261)
            }, 
            IgrsRatingLabel = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and v276 then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.IgrsRatingLabel else 45, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.IgrsRatingLabel else 30, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v129.renderIgrsRatingLabel(v276, v277, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v278 else v129.props.webViewSupport, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v279 else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v280 else nil)
            } else nil, 
            ExperienceRatings = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui()) and v129.props.edpServerIxpVariables and v129.props.edpServerIxpVariables.hideGameRatings == true then nil else {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.ExperienceRatings else 50, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.ExperienceRatings else 40, 
                landscapePosition = l_ContentPosition_0.Left, 
                useSelectionBumper = l_GetFFlagExpDetailsUseSelectionBumpers_0() and true or nil, 
                renderComponent = v129.renderExperienceRating(v259)
            }, 
            PlaysAndVisits = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui()) and v129.props.edpServerIxpVariables and v129.props.edpServerIxpVariables.showVisitsInInfoList == true then nil else {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.PlaysAndVisits else 60, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.PlaysAndVisits else 50, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v129.renderPlaysAndVisits(v263, v264)
            }, 
            CommunityLink = if v282 then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.CommunityLink else 70, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.CommunityLink else 60, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v129.renderCommunityLink(v266, v262, v259)
            } else nil, 
            ExperienceInfoTable = {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.ExperienceInfoTable else 80, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.ExperienceInfoTable else 70, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v129.renderExperienceInfoTable(v259)
            }, 
            RefundPolicy = if v284 then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.RefundPolicy else 85, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.RefundPolicy else 75, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v129.renderRefundPolicy(v273)
            } else nil, 
            LogoTraySection = v281 and {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.LogoTraySection else 90, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.LogoTraySection else 80, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v129.renderLogoTray(v265, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v280 else nil)
            } or nil, 
            EventsList = if l_showEventsList_0 then {
                portraitLayoutOrder = v288, 
                landscapeLayoutOrder = v289, 
                landscapePosition = l_Left_0, 
                renderComponent = v129.renderEventsList(v259, v272)
            } else nil, 
            Notice = if l_FFlagLuaAppShowNoticeOnEdp_0 and v274 == l_ExperienceDetailsNoticeType_0.InExperiencePurchase then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.Notice else 100, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.Notice else 100, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v129.renderNotice(v260)
            } else nil, 
            RecommendedExperiences = {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.RecommendedExperiences else 110, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.RecommendedExperiences else 30, 
                landscapePosition = l_ContentPosition_0.Right, 
                useSelectionBumper = l_GetFFlagExpDetailsUseSelectionBumpers_0() and true or nil, 
                renderComponent = v129.renderRecommendedExperiencesCarousel(v259)
            }, 
            ExperienceSongsCarousel = if l_FFlagSongEdpCarouselIxp_0 and v129.props.showSongCarousel then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v123.ExperienceSongsCarousel else 120, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v124.ExperienceSongsCarousel else 35, 
                landscapePosition = l_ContentPosition_0.Right, 
                renderComponent = v129.renderExperienceSongsCarousel(v259, v262)
            } else nil
        };
        if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v129.props.shouldInterleaveSduiIxp) and v275 then
            for v292, v293 in v275 do
                v291[("SduiFeedItem_%*"):format(v292)] = {
                    portraitLayoutOrder = v293.portraitLayoutOrder, 
                    landscapeLayoutOrder = v293.landscapeLayoutOrder, 
                    landscapePosition = l_ContentPosition_0.Left, 
                    renderComponent = v293.renderComponent
                };
            end;
        end;
        return v291;
    end);
    v129.onClose = function() --[[ Line: 1318 ]]
        -- upvalues: v129 (copy), l_UiMode_0 (ref)
        if v129.state.isFullscreen then
            v129:setState({
                isFullscreen = false
            });
            if v129.props.uiModeInfo and v129.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot and v129.props.setControllerBarNavigation then
                v129.props.setControllerBarNavigation(true);
                return;
            end;
        else
            v129.props.onClose();
        end;
    end;
    v129.exitFullscreen = l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and function(v294, v295) --[[ Line: 1335 ]]
        -- upvalues: v129 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref)
        if not v129.state.isFullscreen then
            return;
        else
            if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and v129.props.onMediaGalleryExitFullscreen then
                v129.props.onMediaGalleryExitFullscreen(v294, v295);
            end;
            v129:setState({
                isFullscreen = false, 
                mediaGalleryShowIndex = v294
            });
            return;
        end;
    end or nil;
    v129.focusEventHandlers = {
        [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
            handler = v46.onRelease(function(v296) --[[ Line: 1353 ]]
                -- upvalues: v129 (copy)
                v129.onClose();
                v296:cancel();
            end)
        }
    };
    v129.renderFullscreenContent = l_memoize_0(function(v297, v298, v299, v300, v301, v302) --[[ Line: 1361 ]]
        -- upvalues: v129 (copy), l_UiMode_0 (ref), v6 (ref), v72 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref)
        if v129.props.uiModeInfo and v129.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            return function() --[[ Line: 1364 ]]
                -- upvalues: v6 (ref), v72 (ref), v129 (ref), v297 (copy), v298 (copy), v299 (copy), v300 (copy), v302 (copy), v301 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(v72, {
                    tokens = v129.props.tokens, 
                    universeId = v297, 
                    isFullscreen = true, 
                    fullscreenShowIndex = v298, 
                    deviceType = v129.props.deviceType, 
                    isFullscreenState = v299, 
                    isCrossFade = v300, 
                    setCrossFade = v129.setCrossFade, 
                    nextIndex = v302, 
                    currentIndex = v301, 
                    setCurrentIndex = v129.setCurrentIndex, 
                    uiMode = v129.props.uiModeInfo.uiMode, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v129.props.shouldHydrateLegacyIxp else nil
                });
            end;
        else
            return function() --[[ Line: 1384 ]]
                -- upvalues: v6 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v129 (ref), v72 (ref), v297 (copy), v298 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(l_FocusNavigableSurfaceWrapper_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    isIsolated = true, 
                    customEventHandlers = v129.focusEventHandlers
                }, {
                    ExperienceMediaGallery = v6.createElement(v72, {
                        universeId = v297, 
                        isFullscreen = true, 
                        fullscreenShowIndex = v298, 
                        onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v129.props.onMediaGalleryMediaChanged else nil, 
                        startIndex = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v298 else nil, 
                        exitFullscreen = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v129.exitFullscreen else nil, 
                        mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v129.props.mediaGalleryRedesignEnabledIxp else nil, 
                        mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v129.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v129.props.shouldHydrateLegacyIxp else nil
                    })
                });
            end;
        end;
    end);
    v129.resolveTitleText = function(v303, v304) --[[ Line: 1415 ]]
        return v303 and v303.name or v304 and v304.name or nil;
    end;
    v129.checkCommunityLinkExposureLogging = function() --[[ Line: 1420 ]]
        -- upvalues: v129 (copy), l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
        if v129.props.communityLink then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.EDPCommunityLinksLayer);
        end;
    end;
    if v129.props.uiModeInfo and v129.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
        v129.state = {
            bannerImageId = v129.props.bannerImageId, 
            isCrossFade = false, 
            currentIndex = 1, 
            nextIndex = 1
        };
        v129.setCurrentIndex = function(v305) --[[ Line: 1435 ]]
            -- upvalues: v129 (copy)
            v129:setState({
                currentIndex = v305
            });
        end;
        v129.setCrossFade = function(v306) --[[ Line: 1441 ]]
            -- upvalues: v129 (copy)
            v129:setState({
                isCrossFade = v306
            });
        end;
        v129.onSelectionGained = function(v307, v308) --[[ Line: 1447 ]]
            -- upvalues: v129 (copy)
            if v129.state.nextIndex ~= v307 and v129.state.isCrossFade == false then
                v129.setCrossFade(true);
            end;
            v129:setState({
                bannerImageId = v308, 
                nextIndex = v307
            });
        end;
        v129.mediaGalleryGainFocused = function(v309) --[[ Line: 1458 ]]
            -- upvalues: v129 (copy)
            if not v309 then
                v129:setState({
                    bannerImageId = v129.props.bannerImageId
                });
            end;
        end;
    end;
    if v89() then
        v129.isMounted = false;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 1470 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            return l_AppStorageService_0:GetItem("ShowNotificationsOptInTooltip");
        end);
        v129.showTooltip = if l_status_0 then l_result_0 == "true" else false;
        v129:setState({
            isNotificationsTooltipActive = v129.showTooltip
        });
    end;
end;
v125.didMount = function(v312) --[[ Line: 1479 ]] --[[ Name: didMount ]]
    -- upvalues: v89 (copy), l_AppStorageService_0 (copy), v8 (copy), v90 (copy)
    v312.checkCommunityLinkExposureLogging();
    if v89() then
        v312.isMounted = true;
        if v312.showTooltip then
            pcall(function() --[[ Line: 1485 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                l_AppStorageService_0:SetItem("ShowNotificationsOptInTooltip", "false");
                l_AppStorageService_0:Flush();
            end);
        end;
        v8.delay(v90()):andThen(function() --[[ Line: 1491 ]]
            -- upvalues: v312 (copy)
            if v312.isMounted then
                v312:setState({
                    isNotificationsTooltipActive = false
                });
            end;
        end);
    end;
end;
v125.didUpdate = function(v313, v314) --[[ Line: 1501 ]] --[[ Name: didUpdate ]]
    if not v314.communityLink then
        v313.checkCommunityLinkExposureLogging();
    end;
end;
v125.render = function(v315) --[[ Line: 1507 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_RetrievalStatus_1 (copy), v6 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    if v4 then
        if v315.props.gameDetailsPageDataStatus == l_RetrievalStatus_1.Failed and not v315.props.gameInfo then
            return v315:renderOnFailed();
        else
            return v315:renderOnLoaded();
        end;
    else
        return v6.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(v315.props.gameDetailsPageDataStatus), 
            renderOnFailed = function() --[[ Line: 1525 ]] --[[ Name: renderOnFailed ]]
                -- upvalues: v315 (copy)
                if v315.props.gameInfo then
                    return v315:renderOnLoaded();
                else
                    return v315:renderOnFailed();
                end;
            end, 
            renderOnLoaded = function() --[[ Line: 1533 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v315 (copy)
                return v315:renderOnLoaded();
            end, 
            renderOnLoading = function() --[[ Line: 1536 ]] --[[ Name: renderOnLoading ]]
                -- upvalues: v315 (copy)
                return v315:renderOnLoading();
            end
        });
    end;
end;
v125.renderOnLoading = function(_) --[[ Line: 1542 ]] --[[ Name: renderOnLoading ]]
    -- upvalues: v6 (copy), v71 (copy)
    return v6.createElement(v71);
end;
v125.renderOnFailed = function(v317) --[[ Line: 1546 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: l_withLocalization_0 (copy), l_EnumGameDetailErrorTypes_0 (copy), v6 (copy), l_EmptyState_0 (copy)
    return l_withLocalization_0({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet", 
        experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable"
    })(function(v318) --[[ Line: 1550 ]]
        -- upvalues: v317 (copy), l_EnumGameDetailErrorTypes_0 (ref), v6 (ref), l_EmptyState_0 (ref)
        local v319 = nil;
        v319 = v317.props.gameDetailError and v317.props.gameDetailError.errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
        return v6.createElement(l_EmptyState_0, {
            onActivated = if v319 then nil else v317.props.fetchGameDetailsPageData, 
            text = if v319 then v318.experienceUnavailableMessage else v318.failedMessage
        });
    end);
end;
v125.willUnmount = function(v320) --[[ Line: 1561 ]] --[[ Name: willUnmount ]]
    -- upvalues: v89 (copy)
    if v89() then
        v320.isMounted = false;
    end;
end;
v125.renderOnLoaded = function(v321) --[[ Line: 1567 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: l_UiMode_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_getPlayButtonProps_0 (copy), v89 (copy), l_DeviceType_0 (copy), l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v42 (copy), v7 (copy), l_Images_0 (copy), v6 (copy), v5 (copy), v66 (copy), l_TooltipOrientation_0 (copy), l_withLocalization_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_FFlagLuaAppEdpFixDefaultBanner_0 (copy), l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButton_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_ButtonSize_0 (copy), v128 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (copy), l_DetailsPageSelector_0 (copy)
    local l_deviceType_0 = v321.props.deviceType;
    local l_universeId_3 = v321.props.universeId;
    local l_gameInfo_0 = v321.props.gameInfo;
    local l_thumbnail_0 = v321.props.thumbnail;
    local l_tokens_0 = v321.props.tokens;
    local v327 = v321.props.uiModeInfo and v321.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
    l_thumbnail_0 = l_thumbnail_0 and l_thumbnail_0.url;
    local l_gameDetail_0 = v321.props.gameDetail;
    local v329 = l_gameDetail_0 and l_gameDetail_0.description or nil;
    local v330 = l_gameDetail_0 and l_gameDetail_0.name or nil;
    local v331 = v321.resolveTitleText(l_gameDetail_0, l_gameInfo_0);
    local v332 = l_gameDetail_0 and l_gameDetail_0.creator.name or nil;
    local v333 = l_gameDetail_0 and l_gameDetail_0.creator.id or nil;
    local v334 = l_gameDetail_0 and l_gameDetail_0.creator.type or nil;
    local v335 = nil;
    local v336 = nil;
    local v337 = nil;
    if v321.props.ageRecommendations then
        local l_summary_0 = v321.props.ageRecommendations.summary;
        v335 = if l_summary_0 and l_summary_0.ageRecommendation then if l_summary_0.ageRecommendation.displayNameWithHeaderShort then l_summary_0.ageRecommendation.displayNameWithHeaderShort else l_summary_0.ageRecommendation.displayName else nil;
        if l_FFlagLuaAppAddIgrsRatingToEdp_0 then
            v336 = if l_summary_0 and l_summary_0.ageRecommendation and l_summary_0.ageRecommendation.igrsRating and l_summary_0.ageRecommendation.igrsRating ~= "" then l_summary_0.ageRecommendation.igrsRating else nil;
            v337 = if l_summary_0 and l_summary_0.ageRecommendation and l_summary_0.ageRecommendation.igrsRatingDisplayMessage then l_summary_0.ageRecommendation.igrsRatingDisplayMessage else nil;
        end;
    end;
    local v339 = v321.getPlaysAnsVisitsInfo(l_gameDetail_0, l_gameInfo_0);
    local l_socialLinks_0 = v321.props.socialLinks;
    local l_communityLink_0 = v321.props.communityLink;
    local v342 = l_getPlayButtonProps_0(v321.props.playButtonState, v321.props.gameProductInfo);
    local l_textKey_0 = v342.textKey;
    local l_price_0 = v342.price;
    local l_icon_0 = v342.icon;
    local v346 = if v89() then v321.state.isNotificationsTooltipActive else false;
    local l_isFullscreen_0 = v321.state.isFullscreen;
    local l_isCrossFade_0 = v321.state.isCrossFade;
    local l_currentIndex_0 = v321.state.currentIndex;
    local l_nextIndex_0 = v321.state.nextIndex;
    local l_mediaGalleryShowIndex_0 = v321.state.mediaGalleryShowIndex;
    local v352 = nil;
    local v353 = nil;
    local v354 = nil;
    if l_tokens_0 then
        v352 = l_tokens_0.thumbnailSize;
        v353 = l_tokens_0.sideMargin;
        v354 = l_tokens_0.headerBarBackgroundHeight;
    end;
    local v355 = nil;
    if l_deviceType_0 == l_DeviceType_0.Tablet then
        v355 = math.min(v321.props.viewHeight / 3, 500);
        v352 = 200;
    elseif not v327 then
        v355 = 208;
    end;
    local v356 = not v327;
    local v357 = v327 and v335;
    local v358 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or v321.props.enableNotificationsDiscoverability;
    local l_notificationsCanEnableExperience_0 = v321.props.notificationsCanEnableExperience;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui()) and v321.props.edpServerIxpVariables and v321.props.edpServerIxpVariables.hideNotifyButton == true then
        v358 = false;
    end;
    local v361 = v7.List.filter({
        v356 and {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = l_Images_0["icons/actions/friends/friendsplaying"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v321.openShareContextualMenu, 
                size = v321.props.iconButtonSize, 
                backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
            }
        } or nil, 
        {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = l_Images_0["icons/common/more"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v321.openMoreContextualMenu, 
                size = v321.props.iconButtonSize, 
                backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
            }
        }, 
        v358 and l_notificationsCanEnableExperience_0 and {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = if v321.props.gameFollowings and v321.props.gameFollowings.isFollowed then l_Images_0["icons/common/notificationOn"] else l_Images_0["icons/common/notificationOff"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v321.toggleFollowExperience, 
                size = v321.props.iconButtonSize, 
                backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil, 
                [v6.Children] = if v89() then {
                    Tooltip = v5.createElement(v66, {
                        isActive = v346, 
                        preferredOrientation = l_TooltipOrientation_0.Bottom
                    })
                } else nil
            }
        } or nil
    }, function(v360) --[[ Line: 1712 ]]
        return v360 ~= nil;
    end);
    local v362 = nil;
    local v363 = nil;
    if v327 then
        v363 = v321.props.gameDetail and v321.props.gameDetail.licenseDescription or nil;
        if v357 or v363 then
            v362 = {};
        end;
        if v357 then
            table.insert(v362, {
                props = {
                    anchorPoint = Vector2.new(0, 0.5), 
                    position = UDim2.fromScale(0, 0.5), 
                    text = v335, 
                    horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                    verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                    userInteractionEnabled = true, 
                    showBackground = true, 
                    size = v321.props.textButtonSize, 
                    onActivated = function() --[[ Line: 1734 ]] --[[ Name: onActivated ]]
                        -- upvalues: v321 (copy), l_universeId_3 (copy)
                        v321.props.openExperienceGuidelinesExplained(l_universeId_3, true);
                    end, 
                    backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
                }
            });
        end;
        if v363 then
            table.insert(v362, {
                props = {
                    anchorPoint = Vector2.new(0, 0.5), 
                    position = UDim2.fromScale(0, 0.5), 
                    text = v363, 
                    horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                    verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                    userInteractionEnabled = false, 
                    showBackground = true, 
                    size = v321.props.textButtonSize, 
                    backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
                }
            });
        end;
    else
        v362 = if v357 then {
            {
                props = {
                    anchorPoint = Vector2.new(0, 0.5), 
                    position = UDim2.fromScale(0, 0.5), 
                    text = v335, 
                    horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                    verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                    userInteractionEnabled = true, 
                    showBackground = true, 
                    size = v321.props.textButtonSize, 
                    onActivated = function() --[[ Line: 1769 ]] --[[ Name: onActivated ]]
                        -- upvalues: v321 (copy), l_universeId_3 (copy)
                        v321.props.openExperienceGuidelinesExplained(l_universeId_3, true);
                    end, 
                    backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
                }
            }
        } else nil;
    end;
    return l_withLocalization_0({
        buttonText = l_textKey_0
    })(function(v364) --[[ Line: 1781 ]]
        -- upvalues: v342 (copy), l_price_0 (copy), v321 (copy), l_deviceType_0 (copy), l_thumbnail_0 (ref), v331 (copy), l_FFlagHideCloseButtonEdp_0 (ref), l_tokens_0 (copy), l_universeId_3 (copy), v332 (copy), v333 (copy), v334 (copy), v329 (copy), v339 (copy), l_FFlagLuaAppEdpFixDefaultBanner_0 (ref), l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 (ref), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (ref), l_FFlagLuaAppEnablePlaySquadButton_0 (ref), l_icon_0 (copy), l_Images_0 (ref), v6 (ref), l_PlayButton_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v327 (copy), l_ButtonSize_0 (ref), v361 (copy), v362 (ref), v330 (copy), l_socialLinks_0 (copy), l_communityLink_0 (copy), v128 (ref), l_isFullscreen_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v42 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v336 (ref), v337 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), l_mediaGalleryShowIndex_0 (copy), l_isCrossFade_0 (copy), l_currentIndex_0 (copy), l_nextIndex_0 (copy), v353 (ref), v355 (ref), v352 (ref), v354 (ref), l_DetailsPageSelector_0 (ref)
        local l_buttonText_0 = v364.buttonText;
        if v342.localizedFiatPrice then
            l_buttonText_0 = v342.localizedFiatPrice;
        elseif l_price_0 then
            l_buttonText_0 = v321.getAbbreviateCount(l_price_0);
        end;
        local v366 = {
            deviceType = l_deviceType_0, 
            thumbnailImageUrl = l_thumbnail_0, 
            titleText = v331, 
            hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v321.props.hideCloseButton else nil, 
            actionBarLabelText = v321.props.playButtonContextualMessage, 
            renderInfoContent = v321.renderInfoContent(l_tokens_0, l_universeId_3, v332, v333, v334, v321.props.creatorVerified or false, v329, v339.plays, v339.totalUpVotes, v339.totalDownVotes), 
            onClose = v321.onClose
        };
        local v367;
        if l_FFlagLuaAppEdpFixDefaultBanner_0 then
            v367 = v321.props.defaultBannerUrl;
            if not v367 then
                local v368 = v321.state.bannerImageId or v321.props.bannerImageId;
                v367 = if v368 then "rbxassetid://" .. v368 else "";
            end;
        else
            local v369 = v321.state.bannerImageId or v321.props.bannerImageId;
            v367 = if v369 then "rbxassetid://" .. v369 else "";
        end;
        v366.bannerImageUrl = v367;
        v366.actionBarProps = {
            iconSize = v321.props.tokens.iconSize, 
            buttonHeight = v321.props.actionBarHeight, 
            buttonPadding = l_tokens_0.headerItemPadding, 
            button = if l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v321.props.hasUnifiedPlayButtonIxp) then nil else {
                props = if l_FFlagLuaAppEnablePlaySquadButton_0 and v342.showSquadButton then {
                    button = {
                        onActivated = v321.onPlayButtonActivated, 
                        icon = if l_icon_0 then l_Images_0[l_icon_0] else nil, 
                        text = l_buttonText_0, 
                        isDisabled = v342.isDisabled
                    }, 
                    overflow = {
                        isDisabled = v342.isSquadButtonDisabled, 
                        onActivated = v321.props.onPlaySquadButtonActivated
                    }, 
                    size = v321.props.playButtonSize
                } else {
                    onActivated = v321.onPlayButtonActivated, 
                    icon = if l_icon_0 then l_Images_0[l_icon_0] else nil, 
                    text = l_buttonText_0, 
                    isDisabled = v342.isDisabled, 
                    isLoading = v342.isLoading, 
                    buttonType = v342.buttonType, 
                    size = v321.props.playButtonSize, 
                    buttonRef = v321.props.playButtonRef
                }
            }, 
            buttonOverride = if l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v321.props.hasUnifiedPlayButtonIxp) then v6.createElement(l_PlayButton_0, {
                universeId = l_universeId_3, 
                referralSource = v321.props.referralSource, 
                launchSource = "ExperienceDetailsPage", 
                fillBehavior = "Fill", 
                experienceJoinData = v321.props.experienceJoinData, 
                placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v321.props.placeIdOverride else nil, 
                buttonSize = if v327 then l_ButtonSize_0.Medium else l_ButtonSize_0.Large, 
                squadButtonHeight = UDim.new(0, v321.props.actionBarHeight), 
                testId = "--experience-details--play-button"
            }) else nil, 
            icons = v361, 
            textButtons = v362
        };
        v366.actionBarWidth = if l_FFlagLuaAppEnablePlaySquadButton_0 and v342.showSquadButton then v321.applyTokenScaling(420) else v321.applyTokenScaling(380);
        v366.actionBarHeight = v321.props.actionBarHeight;
        v366.componentList = v321.getBodyComponentListProps(l_universeId_3, v321.props.gameDetailsPageDataStatus, v329, v330, v339.plays, v339.visits, l_socialLinks_0, l_communityLink_0, v321.props.communityLinksEnabled, v321.props.communityLinkVariant, v321.props.detailsPageConfiguration or v128, l_isFullscreen_0, v327, v321.props.bannerImageId, if v321.props.gameDetail then v321.props.gameDetail.refundPolicy else nil, if l_FFlagLuaAppShowNoticeOnEdp_0 then v321.props.experienceDetailsNoticeType else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui() then v321.props.sduiFeedItemConfigs else nil, if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v336 else nil, if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v337 else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v321.props.webViewSupport else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v321.props.openWebview else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v321.props.linking else nil);
        v366.isFullscreen = l_isFullscreen_0;
        v366.renderFullscreenContent = v321.renderFullscreenContent(l_universeId_3, l_mediaGalleryShowIndex_0, l_isFullscreen_0, l_isCrossFade_0, l_currentIndex_0, l_nextIndex_0);
        v366.sideMargin = v353;
        v366.startingOffsetPosition = v355;
        v366.thumbnailHeight = v352;
        v366.headerBarBackgroundHeight = v354;
        v366.dualPanelBreakpoint = 1e999;
        v366.maxContentWidth = 850;
        v366.tokens = if l_tokens_0 then {
            thumbnailMargin = l_tokens_0.thumbnailMargin, 
            thumbnailShadowHeight = l_tokens_0.thumbnailShadowHeight, 
            headerGradientHeight = l_tokens_0.headerGradientHeight, 
            headerBottomMargin = l_tokens_0.headerBottomMargin, 
            animationConfig = l_tokens_0.animationConfig, 
            itemPadding = l_tokens_0.itemPadding, 
            safeAreaSize = l_tokens_0.safeAreaSize, 
            trailingWhitespace = l_tokens_0.trailingWhitespace, 
            actionBarHeight = v321.props.actionBarHeight
        } else nil;
        v366.disableStickyActionBar = v321.props.disableStickyActionBar;
        v366.containerRef = v321.props.containerRef;
        return v6.createElement(l_DetailsPageSelector_0, {
            deviceType = l_deviceType_0, 
            detailsPageProps = v366
        });
    end);
end;
return function(v370) --[[ Line: 1943 ]] --[[ Name: ExperienceDetailsPageFn ]]
    -- upvalues: l_FFlagEDPTTITrackingEnabled_0 (copy), l_useFirstMediaCarouselImageUri_0 (copy), v84 (copy), l_EDPTTIConstants_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v42 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), v77 (copy), v78 (copy), v123 (copy), v124 (copy), v76 (copy), v79 (copy), l_useUiModeInfo_0 (copy), v27 (copy), v5 (copy), l_UiMode_0 (copy), l_useTokens_0 (copy), l_FFlagLuaAppFixEdpInitialFocus_0 (copy), v11 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_useCloseWithBackButton_0 (copy), v6 (copy), v125 (copy), v7 (copy)
    if l_FFlagEDPTTITrackingEnabled_0 then
        local v371 = l_useFirstMediaCarouselImageUri_0(v370.universeId);
        v84(l_EDPTTIConstants_0.EDP_IMPLEMENTATION.LEGACY_FULL_PAGE, v370.universeId, v371);
    end;
    local v372 = nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then
        v372 = v42.getShouldHydrateLegacy();
    end;
    local v373 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v373 = v42.getShouldInterleaveSdui();
    end;
    local v374 = nil;
    local v375 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        local v376 = v77.useSduiContextFromSignalAndProcessConfigs(v78.getUnprocessedEdpStoreKey((tostring(v370.universeId))), v78.getEdpStoreKey((tostring(v370.universeId))), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v373);
        v374 = v77.useSduiEdpFeedItemConfigs({
            sduiContext = v376, 
            storeKey = v78.getEdpStoreKey((tostring(v370.universeId))), 
            portraitLayoutConfig = v123, 
            landscapeLayoutConfig = v124, 
            defaultLayoutOrder = v123.SduiFeedItemsDefault, 
            logLayoutConflictFn = v76.logSduiLayoutOrderConflict, 
            shouldInterleaveSdui = l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v373
        });
        v375 = v79();
    end;
    local v377 = l_useUiModeInfo_0();
    local v378 = v27.useFocusGuiObject();
    local v379, v380 = v5.useState(nil);
    local v381 = if v370.tokens then v370.tokens.iconSize else 0;
    local v382 = if v377.uiMode == l_UiMode_0.TenFoot then UDim2.fromOffset(v381, v381) else nil;
    local v383 = UDim2.fromOffset(0, v381);
    local v384 = v370.tokens and v370.tokens.actionBarHeight or v381;
    local v385 = UDim2.new(1, 0, 0, v384);
    local v386 = l_useTokens_0();
    local v387 = nil;
    local v388 = nil;
    if l_FFlagLuaAppFixEdpInitialFocus_0 then
        v388 = v5.useRef(nil);
        v388.current = v11.usePreferredInput() == v11.Input.Directional;
    end;
    local v389 = if l_FFlagLuaAppFixEdpInitialFocus_0 then v388.current else v11.usePreferredInput() == v11.Input.Directional;
    if l_FFlagHideCloseButtonEdp_0 then
        v387 = v389;
    end;
    local v390 = nil;
    if l_FFlagLuaAppFixEdpInitialFocus_0 then
        v380 = l_useCloseWithBackButton_0(v380, v370.onClose);
        local v391 = nil;
        local v392, v393 = v5.useState(nil);
        v391 = v392;
        v390 = v393;
        v392 = v5.useRef(nil);
        do
            local l_v391_0 = v391;
            v5.useEffect(function() --[[ Line: 2021 ]]
                -- upvalues: l_v391_0 (ref), v392 (copy), v388 (ref), v378 (copy)
                if l_v391_0 == nil then
                    v392.current = false;
                    return;
                else
                    if l_v391_0 and v388.current and not v392.current then
                        v378(l_v391_0);
                        v392.current = true;
                    end;
                    return;
                end;
            end, {
                l_v391_0, 
                v378
            });
            v5.useEffect(function() --[[ Line: 2033 ]]
                -- upvalues: v379 (copy)
                local v395 = -1;
                local v396 = nil;
                if v379 then
                    v396 = v379.SelectionChanged:Connect(function(_, v398, v399) --[[ Line: 2037 ]]
                        -- upvalues: v379 (ref), v395 (ref)
                        if v399 == nil or v398 == nil or not v399:IsDescendantOf(v379) or not v398:IsDescendantOf(v379) then
                            return;
                        else
                            v399.SelectionOrder = v395;
                            v395 = v395 - 1;
                            return;
                        end;
                    end);
                end;
                return function() --[[ Line: 2051 ]]
                    -- upvalues: v396 (ref)
                    if v396 then
                        v396:Disconnect();
                    end;
                end;
            end, {
                v379
            });
        end;
    end;
    return v6.createElement(v125, v7.Dictionary.join({
        foundationTokens = v386, 
        uiModeInfo = v377, 
        focusGuiObject = v378, 
        iconButtonSize = v382, 
        textButtonSize = v383, 
        playButtonSize = v385, 
        actionBarHeight = v384, 
        playButtonRef = if l_FFlagLuaAppFixEdpInitialFocus_0 then v390 else nil, 
        containerRef = v380, 
        sduiFeedItemConfigs = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v373 then v374 else nil, 
        disableStickyActionBar = v389, 
        hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v387 else nil, 
        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v372 else nil, 
        shouldInterleaveSduiIxp = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v373 else nil, 
        edpServerIxpVariables = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v373 then v375 else nil
    }, v370));
end;