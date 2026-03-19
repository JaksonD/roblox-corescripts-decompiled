local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.CapturesCommon);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.GameVotesRodux);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.RobloxAppHooks);
local v8 = require(l_Parent_1.UIBlox);
local l_FetchGameVotes_0 = v4.GameVotes.FetchGameVotes;
local l_LoadableImage_0 = v8.App.Loading.LoadableImage;
local l_LoadingStrategy_0 = v8.App.Loading.Enum.LoadingStrategy;
local l_View_0 = v3.View;
local l_BlurDirection_0 = v2.Enums.BlurDirection;
local v14 = require(l_Parent_0.Analytics.EventNames);
local v15 = require(l_Parent_0.Components.FeedOverlay.ExperienceInfo);
local v16 = require(l_Parent_0.App.FeedContext);
local v17 = require(l_Parent_0.Components.FeedItem.FeedItemPostsNotFound);
local v18 = require(l_Parent_0.Components.FeedOverlay.FeedOverlay);
local l_ImageBlurEffect_0 = v2.Components.ImageBlurEffect;
local l_LoadableVideo_0 = v2.Components.LoadableVideo;
local v21 = require(l_Parent_0.App.Networking);
local v22 = require(l_Parent_0.Enums.PostType);
local _ = require(l_Parent_0.Types);
local v24 = require(l_Parent_0.Hooks.useAnalytics);
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local v28 = require(l_Parent_0.Hooks.useFeedZoomController);
local l_useMemo_0 = v5.useMemo;
local l_usePostThumbnail_0 = v2.Hooks.usePostThumbnail;
local l_useRef_0 = v5.useRef;
local l_useScreenSize_0 = v7.useScreenSize;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useState_0 = v5.useState;
local function _(v35) --[[ Line: 44 ]] --[[ Name: getFeedVideoUrl ]]
    if not v35 then
        return "";
    else
        return "rbxassetid://" .. tostring(v35);
    end;
end;
return function(v37) --[[ Line: 67 ]]
    -- upvalues: v24 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), v5 (copy), v16 (copy), l_useState_0 (copy), l_useRef_0 (copy), l_useSelector_0 (copy), l_useEffect_0 (copy), v21 (copy), l_FetchGameVotes_0 (copy), v22 (copy), l_useCallback_0 (copy), v14 (copy), v17 (copy), l_useMemo_0 (copy), v28 (copy), l_usePostThumbnail_0 (copy), l_View_0 (copy), l_ImageBlurEffect_0 (copy), l_BlurDirection_0 (copy), l_LoadableVideo_0 (copy), l_LoadableImage_0 (copy), l_LoadingStrategy_0 (copy), v18 (copy), v15 (copy)
    local v38 = v24();
    local v39 = l_useDispatch_0();
    local v40 = l_useScreenSize_0();
    local l_isZooming_0 = v5.useContext(v16).isZooming;
    local v42, v43 = l_useState_0(0);
    local v44 = l_useRef_0(false);
    local v45, v46 = l_useState_0(false);
    local v47 = l_useRef_0(os.clock());
    local v48, v49 = l_useState_0(Vector2.new(v40.X, v40.Y));
    local v50 = l_useRef_0(nil);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 82 ]]
        return v51.ContentFeed.Inspect.IsOpen;
    end);
    l_useEffect_0(function() --[[ Line: 86 ]]
        -- upvalues: v39 (copy), v21 (ref), v37 (copy)
        v39(v21.NetworkingUsers.GetUserV2FromUserId.API((tostring(v37.creatorUserId)))):catch(function() --[[ Line: 87 ]]

        end);
    end, {
        v39, 
        v37.creatorUserId
    });
    l_useEffect_0(function() --[[ Line: 92 ]]
        -- upvalues: v39 (copy), l_FetchGameVotes_0 (ref), v21 (ref), v37 (copy)
        v39(l_FetchGameVotes_0.Fetch(v21.ContentFeedNetworkImpl, (tostring(v37.universeId)))):catch(function() --[[ Line: 93 ]]

        end);
    end, {
        v39, 
        v37.universeId
    });
    l_useEffect_0(function() --[[ Line: 98 ]]
        -- upvalues: v37 (copy), v22 (ref), v49 (copy)
        if v37.type ~= v22.Video then
            v49(Vector2.new(v37.screenshotMetadata.width, v37.screenshotMetadata.height));
        end;
    end, {
        v37.screenshotMetadata, 
        v37.type
    });
    local v54 = l_useCallback_0(function() --[[ Line: 104 ]]
        -- upvalues: v44 (copy), v14 (ref), v37 (copy), v22 (ref), v38 (copy), v47 (copy)
        if not v44.current then
            local l_ContentFeedImageLatency_0 = v14.ContentFeedImageLatency;
            if v37.type == v22.Video then
                l_ContentFeedImageLatency_0 = v14.ContentFeedVideoLatency;
            end;
            v38.fireEvent(l_ContentFeedImageLatency_0, {
                statValue = os.clock() - v47.current
            });
            v44.current = true;
        end;
    end, {
        v38, 
        v44, 
        v47
    });
    local v56 = l_useCallback_0(function() --[[ Line: 117 ]]
        -- upvalues: v45 (copy), v14 (ref), v37 (copy), v22 (ref), v38 (copy), v46 (copy), v5 (ref), v17 (ref)
        if not v45 then
            local l_ContentFeedImageLoadFailed_0 = v14.ContentFeedImageLoadFailed;
            if v37.type == v22.Video then
                l_ContentFeedImageLoadFailed_0 = v14.ContentFeedVideoLoadFailed;
            end;
            v38.fireEvent(l_ContentFeedImageLoadFailed_0, {
                postId = v37.postId
            });
            v46(true);
        end;
        return v5.createElement(v17, {
            layoutOrder = 1
        });
    end, {
        v38, 
        v45, 
        v37.postId, 
        v37.type
    });
    local v61, v62, v63 = l_useMemo_0(function() --[[ Line: 133 ]]
        -- upvalues: v48 (copy), v40 (copy), v42 (copy), v37 (copy), v22 (ref), v45 (copy)
        local v57 = v48.X / v48.Y;
        local v58 = v40.Y * 0.33;
        local v59 = v42 / v57;
        if v59 < v58 then
            v59 = v58;
        elseif v40.Y < v59 then
            v59 = v40.Y;
        end;
        if v37.type == v22.Video then
            v59 = v40.Y;
        end;
        local v60 = v59 < v40.Y / 2;
        if v37.type == v22.Video then
            v60 = false;
        elseif v45 then
            v60 = false;
        end;
        return v59, v60, (v40.Y - v59) / 2;
    end, {
        v42, 
        v45, 
        v48, 
        v37.type, 
        v40.Y
    });
    local v64 = v37.postId == v37.currentPostId;
    local v65 = v28(v64, v61, v42, v52);
    l_useEffect_0(function() --[[ Line: 167 ]]
        -- upvalues: v64 (copy), v50 (copy)
        if v64 and v50.current then
            v50.current:Play();
            return;
        else
            if v50.current then
                v50.current:Pause();
            end;
            return;
        end;
    end, {
        v64, 
        v50.current
    });
    local l_itemContainerRef_0 = v65.itemContainerRef;
    local l_itemFinalScale_0 = v65.itemFinalScale;
    local l_initialZoomFocusPosition_0 = v65.initialZoomFocusPosition;
    local l_nonItemTransparency_0 = v65.nonItemTransparency;
    local l_zoomAverageDelta_0 = v65.zoomAverageDelta;
    local l_zoomEndTransition_0 = v65.zoomEndTransition;
    local l_zoomEndTransitionActive_0 = v65.zoomEndTransitionActive;
    local l_fullSizeUrl_0 = v37.screenshotMetadata.fullSizeUrl;
    local v74 = not l_fullSizeUrl_0 or l_fullSizeUrl_0 == "";
    local v75, v76 = l_usePostThumbnail_0(if v74 then v37.assetId else nil, v37.screenshotMetadata.width, v37.screenshotMetadata.height);
    if v74 and v76 then
        l_fullSizeUrl_0 = v75;
    end;
    local l_createElement_0 = v5.createElement;
    local l_l_View_0_0 = l_View_0;
    local v80 = {
        LayoutOrder = v37.layoutOrder, 
        onAbsoluteSizeChanged = function(v79) --[[ Line: 198 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v43 (copy)
            v43(v79.AbsoluteSize.X);
        end, 
        Size = UDim2.new(1, 0, 0, v40.Y), 
        tag = "bg-action-subtle", 
        ZIndex = v64 and 2 or 1
    };
    local v81 = {
        TopBlur = if v62 then v5.createElement(l_ImageBlurEffect_0, {
            AnchorPoint = Vector2.new(0.5, 1), 
            direction = l_BlurDirection_0.Up, 
            image = l_fullSizeUrl_0, 
            imageSize = v48, 
            Position = UDim2.new(0.5, 0, 0.5, -v61 / 2), 
            Size = UDim2.new(1, 0, 0, v63), 
            transparencyBinding = if v64 then l_nonItemTransparency_0 else nil, 
            ZIndex = l_isZooming_0 and v64 and -3 or 0
        }) else nil
    };
    local l_createElement_1 = v5.createElement;
    local l_l_View_0_1 = l_View_0;
    local v90 = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = if l_zoomEndTransitionActive_0 and l_initialZoomFocusPosition_0.current then l_zoomEndTransition_0:map(function(v84) --[[ Line: 221 ]]
            -- upvalues: l_itemFinalScale_0 (copy), l_initialZoomFocusPosition_0 (copy), l_zoomAverageDelta_0 (copy), v40 (copy)
            local v85 = l_itemFinalScale_0.current / (1 + (l_itemFinalScale_0.current - 1) * v84);
            local v86 = (0.5 - (l_initialZoomFocusPosition_0.current.X - l_zoomAverageDelta_0.current.X) / v40.X) * v40.X * (v85 - 1);
            local v87 = (0.5 - (l_initialZoomFocusPosition_0.current.Y - l_zoomAverageDelta_0.current.Y) / v40.Y) * v40.Y * (v85 - 1);
            return UDim2.new(0.5, v86, 0.5, v87);
        end) else UDim2.fromScale(0.5, 0.5), 
        ref = l_itemContainerRef_0, 
        Size = if l_zoomEndTransitionActive_0 then l_zoomEndTransition_0:map(function(v88) --[[ Line: 240 ]]
            -- upvalues: l_itemFinalScale_0 (copy), v61 (copy)
            local v89 = l_itemFinalScale_0.current / (1 + (l_itemFinalScale_0.current - 1) * v88);
            return UDim2.new(v89, 0, 0, v61 * v89);
        end) else UDim2.new(1, 0, 0, v61), 
        ZIndex = 1
    };
    local v91 = {};
    local v92;
    if v37.type == v22.Video then
        v92 = v5.createElement;
        local l_l_LoadableVideo_0_0 = l_LoadableVideo_0;
        local v94 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            onLoaded = v54, 
            onResolutionChanged = v49, 
            Position = UDim2.fromScale(0.5, 0.5), 
            renderOnFailed = v56, 
            Size = UDim2.fromScale(1, 1)
        };
        local l_assetId_0 = v37.assetId;
        v94.Video = not l_assetId_0 and "" or "rbxassetid://" .. tostring(l_assetId_0);
        v94.videoRef = v50;
        v94.ZIndex = 1;
        v92 = v92(l_l_LoadableVideo_0_0, v94);
    else
        v92 = v5.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = l_fullSizeUrl_0, 
            loadingStrategy = l_LoadingStrategy_0.Eager, 
            onLoaded = v54, 
            renderOnFailed = v56, 
            Position = UDim2.fromScale(0.5, 0.5), 
            ScaleType = Enum.ScaleType.Crop, 
            Size = UDim2.fromScale(1, 1), 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 1
        });
    end;
    v91.ContentFeedItem = v92;
    v81.ContentFeedImageContainer = l_createElement_1(l_l_View_0_1, v90, v91);
    v81.BottomBlur = if v62 then v5.createElement(l_ImageBlurEffect_0, {
        AnchorPoint = Vector2.new(0.5, 0), 
        direction = l_BlurDirection_0.Down, 
        image = l_fullSizeUrl_0, 
        imageSize = v48, 
        Position = UDim2.new(0.5, 0, 0.5, v61 / 2), 
        Size = UDim2.new(1, 0, 0, v63), 
        transparencyBinding = if v64 then l_nonItemTransparency_0 else nil, 
        ZIndex = l_isZooming_0 and v64 and -3 or 0
    }) else nil;
    v81.BottomBar = v5.createElement(l_View_0, {
        GroupTransparency = l_nonItemTransparency_0:map(function(v96) --[[ Line: 291 ]]
            return v96;
        end), 
        tag = "auto-y anchor-bottom-center position-bottom-center bg-action-subtle size-full-0 col align-x-left align-y-bottom", 
        ZIndex = 2
    }, {
        Overlay = v5.createElement(v18, {
            additionalInfo = v37.additionalInfo, 
            caption = v37.caption, 
            creatorUserId = v37.creatorUserId, 
            postId = v37.postId, 
            uploadedAtTimestamp = v37.uploadedAtTimestamp
        }), 
        ExperienceInfo = v5.createElement(v15, {
            layoutOrder = 2, 
            placeId = v37.placeId, 
            postId = v37.postId, 
            universeId = v37.universeId
        })
    });
    return l_createElement_0(l_l_View_0_0, v80, v81);
end;