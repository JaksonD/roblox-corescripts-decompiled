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
local l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 = v33.FFlagAddItemHeightModeToSduiCollectionCarousel;
local l_FFlagSduiServerCompat_0 = v33.FFlagSduiServerCompat;
local v37 = {};
return v2.memo(function(v38) --[[ Line: 125 ]] --[[ Name: SduiCollectionCarousel ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v2 (copy), v4 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v5 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_findAnalyticsField_0 (copy), v37 (copy), l_SduiBuilder_0 (copy), v29 (copy), l_useCollectionImpressionsSignal_0 (copy), v20 (copy), l_SduiParseHelpers_0 (copy), l_SduiErrors_0 (copy), v21 (copy), l_reportUnifiedLoggingImpressions_0 (copy), l_useTokens_0 (copy), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (copy), v32 (copy), v31 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), l_getSduiComponentWrapper_0 (copy), v26 (copy), l_HoverTileCoordinator_0 (copy), v30 (copy), l_CollectionCarousel_0 (copy), l_WaitForPropWrapper_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_ScrollDetector_0 (copy)
    local v39 = nil;
    v39 = if l_FFlagSduiServerCompat_0 then v38.layoutOrder else v38.LayoutOrder;
    local l_sduiContext_0 = v38.sduiContext;
    local v46 = v2.useMemo(function() --[[ Line: 136 ]]
        -- upvalues: v38 (copy)
        if not v38.items then
            return {};
        else
            for _, v42 in v38.items do
                if v38.itemTemplateKey and v42.templateKey == nil then
                    v42.templateKey = v38.itemTemplateKey;
                end;
            end;
            if v38.maxItemsToShow and #v38.items > v38.maxItemsToShow then
                local v43 = {};
                for v44, v45 in v38.items do
                    if v44 == v38.maxItemsToShow + 1 then
                        if v38.overflowItem then
                            table.insert(v43, v38.overflowItem);
                            return v43;
                        else
                            break;
                        end;
                    else
                        table.insert(v43, v45);
                    end;
                end;
                return v43;
            else
                return v38.items;
            end;
        end;
    end, {
        v38.items, 
        v38.itemTemplateKey, 
        v38.maxItemsToShow, 
        v38.overflowItem
    });
    local v47, v48 = v2.useState(nil);
    local v49 = v2.useRef(nil);
    local v50 = if v38.layoutOverrides then v4.Dictionary.join(v38.layoutOverrides, {
        sideMargin = v38.pageSideMargin
    }) else {
        sideMargin = v38.pageSideMargin
    };
    local v51 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v53 = v2.useCallback(function(v52) --[[ Line: 175 ]]
            -- upvalues: l_sduiContext_0 (copy), v38 (copy)
            return l_sduiContext_0.getPageLayoutConfig(v38.collectionItemSize)(v52);
        end, {
            v38.collectionItemSize, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v51 = v5.useSignalState(v53);
    else
        v51 = l_useCollectionLayoutParams_0(v38.collectionItemSize or l_CollectionItemSize_0.Small, v47, false, v50);
    end;
    local v54 = if v46 then #v46 else 0;
    local v55 = l_findAnalyticsField_0("componentType", v38.analyticsContext.analyticsData or v37) or l_SduiBuilder_0.getComponentType(v38.componentConfig, l_sduiContext_0);
    local v56, v57 = v29(v38.analyticsContext, v55, v54, v54, l_sduiContext_0, v38.startRow, v38.componentConfig.__isClientBinding);
    local v58 = v2.useRef({});
    local v59, v60 = l_useCollectionImpressionsSignal_0(v38.scrollViewPositionChangedSignal);
    local v61 = v20(v38.index, v57.current, l_sduiContext_0, v38.debugName);
    local v64 = v2.useCallback(function(v62) --[[ Line: 221 ]]
        -- upvalues: v46 (copy), v56 (copy), l_SduiParseHelpers_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v61 (copy), v57 (copy), v21 (ref), v58 (copy), v38 (copy), l_reportUnifiedLoggingImpressions_0 (ref)
        if v46 == nil or #v46 == 0 then
            if v62 and #v62 > 0 then
                local v63 = if v56 then l_SduiParseHelpers_0.stringifyValue(v56.analyticsData) else nil;
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogImpressions, {
                    componentType = "CollectionCarousel", 
                    name = v61, 
                    message = ("Failed to log impressions. No configs. indexes: %* analytics: %*"):format(table.concat(v62, ","), v63)
                }, l_sduiContext_0.appPage);
            end;
            return;
        else
            assert(v46, "itemConfigs must exist");
            if v57.current and v57.current.contentType == "Game" then
                v21(v62, v58.current, v46, v56, v57.current, v38.startRow, l_sduiContext_0, nil, nil, v61);
            end;
            l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v62, v58.current, v57.current, v38.startRow);
            return;
        end;
    end, {
        v46, 
        v38.startRow, 
        l_sduiContext_0, 
        v57, 
        v58, 
        v56, 
        v61
    });
    local l_Scale_0 = l_useTokens_0().Config.UI.Scale;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
        v66 = v38.itemHeightMode == v32.Uniform;
        v67 = v31(v66);
        v68 = v67.onItemSizeChanged;
    end;
    local v69 = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v67 then v67.measuredMaxHeight ~= nil else false;
    local v70 = nil;
    if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
        if v66 then
            local l_measuredMaxHeight_0 = v67.measuredMaxHeight;
            if l_measuredMaxHeight_0 and l_measuredMaxHeight_0 > 0 then
                v70 = UDim.new(0, l_measuredMaxHeight_0 / l_Scale_0);
            end;
        elseif v38.itemHeightMode ~= v32.Auto then
            v70 = v38.itemHeightFromWidth;
        end;
    else
        v70 = v38.itemHeightFromWidth;
    end;
    local v72 = false;
    if v70 == nil then
        v72 = #v46 > 0;
    end;
    local v75 = v2.useCallback(function(v73) --[[ Line: 309 ]]
        -- upvalues: l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (ref), v66 (ref), v67 (ref), v70 (ref), l_Scale_0 (copy), v38 (copy)
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
            if v66 then
                local l_measuredMaxHeight_1 = v67.measuredMaxHeight;
                if l_measuredMaxHeight_1 and l_measuredMaxHeight_1 > 0 then
                    return l_measuredMaxHeight_1;
                else
                    return 0;
                end;
            elseif v70 then
                return v73 * v70.Scale + v70.Offset * l_Scale_0;
            else
                return 0;
            end;
        elseif v38.itemHeightFromWidth then
            return v73 * v38.itemHeightFromWidth.Scale + v38.itemHeightFromWidth.Offset * l_Scale_0;
        else
            return 0;
        end;
    end, {
        if not l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v38.itemHeightFromWidth else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v66 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v70 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v67.measuredMaxHeight else nil, 
        l_Scale_0
    });
    local v84 = v2.useCallback(function(v76, v77, v78, _) --[[ Line: 340 ]]
        -- upvalues: l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v61 (copy), v2 (ref), l_findAnalyticsField_0 (ref), v37 (ref), l_SduiBuilder_0 (ref), v58 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), v56 (copy), v38 (copy), l_FFlagSduiServerCompat_0 (ref), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (ref), v66 (ref), v69 (copy), v26 (ref), v72 (copy), v68 (ref), v67 (ref)
        if not v76 then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilItem, {
                componentType = "CollectionCarousel", 
                name = v61, 
                message = ("Nil item in CollectionCarousel.renderItem at index %*"):format(v77)
            }, l_sduiContext_0.appPage);
            return v2.createElement(v2.Fragment), "nil";
        else
            local v80 = l_findAnalyticsField_0("componentType", v76.analyticsData or v37) or l_SduiBuilder_0.getComponentType(v76, l_sduiContext_0);
            if not v80 then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                    componentType = "CollectionCarousel", 
                    name = v61, 
                    message = ("Nil componentType in CollectionCarousel.renderItem at index %*"):format(v77)
                }, l_sduiContext_0.appPage);
                return v2.createElement(v2.Fragment), "nil";
            else
                local v81 = {
                    itemPosition = v77, 
                    itemComponentType = v80, 
                    componentType = v80
                };
                v58.current[v77] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v76.analyticsData, nil, v81, v80);
                local v82 = l_getSduiComponentWrapper_0(v76);
                local v83 = v2.createElement(v82, {
                    componentConfig = v76, 
                    sduiContext = l_sduiContext_0, 
                    parentAnalyticsContext = if v76.__isClientBinding then nil else v56, 
                    extraLocalProps = {
                        scrollViewPositionChangedSignal = v38.scrollViewPositionChangedSignal, 
                        verticalScrollingFrameRef = v38.verticalScrollingFrameRef, 
                        index = v77, 
                        SelectionOrder = if not (not not l_FFlagSduiServerCompat_0 or v38.disableSelectionOrder) and v38.selectionOrderBase then v38.selectionOrderBase + v77 else nil, 
                        selectionOrder = if not (not l_FFlagSduiServerCompat_0 or v38.disableSelectionOrder) and v38.selectionOrderBase then v38.selectionOrderBase + v77 else nil, 
                        size = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v66 and v69 then UDim2.new(1, 0, 1, 0) else nil
                    }, 
                    debugName = ("%*_%*"):format(v80, v77), 
                    localAnalyticsData = v81
                });
                return v2.createElement(v26, {
                    index = v77, 
                    impressionsTag = v61, 
                    Size = if not l_FFlagSduiServerCompat_0 then v78 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then if v72 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v66 then Enum.AutomaticSize.Y else nil else nil, 
                    size = if l_FFlagSduiServerCompat_0 then v78 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then if v72 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v66 then Enum.AutomaticSize.Y else nil else nil, 
                    onItemSizeChanged = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v66 then v68 else nil, 
                    minHeightBinding = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v66 then v67.measuredMaxHeightBinding else nil
                }, {
                    Item = v83
                }), v80 or "unknown";
            end;
        end;
    end, {
        l_sduiContext_0, 
        v38.analyticsContext, 
        v38.scrollViewPositionChangedSignal, 
        v38.verticalScrollingFrameRef, 
        v56, 
        v72, 
        v61, 
        v38.index, 
        v38.disableSelectionOrder, 
        v38.selectionOrderBase, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v66 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v68 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v69 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v67.measuredMaxHeightBinding else nil
    });
    local v88 = v2.useMemo(function() --[[ Line: 459 ]]
        -- upvalues: v38 (copy), v2 (ref), v56 (copy)
        local v85 = nil;
        if v38.children then
            v85 = {};
            for v86, v87 in v38.children do
                v85[v86] = v2.cloneElement(v87, {
                    parentAnalyticsContext = v56
                });
            end;
        end;
        return v85;
    end, {
        v56, 
        v38.children
    });
    local v89 = v2.useCallback(function() --[[ Line: 475 ]]
        -- upvalues: l_HoverTileCoordinator_0 (ref)
        l_HoverTileCoordinator_0.default:reset();
    end, {});
    local v90 = v30(v49, v57, l_sduiContext_0);
    local v91 = v2.useMemo(function() --[[ Line: 481 ]]
        -- upvalues: v38 (copy), v2 (ref), v56 (copy)
        if v38.headerComponent then
            return v2.cloneElement(v38.headerComponent, {
                parentAnalyticsContext = v56
            });
        else
            return nil;
        end;
    end, {
        v56, 
        v38.headerComponent
    });
    local v92 = v2.useMemo(function() --[[ Line: 490 ]]
        -- upvalues: v38 (copy), v2 (ref), v56 (copy), v47 (copy)
        if v38.focusNavActionsComponent then
            return v2.cloneElement(v38.focusNavActionsComponent, {
                parentAnalyticsContext = v56, 
                extraLocalProps = {
                    guiObject = v47
                }
            });
        else
            return nil;
        end;
    end, {
        v56, 
        v38.focusNavActionsComponent, 
        v47
    });
    return v2.createElement(v2.Fragment, nil, v4.Dictionary.join(v88 or v37, {
        CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
            onReachedThresholdFromEnd = v38.onScrollToEnd, 
            thresholdFromEnd = v38.scrollThresholdFromEnd, 
            containerRef = v48, 
            scrollingFrameRef = v49, 
            getItemHeight = v75, 
            items = v46, 
            renderItem = v84, 
            numColumns = v51.numColumns, 
            fractionalItemAmount = v51.fractionalItemAmount, 
            columnGap = v51.columnGap, 
            sideMargin = v51.sideMargin, 
            onViewableItemsChanged = v60, 
            onChangeCanvasPosition = v60, 
            LayoutOrder = v39, 
            scrollingEnabledOverride = v38.scrollingEnabledOverride, 
            AutomaticSize = if not not v72 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v66 then Enum.AutomaticSize.Y else nil, 
            headerComponent = v91, 
            backgroundMuralUrl = v38.backgroundMuralUrl, 
            onScrollButtonEnter = v89, 
            numItemsToRenderOffScreen = v38.numItemsToRenderOffScreen, 
            testId = if v38.testId then v38.testId else "--sdui-collection-carousel"
        }), 
        ImpressionDetector = v2.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v38.startRow, 
            maxUpdatesToDelay = v38.numUpdatesToDelayImpressions, 
            wrappedComponent = if v38.shouldUseFrameBoundsForImpressions then v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v49, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v61, 
                scrollViewPositionChangedSignal = v59, 
                sendImpressions = v64, 
                dataUpdatedTimestamp = v38.sduiContext.dataUpdatedTimestamp
            }) else v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v49, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v61, 
                scrollViewPositionChangedSignal = v59, 
                sendImpressions = v64, 
                dataUpdatedTimestamp = v38.sduiContext.dataUpdatedTimestamp
            })
        }), 
        ScrollDetector = v2.createElement(l_ScrollDetector_0, {
            scrollingFrameRef = v49, 
            sendScrollEvent = v90
        }), 
        FocusNavActions = v92
    }));
end);