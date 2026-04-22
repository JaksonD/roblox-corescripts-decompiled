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
local l_FFlagLuaAppGameTileInteractionFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileInteractionFeedback;
local l_FFlagLuaAppMigrateGameTileHoverFixes_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes;
local l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText;
local l_FFlagLuaAppUnifyPlayButtonTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonTile;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagLuaAppGameDetailsAttributionFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameDetailsAttributionFix;
local v73 = game:DefineFastFlag("LuaAppUseRatingFormatHelper2", false);
local l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix;
local l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileOverflowMenuTelemetry;
local l_FFlagLuaAppHapticTriggeredTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry;
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppUpdateAdMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUpdateAdMetadata;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking;
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
local v94 = game:DefineFastFlag("LuaAppHasVideoThumbnailFix", false) and l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0;
local l_FIntLuaAppGameTileVideoDwellTimeInSec_0 = require(l_Parent_0.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec;
local l_FIntLuaAppGameTileVideoVisiblePercent_0 = require(l_Parent_0.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent;
local l_VideoPlaybackCoordinator_0 = require(l_Parent_0.VideoUtils).VideoPlaybackCoordinator;
local v98 = require(l_script_FirstAncestor_0.GameTileOverflowMenu);
local v99 = require(l_script_FirstAncestor_0.getAvailableGameTileOverflowMenuItems);
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130);
local function _() --[[ Line: 131 ]] --[[ Name: getHoverDelay ]]
    return game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000;
end;
local v101 = v35.PureComponent:extend("AppGameTile");
v101.validateProps = v40.strictInterface({
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
    badgeOverride = v40.optional(v40.table), 
    forceHideAgeRatings = v40.optional(v40.boolean), 
    onGameTileActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v40.optional(v40.callback) else nil, 
    recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v40.optional(v40.callback) else nil, 
    overflowMenuOpen = v40.optional(v40.boolean), 
    hoverKey = v40.optional(v40.string), 
    triggerFeedback = v40.callback
});
local l_Narrow_0 = v14.GameTileLayoutType.Narrow;
v101.defaultProps = {
    useHoverTile = false, 
    hasBackground = false, 
    useExperienceTileMetadata = false, 
    useGridTile = false, 
    thumbnailAspectRatioOverride = l_AspectRatioModeEnum_0.Square, 
    gameTileLayoutType = l_Narrow_0, 
    contentTextLineCount = v12.TileTextLines[l_Narrow_0].titleTextLines, 
    hideGameStats = false
};
v101.init = function(v103) --[[ Line: 259 ]] --[[ Name: init ]]
    -- upvalues: l_DiscoveryAppLaunchTracker_0 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), v16 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_VideoPlaybackCoordinator_0 (copy), v23 (copy), v35 (copy), v11 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_sponsoredGamesRecordClick_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), l_IntervalPerformanceTracker_0 (copy), v61 (copy), l_ContentProvider_0 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), l_memoize_0 (copy), v8 (copy)
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileInit();
    end;
    v103.state = {
        isHovered = false, 
        canDisplayFriendFooter = false, 
        isSelected = false
    };
    v103.onMenuOpenChanged = l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 and function(v104, v105) --[[ Line: 271 ]]
        -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v103 (copy), l_gameTileOverflowMenuAction_0 (ref), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (ref)
        local v106 = {
            ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v103.props.appPage, 
            universeId = v103.props.universeId, 
            sortId = v103.props.topicId, 
            actionType = v104 and "GameTileOverflowMenuClosed" or "GameTileOverflowMenuOpened", 
            availableMenuItems = v105
        };
        l_gameTileOverflowMenuAction_0(v106, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v103.props.appPage or l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 and "Unknown" or nil else nil);
    end or nil;
    v103.onTouchLongPress = function() --[[ Line: 291 ]]
        -- upvalues: v103 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (ref), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (ref), l_getOverflowMenuSignalStore_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref)
        if next(v103.props.availableMenuItems) ~= nil then
            if v103.props.triggerFeedback and not v103.props.overflowMenuOpen then
                local v107 = if l_FFlagLuaAppHapticTriggeredTelemetry_0 then {
                    universeId = v103.props.universeId, 
                    sortId = v103.props.topicId
                } else nil;
                v103.props.triggerFeedback("TileLongPress", "Press", if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v103.props.appPage or l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 and "Unknown" or nil else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v107 else nil);
            end;
            l_getOverflowMenuSignalStore_0().openMenu(v103.props.hoverKey);
            if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                local v108 = {};
                for v109, _ in v103.props.availableMenuItems do
                    table.insert(v108, v109);
                end;
                v103.onMenuOpenChanged(false, table.concat(v108, ","));
            end;
        end;
    end;
    v103.reportExperienceLaunchedFromActionBar = function(...) --[[ Line: 325 ]]
        -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), v103 (copy), v16 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v23 (ref)
        if l_FFlagLuaAppGameDetailsAttributionFix_0 then
            v103.props.recordSponsoredGameClick();
        else
            v103.recordSponsoredGameClick();
        end;
        if v103.props.isHovered then
            v16.default:reset();
        end;
        if v103.props.reportExperienceLaunched then
            v103.props.reportExperienceLaunched(...);
        end;
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
            l_VideoPlaybackCoordinator_0.default:reset(v23.ExperienceLaunched, nil, v103.props.navigationUniverseId, nil);
        end;
    end;
    v103.renderAppExperienceActionRow = function(_) --[[ Line: 351 ]]
        -- upvalues: v35 (ref), v11 (ref), v103 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), l_FFlagLuaAppUnifyPlayButtonTile_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref)
        return v35.createElement(v11, {
            universeId = v103.props.navigationUniverseId, 
            referralSource = v103.props.referralSource, 
            launchSource = "ExperienceTile", 
            reportExperienceLaunched = v103.reportExperienceLaunchedFromActionBar, 
            openGameDetails = l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 358 ]]
                -- upvalues: v103 (ref)
                v103.props.onGameTileActivated(v103.isMounted);
            end or v103.onActivated, 
            entry = v103.props.entry, 
            launchExperienceEventContext = v103.props.launchExperienceEventContext, 
            horizontalPadding = v103.props.useGridTile and 0 or nil, 
            index = v103.props.index, 
            isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil, 
            placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v103.props.entry.placeIdOverride else nil, 
            launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v103.props.entry.launchDataOverride else nil
        });
    end;
    v103.onHoverChanged = function(v112) --[[ Line: 374 ]]
        -- upvalues: v103 (copy)
        if v112 and v103.props.triggerFeedback then
            v103.props.triggerFeedback("Default", "Hover");
        end;
        v103:setState({
            isHovered = v112
        });
    end;
    v103.gameTileRef = v35.createRef();
    v103.getTilePosition = function() --[[ Line: 386 ]]
        -- upvalues: v103 (copy)
        if v103.gameTileRef.current then
            return v103.gameTileRef.current.AbsolutePosition;
        else
            return nil;
        end;
    end;
    v103.getTileSize = function() --[[ Line: 394 ]]
        -- upvalues: v103 (copy)
        if v103.gameTileRef.current then
            return v103.gameTileRef.current.AbsoluteSize;
        else
            return nil;
        end;
    end;
    v103.recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then nil else function() --[[ Line: 404 ]]
        -- upvalues: v103 (copy), l_sponsoredGamesRecordClick_0 (ref)
        local l_networking_0 = v103.props.networking;
        local l_entry_0 = v103.props.entry;
        if l_entry_0.isSponsored then
            l_sponsoredGamesRecordClick_0(l_networking_0, l_entry_0.adId);
        end;
    end;
    v103.onActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then nil else function() --[[ Line: 415 ]]
        -- upvalues: v103 (copy), v16 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v23 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), l_IntervalPerformanceTracker_0 (ref)
        if v103.props.isHovered then
            v16.default:reset();
        end;
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
            l_VideoPlaybackCoordinator_0.default:reset(v23.TileClicked, nil, v103.props.navigationUniverseId, nil);
        end;
        if v103.isMounted then
            if l_FFlagLuaAppGameTileInteractionFeedback_0 and v103.props.onActivated then
                v103.props.onActivated();
            end;
            local l_navigationUniverseId_0 = v103.props.navigationUniverseId;
            local v116 = {
                source = v103.props.source, 
                index = v103.props.index, 
                referralSource = v103.props.referralSource, 
                onPeekViewClosed = v103.props.onPeekViewClosed, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v103.props.entry.placeIdOverride else nil, 
                experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v103.props.entry.launchDataOverride) then v103.props.entry.launchDataOverride else nil, 
                    tileType = v103.props.entry.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile, 
                    nativeAdData = v103.props.entry.adId
                } else if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v103.props.entry.launchDataOverride) then {
                    launchData = v103.props.entry.launchDataOverride
                } else nil
            };
            if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
            end;
            v103.props.navigateToGameDetails(l_navigationUniverseId_0, v116);
            local l_index_0 = v103.props.index;
            v103.props.reportGameDetailOpened(l_index_0, l_navigationUniverseId_0);
            v103.recordSponsoredGameClick();
        end;
    end;
    v103.onFriendFooterActivated = function() --[[ Line: 475 ]]
        -- upvalues: v103 (copy)
        if v103.isMounted then
            local l_game_0 = v103.props.game;
            local v119 = v103.getTileSize();
            v103.props.openContextualMenu(l_game_0, v119, v103.getTilePosition());
        end;
    end;
    v103.onActivateSponsoredTooltip = function() --[[ Line: 483 ]]
        -- upvalues: v103 (copy), v61 (ref)
        if v103.isMounted then
            v103.props.openSponsoredTooltip(v61.GetInputModeStore(false).getLastInputType(false));
        end;
    end;
    v103.loadWideThumbnail = function() --[[ Line: 491 ]]
        -- upvalues: v103 (copy), l_ContentProvider_0 (ref)
        local l_wideThumbnail_0 = v103.props.wideThumbnail;
        if l_wideThumbnail_0 ~= nil then
            task.spawn(function() --[[ Line: 494 ]]
                -- upvalues: l_ContentProvider_0 (ref), l_wideThumbnail_0 (copy)
                l_ContentProvider_0:PreloadAsync({
                    l_wideThumbnail_0
                });
            end);
        end;
    end;
    v103.getVisitedFriends = function() --[[ Line: 500 ]]
        -- upvalues: v103 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (ref)
        local v121 = {};
        local l_friendVisits_0 = v103.props.friendVisits;
        for v123 = 1, #l_friendVisits_0 do
            local v124 = tostring(l_friendVisits_0[v123].userId);
            if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
                table.insert(v121, v124);
            elseif v103.props.users and v103.props.users[v124] then
                local v125 = v103.props.users[v124];
                table.insert(v121, {
                    userId = v124, 
                    displayName = v125.displayName
                });
            end;
        end;
        return v121;
    end;
    v103.getSortedFriends = l_memoize_0(function(v126, v127) --[[ Line: 528 ]]
        -- upvalues: v8 (ref)
        if not v126 or not v127 then
            return {};
        else
            local v128 = {};
            for _, v130 in pairs(v127) do
                local v131 = v126[v130];
                if v131 and v131.isFriend then
                    table.insert(v128, {
                        userId = v131.id, 
                        displayName = v131.displayName
                    });
                end;
            end;
            local v132 = v8("displayName");
            table.sort(v128, v132);
            return v128;
        end;
    end);
    v103.onSelectionGained = function() --[[ Line: 550 ]]
        -- upvalues: v103 (copy)
        v103:setState({
            isSelected = true
        });
        if v103.props.onSelectionGained then
            v103.props.onSelectionGained(v103.props.entry, v103.props.index, v103.props.navigationUniverseId);
        end;
    end;
    v103.onSelectionLost = function() --[[ Line: 558 ]]
        -- upvalues: v103 (copy)
        v103:setState({
            isSelected = false
        });
        if v103.props.onSelectionLost then
            v103.props.onSelectionLost();
        end;
    end;
end;
local function _(v133) --[[ Line: 570 ]] --[[ Name: getTextLiteralForTextFooter ]]
    if v133 == nil then
        return nil;
    elseif v133.type ~= "TextLabel" then
        return nil;
    else
        local l_text_0 = v133.text;
        if l_text_0 == nil then
            return nil;
        else
            return l_text_0.textLiteral;
        end;
    end;
end;
v101.renderGridTilesFooter = function(v136) --[[ Line: 584 ]] --[[ Name: renderGridTilesFooter ]]
    -- upvalues: l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 (copy), v14 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy), v35 (copy), v5 (copy), v12 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), v34 (copy), v6 (copy), l_FFlagLuaAppUpdateAdMetadata_0 (copy), v4 (copy), l_GridTileFriendFooter_0 (copy), v2 (copy), l_Images_0 (copy)
    local v137 = v136.props.useHoverTile or v136.props.useExperienceTileMetadata;
    local l_friendFooterEnabled_0 = v136.props.friendFooterEnabled;
    local l_hasInGameFriends_0 = v136.props.hasInGameFriends;
    local v140 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v136.props.inGameUserIds else nil;
    local l_users_0 = v136.props.users;
    local l_inGameUsersByGame_0 = v136.props.inGameUsersByGame;
    local v143 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then nil else v136.getSortedFriends(l_users_0, l_inGameUsersByGame_0);
    local v144 = l_friendFooterEnabled_0 and if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v140 and #v140 > 0 else l_hasInGameFriends_0;
    local v145 = v136.props.friendVisits and #v136.props.friendVisits > 0;
    local _ = nil;
    local l_footerLayoutData_0 = v136.props.footerLayoutData;
    local v148;
    if l_footerLayoutData_0 == nil then
        v148 = nil;
    elseif l_footerLayoutData_0.type ~= "TextLabel" then
        v148 = nil;
    else
        local l_text_1 = l_footerLayoutData_0.text;
        v148 = if l_text_1 == nil then nil else l_text_1.textLiteral;
    end;
    l_footerLayoutData_0 = false;
    if (v136.props.isHovered or v136.state.isSelected) and v136.props.ageRatingText and not v136.props.hidePlayButton then
        v148 = v136.props.ageRatingText;
        l_footerLayoutData_0 = true;
    end;
    local v150 = v148 ~= nil;
    local l_entry_1 = v136.props.entry;
    local v152 = l_entry_1.isSponsored and (l_entry_1.isShowSponsoredLabel or v136.props.isSponsoredFooterAllowed or l_FFlagLuaAppSupportAdRatingFooter_0 and v136.props.isSponsoredRatingFooterAllowed or l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v136.props.sponsoredFooterAdLabelText ~= nil);
    if l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 and v136.props.gameTileLayoutType == v14.GameTileLayoutType.Narrow and v136.props.useExperienceTileMetadata and (v152 or v150) or l_FFlagLuaAppNarrowTileSmallerFooterFont_0 and v136.props.compactMetadataFormat then
        v137 = false;
    end;
    local v153 = if l_FFlagLuaAppSupportAdRatingFooter_0 then v35.createElement(v5, {
        stats = {
            totalUpVotes = v136.props.totalUpVotes, 
            totalDownVotes = v136.props.totalDownVotes, 
            playerCount = if not (v136.props.playerCountStyle == v12.PlayerCountStyleValues.Footer) or l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v152 then nil else v136.props.entry.playerCount
        }, 
        isGridTile = v136.props.useGridTile, 
        hideGameStats = v136.props.hideGameStats, 
        useLargerFont = v137, 
        isUnifiedGameTile = true, 
        gameTileLayoutType = v136.props.gameTileLayoutType, 
        shouldSizeToContentWidth = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v152 else nil, 
        compactMetadataFormat = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v136.props.compactMetadataFormat else nil, 
        hideRating = if l_FFlagLuaAppNarrowTileHideRating_0 then v136.props.hideRating else nil, 
        hidePlayerCount = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v136.props.hidePlayerCount else nil
    }) else nil;
    if v136.props.hideMetadata then
        if v136.props.isHovered then
            if v152 then
                return v34.createElement(v6, {
                    useLargerFont = v137, 
                    onActivateSponsoredTooltip = v136.onActivateSponsoredTooltip, 
                    isUnifiedGameTile = true, 
                    gameTileLayoutType = v136.props.gameTileLayoutType, 
                    isNarrowScreenXSmall = v136.props.isNarrowScreenXSmall, 
                    enableSponsoredFeedback = if l_FFlagLuaAppUpdateAdMetadata_0 then v136.props.enableSponsoredFeedback else nil, 
                    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v136.props.isSponsoredRatingFooterAllowed else nil, 
                    gameStatsElement = if l_FFlagLuaAppSupportAdRatingFooter_0 then v153 else nil, 
                    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v136.props.sponsoredFooterAdLabelText else nil, 
                    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v136.props.sponsoredFooterAdLabelFirst else nil, 
                    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v136.props.sponsoredFooterIncludeRatingContent else nil
                });
            elseif l_footerLayoutData_0 then
                return v34.createElement(v4, {
                    text = v148, 
                    useLargerFont = v137, 
                    isUnifiedGameTile = true
                });
            end;
        end;
        return nil;
    elseif v152 then
        return (v34.createElement(v6, {
            useLargerFont = v137, 
            onActivateSponsoredTooltip = v136.onActivateSponsoredTooltip, 
            isUnifiedGameTile = true, 
            gameTileLayoutType = v136.props.gameTileLayoutType, 
            isNarrowScreenXSmall = v136.props.isNarrowScreenXSmall, 
            enableSponsoredFeedback = if l_FFlagLuaAppUpdateAdMetadata_0 then v136.props.enableSponsoredFeedback else nil, 
            isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v136.props.isSponsoredRatingFooterAllowed else nil, 
            gameStatsElement = if l_FFlagLuaAppSupportAdRatingFooter_0 then v153 else nil, 
            sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v136.props.sponsoredFooterAdLabelText else nil, 
            sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v136.props.sponsoredFooterAdLabelFirst else nil, 
            sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v136.props.sponsoredFooterIncludeRatingContent else nil
        }));
    elseif v150 then
        return (v34.createElement(v4, {
            text = v148, 
            useLargerFont = v137, 
            isUnifiedGameTile = true
        }));
    elseif v144 then
        if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                useLargerFont = v137, 
                friendUserIds = v140, 
                onFriendFooterActivated = v136.onFriendFooterActivated
            }));
        else
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friends = v143, 
                useLargerFont = v137
            }));
        end;
    elseif v136.props.friendVisitedString then
        return (v35.createElement(v2, {
            icon = l_Images_0["icons/menu/recent"], 
            text = v136.props.friendVisitedString, 
            iconSize = v137 and 32 or 24, 
            useLargerFont = v137
        }));
    elseif v145 then
        if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friendUserIds = v136.getVisitedFriends(), 
                useLargerFont = v137
            }));
        else
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friends = v136.getVisitedFriends(), 
                useLargerFont = v137
            }));
        end;
    elseif l_FFlagLuaAppSupportAdRatingFooter_0 then
        return v153;
    else
        return (v35.createElement(v5, {
            stats = {
                totalUpVotes = v136.props.totalUpVotes, 
                totalDownVotes = v136.props.totalDownVotes, 
                playerCount = if v136.props.playerCountStyle == v12.PlayerCountStyleValues.Footer then v136.props.entry.playerCount else nil
            }, 
            isGridTile = v136.props.useGridTile, 
            hideGameStats = v136.props.hideGameStats, 
            useLargerFont = v137, 
            isUnifiedGameTile = true, 
            gameTileLayoutType = v136.props.gameTileLayoutType, 
            compactMetadataFormat = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v136.props.compactMetadataFormat else nil, 
            hideRating = if l_FFlagLuaAppNarrowTileHideRating_0 then v136.props.hideRating else nil, 
            hidePlayerCount = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v136.props.hidePlayerCount else nil
        }));
    end;
end;
v101.renderContent = function(v154, v155, v156, _) --[[ Line: 795 ]] --[[ Name: renderContent ]]
    -- upvalues: v12 (copy), v18 (copy), v34 (copy), v5 (copy), v29 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), v22 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), v35 (copy), v7 (copy), v98 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), v10 (copy), l_FFlagLuaAppMigrateGameTileHoverFixes_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v11 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy)
    local v158 = v154.props.Size or UDim2.fromScale(1, 1);
    local l_imageThumbnail_0 = v154.props.imageThumbnail;
    local l_onGameTileActivated_0 = v154.props.onGameTileActivated;
    local v161 = true;
    if v154.props.playerCountStyle ~= v12.PlayerCountStyleValues.Always then
        v161 = v154.props.isHovered and v154.props.playerCountStyle == v12.PlayerCountStyleValues.Hover;
    end;
    local v162 = v18.getImageAspectRatio(v154.props.gameTileLayoutType);
    local v163 = v154:renderGridTilesFooter();
    local v164 = if v154.props.hideTitle then nil else v154.props.name;
    local v165 = if v161 then v34.createElement(v5, {
        stats = {
            playerCount = v154.props.entry.playerCount, 
            displayConcurrentUsersPill = true
        }
    }) else nil;
    local l_playButtonHeight_0 = v18.getElementSizes(v156.Tokens, v154.props.textSizeOffset, v154.props.contentTextLineCount, v154.props.foundationTokens, true).playButtonHeight;
    local v167 = if v154.props.isHidden then v34.createElement(v29, {
        appPage = v154.props.appPage, 
        collectionId = v154.props.topicId, 
        setGameHidden = v154.props.setGameHidden, 
        universeId = v154.props.universeId, 
        parentRef = v154.props.hoverRef, 
        isSponsored = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v154.props.entry.isSponsored else nil
    }) else if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and v154.props.videoThumbnail then v34.createElement(v22, {
        video = v154.props.videoThumbnail, 
        image = l_imageThumbnail_0, 
        playing = v154.props.isVideoPlaying, 
        looped = true, 
        Size = UDim2.fromScale(1, 1), 
        isTileContained = v154.props.isContained, 
        cornerRadius = v156.Tokens.Global.Space_100, 
        ZIndex = -2, 
        onActivated = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 844 ]]
            -- upvalues: l_onGameTileActivated_0 (copy), v154 (copy)
            l_onGameTileActivated_0(v154.isMounted);
        end or v154.onActivated else nil, 
        itemIndex = v154.props.index, 
        videoAnalytics = v154.props.videoAnalytics
    }) else nil;
    local v168 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and not v154.props.isVideoPlaying then
        v168 = if v154.props.tileBadges then v35.createFragment({
            SocialFeaturePill = v165, 
            Badge = v34.createElement(v7, {
                tileBadgesByPosition = v154.props.tileBadges
            })
        }) else v165;
    end;
    local l_isHidden_0 = v154.props.isHidden;
    local v170 = if not (next(v154.props.availableMenuItems) ~= nil and (v154.props.isHovered or v154.props.overflowMenuOpen or v154.state.isSelected)) or l_isHidden_0 then nil else v34.createElement(v98, {
        isHovered = v154.props.isHovered, 
        isSelected = v154.state.isSelected, 
        universeId = v154.props.universeId, 
        collectionId = v154.props.topicId, 
        appPage = v154.props.appPage, 
        setGameHidden = v154.props.setGameHidden, 
        menuKey = v154.props.hoverKey, 
        menuOpen = v154.props.overflowMenuOpen, 
        onMenuOpenChanged = if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v154.onMenuOpenChanged else nil, 
        parentRef = v154.props.hoverRef, 
        isSponsored = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v154.props.entry.isSponsored else nil, 
        payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v154.props.entry.payerName else nil, 
        sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v154.props.sponsoredUserCohort else nil, 
        adId = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v154.props.entry.adId else nil, 
        availableMenuItems = v154.props.availableMenuItems
    });
    return v34.createElement("Frame", {
        Size = v158, 
        ZIndex = v154.props.ZIndex, 
        BackgroundTransparency = 1, 
        LayoutOrder = v154.props.layoutOrder, 
        ref = v154.gameTileRef
    }, {
        Tile = v34.createElement(v10, {
            SelectionOrder = v154.props.SelectionOrder, 
            Selectable = not l_isHidden_0, 
            hoverPadding = if not not l_FFlagLuaAppMigrateGameTileHoverFixes_0 or v154.props.useGridTile then nil else v156.Tokens.Global.Space_100, 
            numLinesForTitle = v154.props.contentTextLineCount, 
            numLinesForMetadata = v154.props.metadataTextLineCount, 
            imageAspectRatio = v162, 
            isContained = v154.props.isContained, 
            containmentSidePadding = v18.getContainmentSidePadding(v156.Tokens, v154.props.gameTileLayoutType, v154.props.foundationTokens), 
            Size = UDim2.fromScale(1, 1), 
            image = l_imageThumbnail_0, 
            onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v154.props.onTileImageLoaded else nil, 
            thumbnailComponent = v167, 
            title = if l_isHidden_0 then nil else v164, 
            isDisabled = l_isHidden_0 and true or v154.props.isDisabled, 
            onActivated = if not l_FFlagLuaAppGameDetailsAttributionFix_0 or l_isHidden_0 then v154.onActivated else function() --[[ Line: 927 ]]
                -- upvalues: l_onGameTileActivated_0 (copy), v154 (copy)
                l_onGameTileActivated_0(v154.isMounted);
            end, 
            onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v154.props.onGuiStateChanged else nil, 
            onSelectionGained = v154.onSelectionGained, 
            onSelectionLost = v154.onSelectionLost, 
            onTouchLongPress = if not l_isHidden_0 then v154.onTouchLongPress else nil, 
            reducedMotion = v155, 
            isHovered = not l_isHidden_0 and v154.props.isHovered, 
            forwardRef = v154.props.hoverRef, 
            hidePlayButton = l_isHidden_0 and true or v154.props.hidePlayButton, 
            hoverActionRow = if not not v154.props.hidePlayButton or l_isHidden_0 then nil else v34.createElement(v11, {
                universeId = v154.props.navigationUniverseId, 
                referralSource = v154.props.referralSource, 
                launchSource = "ExperienceTile", 
                reportExperienceLaunched = v154.reportExperienceLaunchedFromActionBar, 
                openGameDetails = l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 946 ]]
                    -- upvalues: l_onGameTileActivated_0 (copy), v154 (copy)
                    l_onGameTileActivated_0(v154.isMounted);
                end or v154.onActivated, 
                entry = v154.props.entry, 
                launchExperienceEventContext = v154.props.launchExperienceEventContext, 
                fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000, 
                index = v154.props.index, 
                horizontalPadding = 0, 
                verticalPadding = 0, 
                height = l_playButtonHeight_0, 
                showButtonText = v162 > 1, 
                isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v154.props.entry.placeIdOverride else nil, 
                launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v154.props.entry.launchDataOverride else nil
            }), 
            thumbnailOverlay = if l_isHidden_0 then nil else if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v168 else if v154.props.tileBadges then v35.createFragment({
                SocialFeaturePill = v165, 
                Badge = v34.createElement(v7, {
                    tileBadgesByPosition = v154.props.tileBadges
                })
            }) else v165, 
            overflowMenu = v170, 
            footerMetadata = if l_isHidden_0 then nil else v163, 
            isUnifiedGameTile = true, 
            textSizeOffset = v154.props.textSizeOffset, 
            hideMetadata = v154.props.hideMetadata
        })
    });
end;
v101.render = function(v171) --[[ Line: 988 ]] --[[ Name: render ]]
    -- upvalues: l_DiscoveryAppLaunchTracker_0 (copy), l_withStyle_0 (copy)
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileRender();
    end;
    if v171.props.game == nil then
        return nil;
    else
        return l_withStyle_0(function(v172) --[[ Line: 998 ]]
            -- upvalues: v171 (copy)
            local l_ReducedMotion_0 = v172.Settings.ReducedMotion;
            return v171:renderContent(l_ReducedMotion_0, v172, v171.props.foundationTokens);
        end);
    end;
end;
v101.didMount = function(v174) --[[ Line: 1004 ]] --[[ Name: didMount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v174.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v174.gameTileRef, v174.props.impressionsTag, v174.props.index);
    if not v174.props.useGridTile and v174.props.friendFooterEnabled and v174.props.hasInGameFriends then
        v174:setState({
            canDisplayFriendFooter = true
        });
    end;
    if v174.props.useGridTile then
        v174.loadWideThumbnail();
    end;
end;
v101.willUnmount = function(v175) --[[ Line: 1019 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v175.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v175.gameTileRef, v175.props.impressionsTag, v175.props.index);
end;
v101.didUpdate = function(v176, v177) --[[ Line: 1024 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    if v177.impressionsTag ~= v176.props.impressionsTag or v177.index ~= v176.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v176.gameTileRef, v177.impressionsTag, v177.index);
        l_ImpressionsTagUtility_0.AddTag(v176.gameTileRef, v176.props.impressionsTag, v176.props.index);
    end;
    if v176.props.useGridTile and v177.universeId ~= v176.props.universeId then
        v176.loadWideThumbnail();
    end;
    if not v176.props.useGridTile and (v177.friendFooterEnabled ~= v176.props.friendFooterEnabled or v177.hasInGameFriends ~= v176.props.hasInGameFriends) and v176.props.friendFooterEnabled and v176.props.hasInGameFriends then
        v176:setState({
            canDisplayFriendFooter = true
        });
    end;
end;
local function _(v178, v179) --[[ Line: 1049 ]] --[[ Name: formatRating ]]
    if v178 + v179 == 0 then
        return "--";
    else
        return tostring((math.floor(v178 / (v178 + v179) * 100 + 0.5))) .. "%";
    end;
end;
v101 = v36.connect(function(v181, v182) --[[ Line: 1057 ]]
    -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_GameInfosReducer_0 (copy), v12 (copy), v17 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), v30 (copy), v28 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_GameIconReducer_0 (copy), v26 (copy), v73 (copy), v27 (copy)
    local l_universeId_0 = v182.entry.universeId;
    local v184 = nil;
    if not l_FFlagLuaAppGameDetailsAttributionFix_0 then
        v184 = if v182.entry.navigationUniverseId and v182.entry.navigationUniverseId ~= "" and v182.entry.navigationUniverseId ~= "0" then v182.entry.navigationUniverseId else v182.entry.universeId;
    end;
    local v185 = v181.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    local v186 = v185 and v185.totalUpVotes or 0;
    local v187 = v185 and v185.totalDownVotes or 0;
    local v188 = v185 and v185.friendActivityTitle or nil;
    local v189 = nil;
    local v190 = nil;
    local v191 = v185 and v185.minimumAge or 0;
    local v192 = v185 and v185.ageRecommendationDisplayName or "";
    local v193 = nil;
    v193 = if v182.gameTileLayoutType == "Event" then v182.playButtonStyle ~= v12.PlayButtonStyleValues.Enabled else v182.gameTileLayoutType == "Wide" and v182.playButtonStyle == v12.PlayButtonStyleValues.Disabled;
    if v193 or v182.forceHideAgeRatings then
        v189 = false;
    elseif v191 ~= 0 and v192 ~= "" then
        v189 = true;
        v190 = v192;
    else
        v189 = false;
    end;
    local v194 = v17(v185, v182.topicId);
    local v195 = (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v182.entry.primaryWideImageAssetId then v182.entry.primaryWideImageAssetId else v30.getWideImageAssetId(v194)) or v185 and v185.primaryWideAssetId or nil;
    local v196 = v28(v195, v182.entry.placeId);
    local v197 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        local v198 = if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v182.entry.primaryWideVideoAssetId then v182.entry.primaryWideVideoAssetId else v194 and v194.primaryMediaAsset and v194.primaryMediaAsset.wideVideoAssetId;
        v197 = if v198 then ("rbxassetid://%*"):format(v198) else nil;
    end;
    local v199 = v181[l_GameIconReducer_0.key][l_universeId_0] and v181[l_GameIconReducer_0.key][l_universeId_0].url or nil;
    local v200 = if v182.useGridTile then v196 else v26(v199, l_universeId_0);
    local v201 = if not not v182.useHoverTile or v182.useExperienceTileMetadata then if v73 then v27(v186, v187, nil, true) else v186 + v187 == 0 and "--" or tostring((math.floor(v186 / (v186 + v187) * 100 + 0.5))) .. "%" else nil;
    local v202 = v185 and v185.friendVisits or {};
    local v203 = if v185 and v185.friendVisitedString ~= "" then v185.friendVisitedString else nil;
    local v204 = v194 and v194.footer or nil;
    local v205 = v194 and v194.title or v185 and v185.name or "";
    return {
        game = v185, 
        universeId = l_universeId_0, 
        navigationUniverseId = if not l_FFlagLuaAppGameDetailsAttributionFix_0 then v184 else nil, 
        name = v205, 
        totalUpVotes = v186, 
        totalDownVotes = v187, 
        imageThumbnail = v200, 
        wideThumbnail = v196, 
        videoThumbnail = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v197 else nil, 
        friendActivityTitle = v188, 
        rating = v201, 
        showAgeRating = v189, 
        ageRatingText = v190, 
        friendVisits = v202, 
        friendVisitedString = v203, 
        hidePlayButton = v193, 
        footerLayoutData = v204
    };
end, function(v206) --[[ Line: 1165 ]]
    -- upvalues: v9 (copy), v13 (copy)
    return {
        openContextualMenu = function(v207, v208, v209) --[[ Line: 1167 ]] --[[ Name: openContextualMenu ]]
            -- upvalues: v206 (copy), v9 (ref)
            v206(v9(v207, v208, v209));
        end, 
        openSponsoredTooltip = function(v210) --[[ Line: 1170 ]] --[[ Name: openSponsoredTooltip ]]
            -- upvalues: v206 (copy), v13 (ref)
            return v206(v13(v210));
        end
    };
end)(v101);
if not l_FFlagLuaAppGameDetailsAttributionFix_0 then
    v101 = l_RoactServices_0.connect({
        networking = l_RoactNetworking_0
    })(v101);
end;
return function(v211) --[[ Line: 1182 ]]
    -- upvalues: v34 (copy), l_useTokens_0 (copy), v15 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v21 (copy), l_useSelector_0 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), v19 (copy), v20 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_sponsoredGamesRecordClick_0 (copy), v16 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_VideoPlaybackCoordinator_0 (copy), v23 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_useOverflowMenuOpen_0 (copy), l_useTriggerFeedback_0 (copy), v99 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), v101 (ref), v37 (copy), v25 (copy), v94 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_usePreferredInput_0 (copy), v24 (copy), v61 (copy), l_FIntLuaAppGameTileVideoDwellTimeInSec_0 (copy), l_FIntLuaAppGameTileVideoVisiblePercent_0 (copy), l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 (copy)
    local v212 = v34.useRef(nil);
    local v213 = l_useTokens_0();
    local l_useHoverTile_0 = v211.useHoverTile;
    local v215 = ("%*_%*_%*"):format(v211.impressionsTag or "", v211.index or "0", v211.gameTileLayoutType or "Narrow");
    if v211.impressionsTag == nil or v211.index == nil then
        l_useHoverTile_0 = false;
    end;
    local v216 = v15(v212, v215, l_useHoverTile_0);
    local v217 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v218 = v217 and true or v211.useHoverTile;
    local v219 = nil;
    v219 = if v211.useExperienceTileMetadata ~= nil then v211.useExperienceTileMetadata else v217;
    local v220 = v21(v211.entry.universeId, v211.topicId, v211.badgeOverride);
    local v222 = l_useSelector_0(function(v221) --[[ Line: 1205 ]]
        return v221.LocalUserId;
    end);
    local v223 = nil;
    if not l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
        v223 = l_useSelector_0(function(v224) --[[ Line: 1211 ]]
            return v224.Users;
        end);
    end;
    local v226 = l_useSelector_0(function(v225) --[[ Line: 1216 ]]
        -- upvalues: v211 (copy)
        return v225.InGameUsersByGame[v211.entry.universeId];
    end);
    local v227 = v19(v222, v223, v226);
    local v228 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v20(v222, v226) else nil;
    local v229, v230 = v34.useState(false);
    local v231 = nil;
    local v232 = nil;
    local v233 = nil;
    local v234 = nil;
    if l_FFlagLuaAppGameDetailsAttributionFix_0 then
        v231 = l_useRoactService_0(l_RoactNetworking_0);
        v232 = if v211.entry.navigationUniverseId and v211.entry.navigationUniverseId ~= "" and v211.entry.navigationUniverseId ~= "0" then v211.entry.navigationUniverseId else v211.entry.universeId;
        v234 = v34.useCallback(function() --[[ Line: 1241 ]]
            -- upvalues: v211 (copy), l_sponsoredGamesRecordClick_0 (ref), v231 (ref)
            local l_entry_2 = v211.entry;
            if l_entry_2.isSponsored then
                l_sponsoredGamesRecordClick_0(v231, l_entry_2.adId);
            end;
        end, {
            v231, 
            v211.entry.isSponsored, 
            v211.entry.adId
        });
        v233 = v34.useCallback(function(v236) --[[ Line: 1250 ]]
            -- upvalues: v211 (copy), v16 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v23 (ref), v232 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), l_IntervalPerformanceTracker_0 (ref), v234 (ref)
            if v211.isHovered then
                v16.default:reset();
            end;
            if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
                l_VideoPlaybackCoordinator_0.default:reset(v23.TileClicked, nil, v232, nil);
            end;
            if v236 then
                if l_FFlagLuaAppGameTileInteractionFeedback_0 and v211.onActivated then
                    v211.onActivated();
                end;
                local v237 = {
                    source = v211.source, 
                    index = v211.index, 
                    referralSource = v211.referralSource, 
                    onPeekViewClosed = v211.onPeekViewClosed, 
                    placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v211.entry.placeIdOverride else nil, 
                    experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                        launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v211.entry.launchDataOverride) then v211.entry.launchDataOverride else nil, 
                        tileType = v211.entry.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile, 
                        nativeAdData = v211.entry.adId
                    } else if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v211.entry.launchDataOverride) then {
                        launchData = v211.entry.launchDataOverride
                    } else nil
                };
                if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                    l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
                end;
                v211.navigateToGameDetails(v232, v237);
                v211.reportGameDetailOpened(v211.index, v232);
                v234();
            end;
        end, {
            v211.isHovered, 
            v211.index, 
            v211.videoAnalytics, 
            v211.onActivated, 
            v211.source, 
            v211.referralSource, 
            v211.onPeekViewClosed, 
            v211.navigateToGameDetails, 
            v211.reportGameDetailOpened, 
            v232, 
            v234, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v211.entry.placeIdOverride else nil, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v211.entry.launchDataOverride else nil
        });
    end;
    local v238 = l_useOverflowMenuOpen_0(v215);
    local v239 = l_useTriggerFeedback_0();
    local v240 = v34.useMemo(function() --[[ Line: 1323 ]]
        -- upvalues: v99 (ref), v211 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref)
        return v99({
            isSponsored = v211.entry.isSponsored, 
            enableExplicitFeedback = v211.enableExplicitFeedback, 
            enableSponsoredFeedback = v211.enableSponsoredFeedback, 
            enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v211.enableReportAd else nil
        });
    end, {
        v211.entry.isSponsored, 
        v211.enableExplicitFeedback, 
        v211.enableSponsoredFeedback, 
        if l_FFlagLuaAppEnableSponsoredReportAd_0 then v211.enableReportAd else nil
    });
    local v241 = v34.createElement(v101, v37.Dictionary.join(v211, {
        useExperienceTileMetadata = v219, 
        hasBackground = v218, 
        hoverRef = v212, 
        isHoverSupported = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then l_useHoverTile_0 else nil, 
        isHovered = v216, 
        isVideoPlaying = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v229 else nil, 
        tileBadges = v220, 
        foundationTokens = v213, 
        users = v223, 
        inGameUsersByGame = v226, 
        hasInGameFriends = v227, 
        inGameUserIds = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v228 else nil, 
        networking = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v231 else nil, 
        navigationUniverseId = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v232 else nil, 
        onGameTileActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v233 else nil, 
        recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v234 else nil, 
        overflowMenuOpen = v238, 
        hoverKey = v215, 
        triggerFeedback = v239, 
        availableMenuItems = v240
    }));
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        local v242 = v25(v211.entry.universeId, v211.topicId);
        local v243 = nil;
        if v94 then
            local v244 = true;
            if v211.entry.primaryWideVideoAssetId == nil then
                v244 = v242;
            end;
            v243 = v244;
        elseif l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 then
            local v245 = true;
            if v211.entry.primaryWideVideoAssetId == nil then
                v245 = v242;
            end;
            v242 = v245;
        end;
        local v246 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then l_usePreferredInput_0() else nil;
        if not v94 and v242 or v94 and v243 then
            return v34.createElement(v34.Fragment, {}, {
                GameTile = v241, 
                VideoPlaybackDetector = v34.createElement(v24, {
                    videoKey = v215, 
                    itemIndex = v211.index, 
                    universeId = v211.entry.universeId, 
                    tileRef = v212, 
                    isHoverSupported = l_useHoverTile_0, 
                    isHovered = v216, 
                    autoplay = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v246 == v61.Input.Touch else nil, 
                    onPlaybackChange = v230, 
                    videoAnalytics = v211.videoAnalytics, 
                    videoDwellTimeInSec = l_FIntLuaAppGameTileVideoDwellTimeInSec_0, 
                    videoVisiblePercent = l_FIntLuaAppGameTileVideoVisiblePercent_0, 
                    pageContext = if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then v211.appPage else nil
                })
            });
        end;
    end;
    return v241;
end;