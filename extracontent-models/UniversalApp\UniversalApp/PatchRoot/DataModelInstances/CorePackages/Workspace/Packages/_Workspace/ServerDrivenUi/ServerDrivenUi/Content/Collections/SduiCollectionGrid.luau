local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.AppCommonLib);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_Parent_0.CollectionViews);
local l_CollectionGrid_0 = v6.CollectionGrid;
local l_CollectionItemSize_0 = v6.CollectionViewTypes.CollectionItemSize;
local l_useCollectionImpressionsSignal_0 = v6.useCollectionImpressionsSignal;
local l_useCollectionLayoutParams_0 = v6.useCollectionLayoutParams;
local l_WaitForPropWrapper_0 = require(l_Parent_0.GameCollections).WaitForPropWrapper;
local v12 = require(l_Parent_0.Impressions);
local l_FrameBoundsImpressionsTracker_0 = v12.FrameBoundsImpressionsTracker;
local l_ScreenSizeImpressionsTracker_0 = v12.ScreenSizeImpressionsTracker;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v16 = require(l_Parent_0.SduiCoreSystem);
local l_findAnalyticsField_0 = v16.findAnalyticsField;
local v18 = require(l_script_FirstAncestor_0.Analytics.getImpressionsTag);
local v19 = require(l_script_FirstAncestor_0.Analytics.sendLegacyGameImpressionsForSdui);
local l_reportUnifiedLoggingImpressions_0 = v16.reportUnifiedLoggingImpressions;
local l_SduiBuilder_0 = v16.SduiBuilder;
local l_SduiCollectionAnalyticsBuilder_0 = v16.SduiCollectionAnalyticsBuilder;
local l_SduiErrors_0 = v16.SduiErrors;
local l_SduiParseHelpers_0 = v16.SduiParseHelpers;
local l_getSduiComponentWrapper_0 = v16.getSduiComponentWrapper;
local v26 = require(l_script_FirstAncestor_0.Content.Collections.SduiCollectionItem);
local v27 = require(l_script_FirstAncestor_0.Content.Collections.useCollectionAnalyticsContext);
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v31 = {};
return v2.memo(function(v32) --[[ Line: 127 ]] --[[ Name: SduiCollectionGrid ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v2 (copy), v31 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v5 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), v4 (copy), l_findAnalyticsField_0 (copy), l_SduiBuilder_0 (copy), v27 (copy), l_useCollectionImpressionsSignal_0 (copy), v18 (copy), l_SduiParseHelpers_0 (copy), l_SduiErrors_0 (copy), v19 (copy), l_reportUnifiedLoggingImpressions_0 (copy), l_useTokens_0 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), l_getSduiComponentWrapper_0 (copy), v26 (copy), l_CollectionGrid_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), l_WaitForPropWrapper_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v33 = nil;
    v33 = if l_FFlagSduiServerCompat_0 then v32.layoutOrder else v32.LayoutOrder;
    local l_sduiContext_0 = v32.sduiContext;
    local v37 = v2.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v32 (copy), v31 (ref)
        if v32.items == nil then
            return v31;
        else
            for _, v36 in v32.items do
                if v32.itemTemplateKey and v36.templateKey == nil then
                    v36.templateKey = v32.itemTemplateKey;
                end;
            end;
            return v32.items;
        end;
    end, {
        v32.items, 
        v32.itemTemplateKey
    });
    local v38, v39 = v2.useState(nil);
    local v40 = v2.useRef(nil);
    v40.current = v38;
    local v41 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v43 = v2.useCallback(function(v42) --[[ Line: 158 ]]
            -- upvalues: l_sduiContext_0 (copy), v32 (copy)
            return l_sduiContext_0.getPageLayoutConfig(v32.collectionItemSize)(v42);
        end, {
            v32.collectionItemSize, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v41 = v5.useSignalState(v43);
    else
        v41 = l_useCollectionLayoutParams_0(v32.collectionItemSize or l_CollectionItemSize_0.Small, v38, false, if v32.layoutOverrides then v4.Dictionary.join(v32.layoutOverrides, {
            overrideLoadMoreThreshold = 1e999, 
            sideMargin = v32.pageSideMargin
        }) else {
            overrideLoadMoreThreshold = 1e999, 
            sideMargin = v32.pageSideMargin
        });
    end;
    local v44 = if v37 then #v37 else 0;
    local l_numColumns_0 = v41.numColumns;
    local v46 = l_findAnalyticsField_0("componentType", v32.analyticsContext.analyticsData or v31) or l_SduiBuilder_0.getComponentType(v32.componentConfig, l_sduiContext_0);
    local v47, v48 = v27(v32.analyticsContext, v46, l_numColumns_0, v44, l_sduiContext_0, v32.startRow, v32.componentConfig.__isClientBinding);
    local v49 = v2.useRef({});
    local v50, v51 = l_useCollectionImpressionsSignal_0(v32.scrollViewPositionChangedSignal);
    local v54 = v2.useCallback(function(_, _) --[[ Line: 203 ]]
        -- upvalues: v32 (copy), v51 (copy)
        if v32.onCollectionViewabilityChanged then
            v32.onCollectionViewabilityChanged();
        end;
        if v51 then
            v51();
        end;
    end, {
        v51, 
        v32.onCollectionViewabilityChanged
    });
    local v55 = v32.impressionsTag or v18(v32.index, v48.current, l_sduiContext_0, v32.debugName);
    local v58 = v2.useCallback(function(v56) --[[ Line: 219 ]]
        -- upvalues: v37 (copy), v47 (copy), l_SduiParseHelpers_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v55 (copy), v48 (copy), v19 (ref), v49 (copy), v32 (copy), l_reportUnifiedLoggingImpressions_0 (ref)
        if v37 == nil or #v37 == 0 then
            if v56 and #v56 > 0 then
                local v57 = if v47 then l_SduiParseHelpers_0.stringifyValue(v47.analyticsData) else nil;
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogImpressions, {
                    componentType = "CollectionGrid", 
                    name = v55, 
                    message = ("Failed to log impressions. No configs. indexes: %* analytics: %*"):format(table.concat(v56, ","), v57)
                }, l_sduiContext_0.appPage);
            end;
            return;
        else
            assert(v37, "itemConfigs must exist");
            if v48.current and v48.current.contentType == "Game" then
                v19(v56, v49.current, v37, v47, v48.current, v32.startRow, l_sduiContext_0, v32.sendGameImpressions, v48.current.itemsPerRow, v55);
            end;
            l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v56, v49.current, v48.current);
            return;
        end;
    end, {
        v37, 
        v32.startRow, 
        l_sduiContext_0, 
        v48, 
        v49, 
        v47, 
        v32.sendGameImpressions, 
        v55
    });
    v2.useLayoutEffect(function() --[[ Line: 273 ]]
        -- upvalues: v32 (copy), v58 (copy)
        if v32.setLogImpressions then
            v32.setLogImpressions(v58);
        end;
    end, {
        v58, 
        v32.setLogImpressions
    });
    local l_Scale_0 = l_useTokens_0().Config.UI.Scale;
    local v61 = v2.useCallback(function(v60) --[[ Line: 282 ]]
        -- upvalues: v32 (copy), l_Scale_0 (copy)
        return v60 * v32.itemHeightFromWidth.Scale + v32.itemHeightFromWidth.Offset * l_Scale_0;
    end, {
        v32.itemHeightFromWidth, 
        l_Scale_0
    });
    local v70 = v2.useCallback(function(v62, v63, v64, _) --[[ Line: 288 ]]
        -- upvalues: l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v55 (copy), v2 (ref), l_findAnalyticsField_0 (ref), v31 (ref), l_SduiBuilder_0 (ref), v49 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), v47 (copy), v32 (copy), l_FFlagSduiServerCompat_0 (ref), v26 (ref)
        if not v62 then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilItem, {
                componentType = "CollectionGrid", 
                name = v55, 
                message = ("Nil item in SduiCollectionGrid.renderItem at index %*"):format(v63)
            }, l_sduiContext_0.appPage);
            return v2.createElement(v2.Fragment), "nil";
        else
            local v66 = l_findAnalyticsField_0("componentType", v62.analyticsData or v31) or l_SduiBuilder_0.getComponentType(v62, l_sduiContext_0);
            if not v66 then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                    componentType = "CollectionGrid", 
                    name = v55, 
                    message = ("Nil componentType in CollectionGrid.renderItem at index %*"):format(v63)
                }, l_sduiContext_0.appPage);
                return v2.createElement(v2.Fragment), "nil";
            else
                local v67 = {
                    itemPosition = v63, 
                    itemComponentType = v66, 
                    componentType = v66
                };
                v49.current[v63] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v62.analyticsData, nil, v67, v66);
                local v68 = l_getSduiComponentWrapper_0(v62);
                local v69 = v2.createElement(v68, {
                    componentConfig = v62, 
                    sduiContext = l_sduiContext_0, 
                    parentAnalyticsContext = if v62.__isClientBinding then nil else v47, 
                    extraLocalProps = {
                        scrollViewPositionChangedSignal = v32.scrollViewPositionChangedSignal, 
                        verticalScrollingFrameRef = v32.verticalScrollingFrameRef, 
                        index = v63, 
                        SelectionOrder = if not (not not l_FFlagSduiServerCompat_0 or v32.disableSelectionOrder) and v32.selectionOrderBase then v32.selectionOrderBase + v63 else nil, 
                        selectionOrder = if not (not l_FFlagSduiServerCompat_0 or v32.disableSelectionOrder) and v32.selectionOrderBase then v32.selectionOrderBase + v63 else nil
                    }, 
                    debugName = ("%*_%*"):format(v66, v63), 
                    localAnalyticsData = v67
                });
                return v2.createElement(v26, {
                    index = v63, 
                    impressionsTag = v55, 
                    Size = if not l_FFlagSduiServerCompat_0 then v64 else nil, 
                    ZIndex = if not l_FFlagSduiServerCompat_0 then -v63 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then v64 else nil, 
                    zIndex = if l_FFlagSduiServerCompat_0 then -v63 else nil
                }, {
                    Item = v69
                }), v66 or "unknown";
            end;
        end;
    end, {
        l_sduiContext_0, 
        v32.analyticsContext, 
        v32.scrollViewPositionChangedSignal, 
        v32.verticalScrollingFrameRef, 
        v47, 
        v55, 
        v32.index, 
        v32.disableSelectionOrder, 
        v32.selectionOrderBase
    });
    local v74 = v2.useMemo(function() --[[ Line: 381 ]]
        -- upvalues: v32 (copy), v2 (ref), v47 (copy)
        local v71 = nil;
        if v32.children then
            v71 = {};
            for v72, v73 in v32.children do
                v71[v72] = v2.cloneElement(v73, {
                    parentAnalyticsContext = v47
                });
            end;
        end;
        return v71;
    end, {
        v47, 
        v32.children
    });
    local v75 = v2.useMemo(function() --[[ Line: 396 ]]
        -- upvalues: v32 (copy), v2 (ref), v47 (copy)
        if v32.headerComponent then
            return v2.cloneElement(v32.headerComponent, {
                parentAnalyticsContext = v47
            });
        else
            return nil;
        end;
    end, {
        v47, 
        v32.headerComponent
    });
    local v76 = v2.useMemo(function() --[[ Line: 405 ]]
        -- upvalues: v32 (copy), v2 (ref), v47 (copy), v38 (copy)
        if v32.focusNavActionsComponent then
            return v2.cloneElement(v32.focusNavActionsComponent, {
                parentAnalyticsContext = v47, 
                extraLocalProps = {
                    guiObject = v38
                }
            });
        else
            return nil;
        end;
    end, {
        v47, 
        v32.focusNavActionsComponent, 
        v38
    });
    return v2.createElement(v2.Fragment, nil, v4.Dictionary.join(v74 or v31, {
        CollectionGrid = v2.createElement(l_CollectionGrid_0, {
            verticalScrollingFrameRef = v32.verticalScrollingFrameRef, 
            containerRef = v39, 
            getItemHeight = v61, 
            items = v37, 
            renderItem = v70, 
            numColumns = v41.numColumns, 
            columnGap = v41.columnGap, 
            sideMargin = v41.sideMargin, 
            onViewableItemsChanged = v54, 
            LayoutOrder = v33, 
            verticalPadding = v41.verticalPadding, 
            disableRelativeGap = l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil, 
            headerComponent = v75, 
            testId = if v32.testId then v32.testId else "--sdui-collection-grid", 
            onReachedThresholdFromEnd = v32.onReachedThresholdFromEnd, 
            thresholdRowsFromBottom = v32.thresholdRowsFromBottom
        }), 
        ImpressionDetector = if v32.disableImpressionsDetector then nil else v2.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v32.startRow, 
            maxUpdatesToDelay = v32.numUpdatesToDelayImpressions, 
            wrappedComponent = if v32.shouldUseFrameBoundsForImpressions then v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v40, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v55, 
                scrollViewPositionChangedSignal = v50, 
                sendImpressions = v58, 
                dataUpdatedTimestamp = v32.sduiContext.dataUpdatedTimestamp
            }) else v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v40, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v55, 
                scrollViewPositionChangedSignal = v50, 
                sendImpressions = v58, 
                dataUpdatedTimestamp = v32.sduiContext.dataUpdatedTimestamp
            })
        }), 
        FocusNavActions = v76
    }));
end);