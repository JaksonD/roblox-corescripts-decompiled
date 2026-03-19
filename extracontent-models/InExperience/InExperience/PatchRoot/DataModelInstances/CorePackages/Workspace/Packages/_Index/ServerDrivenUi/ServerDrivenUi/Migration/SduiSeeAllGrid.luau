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
return v3.memo(function(v19) --[[ Line: 50 ]] --[[ Name: SduiSeeAllGrid ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v2 (copy), l_useSelector_0 (copy), v9 (copy), v4 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useCollectionLayoutConfig_0 (copy), v13 (copy), v3 (copy), l_SduiErrors_0 (copy), l_SduiBuilder_0 (copy), l_SduiParsers_0 (copy), l_SduiComponentType_0 (copy), l_SduiComponent_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy)
    local v20 = nil;
    v20 = if l_FFlagSduiServerCompat_0 then v19.layoutOrder else v19.LayoutOrder;
    local l_verticalScrollingFrameRef_0 = v19.verticalScrollingFrameRef;
    local l_scrollViewPositionChangedSignal_0 = v19.scrollViewPositionChangedSignal;
    v2.assert(v19.collectionId ~= nil, "collectionId id must exist");
    v2.assert(v19.collectionIndex ~= nil, "collectionIndex id must exist");
    local v29 = l_useSelector_0(function(v23) --[[ Line: 65 ]]
        -- upvalues: v9 (ref), v19 (copy)
        local v24 = {};
        local v25 = v23.Personalization[v9.key][v19.appPage];
        if v25 then
            for _, v27 in v25.itemCollections do
                local l_analyticsData_0 = v27.sduiConfig.analyticsData;
                if tostring(v19.collectionId) == tostring(l_analyticsData_0.collectionId) then
                    v24.feedItemData = v27;
                    break;
                end;
            end;
            v24.templates = v25.rootConfig and v25.rootConfig.templates or nil;
        end;
        return v24;
    end, v4.shallowEqual);
    local v30 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v19.contentFrame, 0) else nil;
    local v31 = v13({
        appPage = v19.appPage, 
        templates = v29.templates, 
        dataUpdatedTimestamp = v29.feedItemData and v29.feedItemData.dataUpdatedTimestamp, 
        pageLayoutConfig = if l_FFlagLuaAppLayoutParamsInContext_0 then v30 else nil
    });
    local l_feedItemData_0 = v29.feedItemData;
    local v39 = v3.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: l_feedItemData_0 (copy), v31 (copy), l_SduiErrors_0 (ref), v19 (copy), l_SduiBuilder_0 (ref), l_SduiParsers_0 (ref), l_SduiComponentType_0 (ref)
        if not l_feedItemData_0 or not l_feedItemData_0.sduiConfig then
            v31.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentConfig, {
                name = "SduiSeeAllGrid", 
                message = ("Missing component config client-driven SDUI grid for see-all. CollectionId: %*"):format(v19.collectionId)
            }, v31.appPage);
            return nil;
        elseif not l_feedItemData_0.sduiConfig.props then
            v31.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.InvalidComponentConfig, {
                name = "SduiSeeAllGrid", 
                message = ("Missing props for component config for client-driven SDUI grid for see-all. CollectionId: %*"):format(v19.collectionId)
            }, v31.appPage);
            return nil;
        else
            local l_sduiConfig_0 = l_feedItemData_0.sduiConfig;
            local v34 = nil;
            if l_sduiConfig_0.props.items and #l_sduiConfig_0.props.items > 0 and l_sduiConfig_0.props.itemHeightFromWidth == nil then
                local v35 = l_sduiConfig_0.props.items[1];
                if l_sduiConfig_0.props.itemTemplateKey and v35.templateKey == nil then
                    v35.templateKey = l_sduiConfig_0.props.itemTemplateKey;
                end;
                if not l_SduiBuilder_0.getComponentType(v35, v31) then
                    v31.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                        name = "SduiSeeAllGrid", 
                        message = ("Missing componentType for first item. CollectionId: %*"):format(v19.collectionId)
                    }, v31.appPage);
                    return nil;
                else
                    local v36 = nil;
                    if v35 then
                        local v37 = v35.props and v35.props.imageAspectRatio and l_SduiParsers_0.safeParseNumber(v35.props.imageAspectRatio, v31, {});
                        if v37 and v37 > 0 then
                            v36 = 1 / v37;
                        end;
                    end;
                    if not v36 then
                        v36 = (not (l_sduiConfig_0.props.collectionItemSize ~= "Medium") or l_sduiConfig_0.props.collectionItemSize == "Large") and 0.5625 or 1;
                    end;
                    local v38 = nil;
                    if v35 then
                        v38 = (v35.props and v35.props.titleLines or 1) * 20 + 20 + 8;
                    end;
                    v34 = UDim.new(v36, v38);
                end;
            else
                v34 = l_sduiConfig_0.props.itemHeightFromWidth;
            end;
            return {
                componentType = l_SduiComponentType_0.CollectionGrid, 
                props = {
                    items = l_sduiConfig_0.props.items, 
                    collectionItemSize = l_sduiConfig_0.props.collectionItemSize, 
                    itemTemplateKey = l_sduiConfig_0.props.itemTemplateKey, 
                    itemHeightFromWidth = v34
                }, 
                analyticsData = l_sduiConfig_0.analyticsData
            };
        end;
    end, {
        l_feedItemData_0 and l_feedItemData_0.sduiConfig, 
        v31
    });
    return (v3.useMemo(function() --[[ Line: 184 ]]
        -- upvalues: v39 (copy), v31 (copy), l_SduiErrors_0 (ref), v19 (copy), v3 (ref), l_SduiComponent_0 (ref), l_feedItemData_0 (copy), l_scrollViewPositionChangedSignal_0 (copy), l_verticalScrollingFrameRef_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (ref), l_FFlagSduiServerCompat_0 (ref), v20 (ref), l_FFlagLuaAppLayoutParamsInContext_0 (ref), l_FFlagSduiCoreBadgeDetailsSupport_0 (ref)
        if v39 == nil then
            v31.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentConfig, {
                name = "SduiSeeAllGrid", 
                message = ("Unable to generate component config for client-driven SDUI grid for see-all. CollectionId: %*"):format(v19.collectionId)
            }, v31.appPage);
            return nil;
        else
            return v3.createElement(l_SduiComponent_0, {
                debugName = "SeeAllGrid", 
                componentConfig = v39, 
                sduiContext = v31, 
                extraLocalProps = {
                    dataUpdatedTimestamp = l_feedItemData_0.dataUpdatedTimestamp, 
                    scrollViewPositionChangedSignal = l_scrollViewPositionChangedSignal_0, 
                    verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
                    index = v19.collectionIndex, 
                    collectionPosition = v19.collectionIndex, 
                    pageSideMargin = 0, 
                    startRow = 1, 
                    numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
                    LayoutOrder = if not l_FFlagSduiServerCompat_0 then v20 else nil, 
                    layoutOrder = if l_FFlagSduiServerCompat_0 then v20 else nil, 
                    layoutOverrides = if l_FFlagLuaAppLayoutParamsInContext_0 then nil else {
                        sideMargin = 0, 
                        fractionalItemAmount = 0, 
                        overrideLoadMoreThreshold = 1e999
                    }, 
                    disableRelativeGap = not l_FFlagSduiCoreBadgeDetailsSupport_0 or nil, 
                    disableImpressionsDetector = true, 
                    impressionsTag = v19.impressionsTag, 
                    setLogImpressions = v19.setLogImpressions, 
                    sendGameImpressions = v19.sendGameImpressions, 
                    onCollectionViewabilityChanged = v19.onCollectionViewabilityChanged
                }, 
                localAnalyticsData = {
                    collectionPosition = v19.collectionIndex, 
                    seeAllFlag = 1
                }
            });
        end;
    end, {
        v39, 
        v20, 
        l_feedItemData_0 and l_feedItemData_0.dataUpdatedTimestamp or nil, 
        1, 
        v19.collectionId, 
        v19.collectionIndex, 
        l_scrollViewPositionChangedSignal_0, 
        l_verticalScrollingFrameRef_0, 
        v31, 
        v19.impressionsTag, 
        v19.setLogImpressions, 
        v19.sendGameImpressions, 
        v19.onCollectionViewabilityChanged
    }));
end);