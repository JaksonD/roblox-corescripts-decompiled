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
local l_FFlagSduiImpressionHandlerRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiImpressionHandlerRegistry;
local v21 = {};
return v4.memo(function(v22) --[[ Line: 82 ]] --[[ Name: SduiSingleItemCollection ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v4 (copy), v3 (copy), v21 (copy), l_findAnalyticsField_0 (copy), l_SduiBuilder_0 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), v12 (copy), l_ImpressionsTagUtility_0 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), l_reportUnifiedLoggingImpressions_0 (copy), l_SduiParsers_0 (copy), l_SendGameImpressions_0 (copy), l_getSduiComponentWrapper_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_WaitForPropWrapper_0 (copy)
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    if l_FFlagSduiServerCompat_0 then
        v23 = v22.layoutOrder;
        v24 = v22.anchorPoint;
        v25 = v22.automaticSize;
        v26 = v22.size;
        v27 = v22.position;
    else
        v23 = v22.LayoutOrder;
        v24 = v22.AnchorPoint;
        v25 = v22.AutomaticSize;
        v26 = v22.Size;
        v27 = v22.Position;
    end;
    local l_sduiContext_0 = v22.sduiContext;
    local l_children_0 = v22.children;
    local v30 = v4.useRef(nil);
    local v31 = v4.useRef({});
    local v32 = v4.useCallback(function() --[[ Line: 112 ]]
        -- upvalues: v30 (copy)
        return v30.current;
    end, {
        v30
    });
    local v33 = v4.useMemo(function() --[[ Line: 118 ]]
        -- upvalues: v22 (copy), v32 (copy), v3 (ref), v21 (ref)
        if v22.componentConfig.__isClientBinding then
            v22.analyticsContext.getCollectionData = v32;
        end;
        return v3.Dictionary.join(v22.analyticsContext or v21, {
            getCollectionData = v32
        });
    end, {
        v32, 
        v22.analyticsContext, 
        v22.componentConfig.__isClientBinding
    });
    v30.current = v4.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: l_findAnalyticsField_0 (ref), v22 (copy), v21 (ref), l_SduiBuilder_0 (ref), l_sduiContext_0 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref)
        local v34 = l_findAnalyticsField_0("componentType", v22.analyticsContext.analyticsData or v21) or l_SduiBuilder_0.getComponentType(v22.componentConfig, l_sduiContext_0);
        return l_SduiCollectionAnalyticsBuilder_0.buildAndValidateCollectionAnalyticsData(l_sduiContext_0, v22.analyticsContext.ancestorAnalyticsData, v22.analyticsContext.analyticsData, v34, 1, 1, nil, ("SingleItemCollection_%*"):format(v22.index), v22.startRow);
    end, {
        l_sduiContext_0, 
        v22.analyticsContext, 
        v22.componentConfig, 
        v22.index, 
        v22.startRow
    });
    local v35 = v12(v22.index, v30.current, l_sduiContext_0, v22.debugName);
    local v36 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 170 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v36 (copy), v35 (copy)
        l_ImpressionsTagUtility_0.AddTag(v36, v35, 1);
        return function() --[[ Line: 173 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v36 (ref), v35 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v36, v35, 1);
        end;
    end, {
        v36, 
        v35
    });
    local v42 = v4.useCallback(function(v37) --[[ Line: 180 ]]
        -- upvalues: v22 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (ref), v30 (copy), l_reportUnifiedLoggingImpressions_0 (ref), l_sduiContext_0 (copy), v31 (copy), v21 (ref), v3 (ref), l_SduiParsers_0 (ref), v33 (copy), l_SendGameImpressions_0 (ref)
        if v22.item == nil then
            return;
        else
            assert(v22.item, "props.item must exist");
            if l_FFlagSduiImpressionHandlerRegistry_0 and (v22.impressionEventName or not v30.current or v30.current.contentType ~= "Game") then
                l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v37, v31.current, v30.current, v22.startRow, v22.impressionEventName, v22.skipItemImpressionsLog);
                return;
            else
                if v30.current and (v30.current.contentType == "HeroUnit" or v30.current.contentType == "Game") and v22.item.analyticsData and v22.item.analyticsData.universeId ~= nil then
                    local v38 = {};
                    local v39 = v31.current or v21;
                    for _, v41 in v39 do
                        table.insert(v38, (v3.Dictionary.join(v41, {
                            isSponsored = l_SduiParsers_0.safeParseBoolean(v41.adFlag, l_sduiContext_0, v33)
                        })));
                    end;
                    l_SendGameImpressions_0.sendFromTopicContents(l_sduiContext_0.dependencies.eventIngest, l_sduiContext_0.dependencies.appAnalytics, v37, v38, l_sduiContext_0.appPage, tostring(v30.current.collectionId), v22.index, v22.startRow, nil, nil, 1, false, "HeroUnit", nil);
                end;
                l_reportUnifiedLoggingImpressions_0(l_sduiContext_0, v37, v31.current, v30.current);
                return;
            end;
        end;
    end, {
        v22.item, 
        v22.index, 
        v22.startRow, 
        l_sduiContext_0, 
        v30, 
        v31, 
        v33, 
        if l_FFlagSduiImpressionHandlerRegistry_0 then v22.impressionEventName else nil, 
        if l_FFlagSduiImpressionHandlerRegistry_0 then v22.skipItemImpressionsLog else nil
    });
    local v50 = v4.useMemo(function() --[[ Line: 270 ]]
        -- upvalues: v22 (copy), v4 (ref), v33 (copy), l_findAnalyticsField_0 (ref), v21 (ref), l_SduiBuilder_0 (ref), l_sduiContext_0 (copy), v31 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), l_getSduiComponentWrapper_0 (ref), l_FFlagSduiServerCompat_0 (ref)
        local v43 = {};
        if v22.children then
            for v44, v45 in v22.children do
                v43[v44] = v4.cloneElement(v45, {
                    parentAnalyticsContext = v33
                });
            end;
        end;
        assert(v43, "result must exist");
        if v22.item then
            local v46 = l_findAnalyticsField_0("componentType", v22.item.analyticsData or v21) or l_SduiBuilder_0.getComponentType(v22.componentConfig, l_sduiContext_0);
            local v47 = ("SingleItemCollection_%*"):format(v46);
            local v48 = {
                itemPosition = 1, 
                itemComponentType = v46
            };
            v31.current[1] = l_SduiCollectionAnalyticsBuilder_0.buildAndValidateItemAnalyticsData(l_sduiContext_0, v22.item.analyticsData, nil, v48, v46);
            local v49 = l_getSduiComponentWrapper_0(v22.item);
            v43[v47] = v4.createElement(v49, {
                componentConfig = v22.item, 
                sduiContext = l_sduiContext_0, 
                parentAnalyticsContext = if v22.item.__isClientBinding then nil else v33, 
                extraLocalProps = {
                    scrollViewPositionChangedSignal = v22.scrollViewPositionChangedSignal, 
                    verticalScrollingFrameRef = v22.verticalScrollingFrameRef, 
                    index = 1, 
                    pageSideMargin = v22.pageSideMargin, 
                    SelectionOrder = if not not l_FFlagSduiServerCompat_0 or v22.disableSelectionOrder then nil else v22.selectionOrderBase, 
                    selectionOrder = if not l_FFlagSduiServerCompat_0 or v22.disableSelectionOrder then nil else v22.selectionOrderBase
                }, 
                debugName = v47, 
                localAnalyticsData = v48
            });
        end;
        return v43;
    end, {
        v22.item, 
        v22.scrollViewPositionChangedSignal, 
        v22.verticalScrollingFrameRef, 
        v30, 
        l_children_0, 
        l_sduiContext_0, 
        v22.pageSideMargin, 
        v22.disableSelectionOrder, 
        v22.selectionOrderBase
    });
    local v51 = v4.createElement(l_ScreenSizeImpressionsTracker_0, {
        parentRef = v22.verticalScrollingFrameRef, 
        pageContext = l_sduiContext_0.appPage, 
        impressionsTag = v35, 
        scrollViewPositionChangedSignal = v22.scrollViewPositionChangedSignal, 
        sendImpressions = v42, 
        dataUpdatedTimestamp = v22.sduiContext.dataUpdatedTimestamp
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = v4.createElement("Frame", {
            ref = v36, 
            Position = v27, 
            Size = v26 or UDim2.new(1, 0, 0, 0), 
            AutomaticSize = v25 or Enum.AutomaticSize.Y, 
            LayoutOrder = v23, 
            AnchorPoint = v24, 
            BackgroundTransparency = 1, 
            [v4.Tag] = "data-testid=--sdui-single-item-collection"
        }, v50), 
        ImpressionDetector = v4.createElement(l_WaitForPropWrapper_0, {
            waitForProp = v22.startRow, 
            maxUpdatesToDelay = v22.numUpdatesToDelayImpressions, 
            wrappedComponent = v51
        })
    });
end);