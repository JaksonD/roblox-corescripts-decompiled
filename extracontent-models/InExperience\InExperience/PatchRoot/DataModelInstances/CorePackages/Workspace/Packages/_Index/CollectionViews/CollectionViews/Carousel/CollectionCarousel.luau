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
local v14 = require(l_script_FirstAncestor_0.Carousel.useCarouselScrollingBinding);
local v15 = require(l_script_FirstAncestor_0.Carousel.CollectionBackgroundMural);
local v16 = require(l_script_FirstAncestor_0.CollectionHeader);
local v17 = require(l_script_FirstAncestor_0.Carousel.ScrollingRowOfCollectionItems);
local v18 = require(l_script_FirstAncestor_0.maybeForceDarkTheme);
local v19 = require(l_script_FirstAncestor_0.Carousel.CarouselScrollButtons);
local _ = require(l_script_FirstAncestor_0.CollectionViewTypes);
local v21 = require(l_script_FirstAncestor_0.CollectionLayoutStore.useCollectionLayout);
local l_CompositionTags_0 = require(l_Parent_0.AppComposition).CompositionTags;
local v23 = require(l_script_FirstAncestor_0.Carousel.calculateCarouselSpacingMetrics);
local v24 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v24.FFlagLuaAppCompositionSupport;
local l_FFlagCollectionViewMathChanges_0 = v24.FFlagCollectionViewMathChanges;
local v27 = v10.strictInterface({
    testId = v10.optional(v10.string), 
    Position = v10.optional(v10.UDim2), 
    LayoutOrder = v10.optional(v10.number), 
    containerRef = v10.optional(v10.union(v10.table, v10.callback)), 
    scrollingFrameRef = v10.optional(v10.table), 
    onScrollingFrameRefCallback = v10.optional(v10.callback), 
    numColumns = if l_FFlagLuaAppCompositionSupport_0 then v10.optional(v10.number) else v10.number, 
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
    headerComponent = v10.optional(v10.table), 
    collectionItemSize = if l_FFlagLuaAppCompositionSupport_0 then v10.optional(v10.string) else nil, 
    enableHoverOverflow = if l_FFlagLuaAppCompositionSupport_0 then v10.optional(v10.boolean) else nil
});
local v28 = {
    numColumns = 0, 
    fractionalItemAmount = 0, 
    columnGap = 0, 
    sideMargin = 0
};
local function _(v29, v30) --[[ Line: 214 ]] --[[ Name: isScrollingEnabled ]]
    if v29 ~= nil then
        return v29;
    else
        return not v30;
    end;
end;
local _ = function(v32, _, v34, v35) --[[ Line: 224 ]] --[[ Name: areScrollButtonsEnabled ]]
    -- upvalues: v6 (copy)
    if not v34 then
        return false;
    elseif v35 ~= nil then
        return v35;
    else
        return v32 == v6.Input.Pointer;
    end;
end;
return (v2.memo(function(v37) --[[ Line: 243 ]] --[[ Name: CollectionCarousel ]]
    -- upvalues: l_validateProps_0 (copy), v27 (copy), v3 (copy), v28 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v21 (copy), v4 (copy), v2 (copy), l_FFlagCollectionViewMathChanges_0 (copy), l_useLastInput_0 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v6 (copy), v12 (copy), v23 (copy), v13 (copy), v14 (copy), l_useDesignTokens_0 (copy), v17 (copy), v15 (copy), v18 (copy), v16 (copy), l_CompositionTags_0 (copy), v19 (copy)
    l_validateProps_0(v27, v37);
    local v38 = v3.Dictionary.join(v28, v37);
    local l_sideMargin_0 = v38.sideMargin;
    local v40 = nil;
    local v41 = nil;
    local v42 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        local v43 = v21(v37.collectionItemSize);
        v40 = v37.numColumns or v43.itemsPerRow;
        v41 = v37.columnGap or v43.gutter;
        v42 = v43.carouselPeek or 0;
    else
        v40 = v38.numColumns;
        v41 = v38.columnGap;
    end;
    v4.assert(v40 >= 1);
    v4.assert(l_sideMargin_0 >= 0);
    v4.assert(v38.fractionalItemAmount >= 0);
    v4.assert(v41 >= 0);
    local v44 = v2.useRef(nil);
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    if l_FFlagCollectionViewMathChanges_0 then
        local v48, v49 = v2.useBinding(0);
        v45 = v48;
        v46 = v49;
        v47 = v2.useCallback(function(v50) --[[ Line: 271 ]]
            -- upvalues: v46 (ref)
            if v50 then
                v46(v50.AbsoluteSize.X);
            end;
        end, {});
    end;
    local v52 = v2.useCallback(function(v51) --[[ Line: 278 ]]
        -- upvalues: v44 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v46 (ref), v38 (copy)
        v44.current = v51;
        if l_FFlagCollectionViewMathChanges_0 and v51 then
            v46(v51.AbsoluteSize.X);
        end;
        if v38.onScrollingFrameRefCallback then
            v38.onScrollingFrameRefCallback(v51);
        end;
        if v38.scrollingFrameRef then
            v38.scrollingFrameRef.current = v51;
        end;
    end, {
        v38.onScrollingFrameRefCallback, 
        v38.scrollingFrameRef
    });
    local v53 = l_useLastInput_0();
    local v54 = l_usePreferredInput_0();
    local v55 = l_useIsSpatial_0();
    local v56 = v38.hideHeaderButton or v54 == v6.Input.Directional;
    local l_scrollingEnabledOverride_0 = v38.scrollingEnabledOverride;
    local v58 = if l_scrollingEnabledOverride_0 ~= nil then l_scrollingEnabledOverride_0 else not v55;
    l_scrollingEnabledOverride_0 = math.min(v38.maxItemsToShow or #v38.items, #v38.items);
    if not v58 then
        l_scrollingEnabledOverride_0 = math.min(v40, l_scrollingEnabledOverride_0);
    end;
    v4.assert(l_scrollingEnabledOverride_0 >= 0);
    local v59 = if v58 and v40 < l_scrollingEnabledOverride_0 then v38.fractionalItemAmount else 0;
    local v60, v61, v62, v63 = v12(v40, v41, l_sideMargin_0, v59, v38.getItemHeight, v38.onContainerSizeChanged, if l_FFlagLuaAppCompositionSupport_0 then v42 else nil);
    local v64 = nil;
    if l_FFlagCollectionViewMathChanges_0 then
        v64 = v2.useMemo(function() --[[ Line: 330 ]]
            -- upvalues: v2 (ref), v45 (ref), v60 (copy), v23 (ref), v40 (ref), v41 (ref), v42 (ref), v59 (copy)
            return v2.joinBindings({
                v45, 
                v60
            }):map(function(v65) --[[ Line: 331 ]]
                -- upvalues: v23 (ref), v40 (ref), v41 (ref), v42 (ref), v59 (ref)
                return v23(v65[1], v40, v41, v42 or 0, v59, v65[2].X);
            end);
        end, {
            v45, 
            v60, 
            v40, 
            v41, 
            v42, 
            v59
        });
    end;
    local l_shouldShowScrollButtonsOverride_0 = v38.shouldShowScrollButtonsOverride;
    local v67 = not not v58 and if l_shouldShowScrollButtonsOverride_0 ~= nil then l_shouldShowScrollButtonsOverride_0 else v53 == v6.Input.Pointer;
    local v68, v69, v70;
    l_shouldShowScrollButtonsOverride_0, v68, v69, v70 = v13(v44, l_scrollingEnabledOverride_0, v67, v40, if l_FFlagCollectionViewMathChanges_0 then nil else v60, if l_FFlagCollectionViewMathChanges_0 then nil else v41, nil, if l_FFlagCollectionViewMathChanges_0 then v64 else nil);
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v71 = v14(v44, v38.enableHoverOverflow == true);
        v72 = v41 * 0.5 + 1;
        v73 = v2.useMemo(function() --[[ Line: 369 ]]
            -- upvalues: v38 (copy), v2 (ref), v60 (copy), v71 (ref), v72 (ref)
            if not v38.enableHoverOverflow then
                return nil;
            else
                return v2.joinBindings({
                    v60, 
                    v71
                }):map(function(v75) --[[ Line: 373 ]]
                    -- upvalues: v72 (ref)
                    local v76 = v75[1];
                    local v77 = v75[2];
                    return UDim2.new(1, v77 and 0 or -v72 * 2, 0, v76.Y);
                end);
            end;
        end, {
            v60, 
            v71, 
            v72, 
            v38.enableHoverOverflow
        });
        v74 = v2.useMemo(function() --[[ Line: 379 ]]
            -- upvalues: v38 (copy), v71 (ref), v72 (ref)
            if not v38.enableHoverOverflow then
                return nil;
            else
                return v71:map(function(v78) --[[ Line: 383 ]]
                    -- upvalues: v72 (ref)
                    return UDim2.new(0, v78 and 0 or v72, 0, 500);
                end);
            end;
        end, {
            v71, 
            v72, 
            v38.enableHoverOverflow
        });
    end;
    local v79 = l_useDesignTokens_0();
    local l_Size_200_0 = v79.Global.Size_200;
    local l_Size_250_0 = v79.Global.Size_250;
    local l_White_0 = v79.Global.Color.White;
    local v83 = v38.backgroundMuralUrl ~= nil;
    local v84 = v38.title and v38.title ~= "";
    local v85 = v2.createElement(v17, {
        Position = if l_FFlagLuaAppCompositionSupport_0 then v74 else nil, 
        Size = if l_FFlagLuaAppCompositionSupport_0 then v73 else nil, 
        ScrollingEnabled = v58, 
        onChangeCanvasPosition = v38.onChangeCanvasPosition, 
        onScrollingFrameRefCallback = v52, 
        itemSizeBinding = v60, 
        items = v38.items, 
        totalItemsOnCanvas = l_scrollingEnabledOverride_0, 
        numColumns = v40, 
        columnGap = v41, 
        renderItem = v38.renderItem, 
        sideMargin = l_sideMargin_0, 
        numItemsToRenderOffScreen = v38.numItemsToRenderOffScreen, 
        onReachedThresholdFromEnd = v38.onReachedThresholdFromEnd, 
        thresholdFromEnd = v38.thresholdFromEnd, 
        onViewableItemsChanged = v38.onViewableItemsChanged, 
        AutomaticSize = v38.AutomaticSize, 
        spacingMetricsBinding = if l_FFlagCollectionViewMathChanges_0 then v64 else nil, 
        onScrollingFrameAbsoluteSizeChanged = if l_FFlagCollectionViewMathChanges_0 then v47 else nil
    });
    local l_createElement_0 = v2.createElement;
    local v87 = "Frame";
    local v88 = {
        ref = v38.containerRef, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v38.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v38.LayoutOrder, 
        [v2.Tag] = if v38.testId then ("data-testid=%*"):format(v38.testId) else nil
    };
    local v89 = {
        BackgroundMural = v38.backgroundMuralUrl and v2.createElement(v15, {
            backgroundMuralUrl = v38.backgroundMuralUrl, 
            containerSizeBinding = v61, 
            ZIndex = -1
        }) or nil
    };
    local l_createElement_1 = v2.createElement;
    local v91 = "Frame";
    local v92 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v62, 
        ref = v63
    };
    local v93 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = if v38.backgroundMuralUrl ~= nil then UDim.new(0, l_Size_250_0) else nil, 
            PaddingLeft = if not l_FFlagLuaAppCompositionSupport_0 or l_sideMargin_0 > 0 then UDim.new(0, l_sideMargin_0) else nil, 
            PaddingRight = if not l_FFlagLuaAppCompositionSupport_0 or l_sideMargin_0 > 0 then UDim.new(0, l_sideMargin_0) else nil
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if not not v84 or v38.headerComponent then l_Size_200_0 else 0)
        })
    };
    local v94;
    if v38.headerComponent then
        v94 = v38.headerComponent;
    else
        v94 = v18;
        local l_createElement_2 = v2.createElement;
        local l_v16_0 = v16;
        local v97 = {
            LayoutOrder = 1, 
            title = v38.title, 
            subtitle = v38.subtitle, 
            tooltipInfoText = v38.tooltipInfoText, 
            onActivateInfoIcon = v38.onActivateInfoIcon, 
            tooltipSupportsVR = v38.tooltipSupportsVR, 
            tooltipSupportsTenFootUi = v38.tooltipSupportsTenFootUi
        };
        local v98 = true;
        if #v38.items >= 1 then
            v98 = v56 or not v84;
        end;
        v97.hideButton = v98;
        v97.onActivate = v38.onActivateHeader;
        v97.onActivateSubtitle = v38.onActivateSubtitle;
        v97.buttonText = v38.headerButtonText;
        v97.titleColor = if v83 then l_White_0 else nil;
        v97.subtitleColor = if v83 then l_White_0 else nil;
        v94 = v94(l_createElement_2(l_v16_0, v97), v83);
    end;
    v93.CollectionHeader = v94;
    v93.Items = v2.createElement("Frame", {
        Size = if l_FFlagLuaAppCompositionSupport_0 and v38.enableHoverOverflow then v60:map(function(v99) --[[ Line: 477 ]]
            return UDim2.new(1, 0, 0, v99.Y);
        end) else UDim2.new(1, 0, 0, 0), 
        AutomaticSize = if l_FFlagLuaAppCompositionSupport_0 and v38.enableHoverOverflow then nil else Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2, 
        [v2.Tag] = if not (l_FFlagLuaAppCompositionSupport_0 and v38.collectionItemSize) or v38.enableHoverOverflow then nil else l_CompositionTags_0.Utility.ClipAtMaxWidth
    }, {
        CarouselClip = if l_FFlagLuaAppCompositionSupport_0 and v38.enableHoverOverflow then v2.createElement("Frame", {
            Size = v71:map(function(v100) --[[ Line: 495 ]]
                -- upvalues: v72 (ref)
                return UDim2.new(1, v100 and 0 or v72 * 2, 1, 1000);
            end), 
            Position = v71:map(function(v101) --[[ Line: 503 ]]
                -- upvalues: v72 (ref)
                return UDim2.new(0, v101 and 0 or -v72, 0, -500);
            end), 
            BackgroundTransparency = 1, 
            [v2.Tag] = if v38.collectionItemSize then l_CompositionTags_0.Utility.ClipAtMaxWidth else nil
        }, {
            ScrollingItems = v85
        }) else nil, 
        ScrollingItems = if l_FFlagLuaAppCompositionSupport_0 and v38.enableHoverOverflow then nil else v85, 
        ScrollButtons = if v67 then v2.createElement(v19, {
            handleScrollLeft = l_shouldShowScrollButtonsOverride_0, 
            handleScrollRight = v68, 
            leftScrollingEnabled = v69, 
            rightScrollingEnabled = v70, 
            ZIndex = 10, 
            Size = UDim2.new(1, 2 * l_sideMargin_0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            buttonOffsetFromEdge = v79.Global.Size_100, 
            onScrollButtonEnter = v38.onScrollButtonEnter, 
            onScrollButtonLeave = v38.onScrollButtonLeave
        }) else nil
    });
    v89.CollectionContent = l_createElement_1(v91, v92, v93);
    return l_createElement_0(v87, v88, v89);
end));