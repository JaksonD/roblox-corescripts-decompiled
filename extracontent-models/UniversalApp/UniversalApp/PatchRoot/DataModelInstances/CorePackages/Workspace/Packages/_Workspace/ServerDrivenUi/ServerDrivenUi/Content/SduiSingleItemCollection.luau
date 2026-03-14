local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local _ = require(l_Parent_0.UnifiedLogging);
local l_SendGameImpressions_0 = require(l_Parent_0.GameCollections).SendGameImpressions;
local l_WaitForPropWrapper_0 = require(l_Parent_0.GameCollections).WaitForPropWrapper;
local v8 = require(l_Parent_0.Impressions);
local l_ImpressionsTagUtility_0 = v8.ImpressionsTagUtility;
local l_ScreenSizeImpressionsTracker_0 = v8.ScreenSizeImpressionsTracker;
local v11 = require(l_Parent_0.SduiCoreSystem);
local v12 = require(l_script_FirstAncestor_0.Analytics.getImpressionsTag);
local l_reportUnifiedLoggingImpressions_0 = v11.reportUnifiedLoggingImpressions;
local l_SduiCollectionAnalyticsBuilder_0 = v11.SduiCollectionAnalyticsBuilder;
local l_findAnalyticsField_0 = v11.findAnalyticsField;
local l_SduiBuilder_0 = v11.SduiBuilder;
local l_SduiParsers_0 = v11.SduiParsers;
local l_getSduiComponentWrapper_0 = v11.getSduiComponentWrapper;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v20 = {};
return v4.memo(function(v21) --[[ Line: 77 ]] --[[ Name: SduiSingleItemCollection ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v4 (copy), v3 (copy), v20 (copy), l_findAnalyticsField_0 (copy), l_SduiBuilder_0 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), v12 (copy), l_ImpressionsTagUtility_0 (copy), l_SduiParsers_0 (copy), l_SendGameImpressions_0 (copy), l_reportUnifiedLoggingImpressions_0 (copy), l_getSduiComponentWrapper_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_WaitForPropWrapper_0 (copy)
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    if l_FFlagSduiServerCompat_0 then
        v22 = v21.layoutOrder;
        v23 = v21.anchorPoint;
        v24 = v21.automaticSize;
        v25 = v21.size;
        v26 = v21.position;
    else
        v22 = v21.LayoutOrder;
        v23 = v21.AnchorPoint;
        v24 = v21.AutomaticSize;
        v25 = v21.Size;
        v26 = v21.Position;
    end;
    local l_sduiContext_0 = v21.sduiContext;
    local l_children_0 = v21.children;
    local v29 = v4.useRef(nil);
    local v30 = v4.useRef({});
    local v31 = v4.useCallback(function() --[[ Line: 107 ]]
        -- upvalues: v29 (copy)
        return v29.current;
    end, {
        v29
    });
    local v32 = v4.useMemo(function() --[[ Line: 113 ]]
        -- upvalues: v21 (copy), v31 (copy), v3 (ref), v20 (ref)
        if v21.componentConfig.__isClientBinding then
            v21.analyticsContext.getCollectionData = v31;
        end;
        return v3.Dictionary.join(v21.analyticsContext or v20, {
            getCollectionData = v31
        });
    end, {
        v31, 
        v21.analyticsContext, 
        v21.componentConfig.__isClientBinding
    });
    v29.current = v4.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: l_findAnalyticsField_0 (ref), v21 (copy), v20 (ref), l_SduiBuilder_0 (ref), l_sduiContext_0 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref)
        local v33 = l_findAnalyticsField_0("componentType", v21.analyticsContext.analyticsData or v20) or l_SduiBuilder_0.getComponentType(v21.componentConfig, l_sduiContext_0);
        return l_SduiCollectionAnalyticsBuilder_0.buildAndValidateCollectionAnalyticsData(l_sduiContext_0, v21.analyticsContext.ancestorAnalyticsData, v21.analyticsContext.analyticsData, v33, 1, 1, nil, ("SingleItemCollection_%*"):format(v21.index), v21.startRow);
    end, {
        l_sduiContext_0, 
        v21.analyticsContext, 
        v21.componentConfig, 
        v21.index, 
        v21.startRow
    });
    local v34 = v12(v21.index, v29.current, l_sduiContext_0, v21.debugName);
    local v35 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 165 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v35 (copy), v34 (copy)
        l_ImpressionsTagUtility_0.AddTag(v35, v34, 1);
        return function() --[[ Line: 168 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v35 (ref), v34 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v35, v34, 1);
        end;
    end, {
        v35, 
        v34
    });
    local v41 = v4.useCallback(function(v36) --[[ Line: 175 ]]
        -- upvalues: v21 (copy), v29 (copy), v30 (copy), v20 (ref), v3 (ref), l_SduiParsers_0 (ref), l_sduiContext_0 (copy), v32 (copy), l_SendGameImpressions_0 (ref), l_reportUnifiedLoggingImpressions_0 (ref)
        if v21.item == nil then
            return;
        else
            assert(v21.item, "props.item must exist");
            if v29.current and (v29.current.contentType == "HeroUnit" or v29.current.contentType == "Game") and v21.item.analyticsData and v21.item.analyticsData.universeId ~= nil then
                local v37 = {};
                local v38 = v30.current or v20;
                for _, v40 in v38 do
                    table.insert(v37, (v3.Dictionary.join(v40, {
                        isSponsored = l_SduiParsers_0.safeParseBoolean(v40.adFlag, l_sduiContext_0, v32)
                    })));
                end;
                l_SendGameImpressions_0.sendFromTopicContents(l_sduiContext_0.dependencies.eventIngest, l_sduiContext_0.dependencies.appAnalytics, v36, v37, l_sduiContext_0.appPage, tostring(v29.current.collectionId), v21.index, v21.startRow, nil, nil, 1, false, "HeroUnit", nil);
            end;
            l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v36, v30.current, v29.current);
            return;
        end;
    end, {
        v21.item, 
        v21.index, 
        v21.startRow, 
        l_sduiContext_0, 
        v29, 
        v30, 
        v32
    });
    local v49 = v4.useMemo(function() --[[ Line: 245 ]]
        -- upvalues: v21 (copy), v4 (ref), v32 (copy), l_findAnalyticsField_0 (ref), v20 (ref), l_SduiBuilder_0 (ref), l_sduiContext_0 (copy), v30 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), l_FFlagSduiServerCompat_0 (ref)
        local v42 = {};
        if v21.children then
            for v43, v44 in v21.children do
                v42[v43] = v4.cloneElement(v44, {
                    parentAnalyticsContext = v32
                });
            end;
        end;
        assert(v42, "result must exist");
        if v21.item then
            local v45 = l_findAnalyticsField_0("componentType", v21.item.analyticsData or v20) or l_SduiBuilder_0.getComponentType(v21.componentConfig, l_sduiContext_0);
            local v46 = ("SingleItemCollection_%*"):format(v45);
            local v47 = {
                itemPosition = 1, 
                itemComponentType = v45
            };
            v30.current[1] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v21.item.analyticsData, nil, v47, v45);
            local v48 = l_getSduiComponentWrapper_0(v21.item);
            v42[v46] = v4.createElement(v48, {
                componentConfig = v21.item, 
                sduiContext = l_sduiContext_0, 
                parentAnalyticsContext = if v21.item.__isClientBinding then nil else v32, 
                extraLocalProps = {
                    scrollViewPositionChangedSignal = v21.scrollViewPositionChangedSignal, 
                    verticalScrollingFrameRef = v21.verticalScrollingFrameRef, 
                    index = 1, 
                    pageSideMargin = v21.pageSideMargin, 
                    SelectionOrder = if not not l_FFlagSduiServerCompat_0 or v21.disableSelectionOrder then nil else v21.selectionOrderBase, 
                    selectionOrder = if not l_FFlagSduiServerCompat_0 or v21.disableSelectionOrder then nil else v21.selectionOrderBase
                }, 
                debugName = v46, 
                localAnalyticsData = v47
            });
        end;
        return v42;
    end, {
        v21.item, 
        v21.scrollViewPositionChangedSignal, 
        v21.verticalScrollingFrameRef, 
        v29, 
        l_children_0, 
        l_sduiContext_0, 
        v21.pageSideMargin, 
        v21.disableSelectionOrder, 
        v21.selectionOrderBase
    });
    local v50 = v4.createElement(l_ScreenSizeImpressionsTracker_0, {
        parentRef = v21.verticalScrollingFrameRef, 
        pageContext = l_sduiContext_0.appPage, 
        impressionsTag = v34, 
        scrollViewPositionChangedSignal = v21.scrollViewPositionChangedSignal, 
        sendImpressions = v41, 
        dataUpdatedTimestamp = v21.sduiContext.dataUpdatedTimestamp
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = v4.createElement("Frame", {
            ref = v35, 
            Position = v26, 
            Size = v25 or UDim2.new(1, 0, 0, 0), 
            AutomaticSize = v24 or Enum.AutomaticSize.Y, 
            LayoutOrder = v22, 
            AnchorPoint = v23, 
            BackgroundTransparency = 1, 
            [v4.Tag] = "data-testid=--sdui-single-item-collection"
        }, v49), 
        ImpressionDetector = v4.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v21.startRow, 
            maxUpdatesToDelay = v21.numUpdatesToDelayImpressions, 
            wrappedComponent = v50
        })
    });
end);