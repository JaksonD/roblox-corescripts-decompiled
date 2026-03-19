local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_withStyle_0 = v3.Core.Style.withStyle;
local v6 = require(l_CorePackages_0.Packages.t);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v8 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_DeviceType_0 = v13.DeviceType;
local l_UiMode_0 = v13.UiMode;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_GameMediaImageType_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).GameMediaImageType;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_VideoPlaybackCoordinator_0 = require(l_CorePackages_0.Workspace.Packages.VideoUtils).VideoPlaybackCoordinator;
local v21 = require(l_CorePackages_0.Workspace.Packages.AppBlox);
local l_MediaGalleryPreview_0 = v21.MediaGalleryPreview;
local l_MediaGalleryCarousel_0 = v21.MediaGalleryCarousel;
local l_MediaGalleryFullScreen_0 = v21.MediaGalleryFullScreen;
local l_CrossFadeAnimatedView_0 = v21.CrossFadeAnimatedView;
local l_MediaGalleryExpandableView_0 = v21.MediaGalleryExpandableView;
local l_calcMediaGallerySizesFromWidth_0 = v21.calcMediaGallerySizesFromWidth;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v29 = require(l_Modules_0.LuaApp.Thunks.OpenYouTubeVideo);
local v30 = require(l_Modules_0.LuaApp.Analytics.Events.openYouTubeVideo);
local v31 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v32 = require(script.Parent.ExperienceDetailsFullscreenNavigationBindings);
local v33 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.MediaGallerySnapping);
local v34 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.MediaGallerySnappingFull);
local v35 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Hooks.useSelectedGameMediaEntries);
local v36 = require(script.Parent.Hooks.useMediaGalleryVideoAnalytics);
local v37 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local v38 = require(script.Parent.Flags.FFlagEDPMediaAddLocalization10ft);
local l_GetFFlagConsoleApplyTokenizationEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagConsoleApplyTokenizationEdp;
local l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry;
local l_FFlagLuaAppEdpMediaGalleryRedesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesign;
local l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance;
local l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v50 = {
    view = "view", 
    play = "play"
};
local v51 = v1.PureComponent:extend("ExperienceMediaGallery");
v51.validateProps = v6.interface({
    universeId = v6.string, 
    startIndex = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v6.optional(v6.number) else nil, 
    isFullscreen = v6.optional(v6.boolean), 
    fullscreenShowIndex = v6.optional(v6.integer), 
    onPreviewActivated = v6.optional(v6.callback), 
    onThumbnailActivated = if l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 then v6.optional(v6.callback) else nil, 
    deviceType = v6.optional(v6.string), 
    tokens = v6.optional(v6.table), 
    showYouTubeVideoFirst = v6.optional(v6.boolean), 
    onSwipe = v6.optional(v6.callback), 
    onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v6.optional(v6.callback) else nil, 
    isOccluded = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and (l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryVideoPreview_0) then v6.optional(v6.boolean) else nil, 
    uiMode = v6.optional(v6.string), 
    isFullscreenState = v6.optional(v6.boolean), 
    onSelectionGained = v6.optional(v6.callback), 
    mediaGalleryGainFocused = v6.optional(v6.callback), 
    expandableAreaHeightOffset = v6.optional(v6.number), 
    nextIndex = v6.optional(v6.number), 
    isCrossFade = v6.optional(v6.boolean), 
    currentIndex = v6.optional(v6.number), 
    setCurrentIndex = v6.optional(v6.callback), 
    setCrossFade = v6.optional(v6.callback), 
    exitFullscreen = v6.optional(v6.callback), 
    selectedGameMediaEntries = v6.optional(v6.table), 
    videoAnalytics = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v6.optional(v6.table) else nil, 
    placeId = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v6.optional(v6.string) else nil, 
    mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v6.optional(v6.boolean) else nil, 
    mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v6.optional(v6.boolean) else nil, 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v6.optional(v6.boolean) else nil
});
v51.defaultProps = {
    isFullscreen = false, 
    fullscreenShowIndex = 1, 
    showYouTubeVideoFirst = true, 
    isFullscreenState = false, 
    expandableAreaHeightOffset = if l_GetFFlagConsoleApplyTokenizationEdp_0() then nil else 592, 
    nextIndex = 1
};
v51.init = function(v52) --[[ Line: 135 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_VideoPlaybackCoordinator_0 (copy), l_calcMediaGallerySizesFromWidth_0 (copy), l_memoize_0 (copy), v8 (copy), l_GameMediaImageType_0 (copy), v50 (copy), l_UiMode_0 (copy), v30 (copy)
    local v53, v54 = v1.createBinding(0);
    v52.containerHeight = v53;
    v52.updateContainerHeight = v54;
    v52.containerSize = v52.containerHeight:map(function(v55) --[[ Line: 137 ]]
        return UDim2.new(1, 0, 0, v55);
    end);
    v52.mediaGalleryVideoPreviewEnabled = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then not l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 or v52.props.mediaGalleryVideoPreviewEnabledIxp else nil;
    v52.videoPlaybackCoordinator = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v52.mediaGalleryVideoPreviewEnabled then l_VideoPlaybackCoordinator_0.new() else nil;
    v52.onResize = function(v56) --[[ Line: 150 ]]
        -- upvalues: l_calcMediaGallerySizesFromWidth_0 (ref), v52 (copy)
        local l_X_0 = v56.AbsoluteSize.X;
        local l_Offset_0 = l_calcMediaGallerySizesFromWidth_0(l_X_0, 5).contentSize.Y.Offset;
        if l_Offset_0 ~= v52.containerHeight:getValue() then
            v52.updateContainerHeight(l_Offset_0);
        end;
    end;
    v52.getItemsFromEntries = l_memoize_0(function(v59) --[[ Line: 159 ]]
        -- upvalues: v8 (ref), l_GameMediaImageType_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), v52 (copy)
        return v8.List.map(v59, function(v60) --[[ Line: 160 ]]
            -- upvalues: l_GameMediaImageType_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), v52 (ref)
            return {
                imageId = v60.imageId, 
                isYouTubeVideo = v60.mediaType == l_GameMediaImageType_0.YouTubeVideo, 
                videoId = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v52.mediaGalleryVideoPreviewEnabled then v60.videoId else nil
            };
        end);
    end);
    v52.performOpenYouTubeVideo = function(v61, v62) --[[ Line: 171 ]]
        -- upvalues: v52 (copy), v50 (ref)
        local l_guiService_0 = v52.props.guiService;
        local l_openYouTubeVideo_0 = v52.props.openYouTubeVideo;
        local l_eventIngest_0 = v52.props.eventIngest;
        local l_universeId_0 = v52.props.universeId;
        local l_youTubeVideoHash_0 = v61.youTubeVideoHash;
        local l_youTubeVideoTitle_0 = v61.youTubeVideoTitle;
        if l_youTubeVideoHash_0 and #l_youTubeVideoHash_0 > 0 and l_youTubeVideoTitle_0 and #l_youTubeVideoTitle_0 > 0 then
            l_openYouTubeVideo_0(l_guiService_0, l_youTubeVideoHash_0, l_youTubeVideoTitle_0, v62, l_eventIngest_0, l_universeId_0, v50.play);
        end;
    end;
    v52.openYouTubeVideoItem = function(v69) --[[ Line: 192 ]]
        -- upvalues: v52 (copy)
        local l_openLeaveRobloxAlertUIBlox_0 = v52.props.openLeaveRobloxAlertUIBlox;
        local l_showYouTubeAgeAlert_0 = v52.props.showYouTubeAgeAlert;
        local v72 = v52.props.selectedGameMediaEntries[v69];
        local function v73() --[[ Line: 198 ]]
            -- upvalues: v52 (ref), v72 (copy)
            v52.performOpenYouTubeVideo(v72, "gameDetailsAccordianImage");
        end;
        if l_showYouTubeAgeAlert_0 then
            l_openLeaveRobloxAlertUIBlox_0(v73);
            return;
        else
            v52.performOpenYouTubeVideo(v72, "gameDetailsAccordianImage");
            return;
        end;
    end;
    if v52.props.uiMode == l_UiMode_0.TenFoot then
        v52.getConsoleItemsFromEntries = l_memoize_0(function(v74) --[[ Line: 210 ]]
            -- upvalues: v8 (ref), l_GameMediaImageType_0 (ref)
            return v8.List.filter(v74, function(v75) --[[ Line: 211 ]]
                -- upvalues: l_GameMediaImageType_0 (ref)
                return v75.mediaType ~= l_GameMediaImageType_0.YouTubeVideo;
            end);
        end);
    end;
    v52.logMediaItemsContainYouTubeVideo = function(v76) --[[ Line: 217 ]]
        -- upvalues: v52 (copy), l_UiMode_0 (ref), v8 (ref), l_GameMediaImageType_0 (ref), v30 (ref), v50 (ref)
        local l_eventIngest_1 = v52.props.eventIngest;
        local l_universeId_1 = v52.props.universeId;
        local v79 = if v52.props.uiMode == l_UiMode_0.TenFoot then {} else v52.props.selectedGameMediaEntries;
        local v81 = v8.List.filter(v79, function(v80) --[[ Line: 223 ]]
            -- upvalues: l_GameMediaImageType_0 (ref)
            return v80.mediaType == l_GameMediaImageType_0.YouTubeVideo;
        end)[1];
        if v81 then
            v30(l_eventIngest_1, v76, v81.youTubeVideoTitle, v81.youTubeVideoHash, l_universeId_1, v50.view);
        end;
    end;
    if not v52.props.isFullScreen then
        v52.logMediaItemsContainYouTubeVideo("gameDetailsAccordianImage");
    end;
end;
v51.didUpdate = function(v82, v83, _) --[[ Line: 244 ]] --[[ Name: didUpdate ]]
    -- upvalues: v8 (copy)
    if not v82.props.isFullScreen and not v8.List.equals(v83.selectedGameMediaEntries, v82.props.selectedGameMediaEntries) then
        v82.logMediaItemsContainYouTubeVideo("gameDetailsAccordianImage");
    end;
end;
v51.renderWithLocalization = function(v85, v86) --[[ Line: 253 ]] --[[ Name: renderWithLocalization ]]
    -- upvalues: l_UiMode_0 (copy)
    local l_selectedGameMediaEntries_0 = v85.props.selectedGameMediaEntries;
    local v88 = if v85.props.uiMode == l_UiMode_0.TenFoot then v85.getConsoleItemsFromEntries(l_selectedGameMediaEntries_0) else v85.getItemsFromEntries(l_selectedGameMediaEntries_0);
    if #v88 <= 0 then
        return nil;
    else
        return v85.props.isFullscreen and v85:renderFullscreen(v88) or v85:renderPreview(v88, v86);
    end;
end;
v51.render = function(v89) --[[ Line: 267 ]] --[[ Name: render ]]
    -- upvalues: v38 (copy), l_withLocalization_0 (copy)
    if v38 then
        return l_withLocalization_0({
            titleText = "Feature.GameDetails.Heading.Media"
        })(function(v90) --[[ Line: 271 ]]
            -- upvalues: v89 (copy)
            return v89:renderWithLocalization(v90);
        end);
    else
        return v89:renderWithLocalization();
    end;
end;
v51.renderPreview = function(v91, v92, v93) --[[ Line: 279 ]] --[[ Name: renderPreview ]]
    -- upvalues: l_FFlagLuaAppEdpMediaGalleryRedesign_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_DeviceType_0 (copy), v1 (copy), l_MediaGalleryCarousel_0 (copy), v33 (copy), l_UiMode_0 (copy), l_CursorKind_0 (copy), l_GetFFlagConsoleApplyTokenizationEdp_0 (copy), l_withStyle_0 (copy), v32 (copy), l_MediaGalleryExpandableView_0 (copy), v38 (copy), v37 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_MediaGalleryPreview_0 (copy), l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 (copy)
    local v94 = nil;
    if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then
        v94 = not l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 or v91.props.mediaGalleryRedesignEnabledIxp;
    end;
    if v91.props.deviceType == l_DeviceType_0.Tablet and (not l_FFlagLuaAppEdpMediaGalleryRedesign_0 or not v94) then
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 100), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            [v1.Change.AbsoluteSize] = v91.onResize
        }, {
            MediaGalleryCarousel = v1.createElement(l_MediaGalleryCarousel_0, {
                items = v92, 
                onPreviewActivated = v91.props.onPreviewActivated, 
                onVideoPlayActivated = v91.openYouTubeVideoItem
            })
        });
    elseif v91.props.deviceType == l_DeviceType_0.Phone and (not l_FFlagLuaAppEdpMediaGalleryRedesign_0 or not v94) then
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            MediaGallerySnapping = v1.createElement(v33, {
                items = v92, 
                itemPadding = 8, 
                borderRadius = UDim.new(0, 8), 
                showCounter = false, 
                onSwipe = v91.props.onSwipe, 
                onVideoPlayActivated = v91.openYouTubeVideoItem
            })
        });
    elseif v91.props.uiMode == l_UiMode_0.TenFoot then
        local v95 = nil;
        v95 = if v91.props.isFullscreenState then l_CursorKind_0.Invisible else l_CursorKind_0.RoundedRect;
        local v96 = if l_GetFFlagConsoleApplyTokenizationEdp_0() and v91.props.tokens then v91.props.tokens.expandableAreaHeightOffset else v91.props.expandableAreaHeightOffset;
        return l_withStyle_0(function(v97) --[[ Line: 335 ]]
            -- upvalues: v1 (ref), v32 (ref), v91 (copy), l_MediaGalleryExpandableView_0 (ref), v92 (copy), v38 (ref), v93 (copy), v95 (ref), v37 (ref), v96 (copy)
            return v1.createElement(v32.OnNavigateBackWrapper, {
                onNavigateBack = v91.props.exitFullscreen
            }, v1.createElement(l_MediaGalleryExpandableView_0, {
                items = v92, 
                titleText = if v38 and v93 then v93.titleText else nil, 
                showCursor = not v91.props.isFullscreenState, 
                selectionCursor = v95, 
                styleProps = if v37 then {
                    titleFont = v97.Tokens.Semantic.Typography.Header
                } else nil, 
                exitFullscreen = if v91.props.isFullscreenState then v91.props.exitFullscreen else function() --[[ Line: 351 ]]

                end, 
                onActivated = v91.props.onPreviewActivated, 
                onSelectionGained = function(v98) --[[ Line: 353 ]] --[[ Name: onSelectionGained ]]
                    -- upvalues: v92 (ref), v91 (ref)
                    local v99 = "";
                    if v92[v98] then
                        v99 = string.split(v92[v98].imageId, "=")[2];
                    end;
                    v91.props.onSelectionGained(v98, v99);
                end, 
                mediaGalleryGainFocused = v91.props.mediaGalleryGainFocused, 
                groupTransparency = 0, 
                expandableAreaHeightOffset = v96, 
                animationConfig = if v91.props.tokens then v91.props.tokens.animationConfig else nil
            }));
        end);
    elseif l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v94 then
        return (v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            MediaGallery = v1.createElement(v33, {
                items = v92, 
                startIndex = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v91.props.startIndex else nil, 
                itemPadding = 0, 
                borderRadius = UDim.new(0, 8), 
                clipsNonCurrentItems = true, 
                showCounter = false, 
                onSwipe = v91.props.onSwipe, 
                onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v91.props.onMediaGalleryMediaChanged else nil, 
                onFullscreenToggleButtonActivated = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v91.props.onPreviewActivated else nil, 
                isOccluded = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and (l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryVideoPreview_0) then v91.props.isOccluded else nil, 
                onVideoPlayActivated = v91.openYouTubeVideoItem, 
                videoPlaybackCoordinator = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v91.mediaGalleryVideoPreviewEnabled then v91.videoPlaybackCoordinator else nil, 
                videoAnalytics = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v91.props.videoAnalytics else nil, 
                universeId = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v91.props.universeId else nil, 
                mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v91.props.mediaGalleryRedesignEnabledIxp else nil, 
                mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v91.props.mediaGalleryVideoPreviewEnabledIxp else nil
            })
        }));
    else
        return (v1.createElement("Frame", {
            Size = v91.containerSize, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v1.Change.AbsoluteSize] = v91.onResize
        }, {
            MediaGalleryPreview = v1.createElement(l_MediaGalleryPreview_0, {
                items = v92, 
                numberOfThumbnails = 5, 
                onPreviewActivated = v91.props.onPreviewActivated, 
                onThumbnailActivated = if l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 then v91.props.onThumbnailActivated else nil, 
                onVideoPlayActivated = v91.openYouTubeVideoItem, 
                fullWidth = true
            })
        }));
    end;
end;
v51.renderFullscreen = function(v100, v101) --[[ Line: 428 ]] --[[ Name: renderFullscreen ]]
    -- upvalues: l_withStyle_0 (copy), l_UiMode_0 (copy), v1 (copy), l_CrossFadeAnimatedView_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesign_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), v34 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_MediaGalleryFullScreen_0 (copy)
    return l_withStyle_0(function(v102) --[[ Line: 429 ]]
        -- upvalues: v100 (copy), l_UiMode_0 (ref), v1 (ref), l_CrossFadeAnimatedView_0 (ref), v101 (copy), l_FFlagLuaAppEdpMediaGalleryRedesign_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v34 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), l_MediaGalleryFullScreen_0 (ref)
        if v100.props.uiMode == l_UiMode_0.TenFoot then
            return (v1.createElement(l_CrossFadeAnimatedView_0, {
                items = v101, 
                crossAnim = {
                    currentIndex = v100.props.currentIndex, 
                    nextIndex = v100.props.nextIndex, 
                    setCurrentIndex = v100.props.setCurrentIndex, 
                    isCrossFade = v100.props.isCrossFade, 
                    setCrossFade = v100.props.setCrossFade
                }, 
                overlayTransparency = 1
            }));
        elseif l_FFlagLuaAppEdpMediaGalleryRedesign_0 and (not l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 or v100.props.mediaGalleryRedesignEnabledIxp) and l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
            return v1.createElement(v34, {
                items = v101, 
                universeId = v100.props.universeId, 
                rootPlaceId = v100.props.placeId, 
                startIndex = v100.props.startIndex, 
                exitFullscreen = v100.props.exitFullscreen, 
                onVideoPlayActivated = v100.openYouTubeVideoItem, 
                videoPlaybackCoordinator = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v100.videoPlaybackCoordinator else nil, 
                videoAnalytics = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v100.props.videoAnalytics else nil, 
                mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v100.props.mediaGalleryRedesignEnabledIxp else nil, 
                mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v100.props.mediaGalleryVideoPreviewEnabledIxp else nil
            });
        else
            local l_Theme_0 = v102.Theme;
            return (v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                BorderSizePixel = 0
            }, {
                Fullscreen = v1.createElement(l_MediaGalleryFullScreen_0, {
                    items = v101, 
                    showIndex = v100.props.fullscreenShowIndex, 
                    onVideoPlayActivated = v100.openYouTubeVideoItem
                })
            }));
        end;
    end);
end;
v51 = v2.connect(nil, function(v104) --[[ Line: 486 ]]
    -- upvalues: v31 (copy), v29 (copy)
    return {
        openLeaveRobloxAlertUIBlox = function(v105) --[[ Line: 488 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]
            -- upvalues: v104 (copy), v31 (ref)
            return v104(v31(v105));
        end, 
        openYouTubeVideo = function(v106, v107, v108, v109, v110, v111, v112) --[[ Line: 491 ]] --[[ Name: openYouTubeVideo ]]
            -- upvalues: v104 (copy), v29 (ref)
            return v104((v29(v106, v107, v108, v109, v110, v111, v112)));
        end
    };
end)(v51);
v51 = l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    eventIngest = l_AppEventIngestService_0
})(v51);
local v115 = l_RoactAppPolicy_0.connect(function(v113, _) --[[ Line: 520 ]]
    return {
        showYouTubeAgeAlert = v113.getShowYouTubeAgeAlert()
    };
end)(v51);
return function(v116) --[[ Line: 527 ]]
    -- upvalues: l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_useSelector_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameInfosReducer_0 (copy), v35 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), v36 (copy), v1 (copy), v115 (copy), v8 (copy)
    local v120 = if not not l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then l_useSelector_0(function(v117) --[[ Line: 529 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v116 (copy), l_GameInfosReducer_0 (ref)
        local v118 = nil;
        v118 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v116.shouldHydrateLegacyIxp then v117.GameDetailsV2[v116.universeId] else v117.GameDetails[v116.universeId];
        local v119 = v117.Personalization[l_GameInfosReducer_0.key][v116.universeId];
        return v118 and v118.rootPlaceId or v119 and v119.placeId;
    end) else nil;
    local v121 = v35(v116.universeId, if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v120 else nil, v116.showYouTubeVideoFirst or true, if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v116.mediaGalleryVideoPreviewEnabledIxp else nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.shouldHydrateLegacyIxp else nil);
    local v122 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v36(v116.universeId, v120, v121) else nil;
    return v1.createElement(v115, v8.Dictionary.join(v116, {
        selectedGameMediaEntries = v121, 
        videoAnalytics = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v122 else nil, 
        placeId = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v120 else nil
    }));
end;