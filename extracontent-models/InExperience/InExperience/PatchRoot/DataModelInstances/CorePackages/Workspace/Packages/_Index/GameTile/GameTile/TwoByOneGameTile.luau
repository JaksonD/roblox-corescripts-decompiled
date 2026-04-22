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
local v18 = require(l_Parent_0.Responsive);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v21 = require(l_Parent_0.AppBlox);
local l_getOverflowMenuSignalStore_0 = v21.getOverflowMenuSignalStore;
local l_useOverflowMenuOpen_0 = v21.useOverflowMenuOpen;
local l_useTriggerFeedback_0 = require(l_Parent_0.InteractionFeedback).useTriggerFeedback;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_GetTextSize_0 = require(l_Parent_0.Style).GetTextSize;
local v27 = require(l_Parent_0.GamePlayButton);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_PlayButton_0 = v27.PlayButton;
local l_useOnPlayButtonCallback_0 = require(l_Parent_0.GamePlayButton).useOnPlayButtonCallback;
local l_usePlayButtonState_0 = require(l_Parent_0.GamePlayButton).usePlayButtonState;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v34 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v34.RoactNetworking;
local l_AppSessionService_0 = v34.AppSessionService;
local v37 = require(l_Parent_0.RobloxAppSessionization);
local l_SetGamePlaySession_0 = v37.SetGamePlaySession;
local l_SessionType_0 = v37.SessionType;
local v40 = require(l_Parent_0.SharedFlags);
local v41 = require(l_Parent_0.DiscoveryAnalytics);
local l_sponsoredGamesRecordClick_0 = v41.Requests.sponsoredGamesRecordClick;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v44 = require(l_script_FirstAncestor_0.Overlays.useValidTileBadges);
local v45 = game:DefineFastInt("LuaAppTwoByOneTileSmallScreenBreakpoint", 600);
local v46 = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentLandscape", 20);
local v47 = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentSquare", 36);
local v48 = game:DefineFastInt("LuaAppTwoByOneTileGradientStartOpacityPercent", 30);
local v49 = game:DefineFastInt("LuaAppTwoByOneTileGradientEndOpacityPercent", 100);
local v50 = game:DefineFastInt("LuaAppTwoByOneTileGradientWidthPercent", 50);
local v51 = game:DefineFastFlag("LuaAppTwoByOneTileHeadlineFontUpdate", false);
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v40.FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = v40.FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppCustomSpawnNonNilCheck_0 = v40.FFlagLuaAppCustomSpawnNonNilCheck;
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = v40.FFlagLuaAppFixExplicitFeedbackTelemetry;
local l_FFlagLuaAppHapticTriggeredTelemetry_0 = v40.FFlagLuaAppHapticTriggeredTelemetry;
local l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 = v40.FFlagLuaAppFixTwoByOneOverflowMenuTelemetry;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = v40.FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = v40.FFlagLuaAppSupportPrimaryMediaContentMetadata;
local l_gameTileOverflowMenuAction_0 = v41.Events.gameTileOverflowMenuAction;
local v61 = Color3.new(1, 1, 1);
local v62 = Color3.new(0, 0, 0);
local v63 = v46 / 100;
local v64 = v47 / 100;
local v65 = v48 / 100;
local v66 = v49 / 100;
local v67 = v50 / 100;
local v68 = {
    JoinGame = "JoinGame", 
    OpenEdp = "OpenEdp"
};
local v69 = {
    StandardLight = "StandardLight", 
    OverMedia = "OverMedia"
};
local v70 = {
    Default = {
        ctaStyle = nil, 
        onCtaActivation = v68.JoinGame, 
        onTileActivation = v68.OpenEdp
    }, 
    Variant1 = {
        ctaStyle = nil, 
        onCtaActivation = nil, 
        onTileActivation = v68.JoinGame
    }, 
    Variant2 = {
        ctaStyle = v69.StandardLight, 
        onCtaActivation = v68.OpenEdp, 
        onTileActivation = v68.JoinGame
    }, 
    Variant3 = {
        ctaStyle = v69.OverMedia, 
        onCtaActivation = v68.OpenEdp, 
        onTileActivation = v68.JoinGame
    }
};
return function(v71) --[[ Line: 160 ]]
    -- upvalues: v4 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppSessionService_0 (copy), l_useLocalization_0 (copy), v70 (copy), l_useTokens_0 (copy), v18 (copy), v45 (copy), v51 (copy), l_ButtonSize_0 (copy), v13 (copy), l_GetTextSize_0 (copy), v69 (copy), v63 (copy), v64 (copy), v44 (copy), l_useTriggerFeedback_0 (copy), l_useOverflowMenuOpen_0 (copy), v3 (copy), l_sponsoredGamesRecordClick_0 (copy), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_GameCollectionItemTypes_0 (copy), v8 (copy), v7 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v11 (copy), l_usePlayButtonState_0 (copy), l_useOnPlayButtonCallback_0 (copy), v68 (copy), l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), v1 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), v10 (copy), v2 (copy), l_ImpressionsTagUtility_0 (copy), v9 (copy), v67 (copy), v61 (copy), v65 (copy), v66 (copy), v62 (copy), v6 (copy), l_Image_0 (copy), l_PlayButton_0 (copy), v5 (copy)
    local v72 = v4();
    local v73 = l_useRoactService_0(l_RoactNetworking_0);
    local v74 = l_useRoactService_0(l_AppSessionService_0);
    local v75 = l_useLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored", 
        joinButtonText = "Common.VisitGame.Label.Play"
    });
    local v76 = if v71.ctaText then v71.ctaText else v75.joinButtonText;
    local v77 = v70[v71.tileVariant] or v70.Default;
    local v78 = l_useTokens_0();
    local v79 = UDim.new(0, v78.Radius.Medium);
    local v80 = v18.useResponsive({
        {
            Key = "Smaller", 
            maxWidth = v45
        }
    }) == "Smaller";
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    if v80 then
        v81 = v78.Padding.Medium;
        v82 = v78.Padding.Medium;
        v83 = if v51 then v78.Typography.TitleLarge else v78.Typography.HeadingSmall;
        v84 = v78.Typography.BodySmall;
        v85 = v78.Typography.CaptionSmall;
        v86 = v78.Gap.XXSmall;
        v87 = l_ButtonSize_0.Small;
        v88 = v78.Size.Size_800;
        v89 = v78.Typography.TitleSmall;
    else
        v81 = v78.Padding.Large;
        v82 = v78.Padding.Large;
        v83 = v78.Typography.HeadingMedium;
        v84 = v78.Typography.BodyMedium;
        v85 = v78.Typography.CaptionMedium;
        v86 = v78.Gap.XSmall;
        v87 = l_ButtonSize_0.Medium;
        v88 = v78.Size.Size_1000;
        v89 = v78.Typography.TitleMedium;
    end;
    local v90 = v78.Padding.Large * 4;
    local v92 = v13.useMemo(function() --[[ Line: 209 ]]
        -- upvalues: l_GetTextSize_0 (ref), v76 (copy), v89 (ref), v90 (copy)
        local v91 = l_GetTextSize_0(v76, v89.FontSize, v89.Font, Vector2.new(1e999, 1e999));
        return UDim.new(0, v91.X + v90);
    end, {
        v76, 
        v89, 
        v90
    });
    local v93 = if v77.ctaStyle == v69.StandardLight then v78.Color.Extended.White.White_20.Color3 else v78.LightMode.ActionOverMedia.Background.Color3;
    local v94 = if v77.ctaStyle == v69.StandardLight then v78.Color.Extended.White.White_20.Transparency else v78.LightMode.ActionOverMedia.Background.Transparency;
    local v95 = tonumber(v71.logoAspectRatio);
    local v96 = if v95 and v95 > 0 then v95 else 1;
    local v97 = if v96 == 3 then v63 else v64;
    local l_universeId_0 = v71.universeId;
    local l_placeId_0 = v71.placeId;
    local v100 = v44(l_universeId_0, v71.topicId, v71.badgeOverride);
    local l_hoverKey_0 = v71.hoverKey;
    local v102, v103 = v13.useState(false);
    local v104 = v13.useRef(nil);
    local v105 = l_useTriggerFeedback_0();
    local v106 = l_useOverflowMenuOpen_0(l_hoverKey_0);
    local v107 = v3(v104, l_hoverKey_0, true);
    local v108 = v13.useRef(false);
    local v109 = v13.useCallback(function() --[[ Line: 254 ]]
        -- upvalues: v71 (copy), l_sponsoredGamesRecordClick_0 (ref), v73 (copy)
        if v71.isSponsored and v71.adId then
            l_sponsoredGamesRecordClick_0(v73, v71.adId);
        end;
    end, {
        v73, 
        v71.isSponsored, 
        v71.adId
    });
    local v110 = v13.useCallback(function() --[[ Line: 260 ]]
        -- upvalues: v108 (copy)
        v108.current = false;
    end, {});
    local v112 = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then nil else v13.useCallback(function() --[[ Line: 266 ]]
        -- upvalues: v108 (copy), v105 (copy), v71 (copy), l_getOverflowMenuSignalStore_0 (ref), l_hoverKey_0 (copy)
        local l_current_0 = v108.current;
        v108.current = true;
        if l_current_0 == false then
            v105("TwoByOneTileLongPress", "Press", v71.appPage, nil);
            l_getOverflowMenuSignalStore_0().openMenu(l_hoverKey_0);
        end;
    end, {
        l_hoverKey_0, 
        v71.appPage, 
        v105
    });
    local v114 = v13.useCallback(function() --[[ Line: 276 ]]
        -- upvalues: l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v71 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), l_GameCollectionItemTypes_0 (ref), v72 (copy), l_universeId_0 (copy), v8 (ref)
        local v113 = nil;
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then
            v113 = {
                index = v71.index, 
                placeIdOverride = v71.placeIdOverride, 
                experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                    launchData = if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v71.launchDataOverride then v71.launchDataOverride else nil, 
                    tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                    nativeAdData = v71.adId
                } else if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v71.launchDataOverride then {
                    launchData = v71.launchDataOverride
                } else nil
            };
        end;
        v72(l_universeId_0, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v113 else if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
            index = v71.index, 
            experienceJoinData = {
                tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
                nativeAdData = v71.adId
            }
        } else {
            index = v71.index
        });
        v8.logTwoByOneTileViewGameDetailsActivated();
        if v71.reportGameDetailOpened then
            if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then
                v71.reportGameDetailOpened(v71.index, l_universeId_0);
                return;
            else
                v71.reportGameDetailOpened(v71.index, l_universeId_0, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile);
            end;
        end;
    end, {
        v72, 
        l_universeId_0, 
        v71.index, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v71.placeIdOverride else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v71.launchDataOverride else nil, 
        v71.reportGameDetailOpened, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v71.adId else nil
    });
    local v115 = v13.useCallback(function() --[[ Line: 337 ]]
        -- upvalues: v103 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), v71 (copy)
        v103(true);
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and v71.onSelectionGained then
            v71.onSelectionGained();
        end;
    end, {
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v71.onSelectionGained else nil
    });
    local v116 = v13.useCallback(function() --[[ Line: 349 ]]
        -- upvalues: v103 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), v71 (copy)
        v103(false);
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and v71.onSelectionLost then
            v71.onSelectionLost();
        end;
    end, {
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v71.onSelectionLost else nil
    });
    local l_isSponsored_0 = v71.isSponsored;
    local v118 = v13.useMemo(function() --[[ Line: 361 ]]
        -- upvalues: v7 (ref), l_isSponsored_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v71 (copy)
        return v7({
            isSponsored = l_isSponsored_0, 
            enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v71.enableSponsoredFeedback else l_isSponsored_0, 
            enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v71.enableReportAd else l_isSponsored_0, 
            enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v71.enableExplicitFeedback else nil
        });
    end, {
        l_isSponsored_0, 
        v71.enableSponsoredFeedback, 
        v71.enableReportAd, 
        v71.enableExplicitFeedback
    });
    local v119 = (not not v107 or v102 or v106) and next(v118) ~= nil;
    local v123 = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v13.useCallback(function(v120, v121) --[[ Line: 377 ]]
        -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v71 (copy), l_universeId_0 (copy), l_gameTileOverflowMenuAction_0 (ref)
        local v122 = {
            ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v71.appPage, 
            universeId = l_universeId_0, 
            sortId = v71.topicId, 
            actionType = v120 and "GameTileOverflowMenuClosed" or "GameTileOverflowMenuOpened", 
            availableMenuItems = v121
        };
        l_gameTileOverflowMenuAction_0(v122, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v71.appPage or "Unknown" else nil);
    end, {
        l_universeId_0, 
        v71.appPage, 
        v71.topicId
    }) else nil;
    if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then
        v112 = v13.useCallback(function() --[[ Line: 397 ]]
            -- upvalues: v108 (copy), v118 (copy), v105 (copy), v106 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (ref), l_universeId_0 (copy), v71 (copy), l_getOverflowMenuSignalStore_0 (ref), l_hoverKey_0 (copy), v123 (copy)
            local l_current_1 = v108.current;
            v108.current = true;
            if l_current_1 == false and next(v118) ~= nil then
                if v105 and not v106 then
                    local v125 = if l_FFlagLuaAppHapticTriggeredTelemetry_0 then {
                        universeId = l_universeId_0, 
                        sortId = v71.topicId
                    } else nil;
                    v105("TwoByOneTileLongPress", "Press", if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v71.appPage or "Unknown" else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v125 else nil);
                end;
                l_getOverflowMenuSignalStore_0().openMenu(l_hoverKey_0);
                local v126 = {};
                for v127, _ in v118 do
                    table.insert(v126, v127);
                end;
                v123(false, table.concat(v126, ","));
            end;
        end, {
            l_hoverKey_0, 
            v71.appPage, 
            v71.topicId, 
            v105, 
            v118, 
            v106, 
            l_universeId_0, 
            v123
        });
    end;
    local v130 = v13.useCallback(function() --[[ Line: 439 ]]
        -- upvalues: v74 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), v107 (copy), v11 (ref), v71 (copy), l_placeId_0 (copy), l_universeId_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref)
        if v74 then
            l_SetGamePlaySession_0(v74, l_SessionType_0.StructuralIdentifier.GamePlayFromHoverTile, true);
        end;
        if v107 then
            v11.default:reset();
        end;
        if v71.reportExperienceLaunched then
            local v129 = {
                placeId = l_placeId_0, 
                universeId = l_universeId_0, 
                adId = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v71.adId else nil, 
                tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile else nil, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v71.placeIdOverride else nil, 
                launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v71.launchDataOverride else nil
            };
            v71.reportExperienceLaunched(v129, v71.appPage, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, v71.index);
        end;
    end, {
        v74, 
        v71.reportExperienceLaunched, 
        l_placeId_0, 
        l_universeId_0, 
        v71.appPage, 
        v71.index, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v71.adId else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v71.placeIdOverride else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v71.launchDataOverride else nil, 
        v107
    });
    local v131 = l_usePlayButtonState_0(v73, l_universeId_0);
    local v132 = l_useOnPlayButtonCallback_0(l_universeId_0, v71.appPage, "TwoByOneTile", nil, "TwoByOneTile", if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
        launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v71.launchDataOverride else nil, 
        tileType = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, 
        nativeAdData = v71.adId
    } else if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v71.launchDataOverride then {
        launchData = v71.launchDataOverride
    } else nil, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v71.placeIdOverride then v71.placeIdOverride else v71.placeId);
    local v133 = v13.useCallback(function() --[[ Line: 505 ]]
        -- upvalues: v8 (ref), v109 (copy)
        v8.logTwoByOneTileGameJoinInitiated();
        v8.logTwoByOneTileCtaActivated();
        v109();
    end, {
        v109
    });
    local v134 = v13.useCallback(function() --[[ Line: 511 ]]
        -- upvalues: v8 (ref), v109 (copy), v114 (copy)
        v8.logTwoByOneTileCtaActivated();
        v109();
        v114();
    end, {
        v109, 
        v114
    });
    local v135 = v13.useCallback(function() --[[ Line: 517 ]]
        -- upvalues: v8 (ref), v132 (copy), v131 (copy), v130 (copy)
        v8.logTwoByOneTileGameJoinInitiated();
        v132(v131.playButtonState, v130);
    end, {
        v132, 
        v131.playButtonState, 
        v130
    });
    local v136 = v13.useCallback(function() --[[ Line: 529 ]]
        -- upvalues: v108 (copy), v107 (copy), v11 (ref), v8 (ref), v109 (copy), v77 (copy), v68 (ref), v114 (copy), v135 (copy)
        if v108.current then
            v108.current = false;
            return;
        else
            if v107 then
                v11.default:reset();
            end;
            v8.logTwoByOneTileActivated();
            v109();
            if v77.onTileActivation == v68.OpenEdp then
                v114();
                return;
            else
                if v77.onTileActivation == v68.JoinGame then
                    v135();
                end;
                return;
            end;
        end;
    end, {
        v107, 
        v77.onTileActivation, 
        v114, 
        v135, 
        v109
    });
    local v138 = l_useSelector_0(function(v137) --[[ Line: 557 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), l_universeId_0 (copy)
        return v137.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    end);
    local v139 = v1(v138, v71.topicId);
    local v140 = (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v71.primaryWideImageAssetId then v71.primaryWideImageAssetId else v10.getWideImageAssetId(v139)) or v138 and v138.primaryWideAssetId or nil;
    local v141 = v2(v140, l_placeId_0, true);
    local v142 = v138 and v138.ageRecommendationDisplayName or nil;
    local v143 = v13.useRef(nil);
    v13.useEffect(function() --[[ Line: 571 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v143 (copy), v71 (copy)
        l_ImpressionsTagUtility_0.AddTag(v143, v71.impressionsTag, v71.index);
        return function() --[[ Line: 573 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v143 (ref), v71 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v143, v71.impressionsTag, v71.index);
        end;
    end, {
        v71.impressionsTag, 
        v71.index
    });
    if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v71.isHidden then
        return v13.createElement("Frame", {
            LayoutOrder = v71.layoutOrder, 
            ZIndex = v71.zIndex, 
            BackgroundTransparency = 1
        }, {
            TwoByOneTileContainer = v13.createElement("TextButton", {
                Size = v71.size or UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ref = v104, 
                Selectable = false
            }, {
                HiddenTileContent = v13.createElement(v9, {
                    appPage = v71.appPage, 
                    collectionId = v71.topicId, 
                    setGameHidden = v71.setGameHidden, 
                    universeId = l_universeId_0, 
                    parentRef = v104, 
                    isSponsored = l_isSponsored_0
                })
            })
        });
    else
        local l_createElement_0 = v13.createElement;
        local v145 = "Frame";
        local v146 = {
            LayoutOrder = v71.layoutOrder, 
            ZIndex = v71.zIndex, 
            BackgroundTransparency = 1, 
            ref = v143
        };
        local v147 = {};
        local l_createElement_1 = v13.createElement;
        local v149 = "TextButton";
        local v150 = {
            Size = v71.size or UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = "", 
            AutoButtonColor = false, 
            ref = v104, 
            [v13.Event.TouchLongPress] = v112, 
            [v13.Event.Activated] = v136, 
            [v13.Event.SelectionGained] = v115, 
            [v13.Event.SelectionLost] = v116, 
            [v13.Change.GuiState] = v110
        };
        local v151 = {
            BackgroundImage = v13.createElement("ImageLabel", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Image = v141, 
                ScaleType = Enum.ScaleType.Crop, 
                ZIndex = 0
            }, {
                UICorner = v13.createElement("UICorner", {
                    CornerRadius = v79
                })
            }), 
            GradientOverlayLeft = v13.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(v67, 0, 1, 0), 
                BackgroundColor3 = v61, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 1
            }, {
                UICorner = v13.createElement("UICorner", {
                    CornerRadius = v79
                }), 
                UIGradientLeft = v13.createElement("UIGradient", {
                    Rotation = 0, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, v65), 
                        NumberSequenceKeypoint.new(1, v66)
                    }), 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v62), 
                        ColorSequenceKeypoint.new(1, v62)
                    })
                })
            }), 
            GradientOverlayBottom = v13.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, v67, 0), 
                BackgroundColor3 = v61, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 1
            }, {
                UICorner = v13.createElement("UICorner", {
                    CornerRadius = v79
                }), 
                UIGradientBottom = v13.createElement("UIGradient", {
                    Rotation = 90, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, v66), 
                        NumberSequenceKeypoint.new(1, v65)
                    }), 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v62), 
                        ColorSequenceKeypoint.new(1, v62)
                    })
                })
            }), 
            TileBadge = v100 and v13.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                Badge = v13.createElement(v6, {
                    tileBadgesByPosition = v100
                })
            })
        };
        local l_createElement_2 = v13.createElement;
        local v153 = "Frame";
        local v154 = {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ZIndex = 3
        };
        local v155 = {
            UIPadding = v13.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v81), 
                PaddingRight = UDim.new(0, v81), 
                PaddingTop = UDim.new(0, v82), 
                PaddingBottom = UDim.new(0, v82)
            }), 
            Logo = v71.logoImageAssetId and v13.createElement(l_Image_0, {
                Position = UDim2.new(1, 0, 0, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                Image = "rbxassetid://" .. tostring(v71.logoImageAssetId), 
                Size = UDim2.new(1, 0, v97, 0), 
                aspectRatio = v96
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
                    Padding = UDim.new(0, v86)
                }), 
                Headline = v13.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Text = v71.headline or "", 
                    Font = v83.Font, 
                    TextSize = v83.FontSize, 
                    TextColor3 = v61, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextWrapped = true
                }), 
                Subtitle = v13.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Text = v71.subtitle or "", 
                    Font = v84.Font, 
                    TextSize = v84.FontSize, 
                    TextColor3 = v61, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextWrapped = true
                })
            })
        };
        local v156 = false;
        if v77.onCtaActivation == v68.JoinGame then
            v156 = v13.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1)
            }, {
                JoinButton = v13.createElement(l_PlayButton_0, {
                    universeId = l_universeId_0, 
                    placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v71.placeIdOverride then v71.placeIdOverride else l_placeId_0, 
                    referralSource = v71.appPage, 
                    eventContext = "TwoByOneTile", 
                    launchSource = "TwoByOneTile", 
                    playableText = v76, 
                    hidePlayableIcon = true, 
                    buttonSize = v87, 
                    width = v92, 
                    onActivated = v133, 
                    reportExperienceLaunched = v130, 
                    experienceJoinData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v71.launchDataOverride then {
                        launchData = v71.launchDataOverride
                    } else nil
                })
            });
        end;
        v155.JoinButtonContainer = v156;
        v156 = false;
        if v77.onCtaActivation == v68.OpenEdp then
            v156 = v13.createElement("TextButton", {
                Size = UDim2.new(v92.Scale, v92.Offset, 0, v88), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = v93, 
                BackgroundTransparency = v94, 
                Text = v76, 
                TextColor3 = v78.LightMode.ActionOverMedia.Foreground.Color3, 
                Font = v89.Font, 
                TextSize = v89.FontSize, 
                [v13.Event.Activated] = v134
            }, {
                UICorner = v13.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v78.Radius.Medium)
                })
            });
        end;
        v155.ViewGameDetailsButton = v156;
        v155.BottomRightLabel = v13.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.new(0, 0, 0, v85.FontSize * v85.LineHeight), 
            BackgroundTransparency = 1, 
            Text = v142, 
            TextSize = v85.FontSize, 
            Font = v85.Font, 
            TextColor3 = v78.Color.Extended.Gray.Gray_400.Color3, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, 0, 1, 0)
        });
        v151.ContentOverlay = l_createElement_2(v153, v154, v155);
        v151.OverflowMenuContainer = v119 and v13.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ZIndex = 4
        }, {
            OverflowMenu = v13.createElement(v5, {
                isHovered = v107, 
                isSelected = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v102 else nil, 
                universeId = l_universeId_0, 
                collectionId = v71.topicId, 
                appPage = v71.appPage, 
                setGameHidden = v71.setGameHidden or function() --[[ Line: 831 ]]

                end, 
                menuKey = l_hoverKey_0, 
                menuOpen = v106, 
                onMenuOpenChanged = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v123 else nil, 
                parentRef = v104, 
                isSponsored = v71.isSponsored, 
                payerName = v71.payerName, 
                sponsoredUserCohort = v71.sponsoredUserCohort, 
                adId = v71.adId, 
                availableMenuItems = v118
            })
        });
        v147.TwoByOneTileContainer = l_createElement_1(v149, v150, v151);
        return l_createElement_0(v145, v146, v147);
    end;
end;