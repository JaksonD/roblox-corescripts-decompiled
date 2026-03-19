local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.React);
local l_OmniFeedPropsKey_0 = require(l_Parent_0.DiscoveryTypes).OmniFeedPropsKey;
local l_usePageSideMargin_0 = require(l_Parent_0.CollectionViews).usePageSideMargin;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v7 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrors_0 = v7.SduiErrors;
local l_getSduiComponentWrapper_0 = v7.getSduiComponentWrapper;
local l_FIntLuaAppDelayImpressionsMaxUpdates_0 = require(l_Parent_0.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates;
local v11 = game:DefineFastInt("SduiOmniFeedItemLogDelayMs", 500) / 1000;
local v12 = require(l_script_FirstAncestor_0.DataStore.useSduiItemCollectionSignal);
return v3.memo(function(v13) --[[ Line: 41 ]] --[[ Name: SduiOmniFeedItem ]]
    -- upvalues: l_OmniFeedPropsKey_0 (copy), v2 (copy), v3 (copy), l_usePageSideMargin_0 (copy), l_AppPage_0 (copy), v12 (copy), v11 (copy), l_SduiErrors_0 (copy), l_getSduiComponentWrapper_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy)
    local l_appPage_0 = v13[l_OmniFeedPropsKey_0].appPage;
    local l_feedItemStartRow_0 = v13[l_OmniFeedPropsKey_0].feedItemStartRow;
    local l_verticalScrollingFrameRef_0 = v13[l_OmniFeedPropsKey_0].verticalScrollingFrameRef;
    local l_scrollViewPositionChangedSignal_0 = v13[l_OmniFeedPropsKey_0].scrollViewPositionChangedSignal;
    local l_sduiContext_0 = v13[l_OmniFeedPropsKey_0].sduiContext;
    local l_selectionOrderBase_0 = v13[l_OmniFeedPropsKey_0].selectionOrderBase;
    v2.assert(l_appPage_0 ~= nil, "appPage must exist");
    v2.assert(v13.topicId ~= nil, "topicId id must exist");
    v2.assert(v13.sortIndex ~= nil, "sortIndex id must exist");
    local v20 = v3.useRef(false);
    v3.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v20 (copy)
        v20.current = true;
        return function() --[[ Line: 56 ]]
            -- upvalues: v20 (ref)
            v20.current = false;
        end;
    end, {});
    local v21 = l_usePageSideMargin_0(l_verticalScrollingFrameRef_0.current);
    local v22 = v3.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: l_appPage_0 (copy), l_AppPage_0 (ref), v13 (copy)
        if l_appPage_0 == l_AppPage_0.SearchPage and v13.searchUuid then
            return (("%*_%*"):format(l_appPage_0, v13.searchUuid));
        else
            return nil;
        end;
    end, {
        l_appPage_0, 
        v13.searchUuid
    });
    local v23 = v12(l_appPage_0, v13.topicId, v13.sortIndex, v22);
    local v24 = v23 and v23.sduiConfig or nil;
    local v25 = v3.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v13 (copy)
        return {
            collectionPosition = v13.sortIndex
        };
    end, {
        v13.sortIndex
    });
    local v26 = ("SduiOmniFeedItem-%*"):format(v13.topicId);
    local v27 = v3.useRef(v24);
    v27.current = v24;
    if v24 == nil then
        task.delay(v11, function() --[[ Line: 84 ]]
            -- upvalues: v20 (copy), v27 (copy), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v26 (copy), v13 (copy)
            if v20.current and v27.current == nil then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentConfig, {
                    name = v26, 
                    message = ("Unable to render omni feed item for sdui. CollectionId: %*"):format(v13.topicId)
                }, l_sduiContext_0.appPage);
            end;
        end);
    end;
    return (v3.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v24 (copy), l_getSduiComponentWrapper_0 (ref), v3 (ref), v26 (copy), l_sduiContext_0 (copy), l_scrollViewPositionChangedSignal_0 (copy), l_verticalScrollingFrameRef_0 (copy), v13 (copy), v21 (copy), l_feedItemStartRow_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (ref), l_selectionOrderBase_0 (copy), v25 (copy)
        if v24 == nil then
            return nil;
        else
            local v28 = l_getSduiComponentWrapper_0(v24);
            return v3.createElement(v28, {
                debugName = v26, 
                componentConfig = v24, 
                sduiContext = l_sduiContext_0, 
                extraLocalProps = {
                    scrollViewPositionChangedSignal = l_scrollViewPositionChangedSignal_0, 
                    verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
                    index = v13.sortIndex, 
                    collectionPosition = v13.sortIndex, 
                    pageSideMargin = v21, 
                    startRow = l_feedItemStartRow_0, 
                    numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
                    selectionOrderBase = l_selectionOrderBase_0
                }, 
                localAnalyticsData = v25
            });
        end;
    end, {
        v24, 
        v26, 
        v25, 
        l_feedItemStartRow_0, 
        v21, 
        v13.topicId, 
        v13.sortIndex, 
        l_scrollViewPositionChangedSignal_0, 
        l_verticalScrollingFrameRef_0, 
        l_sduiContext_0, 
        l_selectionOrderBase_0
    }));
end);