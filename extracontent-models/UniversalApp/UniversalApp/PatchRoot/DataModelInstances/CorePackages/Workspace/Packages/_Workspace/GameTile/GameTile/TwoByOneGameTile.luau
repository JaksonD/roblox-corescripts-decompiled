local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local v2 = require(l_script_FirstAncestor_0.formatExperienceThumbnail);
local v3 = require(l_script_FirstAncestor_0.useIsHoveredTile);
local v4 = require(l_script_FirstAncestor_0.useNavigateToGameDetails);
local v5 = require(l_script_FirstAncestor_0.GameTileOverflowMenu);
local v6 = require(l_script_FirstAncestor_0.Overlays.GameTileThumbnailBadges);
local v7 = require(l_script_FirstAncestor_0.getAvailableGameTileOverflowMenuItems);
local v8 = require(l_script_FirstAncestor_0.TwoByOneGameTileTelemetry);
local v9 = require(l_script_FirstAncestor_0.SponsoredGamesRecordClick);
local v10 = require(l_script_FirstAncestor_0.HiddenGameTile.HiddenTileContent);
local v11 = require(l_script_FirstAncestor_0.ItemLayoutDataParsingUtils);
local v12 = require(l_script_FirstAncestor_0.HoverTileCoordinator);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v14 = require(l_Parent_0.React);
local v15 = require(l_Parent_0.Foundation);
local l_ButtonSize_0 = v15.Enums.ButtonSize;
local l_useTokens_0 = v15.Hooks.useTokens;
local l_Image_0 = v15.Image;
local l_InputSize_0 = v15.Enums.InputSize;
local v20 = require(l_Parent_0.Responsive);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v23 = require(l_Parent_0.AppBlox);
local l_getOverflowMenuSignalStore_0 = v23.getOverflowMenuSignalStore;
local l_useOverflowMenuOpen_0 = v23.useOverflowMenuOpen;
local l_useTriggerFeedback_0 = require(l_Parent_0.InteractionFeedback).useTriggerFeedback;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_GetTextSize_0 = require(l_Parent_0.Style).GetTextSize;
local v29 = require(l_Parent_0.GamePlayButton);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_PlayButton_0 = v29.PlayButton;
local l_useOnPlayButtonCallback_0 = require(l_Parent_0.GamePlayButton).useOnPlayButtonCallback;
local l_usePlayButtonState_0 = require(l_Parent_0.GamePlayButton).usePlayButtonState;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v36 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v36.RoactNetworking;
local l_AppSessionService_0 = v36.AppSessionService;
local v39 = require(l_Parent_0.RobloxAppSessionization);
local l_SetGamePlaySession_0 = v39.SetGamePlaySession;
local l_SessionType_0 = v39.SessionType;
local v42 = require(l_Parent_0.SharedFlags);
local v43 = require(l_Parent_0.DiscoveryAnalytics);
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v45 = require(l_script_FirstAncestor_0.Overlays.useValidTileBadges);
local v46 = game:DefineFastInt("LuaAppTwoByOneTileSmallScreenBreakpoint", 600);
local v47 = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentLandscape", 20);
local v48 = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentSquare", 36);
local v49 = game:DefineFastInt("LuaAppTwoByOneTileGradientStartOpacityPercent", 30);
local v50 = game:DefineFastInt("LuaAppTwoByOneTileGradientEndOpacityPercent", 100);
local v51 = game:DefineFastInt("LuaAppTwoByOneTileGradientWidthPercent", 50);
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v42.FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 = v42.FFlagLuaAppIgnoreEmptyStringWideThumbnail;
local l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 = v42.FFlagLuaAppFixTwoByOneJoinButtonWidth;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = v42.FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppCustomSpawnNonNilCheck_0 = v42.FFlagLuaAppCustomSpawnNonNilCheck;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = v42.FFlagLuaAppTwoByOneTileExperimentVariants;
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = v42.FFlagLuaAppFixExplicitFeedbackTelemetry;
local l_FFlagLuaAppHapticTriggeredTelemetry_0 = v42.FFlagLuaAppHapticTriggeredTelemetry;
local l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 = v42.FFlagLuaAppFixTwoByOneOverflowMenuTelemetry;
local l_gameTileOverflowMenuAction_0 = v43.Events.gameTileOverflowMenuAction;
local v62 = Color3.new(1, 1, 1);
local v63 = Color3.new(0, 0, 0);
local v64 = v47 / 100;
local v65 = v48 / 100;
local v66 = v49 / 100;
local v67 = v50 / 100;
local v68 = v51 / 100;
local v69 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
    JoinGame = "JoinGame", 
    OpenEdp = "OpenEdp"
} else nil;
local v70 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
    StandardLight = "StandardLight", 
    OverMedia = "OverMedia"
} else nil;
local v71 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
    Default = {
        ctaStyle = nil, 
        onCtaActivation = v69.JoinGame, 
        onTileActivation = v69.OpenEdp
    }, 
    Variant1 = {
        ctaStyle = nil, 
        onCtaActivation = nil, 
        onTileActivation = v69.JoinGame
    }, 
    Variant2 = {
        ctaStyle = v70.StandardLight, 
        onCtaActivation = v69.OpenEdp, 
        onTileActivation = v69.JoinGame
    }, 
    Variant3 = {
        ctaStyle = v70.OverMedia, 
        onCtaActivation = v69.OpenEdp, 
        onTileActivation = v69.JoinGame
    }
} else nil;
return function(v72) --[[ Line: 169 ]]
    -- upvalues: v4 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppSessionService_0 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), v71 (copy), l_useTokens_0 (copy), v20 (copy), v46 (copy), l_ButtonSize_0 (copy), l_InputSize_0 (copy), l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 (copy), v14 (copy), l_GetTextSize_0 (copy), v70 (copy), v64 (copy), v65 (copy), v45 (copy), l_useTriggerFeedback_0 (copy), l_useOverflowMenuOpen_0 (copy), v3 (copy), v9 (copy), l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), v8 (copy), l_GameCollectionItemTypes_0 (copy), v12 (copy), v7 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_gameTileOverflowMenuAction_0 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_usePlayButtonState_0 (copy), l_useOnPlayButtonCallback_0 (copy), v69 (copy), l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), v1 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), v11 (copy), v2 (copy), l_ImpressionsTagUtility_0 (copy), v10 (copy), v68 (copy), v62 (copy), v66 (copy), v67 (copy), v63 (copy), v6 (copy), l_Image_0 (copy), l_PlayButton_0 (copy), v5 (copy)
    local v73 = v4();
    local v74 = l_useRoactService_0(l_RoactNetworking_0);
    local v75 = l_useRoactService_0(l_AppSessionService_0);
    local v76 = l_useLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored", 
        joinButtonText = "Common.VisitGame.Label.Play"
    });
    local v77 = nil;
    local v78 = nil;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v77 = if v72.ctaText then v72.ctaText else v76.joinButtonText;
        v78 = v71[v72.tileVariant] or v71.Default;
    end;
    local v79 = l_useTokens_0();
    local v80 = UDim.new(0, v79.Radius.Medium);
    local v81 = v20.useResponsive({
        {
            Key = "Smaller", 
            maxWidth = v46
        }
    }) == "Smaller";
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    if v81 then
        v82 = v79.Padding.Medium;
        v83 = v79.Padding.Medium;
        v84 = v79.Typography.HeadingSmall;
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v85 = v79.Typography.BodySmall;
            v86 = v79.Typography.CaptionSmall;
        else
            v85 = v79.Typography.BodyMedium;
        end;
        v87 = v79.Gap.XXSmall;
        v88 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_ButtonSize_0.Small else l_InputSize_0.Small;
        v89 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v79.Size.Size_800 else nil;
        v90 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v79.Typography.TitleSmall else nil;
    else
        v82 = v79.Padding.Large;
        v83 = v79.Padding.Large;
        v84 = v79.Typography.HeadingMedium;
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v85 = v79.Typography.BodyMedium;
            v86 = v79.Typography.CaptionMedium;
        else
            v85 = v79.Typography.BodyLarge;
        end;
        v87 = v79.Gap.XSmall;
        v88 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_ButtonSize_0.Medium else l_InputSize_0.Medium;
        v89 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v79.Size.Size_1000 else nil;
        v90 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v79.Typography.TitleMedium else nil;
    end;
    local v91 = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v79.Padding.Large * 4 else nil;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v90 = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v79.Typography.LabelLarge else nil;
    end;
    local v93 = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v14.useMemo(function() --[[ Line: 239 ]]
        -- upvalues: l_GetTextSize_0 (ref), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), v77 (ref), v76 (copy), v90 (ref), v91 (copy)
        local v92 = l_GetTextSize_0(if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v77 else v76.joinButtonText, v90.FontSize, v90.Font, Vector2.new(1e999, 1e999));
        return UDim.new(0, v92.X + v91);
    end, {
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v77 else v76.joinButtonText, 
        v90, 
        v91
    }) else nil;
    local v94 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then if v78.ctaStyle == v70.StandardLight then v79.Color.Extended.White.White_20.Color3 else v79.LightMode.ActionOverMedia.Background.Color3 else nil;
    local v95 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then if v78.ctaStyle == v70.StandardLight then v79.Color.Extended.White.White_20.Transparency else v79.LightMode.ActionOverMedia.Background.Transparency else nil;
    local l_LabelSmall_0 = v79.Typography.LabelSmall;
    local l_White_90_0 = v79.Color.Extended.White.White_90;
    local l_Small_0 = v79.Padding.Small;
    local l_XSmall_0 = v79.Padding.XSmall;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v86 = v79.Typography.BodySmall;
    end;
    local v100 = tonumber(v72.logoAspectRatio);
    local v101 = if v100 and v100 > 0 then v100 else 1;
    local v102 = if v101 == 3 then v64 else v65;
    local l_universeId_0 = v72.universeId;
    local l_placeId_0 = v72.placeId;
    local v105 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v45(l_universeId_0, v72.topicId, v72.badgeOverride) else nil;
    local l_hoverKey_0 = v72.hoverKey;
    local v107, v108 = v14.useState(false);
    local v109 = v14.useRef(nil);
    local v110 = l_useTriggerFeedback_0();
    local v111 = l_useOverflowMenuOpen_0(l_hoverKey_0);
    local v112 = v3(v109, l_hoverKey_0, true);
    local v113 = v14.useRef(false);
    local v114 = v14.useCallback(function() --[[ Line: 302 ]]
        -- upvalues: v72 (copy), v9 (ref), v74 (copy)
        if v72.isSponsored and v72.adId then
            v9(v74, v72.adId);
        end;
    end, {
        v74, 
        v72.isSponsored, 
        v72.adId
    });
    local v115 = v14.useCallback(function() --[[ Line: 308 ]]
        -- upvalues: v113 (copy)
        v113.current = false;
    end, {});
    local v117 = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then nil else v14.useCallback(function() --[[ Line: 314 ]]
        -- upvalues: v113 (copy), v110 (copy), v72 (copy), l_getOverflowMenuSignalStore_0 (ref), l_hoverKey_0 (copy)
        local l_current_0 = v113.current;
        v113.current = true;
        if l_current_0 == false then
            v110("TwoByOneTileLongPress", "Press", v72.appPage, nil);
            l_getOverflowMenuSignalStore_0().openMenu(l_hoverKey_0);
        end;
    end, {
        l_hoverKey_0, 
        v72.appPage, 
        v110
    });
    local v119 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v14.useCallback(function() --[[ Line: 325 ]]
        -- upvalues: l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v72 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), v73 (copy), l_universeId_0 (copy), v8 (ref), l_GameCollectionItemTypes_0 (ref)
        local v118 = nil;
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then
            v118 = {
                index = v72.index, 
                placeIdOverride = v72.placeIdOverride, 
                experienceJoinData = if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v72.launchDataOverride then {
                    launchData = v72.launchDataOverride
                } else nil
            };
        end;
        v73(l_universeId_0, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v118 else {
            index = v72.index
        });
        v8.logTwoByOneTileViewGameDetailsActivated();
        if v72.reportGameDetailOpened then
            v72.reportGameDetailOpened(v72.index, l_universeId_0, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile);
        end;
    end, {
        v73, 
        l_universeId_0, 
        v72.index, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v72.placeIdOverride else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v72.launchDataOverride else nil, 
        v72.reportGameDetailOpened
    }) else nil;
    local v120 = nil;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v120 = v14.useCallback(function() --[[ Line: 367 ]]
            -- upvalues: v113 (copy), v112 (copy), v12 (ref), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v72 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (ref), v73 (copy), l_universeId_0 (copy), v8 (ref), l_GameCollectionItemTypes_0 (ref), v114 (copy)
            if v113.current then
                v113.current = false;
                return;
            else
                if v112 then
                    v12.default:reset();
                end;
                local v121 = nil;
                if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then
                    v121 = {
                        index = v72.index, 
                        placeIdOverride = v72.placeIdOverride, 
                        experienceJoinData = if not l_FFlagLuaAppCustomSpawnNonNilCheck_0 or v72.launchDataOverride then {
                            launchData = v72.launchDataOverride
                        } else nil
                    };
                end;
                v73(l_universeId_0, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v121 else {
                    index = v72.index
                });
                v8.logTwoByOneTileActivated();
                if v72.reportGameDetailOpened then
                    v72.reportGameDetailOpened(v72.index, l_universeId_0, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile);
                end;
                v114();
                return;
            end;
        end, {
            v73, 
            l_universeId_0, 
            v72.index, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v72.placeIdOverride else nil, 
            if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v72.launchDataOverride else nil, 
            v72.reportGameDetailOpened, 
            v114, 
            v112
        });
    end;
    local v122 = v14.useCallback(function() --[[ Line: 418 ]]
        -- upvalues: v108 (copy)
        v108(true);
    end, {});
    local v123 = v14.useCallback(function() --[[ Line: 422 ]]
        -- upvalues: v108 (copy)
        v108(false);
    end, {});
    local l_isSponsored_0 = v72.isSponsored;
    local v125 = v14.useMemo(function() --[[ Line: 427 ]]
        -- upvalues: v7 (ref), l_isSponsored_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v72 (copy)
        return v7({
            isSponsored = l_isSponsored_0, 
            enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v72.enableSponsoredFeedback else l_isSponsored_0, 
            enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v72.enableReportAd else l_isSponsored_0, 
            enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v72.enableExplicitFeedback else nil
        });
    end, {
        l_isSponsored_0, 
        v72.enableSponsoredFeedback, 
        v72.enableReportAd, 
        v72.enableExplicitFeedback
    });
    local v126 = (not not v112 or v107 or v111) and next(v125) ~= nil;
    local v130 = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v14.useCallback(function(v127, v128) --[[ Line: 443 ]]
        -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (ref), v72 (copy), l_universeId_0 (copy), l_gameTileOverflowMenuAction_0 (ref)
        local v129 = {
            ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v72.appPage, 
            universeId = l_universeId_0, 
            sortId = v72.topicId, 
            actionType = v127 and "GameTileOverflowMenuClosed" or "GameTileOverflowMenuOpened", 
            availableMenuItems = v128
        };
        l_gameTileOverflowMenuAction_0(v129, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v72.appPage or "Unknown" else nil);
    end, {
        l_universeId_0, 
        v72.appPage, 
        v72.topicId
    }) else nil;
    if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then
        v117 = v14.useCallback(function() --[[ Line: 463 ]]
            -- upvalues: v113 (copy), v125 (copy), v110 (copy), v111 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (ref), l_universeId_0 (copy), v72 (copy), l_getOverflowMenuSignalStore_0 (ref), l_hoverKey_0 (copy), v130 (copy)
            local l_current_1 = v113.current;
            v113.current = true;
            if l_current_1 == false and next(v125) ~= nil then
                if v110 and not v111 then
                    local v132 = if l_FFlagLuaAppHapticTriggeredTelemetry_0 then {
                        universeId = l_universeId_0, 
                        sortId = v72.topicId
                    } else nil;
                    v110("TwoByOneTileLongPress", "Press", if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v72.appPage or "Unknown" else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v132 else nil);
                end;
                l_getOverflowMenuSignalStore_0().openMenu(l_hoverKey_0);
                local v133 = {};
                for v134, _ in v125 do
                    table.insert(v133, v134);
                end;
                v130(false, table.concat(v133, ","));
            end;
        end, {
            l_hoverKey_0, 
            v72.appPage, 
            v72.topicId, 
            v110, 
            v125, 
            v111, 
            l_universeId_0, 
            v130
        });
    end;
    local v136 = nil;
    if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v136 = v14.useCallback(function() --[[ Line: 507 ]]
            -- upvalues: v8 (ref)
            v8.logTwoByOneTileGameJoinInitiated();
        end, {});
    end;
    local v138 = v14.useCallback(function() --[[ Line: 513 ]]
        -- upvalues: v75 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), v112 (copy), v12 (ref), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), v114 (copy), v72 (copy), l_placeId_0 (copy), l_universeId_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_GameCollectionItemTypes_0 (ref)
        if v75 then
            l_SetGamePlaySession_0(v75, l_SessionType_0.StructuralIdentifier.GamePlayFromHoverTile, true);
        end;
        if v112 then
            v12.default:reset();
        end;
        if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v114();
        end;
        if v72.reportExperienceLaunched then
            local v137 = {
                placeId = l_placeId_0, 
                universeId = l_universeId_0, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v72.placeIdOverride else nil, 
                launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v72.launchDataOverride else nil
            };
            v72.reportExperienceLaunched(v137, v72.appPage, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile, v72.index);
        end;
    end, {
        if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v114 else nil, 
        v75, 
        v72.reportExperienceLaunched, 
        l_placeId_0, 
        l_universeId_0, 
        v72.appPage, 
        v72.index, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v72.placeIdOverride else nil, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v72.launchDataOverride else nil, 
        v112
    });
    local v139 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_usePlayButtonState_0(v74, l_universeId_0) else nil;
    local v140 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then l_useOnPlayButtonCallback_0(l_universeId_0, v72.appPage, "TwoByOneTile", nil, "TwoByOneTile", if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v72.launchDataOverride then {
        launchData = v72.launchDataOverride
    } else nil, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v72.placeIdOverride then v72.placeIdOverride else v72.placeId) else nil;
    local v141 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v14.useCallback(function() --[[ Line: 579 ]]
        -- upvalues: v8 (ref), v114 (copy)
        v8.logTwoByOneTileGameJoinInitiated();
        v8.logTwoByOneTileCtaActivated();
        v114();
    end, {
        v114
    }) else nil;
    local v142 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v14.useCallback(function() --[[ Line: 587 ]]
        -- upvalues: v8 (ref), v114 (copy), v119 (copy)
        v8.logTwoByOneTileCtaActivated();
        v114();
        v119();
    end, {
        v114, 
        v119
    }) else nil;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v136 = v14.useCallback(function() --[[ Line: 596 ]]
            -- upvalues: v8 (ref), v140 (copy), v139 (copy), v138 (copy)
            v8.logTwoByOneTileGameJoinInitiated();
            v140(v139.playButtonState, v138);
        end, {
            v140, 
            v139.playButtonState, 
            v138
        });
    end;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
        v120 = v14.useCallback(function() --[[ Line: 611 ]]
            -- upvalues: v113 (copy), v112 (copy), v12 (ref), v8 (ref), v114 (copy), v78 (ref), v69 (ref), v119 (copy), v136 (ref)
            if v113.current then
                v113.current = false;
                return;
            else
                if v112 then
                    v12.default:reset();
                end;
                v8.logTwoByOneTileActivated();
                v114();
                if v78.onTileActivation == v69.OpenEdp then
                    v119();
                    return;
                else
                    if v78.onTileActivation == v69.JoinGame then
                        v136();
                    end;
                    return;
                end;
            end;
        end, {
            v112, 
            v78.onTileActivation, 
            v119, 
            v136, 
            v114
        });
    end;
    local v144 = l_useSelector_0(function(v143) --[[ Line: 640 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), l_universeId_0 (copy)
        return v143.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    end);
    local v145 = v1(v144, v72.topicId);
    local v146 = (if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then v11.getWideImageAssetId(v145) else v145 and v145.primaryMediaAsset and v145.primaryMediaAsset.wideImageAssetId) or v144 and v144.primaryWideAssetId or nil;
    local v147 = v2(v146, l_placeId_0, true);
    local v148 = v144 and v144.ageRecommendationDisplayName or nil;
    local v149 = v14.useRef(nil);
    v14.useEffect(function() --[[ Line: 654 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v149 (copy), v72 (copy)
        l_ImpressionsTagUtility_0.AddTag(v149, v72.impressionsTag, v72.index);
        return function() --[[ Line: 656 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v149 (ref), v72 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v149, v72.impressionsTag, v72.index);
        end;
    end, {
        v72.impressionsTag, 
        v72.index
    });
    if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 and v72.isHidden then
        return v14.createElement("Frame", {
            LayoutOrder = v72.layoutOrder, 
            ZIndex = v72.zIndex, 
            BackgroundTransparency = 1
        }, {
            TwoByOneTileContainer = v14.createElement("TextButton", {
                Size = v72.size or UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ref = v109, 
                Selectable = false
            }, {
                HiddenTileContent = v14.createElement(v10, {
                    appPage = v72.appPage, 
                    collectionId = v72.topicId, 
                    setGameHidden = v72.setGameHidden, 
                    universeId = l_universeId_0, 
                    parentRef = v109, 
                    hiddenTileType = nil, 
                    isSponsored = l_isSponsored_0
                })
            })
        });
    else
        return v14.createElement("Frame", {
            LayoutOrder = v72.layoutOrder, 
            ZIndex = v72.zIndex, 
            BackgroundTransparency = 1, 
            ref = v149
        }, {
            TwoByOneTileContainer = v14.createElement("TextButton", {
                Size = v72.size or UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Text = "", 
                AutoButtonColor = false, 
                ref = v109, 
                [v14.Event.TouchLongPress] = v117, 
                [v14.Event.Activated] = v120, 
                [v14.Event.SelectionGained] = v122, 
                [v14.Event.SelectionLost] = v123, 
                [v14.Change.GuiState] = v115
            }, {
                BackgroundImage = v14.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = v147, 
                    ScaleType = Enum.ScaleType.Crop, 
                    ZIndex = 0
                }, {
                    UICorner = v14.createElement("UICorner", {
                        CornerRadius = v80
                    })
                }), 
                GradientOverlayLeft = v14.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(v68, 0, 1, 0), 
                    BackgroundColor3 = v62, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    ZIndex = 1
                }, {
                    UICorner = v14.createElement("UICorner", {
                        CornerRadius = v80
                    }), 
                    UIGradientLeft = v14.createElement("UIGradient", {
                        Rotation = 0, 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, v66), 
                            NumberSequenceKeypoint.new(1, v67)
                        }), 
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, v63), 
                            ColorSequenceKeypoint.new(1, v63)
                        })
                    })
                }), 
                GradientOverlayBottom = v14.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, v68, 0), 
                    BackgroundColor3 = v62, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    ZIndex = 1
                }, {
                    UICorner = v14.createElement("UICorner", {
                        CornerRadius = v80
                    }), 
                    UIGradientBottom = v14.createElement("UIGradient", {
                        Rotation = 90, 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, v67), 
                            NumberSequenceKeypoint.new(1, v66)
                        }), 
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, v63), 
                            ColorSequenceKeypoint.new(1, v63)
                        })
                    })
                }), 
                TileBadge = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v105 and v14.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                }, {
                    Badge = v14.createElement(v6, {
                        tileBadgesByPosition = v105
                    })
                }) else nil, 
                ContentOverlay = v14.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and 3 or 2
                }, {
                    UIPadding = v14.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v82), 
                        PaddingRight = UDim.new(0, v82), 
                        PaddingTop = UDim.new(0, v83), 
                        PaddingBottom = UDim.new(0, v83)
                    }), 
                    SponsoredBadge = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then nil else l_isSponsored_0 and v14.createElement("Frame", {
                        Position = UDim2.new(0, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = l_White_90_0.Color3, 
                        BackgroundTransparency = l_White_90_0.Transparency, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        UICorner = v14.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), 
                        UIPadding = v14.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, l_XSmall_0), 
                            PaddingBottom = UDim.new(0, l_XSmall_0), 
                            PaddingLeft = UDim.new(0, l_Small_0), 
                            PaddingRight = UDim.new(0, l_Small_0)
                        }), 
                        BadgeText = v14.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Text = v76.sponsoredText, 
                            Font = l_LabelSmall_0.Font, 
                            TextSize = l_LabelSmall_0.FontSize, 
                            TextColor3 = v79.LightMode.Content.Emphasis.Color3, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Center
                        })
                    }), 
                    Logo = (not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 or v72.logoImageAssetId) and v14.createElement(l_Image_0, {
                        Position = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        Image = "rbxassetid://" .. tostring(v72.logoImageAssetId), 
                        Size = UDim2.new(1, 0, v102, 0), 
                        aspectRatio = v101
                    }), 
                    HeaderFrame = v14.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Position = UDim2.new(0, 0, 0.47, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        UIListLayout = v14.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v87)
                        }), 
                        Headline = v14.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Text = v72.headline or "", 
                            Font = v84.Font, 
                            TextSize = v84.FontSize, 
                            TextColor3 = v62, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            TextWrapped = true
                        }), 
                        Subtitle = v14.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Text = v72.subtitle or "", 
                            Font = v85.Font, 
                            TextSize = v85.FontSize, 
                            TextColor3 = v62, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            TextWrapped = true
                        })
                    }), 
                    JoinButtonContainer = (not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 or v78.onCtaActivation == v69.JoinGame) and v14.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 0, 1, 0), 
                        AnchorPoint = Vector2.new(0, 1)
                    }, {
                        JoinButton = v14.createElement(l_PlayButton_0, {
                            universeId = l_universeId_0, 
                            placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v72.placeIdOverride then v72.placeIdOverride else l_placeId_0, 
                            referralSource = v72.appPage, 
                            eventContext = "TwoByOneTile", 
                            launchSource = l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and "TwoByOneTile" or nil, 
                            playableText = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v77 else v76.joinButtonText, 
                            hidePlayableIcon = true, 
                            buttonSize = v88, 
                            width = if l_FFlagLuaAppFixTwoByOneJoinButtonWidth_0 then v93 else nil, 
                            onActivated = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v141 else v136, 
                            reportExperienceLaunched = v138, 
                            experienceJoinData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v72.launchDataOverride then {
                                launchData = v72.launchDataOverride
                            } else nil
                        })
                    }), 
                    ViewGameDetailsButton = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v78.onCtaActivation == v69.OpenEdp and v14.createElement("TextButton", {
                        Size = UDim2.new(v93.Scale, v93.Offset, 0, v89), 
                        Position = UDim2.new(0, 0, 1, 0), 
                        AnchorPoint = Vector2.new(0, 1), 
                        BackgroundColor3 = v94, 
                        BackgroundTransparency = v95, 
                        Text = v77, 
                        TextColor3 = v79.LightMode.ActionOverMedia.Foreground.Color3, 
                        Font = v90.Font, 
                        TextSize = v90.FontSize, 
                        [v14.Event.Activated] = v142
                    }, {
                        UICorner = v14.createElement("UICorner", {
                            CornerRadius = UDim.new(0, v79.Radius.Medium)
                        })
                    }) else nil, 
                    BottomRightLabel = v14.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        Size = UDim2.new(0, 0, 0, v86.FontSize * v86.LineHeight), 
                        BackgroundTransparency = 1, 
                        Text = v148, 
                        TextSize = v86.FontSize, 
                        Font = v86.Font, 
                        TextColor3 = v79.Color.Extended.Gray.Gray_400.Color3, 
                        TextXAlignment = Enum.TextXAlignment.Right, 
                        TextTruncate = Enum.TextTruncate.SplitWord, 
                        AnchorPoint = Vector2.new(1, 1), 
                        Position = UDim2.new(1, 0, 1, 0)
                    })
                }), 
                OverflowMenuContainer = v126 and v14.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and 4 or 3
                }, {
                    OverflowMenu = v14.createElement(v5, {
                        isHovered = v112, 
                        isSelected = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v107 else nil, 
                        universeId = l_universeId_0, 
                        collectionId = v72.topicId, 
                        appPage = v72.appPage, 
                        setGameHidden = v72.setGameHidden or function() --[[ Line: 957 ]]

                        end, 
                        menuKey = l_hoverKey_0, 
                        menuOpen = v111, 
                        onMenuOpenChanged = if l_FFlagLuaAppFixTwoByOneOverflowMenuTelemetry_0 then v130 else nil, 
                        parentRef = v109, 
                        isSponsored = v72.isSponsored, 
                        payerName = v72.payerName, 
                        sponsoredUserCohort = v72.sponsoredUserCohort, 
                        adId = v72.adId, 
                        availableMenuItems = v125
                    })
                })
            })
        });
    end;
end;