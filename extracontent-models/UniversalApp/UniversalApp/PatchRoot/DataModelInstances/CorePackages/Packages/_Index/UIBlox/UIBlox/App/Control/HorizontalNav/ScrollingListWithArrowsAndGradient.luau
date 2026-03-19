local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_0.HorizontalNav.IntroScroll);
local v5 = require(l_Parent_0.HorizontalNav.GradientFrame);
local v6 = require(l_Parent_0.HorizontalNav.ArrowFrame);
local v7 = require(l_Parent_0.HorizontalNav.Utils);
local v8 = require(l_Parent_1.Utility.useIsMouseAndKeyboard);
return function(v9) --[[ Line: 56 ]] --[[ Name: ScrollingListWithArrowsAndGradient ]]
    -- upvalues: v8 (copy), v3 (copy), v7 (copy), v5 (copy), v6 (copy), v4 (copy)
    local l_listHeight_0 = v9.listHeight;
    local l_childWidgetIndex_0 = v9.childWidgetIndex;
    local l_useIntroScroll_0 = v9.useIntroScroll;
    local v13 = v9.canvasWidth or 0;
    local v14 = v8();
    local v15 = v3.useRef(nil);
    local v16, v17 = v3.useBinding(false);
    local v18, v19 = v3.useBinding(false);
    local v20, v21 = v3.useBinding(Vector2.new(0, 0));
    local v29 = v3.useCallback(function(v22) --[[ Line: 70 ]]
        -- upvalues: v15 (copy), v7 (ref), v9 (copy), v14 (copy), v17 (copy), v19 (copy)
        local v23 = v15:getValue();
        if not v23 then
            return;
        else
            local v24, v25, v26 = v7.shouldShowGradientsForScrollingFrame(v22);
            v23.Visible = v24 and (not v9.hideGradient or v14);
            local l_Left_0 = v23:FindFirstChild("Left");
            local l_Right_0 = v23:FindFirstChild("Right");
            if l_Left_0 and l_Right_0 then
                l_Left_0.Visible = v25;
                l_Right_0.Visible = v26;
            end;
            v17(v25);
            v19(v26);
            return;
        end;
    end, {
        v15, 
        v17, 
        v19
    });
    local v31 = v3.useCallback(function(v30) --[[ Line: 92 ]]
        -- upvalues: v29 (copy), v21 (copy)
        v29(v30);
        v21(v30.CanvasPosition);
    end, {
        v29, 
        v21
    });
    v3.useEffect(function() --[[ Line: 99 ]]
        -- upvalues: v9 (copy), v29 (copy)
        local v32 = v9.scrollingFrameRef:getValue();
        if v32 then
            v29(v32);
        end;
    end);
    return v3.createElement(v3.Fragment, {}, {
        ScrollingList = v3.createElement("ScrollingFrame", {
            ClipsDescendants = v9.clipsDescendants, 
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(0, v13, 1, 0), 
            CanvasPosition = v20, 
            ScrollBarThickness = 0, 
            BackgroundTransparency = 1, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ZIndex = 2, 
            [v3.Change.AbsoluteSize] = v29, 
            [v3.Change.CanvasSize] = v29, 
            [v3.Change.CanvasPosition] = v31, 
            ref = v9.scrollingFrameRef
        }, v9.getScollingListContent()), 
        GradientFrame = v3.createElement(v5, {
            height = l_listHeight_0, 
            frameRef = v15, 
            ZIndex = 3
        }), 
        ArrowFrame = v14 and v3.createElement(v6, {
            isVisibleLeft = v16, 
            isVisibleRight = v18, 
            defaultUseProps = {
                scrollingFrameRef = v9.scrollingFrameRef, 
                buttonRefs = v9.buttonRefs, 
                buttonWidth = v9.buttonWidth, 
                padOutsideEdges = v9.padOutsideEdges, 
                numButtons = v9.numButtons, 
                buttonPadding = v9.buttonPadding, 
                updateCanvasPosition = v21
            }, 
            ZIndex = 4
        }), 
        IntroScroll = l_useIntroScroll_0 and v3.createElement(v4, {
            childWidgetIndex = l_childWidgetIndex_0, 
            scrollingFrameRef = v9.scrollingFrameRef, 
            updateCanvasPosition = v21
        }) or nil
    });
end;