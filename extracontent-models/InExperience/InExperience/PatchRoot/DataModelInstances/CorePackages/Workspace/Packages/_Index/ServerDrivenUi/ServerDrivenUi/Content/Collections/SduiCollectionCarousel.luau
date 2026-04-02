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
local v29 = require(l_script_FirstAncestor_0.Content.Collections.useCollectionAnalyticsContext);
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
local v41 = {};
return v2.memo(function(v42) --[[ Line: 137 ]] --[[ Name: SduiCollectionCarousel ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagSduiServerCompat_0 (copy), v2 (copy), v4 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v5 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_findAnalyticsField_0 (copy), v41 (copy), l_SduiBuilder_0 (copy), v29 (copy), l_useCollectionImpressionsSignal_0 (copy), v20 (copy), l_SduiParseHelpers_0 (copy), l_SduiErrors_0 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), l_reportUnifiedLoggingImpressions_0 (copy), v21 (copy), l_useTokens_0 (copy), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (copy), v32 (copy), v31 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), l_getSduiComponentWrapper_0 (copy), v26 (copy), l_HoverTileCoordinator_0 (copy), v30 (copy), l_CollectionCarousel_0 (copy), l_WaitForPropWrapper_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_ScrollDetector_0 (copy)
    local v43 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v42.appCompositionEnabled;
    local v44 = nil;
    v44 = if l_FFlagSduiServerCompat_0 then v42.layoutOrder else v42.LayoutOrder;
    local l_sduiContext_0 = v42.sduiContext;
    local v51 = v2.useMemo(function() --[[ Line: 150 ]]
        -- upvalues: v42 (copy)
        if not v42.items then
            return {};
        else
            for _, v47 in v42.items do
                if v42.itemTemplateKey and v47.templateKey == nil then
                    v47.templateKey = v42.itemTemplateKey;
                end;
            end;
            if v42.maxItemsToShow and #v42.items > v42.maxItemsToShow then
                local v48 = {};
                for v49, v50 in v42.items do
                    if v49 == v42.maxItemsToShow + 1 then
                        if v42.overflowItem then
                            table.insert(v48, v42.overflowItem);
                            return v48;
                        else
                            break;
                        end;
                    else
                        table.insert(v48, v50);
                    end;
                end;
                return v48;
            else
                return v42.items;
            end;
        end;
    end, {
        v42.items, 
        v42.itemTemplateKey, 
        v42.maxItemsToShow, 
        v42.overflowItem
    });
    local v52, v53 = v2.useState(nil);
    local v54 = v2.useRef(nil);
    local v55 = if v42.layoutOverrides then v4.Dictionary.join(v42.layoutOverrides, {
        sideMargin = v42.pageSideMargin
    }) else {
        sideMargin = v42.pageSideMargin
    };
    local v56 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v58 = v2.useCallback(function(v57) --[[ Line: 189 ]]
            -- upvalues: l_sduiContext_0 (copy), v42 (copy)
            return l_sduiContext_0.getPageLayoutConfig(v42.collectionItemSize)(v57);
        end, {
            v42.collectionItemSize, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v56 = v5.useSignalState(v58);
    else
        v56 = l_useCollectionLayoutParams_0(v42.collectionItemSize or l_CollectionItemSize_0.Small, v52, false, v55);
    end;
    local v59 = if v51 then #v51 else 0;
    local v60 = l_findAnalyticsField_0("componentType", v42.analyticsContext.analyticsData or v41) or l_SduiBuilder_0.getComponentType(v42.componentConfig, l_sduiContext_0);
    local v61, v62 = v29(v42.analyticsContext, v60, v59, v59, l_sduiContext_0, v42.startRow, v42.componentConfig.__isClientBinding);
    local v63 = v2.useRef({});
    local v64, v65 = l_useCollectionImpressionsSignal_0(v42.scrollViewPositionChangedSignal);
    local v66 = v20(v42.index, v62.current, l_sduiContext_0, v42.debugName);
    local v69 = v2.useCallback(function(v67) --[[ Line: 235 ]]
        -- upvalues: v51 (copy), v61 (copy), l_SduiParseHelpers_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v66 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (ref), v42 (copy), v62 (copy), l_reportUnifiedLoggingImpressions_0 (ref), v63 (copy), v21 (ref)
        if v51 == nil or #v51 == 0 then
            if v67 and #v67 > 0 then
                local v68 = if v61 then l_SduiParseHelpers_0.stringifyValue(v61.analyticsData) else nil;
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogImpressions, {
                    componentType = "CollectionCarousel", 
                    name = v66, 
                    message = ("Failed to log impressions. No configs. indexes: %* analytics: %*"):format(table.concat(v67, ","), v68)
                }, l_sduiContext_0.appPage);
            end;
            return;
        else
            assert(v51, "itemConfigs must exist");
            if l_FFlagSduiImpressionHandlerRegistry_0 and (v42.impressionEventName or not v62.current or v62.current.contentType ~= "Game") then
                l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v67, v63.current, v62.current, v42.startRow, v42.impressionEventName, v42.skipItemImpressionsLog);
                return;
            else
                if v62.current and v62.current.contentType == "Game" then
                    v21(v67, v63.current, v51, v61, v62.current, v42.startRow, l_sduiContext_0, nil, nil, v66);
                end;
                l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v67, v63.current, v62.current, v42.startRow);
                return;
            end;
        end;
    end, {
        v51, 
        v42.startRow, 
        l_sduiContext_0, 
        v62, 
        v63, 
        v61, 
        v66, 
        if l_FFlagSduiImpressionHandlerRegistry_0 then v42.impressionEventName else nil, 
        if l_FFlagSduiImpressionHandlerRegistry_0 then v42.skipItemImpressionsLog else nil
    });
    local l_Scale_0 = l_useTokens_0().Config.UI.Scale;
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
        v71 = v42.itemHeightMode == v32.Uniform;
        v72 = v31(v71);
        v73 = v72.onItemSizeChanged;
    end;
    local v74 = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v72 then v72.measuredMaxHeight ~= nil else false;
    local v75 = nil;
    if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
        if v71 then
            local l_measuredMaxHeight_0 = v72.measuredMaxHeight;
            if l_measuredMaxHeight_0 and l_measuredMaxHeight_0 > 0 then
                v75 = UDim.new(0, l_measuredMaxHeight_0 / l_Scale_0);
            end;
        elseif v42.itemHeightMode ~= v32.Auto then
            v75 = v42.itemHeightFromWidth;
        end;
    else
        v75 = v42.itemHeightFromWidth;
    end;
    local v77 = false;
    if v75 == nil then
        v77 = #v51 > 0;
    end;
    local v80 = v2.useCallback(function(v78) --[[ Line: 346 ]]
        -- upvalues: l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (ref), v71 (ref), v72 (ref), v75 (ref), l_Scale_0 (copy), v42 (copy)
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
            if v71 then
                local l_measuredMaxHeight_1 = v72.measuredMaxHeight;
                if l_measuredMaxHeight_1 and l_measuredMaxHeight_1 > 0 then
                    return l_measuredMaxHeight_1;
                else
                    return 0;
                end;
            elseif v75 then
                return v78 * v75.Scale + v75.Offset * l_Scale_0;
            else
                return 0;
            end;
        elseif v42.itemHeightFromWidth then
            return v78 * v42.itemHeightFromWidth.Scale + v42.itemHeightFromWidth.Offset * l_Scale_0;
        else
            return 0;
        end;
    end, {
        if not l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v42.itemHeightFromWidth else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v71 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v75 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v72.measuredMaxHeight else nil, 
        l_Scale_0
    });
    local v89 = v2.useCallback(function(v81, v82, v83, _) --[[ Line: 377 ]]
        -- upvalues: l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v66 (copy), v2 (ref), l_findAnalyticsField_0 (ref), v41 (ref), l_SduiBuilder_0 (ref), v63 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), v61 (copy), v42 (copy), l_FFlagSduiServerCompat_0 (ref), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (ref), v71 (ref), v74 (copy), v26 (ref), v77 (copy), v73 (ref), v72 (ref)
        if not v81 then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilItem, {
                componentType = "CollectionCarousel", 
                name = v66, 
                message = ("Nil item in CollectionCarousel.renderItem at index %*"):format(v82)
            }, l_sduiContext_0.appPage);
            return v2.createElement(v2.Fragment), "nil";
        else
            local v85 = l_findAnalyticsField_0("componentType", v81.analyticsData or v41) or l_SduiBuilder_0.getComponentType(v81, l_sduiContext_0);
            if not v85 then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                    componentType = "CollectionCarousel", 
                    name = v66, 
                    message = ("Nil componentType in CollectionCarousel.renderItem at index %*"):format(v82)
                }, l_sduiContext_0.appPage);
                return v2.createElement(v2.Fragment), "nil";
            else
                local v86 = {
                    itemPosition = v82, 
                    itemComponentType = v85, 
                    componentType = v85
                };
                v63.current[v82] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v81.analyticsData, nil, v86, v85);
                local v87 = l_getSduiComponentWrapper_0(v81);
                local v88 = v2.createElement(v87, {
                    componentConfig = v81, 
                    sduiContext = l_sduiContext_0, 
                    parentAnalyticsContext = if v81.__isClientBinding then nil else v61, 
                    extraLocalProps = {
                        scrollViewPositionChangedSignal = v42.scrollViewPositionChangedSignal, 
                        verticalScrollingFrameRef = v42.verticalScrollingFrameRef, 
                        index = v82, 
                        SelectionOrder = if not (not not l_FFlagSduiServerCompat_0 or v42.disableSelectionOrder) and v42.selectionOrderBase then v42.selectionOrderBase + v82 else nil, 
                        selectionOrder = if not (not l_FFlagSduiServerCompat_0 or v42.disableSelectionOrder) and v42.selectionOrderBase then v42.selectionOrderBase + v82 else nil, 
                        size = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v71 and v74 then UDim2.new(1, 0, 1, 0) else nil
                    }, 
                    debugName = ("%*_%*"):format(v85, v82), 
                    localAnalyticsData = v86
                });
                return v2.createElement(v26, {
                    index = v82, 
                    impressionsTag = v66, 
                    Size = if not l_FFlagSduiServerCompat_0 then v83 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then if v77 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v71 then Enum.AutomaticSize.Y else nil else nil, 
                    size = if l_FFlagSduiServerCompat_0 then v83 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then if v77 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v71 then Enum.AutomaticSize.Y else nil else nil, 
                    onItemSizeChanged = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v71 then v73 else nil, 
                    minHeightBinding = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v71 then v72.measuredMaxHeightBinding else nil
                }, {
                    Item = v88
                }), v85 or "unknown";
            end;
        end;
    end, {
        l_sduiContext_0, 
        v42.analyticsContext, 
        v42.scrollViewPositionChangedSignal, 
        v42.verticalScrollingFrameRef, 
        v61, 
        v77, 
        v66, 
        v42.index, 
        v42.disableSelectionOrder, 
        v42.selectionOrderBase, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v71 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v73 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v74 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v72.measuredMaxHeightBinding else nil
    });
    local v93 = v2.useMemo(function() --[[ Line: 496 ]]
        -- upvalues: v42 (copy), v2 (ref), v61 (copy)
        local v90 = nil;
        if v42.children then
            v90 = {};
            for v91, v92 in v42.children do
                v90[v91] = v2.cloneElement(v92, {
                    parentAnalyticsContext = v61
                });
            end;
        end;
        return v90;
    end, {
        v61, 
        v42.children
    });
    local v94 = v2.useCallback(function() --[[ Line: 512 ]]
        -- upvalues: l_HoverTileCoordinator_0 (ref)
        l_HoverTileCoordinator_0.default:reset();
    end, {});
    local v95 = v30(v54, v62, l_sduiContext_0);
    local v96 = v2.useMemo(function() --[[ Line: 518 ]]
        -- upvalues: v42 (copy), v2 (ref), v61 (copy)
        if v42.headerComponent then
            return v2.cloneElement(v42.headerComponent, {
                parentAnalyticsContext = v61
            });
        else
            return nil;
        end;
    end, {
        v61, 
        v42.headerComponent
    });
    local v97 = v2.useMemo(function() --[[ Line: 527 ]]
        -- upvalues: v42 (copy), v2 (ref), v61 (copy), v52 (copy)
        if v42.focusNavActionsComponent then
            return v2.cloneElement(v42.focusNavActionsComponent, {
                parentAnalyticsContext = v61, 
                extraLocalProps = {
                    guiObject = v52
                }
            });
        else
            return nil;
        end;
    end, {
        v61, 
        v42.focusNavActionsComponent, 
        v52
    });
    return v2.createElement(v2.Fragment, nil, v4.Dictionary.join(v93 or v41, {
        CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
            collectionItemSize = if v43 then v42.collectionItemSize else nil, 
            onReachedThresholdFromEnd = v42.onScrollToEnd, 
            thresholdFromEnd = v42.scrollThresholdFromEnd, 
            containerRef = v53, 
            scrollingFrameRef = v54, 
            getItemHeight = v80, 
            items = v51, 
            renderItem = v89, 
            numColumns = if v43 then nil else v56.numColumns, 
            fractionalItemAmount = if v43 then nil else v56.fractionalItemAmount, 
            columnGap = if v43 then nil else v56.columnGap, 
            sideMargin = if v43 then nil else v56.sideMargin, 
            onViewableItemsChanged = v65, 
            onChangeCanvasPosition = v65, 
            LayoutOrder = v44, 
            scrollingEnabledOverride = v42.scrollingEnabledOverride, 
            AutomaticSize = if not not v77 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v71 then Enum.AutomaticSize.Y else nil, 
            headerComponent = v96, 
            backgroundMuralUrl = v42.backgroundMuralUrl, 
            onScrollButtonEnter = v94, 
            numItemsToRenderOffScreen = v42.numItemsToRenderOffScreen, 
            testId = if v42.testId then v42.testId else "--sdui-collection-carousel"
        }), 
        ImpressionDetector = v2.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v42.startRow, 
            maxUpdatesToDelay = v42.numUpdatesToDelayImpressions, 
            wrappedComponent = if not not l_FFlagLuaAppUseFrameBoundsImpressions_0 or v42.shouldUseFrameBoundsForImpressions then v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v54, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v66, 
                scrollViewPositionChangedSignal = v64, 
                sendImpressions = v69, 
                dataUpdatedTimestamp = v42.sduiContext.dataUpdatedTimestamp
            }) else v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v54, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v66, 
                scrollViewPositionChangedSignal = v64, 
                sendImpressions = v69, 
                dataUpdatedTimestamp = v42.sduiContext.dataUpdatedTimestamp
            })
        }), 
        ScrollDetector = v2.createElement(l_ScrollDetector_0, {
            scrollingFrameRef = v54, 
            sendScrollEvent = v95
        }), 
        FocusNavActions = v97
    }));
end);