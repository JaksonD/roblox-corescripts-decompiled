local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.AppCommonLib);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v6.CollectionCarousel;
local l_CollectionItemSize_0 = v6.CollectionViewTypes.CollectionItemSize;
local l_useCollectionImpressionsSignal_0 = v6.useCollectionImpressionsSignal;
local l_useCollectionLayoutParams_0 = v6.useCollectionLayoutParams;
local l_WaitForPropWrapper_0 = require(l_Parent_0.GameCollections).WaitForPropWrapper;
local v12 = require(l_Parent_0.Impressions);
local l_FrameBoundsImpressionsTracker_0 = v12.FrameBoundsImpressionsTracker;
local l_ScreenSizeImpressionsTracker_0 = v12.ScreenSizeImpressionsTracker;
local l_HoverTileCoordinator_0 = require(l_Parent_0.GameTile).HoverTileCoordinator;
local l_ScrollDetector_0 = require(l_Parent_0.ScrollTelemetry).ScrollDetector;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v18 = require(l_Parent_0.SduiCoreSystem);
local l_findAnalyticsField_0 = v18.findAnalyticsField;
local v20 = require(l_script_FirstAncestor_0.Analytics.getImpressionsTag);
local v21 = require(l_script_FirstAncestor_0.Analytics.sendLegacyGameImpressionsForSdui);
local l_reportUnifiedLoggingImpressions_0 = v18.reportUnifiedLoggingImpressions;
local l_SduiBuilder_0 = v18.SduiBuilder;
local l_SduiCollectionAnalyticsBuilder_0 = v18.SduiCollectionAnalyticsBuilder;
local l_SduiErrors_0 = v18.SduiErrors;
local v26 = require(l_script_FirstAncestor_0.Content.Collections.SduiCollectionItem);
local l_SduiParseHelpers_0 = v18.SduiParseHelpers;
local l_getSduiComponentWrapper_0 = v18.getSduiComponentWrapper;
local l_useCollectionAnalyticsContext_0 = require(l_Parent_0.SduiSharedContent).useCollectionAnalyticsContext;
local v30 = require(l_script_FirstAncestor_0.Analytics.useScrollTelemetryCallback);
local v31 = require(l_script_FirstAncestor_0.Content.Collections.useUniformItemHeight);
local v32 = require(l_script_FirstAncestor_0.Content.Collections.ItemHeightMode);
local v33 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppLayoutParamsInContext_0 = v33.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppCompositionSupport_0 = v33.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = v33.FFlagLuaAppCompositionAlways;
local l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 = v33.FFlagAddItemHeightModeToSduiCollectionCarousel;
local l_FFlagSduiServerCompat_0 = v33.FFlagSduiServerCompat;
local l_FFlagLuaAppUseFrameBoundsImpressions_0 = v33.FFlagLuaAppUseFrameBoundsImpressions;
local l_FFlagSduiImpressionHandlerRegistry_0 = v33.FFlagSduiImpressionHandlerRegistry;
local l_FFlagLuaAppCompositionSduiEnabled_0 = v33.FFlagLuaAppCompositionSduiEnabled;
local l_FFlagSduiCarouselHoverFixes_0 = v33.FFlagSduiCarouselHoverFixes;
local v43 = {};
return v2.memo(function(v44) --[[ Line: 140 ]] --[[ Name: SduiCollectionCarousel ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppCompositionSduiEnabled_0 (copy), l_FFlagSduiServerCompat_0 (copy), v2 (copy), v4 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v5 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_findAnalyticsField_0 (copy), v43 (copy), l_SduiBuilder_0 (copy), l_useCollectionAnalyticsContext_0 (copy), l_useCollectionImpressionsSignal_0 (copy), v20 (copy), l_SduiParseHelpers_0 (copy), l_SduiErrors_0 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), l_reportUnifiedLoggingImpressions_0 (copy), v21 (copy), l_useTokens_0 (copy), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (copy), v32 (copy), v31 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), l_getSduiComponentWrapper_0 (copy), v26 (copy), l_HoverTileCoordinator_0 (copy), v30 (copy), l_CollectionCarousel_0 (copy), l_FFlagSduiCarouselHoverFixes_0 (copy), l_WaitForPropWrapper_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_ScrollDetector_0 (copy)
    local v45 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and (v44.appCompositionEnabled or l_FFlagLuaAppCompositionSduiEnabled_0 and v44.sduiContext.appCompositionEnabled);
    local v46 = nil;
    v46 = if l_FFlagSduiServerCompat_0 then v44.layoutOrder else v44.LayoutOrder;
    local l_sduiContext_0 = v44.sduiContext;
    local v53 = v2.useMemo(function() --[[ Line: 159 ]]
        -- upvalues: v44 (copy)
        if not v44.items then
            return {};
        else
            for _, v49 in v44.items do
                if v44.itemTemplateKey and v49.templateKey == nil then
                    v49.templateKey = v44.itemTemplateKey;
                end;
            end;
            if v44.maxItemsToShow and #v44.items > v44.maxItemsToShow then
                local v50 = {};
                for v51, v52 in v44.items do
                    if v51 == v44.maxItemsToShow + 1 then
                        if v44.overflowItem then
                            table.insert(v50, v44.overflowItem);
                            return v50;
                        else
                            break;
                        end;
                    else
                        table.insert(v50, v52);
                    end;
                end;
                return v50;
            else
                return v44.items;
            end;
        end;
    end, {
        v44.items, 
        v44.itemTemplateKey, 
        v44.maxItemsToShow, 
        v44.overflowItem
    });
    local v54, v55 = v2.useState(nil);
    local v56 = v2.useRef(nil);
    local v57 = if v44.layoutOverrides then v4.Dictionary.join(v44.layoutOverrides, {
        sideMargin = v44.pageSideMargin
    }) else {
        sideMargin = v44.pageSideMargin
    };
    local v58 = nil;
    if not l_FFlagLuaAppCompositionAlways_0 then
        if l_FFlagLuaAppLayoutParamsInContext_0 then
            local v60 = v2.useCallback(function(v59) --[[ Line: 200 ]]
                -- upvalues: l_sduiContext_0 (copy), v44 (copy)
                return l_sduiContext_0.getPageLayoutConfig(v44.collectionItemSize)(v59);
            end, {
                v44.collectionItemSize, 
                l_sduiContext_0.getPageLayoutConfig
            });
            v58 = v5.useSignalState(v60);
        else
            v58 = l_useCollectionLayoutParams_0(v44.collectionItemSize or l_CollectionItemSize_0.Small, v54, false, v57);
        end;
    end;
    local v61 = if v53 then #v53 else 0;
    local v62 = l_findAnalyticsField_0("componentType", v44.analyticsContext.analyticsData or v43) or l_SduiBuilder_0.getComponentType(v44.componentConfig, l_sduiContext_0);
    local v63, v64 = l_useCollectionAnalyticsContext_0(v44.analyticsContext, v62, v61, v61, l_sduiContext_0, v44.startRow, v44.componentConfig.__isClientBinding);
    local v65 = v2.useRef({});
    local v66, v67 = l_useCollectionImpressionsSignal_0(v44.scrollViewPositionChangedSignal);
    local v68 = v20(v44.index, v64.current, l_sduiContext_0, v44.debugName);
    local v71 = v2.useCallback(function(v69) --[[ Line: 246 ]]
        -- upvalues: v53 (copy), v63 (copy), l_SduiParseHelpers_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v68 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (ref), v44 (copy), v64 (copy), l_reportUnifiedLoggingImpressions_0 (ref), v65 (copy), v21 (ref)
        if v53 == nil or #v53 == 0 then
            if v69 and #v69 > 0 then
                local v70 = if v63 then l_SduiParseHelpers_0.stringifyValue(v63.analyticsData) else nil;
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogImpressions, {
                    componentType = "CollectionCarousel", 
                    name = v68, 
                    message = ("Failed to log impressions. No configs. indexes: %* analytics: %*"):format(table.concat(v69, ","), v70)
                }, l_sduiContext_0.appPage);
            end;
            return;
        else
            assert(v53, "itemConfigs must exist");
            if l_FFlagSduiImpressionHandlerRegistry_0 and (v44.impressionEventName or not v64.current or v64.current.contentType ~= "Game") then
                l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v69, v65.current, v64.current, v44.startRow, v44.impressionEventName, v44.skipItemImpressionsLog);
                return;
            else
                if v64.current and v64.current.contentType == "Game" then
                    v21(v69, v65.current, v53, v63, v64.current, v44.startRow, l_sduiContext_0, nil, nil, v68);
                end;
                l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v69, v65.current, v64.current, v44.startRow);
                return;
            end;
        end;
    end, {
        v53, 
        v44.startRow, 
        l_sduiContext_0, 
        v64, 
        v65, 
        v63, 
        v68, 
        if l_FFlagSduiImpressionHandlerRegistry_0 then v44.impressionEventName else nil, 
        if l_FFlagSduiImpressionHandlerRegistry_0 then v44.skipItemImpressionsLog else nil
    });
    local l_Scale_0 = l_useTokens_0().Config.UI.Scale;
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
    if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
        v73 = v44.itemHeightMode == v32.Uniform;
        v74 = v31(v73);
        v75 = v74.onItemSizeChanged;
    end;
    local v76 = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v74 then v74.measuredMaxHeight ~= nil else false;
    local v77 = nil;
    if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
        if v73 then
            local l_measuredMaxHeight_0 = v74.measuredMaxHeight;
            if l_measuredMaxHeight_0 and l_measuredMaxHeight_0 > 0 then
                v77 = UDim.new(0, l_measuredMaxHeight_0 / l_Scale_0);
            end;
        elseif v44.itemHeightMode ~= v32.Auto then
            v77 = v44.itemHeightFromWidth;
        end;
    else
        v77 = v44.itemHeightFromWidth;
    end;
    local v79 = false;
    if v77 == nil then
        v79 = #v53 > 0;
    end;
    local v82 = v2.useCallback(function(v80) --[[ Line: 357 ]]
        -- upvalues: l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (ref), v73 (ref), v74 (ref), v77 (ref), l_Scale_0 (copy), v44 (copy)
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
            if v73 then
                local l_measuredMaxHeight_1 = v74.measuredMaxHeight;
                if l_measuredMaxHeight_1 and l_measuredMaxHeight_1 > 0 then
                    return l_measuredMaxHeight_1;
                else
                    return 0;
                end;
            elseif v77 then
                return v80 * v77.Scale + v77.Offset * l_Scale_0;
            else
                return 0;
            end;
        elseif v44.itemHeightFromWidth then
            return v80 * v44.itemHeightFromWidth.Scale + v44.itemHeightFromWidth.Offset * l_Scale_0;
        else
            return 0;
        end;
    end, {
        if not l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v44.itemHeightFromWidth else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v73 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v77 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v74.measuredMaxHeight else nil, 
        l_Scale_0
    });
    local v91 = v2.useCallback(function(v83, v84, v85, _) --[[ Line: 388 ]]
        -- upvalues: l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v68 (copy), v2 (ref), l_findAnalyticsField_0 (ref), v43 (ref), l_SduiBuilder_0 (ref), v65 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), v63 (copy), v44 (copy), l_FFlagSduiServerCompat_0 (ref), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (ref), v73 (ref), v76 (copy), v26 (ref), v79 (copy), v75 (ref), v74 (ref)
        if not v83 then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilItem, {
                componentType = "CollectionCarousel", 
                name = v68, 
                message = ("Nil item in CollectionCarousel.renderItem at index %*"):format(v84)
            }, l_sduiContext_0.appPage);
            return v2.createElement(v2.Fragment), "nil";
        else
            local v87 = l_findAnalyticsField_0("componentType", v83.analyticsData or v43) or l_SduiBuilder_0.getComponentType(v83, l_sduiContext_0);
            if not v87 then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                    componentType = "CollectionCarousel", 
                    name = v68, 
                    message = ("Nil componentType in CollectionCarousel.renderItem at index %*"):format(v84)
                }, l_sduiContext_0.appPage);
                return v2.createElement(v2.Fragment), "nil";
            else
                local v88 = {
                    itemPosition = v84, 
                    itemComponentType = v87, 
                    componentType = v87
                };
                v65.current[v84] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v83.analyticsData, nil, v88, v87);
                local v89 = l_getSduiComponentWrapper_0(v83);
                local v90 = v2.createElement(v89, {
                    componentConfig = v83, 
                    sduiContext = l_sduiContext_0, 
                    parentAnalyticsContext = if v83.__isClientBinding then nil else v63, 
                    extraLocalProps = {
                        scrollViewPositionChangedSignal = v44.scrollViewPositionChangedSignal, 
                        verticalScrollingFrameRef = v44.verticalScrollingFrameRef, 
                        index = v84, 
                        SelectionOrder = if not (not not l_FFlagSduiServerCompat_0 or v44.disableSelectionOrder) and v44.selectionOrderBase then v44.selectionOrderBase + v84 else nil, 
                        selectionOrder = if not (not l_FFlagSduiServerCompat_0 or v44.disableSelectionOrder) and v44.selectionOrderBase then v44.selectionOrderBase + v84 else nil, 
                        size = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v73 and v76 then UDim2.new(1, 0, 1, 0) else nil
                    }, 
                    debugName = ("%*_%*"):format(v87, v84), 
                    localAnalyticsData = v88
                });
                return v2.createElement(v26, {
                    index = v84, 
                    impressionsTag = v68, 
                    Size = if not l_FFlagSduiServerCompat_0 then v85 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then if v79 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v73 then Enum.AutomaticSize.Y else nil else nil, 
                    size = if l_FFlagSduiServerCompat_0 then v85 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then if v79 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v73 then Enum.AutomaticSize.Y else nil else nil, 
                    onItemSizeChanged = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v73 then v75 else nil, 
                    minHeightBinding = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v73 then v74.measuredMaxHeightBinding else nil
                }, {
                    Item = v90
                }), v87 or "unknown";
            end;
        end;
    end, {
        l_sduiContext_0, 
        v44.analyticsContext, 
        v44.scrollViewPositionChangedSignal, 
        v44.verticalScrollingFrameRef, 
        v63, 
        v79, 
        v68, 
        v44.index, 
        v44.disableSelectionOrder, 
        v44.selectionOrderBase, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v73 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v75 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v76 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v74.measuredMaxHeightBinding else nil
    });
    local v95 = v2.useMemo(function() --[[ Line: 507 ]]
        -- upvalues: v44 (copy), v2 (ref), v63 (copy)
        local v92 = nil;
        if v44.children then
            v92 = {};
            for v93, v94 in v44.children do
                v92[v93] = v2.cloneElement(v94, {
                    parentAnalyticsContext = v63
                });
            end;
        end;
        return v92;
    end, {
        v63, 
        v44.children
    });
    local v96 = v2.useCallback(function() --[[ Line: 523 ]]
        -- upvalues: l_HoverTileCoordinator_0 (ref)
        l_HoverTileCoordinator_0.default:reset();
    end, {});
    local v97 = v30(v56, v64, l_sduiContext_0);
    local v98 = v2.useMemo(function() --[[ Line: 529 ]]
        -- upvalues: v44 (copy), v2 (ref), v63 (copy)
        if v44.headerComponent then
            return v2.cloneElement(v44.headerComponent, {
                parentAnalyticsContext = v63
            });
        else
            return nil;
        end;
    end, {
        v63, 
        v44.headerComponent
    });
    local v99 = v2.useMemo(function() --[[ Line: 538 ]]
        -- upvalues: v44 (copy), v2 (ref), v63 (copy), v54 (copy)
        if v44.focusNavActionsComponent then
            return v2.cloneElement(v44.focusNavActionsComponent, {
                parentAnalyticsContext = v63, 
                extraLocalProps = {
                    guiObject = v54
                }
            });
        else
            return nil;
        end;
    end, {
        v63, 
        v44.focusNavActionsComponent, 
        v54
    });
    return v2.createElement(v2.Fragment, nil, v4.Dictionary.join(v95 or v43, {
        CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
            collectionItemSize = if v45 then v44.collectionItemSize else nil, 
            onReachedThresholdFromEnd = v44.onScrollToEnd, 
            thresholdFromEnd = v44.scrollThresholdFromEnd, 
            containerRef = v55, 
            scrollingFrameRef = v56, 
            getItemHeight = v82, 
            items = v53, 
            renderItem = v91, 
            numColumns = if v45 then nil else v58.numColumns, 
            fractionalItemAmount = if v45 then nil else v58.fractionalItemAmount, 
            columnGap = if v45 then nil else v58.columnGap, 
            sideMargin = if v45 then nil else v58.sideMargin, 
            onViewableItemsChanged = v67, 
            onChangeCanvasPosition = v67, 
            LayoutOrder = v46, 
            scrollingEnabledOverride = v44.scrollingEnabledOverride, 
            AutomaticSize = if not not v79 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v73 then Enum.AutomaticSize.Y else nil, 
            headerComponent = v98, 
            backgroundMuralUrl = v44.backgroundMuralUrl, 
            onScrollButtonEnter = v96, 
            numItemsToRenderOffScreen = v44.numItemsToRenderOffScreen, 
            enableHoverOverflow = if l_FFlagSduiCarouselHoverFixes_0 then v44.enableHoverOverflow else nil, 
            testId = if v44.testId then v44.testId else "--sdui-collection-carousel"
        }), 
        ImpressionDetector = v2.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v44.startRow, 
            maxUpdatesToDelay = v44.numUpdatesToDelayImpressions, 
            wrappedComponent = if not not l_FFlagLuaAppUseFrameBoundsImpressions_0 or v44.shouldUseFrameBoundsForImpressions then v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v56, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v68, 
                scrollViewPositionChangedSignal = v66, 
                sendImpressions = v71, 
                dataUpdatedTimestamp = v44.sduiContext.dataUpdatedTimestamp
            }) else v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v56, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v68, 
                scrollViewPositionChangedSignal = v66, 
                sendImpressions = v71, 
                dataUpdatedTimestamp = v44.sduiContext.dataUpdatedTimestamp
            })
        }), 
        ScrollDetector = v2.createElement(l_ScrollDetector_0, {
            scrollingFrameRef = v56, 
            sendScrollEvent = v97
        }), 
        FocusNavActions = v99
    }));
end);