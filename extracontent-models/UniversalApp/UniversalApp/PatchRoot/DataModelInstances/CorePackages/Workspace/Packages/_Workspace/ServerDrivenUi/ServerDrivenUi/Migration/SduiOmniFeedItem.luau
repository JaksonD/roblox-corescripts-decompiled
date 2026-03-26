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
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local v14 = game:DefineFastInt("SduiOmniFeedItemLogDelayMs", 500) / 1000;
local v15 = require(l_script_FirstAncestor_0.DataStore.useSduiItemCollectionSignal);
return v3.memo(function(v16) --[[ Line: 45 ]] --[[ Name: SduiOmniFeedItem ]]
    -- upvalues: l_OmniFeedPropsKey_0 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v2 (copy), v3 (copy), l_usePageSideMargin_0 (copy), l_AppPage_0 (copy), v15 (copy), v14 (copy), l_SduiErrors_0 (copy), l_getSduiComponentWrapper_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy)
    local l_appPage_0 = v16[l_OmniFeedPropsKey_0].appPage;
    local l_feedItemStartRow_0 = v16[l_OmniFeedPropsKey_0].feedItemStartRow;
    local l_verticalScrollingFrameRef_0 = v16[l_OmniFeedPropsKey_0].verticalScrollingFrameRef;
    local l_scrollViewPositionChangedSignal_0 = v16[l_OmniFeedPropsKey_0].scrollViewPositionChangedSignal;
    local l_sduiContext_0 = v16[l_OmniFeedPropsKey_0].sduiContext;
    local l_selectionOrderBase_0 = v16[l_OmniFeedPropsKey_0].selectionOrderBase;
    local v23 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v16[l_OmniFeedPropsKey_0].appCompositionEnabled else nil;
    v2.assert(l_appPage_0 ~= nil, "appPage must exist");
    v2.assert(v16.topicId ~= nil, "topicId id must exist");
    v2.assert(v16.sortIndex ~= nil, "sortIndex id must exist");
    local v24 = v3.useRef(false);
    v3.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v24 (copy)
        v24.current = true;
        return function() --[[ Line: 64 ]]
            -- upvalues: v24 (ref)
            v24.current = false;
        end;
    end, {});
    local v25 = if not l_FFlagLuaAppCompositionAlways_0 then l_usePageSideMargin_0(l_verticalScrollingFrameRef_0.current) else nil;
    local v26 = v3.useMemo(function() --[[ Line: 72 ]]
        -- upvalues: l_appPage_0 (copy), l_AppPage_0 (ref), v16 (copy)
        if l_appPage_0 == l_AppPage_0.SearchPage and v16.searchUuid then
            return (("%*_%*"):format(l_appPage_0, v16.searchUuid));
        else
            return nil;
        end;
    end, {
        l_appPage_0, 
        v16.searchUuid
    });
    local v27 = v15(l_appPage_0, v16.topicId, v16.sortIndex, v26);
    local v28 = v27 and v27.sduiConfig or nil;
    local v29 = v3.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v16 (copy)
        return {
            collectionPosition = v16.sortIndex
        };
    end, {
        v16.sortIndex
    });
    local v30 = ("SduiOmniFeedItem-%*"):format(v16.topicId);
    local v31 = v3.useRef(v28);
    v31.current = v28;
    if v28 == nil then
        task.delay(v14, function() --[[ Line: 94 ]]
            -- upvalues: v24 (copy), v31 (copy), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), v30 (copy), v16 (copy)
            if v24.current and v31.current == nil then
                l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentConfig, {
                    name = v30, 
                    message = ("Unable to render omni feed item for sdui. CollectionId: %*"):format(v16.topicId)
                }, l_sduiContext_0.appPage);
            end;
        end);
    end;
    return (v3.useMemo(function() --[[ Line: 106 ]]
        -- upvalues: v28 (copy), l_getSduiComponentWrapper_0 (ref), v3 (ref), v30 (copy), l_sduiContext_0 (copy), l_scrollViewPositionChangedSignal_0 (copy), l_verticalScrollingFrameRef_0 (copy), v16 (copy), v23 (copy), v25 (copy), l_feedItemStartRow_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (ref), l_selectionOrderBase_0 (copy), l_FFlagLuaAppCompositionSupport_0 (ref), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (ref), l_OmniFeedPropsKey_0 (ref), v29 (copy)
        if v28 == nil then
            return nil;
        else
            local v32 = l_getSduiComponentWrapper_0(v28);
            return v3.createElement(v32, {
                debugName = v30, 
                componentConfig = v28, 
                sduiContext = l_sduiContext_0, 
                extraLocalProps = {
                    scrollViewPositionChangedSignal = l_scrollViewPositionChangedSignal_0, 
                    verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
                    index = v16.sortIndex, 
                    collectionPosition = v16.sortIndex, 
                    pageSideMargin = if v23 then nil else v25, 
                    startRow = l_feedItemStartRow_0, 
                    numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
                    selectionOrderBase = l_selectionOrderBase_0, 
                    appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v23 else nil, 
                    onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v16[l_OmniFeedPropsKey_0].onTileImageLoaded else nil
                }, 
                localAnalyticsData = v29
            });
        end;
    end, {
        v28, 
        v30, 
        v29, 
        l_feedItemStartRow_0, 
        v25, 
        v16.topicId, 
        v16.sortIndex, 
        l_scrollViewPositionChangedSignal_0, 
        l_verticalScrollingFrameRef_0, 
        l_sduiContext_0, 
        l_selectionOrderBase_0, 
        if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v16[l_OmniFeedPropsKey_0].onTileImageLoaded else nil
    }));
end);