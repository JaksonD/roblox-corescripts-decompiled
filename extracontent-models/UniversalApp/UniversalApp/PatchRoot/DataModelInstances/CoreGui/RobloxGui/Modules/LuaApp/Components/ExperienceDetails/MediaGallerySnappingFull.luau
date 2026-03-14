local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local _ = require(l_CorePackages_0.Workspace.Packages.AppBlox);
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local _ = require(l_CorePackages_0.Workspace.Packages.VideoUtils);
local l_GameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents;
local l_MediaGallerySwiped_0 = l_GameDetailsEvents_0.MediaGallerySwiped;
local l_MediaGalleryMediaChanged_0 = l_GameDetailsEvents_0.MediaGalleryMediaChanged;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v11 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.MediaGallerySnapping);
local l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp;
local l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry;
local l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents;
return v2.memo(function(v17) --[[ Line: 52 ]] --[[ Name: MediaGallerySnappingFull ]]
    -- upvalues: l_useTokens_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), v2 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_MediaGallerySwiped_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_MediaGalleryMediaChanged_0 (copy), v11 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy)
    local v18 = l_useTokens_0();
    local v19 = l_useRoactService_0(l_AppEventIngestService_0);
    local l_Surface_0_0 = v18.Color.Surface.Surface_0;
    local v21, v22 = v2.useBinding(UDim2.fromOffset(0, 0));
    local function v27(v23) --[[ Line: 60 ]]
        -- upvalues: v22 (copy)
        local l_X_0 = v23.AbsoluteSize.X;
        local l_Y_0 = v23.AbsoluteSize.Y;
        local v26 = math.floor(l_Y_0 * 1.7777777777777777);
        if l_X_0 < v26 then
            v26 = l_X_0;
            l_Y_0 = math.floor(v26 / 1.7777777777777777);
        end;
        v22(UDim2.fromOffset(v26, l_Y_0));
    end;
    local v28 = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v17 (copy), l_MediaGallerySwiped_0 (ref), v19 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
        if v17.rootPlaceId then
            l_MediaGallerySwiped_0(v19, "MediaGallerySnappingFull", v17.rootPlaceId, if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then {
                universeId = v17.universeId
            } else nil);
        end;
    end, {
        v17.rootPlaceId, 
        v19, 
        if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v17.universeId else nil
    });
    local v32 = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v2.useCallback(function(v29, v30, v31) --[[ Line: 97 ]]
        -- upvalues: v17 (copy), l_MediaGalleryMediaChanged_0 (ref), v19 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
        if v17.rootPlaceId then
            l_MediaGalleryMediaChanged_0(v19, "MediaGallerySnappingFull", v17.rootPlaceId, {
                imageAssetId = v29, 
                videoAssetId = v30, 
                autoAdvance = v31, 
                universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v17.universeId else nil
            });
        end;
    end, {
        v17.rootPlaceId, 
        v19, 
        if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v17.universeId else nil
    }) else nil;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = l_Surface_0_0.Color3, 
        BackgroundTransparency = l_Surface_0_0.Transparency, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v27
    }, {
        FullscreenMediaGallery = v2.createElement("Frame", {
            Size = v21, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 0
        }, {
            MediaGallery = v2.createElement(v11, {
                items = v17.items, 
                itemPadding = 0, 
                borderRadius = UDim.new(0, 0), 
                onVideoPlayActivated = v17.onVideoPlayActivated, 
                onSwipe = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v28, 
                onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v32 else nil, 
                startIndex = v17.startIndex, 
                clipsNonCurrentItems = true, 
                isFullscreen = true, 
                onFullscreenToggleButtonActivated = v17.exitFullscreen, 
                videoPlaybackCoordinator = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v17.videoPlaybackCoordinator else nil, 
                videoAnalytics = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v17.videoAnalytics else nil, 
                universeId = v17.universeId, 
                mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v17.mediaGalleryRedesignEnabledIxp else nil, 
                mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v17.mediaGalleryVideoPreviewEnabledIxp else nil
            })
        })
    });
end);