local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v2 = require(l_script_FirstAncestor_0.Footer.GridTileIconTextFooter);
local l_GridTileFriendFooter_0 = require(l_script_FirstAncestor_0.Footer.GridTileFriendFooter).GridTileFriendFooter;
local v4 = require(l_script_FirstAncestor_0.Footer.GridTileTextFooter);
local v5 = require(l_script_FirstAncestor_0.Footer.GameStats);
local v6 = require(l_script_FirstAncestor_0.Footer.GridTileSponsoredFooter);
local v7 = require(l_script_FirstAncestor_0.Overlays.GameTileThumbnailBadges);
local v8 = require(l_script_FirstAncestor_0.sortFriendsByPresenceAndRecencyFactory);
local v9 = require(l_script_FirstAncestor_0.OpenCentralOverlayForPlacesList);
local v10 = require(l_script_FirstAncestor_0.GameTileView);
local v11 = require(l_script_FirstAncestor_0.AppExperienceActionRow);
local v12 = require(l_script_FirstAncestor_0.GameTileConstants);
local v13 = require(l_script_FirstAncestor_0.OpenSponsoredTooltip);
local v14 = require(l_script_FirstAncestor_0.GameTileTypes);
local v15 = require(l_script_FirstAncestor_0.useIsHoveredTile);
local v16 = require(l_script_FirstAncestor_0.HoverTileCoordinator);
local v17 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local v18 = require(l_script_FirstAncestor_0.GameTileViewConfig);
local v19 = require(l_script_FirstAncestor_0.useHasInGameFriends);
local v20 = require(l_script_FirstAncestor_0.useInGameUserIds);
local v21 = require(l_script_FirstAncestor_0.Overlays.useValidTileBadges);
local v22 = require(l_script_FirstAncestor_0.GameTileVideoThumbnail);
local v23 = require(l_script_FirstAncestor_0.Video.Analytics.VideoEndReason);
local v24 = require(l_script_FirstAncestor_0.Video.GameVideoPlaybackDetector);
local v25 = require(l_script_FirstAncestor_0.Video.useHasVideoThumbnailSelector);
local v26 = require(l_script_FirstAncestor_0.formatExperienceIcon);
local v27 = require(l_script_FirstAncestor_0.formatExperienceRating);
local v28 = require(l_script_FirstAncestor_0.formatExperienceThumbnail);
local v29 = require(l_script_FirstAncestor_0.HiddenGameTile.HiddenTileContent);
local v30 = require(l_script_FirstAncestor_0.ItemLayoutDataParsingUtils);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v33 = require(l_Parent_0.AppBlox);
local v34 = require(l_Parent_0.React);
local v35 = require(l_Parent_0.Roact);
local v36 = require(l_Parent_0.RoactRodux);
local v37 = require(l_Parent_0.Cryo);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v40 = require(l_Parent_0.t);
local v41 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v41.Style.withStyle;
local l_Images_0 = v41.App.ImageSet.Images;
local l_AspectRatioModeEnum_0 = v41.App.Tile.AspectRatioModeEnum;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_IntervalPerformanceTracker_0 = require(l_Parent_0.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_GameIconReducer_0 = require(l_Parent_0.GameIconRodux).GameIcons.GameIconReducer;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_getOverflowMenuSignalStore_0 = v33.getOverflowMenuSignalStore;
local l_useOverflowMenuOpen_0 = v33.useOverflowMenuOpen;
local l_useTriggerFeedback_0 = require(l_Parent_0.InteractionFeedback).useTriggerFeedback;
local v58 = require(l_Parent_0.DiscoveryAnalytics);
local l_gameTileOverflowMenuAction_0 = v58.Events.gameTileOverflowMenuAction;
local l_sponsoredGamesRecordClick_0 = v58.Requests.sponsoredGamesRecordClick;
local v61 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v61.usePreferredInput;
local l_DiscoveryAppLaunchTracker_0 = require(l_Parent_0.AppLaunchTracker).DiscoveryAppLaunchTracker;
local l_GetFFlagEnableNavigationPerformanceIntervals_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
local l_FFlagLuaAppGameTileInteractionFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileInteractionFeedback;
local l_FFlagLuaAppMigrateGameTileHoverFixes_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes;
local l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText;
local l_FFlagLuaAppUnifyPlayButtonTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonTile;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagLuaAppGameDetailsAttributionFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameDetailsAttributionFix;
local v74 = game:DefineFastFlag("LuaAppUseRatingFormatHelper2", false);
local l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix;
local l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileOverflowMenuTelemetry;
local l_FFlagLuaAppHapticTriggeredTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry;
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppUpdateAdMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUpdateAdMetadata;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking;
local l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIgnoreEmptyStringWideThumbnail;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppCustomSpawnNonNilCheck_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCustomSpawnNonNilCheck;
local l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixTwoByOneOverflowMenuTelemetry;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata;
local l_FFlagLuaAppNarrowTileSmallerFooterFont_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont;
local l_FFlagLuaAppNarrowTileHideRating_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHideRating;
local l_FFlagLuaAppNarrowTileHidePlayerCount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount;
local l_VideoPlaybackCoordinator_0 = require(l_Parent_0.VideoUtils).VideoPlaybackCoordinator;
local v97 = require(l_script_FirstAncestor_0.GameTileOverflowMenu);
local v98 = require(l_script_FirstAncestor_0.getAvailableGameTileOverflowMenuItems);
local v99 = game:DefineFastInt("LuaAppGameTileVideoDwellTimeInSec", 3);
local v100 = game:DefineFastInt("LuaAppGameTileVideoVisiblePercent", 80);
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130);
local function _() --[[ Line: 134 ]] --[[ Name: getHoverDelay ]]
    return game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000;
end;
local v102 = v35.PureComponent:extend("AppGameTile");
v102.validateProps = v40.strictInterface({
    entry = v40.table, 
    reportGameDetailOpened = v40.callback, 
    reportExperienceLaunched = v40.optional(v40.callback), 
    Size = v40.optional(v40.union(v40.UDim2, v40.table)), 
    ZIndex = v40.optional(v40.number), 
    useHoverTile = v40.optional(v40.boolean), 
    hasBackground = v40.boolean, 
    useGridTile = v40.boolean, 
    playerCountStyle = v40.optional(v40.string), 
    isSponsoredFooterAllowed = v40.optional(v40.boolean), 
    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v40.optional(v40.boolean) else nil, 
    useExperienceTileMetadata = v40.boolean, 
    hideGameStats = v40.optional(v40.boolean), 
    gameTileLayoutType = v40.optional(v40.string), 
    topicId = v40.optional(v40.string), 
    playButtonStyle = v40.optional(v40.string), 
    onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v40.optional(v40.callback) else nil, 
    isDisabled = v40.optional(v40.boolean), 
    onActivated = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v40.optional(v40.callback) else nil, 
    onSelectionGained = v40.optional(v40.callback), 
    onSelectionLost = v40.optional(v40.callback), 
    friendFooterEnabled = v40.optional(v40.boolean), 
    index = v40.optional(v40.number), 
    layoutOrder = v40.optional(v40.number), 
    source = v40.optional(v40.string), 
    referralSource = v40.optional(v40.string), 
    onPeekViewClosed = v40.optional(v40.callback), 
    rowNum = v40.optional(v40.number), 
    showFriendActivity = v40.boolean, 
    contentTextLineCount = v40.optional(v40.number), 
    metadataTextLineCount = v40.optional(v40.number), 
    thumbnailAspectRatioOverride = v40.optional(v40.string), 
    impressionsTag = v40.optional(v40.string), 
    launchExperienceEventContext = v40.optional(v40.string), 
    navigateToGameDetails = v40.callback, 
    isContained = v40.optional(v40.boolean), 
    hideTitle = v40.optional(v40.boolean), 
    hideMetadata = v40.optional(v40.boolean), 
    textSizeOffset = v40.optional(v40.number), 
    foundationTokens = v40.optional(v40.table), 
    videoAnalytics = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v40.optional(v40.table) else nil, 
    SelectionOrder = v40.optional(v40.number), 
    enableExplicitFeedback = v40.optional(v40.boolean), 
    setGameHidden = v40.optional(v40.callback), 
    appPage = v40.optional(v40.string), 
    isHidden = v40.optional(v40.boolean), 
    isNarrowScreenXSmall = v40.optional(v40.boolean), 
    onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v40.optional(v40.callback) else nil, 
    sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v40.optional(v40.string) else nil, 
    enableSponsoredFeedback = v40.optional(v40.boolean), 
    availableMenuItems = v40.optional(v40.table), 
    enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v40.optional(v40.boolean) else nil, 
    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v40.optional(v40.string) else nil, 
    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v40.optional(v40.boolean) else nil, 
    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v40.optional(v40.boolean) else nil, 
    compactMetadataFormat = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v40.optional(v40.boolean) else nil, 
    hideRating = if l_FFlagLuaAppNarrowTileHideRating_0 then v40.optional(v40.boolean) else nil, 
    hidePlayerCount = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v40.optional(v40.boolean) else nil, 
    game = v40.optional(v40.table), 
    universeId = v40.string, 
    navigationUniverseId = v40.optional(v40.string), 
    name = v40.string, 
    totalUpVotes = v40.number, 
    totalDownVotes = v40.number, 
    friendActivityTitle = v40.optional(v40.string), 
    friendVisitedString = v40.optional(v40.string), 
    imageThumbnail = v40.string, 
    wideThumbnail = v40.optional(v40.string), 
    videoThumbnail = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v40.optional(v40.string) else nil, 
    rating = v40.optional(v40.string), 
    showAgeRating = v40.optional(v40.boolean), 
    ageRatingText = v40.optional(v40.string), 
    friendVisits = v40.table, 
    hidePlayButton = v40.boolean, 
    footerLayoutData = v40.optional(v40.table), 
    openContextualMenu = v40.callback, 
    openSponsoredTooltip = v40.callback, 
    networking = v40.callback, 
    hoverRef = v40.table, 
    isHoverSupported = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v40.optional(v40.boolean) else nil, 
    isHovered = v40.optional(v40.boolean), 
    isVideoPlaying = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v40.boolean else nil, 
    tileBadges = v40.optional(v40.table), 
    users = v40.optional(v40.table), 
    inGameUsersByGame = v40.optional(v40.table), 
    hasInGameFriends = v40.boolean, 
    inGameUserIds = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v40.table else nil, 
    badgeOverride = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v40.optional(v40.table) else nil, 
    forceHideAgeRatings = v40.optional(v40.boolean), 
    onGameTileActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v40.optional(v40.callback) else nil, 
    recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v40.optional(v40.callback) else nil, 
    overflowMenuOpen = v40.optional(v40.boolean), 
    hoverKey = v40.optional(v40.string), 
    triggerFeedback = v40.callback
});
local l_Narrow_0 = v14.GameTileLayoutType.Narrow;
v102.defaultProps = {
    useHoverTile = false, 
    hasBackground = false, 
    useExperienceTileMetadata = false, 
    useGridTile = false, 
    thumbnailAspectRatioOverride = l_AspectRatioModeEnum_0.Square, 
    gameTileLayoutType = l_Narrow_0, 
    contentTextLineCount = v12.TileTextLines[l_Narrow_0].titleTextLines, 
    hideGameStats = false
};
v102.init = function(v104) --[[ Line: 262 ]] --[[ Name: init ]]
    -- upvalues: l_DiscoveryAppLaunchTracker_0 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), v16 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_VideoPlaybackCoordinator_0 (copy), v23 (copy), v35 (copy), v11 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_sponsoredGamesRecordClick_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), l_IntervalPerformanceTracker_0 (copy), v61 (copy), l_ContentProvider_0 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), l_memoize_0 (copy), v8 (copy)
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileInit();
    end;
    v104.state = {
        isHovered = false, 
        canDisplayFriendFooter = false, 
        isSelected = false
    };
    v104.onMenuOpenChanged = l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 and function(v105, v106) --[[ Line: 274 ]]
        -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v104 (copy), l_gameTileOverflowMenuAction_0 (ref), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (ref)
        local v107 = {
            ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v104.props.appPage, 
            universeId = v104.props.universeId, 
            sortId = v104.props.topicId, 
            actionType = v105 and "GameTileOverflowMenuClosed" or "GameTileOverflowMenuOpened", 
            availableMenuItems = v106
        };
        l_gameTileOverflowMenuAction_0(v107, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v104.props.appPage or l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 and "Unknown" or nil else nil);
    end or nil;
    v104.onTouchLongPress = function() --[[ Line: 294 ]]
        -- upvalues: v104 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (ref), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (ref), l_getOverflowMenuSignalStore_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref)
        if next(v104.props.availableMenuItems) ~= nil then
            if v104.props.triggerFeedback and not v104.props.overflowMenuOpen then
                local v108 = if l_FFlagLuaAppHapticTriggeredTelemetry_0 then {
                    universeId = v104.props.universeId, 
                    sortId = v104.props.topicId
                } else nil;
                v104.props.triggerFeedback("TileLongPress", "Press", if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v104.props.appPage or l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 and "Unknown" or nil else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v108 else nil);
            end;
            l_getOverflowMenuSignalStore_0().openMenu(v104.props.hoverKey);
            if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                local v109 = {};
                for v110, _ in v104.props.availableMenuItems do
                    table.insert(v109, v110);
                end;
                v104.onMenuOpenChanged(false, table.concat(v109, ","));
            end;
        end;
    end;
    v104.reportExperienceLaunchedFromActionBar = function(...) --[[ Line: 328 ]]
        -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), v104 (copy), v16 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v23 (ref)
        if l_FFlagLuaAppGameDetailsAttributionFix_0 then
            v104.props.recordSponsoredGameClick();
        else
            v104.recordSponsoredGameClick();
        end;
        if v104.props.isHovered then
            v16.default:reset();
        end;
        if v104.props.reportExperienceLaunched then
            v104.props.reportExperienceLaunched(...);
        end;
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
            l_VideoPlaybackCoordinator_0.default:reset(v23.ExperienceLaunched, nil, v104.props.navigationUniverseId, nil);
        end;
    end;
    v104.renderAppExperienceActionRow = function(_) --[[ Line: 354 ]]
        -- upvalues: v35 (ref), v11 (ref), v104 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), l_FFlagLuaAppUnifyPlayButtonTile_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref)
        return v35.createElement(v11, {
            universeId = v104.props.navigationUniverseId, 
            referralSource = v104.props.referralSource, 
            launchSource = "ExperienceTile", 
            reportExperienceLaunched = v104.reportExperienceLaunchedFromActionBar, 
            openGameDetails = l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 361 ]]
                -- upvalues: v104 (ref)
                v104.props.onGameTileActivated(v104.isMounted);
            end or v104.onActivated, 
            entry = v104.props.entry, 
            launchExperienceEventContext = v104.props.launchExperienceEventContext, 
            horizontalPadding = v104.props.useGridTile and 0 or nil, 
            index = v104.props.index, 
            isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil, 
            placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v104.props.entry.placeIdOverride else nil, 
            launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v104.props.entry.launchDataOverride else nil
        });
    end;
    v104.onHoverChanged = function(v113) --[[ Line: 377 ]]
        -- upvalues: v104 (copy)
        if v113 and v104.props.triggerFeedback then
            v104.props.triggerFeedback("Default", "Hover");
        end;
        v104:setState({
            isHovered = v113
        });
    end;
    v104.gameTileRef = v35.createRef();
    v104.getTilePosition = function() --[[ Line: 389 ]]
        -- upvalues: v104 (copy)
        if v104.gameTileRef.current then
            return v104.gameTileRef.current.AbsolutePosition;
        else
            return nil;
        end;
    end;
    v104.getTileSize = function() --[[ Line: 397 ]]
        -- upvalues: v104 (copy)
        if v104.gameTileRef.current then
            return v104.gameTileRef.current.AbsoluteSize;
        else
            return nil;
        end;
    end;
    v104.recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then nil else function() --[[ Line: 407 ]]
        -- upvalues: v104 (copy), l_sponsoredGamesRecordClick_0 (ref)
        local l_networking_0 = v104.props.networking;
        local l_entry_0 = v104.props.entry;
        if l_entry_0.isSponsored then
            l_sponsoredGamesRecordClick_0(l_networking_0, l_entry_0.adId);
        end;
    end;
    v104.onActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then nil else function() --[[ Line: 418 ]]
        -- upvalues: v104 (copy), v16 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v23 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), l_IntervalPerformanceTracker_0 (ref)
        if v104.props.isHovered then
            v16.default:reset();
        end;
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
            l_VideoPlaybackCoordinator_0.default:reset(v23.TileClicked, nil, v104.props.navigationUniverseId, nil);
        end;
        if v104.isMounted then
            if l_FFlagLuaAppGameTileInteractionFeedback_0 and v104.props.onActivated then
                v104.props.onActivated();
            end;
            local l_navigationUniverseId_0 = v104.props.navigationUniverseId;
            local v117 = {
                source = v104.props.source, 
                index = v104.props.index, 
                referralSource = v104.props.referralSource, 
                onPeekViewClosed = v104.props.onPeekViewClosed, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v104.props.entry.placeIdOverride else nil, 
                experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v104.props.entry.launchDataOverride) then v104.props.entry.launchDataOverride else nil, 
                    tileType = v104.props.entry.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile, 
                    nativeAdData = v104.props.entry.adId
                } else if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v104.props.entry.launchDataOverride) then {
                    launchData = v104.props.entry.launchDataOverride
                } else nil
            };
            if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
            end;
            v104.props.navigateToGameDetails(l_navigationUniverseId_0, v117);
            local l_index_0 = v104.props.index;
            v104.props.reportGameDetailOpened(l_index_0, l_navigationUniverseId_0);
            v104.recordSponsoredGameClick();
        end;
    end;
    v104.onFriendFooterActivated = function() --[[ Line: 478 ]]
        -- upvalues: v104 (copy)
        if v104.isMounted then
            local l_game_0 = v104.props.game;
            local v120 = v104.getTileSize();
            v104.props.openContextualMenu(l_game_0, v120, v104.getTilePosition());
        end;
    end;
    v104.onActivateSponsoredTooltip = function() --[[ Line: 486 ]]
        -- upvalues: v104 (copy), v61 (ref)
        if v104.isMounted then
            v104.props.openSponsoredTooltip(v61.GetInputModeStore(false).getLastInputType(false));
        end;
    end;
    v104.loadWideThumbnail = function() --[[ Line: 494 ]]
        -- upvalues: v104 (copy), l_ContentProvider_0 (ref)
        local l_wideThumbnail_0 = v104.props.wideThumbnail;
        if l_wideThumbnail_0 ~= nil then
            task.spawn(function() --[[ Line: 497 ]]
                -- upvalues: l_ContentProvider_0 (ref), l_wideThumbnail_0 (copy)
                l_ContentProvider_0:PreloadAsync({
                    l_wideThumbnail_0
                });
            end);
        end;
    end;
    v104.getVisitedFriends = function() --[[ Line: 503 ]]
        -- upvalues: v104 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (ref)
        local v122 = {};
        local l_friendVisits_0 = v104.props.friendVisits;
        for v124 = 1, #l_friendVisits_0 do
            local v125 = tostring(l_friendVisits_0[v124].userId);
            if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
                table.insert(v122, v125);
            elseif v104.props.users and v104.props.users[v125] then
                local v126 = v104.props.users[v125];
                table.insert(v122, {
                    userId = v125, 
                    displayName = v126.displayName
                });
            end;
        end;
        return v122;
    end;
    v104.getSortedFriends = l_memoize_0(function(v127, v128) --[[ Line: 531 ]]
        -- upvalues: v8 (ref)
        if not v127 or not v128 then
            return {};
        else
            local v129 = {};
            for _, v131 in pairs(v128) do
                local v132 = v127[v131];
                if v132 and v132.isFriend then
                    table.insert(v129, {
                        userId = v132.id, 
                        displayName = v132.displayName
                    });
                end;
            end;
            local v133 = v8("displayName");
            table.sort(v129, v133);
            return v129;
        end;
    end);
    v104.onSelectionGained = function() --[[ Line: 553 ]]
        -- upvalues: v104 (copy)
        v104:setState({
            isSelected = true
        });
        if v104.props.onSelectionGained then
            v104.props.onSelectionGained(v104.props.entry, v104.props.index, v104.props.navigationUniverseId);
        end;
    end;
    v104.onSelectionLost = function() --[[ Line: 561 ]]
        -- upvalues: v104 (copy)
        v104:setState({
            isSelected = false
        });
        if v104.props.onSelectionLost then
            v104.props.onSelectionLost();
        end;
    end;
end;
local function _(v134) --[[ Line: 573 ]] --[[ Name: getTextLiteralForTextFooter ]]
    if v134 == nil then
        return nil;
    elseif v134.type ~= "TextLabel" then
        return nil;
    else
        local l_text_0 = v134.text;
        if l_text_0 == nil then
            return nil;
        else
            return l_text_0.textLiteral;
        end;
    end;
end;
v102.renderGridTilesFooter = function(v137) --[[ Line: 587 ]] --[[ Name: renderGridTilesFooter ]]
    -- upvalues: l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 (copy), v14 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy), v35 (copy), v5 (copy), v12 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), v34 (copy), v6 (copy), l_FFlagLuaAppUpdateAdMetadata_0 (copy), v4 (copy), l_GridTileFriendFooter_0 (copy), v2 (copy), l_Images_0 (copy)
    local v138 = v137.props.useHoverTile or v137.props.useExperienceTileMetadata;
    local l_friendFooterEnabled_0 = v137.props.friendFooterEnabled;
    local l_hasInGameFriends_0 = v137.props.hasInGameFriends;
    local v141 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v137.props.inGameUserIds else nil;
    local l_users_0 = v137.props.users;
    local l_inGameUsersByGame_0 = v137.props.inGameUsersByGame;
    local v144 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then nil else v137.getSortedFriends(l_users_0, l_inGameUsersByGame_0);
    local v145 = l_friendFooterEnabled_0 and if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v141 and #v141 > 0 else l_hasInGameFriends_0;
    local v146 = v137.props.friendVisits and #v137.props.friendVisits > 0;
    local _ = nil;
    local l_footerLayoutData_0 = v137.props.footerLayoutData;
    local v149;
    if l_footerLayoutData_0 == nil then
        v149 = nil;
    elseif l_footerLayoutData_0.type ~= "TextLabel" then
        v149 = nil;
    else
        local l_text_1 = l_footerLayoutData_0.text;
        v149 = if l_text_1 == nil then nil else l_text_1.textLiteral;
    end;
    l_footerLayoutData_0 = false;
    if (v137.props.isHovered or v137.state.isSelected) and v137.props.ageRatingText and not v137.props.hidePlayButton then
        v149 = v137.props.ageRatingText;
        l_footerLayoutData_0 = true;
    end;
    local v151 = v149 ~= nil;
    local l_entry_1 = v137.props.entry;
    local v153 = l_entry_1.isSponsored and (l_entry_1.isShowSponsoredLabel or v137.props.isSponsoredFooterAllowed or l_FFlagLuaAppSupportAdRatingFooter_0 and v137.props.isSponsoredRatingFooterAllowed or l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v137.props.sponsoredFooterAdLabelText ~= nil);
    if l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 and v137.props.gameTileLayoutType == v14.GameTileLayoutType.Narrow and v137.props.useExperienceTileMetadata and (v153 or v151) or l_FFlagLuaAppNarrowTileSmallerFooterFont_0 and v137.props.compactMetadataFormat then
        v138 = false;
    end;
    local v154 = if l_FFlagLuaAppSupportAdRatingFooter_0 then v35.createElement(v5, {
        stats = {
            totalUpVotes = v137.props.totalUpVotes, 
            totalDownVotes = v137.props.totalDownVotes, 
            playerCount = if not (v137.props.playerCountStyle == v12.PlayerCountStyleValues.Footer) or l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v153 then nil else v137.props.entry.playerCount
        }, 
        isGridTile = v137.props.useGridTile, 
        hideGameStats = v137.props.hideGameStats, 
        useLargerFont = v138, 
        isUnifiedGameTile = true, 
        gameTileLayoutType = v137.props.gameTileLayoutType, 
        shouldSizeToContentWidth = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v153 else nil, 
        compactMetadataFormat = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v137.props.compactMetadataFormat else nil, 
        hideRating = if l_FFlagLuaAppNarrowTileHideRating_0 then v137.props.hideRating else nil, 
        hidePlayerCount = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v137.props.hidePlayerCount else nil
    }) else nil;
    if v137.props.hideMetadata then
        if v137.props.isHovered then
            if v153 then
                return v34.createElement(v6, {
                    useLargerFont = v138, 
                    onActivateSponsoredTooltip = v137.onActivateSponsoredTooltip, 
                    isUnifiedGameTile = true, 
                    gameTileLayoutType = v137.props.gameTileLayoutType, 
                    isNarrowScreenXSmall = v137.props.isNarrowScreenXSmall, 
                    enableSponsoredFeedback = if l_FFlagLuaAppUpdateAdMetadata_0 then v137.props.enableSponsoredFeedback else nil, 
                    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v137.props.isSponsoredRatingFooterAllowed else nil, 
                    gameStatsElement = if l_FFlagLuaAppSupportAdRatingFooter_0 then v154 else nil, 
                    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v137.props.sponsoredFooterAdLabelText else nil, 
                    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v137.props.sponsoredFooterAdLabelFirst else nil, 
                    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v137.props.sponsoredFooterIncludeRatingContent else nil
                });
            elseif l_footerLayoutData_0 then
                return v34.createElement(v4, {
                    text = v149, 
                    useLargerFont = v138, 
                    isUnifiedGameTile = true
                });
            end;
        end;
        return nil;
    elseif v153 then
        return (v34.createElement(v6, {
            useLargerFont = v138, 
            onActivateSponsoredTooltip = v137.onActivateSponsoredTooltip, 
            isUnifiedGameTile = true, 
            gameTileLayoutType = v137.props.gameTileLayoutType, 
            isNarrowScreenXSmall = v137.props.isNarrowScreenXSmall, 
            enableSponsoredFeedback = if l_FFlagLuaAppUpdateAdMetadata_0 then v137.props.enableSponsoredFeedback else nil, 
            isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v137.props.isSponsoredRatingFooterAllowed else nil, 
            gameStatsElement = if l_FFlagLuaAppSupportAdRatingFooter_0 then v154 else nil, 
            sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v137.props.sponsoredFooterAdLabelText else nil, 
            sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v137.props.sponsoredFooterAdLabelFirst else nil, 
            sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v137.props.sponsoredFooterIncludeRatingContent else nil
        }));
    elseif v151 then
        return (v34.createElement(v4, {
            text = v149, 
            useLargerFont = v138, 
            isUnifiedGameTile = true
        }));
    elseif v145 then
        if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                useLargerFont = v138, 
                friendUserIds = v141, 
                onFriendFooterActivated = v137.onFriendFooterActivated
            }));
        else
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friends = v144, 
                useLargerFont = v138
            }));
        end;
    elseif v137.props.friendVisitedString then
        return (v35.createElement(v2, {
            icon = l_Images_0["icons/menu/recent"], 
            text = v137.props.friendVisitedString, 
            iconSize = v138 and 32 or 24, 
            useLargerFont = v138
        }));
    elseif v146 then
        if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friendUserIds = v137.getVisitedFriends(), 
                useLargerFont = v138
            }));
        else
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friends = v137.getVisitedFriends(), 
                useLargerFont = v138
            }));
        end;
    elseif l_FFlagLuaAppSupportAdRatingFooter_0 then
        return v154;
    else
        return (v35.createElement(v5, {
            stats = {
                totalUpVotes = v137.props.totalUpVotes, 
                totalDownVotes = v137.props.totalDownVotes, 
                playerCount = if v137.props.playerCountStyle == v12.PlayerCountStyleValues.Footer then v137.props.entry.playerCount else nil
            }, 
            isGridTile = v137.props.useGridTile, 
            hideGameStats = v137.props.hideGameStats, 
            useLargerFont = v138, 
            isUnifiedGameTile = true, 
            gameTileLayoutType = v137.props.gameTileLayoutType, 
            compactMetadataFormat = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v137.props.compactMetadataFormat else nil, 
            hideRating = if l_FFlagLuaAppNarrowTileHideRating_0 then v137.props.hideRating else nil, 
            hidePlayerCount = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v137.props.hidePlayerCount else nil
        }));
    end;
end;
v102.renderContent = function(v155, v156, v157, _) --[[ Line: 798 ]] --[[ Name: renderContent ]]
    -- upvalues: v12 (copy), v18 (copy), v34 (copy), v5 (copy), v29 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), v22 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), v35 (copy), v7 (copy), v97 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), v10 (copy), l_FFlagLuaAppMigrateGameTileHoverFixes_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v11 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy)
    local v159 = v155.props.Size or UDim2.fromScale(1, 1);
    local l_imageThumbnail_0 = v155.props.imageThumbnail;
    local l_onGameTileActivated_0 = v155.props.onGameTileActivated;
    local v162 = true;
    if v155.props.playerCountStyle ~= v12.PlayerCountStyleValues.Always then
        v162 = v155.props.isHovered and v155.props.playerCountStyle == v12.PlayerCountStyleValues.Hover;
    end;
    local v163 = v18.getImageAspectRatio(v155.props.gameTileLayoutType);
    local v164 = v155:renderGridTilesFooter();
    local v165 = if v155.props.hideTitle then nil else v155.props.name;
    local v166 = if v162 then v34.createElement(v5, {
        stats = {
            playerCount = v155.props.entry.playerCount, 
            displayConcurrentUsersPill = true
        }
    }) else nil;
    local l_playButtonHeight_0 = v18.getElementSizes(v157.Tokens, v155.props.textSizeOffset, v155.props.contentTextLineCount, v155.props.foundationTokens, true).playButtonHeight;
    local v168 = if v155.props.isHidden then v34.createElement(v29, {
        appPage = v155.props.appPage, 
        collectionId = v155.props.topicId, 
        setGameHidden = v155.props.setGameHidden, 
        universeId = v155.props.universeId, 
        parentRef = v155.props.hoverRef, 
        isSponsored = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v155.props.entry.isSponsored else nil
    }) else if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and v155.props.videoThumbnail then v34.createElement(v22, {
        video = v155.props.videoThumbnail, 
        image = l_imageThumbnail_0, 
        playing = v155.props.isVideoPlaying, 
        looped = true, 
        Size = UDim2.fromScale(1, 1), 
        isTileContained = v155.props.isContained, 
        cornerRadius = v157.Tokens.Global.Space_100, 
        ZIndex = -2, 
        onActivated = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 847 ]]
            -- upvalues: l_onGameTileActivated_0 (copy), v155 (copy)
            l_onGameTileActivated_0(v155.isMounted);
        end or v155.onActivated else nil, 
        itemIndex = v155.props.index, 
        videoAnalytics = v155.props.videoAnalytics
    }) else nil;
    local v169 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and not v155.props.isVideoPlaying then
        v169 = if v155.props.tileBadges then v35.createFragment({
            SocialFeaturePill = v166, 
            Badge = v34.createElement(v7, {
                tileBadgesByPosition = v155.props.tileBadges
            })
        }) else v166;
    end;
    local l_isHidden_0 = v155.props.isHidden;
    local v171 = if not (next(v155.props.availableMenuItems) ~= nil and (v155.props.isHovered or v155.props.overflowMenuOpen or v155.state.isSelected)) or l_isHidden_0 then nil else v34.createElement(v97, {
        isHovered = v155.props.isHovered, 
        isSelected = v155.state.isSelected, 
        universeId = v155.props.universeId, 
        collectionId = v155.props.topicId, 
        appPage = v155.props.appPage, 
        setGameHidden = v155.props.setGameHidden, 
        menuKey = v155.props.hoverKey, 
        menuOpen = v155.props.overflowMenuOpen, 
        onMenuOpenChanged = if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v155.onMenuOpenChanged else nil, 
        parentRef = v155.props.hoverRef, 
        isSponsored = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v155.props.entry.isSponsored else nil, 
        payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v155.props.entry.payerName else nil, 
        sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v155.props.sponsoredUserCohort else nil, 
        adId = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v155.props.entry.adId else nil, 
        availableMenuItems = v155.props.availableMenuItems
    });
    return v34.createElement("Frame", {
        Size = v159, 
        ZIndex = v155.props.ZIndex, 
        BackgroundTransparency = 1, 
        LayoutOrder = v155.props.layoutOrder, 
        ref = v155.gameTileRef
    }, {
        Tile = v34.createElement(v10, {
            SelectionOrder = v155.props.SelectionOrder, 
            Selectable = not l_isHidden_0, 
            hoverPadding = if not not l_FFlagLuaAppMigrateGameTileHoverFixes_0 or v155.props.useGridTile then nil else v157.Tokens.Global.Space_100, 
            numLinesForTitle = v155.props.contentTextLineCount, 
            numLinesForMetadata = v155.props.metadataTextLineCount, 
            imageAspectRatio = v163, 
            isContained = v155.props.isContained, 
            containmentSidePadding = v18.getContainmentSidePadding(v157.Tokens, v155.props.gameTileLayoutType, v155.props.foundationTokens), 
            Size = UDim2.fromScale(1, 1), 
            image = l_imageThumbnail_0, 
            onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v155.props.onTileImageLoaded else nil, 
            thumbnailComponent = v168, 
            title = if l_isHidden_0 then nil else v165, 
            isDisabled = l_isHidden_0 and true or v155.props.isDisabled, 
            onActivated = if not l_FFlagLuaAppGameDetailsAttributionFix_0 or l_isHidden_0 then v155.onActivated else function() --[[ Line: 930 ]]
                -- upvalues: l_onGameTileActivated_0 (copy), v155 (copy)
                l_onGameTileActivated_0(v155.isMounted);
            end, 
            onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v155.props.onGuiStateChanged else nil, 
            onSelectionGained = v155.onSelectionGained, 
            onSelectionLost = v155.onSelectionLost, 
            onTouchLongPress = if not l_isHidden_0 then v155.onTouchLongPress else nil, 
            reducedMotion = v156, 
            isHovered = not l_isHidden_0 and v155.props.isHovered, 
            forwardRef = v155.props.hoverRef, 
            hidePlayButton = l_isHidden_0 and true or v155.props.hidePlayButton, 
            hoverActionRow = if not not v155.props.hidePlayButton or l_isHidden_0 then nil else v34.createElement(v11, {
                universeId = v155.props.navigationUniverseId, 
                referralSource = v155.props.referralSource, 
                launchSource = "ExperienceTile", 
                reportExperienceLaunched = v155.reportExperienceLaunchedFromActionBar, 
                openGameDetails = l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 949 ]]
                    -- upvalues: l_onGameTileActivated_0 (copy), v155 (copy)
                    l_onGameTileActivated_0(v155.isMounted);
                end or v155.onActivated, 
                entry = v155.props.entry, 
                launchExperienceEventContext = v155.props.launchExperienceEventContext, 
                fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000, 
                index = v155.props.index, 
                horizontalPadding = 0, 
                verticalPadding = 0, 
                height = l_playButtonHeight_0, 
                showButtonText = v163 > 1, 
                isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v155.props.entry.placeIdOverride else nil, 
                launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v155.props.entry.launchDataOverride else nil
            }), 
            thumbnailOverlay = if l_isHidden_0 then nil else if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v169 else if v155.props.tileBadges then v35.createFragment({
                SocialFeaturePill = v166, 
                Badge = v34.createElement(v7, {
                    tileBadgesByPosition = v155.props.tileBadges
                })
            }) else v166, 
            overflowMenu = v171, 
            footerMetadata = if l_isHidden_0 then nil else v164, 
            isUnifiedGameTile = true, 
            textSizeOffset = v155.props.textSizeOffset, 
            hideMetadata = v155.props.hideMetadata
        })
    });
end;
v102.render = function(v172) --[[ Line: 991 ]] --[[ Name: render ]]
    -- upvalues: l_DiscoveryAppLaunchTracker_0 (copy), l_withStyle_0 (copy)
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileRender();
    end;
    if v172.props.game == nil then
        return nil;
    else
        return l_withStyle_0(function(v173) --[[ Line: 1001 ]]
            -- upvalues: v172 (copy)
            local l_ReducedMotion_0 = v173.Settings.ReducedMotion;
            return v172:renderContent(l_ReducedMotion_0, v173, v172.props.foundationTokens);
        end);
    end;
end;
v102.didMount = function(v175) --[[ Line: 1007 ]] --[[ Name: didMount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v175.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v175.gameTileRef, v175.props.impressionsTag, v175.props.index);
    if not v175.props.useGridTile and v175.props.friendFooterEnabled and v175.props.hasInGameFriends then
        v175:setState({
            canDisplayFriendFooter = true
        });
    end;
    if v175.props.useGridTile then
        v175.loadWideThumbnail();
    end;
end;
v102.willUnmount = function(v176) --[[ Line: 1022 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v176.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v176.gameTileRef, v176.props.impressionsTag, v176.props.index);
end;
v102.didUpdate = function(v177, v178) --[[ Line: 1027 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    if v178.impressionsTag ~= v177.props.impressionsTag or v178.index ~= v177.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v177.gameTileRef, v178.impressionsTag, v178.index);
        l_ImpressionsTagUtility_0.AddTag(v177.gameTileRef, v177.props.impressionsTag, v177.props.index);
    end;
    if v177.props.useGridTile and v178.universeId ~= v177.props.universeId then
        v177.loadWideThumbnail();
    end;
    if not v177.props.useGridTile and (v178.friendFooterEnabled ~= v177.props.friendFooterEnabled or v178.hasInGameFriends ~= v177.props.hasInGameFriends) and v177.props.friendFooterEnabled and v177.props.hasInGameFriends then
        v177:setState({
            canDisplayFriendFooter = true
        });
    end;
end;
local function _(v179, v180) --[[ Line: 1052 ]] --[[ Name: formatRating ]]
    if v179 + v180 == 0 then
        return "--";
    else
        return tostring((math.floor(v179 / (v179 + v180) * 100 + 0.5))) .. "%";
    end;
end;
v102 = v36.connect(function(v182, v183) --[[ Line: 1060 ]]
    -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_GameInfosReducer_0 (copy), v12 (copy), v17 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), v30 (copy), v28 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_GameIconReducer_0 (copy), v26 (copy), v74 (copy), v27 (copy)
    local l_universeId_0 = v183.entry.universeId;
    local v185 = nil;
    if not l_FFlagLuaAppGameDetailsAttributionFix_0 then
        v185 = if v183.entry.navigationUniverseId and v183.entry.navigationUniverseId ~= "" and v183.entry.navigationUniverseId ~= "0" then v183.entry.navigationUniverseId else v183.entry.universeId;
    end;
    local v186 = v182.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    local v187 = v186 and v186.totalUpVotes or 0;
    local v188 = v186 and v186.totalDownVotes or 0;
    local v189 = v186 and v186.friendActivityTitle or nil;
    local v190 = nil;
    local v191 = nil;
    local v192 = v186 and v186.minimumAge or 0;
    local v193 = v186 and v186.ageRecommendationDisplayName or "";
    local v194 = nil;
    v194 = if v183.gameTileLayoutType == "Event" then v183.playButtonStyle ~= v12.PlayButtonStyleValues.Enabled else v183.gameTileLayoutType == "Wide" and v183.playButtonStyle == v12.PlayButtonStyleValues.Disabled;
    if v194 or v183.forceHideAgeRatings then
        v190 = false;
    elseif v192 ~= 0 and v193 ~= "" then
        v190 = true;
        v191 = v193;
    else
        v190 = false;
    end;
    local v195 = v17(v186, v183.topicId);
    local v196 = (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v183.entry.primaryWideImageAssetId then v183.entry.primaryWideImageAssetId else if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then v30.getWideImageAssetId(v195) else v195 and v195.primaryMediaAsset and v195.primaryMediaAsset.wideImageAssetId) or v186 and v186.primaryWideAssetId or nil;
    local v197 = v28(v196, v183.entry.placeId);
    local v198 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        local v199 = if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v183.entry.primaryWideVideoAssetId then v183.entry.primaryWideVideoAssetId else v195 and v195.primaryMediaAsset and v195.primaryMediaAsset.wideVideoAssetId;
        v198 = if v199 then ("rbxassetid://%*"):format(v199) else nil;
    end;
    local v200 = v182[l_GameIconReducer_0.key][l_universeId_0] and v182[l_GameIconReducer_0.key][l_universeId_0].url or nil;
    local v201 = if v183.useGridTile then v197 else v26(v200, l_universeId_0);
    local v202 = if not not v183.useHoverTile or v183.useExperienceTileMetadata then if v74 then v27(v187, v188, nil, true) else v187 + v188 == 0 and "--" or tostring((math.floor(v187 / (v187 + v188) * 100 + 0.5))) .. "%" else nil;
    local v203 = v186 and v186.friendVisits or {};
    local v204 = if v186 and v186.friendVisitedString ~= "" then v186.friendVisitedString else nil;
    local v205 = v195 and v195.footer or nil;
    local v206 = v195 and v195.title or v186 and v186.name or "";
    return {
        game = v186, 
        universeId = l_universeId_0, 
        navigationUniverseId = if not l_FFlagLuaAppGameDetailsAttributionFix_0 then v185 else nil, 
        name = v206, 
        totalUpVotes = v187, 
        totalDownVotes = v188, 
        imageThumbnail = v201, 
        wideThumbnail = v197, 
        videoThumbnail = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v198 else nil, 
        friendActivityTitle = v189, 
        rating = v202, 
        showAgeRating = v190, 
        ageRatingText = v191, 
        friendVisits = v203, 
        friendVisitedString = v204, 
        hidePlayButton = v194, 
        footerLayoutData = v205
    };
end, function(v207) --[[ Line: 1170 ]]
    -- upvalues: v9 (copy), v13 (copy)
    return {
        openContextualMenu = function(v208, v209, v210) --[[ Line: 1172 ]] --[[ Name: openContextualMenu ]]
            -- upvalues: v207 (copy), v9 (ref)
            v207(v9(v208, v209, v210));
        end, 
        openSponsoredTooltip = function(v211) --[[ Line: 1175 ]] --[[ Name: openSponsoredTooltip ]]
            -- upvalues: v207 (copy), v13 (ref)
            return v207(v13(v211));
        end
    };
end)(v102);
if not l_FFlagLuaAppGameDetailsAttributionFix_0 then
    v102 = l_RoactServices_0.connect({
        networking = l_RoactNetworking_0
    })(v102);
end;
return function(v212) --[[ Line: 1187 ]]
    -- upvalues: v34 (copy), l_useTokens_0 (copy), v15 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), v21 (copy), l_useSelector_0 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), v19 (copy), v20 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_sponsoredGamesRecordClick_0 (copy), v16 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_VideoPlaybackCoordinator_0 (copy), v23 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_useOverflowMenuOpen_0 (copy), l_useTriggerFeedback_0 (copy), v98 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), v102 (ref), v37 (copy), v25 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_usePreferredInput_0 (copy), v24 (copy), v61 (copy), v99 (copy), v100 (copy), l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 (copy)
    local v213 = v34.useRef(nil);
    local v214 = l_useTokens_0();
    local l_useHoverTile_0 = v212.useHoverTile;
    local v216 = ("%*_%*_%*"):format(v212.impressionsTag or "", v212.index or "0", v212.gameTileLayoutType or "Narrow");
    if v212.impressionsTag == nil or v212.index == nil then
        l_useHoverTile_0 = false;
    end;
    local v217 = v15(v213, v216, l_useHoverTile_0);
    local v218 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v219 = v218 and true or v212.useHoverTile;
    local v220 = nil;
    v220 = if v212.useExperienceTileMetadata ~= nil then v212.useExperienceTileMetadata else v218;
    local v221 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v21(v212.entry.universeId, v212.topicId, v212.badgeOverride) else v21(v212.entry.universeId, v212.topicId);
    local v223 = l_useSelector_0(function(v222) --[[ Line: 1212 ]]
        return v222.LocalUserId;
    end);
    local v224 = nil;
    if not l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
        v224 = l_useSelector_0(function(v225) --[[ Line: 1218 ]]
            return v225.Users;
        end);
    end;
    local v227 = l_useSelector_0(function(v226) --[[ Line: 1223 ]]
        -- upvalues: v212 (copy)
        return v226.InGameUsersByGame[v212.entry.universeId];
    end);
    local v228 = v19(v223, v224, v227);
    local v229 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v20(v223, v227) else nil;
    local v230, v231 = v34.useState(false);
    local v232 = nil;
    local v233 = nil;
    local v234 = nil;
    local v235 = nil;
    if l_FFlagLuaAppGameDetailsAttributionFix_0 then
        v232 = l_useRoactService_0(l_RoactNetworking_0);
        v233 = if v212.entry.navigationUniverseId and v212.entry.navigationUniverseId ~= "" and v212.entry.navigationUniverseId ~= "0" then v212.entry.navigationUniverseId else v212.entry.universeId;
        v235 = v34.useCallback(function() --[[ Line: 1248 ]]
            -- upvalues: v212 (copy), l_sponsoredGamesRecordClick_0 (ref), v232 (ref)
            local l_entry_2 = v212.entry;
            if l_entry_2.isSponsored then
                l_sponsoredGamesRecordClick_0(v232, l_entry_2.adId);
            end;
        end, {
            v232, 
            v212.entry.isSponsored, 
            v212.entry.adId
        });
        v234 = v34.useCallback(function(v237) --[[ Line: 1257 ]]
            -- upvalues: v212 (copy), v16 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v23 (ref), v233 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), l_IntervalPerformanceTracker_0 (ref), v235 (ref)
            if v212.isHovered then
                v16.default:reset();
            end;
            if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
                l_VideoPlaybackCoordinator_0.default:reset(v23.TileClicked, nil, v233, nil);
            end;
            if v237 then
                if l_FFlagLuaAppGameTileInteractionFeedback_0 and v212.onActivated then
                    v212.onActivated();
                end;
                local v238 = {
                    source = v212.source, 
                    index = v212.index, 
                    referralSource = v212.referralSource, 
                    onPeekViewClosed = v212.onPeekViewClosed, 
                    placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v212.entry.placeIdOverride else nil, 
                    experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                        launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v212.entry.launchDataOverride) then v212.entry.launchDataOverride else nil, 
                        tileType = v212.entry.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile, 
                        nativeAdData = v212.entry.adId
                    } else if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v212.entry.launchDataOverride) then {
                        launchData = v212.entry.launchDataOverride
                    } else nil
                };
                if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                    l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
                end;
                v212.navigateToGameDetails(v233, v238);
                v212.reportGameDetailOpened(v212.index, v233);
                v235();
            end;
        end, {
            v212.isHovered, 
            v212.index, 
            v212.videoAnalytics, 
            v212.onActivated, 
            v212.source, 
            v212.referralSource, 
            v212.onPeekViewClosed, 
            v212.navigateToGameDetails, 
            v212.reportGameDetailOpened, 
            v233, 
            v235, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v212.entry.placeIdOverride else nil, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v212.entry.launchDataOverride else nil
        });
    end;
    local v239 = l_useOverflowMenuOpen_0(v216);
    local v240 = l_useTriggerFeedback_0();
    local v241 = v34.useMemo(function() --[[ Line: 1330 ]]
        -- upvalues: v98 (ref), v212 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref)
        return v98({
            isSponsored = v212.entry.isSponsored, 
            enableExplicitFeedback = v212.enableExplicitFeedback, 
            enableSponsoredFeedback = v212.enableSponsoredFeedback, 
            enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v212.enableReportAd else nil
        });
    end, {
        v212.entry.isSponsored, 
        v212.enableExplicitFeedback, 
        v212.enableSponsoredFeedback, 
        if l_FFlagLuaAppEnableSponsoredReportAd_0 then v212.enableReportAd else nil
    });
    local v242 = v34.createElement(v102, v37.Dictionary.join(v212, {
        useExperienceTileMetadata = v220, 
        hasBackground = v219, 
        hoverRef = v213, 
        isHoverSupported = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then l_useHoverTile_0 else nil, 
        isHovered = v217, 
        isVideoPlaying = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v230 else nil, 
        tileBadges = v221, 
        foundationTokens = v214, 
        users = v224, 
        inGameUsersByGame = v227, 
        hasInGameFriends = v228, 
        inGameUserIds = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v229 else nil, 
        networking = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v232 else nil, 
        navigationUniverseId = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v233 else nil, 
        onGameTileActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v234 else nil, 
        recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v235 else nil, 
        overflowMenuOpen = v239, 
        hoverKey = v216, 
        triggerFeedback = v240, 
        availableMenuItems = v241
    }));
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        local v243 = v25(v212.entry.universeId, v212.topicId);
        if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 then
            local v244 = true;
            if v212.entry.primaryWideVideoAssetId == nil then
                v244 = v243;
            end;
            v243 = v244;
        end;
        local v245 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then l_usePreferredInput_0() else nil;
        if v243 then
            return v34.createElement(v34.Fragment, {}, {
                GameTile = v242, 
                VideoPlaybackDetector = v34.createElement(v24, {
                    videoKey = v216, 
                    itemIndex = v212.index, 
                    universeId = v212.entry.universeId, 
                    tileRef = v213, 
                    isHoverSupported = l_useHoverTile_0, 
                    isHovered = v217, 
                    autoplay = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v245 == v61.Input.Touch else nil, 
                    onPlaybackChange = v231, 
                    videoAnalytics = v212.videoAnalytics, 
                    videoDwellTimeInSec = v99, 
                    videoVisiblePercent = v100, 
                    pageContext = if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then v212.appPage else nil
                })
            });
        end;
    end;
    return v242;
end;