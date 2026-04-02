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
local v45 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_ExperienceCommunityLink_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Components.ExperienceCommunityLink;
local v47 = require(l_CorePackages_0.Packages.InputHandlers);
local v48 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v48.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v48.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v48.FocusNavigationEventNameEnum;
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
local v62 = require(l_Modules_1.LuaApp.Constants);
local v63 = require(l_Modules_1.LuaApp.Enum.TransitionAnimation);
local v64 = require(l_Modules_1.LuaApp.openExternalBrowser);
local v65 = require(l_Modules_1.LuaApp.Components.VirtualEvents.EventsListWrapper);
local v66 = require(l_Modules_1.LuaApp.Components.GameDetails.GameRefundPolicy);
local v67 = require(l_Modules_1.LuaApp.Components.GameDetails.GameDetailNotificationsButtonHint);
local v68 = require(script.Parent.ExperienceDescription);
local v69 = require(script.Parent.IgrsRatingLabel);
local v70 = require(script.Parent.ExperienceLogoTray);
local v71 = require(script.Parent.ExperienceInfoTable);
local v72 = require(script.Parent.ExperienceDetailsLoadingStatePage);
local v73 = require(script.Parent.ExperienceMediaGallery);
local v74 = require(script.Parent.ExperienceTagsContainer);
local v75 = require(script.Parent.RecommendedExperienceCarousel);
local v76 = require(script.Parent.ExperienceSongsCarousel);
local v77 = require(l_Modules_1.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters);
local v78 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local v79 = require(script.Parent.EdpSduiUtils);
local v80 = require(script.Parent.Hooks.useEdpServerIxpVariables);
local v81 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.EdpSocialLinksImpressionsDetector);
local v82 = require(l_CorePackages_0.Workspace.Packages.GameDetailTelemetry);
local l_EDPTTIConstants_0 = v82.EDPTTIConstants;
local l_FFlagEDPTTITrackingEnabled_0 = v82.FFlagEDPTTITrackingEnabled;
local v85 = require(script.Parent.useEDPTTITracking);
local l_useFirstMediaCarouselImageUri_0 = require(script.Parent.useFirstMediaCarouselImageUri).useFirstMediaCarouselImageUri;
local l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTenftUiDetailsMoreDropupMenu;
local l_GetFFlagExpDetailsUseSelectionBumpers_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagExpDetailsUseSelectionBumpers;
local v89 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local v90 = require(l_Modules_1.LuaApp.Flags.GetFFlagLuaAppEnableNotificationsEDPTooltip);
local v91 = require(l_Modules_1.LuaApp.Flags.GetFIntNotificationsEDPTooltipTimeLimit);
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
local v106 = require(l_Modules_1.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation);
local v107 = require(l_Modules_1.LuaApp.Flags.FFlagCreatorSubtitleNavigationIXPEnabled);
local v108 = require(l_Modules_1.LuaApp.Flags.FStringCreatorSubtitleNavigationExperimentLayer);
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
local l_FFlagLuaAppExpandableTextImpressionsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled;
local l_FFlagLuaAppAddIgrsRatingToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp;
local l_FFlagLuaAppIgrsRatingPropMemoization_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppIgrsRatingPropMemoization;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v125 = l_FFlagLuaAppGameStatsFallbackRendering_0 and "--" or nil;
local v126 = {
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
local v127 = {
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
local v128 = v6.PureComponent:extend("ExperienceDetailsPage");
v128.validateProps = v9.strictInterface({
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
    openCreatorPage = if v106 then nil else v9.callback, 
    openCommunityProfilePage = if v106 then v9.optional(v9.callback) else nil, 
    openUserProfilePage = if v106 then v9.optional(v9.callback) else nil, 
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
local function _(v129) --[[ Line: 348 ]] --[[ Name: createImageURL ]]
    if v129 then
        return "rbxassetid://" .. v129;
    else
        return "";
    end;
end;
local v131 = {
    showEventsList = true, 
    showLogoTraySection = true, 
    showCornerGradientPropEnabled = false, 
    showCommunityLink = false
};
v128.init = function(v132) --[[ Line: 363 ]] --[[ Name: init ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), l_abbreviateCount_0 (copy), l_UiMode_0 (copy), l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v45 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_memoize_0 (copy), l_Text_0 (copy), l_FFlagLuaAppGameStatsFallbackRendering_0 (copy), v6 (copy), l_StyledTextLabel_0 (copy), v90 (copy), l_withStyle_0 (copy), v89 (copy), v107 (copy), l_IXPServiceWrapper_0 (copy), v108 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), v63 (copy), v106 (copy), v29 (copy), v5 (copy), v74 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameStats_0 (copy), l_PlayerCount_0 (copy), v125 (copy), l_Images_0 (copy), v68 (copy), l_RetrievalStatus_0 (copy), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), v69 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (copy), v62 (copy), v64 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), v44 (copy), v70 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), v81 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (copy), v73 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_ExperienceRatings_0 (copy), v71 (copy), v65 (copy), v75 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), v76 (copy), l_ExperienceCommunityLink_0 (copy), l_checkAndFormatPossibleLink_0 (copy), l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (copy), v66 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (copy), v126 (copy), v127 (copy), l_ContentPosition_0 (copy), l_GetFFlagExpDetailsUseSelectionBumpers_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v42 (copy), l_ExperienceDetailsNoticeType_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v47 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_AppStorageService_0 (copy)
    local v133 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v132.applyTokenScaling = function(v134) --[[ Line: 365 ]]
        -- upvalues: v132 (copy)
        return v134 * v132.props.foundationTokens.Stroke.Standard;
    end;
    v132.getAbbreviateCount = function(v135) --[[ Line: 370 ]]
        -- upvalues: l_abbreviateCount_0 (ref), v133 (copy)
        return l_abbreviateCount_0(v135, v133:GetLocale());
    end;
    v132.upperString = function(v136) --[[ Line: 373 ]]
        -- upvalues: v133 (copy)
        return string.upper(v133:Format(v136));
    end;
    v132.onPlayButtonActivated = function() --[[ Line: 377 ]]
        -- upvalues: v132 (copy)
        return v132.props.onPlayButtonActivated();
    end;
    v132.openMoreContextualMenu = function(v137) --[[ Line: 381 ]]
        -- upvalues: v132 (copy), l_UiMode_0 (ref), l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), v45 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
        local l_universeId_0 = v132.props.universeId;
        local v139 = nil;
        local v140 = nil;
        local v141 = v132.props.uiModeInfo and v132.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        if l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0() and v141 then
            local v142 = nil;
            if l_FFlagEnableLeftNavOnConsole_0 then
                v142 = v45.GetDisplayStore().getDeviceSafePadding();
            end;
            v139 = Vector2.new(0, 1);
            v140 = UDim2.fromOffset(v137.AbsolutePosition.X, v137.AbsolutePosition.Y - 12 + if l_FFlagEnableLeftNavOnConsole_0 then v142.top else 0);
        else
            v140 = UDim2.fromOffset(v137.AbsolutePosition.X + v137.AbsoluteSize.X - 300, v137.AbsolutePosition.Y + v137.AbsoluteSize.Y + 12);
        end;
        return v132.props.openMoreContextualMenu(l_universeId_0, v140, v139, if l_FFlagHideCloseButtonEdp_0 then v132.props.hideCloseButton else nil);
    end;
    v132.getTextHeight = l_memoize_0(function(v143, v144, v145, v146) --[[ Line: 416 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextHeight(v143, v144, v145, v146);
    end);
    v132.openShareContextualMenu = function(v147) --[[ Line: 420 ]]
        -- upvalues: v132 (copy), l_FFlagHideCloseButtonEdp_0 (ref)
        local l_universeId_1 = v132.props.universeId;
        local v149 = UDim2.fromOffset(v147.AbsolutePosition.X + v147.AbsoluteSize.X - 300, v147.AbsolutePosition.Y + v147.AbsoluteSize.Y + 12);
        return v132.props.openShareContextualMenu(l_universeId_1, v149, if l_FFlagHideCloseButtonEdp_0 then v132.props.hideCloseButton else nil);
    end;
    v132.getPlaysAnsVisitsInfo = function(v150, v151) --[[ Line: 434 ]]
        -- upvalues: l_FFlagLuaAppGameStatsFallbackRendering_0 (ref)
        return {
            plays = v150 and v150.playing or v151 and v151.playerCount or if l_FFlagLuaAppGameStatsFallbackRendering_0 then nil else 0, 
            visits = v150 and v150.visits or if l_FFlagLuaAppGameStatsFallbackRendering_0 then nil else 0, 
            totalUpVotes = v151 and v151.totalUpVotes or 0, 
            totalDownVotes = v151 and v151.totalDownVotes or 1
        };
    end;
    v132.getStyledTextLabel = function(v152, v153, v154) --[[ Line: 445 ]]
        -- upvalues: v6 (ref), l_StyledTextLabel_0 (ref)
        if v152 then
            return v6.createElement(l_StyledTextLabel_0, {
                text = v152, 
                fontStyle = v153, 
                colorStyle = v154, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 1, 
                richText = false, 
                lineHeight = 1
            });
        else
            return nil;
        end;
    end;
    v132.toggleFollowExperience = function() --[[ Line: 461 ]]
        -- upvalues: v90 (ref), v132 (copy)
        if v90() then
            v132:setState({
                isNotificationsTooltipActive = false
            });
        end;
        if not v132.props.gameFollowings then
            return;
        else
            local l_universeId_2 = v132.props.universeId;
            local l_isFollowed_0 = v132.props.gameFollowings.isFollowed;
            if v132.props.toggleFollowExperience then
                v132.props.toggleFollowExperience(l_universeId_2, not l_isFollowed_0);
            end;
            return;
        end;
    end;
    v132.renderSubtitleTextOverride = function(v157, v158, v159, _, v161, v162) --[[ Line: 480 ]]
        -- upvalues: l_withStyle_0 (ref), v89 (ref), v107 (ref), l_IXPServiceWrapper_0 (ref), v108 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v133 (copy), v63 (ref), v6 (ref), v106 (ref), v132 (copy), v29 (ref)
        local function _(v163) --[[ Line: 488 ]]
            -- upvalues: l_withStyle_0 (ref), v89 (ref), v107 (ref), l_IXPServiceWrapper_0 (ref), v108 (ref), v162 (copy), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v159 (copy), v158 (copy), v133 (ref), v63 (ref), v6 (ref), v106 (ref), v132 (ref)
            return l_withStyle_0(function(v164) --[[ Line: 489 ]]
                -- upvalues: v89 (ref), v107 (ref), l_IXPServiceWrapper_0 (ref), v108 (ref), v163 (copy), v162 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v159 (ref), v158 (ref), v133 (ref), v63 (ref), v6 (ref), v106 (ref), v132 (ref)
                local v165 = if v89 then v164.Tokens.Semantic.Typography.Subheader else v164.Font.Header2;
                local v166 = if v89 then v165.FontSize else v165.RelativeSize * v164.Font.BaseSize;
                local l_TextMuted_0 = v164.Theme.TextMuted;
                if v107 then
                    l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v108);
                end;
                if v163 and v162 then
                    local v168 = {
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.game.info.creator({
                            creatorType = v159, 
                            creatorId = v158
                        }), 
                        extraProps = {
                            title = v133:Format("Feature.GameDetails.Label.Developer"), 
                            transitionAnimation = v63.SlideInFromRight
                        }
                    };
                    return v6.createElement("TextButton", {
                        Text = v163, 
                        Font = v165.Font, 
                        TextColor3 = l_TextMuted_0.Color, 
                        LayoutOrder = 2, 
                        AutoButtonColor = false, 
                        LineHeight = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextSize = v166, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = function() --[[ Line: 527 ]]
                            -- upvalues: v106 (ref), v159 (ref), v132 (ref), v158 (ref), v168 (copy)
                            if v106 then
                                if v159 == "User" then
                                    v132.props.openUserProfilePage(v158, "ExperienceDetailsPage:SubTitle");
                                    return;
                                elseif v159 == "Group" then
                                    v132.props.openCommunityProfilePage(v158, "ExperienceDetailsPage:SubTitle");
                                    return;
                                end;
                            else
                                v132.props.openCreatorPage(v168);
                            end;
                        end
                    });
                else
                    return v132.getStyledTextLabel(v163, v165, l_TextMuted_0);
                end;
            end);
        end;
        return v6.createElement(v29.EmojiWrapper, {
            emoji = if v161 then v29.emoji.verified else "", 
            layoutOrder = 2, 
            onActivated = if v161 and v162 then v132.props.openVerifiedBadgeModal else nil
        }, {
            userText = l_withStyle_0(function(v170) --[[ Line: 489 ]]
                -- upvalues: v89 (ref), v107 (ref), l_IXPServiceWrapper_0 (ref), v108 (ref), v157 (copy), v162 (copy), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v159 (copy), v158 (copy), v133 (ref), v63 (ref), v6 (ref), v106 (ref), v132 (ref)
                local v171 = if v89 then v170.Tokens.Semantic.Typography.Subheader else v170.Font.Header2;
                local v172 = if v89 then v171.FontSize else v171.RelativeSize * v170.Font.BaseSize;
                local l_TextMuted_1 = v170.Theme.TextMuted;
                if v107 then
                    l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v108);
                end;
                if v157 and v162 then
                    local v174 = {
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.game.info.creator({
                            creatorType = v159, 
                            creatorId = v158
                        }), 
                        extraProps = {
                            title = v133:Format("Feature.GameDetails.Label.Developer"), 
                            transitionAnimation = v63.SlideInFromRight
                        }
                    };
                    return v6.createElement("TextButton", {
                        Text = v157, 
                        Font = v171.Font, 
                        TextColor3 = l_TextMuted_1.Color, 
                        LayoutOrder = 2, 
                        AutoButtonColor = false, 
                        LineHeight = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextSize = v172, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = function() --[[ Line: 527 ]]
                            -- upvalues: v106 (ref), v159 (ref), v132 (ref), v158 (ref), v174 (copy)
                            if v106 then
                                if v159 == "User" then
                                    v132.props.openUserProfilePage(v158, "ExperienceDetailsPage:SubTitle");
                                    return;
                                elseif v159 == "Group" then
                                    v132.props.openCommunityProfilePage(v158, "ExperienceDetailsPage:SubTitle");
                                    return;
                                end;
                            else
                                v132.props.openCreatorPage(v174);
                            end;
                        end
                    });
                else
                    return v132.getStyledTextLabel(v157, v171, l_TextMuted_1);
                end;
            end)
        });
    end;
    v132.renderTextOverride = function(v175, _, _, v178) --[[ Line: 554 ]]
        -- upvalues: l_withStyle_0 (ref), v89 (ref), v132 (copy), v6 (ref), v29 (ref)
        local function _(v179) --[[ Line: 555 ]]
            -- upvalues: l_withStyle_0 (ref), v89 (ref), v132 (ref)
            return l_withStyle_0(function(v180) --[[ Line: 556 ]]
                -- upvalues: v89 (ref), v132 (ref), v179 (copy)
                local v181 = if v89 then v180.Tokens.Semantic.Typography.Subheader else v180.Font.Header2;
                local l_TextEmphasis_0 = v180.Theme.TextEmphasis;
                return v132.getStyledTextLabel(v179, v181, l_TextEmphasis_0);
            end);
        end;
        return v6.createElement(v29.EmojiWrapper, {
            emoji = if v178 then v29.emoji.verified else "", 
            layoutOrder = 0, 
            size = UDim2.fromScale(0, 1)
        }, {
            userText = l_withStyle_0(function(v184) --[[ Line: 556 ]]
                -- upvalues: v89 (ref), v132 (ref), v175 (copy)
                local v185 = if v89 then v184.Tokens.Semantic.Typography.Subheader else v184.Font.Header2;
                local l_TextEmphasis_1 = v184.Theme.TextEmphasis;
                return v132.getStyledTextLabel(v175, v185, l_TextEmphasis_1);
            end)
        });
    end;
    v132.renderExperienceGuidelines = l_memoize_0(function(v187) --[[ Line: 574 ]]
        -- upvalues: v5 (ref), v74 (ref), l_FFlagHideCloseButtonEdp_0 (ref), v132 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
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
            ExperienceTagsContainer = v5.createElement(v74, {
                areTagsInteractable = true, 
                includeAgeRecommendations = true, 
                universeId = v187, 
                LayoutOrder = 1, 
                hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v132.props.hideCloseButton else nil, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v132.props.shouldHydrateLegacyIxp else nil
            })
        });
    end);
    v132.renderInlinePlayerCountAndLikes = l_memoize_0(function(v188, v189, v190) --[[ Line: 598 ]]
        -- upvalues: v6 (ref), l_GameStats_0 (ref)
        return v6.createElement("Frame", {
            Size = UDim2.new(0, 120, 0, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            GameStats = v6.createElement(l_GameStats_0, {
                stats = {
                    playerCount = v188, 
                    totalUpVotes = v189, 
                    totalDownVotes = v190
                }
            })
        });
    end);
    v132.renderBriefDescription = function(v191, v192) --[[ Line: 614 ]]
        -- upvalues: l_withStyle_0 (ref), v89 (ref), v132 (copy), v6 (ref), l_StyledTextLabel_0 (ref)
        return l_withStyle_0(function(v193) --[[ Line: 615 ]]
            -- upvalues: v191 (copy), v89 (ref), v132 (ref), v192 (copy), v6 (ref), l_StyledTextLabel_0 (ref)
            local l_Font_0 = v193.Font;
            local l_headerDescriptionLineHeight_0 = v191.headerDescriptionLineHeight;
            local v196 = l_headerDescriptionLineHeight_0 * math.floor(l_Font_0.BaseSize * l_Font_0.Body.RelativeSize) * v191.headerDescriptionMaxRows;
            local v197 = if v89 then v193.Tokens.Semantic.Typography.Body.FontSize else l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            local v198 = if v89 then v193.Tokens.Semantic.Typography.Body.Font else l_Font_0.Body.Font;
            local v199 = v132.getTextHeight(v192, v198, v197, UDim2.new(1, 0, 0, v196));
            return v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, (math.min(v199, v196))), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                ClipsDescendants = true
            }, {
                GameDescriptionText = v6.createElement(l_StyledTextLabel_0, {
                    text = v192, 
                    fontStyle = if v89 then v193.Tokens.Semantic.Typography.Body else l_Font_0.Body, 
                    colorStyle = v193.Theme.TextEmphasis, 
                    size = UDim2.fromScale(1, 1), 
                    richText = false, 
                    fluidSizing = false, 
                    lineHeight = l_headerDescriptionLineHeight_0
                })
            });
        end);
    end;
    v132.renderInfoContent = function(v200, v201, v202, v203, v204, v205, v206, v207, v208, v209) --[[ Line: 650 ]]
        -- upvalues: v132 (copy), l_UiMode_0 (ref), v106 (ref), v6 (ref)
        local v210 = v132.props.uiModeInfo and v132.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        local v211 = v200 and v200.headerItemPadding or 0;
        local v212 = v210 and v206 ~= nil and #v206 > 0;
        local v213 = not v210;
        return function() --[[ Line: 669 ]]
            -- upvalues: v106 (ref), v132 (ref), v202 (copy), v203 (copy), v204 (copy), v201 (copy), v205 (copy), l_UiMode_0 (ref), v6 (ref), v211 (copy), v210 (copy), v207 (copy), v208 (copy), v209 (copy), v212 (copy), v200 (copy), v206 (copy), v213 (copy)
            local v214 = if v106 then v132.renderSubtitleTextOverride(v202, v203, v204, v201, v205, v132.props.uiModeInfo.uiMode ~= l_UiMode_0.TenFoot) else v132.renderSubtitleTextOverride(v202, v203, v204, v201, v205);
            return v6.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v6.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, v211)
                }), 
                SubtitleText = v214, 
                Padding = if v211 then v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v211)
                }) else nil, 
                PlayStats = if v210 then v132.renderInlinePlayerCountAndLikes(v207, v208, v209) else nil, 
                Description = if v212 then v132.renderBriefDescription(v200, v206) else nil, 
                ExperienceGuidelinesComponent = if v213 then v132.renderExperienceGuidelines(v201) else nil
            });
        end;
    end;
    v132.renderPlaysAndVisits = l_memoize_0(function(v215, v216) --[[ Line: 708 ]]
        -- upvalues: v6 (ref), l_PlayerCount_0 (ref), l_FFlagLuaAppGameStatsFallbackRendering_0 (ref), v125 (ref), v132 (copy), l_Images_0 (ref)
        return function() --[[ Line: 709 ]]
            -- upvalues: v6 (ref), l_PlayerCount_0 (ref), l_FFlagLuaAppGameStatsFallbackRendering_0 (ref), v215 (copy), v125 (ref), v132 (ref), l_Images_0 (ref), v216 (copy)
            return v6.createElement(l_PlayerCount_0, {
                layoutOrder = 1, 
                countLeft = {
                    countText = if l_FFlagLuaAppGameStatsFallbackRendering_0 and v215 == nil then v125 else v132.getAbbreviateCount(v215), 
                    labelText = v132.upperString("Feature.GameDetails.Label.Playing"), 
                    icon = l_Images_0["icons/status/games/people-playing_large"]
                }, 
                countRight = {
                    countText = if l_FFlagLuaAppGameStatsFallbackRendering_0 and v216 == nil then v125 else v132.getAbbreviateCount(v216), 
                    labelText = v132.upperString("Feature.GameDetails.Label.Visits"), 
                    icon = l_Images_0["icons/status/games/sessions_large"]
                }
            });
        end;
    end);
    v132.onFocusChanged = function(v217) --[[ Line: 730 ]]
        -- upvalues: v132 (copy)
        if v132.props.setControllerBarNavigation then
            local v218 = not v217;
            v132.props.setControllerBarNavigation(v218);
        end;
    end;
    v132.renderDescription = l_memoize_0(function(v219, v220) --[[ Line: 737 ]]
        -- upvalues: v6 (ref), v68 (ref), l_RetrievalStatus_0 (ref), v132 (copy), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (ref), l_AppPage_0 (ref)
        return function() --[[ Line: 738 ]]
            -- upvalues: v6 (ref), v68 (ref), l_RetrievalStatus_0 (ref), v219 (copy), v220 (copy), v132 (ref), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (ref), l_AppPage_0 (ref)
            return v6.createElement(v68, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(v219), 
                descriptionText = v220, 
                onFocusChanged = v132.onFocusChanged, 
                universeId = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v132.props.universeId else nil, 
                pageContext = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then l_AppPage_0.ExperienceDetail else nil, 
                componentType = l_FFlagLuaAppExpandableTextImpressionsEnabled_0 and "gameDescription" or nil
            });
        end;
    end);
    if l_FFlagLuaAppShowNoticeOnEdp_0 then
        v132.renderNotice = l_memoize_0(function(v221) --[[ Line: 751 ]]
            -- upvalues: l_withLocalization_0 (ref), v6 (ref), v68 (ref), l_RetrievalStatus_0 (ref), v132 (copy), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (ref), l_AppPage_0 (ref)
            return function() --[[ Line: 752 ]]
                -- upvalues: l_withLocalization_0 (ref), v6 (ref), v68 (ref), l_RetrievalStatus_0 (ref), v221 (copy), v132 (ref), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (ref), l_AppPage_0 (ref)
                return l_withLocalization_0({
                    noticeHeader = "Feature.ExperienceDetails.Body.NotesTitle", 
                    noticeText = "Feature.ExperienceDetails.Notes.InExperiencePurchase"
                })(function(v222) --[[ Line: 756 ]]
                    -- upvalues: v6 (ref), v68 (ref), l_RetrievalStatus_0 (ref), v221 (ref), v132 (ref), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (ref), l_AppPage_0 (ref)
                    return v6.createElement(v68, {
                        dataStatus = l_RetrievalStatus_0.fromRawValue(v221), 
                        headerText = v222.noticeHeader, 
                        descriptionText = v222.noticeText, 
                        onFocusChanged = v132.onFocusChanged, 
                        universeId = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v132.props.universeId else nil, 
                        pageContext = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then l_AppPage_0.ExperienceDetail else nil, 
                        componentType = l_FFlagLuaAppExpandableTextImpressionsEnabled_0 and "gameNotice" or nil
                    });
                end);
            end;
        end);
    end;
    v132.renderIgrsRatingLabel = if l_FFlagLuaAppAddIgrsRatingToEdp_0 then l_memoize_0(function(v223, v224, v225, v226, v227) --[[ Line: 774 ]]
        -- upvalues: v5 (ref), v69 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v62 (ref), v133 (copy), v132 (copy), v64 (ref)
        return function() --[[ Line: 775 ]]
            -- upvalues: v5 (ref), v69 (ref), v223 (copy), v224 (copy), v225 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v226 (copy), v62 (ref), v133 (ref), v132 (ref), v64 (ref), v227 (copy)
            return v5.createElement(v69, {
                igrsRating = v223, 
                igrsRatingDisplayMessage = v224, 
                onActivated = v225 and function() --[[ Line: 780 ]]
                    -- upvalues: l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v226 (ref), v62 (ref), v133 (ref), v132 (ref)
                    if l_FFlagLuaAppIgrsRatingPropMemoization_0 then
                        v226(v62.INDONESIAN_CONTENT_MATURITY_URL, v133:Format("Feature.GameDetails.Label.ContentMaturity"));
                        return;
                    else
                        v132.props.openWebview(v62.INDONESIAN_CONTENT_MATURITY_URL, v133:Format("Feature.GameDetails.Label.ContentMaturity"));
                        return;
                    end;
                end or function() --[[ Line: 793 ]]
                    -- upvalues: v64 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v227 (ref), v132 (ref), v62 (ref)
                    v64(if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v227 else v132.props.linking, v62.INDONESIAN_CONTENT_MATURITY_URL);
                end
            });
        end;
    end) else nil;
    v132.renderLogoTray = l_memoize_0(function(v228, v229) --[[ Line: 804 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (ref), v132 (copy), v5 (ref), v44 (ref), v6 (ref), v70 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v81 (ref), l_AppPage_0 (ref)
        return function() --[[ Line: 805 ]]
            -- upvalues: l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (ref), v132 (ref), v5 (ref), v44 (ref), v6 (ref), v70 (ref), v228 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), v229 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v81 (ref), l_AppPage_0 (ref)
            if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then
                local v230 = ("EXPERIENCE_SOCIAL_LINKS_%*"):format(v132.props.universeId);
                local v231 = v5.createRef();
                local v232 = v44.Signal.new();
                return v5.createElement(v5.Fragment, nil, {
                    ExperienceLogoTray = v6.createElement(v70, {
                        socialLinks = v228, 
                        linking = if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v229 else v132.props.linking, 
                        openLeaveRobloxAlertUIBlox = v132.props.openLeaveRobloxAlertUIBlox, 
                        closeAlert = v132.props.closeAlert, 
                        impressionsTag = v230, 
                        forwardRef = v231, 
                        onAbsolutePositionChanged = function(_) --[[ Line: 817 ]]
                            -- upvalues: v232 (copy)
                            v232:fire();
                        end, 
                        universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v132.props.universeId else nil
                    }), 
                    EdpSocialLinksImpressionsDetector = v6.createElement(v81, {
                        parentRef = v231, 
                        scrollViewPositionChangedSignal = v232, 
                        pageContext = l_AppPage_0.ExperienceDetail, 
                        impressionsTag = v230, 
                        socialLinks = v228, 
                        universeId = v132.props.universeId
                    })
                });
            else
                return v6.createElement(v70, {
                    socialLinks = v228, 
                    linking = if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v229 else v132.props.linking, 
                    openLeaveRobloxAlertUIBlox = v132.props.openLeaveRobloxAlertUIBlox, 
                    closeAlert = v132.props.closeAlert, 
                    universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v132.props.universeId else nil
                });
            end;
        end;
    end);
    local function _(v234) --[[ Line: 853 ]] --[[ Name: handleControllerBarInMediaGalleryFullscreen ]]
        -- upvalues: v132 (copy)
        if v132.props.setControllerBarNavigation then
            v132.props.setControllerBarNavigation(v234);
        end;
    end;
    v132.onMediaGalleryPreviewActivated = function(v236, v237) --[[ Line: 859 ]]
        -- upvalues: v132 (copy), l_UiMode_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (ref)
        local v238 = v132.props.uiModeInfo and v132.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        if not v132.state.isFullscreen and v238 and v132.props.setControllerBarNavigation then
            v132.props.setControllerBarNavigation(false);
        end;
        v132:setState({
            isFullscreen = true, 
            mediaGalleryShowIndex = v236, 
            currentIndex = if v238 then v236 else nil
        });
        if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and v132.props.onMediaGalleryEnterFullscreen then
            v132.props.onMediaGalleryEnterFullscreen(v236, v237);
            return;
        else
            if l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 and v132.props.onMediaGalleryPreviewActivated then
                v132.props.onMediaGalleryPreviewActivated(v236);
            end;
            return;
        end;
    end;
    v132.renderMediaGallery = l_memoize_0(function(v239, v240) --[[ Line: 878 ]]
        -- upvalues: v132 (copy), l_UiMode_0 (ref), v6 (ref), v73 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref)
        if v132.props.uiModeInfo and v132.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            return function() --[[ Line: 881 ]]
                -- upvalues: v6 (ref), v73 (ref), v132 (ref), v239 (copy), v240 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(v73, {
                    tokens = v132.props.tokens, 
                    deviceType = v132.props.deviceType, 
                    universeId = v239, 
                    onPreviewActivated = v132.onMediaGalleryPreviewActivated, 
                    isFullscreenState = v240, 
                    exitFullscreen = v132.onClose, 
                    onSelectionGained = v132.onSelectionGained, 
                    mediaGalleryGainFocused = v132.mediaGalleryGainFocused, 
                    uiMode = v132.props.uiModeInfo.uiMode, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v132.props.shouldHydrateLegacyIxp else nil
                });
            end;
        else
            return function() --[[ Line: 898 ]]
                -- upvalues: v6 (ref), v73 (ref), v132 (ref), v239 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), v240 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(v73, {
                    deviceType = v132.props.deviceType, 
                    universeId = v239, 
                    startIndex = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v132.state.mediaGalleryShowIndex else nil, 
                    onPreviewActivated = v132.onMediaGalleryPreviewActivated, 
                    onThumbnailActivated = if not l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 or l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v132.props.onMediaGalleryThumbnailActivated, 
                    onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v132.props.onMediaGalleryMediaChanged else nil, 
                    isOccluded = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and (l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryVideoPreview_0) then v240 else nil, 
                    mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v132.props.mediaGalleryRedesignEnabledIxp else nil, 
                    mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v132.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v132.props.shouldHydrateLegacyIxp else nil
                });
            end;
        end;
    end);
    v132.renderExperienceRating = l_memoize_0(function(v241) --[[ Line: 929 ]]
        -- upvalues: v6 (ref), l_ExperienceRatings_0 (ref), v132 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
        return function() --[[ Line: 930 ]]
            -- upvalues: v6 (ref), l_ExperienceRatings_0 (ref), v241 (copy), v132 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
            return v6.createElement(l_ExperienceRatings_0, {
                universeId = v241, 
                height = math.floor((v132.applyTokenScaling(72))), 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v132.props.shouldHydrateLegacyIxp else nil, 
                styleProps = {
                    statWidgetIconSize = math.floor((v132.applyTokenScaling(48)))
                }
            });
        end;
    end);
    v132.renderExperienceInfoTable = l_memoize_0(function(v242) --[[ Line: 944 ]]
        -- upvalues: v6 (ref), v132 (copy), v71 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
        return function() --[[ Line: 945 ]]
            -- upvalues: v6 (ref), v132 (ref), v71 (ref), v242 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
            return v6.createElement("Folder", {
                [v6.Ref] = v132.props.statsAndInfoRef
            }, v6.createElement(v71, {
                renderTextOverride = v132.renderTextOverride, 
                universeId = v242, 
                key = "ExperienceInfoTable", 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v132.props.shouldHydrateLegacyIxp else nil, 
                hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v132.props.hideCloseButton else nil
            }));
        end;
    end);
    v132.renderEventsList = l_memoize_0(function(v243, v244) --[[ Line: 964 ]]
        -- upvalues: v6 (ref), v65 (ref)
        return function() --[[ Line: 965 ]]
            -- upvalues: v6 (ref), v65 (ref), v243 (copy), v244 (copy)
            return v6.createElement(v65, {
                universeId = v243, 
                referralSource = "expDetailsPage", 
                defaultThumbnail = if v244 then "rbxassetid://" .. v244 else nil
            });
        end;
    end);
    v132.renderRecommendedExperiencesCarousel = l_memoize_0(function(v245) --[[ Line: 974 ]]
        -- upvalues: v6 (ref), v75 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v132 (copy), l_AppPage_0 (ref)
        return function() --[[ Line: 975 ]]
            -- upvalues: v6 (ref), v75 (ref), v245 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v132 (ref), l_AppPage_0 (ref)
            return v6.createElement(v75, {
                universeId = v245, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v132.props.shouldHydrateLegacyIxp else nil, 
                pageContext = l_AppPage_0.ExperienceDetail
            });
        end;
    end);
    if l_FFlagSongEdpCarouselIxp_0 then
        v132.renderExperienceSongsCarousel = l_memoize_0(function(v246, v247) --[[ Line: 987 ]]
            -- upvalues: v5 (ref), v76 (ref)
            return function() --[[ Line: 988 ]]
                -- upvalues: v5 (ref), v76 (ref), v246 (copy), v247 (copy)
                return v5.createElement(v76, {
                    universeId = v246, 
                    fractionalItemAmount = 0, 
                    universeTitle = v247 or "", 
                    collectionOrder = 2, 
                    clipsDescendants = true
                });
            end;
        end);
    end;
    v132.renderCommunityLink = l_memoize_0(function(v248, v249, v250) --[[ Line: 1000 ]]
        -- upvalues: v5 (ref), l_ExperienceCommunityLink_0 (ref)
        return function() --[[ Line: 1001 ]]
            -- upvalues: v5 (ref), l_ExperienceCommunityLink_0 (ref), v248 (copy), v249 (copy), v250 (copy)
            return v5.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16)
                }), 
                ExperienceCommunityLink = v5.createElement(l_ExperienceCommunityLink_0, {
                    communityInfo = v248, 
                    experienceName = v249 or "", 
                    universeId = v250
                })
            });
        end;
    end);
    v132.linkStartStyle = l_memoize_0(function(v251) --[[ Line: 1019 ]]
        local l_Color3_0 = v251.Tokens.Semantic.Color.Text.Link.Color3;
        return (("<font color=\"%*\"><b>"):format((string.format("rgb(%d, %d, %d)", math.round(l_Color3_0.R * 255), math.round(l_Color3_0.G * 255), (math.round(l_Color3_0.B * 255))))));
    end);
    v132.checkAndFormatPossibleLink = l_memoize_0(function(v253, v254) --[[ Line: 1031 ]]
        -- upvalues: l_checkAndFormatPossibleLink_0 (ref), v132 (copy)
        return l_checkAndFormatPossibleLink_0(v254, nil, nil, v132.linkStartStyle(v253), "</b></font>");
    end);
    v132.renderRefundPolicy = l_memoize_0(function(v255) --[[ Line: 1037 ]]
        -- upvalues: l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (ref), l_withStyle_0 (ref), v6 (ref), v66 (ref), v132 (copy), v5 (ref)
        return function() --[[ Line: 1038 ]]
            -- upvalues: l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (ref), l_withStyle_0 (ref), v6 (ref), v66 (ref), v255 (copy), v132 (ref), v5 (ref)
            if l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 then
                return l_withStyle_0(function(v256) --[[ Line: 1040 ]]
                    -- upvalues: v6 (ref), v66 (ref), v255 (ref)
                    return v6.createElement(v66, {
                        refundPolicy = v255, 
                        paddingTop = v256.Tokens.Global.Space_300
                    });
                end);
            else
                return l_withStyle_0(function(v257) --[[ Line: 1047 ]]
                    -- upvalues: v132 (ref), v255 (ref), v5 (ref)
                    local l_Body_0 = v257.Tokens.Semantic.Typography.Body;
                    local l_Muted_0 = v257.Tokens.Semantic.Color.Text.Muted;
                    local v260, v261 = v132.checkAndFormatPossibleLink(v257, v255.policyText);
                    return v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        UIPadding = v5.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, v257.Tokens.Global.Space_300)
                        }), 
                        RefundPolicy = v5.createElement("TextButton", {
                            BackgroundTransparency = 1, 
                            Text = v261, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Font = l_Body_0.Font, 
                            TextSize = l_Body_0.FontSize, 
                            TextColor3 = l_Muted_0.Color3, 
                            TextTransparency = l_Muted_0.Transparency, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            RichText = v260, 
                            [v5.Event.Activated] = function(_) --[[ Line: 1074 ]]
                                -- upvalues: v132 (ref), v255 (ref)
                                v132.props.openRefundPolicyLearnMorePage(v255.learnMoreUrl);
                            end
                        })
                    });
                end);
            end;
        end;
    end);
    v132.getBodyComponentListProps = l_memoize_0(function(v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284) --[[ Line: 1084 ]]
        -- upvalues: v132 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (ref), v126 (ref), v127 (ref), l_ContentPosition_0 (ref), l_GetFFlagExpDetailsUseSelectionBumpers_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v42 (ref), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_ExperienceDetailsNoticeType_0 (ref), l_FFlagSongEdpCarouselIxp_0 (ref)
        local v285 = v273.showLogoTraySection and v269 and next(v269);
        local v286 = v273.showCommunityLink and v271 and v272 == "banner" and v270;
        local l_showEventsList_0 = v273.showEventsList;
        local v288 = v132.props.webViewSupport and v277 ~= nil;
        local v289 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.Description else 20;
        local v290 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.MediaGallery else 40;
        local v291 = if not v275 then v289 else v290;
        local v292 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.EventsListRedesign else v291 - 10;
        local v293 = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.EventsListRedesign else 10;
        local l_Left_0 = l_ContentPosition_0.Left;
        local v295 = {
            MediaGallery = {
                portraitLayoutOrder = if not v275 then if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.MediaGalleryMediaFirst else 5 else v289, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.MediaGallery else 10, 
                landscapePosition = l_ContentPosition_0.Right, 
                showCornerGradient = not v273.showCornerGradientPropEnabled and nil, 
                useSelectionBumper = l_GetFFlagExpDetailsUseSelectionBumpers_0() and true or nil, 
                renderComponent = v132.renderMediaGallery(v263, v274)
            }, 
            Description = {
                portraitLayoutOrder = v291, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.Description else 20, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v132.renderDescription(v264, v265)
            }, 
            IgrsRatingLabel = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and v280 then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.IgrsRatingLabel else 45, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.IgrsRatingLabel else 30, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v132.renderIgrsRatingLabel(v280, v281, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v282 else v132.props.webViewSupport, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v283 else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v284 else nil)
            } else nil, 
            ExperienceRatings = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui()) and v132.props.edpServerIxpVariables and v132.props.edpServerIxpVariables.hideGameRatings == true then nil else {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.ExperienceRatings else 50, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.ExperienceRatings else 40, 
                landscapePosition = l_ContentPosition_0.Left, 
                useSelectionBumper = l_GetFFlagExpDetailsUseSelectionBumpers_0() and true or nil, 
                renderComponent = v132.renderExperienceRating(v263)
            }, 
            PlaysAndVisits = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui()) and v132.props.edpServerIxpVariables and v132.props.edpServerIxpVariables.showVisitsInInfoList == true then nil else {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.PlaysAndVisits else 60, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.PlaysAndVisits else 50, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v132.renderPlaysAndVisits(v267, v268)
            }, 
            CommunityLink = if v286 then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.CommunityLink else 70, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.CommunityLink else 60, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v132.renderCommunityLink(v270, v266, v263)
            } else nil, 
            ExperienceInfoTable = {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.ExperienceInfoTable else 80, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.ExperienceInfoTable else 70, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v132.renderExperienceInfoTable(v263)
            }, 
            RefundPolicy = if v288 then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.RefundPolicy else 85, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.RefundPolicy else 75, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v132.renderRefundPolicy(v277)
            } else nil, 
            LogoTraySection = v285 and {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.LogoTraySection else 90, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.LogoTraySection else 80, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v132.renderLogoTray(v269, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v284 else nil)
            } or nil, 
            EventsList = if l_showEventsList_0 then {
                portraitLayoutOrder = v292, 
                landscapeLayoutOrder = v293, 
                landscapePosition = l_Left_0, 
                renderComponent = v132.renderEventsList(v263, v276)
            } else nil, 
            Notice = if l_FFlagLuaAppShowNoticeOnEdp_0 and v278 == l_ExperienceDetailsNoticeType_0.InExperiencePurchase then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.Notice else 100, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.Notice else 100, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v132.renderNotice(v264)
            } else nil, 
            RecommendedExperiences = {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.RecommendedExperiences else 110, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.RecommendedExperiences else 30, 
                landscapePosition = l_ContentPosition_0.Right, 
                useSelectionBumper = l_GetFFlagExpDetailsUseSelectionBumpers_0() and true or nil, 
                renderComponent = v132.renderRecommendedExperiencesCarousel(v263)
            }, 
            ExperienceSongsCarousel = if l_FFlagSongEdpCarouselIxp_0 and v132.props.showSongCarousel then {
                portraitLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v126.ExperienceSongsCarousel else 120, 
                landscapeLayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v127.ExperienceSongsCarousel else 35, 
                landscapePosition = l_ContentPosition_0.Right, 
                renderComponent = v132.renderExperienceSongsCarousel(v263, v266)
            } else nil
        };
        if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v132.props.shouldInterleaveSduiIxp) and v279 then
            for v296, v297 in v279 do
                v295[("SduiFeedItem_%*"):format(v296)] = {
                    portraitLayoutOrder = v297.portraitLayoutOrder, 
                    landscapeLayoutOrder = v297.landscapeLayoutOrder, 
                    landscapePosition = l_ContentPosition_0.Left, 
                    renderComponent = v297.renderComponent
                };
            end;
        end;
        return v295;
    end);
    v132.onClose = function() --[[ Line: 1338 ]]
        -- upvalues: v132 (copy), l_UiMode_0 (ref)
        if v132.state.isFullscreen then
            v132:setState({
                isFullscreen = false
            });
            if v132.props.uiModeInfo and v132.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot and v132.props.setControllerBarNavigation then
                v132.props.setControllerBarNavigation(true);
                return;
            end;
        else
            v132.props.onClose();
        end;
    end;
    v132.exitFullscreen = l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and function(v298, v299) --[[ Line: 1355 ]]
        -- upvalues: v132 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref)
        if not v132.state.isFullscreen then
            return;
        else
            if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and v132.props.onMediaGalleryExitFullscreen then
                v132.props.onMediaGalleryExitFullscreen(v298, v299);
            end;
            v132:setState({
                isFullscreen = false, 
                mediaGalleryShowIndex = v298
            });
            return;
        end;
    end or nil;
    v132.focusEventHandlers = {
        [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
            handler = v47.onRelease(function(v300) --[[ Line: 1373 ]]
                -- upvalues: v132 (copy)
                v132.onClose();
                v300:cancel();
            end)
        }
    };
    v132.renderFullscreenContent = l_memoize_0(function(v301, v302, v303, v304, v305, v306) --[[ Line: 1381 ]]
        -- upvalues: v132 (copy), l_UiMode_0 (ref), v6 (ref), v73 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref)
        if v132.props.uiModeInfo and v132.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            return function() --[[ Line: 1384 ]]
                -- upvalues: v6 (ref), v73 (ref), v132 (ref), v301 (copy), v302 (copy), v303 (copy), v304 (copy), v306 (copy), v305 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(v73, {
                    tokens = v132.props.tokens, 
                    universeId = v301, 
                    isFullscreen = true, 
                    fullscreenShowIndex = v302, 
                    deviceType = v132.props.deviceType, 
                    isFullscreenState = v303, 
                    isCrossFade = v304, 
                    setCrossFade = v132.setCrossFade, 
                    nextIndex = v306, 
                    currentIndex = v305, 
                    setCurrentIndex = v132.setCurrentIndex, 
                    uiMode = v132.props.uiModeInfo.uiMode, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v132.props.shouldHydrateLegacyIxp else nil
                });
            end;
        else
            return function() --[[ Line: 1404 ]]
                -- upvalues: v6 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v132 (ref), v73 (ref), v301 (copy), v302 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
                return v6.createElement(l_FocusNavigableSurfaceWrapper_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    isIsolated = true, 
                    customEventHandlers = v132.focusEventHandlers
                }, {
                    ExperienceMediaGallery = v6.createElement(v73, {
                        universeId = v301, 
                        isFullscreen = true, 
                        fullscreenShowIndex = v302, 
                        onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v132.props.onMediaGalleryMediaChanged else nil, 
                        startIndex = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v302 else nil, 
                        exitFullscreen = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v132.exitFullscreen else nil, 
                        mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v132.props.mediaGalleryRedesignEnabledIxp else nil, 
                        mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v132.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v132.props.shouldHydrateLegacyIxp else nil
                    })
                });
            end;
        end;
    end);
    v132.resolveTitleText = function(v307, v308) --[[ Line: 1435 ]]
        return v307 and v307.name or v308 and v308.name or nil;
    end;
    v132.checkCommunityLinkExposureLogging = function() --[[ Line: 1440 ]]
        -- upvalues: v132 (copy), l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
        if v132.props.communityLink then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.EDPCommunityLinksLayer);
        end;
    end;
    if v132.props.uiModeInfo and v132.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
        v132.state = {
            bannerImageId = v132.props.bannerImageId, 
            isCrossFade = false, 
            currentIndex = 1, 
            nextIndex = 1
        };
        v132.setCurrentIndex = function(v309) --[[ Line: 1455 ]]
            -- upvalues: v132 (copy)
            v132:setState({
                currentIndex = v309
            });
        end;
        v132.setCrossFade = function(v310) --[[ Line: 1461 ]]
            -- upvalues: v132 (copy)
            v132:setState({
                isCrossFade = v310
            });
        end;
        v132.onSelectionGained = function(v311, v312) --[[ Line: 1467 ]]
            -- upvalues: v132 (copy)
            if v132.state.nextIndex ~= v311 and v132.state.isCrossFade == false then
                v132.setCrossFade(true);
            end;
            v132:setState({
                bannerImageId = v312, 
                nextIndex = v311
            });
        end;
        v132.mediaGalleryGainFocused = function(v313) --[[ Line: 1478 ]]
            -- upvalues: v132 (copy)
            if not v313 then
                v132:setState({
                    bannerImageId = v132.props.bannerImageId
                });
            end;
        end;
    end;
    if v90() then
        v132.isMounted = false;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 1490 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            return l_AppStorageService_0:GetItem("ShowNotificationsOptInTooltip");
        end);
        v132.showTooltip = if l_status_0 then l_result_0 == "true" else false;
        v132:setState({
            isNotificationsTooltipActive = v132.showTooltip
        });
    end;
end;
v128.didMount = function(v316) --[[ Line: 1499 ]] --[[ Name: didMount ]]
    -- upvalues: v90 (copy), l_AppStorageService_0 (copy), v8 (copy), v91 (copy)
    v316.checkCommunityLinkExposureLogging();
    if v90() then
        v316.isMounted = true;
        if v316.showTooltip then
            pcall(function() --[[ Line: 1505 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                l_AppStorageService_0:SetItem("ShowNotificationsOptInTooltip", "false");
                l_AppStorageService_0:Flush();
            end);
        end;
        v8.delay(v91()):andThen(function() --[[ Line: 1511 ]]
            -- upvalues: v316 (copy)
            if v316.isMounted then
                v316:setState({
                    isNotificationsTooltipActive = false
                });
            end;
        end);
    end;
end;
v128.didUpdate = function(v317, v318) --[[ Line: 1521 ]] --[[ Name: didUpdate ]]
    if not v318.communityLink then
        v317.checkCommunityLinkExposureLogging();
    end;
end;
v128.render = function(v319) --[[ Line: 1527 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_RetrievalStatus_1 (copy), v6 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    if v4 then
        if v319.props.gameDetailsPageDataStatus == l_RetrievalStatus_1.Failed and not v319.props.gameInfo then
            return v319:renderOnFailed();
        else
            return v319:renderOnLoaded();
        end;
    else
        return v6.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(v319.props.gameDetailsPageDataStatus), 
            renderOnFailed = function() --[[ Line: 1545 ]] --[[ Name: renderOnFailed ]]
                -- upvalues: v319 (copy)
                if v319.props.gameInfo then
                    return v319:renderOnLoaded();
                else
                    return v319:renderOnFailed();
                end;
            end, 
            renderOnLoaded = function() --[[ Line: 1553 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v319 (copy)
                return v319:renderOnLoaded();
            end, 
            renderOnLoading = function() --[[ Line: 1556 ]] --[[ Name: renderOnLoading ]]
                -- upvalues: v319 (copy)
                return v319:renderOnLoading();
            end
        });
    end;
end;
v128.renderOnLoading = function(_) --[[ Line: 1562 ]] --[[ Name: renderOnLoading ]]
    -- upvalues: v6 (copy), v72 (copy)
    return v6.createElement(v72);
end;
v128.renderOnFailed = function(v321) --[[ Line: 1566 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: l_withLocalization_0 (copy), l_EnumGameDetailErrorTypes_0 (copy), v6 (copy), l_EmptyState_0 (copy)
    return l_withLocalization_0({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet", 
        experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable"
    })(function(v322) --[[ Line: 1570 ]]
        -- upvalues: v321 (copy), l_EnumGameDetailErrorTypes_0 (ref), v6 (ref), l_EmptyState_0 (ref)
        local v323 = nil;
        v323 = v321.props.gameDetailError and v321.props.gameDetailError.errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
        return v6.createElement(l_EmptyState_0, {
            onActivated = if v323 then nil else v321.props.fetchGameDetailsPageData, 
            text = if v323 then v322.experienceUnavailableMessage else v322.failedMessage
        });
    end);
end;
v128.willUnmount = function(v324) --[[ Line: 1581 ]] --[[ Name: willUnmount ]]
    -- upvalues: v90 (copy)
    if v90() then
        v324.isMounted = false;
    end;
end;
v128.renderOnLoaded = function(v325) --[[ Line: 1587 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: l_UiMode_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_getPlayButtonProps_0 (copy), v90 (copy), l_DeviceType_0 (copy), l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v42 (copy), v7 (copy), l_Images_0 (copy), v6 (copy), v5 (copy), v67 (copy), l_TooltipOrientation_0 (copy), l_withLocalization_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_FFlagLuaAppEdpFixDefaultBanner_0 (copy), l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButton_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_ButtonSize_0 (copy), v131 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagLuaAppIgrsRatingPropMemoization_0 (copy), l_DetailsPageSelector_0 (copy)
    local l_deviceType_0 = v325.props.deviceType;
    local l_universeId_3 = v325.props.universeId;
    local l_gameInfo_0 = v325.props.gameInfo;
    local l_thumbnail_0 = v325.props.thumbnail;
    local l_tokens_0 = v325.props.tokens;
    local v331 = v325.props.uiModeInfo and v325.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
    l_thumbnail_0 = l_thumbnail_0 and l_thumbnail_0.url;
    local l_gameDetail_0 = v325.props.gameDetail;
    local v333 = l_gameDetail_0 and l_gameDetail_0.description or nil;
    local v334 = l_gameDetail_0 and l_gameDetail_0.name or nil;
    local v335 = v325.resolveTitleText(l_gameDetail_0, l_gameInfo_0);
    local v336 = l_gameDetail_0 and l_gameDetail_0.creator.name or nil;
    local v337 = l_gameDetail_0 and l_gameDetail_0.creator.id or nil;
    local v338 = l_gameDetail_0 and l_gameDetail_0.creator.type or nil;
    local v339 = nil;
    local v340 = nil;
    local v341 = nil;
    if v325.props.ageRecommendations then
        local l_summary_0 = v325.props.ageRecommendations.summary;
        v339 = if l_summary_0 and l_summary_0.ageRecommendation then if l_summary_0.ageRecommendation.displayNameWithHeaderShort then l_summary_0.ageRecommendation.displayNameWithHeaderShort else l_summary_0.ageRecommendation.displayName else nil;
        if l_FFlagLuaAppAddIgrsRatingToEdp_0 then
            v340 = if l_summary_0 and l_summary_0.ageRecommendation and l_summary_0.ageRecommendation.igrsRating and l_summary_0.ageRecommendation.igrsRating ~= "" then l_summary_0.ageRecommendation.igrsRating else nil;
            v341 = if l_summary_0 and l_summary_0.ageRecommendation and l_summary_0.ageRecommendation.igrsRatingDisplayMessage then l_summary_0.ageRecommendation.igrsRatingDisplayMessage else nil;
        end;
    end;
    local v343 = v325.getPlaysAnsVisitsInfo(l_gameDetail_0, l_gameInfo_0);
    local l_socialLinks_0 = v325.props.socialLinks;
    local l_communityLink_0 = v325.props.communityLink;
    local v346 = l_getPlayButtonProps_0(v325.props.playButtonState, v325.props.gameProductInfo);
    local l_textKey_0 = v346.textKey;
    local l_price_0 = v346.price;
    local l_icon_0 = v346.icon;
    local v350 = if v90() then v325.state.isNotificationsTooltipActive else false;
    local l_isFullscreen_0 = v325.state.isFullscreen;
    local l_isCrossFade_0 = v325.state.isCrossFade;
    local l_currentIndex_0 = v325.state.currentIndex;
    local l_nextIndex_0 = v325.state.nextIndex;
    local l_mediaGalleryShowIndex_0 = v325.state.mediaGalleryShowIndex;
    local v356 = nil;
    local v357 = nil;
    local v358 = nil;
    if l_tokens_0 then
        v356 = l_tokens_0.thumbnailSize;
        v357 = l_tokens_0.sideMargin;
        v358 = l_tokens_0.headerBarBackgroundHeight;
    end;
    local v359 = nil;
    if l_deviceType_0 == l_DeviceType_0.Tablet then
        v359 = math.min(v325.props.viewHeight / 3, 500);
        v356 = 200;
    elseif not v331 then
        v359 = 208;
    end;
    local v360 = not v331;
    local v361 = v331 and v339;
    local v362 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or v325.props.enableNotificationsDiscoverability;
    local l_notificationsCanEnableExperience_0 = v325.props.notificationsCanEnableExperience;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui()) and v325.props.edpServerIxpVariables and v325.props.edpServerIxpVariables.hideNotifyButton == true then
        v362 = false;
    end;
    local v365 = v7.List.filter({
        v360 and {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = l_Images_0["icons/actions/friends/friendsplaying"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v325.openShareContextualMenu, 
                size = v325.props.iconButtonSize, 
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
                onActivated = v325.openMoreContextualMenu, 
                size = v325.props.iconButtonSize, 
                backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
            }
        }, 
        v362 and l_notificationsCanEnableExperience_0 and {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = if v325.props.gameFollowings and v325.props.gameFollowings.isFollowed then l_Images_0["icons/common/notificationOn"] else l_Images_0["icons/common/notificationOff"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v325.toggleFollowExperience, 
                size = v325.props.iconButtonSize, 
                backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil, 
                [v6.Children] = if v90() then {
                    Tooltip = v5.createElement(v67, {
                        isActive = v350, 
                        preferredOrientation = l_TooltipOrientation_0.Bottom
                    })
                } else nil
            }
        } or nil
    }, function(v364) --[[ Line: 1732 ]]
        return v364 ~= nil;
    end);
    local v366 = nil;
    local v367 = nil;
    if v331 then
        v367 = v325.props.gameDetail and v325.props.gameDetail.licenseDescription or nil;
        if v361 or v367 then
            v366 = {};
        end;
        if v361 then
            table.insert(v366, {
                props = {
                    anchorPoint = Vector2.new(0, 0.5), 
                    position = UDim2.fromScale(0, 0.5), 
                    text = v339, 
                    horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                    verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                    userInteractionEnabled = true, 
                    showBackground = true, 
                    size = v325.props.textButtonSize, 
                    onActivated = function() --[[ Line: 1754 ]] --[[ Name: onActivated ]]
                        -- upvalues: v325 (copy), l_universeId_3 (copy)
                        v325.props.openExperienceGuidelinesExplained(l_universeId_3, true);
                    end, 
                    backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
                }
            });
        end;
        if v367 then
            table.insert(v366, {
                props = {
                    anchorPoint = Vector2.new(0, 0.5), 
                    position = UDim2.fromScale(0, 0.5), 
                    text = v367, 
                    horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                    verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                    userInteractionEnabled = false, 
                    showBackground = true, 
                    size = v325.props.textButtonSize, 
                    backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
                }
            });
        end;
    else
        v366 = if v361 then {
            {
                props = {
                    anchorPoint = Vector2.new(0, 0.5), 
                    position = UDim2.fromScale(0, 0.5), 
                    text = v339, 
                    horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                    verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                    userInteractionEnabled = true, 
                    showBackground = true, 
                    size = v325.props.textButtonSize, 
                    onActivated = function() --[[ Line: 1789 ]] --[[ Name: onActivated ]]
                        -- upvalues: v325 (copy), l_universeId_3 (copy)
                        v325.props.openExperienceGuidelinesExplained(l_universeId_3, true);
                    end, 
                    backgroundColor = l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
                }
            }
        } else nil;
    end;
    return l_withLocalization_0({
        buttonText = l_textKey_0
    })(function(v368) --[[ Line: 1801 ]]
        -- upvalues: v346 (copy), l_price_0 (copy), v325 (copy), l_deviceType_0 (copy), l_thumbnail_0 (ref), v335 (copy), l_FFlagHideCloseButtonEdp_0 (ref), l_tokens_0 (copy), l_universeId_3 (copy), v336 (copy), v337 (copy), v338 (copy), v333 (copy), v343 (copy), l_FFlagLuaAppEdpFixDefaultBanner_0 (ref), l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 (ref), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (ref), l_FFlagLuaAppEnablePlaySquadButton_0 (ref), l_icon_0 (copy), l_Images_0 (ref), v6 (ref), l_PlayButton_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v331 (copy), l_ButtonSize_0 (ref), v365 (copy), v366 (ref), v334 (copy), l_socialLinks_0 (copy), l_communityLink_0 (copy), v131 (ref), l_isFullscreen_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v42 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v340 (ref), v341 (ref), l_FFlagLuaAppIgrsRatingPropMemoization_0 (ref), l_mediaGalleryShowIndex_0 (copy), l_isCrossFade_0 (copy), l_currentIndex_0 (copy), l_nextIndex_0 (copy), v357 (ref), v359 (ref), v356 (ref), v358 (ref), l_DetailsPageSelector_0 (ref)
        local l_buttonText_0 = v368.buttonText;
        if v346.localizedFiatPrice then
            l_buttonText_0 = v346.localizedFiatPrice;
        elseif l_price_0 then
            l_buttonText_0 = v325.getAbbreviateCount(l_price_0);
        end;
        local v370 = {
            deviceType = l_deviceType_0, 
            thumbnailImageUrl = l_thumbnail_0, 
            titleText = v335, 
            hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v325.props.hideCloseButton else nil, 
            actionBarLabelText = v325.props.playButtonContextualMessage, 
            renderInfoContent = v325.renderInfoContent(l_tokens_0, l_universeId_3, v336, v337, v338, v325.props.creatorVerified or false, v333, v343.plays, v343.totalUpVotes, v343.totalDownVotes), 
            onClose = v325.onClose
        };
        local v371;
        if l_FFlagLuaAppEdpFixDefaultBanner_0 then
            v371 = v325.props.defaultBannerUrl;
            if not v371 then
                local v372 = v325.state.bannerImageId or v325.props.bannerImageId;
                v371 = if v372 then "rbxassetid://" .. v372 else "";
            end;
        else
            local v373 = v325.state.bannerImageId or v325.props.bannerImageId;
            v371 = if v373 then "rbxassetid://" .. v373 else "";
        end;
        v370.bannerImageUrl = v371;
        v370.actionBarProps = {
            iconSize = v325.props.tokens.iconSize, 
            buttonHeight = v325.props.actionBarHeight, 
            buttonPadding = l_tokens_0.headerItemPadding, 
            button = if l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v325.props.hasUnifiedPlayButtonIxp) then nil else {
                props = if l_FFlagLuaAppEnablePlaySquadButton_0 and v346.showSquadButton then {
                    button = {
                        onActivated = v325.onPlayButtonActivated, 
                        icon = if l_icon_0 then l_Images_0[l_icon_0] else nil, 
                        text = l_buttonText_0, 
                        isDisabled = v346.isDisabled
                    }, 
                    overflow = {
                        isDisabled = v346.isSquadButtonDisabled, 
                        onActivated = v325.props.onPlaySquadButtonActivated
                    }, 
                    size = v325.props.playButtonSize
                } else {
                    onActivated = v325.onPlayButtonActivated, 
                    icon = if l_icon_0 then l_Images_0[l_icon_0] else nil, 
                    text = l_buttonText_0, 
                    isDisabled = v346.isDisabled, 
                    isLoading = v346.isLoading, 
                    buttonType = v346.buttonType, 
                    size = v325.props.playButtonSize, 
                    buttonRef = v325.props.playButtonRef
                }
            }, 
            buttonOverride = if l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v325.props.hasUnifiedPlayButtonIxp) then v6.createElement(l_PlayButton_0, {
                universeId = l_universeId_3, 
                referralSource = v325.props.referralSource, 
                launchSource = "ExperienceDetailsPage", 
                fillBehavior = "Fill", 
                experienceJoinData = v325.props.experienceJoinData, 
                placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v325.props.placeIdOverride else nil, 
                buttonSize = if v331 then l_ButtonSize_0.Medium else l_ButtonSize_0.Large, 
                squadButtonHeight = UDim.new(0, v325.props.actionBarHeight), 
                testId = "--experience-details--play-button"
            }) else nil, 
            icons = v365, 
            textButtons = v366
        };
        v370.actionBarWidth = if l_FFlagLuaAppEnablePlaySquadButton_0 and v346.showSquadButton then v325.applyTokenScaling(420) else v325.applyTokenScaling(380);
        v370.actionBarHeight = v325.props.actionBarHeight;
        v370.componentList = v325.getBodyComponentListProps(l_universeId_3, v325.props.gameDetailsPageDataStatus, v333, v334, v343.plays, v343.visits, l_socialLinks_0, l_communityLink_0, v325.props.communityLinksEnabled, v325.props.communityLinkVariant, v325.props.detailsPageConfiguration or v131, l_isFullscreen_0, v331, v325.props.bannerImageId, if v325.props.gameDetail then v325.props.gameDetail.refundPolicy else nil, if l_FFlagLuaAppShowNoticeOnEdp_0 then v325.props.experienceDetailsNoticeType else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v42.getShouldInterleaveSdui() then v325.props.sduiFeedItemConfigs else nil, if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v340 else nil, if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v341 else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v325.props.webViewSupport else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v325.props.openWebview else nil, if l_FFlagLuaAppIgrsRatingPropMemoization_0 then v325.props.linking else nil);
        v370.isFullscreen = l_isFullscreen_0;
        v370.renderFullscreenContent = v325.renderFullscreenContent(l_universeId_3, l_mediaGalleryShowIndex_0, l_isFullscreen_0, l_isCrossFade_0, l_currentIndex_0, l_nextIndex_0);
        v370.sideMargin = v357;
        v370.startingOffsetPosition = v359;
        v370.thumbnailHeight = v356;
        v370.headerBarBackgroundHeight = v358;
        v370.dualPanelBreakpoint = 1e999;
        v370.maxContentWidth = 850;
        v370.tokens = if l_tokens_0 then {
            thumbnailMargin = l_tokens_0.thumbnailMargin, 
            thumbnailShadowHeight = l_tokens_0.thumbnailShadowHeight, 
            headerGradientHeight = l_tokens_0.headerGradientHeight, 
            headerBottomMargin = l_tokens_0.headerBottomMargin, 
            animationConfig = l_tokens_0.animationConfig, 
            itemPadding = l_tokens_0.itemPadding, 
            safeAreaSize = l_tokens_0.safeAreaSize, 
            trailingWhitespace = l_tokens_0.trailingWhitespace, 
            actionBarHeight = v325.props.actionBarHeight
        } else nil;
        v370.disableStickyActionBar = v325.props.disableStickyActionBar;
        v370.containerRef = v325.props.containerRef;
        return v6.createElement(l_DetailsPageSelector_0, {
            deviceType = l_deviceType_0, 
            detailsPageProps = v370
        });
    end);
end;
return function(v374) --[[ Line: 1963 ]] --[[ Name: ExperienceDetailsPageFn ]]
    -- upvalues: l_FFlagEDPTTITrackingEnabled_0 (copy), l_useFirstMediaCarouselImageUri_0 (copy), v85 (copy), l_EDPTTIConstants_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v42 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), v78 (copy), v79 (copy), v126 (copy), v127 (copy), v77 (copy), v80 (copy), l_useUiModeInfo_0 (copy), v27 (copy), v5 (copy), l_UiMode_0 (copy), l_useTokens_0 (copy), l_FFlagLuaAppFixEdpInitialFocus_0 (copy), v11 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_useCloseWithBackButton_0 (copy), v6 (copy), v128 (copy), v7 (copy)
    if l_FFlagEDPTTITrackingEnabled_0 then
        local v375 = l_useFirstMediaCarouselImageUri_0(v374.universeId);
        v85(l_EDPTTIConstants_0.EDP_IMPLEMENTATION.LEGACY_FULL_PAGE, v374.universeId, v375);
    end;
    local v376 = nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then
        v376 = v42.getShouldHydrateLegacy();
    end;
    local v377 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v377 = v42.getShouldInterleaveSdui();
    end;
    local v378 = nil;
    local v379 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        local v380 = v78.useSduiContextFromSignalAndProcessConfigs(v79.getUnprocessedEdpStoreKey((tostring(v374.universeId))), v79.getEdpStoreKey((tostring(v374.universeId))), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v377);
        v378 = v78.useSduiEdpFeedItemConfigs({
            sduiContext = v380, 
            storeKey = v79.getEdpStoreKey((tostring(v374.universeId))), 
            portraitLayoutConfig = v126, 
            landscapeLayoutConfig = v127, 
            defaultLayoutOrder = v126.SduiFeedItemsDefault, 
            logLayoutConflictFn = v77.logSduiLayoutOrderConflict, 
            shouldInterleaveSdui = l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v377
        });
        v379 = v80();
    end;
    local v381 = l_useUiModeInfo_0();
    local v382 = v27.useFocusGuiObject();
    local v383, v384 = v5.useState(nil);
    local v385 = if v374.tokens then v374.tokens.iconSize else 0;
    local v386 = if v381.uiMode == l_UiMode_0.TenFoot then UDim2.fromOffset(v385, v385) else nil;
    local v387 = UDim2.fromOffset(0, v385);
    local v388 = v374.tokens and v374.tokens.actionBarHeight or v385;
    local v389 = UDim2.new(1, 0, 0, v388);
    local v390 = l_useTokens_0();
    local v391 = nil;
    local v392 = nil;
    if l_FFlagLuaAppFixEdpInitialFocus_0 then
        v392 = v5.useRef(nil);
        v392.current = v11.usePreferredInput() == v11.Input.Directional;
    end;
    local v393 = if l_FFlagLuaAppFixEdpInitialFocus_0 then v392.current else v11.usePreferredInput() == v11.Input.Directional;
    if l_FFlagHideCloseButtonEdp_0 then
        v391 = v393;
    end;
    local v394 = nil;
    if l_FFlagLuaAppFixEdpInitialFocus_0 then
        v384 = l_useCloseWithBackButton_0(v384, v374.onClose);
        local v395 = nil;
        local v396, v397 = v5.useState(nil);
        v395 = v396;
        v394 = v397;
        v396 = v5.useRef(nil);
        do
            local l_v395_0 = v395;
            v5.useEffect(function() --[[ Line: 2041 ]]
                -- upvalues: l_v395_0 (ref), v396 (copy), v392 (ref), v382 (copy)
                if l_v395_0 == nil then
                    v396.current = false;
                    return;
                else
                    if l_v395_0 and v392.current and not v396.current then
                        v382(l_v395_0);
                        v396.current = true;
                    end;
                    return;
                end;
            end, {
                l_v395_0, 
                v382
            });
            v5.useEffect(function() --[[ Line: 2053 ]]
                -- upvalues: v383 (copy)
                local v399 = -1;
                local v400 = nil;
                if v383 then
                    v400 = v383.SelectionChanged:Connect(function(_, v402, v403) --[[ Line: 2057 ]]
                        -- upvalues: v383 (ref), v399 (ref)
                        if v403 == nil or v402 == nil or not v403:IsDescendantOf(v383) or not v402:IsDescendantOf(v383) then
                            return;
                        else
                            v403.SelectionOrder = v399;
                            v399 = v399 - 1;
                            return;
                        end;
                    end);
                end;
                return function() --[[ Line: 2071 ]]
                    -- upvalues: v400 (ref)
                    if v400 then
                        v400:Disconnect();
                    end;
                end;
            end, {
                v383
            });
        end;
    end;
    return v6.createElement(v128, v7.Dictionary.join({
        foundationTokens = v390, 
        uiModeInfo = v381, 
        focusGuiObject = v382, 
        iconButtonSize = v386, 
        textButtonSize = v387, 
        playButtonSize = v389, 
        actionBarHeight = v388, 
        playButtonRef = if l_FFlagLuaAppFixEdpInitialFocus_0 then v394 else nil, 
        containerRef = v384, 
        sduiFeedItemConfigs = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v377 then v378 else nil, 
        disableStickyActionBar = v393, 
        hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v391 else nil, 
        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v376 else nil, 
        shouldInterleaveSduiIxp = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v377 else nil, 
        edpServerIxpVariables = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v377 then v379 else nil
    }, v374));
end;