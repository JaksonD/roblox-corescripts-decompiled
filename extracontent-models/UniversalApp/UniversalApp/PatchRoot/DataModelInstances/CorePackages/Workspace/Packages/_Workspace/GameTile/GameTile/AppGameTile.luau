local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v2 = require(l_script_FirstAncestor_0.Footer.GridTileIconTextFooter);
local l_GridTileFriendFooter_0 = require(l_script_FirstAncestor_0.Footer.GridTileFriendFooter).GridTileFriendFooter;
local v4 = require(l_script_FirstAncestor_0.Footer.GridTileTextFooter);
local v5 = require(l_script_FirstAncestor_0.SponsoredGamesRecordClick);
local v6 = require(l_script_FirstAncestor_0.Footer.GameStats);
local v7 = require(l_script_FirstAncestor_0.Footer.GridTileSponsoredFooter);
local v8 = require(l_script_FirstAncestor_0.Overlays.GameTileThumbnailBadges);
local v9 = require(l_script_FirstAncestor_0.sortFriendsByPresenceAndRecencyFactory);
local v10 = require(l_script_FirstAncestor_0.OpenCentralOverlayForPlacesList);
local v11 = require(l_script_FirstAncestor_0.GameTileView);
local v12 = require(l_script_FirstAncestor_0.AppExperienceActionRow);
local v13 = require(l_script_FirstAncestor_0.GameTileConstants);
local v14 = require(l_script_FirstAncestor_0.OpenSponsoredTooltip);
local v15 = require(l_script_FirstAncestor_0.GameTileTypes);
local v16 = require(l_script_FirstAncestor_0.useIsHoveredTile);
local v17 = require(l_script_FirstAncestor_0.HoverTileCoordinator);
local v18 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local v19 = require(l_script_FirstAncestor_0.GameTileViewConfig);
local v20 = require(l_script_FirstAncestor_0.useHasInGameFriends);
local v21 = require(l_script_FirstAncestor_0.useInGameUserIds);
local v22 = require(l_script_FirstAncestor_0.Overlays.useValidTileBadges);
local v23 = require(l_script_FirstAncestor_0.GameTileVideoThumbnail);
local v24 = require(l_script_FirstAncestor_0.Video.Analytics.VideoEndReason);
local v25 = require(l_script_FirstAncestor_0.Video.GameVideoPlaybackDetector);
local v26 = require(l_script_FirstAncestor_0.Video.useHasVideoThumbnailSelector);
local v27 = require(l_script_FirstAncestor_0.formatExperienceIcon);
local v28 = require(l_script_FirstAncestor_0.formatExperienceRating);
local v29 = require(l_script_FirstAncestor_0.formatExperienceThumbnail);
local v30 = require(l_script_FirstAncestor_0.HiddenGameTile.HiddenTileContent);
local v31 = require(l_script_FirstAncestor_0.ItemLayoutDataParsingUtils);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
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
local l_gameTileOverflowMenuAction_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gameTileOverflowMenuAction;
local v59 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v59.usePreferredInput;
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
local v72 = game:DefineFastFlag("LuaAppUseRatingFormatHelper2", false);
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
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_VideoPlaybackCoordinator_0 = require(l_Parent_0.VideoUtils).VideoPlaybackCoordinator;
local v90 = require(l_script_FirstAncestor_0.GameTileOverflowMenu);
local v91 = require(l_script_FirstAncestor_0.getAvailableGameTileOverflowMenuItems);
local v92 = game:DefineFastInt("LuaAppGameTileVideoDwellTimeInSec", 3);
local v93 = game:DefineFastInt("LuaAppGameTileVideoVisiblePercent", 80);
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130);
local function _() --[[ Line: 125 ]] --[[ Name: getHoverDelay ]]
    return game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000;
end;
local v95 = v35.PureComponent:extend("AppGameTile");
v95.validateProps = v40.strictInterface({
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
local l_Narrow_0 = v15.GameTileLayoutType.Narrow;
v95.defaultProps = {
    useHoverTile = false, 
    hasBackground = false, 
    useExperienceTileMetadata = false, 
    useGridTile = false, 
    thumbnailAspectRatioOverride = l_AspectRatioModeEnum_0.Square, 
    gameTileLayoutType = l_Narrow_0, 
    contentTextLineCount = v13.TileTextLines[l_Narrow_0].titleTextLines, 
    hideGameStats = false
};
v95.init = function(v97) --[[ Line: 250 ]] --[[ Name: init ]]
    -- upvalues: l_DiscoveryAppLaunchTracker_0 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), v17 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_VideoPlaybackCoordinator_0 (copy), v24 (copy), v35 (copy), v12 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), v5 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), l_IntervalPerformanceTracker_0 (copy), v59 (copy), l_ContentProvider_0 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), l_memoize_0 (copy), v9 (copy)
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileInit();
    end;
    v97.state = {
        isHovered = false, 
        canDisplayFriendFooter = false, 
        isSelected = false
    };
    v97.onMenuOpenChanged = l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 and function(v98, v99) --[[ Line: 262 ]]
        -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v97 (copy), l_gameTileOverflowMenuAction_0 (ref), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (ref)
        local v100 = {
            ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v97.props.appPage, 
            universeId = v97.props.universeId, 
            sortId = v97.props.topicId, 
            actionType = v98 and "GameTileOverflowMenuClosed" or "GameTileOverflowMenuOpened", 
            availableMenuItems = v99
        };
        l_gameTileOverflowMenuAction_0(v100, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v97.props.appPage or l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 and "Unknown" or nil else nil);
    end or nil;
    v97.onTouchLongPress = function() --[[ Line: 282 ]]
        -- upvalues: v97 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (ref), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (ref), l_getOverflowMenuSignalStore_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref)
        if next(v97.props.availableMenuItems) ~= nil then
            if v97.props.triggerFeedback and not v97.props.overflowMenuOpen then
                local v101 = if l_FFlagLuaAppHapticTriggeredTelemetry_0 then {
                    universeId = v97.props.universeId, 
                    sortId = v97.props.topicId
                } else nil;
                v97.props.triggerFeedback("TileLongPress", "Press", if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v97.props.appPage or l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 and "Unknown" or nil else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v101 else nil);
            end;
            l_getOverflowMenuSignalStore_0().openMenu(v97.props.hoverKey);
            if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then
                local v102 = {};
                for v103, _ in v97.props.availableMenuItems do
                    table.insert(v102, v103);
                end;
                v97.onMenuOpenChanged(false, table.concat(v102, ","));
            end;
        end;
    end;
    v97.reportExperienceLaunchedFromActionBar = function(...) --[[ Line: 316 ]]
        -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), v97 (copy), v17 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v24 (ref)
        if l_FFlagLuaAppGameDetailsAttributionFix_0 then
            v97.props.recordSponsoredGameClick();
        else
            v97.recordSponsoredGameClick();
        end;
        if v97.props.isHovered then
            v17.default:reset();
        end;
        if v97.props.reportExperienceLaunched then
            v97.props.reportExperienceLaunched(...);
        end;
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
            l_VideoPlaybackCoordinator_0.default:reset(v24.ExperienceLaunched, nil, v97.props.navigationUniverseId, nil);
        end;
    end;
    v97.renderAppExperienceActionRow = function(_) --[[ Line: 342 ]]
        -- upvalues: v35 (ref), v12 (ref), v97 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), l_FFlagLuaAppUnifyPlayButtonTile_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref)
        return v35.createElement(v12, {
            universeId = v97.props.navigationUniverseId, 
            referralSource = v97.props.referralSource, 
            launchSource = "ExperienceTile", 
            reportExperienceLaunched = v97.reportExperienceLaunchedFromActionBar, 
            openGameDetails = l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 349 ]]
                -- upvalues: v97 (ref)
                v97.props.onGameTileActivated(v97.isMounted);
            end or v97.onActivated, 
            entry = v97.props.entry, 
            launchExperienceEventContext = v97.props.launchExperienceEventContext, 
            horizontalPadding = v97.props.useGridTile and 0 or nil, 
            index = v97.props.index, 
            isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil, 
            placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v97.props.entry.placeIdOverride else nil, 
            launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v97.props.entry.launchDataOverride else nil
        });
    end;
    v97.onHoverChanged = function(v106) --[[ Line: 365 ]]
        -- upvalues: v97 (copy)
        if v106 and v97.props.triggerFeedback then
            v97.props.triggerFeedback("Default", "Hover");
        end;
        v97:setState({
            isHovered = v106
        });
    end;
    v97.gameTileRef = v35.createRef();
    v97.getTilePosition = function() --[[ Line: 377 ]]
        -- upvalues: v97 (copy)
        if v97.gameTileRef.current then
            return v97.gameTileRef.current.AbsolutePosition;
        else
            return nil;
        end;
    end;
    v97.getTileSize = function() --[[ Line: 385 ]]
        -- upvalues: v97 (copy)
        if v97.gameTileRef.current then
            return v97.gameTileRef.current.AbsoluteSize;
        else
            return nil;
        end;
    end;
    v97.recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then nil else function() --[[ Line: 395 ]]
        -- upvalues: v97 (copy), v5 (ref)
        local l_networking_0 = v97.props.networking;
        local l_entry_0 = v97.props.entry;
        if l_entry_0.isSponsored then
            v5(l_networking_0, l_entry_0.adId);
        end;
    end;
    v97.onActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then nil else function() --[[ Line: 406 ]]
        -- upvalues: v97 (copy), v17 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v24 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), l_IntervalPerformanceTracker_0 (ref)
        if v97.props.isHovered then
            v17.default:reset();
        end;
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
            l_VideoPlaybackCoordinator_0.default:reset(v24.TileClicked, nil, v97.props.navigationUniverseId, nil);
        end;
        if v97.isMounted then
            if l_FFlagLuaAppGameTileInteractionFeedback_0 and v97.props.onActivated then
                v97.props.onActivated();
            end;
            local l_navigationUniverseId_0 = v97.props.navigationUniverseId;
            local v110 = {
                source = v97.props.source, 
                index = v97.props.index, 
                referralSource = v97.props.referralSource, 
                onPeekViewClosed = v97.props.onPeekViewClosed, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v97.props.entry.placeIdOverride else nil, 
                experienceJoinData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v97.props.entry.launchDataOverride) then {
                    launchData = v97.props.entry.launchDataOverride
                } else nil
            };
            if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
            end;
            v97.props.navigateToGameDetails(l_navigationUniverseId_0, v110);
            local l_index_0 = v97.props.index;
            v97.props.reportGameDetailOpened(l_index_0, l_navigationUniverseId_0);
            v97.recordSponsoredGameClick();
        end;
    end;
    v97.onFriendFooterActivated = function() --[[ Line: 455 ]]
        -- upvalues: v97 (copy)
        if v97.isMounted then
            local l_game_0 = v97.props.game;
            local v113 = v97.getTileSize();
            v97.props.openContextualMenu(l_game_0, v113, v97.getTilePosition());
        end;
    end;
    v97.onActivateSponsoredTooltip = function() --[[ Line: 463 ]]
        -- upvalues: v97 (copy), v59 (ref)
        if v97.isMounted then
            v97.props.openSponsoredTooltip(v59.GetInputModeStore(false).getLastInputType(false));
        end;
    end;
    v97.loadWideThumbnail = function() --[[ Line: 471 ]]
        -- upvalues: v97 (copy), l_ContentProvider_0 (ref)
        local l_wideThumbnail_0 = v97.props.wideThumbnail;
        if l_wideThumbnail_0 ~= nil then
            task.spawn(function() --[[ Line: 474 ]]
                -- upvalues: l_ContentProvider_0 (ref), l_wideThumbnail_0 (copy)
                l_ContentProvider_0:PreloadAsync({
                    l_wideThumbnail_0
                });
            end);
        end;
    end;
    v97.getVisitedFriends = function() --[[ Line: 480 ]]
        -- upvalues: v97 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (ref)
        local v115 = {};
        local l_friendVisits_0 = v97.props.friendVisits;
        for v117 = 1, #l_friendVisits_0 do
            local v118 = tostring(l_friendVisits_0[v117].userId);
            if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
                table.insert(v115, v118);
            elseif v97.props.users and v97.props.users[v118] then
                local v119 = v97.props.users[v118];
                table.insert(v115, {
                    userId = v118, 
                    displayName = v119.displayName
                });
            end;
        end;
        return v115;
    end;
    v97.getSortedFriends = l_memoize_0(function(v120, v121) --[[ Line: 508 ]]
        -- upvalues: v9 (ref)
        if not v120 or not v121 then
            return {};
        else
            local v122 = {};
            for _, v124 in pairs(v121) do
                local v125 = v120[v124];
                if v125 and v125.isFriend then
                    table.insert(v122, {
                        userId = v125.id, 
                        displayName = v125.displayName
                    });
                end;
            end;
            local v126 = v9("displayName");
            table.sort(v122, v126);
            return v122;
        end;
    end);
    v97.onSelectionGained = function() --[[ Line: 530 ]]
        -- upvalues: v97 (copy)
        v97:setState({
            isSelected = true
        });
        if v97.props.onSelectionGained then
            v97.props.onSelectionGained(v97.props.entry, v97.props.index, v97.props.navigationUniverseId);
        end;
    end;
    v97.onSelectionLost = function() --[[ Line: 538 ]]
        -- upvalues: v97 (copy)
        v97:setState({
            isSelected = false
        });
        if v97.props.onSelectionLost then
            v97.props.onSelectionLost();
        end;
    end;
end;
local function _(v127) --[[ Line: 550 ]] --[[ Name: getTextLiteralForTextFooter ]]
    if v127 == nil then
        return nil;
    elseif v127.type ~= "TextLabel" then
        return nil;
    else
        local l_text_0 = v127.text;
        if l_text_0 == nil then
            return nil;
        else
            return l_text_0.textLiteral;
        end;
    end;
end;
v95.renderGridTilesFooter = function(v130) --[[ Line: 564 ]] --[[ Name: renderGridTilesFooter ]]
    -- upvalues: l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 (copy), v15 (copy), v35 (copy), v6 (copy), v13 (copy), v34 (copy), v7 (copy), l_FFlagLuaAppUpdateAdMetadata_0 (copy), v4 (copy), l_GridTileFriendFooter_0 (copy), v2 (copy), l_Images_0 (copy)
    local v131 = v130.props.useHoverTile or v130.props.useExperienceTileMetadata;
    local l_friendFooterEnabled_0 = v130.props.friendFooterEnabled;
    local l_hasInGameFriends_0 = v130.props.hasInGameFriends;
    local v134 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v130.props.inGameUserIds else nil;
    local l_users_0 = v130.props.users;
    local l_inGameUsersByGame_0 = v130.props.inGameUsersByGame;
    local v137 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then nil else v130.getSortedFriends(l_users_0, l_inGameUsersByGame_0);
    local v138 = l_friendFooterEnabled_0 and if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v134 and #v134 > 0 else l_hasInGameFriends_0;
    local v139 = v130.props.friendVisits and #v130.props.friendVisits > 0;
    local _ = nil;
    local l_footerLayoutData_0 = v130.props.footerLayoutData;
    local v142;
    if l_footerLayoutData_0 == nil then
        v142 = nil;
    elseif l_footerLayoutData_0.type ~= "TextLabel" then
        v142 = nil;
    else
        local l_text_1 = l_footerLayoutData_0.text;
        v142 = if l_text_1 == nil then nil else l_text_1.textLiteral;
    end;
    l_footerLayoutData_0 = false;
    if (v130.props.isHovered or v130.state.isSelected) and v130.props.ageRatingText and not v130.props.hidePlayButton then
        v142 = v130.props.ageRatingText;
        l_footerLayoutData_0 = true;
    end;
    local v144 = v142 ~= nil;
    local l_entry_1 = v130.props.entry;
    local v146 = l_entry_1.isSponsored and (l_entry_1.isShowSponsoredLabel or v130.props.isSponsoredFooterAllowed or l_FFlagLuaAppSupportAdRatingFooter_0 and v130.props.isSponsoredRatingFooterAllowed or l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v130.props.sponsoredFooterAdLabelText ~= nil);
    if l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 and v130.props.gameTileLayoutType == v15.GameTileLayoutType.Narrow and v130.props.useExperienceTileMetadata and (v146 or v144) then
        v131 = false;
    end;
    local v147 = if l_FFlagLuaAppSupportAdRatingFooter_0 then v35.createElement(v6, {
        stats = {
            totalUpVotes = v130.props.totalUpVotes, 
            totalDownVotes = v130.props.totalDownVotes, 
            playerCount = if not (v130.props.playerCountStyle == v13.PlayerCountStyleValues.Footer) or l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v146 then nil else v130.props.entry.playerCount
        }, 
        isGridTile = v130.props.useGridTile, 
        hideGameStats = v130.props.hideGameStats, 
        useLargerFont = v131, 
        isUnifiedGameTile = true, 
        gameTileLayoutType = v130.props.gameTileLayoutType, 
        shouldSizeToContentWidth = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v146 else nil
    }) else nil;
    if v130.props.hideMetadata then
        if v130.props.isHovered then
            if v146 then
                return v34.createElement(v7, {
                    useLargerFont = v131, 
                    onActivateSponsoredTooltip = v130.onActivateSponsoredTooltip, 
                    isUnifiedGameTile = true, 
                    gameTileLayoutType = v130.props.gameTileLayoutType, 
                    isNarrowScreenXSmall = v130.props.isNarrowScreenXSmall, 
                    enableSponsoredFeedback = if l_FFlagLuaAppUpdateAdMetadata_0 then v130.props.enableSponsoredFeedback else nil, 
                    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v130.props.isSponsoredRatingFooterAllowed else nil, 
                    gameStatsElement = if l_FFlagLuaAppSupportAdRatingFooter_0 then v147 else nil, 
                    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v130.props.sponsoredFooterAdLabelText else nil, 
                    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v130.props.sponsoredFooterAdLabelFirst else nil, 
                    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v130.props.sponsoredFooterIncludeRatingContent else nil
                });
            elseif l_footerLayoutData_0 then
                return v34.createElement(v4, {
                    text = v142, 
                    useLargerFont = v131, 
                    isUnifiedGameTile = true
                });
            end;
        end;
        return nil;
    elseif v146 then
        return (v34.createElement(v7, {
            useLargerFont = v131, 
            onActivateSponsoredTooltip = v130.onActivateSponsoredTooltip, 
            isUnifiedGameTile = true, 
            gameTileLayoutType = v130.props.gameTileLayoutType, 
            isNarrowScreenXSmall = v130.props.isNarrowScreenXSmall, 
            enableSponsoredFeedback = if l_FFlagLuaAppUpdateAdMetadata_0 then v130.props.enableSponsoredFeedback else nil, 
            isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v130.props.isSponsoredRatingFooterAllowed else nil, 
            gameStatsElement = if l_FFlagLuaAppSupportAdRatingFooter_0 then v147 else nil, 
            sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v130.props.sponsoredFooterAdLabelText else nil, 
            sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v130.props.sponsoredFooterAdLabelFirst else nil, 
            sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v130.props.sponsoredFooterIncludeRatingContent else nil
        }));
    elseif v144 then
        return (v34.createElement(v4, {
            text = v142, 
            useLargerFont = v131, 
            isUnifiedGameTile = true
        }));
    elseif v138 then
        if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                useLargerFont = v131, 
                friendUserIds = v134, 
                onFriendFooterActivated = v130.onFriendFooterActivated
            }));
        else
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friends = v137, 
                useLargerFont = v131
            }));
        end;
    elseif v130.props.friendVisitedString then
        return (v35.createElement(v2, {
            icon = l_Images_0["icons/menu/recent"], 
            text = v130.props.friendVisitedString, 
            iconSize = v131 and 32 or 24, 
            useLargerFont = v131
        }));
    elseif v139 then
        if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friendUserIds = v130.getVisitedFriends(), 
                useLargerFont = v131
            }));
        else
            return (v35.createElement(l_GridTileFriendFooter_0, {
                showOnlineBorder = false, 
                friends = v130.getVisitedFriends(), 
                useLargerFont = v131
            }));
        end;
    elseif l_FFlagLuaAppSupportAdRatingFooter_0 then
        return v147;
    else
        return (v35.createElement(v6, {
            stats = {
                totalUpVotes = v130.props.totalUpVotes, 
                totalDownVotes = v130.props.totalDownVotes, 
                playerCount = if v130.props.playerCountStyle == v13.PlayerCountStyleValues.Footer then v130.props.entry.playerCount else nil
            }, 
            isGridTile = v130.props.useGridTile, 
            hideGameStats = v130.props.hideGameStats, 
            useLargerFont = v131, 
            isUnifiedGameTile = true, 
            gameTileLayoutType = v130.props.gameTileLayoutType
        }));
    end;
end;
v95.renderContent = function(v148, v149, v150, _) --[[ Line: 763 ]] --[[ Name: renderContent ]]
    -- upvalues: v13 (copy), v19 (copy), v34 (copy), v6 (copy), v30 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), v23 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), v35 (copy), v8 (copy), v90 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), v11 (copy), l_FFlagLuaAppMigrateGameTileHoverFixes_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v12 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy)
    local v152 = v148.props.Size or UDim2.fromScale(1, 1);
    local l_imageThumbnail_0 = v148.props.imageThumbnail;
    local l_onGameTileActivated_0 = v148.props.onGameTileActivated;
    local v155 = true;
    if v148.props.playerCountStyle ~= v13.PlayerCountStyleValues.Always then
        v155 = v148.props.isHovered and v148.props.playerCountStyle == v13.PlayerCountStyleValues.Hover;
    end;
    local v156 = v19.getImageAspectRatio(v148.props.gameTileLayoutType);
    local v157 = v148:renderGridTilesFooter();
    local v158 = if v148.props.hideTitle then nil else v148.props.name;
    local v159 = if v155 then v34.createElement(v6, {
        stats = {
            playerCount = v148.props.entry.playerCount, 
            displayConcurrentUsersPill = true
        }
    }) else nil;
    local l_playButtonHeight_0 = v19.getElementSizes(v150.Tokens, v148.props.textSizeOffset, v148.props.contentTextLineCount, v148.props.foundationTokens, true).playButtonHeight;
    local v161 = if v148.props.isHidden then v34.createElement(v30, {
        appPage = v148.props.appPage, 
        collectionId = v148.props.topicId, 
        setGameHidden = v148.props.setGameHidden, 
        universeId = v148.props.universeId, 
        parentRef = v148.props.hoverRef, 
        hiddenTileType = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else v148.props.hiddenTileType, 
        isSponsored = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v148.props.entry.isSponsored else nil
    }) else if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and v148.props.videoThumbnail then v34.createElement(v23, {
        video = v148.props.videoThumbnail, 
        image = l_imageThumbnail_0, 
        playing = v148.props.isVideoPlaying, 
        looped = true, 
        Size = UDim2.fromScale(1, 1), 
        isTileContained = v148.props.isContained, 
        cornerRadius = v150.Tokens.Global.Space_100, 
        ZIndex = -2, 
        onActivated = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 816 ]]
            -- upvalues: l_onGameTileActivated_0 (copy), v148 (copy)
            l_onGameTileActivated_0(v148.isMounted);
        end or v148.onActivated else nil, 
        itemIndex = v148.props.index, 
        videoAnalytics = v148.props.videoAnalytics
    }) else nil;
    local v162 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and not v148.props.isVideoPlaying then
        v162 = if v148.props.tileBadges then v35.createFragment({
            SocialFeaturePill = v159, 
            Badge = v34.createElement(v8, {
                tileBadgesByPosition = v148.props.tileBadges
            })
        }) else v159;
    end;
    local l_isHidden_0 = v148.props.isHidden;
    local v164 = if not (next(v148.props.availableMenuItems) ~= nil and (v148.props.isHovered or v148.props.overflowMenuOpen or v148.state.isSelected)) or l_isHidden_0 then nil else v34.createElement(v90, {
        isHovered = v148.props.isHovered, 
        isSelected = v148.state.isSelected, 
        universeId = v148.props.universeId, 
        collectionId = v148.props.topicId, 
        appPage = v148.props.appPage, 
        setGameHidden = v148.props.setGameHidden, 
        menuKey = v148.props.hoverKey, 
        menuOpen = v148.props.overflowMenuOpen, 
        onMenuOpenChanged = if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v148.onMenuOpenChanged else nil, 
        parentRef = v148.props.hoverRef, 
        isSponsored = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v148.props.entry.isSponsored else nil, 
        payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v148.props.entry.payerName else nil, 
        sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v148.props.sponsoredUserCohort else nil, 
        adId = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v148.props.entry.adId else nil, 
        availableMenuItems = v148.props.availableMenuItems
    });
    return v34.createElement("Frame", {
        Size = v152, 
        ZIndex = v148.props.ZIndex, 
        BackgroundTransparency = 1, 
        LayoutOrder = v148.props.layoutOrder, 
        ref = v148.gameTileRef
    }, {
        Tile = v34.createElement(v11, {
            SelectionOrder = v148.props.SelectionOrder, 
            Selectable = not l_isHidden_0, 
            hoverPadding = if not not l_FFlagLuaAppMigrateGameTileHoverFixes_0 or v148.props.useGridTile then nil else v150.Tokens.Global.Space_100, 
            numLinesForTitle = v148.props.contentTextLineCount, 
            numLinesForMetadata = v148.props.metadataTextLineCount, 
            imageAspectRatio = v156, 
            isContained = v148.props.isContained, 
            containmentSidePadding = v19.getContainmentSidePadding(v150.Tokens, v148.props.gameTileLayoutType, v148.props.foundationTokens), 
            Size = UDim2.fromScale(1, 1), 
            image = l_imageThumbnail_0, 
            thumbnailComponent = v161, 
            title = if l_isHidden_0 then nil else v158, 
            isDisabled = l_isHidden_0 and true or v148.props.isDisabled, 
            onActivated = if not l_FFlagLuaAppGameDetailsAttributionFix_0 or l_isHidden_0 then v148.onActivated else function() --[[ Line: 896 ]]
                -- upvalues: l_onGameTileActivated_0 (copy), v148 (copy)
                l_onGameTileActivated_0(v148.isMounted);
            end, 
            onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v148.props.onGuiStateChanged else nil, 
            onSelectionGained = v148.onSelectionGained, 
            onSelectionLost = v148.onSelectionLost, 
            onTouchLongPress = if not l_isHidden_0 then v148.onTouchLongPress else nil, 
            reducedMotion = v149, 
            isHovered = not l_isHidden_0 and v148.props.isHovered, 
            forwardRef = v148.props.hoverRef, 
            hidePlayButton = l_isHidden_0 and true or v148.props.hidePlayButton, 
            hoverActionRow = if not not v148.props.hidePlayButton or l_isHidden_0 then nil else v34.createElement(v12, {
                universeId = v148.props.navigationUniverseId, 
                referralSource = v148.props.referralSource, 
                launchSource = "ExperienceTile", 
                reportExperienceLaunched = v148.reportExperienceLaunchedFromActionBar, 
                openGameDetails = l_FFlagLuaAppGameDetailsAttributionFix_0 and function() --[[ Line: 915 ]]
                    -- upvalues: l_onGameTileActivated_0 (copy), v148 (copy)
                    l_onGameTileActivated_0(v148.isMounted);
                end or v148.onActivated, 
                entry = v148.props.entry, 
                launchExperienceEventContext = v148.props.launchExperienceEventContext, 
                fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000, 
                index = v148.props.index, 
                horizontalPadding = 0, 
                verticalPadding = 0, 
                height = l_playButtonHeight_0, 
                showButtonText = v156 > 1, 
                isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v148.props.entry.placeIdOverride else nil, 
                launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v148.props.entry.launchDataOverride else nil
            }), 
            thumbnailOverlay = if l_isHidden_0 then nil else if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v162 else if v148.props.tileBadges then v35.createFragment({
                SocialFeaturePill = v159, 
                Badge = v34.createElement(v8, {
                    tileBadgesByPosition = v148.props.tileBadges
                })
            }) else v159, 
            overflowMenu = v164, 
            footerMetadata = if l_isHidden_0 then nil else v157, 
            isUnifiedGameTile = true, 
            textSizeOffset = v148.props.textSizeOffset, 
            hideMetadata = v148.props.hideMetadata
        })
    });
end;
v95.render = function(v165) --[[ Line: 957 ]] --[[ Name: render ]]
    -- upvalues: l_DiscoveryAppLaunchTracker_0 (copy), l_withStyle_0 (copy)
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackTileRender();
    end;
    if v165.props.game == nil then
        return nil;
    else
        return l_withStyle_0(function(v166) --[[ Line: 967 ]]
            -- upvalues: v165 (copy)
            local l_ReducedMotion_0 = v166.Settings.ReducedMotion;
            return v165:renderContent(l_ReducedMotion_0, v166, v165.props.foundationTokens);
        end);
    end;
end;
v95.didMount = function(v168) --[[ Line: 973 ]] --[[ Name: didMount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v168.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v168.gameTileRef, v168.props.impressionsTag, v168.props.index);
    if not v168.props.useGridTile and v168.props.friendFooterEnabled and v168.props.hasInGameFriends then
        v168:setState({
            canDisplayFriendFooter = true
        });
    end;
    if v168.props.useGridTile then
        v168.loadWideThumbnail();
    end;
end;
v95.willUnmount = function(v169) --[[ Line: 988 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v169.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v169.gameTileRef, v169.props.impressionsTag, v169.props.index);
end;
v95.didUpdate = function(v170, v171) --[[ Line: 993 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    if v171.impressionsTag ~= v170.props.impressionsTag or v171.index ~= v170.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v170.gameTileRef, v171.impressionsTag, v171.index);
        l_ImpressionsTagUtility_0.AddTag(v170.gameTileRef, v170.props.impressionsTag, v170.props.index);
    end;
    if v170.props.useGridTile and v171.universeId ~= v170.props.universeId then
        v170.loadWideThumbnail();
    end;
    if not v170.props.useGridTile and (v171.friendFooterEnabled ~= v170.props.friendFooterEnabled or v171.hasInGameFriends ~= v170.props.hasInGameFriends) and v170.props.friendFooterEnabled and v170.props.hasInGameFriends then
        v170:setState({
            canDisplayFriendFooter = true
        });
    end;
end;
local function _(v172, v173) --[[ Line: 1018 ]] --[[ Name: formatRating ]]
    if v172 + v173 == 0 then
        return "--";
    else
        return tostring((math.floor(v172 / (v172 + v173) * 100 + 0.5))) .. "%";
    end;
end;
v95 = v36.connect(function(v175, v176) --[[ Line: 1026 ]]
    -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_GameInfosReducer_0 (copy), v13 (copy), v18 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), v31 (copy), v29 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_GameIconReducer_0 (copy), v27 (copy), v72 (copy), v28 (copy)
    local l_universeId_0 = v176.entry.universeId;
    local v178 = nil;
    if not l_FFlagLuaAppGameDetailsAttributionFix_0 then
        v178 = if v176.entry.navigationUniverseId and v176.entry.navigationUniverseId ~= "" and v176.entry.navigationUniverseId ~= "0" then v176.entry.navigationUniverseId else v176.entry.universeId;
    end;
    local v179 = v175.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    local v180 = v179 and v179.totalUpVotes or 0;
    local v181 = v179 and v179.totalDownVotes or 0;
    local v182 = v179 and v179.friendActivityTitle or nil;
    local v183 = nil;
    local v184 = nil;
    local v185 = v179 and v179.minimumAge or 0;
    local v186 = v179 and v179.ageRecommendationDisplayName or "";
    local v187 = nil;
    v187 = if v176.gameTileLayoutType == "Event" then v176.playButtonStyle ~= v13.PlayButtonStyleValues.Enabled else v176.gameTileLayoutType == "Wide" and v176.playButtonStyle == v13.PlayButtonStyleValues.Disabled;
    if v187 or v176.forceHideAgeRatings then
        v183 = false;
    elseif v185 ~= 0 and v186 ~= "" then
        v183 = true;
        v184 = v186;
    else
        v183 = false;
    end;
    local v188 = v18(v179, v176.topicId);
    local v189 = (if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then v31.getWideImageAssetId(v188) else v188 and v188.primaryMediaAsset and v188.primaryMediaAsset.wideImageAssetId) or v179 and v179.primaryWideAssetId or nil;
    local v190 = v29(v189, v176.entry.placeId);
    local v191 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        local v192 = v188 and v188.primaryMediaAsset and v188.primaryMediaAsset.wideVideoAssetId;
        v191 = if v192 then ("rbxassetid://%*"):format(v192) else nil;
    end;
    local v193 = v175[l_GameIconReducer_0.key][l_universeId_0] and v175[l_GameIconReducer_0.key][l_universeId_0].url or nil;
    local v194 = if v176.useGridTile then v190 else v27(v193, l_universeId_0);
    local v195 = if not not v176.useHoverTile or v176.useExperienceTileMetadata then if v72 then v28(v180, v181, nil, true) else v180 + v181 == 0 and "--" or tostring((math.floor(v180 / (v180 + v181) * 100 + 0.5))) .. "%" else nil;
    local v196 = v179 and v179.friendVisits or {};
    local v197 = if v179 and v179.friendVisitedString ~= "" then v179.friendVisitedString else nil;
    local v198 = v188 and v188.footer or nil;
    local v199 = v188 and v188.title or v179 and v179.name or "";
    return {
        game = v179, 
        universeId = l_universeId_0, 
        navigationUniverseId = if not l_FFlagLuaAppGameDetailsAttributionFix_0 then v178 else nil, 
        name = v199, 
        totalUpVotes = v180, 
        totalDownVotes = v181, 
        imageThumbnail = v194, 
        wideThumbnail = v190, 
        videoThumbnail = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v191 else nil, 
        friendActivityTitle = v182, 
        rating = v195, 
        showAgeRating = v183, 
        ageRatingText = v184, 
        friendVisits = v196, 
        friendVisitedString = v197, 
        hidePlayButton = v187, 
        footerLayoutData = v198
    };
end, function(v200) --[[ Line: 1131 ]]
    -- upvalues: v10 (copy), v14 (copy)
    return {
        openContextualMenu = function(v201, v202, v203) --[[ Line: 1133 ]] --[[ Name: openContextualMenu ]]
            -- upvalues: v200 (copy), v10 (ref)
            v200(v10(v201, v202, v203));
        end, 
        openSponsoredTooltip = function(v204) --[[ Line: 1136 ]] --[[ Name: openSponsoredTooltip ]]
            -- upvalues: v200 (copy), v14 (ref)
            return v200(v14(v204));
        end
    };
end)(v95);
if not l_FFlagLuaAppGameDetailsAttributionFix_0 then
    v95 = l_RoactServices_0.connect({
        networking = l_RoactNetworking_0
    })(v95);
end;
return function(v205) --[[ Line: 1148 ]]
    -- upvalues: v34 (copy), l_useTokens_0 (copy), v16 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), v22 (copy), l_useSelector_0 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), v20 (copy), v21 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v5 (copy), v17 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_VideoPlaybackCoordinator_0 (copy), v24 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_useOverflowMenuOpen_0 (copy), l_useTriggerFeedback_0 (copy), v91 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), v95 (ref), v37 (copy), v26 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_usePreferredInput_0 (copy), v25 (copy), v59 (copy), v92 (copy), v93 (copy), l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 (copy)
    local v206 = v34.useRef(nil);
    local v207 = l_useTokens_0();
    local l_useHoverTile_0 = v205.useHoverTile;
    local v209 = ("%*_%*_%*"):format(v205.impressionsTag or "", v205.index or "0", v205.gameTileLayoutType or "Narrow");
    if v205.impressionsTag == nil or v205.index == nil then
        l_useHoverTile_0 = false;
    end;
    local v210 = v16(v206, v209, l_useHoverTile_0);
    local v211 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v212 = v211 and true or v205.useHoverTile;
    local v213 = nil;
    v213 = if v205.useExperienceTileMetadata ~= nil then v205.useExperienceTileMetadata else v211;
    local v214 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v22(v205.entry.universeId, v205.topicId, v205.badgeOverride) else v22(v205.entry.universeId, v205.topicId);
    local v216 = l_useSelector_0(function(v215) --[[ Line: 1173 ]]
        return v215.LocalUserId;
    end);
    local v217 = nil;
    if not l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
        v217 = l_useSelector_0(function(v218) --[[ Line: 1179 ]]
            return v218.Users;
        end);
    end;
    local v220 = l_useSelector_0(function(v219) --[[ Line: 1184 ]]
        -- upvalues: v205 (copy)
        return v219.InGameUsersByGame[v205.entry.universeId];
    end);
    local v221 = v20(v216, v217, v220);
    local v222 = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v21(v216, v220) else nil;
    local v223, v224 = v34.useState(false);
    local v225 = nil;
    local v226 = nil;
    local v227 = nil;
    local v228 = nil;
    if l_FFlagLuaAppGameDetailsAttributionFix_0 then
        v225 = l_useRoactService_0(l_RoactNetworking_0);
        v226 = if v205.entry.navigationUniverseId and v205.entry.navigationUniverseId ~= "" and v205.entry.navigationUniverseId ~= "0" then v205.entry.navigationUniverseId else v205.entry.universeId;
        v228 = v34.useCallback(function() --[[ Line: 1209 ]]
            -- upvalues: v205 (copy), v5 (ref), v225 (ref)
            local l_entry_2 = v205.entry;
            if l_entry_2.isSponsored then
                v5(v225, l_entry_2.adId);
            end;
        end, {
            v225, 
            v205.entry.isSponsored, 
            v205.entry.adId
        });
        v227 = v34.useCallback(function(v230) --[[ Line: 1218 ]]
            -- upvalues: v205 (copy), v17 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v24 (ref), v226 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), l_IntervalPerformanceTracker_0 (ref), v228 (ref)
            if v205.isHovered then
                v17.default:reset();
            end;
            if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
                l_VideoPlaybackCoordinator_0.default:reset(v24.TileClicked, nil, v226, nil);
            end;
            if v230 then
                if l_FFlagLuaAppGameTileInteractionFeedback_0 and v205.onActivated then
                    v205.onActivated();
                end;
                local v231 = {
                    source = v205.source, 
                    index = v205.index, 
                    referralSource = v205.referralSource, 
                    onPeekViewClosed = v205.onPeekViewClosed, 
                    placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v205.entry.placeIdOverride else nil, 
                    experienceJoinData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and (not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v205.entry.launchDataOverride) then {
                        launchData = v205.entry.launchDataOverride
                    } else nil
                };
                if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                    l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
                end;
                v205.navigateToGameDetails(v226, v231);
                v205.reportGameDetailOpened(v205.index, v226);
                v228();
            end;
        end, {
            v205.isHovered, 
            v205.index, 
            v205.videoAnalytics, 
            v205.onActivated, 
            v205.source, 
            v205.referralSource, 
            v205.onPeekViewClosed, 
            v205.navigateToGameDetails, 
            v205.reportGameDetailOpened, 
            v226, 
            v228, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v205.entry.placeIdOverride else nil, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v205.entry.launchDataOverride else nil
        });
    end;
    local v232 = l_useOverflowMenuOpen_0(v209);
    local v233 = l_useTriggerFeedback_0();
    local v234 = v34.useMemo(function() --[[ Line: 1280 ]]
        -- upvalues: v91 (ref), v205 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref)
        return v91({
            isSponsored = v205.entry.isSponsored, 
            enableExplicitFeedback = v205.enableExplicitFeedback, 
            enableSponsoredFeedback = v205.enableSponsoredFeedback, 
            enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v205.enableReportAd else nil
        });
    end, {
        v205.entry.isSponsored, 
        v205.enableExplicitFeedback, 
        v205.enableSponsoredFeedback, 
        if l_FFlagLuaAppEnableSponsoredReportAd_0 then v205.enableReportAd else nil
    });
    local v235 = v34.createElement(v95, v37.Dictionary.join(v205, {
        useExperienceTileMetadata = v213, 
        hasBackground = v212, 
        hoverRef = v206, 
        isHoverSupported = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then l_useHoverTile_0 else nil, 
        isHovered = v210, 
        isVideoPlaying = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v223 else nil, 
        tileBadges = v214, 
        foundationTokens = v207, 
        users = v217, 
        inGameUsersByGame = v220, 
        hasInGameFriends = v221, 
        inGameUserIds = if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then v222 else nil, 
        networking = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v225 else nil, 
        navigationUniverseId = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v226 else nil, 
        onGameTileActivated = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v227 else nil, 
        recordSponsoredGameClick = if l_FFlagLuaAppGameDetailsAttributionFix_0 then v228 else nil, 
        overflowMenuOpen = v232, 
        hoverKey = v209, 
        triggerFeedback = v233, 
        availableMenuItems = v234
    }));
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        local v236 = v26(v205.entry.universeId, v205.topicId);
        local v237 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then l_usePreferredInput_0() else nil;
        if v236 then
            return v34.createElement(v34.Fragment, {}, {
                GameTile = v235, 
                VideoPlaybackDetector = v34.createElement(v25, {
                    videoKey = v209, 
                    itemIndex = v205.index, 
                    universeId = v205.entry.universeId, 
                    tileRef = v206, 
                    isHoverSupported = l_useHoverTile_0, 
                    isHovered = v210, 
                    autoplay = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v237 == v59.Input.Touch else nil, 
                    onPlaybackChange = v224, 
                    videoAnalytics = v205.videoAnalytics, 
                    videoDwellTimeInSec = v92, 
                    videoVisiblePercent = v93, 
                    pageContext = if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then v205.appPage else nil
                })
            });
        end;
    end;
    return v235;
end;