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
local l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTenftUiDetailsMoreDropupMenu;
local l_GetFFlagExpDetailsUseSelectionBumpers_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagExpDetailsUseSelectionBumpers;
local v83 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local v84 = require(l_Modules_1.LuaApp.Flags.GetFFlagLuaAppEnableNotificationsEDPTooltip);
local v85 = require(l_Modules_1.LuaApp.Flags.GetFIntNotificationsEDPTooltipTimeLimit);
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
local v100 = require(l_Modules_1.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation);
local v101 = require(l_Modules_1.LuaApp.Flags.FFlagCreatorSubtitleNavigationIXPEnabled);
local v102 = require(l_Modules_1.LuaApp.Flags.FStringCreatorSubtitleNavigationExperimentLayer);
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
local v117 = l_FFlagLuaAppGameStatsFallbackRendering_0 and "--" or nil;
local v118 = {
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
local v119 = {
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
local v120 = v6.PureComponent:extend("ExperienceDetailsPage");
v120.validateProps = v9.strictInterface({
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
    openCreatorPage = if v100 then nil else v9.callback, 
    openCommunityProfilePage = if v100 then v9.optional(v9.callback) else nil, 
    openUserProfilePage = if v100 then v9.optional(v9.callback) else nil, 
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
local function _(v121) --[[ Line: 338 ]] --[[ Name: createImageURL ]]
    if v121 then
        return "rbxassetid://" .. v121;
    else
        return "";
    end;
end;
local v123 = {
    showEventsList = true, 
    showLogoTraySection = true, 
    showCornerGradientPropEnabled = false, 
    showCommunityLink = false
};
v120.init = function(v124) --[[ Line: 353 ]] --[[ Name: init ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), l_abbreviateCount_0 (copy), l_UiMode_0 (copy), l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_memoize_0 (copy), l_Text_0 (copy), l_FFlagLuaAppGameStatsFallbackRendering_0 (copy), v6 (copy), l_StyledTextLabel_0 (copy), v84 (copy), l_withStyle_0 (copy), v83 (copy), v101 (copy), l_IXPServiceWrapper_0 (copy), v102 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), v62 (copy), v100 (copy), v29 (copy), v5 (copy), v73 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameStats_0 (copy), l_PlayerCount_0 (copy), v117 (copy), l_Images_0 (copy), v67 (copy), l_RetrievalStatus_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), v68 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (copy), v61 (copy), v63 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), v44 (copy), v69 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), v80 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (copy), v72 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_ExperienceRatings_0 (copy), v70 (copy), v64 (copy), v74 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), v75 (copy), l_ExperienceCommunityLink_0 (copy), l_checkAndFormatPossibleLink_0 (copy), l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (copy), v65 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (copy), v118 (copy), v119 (copy), l_ContentPosition_0 (copy), l_GetFFlagExpDetailsUseSelectionBumpers_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v42 (copy), l_ExperienceDetailsNoticeType_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v46 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_AppStorageService_0 (copy)
    local v125 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v124.applyTokenScaling = function(v126) --[[ Line: 355 ]]
        -- upvalues: v124 (copy)
        return v126 * v124.props.foundationTokens.Stroke.Standard;
    end;
    v124.getAbbreviateCount = function(v127) --[[ Line: 360 ]]
        -- upvalues: l_abbreviateCount_0 (ref), v125 (copy)
        return l_abbreviateCount_0(v127, v125:GetLocale());
    end;
    v124.upperString = function(v128) --[[ Line: 363 ]]
        -- upvalues: v125 (copy)
        return string.upper(v125:Format(v128));
    end;
    v124.onPlayButtonActivated = function() --[[ Line: 367 ]]
        -- upvalues: v124 (copy)
        return v124.props.onPlayButtonActivated();
    end;
    v124.openMoreContextualMenu = function(v129) --[[ Line: 371 ]]
        -- upvalues: v124 (copy), l_UiMode_0 (ref), l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
        local l_universeId_0 = v124.props.universeId;
        local v131 = nil;
        local v132 = nil;
        local v133 = v124.props.uiModeInfo and v124.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        if l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0() and v133 then
            v131 = Vector2.new(0, 1);
            v132 = UDim2.fromOffset(v129.AbsolutePosition.X, v129.AbsolutePosition.Y - 12);
        else
            v132 = UDim2.fromOffset(v129.AbsolutePosition.X + v129.AbsoluteSize.X - 300, v129.AbsolutePosition.Y + v129.AbsoluteSize.Y + 12);
        end;
        return v124.props.openMoreContextualMenu(l_universeId_0, v132, v131, if l_FFlagHideCloseButtonEdp_0 then v124.props.hideCloseButton else nil);
    end;
    v124.getTextHeight = l_memoize_0(function(v134, v135, v136, v137) --[[ Line: 398 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextHeight(v134, v135, v136, v137);
    end);
    v124.openShareContextualMenu = function(v138) --[[ Line: 402 ]]
        -- upvalues: v124 (copy), l_FFlagHideCloseButtonEdp_0 (ref)
        local l_universeId_1 = v124.props.universeId;
        local v140 = UDim2.fromOffset(v138.AbsolutePosition.X + v138.AbsoluteSize.X - 300, v138.AbsolutePosition.Y + v138.AbsoluteSize.Y + 12);
        return v124.props.openShareContextualMenu(l_universeId_1, v140, if l_FFlagHideCloseButtonEdp_0 then v124.props.hideCloseButton else nil);
    end;
    v124.getPlaysAnsVisitsInfo = function(v141, v142) --[[ Line: 416 ]]
        -- upvalues: l_FFlagLuaAppGameStatsFallbackRendering_0 (ref)
        return {
            plays = v141 and v141.playing or v142 and v142.playerCount or if l_FFlagLuaAppGameStatsFallbackRendering_0 then nil else 0, 
            visits = v141 and v141.visits or if l_FFlagLuaAppGameStatsFallbackRendering_0 then nil else 0, 
            totalUpVotes = v142 and v142.totalUpVotes or 0, 
            totalDownVotes = v142 and v142.totalDownVotes or 1
        };
    end;
    v124.getStyledTextLabel = function(v143, v144, v145) --[[ Line: 427 ]]
        -- upvalues: v6 (ref), l_StyledTextLabel_0 (ref)
        if v143 then
            return v6.createElement(l_StyledTextLabel_0, {
                text = v143, 
                fontStyle = v144, 
                colorStyle = v145, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 1, 
                richText = false, 
                lineHeight = 1
            });
        else
            return nil;
        end;
    end;
    v124.toggleFollowExperience = function() --[[ Line: 443 ]]
        -- upvalues: v84 (ref), v124 (copy)
        if v84() then
            v124:setState({
                isNotificationsTooltipActive = false
            });
        end;
        if not v124.props.gameFollowings then
            return;
        else
            local l_universeId_2 = v124.props.universeId;
            local l_isFollowed_0 = v124.props.gameFollowings.isFollowed;
            if v124.props.toggleFollowExperience then
                v124.props.toggleFollowExperience(l_universeId_2, not l_isFollowed_0);
            end;
            return;
        end;
    end;
    v124.renderSubtitleTextOverride = function(v148, v149, v150, _, v152, v153) --[[ Line: 462 ]]
        -- upvalues: l_withStyle_0 (ref), v83 (ref), v101 (ref), l_IXPServiceWrapper_0 (ref), v102 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v125 (copy), v62 (ref), v6 (ref), v100 (ref), v124 (copy), v29 (ref)
        local function _(v154) --[[ Line: 470 ]]
            -- upvalues: l_withStyle_0 (ref), v83 (ref), v101 (ref), l_IXPServiceWrapper_0 (ref), v102 (ref), v153 (copy), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v150 (copy), v149 (copy), v125 (ref), v62 (ref), v6 (ref), v100 (ref), v124 (ref)
            return l_withStyle_0(function(v155) --[[ Line: 471 ]]
                -- upvalues: v83 (ref), v101 (ref), l_IXPServiceWrapper_0 (ref), v102 (ref), v154 (copy), v153 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v150 (ref), v149 (ref), v125 (ref), v62 (ref), v6 (ref), v100 (ref), v124 (ref)
                local v156 = if v83 then v155.Tokens.Semantic.Typography.Subheader else v155.Font.Header2;
                local v157 = if v83 then v156.FontSize else v156.RelativeSize * v155.Font.BaseSize;
                local l_TextMuted_0 = v155.Theme.TextMuted;
                if v101 then
                    l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v102);
                end;
                if v154 and v153 then
                    local v159 = {
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.game.info.creator({
                            creatorType = v150, 
                            creatorId = v149
                        }), 
                        extraProps = {
                            title = v125:Format("Feature.GameDetails.Label.Developer"), 
                            transitionAnimation = v62.SlideInFromRight
                        }
                    };
                    return v6.createElement("TextButton", {
                        Text = v154, 
                        Font = v156.Font, 
                        TextColor3 = l_TextMuted_0.Color, 
                        LayoutOrder = 2, 
                        AutoButtonColor = false, 
                        LineHeight = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextSize = v157, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = function() --[[ Line: 509 ]]
                            -- upvalues: v100 (ref), v150 (ref), v124 (ref), v149 (ref), v159 (copy)
                            if v100 then
                                if v150 == "User" then
                                    v124.props.openUserProfilePage(v149, "ExperienceDetailsPage:SubTitle");
                                    return;
                                elseif v150 == "Group" then
                                    v124.props.openCommunityProfilePage(v149, "ExperienceDetailsPage:SubTitle");
                                    return;
                                end;
                            else
                                v124.props.openCreatorPage(v159);
                            end;
                        end
                    });
                else
                    return v124.getStyledTextLabel(v154, v156, l_TextMuted_0);
                end;
            end);
        end;
        return v6.createElement(v29.EmojiWrapper, {
            emoji = if v152 then v29.emoji.verified else "", 
            layoutOrder = 2, 
            onActivated = if v152 and v153 then v124.props.openVerifiedBadgeModal else nil
        }, {
            userText = l_withStyle_0(function(v161) --[[ Line: 471 ]]
                -- upvalues: v83 (ref), v101 (ref), l_IXPServiceWrapper_0 (ref), v102 (ref), v148 (copy), v153 (copy), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v150 (copy), v149 (copy), v125 (ref), v62 (ref), v6 (ref), v100 (ref), v124 (ref)
                local v162 = if v83 then v161.Tokens.Semantic.Typography.Subheader else v161.Font.Header2;
                local v163 = if v83 then v162.FontSize else v162.RelativeSize * v161.Font.BaseSize;
                local l_TextMuted_1 = v161.Theme.TextMuted;
                if v101 then
                    l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v102);
                end;
                if v148 and v153 then
                    local v165 = {
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.game.info.creator({
                            creatorType = v150, 
                            creatorId = v149
                        }), 
                        extraProps = {
                            title = v125:Format("Feature.GameDetails.Label.Developer"), 
                            transitionAnimation = v62.SlideInFromRight
                        }
                    };
                    return v6.createElement("TextButton", {
                        Text = v148, 
                        Font = v162.Font, 
                        TextColor3 = l_TextMuted_1.Color, 
                        LayoutOrder = 2, 
                        AutoButtonColor = false, 
                        LineHeight = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextSize = v163, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = function() --[[ Line: 509 ]]
                            -- upvalues: v100 (ref), v150 (ref), v124 (ref), v149 (ref), v165 (copy)
                            if v100 then
                                if v150 == "User" then
                                    v124.props.openUserProfilePage(v149, "ExperienceDetailsPage:SubTitle");
                                    return;
                                elseif v150 == "Group" then
                                    v124.props.openCommunityProfilePage(v149, "ExperienceDetailsPage:SubTitle");
                                    return;
                                end;
                            else
                                v124.props.openCreatorPage(v165);
                            end;
                        end
                    });
                else
                    return v124.getStyledTextLabel(v148, v162, l_TextMuted_1);
                end;
            end)
        });
    end;
    v124.renderTextOverride = function(v166, _, _, v169) --[[ Line: 536 ]]
        -- upvalues: l_withStyle_0 (ref), v83 (ref), v124 (copy), v6 (ref), v29 (ref)
        local function _(v170) --[[ Line: 537 ]]
            -- upvalues: l_withStyle_0 (ref), v83 (ref), v124 (ref)
            return l_withStyle_0(function(v171) --[[ Line: 538 ]]
                -- upvalues: v83 (ref), v124 (ref), v170 (copy)
                local v172 = if v83 then v171.Tokens.Semantic.Typography.Subheader else v171.Font.Header2;
                local l_TextEmphasis_0 = v171.Theme.TextEmphasis;
                return v124.getStyledTextLabel(v170, v172, l_TextEmphasis_0);
            end);
        end;
        return v6.createElement(v29.EmojiWrapper, {
            emoji = if v169 then v29.emoji.verified else "", 
            layoutOrder = 0, 
            size = UDim2.fromScale(0, 1)
        }, {
            userText = l_withStyle_0(function(v175) --[[ Line: 538 ]]
                -- upvalues: v83 (ref), v124 (ref), v166 (copy)
                local v176 = if v83 then v175.Tokens.Semantic.Typography.Subheader else v175.Font.Header2;
                local l_TextEmphasis_1 = v175.Theme.TextEmphasis;
                return v124.getStyledTextLabel(v166, v176, l_TextEmphasis_1);
            end)
        });
    end;
    v124.renderExperienceGuidelines = l_memoize_0(function(v178) --[[ Line: 556 ]]
        -- upvalues: v5 (ref), v73 (ref), l_FFlagHideCloseButtonEdp_0 (ref), v124 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
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
                universeId = v178, 
                LayoutOrder = 1, 
                hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v124.props.hideCloseButton else nil, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v124.props.shouldHydrateLegacyIxp else nil
            })
        });
    end);
    v124.renderInlinePlayerCountAndLikes = l_memoize_0(function(v179, v180, v181) --[[ Line: 580 ]]
        -- upvalues: v6 (ref), l_GameStats_0 (ref)
        return v6.createElement("Frame", {
            Size = UDim2.new(0, 120, 0, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            GameStats = v6.createElement(l_GameStats_0, {
                stats = {
                    playerCount = v179, 
                    totalUpVotes = v180, 
                    totalDownVotes = v181
                }
            })
        });
    end);
    v124.renderBriefDescription = function(v182, v183) --[[ Line: 596 ]]
        -- upvalues: l_withStyle_0 (ref), v83 (ref), v124 (copy), v6 (ref), l_StyledTextLabel_0 (ref)
        return l_withStyle_0(function(v184) --[[ Line: 597 ]]
            -- upvalues: v182 (copy), v83 (ref), v124 (ref), v183 (copy), v6 (ref), l_StyledTextLabel_0 (ref)
            local l_Font_0 = v184.Font;
            local l_headerDescriptionLineHeight_0 = v182.headerDescriptionLineHeight;
            local v187 = l_headerDescriptionLineHeight_0 * math.floor(l_Font_0.BaseSize * l_Font_0.Body.RelativeSize) * v182.headerDescriptionMaxRows;
            local v188 = if v83 then v184.Tokens.Semantic.Typography.Body.FontSize else l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            local v189 = if v83 then v184.Tokens.Semantic.Typography.Body.Font else l_Font_0.Body.Font;
            local v190 = v124.getTextHeight(v183, v189, v188, UDim2.new(1, 0, 0, v187));
            return v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, (math.min(v190, v187))), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                ClipsDescendants = true
            }, {
                GameDescriptionText = v6.createElement(l_StyledTextLabel_0, {
                    text = v183, 
                    fontStyle = if v83 then v184.Tokens.Semantic.Typography.Body else l_Font_0.Body, 
                    colorStyle = v184.Theme.TextEmphasis, 
                    size = UDim2.fromScale(1, 1), 
                    richText = false, 
                    fluidSizing = false, 
                    lineHeight = l_headerDescriptionLineHeight_0
                })
            });
        end);
    end;
    v124.renderInfoContent = function(v191, v192, v193, v194, v195, v196, v197, v198, v199, v200) --[[ Line: 632 ]]
        -- upvalues: v124 (copy), l_UiMode_0 (ref), v100 (ref), v6 (ref)
        local v201 = v124.props.uiModeInfo and v124.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        local v202 = v191 and v191.headerItemPadding or 0;
        local v203 = v201 and v197 ~= nil and #v197 > 0;
        local v204 = not v201;
        return function() --[[ Line: 651 ]]
            -- upvalues: v100 (ref), v124 (ref), v193 (copy), v194 (copy), v195 (copy), v192 (copy), v196 (copy), l_UiMode_0 (ref), v6 (ref), v202 (copy), v201 (copy), v198 (copy), v199 (copy), v200 (copy), v203 (copy), v191 (copy), v197 (copy), v204 (copy)
            local v205 = if v100 then v124.renderSubtitleTextOverride(v193, v194, v195, v192, v196, v124.props.uiModeInfo.uiMode ~= l_UiMode_0.TenFoot) else v124.renderSubtitleTextOverride(v193, v194, v195, v192, v196);
            return v6.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v6.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, v202)
                }), 
                SubtitleText = v205, 
                Padding = if v202 then v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v202)
                }) else nil, 
                PlayStats = if v201 then v124.renderInlinePlayerCountAndLikes(v198, v199, v200) else nil, 
                Description = if v203 then v124.renderBriefDescription(v191, v197) else nil, 
                ExperienceGuidelinesComponent = if v204 then v124.renderExperienceGuidelines(v192) else nil
            });
        end;
    end;
    v124.renderPlaysAndVisits = l_memoize_0(function(v206, v207) --[[ Line: 690 ]]
        -- upvalues: v6 (ref), l_PlayerCount_0 (ref), l_FFlagLuaAppGameStatsFallbackRendering_0 (ref), v117 (ref), v124 (copy), l_Images_0 (ref)
        return function() --[[ Line: 691 ]]
            -- upvalues: v6 (ref), l_PlayerCount_0 (ref), l_FFlagLuaAppGameStatsFallbackRendering_0 (ref), v206 (copy), v117 (ref), v124 (ref), l_Images_0 (ref), v207 (copy)
            return v6.createElement(l_PlayerCount_0, {
                layoutOrder = 1, 
                countLeft = {
                    countText = if l_FFlagLuaAppGameStatsFallbackRendering_0 and v206 == nil then v117 else v124.getAbbreviateCount(v206), 
                    labelText = v124.upperString("Feature.GameDetails.Label.Playing"), 
                    icon = l_Images_0["icons/status/games/people-playing_large"]
                }, 
                countRight = {
                    countText = if l_FFlagLuaAppGameStatsFallbackRendering_0 and v207 == nil then v117 else v124.getAbbreviateCount(v207), 
                    labelText = v124.upperString("Feature.GameDetails.Label.Visits"), 
                    icon = l_Images_0["icons/status/games/sessions_large"]
                }
            });
        end;
    end);
    v124.onFocusChanged = function(v208) --[[ Line: 712 ]]
        -- upvalues: v124 (copy)
        if v124.props.setControllerBarNavigation then
            local v209 = not v208;
            v124.props.setControllerBarNavigation(v209);
        end;
    end;
    v124.renderDescription = l_memoize_0(function(v210, v211) --[[ Line: 719 ]]
        -- upvalues: v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v124 (copy)
        return function() --[[ Line: 720 ]]
            -- upvalues: v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v210 (copy), v211 (copy), v124 (ref)
            return v6.createElement(v67, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(v210), 
                descriptionText = v211, 
                onFocusChanged = v124.onFocusChanged
            });
        end;
    end);
    if l_FFlagLuaAppShowNoticeOnEdp_0 then
        v124.renderNotice = l_memoize_0(function(v212) --[[ Line: 730 ]]
            -- upvalues: l_withLocalization_0 (ref), v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v124 (copy)
            return function() --[[ Line: 731 ]]
                -- upvalues: l_withLocalization_0 (ref), v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v212 (copy), v124 (ref)
                return l_withLocalization_0({
                    noticeHeader = "Feature.ExperienceDetails.Body.NotesTitle", 
                    noticeText = "Feature.ExperienceDetails.Notes.InExperiencePurchase"
                })(function(v213) --[[ Line: 735 ]]
                    -- upvalues: v6 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v212 (ref), v124 (ref)
                    return v6.createElement(v67, {
                        dataStatus = l_RetrievalStatus_0.fromRawValue(v212), 
                        headerText = v213.noticeHeader, 
                        descriptionText = v213.noticeText, 
                        onFocusChanged = v124.onFocusChanged
                    });
                end);
            end;
        end);
    end;
    v124.renderIgrsRatingLabel = if l_FFlagLuaAppAddIgrsRatingToEdp_0 then l_memoize_0(function(v214, v215, v216, v217, v218) --[[ Line: 748 ]]
        -- upvalues: v5 (ref), v68 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v61 (ref), v125 (copy), v124 (copy), v63 (ref)
        return function() --[[ Line: 749 ]]
            -- upvalues: v5 (ref), v68 (ref), v214 (copy), v215 (copy), v216 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v217 (copy), v61 (ref), v125 (ref), v124 (ref), v63 (ref), v218 (copy)
            return v5.createElement(v68, {
                igrsRating = v214, 
                igrsRatingDisplayMessage = v215, 
                onActivated = v216 and function() --[[ Line: 754 ]]
                    -- upvalues: l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v217 (ref), v61 (ref), v125 (ref), v124 (ref)
                    if l_FFlagLuaAppIgrsRatingPropMemoization_0 then
                        v217(v61.INDONESIAN_CONTENT_MATURITY_URL, v125:Format("Feature.GameDetails.Label.ContentMaturity"));
                        return;
                    else
                        v124.props.openWebview(v61.INDONESIAN_CONTENT_MATURITY_URL, v125:Format("Feature.GameDetails.Label.ContentMaturity"));
                        return;
                    end;
                end or function() --[[ Line: 767 ]]
                    -- upvalues: v63 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v218 (ref), v124 (ref), v61 (ref)
                    v63(if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v218 else v124.props.linking, v61.INDONESIAN_CONTENT_MATURITY_URL);
                end
            });
        end;
    end) else nil;
    v124.renderLogoTray = l_memoize_0(function(v219, v220) --[[ Line: 778 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (ref), v124 (copy), v5 (ref), v44 (ref), v6 (ref), v69 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v80 (ref), l_AppPage_0 (ref)
        return function() --[[ Line: 779 ]]
            -- upvalues: l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (ref), v124 (ref), v5 (ref), v44 (ref), v6 (ref), v69 (ref), v219 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v220 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v80 (ref), l_AppPage_0 (ref)
            if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then
                local v221 = ("EXPERIENCE_SOCIAL_LINKS_%*"):format(v124.props.universeId);
                local v222 = v5.createRef();
                local v223 = v44.Signal.new();
                return v5.createElement(v5.Fragment, nil, {
                    ExperienceLogoTray = v6.createElement(v69, {
                        socialLinks = v219, 
                        linking = if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v220 else v124.props.linking, 
                        openLeaveRobloxAlertUIBlox = v124.props.openLeaveRobloxAlertUIBlox, 
                        closeAlert = v124.props.closeAlert, 
                        impressionsTag = v221, 
                        forwardRef = v222, 
                        onAbsolutePositionChanged = function(_) --[[ Line: 791 ]]
                            -- upvalues: v223 (copy)
                            v223:fire();
                        end, 
                        universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v124.props.universeId else nil
                    }), 
                    EdpSocialLinksImpressionsDetector = v6.createElement(v80, {
                        parentRef = v222, 
                        scrollViewPositionChangedSignal = v223, 
                        pageContext = l_AppPage_0.ExperienceDetail, 
                        impressionsTag = v221, 
                        socialLinks = v219, 
                        universeId = v124.props.universeId
                    })
                });
            else
                return v6.createElement(v69, {
                    socialLinks = v219, 
                    linking = if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v220 else v124.props.linking, 
                    openLeaveRobloxAlertUIBlox = v124.props.openLeaveRobloxAlertUIBlox, 
                    closeAlert = v124.props.closeAlert, 
                    universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v124.props.universeId else nil
                });
            end;
        end;
    end);
    local function _(v225) --[[ Line: 827 ]] --[[ Name: handleControllerBarInMediaGalleryFullscreen ]]
        -- upvalues: v124 (copy)
        if v124.props.setControllerBarNavigation then
            v124.props.setControllerBarNavigation(v225);
        end;
    end;
    v124.onMediaGalleryPreviewActivated = function(v227, v228) --[[ Line: 833 ]]
        -- upvalues: v124 (copy), l_UiMode_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (ref)
        local v229 = v124.props.uiModeInfo and v124.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        if not v124.state.isFullscreen and v229 and v124.props.setControllerBarNavigation then
            v124.props.setControllerBarNavigation(false);
        end;
        v124:setState({
            isFullscreen = true, 
            mediaGalleryShowIndex = v227, 
            currentIndex = if v229 then v227 else nil
        });
        if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and v124.props.onMediaGalleryEnterFullscreen then
            v124.props.onMediaGalleryEnterFullscreen(v227, v228);
            return;
        else
            if l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 and v124.props.onMediaGalleryPreviewActivated then
                v124.props.onMediaGalleryPreviewActivated(v227);
            end;
            return;
        end;
    end;
    v124.renderMediaGallery = l_memoize_0(function(v230, v231) --[[ Line: 852 ]]
        -- upvalues: v124 (copy), l_UiMode_0 (ref), v6 (ref), v72 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref)
        if v124.props.uiModeInfo and v124.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            return function() --[[ Line: 855 ]]
                -- upvalues: v6 (ref), v72 (ref), v124 (ref), v230 (copy), v231 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(v72, {
                    tokens = v124.props.tokens, 
                    deviceType = v124.props.deviceType, 
                    universeId = v230, 
                    onPreviewActivated = v124.onMediaGalleryPreviewActivated, 
                    isFullscreenState = v231, 
                    exitFullscreen = v124.onClose, 
                    onSelectionGained = v124.onSelectionGained, 
                    mediaGalleryGainFocused = v124.mediaGalleryGainFocused, 
                    uiMode = v124.props.uiModeInfo.uiMode, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v124.props.shouldHydrateLegacyIxp else nil
                });
            end;
        else
            return function() --[[ Line: 872 ]]
                -- upvalues: v6 (ref), v72 (ref), v124 (ref), v230 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), v231 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(v72, {
                    deviceType = v124.props.deviceType, 
                    universeId = v230, 
                    startIndex = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v124.state.mediaGalleryShowIndex else nil, 
                    onPreviewActivated = v124.onMediaGalleryPreviewActivated, 
                    onThumbnailActivated = if not l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 or l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v124.props.onMediaGalleryThumbnailActivated, 
                    onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v124.props.onMediaGalleryMediaChanged else nil, 
                    isOccluded = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and (l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryVideoPreview_0) then v231 else nil, 
                    mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v124.props.mediaGalleryRedesignEnabledIxp else nil, 
                    mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v124.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v124.props.shouldHydrateLegacyIxp else nil
                });
            end;
        end;
    end);
    v124.renderExperienceRating = l_memoize_0(function(v232) --[[ Line: 903 ]]
        -- upvalues: v6 (ref), l_ExperienceRatings_0 (ref), v124 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
        return function() --[[ Line: 904 ]]
            -- upvalues: v6 (ref), l_ExperienceRatings_0 (ref), v232 (copy), v124 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
            return v6.createElement(l_ExperienceRatings_0, {
                universeId = v232, 
                height = math.floor((v124.applyTokenScaling(72))), 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v124.props.shouldHydrateLegacyIxp else nil, 
                styleProps = {
                    statWidgetIconSize = math.floor((v124.applyTokenScaling(48)))
                }
            });
        end;
    end);
    v124.renderExperienceInfoTable = l_memoize_0(function(v233) --[[ Line: 918 ]]
        -- upvalues: v6 (ref), v124 (copy), v70 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
        return function() --[[ Line: 919 ]]
            -- upvalues: v6 (ref), v124 (ref), v70 (ref), v233 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
            return v6.createElement("Folder", {
                [v6.Ref] = v124.props.statsAndInfoRef
            }, v6.createElement(v70, {
                renderTextOverride = v124.renderTextOverride, 
                universeId = v233, 
                key = "ExperienceInfoTable", 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v124.props.shouldHydrateLegacyIxp else nil, 
                hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v124.props.hideCloseButton else nil
            }));
        end;
    end);
    v124.renderEventsList = l_memoize_0(function(v234, v235) --[[ Line: 938 ]]
        -- upvalues: v6 (ref), v64 (ref)
        return function() --[[ Line: 939 ]]
            -- upvalues: v6 (ref), v64 (ref), v234 (copy), v235 (copy)
            return v6.createElement(v64, {
                universeId = v234, 
                referralSource = "expDetailsPage", 
                defaultThumbnail = if v235 then "rbxassetid://" .. v235 else nil
            });
        end;
    end);
    v124.renderRecommendedExperiencesCarousel = l_memoize_0(function(v236) --[[ Line: 948 ]]
        -- upvalues: v6 (ref), v74 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v124 (copy), l_AppPage_0 (ref)
        return function() --[[ Line: 949 ]]
            -- upvalues: v6 (ref), v74 (ref), v236 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v124 (ref), l_AppPage_0 (ref)
            return v6.createElement(v74, {
                universeId = v236, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v124.props.shouldHydrateLegacyIxp else nil, 
                pageContext = l_AppPage_0.ExperienceDetail
            });
        end;
    end);
    if l_FFlagSongEdpCarouselIxp_0 then
        v124.renderExperienceSongsCarousel = l_memoize_0(function(v237, v238) --[[ Line: 961 ]]
            -- upvalues: v5 (ref), v75 (ref)
            return function() --[[ Line: 962 ]]
                -- upvalues: v5 (ref), v75 (ref), v237 (copy), v238 (copy)
                return v5.createElement(v75, {
                    universeId = v237, 
                    fractionalItemAmount = 0, 
                    universeTitle = v238 or "", 
                    collectionOrder = 2, 
                    clipsDescendants = true
                });
            end;
        end);
    end;
    v124.renderCommunityLink = l_memoize_0(function(v239, v240, v241) --[[ Line: 974 ]]
        -- upvalues: v5 (ref), l_ExperienceCommunityLink_0 (ref)
        return function() --[[ Line: 975 ]]
            -- upvalues: v5 (ref), l_ExperienceCommunityLink_0 (ref), v239 (copy), v240 (copy), v241 (copy)
            return v5.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16)
                }), 
                ExperienceCommunityLink = v5.createElement(l_ExperienceCommunityLink_0, {
                    communityInfo = v239, 
                    experienceName = v240 or "", 
                    universeId = v241
                })
            });
        end;
    end);
    v124.linkStartStyle = l_memoize_0(function(v242) --[[ Line: 993 ]]
        local l_Color3_0 = v242.Tokens.Semantic.Color.Text.Link.Color3;
        return (("<font color=\"%*\"><b>"):format((string.format("rgb(%d, %d, %d)", math.round(l_Color3_0.R * 255), math.round(l_Color3_0.G * 255), (math.round(l_Color3_0.B * 255))))));
    end);
    v124.checkAndFormatPossibleLink = l_memoize_0(function(v244, v245) --[[ Line: 1005 ]]
        -- upvalues: l_checkAndFormatPossibleLink_0 (ref), v124 (copy)
        return l_checkAndFormatPossibleLink_0(v245, nil, nil, v124.linkStartStyle(v244), "</b></font>");
    end);
    v124.renderRefundPolicy = l_memoize_0(function(v246) --[[ Line: 1011 ]]
        -- upvalues: l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (ref), l_withStyle_0 (ref), v6 (ref), v65 (ref), v124 (copy), v5 (ref)
        return function() --[[ Line: 1012 ]]
            -- upvalues: l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (ref), l_withStyle_0 (ref), v6 (ref), v65 (ref), v246 (copy), v124 (ref), v5 (ref)
            if l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 then
                return l_withStyle_0(function(v247) --[[ Line: 1014 ]]
                    -- upvalues: v6 (ref), v65 (ref), v246 (ref)
                    return v6.createElement(v65, {
                        refundPolicy = v246, 
                        paddingTop = v247.Tokens.Global.Space_300
                    });
                end);
            else
                return l_withStyle_0(function(v248) --[[ Line: 1021 ]]
                    -- upvalues: v124 (ref), v246 (ref), v5 (ref)
                    local l_Body_0 = v248.Tokens.Semantic.Typography.Body;
                    local l_Muted_0 = v248.Tokens.Semantic.Color.Text.Muted;
                    local v251, v252 = v124.checkAndFormatPossibleLink(v248, v246.policyText);
                    return v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        UIPadding = v5.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, v248.Tokens.Global.Space_300)
                        }), 
                        RefundPolicy = v5.createElement("TextButton", {
                            BackgroundTransparency = 1, 
                            Text = v252, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Font = l_Body_0.Font, 
                            TextSize = l_Body_0.FontSize, 
                            TextColor3 = l_Muted_0.Color3, 
                            TextTransparency = l_Muted_0.Transparency, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            RichText = v251, 
                            [v5.Event.Activated] = function(_) --[[ Line: 1048 ]]
                                -- upvalues: v124 (ref), v246 (ref)
                                v124.props.openRefundPolicyLearnMorePage(v246.learnMoreUrl);
                            end
                        })
                    });
                end);
            end;
        end;
    end);
    v124.getBodyComponentListProps = l_memoize_0(function(v254, v255, v256, v257, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275) --[[ Line: 1058 ]]
        -- upvalues: v124 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (ref), v118 (ref), v119 (ref), l_ContentPosition_0 (ref), l_GetFFlagExpDetailsUseSelectionBumpers_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v42 (ref), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_ExperienceDetailsNoticeType_0 (ref), l_FFlagSongEdpCarouselIxp_0 (ref)
        local v276 = v264.showLogoTraySection and v260 and next(v260);
        local v277 = v264.showCommunityLink and v262 and v263 == "banner" and v261;
        local l_showEventsList_0 = v264.showEventsList;
        local v279 = v124.props.webViewSupport and v268 ~= nil;
        local v280 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.Description else 20;
        local v281 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.MediaGallery else 40;
        local v282 = if not v266 then v280 else v281;
        local v283 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.EventsListRedesign else v282 - 10;
        local v284 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.EventsListRedesign else 10;
        local l_Left_0 = l_ContentPosition_0.Left;
        local v286 = {
            MediaGallery = {
                portraitLayoutOrder = if not v266 then if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.MediaGalleryMediaFirst else 5 else v280, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.MediaGallery else 10, 
                landscapePosition = l_ContentPosition_0.Right, 
                showCornerGradient = not v264.showCornerGradientPropEnabled and nil, 
                useSelectionBumper = l_GetFFlagExpDetailsUseSelectionBumpers_0() and true or nil, 
                renderComponent = v124.renderMediaGallery(v254, v265)
            }, 
            Description = {
                portraitLayoutOrder = v282, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.Description else 20, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v124.renderDescription(v255, v256)
            }, 
            IgrsRatingLabel = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and v271 then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.IgrsRatingLabel else 45, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.IgrsRatingLabel else 30, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v124.renderIgrsRatingLabel(v271, v272, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v273 else v124.props.webViewSupport, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v274 else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v275 else nil)
            } else nil, 
            ExperienceRatings = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui()) and v124.props.edpServerIxpVariables and v124.props.edpServerIxpVariables.hideGameRatings == true then nil else {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.ExperienceRatings else 50, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.ExperienceRatings else 40, 
                landscapePosition = l_ContentPosition_0.Left, 
                useSelectionBumper = l_GetFFlagExpDetailsUseSelectionBumpers_0() and true or nil, 
                renderComponent = v124.renderExperienceRating(v254)
            }, 
            PlaysAndVisits = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui()) and v124.props.edpServerIxpVariables and v124.props.edpServerIxpVariables.showVisitsInInfoList == true then nil else {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.PlaysAndVisits else 60, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.PlaysAndVisits else 50, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v124.renderPlaysAndVisits(v258, v259)
            }, 
            CommunityLink = if v277 then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.CommunityLink else 70, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.CommunityLink else 60, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v124.renderCommunityLink(v261, v257, v254)
            } else nil, 
            ExperienceInfoTable = {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.ExperienceInfoTable else 80, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.ExperienceInfoTable else 70, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v124.renderExperienceInfoTable(v254)
            }, 
            RefundPolicy = if v279 then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.RefundPolicy else 85, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.RefundPolicy else 75, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v124.renderRefundPolicy(v268)
            } else nil, 
            LogoTraySection = v276 and {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.LogoTraySection else 90, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.LogoTraySection else 80, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v124.renderLogoTray(v260, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v275 else nil)
            } or nil, 
            EventsList = if l_showEventsList_0 then {
                portraitLayoutOrder = v283, 
                landscapeLayoutOrder = v284, 
                landscapePosition = l_Left_0, 
                renderComponent = v124.renderEventsList(v254, v267)
            } else nil, 
            Notice = if l_FFlagLuaAppShowNoticeOnEdp_0 and v269 == l_ExperienceDetailsNoticeType_0.InExperiencePurchase then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.Notice else 100, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.Notice else 100, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v124.renderNotice(v255)
            } else nil, 
            RecommendedExperiences = {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.RecommendedExperiences else 110, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.RecommendedExperiences else 30, 
                landscapePosition = l_ContentPosition_0.Right, 
                useSelectionBumper = l_GetFFlagExpDetailsUseSelectionBumpers_0() and true or nil, 
                renderComponent = v124.renderRecommendedExperiencesCarousel(v254)
            }, 
            ExperienceSongsCarousel = if l_FFlagSongEdpCarouselIxp_0 and v124.props.showSongCarousel then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v118.ExperienceSongsCarousel else 120, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v119.ExperienceSongsCarousel else 35, 
                landscapePosition = l_ContentPosition_0.Right, 
                renderComponent = v124.renderExperienceSongsCarousel(v254, v257)
            } else nil
        };
        if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v124.props.shouldInterleaveSduiIxp) and v270 then
            for v287, v288 in v270 do
                v286[("SduiFeedItem_%*"):format(v287)] = {
                    portraitLayoutOrder = v288.portraitLayoutOrder, 
                    landscapeLayoutOrder = v288.landscapeLayoutOrder, 
                    landscapePosition = l_ContentPosition_0.Left, 
                    renderComponent = v288.renderComponent
                };
            end;
        end;
        return v286;
    end);
    v124.onClose = function() --[[ Line: 1312 ]]
        -- upvalues: v124 (copy), l_UiMode_0 (ref)
        if v124.state.isFullscreen then
            v124:setState({
                isFullscreen = false
            });
            if v124.props.uiModeInfo and v124.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot and v124.props.setControllerBarNavigation then
                v124.props.setControllerBarNavigation(true);
                return;
            end;
        else
            v124.props.onClose();
        end;
    end;
    v124.exitFullscreen = l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and function(v289, v290) --[[ Line: 1329 ]]
        -- upvalues: v124 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref)
        if not v124.state.isFullscreen then
            return;
        else
            if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and v124.props.onMediaGalleryExitFullscreen then
                v124.props.onMediaGalleryExitFullscreen(v289, v290);
            end;
            v124:setState({
                isFullscreen = false, 
                mediaGalleryShowIndex = v289
            });
            return;
        end;
    end or nil;
    v124.focusEventHandlers = {
        [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
            handler = v46.onRelease(function(v291) --[[ Line: 1347 ]]
                -- upvalues: v124 (copy)
                v124.onClose();
                v291:cancel();
            end)
        }
    };
    v124.renderFullscreenContent = l_memoize_0(function(v292, v293, v294, v295, v296, v297) --[[ Line: 1355 ]]
        -- upvalues: v124 (copy), l_UiMode_0 (ref), v6 (ref), v72 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref)
        if v124.props.uiModeInfo and v124.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            return function() --[[ Line: 1358 ]]
                -- upvalues: v6 (ref), v72 (ref), v124 (ref), v292 (copy), v293 (copy), v294 (copy), v295 (copy), v297 (copy), v296 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(v72, {
                    tokens = v124.props.tokens, 
                    universeId = v292, 
                    isFullscreen = true, 
                    fullscreenShowIndex = v293, 
                    deviceType = v124.props.deviceType, 
                    isFullscreenState = v294, 
                    isCrossFade = v295, 
                    setCrossFade = v124.setCrossFade, 
                    nextIndex = v297, 
                    currentIndex = v296, 
                    setCurrentIndex = v124.setCurrentIndex, 
                    uiMode = v124.props.uiModeInfo.uiMode, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v124.props.shouldHydrateLegacyIxp else nil
                });
            end;
        else
            return function() --[[ Line: 1378 ]]
                -- upvalues: v6 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v124 (ref), v72 (ref), v292 (copy), v293 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(l_FocusNavigableSurfaceWrapper_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    isIsolated = true, 
                    customEventHandlers = v124.focusEventHandlers
                }, {
                    ExperienceMediaGallery = v6.createElement(v72, {
                        universeId = v292, 
                        isFullscreen = true, 
                        fullscreenShowIndex = v293, 
                        onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v124.props.onMediaGalleryMediaChanged else nil, 
                        startIndex = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v293 else nil, 
                        exitFullscreen = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v124.exitFullscreen else nil, 
                        mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v124.props.mediaGalleryRedesignEnabledIxp else nil, 
                        mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v124.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v124.props.shouldHydrateLegacyIxp else nil
                    })
                });
            end;
        end;
    end);
    v124.resolveTitleText = function(v298, v299) --[[ Line: 1409 ]]
        return v298 and v298.name or v299 and v299.name or nil;
    end;
    v124.checkCommunityLinkExposureLogging = function() --[[ Line: 1414 ]]
        -- upvalues: v124 (copy), l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
        if v124.props.communityLink then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.EDPCommunityLinksLayer);
        end;
    end;
    if v124.props.uiModeInfo and v124.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
        v124.state = {
            bannerImageId = v124.props.bannerImageId, 
            isCrossFade = false, 
            currentIndex = 1, 
            nextIndex = 1
        };
        v124.setCurrentIndex = function(v300) --[[ Line: 1429 ]]
            -- upvalues: v124 (copy)
            v124:setState({
                currentIndex = v300
            });
        end;
        v124.setCrossFade = function(v301) --[[ Line: 1435 ]]
            -- upvalues: v124 (copy)
            v124:setState({
                isCrossFade = v301
            });
        end;
        v124.onSelectionGained = function(v302, v303) --[[ Line: 1441 ]]
            -- upvalues: v124 (copy)
            if v124.state.nextIndex ~= v302 and v124.state.isCrossFade == false then
                v124.setCrossFade(true);
            end;
            v124:setState({
                bannerImageId = v303, 
                nextIndex = v302
            });
        end;
        v124.mediaGalleryGainFocused = function(v304) --[[ Line: 1452 ]]
            -- upvalues: v124 (copy)
            if not v304 then
                v124:setState({
                    bannerImageId = v124.props.bannerImageId
                });
            end;
        end;
    end;
    if v84() then
        v124.isMounted = false;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 1464 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            return l_AppStorageService_0:GetItem("ShowNotificationsOptInTooltip");
        end);
        v124.showTooltip = if l_status_0 then l_result_0 == "true" else false;
        v124:setState({
            isNotificationsTooltipActive = v124.showTooltip
        });
    end;
end;
v120.didMount = function(v307) --[[ Line: 1473 ]] --[[ Name: didMount ]]
    -- upvalues: v84 (copy), l_AppStorageService_0 (copy), v8 (copy), v85 (copy)
    v307.checkCommunityLinkExposureLogging();
    if v84() then
        v307.isMounted = true;
        if v307.showTooltip then
            pcall(function() --[[ Line: 1479 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                l_AppStorageService_0:SetItem("ShowNotificationsOptInTooltip", "false");
                l_AppStorageService_0:Flush();
            end);
        end;
        v8.delay(v85()):andThen(function() --[[ Line: 1485 ]]
            -- upvalues: v307 (copy)
            if v307.isMounted then
                v307:setState({
                    isNotificationsTooltipActive = false
                });
            end;
        end);
    end;
end;
v120.didUpdate = function(v308, v309) --[[ Line: 1495 ]] --[[ Name: didUpdate ]]
    if not v309.communityLink then
        v308.checkCommunityLinkExposureLogging();
    end;
end;
v120.render = function(v310) --[[ Line: 1501 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_RetrievalStatus_1 (copy), v6 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    if v4 then
        if v310.props.gameDetailsPageDataStatus == l_RetrievalStatus_1.Failed and not v310.props.gameInfo then
            return v310:renderOnFailed();
        else
            return v310:renderOnLoaded();
        end;
    else
        return v6.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(v310.props.gameDetailsPageDataStatus), 
            renderOnFailed = function() --[[ Line: 1519 ]] --[[ Name: renderOnFailed ]]
                -- upvalues: v310 (copy)
                if v310.props.gameInfo then
                    return v310:renderOnLoaded();
                else
                    return v310:renderOnFailed();
                end;
            end, 
            renderOnLoaded = function() --[[ Line: 1527 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v310 (copy)
                return v310:renderOnLoaded();
            end, 
            renderOnLoading = function() --[[ Line: 1530 ]] --[[ Name: renderOnLoading ]]
                -- upvalues: v310 (copy)
                return v310:renderOnLoading();
            end
        });
    end;
end;
v120.renderOnLoading = function(_) --[[ Line: 1536 ]] --[[ Name: renderOnLoading ]]
    -- upvalues: v6 (copy), v71 (copy)
    return v6.createElement(v71);
end;
v120.renderOnFailed = function(v312) --[[ Line: 1540 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: l_withLocalization_0 (copy), l_EnumGameDetailErrorTypes_0 (copy), v6 (copy), l_EmptyState_0 (copy)
    return l_withLocalization_0({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet", 
        experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable"
    })(function(v313) --[[ Line: 1544 ]]
        -- upvalues: v312 (copy), l_EnumGameDetailErrorTypes_0 (ref), v6 (ref), l_EmptyState_0 (ref)
        local v314 = nil;
        v314 = v312.props.gameDetailError and v312.props.gameDetailError.errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
        return v6.createElement(l_EmptyState_0, {
            onActivated = if v314 then nil else v312.props.fetchGameDetailsPageData, 
            text = if v314 then v313.experienceUnavailableMessage else v313.failedMessage
        });
    end);
end;
v120.willUnmount = function(v315) --[[ Line: 1555 ]] --[[ Name: willUnmount ]]
    -- upvalues: v84 (copy)
    if v84() then
        v315.isMounted = false;
    end;
end;
v120.renderOnLoaded = function(v316) --[[ Line: 1561 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: l_UiMode_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_getPlayButtonProps_0 (copy), v84 (copy), l_DeviceType_0 (copy), l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v42 (copy), v7 (copy), l_Images_0 (copy), v6 (copy), v5 (copy), v66 (copy), l_TooltipOrientation_0 (copy), l_withLocalization_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_FFlagLuaAppEdpFixDefaultBanner_0 (copy), l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButton_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_ButtonSize_0 (copy), v123 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (copy), l_DetailsPageSelector_0 (copy)
    local l_deviceType_0 = v316.props.deviceType;
    local l_universeId_3 = v316.props.universeId;
    local l_gameInfo_0 = v316.props.gameInfo;
    local l_thumbnail_0 = v316.props.thumbnail;
    local l_tokens_0 = v316.props.tokens;
    local v322 = v316.props.uiModeInfo and v316.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
    l_thumbnail_0 = l_thumbnail_0 and l_thumbnail_0.url;
    local l_gameDetail_0 = v316.props.gameDetail;
    local v324 = l_gameDetail_0 and l_gameDetail_0.description or nil;
    local v325 = l_gameDetail_0 and l_gameDetail_0.name or nil;
    local v326 = v316.resolveTitleText(l_gameDetail_0, l_gameInfo_0);
    local v327 = l_gameDetail_0 and l_gameDetail_0.creator.name or nil;
    local v328 = l_gameDetail_0 and l_gameDetail_0.creator.id or nil;
    local v329 = l_gameDetail_0 and l_gameDetail_0.creator.type or nil;
    local v330 = nil;
    local v331 = nil;
    local v332 = nil;
    if v316.props.ageRecommendations then
        local l_summary_0 = v316.props.ageRecommendations.summary;
        v330 = if l_summary_0 and l_summary_0.ageRecommendation then if l_summary_0.ageRecommendation.displayNameWithHeaderShort then l_summary_0.ageRecommendation.displayNameWithHeaderShort else l_summary_0.ageRecommendation.displayName else nil;
        if l_FFlagLuaAppAddIgrsRatingToEdp_0 then
            v331 = if l_summary_0 and l_summary_0.ageRecommendation and l_summary_0.ageRecommendation.igrsRating and l_summary_0.ageRecommendation.igrsRating ~= "" then l_summary_0.ageRecommendation.igrsRating else nil;
            v332 = if l_summary_0 and l_summary_0.ageRecommendation and l_summary_0.ageRecommendation.igrsRatingDisplayMessage then l_summary_0.ageRecommendation.igrsRatingDisplayMessage else nil;
        end;
    end;
    local v334 = v316.getPlaysAnsVisitsInfo(l_gameDetail_0, l_gameInfo_0);
    local l_socialLinks_0 = v316.props.socialLinks;
    local l_communityLink_0 = v316.props.communityLink;
    local v337 = l_getPlayButtonProps_0(v316.props.playButtonState, v316.props.gameProductInfo);
    local l_textKey_0 = v337.textKey;
    local l_price_0 = v337.price;
    local l_icon_0 = v337.icon;
    local v341 = if v84() then v316.state.isNotificationsTooltipActive else false;
    local l_isFullscreen_0 = v316.state.isFullscreen;
    local l_isCrossFade_0 = v316.state.isCrossFade;
    local l_currentIndex_0 = v316.state.currentIndex;
    local l_nextIndex_0 = v316.state.nextIndex;
    local l_mediaGalleryShowIndex_0 = v316.state.mediaGalleryShowIndex;
    local v347 = nil;
    local v348 = nil;
    local v349 = nil;
    if l_tokens_0 then
        v347 = l_tokens_0.thumbnailSize;
        v348 = l_tokens_0.sideMargin;
        v349 = l_tokens_0.headerBarBackgroundHeight;
    end;
    local v350 = nil;
    if l_deviceType_0 == l_DeviceType_0.Tablet then
        v350 = math.min(v316.props.viewHeight / 3, 500);
        v347 = 200;
    elseif not v322 then
        v350 = 208;
    end;
    local v351 = not v322;
    local v352 = v322 and v330;
    local v353 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or v316.props.enableNotificationsDiscoverability;
    local l_notificationsCanEnableExperience_0 = v316.props.notificationsCanEnableExperience;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui()) and v316.props.edpServerIxpVariables and v316.props.edpServerIxpVariables.hideNotifyButton == true then
        v353 = false;
    end;
    local v356 = v7.List.filter({
        v351 and {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = l_Images_0["icons/actions/friends/friendsplaying"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v316.openShareContextualMenu, 
                size = v316.props.iconButtonSize, 
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
                onActivated = v316.openMoreContextualMenu, 
                size = v316.props.iconButtonSize, 
                backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
            }
        }, 
        v353 and l_notificationsCanEnableExperience_0 and {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = if v316.props.gameFollowings and v316.props.gameFollowings.isFollowed then l_Images_0["icons/common/notificationOn"] else l_Images_0["icons/common/notificationOff"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v316.toggleFollowExperience, 
                size = v316.props.iconButtonSize, 
                backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil, 
                [v6.Children] = if v84() then {
                    Tooltip = v5.createElement(v66, {
                        isActive = v341, 
                        preferredOrientation = l_TooltipOrientation_0.Bottom
                    })
                } else nil
            }
        } or nil
    }, function(v355) --[[ Line: 1706 ]]
        return v355 ~= nil;
    end);
    local v357 = nil;
    local v358 = nil;
    if v322 then
        v358 = v316.props.gameDetail and v316.props.gameDetail.licenseDescription or nil;
        if v352 or v358 then
            v357 = {};
        end;
        if v352 then
            table.insert(v357, {
                props = {
                    anchorPoint = Vector2.new(0, 0.5), 
                    position = UDim2.fromScale(0, 0.5), 
                    text = v330, 
                    horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                    verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                    userInteractionEnabled = true, 
                    showBackground = true, 
                    size = v316.props.textButtonSize, 
                    onActivated = function() --[[ Line: 1728 ]] --[[ Name: onActivated ]]
                        -- upvalues: v316 (copy), l_universeId_3 (copy)
                        v316.props.openExperienceGuidelinesExplained(l_universeId_3, true);
                    end, 
                    backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
                }
            });
        end;
        if v358 then
            table.insert(v357, {
                props = {
                    anchorPoint = Vector2.new(0, 0.5), 
                    position = UDim2.fromScale(0, 0.5), 
                    text = v358, 
                    horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                    verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                    userInteractionEnabled = false, 
                    showBackground = true, 
                    size = v316.props.textButtonSize, 
                    backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
                }
            });
        end;
    else
        v357 = if v352 then {
            {
                props = {
                    anchorPoint = Vector2.new(0, 0.5), 
                    position = UDim2.fromScale(0, 0.5), 
                    text = v330, 
                    horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                    verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                    userInteractionEnabled = true, 
                    showBackground = true, 
                    size = v316.props.textButtonSize, 
                    onActivated = function() --[[ Line: 1763 ]] --[[ Name: onActivated ]]
                        -- upvalues: v316 (copy), l_universeId_3 (copy)
                        v316.props.openExperienceGuidelinesExplained(l_universeId_3, true);
                    end, 
                    backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
                }
            }
        } else nil;
    end;
    return l_withLocalization_0({
        buttonText = l_textKey_0
    })(function(v359) --[[ Line: 1775 ]]
        -- upvalues: v337 (copy), l_price_0 (copy), v316 (copy), l_deviceType_0 (copy), l_thumbnail_0 (ref), v326 (copy), l_FFlagHideCloseButtonEdp_0 (ref), l_tokens_0 (copy), l_universeId_3 (copy), v327 (copy), v328 (copy), v329 (copy), v324 (copy), v334 (copy), l_FFlagLuaAppEdpFixDefaultBanner_0 (ref), l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 (ref), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (ref), l_FFlagLuaAppEnablePlaySquadButton_0 (ref), l_icon_0 (copy), l_Images_0 (ref), v6 (ref), l_PlayButton_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v322 (copy), l_ButtonSize_0 (ref), v356 (copy), v357 (ref), v325 (copy), l_socialLinks_0 (copy), l_communityLink_0 (copy), v123 (ref), l_isFullscreen_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v42 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v331 (ref), v332 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), l_mediaGalleryShowIndex_0 (copy), l_isCrossFade_0 (copy), l_currentIndex_0 (copy), l_nextIndex_0 (copy), v348 (ref), v350 (ref), v347 (ref), v349 (ref), l_DetailsPageSelector_0 (ref)
        local l_buttonText_0 = v359.buttonText;
        if v337.localizedFiatPrice then
            l_buttonText_0 = v337.localizedFiatPrice;
        elseif l_price_0 then
            l_buttonText_0 = v316.getAbbreviateCount(l_price_0);
        end;
        local v361 = {
            deviceType = l_deviceType_0, 
            thumbnailImageUrl = l_thumbnail_0, 
            titleText = v326, 
            hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v316.props.hideCloseButton else nil, 
            actionBarLabelText = v316.props.playButtonContextualMessage, 
            renderInfoContent = v316.renderInfoContent(l_tokens_0, l_universeId_3, v327, v328, v329, v316.props.creatorVerified or false, v324, v334.plays, v334.totalUpVotes, v334.totalDownVotes), 
            onClose = v316.onClose
        };
        local v362;
        if l_FFlagLuaAppEdpFixDefaultBanner_0 then
            v362 = v316.props.defaultBannerUrl;
            if not v362 then
                local v363 = v316.state.bannerImageId or v316.props.bannerImageId;
                v362 = if v363 then "rbxassetid://" .. v363 else "";
            end;
        else
            local v364 = v316.state.bannerImageId or v316.props.bannerImageId;
            v362 = if v364 then "rbxassetid://" .. v364 else "";
        end;
        v361.bannerImageUrl = v362;
        v361.actionBarProps = {
            iconSize = v316.props.tokens.iconSize, 
            buttonHeight = v316.props.actionBarHeight, 
            buttonPadding = l_tokens_0.headerItemPadding, 
            button = if l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v316.props.hasUnifiedPlayButtonIxp) then nil else {
                props = if l_FFlagLuaAppEnablePlaySquadButton_0 and v337.showSquadButton then {
                    button = {
                        onActivated = v316.onPlayButtonActivated, 
                        icon = if l_icon_0 then l_Images_0[l_icon_0] else nil, 
                        text = l_buttonText_0, 
                        isDisabled = v337.isDisabled
                    }, 
                    overflow = {
                        isDisabled = v337.isSquadButtonDisabled, 
                        onActivated = v316.props.onPlaySquadButtonActivated
                    }, 
                    size = v316.props.playButtonSize
                } else {
                    onActivated = v316.onPlayButtonActivated, 
                    icon = if l_icon_0 then l_Images_0[l_icon_0] else nil, 
                    text = l_buttonText_0, 
                    isDisabled = v337.isDisabled, 
                    isLoading = v337.isLoading, 
                    buttonType = v337.buttonType, 
                    size = v316.props.playButtonSize, 
                    buttonRef = v316.props.playButtonRef
                }
            }, 
            buttonOverride = if l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v316.props.hasUnifiedPlayButtonIxp) then v6.createElement(l_PlayButton_0, {
                universeId = l_universeId_3, 
                referralSource = v316.props.referralSource, 
                launchSource = "ExperienceDetailsPage", 
                fillBehavior = "Fill", 
                experienceJoinData = v316.props.experienceJoinData, 
                placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v316.props.placeIdOverride else nil, 
                buttonSize = if v322 then l_ButtonSize_0.Medium else l_ButtonSize_0.Large, 
                squadButtonHeight = UDim.new(0, v316.props.actionBarHeight), 
                testId = "--experience-details--play-button"
            }) else nil, 
            icons = v356, 
            textButtons = v357
        };
        v361.actionBarWidth = if l_FFlagLuaAppEnablePlaySquadButton_0 and v337.showSquadButton then v316.applyTokenScaling(420) else v316.applyTokenScaling(380);
        v361.actionBarHeight = v316.props.actionBarHeight;
        v361.componentList = v316.getBodyComponentListProps(l_universeId_3, v316.props.gameDetailsPageDataStatus, v324, v325, v334.plays, v334.visits, l_socialLinks_0, l_communityLink_0, v316.props.communityLinksEnabled, v316.props.communityLinkVariant, v316.props.detailsPageConfiguration or v123, l_isFullscreen_0, v322, v316.props.bannerImageId, if v316.props.gameDetail then v316.props.gameDetail.refundPolicy else nil, if l_FFlagLuaAppShowNoticeOnEdp_0 then v316.props.experienceDetailsNoticeType else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui() then v316.props.sduiFeedItemConfigs else nil, if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v331 else nil, if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v332 else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v316.props.webViewSupport else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v316.props.openWebview else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v316.props.linking else nil);
        v361.isFullscreen = l_isFullscreen_0;
        v361.renderFullscreenContent = v316.renderFullscreenContent(l_universeId_3, l_mediaGalleryShowIndex_0, l_isFullscreen_0, l_isCrossFade_0, l_currentIndex_0, l_nextIndex_0);
        v361.sideMargin = v348;
        v361.startingOffsetPosition = v350;
        v361.thumbnailHeight = v347;
        v361.headerBarBackgroundHeight = v349;
        v361.dualPanelBreakpoint = 1e999;
        v361.maxContentWidth = 850;
        v361.tokens = if l_tokens_0 then {
            thumbnailMargin = l_tokens_0.thumbnailMargin, 
            thumbnailShadowHeight = l_tokens_0.thumbnailShadowHeight, 
            headerGradientHeight = l_tokens_0.headerGradientHeight, 
            headerBottomMargin = l_tokens_0.headerBottomMargin, 
            animationConfig = l_tokens_0.animationConfig, 
            itemPadding = l_tokens_0.itemPadding, 
            safeAreaSize = l_tokens_0.safeAreaSize, 
            trailingWhitespace = l_tokens_0.trailingWhitespace, 
            actionBarHeight = v316.props.actionBarHeight
        } else nil;
        v361.disableStickyActionBar = v316.props.disableStickyActionBar;
        v361.containerRef = v316.props.containerRef;
        return v6.createElement(l_DetailsPageSelector_0, {
            deviceType = l_deviceType_0, 
            detailsPageProps = v361
        });
    end);
end;
return function(v365) --[[ Line: 1937 ]] --[[ Name: ExperienceDetailsPageFn ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v42 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), v77 (copy), v78 (copy), v118 (copy), v119 (copy), v76 (copy), v79 (copy), l_useUiModeInfo_0 (copy), v27 (copy), v5 (copy), l_UiMode_0 (copy), l_useTokens_0 (copy), l_FFlagLuaAppFixEdpInitialFocus_0 (copy), v11 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_useCloseWithBackButton_0 (copy), v6 (copy), v120 (copy), v7 (copy)
    local v366 = nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then
        v366 = v42.getShouldHydrateLegacy();
    end;
    local v367 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v367 = v42.getShouldInterleaveSdui();
    end;
    local v368 = nil;
    local v369 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        local v370 = v77.useSduiContextFromSignalAndProcessConfigs(v78.getUnprocessedEdpStoreKey((tostring(v365.universeId))), v78.getEdpStoreKey((tostring(v365.universeId))), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v367);
        v368 = v77.useSduiEdpFeedItemConfigs({
            sduiContext = v370, 
            storeKey = v78.getEdpStoreKey((tostring(v365.universeId))), 
            portraitLayoutConfig = v118, 
            landscapeLayoutConfig = v119, 
            defaultLayoutOrder = v118.SduiFeedItemsDefault, 
            logLayoutConflictFn = v76.logSduiLayoutOrderConflict, 
            shouldInterleaveSdui = l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v367
        });
        v369 = v79();
    end;
    local v371 = l_useUiModeInfo_0();
    local v372 = v27.useFocusGuiObject();
    local v373, v374 = v5.useState(nil);
    local v375 = if v365.tokens then v365.tokens.iconSize else 0;
    local v376 = if v371.uiMode == l_UiMode_0.TenFoot then UDim2.fromOffset(v375, v375) else nil;
    local v377 = UDim2.fromOffset(0, v375);
    local v378 = v365.tokens and v365.tokens.actionBarHeight or v375;
    local v379 = UDim2.new(1, 0, 0, v378);
    local v380 = l_useTokens_0();
    local v381 = nil;
    local v382 = nil;
    if l_FFlagLuaAppFixEdpInitialFocus_0 then
        v382 = v5.useRef(nil);
        v382.current = v11.usePreferredInput() == v11.Input.Directional;
    end;
    local v383 = if l_FFlagLuaAppFixEdpInitialFocus_0 then v382.current else v11.usePreferredInput() == v11.Input.Directional;
    if l_FFlagHideCloseButtonEdp_0 then
        v381 = v383;
    end;
    local v384 = nil;
    if l_FFlagLuaAppFixEdpInitialFocus_0 then
        v374 = l_useCloseWithBackButton_0(v374, v365.onClose);
        local v385 = nil;
        local v386, v387 = v5.useState(nil);
        v385 = v386;
        v384 = v387;
        v386 = v5.useRef(nil);
        do
            local l_v385_0 = v385;
            v5.useEffect(function() --[[ Line: 2010 ]]
                -- upvalues: l_v385_0 (ref), v386 (copy), v382 (ref), v372 (copy)
                if l_v385_0 == nil then
                    v386.current = false;
                    return;
                else
                    if l_v385_0 and v382.current and not v386.current then
                        v372(l_v385_0);
                        v386.current = true;
                    end;
                    return;
                end;
            end, {
                l_v385_0, 
                v372
            });
            v5.useEffect(function() --[[ Line: 2022 ]]
                -- upvalues: v373 (copy)
                local v389 = -1;
                local v390 = nil;
                if v373 then
                    v390 = v373.SelectionChanged:Connect(function(_, v392, v393) --[[ Line: 2026 ]]
                        -- upvalues: v373 (ref), v389 (ref)
                        if v393 == nil or v392 == nil or not v393:IsDescendantOf(v373) or not v392:IsDescendantOf(v373) then
                            return;
                        else
                            v393.SelectionOrder = v389;
                            v389 = v389 - 1;
                            return;
                        end;
                    end);
                end;
                return function() --[[ Line: 2040 ]]
                    -- upvalues: v390 (ref)
                    if v390 then
                        v390:Disconnect();
                    end;
                end;
            end, {
                v373
            });
        end;
    end;
    return v6.createElement(v120, v7.Dictionary.join({
        foundationTokens = v380, 
        uiModeInfo = v371, 
        focusGuiObject = v372, 
        iconButtonSize = v376, 
        textButtonSize = v377, 
        playButtonSize = v379, 
        actionBarHeight = v378, 
        playButtonRef = if l_FFlagLuaAppFixEdpInitialFocus_0 then v384 else nil, 
        containerRef = v374, 
        sduiFeedItemConfigs = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v367 then v368 else nil, 
        disableStickyActionBar = v383, 
        hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v381 else nil, 
        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v366 else nil, 
        shouldInterleaveSduiIxp = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v367 else nil, 
        edpServerIxpVariables = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v367 then v369 else nil
    }, v365));
end;