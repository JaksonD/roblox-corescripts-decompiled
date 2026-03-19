local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_UnifiedEventLogConstants_0 = require(l_Parent_0.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_UnifiedEventLogEnums_0 = require(l_Parent_0.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_UnifiedLoggingSurface_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
local v5 = require(l_Parent_0.NavigationRodux);
local v6 = require(l_Parent_0.RobloxAppEnums);
local l_NavigateDown_0 = v5.Thunks.NavigateDown;
local l_AppPage_0 = v6.AppPage;
local v9 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v9.SduiActionType;
local l_SduiErrorType_0 = v9.SduiErrors.SduiErrorType;
local l_AnalyticsService_0 = require(l_Parent_0.AvatarExperienceAnalytics).AnalyticsService;
local l_ImpressionEnums_0 = require(l_Parent_0.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v14 = require(l_Parent_0.SharedFlags);
local l_FFlagAXTryOnScreenImprovements_0 = v14.FFlagAXTryOnScreenImprovements;
local l_FFlagAXEnableHomeTryOnComplexView_0 = v14.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v14.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 = v14.FFlagAXAvatarSortInDiscoveryUnifiedPurchase;
local v19 = game:DefineFastFlag("AXFixHomepageTryOnScreenAnalytics", false);
local v20 = game:DefineFastFlag("AXMarketplaceTryOnActionUnifiedLogging", false);
local v21 = if l_FFlagAXTryOnScreenImprovements_0 then {
    [l_AppPage_0.Home] = l_ImpressionEnums_0.MarketplaceSurfaceType.DISCOVERY_HOMEPAGE, 
    [l_AppPage_0.SearchPage] = l_ImpressionEnums_0.MarketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS
} else nil;
local v22 = if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then {
    [l_AppPage_0.Home] = l_UnifiedLoggingSurface_0.DISCOVERY_HOMEPAGE, 
    [l_AppPage_0.SearchPage] = l_UnifiedLoggingSurface_0.DISCOVERY_SEARCH_RESULTS
} else nil;
local function _(v23, v24, v25) --[[ Line: 53 ]] --[[ Name: reportOpenMarketplaceTryOnPropError ]]
    -- upvalues: l_SduiActionType_0 (copy), l_SduiErrorType_0 (copy)
    local v26 = {
        name = l_SduiActionType_0.OpenMarketplaceTryOn, 
        message = v24
    };
    if v25 ~= nil then
        v26.propName = v25;
    end;
    v23.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, v26, v23.appPage);
end;
return function(v28, _, v30) --[[ Line: 66 ]]
    -- upvalues: l_SduiActionType_0 (copy), l_SduiErrorType_0 (copy), v20 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (copy), v22 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), v21 (copy), l_ImpressionEnums_0 (copy), v19 (copy), l_AppPage_0 (copy), l_AnalyticsService_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_UnifiedEventLogConstants_0 (copy), l_NavigateDown_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy)
    local v31 = v28 and v28.actionParams or nil;
    if v31 == nil then
        local v32 = {
            name = l_SduiActionType_0.OpenMarketplaceTryOn, 
            message = "Missing actionParams"
        };
        v30.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, v32, v30.appPage);
        return;
    else
        assert(v31, "actionParams must exist");
        local l_itemId_0 = v31.itemId;
        local v34 = tostring(l_itemId_0);
        if l_itemId_0 == nil then
            local v35 = ("Missing itemId: %*"):format(v34);
            local v36 = {
                name = l_SduiActionType_0.OpenMarketplaceTryOn, 
                message = v35, 
                propName = "itemId"
            };
            v30.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, v36, v30.appPage);
            return;
        else
            local v37 = tostring(v31.itemType);
            if v37 ~= "Asset" and v37 ~= "Bundle" and v37 ~= "Look" then
                local v38 = ("Invalid itemType: %*"):format(v37);
                local v39 = {
                    name = l_SduiActionType_0.OpenMarketplaceTryOn, 
                    message = v38, 
                    propName = "itemType"
                };
                v30.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, v39, v30.appPage);
                return;
            else
                local v40 = nil;
                if v20 then
                    v40 = if v37 == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else if v37 == "Bundle" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE else if v37 == "Look" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE;
                end;
                local l_itemSubTypeName_0 = v31.itemSubTypeName;
                if (v37 == "Asset" or v37 == "Bundle") and l_itemSubTypeName_0 == nil then
                    local v42 = ("Missing itemSubTypeName: %*"):format(l_itemSubTypeName_0);
                    local v43 = {
                        name = l_SduiActionType_0.OpenMarketplaceTryOn, 
                        message = v42, 
                        propName = "itemSubTypeName"
                    };
                    v30.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, v43, v30.appPage);
                    return;
                else
                    local v44 = nil;
                    if v20 then
                        v44 = v31.itemPrice;
                        if v44 == nil then
                            local v45 = ("Missing itemPrice: %*"):format(v44);
                            local v46 = {
                                name = l_SduiActionType_0.OpenMarketplaceTryOn, 
                                message = v45, 
                                propName = "itemPrice"
                            };
                            v30.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, v46, v30.appPage);
                            return;
                        end;
                    end;
                    local v47 = v37 .. v34;
                    local v48 = nil;
                    local v49 = nil;
                    if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then
                        v49 = v22[v30.appPage];
                    end;
                    if l_FFlagAXTryOnScreenImprovements_0 then
                        local v50 = "TryOnScreen";
                        v48 = v21[v30.appPage];
                        if v48 == nil then
                            v30.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                                name = l_SduiActionType_0.OpenMarketplaceTryOn, 
                                message = ("Unsupported appPage for OpenMarketplaceTryOn action: %*"):format(v30.appPage)
                            }, v30.appPage);
                        else
                            local v51 = {
                                actionType = l_ImpressionEnums_0.ActionType.UI_BUTTON_CLICK, 
                                group = "AvatarItemWidgetClick", 
                                surface = v48, 
                                item_id = l_itemId_0, 
                                item_type = v37
                            };
                            if not v19 and v30.appPage == l_AppPage_0.Home then
                                v50 = "HomeTryOnScreen";
                                v51 = {
                                    actionType = l_ImpressionEnums_0.ActionType.UI_BUTTON_CLICK, 
                                    group = "HomePageAvatarWidgetClick", 
                                    surface = l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE, 
                                    item_id = l_itemId_0, 
                                    item_type = v37
                                };
                            end;
                            v51.event_sender_api = l_ImpressionEnums_0.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT;
                            l_AnalyticsService_0.EventStream:sendTelemetryEvent(v50, "marketplaceOrganicFELog", v51);
                            if v20 then
                                local v52 = {
                                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                                    surface = l_UnifiedLoggingSurface_0.DISCOVERY_HOMEPAGE, 
                                    itemId = l_itemId_0, 
                                    itemType = v40, 
                                    widgetId = "DiscoveryHomepageAvatarWidget:1234", 
                                    widgetType = "DiscoveryHomepageAvatarWidget", 
                                    uiTreatmentType = l_UnifiedEventLogEnums_0.WidgetUiTreatment.ITEM_GROUP, 
                                    widgetItemPrice = v44
                                };
                                l_AnalyticsService_0.EventStream:sendTelemetryEvent(l_UnifiedEventLogConstants_0.EVENT_NAME, l_UnifiedEventLogConstants_0.EVENT_NAME, v52);
                            end;
                        end;
                    end;
                    v30.dependencies.dispatch(l_NavigateDown_0({
                        name = l_AppPage_0.AvatarExperienceWrapper, 
                        detail = v47, 
                        extraProps = {
                            routeName = l_AvatarScreen_0.TryOnItem, 
                            params = {
                                itemId = v34, 
                                itemType = v37, 
                                itemSubTypeName = if v37 == "Look" then nil else l_itemSubTypeName_0, 
                                mountAsFullView = false, 
                                mountAnimation = true, 
                                showRobuxBalance = true, 
                                showDropDownTopBar = true, 
                                fromHome = not l_FFlagAXTryOnScreenImprovements_0 or nil, 
                                fromSurface = if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then v49 else if l_FFlagAXFixPurchaseSurfaceLogging_0 then v48 else nil, 
                                detail = v47, 
                                hideTab = l_FFlagAXTryOnScreenImprovements_0 and true or nil, 
                                simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v30.appPage == l_AppPage_0.Home and not l_FFlagAXEnableHomeTryOnComplexView_0 else nil, 
                                shouldNavigateDown = l_FFlagAXTryOnScreenImprovements_0 and true or nil
                            }
                        }
                    }));
                    return;
                end;
            end;
        end;
    end;
end;