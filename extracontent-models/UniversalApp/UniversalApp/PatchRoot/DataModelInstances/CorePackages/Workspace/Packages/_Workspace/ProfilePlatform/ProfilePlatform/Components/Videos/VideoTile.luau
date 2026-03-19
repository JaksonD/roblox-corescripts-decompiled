local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.CollectionViews);
local v4 = require(l_script_FirstAncestor_0.Components.Videos.Footer);
local v5 = require(l_script_FirstAncestor_0.Components.Videos.VideoPlayer);
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v9 = require(l_script_FirstAncestor_0.Common.Enums);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v11 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local v12 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local l_VideoPlaybackCoordinator_0 = require(l_Parent_0.VideoUtils).VideoPlaybackCoordinator;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v15 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local l_VideoSources_0 = require(l_Parent_0.VideoUtils).AnalyticsEnums.VideoSources;
local l_CollectionCarousel_0 = v3.CollectionCarousel;
local l_useCollectionLayoutParams_0 = v3.useCollectionLayoutParams;
local l_CollectionItemSize_0 = v3.CollectionViewTypes.CollectionItemSize;
local l_FFlagBrandVideosEnableActionAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagBrandVideosEnableActionAnalytics;
return function(v21) --[[ Line: 49 ]] --[[ Name: VideoTile ]]
    -- upvalues: v2 (copy), v12 (copy), v9 (copy), l_useLocalization_0 (copy), v6 (copy), v11 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (copy), v15 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_VideoPlaybackCoordinator_0 (copy), l_useDispatch_0 (copy), l_VideoSources_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v5 (copy), v4 (copy), l_CollectionCarousel_0 (copy)
    local v22, v23 = v2.useState(true);
    local v24 = v12().formFactor == v9.ProfileFormFactor.Wide;
    local v25 = l_useLocalization_0({
        title = v6.Videos
    });
    local v26, v27 = v2.useState(nil);
    local v28, v29 = v11();
    local v30 = if l_FFlagBrandVideosEnableActionAnalytics_0 then v15() else nil;
    local v31 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.Large, v26, true, {
        sideMargin = v28
    });
    local v32 = v2.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: l_VideoPlaybackCoordinator_0 (ref)
        return l_VideoPlaybackCoordinator_0.new();
    end, {});
    local v33 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v26 (copy), v31 (copy)
        return (if v26 then v26.AbsoluteSize.X else 300) - v31.sideMargin - 60;
    end, {
        v26
    });
    local v35 = v2.useCallback(function(v34) --[[ Line: 76 ]]
        -- upvalues: v24 (copy), v33 (copy)
        return (if v24 then v34 else v33()) * 0.5625 + 32 + 8;
    end, {
        v24, 
        v33
    });
    local v36 = l_useDispatch_0();
    local v37, v38 = v2.useState(0);
    local v40 = v2.useCallback(function(v39) --[[ Line: 85 ]]
        -- upvalues: v38 (copy)
        v38(v39);
    end, {});
    local v47 = v2.useCallback(function(v41, v42, v43) --[[ Line: 90 ]]
        -- upvalues: v32 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoSources_0 (ref), v30 (copy), v36 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v37 (copy), v22 (copy), v23 (copy)
        if v41 then
            if v32 then
                v32:reset("expanding_to_fullscreen");
            end;
            local v44 = if l_FFlagBrandVideosEnableActionAnalytics_0 then ("%*_fullscreen"):format(v41.videoId) else nil;
            local v45 = if l_FFlagBrandVideosEnableActionAnalytics_0 and v32 then v32:getVideoMetadata(v41.videoId) else nil;
            if l_FFlagBrandVideosEnableActionAnalytics_0 and v45 then
                v32:setVideoMetadata(v44, v45);
            end;
            local v46 = if l_FFlagBrandVideosEnableActionAnalytics_0 then {
                videoAssetId = v41.videoId, 
                source = l_VideoSources_0.community, 
                sourceId = v30.profileId
            } else nil;
            v36(l_NavigateDown_0({
                name = l_AppPage_0.VideoFullscreen, 
                detail = v41.videoId, 
                extraProps = {
                    videoId = v41.videoId, 
                    videoKey = if l_FFlagBrandVideosEnableActionAnalytics_0 then v44 else nil, 
                    title = v41.title, 
                    initialTimePosition = v42 or v37, 
                    isMuted = v22, 
                    onMuteUpdate = v23, 
                    videoPlaybackCoordinator = if l_FFlagBrandVideosEnableActionAnalytics_0 then v32 else nil, 
                    videoAnalyticsMetadata = if l_FFlagBrandVideosEnableActionAnalytics_0 then v46 else nil, 
                    onFullscreenClose = if l_FFlagBrandVideosEnableActionAnalytics_0 then v43 else nil
                }
            }));
        end;
    end, {
        v37, 
        v32, 
        v22, 
        if l_FFlagBrandVideosEnableActionAnalytics_0 then v30 else nil
    });
    local v49 = v2.useCallback(function(v48) --[[ Line: 145 ]]
        if v48 then
            v48.ClipsDescendants = true;
        end;
    end, {});
    local v59 = v2.useCallback(function(v50, v51, v52) --[[ Line: 152 ]]
        -- upvalues: v24 (copy), v33 (copy), v35 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoSources_0 (ref), v30 (copy), v2 (ref), v5 (ref), v47 (copy), v40 (copy), v32 (copy), v4 (ref)
        local v53 = if v24 then v52 else UDim2.new(0, v33(), 0, v35(v33()));
        local v54 = if l_FFlagBrandVideosEnableActionAnalytics_0 then v50.videoId else nil;
        local v55 = if l_FFlagBrandVideosEnableActionAnalytics_0 then {
            videoAssetId = v50.videoId, 
            source = l_VideoSources_0.community, 
            sourceId = v30.profileId
        } else nil;
        local v58 = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v51, 
            Size = v53
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 0), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            VideoContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 1, -40)
            }, {
                VideoPlayer = v2.createElement(v5, {
                    cornerRadius = 8, 
                    isFullscreen = false, 
                    looped = false, 
                    onExpandCallback = function(v56, v57) --[[ Line: 184 ]] --[[ Name: onExpandCallback ]]
                        -- upvalues: l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v47 (ref), v50 (copy)
                        if l_FFlagBrandVideosEnableActionAnalytics_0 then
                            v47(v50, v56, v57);
                            return;
                        else
                            v47(v50, v56);
                            return;
                        end;
                    end, 
                    onTimeUpdate = v40, 
                    thumbnailImage = v50.thumbnailImage, 
                    videoId = v50.videoId, 
                    videoKey = if l_FFlagBrandVideosEnableActionAnalytics_0 then v54 else nil, 
                    videoPlaybackCoordinator = v32, 
                    videoAnalyticsMetadata = if l_FFlagBrandVideosEnableActionAnalytics_0 then v55 else nil
                })
            }), 
            PaddingBelowVideo = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 8)
            }), 
            Footer = v2.createElement(v4, {
                LayoutOrder = 3, 
                text = v50.title
            })
        });
        if l_FFlagBrandVideosEnableActionAnalytics_0 then
            return v58, v54;
        else
            return v58, v50.videoId;
        end;
    end, {
        v47, 
        v24, 
        v33, 
        v35, 
        if l_FFlagBrandVideosEnableActionAnalytics_0 then v32 else nil, 
        if l_FFlagBrandVideosEnableActionAnalytics_0 then v30 else nil
    });
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v21.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        ClipsDescendants = true, 
        ref = v27, 
        [v2.Change.AbsoluteSize] = v29
    }, {
        CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
            columnGap = 12, 
            fractionalItemAmount = v24 and 0 or nil, 
            getItemHeight = v35, 
            hideHeaderButton = true, 
            items = v21.videos or {}, 
            LayoutOrder = 1, 
            numColumns = v24 and 3 or 1, 
            onScrollingFrameRefCallback = if v24 then v49 else nil, 
            renderItem = v59, 
            sideMargin = v31.sideMargin, 
            title = v25.title
        })
    });
end;