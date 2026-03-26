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
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppEnableVRCarouselScrolling_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableVRCarouselScrolling;
local function _(v14, v15, v16, v17) --[[ Line: 50 ]] --[[ Name: areScrollButtonsEnabled ]]
    -- upvalues: v7 (copy), l_FFlagLuaAppEnableVRCarouselScrolling_0 (copy)
    if not v16 then
        return false;
    else
        return v14 == v7.Input.Pointer and v15 ~= v7.Input.Directional or l_FFlagLuaAppEnableVRCarouselScrolling_0 and v17;
    end;
end;
VariableItemWidthCarousel = function(v19, v20) --[[ Line: 68 ]] --[[ Name: VariableItemWidthCarousel ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLastInput_0 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppEnableVRCarouselScrolling_0 (copy), v7 (copy), v3 (copy), v11 (copy), l_CollectionHeader_0 (copy), l_CarouselScrollButtons_0 (copy)
    local v21 = l_useDesignTokens_0();
    local v22 = l_useLastInput_0();
    local v23 = l_usePreferredInput_0();
    local v24 = l_useIsSpatial_0();
    local l_items_0 = v19.items;
    local l_renderItem_0 = v19.renderItem;
    local l_itemPadding_0 = v19.itemPadding;
    local l_itemHeight_0 = v19.itemHeight;
    local v29 = if l_FFlagLuaAppCompositionSupport_0 then v19.sideMargin or 0 else v19.sideMargin;
    local l_calculateItemWidth_0 = v19.calculateItemWidth;
    local l_scrollingFrameRef_0 = v19.scrollingFrameRef;
    local v32 = v19.title and v19.title ~= "";
    local l_scrollButtonsEnabled_0 = v19.scrollButtonsEnabled;
    if l_scrollButtonsEnabled_0 then
        local v34 = l_FFlagLuaAppEnableVRCarouselScrolling_0 and true or not v24;
        local v35 = if l_FFlagLuaAppEnableVRCarouselScrolling_0 then v24 else nil;
        l_scrollButtonsEnabled_0 = not not v34 and (v22 == v7.Input.Pointer and v23 ~= v7.Input.Directional or l_FFlagLuaAppEnableVRCarouselScrolling_0 and v35);
    end;
    local v39 = v3.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: l_items_0 (copy), l_renderItem_0 (copy)
        local v36 = {};
        for v37, v38 in ipairs(l_items_0) do
            v36[v37] = l_renderItem_0(v38, v37);
        end;
        return v36;
    end, {
        l_items_0, 
        l_renderItem_0
    });
    local v40, v41, v42, v43, v44 = v11(l_items_0, l_itemPadding_0, l_calculateItemWidth_0, l_scrollingFrameRef_0, v19.scrollSpeed);
    local v46 = v3.useCallback(function(v45) --[[ Line: 102 ]]
        -- upvalues: v44 (copy), v19 (copy)
        v44();
        if v19.onCanvasPositionChanged and v45 then
            v19.onCanvasPositionChanged(v45.CanvasPosition);
        end;
    end, {
        v44, 
        v19.onCanvasPositionChanged
    });
    local l_createElement_0 = v3.createElement;
    local v48 = "Frame";
    local v49 = {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v19.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v19.LayoutOrder, 
        ref = v20
    };
    local v50 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v29), 
            PaddingRight = UDim.new(0, v29)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if v32 then v19.headerContentPadding or v21.Global.Size_200 else 0)
        })
    };
    local l_createElement_1 = v3.createElement;
    local l_l_CollectionHeader_0_0 = l_CollectionHeader_0;
    local v53 = {
        LayoutOrder = 1, 
        title = v19.title, 
        subtitle = v19.subtitle, 
        tooltipInfoText = v19.tooltipInfoText, 
        onActivateInfoIcon = v19.onActivateInfoIcon, 
        tooltipSupportsVR = v19.tooltipSupportsVR, 
        tooltipSupportsTenFootUi = v19.tooltipSupportsTenFootUi
    };
    local v54 = true;
    if #l_items_0 >= 1 then
        v54 = v19.hideHeaderButton or not v32;
    end;
    v53.hideButton = v54;
    v53.onActivate = v19.onActivateHeader;
    v53.buttonText = v19.headerButtonText;
    v50.Header = l_createElement_1(l_l_CollectionHeader_0_0, v53);
    v50.ContentFrame = v3.createElement("Frame", {
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
            [v3.Change.AbsoluteSize] = v44, 
            [v3.Change.CanvasPosition] = v46
        }, {
            v3.createElement(v3.Fragment, nil, {
                v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, l_itemPadding_0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                v3.createElement(v3.Fragment, nil, v39)
            })
        }), 
        ScrollButtons = if l_scrollButtonsEnabled_0 then v3.createElement(l_CarouselScrollButtons_0, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(1, 2 * v29, 0, l_itemHeight_0), 
            ZIndex = 2, 
            buttonOffsetFromEdge = v21.Global.Size_100, 
            handleScrollLeft = v40, 
            handleScrollRight = v41, 
            leftScrollingEnabled = v42, 
            rightScrollingEnabled = v43
        }) else nil
    });
    return l_createElement_0(v48, v49, v50);
end;
return v3.forwardRef(VariableItemWidthCarousel);