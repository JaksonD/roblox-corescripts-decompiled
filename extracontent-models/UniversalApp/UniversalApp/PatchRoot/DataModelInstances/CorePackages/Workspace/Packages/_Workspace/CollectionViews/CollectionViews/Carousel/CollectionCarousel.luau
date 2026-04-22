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
local l_FFlagSduiCarouselHoverFixes_0 = v24.FFlagSduiCarouselHoverFixes;
local l_FFlagLuaAppFixCarouselPeekInControl_0 = v24.FFlagLuaAppFixCarouselPeekInControl;
local v30 = v10.strictInterface({
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
local v31 = {
    numColumns = 0, 
    fractionalItemAmount = 0, 
    columnGap = 0, 
    sideMargin = 0
};
local function _(v32, v33) --[[ Line: 217 ]] --[[ Name: isScrollingEnabled ]]
    -- upvalues: l_FFlagLuaAppEnableVRCarouselScrolling_0 (copy)
    if v32 ~= nil then
        return v32;
    elseif l_FFlagLuaAppEnableVRCarouselScrolling_0 then
        return true;
    else
        return not v33;
    end;
end;
local _ = function(v35, _, v37, v38, v39) --[[ Line: 230 ]] --[[ Name: areScrollButtonsEnabled ]]
    -- upvalues: v6 (copy), l_FFlagLuaAppEnableVRCarouselScrolling_0 (copy)
    if not v37 then
        return false;
    elseif v38 ~= nil then
        return v38;
    else
        local v40 = true;
        if v35 ~= v6.Input.Pointer then
            v40 = l_FFlagLuaAppEnableVRCarouselScrolling_0 and v39;
        end;
        return v40;
    end;
end;
return (v2.memo(function(v42) --[[ Line: 250 ]] --[[ Name: CollectionCarousel ]]
    -- upvalues: l_validateProps_0 (copy), v30 (copy), v3 (copy), v31 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v21 (copy), l_FFlagLuaAppFixCarouselPeekInControl_0 (copy), v4 (copy), v2 (copy), l_FFlagCollectionViewMathChanges_0 (copy), l_useLastInput_0 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v6 (copy), l_FFlagLuaAppEnableVRCarouselScrolling_0 (copy), v12 (copy), v23 (copy), v13 (copy), v14 (copy), l_FFlagSduiCarouselHoverFixes_0 (copy), l_useDesignTokens_0 (copy), v17 (copy), v15 (copy), v18 (copy), v16 (copy), l_CompositionTags_0 (copy), v19 (copy)
    l_validateProps_0(v30, v42);
    local v43 = v3.Dictionary.join(v31, v42);
    local l_sideMargin_0 = v43.sideMargin;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        local v48 = v21(v42.collectionItemSize);
        v45 = v42.numColumns or v48.itemsPerRow;
        v46 = v42.columnGap or v48.gutter;
        v47 = if l_FFlagLuaAppFixCarouselPeekInControl_0 then if v42.collectionItemSize then v48.carouselPeek or 0 else nil else v48.carouselPeek or 0;
    else
        v45 = v43.numColumns;
        v46 = v43.columnGap;
    end;
    v4.assert(v45 >= 1);
    v4.assert(l_sideMargin_0 >= 0);
    v4.assert(v43.fractionalItemAmount >= 0);
    v4.assert(v46 >= 0);
    local v49 = v2.useRef(nil);
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    if l_FFlagCollectionViewMathChanges_0 then
        local v53, v54 = v2.useBinding(0);
        v50 = v53;
        v51 = v54;
        v52 = v2.useCallback(function(v55) --[[ Line: 280 ]]
            -- upvalues: v51 (ref)
            if v55 then
                v51(v55.AbsoluteSize.X);
            end;
        end, {});
    end;
    local v57 = v2.useCallback(function(v56) --[[ Line: 287 ]]
        -- upvalues: v49 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v51 (ref), v43 (copy)
        v49.current = v56;
        if l_FFlagCollectionViewMathChanges_0 and v56 then
            v51(v56.AbsoluteSize.X);
        end;
        if v43.onScrollingFrameRefCallback then
            v43.onScrollingFrameRefCallback(v56);
        end;
        if v43.scrollingFrameRef then
            v43.scrollingFrameRef.current = v56;
        end;
    end, {
        v43.onScrollingFrameRefCallback, 
        v43.scrollingFrameRef
    });
    local v58 = l_useLastInput_0();
    local v59 = l_usePreferredInput_0();
    local v60 = l_useIsSpatial_0();
    local v61 = v43.hideHeaderButton or v59 == v6.Input.Directional;
    local l_scrollingEnabledOverride_0 = v43.scrollingEnabledOverride;
    local v63 = if l_scrollingEnabledOverride_0 ~= nil then l_scrollingEnabledOverride_0 else l_FFlagLuaAppEnableVRCarouselScrolling_0 and true or not v60;
    l_scrollingEnabledOverride_0 = math.min(v43.maxItemsToShow or #v43.items, #v43.items);
    if not v63 then
        l_scrollingEnabledOverride_0 = math.min(v45, l_scrollingEnabledOverride_0);
    end;
    v4.assert(l_scrollingEnabledOverride_0 >= 0);
    local v64 = if v63 and v45 < l_scrollingEnabledOverride_0 then v43.fractionalItemAmount else 0;
    local v65, v66, v67, v68 = v12(v45, v46, l_sideMargin_0, v64, v43.getItemHeight, v43.onContainerSizeChanged, if l_FFlagLuaAppCompositionSupport_0 then v47 else nil);
    local v69 = nil;
    if l_FFlagCollectionViewMathChanges_0 then
        v69 = v2.useMemo(function() --[[ Line: 339 ]]
            -- upvalues: v2 (ref), v50 (ref), v65 (copy), v23 (ref), v45 (ref), v46 (ref), v47 (ref), v64 (copy)
            return v2.joinBindings({
                v50, 
                v65
            }):map(function(v70) --[[ Line: 340 ]]
                -- upvalues: v23 (ref), v45 (ref), v46 (ref), v47 (ref), v64 (ref)
                return v23(v70[1], v45, v46, v47 or 0, v64, v70[2].X);
            end);
        end, {
            v50, 
            v65, 
            v45, 
            v46, 
            v47, 
            v64
        });
    end;
    local l_shouldShowScrollButtonsOverride_0 = v43.shouldShowScrollButtonsOverride;
    local v72 = if l_FFlagLuaAppEnableVRCarouselScrolling_0 then v60 else nil;
    local v73 = not not v63 and if l_shouldShowScrollButtonsOverride_0 ~= nil then l_shouldShowScrollButtonsOverride_0 else v58 == v6.Input.Pointer or l_FFlagLuaAppEnableVRCarouselScrolling_0 and v72;
    local v74, v75;
    l_shouldShowScrollButtonsOverride_0, v72, v74, v75 = v13(v49, l_scrollingEnabledOverride_0, v73, v45, if l_FFlagCollectionViewMathChanges_0 then nil else v65, if l_FFlagCollectionViewMathChanges_0 then nil else v46, nil, if l_FFlagCollectionViewMathChanges_0 then v69 else nil);
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    local v79 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v76 = v14(v49, v43.enableHoverOverflow == true);
        v77 = if l_FFlagSduiCarouselHoverFixes_0 then v46 * 0.5 else v46 * 0.5 + 1;
        v78 = v2.useMemo(function() --[[ Line: 383 ]]
            -- upvalues: v43 (copy), v2 (ref), v65 (copy), v76 (ref), v77 (ref)
            if not v43.enableHoverOverflow then
                return nil;
            else
                return v2.joinBindings({
                    v65, 
                    v76
                }):map(function(v80) --[[ Line: 387 ]]
                    -- upvalues: v77 (ref)
                    local v81 = v80[1];
                    local v82 = v80[2];
                    return UDim2.new(1, v82 and 0 or -v77 * 2, 0, v81.Y);
                end);
            end;
        end, {
            v65, 
            v76, 
            v77, 
            v43.enableHoverOverflow
        });
        v79 = v2.useMemo(function() --[[ Line: 393 ]]
            -- upvalues: v43 (copy), v76 (ref), v77 (ref)
            if not v43.enableHoverOverflow then
                return nil;
            else
                return v76:map(function(v83) --[[ Line: 397 ]]
                    -- upvalues: v77 (ref)
                    return UDim2.new(0, v83 and 0 or v77, 0, 500);
                end);
            end;
        end, {
            v76, 
            v77, 
            v43.enableHoverOverflow
        });
    end;
    local v84 = l_useDesignTokens_0();
    local l_Size_200_0 = v84.Global.Size_200;
    local l_Size_250_0 = v84.Global.Size_250;
    local l_White_0 = v84.Global.Color.White;
    local v88 = v43.backgroundMuralUrl ~= nil;
    local v89 = v43.title and v43.title ~= "";
    local v90 = v2.createElement(v17, {
        Position = if l_FFlagLuaAppCompositionSupport_0 then v79 else nil, 
        Size = if l_FFlagLuaAppCompositionSupport_0 then v78 else nil, 
        ScrollingEnabled = v63, 
        onChangeCanvasPosition = v43.onChangeCanvasPosition, 
        onScrollingFrameRefCallback = v57, 
        itemSizeBinding = v65, 
        items = v43.items, 
        totalItemsOnCanvas = l_scrollingEnabledOverride_0, 
        numColumns = v45, 
        columnGap = v46, 
        renderItem = v43.renderItem, 
        sideMargin = l_sideMargin_0, 
        numItemsToRenderOffScreen = v43.numItemsToRenderOffScreen, 
        onReachedThresholdFromEnd = v43.onReachedThresholdFromEnd, 
        thresholdFromEnd = v43.thresholdFromEnd, 
        onViewableItemsChanged = v43.onViewableItemsChanged, 
        AutomaticSize = v43.AutomaticSize, 
        spacingMetricsBinding = if l_FFlagCollectionViewMathChanges_0 then v69 else nil, 
        onScrollingFrameAbsoluteSizeChanged = if l_FFlagCollectionViewMathChanges_0 then v52 else nil
    });
    local l_createElement_0 = v2.createElement;
    local v92 = "Frame";
    local v93 = {
        ref = v43.containerRef, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v43.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v43.LayoutOrder, 
        [v2.Tag] = if v43.testId then ("data-testid=%*"):format(v43.testId) else nil
    };
    local v94 = {
        BackgroundMural = v43.backgroundMuralUrl and v2.createElement(v15, {
            backgroundMuralUrl = v43.backgroundMuralUrl, 
            containerSizeBinding = v66, 
            ZIndex = -1
        }) or nil
    };
    local l_createElement_1 = v2.createElement;
    local v96 = "Frame";
    local v97 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v67, 
        ref = v68
    };
    local v98 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = if v43.backgroundMuralUrl ~= nil then UDim.new(0, l_Size_250_0) else nil, 
            PaddingLeft = if not l_FFlagLuaAppCompositionSupport_0 or l_sideMargin_0 > 0 then UDim.new(0, l_sideMargin_0) else nil, 
            PaddingRight = if not l_FFlagLuaAppCompositionSupport_0 or l_sideMargin_0 > 0 then UDim.new(0, l_sideMargin_0) else nil
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if not not v89 or v43.headerComponent then l_Size_200_0 else 0)
        })
    };
    local v99;
    if v43.headerComponent then
        v99 = v43.headerComponent;
    else
        v99 = v18;
        local l_createElement_2 = v2.createElement;
        local l_v16_0 = v16;
        local v102 = {
            LayoutOrder = 1, 
            title = v43.title, 
            subtitle = v43.subtitle, 
            tooltipInfoText = v43.tooltipInfoText, 
            onActivateInfoIcon = v43.onActivateInfoIcon, 
            tooltipSupportsVR = v43.tooltipSupportsVR, 
            tooltipSupportsTenFootUi = v43.tooltipSupportsTenFootUi
        };
        local v103 = true;
        if #v43.items >= 1 then
            v103 = v61 or not v89;
        end;
        v102.hideButton = v103;
        v102.onActivate = v43.onActivateHeader;
        v102.onActivateSubtitle = v43.onActivateSubtitle;
        v102.buttonText = v43.headerButtonText;
        v102.titleColor = if v88 then l_White_0 else nil;
        v102.subtitleColor = if v88 then l_White_0 else nil;
        v99 = v99(l_createElement_2(l_v16_0, v102), v88);
    end;
    v98.CollectionHeader = v99;
    v98.Items = v2.createElement("Frame", {
        Size = if l_FFlagLuaAppCompositionSupport_0 and v43.enableHoverOverflow then v65:map(function(v104) --[[ Line: 491 ]]
            return UDim2.new(1, 0, 0, v104.Y);
        end) else UDim2.new(1, 0, 0, 0), 
        AutomaticSize = if l_FFlagLuaAppCompositionSupport_0 and v43.enableHoverOverflow then nil else Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2, 
        [v2.Tag] = if not (l_FFlagLuaAppCompositionSupport_0 and v43.collectionItemSize) or v43.enableHoverOverflow then nil else l_CompositionTags_0.Utility.ClipAtMaxWidth
    }, {
        CarouselClip = if l_FFlagLuaAppCompositionSupport_0 and v43.enableHoverOverflow then v2.createElement("Frame", {
            Size = v76:map(function(v105) --[[ Line: 509 ]]
                -- upvalues: v77 (ref)
                return UDim2.new(1, v105 and 0 or v77 * 2, 1, 1000);
            end), 
            Position = v76:map(function(v106) --[[ Line: 517 ]]
                -- upvalues: v77 (ref)
                return UDim2.new(0, v106 and 0 or -v77, 0, -500);
            end), 
            BackgroundTransparency = 1, 
            [v2.Tag] = if v43.collectionItemSize then l_CompositionTags_0.Utility.ClipAtMaxWidth else nil
        }, {
            ScrollingItems = v90
        }) else nil, 
        ScrollingItems = if l_FFlagLuaAppCompositionSupport_0 and v43.enableHoverOverflow then nil else v90, 
        ScrollButtons = if v73 then v2.createElement(v19, {
            handleScrollLeft = l_shouldShowScrollButtonsOverride_0, 
            handleScrollRight = v72, 
            leftScrollingEnabled = v74, 
            rightScrollingEnabled = v75, 
            ZIndex = 10, 
            Size = UDim2.new(1, 2 * l_sideMargin_0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            buttonOffsetFromEdge = v84.Global.Size_100, 
            onScrollButtonEnter = v43.onScrollButtonEnter, 
            onScrollButtonLeave = v43.onScrollButtonLeave
        }) else nil
    });
    v94.CollectionContent = l_createElement_1(v96, v97, v98);
    return l_createElement_0(v92, v93, v94);
end));