local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v8.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v8.AvatarRoute.Hooks.useAvatarRoute;
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v18 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v19 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_ProductPurchaseSurface_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v29 = require(l_Modules_0.AvatarExperience.Common.Util.LookUtils);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandleLooksPurchaseSuccess);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local v34 = game:DefineFastFlag("AXFixUnifiedPurchaseFlowSessionTag", false);
local function v44(v35, v36) --[[ Line: 57 ]] --[[ Name: getAvatarEditorCategoryIndexesByName ]]
    -- upvalues: v27 (copy)
    local v37 = v27();
    local v38 = nil;
    local v39 = nil;
    for v40, v41 in v37 do
        if v41.Name == v35 then
            v38 = v40;
            if v36 and v41.Subcategories then
                for v42, v43 in v41.Subcategories do
                    if v43.Name == v36 then
                        return v38, v42;
                    end;
                end;
                return v38, v39;
            else
                break;
            end;
        end;
    end;
    return v38, v39;
end;
return function(v45) --[[ Line: 99 ]] --[[ Name: useLookUnifiedPurchaseFlow ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v7 (copy), v15 (copy), v16 (copy), v17 (copy), l_useAvatarSaveContext_0 (copy), v3 (copy), v29 (copy), v4 (copy), v13 (copy), v19 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v34 (copy), l_UnifiedEventLogEnums_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogConstants_0 (copy), v31 (copy), v30 (copy), v11 (copy), v18 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_ProductPurchaseSurface_0 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v12 (copy), v44 (copy), v28 (copy), l_AvatarScreen_0 (copy), v20 (copy)
    local v46 = l_useDispatch_0();
    local v47 = l_useNavigation_0();
    local v48 = l_useAvatarRoute_0();
    local v49 = v7(v15);
    local v50 = v7(v16);
    local v51 = v7(v17);
    local v52 = l_useAvatarSaveContext_0();
    local v61 = v3.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v29 (ref), v45 (copy), v4 (ref), v50 (copy), v13 (ref)
        local v53 = nil;
        local v54 = nil;
        local v55 = nil;
        local v56 = {};
        local v57, v58, v59, v60 = v29.getPurchaseInfoForLookId(v45.tryOnItems, v45.lookDetailsObj, v45.lookId);
        v53 = v57;
        v54 = v58;
        v55 = v59;
        v56 = v60;
        v57 = if v45.lookAnalyticsInfo then v4.Dictionary.join(v45.lookAnalyticsInfo, {
            totalRobux = v45.totalPrice, 
            assetIds = v56
        }) else nil;
        if v57 and #v56 > 0 then
            v50.widgetInteractionV2(v57, v13.ActionType.PURCHASE_ATTEMPT);
        end;
    end, {
        v45.tryOnItems, 
        v45.lookDetailsObj, 
        v45.lookId, 
        v45.lookAnalyticsInfo, 
        v45.totalPrice, 
        v50
    });
    local v62 = v3.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v46 (copy), v19 (ref)
        v46(v19());
    end, {
        v46
    });
    local v67 = v3.useCallback(function(v63) --[[ Line: 139 ]]
        -- upvalues: v45 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), v34 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v63 and v45.lookAnalyticsInfo then
            local v64 = {
                current = v63
            };
            local v65 = nil;
            local v66 = if l_FFlagAXCatalogMakeupSupport_0 and v45.lookId and v45.lookDetailsObj and v45.lookDetailsObj[v45.lookId] then v45.lookDetailsObj[v45.lookId].lookType else nil;
            if v34 then
                v65 = v4.Dictionary.join(v45.lookAnalyticsInfo, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                    itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
                    organicLookType = if not l_FFlagAXCatalogMakeupSupport_0 or v45.lookAnalyticsInfo.widgetType then nil else v66, 
                    widgetLookType = if l_FFlagAXCatalogMakeupSupport_0 and v45.lookAnalyticsInfo.widgetType then v66 else nil, 
                    widgetItemPrice = if v45.lookAnalyticsInfo.widgetType then v45.totalPrice else nil, 
                    organicItemPrice = if v45.lookAnalyticsInfo.widgetType then nil else v45.totalPrice
                });
                l_addUnifiedEventLogging_0(v64, v65, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
                return;
            else
                v65 = v4.Dictionary.join(v45.lookAnalyticsInfo, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                    itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
                    organicLookType = if not l_FFlagAXCatalogMakeupSupport_0 or v45.lookAnalyticsInfo.widgetType then nil else v66, 
                    widgetLookType = if l_FFlagAXCatalogMakeupSupport_0 and v45.lookAnalyticsInfo.widgetType then v66 else nil, 
                    widgetItemPrice = if v45.lookAnalyticsInfo.widgetType then v45.totalPrice else nil, 
                    organicItemPrice = if v45.lookAnalyticsInfo.widgetType then nil else v45.totalPrice, 
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                }, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
                l_addUnifiedEventLogging_0(v64, v65);
            end;
        end;
    end, {
        v45.totalPrice, 
        v45.lookAnalyticsInfo, 
        if l_FFlagAXCatalogMakeupSupport_0 then v45.lookDetailsObj else nil, 
        if l_FFlagAXCatalogMakeupSupport_0 then v45.lookId else nil
    });
    local v80 = v3.useCallback(function(v68, v69) --[[ Line: 199 ]]
        -- upvalues: v31 (ref), v45 (copy), v29 (ref), v4 (ref), v46 (copy), v30 (ref), v49 (copy), v52 (copy), v47 (copy), v50 (copy), v51 (copy), v48 (copy)
        local v70 = v31.getOwnedTryOnItems(v45.tryOnItems, v45.lookDetailsObj, v45.lookId);
        local l_isTryOnFromOutsideAX_0 = v45.isTryOnFromOutsideAX;
        local v72 = nil;
        local v73 = nil;
        local v74 = nil;
        local v75 = {};
        local v76, v77, v78, v79 = v29.getPurchaseInfoForLookId(v45.tryOnItems, v45.lookDetailsObj, v45.lookId);
        v72 = v76;
        v73 = v77;
        v74 = v78;
        v75 = v79;
        v76 = if v45.lookAnalyticsInfo then v4.Dictionary.join(v45.lookAnalyticsInfo, {
            totalRobux = v45.totalPrice, 
            assetIds = v75
        }) else nil;
        v46(v30(v68, v69, v49, v45.lookId, v45.totalPrice, v45.tryOnItems, v70, v52, l_isTryOnFromOutsideAX_0, v76, v47, v50, v51, v48));
    end, {
        v46, 
        v49, 
        v45.lookId, 
        v45.lookAnalyticsInfo, 
        v45.totalPrice, 
        v45.tryOnItems, 
        v52, 
        v47, 
        v50, 
        v51, 
        v45.lookDetailsObj, 
        v48, 
        v45.isTryOnFromOutsideAX
    });
    local v89 = v3.useCallback(function() --[[ Line: 251 ]]
        -- upvalues: v45 (copy), v29 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v11 (ref), v46 (copy), v18 (ref), v62 (copy), v61 (copy), v80 (copy), v67 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref)
        if not v45.lookId then
            return;
        else
            local v81 = nil;
            local v82 = {};
            local v83 = {};
            local v84 = {};
            local v85, v86, v87, v88 = v29.getPurchaseInfoForLookId(v45.tryOnItems, v45.lookDetailsObj, v45.lookId);
            v81 = v85;
            v82 = v86;
            v83 = v87;
            v84 = v88;
            v85 = if l_FFlagAXCatalogMakeupSupport_0 and v45.lookDetailsObj and v45.lookDetailsObj[v45.lookId] and v45.lookDetailsObj[v45.lookId].lookType then v45.lookDetailsObj[v45.lookId].lookType == v11.LookType.Makeup else nil;
            v46(v18({
                productPayload = {
                    kind = "Look", 
                    id = v45.lookId, 
                    expectedPrice = v45.totalPrice, 
                    salesLocationId = 0, 
                    excludedAssetIds = v82, 
                    excludedBundleIds = v83
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v62, 
                    onPurchaseAttempt = v61, 
                    onPurchaseSuccess = v80, 
                    onBuyItemButtonMounted = v67
                }, 
                postPurchaseActions = {
                    {
                        label = if l_FFlagAXCatalogMakeupSupport_0 and v85 then v45.localized.wearAfterPurchaseMakeupLabel else if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v45.localized.wearAvatarAfterPurchaseLabel else v45.localized.wearAfterPurchaseLabel, 
                        actionKey = v11.WearAfterPurchasePostPurchaseActionKey, 
                        isActionSelected = true
                    }, 
                    {
                        label = if l_FFlagAXCatalogMakeupSupport_0 and v85 then v45.localized.saveAsMakeupLookLabel else if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v45.localized.saveAsCharacterLabel else v45.localized.addToMyAvatarsLabel, 
                        actionKey = v11.SaveAsCharacterPostPurchaseActionKey, 
                        isActionSelected = true
                    }
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.Catalog
                }
            }, l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and true or nil));
            return;
        end;
    end, {
        v46, 
        v45.lookId, 
        v45.totalPrice, 
        v45.tryOnItems, 
        v45.lookDetailsObj, 
        v49, 
        v52, 
        v47, 
        v50, 
        v51, 
        v45.localized, 
        v48, 
        v45.isTryOnFromOutsideAX
    });
    local v94 = v3.useCallback(function() --[[ Line: 328 ]]
        -- upvalues: v45 (copy), v50 (copy), v12 (ref), v4 (ref), v44 (ref), v28 (ref), l_AvatarScreen_0 (ref), v47 (copy), v46 (copy), v20 (ref), v89 (copy)
        if v45.userRobux < v45.totalPrice then
            v50.sendAXCounter(v12.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        end;
        if v4.isEmpty(v45.itemsToPurchase) and v45.lookId ~= nil then
            local v90, v91 = v44(v28.CharacterKey);
            local l_LeaveCatalogToAvatarPrompt_0 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            local v93 = {
                onOverlayClosed = v45.onOverlayClosed, 
                categoryOverride = v90, 
                subcategoryOverride = v91
            };
            v50.sendAXCounter(v12.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
            v46(v20(function() --[[ Line: 347 ]]
                -- upvalues: v47 (ref), l_LeaveCatalogToAvatarPrompt_0 (copy), v93 (copy)
                v47.navigate(l_LeaveCatalogToAvatarPrompt_0, v93);
            end));
            return;
        else
            v89();
            return;
        end;
    end, {
        v45.tryOnItems, 
        v45.lookDetailsObj, 
        v45.lookId, 
        v45.userRobux, 
        v46, 
        v47, 
        v45.onOverlayClosed, 
        v50, 
        v48, 
        v45.itemsToPurchase, 
        v45.totalPrice, 
        v89
    });
    return {
        onPurchaseAttempt = v61, 
        onFlowComplete = v62, 
        onBuyItemButtonMounted = v67, 
        onPurchaseSuccess = v80, 
        openUnifiedPurchasePrompt = v89, 
        onButtonPressWithUnifiedPurchaseFlow = v94
    };
end;