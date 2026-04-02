local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.tutils);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Parent_0.SduiCoreSystem);
local l_SduiBuilder_0 = v6.SduiBuilder;
local l_SduiComponentType_0 = v6.SduiComponentType;
local v9 = require(l_script_FirstAncestor_0.Rodux.SduiConfigReducer);
local l_SduiComponent_0 = v6.SduiComponent;
local l_SduiErrors_0 = v6.SduiErrors;
local l_SduiParsers_0 = v6.SduiParsers;
local v13 = require(l_script_FirstAncestor_0.System.useSduiContext);
local l_useCollectionLayoutConfig_0 = require(l_Parent_0.CollectionViews).useCollectionLayoutConfig;
local l_FIntLuaAppDelayImpressionsMaxUpdates_0 = require(l_Parent_0.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates;
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local l_FFlagSduiImpressionHandlerRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiImpressionHandlerRegistry;
return v3.memo(function(v20) --[[ Line: 51 ]] --[[ Name: SduiSeeAllGrid ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v2 (copy), l_useSelector_0 (copy), v9 (copy), v4 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useCollectionLayoutConfig_0 (copy), v13 (copy), v3 (copy), l_SduiErrors_0 (copy), l_SduiBuilder_0 (copy), l_SduiParsers_0 (copy), l_SduiComponentType_0 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), l_SduiComponent_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy)
    local v21 = nil;
    v21 = if l_FFlagSduiServerCompat_0 then v20.layoutOrder else v20.LayoutOrder;
    local l_verticalScrollingFrameRef_0 = v20.verticalScrollingFrameRef;
    local l_scrollViewPositionChangedSignal_0 = v20.scrollViewPositionChangedSignal;
    v2.assert(v20.collectionId ~= nil, "collectionId id must exist");
    v2.assert(v20.collectionIndex ~= nil, "collectionIndex id must exist");
    local v30 = l_useSelector_0(function(v24) --[[ Line: 66 ]]
        -- upvalues: v9 (ref), v20 (copy)
        local v25 = {};
        local v26 = v24.Personalization[v9.key][v20.appPage];
        if v26 then
            for _, v28 in v26.itemCollections do
                local l_analyticsData_0 = v28.sduiConfig.analyticsData;
                if tostring(v20.collectionId) == tostring(l_analyticsData_0.collectionId) then
                    v25.feedItemData = v28;
                    break;
                end;
            end;
            v25.templates = v26.rootConfig and v26.rootConfig.templates or nil;
        end;
        return v25;
    end, v4.shallowEqual);
    local v31 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v20.contentFrame, 0) else nil;
    local v32 = v13({
        appPage = v20.appPage, 
        templates = v30.templates, 
        dataUpdatedTimestamp = v30.feedItemData and v30.feedItemData.dataUpdatedTimestamp, 
        pageLayoutConfig = if l_FFlagLuaAppLayoutParamsInContext_0 then v31 else nil
    });
    local l_feedItemData_0 = v30.feedItemData;
    local v40 = v3.useMemo(function() --[[ Line: 97 ]]
        -- upvalues: l_feedItemData_0 (copy), v32 (copy), l_SduiErrors_0 (ref), v20 (copy), l_SduiBuilder_0 (ref), l_SduiParsers_0 (ref), l_SduiComponentType_0 (ref), l_FFlagSduiImpressionHandlerRegistry_0 (ref)
        if not l_feedItemData_0 or not l_feedItemData_0.sduiConfig then
            v32.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentConfig, {
                name = "SduiSeeAllGrid", 
                message = ("Missing component config client-driven SDUI grid for see-all. CollectionId: %*"):format(v20.collectionId)
            }, v32.appPage);
            return nil;
        elseif not l_feedItemData_0.sduiConfig.props then
            v32.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.InvalidComponentConfig, {
                name = "SduiSeeAllGrid", 
                message = ("Missing props for component config for client-driven SDUI grid for see-all. CollectionId: %*"):format(v20.collectionId)
            }, v32.appPage);
            return nil;
        else
            local l_sduiConfig_0 = l_feedItemData_0.sduiConfig;
            local v35 = nil;
            if l_sduiConfig_0.props.items and #l_sduiConfig_0.props.items > 0 and l_sduiConfig_0.props.itemHeightFromWidth == nil then
                local v36 = l_sduiConfig_0.props.items[1];
                if l_sduiConfig_0.props.itemTemplateKey and v36.templateKey == nil then
                    v36.templateKey = l_sduiConfig_0.props.itemTemplateKey;
                end;
                if not l_SduiBuilder_0.getComponentType(v36, v32) then
                    v32.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                        name = "SduiSeeAllGrid", 
                        message = ("Missing componentType for first item. CollectionId: %*"):format(v20.collectionId)
                    }, v32.appPage);
                    return nil;
                else
                    local v37 = nil;
                    if v36 then
                        local v38 = v36.props and v36.props.imageAspectRatio and l_SduiParsers_0.safeParseNumber(v36.props.imageAspectRatio, v32, {});
                        if v38 and v38 > 0 then
                            v37 = 1 / v38;
                        end;
                    end;
                    if not v37 then
                        v37 = (not (l_sduiConfig_0.props.collectionItemSize ~= "Medium") or l_sduiConfig_0.props.collectionItemSize == "Large") and 0.5625 or 1;
                    end;
                    local v39 = nil;
                    if v36 then
                        v39 = (v36.props and v36.props.titleLines or 1) * 20 + 20 + 8;
                    end;
                    v35 = UDim.new(v37, v39);
                end;
            else
                v35 = l_sduiConfig_0.props.itemHeightFromWidth;
            end;
            return {
                componentType = l_SduiComponentType_0.CollectionGrid, 
                props = {
                    items = l_sduiConfig_0.props.items, 
                    impressionEventName = if l_FFlagSduiImpressionHandlerRegistry_0 then l_sduiConfig_0.props.impressionEventName else nil, 
                    skipItemImpressionsLog = if l_FFlagSduiImpressionHandlerRegistry_0 then l_sduiConfig_0.props.skipItemImpressionsLog else nil, 
                    collectionItemSize = l_sduiConfig_0.props.collectionItemSize, 
                    itemTemplateKey = l_sduiConfig_0.props.itemTemplateKey, 
                    itemHeightFromWidth = v35
                }, 
                analyticsData = l_sduiConfig_0.analyticsData
            };
        end;
    end, {
        l_feedItemData_0 and l_feedItemData_0.sduiConfig, 
        v32
    });
    return (v3.useMemo(function() --[[ Line: 191 ]]
        -- upvalues: v40 (copy), v32 (copy), l_SduiErrors_0 (ref), v20 (copy), v3 (ref), l_SduiComponent_0 (ref), l_feedItemData_0 (copy), l_scrollViewPositionChangedSignal_0 (copy), l_verticalScrollingFrameRef_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (ref), l_FFlagSduiServerCompat_0 (ref), v21 (ref), l_FFlagLuaAppLayoutParamsInContext_0 (ref), l_FFlagSduiCoreBadgeDetailsSupport_0 (ref)
        if v40 == nil then
            v32.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentConfig, {
                name = "SduiSeeAllGrid", 
                message = ("Unable to generate component config for client-driven SDUI grid for see-all. CollectionId: %*"):format(v20.collectionId)
            }, v32.appPage);
            return nil;
        else
            return v3.createElement(l_SduiComponent_0, {
                debugName = "SeeAllGrid", 
                componentConfig = v40, 
                sduiContext = v32, 
                extraLocalProps = {
                    dataUpdatedTimestamp = l_feedItemData_0.dataUpdatedTimestamp, 
                    scrollViewPositionChangedSignal = l_scrollViewPositionChangedSignal_0, 
                    verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
                    index = v20.collectionIndex, 
                    collectionPosition = v20.collectionIndex, 
                    pageSideMargin = 0, 
                    startRow = 1, 
                    numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
                    LayoutOrder = if not l_FFlagSduiServerCompat_0 then v21 else nil, 
                    layoutOrder = if l_FFlagSduiServerCompat_0 then v21 else nil, 
                    layoutOverrides = if l_FFlagLuaAppLayoutParamsInContext_0 then nil else {
                        sideMargin = 0, 
                        fractionalItemAmount = 0, 
                        overrideLoadMoreThreshold = 1e999
                    }, 
                    disableRelativeGap = not l_FFlagSduiCoreBadgeDetailsSupport_0 or nil, 
                    disableImpressionsDetector = true, 
                    impressionsTag = v20.impressionsTag, 
                    setLogImpressions = v20.setLogImpressions, 
                    sendGameImpressions = v20.sendGameImpressions, 
                    onCollectionViewabilityChanged = v20.onCollectionViewabilityChanged
                }, 
                localAnalyticsData = {
                    collectionPosition = v20.collectionIndex, 
                    seeAllFlag = 1
                }
            });
        end;
    end, {
        v40, 
        v21, 
        l_feedItemData_0 and l_feedItemData_0.dataUpdatedTimestamp or nil, 
        1, 
        v20.collectionId, 
        v20.collectionIndex, 
        l_scrollViewPositionChangedSignal_0, 
        l_verticalScrollingFrameRef_0, 
        v32, 
        v20.impressionsTag, 
        v20.setLogImpressions, 
        v20.sendGameImpressions, 
        v20.onCollectionViewabilityChanged
    }));
end);