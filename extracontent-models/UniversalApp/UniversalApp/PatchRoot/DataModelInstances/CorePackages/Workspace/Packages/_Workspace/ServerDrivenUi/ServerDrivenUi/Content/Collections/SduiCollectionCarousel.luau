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
local v40 = {};
return v2.memo(function(v41) --[[ Line: 131 ]] --[[ Name: SduiCollectionCarousel ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagSduiServerCompat_0 (copy), v2 (copy), v4 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v5 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_findAnalyticsField_0 (copy), v40 (copy), l_SduiBuilder_0 (copy), v29 (copy), l_useCollectionImpressionsSignal_0 (copy), v20 (copy), l_SduiParseHelpers_0 (copy), l_SduiErrors_0 (copy), v21 (copy), l_reportUnifiedLoggingImpressions_0 (copy), l_useTokens_0 (copy), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (copy), v32 (copy), v31 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), l_getSduiComponentWrapper_0 (copy), v26 (copy), l_HoverTileCoordinator_0 (copy), v30 (copy), l_CollectionCarousel_0 (copy), l_WaitForPropWrapper_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_ScrollDetector_0 (copy)
    local v42 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v41.appCompositionEnabled;
    local v43 = nil;
    v43 = if l_FFlagSduiServerCompat_0 then v41.layoutOrder else v41.LayoutOrder;
    local l_sduiContext_0 = v41.sduiContext;
    local v50 = v2.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v41 (copy)
        if not v41.items then
            return {};
        else
            for _, v46 in v41.items do
                if v41.itemTemplateKey and v46.templateKey == nil then
                    v46.templateKey = v41.itemTemplateKey;
                end;
            end;
            if v41.maxItemsToShow and #v41.items > v41.maxItemsToShow then
                local v47 = {};
                for v48, v49 in v41.items do
                    if v48 == v41.maxItemsToShow + 1 then
                        if v41.overflowItem then
                            table.insert(v47, v41.overflowItem);
                            return v47;
                        else
                            break;
                        end;
                    else
                        table.insert(v47, v49);
                    end;
                end;
                return v47;
            else
                return v41.items;
            end;
        end;
    end, {
        v41.items, 
        v41.itemTemplateKey, 
        v41.maxItemsToShow, 
        v41.overflowItem
    });
    local v51, v52 = v2.useState(nil);
    local v53 = v2.useRef(nil);
    local v54 = if v41.layoutOverrides then v4.Dictionary.join(v41.layoutOverrides, {
        sideMargin = v41.pageSideMargin
    }) else {
        sideMargin = v41.pageSideMargin
    };
    local v55 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v57 = v2.useCallback(function(v56) --[[ Line: 183 ]]
            -- upvalues: l_sduiContext_0 (copy), v41 (copy)
            return l_sduiContext_0.getPageLayoutConfig(v41.collectionItemSize)(v56);
        end, {
            v41.collectionItemSize, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v55 = v5.useSignalState(v57);
    else
        v55 = l_useCollectionLayoutParams_0(v41.collectionItemSize or l_CollectionItemSize_0.Small, v51, false, v54);
    end;
    local v58 = if v50 then #v50 else 0;
    local v59 = l_findAnalyticsField_0("componentType", v41.analyticsContext.analyticsData or v40) or l_SduiBuilder_0.getComponentType(v41.componentConfig, l_sduiContext_0);
    local v60, v61 = v29(v41.analyticsContext, v59, v58, v58, l_sduiContext_0, v41.startRow, v41.componentConfig.__isClientBinding);
    local v62 = v2.useRef({});
    local v63, v64 = l_useCollectionImpressionsSignal_0(v41.scrollViewPositionChangedSignal);
    local v65 = v20(v41.index, v61.current, l_sduiContext_0, v41.debugName);
    local v68 = v2.useCallback(function(v66) --[[ Line: 229 ]]
        -- upvalues: v50 (copy), v60 (copy), l_SduiParseHelpers_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v65 (copy), v61 (copy), v21 (ref), v62 (copy), v41 (copy), l_reportUnifiedLoggingImpressions_0 (ref)
        if v50 == nil or #v50 == 0 then
            if v66 and #v66 > 0 then
                local v67 = if v60 then l_SduiParseHelpers_0.stringifyValue(v60.analyticsData) else nil;
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogImpressions, {
                    componentType = "CollectionCarousel", 
                    name = v65, 
                    message = ("Failed to log impressions. No configs. indexes: %* analytics: %*"):format(table.concat(v66, ","), v67)
                }, l_sduiContext_0.appPage);
            end;
            return;
        else
            assert(v50, "itemConfigs must exist");
            if v61.current and v61.current.contentType == "Game" then
                v21(v66, v62.current, v50, v60, v61.current, v41.startRow, l_sduiContext_0, nil, nil, v65);
            end;
            l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v66, v62.current, v61.current, v41.startRow);
            return;
        end;
    end, {
        v50, 
        v41.startRow, 
        l_sduiContext_0, 
        v61, 
        v62, 
        v60, 
        v65
    });
    local l_Scale_0 = l_useTokens_0().Config.UI.Scale;
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
        v70 = v41.itemHeightMode == v32.Uniform;
        v71 = v31(v70);
        v72 = v71.onItemSizeChanged;
    end;
    local v73 = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v71 then v71.measuredMaxHeight ~= nil else false;
    local v74 = nil;
    if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
        if v70 then
            local l_measuredMaxHeight_0 = v71.measuredMaxHeight;
            if l_measuredMaxHeight_0 and l_measuredMaxHeight_0 > 0 then
                v74 = UDim.new(0, l_measuredMaxHeight_0 / l_Scale_0);
            end;
        elseif v41.itemHeightMode ~= v32.Auto then
            v74 = v41.itemHeightFromWidth;
        end;
    else
        v74 = v41.itemHeightFromWidth;
    end;
    local v76 = false;
    if v74 == nil then
        v76 = #v50 > 0;
    end;
    local v79 = v2.useCallback(function(v77) --[[ Line: 317 ]]
        -- upvalues: l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (ref), v70 (ref), v71 (ref), v74 (ref), l_Scale_0 (copy), v41 (copy)
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
            if v70 then
                local l_measuredMaxHeight_1 = v71.measuredMaxHeight;
                if l_measuredMaxHeight_1 and l_measuredMaxHeight_1 > 0 then
                    return l_measuredMaxHeight_1;
                else
                    return 0;
                end;
            elseif v74 then
                return v77 * v74.Scale + v74.Offset * l_Scale_0;
            else
                return 0;
            end;
        elseif v41.itemHeightFromWidth then
            return v77 * v41.itemHeightFromWidth.Scale + v41.itemHeightFromWidth.Offset * l_Scale_0;
        else
            return 0;
        end;
    end, {
        if not l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v41.itemHeightFromWidth else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v70 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v74 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v71.measuredMaxHeight else nil, 
        l_Scale_0
    });
    local v88 = v2.useCallback(function(v80, v81, v82, _) --[[ Line: 348 ]]
        -- upvalues: l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v65 (copy), v2 (ref), l_findAnalyticsField_0 (ref), v40 (ref), l_SduiBuilder_0 (ref), v62 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), v60 (copy), v41 (copy), l_FFlagSduiServerCompat_0 (ref), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (ref), v70 (ref), v73 (copy), v26 (ref), v76 (copy), v72 (ref), v71 (ref)
        if not v80 then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilItem, {
                componentType = "CollectionCarousel", 
                name = v65, 
                message = ("Nil item in CollectionCarousel.renderItem at index %*"):format(v81)
            }, l_sduiContext_0.appPage);
            return v2.createElement(v2.Fragment), "nil";
        else
            local v84 = l_findAnalyticsField_0("componentType", v80.analyticsData or v40) or l_SduiBuilder_0.getComponentType(v80, l_sduiContext_0);
            if not v84 then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                    componentType = "CollectionCarousel", 
                    name = v65, 
                    message = ("Nil componentType in CollectionCarousel.renderItem at index %*"):format(v81)
                }, l_sduiContext_0.appPage);
                return v2.createElement(v2.Fragment), "nil";
            else
                local v85 = {
                    itemPosition = v81, 
                    itemComponentType = v84, 
                    componentType = v84
                };
                v62.current[v81] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v80.analyticsData, nil, v85, v84);
                local v86 = l_getSduiComponentWrapper_0(v80);
                local v87 = v2.createElement(v86, {
                    componentConfig = v80, 
                    sduiContext = l_sduiContext_0, 
                    parentAnalyticsContext = if v80.__isClientBinding then nil else v60, 
                    extraLocalProps = {
                        scrollViewPositionChangedSignal = v41.scrollViewPositionChangedSignal, 
                        verticalScrollingFrameRef = v41.verticalScrollingFrameRef, 
                        index = v81, 
                        SelectionOrder = if not (not not l_FFlagSduiServerCompat_0 or v41.disableSelectionOrder) and v41.selectionOrderBase then v41.selectionOrderBase + v81 else nil, 
                        selectionOrder = if not (not l_FFlagSduiServerCompat_0 or v41.disableSelectionOrder) and v41.selectionOrderBase then v41.selectionOrderBase + v81 else nil, 
                        size = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v70 and v73 then UDim2.new(1, 0, 1, 0) else nil
                    }, 
                    debugName = ("%*_%*"):format(v84, v81), 
                    localAnalyticsData = v85
                });
                return v2.createElement(v26, {
                    index = v81, 
                    impressionsTag = v65, 
                    Size = if not l_FFlagSduiServerCompat_0 then v82 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then if v76 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v70 then Enum.AutomaticSize.Y else nil else nil, 
                    size = if l_FFlagSduiServerCompat_0 then v82 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then if v76 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v70 then Enum.AutomaticSize.Y else nil else nil, 
                    onItemSizeChanged = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v70 then v72 else nil, 
                    minHeightBinding = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v70 then v71.measuredMaxHeightBinding else nil
                }, {
                    Item = v87
                }), v84 or "unknown";
            end;
        end;
    end, {
        l_sduiContext_0, 
        v41.analyticsContext, 
        v41.scrollViewPositionChangedSignal, 
        v41.verticalScrollingFrameRef, 
        v60, 
        v76, 
        v65, 
        v41.index, 
        v41.disableSelectionOrder, 
        v41.selectionOrderBase, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v70 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v72 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v73 else nil, 
        if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then v71.measuredMaxHeightBinding else nil
    });
    local v92 = v2.useMemo(function() --[[ Line: 467 ]]
        -- upvalues: v41 (copy), v2 (ref), v60 (copy)
        local v89 = nil;
        if v41.children then
            v89 = {};
            for v90, v91 in v41.children do
                v89[v90] = v2.cloneElement(v91, {
                    parentAnalyticsContext = v60
                });
            end;
        end;
        return v89;
    end, {
        v60, 
        v41.children
    });
    local v93 = v2.useCallback(function() --[[ Line: 483 ]]
        -- upvalues: l_HoverTileCoordinator_0 (ref)
        l_HoverTileCoordinator_0.default:reset();
    end, {});
    local v94 = v30(v53, v61, l_sduiContext_0);
    local v95 = v2.useMemo(function() --[[ Line: 489 ]]
        -- upvalues: v41 (copy), v2 (ref), v60 (copy)
        if v41.headerComponent then
            return v2.cloneElement(v41.headerComponent, {
                parentAnalyticsContext = v60
            });
        else
            return nil;
        end;
    end, {
        v60, 
        v41.headerComponent
    });
    local v96 = v2.useMemo(function() --[[ Line: 498 ]]
        -- upvalues: v41 (copy), v2 (ref), v60 (copy), v51 (copy)
        if v41.focusNavActionsComponent then
            return v2.cloneElement(v41.focusNavActionsComponent, {
                parentAnalyticsContext = v60, 
                extraLocalProps = {
                    guiObject = v51
                }
            });
        else
            return nil;
        end;
    end, {
        v60, 
        v41.focusNavActionsComponent, 
        v51
    });
    return v2.createElement(v2.Fragment, nil, v4.Dictionary.join(v92 or v40, {
        CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
            collectionItemSize = if v42 then v41.collectionItemSize else nil, 
            onReachedThresholdFromEnd = v41.onScrollToEnd, 
            thresholdFromEnd = v41.scrollThresholdFromEnd, 
            containerRef = v52, 
            scrollingFrameRef = v53, 
            getItemHeight = v79, 
            items = v50, 
            renderItem = v88, 
            numColumns = if v42 then nil else v55.numColumns, 
            fractionalItemAmount = if v42 then nil else v55.fractionalItemAmount, 
            columnGap = if v42 then nil else v55.columnGap, 
            sideMargin = if v42 then nil else v55.sideMargin, 
            onViewableItemsChanged = v64, 
            onChangeCanvasPosition = v64, 
            LayoutOrder = v43, 
            scrollingEnabledOverride = v41.scrollingEnabledOverride, 
            AutomaticSize = if not not v76 or l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v70 then Enum.AutomaticSize.Y else nil, 
            headerComponent = v95, 
            backgroundMuralUrl = v41.backgroundMuralUrl, 
            onScrollButtonEnter = v93, 
            numItemsToRenderOffScreen = v41.numItemsToRenderOffScreen, 
            testId = if v41.testId then v41.testId else "--sdui-collection-carousel"
        }), 
        ImpressionDetector = v2.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v41.startRow, 
            maxUpdatesToDelay = v41.numUpdatesToDelayImpressions, 
            wrappedComponent = if not not l_FFlagLuaAppUseFrameBoundsImpressions_0 or v41.shouldUseFrameBoundsForImpressions then v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v53, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v65, 
                scrollViewPositionChangedSignal = v63, 
                sendImpressions = v68, 
                dataUpdatedTimestamp = v41.sduiContext.dataUpdatedTimestamp
            }) else v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v53, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v65, 
                scrollViewPositionChangedSignal = v63, 
                sendImpressions = v68, 
                dataUpdatedTimestamp = v41.sduiContext.dataUpdatedTimestamp
            })
        }), 
        ScrollDetector = v2.createElement(l_ScrollDetector_0, {
            scrollingFrameRef = v53, 
            sendScrollEvent = v94
        }), 
        FocusNavActions = v96
    }));
end);