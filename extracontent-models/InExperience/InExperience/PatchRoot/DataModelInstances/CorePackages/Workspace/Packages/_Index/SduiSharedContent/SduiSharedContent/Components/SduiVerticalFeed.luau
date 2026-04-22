local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedContent");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useAnimateScrollViewToSelection_0 = require(l_Parent_0.AppBlox).useAnimateScrollViewToSelection;
local v7 = require(l_Parent_0.AppNavBar);
local l_useNavBarPlacement_0 = v7.useNavBarPlacement;
local l_useLastInputMode_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local v10 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v10.usePreferredInput;
local v12 = require(l_Parent_0.AppCommonLib);
local v13 = require(l_Parent_0.SignalsReact);
local _ = require(l_Parent_0.SduiCompat);
local v15 = require(l_Parent_0.SduiCoreSystem);
local l_findAnalyticsField_0 = v15.findAnalyticsField;
local l_getSduiComponentWrapper_0 = v15.getSduiComponentWrapper;
local l_SduiBuilder_0 = v15.SduiBuilder;
local l_SduiErrors_0 = v15.SduiErrors;
local v20 = require(l_Parent_0.CollectionViews);
local l_CollectionItemSize_0 = v20.CollectionViewTypes.CollectionItemSize;
local l_CollectionLayoutStoreProvider_0 = v20.CollectionLayoutStoreProvider;
local v23 = require(l_script_FirstAncestor_0.Components.SduiStickyHeader);
local v24 = require(l_script_FirstAncestor_0.Components.PullToRefreshSpinner);
local v25 = require(l_script_FirstAncestor_0.Components.useVerticalScrolledToEndThreshold);
local v26 = require(l_script_FirstAncestor_0.Components.buildSduiFeedChildren);
local v27 = require(l_Parent_0.SharedFlags);
local l_FFlagSduiServerCompat_0 = v27.FFlagSduiServerCompat;
local l_FFlagSduiVerticalFeedLayoutOrder_0 = v27.FFlagSduiVerticalFeedLayoutOrder;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = v27.FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = v27.FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiFeedOptionalScrollingFrameFix_0 = v27.FFlagSduiFeedOptionalScrollingFrameFix;
local l_FFlagLuaAppCompositionSduiEnabled_0 = v27.FFlagLuaAppCompositionSduiEnabled;
local l_FFlagSduiChartsSupport_0 = v27.FFlagSduiChartsSupport;
local v35 = {};
return v2.memo(function(v36) --[[ Line: 98 ]] --[[ Name: SduiVerticalFeed ]]
    -- upvalues: l_FFlagLuaAppCompositionSduiEnabled_0 (copy), l_useTokens_0 (copy), l_FFlagSduiChartsSupport_0 (copy), l_useNavBarPlacement_0 (copy), v7 (copy), l_usePreferredInput_0 (copy), v10 (copy), v2 (copy), v12 (copy), v13 (copy), l_CollectionItemSize_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (copy), l_useAnimateScrollViewToSelection_0 (copy), l_useLastInputMode_0 (copy), v25 (copy), v26 (copy), l_findAnalyticsField_0 (copy), v35 (copy), l_SduiBuilder_0 (copy), l_SduiErrors_0 (copy), l_getSduiComponentWrapper_0 (copy), l_FFlagSduiVerticalFeedLayoutOrder_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_CollectionLayoutStoreProvider_0 (copy), l_View_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v23 (copy), v24 (copy)
    local l_analyticsContext_0 = v36.analyticsContext;
    local l_sduiContext_0 = v36.sduiContext;
    local l_feedItems_0 = v36.feedItems;
    local l_debugName_0 = v36.debugName;
    local v41 = l_FFlagLuaAppCompositionSduiEnabled_0 and (v36.contentTag or v36.defaultContentTag);
    local v42 = l_FFlagLuaAppCompositionSduiEnabled_0 and v41 ~= nil and v41 ~= "";
    local v43 = l_useTokens_0();
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    if l_FFlagSduiChartsSupport_0 then
        v44 = v36.stickyItems ~= nil;
        v45 = v36.onRefresh ~= nil;
        v50 = v36.stickyContentTag or v36.defaultStickyContentTag;
        v46 = v36.stickyBackgroundStyle or v43.Color.Surface.Surface_0;
        v47 = v36.stickyPaddingTop;
        v48 = v36.stickyPaddingBottom;
        v49 = v36.gapBetweenStickyItems or v43.Gap.Medium;
        v51 = v36.gapAfterStickyItems or v43.Gap.Medium;
        local v56 = l_useNavBarPlacement_0();
        v53 = v36.impressionsTag or l_sduiContext_0.appPage;
        v54 = v36.selectionBehaviorLeft or if v56 == v7.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop;
        v55 = v36.selectionBehaviorRight or Enum.SelectionBehavior.Stop;
        local v57 = l_usePreferredInput_0();
        v52 = v36.scrollBarThickness or v57 == v10.Input.Pointer and 4 or 0;
    else
        v52 = 0;
    end;
    local v58 = nil;
    local v59 = nil;
    if l_FFlagLuaAppCompositionSduiEnabled_0 then
        local v60, v61 = v2.useState(nil);
        v58 = v60;
        v59 = v61;
    end;
    local v62 = v2.useRef(nil);
    local v63 = v2.useRef(nil);
    if v63.current == nil then
        v63.current = v12.Signal.new();
    end;
    local v64 = v2.useCallback(function() --[[ Line: 156 ]]
        -- upvalues: v63 (copy)
        v63.current:fire();
    end, {});
    local v65 = nil;
    local v66 = nil;
    if not l_FFlagLuaAppCompositionSduiEnabled_0 then
        local v67 = v13.useSignalState(l_sduiContext_0.getPageLayoutConfig(l_CollectionItemSize_0.Small));
        v65 = v67.sideMargin;
        v66 = v36.gapBetweenFeedItems or v67.verticalPadding;
    else
        v66 = v36.gapBetweenFeedItems or v43.Gap.Large;
    end;
    local v68 = nil;
    if l_FFlagSduiChartsSupport_0 then
        v68 = v2.useMemo(function() --[[ Line: 172 ]]
            -- upvalues: v63 (copy), v62 (copy)
            return {
                scrollViewPositionChangedSignal = v63.current, 
                verticalScrollingFrameRef = v62, 
                startRow = 1
            };
        end, {
            v63, 
            v62
        });
    end;
    local v69 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v36.scrollingFrameRef or v62 else v62;
    if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then
        v2.useEffect(function() --[[ Line: 193 ]]
            -- upvalues: v36 (copy), v64 (copy)
            if not v36.scrollingFrameRef or not v36.scrollingFrameRef.current then
                return nil;
            else
                local l_current_0 = v36.scrollingFrameRef.current;
                local v71 = {
                    l_current_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v64), 
                    l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v64)
                };
                return function() --[[ Line: 204 ]]
                    -- upvalues: v71 (copy)
                    for _, v73 in v71 do
                        v73:Disconnect();
                    end;
                end;
            end;
        end, {
            v36.scrollingFrameRef, 
            v64
        });
    end;
    l_useAnimateScrollViewToSelection_0(v69, 0.4);
    local v74 = l_useLastInputMode_0() ~= "Cursor";
    local v75 = v36.thresholdFromEnd or 600;
    v25(v69, v75, v36.onScrollToEnd);
    local v87 = v2.useMemo(function() --[[ Line: 222 ]]
        -- upvalues: l_feedItems_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (ref), v36 (copy), l_FFlagLuaAppCompositionSduiEnabled_0 (ref), v2 (ref), v66 (ref), l_FFlagSduiChartsSupport_0 (ref), v44 (ref), v51 (ref), v26 (ref), l_sduiContext_0 (copy), l_debugName_0 (copy), v53 (ref), v54 (ref), v55 (ref), v68 (ref), l_findAnalyticsField_0 (ref), v35 (ref), l_SduiBuilder_0 (ref), l_SduiErrors_0 (ref), l_getSduiComponentWrapper_0 (ref), l_FFlagSduiVerticalFeedLayoutOrder_0 (ref), v63 (copy), v62 (copy), v65 (ref), l_FFlagSduiServerCompat_0 (ref), l_analyticsContext_0 (copy)
        if l_feedItems_0 == nil then
            return nil;
        else
            local v76 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v36.pageBottomPadding or 80 else 80;
            local v77 = {
                UIPadding = if not l_FFlagLuaAppCompositionSduiEnabled_0 then v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, v76)
                }) else nil, 
                BottomSpacer = if l_FFlagLuaAppCompositionSduiEnabled_0 then v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v76), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1e999
                }) else nil, 
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v66)
                }), 
                StickyGap = if l_FFlagSduiChartsSupport_0 and v44 and v51 and v51 > 0 then v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, (math.max(0, v51 - v66))), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0
                }) else nil
            };
            if l_FFlagSduiChartsSupport_0 then
                for v78, v79 in (v26({
                    configs = l_feedItems_0, 
                    sduiContext = l_sduiContext_0, 
                    debugName = l_debugName_0, 
                    componentType = "VerticalFeed", 
                    impressionsTag = v53, 
                    selectionBehaviorLeft = v54, 
                    selectionBehaviorRight = v55, 
                    extraLocalProps = v68
                })) do
                    v77[v78] = v79;
                end;
                return v77;
            else
                for v80, v81 in l_feedItems_0 do
                    local v82 = l_findAnalyticsField_0("componentType", v81.analyticsData or v35) or l_SduiBuilder_0.getComponentType(v81, l_sduiContext_0);
                    if not v82 then
                        l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                            componentType = "VerticalFeed", 
                            name = l_debugName_0, 
                            message = ("Nil componentType in VerticalFeed at feedItem index %*"):format(v80)
                        }, l_sduiContext_0.appPage);
                    else
                        local v83 = {
                            feedItemPosition = v80, 
                            itemComponentType = v82, 
                            componentType = v82
                        };
                        local v84 = ("feedItem%*"):format(v80);
                        local v85 = l_getSduiComponentWrapper_0(v81);
                        local v86 = nil;
                        if l_FFlagSduiVerticalFeedLayoutOrder_0 then
                            v86 = if v81.props and v81.props.layoutOrder ~= nil then v81.props.layoutOrder else v80;
                        end;
                        v77[v84] = v2.createElement(v85, {
                            debugName = v84, 
                            componentConfig = v81, 
                            sduiContext = l_sduiContext_0, 
                            localAnalyticsData = v83, 
                            extraLocalProps = {
                                scrollViewPositionChangedSignal = v63.current, 
                                verticalScrollingFrameRef = v62, 
                                pageSideMargin = if l_FFlagLuaAppCompositionSduiEnabled_0 then nil else v65, 
                                startRow = 1, 
                                LayoutOrder = if not l_FFlagSduiServerCompat_0 then v86 else nil, 
                                layoutOrder = if l_FFlagSduiServerCompat_0 then v86 else nil
                            }, 
                            parentAnalyticsContext = if v81.__isClientBinding then nil else l_analyticsContext_0
                        });
                    end;
                end;
                return v77;
            end;
        end;
    end, {
        l_feedItems_0, 
        l_debugName_0, 
        v62, 
        v63, 
        l_sduiContext_0, 
        v65, 
        l_analyticsContext_0, 
        v66, 
        if l_FFlagSduiChartsSupport_0 then v53 else nil, 
        if l_FFlagSduiChartsSupport_0 then v54 else nil, 
        if l_FFlagSduiChartsSupport_0 then v55 else nil, 
        if l_FFlagSduiChartsSupport_0 then v44 else nil, 
        if l_FFlagSduiChartsSupport_0 then v51 else nil, 
        if l_FFlagSduiChartsSupport_0 then v68 else nil, 
        if l_FFlagLuaAppCompositionSduiEnabled_0 then v42 else nil, 
        if l_FFlagLuaAppCompositionSduiEnabled_0 then v36.pageBottomPadding else nil
    });
    if l_FFlagLuaAppCompositionSduiEnabled_0 then
        v87 = v2.createElement(l_CollectionLayoutStoreProvider_0, {
            container = v58
        }, v87);
        local v88 = {
            ["size-full-0 auto-y"] = true
        };
        if v42 then
            v88[v41] = true;
        end;
        v87 = v2.createElement(l_View_0, {
            tag = v88, 
            LayoutOrder = v36.layoutOrder, 
            ref = v59
        }, v87);
        if v36.scrollingFrameRef ~= nil then
            return v87;
        end;
    elseif l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v36.scrollingFrameRef ~= nil then
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = v36.layoutOrder
        }, v87);
    end;
    local v89 = v2.createElement("ScrollingFrame", {
        LayoutOrder = l_FFlagSduiChartsSupport_0 and 3 or v36.layoutOrder, 
        ref = v62, 
        [v2.Change.CanvasPosition] = v64, 
        [v2.Change.CanvasSize] = v64, 
        BackgroundColor3 = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v36.backgroundStyle then v36.backgroundStyle.Color3 else v43.Color.Surface.Surface_0.Color3, 
        BackgroundTransparency = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v36.backgroundStyle then v36.backgroundStyle.Transparency else nil, 
        Size = if l_FFlagSduiChartsSupport_0 then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 1, 0), 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        ScrollBarThickness = v52, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        Selectable = false, 
        ScrollingEnabled = not v74, 
        ClipsDescendants = not l_FFlagSduiCoreBadgeDetailsSupport_0 and nil
    }, if l_FFlagSduiChartsSupport_0 then {
        FlexFill = v2.createElement("UIFlexItem", {
            FlexMode = Enum.UIFlexMode.Fill
        }), 
        Content = v87
    } else v87);
    if l_FFlagSduiChartsSupport_0 then
        return v2.createElement(l_View_0, {
            tag = "size-full", 
            LayoutOrder = v36.layoutOrder, 
            layout = {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }, {
            Sticky = if v44 then v2.createElement(v23, {
                stickyItems = v36.stickyItems, 
                sduiContext = l_sduiContext_0, 
                debugName = ("%*.StickyHeader"):format(l_debugName_0), 
                contentTag = v50, 
                backgroundStyle = v46, 
                paddingTop = v47, 
                paddingBottom = v48, 
                gapBetweenItems = v49, 
                zIndex = 2, 
                extraLocalProps = v68, 
                impressionsTag = v53, 
                selectionBehaviorLeft = v54, 
                selectionBehaviorRight = v55
            }) else nil, 
            RefreshSpinner = if v45 then v2.createElement(v24, {
                LayoutOrder = 2, 
                onRefresh = v36.onRefresh, 
                scrollingFrameRef = v62, 
                appEventName = l_sduiContext_0.appPage
            }) else nil, 
            Scroll = v89
        });
    else
        return v89;
    end;
end);