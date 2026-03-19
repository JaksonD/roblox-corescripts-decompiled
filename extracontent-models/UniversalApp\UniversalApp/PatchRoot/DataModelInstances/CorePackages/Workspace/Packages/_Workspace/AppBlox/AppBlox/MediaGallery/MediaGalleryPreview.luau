local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local l_EventConnection_0 = require(l_Parent_0.ReactUtils).EventConnection;
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_Images_0 = v5.App.ImageSet.Images;
local l_getIconSize_0 = v5.App.ImageSet.getIconSize;
local l_withStyle_0 = v5.Core.Style.withStyle;
local v11 = require(l_Parent_0.t);
local v12 = require(script.Parent.ThumbnailButton);
local v13 = require(script.Parent.calcMediaGallerySizesFromHeight);
local v14 = require(script.Parent.calcMediaGallerySizesFromWidth);
local v15 = require(script.Parent.getShowItems);
local v16 = l_getIconSize_0(l_IconSize_0.Medium);
local v17 = {
    frequency = 4, 
    dampingRatio = 1
};
local v18 = v4.Component:extend("MediaGalleryPreview");
v18.validateProps = v11.strictInterface({
    layoutOrder = v11.optional(v11.integer), 
    size = v11.optional(v11.UDim2), 
    fullWidth = v11.optional(v11.boolean), 
    anchorPoint = v11.optional(v11.Vector2), 
    position = v11.optional(v11.UDim2), 
    items = v11.array(v11.strictInterface({
        imageId = v11.string, 
        isYouTubeVideo = v11.optional(v11.boolean)
    })), 
    numberOfThumbnails = v11.optional(v11.integer), 
    onPreviewActivated = v11.optional(v11.callback), 
    onThumbnailActivated = v11.optional(v11.callback), 
    onVideoPlayActivated = v11.optional(v11.callback)
});
v18.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    numberOfThumbnails = 5, 
    fullWidth = false
};
v18.getDerivedStateFromProps = function(v19, v20) --[[ Line: 77 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v15 (copy)
    if v20.items == v19.items and v20.numberOfThumbnails == v19.numberOfThumbnails then
        return;
    else
        local v21, v22, v23 = v15(v19);
        return {
            items = v19.items, 
            numberOfThumbnails = v19.numberOfThumbnails, 
            itemsToShow = v21, 
            youTubeVideoItemsSize = v22, 
            imageItemsSize = v23, 
            animationOn = v23 > 1, 
            animatedIndex = v22 + 1, 
            selectedIndex = v22 + 1
        };
    end;
end;
v18.init = function(v24) --[[ Line: 95 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v4 (copy)
    v24.state = {
        items = nil, 
        numberOfThumbnails = 1, 
        itemsToShow = nil, 
        youTubeVideoItemsSize = 0, 
        imageItemsSize = 0, 
        animationOn = false, 
        animatedIndex = 1, 
        selectedIndex = 1, 
        showArrows = false, 
        focusIndex = 1
    };
    v24.animationTime = 0;
    v24.scrolling = false;
    v24.scrollMotor = v3.createSingleMotor(0);
    local v25, v26 = v4.createBinding(UDim2.fromScale(1, 1));
    v24.contentSize = v25;
    v24.updateContentSize = v26;
    v25, v26 = v4.createBinding(UDim2.fromScale(1, 0.5));
    v24.previewSize = v25;
    v24.updatePreviewSize = v26;
    v25, v26 = v4.createBinding(UDim2.fromScale(1, 0.5));
    v24.paginationSize = v25;
    v24.updatePaginationSize = v26;
    v25, v26 = v4.createBinding(UDim2.fromScale(0, 0));
    v24.thumbnailSize = v25;
    v24.updateThumbnailSize = v26;
    v25, v26 = v4.createBinding(Vector2.new(0, 0));
    v24.canvasPosition = v25;
    v24.updateCanvasPosition = v26;
    v25, v26 = v4.createBinding(0);
    v24.progress = v25;
    v24.updateProgress = v26;
    v25, v26 = v4.createBinding(0);
    v24.previewTransparency = v25;
    v24.updatePreviewTransparency = v26;
    v24.onResize = function(v27) --[[ Line: 122 ]]
        -- upvalues: v24 (copy)
        v24:updateSizes(v27);
        v24.updateCanvasPosition(Vector2.new(v24:getCanvasPositionX(), 0));
    end;
    v24.onMouseLeave = function(_, v29) --[[ Line: 127 ]]
        -- upvalues: v24 (copy)
        if v29.UserInputType ~= Enum.UserInputType.MouseMovement then
            return;
        else
            v24.resetAnimation();
            v24:setState(function(v30) --[[ Line: 133 ]]
                -- upvalues: v24 (ref)
                local l_selectedIndex_0 = v30.selectedIndex;
                local v32 = v24.getNextFocusIndex(l_selectedIndex_0);
                return {
                    animationOn = v30.imageItemsSize > 1, 
                    animatedIndex = l_selectedIndex_0, 
                    focusIndex = v32
                };
            end);
            return;
        end;
    end;
    v24.onPreviewActivated = function() --[[ Line: 145 ]]
        -- upvalues: v24 (copy)
        v24.resetAnimation();
        v24:setState({
            animationOn = false
        });
        if v24.props.onPreviewActivated then
            local l_originalIndex_0 = v24.state.itemsToShow[v24.state.selectedIndex].originalIndex;
            v24.props.onPreviewActivated(l_originalIndex_0);
        end;
    end;
    v24.onMouseEnterPagination = function(_, v35) --[[ Line: 160 ]]
        -- upvalues: v24 (copy)
        if v35.UserInputType ~= Enum.UserInputType.MouseMovement then
            return;
        else
            v24:setState(function(v36) --[[ Line: 165 ]]
                if v36.showArrows then
                    return;
                else
                    return {
                        showArrows = true
                    };
                end;
            end);
            return;
        end;
    end;
    v24.onMouseLeavePagination = function(_, v38) --[[ Line: 176 ]]
        -- upvalues: v24 (copy)
        if v38.UserInputType ~= Enum.UserInputType.MouseMovement then
            return;
        else
            v24:setState(function(v39) --[[ Line: 181 ]]
                if not v39.showArrows then
                    return;
                else
                    return {
                        showArrows = false
                    };
                end;
            end);
            return;
        end;
    end;
    v24.onCycleLeftActivated = function() --[[ Line: 192 ]]
        -- upvalues: v24 (copy)
        if v24.scrolling then
            return;
        else
            local v40 = math.max(v24.state.focusIndex - 1, 1);
            v24.resetAnimation();
            v24:setState({
                animationOn = false, 
                focusIndex = v40
            });
            return;
        end;
    end;
    v24.onCycleRightActivated = function() --[[ Line: 206 ]]
        -- upvalues: v24 (copy)
        if v24.scrolling then
            return;
        else
            local v41 = #v24.props.items;
            local v42 = math.min(v24.state.focusIndex + 1, v41);
            v24.resetAnimation();
            v24:setState({
                animationOn = false, 
                focusIndex = v42
            });
            return;
        end;
    end;
    v24.onItemActivated = function(v43) --[[ Line: 221 ]]
        -- upvalues: v24 (copy)
        local l_isYouTubeVideo_0 = v24.state.itemsToShow[v43].isYouTubeVideo;
        local l_selectedIndex_1 = v24.state.selectedIndex;
        v24.resetAnimation();
        v24:setState({
            animationOn = false, 
            selectedIndex = not l_isYouTubeVideo_0 and v43 or nil
        });
        if l_isYouTubeVideo_0 then
            v24.onVideoPlayActivated(v43);
        end;
        if v24.props.onThumbnailActivated then
            v24.props.onThumbnailActivated(l_selectedIndex_1, v43);
        end;
    end;
    v24.onItemPlayActivated = function(v46) --[[ Line: 241 ]]
        -- upvalues: v24 (copy)
        v24.resetAnimation();
        v24:setState({
            animationOn = false
        });
        v24.onVideoPlayActivated(v46);
    end;
    v24.onVideoPlayActivated = function(v47) --[[ Line: 250 ]]
        -- upvalues: v24 (copy)
        if v24.props.onVideoPlayActivated then
            local l_originalIndex_1 = v24.state.itemsToShow[v47].originalIndex;
            v24.props.onVideoPlayActivated(l_originalIndex_1);
        end;
    end;
    v24.getNextFocusIndex = function(v49) --[[ Line: 259 ]]
        -- upvalues: v24 (copy)
        local l_focusIndex_0 = v24.state.focusIndex;
        local l_numberOfThumbnails_0 = v24.props.numberOfThumbnails;
        if v49 < l_focusIndex_0 then
            return v49;
        elseif l_focusIndex_0 + l_numberOfThumbnails_0 <= v49 then
            return v49 - l_numberOfThumbnails_0 + 1;
        else
            return l_focusIndex_0;
        end;
    end;
    v24.resetAnimation = function() --[[ Line: 274 ]]
        -- upvalues: v24 (copy)
        v24.animationTime = 0;
        v24.updateProgress(0);
        v24.updatePreviewTransparency(0);
    end;
    v24.renderSteppedCallback = function(v52) --[[ Line: 280 ]]
        -- upvalues: v24 (copy)
        v24.animationTime = v24.animationTime + v52;
        local v53 = v24.animationTime - 4.5;
        if v24.animationTime > 5 then
            v24.animationTime = 0;
            v24.updateProgress(0);
            local l_animatedIndex_0 = v24.state.animatedIndex;
            local l_youTubeVideoItemsSize_0 = v24.state.youTubeVideoItemsSize;
            local l_imageItemsSize_0 = v24.state.imageItemsSize;
            local v57 = (l_animatedIndex_0 - l_youTubeVideoItemsSize_0) % l_imageItemsSize_0 + 1 + l_youTubeVideoItemsSize_0;
            local v58 = v24.getNextFocusIndex(v57);
            v24:setState({
                animatedIndex = v57, 
                selectedIndex = v57, 
                focusIndex = v58
            });
            return;
        else
            v24.updateProgress(v24.animationTime / 5);
            if v53 > 0 then
                v24.updatePreviewTransparency(v53 / 0.5);
            end;
            return;
        end;
    end;
    v24.scrollMotorOnStep = function(v59) --[[ Line: 310 ]]
        -- upvalues: v24 (copy)
        v24.updateCanvasPosition(Vector2.new(v59, 0));
    end;
    v24.scrollMotorOnComplete = function() --[[ Line: 314 ]]
        -- upvalues: v24 (copy)
        v24.scrolling = false;
    end;
    v24.scrollMotor:onStep(v24.scrollMotorOnStep);
    v24.scrollMotor:onComplete(v24.scrollMotorOnComplete);
end;
v18.render = function(v60) --[[ Line: 322 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), l_IconButton_0 (copy), v16 (copy), l_Images_0 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy)
    local l_layoutOrder_0 = v60.props.layoutOrder;
    local l_anchorPoint_0 = v60.props.anchorPoint;
    local l_position_0 = v60.props.position;
    local l_size_0 = v60.props.size;
    local l_numberOfThumbnails_1 = v60.props.numberOfThumbnails;
    local v66 = #v60.props.items;
    local l_itemsToShow_0 = v60.state.itemsToShow;
    local l_showArrows_0 = v60.state.showArrows;
    local l_focusIndex_1 = v60.state.focusIndex;
    local l_selectedIndex_2 = v60.state.selectedIndex;
    local l_animationOn_0 = v60.state.animationOn;
    local l_youTubeVideoItemsSize_1 = v60.state.youTubeVideoItemsSize;
    local l_imageItemsSize_1 = v60.state.imageItemsSize;
    local v74 = false;
    if v66 > 1 then
        v74 = not l_animationOn_0;
    end;
    local v75 = l_animationOn_0 and (l_selectedIndex_2 - l_youTubeVideoItemsSize_1) % l_imageItemsSize_1 + 1 + l_youTubeVideoItemsSize_1 or nil;
    local v76 = l_numberOfThumbnails_1 < v66;
    local v77 = l_focusIndex_1 <= 1;
    local v78 = l_focusIndex_1 + l_numberOfThumbnails_1 > #l_itemsToShow_0;
    return l_withStyle_0(function(v79) --[[ Line: 346 ]]
        -- upvalues: v4 (ref), l_layoutOrder_0 (copy), l_size_0 (copy), l_anchorPoint_0 (copy), l_position_0 (copy), v60 (copy), v74 (copy), l_animationOn_0 (copy), v75 (copy), l_itemsToShow_0 (copy), l_selectedIndex_2 (copy), v76 (copy), l_showArrows_0 (copy), l_IconButton_0 (ref), v16 (ref), l_Images_0 (ref), v77 (copy), v78 (copy), l_EventConnection_0 (ref), l_RunService_0 (ref)
        return v4.createElement("Frame", {
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v4.Change.AbsoluteSize] = v60.onResize, 
            [v4.Event.InputEnded] = v74 and v60.onMouseLeave or nil
        }, {
            Content = v4.createElement("Frame", {
                Size = v60.contentSize, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 24)
                }), 
                Preview = v4.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = v60.previewSize, 
                    BackgroundTransparency = 1
                }, {
                    AnimationLabel = l_animationOn_0 and v4.createElement("ImageLabel", {
                        Size = UDim2.fromScale(1, 1), 
                        Image = v75 and l_itemsToShow_0[v75].imageId, 
                        BackgroundTransparency = 1, 
                        ZIndex = -1
                    }, {
                        Corner = v4.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    }) or nil, 
                    Button = v4.createElement("ImageButton", {
                        Size = UDim2.fromScale(1, 1), 
                        Image = l_itemsToShow_0[l_selectedIndex_2].imageId, 
                        ImageTransparency = v60.previewTransparency, 
                        BackgroundTransparency = 1, 
                        AutoButtonColor = false, 
                        ZIndex = 1, 
                        [v4.Event.Activated] = v60.onPreviewActivated
                    }, {
                        Corner = v4.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    })
                }), 
                Pagination = v4.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = v60.paginationSize, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v4.Event.InputBegan] = v76 and v60.onMouseEnterPagination or nil, 
                    [v4.Event.InputEnded] = v76 and v60.onMouseLeavePagination or nil
                }, {
                    LeftArrow = l_showArrows_0 and v4.createElement(l_IconButton_0, {
                        size = UDim2.new(0, v16, 1, 0), 
                        anchorPoint = Vector2.new(0, 0.5), 
                        position = UDim2.fromScale(0, 0.5), 
                        icon = l_Images_0["icons/actions/cycleLeft"], 
                        isDisabled = v77, 
                        onActivated = v60.onCycleLeftActivated
                    }) or nil, 
                    Scroller = v60:renderScroller(v79), 
                    RightArrow = l_showArrows_0 and v4.createElement(l_IconButton_0, {
                        size = UDim2.new(0, v16, 1, 0), 
                        anchorPoint = Vector2.new(1, 0.5), 
                        position = UDim2.fromScale(1, 0.5), 
                        icon = l_Images_0["icons/actions/cycleRight"], 
                        isDisabled = v78, 
                        onActivated = v60.onCycleRightActivated
                    }) or nil
                })
            }), 
            EventConnection = l_animationOn_0 and v4.createElement(l_EventConnection_0, {
                event = l_RunService_0.RenderStepped, 
                callback = v60.renderSteppedCallback
            }) or nil
        });
    end);
end;
v18.renderScroller = function(v80, v81) --[[ Line: 432 ]] --[[ Name: renderScroller ]]
    -- upvalues: v4 (copy), v16 (copy)
    return v4.createElement("ScrollingFrame", {
        Size = UDim2.new(1, -v16 * 2, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ScrollBarThickness = 0, 
        ClipsDescendants = true, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        CanvasPosition = v80.canvasPosition, 
        Selectable = false
    }, v80:renderThumbnails(v81));
end;
v18.renderThumbnails = function(v82, v83) --[[ Line: 447 ]] --[[ Name: renderThumbnails ]]
    -- upvalues: v4 (copy), v12 (copy)
    local l_selectedIndex_3 = v82.state.selectedIndex;
    local l_animationOn_1 = v82.state.animationOn;
    local l_animatedIndex_1 = v82.state.animatedIndex;
    local v87 = {
        ListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        })
    };
    for v88, v89 in ipairs(v82.state.itemsToShow) do
        local v90 = v88 == l_selectedIndex_3;
        local v91 = l_animationOn_1 and v88 == l_animatedIndex_1;
        local v92 = v89.imageId and v89.imageId ~= "";
        v87["item" .. v88] = v4.createElement("Frame", {
            LayoutOrder = v88, 
            Size = v82.thumbnailSize, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            Thumbnail = v4.createElement(v12, {
                itemKey = v88, 
                imageId = v89.imageId, 
                isVideo = v89.isYouTubeVideo, 
                isSelected = v90, 
                onActivated = v92 and v82.onItemActivated or nil, 
                onPlayActivated = v89.isYouTubeVideo and v82.onItemPlayActivated or nil, 
                useScaledPlayButton = true
            }), 
            TimerBar = v91 and v82:renderTimerBar(v83) or nil
        });
    end;
    return v87;
end;
v18.renderTimerBar = function(v93, v94) --[[ Line: 488 ]] --[[ Name: renderTimerBar ]]
    -- upvalues: v4 (copy)
    local l_UIDefault_0 = v94.Theme.UIDefault;
    local l_SecondaryContent_0 = v94.Theme.SecondaryContent;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 2), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        ZIndex = 100
    }, {
        Background = v4.createElement("Frame", {
            Size = v93.thumbnailSize, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_UIDefault_0.Color, 
            BackgroundTransparency = l_UIDefault_0.Transparency
        }, {
            Corner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Progress = v4.createElement("Frame", {
                Size = v93.progress:map(function(v97) --[[ Line: 513 ]]
                    return UDim2.fromScale(v97, 1);
                end), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Foreground = v4.createElement("Frame", {
                    Size = v93.thumbnailSize, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_SecondaryContent_0.Color, 
                    BackgroundTransparency = l_SecondaryContent_0.Transparency
                }, {
                    Corner = v4.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                })
            })
        })
    });
end;
v18.didUpdate = function(v98, _, v100) --[[ Line: 535 ]] --[[ Name: didUpdate ]]
    if v98.state.focusIndex ~= v100.focusIndex then
        v98:scrollToNewIndex();
    end;
    if v98.state.selectedIndex ~= v100.selectedIndex then
        v98.updatePreviewTransparency(0);
    end;
end;
v18.updateSizes = function(v101, v102) --[[ Line: 545 ]] --[[ Name: updateSizes ]]
    -- upvalues: v14 (copy), v13 (copy)
    local l_X_0 = v102.AbsoluteSize.X;
    local l_Y_0 = v102.AbsoluteSize.Y;
    local l_numberOfThumbnails_2 = v101.props.numberOfThumbnails;
    local v106 = v14(l_X_0, l_numberOfThumbnails_2, v101.props.fullWidth);
    if l_Y_0 < v106.contentSize.Y.Offset then
        v106 = v13(l_Y_0, l_numberOfThumbnails_2, v101.props.fullWidth);
    end;
    v101.updateContentSize(v106.contentSize);
    v101.updatePreviewSize(v106.previewSize);
    v101.updatePaginationSize(v106.paginationSize);
    v101.updateThumbnailSize(v106.thumbnailSize);
end;
v18.getCanvasPositionX = function(v107) --[[ Line: 561 ]] --[[ Name: getCanvasPositionX ]]
    local l_focusIndex_2 = v107.state.focusIndex;
    local l_Offset_0 = v107.thumbnailSize:getValue().X.Offset;
    return (l_focusIndex_2 - 1) * (l_Offset_0 + 12);
end;
v18.scrollToNewIndex = function(v110) --[[ Line: 567 ]] --[[ Name: scrollToNewIndex ]]
    -- upvalues: v3 (copy), v17 (copy)
    local l_X_1 = v110.canvasPosition:getValue().X;
    local v112 = v110:getCanvasPositionX();
    v110.scrollMotor:setGoal(v3.instant(l_X_1));
    v110.scrollMotor:setGoal(v3.spring(v112, v17));
    v110.scrolling = true;
end;
return v18;