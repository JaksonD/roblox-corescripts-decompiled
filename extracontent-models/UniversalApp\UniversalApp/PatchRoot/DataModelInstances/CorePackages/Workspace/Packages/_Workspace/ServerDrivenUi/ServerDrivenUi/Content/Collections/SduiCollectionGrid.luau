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
local l_FFlagSduiClientBinding_0 = require(l_Parent_0.SharedFlags).FFlagSduiClientBinding;
local l_FFlagSduiV2PaginationSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2PaginationSupport;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v33 = {};
return v2.memo(function(v34) --[[ Line: 129 ]] --[[ Name: SduiCollectionGrid ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v2 (copy), l_FFlagSduiClientBinding_0 (copy), v33 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v5 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), v4 (copy), l_findAnalyticsField_0 (copy), l_SduiBuilder_0 (copy), v27 (copy), l_useCollectionImpressionsSignal_0 (copy), v18 (copy), l_SduiParseHelpers_0 (copy), l_SduiErrors_0 (copy), v19 (copy), l_reportUnifiedLoggingImpressions_0 (copy), l_useTokens_0 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), l_getSduiComponentWrapper_0 (copy), v26 (copy), l_CollectionGrid_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), l_FFlagSduiV2PaginationSupport_0 (copy), l_WaitForPropWrapper_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v35 = nil;
    v35 = if l_FFlagSduiServerCompat_0 then v34.layoutOrder else v34.LayoutOrder;
    local l_sduiContext_0 = v34.sduiContext;
    local v39 = v2.useMemo(function() --[[ Line: 140 ]]
        -- upvalues: l_FFlagSduiClientBinding_0 (ref), v34 (copy), v33 (ref)
        if l_FFlagSduiClientBinding_0 and v34.items == nil then
            return v33;
        else
            for _, v38 in v34.items do
                if v34.itemTemplateKey and v38.templateKey == nil then
                    v38.templateKey = v34.itemTemplateKey;
                end;
            end;
            return v34.items;
        end;
    end, {
        v34.items, 
        v34.itemTemplateKey
    });
    local v40, v41 = v2.useState(nil);
    local v42 = v2.useRef(nil);
    v42.current = v40;
    local v43 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v45 = v2.useCallback(function(v44) --[[ Line: 160 ]]
            -- upvalues: l_sduiContext_0 (copy), v34 (copy)
            return l_sduiContext_0.getPageLayoutConfig(v34.collectionItemSize)(v44);
        end, {
            v34.collectionItemSize, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v43 = v5.useSignalState(v45);
    else
        v43 = l_useCollectionLayoutParams_0(v34.collectionItemSize or l_CollectionItemSize_0.Small, v40, false, if v34.layoutOverrides then v4.Dictionary.join(v34.layoutOverrides, {
            overrideLoadMoreThreshold = 1e999, 
            sideMargin = v34.pageSideMargin
        }) else {
            overrideLoadMoreThreshold = 1e999, 
            sideMargin = v34.pageSideMargin
        });
    end;
    local v46 = if v39 then #v39 else 0;
    local l_numColumns_0 = v43.numColumns;
    local v48 = l_findAnalyticsField_0("componentType", v34.analyticsContext.analyticsData or v33) or l_SduiBuilder_0.getComponentType(v34.componentConfig, l_sduiContext_0);
    local v49, v50 = v27(v34.analyticsContext, v48, l_numColumns_0, v46, l_sduiContext_0, v34.startRow, v34.componentConfig.__isClientBinding);
    local v51 = v2.useRef({});
    local v52, v53 = l_useCollectionImpressionsSignal_0(v34.scrollViewPositionChangedSignal);
    local v56 = v2.useCallback(function(_, _) --[[ Line: 205 ]]
        -- upvalues: v34 (copy), v53 (copy)
        if v34.onCollectionViewabilityChanged then
            v34.onCollectionViewabilityChanged();
        end;
        if v53 then
            v53();
        end;
    end, {
        v53, 
        v34.onCollectionViewabilityChanged
    });
    local v57 = v34.impressionsTag or v18(v34.index, v50.current, l_sduiContext_0, v34.debugName);
    local v60 = v2.useCallback(function(v58) --[[ Line: 221 ]]
        -- upvalues: v39 (copy), v49 (copy), l_SduiParseHelpers_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v57 (copy), v50 (copy), v19 (ref), v51 (copy), v34 (copy), l_reportUnifiedLoggingImpressions_0 (ref)
        if v39 == nil or #v39 == 0 then
            if v58 and #v58 > 0 then
                local v59 = if v49 then l_SduiParseHelpers_0.stringifyValue(v49.analyticsData) else nil;
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogImpressions, {
                    componentType = "CollectionGrid", 
                    name = v57, 
                    message = ("Failed to log impressions. No configs. indexes: %* analytics: %*"):format(table.concat(v58, ","), v59)
                }, l_sduiContext_0.appPage);
            end;
            return;
        else
            assert(v39, "itemConfigs must exist");
            if v50.current and v50.current.contentType == "Game" then
                v19(v58, v51.current, v39, v49, v50.current, v34.startRow, l_sduiContext_0, v34.sendGameImpressions, v50.current.itemsPerRow, v57);
            end;
            l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v58, v51.current, v50.current);
            return;
        end;
    end, {
        v39, 
        v34.startRow, 
        l_sduiContext_0, 
        v50, 
        v51, 
        v49, 
        v34.sendGameImpressions, 
        v57
    });
    v2.useLayoutEffect(function() --[[ Line: 275 ]]
        -- upvalues: v34 (copy), v60 (copy)
        if v34.setLogImpressions then
            v34.setLogImpressions(v60);
        end;
    end, {
        v60, 
        v34.setLogImpressions
    });
    local l_Scale_0 = l_useTokens_0().Config.UI.Scale;
    local v63 = v2.useCallback(function(v62) --[[ Line: 284 ]]
        -- upvalues: v34 (copy), l_Scale_0 (copy)
        return v62 * v34.itemHeightFromWidth.Scale + v34.itemHeightFromWidth.Offset * l_Scale_0;
    end, {
        v34.itemHeightFromWidth, 
        l_Scale_0
    });
    local v72 = v2.useCallback(function(v64, v65, v66, _) --[[ Line: 290 ]]
        -- upvalues: l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v57 (copy), v2 (ref), l_findAnalyticsField_0 (ref), v33 (ref), l_SduiBuilder_0 (ref), v51 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), v49 (copy), v34 (copy), l_FFlagSduiServerCompat_0 (ref), v26 (ref)
        if not v64 then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilItem, {
                componentType = "CollectionGrid", 
                name = v57, 
                message = ("Nil item in SduiCollectionGrid.renderItem at index %*"):format(v65)
            }, l_sduiContext_0.appPage);
            return v2.createElement(v2.Fragment), "nil";
        else
            local v68 = l_findAnalyticsField_0("componentType", v64.analyticsData or v33) or l_SduiBuilder_0.getComponentType(v64, l_sduiContext_0);
            if not v68 then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                    componentType = "CollectionGrid", 
                    name = v57, 
                    message = ("Nil componentType in CollectionGrid.renderItem at index %*"):format(v65)
                }, l_sduiContext_0.appPage);
                return v2.createElement(v2.Fragment), "nil";
            else
                local v69 = {
                    itemPosition = v65, 
                    itemComponentType = v68, 
                    componentType = v68
                };
                v51.current[v65] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v64.analyticsData, nil, v69, v68);
                local v70 = l_getSduiComponentWrapper_0(v64);
                local v71 = v2.createElement(v70, {
                    componentConfig = v64, 
                    sduiContext = l_sduiContext_0, 
                    parentAnalyticsContext = if v64.__isClientBinding then nil else v49, 
                    extraLocalProps = {
                        scrollViewPositionChangedSignal = v34.scrollViewPositionChangedSignal, 
                        verticalScrollingFrameRef = v34.verticalScrollingFrameRef, 
                        index = v65, 
                        SelectionOrder = if not (not not l_FFlagSduiServerCompat_0 or v34.disableSelectionOrder) and v34.selectionOrderBase then v34.selectionOrderBase + v65 else nil, 
                        selectionOrder = if not (not l_FFlagSduiServerCompat_0 or v34.disableSelectionOrder) and v34.selectionOrderBase then v34.selectionOrderBase + v65 else nil
                    }, 
                    debugName = ("%*_%*"):format(v68, v65), 
                    localAnalyticsData = v69
                });
                return v2.createElement(v26, {
                    index = v65, 
                    impressionsTag = v57, 
                    Size = if not l_FFlagSduiServerCompat_0 then v66 else nil, 
                    ZIndex = if not l_FFlagSduiServerCompat_0 then -v65 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then v66 else nil, 
                    zIndex = if l_FFlagSduiServerCompat_0 then -v65 else nil
                }, {
                    Item = v71
                }), v68 or "unknown";
            end;
        end;
    end, {
        l_sduiContext_0, 
        v34.analyticsContext, 
        v34.scrollViewPositionChangedSignal, 
        v34.verticalScrollingFrameRef, 
        v49, 
        v57, 
        v34.index, 
        v34.disableSelectionOrder, 
        v34.selectionOrderBase
    });
    local v76 = v2.useMemo(function() --[[ Line: 383 ]]
        -- upvalues: v34 (copy), v2 (ref), v49 (copy)
        local v73 = nil;
        if v34.children then
            v73 = {};
            for v74, v75 in v34.children do
                v73[v74] = v2.cloneElement(v75, {
                    parentAnalyticsContext = v49
                });
            end;
        end;
        return v73;
    end, {
        v49, 
        v34.children
    });
    local v77 = v2.useMemo(function() --[[ Line: 398 ]]
        -- upvalues: v34 (copy), v2 (ref), v49 (copy)
        if v34.headerComponent then
            return v2.cloneElement(v34.headerComponent, {
                parentAnalyticsContext = v49
            });
        else
            return nil;
        end;
    end, {
        v49, 
        v34.headerComponent
    });
    local v78 = v2.useMemo(function() --[[ Line: 407 ]]
        -- upvalues: v34 (copy), v2 (ref), v49 (copy), v40 (copy)
        if v34.focusNavActionsComponent then
            return v2.cloneElement(v34.focusNavActionsComponent, {
                parentAnalyticsContext = v49, 
                extraLocalProps = {
                    guiObject = v40
                }
            });
        else
            return nil;
        end;
    end, {
        v49, 
        v34.focusNavActionsComponent, 
        v40
    });
    return v2.createElement(v2.Fragment, nil, v4.Dictionary.join(v76 or v33, {
        CollectionGrid = v2.createElement(l_CollectionGrid_0, {
            verticalScrollingFrameRef = v34.verticalScrollingFrameRef, 
            containerRef = v41, 
            getItemHeight = v63, 
            items = v39, 
            renderItem = v72, 
            numColumns = v43.numColumns, 
            columnGap = v43.columnGap, 
            sideMargin = v43.sideMargin, 
            onViewableItemsChanged = v56, 
            LayoutOrder = v35, 
            verticalPadding = v43.verticalPadding, 
            disableRelativeGap = l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil, 
            headerComponent = v77, 
            testId = if v34.testId then v34.testId else "--sdui-collection-grid", 
            onReachedThresholdFromEnd = if l_FFlagSduiV2PaginationSupport_0 then v34.onReachedThresholdFromEnd else nil, 
            thresholdRowsFromBottom = if l_FFlagSduiV2PaginationSupport_0 then v34.thresholdRowsFromBottom else nil
        }), 
        ImpressionDetector = if v34.disableImpressionsDetector then nil else v2.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v34.startRow, 
            maxUpdatesToDelay = v34.numUpdatesToDelayImpressions, 
            wrappedComponent = if v34.shouldUseFrameBoundsForImpressions then v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v42, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v57, 
                scrollViewPositionChangedSignal = v52, 
                sendImpressions = v60, 
                dataUpdatedTimestamp = v34.sduiContext.dataUpdatedTimestamp
            }) else v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v42, 
                pageContext = l_sduiContext_0.appPage, 
                impressionsTag = v57, 
                scrollViewPositionChangedSignal = v52, 
                sendImpressions = v60, 
                dataUpdatedTimestamp = v34.sduiContext.dataUpdatedTimestamp
            })
        }), 
        FocusNavActions = v78
    }));
end);