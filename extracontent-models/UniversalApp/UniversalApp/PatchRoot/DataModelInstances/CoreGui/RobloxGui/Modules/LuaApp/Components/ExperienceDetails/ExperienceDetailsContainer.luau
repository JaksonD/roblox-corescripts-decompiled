local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_getFirstFocusableDescendant_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).getFirstFocusableDescendant;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v7 = require(l_CorePackages_0.Packages.React);
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local _ = require(l_CorePackages_0.Workspace.Packages.PlayabilityRodux);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v12 = require(script.Parent.ExperienceDetailsExperimentation);
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_useUiModeInfo_0 = v13.useUiModeInfo;
local l_useDeviceType_0 = v13.useDeviceType;
local l_useRoactService_0 = v13.useRoactService;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_hasPageInCurrentRoute_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryRouting).hasPageInCurrentRoute;
local l_selectCurrentLegacyRoute_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors.selectCurrentLegacyRoute;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_GameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents;
local l_Follow_0 = l_GameDetailsEvents_0.Follow;
local l_MediaGalleryActivated_0 = l_GameDetailsEvents_0.MediaGalleryActivated;
local l_MediaGalleryMediaChanged_0 = l_GameDetailsEvents_0.MediaGalleryMediaChanged;
local l_MediaGalleryEnterFullscreen_0 = l_GameDetailsEvents_0.MediaGalleryEnterFullscreen;
local l_MediaGalleryExitFullscreen_0 = l_GameDetailsEvents_0.MediaGalleryExitFullscreen;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v32 = require(script.Parent.useExperienceDetailsState);
local v33 = require(script.Parent.useExperienceDetailsFetches);
local v34 = require(script.Parent.Hooks.useExperienceDetailsDesignTokens);
local v35 = require(script.Parent.useExperienceDetailsNavigation);
local v36 = require(script.Parent.useExperienceDetailsFocusNavigationBindings);
local v37 = require(script.Parent.useExperienceDetailsConfiguration);
local v38 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsPage);
local v39 = require(l_Modules_0.LuaApp.Common.Experience.Connectors.LaunchExperienceConnector);
local v40 = require(l_Modules_0.LuaApp.Thunks.SendGameFollow);
local v41 = require(l_Modules_0.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer);
local v42 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix);
local v43 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local l_FFlagLuaAppEnablePlaySquadButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton;
local l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability;
local l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry;
local l_FFlagLuaAppEdpFixDefaultBanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpFixDefaultBanner;
local l_FFlagLuaAppShowNoticeOnEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppShowNoticeOnEdp;
local l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp;
local l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp;
local l_FFlagSongEdpCarouselIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp;
local v56 = require(l_Modules_0.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation);
local l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry;
local l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonNonMobileEdp;
local l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp;
local l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents;
local l_FFlagLuaAppAddIgrsRatingToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
return (v39.connect(function(v64) --[[ Line: 550 ]]
    -- upvalues: l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy)
    return {
        universeId = v64.universeId, 
        launchSource = "ExperienceDetailsPage", 
        referralSource = v64.referralSource, 
        extraParams = if v64.experienceJoinData then v64.experienceJoinData else nil, 
        placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v64.placeIdOverride else nil
    };
end, function(v65, _) --[[ Line: 558 ]]
    -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (copy)
    return {
        playabilityStatus = v65.playabilityStatus, 
        playButtonState = v65.playButtonState, 
        onPlayButtonActivated = v65.onPlayButtonActivated, 
        onPlaySquadButtonActivated = if l_FFlagLuaAppEnablePlaySquadButton_0 then v65.onPlaySquadButtonActivated else nil, 
        playButtonContextualMessage = v65.playButtonContextualMessage
    };
end)(function(v67) --[[ Line: 116 ]] --[[ Name: ExperienceDetailsContainer ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppLinking_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_useSelector_0 (copy), l_selectCurrentLegacyRoute_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v12 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v7 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v32 (copy), v35 (copy), v33 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_useDispatch_0 (copy), l_useDeviceType_0 (copy), v43 (copy), v42 (copy), l_useUiModeInfo_0 (copy), l_useUserExperiment_0 (copy), l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), l_GetNotificationsExperienceDetailsVariant_0 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), v40 (copy), l_Follow_0 (copy), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_MediaGalleryActivated_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_MediaGalleryMediaChanged_0 (copy), l_MediaGalleryEnterFullscreen_0 (copy), l_MediaGalleryExitFullscreen_0 (copy), l_hasPageInCurrentRoute_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), l_GuiService_0 (copy), l_getSafeAreaSize_0 (copy), v41 (copy), v37 (copy), v34 (copy), l_getFirstFocusableDescendant_0 (copy), v36 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v38 (copy), l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppEdpFixDefaultBanner_0 (copy), v56 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy)
    local v69 = l_useAppPolicy_0(function(v68) --[[ Line: 118 ]]
        -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (ref)
        return {
            roundedCorners = v68.getUseRoundedCorners(), 
            webViewSupport = v68.getWebViewSupport(), 
            notificationsCanEnableExperience = v68.getNotificationsCanReceiveExperience(), 
            experienceDetailsNoticeType = if l_FFlagLuaAppShowNoticeOnEdp_0 then v68.getExperienceDetailsNoticeType() else nil
        };
    end);
    local v70 = l_useRoactService_0(l_RoactNetworking_0);
    local v71 = l_useRoactService_0(l_AppLinking_0);
    local v72 = l_useRoactService_0(l_AppEventIngestService_0);
    local v73 = l_useRoactService_0(l_AppSessionService_0);
    local v75 = l_useSelector_0(function(v74) --[[ Line: 136 ]]
        return {
            screenSize = v74.ScreenSize, 
            globalGuiInset = v74.GlobalGuiInset
        };
    end);
    local v76 = l_useSelector_0(l_selectCurrentLegacyRoute_0);
    local v77 = nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then
        v77 = v12.getShouldHydrateLegacy();
    end;
    local v78 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v78 = v12.getShouldInterleaveSdui();
    end;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v7.useEffect(function() --[[ Line: 155 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ExperienceDetailsPageExposureLayer);
        end, {});
    end;
    local v79 = v32(v67, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v77 else nil);
    local v80 = v35(if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v77 else nil);
    local v81 = v33(if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v67.universeId else nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v77 else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v78 else nil);
    local v82 = nil;
    local v83 = l_useDispatch_0();
    local v84 = l_useDeviceType_0();
    local v85 = nil;
    if v43() and v42() then
        local v86 = l_useUiModeInfo_0();
        local l_v86_0 = v86 --[[ copy: 17 -> 44 ]];
        v85 = v7.useCallback(function() --[[ Line: 184 ]]
            -- upvalues: v81 (copy), v70 (copy), v67 (copy), l_v86_0 (copy)
            return v81.fetchGameDetailsPageData(v70, v67.universeId, l_v86_0);
        end, {
            v70, 
            v67.universeId, 
            v86
        });
    else
        v85 = v7.useCallback(function() --[[ Line: 188 ]]
            -- upvalues: v81 (copy), v70 (copy), v67 (copy)
            return v81.fetchGameDetailsPageData(v70, v67.universeId, nil);
        end, {
            v70, 
            v67.universeId
        });
    end;
    local v89 = l_useUserExperiment_0({
        l_AppUserLayers_0.EDPCommunityLinksLayer
    }, function(v88) --[[ Line: 195 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v88[l_AppUserLayers_0.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {};
    end, false);
    local v91 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or l_useUserExperiment_0({
        l_AppUserLayers_0.ExperienceDetailsPageLayer
    }, function(v90) --[[ Line: 204 ]]
        -- upvalues: l_AppUserLayers_0 (ref), l_GetNotificationsExperienceDetailsVariant_0 (ref)
        return ((v90[l_AppUserLayers_0.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1) == 2;
    end, true);
    local v92 = nil;
    if l_FFlagSongEdpCarouselIxp_0 then
        v92 = l_useUserExperiment_0({
            l_AppUserLayers_0.ExperienceDetailsPageExposureLayer
        }, function(v93) --[[ Line: 215 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            return (v93[l_AppUserLayers_0.ExperienceDetailsPageExposureLayer] or {}).showSongCarousel;
        end, true);
    end;
    local v94 = nil;
    local v95 = nil;
    if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 or l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then
        local v99, v100 = l_useUserExperiment_0({
            l_AppUserLayers_0.ExperienceDetailsPageExposureLayer
        }, function(v96) --[[ Line: 227 ]]
            -- upvalues: l_AppUserLayers_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref)
            local v97 = v96[l_AppUserLayers_0.ExperienceDetailsPageExposureLayer] or {};
            local v98 = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v97.MediaGalleryRedesignEnabled else nil;
            if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then
                return v98, v97.MediaGalleryVideoPreviewEnabled;
            else
                return v98, nil;
            end;
        end, true);
        v94 = v99;
        v95 = v100;
    end;
    local v101 = nil;
    local v102 = nil;
    if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then
        local v105, v106 = l_useUserExperiment_0({
            l_AppUserLayers_0.PlayButtonUXExposureLayer
        }, function(v103) --[[ Line: 240 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            local v104 = v103[l_AppUserLayers_0.PlayButtonUXExposureLayer] or {};
            return v104.HasUnifiedPlayButton, v104.UnifyToUIBlox;
        end, true);
        v101 = v105;
        v102 = v106;
    end;
    v7.useEffect(function() --[[ Line: 248 ]]
        -- upvalues: v85 (ref)
        v85();
    end, {
        v67.universeId
    });
    local v112 = v7.useCallback(function(v107, v108) --[[ Line: 252 ]]
        -- upvalues: v79 (copy), v83 (copy), v40 (ref), v70 (copy), v91 (copy), l_Follow_0 (ref), v72 (copy)
        local v109 = v79.gameDetail and v79.gameDetail.rootPlaceId or v79.gameInfo and v79.gameInfo.placeId;
        if v109 == nil or v107 == nil then
            return;
        else
            local v110 = v79.notificationsEnabled and v79.notificationsEnabled.count or 0;
            local v111 = v79.notificationsEnabled and v79.notificationsEnabled.limit or 0;
            v83(v40(v70, v107, v108, v91, v110, v111));
            l_Follow_0(v72, "ExperienceDetailsActionBar", v109, not v108);
            return;
        end;
    end, {
        v83, 
        v70, 
        v72, 
        v67.universeId, 
        v79
    });
    local v113 = nil;
    local v114 = nil;
    if l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 and not l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then
        v113 = v7.useCallback(function(v115) --[[ Line: 282 ]]
            -- upvalues: v79 (copy), l_MediaGalleryActivated_0 (ref), v72 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref), v67 (copy)
            local v116 = v79.gameDetail and v79.gameDetail.rootPlaceId or v79.gameInfo and v79.gameInfo.placeId;
            if v116 then
                l_MediaGalleryActivated_0(v72, "ExperienceDetailsPage", v116, {
                    selectedIndex = v115, 
                    universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
                });
            end;
        end, {
            v72, 
            v79, 
            if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
        });
        v114 = v7.useCallback(function(v117, v118) --[[ Line: 301 ]]
            -- upvalues: v79 (copy), l_MediaGalleryMediaChanged_0 (ref), v72 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref), v67 (copy)
            local v119 = v79.gameDetail and v79.gameDetail.rootPlaceId or v79.gameInfo and v79.gameInfo.placeId;
            if v119 and v117 ~= v118 then
                l_MediaGalleryMediaChanged_0(v72, "ExperienceDetailsPage", v119, {
                    previousIndex = v117, 
                    selectedIndex = v118, 
                    universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
                });
            end;
        end, {
            v72, 
            v79, 
            if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
        });
    end;
    local v120 = nil;
    local v121 = nil;
    local v122 = nil;
    if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then
        v120 = v7.useCallback(function(v123, v124, v125, v126) --[[ Line: 327 ]]
            -- upvalues: v79 (copy), l_MediaGalleryMediaChanged_0 (ref), v72 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref), v67 (copy)
            local v127 = v79.gameDetail and v79.gameDetail.rootPlaceId or v79.gameInfo and v79.gameInfo.placeId;
            if v127 then
                l_MediaGalleryMediaChanged_0(v72, "ExperienceDetailsPage", v127, {
                    imageAssetId = v123, 
                    videoAssetId = v124, 
                    isYouTubeVideo = v125, 
                    autoAdvance = v126, 
                    universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
                });
            end;
        end, {
            v72, 
            v79, 
            if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
        });
        v121 = v7.useCallback(function(v128, v129) --[[ Line: 349 ]]
            -- upvalues: v79 (copy), l_MediaGalleryEnterFullscreen_0 (ref), v72 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref), v67 (copy)
            local v130 = v79.gameDetail and v79.gameDetail.rootPlaceId or v79.gameInfo and v79.gameInfo.placeId;
            if v130 then
                l_MediaGalleryEnterFullscreen_0(v72, "ExperienceDetailsPage", v130, {
                    selectedIndex = v128, 
                    isVideo = v129, 
                    universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
                });
            end;
        end, {
            v72, 
            v79, 
            if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
        });
        v122 = v7.useCallback(function(v131, v132) --[[ Line: 369 ]]
            -- upvalues: v79 (copy), l_MediaGalleryExitFullscreen_0 (ref), v72 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref), v67 (copy)
            local v133 = v79.gameDetail and v79.gameDetail.rootPlaceId or v79.gameInfo and v79.gameInfo.placeId;
            if v133 then
                l_MediaGalleryExitFullscreen_0(v72, "ExperienceDetailsPage", v133, {
                    selectedIndex = v131, 
                    isVideo = v132, 
                    universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
                });
            end;
        end, {
            v72, 
            v79, 
            if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v67.universeId else nil
        });
    end;
    local v134 = v7.useCallback(function() --[[ Line: 389 ]]
        -- upvalues: v80 (copy), l_hasPageInCurrentRoute_0 (ref), v76 (copy), l_AppPage_0 (ref), v73 (copy), l_SessionType_0 (ref)
        v80.navigateBack();
        if not (l_hasPageInCurrentRoute_0(v76, l_AppPage_0.GameDetail, true) or l_hasPageInCurrentRoute_0(v76, l_AppPage_0.ExperienceDetail, true)) then
            v73:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
        end;
    end, {
        v80, 
        v76
    });
    local l_screenSize_0 = v75.screenSize;
    local l_l_GuiService_0_SafeZoneOffsets_0 = l_GuiService_0:GetSafeZoneOffsets();
    local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_0, l_l_GuiService_0_SafeZoneOffsets_0).Y.Offset;
    local v138 = UDim2.new(1, 0, 1, 0);
    if v69.roundedCorners then
        v138 = UDim2.new(1, 0, 1, 0);
    end;
    local v139 = v79.gameDetail and v79.gameDetail.creator;
    local v140 = if v41() then v139 and v139.hasVerifiedBadge else v79.creatorVerified;
    local v141 = v37();
    v82 = v34();
    local v142 = v7.useRef(nil);
    local v143 = v7.useCallback(function() --[[ Line: 425 ]]
        -- upvalues: v142 (copy), l_GuiService_0 (ref), l_getFirstFocusableDescendant_0 (ref)
        if v142.current then
            l_GuiService_0.SelectedCoreObject = l_getFirstFocusableDescendant_0(v142.current);
        end;
    end, {});
    local v145 = v7.useCallback(function(_) --[[ Line: 435 ]]
        -- upvalues: v67 (copy)
        v67.onPlayButtonActivated();
    end, {
        v67.onPlayButtonActivated
    });
    local v146, v147 = v36(v145, v143);
    return v7.createElement("Frame", {
        ref = v146, 
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, l_l_GuiService_0_SafeZoneOffsets_0.top), 
        Size = v138, 
        BackgroundTransparency = 1, 
        ClipsDescendants = not l_FFlagExtendScrollingFramesBySafeInsets_0 or false
    }, {
        ExperienceDetailsPage = v7.createElement(v67.ExperienceDetailsPage or v38, {
            universeId = v67.universeId, 
            referralSource = v67.referralSource, 
            experienceJoinData = if l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 then v67.experienceJoinData else nil, 
            placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v67.placeIdOverride else nil, 
            onClose = v134, 
            statsAndInfoRef = v142, 
            thumbnail = v79.thumbnail, 
            bannerImageId = v79.bannerImageId, 
            defaultBannerUrl = if l_FFlagLuaAppEdpFixDefaultBanner_0 then v79.defaultBannerUrl else nil, 
            gameInfo = v79.gameInfo, 
            gameDetail = v79.gameDetail, 
            gameDetailError = v79.gameDetailError, 
            creatorVerified = v140, 
            gameDetailsPageDataStatus = v79.gameDetailsPageDataStatus, 
            gameProductInfo = v79.gameProductInfo, 
            socialLinks = v79.socialLinks, 
            ageRecommendations = v79.ageRecommendations, 
            communityLink = v79.communityLink, 
            communityLinksEnabled = v89.inTreatment, 
            communityLinkVariant = v89.linkVariant, 
            gameFollowings = v79.gameFollowings, 
            enableNotificationsDiscoverability = v91, 
            mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v94 else nil, 
            mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v95 else nil, 
            showSongCarousel = if l_FFlagSongEdpCarouselIxp_0 then v92 else nil, 
            hasUnifiedPlayButtonIxp = if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then v101 else nil, 
            unifyToUIBloxIxp = if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then v102 else nil, 
            fetchGameDetailsPageData = v85, 
            openLeaveRobloxAlertUIBlox = v80.openLeaveRobloxAlertUIBlox, 
            openVerifiedBadgeModal = v80.openVerifiedBadgeModal, 
            closeAlert = v80.closeAlert, 
            openMoreContextualMenu = v80.openMoreContextualMenu, 
            openShareContextualMenu = v80.openShareContextualMenu, 
            openCreatorPage = if v56 then nil else v80.openCreatorPage, 
            openCommunityProfilePage = if v56 then v80.openCommunityProfilePage else nil, 
            openUserProfilePage = if v56 then v80.openUserProfilePage else nil, 
            openExperienceGuidelinesExplained = v80.openExperienceGuidelinesExplained, 
            setControllerBarNavigation = v147, 
            playabilityStatus = v67.playabilityStatus, 
            playButtonState = v67.playButtonState, 
            onPlayButtonActivated = v67.onPlayButtonActivated, 
            onPlaySquadButtonActivated = if l_FFlagLuaAppEnablePlaySquadButton_0 then v67.onPlaySquadButtonActivated else nil, 
            playButtonContextualMessage = v67.playButtonContextualMessage, 
            toggleFollowExperience = if v91 then v112 else nil, 
            onMediaGalleryPreviewActivated = if not l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 or l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v113, 
            onMediaGalleryThumbnailActivated = if not l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 or l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v114, 
            onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v120 else nil, 
            onMediaGalleryEnterFullscreen = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v121 else nil, 
            onMediaGalleryExitFullscreen = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v122 else nil, 
            openRefundPolicyLearnMorePage = v80.openRefundPolicyLearnMorePage, 
            openWebview = if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v80.openWebview else nil, 
            linking = v71, 
            deviceType = v84, 
            viewHeight = l_Offset_0, 
            detailsPageConfiguration = v141, 
            tokens = v82, 
            webViewSupport = v69.webViewSupport, 
            notificationsCanEnableExperience = v69.notificationsCanEnableExperience, 
            experienceDetailsNoticeType = if l_FFlagLuaAppShowNoticeOnEdp_0 then v69.experienceDetailsNoticeType else nil
        })
    });
end));