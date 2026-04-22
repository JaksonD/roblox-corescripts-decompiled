local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_setTimeout_0 = require(l_CorePackages_0.Packages.LuauPolyfill).setTimeout;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v10 = game:DefineFastInt("AXLookOutfitCreationDelayMs1", 5000);
local v11 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v15 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateOutfit);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase);
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v21 = game:DefineFastString("AXDefaultCharacterName", "Avatar");
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums;
local l_PurchaseLookStatusEnum_0 = l_Enums_0.PurchaseLookStatusEnum;
local l_PurchaseLookItemStatusEnum_0 = l_Enums_0.PurchaseLookItemStatusEnum;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v5.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local v26 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v27 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_WidgetConstants_0 = v27.WidgetConstants;
local v29 = game:DefineFastFlag("AXUnifiedSubsetOfLook", false);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v31 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local l_getTryOnItemReducerKey_0 = v26.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v26.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local l_SetTryOnManagerPeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState;
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v40 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableSavePurchasedLooksWithLookName);
local v41 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_SaveAsMakeupLookThunk_0 = v27.Thunks.SaveAsMakeupLookThunk;
local l_CartIdService_0 = v7.Lib.CartIdService;
local l_UnifiedSelectionListStore_0 = v7.Store.UnifiedSelectionListStore;
local l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 = v5.FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v6.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagUseNavigationSelectors_0 = v6.FFlagUseNavigationSelectors;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v5.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 = v5.FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess;
local function _(v51, v52) --[[ Line: 71 ]] --[[ Name: updateRobux ]]
    -- upvalues: v3 (copy), v11 (copy)
    local l_LocalUserId_0 = v52:getState().LocalUserId;
    v3.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v52:dispatch(v11(v51, l_LocalUserId_0, true));
    end;
end;
local v55 = {
    HttpError = Enum.HttpError.OK
};
local function v64(v56, v57, v58, v59, v60, v61) --[[ Line: 81 ]]
    -- upvalues: l_PurchaseLookItemStatusEnum_0 (copy)
    for v62, v63 in v57 do
        if v63 == l_PurchaseLookItemStatusEnum_0.Success or v63 == l_PurchaseLookItemStatusEnum_0.AlreadyOwned then
            v59 = v59 + 1;
            v56:dispatch(v58(v62, true));
            if v63 == l_PurchaseLookItemStatusEnum_0.Success then
                table.insert(v61, (tonumber(v62)));
            end;
        else
            v60 = v60 + 1;
        end;
    end;
    return v59, v60, v61;
end;
local function v69(v65, v66, v67) --[[ Line: 108 ]] --[[ Name: formatItemForWearAfterPurchase ]]
    -- upvalues: v31 (copy)
    local v68 = v66.itemType == v31.ItemType.Bundle;
    return {
        assetId = if not v68 then v65 else nil, 
        assetIsWearable = not v68, 
        assetType = if v68 then v31.ItemType.Bundle else nil, 
        bundleId = if v68 then v65 else nil, 
        itemSubType = v66.itemSubType, 
        overrideOrder = v66.order, 
        overrideAdjustments = {
            position = v66.position, 
            rotation = v66.rotation, 
            scale = v66.scale
        }, 
        owned = true, 
        purchased = v67, 
        tryOnBundleInfo = if v68 then v66.bundleInfo else nil
    };
end;
local function _(v70, v71, v72, v73, v74) --[[ Line: 129 ]] --[[ Name: processItem ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), v69 (copy)
    local v75 = true;
    if v73 ~= "Success" then
        v75 = v73 == "AlreadyOwned";
    end;
    local v76 = if v74 ~= nil then l_getTryOnItemReducerKey_0(v72, v74) else v72;
    if v75 and v71[v76] ~= nil then
        table.insert(v70, (v69(v72, v71[v76], true)));
    end;
    return v70;
end;
local function v100(v78, v79, v80, v81, v82, v83, v84) --[[ Line: 143 ]] --[[ Name: handleWearAfterPurchase ]]
    -- upvalues: v69 (copy), v31 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v37 (copy), v38 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_PeekViewState_0 (copy)
    local v85 = {};
    for _, v87 in v82 do
        table.insert(v85, (v69(v87.itemId, v87, false)));
    end;
    for v88, v89 in v78.assetPurchaseStatus do
        local l_v85_0 = v85;
        local l_Asset_0 = v31.ItemType.Asset;
        local v92 = true;
        if v89 ~= "Success" then
            v92 = v89 == "AlreadyOwned";
        end;
        local v93 = if l_Asset_0 ~= nil then l_getTryOnItemReducerKey_0(v88, l_Asset_0) else v88;
        if v92 and v81[v93] ~= nil then
            table.insert(l_v85_0, (v69(v88, v81[v93], true)));
        end;
        v85 = l_v85_0;
    end;
    for v94, v95 in v78.bundlePurchaseStatus do
        local l_v85_1 = v85;
        local l_Bundle_0 = v31.ItemType.Bundle;
        local v98 = true;
        if v95 ~= "Success" then
            v98 = v95 == "AlreadyOwned";
        end;
        local v99 = if l_Bundle_0 ~= nil then l_getTryOnItemReducerKey_0(v94, l_Bundle_0) else v94;
        if v98 and v81[v99] ~= nil then
            table.insert(l_v85_1, (v69(v94, v81[v99], true)));
        end;
        v85 = l_v85_1;
    end;
    if v83 and v84 and v84.autoSaveNextNewSaveData then
        v84.autoSaveNextNewSaveData();
    end;
    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
        l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
    end;
    v79:dispatch(v37(v85, v80, nil, v31.LookType.Avatar));
    if v38() and not v83 then
        v79:dispatch(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Closed));
    end;
end;
local function v111(v101, v102, v103, v104, v105) --[[ Line: 196 ]] --[[ Name: handleSaveAsCharacter ]]
    -- upvalues: v41 (copy), v40 (copy), v21 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (copy), v31 (copy), l_SaveAsMakeupLookThunk_0 (copy), v16 (copy)
    local v106 = v101:getState();
    local v107 = v106.AvatarExperience.AvatarScene.Looks[v102];
    local v108 = if v107 and v107.name then v107.name else nil;
    local v109 = v41.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v106);
    local v110 = nil;
    v110 = v40() and v108 or v21;
    if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 and v107 and v107.lookType == v31.LookType.Makeup then
        v101:dispatch(l_SaveAsMakeupLookThunk_0(v104, v110, v105));
        return;
    else
        v101:dispatch((v16(v110, v103, function() --[[ Line: 216 ]]
            return true;
        end, nil, v109)));
        return;
    end;
end;
return function(v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125) --[[ Line: 233 ]] --[[ Name: handleLooksPurchaseSuccess ]]
    -- upvalues: l_PurchaseLookStatusEnum_0 (copy), v64 (copy), v14 (copy), v15 (copy), v3 (copy), v11 (copy), v12 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AvatarScreenProperties_0 (copy), v29 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v31 (copy), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), v4 (copy), l_UnifiedEventLogEnums_0 (copy), l_CartIdService_0 (copy), l_mutedError_0 (copy), l_UnifiedSelectionListStore_0 (copy), l_WidgetConstants_0 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v13 (copy), v17 (copy), v100 (copy), v111 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (copy), l_setTimeout_0 (copy), v10 (copy), v2 (copy), v55 (copy)
    return function(v126) --[[ Line: 249 ]]
        -- upvalues: v112 (copy), l_PurchaseLookStatusEnum_0 (ref), v64 (ref), v14 (ref), v15 (ref), v114 (copy), v3 (ref), v11 (ref), v121 (ref), v12 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v125 (copy), l_AvatarScreenProperties_0 (ref), v29 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v115 (copy), v31 (ref), v113 (copy), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), l_CartIdService_0 (ref), v116 (copy), l_mutedError_0 (ref), l_UnifiedSelectionListStore_0 (ref), v123 (copy), l_WidgetConstants_0 (ref), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v122 (copy), v13 (ref), v17 (ref), v100 (ref), v117 (copy), v118 (copy), v120 (copy), v119 (copy), v111 (ref), v124 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (ref), l_setTimeout_0 (ref), v10 (ref), v2 (ref), v55 (ref)
        local l_v112_0 = v112;
        local v128 = true;
        if l_v112_0.purchaseLookStatus ~= l_PurchaseLookStatusEnum_0.Success then
            v128 = l_v112_0.purchaseLookStatus == l_PurchaseLookStatusEnum_0.PartialSuccess;
        end;
        if v128 and type(l_v112_0) == "table" then
            local l_l_v112_0_0 = l_v112_0;
            local v130 = 0;
            local v131 = 0;
            local v132 = {};
            local v133 = {};
            local v134, v135, v136 = v64(v126, l_l_v112_0_0.assetPurchaseStatus, v14, v130, v131, v132);
            v130 = v134;
            v131 = v135;
            v132 = v136;
            v134, v135, v136 = v64(v126, l_l_v112_0_0.bundlePurchaseStatus, v15, v130, v131, v133);
            v130 = v134;
            v131 = v135;
            v133 = v136;
            v134 = v114;
            v135 = v126:getState().LocalUserId;
            v3.isNonEmptyString(v135, "Thunk.PurchaseProduct.updateRobux.localUserId");
            if typeof(v135) == "string" and v135 ~= "" then
                v126:dispatch(v11(v134, v135, true));
            end;
            v134 = nil;
            v135 = nil;
            v136 = nil;
            local v137 = nil;
            local v138 = nil;
            local v139 = v126:getState();
            if v121 then
                v134 = v121.query;
            else
                local v140, v141, v142, v143, v144 = v12.getAvatarsTabAnalyticsInfo(v139);
                v134 = v140;
                v135 = v141;
                v136 = v142;
                v137 = v143;
                v138 = v144;
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 291 ]]
                -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v126 (copy), v125 (ref), l_AvatarScreenProperties_0 (ref), v29 (ref), v121 (ref), v132 (ref), v133 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v139 (copy), v115 (ref), v31 (ref), v113 (ref), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), l_CartIdService_0 (ref), v134 (ref), v116 (ref)
                local v145 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentRoactNavigationRoute(v126:getState()) else v126:getState().Navigation and v126:getState().Navigation.currentRoute;
                local v146 = nil;
                local v147 = nil;
                if v125 and v125.current and v125.opaque then
                    v147 = v125.opaque.name;
                elseif v145.params and v145.params.extraProps then
                    v147 = v145.params.extraProps.routeName;
                end;
                v146 = l_AvatarScreenProperties_0[v147];
                local v148 = if v29 then v121 == nil else nil;
                local v149 = nil;
                local v150 = nil;
                if v29 and #v132 > 0 then
                    v149 = table.concat(v132, ",");
                end;
                if v29 and #v133 > 0 then
                    v150 = table.concat(v133, ",");
                end;
                local l_LookAnalyticsInfo_0 = v126:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
                if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and v139.AvatarExperience.AvatarScene.Looks[v115].lookType == v31.LookType.Makeup then
                    l_LookAnalyticsInfo_0 = v126:getState().AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo;
                end;
                local v152 = false;
                if v113[v31.WearAfterPurchasePostPurchaseActionKey] then
                    v152 = v113[v31.WearAfterPurchasePostPurchaseActionKey];
                end;
                local v153 = false;
                if v113[v31.SaveAsCharacterPostPurchaseActionKey] then
                    v153 = v113[v31.SaveAsCharacterPostPurchaseActionKey];
                end;
                local v154 = nil;
                if l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 then
                    if v121 and v121.surface then
                        v154 = v121.surface;
                    elseif v146 and v146.analyticsData then
                        v154 = v146.analyticsData.unifiedLoggingSurface;
                    end;
                end;
                local v155 = l_LookAnalyticsInfo_0 or {
                    widgetType = nil
                };
                l_sendUnifiedEventForDeferredAction_0(v4.Dictionary.join(v126:getState().AvatarExperience.AnalyticsMetadata, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                    cartId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_CartIdService_0.getCartId() else nil, 
                    itemId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v115 else nil, 
                    itemType = if l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else nil, 
                    keyword = v134, 
                    surface = if l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 then v154 else if v146 and v146.analyticsData then v146.analyticsData.unifiedLoggingSurface else nil, 
                    organicAssetIds = if v29 and v148 then v149 else nil, 
                    organicBundleIds = if v29 and v148 then v150 else nil, 
                    organicItemPrice = if v29 and v148 then v116 else nil, 
                    assetIds = if not v29 or v148 then nil else v149, 
                    bundleIds = if not v29 or v148 then nil else v150, 
                    widgetItemPrice = if not v29 or v148 then nil else v116, 
                    widgetItemWearAfterPurchase = if v155.widgetType then v152 else nil, 
                    organicItemWearAfterPurchase = if v155.widgetType then nil else v152, 
                    widgetItemSaveToMyAvatars = if v155.widgetType then v153 else nil, 
                    organicItemSaveToMyAvatars = if v155.widgetType then nil else v153
                }));
            end);
            if not l_status_0 then
                l_mutedError_0(l_result_0);
            end;
            if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
                l_CartIdService_0.refreshCartId();
                l_UnifiedSelectionListStore_0.clearSelectionList();
            end;
            l_l_v112_0_0 = v4.Dictionary.join(l_l_v112_0_0, {
                successCount = v130, 
                failureCount = v131
            });
            if v121 then
                v121 = v4.Dictionary.join(v121, {
                    assetIds = v132
                });
                if #v132 > 0 or #v133 > 0 then
                    v123.widgetInteractionV2(v121, l_WidgetConstants_0.ActionType.PURCHASE_SUCCESS);
                end;
            elseif not v121 then
                v123.avatarShopBuyItem(v115, l_ItemTypeEnum_0.Look, v116, v138, v137, v134, v135, v136, v126:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v122 then v122.getParam(v31.NavigationParams.fromSurface) else nil);
            end;
            if #v132 > 0 or #v133 > 0 then
                v13.GetLookDetailsV2(v114, v115):andThen(function(v158) --[[ Line: 421 ]]
                    -- upvalues: v126 (copy), v17 (ref), v115 (ref), v132 (ref), v133 (ref)
                    local l_look_0 = v158.responseBody.look;
                    if l_look_0 then
                        local v160 = true;
                        for _, v162 in l_look_0.items do
                            if not v162.quantityOwned or v162.quantityOwned == 0 then
                                v160 = false;
                                break;
                            end;
                        end;
                        v126:dispatch(v17(v115, v132, v133, v160));
                    end;
                end);
            end;
            if v113[v31.WearAfterPurchasePostPurchaseActionKey] then
                v100(l_l_v112_0_0, v126, v122, v117, v118, v120, v119);
            end;
            if v113[v31.SaveAsCharacterPostPurchaseActionKey] then
                local function v163() --[[ Line: 456 ]] --[[ Name: handleSaveAsCharacterWrapper ]]
                    -- upvalues: v111 (ref), v126 (copy), v115 (ref), v124 (ref), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (ref), v114 (ref), v117 (ref)
                    v111(v126, v115, v124, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v114 else nil, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v117 else nil);
                end;
                if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then
                    local v164 = v126:getState().AvatarExperience.AvatarScene.Looks[v115];
                    if v164 and v164.lookType == v31.LookType.Makeup then
                        v111(v126, v115, v124, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v114 else nil, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v117 else nil);
                    else
                        l_setTimeout_0(v163, v10);
                    end;
                else
                    l_setTimeout_0(v163, v10);
                end;
            end;
            return v2.resolve(l_l_v112_0_0);
        else
            local l_v55_0 = v55;
            return v2.reject(l_v55_0);
        end;
    end;
end;