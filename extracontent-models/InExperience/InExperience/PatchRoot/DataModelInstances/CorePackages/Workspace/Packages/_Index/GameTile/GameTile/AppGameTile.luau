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
local l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRemoveSponsoredReportHiddenState;
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
local l_VideoPlaybackCoordinator_0 = require(l_Parent_0.VideoUtils).VideoPlaybackCoordinator;
local v94 = require(l_script_FirstAncestor_0.GameTileOverflowMenu);
local v95 = require(l_script_FirstAncestor_0.getAvailableGameTileOverflowMenuItems);
local v96 = game:DefineFastInt("LuaAppGameTileVideoDwellTimeInSec", 3);
local v97 = game:DefineFastInt("LuaAppGameTileVideoVisiblePercent", 80);
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130);
local function _() --[[ Line: 130 ]] --[[ Name: getHoverDelay ]]
    return game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000;
end;
local v99 = v35.PureComponent:extend("AppGameTile");
v99.validateProps = v40.strictInterface({
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
    hiddenTileType = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else v40.optional(v40.string), 
    enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v40.optional(v40.boolean) else nil, 
    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v40.optional(v40.string) else nil, 
    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v40.optional(v40.boolean) else nil, 
    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v40.optional(v40.boolean) else nil, 
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
v99.defaultProps = {
    useHoverTile = false, 
    hasBackground = false, 
    useExperienceTileMetadata = false, 
    useGridTile = false, 
    thumbnailAspectRatioOverride = l_AspectRatioModeEnum_0.Square, 
    gameTileLayoutType = l_Narrow_0, 
    contentTextLineCount = v12.TileTextLines[l_Narrow_0].titleTextLines, 
    hideGameStats = false
};
v99.init = function(v101) --[[ Line: 258 ]] --[[ Name: init ]]
    -- upvalues: l_DiscoveryAppLaunchTracker_0 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), v16 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_VideoPlaybackCoordinator_0 (copy), v23 (copy), v35 (copy), v11 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_sponsoredGamesRecordClick_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), l_IntervalPerformanceTracker_0 (copy), v61 (copy), l_ContentProvider_0 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), l_memoize_0 (copy), v8 (copy)
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileInit();
    end;
    v101.state = {
        isHovered = false, 
        canDisplayFriendFooter = false, 
        isSelected = false
    };
    v101.onMenuOpenChanged = l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 and function(v102, v103) --[[ Line: 270 ]]
        -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v101 (copy), l_gameTileOverflowMenuAction_0 (ref), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (ref)
        local v104 = {
            ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v101.props.appPage, 
            universeId = v101.props.universeId, 
            sortId = v101.props.topicId, 
            actionType = v102 and "GameTileOverflowMenuClosed" or "GameTileOverflowMenuOpened", 
            availableMenuItems = v103
        };
        l_gameTileOverflowMenuAction_0(v104, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v101.props.appPage or l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 and "Unknown" or nil else nil);
    end or nil;
    v101.onTouchLongPress = function() --[[ Line: 290 ]]
        -- upvalues: v101 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (ref), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (ref), l_getOverflowMenuSignalStore_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref)
        if next(v101.props.availableMenuItems) ~= nil then
            if v101.props.triggerFeedback and not v101.props.overflowMenuOpen then
                local v105 = if l_FFlagLuaAppHapticTriggeredTelemetry_0 then {
                    universeId = v101.props.universeId, 
                    sortId = v101.props.topicId
                } else nil;
                v101.props.triggerFeedback("TileLongPress", "Press", if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v101.props.appPage or l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 and "Unknown" or nil else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v105 else nil);
            end;
            l_getOverflowMenuSignalStore_0().openMenu(v101.props.hoverKey);
            if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                local v106 = {};
                for v107, _ in v101.props.availableMenuItems do
                    table.insert(v106, v107);
                end;
                v101.onMenuOpenChanged(false, table.concat(v106, ","));
            end;
        end;
    end;
    v101.reportExperienceLaunchedFromActionBar = function(...) --[[ Line: 324 ]]
        -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), v101 (copy), v16 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v23 (ref)
        if l_FFlagLuaAppGameDetailsAttributionFix_0 then
            v101.props.recordSponsoredGameClick();
        else
            v101.recordSponsoredGameClick();
        end;
        if v101.props.isHovered then
            v16.default:reset();
        end;
        if v101.props.reportExperienceLaunched then
            v101.props.reportExperienceLaunched(...);
        end;
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
            l_VideoPlaybackCoordinator_0.default:reset(v23.ExperienceLaunched, nil, v101.props.navigationUniverseId, nil);
        end;
    end;
    v101.renderAppExperienceActionRow = function(_) --[[ Line: 350 ]]
        -- upvalues: v35 (ref), v11 (ref), v101 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), l_FFlagLuaAppUnifyPlayButtonTile_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref)
        return v35.createElement(v11, {
            universeId = v101.props.navigationUniverseId, 
            referralSource = v101.props.referralSource, 
            launchSource = "ExperienceTile", 
            reportExperienceLaunched = v101.reportExperienceLaunchedFromActionBar, 
            openGameDetails = l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 357 ]]
                -- upvalues: v101 (ref)
                v101.props.onGameTileActivated(v101.isMounted);
            end or v101.onActivated, 
            entry = v101.props.entry, 
            launchExperienceEventContext = v101.props.launchExperienceEventContext, 
            horizontalPadding = v101.props.useGridTile and 0 or nil, 
            index = v101.props.index, 
            isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil, 
            placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v101.props.entry.placeIdOverride else nil, 
            launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v101.props.entry.launchDataOverride else nil
        });
    end;
    v101.onHoverChanged = function(v110) --[[ Line: 373 ]]
        -- upvalues: v101 (copy)
        if v110 and v101.props.triggerFeedback then
            v101.props.triggerFeedback("Default", "Hover");
        end;
        v101:setState({
            isHovered = v110
        });
    end;
    v101.gameTileRef = v35.createRef();
    v101.getTilePosition = function() --[[ Line: 385 ]]
        -- upvalues: v101 (copy)
        if v101.gameTileRef.current then
            return v101.gameTileRef.current.AbsolutePosition;
        else
            return nil;
        end;
    end;
    v101.getTileSize = function() --[[ Line: 393 ]]
        -- upvalues: v101 (copy)
        if v101.gameTileRef.current then
            return v101.gameTileRef.current.AbsoluteSize;
        else
            return nil;
        end;
    end;
    v101.recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then nil else function() --[[ Line: 403 ]]
        -- upvalues: v101 (copy), l_sponsoredGamesRecordClick_0 (ref)
        local l_networking_0 = v101.props.networking;
        local l_entry_0 = v101.props.entry;
        if l_entry_0.isSponsored then
            l_sponsoredGamesRecordClick_0(l_networking_0, l_entry_0.adId);
        end;
    end;
    v101.onActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then nil else function() --[[ Line: 414 ]]
        -- upvalues: v101 (copy), v16 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v23 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), l_IntervalPerformanceTracker_0 (ref)
        if v101.props.isHovered then
            v16.default:reset();
        end;
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
            l_VideoPlaybackCoordinator_0.default:reset(v23.TileClicked, nil, v101.props.navigationUniverseId, nil);
        end;
        if v101.isMounted then
            if l_FFlagLuaAppGameTileInteractionFeedback_0 and v101.props.onActivated then
                v101.props.onActivated();
            end;
            local l_navigationUniverseId_0 = v101.props.navigationUniverseId;
            local v114 = {
                source = v101.props.source, 
                index = v101.props.index, 
                referralSource = v101.props.referralSource, 
                onPeekViewClosed = v101.props.onPeekViewClosed, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v101.props.entry.placeIdOverride else nil, 
                experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v101.props.entry.launchDataOverride) then v101.props.entry.launchDataOverride else nil, 
                    tileType = v101.props.entry.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile, 
                    nativeAdData = v101.props.entry.adId
                } else if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v101.props.entry.launchDataOverride) then {
                    launchData = v101.props.entry.launchDataOverride
                } else nil
            };
            if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
            end;
            v101.props.navigateToGameDetails(l_navigationUniverseId_0, v114);
            local l_index_0 = v101.props.index;
            v101.props.reportGameDetailOpened(l_index_0, l_navigationUniverseId_0);
            v101.recordSponsoredGameClick();
        end;
    end;
    v101.onFriendFooterActivated = function() --[[ Line: 474 ]]
        -- upvalues: v101 (copy)
        if v101.isMounted then
            local l_game_0 = v101.props.game;
            local v117 = v101.getTileSize();
            v101.props.openContextualMenu(l_game_0, v117, v101.getTilePosition());
        end;
    end;
    v101.onActivateSponsoredTooltip = function() --[[ Line: 482 ]]
        -- upvalues: v101 (copy), v61 (ref)
        if v101.isMounted then
            v101.props.openSponsoredTooltip(v61.GetInputModeStore(false).getLastInputType(false));
        end;
    end;
    v101.loadWideThumbnail = function() --[[ Line: 490 ]]
        -- upvalues: v101 (copy), l_ContentProvider_0 (ref)
        local l_wideThumbnail_0 = v101.props.wideThumbnail;
        if l_wideThumbnail_0 ~= nil then
            task.spawn(function() --[[ Line: 493 ]]
                -- upvalues: l_ContentProvider_0 (ref), l_wideThumbnail_0 (copy)
                l_ContentProvider_0:PreloadAsync({
                    l_wideThumbnail_0
                });
            end);
        end;
    end;
    v101.getVisitedFriends = function() --[[ Line: 499 ]]
        -- upvalues: v101 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (ref)
        local v119 = {};
        local l_friendVisits_0 = v101.props.friendVisits;
        for v121 = 1, #l_friendVisits_0 do
            local v122 = tostring(l_friendVisits_0[v121].userId);
            if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
                table.insert(v119, v122);
            elseif v101.props.users and v101.props.users[v122] then
                local v123 = v101.props.users[v122];
                table.insert(v119, {
                    userId = v122, 
                    displayName = v123.displayName
                });
            end;
        end;
        return v119;
    end;
    v101.getSortedFriends = l_memoize_0(function(v124, v125) --[[ Line: 527 ]]
        -- upvalues: v8 (ref)
        if not v124 or not v125 then
            return {};
        else
            local v126 = {};
            for _, v128 in pairs(v125) do
                local v129 = v124[v128];
                if v129 and v129.isFriend then
                    table.insert(v126, {
                        userId = v129.id, 
                        displayName = v129.displayName
                    });
                end;
            end;
            local v130 = v8("displayName");
            table.sort(v126, v130);
            return v126;
        end;
    end);
    v101.onSelectionGained = function() --[[ Line: 549 ]]
        -- upvalues: v101 (copy)
        v101:setState({
            isSelected = true
        });
        if v101.props.onSelectionGained then
            v101.props.onSelectionGained(v101.props.entry, v101.props.index, v101.props.navigationUniverseId);
        end;
    end;
    v101.onSelectionLost = function() --[[ Line: 557 ]]
        -- upvalues: v101 (copy)
        v101:setState({
            isSelected = false
        });
        if v101.props.onSelectionLost then
            v101.props.onSelectionLost();
        end;
    end;
end;
local function _(v131) --[[ Line: 569 ]] --[[ Name: getTextLiteralForTextFooter ]]
    if v131 == nil then
        return nil;
    elseif v131.type ~= "TextLabel" then
        return nil;
    else
        local l_text_0 = v131.text;
        if l_text_0 == nil then
            return nil;
        else
            return l_text_0.textLiteral;
        end;
    end;
end;
v99.renderGridTilesFooter = function(v134) --[[ Line: 583 ]] --[[ Name: renderGridTilesFooter ]]
    -- upvalues: l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 (copy), v14 (copy), v35 (copy), v5 (copy), v12 (copy), v34 (copy), v6 (copy), l_FFlagLuaAppUpdateAdMetadata_0 (copy), v4 (copy), l_GridTileFriendFooter_0 (copy), v2 (copy), l_Images_0 (copy)
    local v135 = v134.props.useHoverTile or v134.props.useExperienceTileMetadata;
    local l_friendFooterEnabled_0 = v134.props.friendFooterEnabled;
    local l_hasInGameFriends_0 = v134.props.hasInGameFriends;
    local v138 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v134.props.inGameUserIds else nil;
    local l_users_0 = v134.props.users;
    local l_inGameUsersByGame_0 = v134.props.inGameUsersByGame;
    local v141 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then nil else v134.getSortedFriends(l_users_0, l_inGameUsersByGame_0);
    local v142 = l_friendFooterEnabled_0 and if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v138 and #v138 > 0 else l_hasInGameFriends_0;
    local v143 = v134.props.friendVisits and #v134.props.friendVisits > 0;
    local _ = nil;
    local l_footerLayoutData_0 = v134.props.footerLayoutData;
    local v146;
    if l_footerLayoutData_0 == nil then
        v146 = nil;
    elseif l_footerLayoutData_0.type ~= "TextLabel" then
        v146 = nil;
    else
        local l_text_1 = l_footerLayoutData_0.text;
        v146 = if l_text_1 == nil then nil else l_text_1.textLiteral;
    end;
    l_footerLayoutData_0 = false;
    if (v134.props.isHovered or v134.state.isSelected) and v134.props.ageRatingText and not v134.props.hidePlayButton then
        v146 = v134.props.ageRatingText;
        l_footerLayoutData_0 = true;
    end;
    local v148 = v146 ~= nil;
    local l_entry_1 = v134.props.entry;
    local v150 = l_entry_1.isSponsored and (l_entry_1.isShowSponsoredLabel or v134.props.isSponsoredFooterAllowed or l_FFlagLuaAppSupportAdRatingFooter_0 and v134.props.isSponsoredRatingFooterAllowed or l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v134.props.sponsoredFooterAdLabelText ~= nil);
    if l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 and v134.props.gameTileLayoutType == v14.GameTileLayoutType.Narrow and v134.props.useExperienceTileMetadata and (v150 or v148) then
        v135 = false;
    end;
    local v151 = if l_FFlagLuaAppSupportAdRatingFooter_0 then v35.createElement(v5, {
        stats = {
            totalUpVotes = v134.props.totalUpVotes, 
            totalDownVotes = v134.props.totalDownVotes, 
            playerCount = if not (v134.props.playerCountStyle == v12.PlayerCountStyleValues.Footer) or l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v150 then nil else v134.props.entry.playerCount
        }, 
        isGridTile = v134.props.useGridTile, 
        hideGameStats = v134.props.hideGameStats, 
        useLargerFont = v135, 
        isUnifiedGameTile = true, 
        gameTileLayoutType = v134.props.gameTileLayoutType, 
        shouldSizeToContentWidth = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v150 else nil
    }) else nil;
    if v134.props.hideMetadata then
        if v134.props.isHovered then
            if v150 then
                return v34.createElement(v6, {
                    useLargerFont = v135, 
                    onActivateSponsoredTooltip = v134.onActivateSponsoredTooltip, 
                    isUnifiedGameTile = true, 
                    gameTileLayoutType = v134.props.gameTileLayoutType, 
                    isNarrowScreenXSmall = v134.props.isNarrowScreenXSmall, 
                    enableSponsoredFeedback = if l_FFlagLuaAppUpdateAdMetadata_0 then v134.props.enableSponsoredFeedback else nil, 
                    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v134.props.isSponsoredRatingFooterAllowed else nil, 
                    gameStatsElement = if l_FFlagLuaAppSupportAdRatingFooter_0 then v151 else nil, 
                    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v134.props.sponsoredFooterAdLabelText else nil, 
                    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v134.props.sponsoredFooterAdLabelFirst else nil, 
                    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v134.props.sponsoredFooterIncludeRatingContent else nil
                });
            elseif l_footerLayoutData_0 then
                return v34.createElement(v4, {
                    text = v146, 
                    useLargerFont = v135, 
                    isUnifiedGameTile = true
                });
            end;
        end;
        return nil;
    elseif v150 then
        return (v34.createElement(v6, {
            useLargerFont = v135, 
            onActivateSponsoredTooltip = v134.onActivateSponsoredTooltip, 
            isUnifiedGameTile = true, 
            gameTileLayoutType = v134.props.gameTileLayoutType, 
            isNarrowScreenXSmall = v134.props.isNarrowScreenXSmall, 
            enableSponsoredFeedback = if l_FFlagLuaAppUpdateAdMetadata_0 then v134.props.enableSponsoredFeedback else nil, 
            isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v134.props.isSponsoredRatingFooterAllowed else nil, 
            gameStatsElement = if l_FFlagLuaAppSupportAdRatingFooter_0 then v151 else nil, 
            sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v134.props.sponsoredFooterAdLabelText else nil, 
            sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v134.props.sponsoredFooterAdLabelFirst else nil, 
            sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v134.props.sponsoredFooterIncludeRatingContent else nil
        }));
    elseif v148 then
        return (v34.createElement(v4, {
            text = v146, 
            useLargerFont = v135, 
            isUnifiedGameTile = true
        }));
    elseif v142 then
        if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                useLargerFont = v135, 
                friendUserIds = v138, 
                onFriendFooterActivated = v134.onFriendFooterActivated
            }));
        else
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friends = v141, 
                useLargerFont = v135
            }));
        end;
    elseif v134.props.friendVisitedString then
        return (v35.createElement(v2, {
            icon = l_Images_0["icons/menu/recent"], 
            text = v134.props.friendVisitedString, 
            iconSize = v135 and 32 or 24, 
            useLargerFont = v135
        }));
    elseif v143 then
        if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friendUserIds = v134.getVisitedFriends(), 
                useLargerFont = v135
            }));
        else
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friends = v134.getVisitedFriends(), 
                useLargerFont = v135
            }));
        end;
    elseif l_FFlagLuaAppSupportAdRatingFooter_0 then
        return v151;
    else
        return (v35.createElement(v5, {
            stats = {
                totalUpVotes = v134.props.totalUpVotes, 
                totalDownVotes = v134.props.totalDownVotes, 
                playerCount = if v134.props.playerCountStyle == v12.PlayerCountStyleValues.Footer then v134.props.entry.playerCount else nil
            }, 
            isGridTile = v134.props.useGridTile, 
            hideGameStats = v134.props.hideGameStats, 
            useLargerFont = v135, 
            isUnifiedGameTile = true, 
            gameTileLayoutType = v134.props.gameTileLayoutType
        }));
    end;
end;
v99.renderContent = function(v152, v153, v154, _) --[[ Line: 782 ]] --[[ Name: renderContent ]]
    -- upvalues: v12 (copy), v18 (copy), v34 (copy), v5 (copy), v29 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), v22 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), v35 (copy), v7 (copy), v94 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), v10 (copy), l_FFlagLuaAppMigrateGameTileHoverFixes_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v11 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy)
    local v156 = v152.props.Size or UDim2.fromScale(1, 1);
    local l_imageThumbnail_0 = v152.props.imageThumbnail;
    local l_onGameTileActivated_0 = v152.props.onGameTileActivated;
    local v159 = true;
    if v152.props.playerCountStyle ~= v12.PlayerCountStyleValues.Always then
        v159 = v152.props.isHovered and v152.props.playerCountStyle == v12.PlayerCountStyleValues.Hover;
    end;
    local v160 = v18.getImageAspectRatio(v152.props.gameTileLayoutType);
    local v161 = v152:renderGridTilesFooter();
    local v162 = if v152.props.hideTitle then nil else v152.props.name;
    local v163 = if v159 then v34.createElement(v5, {
        stats = {
            playerCount = v152.props.entry.playerCount, 
            displayConcurrentUsersPill = true
        }
    }) else nil;
    local l_playButtonHeight_0 = v18.getElementSizes(v154.Tokens, v152.props.textSizeOffset, v152.props.contentTextLineCount, v152.props.foundationTokens, true).playButtonHeight;
    local v165 = if v152.props.isHidden then v34.createElement(v29, {
        appPage = v152.props.appPage, 
        collectionId = v152.props.topicId, 
        setGameHidden = v152.props.setGameHidden, 
        universeId = v152.props.universeId, 
        parentRef = v152.props.hoverRef, 
        hiddenTileType = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else v152.props.hiddenTileType, 
        isSponsored = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v152.props.entry.isSponsored else nil
    }) else if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and v152.props.videoThumbnail then v34.createElement(v22, {
        video = v152.props.videoThumbnail, 
        image = l_imageThumbnail_0, 
        playing = v152.props.isVideoPlaying, 
        looped = true, 
        Size = UDim2.fromScale(1, 1), 
        isTileContained = v152.props.isContained, 
        cornerRadius = v154.Tokens.Global.Space_100, 
        ZIndex = -2, 
        onActivated = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 835 ]]
            -- upvalues: l_onGameTileActivated_0 (copy), v152 (copy)
            l_onGameTileActivated_0(v152.isMounted);
        end or v152.onActivated else nil, 
        itemIndex = v152.props.index, 
        videoAnalytics = v152.props.videoAnalytics
    }) else nil;
    local v166 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and not v152.props.isVideoPlaying then
        v166 = if v152.props.tileBadges then v35.createFragment({
            SocialFeaturePill = v163, 
            Badge = v34.createElement(v7, {
                tileBadgesByPosition = v152.props.tileBadges
            })
        }) else v163;
    end;
    local l_isHidden_0 = v152.props.isHidden;
    local v168 = if not (next(v152.props.availableMenuItems) ~= nil and (v152.props.isHovered or v152.props.overflowMenuOpen or v152.state.isSelected)) or l_isHidden_0 then nil else v34.createElement(v94, {
        isHovered = v152.props.isHovered, 
        isSelected = v152.state.isSelected, 
        universeId = v152.props.universeId, 
        collectionId = v152.props.topicId, 
        appPage = v152.props.appPage, 
        setGameHidden = v152.props.setGameHidden, 
        menuKey = v152.props.hoverKey, 
        menuOpen = v152.props.overflowMenuOpen, 
        onMenuOpenChanged = if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v152.onMenuOpenChanged else nil, 
        parentRef = v152.props.hoverRef, 
        isSponsored = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v152.props.entry.isSponsored else nil, 
        payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v152.props.entry.payerName else nil, 
        sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v152.props.sponsoredUserCohort else nil, 
        adId = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v152.props.entry.adId else nil, 
        availableMenuItems = v152.props.availableMenuItems
    });
    return v34.createElement("Frame", {
        Size = v156, 
        ZIndex = v152.props.ZIndex, 
        BackgroundTransparency = 1, 
        LayoutOrder = v152.props.layoutOrder, 
        ref = v152.gameTileRef
    }, {
        Tile = v34.createElement(v10, {
            SelectionOrder = v152.props.SelectionOrder, 
            Selectable = not l_isHidden_0, 
            hoverPadding = if not not l_FFlagLuaAppMigrateGameTileHoverFixes_0 or v152.props.useGridTile then nil else v154.Tokens.Global.Space_100, 
            numLinesForTitle = v152.props.contentTextLineCount, 
            numLinesForMetadata = v152.props.metadataTextLineCount, 
            imageAspectRatio = v160, 
            isContained = v152.props.isContained, 
            containmentSidePadding = v18.getContainmentSidePadding(v154.Tokens, v152.props.gameTileLayoutType, v152.props.foundationTokens), 
            Size = UDim2.fromScale(1, 1), 
            image = l_imageThumbnail_0, 
            onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v152.props.onTileImageLoaded else nil, 
            thumbnailComponent = v165, 
            title = if l_isHidden_0 then nil else v162, 
            isDisabled = l_isHidden_0 and true or v152.props.isDisabled, 
            onActivated = if not l_FFlagLuaAppGameDetailsAttributionFix_0 or l_isHidden_0 then v152.onActivated else function() --[[ Line: 918 ]]
                -- upvalues: l_onGameTileActivated_0 (copy), v152 (copy)
                l_onGameTileActivated_0(v152.isMounted);
            end, 
            onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v152.props.onGuiStateChanged else nil, 
            onSelectionGained = v152.onSelectionGained, 
            onSelectionLost = v152.onSelectionLost, 
            onTouchLongPress = if not l_isHidden_0 then v152.onTouchLongPress else nil, 
            reducedMotion = v153, 
            isHovered = not l_isHidden_0 and v152.props.isHovered, 
            forwardRef = v152.props.hoverRef, 
            hidePlayButton = l_isHidden_0 and true or v152.props.hidePlayButton, 
            hoverActionRow = if not not v152.props.hidePlayButton or l_isHidden_0 then nil else v34.createElement(v11, {
                universeId = v152.props.navigationUniverseId, 
                referralSource = v152.props.referralSource, 
                launchSource = "ExperienceTile", 
                reportExperienceLaunched = v152.reportExperienceLaunchedFromActionBar, 
                openGameDetails = l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 937 ]]
                    -- upvalues: l_onGameTileActivated_0 (copy), v152 (copy)
                    l_onGameTileActivated_0(v152.isMounted);
                end or v152.onActivated, 
                entry = v152.props.entry, 
                launchExperienceEventContext = v152.props.launchExperienceEventContext, 
                fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000, 
                index = v152.props.index, 
                horizontalPadding = 0, 
                verticalPadding = 0, 
                height = l_playButtonHeight_0, 
                showButtonText = v160 > 1, 
                isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v152.props.entry.placeIdOverride else nil, 
                launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v152.props.entry.launchDataOverride else nil
            }), 
            thumbnailOverlay = if l_isHidden_0 then nil else if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v166 else if v152.props.tileBadges then v35.createFragment({
                SocialFeaturePill = v163, 
                Badge = v34.createElement(v7, {
                    tileBadgesByPosition = v152.props.tileBadges
                })
            }) else v163, 
            overflowMenu = v168, 
            footerMetadata = if l_isHidden_0 then nil else v161, 
            isUnifiedGameTile = true, 
            textSizeOffset = v152.props.textSizeOffset, 
            hideMetadata = v152.props.hideMetadata
        })
    });
end;
v99.render = function(v169) --[[ Line: 979 ]] --[[ Name: render ]]
    -- upvalues: l_DiscoveryAppLaunchTracker_0 (copy), l_withStyle_0 (copy)
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileRender();
    end;
    if v169.props.game == nil then
        return nil;
    else
        return l_withStyle_0(function(v170) --[[ Line: 989 ]]
            -- upvalues: v169 (copy)
            local l_ReducedMotion_0 = v170.Settings.ReducedMotion;
            return v169:renderContent(l_ReducedMotion_0, v170, v169.props.foundationTokens);
        end);
    end;
end;
v99.didMount = function(v172) --[[ Line: 995 ]] --[[ Name: didMount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v172.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v172.gameTileRef, v172.props.impressionsTag, v172.props.index);
    if not v172.props.useGridTile and v172.props.friendFooterEnabled and v172.props.hasInGameFriends then
        v172:setState({
            canDisplayFriendFooter = true
        });
    end;
    if v172.props.useGridTile then
        v172.loadWideThumbnail();
    end;
end;
v99.willUnmount = function(v173) --[[ Line: 1010 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v173.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v173.gameTileRef, v173.props.impressionsTag, v173.props.index);
end;
v99.didUpdate = function(v174, v175) --[[ Line: 1015 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    if v175.impressionsTag ~= v174.props.impressionsTag or v175.index ~= v174.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v174.gameTileRef, v175.impressionsTag, v175.index);
        l_ImpressionsTagUtility_0.AddTag(v174.gameTileRef, v174.props.impressionsTag, v174.props.index);
    end;
    if v174.props.useGridTile and v175.universeId ~= v174.props.universeId then
        v174.loadWideThumbnail();
    end;
    if not v174.props.useGridTile and (v175.friendFooterEnabled ~= v174.props.friendFooterEnabled or v175.hasInGameFriends ~= v174.props.hasInGameFriends) and v174.props.friendFooterEnabled and v174.props.hasInGameFriends then
        v174:setState({
            canDisplayFriendFooter = true
        });
    end;
end;
local function _(v176, v177) --[[ Line: 1040 ]] --[[ Name: formatRating ]]
    if v176 + v177 == 0 then
        return "--";
    else
        return tostring((math.floor(v176 / (v176 + v177) * 100 + 0.5))) .. "%";
    end;
end;
v99 = v36.connect(function(v179, v180) --[[ Line: 1048 ]]
    -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_GameInfosReducer_0 (copy), v12 (copy), v17 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), v30 (copy), v28 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_GameIconReducer_0 (copy), v26 (copy), v74 (copy), v27 (copy)
    local l_universeId_0 = v180.entry.universeId;
    local v182 = nil;
    if not l_FFlagLuaAppGameDetailsAttributionFix_0 then
        v182 = if v180.entry.navigationUniverseId and v180.entry.navigationUniverseId ~= "" and v180.entry.navigationUniverseId ~= "0" then v180.entry.navigationUniverseId else v180.entry.universeId;
    end;
    local v183 = v179.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    local v184 = v183 and v183.totalUpVotes or 0;
    local v185 = v183 and v183.totalDownVotes or 0;
    local v186 = v183 and v183.friendActivityTitle or nil;
    local v187 = nil;
    local v188 = nil;
    local v189 = v183 and v183.minimumAge or 0;
    local v190 = v183 and v183.ageRecommendationDisplayName or "";
    local v191 = nil;
    v191 = if v180.gameTileLayoutType == "Event" then v180.playButtonStyle ~= v12.PlayButtonStyleValues.Enabled else v180.gameTileLayoutType == "Wide" and v180.playButtonStyle == v12.PlayButtonStyleValues.Disabled;
    if v191 or v180.forceHideAgeRatings then
        v187 = false;
    elseif v189 ~= 0 and v190 ~= "" then
        v187 = true;
        v188 = v190;
    else
        v187 = false;
    end;
    local v192 = v17(v183, v180.topicId);
    local v193 = (if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then v30.getWideImageAssetId(v192) else v192 and v192.primaryMediaAsset and v192.primaryMediaAsset.wideImageAssetId) or v183 and v183.primaryWideAssetId or nil;
    local v194 = v28(v193, v180.entry.placeId);
    local v195 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        local v196 = v192 and v192.primaryMediaAsset and v192.primaryMediaAsset.wideVideoAssetId;
        v195 = if v196 then ("rbxassetid://%*"):format(v196) else nil;
    end;
    local v197 = v179[l_GameIconReducer_0.key][l_universeId_0] and v179[l_GameIconReducer_0.key][l_universeId_0].url or nil;
    local v198 = if v180.useGridTile then v194 else v26(v197, l_universeId_0);
    local v199 = if not not v180.useHoverTile or v180.useExperienceTileMetadata then if v74 then v27(v184, v185, nil, true) else v184 + v185 == 0 and "--" or tostring((math.floor(v184 / (v184 + v185) * 100 + 0.5))) .. "%" else nil;
    local v200 = v183 and v183.friendVisits or {};
    local v201 = if v183 and v183.friendVisitedString ~= "" then v183.friendVisitedString else nil;
    local v202 = v192 and v192.footer or nil;
    local v203 = v192 and v192.title or v183 and v183.name or "";
    return {
        game = v183, 
        universeId = l_universeId_0, 
        navigationUniverseId = if not l_FFlagLuaAppGameDetailsAttributionFix_0 then v182 else nil, 
        name = v203, 
        totalUpVotes = v184, 
        totalDownVotes = v185, 
        imageThumbnail = v198, 
        wideThumbnail = v194, 
        videoThumbnail = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v195 else nil, 
        friendActivityTitle = v186, 
        rating = v199, 
        showAgeRating = v187, 
        ageRatingText = v188, 
        friendVisits = v200, 
        friendVisitedString = v201, 
        hidePlayButton = v191, 
        footerLayoutData = v202
    };
end, function(v204) --[[ Line: 1153 ]]
    -- upvalues: v9 (copy), v13 (copy)
    return {
        openContextualMenu = function(v205, v206, v207) --[[ Line: 1155 ]] --[[ Name: openContextualMenu ]]
            -- upvalues: v204 (copy), v9 (ref)
            v204(v9(v205, v206, v207));
        end, 
        openSponsoredTooltip = function(v208) --[[ Line: 1158 ]] --[[ Name: openSponsoredTooltip ]]
            -- upvalues: v204 (copy), v13 (ref)
            return v204(v13(v208));
        end
    };
end)(v99);
if not l_FFlagLuaAppGameDetailsAttributionFix_0 then
    v99 = l_RoactServices_0.connect({
        networking = l_RoactNetworking_0
    })(v99);
end;
return function(v209) --[[ Line: 1170 ]]
    -- upvalues: v34 (copy), l_useTokens_0 (copy), v15 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), v21 (copy), l_useSelector_0 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), v19 (copy), v20 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_sponsoredGamesRecordClick_0 (copy), v16 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_VideoPlaybackCoordinator_0 (copy), v23 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_useOverflowMenuOpen_0 (copy), l_useTriggerFeedback_0 (copy), v95 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), v99 (ref), v37 (copy), v25 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_usePreferredInput_0 (copy), v24 (copy), v61 (copy), v96 (copy), v97 (copy), l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 (copy)
    local v210 = v34.useRef(nil);
    local v211 = l_useTokens_0();
    local l_useHoverTile_0 = v209.useHoverTile;
    local v213 = ("%*_%*_%*"):format(v209.impressionsTag or "", v209.index or "0", v209.gameTileLayoutType or "Narrow");
    if v209.impressionsTag == nil or v209.index == nil then
        l_useHoverTile_0 = false;
    end;
    local v214 = v15(v210, v213, l_useHoverTile_0);
    local v215 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v216 = v215 and true or v209.useHoverTile;
    local v217 = nil;
    v217 = if v209.useExperienceTileMetadata ~= nil then v209.useExperienceTileMetadata else v215;
    local v218 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v21(v209.entry.universeId, v209.topicId, v209.badgeOverride) else v21(v209.entry.universeId, v209.topicId);
    local v220 = l_useSelector_0(function(v219) --[[ Line: 1195 ]]
        return v219.LocalUserId;
    end);
    local v221 = nil;
    if not l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
        v221 = l_useSelector_0(function(v222) --[[ Line: 1201 ]]
            return v222.Users;
        end);
    end;
    local v224 = l_useSelector_0(function(v223) --[[ Line: 1206 ]]
        -- upvalues: v209 (copy)
        return v223.InGameUsersByGame[v209.entry.universeId];
    end);
    local v225 = v19(v220, v221, v224);
    local v226 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v20(v220, v224) else nil;
    local v227, v228 = v34.useState(false);
    local v229 = nil;
    local v230 = nil;
    local v231 = nil;
    local v232 = nil;
    if l_FFlagLuaAppGameDetailsAttributionFix_0 then
        v229 = l_useRoactService_0(l_RoactNetworking_0);
        v230 = if v209.entry.navigationUniverseId and v209.entry.navigationUniverseId ~= "" and v209.entry.navigationUniverseId ~= "0" then v209.entry.navigationUniverseId else v209.entry.universeId;
        v232 = v34.useCallback(function() --[[ Line: 1231 ]]
            -- upvalues: v209 (copy), l_sponsoredGamesRecordClick_0 (ref), v229 (ref)
            local l_entry_2 = v209.entry;
            if l_entry_2.isSponsored then
                l_sponsoredGamesRecordClick_0(v229, l_entry_2.adId);
            end;
        end, {
            v229, 
            v209.entry.isSponsored, 
            v209.entry.adId
        });
        v231 = v34.useCallback(function(v234) --[[ Line: 1240 ]]
            -- upvalues: v209 (copy), v16 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v23 (ref), v230 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), l_IntervalPerformanceTracker_0 (ref), v232 (ref)
            if v209.isHovered then
                v16.default:reset();
            end;
            if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
                l_VideoPlaybackCoordinator_0.default:reset(v23.TileClicked, nil, v230, nil);
            end;
            if v234 then
                if l_FFlagLuaAppGameTileInteractionFeedback_0 and v209.onActivated then
                    v209.onActivated();
                end;
                local v235 = {
                    source = v209.source, 
                    index = v209.index, 
                    referralSource = v209.referralSource, 
                    onPeekViewClosed = v209.onPeekViewClosed, 
                    placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v209.entry.placeIdOverride else nil, 
                    experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                        launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v209.entry.launchDataOverride) then v209.entry.launchDataOverride else nil, 
                        tileType = v209.entry.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile, 
                        nativeAdData = v209.entry.adId
                    } else if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v209.entry.launchDataOverride) then {
                        launchData = v209.entry.launchDataOverride
                    } else nil
                };
                if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                    l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
                end;
                v209.navigateToGameDetails(v230, v235);
                v209.reportGameDetailOpened(v209.index, v230);
                v232();
            end;
        end, {
            v209.isHovered, 
            v209.index, 
            v209.videoAnalytics, 
            v209.onActivated, 
            v209.source, 
            v209.referralSource, 
            v209.onPeekViewClosed, 
            v209.navigateToGameDetails, 
            v209.reportGameDetailOpened, 
            v230, 
            v232, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v209.entry.placeIdOverride else nil, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v209.entry.launchDataOverride else nil
        });
    end;
    local v236 = l_useOverflowMenuOpen_0(v213);
    local v237 = l_useTriggerFeedback_0();
    local v238 = v34.useMemo(function() --[[ Line: 1313 ]]
        -- upvalues: v95 (ref), v209 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref)
        return v95({
            isSponsored = v209.entry.isSponsored, 
            enableExplicitFeedback = v209.enableExplicitFeedback, 
            enableSponsoredFeedback = v209.enableSponsoredFeedback, 
            enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v209.enableReportAd else nil
        });
    end, {
        v209.entry.isSponsored, 
        v209.enableExplicitFeedback, 
        v209.enableSponsoredFeedback, 
        if l_FFlagLuaAppEnableSponsoredReportAd_0 then v209.enableReportAd else nil
    });
    local v239 = v34.createElement(v99, v37.Dictionary.join(v209, {
        useExperienceTileMetadata = v217, 
        hasBackground = v216, 
        hoverRef = v210, 
        isHoverSupported = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then l_useHoverTile_0 else nil, 
        isHovered = v214, 
        isVideoPlaying = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v227 else nil, 
        tileBadges = v218, 
        foundationTokens = v211, 
        users = v221, 
        inGameUsersByGame = v224, 
        hasInGameFriends = v225, 
        inGameUserIds = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v226 else nil, 
        networking = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v229 else nil, 
        navigationUniverseId = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v230 else nil, 
        onGameTileActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v231 else nil, 
        recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v232 else nil, 
        overflowMenuOpen = v236, 
        hoverKey = v213, 
        triggerFeedback = v237, 
        availableMenuItems = v238
    }));
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        local v240 = v25(v209.entry.universeId, v209.topicId);
        local v241 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then l_usePreferredInput_0() else nil;
        if v240 then
            return v34.createElement(v34.Fragment, {}, {
                GameTile = v239, 
                VideoPlaybackDetector = v34.createElement(v24, {
                    videoKey = v213, 
                    itemIndex = v209.index, 
                    universeId = v209.entry.universeId, 
                    tileRef = v210, 
                    isHoverSupported = l_useHoverTile_0, 
                    isHovered = v214, 
                    autoplay = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v241 == v61.Input.Touch else nil, 
                    onPlaybackChange = v228, 
                    videoAnalytics = v209.videoAnalytics, 
                    videoDwellTimeInSec = v96, 
                    videoVisiblePercent = v97, 
                    pageContext = if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then v209.appPage else nil
                })
            });
        end;
    end;
    return v239;
end;