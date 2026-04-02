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
local v52 = game:DefineFastFlag("LuaAppTwoByOneTileHeadlineFontUpdate", false);
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
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = v41.FFlagLuaAppSupportPrimaryMediaContentMetadata;
local l_gameTileOverflowMenuAction_0 = v42.Events.gameTileOverflowMenuAction;
local v65 = Color3.new(1, 1, 1);
local v66 = Color3.new(0, 0, 0);
local v67 = v47 / 100;
local v68 = v48 / 100;
local v69 = v49 / 100;
local v70 = v50 / 100;
local v71 = v51 / 100;
local v72 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
    JoinGame = "JoinGame", 
    OpenEdp = "OpenEdp"
} else nil;
local v73 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
    StandardLight = "StandardLight", 
    OverMedia = "OverMedia"
} else nil;
local v74 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
    Default = {
        ctaStyle = nil, 
        onCtaActivation = v72.JoinGame, 
        onTileActivation = v72.OpenEdp
    }, 
    Variant1 = {
        ctaStyle = nil, 
        onCtaActivation = nil, 
        onTileActivation = v72.JoinGame
    }, 
    Variant2 = {
        ctaStyle = v73.StandardLight, 
        onCtaActivation = v72.OpenEdp, 
        onTileActivation = v72.JoinGame
    }, 
    Variant3 = {
        ctaStyle = v73.OverMedia, 
        onCtaActivation = v72.OpenEdp, 
        onTileActivation = v72.JoinGame
    }
} else nil;
return function(v75) --[[ Line: 170 ]]
    -- upvalues: v4 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppSessionService_0 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), v74 (copy), l_useTokens_0 (copy), v19 (copy), v46 (copy), v52 (copy), l_ButtonSize_0 (copy), l_InputSize_0 (copy), l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 (copy), v13 (copy), l_GetTextSize_0 (copy), v73 (copy), v67 (copy), v68 (copy), v45 (copy), l_useTriggerFeedback_0 (copy), l_useOverflowMenuOpen_0 (copy), v3 (copy), l_sponsoredGamesRecordClick_0 (copy), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GameCollectionItemTypes_0 (copy), v8 (copy), v11 (copy), v7 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_usePlayButtonState_0 (copy), l_useOnPlayButtonCallback_0 (copy), v72 (copy), l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), v1 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), v10 (copy), v2 (copy), l_ImpressionsTagUtility_0 (copy), v9 (copy), v71 (copy), v65 (copy), v69 (copy), v70 (copy), v66 (copy), v6 (copy), l_Image_0 (copy), l_PlayButton_0 (copy), v5 (copy)
    local v76 = v4();
    local v77 = l_useRoactService_0(l_RoactNetworking_0);
    local v78 = l_useRoactService_0(l_AppSessionService_0);
    local v79 = l_useLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored", 
        joinButtonText = "Common.VisitGame.Label.Play"
    });
    local v80 = nil;
    local v81 = nil;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v80 = if v75.ctaText then v75.ctaText else v79.joinButtonText;
        v81 = v74[v75.tileVariant] or v74.Default;
    end;
    local v82 = l_useTokens_0();
    local v83 = UDim.new(0, v82.Radius.Medium);
    local v84 = v19.useResponsive({
        {
            Key = "Smaller", 
            maxWidth = v46
        }
    }) == "Smaller";
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    local v91 = nil;
    local v92 = nil;
    local v93 = nil;
    if v84 then
        v85 = v82.Padding.Medium;
        v86 = v82.Padding.Medium;
        v87 = if v52 then v82.Typography.TitleLarge else v82.Typography.HeadingSmall;
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v88 = v82.Typography.BodySmall;
            v89 = v82.Typography.CaptionSmall;
        else
            v88 = v82.Typography.BodyMedium;
        end;
        v90 = v82.Gap.XXSmall;
        v91 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_ButtonSize_0.Small else l_InputSize_0.Small;
        v92 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v82.Size.Size_800 else nil;
        v93 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v82.Typography.TitleSmall else nil;
    else
        v85 = v82.Padding.Large;
        v86 = v82.Padding.Large;
        v87 = v82.Typography.HeadingMedium;
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v88 = v82.Typography.BodyMedium;
            v89 = v82.Typography.CaptionMedium;
        else
            v88 = v82.Typography.BodyLarge;
        end;
        v90 = v82.Gap.XSmall;
        v91 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_ButtonSize_0.Medium else l_InputSize_0.Medium;
        v92 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v82.Size.Size_1000 else nil;
        v93 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v82.Typography.TitleMedium else nil;
    end;
    local v94 = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v82.Padding.Large * 4 else nil;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v93 = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v82.Typography.LabelLarge else nil;
    end;
    local v96 = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v13.useMemo(function() --[[ Line: 243 ]]
        -- upvalues: l_GetTextSize_0 (ref), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), v80 (ref), v79 (copy), v93 (ref), v94 (copy)
        local v95 = l_GetTextSize_0(if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v80 else v79.joinButtonText, v93.FontSize, v93.Font, Vector2.new(1e999, 1e999));
        return UDim.new(0, v95.X + v94);
    end, {
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v80 else v79.joinButtonText, 
        v93, 
        v94
    }) else nil;
    local v97 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then if v81.ctaStyle == v73.StandardLight then v82.Color.Extended.White.White_20.Color3 else v82.LightMode.ActionOverMedia.Background.Color3 else nil;
    local v98 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then if v81.ctaStyle == v73.StandardLight then v82.Color.Extended.White.White_20.Transparency else v82.LightMode.ActionOverMedia.Background.Transparency else nil;
    local l_LabelSmall_0 = v82.Typography.LabelSmall;
    local l_White_90_0 = v82.Color.Extended.White.White_90;
    local l_Small_0 = v82.Padding.Small;
    local l_XSmall_0 = v82.Padding.XSmall;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v89 = v82.Typography.BodySmall;
    end;
    local v103 = tonumber(v75.logoAspectRatio);
    local v104 = if v103 and v103 > 0 then v103 else 1;
    local v105 = if v104 == 3 then v67 else v68;
    local l_universeId_0 = v75.universeId;
    local l_placeId_0 = v75.placeId;
    local v108 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v45(l_universeId_0, v75.topicId, v75.badgeOverride) else nil;
    local l_hoverKey_0 = v75.hoverKey;
    local v110, v111 = v13.useState(false);
    local v112 = v13.useRef(nil);
    local v113 = l_useTriggerFeedback_0();
    local v114 = l_useOverflowMenuOpen_0(l_hoverKey_0);
    local v115 = v3(v112, l_hoverKey_0, true);
    local v116 = v13.useRef(false);
    local v117 = v13.useCallback(function() --[[ Line: 306 ]]
        -- upvalues: v75 (copy), l_sponsoredGamesRecordClick_0 (ref), v77 (copy)
        if v75.isSponsored and v75.adId then
            l_sponsoredGamesRecordClick_0(v77, v75.adId);
        end;
    end, {
        v77, 
        v75.isSponsored, 
        v75.adId
    });
    local v118 = v13.useCallback(function() --[[ Line: 312 ]]
        -- upvalues: v116 (copy)
        v116.current = false;
    end, {});
    local v120 = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then nil else v13.useCallback(function() --[[ Line: 318 ]]
        -- upvalues: v116 (copy), v113 (copy), v75 (copy), l_getOverflowMenuSignalStore_0 (ref), l_hoverKey_0 (copy)
        local l_current_0 = v116.current;
        v116.current = true;
        if l_current_0 == false then
            v113("TwoByOneTileLongPress", "Press", v75.appPage, nil);
            l_getOverflowMenuSignalStore_0().openMenu(l_hoverKey_0);
        end;
    end, {
        l_hoverKey_0, 
        v75.appPage, 
        v113
    });
    local v122 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v13.useCallback(function() --[[ Line: 329 ]]
        -- upvalues: l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v75 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), v76 (copy), l_universeId_0 (copy), v8 (ref)
        local v121 = nil;
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then
            v121 = {
                index = v75.index, 
                placeIdOverride = v75.placeIdOverride, 
                experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                    launchData = if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v75.launchDataOverride then v75.launchDataOverride else nil, 
                    tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                    nativeAdData = v75.adId
                } else if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v75.launchDataOverride then {
                    launchData = v75.launchDataOverride
                } else nil
            };
        end;
        v76(l_universeId_0, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v121 else if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
            index = v75.index, 
            experienceJoinData = {
                tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                nativeAdData = v75.adId
            }
        } else {
            index = v75.index
        });
        v8.logTwoByOneTileViewGameDetailsActivated();
        if v75.reportGameDetailOpened then
            if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then
                v75.reportGameDetailOpened(v75.index, l_universeId_0);
                return;
            else
                v75.reportGameDetailOpened(v75.index, l_universeId_0, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile);
            end;
        end;
    end, {
        v76, 
        l_universeId_0, 
        v75.index, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v75.placeIdOverride else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v75.launchDataOverride else nil, 
        v75.reportGameDetailOpened, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v75.adId else nil
    }) else nil;
    local v123 = nil;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v123 = v13.useCallback(function() --[[ Line: 394 ]]
            -- upvalues: v116 (copy), v115 (copy), v11 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v75 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), v76 (copy), l_universeId_0 (copy), v8 (ref), v117 (copy)
            if v116.current then
                v116.current = false;
                return;
            else
                if v115 then
                    v11.default:reset();
                end;
                local v124 = nil;
                if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then
                    v124 = {
                        index = v75.index, 
                        placeIdOverride = v75.placeIdOverride, 
                        experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                            launchData = if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v75.launchDataOverride then v75.launchDataOverride else nil, 
                            tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                            nativeAdData = v75.adId
                        } else if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v75.launchDataOverride then {
                            launchData = v75.launchDataOverride
                        } else nil
                    };
                end;
                v76(l_universeId_0, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v124 else if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                    index = v75.index, 
                    experienceJoinData = {
                        tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                        nativeAdData = v75.adId
                    }
                } else {
                    index = v75.index
                });
                v8.logTwoByOneTileActivated();
                if v75.reportGameDetailOpened then
                    if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then
                        v75.reportGameDetailOpened(v75.index, l_universeId_0);
                    else
                        v75.reportGameDetailOpened(v75.index, l_universeId_0, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile);
                    end;
                end;
                v117();
                return;
            end;
        end, {
            v76, 
            l_universeId_0, 
            v75.index, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v75.placeIdOverride else nil, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v75.launchDataOverride else nil, 
            v75.reportGameDetailOpened, 
            v117, 
            v115, 
            if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v75.adId else nil
        });
    end;
    local v125 = v13.useCallback(function() --[[ Line: 469 ]]
        -- upvalues: v111 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), v75 (copy)
        v111(true);
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and v75.onSelectionGained then
            v75.onSelectionGained();
        end;
    end, {
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v75.onSelectionGained else nil
    });
    local v126 = v13.useCallback(function() --[[ Line: 481 ]]
        -- upvalues: v111 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), v75 (copy)
        v111(false);
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and v75.onSelectionLost then
            v75.onSelectionLost();
        end;
    end, {
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v75.onSelectionLost else nil
    });
    local l_isSponsored_0 = v75.isSponsored;
    local v128 = v13.useMemo(function() --[[ Line: 493 ]]
        -- upvalues: v7 (ref), l_isSponsored_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v75 (copy)
        return v7({
            isSponsored = l_isSponsored_0, 
            enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v75.enableSponsoredFeedback else l_isSponsored_0, 
            enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v75.enableReportAd else l_isSponsored_0, 
            enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v75.enableExplicitFeedback else nil
        });
    end, {
        l_isSponsored_0, 
        v75.enableSponsoredFeedback, 
        v75.enableReportAd, 
        v75.enableExplicitFeedback
    });
    local v129 = (not not v115 or v110 or v114) and next(v128) ~= nil;
    local v133 = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v13.useCallback(function(v130, v131) --[[ Line: 509 ]]
        -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v75 (copy), l_universeId_0 (copy), l_gameTileOverflowMenuAction_0 (ref)
        local v132 = {
            ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v75.appPage, 
            universeId = l_universeId_0, 
            sortId = v75.topicId, 
            actionType = v130 and "GameTileOverflowMenuClosed" or "GameTileOverflowMenuOpened", 
            availableMenuItems = v131
        };
        l_gameTileOverflowMenuAction_0(v132, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v75.appPage or "Unknown" else nil);
    end, {
        l_universeId_0, 
        v75.appPage, 
        v75.topicId
    }) else nil;
    if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then
        v120 = v13.useCallback(function() --[[ Line: 529 ]]
            -- upvalues: v116 (copy), v128 (copy), v113 (copy), v114 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (ref), l_universeId_0 (copy), v75 (copy), l_getOverflowMenuSignalStore_0 (ref), l_hoverKey_0 (copy), v133 (copy)
            local l_current_1 = v116.current;
            v116.current = true;
            if l_current_1 == false and next(v128) ~= nil then
                if v113 and not v114 then
                    local v135 = if l_FFlagLuaAppHapticTriggeredTelemetry_0 then {
                        universeId = l_universeId_0, 
                        sortId = v75.topicId
                    } else nil;
                    v113("TwoByOneTileLongPress", "Press", if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v75.appPage or "Unknown" else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v135 else nil);
                end;
                l_getOverflowMenuSignalStore_0().openMenu(l_hoverKey_0);
                local v136 = {};
                for v137, _ in v128 do
                    table.insert(v136, v137);
                end;
                v133(false, table.concat(v136, ","));
            end;
        end, {
            l_hoverKey_0, 
            v75.appPage, 
            v75.topicId, 
            v113, 
            v128, 
            v114, 
            l_universeId_0, 
            v133
        });
    end;
    local v139 = nil;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v139 = v13.useCallback(function() --[[ Line: 573 ]]
            -- upvalues: v8 (ref)
            v8.logTwoByOneTileGameJoinInitiated();
        end, {});
    end;
    local v141 = v13.useCallback(function() --[[ Line: 579 ]]
        -- upvalues: v78 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), v115 (copy), v11 (ref), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), v117 (copy), v75 (copy), l_placeId_0 (copy), l_universeId_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref)
        if v78 then
            l_SetGamePlaySession_0(v78, l_SessionType_0.StructuralIdentifier.GamePlayFromHoverTile, true);
        end;
        if v115 then
            v11.default:reset();
        end;
        if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v117();
        end;
        if v75.reportExperienceLaunched then
            local v140 = {
                placeId = l_placeId_0, 
                universeId = l_universeId_0, 
                adId = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v75.adId else nil, 
                tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile else nil, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v75.placeIdOverride else nil, 
                launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v75.launchDataOverride else nil
            };
            v75.reportExperienceLaunched(v140, v75.appPage, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, v75.index);
        end;
    end, {
        if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v117 else nil, 
        v78, 
        v75.reportExperienceLaunched, 
        l_placeId_0, 
        l_universeId_0, 
        v75.appPage, 
        v75.index, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v75.adId else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v75.placeIdOverride else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v75.launchDataOverride else nil, 
        v115
    });
    local v142 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_usePlayButtonState_0(v77, l_universeId_0) else nil;
    local v143 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_useOnPlayButtonCallback_0(l_universeId_0, v75.appPage, "TwoByOneTile", nil, "TwoByOneTile", if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
        launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v75.launchDataOverride else nil, 
        tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
        nativeAdData = v75.adId
    } else if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v75.launchDataOverride then {
        launchData = v75.launchDataOverride
    } else nil, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v75.placeIdOverride then v75.placeIdOverride else v75.placeId) else nil;
    local v144 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v13.useCallback(function() --[[ Line: 657 ]]
        -- upvalues: v8 (ref), v117 (copy)
        v8.logTwoByOneTileGameJoinInitiated();
        v8.logTwoByOneTileCtaActivated();
        v117();
    end, {
        v117
    }) else nil;
    local v145 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v13.useCallback(function() --[[ Line: 665 ]]
        -- upvalues: v8 (ref), v117 (copy), v122 (copy)
        v8.logTwoByOneTileCtaActivated();
        v117();
        v122();
    end, {
        v117, 
        v122
    }) else nil;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v139 = v13.useCallback(function() --[[ Line: 674 ]]
            -- upvalues: v8 (ref), v143 (copy), v142 (copy), v141 (copy)
            v8.logTwoByOneTileGameJoinInitiated();
            v143(v142.playButtonState, v141);
        end, {
            v143, 
            v142.playButtonState, 
            v141
        });
    end;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v123 = v13.useCallback(function() --[[ Line: 689 ]]
            -- upvalues: v116 (copy), v115 (copy), v11 (ref), v8 (ref), v117 (copy), v81 (ref), v72 (ref), v122 (copy), v139 (ref)
            if v116.current then
                v116.current = false;
                return;
            else
                if v115 then
                    v11.default:reset();
                end;
                v8.logTwoByOneTileActivated();
                v117();
                if v81.onTileActivation == v72.OpenEdp then
                    v122();
                    return;
                else
                    if v81.onTileActivation == v72.JoinGame then
                        v139();
                    end;
                    return;
                end;
            end;
        end, {
            v115, 
            v81.onTileActivation, 
            v122, 
            v139, 
            v117
        });
    end;
    local v147 = l_useSelector_0(function(v146) --[[ Line: 718 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), l_universeId_0 (copy)
        return v146.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    end);
    local v148 = v1(v147, v75.topicId);
    local v149 = (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v75.primaryWideImageAssetId then v75.primaryWideImageAssetId else if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then v10.getWideImageAssetId(v148) else v148 and v148.primaryMediaAsset and v148.primaryMediaAsset.wideImageAssetId) or v147 and v147.primaryWideAssetId or nil;
    local v150 = v2(v149, l_placeId_0, true);
    local v151 = v147 and v147.ageRecommendationDisplayName or nil;
    local v152 = v13.useRef(nil);
    v13.useEffect(function() --[[ Line: 734 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v152 (copy), v75 (copy)
        l_ImpressionsTagUtility_0.AddTag(v152, v75.impressionsTag, v75.index);
        return function() --[[ Line: 736 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v152 (ref), v75 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v152, v75.impressionsTag, v75.index);
        end;
    end, {
        v75.impressionsTag, 
        v75.index
    });
    if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v75.isHidden then
        return v13.createElement("Frame", {
            LayoutOrder = v75.layoutOrder, 
            ZIndex = v75.zIndex, 
            BackgroundTransparency = 1
        }, {
            TwoByOneTileContainer = v13.createElement("TextButton", {
                Size = v75.size or UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ref = v112, 
                Selectable = false
            }, {
                HiddenTileContent = v13.createElement(v9, {
                    appPage = v75.appPage, 
                    collectionId = v75.topicId, 
                    setGameHidden = v75.setGameHidden, 
                    universeId = l_universeId_0, 
                    parentRef = v112, 
                    isSponsored = l_isSponsored_0
                })
            })
        });
    else
        return v13.createElement("Frame", {
            LayoutOrder = v75.layoutOrder, 
            ZIndex = v75.zIndex, 
            BackgroundTransparency = 1, 
            ref = v152
        }, {
            TwoByOneTileContainer = v13.createElement("TextButton", {
                Size = v75.size or UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Text = "", 
                AutoButtonColor = false, 
                ref = v112, 
                [v13.Event.TouchLongPress] = v120, 
                [v13.Event.Activated] = v123, 
                [v13.Event.SelectionGained] = v125, 
                [v13.Event.SelectionLost] = v126, 
                [v13.Change.GuiState] = v118
            }, {
                BackgroundImage = v13.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = v150, 
                    ScaleType = Enum.ScaleType.Crop, 
                    ZIndex = 0
                }, {
                    UICorner = v13.createElement("UICorner", {
                        CornerRadius = v83
                    })
                }), 
                GradientOverlayLeft = v13.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(v71, 0, 1, 0), 
                    BackgroundColor3 = v65, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    ZIndex = 1
                }, {
                    UICorner = v13.createElement("UICorner", {
                        CornerRadius = v83
                    }), 
                    UIGradientLeft = v13.createElement("UIGradient", {
                        Rotation = 0, 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, v69), 
                            NumberSequenceKeypoint.new(1, v70)
                        }), 
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, v66), 
                            ColorSequenceKeypoint.new(1, v66)
                        })
                    })
                }), 
                GradientOverlayBottom = v13.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, v71, 0), 
                    BackgroundColor3 = v65, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    ZIndex = 1
                }, {
                    UICorner = v13.createElement("UICorner", {
                        CornerRadius = v83
                    }), 
                    UIGradientBottom = v13.createElement("UIGradient", {
                        Rotation = 90, 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, v70), 
                            NumberSequenceKeypoint.new(1, v69)
                        }), 
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, v66), 
                            ColorSequenceKeypoint.new(1, v66)
                        })
                    })
                }), 
                TileBadge = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v108 and v13.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                }, {
                    Badge = v13.createElement(v6, {
                        tileBadgesByPosition = v108
                    })
                }) else nil, 
                ContentOverlay = v13.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and 3 or 2
                }, {
                    UIPadding = v13.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v85), 
                        PaddingRight = UDim.new(0, v85), 
                        PaddingTop = UDim.new(0, v86), 
                        PaddingBottom = UDim.new(0, v86)
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
                            Text = v79.sponsoredText, 
                            Font = l_LabelSmall_0.Font, 
                            TextSize = l_LabelSmall_0.FontSize, 
                            TextColor3 = v82.LightMode.Content.Emphasis.Color3, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Center
                        })
                    }), 
                    Logo = (not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 or v75.logoImageAssetId) and v13.createElement(l_Image_0, {
                        Position = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        Image = "rbxassetid://" .. tostring(v75.logoImageAssetId), 
                        Size = UDim2.new(1, 0, v105, 0), 
                        aspectRatio = v104
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
                            Padding = UDim.new(0, v90)
                        }), 
                        Headline = v13.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Text = v75.headline or "", 
                            Font = v87.Font, 
                            TextSize = v87.FontSize, 
                            TextColor3 = v65, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            TextWrapped = true
                        }), 
                        Subtitle = v13.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Text = v75.subtitle or "", 
                            Font = v88.Font, 
                            TextSize = v88.FontSize, 
                            TextColor3 = v65, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            TextWrapped = true
                        })
                    }), 
                    JoinButtonContainer = (not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 or v81.onCtaActivation == v72.JoinGame) and v13.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 0, 1, 0), 
                        AnchorPoint = Vector2.new(0, 1)
                    }, {
                        JoinButton = v13.createElement(l_PlayButton_0, {
                            universeId = l_universeId_0, 
                            placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v75.placeIdOverride then v75.placeIdOverride else l_placeId_0, 
                            referralSource = v75.appPage, 
                            eventContext = "TwoByOneTile", 
                            launchSource = l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and "TwoByOneTile" or nil, 
                            playableText = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v80 else v79.joinButtonText, 
                            hidePlayableIcon = true, 
                            buttonSize = v91, 
                            width = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v96 else nil, 
                            onActivated = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v144 else v139, 
                            reportExperienceLaunched = v141, 
                            experienceJoinData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v75.launchDataOverride then {
                                launchData = v75.launchDataOverride
                            } else nil
                        })
                    }), 
                    ViewGameDetailsButton = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v81.onCtaActivation == v72.OpenEdp and v13.createElement("TextButton", {
                        Size = UDim2.new(v96.Scale, v96.Offset, 0, v92), 
                        Position = UDim2.new(0, 0, 1, 0), 
                        AnchorPoint = Vector2.new(0, 1), 
                        BackgroundColor3 = v97, 
                        BackgroundTransparency = v98, 
                        Text = v80, 
                        TextColor3 = v82.LightMode.ActionOverMedia.Foreground.Color3, 
                        Font = v93.Font, 
                        TextSize = v93.FontSize, 
                        [v13.Event.Activated] = v145
                    }, {
                        UICorner = v13.createElement("UICorner", {
                            CornerRadius = UDim.new(0, v82.Radius.Medium)
                        })
                    }) else nil, 
                    BottomRightLabel = v13.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        Size = UDim2.new(0, 0, 0, v89.FontSize * v89.LineHeight), 
                        BackgroundTransparency = 1, 
                        Text = v151, 
                        TextSize = v89.FontSize, 
                        Font = v89.Font, 
                        TextColor3 = v82.Color.Extended.Gray.Gray_400.Color3, 
                        TextXAlignment = Enum.TextXAlignment.Right, 
                        TextTruncate = Enum.TextTruncate.SplitWord, 
                        AnchorPoint = Vector2.new(1, 1), 
                        Position = UDim2.new(1, 0, 1, 0)
                    })
                }), 
                OverflowMenuContainer = v129 and v13.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and 4 or 3
                }, {
                    OverflowMenu = v13.createElement(v5, {
                        isHovered = v115, 
                        isSelected = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v110 else nil, 
                        universeId = l_universeId_0, 
                        collectionId = v75.topicId, 
                        appPage = v75.appPage, 
                        setGameHidden = v75.setGameHidden or function() --[[ Line: 1036 ]]

                        end, 
                        menuKey = l_hoverKey_0, 
                        menuOpen = v114, 
                        onMenuOpenChanged = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v133 else nil, 
                        parentRef = v112, 
                        isSponsored = v75.isSponsored, 
                        payerName = v75.payerName, 
                        sponsoredUserCohort = v75.sponsoredUserCohort, 
                        adId = v75.adId, 
                        availableMenuItems = v128
                    })
                })
            })
        });
    end;
end;