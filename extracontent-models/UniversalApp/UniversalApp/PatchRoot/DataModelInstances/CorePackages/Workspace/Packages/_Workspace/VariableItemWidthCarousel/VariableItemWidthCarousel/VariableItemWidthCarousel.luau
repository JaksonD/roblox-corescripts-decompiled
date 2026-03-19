local l_script_FirstAncestor_0 = script:FindFirstAncestor("VariableItemWidthCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.CollectionViews);
local v3 = require(l_Parent_0.React);
local l_CarouselScrollButtons_0 = v2.CarouselScrollButtons;
local l_CollectionHeader_0 = v2.CollectionHeader;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v7 = require(l_Parent_0.Responsive);
local l_useLastInput_0 = v7.useLastInput;
local l_usePreferredInput_0 = v7.usePreferredInput;
local l_useIsSpatial_0 = v7.useIsSpatial;
local v11 = require(l_script_FirstAncestor_0.useVariableItemWidthScrollHandlers);
local function _(v12, v13, v14) --[[ Line: 47 ]] --[[ Name: areScrollButtonsEnabled ]]
    -- upvalues: v7 (copy)
    if not v14 then
        return false;
    else
        local v15 = false;
        if v12 == v7.Input.Pointer then
            v15 = v13 ~= v7.Input.Directional;
        end;
        return v15;
    end;
end;
VariableItemWidthCarousel = function(v17, v18) --[[ Line: 59 ]] --[[ Name: VariableItemWidthCarousel ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLastInput_0 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v7 (copy), v3 (copy), v11 (copy), l_CollectionHeader_0 (copy), l_CarouselScrollButtons_0 (copy)
    local v19 = l_useDesignTokens_0();
    local v20 = l_useLastInput_0();
    local v21 = l_usePreferredInput_0();
    local v22 = l_useIsSpatial_0();
    local l_items_0 = v17.items;
    local l_renderItem_0 = v17.renderItem;
    local l_itemPadding_0 = v17.itemPadding;
    local l_itemHeight_0 = v17.itemHeight;
    local l_sideMargin_0 = v17.sideMargin;
    local l_calculateItemWidth_0 = v17.calculateItemWidth;
    local l_scrollingFrameRef_0 = v17.scrollingFrameRef;
    local v30 = v17.title and v17.title ~= "";
    local v31 = v17.scrollButtonsEnabled and not v22 and v20 == v7.Input.Pointer and v21 ~= v7.Input.Directional;
    local v35 = v3.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: l_items_0 (copy), l_renderItem_0 (copy)
        local v32 = {};
        for v33, v34 in ipairs(l_items_0) do
            v32[v33] = l_renderItem_0(v34, v33);
        end;
        return v32;
    end, {
        l_items_0, 
        l_renderItem_0
    });
    local v36, v37, v38, v39, v40 = v11(l_items_0, l_itemPadding_0, l_calculateItemWidth_0, l_scrollingFrameRef_0, v17.scrollSpeed);
    local v42 = v3.useCallback(function(v41) --[[ Line: 88 ]]
        -- upvalues: v40 (copy), v17 (copy)
        v40();
        if v17.onCanvasPositionChanged and v41 then
            v17.onCanvasPositionChanged(v41.CanvasPosition);
        end;
    end, {
        v40, 
        v17.onCanvasPositionChanged
    });
    local l_createElement_0 = v3.createElement;
    local v44 = "Frame";
    local v45 = {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v17.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v17.LayoutOrder, 
        ref = v18
    };
    local v46 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_sideMargin_0), 
            PaddingRight = UDim.new(0, l_sideMargin_0)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if v30 then v17.headerContentPadding or v19.Global.Size_200 else 0)
        })
    };
    local l_createElement_1 = v3.createElement;
    local l_l_CollectionHeader_0_0 = l_CollectionHeader_0;
    local v49 = {
        LayoutOrder = 1, 
        title = v17.title, 
        subtitle = v17.subtitle, 
        tooltipInfoText = v17.tooltipInfoText, 
        onActivateInfoIcon = v17.onActivateInfoIcon, 
        tooltipSupportsVR = v17.tooltipSupportsVR, 
        tooltipSupportsTenFootUi = v17.tooltipSupportsTenFootUi
    };
    local v50 = true;
    if #l_items_0 >= 1 then
        v50 = v17.hideHeaderButton or not v30;
    end;
    v49.hideButton = v50;
    v49.onActivate = v17.onActivateHeader;
    v49.buttonText = v17.headerButtonText;
    v46.Header = l_createElement_1(l_l_CollectionHeader_0_0, v49);
    v46.ContentFrame = v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Size = UDim2.new(1, 0, 0, l_itemHeight_0)
    }, {
        DynamicScrollingFrame = v3.createElement("ScrollingFrame", {
            AutomaticCanvasSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            CanvasSize = UDim2.new(0, 0, 0, l_itemHeight_0), 
            ClipsDescendants = false, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Selectable = false, 
            Size = UDim2.new(1, 0, 0, l_itemHeight_0), 
            ZIndex = 1, 
            ref = l_scrollingFrameRef_0, 
            [v3.Change.AbsoluteSize] = v40, 
            [v3.Change.CanvasPosition] = v42
        }, {
            v3.createElement(v3.Fragment, nil, {
                v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, l_itemPadding_0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                v3.createElement(v3.Fragment, nil, v35)
            })
        }), 
        ScrollButtons = if v31 then v3.createElement(l_CarouselScrollButtons_0, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(1, l_sideMargin_0 * 2, 0, l_itemHeight_0), 
            ZIndex = 2, 
            buttonOffsetFromEdge = v19.Global.Size_100, 
            handleScrollLeft = v36, 
            handleScrollRight = v37, 
            leftScrollingEnabled = v38, 
            rightScrollingEnabled = v39
        }) else nil
    });
    return l_createElement_0(v44, v45, v46);
end;
return v3.forwardRef(VariableItemWidthCarousel);