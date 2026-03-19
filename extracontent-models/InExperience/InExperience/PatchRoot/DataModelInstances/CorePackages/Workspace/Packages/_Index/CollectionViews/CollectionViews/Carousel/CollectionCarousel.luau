local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ArgCheck);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v6 = require(l_Parent_0.Responsive);
local l_useLastInput_0 = v6.useLastInput;
local l_usePreferredInput_0 = v6.usePreferredInput;
local l_useIsSpatial_0 = v6.useIsSpatial;
local v10 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local v12 = require(l_script_FirstAncestor_0.useCollectionSizeBindings);
local v13 = require(l_script_FirstAncestor_0.Carousel.useScrollButtonHandlers);
local v14 = require(l_script_FirstAncestor_0.Carousel.CollectionBackgroundMural);
local v15 = require(l_script_FirstAncestor_0.CollectionHeader);
local v16 = require(l_script_FirstAncestor_0.Carousel.ScrollingRowOfCollectionItems);
local v17 = require(l_script_FirstAncestor_0.maybeForceDarkTheme);
local v18 = require(l_script_FirstAncestor_0.Carousel.CarouselScrollButtons);
local v19 = v10.strictInterface({
    testId = v10.optional(v10.string), 
    Position = v10.optional(v10.UDim2), 
    LayoutOrder = v10.optional(v10.number), 
    containerRef = v10.optional(v10.union(v10.table, v10.callback)), 
    scrollingFrameRef = v10.optional(v10.table), 
    onScrollingFrameRefCallback = v10.optional(v10.callback), 
    numColumns = v10.number, 
    fractionalItemAmount = v10.optional(v10.number), 
    items = v10.table, 
    renderItem = v10.callback, 
    getItemHeight = v10.callback, 
    columnGap = v10.optional(v10.number), 
    sideMargin = v10.optional(v10.number), 
    backgroundMuralUrl = v10.optional(v10.string), 
    title = v10.optional(v10.union(v10.string, v10.callback)), 
    subtitle = v10.optional(v10.string), 
    tooltipInfoText = v10.optional(v10.string), 
    onActivateInfoIcon = v10.optional(v10.callback), 
    tooltipSupportsVR = v10.optional(v10.boolean), 
    tooltipSupportsTenFootUi = v10.optional(v10.boolean), 
    onActivateHeader = v10.optional(v10.callback), 
    onActivateSubtitle = v10.optional(v10.callback), 
    headerButtonText = v10.optional(v10.string), 
    onViewableItemsChanged = v10.optional(v10.callback), 
    onContainerSizeChanged = v10.optional(v10.callback), 
    onChangeCanvasPosition = v10.optional(v10.callback), 
    onReachedThresholdFromEnd = v10.optional(v10.union(v10.callback, v10.table)), 
    thresholdFromEnd = v10.optional(v10.number), 
    scrollingEnabledOverride = v10.optional(v10.boolean), 
    shouldShowScrollButtonsOverride = v10.optional(v10.boolean), 
    hideHeaderButton = v10.optional(v10.boolean), 
    maxItemsToShow = v10.optional(v10.number), 
    numItemsToRenderOffScreen = v10.optional(v10.number), 
    onScrollButtonEnter = v10.optional(v10.callback), 
    onScrollButtonLeave = v10.optional(v10.callback), 
    AutomaticSize = v10.optional(v10.enum(Enum.AutomaticSize)), 
    headerComponent = v10.optional(v10.table)
});
local v20 = {
    numColumns = 0, 
    fractionalItemAmount = 0, 
    columnGap = 0, 
    sideMargin = 0
};
local function _(v21, v22) --[[ Line: 187 ]] --[[ Name: isScrollingEnabled ]]
    if v21 ~= nil then
        return v21;
    else
        return not v22;
    end;
end;
local _ = function(v24, _, v26, v27) --[[ Line: 197 ]] --[[ Name: areScrollButtonsEnabled ]]
    -- upvalues: v6 (copy)
    if not v26 then
        return false;
    elseif v27 ~= nil then
        return v27;
    else
        return v24 == v6.Input.Pointer;
    end;
end;
return (v2.memo(function(v29) --[[ Line: 216 ]] --[[ Name: CollectionCarousel ]]
    -- upvalues: l_validateProps_0 (copy), v19 (copy), v3 (copy), v20 (copy), v4 (copy), v2 (copy), l_useLastInput_0 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v6 (copy), v12 (copy), v13 (copy), l_useDesignTokens_0 (copy), v14 (copy), v17 (copy), v15 (copy), v16 (copy), v18 (copy)
    l_validateProps_0(v19, v29);
    local v30 = v3.Dictionary.join(v20, v29);
    local l_numColumns_0 = v30.numColumns;
    local l_sideMargin_0 = v30.sideMargin;
    local l_columnGap_0 = v30.columnGap;
    v4.assert(l_numColumns_0 >= 1);
    v4.assert(l_sideMargin_0 >= 0);
    v4.assert(v30.fractionalItemAmount >= 0);
    v4.assert(l_columnGap_0 >= 0);
    local v34 = v2.useRef(nil);
    local v36 = v2.useCallback(function(v35) --[[ Line: 230 ]]
        -- upvalues: v34 (copy), v30 (copy)
        v34.current = v35;
        if v30.onScrollingFrameRefCallback then
            v30.onScrollingFrameRefCallback(v35);
        end;
        if v30.scrollingFrameRef then
            v30.scrollingFrameRef.current = v35;
        end;
    end, {
        v30.onScrollingFrameRefCallback, 
        v30.scrollingFrameRef
    });
    local v37 = l_useLastInput_0();
    local v38 = l_usePreferredInput_0();
    local v39 = l_useIsSpatial_0();
    local v40 = v30.hideHeaderButton or v38 == v6.Input.Directional;
    local l_scrollingEnabledOverride_0 = v30.scrollingEnabledOverride;
    local v42 = if l_scrollingEnabledOverride_0 ~= nil then l_scrollingEnabledOverride_0 else not v39;
    l_scrollingEnabledOverride_0 = math.min(v30.maxItemsToShow or #v30.items, #v30.items);
    if not v42 then
        l_scrollingEnabledOverride_0 = math.min(l_numColumns_0, l_scrollingEnabledOverride_0);
    end;
    v4.assert(l_scrollingEnabledOverride_0 >= 0);
    local v43 = if v42 and l_numColumns_0 < l_scrollingEnabledOverride_0 then v30.fractionalItemAmount else 0;
    local v44, v45, v46, v47 = v12(l_numColumns_0, l_columnGap_0, l_sideMargin_0, v43, v30.getItemHeight, v30.onContainerSizeChanged);
    local l_shouldShowScrollButtonsOverride_0 = v30.shouldShowScrollButtonsOverride;
    local v49 = not not v42 and if l_shouldShowScrollButtonsOverride_0 ~= nil then l_shouldShowScrollButtonsOverride_0 else v37 == v6.Input.Pointer;
    local v50, v51, v52;
    l_shouldShowScrollButtonsOverride_0, v50, v51, v52 = v13(v34, l_scrollingEnabledOverride_0, v49, l_numColumns_0, v44, l_columnGap_0);
    local v53 = l_useDesignTokens_0();
    local l_Size_200_0 = v53.Global.Size_200;
    local l_Size_250_0 = v53.Global.Size_250;
    local l_White_0 = v53.Global.Color.White;
    local v57 = v30.backgroundMuralUrl ~= nil;
    local v58 = v30.title and v30.title ~= "";
    local l_createElement_0 = v2.createElement;
    local v60 = "Frame";
    local v61 = {
        ref = v30.containerRef, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v30.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v30.LayoutOrder, 
        [v2.Tag] = if v30.testId then ("data-testid=%*"):format(v30.testId) else nil
    };
    local v62 = {
        BackgroundMural = v30.backgroundMuralUrl and v2.createElement(v14, {
            backgroundMuralUrl = v30.backgroundMuralUrl, 
            containerSizeBinding = v45, 
            ZIndex = -1
        }) or nil
    };
    local l_createElement_1 = v2.createElement;
    local v64 = "Frame";
    local v65 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v46, 
        ref = v47
    };
    local v66 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = if v30.backgroundMuralUrl ~= nil then UDim.new(0, l_Size_250_0) else nil, 
            PaddingLeft = UDim.new(0, l_sideMargin_0), 
            PaddingRight = UDim.new(0, l_sideMargin_0)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if not not v58 or v30.headerComponent then l_Size_200_0 else 0)
        })
    };
    local v67;
    if v30.headerComponent then
        v67 = v30.headerComponent;
    else
        v67 = v17;
        local l_createElement_2 = v2.createElement;
        local l_v15_0 = v15;
        local v70 = {
            LayoutOrder = 1, 
            title = v30.title, 
            subtitle = v30.subtitle, 
            tooltipInfoText = v30.tooltipInfoText, 
            onActivateInfoIcon = v30.onActivateInfoIcon, 
            tooltipSupportsVR = v30.tooltipSupportsVR, 
            tooltipSupportsTenFootUi = v30.tooltipSupportsTenFootUi
        };
        local v71 = true;
        if #v30.items >= 1 then
            v71 = v40 or not v58;
        end;
        v70.hideButton = v71;
        v70.onActivate = v30.onActivateHeader;
        v70.onActivateSubtitle = v30.onActivateSubtitle;
        v70.buttonText = v30.headerButtonText;
        v70.titleColor = if v57 then l_White_0 else nil;
        v70.subtitleColor = if v57 then l_White_0 else nil;
        v67 = v67(l_createElement_2(l_v15_0, v70), v57);
    end;
    v66.CollectionHeader = v67;
    v66.Items = v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2
    }, {
        ScrollingItems = v2.createElement(v16, {
            ScrollingEnabled = v42, 
            onChangeCanvasPosition = v30.onChangeCanvasPosition, 
            onScrollingFrameRefCallback = v36, 
            itemSizeBinding = v44, 
            items = v30.items, 
            totalItemsOnCanvas = l_scrollingEnabledOverride_0, 
            numColumns = l_numColumns_0, 
            columnGap = l_columnGap_0, 
            renderItem = v30.renderItem, 
            sideMargin = l_sideMargin_0, 
            numItemsToRenderOffScreen = v30.numItemsToRenderOffScreen, 
            onReachedThresholdFromEnd = v30.onReachedThresholdFromEnd, 
            thresholdFromEnd = v30.thresholdFromEnd, 
            onViewableItemsChanged = v30.onViewableItemsChanged, 
            AutomaticSize = v30.AutomaticSize
        }), 
        ScrollButtons = if v49 then v2.createElement(v18, {
            handleScrollLeft = l_shouldShowScrollButtonsOverride_0, 
            handleScrollRight = v50, 
            leftScrollingEnabled = v51, 
            rightScrollingEnabled = v52, 
            ZIndex = 10, 
            Size = UDim2.new(1, 2 * l_sideMargin_0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            buttonOffsetFromEdge = v53.Global.Size_100, 
            onScrollButtonEnter = v30.onScrollButtonEnter, 
            onScrollButtonLeave = v30.onScrollButtonLeave
        }) else nil
    });
    v62.CollectionContent = l_createElement_1(v64, v65, v66);
    return l_createElement_0(v60, v61, v62);
end));