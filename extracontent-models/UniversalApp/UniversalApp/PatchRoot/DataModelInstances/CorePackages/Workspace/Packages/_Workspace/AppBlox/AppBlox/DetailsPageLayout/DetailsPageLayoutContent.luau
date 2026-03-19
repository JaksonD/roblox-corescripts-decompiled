local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.ReactUtils);
local l_ScrollView_0 = v2.ScrollView;
local l_View_0 = v2.View;
local v6 = require(script.Parent.DetailsPageLayoutContext);
local v7 = require(script.Parent.DetailsPageLayoutUtils);
return v1.memo(v1.forwardRef(function(v8, v9) --[[ Line: 30 ]] --[[ Name: DetailsPageLayoutContent ]]
    -- upvalues: v1 (copy), v6 (copy), v3 (copy), l_View_0 (copy), v7 (copy), l_ScrollView_0 (copy)
    local v10 = v1.useContext(v6);
    local l_maxContentWidth_0 = v10.maxContentWidth;
    local l_contentTopOffset_0 = v10.contentTopOffset;
    local l_hasFullBleed_0 = v10.hasFullBleed;
    local l_isFullscreen_0 = v10.isFullscreen;
    local l_headerBarHeight_0 = v10.headerBarHeight;
    local l_hasHeader_0 = v10.hasHeader;
    local l_onCanvasPositionChanged_0 = v10.onCanvasPositionChanged;
    local l_fullBleedOverlap_0 = v10.fullBleedOverlap;
    local l_initialScrollY_0 = v10.initialScrollY;
    local l_hasValidContainerSize_0 = v10.hasValidContainerSize;
    local l_containerHeight_0 = v10.containerHeight;
    local l_onCanvasSizeChanged_0 = v10.onCanvasSizeChanged;
    local l_hasActions_0 = v10.hasActions;
    local l_actionBarHeight_0 = v10.actionBarHeight;
    local l_testId_0 = v10.testId;
    assert(l_testId_0, "DetailsPageLayout.Content must be used within DetailsPageLayout.Root");
    local v27 = v1.useCallback(function(v26) --[[ Line: 50 ]]
        -- upvalues: l_initialScrollY_0 (copy)
        if v26 and l_initialScrollY_0 > 0 then
            v26.CanvasPosition = Vector2.new(0, l_initialScrollY_0);
        end;
    end, {
        l_initialScrollY_0
    });
    local v28 = v3.useComposedRef(v8.scrollingFrameRef, v27);
    if l_isFullscreen_0 then
        assert(l_hasHeader_0 and l_hasActions_0 and l_actionBarHeight_0, "bindings required in fullscreen mode");
        local v34 = v1.joinBindings({
            l_hasHeader_0, 
            l_hasActions_0, 
            l_actionBarHeight_0
        }):map(function(v29) --[[ Line: 65 ]]
            -- upvalues: l_headerBarHeight_0 (copy)
            local v30 = v29[1];
            local v31 = v29[2];
            local v32 = v29[3];
            local v33 = if v30 then l_headerBarHeight_0 else 0;
            return UDim2.new(1, 0, 1, -(v33 + if v31 then v32 else 0));
        end);
        local v36 = l_hasHeader_0:map(function(v35) --[[ Line: 73 ]]
            -- upvalues: l_headerBarHeight_0 (copy)
            return UDim2.new(0, 0, 0, if v35 then l_headerBarHeight_0 else 0);
        end);
        return v1.createElement(l_View_0, {
            Size = v34, 
            Position = v36, 
            ZIndex = 1, 
            tag = "col bg-surface-0", 
            testId = ("%*--content"):format(l_testId_0), 
            ref = v9
        }, {
            Children = v1.createElement(v1.Fragment, nil, v8.children)
        });
    else
        assert(l_contentTopOffset_0 and l_onCanvasPositionChanged_0 and l_containerHeight_0 and l_hasActions_0 and l_actionBarHeight_0, "DetailsPageLayout.Content requires bindings in scroll mode");
        local v39 = l_contentTopOffset_0:map(function(v37) --[[ Line: 95 ]]
            -- upvalues: v7 (ref), l_hasFullBleed_0 (copy), l_fullBleedOverlap_0 (copy), l_headerBarHeight_0 (copy)
            local v38 = v7.computeCanvasPaddingTop(v37, l_hasFullBleed_0, l_fullBleedOverlap_0, l_headerBarHeight_0);
            return UDim.new(0, v38);
        end);
        local v43 = v1.joinBindings({
            l_hasActions_0, 
            l_actionBarHeight_0
        }):map(function(v40) --[[ Line: 101 ]]
            local v41 = v40[1];
            local v42 = v40[2];
            if v41 then
                return (UDim.new(0, v42));
            else
                return (UDim.new(0, 0));
            end;
        end);
        if l_hasFullBleed_0 and not l_hasValidContainerSize_0 then
            return v1.createElement(l_View_0, {
                tag = "size-full clip bg-surface-0", 
                ZIndex = 1, 
                testId = ("%*--content"):format(l_testId_0), 
                ref = v9
            });
        else
            return v1.createElement(l_ScrollView_0, {
                scrollingFrameRef = v28, 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                }, 
                onAbsoluteCanvasSizeChanged = function(v44) --[[ Line: 128 ]] --[[ Name: onAbsoluteCanvasSizeChanged ]]
                    -- upvalues: l_onCanvasSizeChanged_0 (copy)
                    if l_onCanvasSizeChanged_0 then
                        local v45 = v44.AbsoluteCanvasSize.Y - v44.AbsoluteSize.Y;
                        l_onCanvasSizeChanged_0(v45);
                    end;
                end, 
                onCanvasPositionChanged = l_onCanvasPositionChanged_0, 
                testId = ("%*--content"):format(l_testId_0), 
                tag = "size-full clip", 
                ZIndex = 1, 
                ref = v9
            }, v1.createElement(l_View_0, {
                tag = "size-full-0 auto-y col"
            }, {
                CanvasPadding = v1.createElement("UIPadding", {
                    PaddingTop = v39, 
                    PaddingBottom = v43
                }), 
                ContentSection = v1.createElement(l_View_0, {
                    Size = l_containerHeight_0:map(function(v46) --[[ Line: 149 ]]
                        return UDim2.new(1, 0, 0, v46);
                    end), 
                    tag = "auto-y", 
                    LayoutOrder = 1
                }, {
                    BackgroundLayers = v1.createElement(l_View_0, {
                        tag = "size-full col", 
                        ZIndex = 0
                    }, {
                        GradientBar = if l_hasFullBleed_0 then v1.createElement(l_View_0, {
                            Size = l_contentTopOffset_0:map(function(v47) --[[ Line: 162 ]]
                                -- upvalues: l_fullBleedOverlap_0 (copy)
                                return UDim2.new(1, 0, 0, (math.min(v47, l_fullBleedOverlap_0)));
                            end), 
                            tag = "bg-surface-0", 
                            LayoutOrder = 0
                        }, {
                            Gradient = v1.createElement("UIGradient", {
                                Rotation = 270, 
                                Transparency = NumberSequence.new({
                                    NumberSequenceKeypoint.new(0, 0), 
                                    NumberSequenceKeypoint.new(0.5, 0.25), 
                                    NumberSequenceKeypoint.new(1, 1)
                                })
                            })
                        }) else nil, 
                        SolidFill = v1.createElement(l_View_0, {
                            tag = "size-full-0 fill bg-surface-0", 
                            LayoutOrder = 1
                        })
                    }), 
                    ContentBackground = v1.createElement(l_View_0, {
                        tag = "size-full-0 auto-y col align-x-center", 
                        ZIndex = 1
                    }, {
                        ContentConstraint = v1.createElement(l_View_0, {
                            tag = "size-full-0 auto-y col"
                        }, {
                            SizeConstraint = if l_maxContentWidth_0 then v1.createElement("UISizeConstraint", {
                                MaxSize = Vector2.new(l_maxContentWidth_0, 1e999)
                            }) else nil, 
                            Children = v1.createElement(v1.Fragment, nil, v8.children)
                        })
                    })
                })
            }));
        end;
    end;
end));