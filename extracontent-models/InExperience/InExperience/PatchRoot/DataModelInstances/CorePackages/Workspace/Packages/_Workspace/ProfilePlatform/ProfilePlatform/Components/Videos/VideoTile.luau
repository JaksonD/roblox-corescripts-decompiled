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
local l_CollectionCarousel_0 = v3.CollectionCarousel;
local l_useCollectionLayoutParams_0 = v3.useCollectionLayoutParams;
local l_CollectionItemSize_0 = v3.CollectionViewTypes.CollectionItemSize;
return function(v18) --[[ Line: 40 ]] --[[ Name: VideoTile ]]
    -- upvalues: v2 (copy), v12 (copy), v9 (copy), l_useLocalization_0 (copy), v6 (copy), v11 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_VideoPlaybackCoordinator_0 (copy), l_useDispatch_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v5 (copy), v4 (copy), l_CollectionCarousel_0 (copy)
    local v19, v20 = v2.useState(true);
    local v21 = v12().formFactor == v9.ProfileFormFactor.Wide;
    local v22 = l_useLocalization_0({
        title = v6.Videos
    });
    local v23, v24 = v2.useState(nil);
    local v25, v26 = v11();
    local v27 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.Large, v23, true, {
        sideMargin = v25
    });
    local v28 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: l_VideoPlaybackCoordinator_0 (ref)
        return l_VideoPlaybackCoordinator_0.new();
    end, {});
    local v29 = v2.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v23 (copy), v27 (copy)
        return (if v23 then v23.AbsoluteSize.X else 300) - v27.sideMargin - 60;
    end, {
        v23
    });
    local v31 = v2.useCallback(function(v30) --[[ Line: 66 ]]
        -- upvalues: v21 (copy), v29 (copy)
        return (if v21 then v30 else v29()) * 0.5625 + 32 + 8;
    end, {
        v21, 
        v29
    });
    local v32 = l_useDispatch_0();
    local v33, v34 = v2.useState(0);
    local v36 = v2.useCallback(function(v35) --[[ Line: 75 ]]
        -- upvalues: v34 (copy)
        v34(v35);
    end, {});
    local v39 = v2.useCallback(function(v37, v38) --[[ Line: 80 ]]
        -- upvalues: v28 (copy), v32 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v33 (copy), v19 (copy), v20 (copy)
        if v37 then
            if v28 then
                v28:reset("expanding_to_fullscreen");
            end;
            v32(l_NavigateDown_0({
                name = l_AppPage_0.VideoFullscreen, 
                detail = v37.videoId, 
                extraProps = {
                    videoId = v37.videoId, 
                    title = v37.title, 
                    initialTimePosition = v38 or v33, 
                    isMuted = v19, 
                    onMuteUpdate = v20
                }
            }));
        end;
    end, {
        v33, 
        v28, 
        v19
    });
    local v41 = v2.useCallback(function(v40) --[[ Line: 106 ]]
        if v40 then
            v40.ClipsDescendants = true;
        end;
    end, {});
    local v47 = v2.useCallback(function(v42, v43, v44) --[[ Line: 113 ]]
        -- upvalues: v21 (copy), v29 (copy), v31 (copy), v2 (ref), v5 (ref), v39 (copy), v36 (copy), v28 (copy), v4 (ref)
        local v45 = if v21 then v44 else UDim2.new(0, v29(), 0, v31(v29()));
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v43, 
            Size = v45
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
                    onExpandCallback = function(v46) --[[ Line: 137 ]] --[[ Name: onExpandCallback ]]
                        -- upvalues: v39 (ref), v42 (copy)
                        v39(v42, v46);
                    end, 
                    onTimeUpdate = v36, 
                    thumbnailImage = v42.thumbnailImage, 
                    videoId = v42.videoId, 
                    videoPlaybackCoordinator = v28
                })
            }), 
            PaddingBelowVideo = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 8)
            }), 
            Footer = v2.createElement(v4, {
                LayoutOrder = 3, 
                text = v42.title
            })
        }), v42.videoId;
    end, {
        v39, 
        v21, 
        v29, 
        v31
    });
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v18.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        ClipsDescendants = true, 
        ref = v24, 
        [v2.Change.AbsoluteSize] = v26
    }, {
        CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
            columnGap = 12, 
            fractionalItemAmount = v21 and 0 or nil, 
            getItemHeight = v31, 
            hideHeaderButton = true, 
            items = v18.videos or {}, 
            LayoutOrder = 1, 
            numColumns = v21 and 3 or 1, 
            onScrollingFrameRefCallback = if v21 then v41 else nil, 
            renderItem = v47, 
            sideMargin = v27.sideMargin, 
            title = v22.title
        })
    });
end;