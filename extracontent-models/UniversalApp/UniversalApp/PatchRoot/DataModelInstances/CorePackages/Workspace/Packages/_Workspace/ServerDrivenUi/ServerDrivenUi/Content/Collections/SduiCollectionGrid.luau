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
local l_useCollectionLayout_0 = v6.useCollectionLayout;
local l_useCollectionLayoutParams_0 = v6.useCollectionLayoutParams;
local l_WaitForPropWrapper_0 = require(l_Parent_0.GameCollections).WaitForPropWrapper;
local v13 = require(l_Parent_0.Impressions);
local l_FrameBoundsImpressionsTracker_0 = v13.FrameBoundsImpressionsTracker;
local l_ScreenSizeImpressionsTracker_0 = v13.ScreenSizeImpressionsTracker;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v17 = require(l_Parent_0.SduiCoreSystem);
local l_findAnalyticsField_0 = v17.findAnalyticsField;
local v19 = require(l_script_FirstAncestor_0.Analytics.getImpressionsTag);
local v20 = require(l_script_FirstAncestor_0.Analytics.sendLegacyGameImpressionsForSdui);
local l_reportUnifiedLoggingImpressions_0 = v17.reportUnifiedLoggingImpressions;
local l_SduiBuilder_0 = v17.SduiBuilder;
local l_SduiCollectionAnalyticsBuilder_0 = v17.SduiCollectionAnalyticsBuilder;
local l_SduiErrors_0 = v17.SduiErrors;
local l_SduiParseHelpers_0 = v17.SduiParseHelpers;
local l_getSduiComponentWrapper_0 = v17.getSduiComponentWrapper;
local v27 = require(l_script_FirstAncestor_0.Content.Collections.SduiCollectionItem);
local v28 = require(l_script_FirstAncestor_0.Content.Collections.useCollectionAnalyticsContext);
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v34 = {};
return v2.memo(function(v35) --[[ Line: 134 ]] --[[ Name: SduiCollectionGrid ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagSduiServerCompat_0 (copy), v2 (copy), v34 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v5 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), v4 (copy), l_useCollectionLayout_0 (copy), l_findAnalyticsField_0 (copy), l_SduiBuilder_0 (copy), v28 (copy), l_useCollectionImpressionsSignal_0 (copy), v19 (copy), l_SduiParseHelpers_0 (copy), l_SduiErrors_0 (copy), v20 (copy), l_reportUnifiedLoggingImpressions_0 (copy), l_useTokens_0 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), l_getSduiComponentWrapper_0 (copy), v27 (copy), l_CollectionGrid_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), l_WaitForPropWrapper_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v36 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v35.appCompositionEnabled;
    local v37 = nil;
    v37 = if l_FFlagSduiServerCompat_0 then v35.layoutOrder else v35.LayoutOrder;
    local l_sduiContext_0 = v35.sduiContext;
    local v41 = v2.useMemo(function() --[[ Line: 148 ]]
        -- upvalues: v35 (copy), v34 (ref)
        if v35.items == nil then
            return v34;
        else
            for _, v40 in v35.items do
                if v35.itemTemplateKey and v40.templateKey == nil then
                    v40.templateKey = v35.itemTemplateKey;
                end;
            end;
            return v35.items;
        end;
    end, {
        v35.items, 
        v35.itemTemplateKey
    });
    local v42, v43 = v2.useState(nil);
    local v44 = v2.useRef(nil);
    v44.current = v42;
    local v45 = nil;
    if not l_FFlagLuaAppCompositionAlways_0 then
        if l_FFlagLuaAppLayoutParamsInContext_0 then
            local v47 = v2.useCallback(function(v46) --[[ Line: 170 ]]
                -- upvalues: l_sduiContext_0 (copy), v35 (copy)
                return l_sduiContext_0.getPageLayoutConfig(v35.collectionItemSize)(v46);
            end, {
                v35.collectionItemSize, 
                l_sduiContext_0.getPageLayoutConfig
            });
            v45 = v5.useSignalState(v47);
        else
            v45 = l_useCollectionLayoutParams_0(v35.collectionItemSize or l_CollectionItemSize_0.Small, v42, false, if v35.layoutOverrides then v4.Dictionary.join(v35.layoutOverrides, {
                overrideLoadMoreThreshold = 1e999, 
                sideMargin = v35.pageSideMargin
            }) else {
                overrideLoadMoreThreshold = 1e999, 
                sideMargin = v35.pageSideMargin
            });
        end;
    end;
    local v48 = if v41 then #v41 else 0;
    local v49 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v49 = l_useCollectionLayout_0(v35.collectionItemSize).itemsPerRow;
    end;
    local v50 = if v36 then v49 else v45.numColumns;
    local v51 = l_findAnalyticsField_0("componentType", v35.analyticsContext.analyticsData or v34) or l_SduiBuilder_0.getComponentType(v35.componentConfig, l_sduiContext_0);
    local v52, v53 = v28(v35.analyticsContext, v51, v50, v48, l_sduiContext_0, v35.startRow, v35.componentConfig.__isClientBinding);
    local v54 = v2.useRef({});
    local v55, v56 = l_useCollectionImpressionsSignal_0(v35.scrollViewPositionChangedSignal);
    local v59 = v2.useCallback(function(_, _) --[[ Line: 220 ]]
        -- upvalues: v35 (copy), v56 (copy)
        if v35.onCollectionViewabilityChanged then
            v35.onCollectionViewabilityChanged();
        end;
        if v56 then
            v56();
        end;
    end, {
        v56, 
        v35.onCollectionViewabilityChanged
    });
    local v60 = v35.impressionsTag or v19(v35.index, v53.current, l_sduiContext_0, v35.debugName);
    local v63 = v2.useCallback(function(v61) --[[ Line: 236 ]]
        -- upvalues: v41 (copy), v52 (copy), l_SduiParseHelpers_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v60 (copy), v53 (copy), v20 (ref), v54 (copy), v35 (copy), l_reportUnifiedLoggingImpressions_0 (ref)
        if v41 == nil or #v41 == 0 then
            if v61 and #v61 > 0 then
                local v62 = if v52 then l_SduiParseHelpers_0.stringifyValue(v52.analyticsData) else nil;
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogImpressions, {
                    componentType = "CollectionGrid", 
                    name = v60, 
                    message = ("Failed to log impressions. No configs. indexes: %* analytics: %*"):format(table.concat(v61, ","), v62)
                }, l_sduiContext_0.appPage);
            end;
            return;
        else
            assert(v41, "itemConfigs must exist");
            if v53.current and v53.current.contentType == "Game" then
                v20(v61, v54.current, v41, v52, v53.current, v35.startRow, l_sduiContext_0, v35.sendGameImpressions, v53.current.itemsPerRow, v60);
            end;
            l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v61, v54.current, v53.current);
            return;
        end;
    end, {
        v41, 
        v35.startRow, 
        l_sduiContext_0, 
        v53, 
        v54, 
        v52, 
        v35.sendGameImpressions, 
        v60
    });
    v2.useLayoutEffect(function() --[[ Line: 290 ]]
        -- upvalues: v35 (copy), v63 (copy)
        if v35.setLogImpressions then
            v35.setLogImpressions(v63);
        end;
    end, {
        v63, 
        v35.setLogImpressions
    });
    local l_Scale_0 = l_useTokens_0().Config.UI.Scale;
    local v66 = v2.useCallback(function(v65) --[[ Line: 299 ]]
        -- upvalues: v35 (copy), l_Scale_0 (copy)
        return v65 * v35.itemHeightFromWidth.Scale + v35.itemHeightFromWidth.Offset * l_Scale_0;
    end, {
        v35.itemHeightFromWidth, 
        l_Scale_0
    });
    local v75 = v2.useCallback(function(v67, v68, v69, _) --[[ Line: 305 ]]
        -- upvalues: l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v60 (copy), v2 (ref), l_findAnalyticsField_0 (ref), v34 (ref), l_SduiBuilder_0 (ref), v54 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), v52 (copy), v35 (copy), l_FFlagSduiServerCompat_0 (ref), v27 (ref)
        if not v67 then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilItem, {
                componentType = "CollectionGrid", 
                name = v60, 
                message = ("Nil item in SduiCollectionGrid.renderItem at index %*"):format(v68)
            }, l_sduiContext_0.appPage);
            return v2.createElement(v2.Fragment), "nil";
        else
            local v71 = l_findAnalyticsField_0("componentType", v67.analyticsData or v34) or l_SduiBuilder_0.getComponentType(v67, l_sduiContext_0);
            if not v71 then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                    componentType = "CollectionGrid", 
                    name = v60, 
                    message = ("Nil componentType in CollectionGrid.renderItem at index %*"):format(v68)
                }, l_sduiContext_0.appPage);
                return v2.createElement(v2.Fragment), "nil";
            else
                local v72 = {
                    itemPosition = v68, 
                    itemComponentType = v71, 
                    componentType = v71
                };
                v54.current[v68] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v67.analyticsData, nil, v72, v71);
                local v73 = l_getSduiComponentWrapper_0(v67);
                local v74 = v2.createElement(v73, {
                    componentConfig = v67, 
                    sduiContext = l_sduiContext_0, 
                    parentAnalyticsContext = if v67.__isClientBinding then nil else v52, 
                    extraLocalProps = {
                        scrollViewPositionChangedSignal = v35.scrollViewPositionChangedSignal, 
                        verticalScrollingFrameRef = v35.verticalScrollingFrameRef, 
                        index = v68, 
                        SelectionOrder = if not (not not l_FFlagSduiServerCompat_0 or v35.disableSelectionOrder) and v35.selectionOrderBase then v35.selectionOrderBase + v68 else nil, 
                        selectionOrder = if not (not l_FFlagSduiServerCompat_0 or v35.disableSelectionOrder) and v35.selectionOrderBase then v35.selectionOrderBase + v68 else nil
                    }, 
                    debugName = ("%*_%*"):format(v71, v68), 
                    localAnalyticsData = v72
                });
                return v2.createElement(v27, {
                    index = v68, 
                    impressionsTag = v60, 
                    Size = if not l_FFlagSduiServerCompat_0 then v69 else nil, 
                    ZIndex = if not l_FFlagSduiServerCompat_0 then -v68 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then v69 else nil, 
                    zIndex = if l_FFlagSduiServerCompat_0 then -v68 else nil
                }, {
                    Item = v74
                }), v71 or "unknown";
            end;
        end;
    end, {
        l_sduiContext_0, 
        v35.analyticsContext, 
        v35.scrollViewPositionChangedSignal, 
        v35.verticalScrollingFrameRef, 
        v52, 
        v60, 
        v35.index, 
        v35.disableSelectionOrder, 
        v35.selectionOrderBase
    });
    local v79 = v2.useMemo(function() --[[ Line: 398 ]]
        -- upvalues: v35 (copy), v2 (ref), v52 (copy)
        local v76 = nil;
        if v35.children then
            v76 = {};
            for v77, v78 in v35.children do
                v76[v77] = v2.cloneElement(v78, {
                    parentAnalyticsContext = v52
                });
            end;
        end;
        return v76;
    end, {
        v52, 
        v35.children
    });
    local v80 = v2.useMemo(function() --[[ Line: 413 ]]
        -- upvalues: v35 (copy), v2 (ref), v52 (copy)
        if v35.headerComponent then
            return v2.cloneElement(v35.headerComponent, {
                parentAnalyticsContext = v52
            });
        else
            return nil;
        end;
    end, {
        v52, 
        v35.headerComponent
    });
    local v81 = v2.useMemo(function() --[[ Line: 422 ]]
        -- upvalues: v35 (copy), v2 (ref), v52 (copy), v42 (copy)
        if v35.focusNavActionsComponent then
            return v2.cloneElement(v35.focusNavActionsComponent, {
                parentAnalyticsContext = v52, 
                extraLocalProps = {
                    guiObject = v42
                }
            });
        else
            return nil;
        end;
    end, {
        v52, 
        v35.focusNavActionsComponent, 
        v42
    });
    return v2.createElement(v2.Fragment, nil, v4.Dictionary.join(v79 or v34, {
        CollectionGrid = v2.createElement(l_CollectionGrid_0, {
            collectionItemSize = if v36 then v35.collectionItemSize else nil, 
            verticalScrollingFrameRef = v35.verticalScrollingFrameRef, 
            containerRef = v43, 
            getItemHeight = v66, 
            items = v41, 
            renderItem = v75, 
            numColumns = if v36 then nil else v45.numColumns, 
            columnGap = if v36 then nil else v45.columnGap, 
            sideMargin = if v36 then nil else v45.sideMargin, 
            onViewableItemsChanged = v59, 
            LayoutOrder = v37, 
            verticalPadding = if v36 then nil else v45.verticalPadding, 
            disableRelativeGap = l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil, 
            headerComponent = v80, 
            testId = if v35.testId then v35.testId else "--sdui-collection-grid", 
            onReachedThresholdFromEnd = v35.onReachedThresholdFromEnd, 
            thresholdRowsFromBottom = v35.thresholdRowsFromBottom
        }), 
        ImpressionDetector = if v35.disableImpressionsDetector then nil else v2.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v35.startRow, 
            maxUpdatesToDelay = v35.numUpdatesToDelayImpressions, 
            wrappedComponent = if v35.shouldUseFrameBoundsForImpressions then v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v44, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v60, 
                scrollViewPositionChangedSignal = v55, 
                sendImpressions = v63, 
                dataUpdatedTimestamp = v35.sduiContext.dataUpdatedTimestamp
            }) else v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v44, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v60, 
                scrollViewPositionChangedSignal = v55, 
                sendImpressions = v63, 
                dataUpdatedTimestamp = v35.sduiContext.dataUpdatedTimestamp
            })
        }), 
        FocusNavActions = v81
    }));
end);