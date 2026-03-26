local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local l_setTimeout_0 = require(l_CorePackages_0.Packages.LuauPolyfill).setTimeout;
local v9 = game:DefineFastInt("AXLookOutfitCreationDelayMs1", 5000);
local v10 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateOutfit);
local v16 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase);
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v20 = game:DefineFastString("AXDefaultCharacterName", "Avatar");
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums;
local l_PurchaseLookStatusEnum_0 = l_Enums_0.PurchaseLookStatusEnum;
local l_PurchaseLookItemStatusEnum_0 = l_Enums_0.PurchaseLookItemStatusEnum;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v5.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v26 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v27 = game:DefineFastFlag("AXUnifiedSubsetOfLook", false);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v29 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local l_getTryOnItemReducerKey_0 = v25.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v25.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableSavePurchasedLooksWithLookName);
local v39 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_SaveAsMakeupLookThunk_0 = v26.Thunks.SaveAsMakeupLookThunk;
local l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 = v5.FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v6.FFlagAXFixPurchaseSurfaceLogging;
local function _(v44, v45) --[[ Line: 60 ]] --[[ Name: updateRobux ]]
    -- upvalues: v3 (copy), v10 (copy)
    local l_LocalUserId_0 = v45:getState().LocalUserId;
    v3.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v45:dispatch(v10(v44, l_LocalUserId_0, true));
    end;
end;
local v48 = {
    HttpError = Enum.HttpError.OK
};
local function v57(v49, v50, v51, v52, v53, v54) --[[ Line: 70 ]]
    -- upvalues: l_PurchaseLookItemStatusEnum_0 (copy)
    for v55, v56 in v50 do
        if v56 == l_PurchaseLookItemStatusEnum_0.Success or v56 == l_PurchaseLookItemStatusEnum_0.AlreadyOwned then
            v52 = v52 + 1;
            v49:dispatch(v51(v55, true));
            if v56 == l_PurchaseLookItemStatusEnum_0.Success then
                table.insert(v54, (tonumber(v55)));
            end;
        else
            v53 = v53 + 1;
        end;
    end;
    return v52, v53, v54;
end;
local function v62(v58, v59, v60) --[[ Line: 97 ]] --[[ Name: formatItemForWearAfterPurchase ]]
    -- upvalues: v29 (copy)
    local v61 = v59.itemType == v29.ItemType.Bundle;
    return {
        assetId = if not v61 then v58 else nil, 
        assetIsWearable = not v61, 
        assetType = if v61 then v29.ItemType.Bundle else nil, 
        bundleId = if v61 then v58 else nil, 
        itemSubType = v59.itemSubType, 
        overrideOrder = v59.order, 
        overrideAdjustments = {
            position = v59.position, 
            rotation = v59.rotation, 
            scale = v59.scale
        }, 
        owned = true, 
        purchased = v60, 
        tryOnBundleInfo = if v61 then v59.bundleInfo else nil
    };
end;
local function _(v63, v64, v65, v66, v67) --[[ Line: 118 ]] --[[ Name: processItem ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), v62 (copy)
    local v68 = true;
    if v66 ~= "Success" then
        v68 = v66 == "AlreadyOwned";
    end;
    local v69 = if v67 ~= nil then l_getTryOnItemReducerKey_0(v65, v67) else v65;
    if v68 and v64[v69] ~= nil then
        table.insert(v63, (v62(v65, v64[v69], true)));
    end;
    return v63;
end;
local function v93(v71, v72, v73, v74, v75, v76, v77) --[[ Line: 132 ]] --[[ Name: handleWearAfterPurchase ]]
    -- upvalues: v62 (copy), v29 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v35 (copy), v36 (copy), v34 (copy), l_PeekViewState_0 (copy)
    local v78 = {};
    for _, v80 in v75 do
        table.insert(v78, (v62(v80.itemId, v80, false)));
    end;
    for v81, v82 in v71.assetPurchaseStatus do
        local l_v78_0 = v78;
        local l_Asset_0 = v29.ItemType.Asset;
        local v85 = true;
        if v82 ~= "Success" then
            v85 = v82 == "AlreadyOwned";
        end;
        local v86 = if l_Asset_0 ~= nil then l_getTryOnItemReducerKey_0(v81, l_Asset_0) else v81;
        if v85 and v74[v86] ~= nil then
            table.insert(l_v78_0, (v62(v81, v74[v86], true)));
        end;
        v78 = l_v78_0;
    end;
    for v87, v88 in v71.bundlePurchaseStatus do
        local l_v78_1 = v78;
        local l_Bundle_0 = v29.ItemType.Bundle;
        local v91 = true;
        if v88 ~= "Success" then
            v91 = v88 == "AlreadyOwned";
        end;
        local v92 = if l_Bundle_0 ~= nil then l_getTryOnItemReducerKey_0(v87, l_Bundle_0) else v87;
        if v91 and v74[v92] ~= nil then
            table.insert(l_v78_1, (v62(v87, v74[v92], true)));
        end;
        v78 = l_v78_1;
    end;
    if v76 and v77 and v77.autoSaveNextNewSaveData then
        v77.autoSaveNextNewSaveData();
    end;
    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
        l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
    end;
    v72:dispatch(v35(v78, v73, nil, v29.LookType.Avatar));
    if v36() and not v76 then
        v72:dispatch(v34(l_PeekViewState_0.Closed));
    end;
end;
local function v104(v94, v95, v96, v97, v98) --[[ Line: 185 ]] --[[ Name: handleSaveAsCharacter ]]
    -- upvalues: v39 (copy), v38 (copy), v20 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (copy), v29 (copy), l_SaveAsMakeupLookThunk_0 (copy), v15 (copy)
    local v99 = v94:getState();
    local v100 = v99.AvatarExperience.AvatarScene.Looks[v95];
    local v101 = if v100 and v100.name then v100.name else nil;
    local v102 = v39.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v99);
    local v103 = nil;
    v103 = v38() and v101 or v20;
    if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 and v100 and v100.lookType == v29.LookType.Makeup then
        v94:dispatch(l_SaveAsMakeupLookThunk_0(v97, v103, v98));
        return;
    else
        v94:dispatch((v15(v103, v96, function() --[[ Line: 205 ]]
            return true;
        end, nil, v102)));
        return;
    end;
end;
return function(v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118) --[[ Line: 222 ]] --[[ Name: handleLooksPurchaseSuccess ]]
    -- upvalues: l_PurchaseLookStatusEnum_0 (copy), v57 (copy), v13 (copy), v14 (copy), v3 (copy), v10 (copy), v11 (copy), l_AvatarScreenProperties_0 (copy), v27 (copy), v29 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), v4 (copy), l_UnifiedEventLogEnums_0 (copy), l_mutedError_0 (copy), v7 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v12 (copy), v16 (copy), v93 (copy), v104 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (copy), l_setTimeout_0 (copy), v9 (copy), v2 (copy), v48 (copy)
    return function(v119) --[[ Line: 238 ]]
        -- upvalues: v105 (copy), l_PurchaseLookStatusEnum_0 (ref), v57 (ref), v13 (ref), v14 (ref), v107 (copy), v3 (ref), v10 (ref), v114 (ref), v11 (ref), v118 (copy), l_AvatarScreenProperties_0 (ref), v27 (ref), v106 (copy), v29 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), v109 (copy), l_mutedError_0 (ref), v116 (copy), v7 (ref), v108 (copy), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v115 (copy), v12 (ref), v16 (ref), v93 (ref), v110 (copy), v111 (copy), v113 (copy), v112 (copy), v104 (ref), v117 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (ref), l_setTimeout_0 (ref), v9 (ref), v2 (ref), v48 (ref)
        local l_v105_0 = v105;
        local v121 = true;
        if l_v105_0.purchaseLookStatus ~= l_PurchaseLookStatusEnum_0.Success then
            v121 = l_v105_0.purchaseLookStatus == l_PurchaseLookStatusEnum_0.PartialSuccess;
        end;
        if v121 and type(l_v105_0) == "table" then
            local l_l_v105_0_0 = l_v105_0;
            local v123 = 0;
            local v124 = 0;
            local v125 = {};
            local v126 = {};
            local v127, v128, v129 = v57(v119, l_l_v105_0_0.assetPurchaseStatus, v13, v123, v124, v125);
            v123 = v127;
            v124 = v128;
            v125 = v129;
            v127, v128, v129 = v57(v119, l_l_v105_0_0.bundlePurchaseStatus, v14, v123, v124, v126);
            v123 = v127;
            v124 = v128;
            v126 = v129;
            v127 = v107;
            v128 = v119:getState().LocalUserId;
            v3.isNonEmptyString(v128, "Thunk.PurchaseProduct.updateRobux.localUserId");
            if typeof(v128) == "string" and v128 ~= "" then
                v119:dispatch(v10(v127, v128, true));
            end;
            v127 = nil;
            v128 = nil;
            v129 = nil;
            local v130 = nil;
            local v131 = nil;
            local v132 = v119:getState();
            if v114 then
                v127 = v114.query;
            else
                local v133, v134, v135, v136, v137 = v11.getAvatarsTabAnalyticsInfo(v132);
                v127 = v133;
                v128 = v134;
                v129 = v135;
                v130 = v136;
                v131 = v137;
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 280 ]]
                -- upvalues: v119 (copy), v118 (ref), l_AvatarScreenProperties_0 (ref), v27 (ref), v114 (ref), v125 (ref), v126 (ref), v106 (ref), v29 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), v127 (ref), v109 (ref)
                local v138 = v119:getState().Navigation and v119:getState().Navigation.currentRoute;
                local v139 = nil;
                local v140 = nil;
                if v118 and v118.current and v118.opaque then
                    v140 = v118.opaque.name;
                elseif v138.params and v138.params.extraProps then
                    v140 = v138.params.extraProps.routeName;
                end;
                v139 = l_AvatarScreenProperties_0[v140];
                local v141 = if v27 then v114 == nil else nil;
                local v142 = nil;
                local v143 = nil;
                if v27 and #v125 > 0 then
                    v142 = table.concat(v125, ",");
                end;
                if v27 and #v126 > 0 then
                    v143 = table.concat(v126, ",");
                end;
                local l_LookAnalyticsInfo_0 = v119:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
                local v145 = false;
                if v106[v29.WearAfterPurchasePostPurchaseActionKey] then
                    v145 = v106[v29.WearAfterPurchasePostPurchaseActionKey];
                end;
                local v146 = false;
                if v106[v29.SaveAsCharacterPostPurchaseActionKey] then
                    v146 = v106[v29.SaveAsCharacterPostPurchaseActionKey];
                end;
                local v147 = l_LookAnalyticsInfo_0 or {
                    widgetType = nil
                };
                l_sendUnifiedEventForDeferredAction_0(v4.Dictionary.join(v119:getState().AvatarExperience.AnalyticsMetadata, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                    keyword = v127, 
                    surface = if v139 and v139.analyticsData then v139.analyticsData.unifiedLoggingSurface else nil, 
                    organicAssetIds = if v27 and v141 then v142 else nil, 
                    organicBundleIds = if v27 and v141 then v143 else nil, 
                    organicItemPrice = if v27 and v141 then v109 else nil, 
                    assetIds = if not v27 or v141 then nil else v142, 
                    bundleIds = if not v27 or v141 then nil else v143, 
                    widgetItemPrice = if not v27 or v141 then nil else v109, 
                    widgetItemWearAfterPurchase = if v147.widgetType then v145 else nil, 
                    organicItemWearAfterPurchase = if v147.widgetType then nil else v145, 
                    widgetItemSaveToMyAvatars = if v147.widgetType then v146 else nil, 
                    organicItemSaveToMyAvatars = if v147.widgetType then nil else v146
                }));
            end);
            if not l_status_0 then
                l_mutedError_0(l_result_0);
            end;
            l_l_v105_0_0 = v4.Dictionary.join(l_l_v105_0_0, {
                successCount = v123, 
                failureCount = v124
            });
            if v114 then
                v114 = v4.Dictionary.join(v114, {
                    assetIds = v125
                });
                if #v125 > 0 or #v126 > 0 then
                    v116.widgetInteractionV2(v114, v7.ActionType.PURCHASE_SUCCESS);
                end;
            elseif not v114 then
                v116.avatarShopBuyItem(v108, l_ItemTypeEnum_0.Look, v109, v131, v130, v127, v128, v129, v119:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v115 then v115.getParam(v29.NavigationParams.fromSurface) else nil);
            end;
            if #v125 > 0 or #v126 > 0 then
                v12.GetLookDetailsV2(v107, v108):andThen(function(v150) --[[ Line: 378 ]]
                    -- upvalues: v119 (copy), v16 (ref), v108 (ref), v125 (ref), v126 (ref)
                    local l_look_0 = v150.responseBody.look;
                    if l_look_0 then
                        local v152 = true;
                        for _, v154 in l_look_0.items do
                            if not v154.quantityOwned or v154.quantityOwned == 0 then
                                v152 = false;
                                break;
                            end;
                        end;
                        v119:dispatch(v16(v108, v125, v126, v152));
                    end;
                end);
            end;
            if v106[v29.WearAfterPurchasePostPurchaseActionKey] then
                v93(l_l_v105_0_0, v119, v115, v110, v111, v113, v112);
            end;
            if v106[v29.SaveAsCharacterPostPurchaseActionKey] then
                local function v155() --[[ Line: 413 ]] --[[ Name: handleSaveAsCharacterWrapper ]]
                    -- upvalues: v104 (ref), v119 (copy), v108 (ref), v117 (ref), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (ref), v107 (ref), v110 (ref)
                    v104(v119, v108, v117, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v107 else nil, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v110 else nil);
                end;
                if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then
                    local v156 = v119:getState().AvatarExperience.AvatarScene.Looks[v108];
                    if v156 and v156.lookType == v29.LookType.Makeup then
                        v104(v119, v108, v117, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v107 else nil, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v110 else nil);
                    else
                        l_setTimeout_0(v155, v9);
                    end;
                else
                    l_setTimeout_0(v155, v9);
                end;
            end;
            return v2.resolve(l_l_v105_0_0);
        else
            local l_v48_0 = v48;
            return v2.reject(l_v48_0);
        end;
    end;
end;