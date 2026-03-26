local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local v2 = require(l_script_FirstAncestor_0.formatExperienceThumbnail);
local v3 = require(l_script_FirstAncestor_0.useIsHoveredTile);
local v4 = require(l_script_FirstAncestor_0.useNavigateToGameDetails);
local v5 = require(l_script_FirstAncestor_0.GameTileOverflowMenu);
local v6 = require(l_script_FirstAncestor_0.Overlays.GameTileThumbnailBadges);
local v7 = require(l_script_FirstAncestor_0.getAvailableGameTileOverflowMenuItems);
local v8 = require(l_script_FirstAncestor_0.TwoByOneGameTileTelemetry);
local v9 = require(l_script_FirstAncestor_0.HiddenGameTile.HiddenTileContent);
local v10 = require(l_script_FirstAncestor_0.ItemLayoutDataParsingUtils);
local v11 = require(l_script_FirstAncestor_0.HoverTileCoordinator);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v13 = require(l_Parent_0.React);
local v14 = require(l_Parent_0.Foundation);
local l_ButtonSize_0 = v14.Enums.ButtonSize;
local l_useTokens_0 = v14.Hooks.useTokens;
local l_Image_0 = v14.Image;
local l_InputSize_0 = v14.Enums.InputSize;
local v19 = require(l_Parent_0.Responsive);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v22 = require(l_Parent_0.AppBlox);
local l_getOverflowMenuSignalStore_0 = v22.getOverflowMenuSignalStore;
local l_useOverflowMenuOpen_0 = v22.useOverflowMenuOpen;
local l_useTriggerFeedback_0 = require(l_Parent_0.InteractionFeedback).useTriggerFeedback;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_GetTextSize_0 = require(l_Parent_0.Style).GetTextSize;
local v28 = require(l_Parent_0.GamePlayButton);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_PlayButton_0 = v28.PlayButton;
local l_useOnPlayButtonCallback_0 = require(l_Parent_0.GamePlayButton).useOnPlayButtonCallback;
local l_usePlayButtonState_0 = require(l_Parent_0.GamePlayButton).usePlayButtonState;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v35 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v35.RoactNetworking;
local l_AppSessionService_0 = v35.AppSessionService;
local v38 = require(l_Parent_0.RobloxAppSessionization);
local l_SetGamePlaySession_0 = v38.SetGamePlaySession;
local l_SessionType_0 = v38.SessionType;
local v41 = require(l_Parent_0.SharedFlags);
local v42 = require(l_Parent_0.DiscoveryAnalytics);
local l_sponsoredGamesRecordClick_0 = v42.Requests.sponsoredGamesRecordClick;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v45 = require(l_script_FirstAncestor_0.Overlays.useValidTileBadges);
local v46 = game:DefineFastInt("LuaAppTwoByOneTileSmallScreenBreakpoint", 600);
local v47 = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentLandscape", 20);
local v48 = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentSquare", 36);
local v49 = game:DefineFastInt("LuaAppTwoByOneTileGradientStartOpacityPercent", 30);
local v50 = game:DefineFastInt("LuaAppTwoByOneTileGradientEndOpacityPercent", 100);
local v51 = game:DefineFastInt("LuaAppTwoByOneTileGradientWidthPercent", 50);
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v41.FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 = v41.FFlagLuaAppIgnoreEmptyStringWideThumbnail;
local l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 = v41.FFlagLuaAppFixTwoByOneJoinButtonWidth;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = v41.FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppCustomSpawnNonNilCheck_0 = v41.FFlagLuaAppCustomSpawnNonNilCheck;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = v41.FFlagLuaAppTwoByOneTileExperimentVariants;
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = v41.FFlagLuaAppFixExplicitFeedbackTelemetry;
local l_FFlagLuaAppHapticTriggeredTelemetry_0 = v41.FFlagLuaAppHapticTriggeredTelemetry;
local l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 = v41.FFlagLuaAppFixTwoByOneOverflowMenuTelemetry;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = v41.FFlagLuaAppTwoByOneTileTelemetryFix;
local l_gameTileOverflowMenuAction_0 = v42.Events.gameTileOverflowMenuAction;
local v63 = Color3.new(1, 1, 1);
local v64 = Color3.new(0, 0, 0);
local v65 = v47 / 100;
local v66 = v48 / 100;
local v67 = v49 / 100;
local v68 = v50 / 100;
local v69 = v51 / 100;
local v70 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
    JoinGame = "JoinGame", 
    OpenEdp = "OpenEdp"
} else nil;
local v71 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
    StandardLight = "StandardLight", 
    OverMedia = "OverMedia"
} else nil;
local v72 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
    Default = {
        ctaStyle = nil, 
        onCtaActivation = v70.JoinGame, 
        onTileActivation = v70.OpenEdp
    }, 
    Variant1 = {
        ctaStyle = nil, 
        onCtaActivation = nil, 
        onTileActivation = v70.JoinGame
    }, 
    Variant2 = {
        ctaStyle = v71.StandardLight, 
        onCtaActivation = v70.OpenEdp, 
        onTileActivation = v70.JoinGame
    }, 
    Variant3 = {
        ctaStyle = v71.OverMedia, 
        onCtaActivation = v70.OpenEdp, 
        onTileActivation = v70.JoinGame
    }
} else nil;
return function(v73) --[[ Line: 172 ]]
    -- upvalues: v4 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppSessionService_0 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), v72 (copy), l_useTokens_0 (copy), v19 (copy), v46 (copy), l_ButtonSize_0 (copy), l_InputSize_0 (copy), l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 (copy), v13 (copy), l_GetTextSize_0 (copy), v71 (copy), v65 (copy), v66 (copy), v45 (copy), l_useTriggerFeedback_0 (copy), l_useOverflowMenuOpen_0 (copy), v3 (copy), l_sponsoredGamesRecordClick_0 (copy), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GameCollectionItemTypes_0 (copy), v8 (copy), v11 (copy), v7 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_usePlayButtonState_0 (copy), l_useOnPlayButtonCallback_0 (copy), v70 (copy), l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), v1 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), v10 (copy), v2 (copy), l_ImpressionsTagUtility_0 (copy), v9 (copy), v69 (copy), v63 (copy), v67 (copy), v68 (copy), v64 (copy), v6 (copy), l_Image_0 (copy), l_PlayButton_0 (copy), v5 (copy)
    local v74 = v4();
    local v75 = l_useRoactService_0(l_RoactNetworking_0);
    local v76 = l_useRoactService_0(l_AppSessionService_0);
    local v77 = l_useLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored", 
        joinButtonText = "Common.VisitGame.Label.Play"
    });
    local v78 = nil;
    local v79 = nil;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v78 = if v73.ctaText then v73.ctaText else v77.joinButtonText;
        v79 = v72[v73.tileVariant] or v72.Default;
    end;
    local v80 = l_useTokens_0();
    local v81 = UDim.new(0, v80.Radius.Medium);
    local v82 = v19.useResponsive({
        {
            Key = "Smaller", 
            maxWidth = v46
        }
    }) == "Smaller";
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    local v91 = nil;
    if v82 then
        v83 = v80.Padding.Medium;
        v84 = v80.Padding.Medium;
        v85 = v80.Typography.HeadingSmall;
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v86 = v80.Typography.BodySmall;
            v87 = v80.Typography.CaptionSmall;
        else
            v86 = v80.Typography.BodyMedium;
        end;
        v88 = v80.Gap.XXSmall;
        v89 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_ButtonSize_0.Small else l_InputSize_0.Small;
        v90 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v80.Size.Size_800 else nil;
        v91 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v80.Typography.TitleSmall else nil;
    else
        v83 = v80.Padding.Large;
        v84 = v80.Padding.Large;
        v85 = v80.Typography.HeadingMedium;
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v86 = v80.Typography.BodyMedium;
            v87 = v80.Typography.CaptionMedium;
        else
            v86 = v80.Typography.BodyLarge;
        end;
        v88 = v80.Gap.XSmall;
        v89 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_ButtonSize_0.Medium else l_InputSize_0.Medium;
        v90 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v80.Size.Size_1000 else nil;
        v91 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v80.Typography.TitleMedium else nil;
    end;
    local v92 = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v80.Padding.Large * 4 else nil;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v91 = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v80.Typography.LabelLarge else nil;
    end;
    local v94 = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v13.useMemo(function() --[[ Line: 243 ]]
        -- upvalues: l_GetTextSize_0 (ref), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), v78 (ref), v77 (copy), v91 (ref), v92 (copy)
        local v93 = l_GetTextSize_0(if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v78 else v77.joinButtonText, v91.FontSize, v91.Font, Vector2.new(1e999, 1e999));
        return UDim.new(0, v93.X + v92);
    end, {
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v78 else v77.joinButtonText, 
        v91, 
        v92
    }) else nil;
    local v95 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then if v79.ctaStyle == v71.StandardLight then v80.Color.Extended.White.White_20.Color3 else v80.LightMode.ActionOverMedia.Background.Color3 else nil;
    local v96 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then if v79.ctaStyle == v71.StandardLight then v80.Color.Extended.White.White_20.Transparency else v80.LightMode.ActionOverMedia.Background.Transparency else nil;
    local l_LabelSmall_0 = v80.Typography.LabelSmall;
    local l_White_90_0 = v80.Color.Extended.White.White_90;
    local l_Small_0 = v80.Padding.Small;
    local l_XSmall_0 = v80.Padding.XSmall;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v87 = v80.Typography.BodySmall;
    end;
    local v101 = tonumber(v73.logoAspectRatio);
    local v102 = if v101 and v101 > 0 then v101 else 1;
    local v103 = if v102 == 3 then v65 else v66;
    local l_universeId_0 = v73.universeId;
    local l_placeId_0 = v73.placeId;
    local v106 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v45(l_universeId_0, v73.topicId, v73.badgeOverride) else nil;
    local l_hoverKey_0 = v73.hoverKey;
    local v108, v109 = v13.useState(false);
    local v110 = v13.useRef(nil);
    local v111 = l_useTriggerFeedback_0();
    local v112 = l_useOverflowMenuOpen_0(l_hoverKey_0);
    local v113 = v3(v110, l_hoverKey_0, true);
    local v114 = v13.useRef(false);
    local v115 = v13.useCallback(function() --[[ Line: 306 ]]
        -- upvalues: v73 (copy), l_sponsoredGamesRecordClick_0 (ref), v75 (copy)
        if v73.isSponsored and v73.adId then
            l_sponsoredGamesRecordClick_0(v75, v73.adId);
        end;
    end, {
        v75, 
        v73.isSponsored, 
        v73.adId
    });
    local v116 = v13.useCallback(function() --[[ Line: 312 ]]
        -- upvalues: v114 (copy)
        v114.current = false;
    end, {});
    local v118 = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then nil else v13.useCallback(function() --[[ Line: 318 ]]
        -- upvalues: v114 (copy), v111 (copy), v73 (copy), l_getOverflowMenuSignalStore_0 (ref), l_hoverKey_0 (copy)
        local l_current_0 = v114.current;
        v114.current = true;
        if l_current_0 == false then
            v111("TwoByOneTileLongPress", "Press", v73.appPage, nil);
            l_getOverflowMenuSignalStore_0().openMenu(l_hoverKey_0);
        end;
    end, {
        l_hoverKey_0, 
        v73.appPage, 
        v111
    });
    local v120 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v13.useCallback(function() --[[ Line: 329 ]]
        -- upvalues: l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v73 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), v74 (copy), l_universeId_0 (copy), v8 (ref)
        local v119 = nil;
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then
            v119 = {
                index = v73.index, 
                placeIdOverride = v73.placeIdOverride, 
                experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                    launchData = if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v73.launchDataOverride then v73.launchDataOverride else nil, 
                    tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                    nativeAdData = v73.adId
                } else if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v73.launchDataOverride then {
                    launchData = v73.launchDataOverride
                } else nil
            };
        end;
        v74(l_universeId_0, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v119 else if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
            index = v73.index, 
            experienceJoinData = {
                tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                nativeAdData = v73.adId
            }
        } else {
            index = v73.index
        });
        v8.logTwoByOneTileViewGameDetailsActivated();
        if v73.reportGameDetailOpened then
            if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then
                v73.reportGameDetailOpened(v73.index, l_universeId_0);
                return;
            else
                v73.reportGameDetailOpened(v73.index, l_universeId_0, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile);
            end;
        end;
    end, {
        v74, 
        l_universeId_0, 
        v73.index, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v73.placeIdOverride else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v73.launchDataOverride else nil, 
        v73.reportGameDetailOpened, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v73.adId else nil
    }) else nil;
    local v121 = nil;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v121 = v13.useCallback(function() --[[ Line: 394 ]]
            -- upvalues: v114 (copy), v113 (copy), v11 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v73 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), v74 (copy), l_universeId_0 (copy), v8 (ref), v115 (copy)
            if v114.current then
                v114.current = false;
                return;
            else
                if v113 then
                    v11.default:reset();
                end;
                local v122 = nil;
                if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then
                    v122 = {
                        index = v73.index, 
                        placeIdOverride = v73.placeIdOverride, 
                        experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                            launchData = if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v73.launchDataOverride then v73.launchDataOverride else nil, 
                            tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                            nativeAdData = v73.adId
                        } else if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v73.launchDataOverride then {
                            launchData = v73.launchDataOverride
                        } else nil
                    };
                end;
                v74(l_universeId_0, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v122 else if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                    index = v73.index, 
                    experienceJoinData = {
                        tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                        nativeAdData = v73.adId
                    }
                } else {
                    index = v73.index
                });
                v8.logTwoByOneTileActivated();
                if v73.reportGameDetailOpened then
                    if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then
                        v73.reportGameDetailOpened(v73.index, l_universeId_0);
                    else
                        v73.reportGameDetailOpened(v73.index, l_universeId_0, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile);
                    end;
                end;
                v115();
                return;
            end;
        end, {
            v74, 
            l_universeId_0, 
            v73.index, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v73.placeIdOverride else nil, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v73.launchDataOverride else nil, 
            v73.reportGameDetailOpened, 
            v115, 
            v113, 
            if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v73.adId else nil
        });
    end;
    local v123 = v13.useCallback(function() --[[ Line: 469 ]]
        -- upvalues: v109 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), v73 (copy)
        v109(true);
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and v73.onSelectionGained then
            v73.onSelectionGained();
        end;
    end, {
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v73.onSelectionGained else nil
    });
    local v124 = v13.useCallback(function() --[[ Line: 481 ]]
        -- upvalues: v109 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), v73 (copy)
        v109(false);
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and v73.onSelectionLost then
            v73.onSelectionLost();
        end;
    end, {
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v73.onSelectionLost else nil
    });
    local l_isSponsored_0 = v73.isSponsored;
    local v126 = v13.useMemo(function() --[[ Line: 493 ]]
        -- upvalues: v7 (ref), l_isSponsored_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v73 (copy)
        return v7({
            isSponsored = l_isSponsored_0, 
            enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v73.enableSponsoredFeedback else l_isSponsored_0, 
            enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v73.enableReportAd else l_isSponsored_0, 
            enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v73.enableExplicitFeedback else nil
        });
    end, {
        l_isSponsored_0, 
        v73.enableSponsoredFeedback, 
        v73.enableReportAd, 
        v73.enableExplicitFeedback
    });
    local v127 = (not not v113 or v108 or v112) and next(v126) ~= nil;
    local v131 = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v13.useCallback(function(v128, v129) --[[ Line: 509 ]]
        -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v73 (copy), l_universeId_0 (copy), l_gameTileOverflowMenuAction_0 (ref)
        local v130 = {
            ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v73.appPage, 
            universeId = l_universeId_0, 
            sortId = v73.topicId, 
            actionType = v128 and "GameTileOverflowMenuClosed" or "GameTileOverflowMenuOpened", 
            availableMenuItems = v129
        };
        l_gameTileOverflowMenuAction_0(v130, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v73.appPage or "Unknown" else nil);
    end, {
        l_universeId_0, 
        v73.appPage, 
        v73.topicId
    }) else nil;
    if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then
        v118 = v13.useCallback(function() --[[ Line: 529 ]]
            -- upvalues: v114 (copy), v126 (copy), v111 (copy), v112 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (ref), l_universeId_0 (copy), v73 (copy), l_getOverflowMenuSignalStore_0 (ref), l_hoverKey_0 (copy), v131 (copy)
            local l_current_1 = v114.current;
            v114.current = true;
            if l_current_1 == false and next(v126) ~= nil then
                if v111 and not v112 then
                    local v133 = if l_FFlagLuaAppHapticTriggeredTelemetry_0 then {
                        universeId = l_universeId_0, 
                        sortId = v73.topicId
                    } else nil;
                    v111("TwoByOneTileLongPress", "Press", if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v73.appPage or "Unknown" else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v133 else nil);
                end;
                l_getOverflowMenuSignalStore_0().openMenu(l_hoverKey_0);
                local v134 = {};
                for v135, _ in v126 do
                    table.insert(v134, v135);
                end;
                v131(false, table.concat(v134, ","));
            end;
        end, {
            l_hoverKey_0, 
            v73.appPage, 
            v73.topicId, 
            v111, 
            v126, 
            v112, 
            l_universeId_0, 
            v131
        });
    end;
    local v137 = nil;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v137 = v13.useCallback(function() --[[ Line: 573 ]]
            -- upvalues: v8 (ref)
            v8.logTwoByOneTileGameJoinInitiated();
        end, {});
    end;
    local v139 = v13.useCallback(function() --[[ Line: 579 ]]
        -- upvalues: v76 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), v113 (copy), v11 (ref), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), v115 (copy), v73 (copy), l_placeId_0 (copy), l_universeId_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref)
        if v76 then
            l_SetGamePlaySession_0(v76, l_SessionType_0.StructuralIdentifier.GamePlayFromHoverTile, true);
        end;
        if v113 then
            v11.default:reset();
        end;
        if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v115();
        end;
        if v73.reportExperienceLaunched then
            local v138 = {
                placeId = l_placeId_0, 
                universeId = l_universeId_0, 
                adId = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v73.adId else nil, 
                tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile else nil, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v73.placeIdOverride else nil, 
                launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v73.launchDataOverride else nil
            };
            v73.reportExperienceLaunched(v138, v73.appPage, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, v73.index);
        end;
    end, {
        if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v115 else nil, 
        v76, 
        v73.reportExperienceLaunched, 
        l_placeId_0, 
        l_universeId_0, 
        v73.appPage, 
        v73.index, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v73.adId else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v73.placeIdOverride else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v73.launchDataOverride else nil, 
        v113
    });
    local v140 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_usePlayButtonState_0(v75, l_universeId_0) else nil;
    local v141 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_useOnPlayButtonCallback_0(l_universeId_0, v73.appPage, "TwoByOneTile", nil, "TwoByOneTile", if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
        launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v73.launchDataOverride else nil, 
        tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
        nativeAdData = v73.adId
    } else if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v73.launchDataOverride then {
        launchData = v73.launchDataOverride
    } else nil, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v73.placeIdOverride then v73.placeIdOverride else v73.placeId) else nil;
    local v142 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v13.useCallback(function() --[[ Line: 657 ]]
        -- upvalues: v8 (ref), v115 (copy)
        v8.logTwoByOneTileGameJoinInitiated();
        v8.logTwoByOneTileCtaActivated();
        v115();
    end, {
        v115
    }) else nil;
    local v143 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v13.useCallback(function() --[[ Line: 665 ]]
        -- upvalues: v8 (ref), v115 (copy), v120 (copy)
        v8.logTwoByOneTileCtaActivated();
        v115();
        v120();
    end, {
        v115, 
        v120
    }) else nil;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v137 = v13.useCallback(function() --[[ Line: 674 ]]
            -- upvalues: v8 (ref), v141 (copy), v140 (copy), v139 (copy)
            v8.logTwoByOneTileGameJoinInitiated();
            v141(v140.playButtonState, v139);
        end, {
            v141, 
            v140.playButtonState, 
            v139
        });
    end;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v121 = v13.useCallback(function() --[[ Line: 689 ]]
            -- upvalues: v114 (copy), v113 (copy), v11 (ref), v8 (ref), v115 (copy), v79 (ref), v70 (ref), v120 (copy), v137 (ref)
            if v114.current then
                v114.current = false;
                return;
            else
                if v113 then
                    v11.default:reset();
                end;
                v8.logTwoByOneTileActivated();
                v115();
                if v79.onTileActivation == v70.OpenEdp then
                    v120();
                    return;
                else
                    if v79.onTileActivation == v70.JoinGame then
                        v137();
                    end;
                    return;
                end;
            end;
        end, {
            v113, 
            v79.onTileActivation, 
            v120, 
            v137, 
            v115
        });
    end;
    local v145 = l_useSelector_0(function(v144) --[[ Line: 718 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), l_universeId_0 (copy)
        return v144.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    end);
    local v146 = v1(v145, v73.topicId);
    local v147 = (if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then v10.getWideImageAssetId(v146) else v146 and v146.primaryMediaAsset and v146.primaryMediaAsset.wideImageAssetId) or v145 and v145.primaryWideAssetId or nil;
    local v148 = v2(v147, l_placeId_0, true);
    local v149 = v145 and v145.ageRecommendationDisplayName or nil;
    local v150 = v13.useRef(nil);
    v13.useEffect(function() --[[ Line: 732 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v150 (copy), v73 (copy)
        l_ImpressionsTagUtility_0.AddTag(v150, v73.impressionsTag, v73.index);
        return function() --[[ Line: 734 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v150 (ref), v73 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v150, v73.impressionsTag, v73.index);
        end;
    end, {
        v73.impressionsTag, 
        v73.index
    });
    if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v73.isHidden then
        return v13.createElement("Frame", {
            LayoutOrder = v73.layoutOrder, 
            ZIndex = v73.zIndex, 
            BackgroundTransparency = 1
        }, {
            TwoByOneTileContainer = v13.createElement("TextButton", {
                Size = v73.size or UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ref = v110, 
                Selectable = false
            }, {
                HiddenTileContent = v13.createElement(v9, {
                    appPage = v73.appPage, 
                    collectionId = v73.topicId, 
                    setGameHidden = v73.setGameHidden, 
                    universeId = l_universeId_0, 
                    parentRef = v110, 
                    hiddenTileType = nil, 
                    isSponsored = l_isSponsored_0
                })
            })
        });
    else
        return v13.createElement("Frame", {
            LayoutOrder = v73.layoutOrder, 
            ZIndex = v73.zIndex, 
            BackgroundTransparency = 1, 
            ref = v150
        }, {
            TwoByOneTileContainer = v13.createElement("TextButton", {
                Size = v73.size or UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Text = "", 
                AutoButtonColor = false, 
                ref = v110, 
                [v13.Event.TouchLongPress] = v118, 
                [v13.Event.Activated] = v121, 
                [v13.Event.SelectionGained] = v123, 
                [v13.Event.SelectionLost] = v124, 
                [v13.Change.GuiState] = v116
            }, {
                BackgroundImage = v13.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = v148, 
                    ScaleType = Enum.ScaleType.Crop, 
                    ZIndex = 0
                }, {
                    UICorner = v13.createElement("UICorner", {
                        CornerRadius = v81
                    })
                }), 
                GradientOverlayLeft = v13.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(v69, 0, 1, 0), 
                    BackgroundColor3 = v63, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    ZIndex = 1
                }, {
                    UICorner = v13.createElement("UICorner", {
                        CornerRadius = v81
                    }), 
                    UIGradientLeft = v13.createElement("UIGradient", {
                        Rotation = 0, 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, v67), 
                            NumberSequenceKeypoint.new(1, v68)
                        }), 
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, v64), 
                            ColorSequenceKeypoint.new(1, v64)
                        })
                    })
                }), 
                GradientOverlayBottom = v13.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, v69, 0), 
                    BackgroundColor3 = v63, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    ZIndex = 1
                }, {
                    UICorner = v13.createElement("UICorner", {
                        CornerRadius = v81
                    }), 
                    UIGradientBottom = v13.createElement("UIGradient", {
                        Rotation = 90, 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, v68), 
                            NumberSequenceKeypoint.new(1, v67)
                        }), 
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, v64), 
                            ColorSequenceKeypoint.new(1, v64)
                        })
                    })
                }), 
                TileBadge = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v106 and v13.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                }, {
                    Badge = v13.createElement(v6, {
                        tileBadgesByPosition = v106
                    })
                }) else nil, 
                ContentOverlay = v13.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and 3 or 2
                }, {
                    UIPadding = v13.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v83), 
                        PaddingRight = UDim.new(0, v83), 
                        PaddingTop = UDim.new(0, v84), 
                        PaddingBottom = UDim.new(0, v84)
                    }), 
                    SponsoredBadge = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then nil else l_isSponsored_0 and v13.createElement("Frame", {
                        Position = UDim2.new(0, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = l_White_90_0.Color3, 
                        BackgroundTransparency = l_White_90_0.Transparency, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        UICorner = v13.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), 
                        UIPadding = v13.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, l_XSmall_0), 
                            PaddingBottom = UDim.new(0, l_XSmall_0), 
                            PaddingLeft = UDim.new(0, l_Small_0), 
                            PaddingRight = UDim.new(0, l_Small_0)
                        }), 
                        BadgeText = v13.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Text = v77.sponsoredText, 
                            Font = l_LabelSmall_0.Font, 
                            TextSize = l_LabelSmall_0.FontSize, 
                            TextColor3 = v80.LightMode.Content.Emphasis.Color3, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Center
                        })
                    }), 
                    Logo = (not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 or v73.logoImageAssetId) and v13.createElement(l_Image_0, {
                        Position = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        Image = "rbxassetid://" .. tostring(v73.logoImageAssetId), 
                        Size = UDim2.new(1, 0, v103, 0), 
                        aspectRatio = v102
                    }), 
                    HeaderFrame = v13.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Position = UDim2.new(0, 0, 0.47, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        UIListLayout = v13.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v88)
                        }), 
                        Headline = v13.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Text = v73.headline or "", 
                            Font = v85.Font, 
                            TextSize = v85.FontSize, 
                            TextColor3 = v63, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            TextWrapped = true
                        }), 
                        Subtitle = v13.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Text = v73.subtitle or "", 
                            Font = v86.Font, 
                            TextSize = v86.FontSize, 
                            TextColor3 = v63, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            TextWrapped = true
                        })
                    }), 
                    JoinButtonContainer = (not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 or v79.onCtaActivation == v70.JoinGame) and v13.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 0, 1, 0), 
                        AnchorPoint = Vector2.new(0, 1)
                    }, {
                        JoinButton = v13.createElement(l_PlayButton_0, {
                            universeId = l_universeId_0, 
                            placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v73.placeIdOverride then v73.placeIdOverride else l_placeId_0, 
                            referralSource = v73.appPage, 
                            eventContext = "TwoByOneTile", 
                            launchSource = l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and "TwoByOneTile" or nil, 
                            playableText = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v78 else v77.joinButtonText, 
                            hidePlayableIcon = true, 
                            buttonSize = v89, 
                            width = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v94 else nil, 
                            onActivated = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v142 else v137, 
                            reportExperienceLaunched = v139, 
                            experienceJoinData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v73.launchDataOverride then {
                                launchData = v73.launchDataOverride
                            } else nil
                        })
                    }), 
                    ViewGameDetailsButton = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v79.onCtaActivation == v70.OpenEdp and v13.createElement("TextButton", {
                        Size = UDim2.new(v94.Scale, v94.Offset, 0, v90), 
                        Position = UDim2.new(0, 0, 1, 0), 
                        AnchorPoint = Vector2.new(0, 1), 
                        BackgroundColor3 = v95, 
                        BackgroundTransparency = v96, 
                        Text = v78, 
                        TextColor3 = v80.LightMode.ActionOverMedia.Foreground.Color3, 
                        Font = v91.Font, 
                        TextSize = v91.FontSize, 
                        [v13.Event.Activated] = v143
                    }, {
                        UICorner = v13.createElement("UICorner", {
                            CornerRadius = UDim.new(0, v80.Radius.Medium)
                        })
                    }) else nil, 
                    BottomRightLabel = v13.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        Size = UDim2.new(0, 0, 0, v87.FontSize * v87.LineHeight), 
                        BackgroundTransparency = 1, 
                        Text = v149, 
                        TextSize = v87.FontSize, 
                        Font = v87.Font, 
                        TextColor3 = v80.Color.Extended.Gray.Gray_400.Color3, 
                        TextXAlignment = Enum.TextXAlignment.Right, 
                        TextTruncate = Enum.TextTruncate.SplitWord, 
                        AnchorPoint = Vector2.new(1, 1), 
                        Position = UDim2.new(1, 0, 1, 0)
                    })
                }), 
                OverflowMenuContainer = v127 and v13.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and 4 or 3
                }, {
                    OverflowMenu = v13.createElement(v5, {
                        isHovered = v113, 
                        isSelected = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v108 else nil, 
                        universeId = l_universeId_0, 
                        collectionId = v73.topicId, 
                        appPage = v73.appPage, 
                        setGameHidden = v73.setGameHidden or function() --[[ Line: 1035 ]]

                        end, 
                        menuKey = l_hoverKey_0, 
                        menuOpen = v112, 
                        onMenuOpenChanged = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v131 else nil, 
                        parentRef = v110, 
                        isSponsored = v73.isSponsored, 
                        payerName = v73.payerName, 
                        sponsoredUserCohort = v73.sponsoredUserCohort, 
                        adId = v73.adId, 
                        availableMenuItems = v126
                    })
                })
            })
        });
    end;
end;