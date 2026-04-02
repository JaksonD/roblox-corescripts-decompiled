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
local l_FFlagSduiImpressionHandlerRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiImpressionHandlerRegistry;
local v35 = {};
return v2.memo(function(v36) --[[ Line: 139 ]] --[[ Name: SduiCollectionGrid ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagSduiServerCompat_0 (copy), v2 (copy), v35 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v5 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), v4 (copy), l_useCollectionLayout_0 (copy), l_findAnalyticsField_0 (copy), l_SduiBuilder_0 (copy), v28 (copy), l_useCollectionImpressionsSignal_0 (copy), v19 (copy), l_SduiParseHelpers_0 (copy), l_SduiErrors_0 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), l_reportUnifiedLoggingImpressions_0 (copy), v20 (copy), l_useTokens_0 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), l_getSduiComponentWrapper_0 (copy), v27 (copy), l_CollectionGrid_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), l_WaitForPropWrapper_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v37 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v36.appCompositionEnabled;
    local v38 = nil;
    v38 = if l_FFlagSduiServerCompat_0 then v36.layoutOrder else v36.LayoutOrder;
    local l_sduiContext_0 = v36.sduiContext;
    local v42 = v2.useMemo(function() --[[ Line: 153 ]]
        -- upvalues: v36 (copy), v35 (ref)
        if v36.items == nil then
            return v35;
        else
            for _, v41 in v36.items do
                if v36.itemTemplateKey and v41.templateKey == nil then
                    v41.templateKey = v36.itemTemplateKey;
                end;
            end;
            return v36.items;
        end;
    end, {
        v36.items, 
        v36.itemTemplateKey
    });
    local v43, v44 = v2.useState(nil);
    local v45 = v2.useRef(nil);
    v45.current = v43;
    local v46 = nil;
    if not l_FFlagLuaAppCompositionAlways_0 then
        if l_FFlagLuaAppLayoutParamsInContext_0 then
            local v48 = v2.useCallback(function(v47) --[[ Line: 175 ]]
                -- upvalues: l_sduiContext_0 (copy), v36 (copy)
                return l_sduiContext_0.getPageLayoutConfig(v36.collectionItemSize)(v47);
            end, {
                v36.collectionItemSize, 
                l_sduiContext_0.getPageLayoutConfig
            });
            v46 = v5.useSignalState(v48);
        else
            v46 = l_useCollectionLayoutParams_0(v36.collectionItemSize or l_CollectionItemSize_0.Small, v43, false, if v36.layoutOverrides then v4.Dictionary.join(v36.layoutOverrides, {
                overrideLoadMoreThreshold = 1e999, 
                sideMargin = v36.pageSideMargin
            }) else {
                overrideLoadMoreThreshold = 1e999, 
                sideMargin = v36.pageSideMargin
            });
        end;
    end;
    local v49 = if v42 then #v42 else 0;
    local v50 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v50 = l_useCollectionLayout_0(v36.collectionItemSize).itemsPerRow;
    end;
    local v51 = if v37 then v50 else v46.numColumns;
    local v52 = l_findAnalyticsField_0("componentType", v36.analyticsContext.analyticsData or v35) or l_SduiBuilder_0.getComponentType(v36.componentConfig, l_sduiContext_0);
    local v53, v54 = v28(v36.analyticsContext, v52, v51, v49, l_sduiContext_0, v36.startRow, v36.componentConfig.__isClientBinding);
    local v55 = v2.useRef({});
    local v56, v57 = l_useCollectionImpressionsSignal_0(v36.scrollViewPositionChangedSignal);
    local v60 = v2.useCallback(function(_, _) --[[ Line: 225 ]]
        -- upvalues: v36 (copy), v57 (copy)
        if v36.onCollectionViewabilityChanged then
            v36.onCollectionViewabilityChanged();
        end;
        if v57 then
            v57();
        end;
    end, {
        v57, 
        v36.onCollectionViewabilityChanged
    });
    local v61 = v36.impressionsTag or v19(v36.index, v54.current, l_sduiContext_0, v36.debugName);
    local v64 = v2.useCallback(function(v62) --[[ Line: 241 ]]
        -- upvalues: v42 (copy), v53 (copy), l_SduiParseHelpers_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v61 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (ref), v36 (copy), v54 (copy), l_reportUnifiedLoggingImpressions_0 (ref), v55 (copy), v20 (ref)
        if v42 == nil or #v42 == 0 then
            if v62 and #v62 > 0 then
                local v63 = if v53 then l_SduiParseHelpers_0.stringifyValue(v53.analyticsData) else nil;
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogImpressions, {
                    componentType = "CollectionGrid", 
                    name = v61, 
                    message = ("Failed to log impressions. No configs. indexes: %* analytics: %*"):format(table.concat(v62, ","), v63)
                }, l_sduiContext_0.appPage);
            end;
            return;
        else
            assert(v42, "itemConfigs must exist");
            if l_FFlagSduiImpressionHandlerRegistry_0 and (v36.impressionEventName or not v54.current or v54.current.contentType ~= "Game") and not v36.sendGameImpressions then
                l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v62, v55.current, v54.current, v36.startRow, v36.impressionEventName, v36.skipItemImpressionsLog);
                return;
            else
                if v54.current and v54.current.contentType == "Game" then
                    v20(v62, v55.current, v42, v53, v54.current, v36.startRow, l_sduiContext_0, v36.sendGameImpressions, v54.current.itemsPerRow, v61);
                end;
                l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v62, v55.current, v54.current);
                return;
            end;
        end;
    end, {
        v42, 
        v36.startRow, 
        l_sduiContext_0, 
        v54, 
        v55, 
        v53, 
        v36.sendGameImpressions, 
        v61, 
        if l_FFlagSduiImpressionHandlerRegistry_0 then v36.impressionEventName else nil, 
        if l_FFlagSduiImpressionHandlerRegistry_0 then v36.skipItemImpressionsLog else nil
    });
    v2.useLayoutEffect(function() --[[ Line: 314 ]]
        -- upvalues: v36 (copy), v64 (copy)
        if v36.setLogImpressions then
            v36.setLogImpressions(v64);
        end;
    end, {
        v64, 
        v36.setLogImpressions
    });
    local l_Scale_0 = l_useTokens_0().Config.UI.Scale;
    local v67 = v2.useCallback(function(v66) --[[ Line: 323 ]]
        -- upvalues: v36 (copy), l_Scale_0 (copy)
        return v66 * v36.itemHeightFromWidth.Scale + v36.itemHeightFromWidth.Offset * l_Scale_0;
    end, {
        v36.itemHeightFromWidth, 
        l_Scale_0
    });
    local v76 = v2.useCallback(function(v68, v69, v70, _) --[[ Line: 329 ]]
        -- upvalues: l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v61 (copy), v2 (ref), l_findAnalyticsField_0 (ref), v35 (ref), l_SduiBuilder_0 (ref), v55 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), v53 (copy), v36 (copy), l_FFlagSduiServerCompat_0 (ref), v27 (ref)
        if not v68 then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilItem, {
                componentType = "CollectionGrid", 
                name = v61, 
                message = ("Nil item in SduiCollectionGrid.renderItem at index %*"):format(v69)
            }, l_sduiContext_0.appPage);
            return v2.createElement(v2.Fragment), "nil";
        else
            local v72 = l_findAnalyticsField_0("componentType", v68.analyticsData or v35) or l_SduiBuilder_0.getComponentType(v68, l_sduiContext_0);
            if not v72 then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                    componentType = "CollectionGrid", 
                    name = v61, 
                    message = ("Nil componentType in CollectionGrid.renderItem at index %*"):format(v69)
                }, l_sduiContext_0.appPage);
                return v2.createElement(v2.Fragment), "nil";
            else
                local v73 = {
                    itemPosition = v69, 
                    itemComponentType = v72, 
                    componentType = v72
                };
                v55.current[v69] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v68.analyticsData, nil, v73, v72);
                local v74 = l_getSduiComponentWrapper_0(v68);
                local v75 = v2.createElement(v74, {
                    componentConfig = v68, 
                    sduiContext = l_sduiContext_0, 
                    parentAnalyticsContext = if v68.__isClientBinding then nil else v53, 
                    extraLocalProps = {
                        scrollViewPositionChangedSignal = v36.scrollViewPositionChangedSignal, 
                        verticalScrollingFrameRef = v36.verticalScrollingFrameRef, 
                        index = v69, 
                        SelectionOrder = if not (not not l_FFlagSduiServerCompat_0 or v36.disableSelectionOrder) and v36.selectionOrderBase then v36.selectionOrderBase + v69 else nil, 
                        selectionOrder = if not (not l_FFlagSduiServerCompat_0 or v36.disableSelectionOrder) and v36.selectionOrderBase then v36.selectionOrderBase + v69 else nil
                    }, 
                    debugName = ("%*_%*"):format(v72, v69), 
                    localAnalyticsData = v73
                });
                return v2.createElement(v27, {
                    index = v69, 
                    impressionsTag = v61, 
                    Size = if not l_FFlagSduiServerCompat_0 then v70 else nil, 
                    ZIndex = if not l_FFlagSduiServerCompat_0 then -v69 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then v70 else nil, 
                    zIndex = if l_FFlagSduiServerCompat_0 then -v69 else nil
                }, {
                    Item = v75
                }), v72 or "unknown";
            end;
        end;
    end, {
        l_sduiContext_0, 
        v36.analyticsContext, 
        v36.scrollViewPositionChangedSignal, 
        v36.verticalScrollingFrameRef, 
        v53, 
        v61, 
        v36.index, 
        v36.disableSelectionOrder, 
        v36.selectionOrderBase
    });
    local v80 = v2.useMemo(function() --[[ Line: 422 ]]
        -- upvalues: v36 (copy), v2 (ref), v53 (copy)
        local v77 = nil;
        if v36.children then
            v77 = {};
            for v78, v79 in v36.children do
                v77[v78] = v2.cloneElement(v79, {
                    parentAnalyticsContext = v53
                });
            end;
        end;
        return v77;
    end, {
        v53, 
        v36.children
    });
    local v81 = v2.useMemo(function() --[[ Line: 437 ]]
        -- upvalues: v36 (copy), v2 (ref), v53 (copy)
        if v36.headerComponent then
            return v2.cloneElement(v36.headerComponent, {
                parentAnalyticsContext = v53
            });
        else
            return nil;
        end;
    end, {
        v53, 
        v36.headerComponent
    });
    local v82 = v2.useMemo(function() --[[ Line: 446 ]]
        -- upvalues: v36 (copy), v2 (ref), v53 (copy), v43 (copy)
        if v36.focusNavActionsComponent then
            return v2.cloneElement(v36.focusNavActionsComponent, {
                parentAnalyticsContext = v53, 
                extraLocalProps = {
                    guiObject = v43
                }
            });
        else
            return nil;
        end;
    end, {
        v53, 
        v36.focusNavActionsComponent, 
        v43
    });
    return v2.createElement(v2.Fragment, nil, v4.Dictionary.join(v80 or v35, {
        CollectionGrid = v2.createElement(l_CollectionGrid_0, {
            collectionItemSize = if v37 then v36.collectionItemSize else nil, 
            verticalScrollingFrameRef = v36.verticalScrollingFrameRef, 
            containerRef = v44, 
            getItemHeight = v67, 
            items = v42, 
            renderItem = v76, 
            numColumns = if v37 then nil else v46.numColumns, 
            columnGap = if v37 then nil else v46.columnGap, 
            sideMargin = if v37 then nil else v46.sideMargin, 
            onViewableItemsChanged = v60, 
            LayoutOrder = v38, 
            verticalPadding = if v37 then nil else v46.verticalPadding, 
            disableRelativeGap = l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil, 
            headerComponent = v81, 
            testId = if v36.testId then v36.testId else "--sdui-collection-grid", 
            onReachedThresholdFromEnd = v36.onReachedThresholdFromEnd, 
            thresholdRowsFromBottom = v36.thresholdRowsFromBottom
        }), 
        ImpressionDetector = if v36.disableImpressionsDetector then nil else v2.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v36.startRow, 
            maxUpdatesToDelay = v36.numUpdatesToDelayImpressions, 
            wrappedComponent = if v36.shouldUseFrameBoundsForImpressions then v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v45, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v61, 
                scrollViewPositionChangedSignal = v56, 
                sendImpressions = v64, 
                dataUpdatedTimestamp = v36.sduiContext.dataUpdatedTimestamp
            }) else v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v45, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v61, 
                scrollViewPositionChangedSignal = v56, 
                sendImpressions = v64, 
                dataUpdatedTimestamp = v36.sduiContext.dataUpdatedTimestamp
            })
        }), 
        FocusNavActions = v82
    }));
end);