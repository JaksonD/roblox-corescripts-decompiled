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
local l_FFlagLuaAppEnableVRCarouselScrolling_0 = v24.FFlagLuaAppEnableVRCarouselScrolling;
local v28 = v10.strictInterface({
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
local v29 = {
    numColumns = 0, 
    fractionalItemAmount = 0, 
    columnGap = 0, 
    sideMargin = 0
};
local function _(v30, v31) --[[ Line: 215 ]] --[[ Name: isScrollingEnabled ]]
    -- upvalues: l_FFlagLuaAppEnableVRCarouselScrolling_0 (copy)
    if v30 ~= nil then
        return v30;
    elseif l_FFlagLuaAppEnableVRCarouselScrolling_0 then
        return true;
    else
        return not v31;
    end;
end;
local _ = function(v33, _, v35, v36, v37) --[[ Line: 228 ]] --[[ Name: areScrollButtonsEnabled ]]
    -- upvalues: v6 (copy), l_FFlagLuaAppEnableVRCarouselScrolling_0 (copy)
    if not v35 then
        return false;
    elseif v36 ~= nil then
        return v36;
    else
        local v38 = true;
        if v33 ~= v6.Input.Pointer then
            v38 = l_FFlagLuaAppEnableVRCarouselScrolling_0 and v37;
        end;
        return v38;
    end;
end;
return (v2.memo(function(v40) --[[ Line: 248 ]] --[[ Name: CollectionCarousel ]]
    -- upvalues: l_validateProps_0 (copy), v28 (copy), v3 (copy), v29 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v21 (copy), v4 (copy), v2 (copy), l_FFlagCollectionViewMathChanges_0 (copy), l_useLastInput_0 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v6 (copy), l_FFlagLuaAppEnableVRCarouselScrolling_0 (copy), v12 (copy), v23 (copy), v13 (copy), v14 (copy), l_useDesignTokens_0 (copy), v17 (copy), v15 (copy), v18 (copy), v16 (copy), l_CompositionTags_0 (copy), v19 (copy)
    l_validateProps_0(v28, v40);
    local v41 = v3.Dictionary.join(v29, v40);
    local l_sideMargin_0 = v41.sideMargin;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        local v46 = v21(v40.collectionItemSize);
        v43 = v40.numColumns or v46.itemsPerRow;
        v44 = v40.columnGap or v46.gutter;
        v45 = v46.carouselPeek or 0;
    else
        v43 = v41.numColumns;
        v44 = v41.columnGap;
    end;
    v4.assert(v43 >= 1);
    v4.assert(l_sideMargin_0 >= 0);
    v4.assert(v41.fractionalItemAmount >= 0);
    v4.assert(v44 >= 0);
    local v47 = v2.useRef(nil);
    local v48 = nil;
    local v49 = nil;
    local v50 = nil;
    if l_FFlagCollectionViewMathChanges_0 then
        local v51, v52 = v2.useBinding(0);
        v48 = v51;
        v49 = v52;
        v50 = v2.useCallback(function(v53) --[[ Line: 276 ]]
            -- upvalues: v49 (ref)
            if v53 then
                v49(v53.AbsoluteSize.X);
            end;
        end, {});
    end;
    local v55 = v2.useCallback(function(v54) --[[ Line: 283 ]]
        -- upvalues: v47 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v49 (ref), v41 (copy)
        v47.current = v54;
        if l_FFlagCollectionViewMathChanges_0 and v54 then
            v49(v54.AbsoluteSize.X);
        end;
        if v41.onScrollingFrameRefCallback then
            v41.onScrollingFrameRefCallback(v54);
        end;
        if v41.scrollingFrameRef then
            v41.scrollingFrameRef.current = v54;
        end;
    end, {
        v41.onScrollingFrameRefCallback, 
        v41.scrollingFrameRef
    });
    local v56 = l_useLastInput_0();
    local v57 = l_usePreferredInput_0();
    local v58 = l_useIsSpatial_0();
    local v59 = v41.hideHeaderButton or v57 == v6.Input.Directional;
    local l_scrollingEnabledOverride_0 = v41.scrollingEnabledOverride;
    local v61 = if l_scrollingEnabledOverride_0 ~= nil then l_scrollingEnabledOverride_0 else l_FFlagLuaAppEnableVRCarouselScrolling_0 and true or not v58;
    l_scrollingEnabledOverride_0 = math.min(v41.maxItemsToShow or #v41.items, #v41.items);
    if not v61 then
        l_scrollingEnabledOverride_0 = math.min(v43, l_scrollingEnabledOverride_0);
    end;
    v4.assert(l_scrollingEnabledOverride_0 >= 0);
    local v62 = if v61 and v43 < l_scrollingEnabledOverride_0 then v41.fractionalItemAmount else 0;
    local v63, v64, v65, v66 = v12(v43, v44, l_sideMargin_0, v62, v41.getItemHeight, v41.onContainerSizeChanged, if l_FFlagLuaAppCompositionSupport_0 then v45 else nil);
    local v67 = nil;
    if l_FFlagCollectionViewMathChanges_0 then
        v67 = v2.useMemo(function() --[[ Line: 335 ]]
            -- upvalues: v2 (ref), v48 (ref), v63 (copy), v23 (ref), v43 (ref), v44 (ref), v45 (ref), v62 (copy)
            return v2.joinBindings({
                v48, 
                v63
            }):map(function(v68) --[[ Line: 336 ]]
                -- upvalues: v23 (ref), v43 (ref), v44 (ref), v45 (ref), v62 (ref)
                return v23(v68[1], v43, v44, v45 or 0, v62, v68[2].X);
            end);
        end, {
            v48, 
            v63, 
            v43, 
            v44, 
            v45, 
            v62
        });
    end;
    local l_shouldShowScrollButtonsOverride_0 = v41.shouldShowScrollButtonsOverride;
    local v70 = if l_FFlagLuaAppEnableVRCarouselScrolling_0 then v58 else nil;
    local v71 = not not v61 and if l_shouldShowScrollButtonsOverride_0 ~= nil then l_shouldShowScrollButtonsOverride_0 else v56 == v6.Input.Pointer or l_FFlagLuaAppEnableVRCarouselScrolling_0 and v70;
    local v72, v73;
    l_shouldShowScrollButtonsOverride_0, v70, v72, v73 = v13(v47, l_scrollingEnabledOverride_0, v71, v43, if l_FFlagCollectionViewMathChanges_0 then nil else v63, if l_FFlagCollectionViewMathChanges_0 then nil else v44, nil, if l_FFlagCollectionViewMathChanges_0 then v67 else nil);
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    local v77 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v74 = v14(v47, v41.enableHoverOverflow == true);
        v75 = v44 * 0.5 + 1;
        v76 = v2.useMemo(function() --[[ Line: 379 ]]
            -- upvalues: v41 (copy), v2 (ref), v63 (copy), v74 (ref), v75 (ref)
            if not v41.enableHoverOverflow then
                return nil;
            else
                return v2.joinBindings({
                    v63, 
                    v74
                }):map(function(v78) --[[ Line: 383 ]]
                    -- upvalues: v75 (ref)
                    local v79 = v78[1];
                    local v80 = v78[2];
                    return UDim2.new(1, v80 and 0 or -v75 * 2, 0, v79.Y);
                end);
            end;
        end, {
            v63, 
            v74, 
            v75, 
            v41.enableHoverOverflow
        });
        v77 = v2.useMemo(function() --[[ Line: 389 ]]
            -- upvalues: v41 (copy), v74 (ref), v75 (ref)
            if not v41.enableHoverOverflow then
                return nil;
            else
                return v74:map(function(v81) --[[ Line: 393 ]]
                    -- upvalues: v75 (ref)
                    return UDim2.new(0, v81 and 0 or v75, 0, 500);
                end);
            end;
        end, {
            v74, 
            v75, 
            v41.enableHoverOverflow
        });
    end;
    local v82 = l_useDesignTokens_0();
    local l_Size_200_0 = v82.Global.Size_200;
    local l_Size_250_0 = v82.Global.Size_250;
    local l_White_0 = v82.Global.Color.White;
    local v86 = v41.backgroundMuralUrl ~= nil;
    local v87 = v41.title and v41.title ~= "";
    local v88 = v2.createElement(v17, {
        Position = if l_FFlagLuaAppCompositionSupport_0 then v77 else nil, 
        Size = if l_FFlagLuaAppCompositionSupport_0 then v76 else nil, 
        ScrollingEnabled = v61, 
        onChangeCanvasPosition = v41.onChangeCanvasPosition, 
        onScrollingFrameRefCallback = v55, 
        itemSizeBinding = v63, 
        items = v41.items, 
        totalItemsOnCanvas = l_scrollingEnabledOverride_0, 
        numColumns = v43, 
        columnGap = v44, 
        renderItem = v41.renderItem, 
        sideMargin = l_sideMargin_0, 
        numItemsToRenderOffScreen = v41.numItemsToRenderOffScreen, 
        onReachedThresholdFromEnd = v41.onReachedThresholdFromEnd, 
        thresholdFromEnd = v41.thresholdFromEnd, 
        onViewableItemsChanged = v41.onViewableItemsChanged, 
        AutomaticSize = v41.AutomaticSize, 
        spacingMetricsBinding = if l_FFlagCollectionViewMathChanges_0 then v67 else nil, 
        onScrollingFrameAbsoluteSizeChanged = if l_FFlagCollectionViewMathChanges_0 then v50 else nil
    });
    local l_createElement_0 = v2.createElement;
    local v90 = "Frame";
    local v91 = {
        ref = v41.containerRef, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v41.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v41.LayoutOrder, 
        [v2.Tag] = if v41.testId then ("data-testid=%*"):format(v41.testId) else nil
    };
    local v92 = {
        BackgroundMural = v41.backgroundMuralUrl and v2.createElement(v15, {
            backgroundMuralUrl = v41.backgroundMuralUrl, 
            containerSizeBinding = v64, 
            ZIndex = -1
        }) or nil
    };
    local l_createElement_1 = v2.createElement;
    local v94 = "Frame";
    local v95 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v65, 
        ref = v66
    };
    local v96 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = if v41.backgroundMuralUrl ~= nil then UDim.new(0, l_Size_250_0) else nil, 
            PaddingLeft = if not l_FFlagLuaAppCompositionSupport_0 or l_sideMargin_0 > 0 then UDim.new(0, l_sideMargin_0) else nil, 
            PaddingRight = if not l_FFlagLuaAppCompositionSupport_0 or l_sideMargin_0 > 0 then UDim.new(0, l_sideMargin_0) else nil
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if not not v87 or v41.headerComponent then l_Size_200_0 else 0)
        })
    };
    local v97;
    if v41.headerComponent then
        v97 = v41.headerComponent;
    else
        v97 = v18;
        local l_createElement_2 = v2.createElement;
        local l_v16_0 = v16;
        local v100 = {
            LayoutOrder = 1, 
            title = v41.title, 
            subtitle = v41.subtitle, 
            tooltipInfoText = v41.tooltipInfoText, 
            onActivateInfoIcon = v41.onActivateInfoIcon, 
            tooltipSupportsVR = v41.tooltipSupportsVR, 
            tooltipSupportsTenFootUi = v41.tooltipSupportsTenFootUi
        };
        local v101 = true;
        if #v41.items >= 1 then
            v101 = v59 or not v87;
        end;
        v100.hideButton = v101;
        v100.onActivate = v41.onActivateHeader;
        v100.onActivateSubtitle = v41.onActivateSubtitle;
        v100.buttonText = v41.headerButtonText;
        v100.titleColor = if v86 then l_White_0 else nil;
        v100.subtitleColor = if v86 then l_White_0 else nil;
        v97 = v97(l_createElement_2(l_v16_0, v100), v86);
    end;
    v96.CollectionHeader = v97;
    v96.Items = v2.createElement("Frame", {
        Size = if l_FFlagLuaAppCompositionSupport_0 and v41.enableHoverOverflow then v63:map(function(v102) --[[ Line: 487 ]]
            return UDim2.new(1, 0, 0, v102.Y);
        end) else UDim2.new(1, 0, 0, 0), 
        AutomaticSize = if l_FFlagLuaAppCompositionSupport_0 and v41.enableHoverOverflow then nil else Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2, 
        [v2.Tag] = if not (l_FFlagLuaAppCompositionSupport_0 and v41.collectionItemSize) or v41.enableHoverOverflow then nil else l_CompositionTags_0.Utility.ClipAtMaxWidth
    }, {
        CarouselClip = if l_FFlagLuaAppCompositionSupport_0 and v41.enableHoverOverflow then v2.createElement("Frame", {
            Size = v74:map(function(v103) --[[ Line: 505 ]]
                -- upvalues: v75 (ref)
                return UDim2.new(1, v103 and 0 or v75 * 2, 1, 1000);
            end), 
            Position = v74:map(function(v104) --[[ Line: 513 ]]
                -- upvalues: v75 (ref)
                return UDim2.new(0, v104 and 0 or -v75, 0, -500);
            end), 
            BackgroundTransparency = 1, 
            [v2.Tag] = if v41.collectionItemSize then l_CompositionTags_0.Utility.ClipAtMaxWidth else nil
        }, {
            ScrollingItems = v88
        }) else nil, 
        ScrollingItems = if l_FFlagLuaAppCompositionSupport_0 and v41.enableHoverOverflow then nil else v88, 
        ScrollButtons = if v71 then v2.createElement(v19, {
            handleScrollLeft = l_shouldShowScrollButtonsOverride_0, 
            handleScrollRight = v70, 
            leftScrollingEnabled = v72, 
            rightScrollingEnabled = v73, 
            ZIndex = 10, 
            Size = UDim2.new(1, 2 * l_sideMargin_0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            buttonOffsetFromEdge = v82.Global.Size_100, 
            onScrollButtonEnter = v41.onScrollButtonEnter, 
            onScrollButtonLeave = v41.onScrollButtonLeave
        }) else nil
    });
    v92.CollectionContent = l_createElement_1(v94, v95, v96);
    return l_createElement_0(v90, v91, v92);
end));