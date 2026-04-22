local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_setTimeout_0 = require(l_CorePackages_0.Packages.LuauPolyfill).setTimeout;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateOutfit);
local l_SaveAsMakeupLookThunk_0 = v7.Thunks.SaveAsMakeupLookThunk;
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseLooksProduct);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_SetTryOnManagerPeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState;
local v19 = require(l_Modules_0.LuaApp.mutedError);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v23 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local v24 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v25 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v26 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v27 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v28 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v29 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_getUseSelectorDeepEquals_0 = v6.Utils.getUseSelectorDeepEquals;
local l_getTryOnItemReducerKey_0 = v6.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v6.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v35 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local v36 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_isEconomicRestrictionResponse_0 = v36.Utility.isEconomicRestrictionResponse;
local l_EconomicRestrictionsCounter_0 = v36.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local l_parseEconomicRestrictionsFailureReason_0 = v36.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v36.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_useTriggerFeedback_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).useTriggerFeedback;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v48 = game:DefineFastString("AXDefaultCharacterName", "Avatar");
local l_FIntAXLookOutfitCreationDelayMs_0 = v5.FIntAXLookOutfitCreationDelayMs;
local v50 = game:DefineFastFlag("SupportAlreadyOwnedItemPurchaseStatus", false);
local v51 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableSavePurchasedLooksWithLookName);
local v52 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXCatalogMakeupSupport_0 = v5.FFlagAXCatalogMakeupSupport;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v5.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v5.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local v57 = l_FFlagAXRootSlotBasedEditorFlag_0 and game:DefineFastFlag("AXDisableCharacterSaveToast", false);
local function _(v58) --[[ Line: 105 ]] --[[ Name: PurchaseResolveNav ]]
    -- upvalues: v20 (copy)
    v20.closeOverlay(v58);
end;
local function v67(v60, v61, v62) --[[ Line: 113 ]] --[[ Name: formatItemForWearAfterPurchaseMIS ]]
    -- upvalues: v12 (copy)
    local v63 = v61.itemType == v12.ItemType.Bundle;
    local v64 = {};
    if v63 then
        for _, v66 in v61.assetsInBundle do
            if v66.isIncluded then
                v64[tostring(v66.id)] = {
                    assetType = tostring(v66.assetType), 
                    order = v66.order
                };
            end;
        end;
    end;
    return {
        assetId = if not v63 then v60 else nil, 
        assetIsWearable = not v63, 
        assetType = if v63 then v12.ItemType.Bundle else nil, 
        bundleId = if v63 then v60 else nil, 
        itemSubType = if v63 then tostring(v61.bundleType) else tostring(v61.assetType), 
        owned = true, 
        purchased = v62, 
        tryOnBundleInfo = if v63 then v64 else nil
    };
end;
local function v72(v68, v69, v70) --[[ Line: 144 ]] --[[ Name: formatItemForWearAfterPurchaseLegacy ]]
    -- upvalues: v12 (copy)
    local v71 = v69.itemType == v12.ItemType.Bundle;
    return {
        assetId = if not v71 then v68 else nil, 
        assetIsWearable = not v71, 
        assetType = if v71 then v12.ItemType.Bundle else nil, 
        bundleId = if v71 then v68 else nil, 
        itemSubType = v69.itemSubType, 
        overrideOrder = v69.order, 
        overrideAdjustments = {
            position = v69.position, 
            rotation = v69.rotation, 
            scale = v69.scale
        }, 
        owned = true, 
        purchased = v70, 
        tryOnBundleInfo = if v71 then v69.bundleInfo else nil
    };
end;
local _ = function(v73, v74, v75, v76, _) --[[ Line: 169 ]] --[[ Name: processItem ]]
    -- upvalues: v50 (copy), v67 (copy)
    local v78 = true;
    if v76 ~= "Success" then
        v78 = v50 and v76 == "AlreadyOwned";
    end;
    if v78 and v74[v75] ~= nil then
        table.insert(v73, (v67(v75, v74[v75], true)));
    end;
    return v73;
end;
local function v88(v80, v81, v82, v83, v84, v85) --[[ Line: 183 ]] --[[ Name: processItemLegacy ]]
    -- upvalues: v50 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_getTryOnItemReducerKey_0 (copy), v72 (copy)
    local v86 = true;
    if v83 ~= "Success" then
        v86 = v50 and v83 == "AlreadyOwned";
    end;
    local v87 = if v84 ~= nil and (not (v85 ~= v12.LookType.Avatar) or l_FFlagAXCatalogMakeupSupport_0 and v85 == v12.LookType.Makeup) then l_getTryOnItemReducerKey_0(v82, v84) else v82;
    if v86 and v81[v87] ~= nil then
        table.insert(v80, (v72(v82, v81[v87], true)));
    end;
    return v80;
end;
local function v100(v89, v90, v91) --[[ Line: 216 ]] --[[ Name: ShowToasts ]]
    -- upvalues: v25 (copy), v24 (copy)
    local l_successCount_0 = v89.successCount;
    local l_failureCount_0 = v89.failureCount;
    if l_successCount_0 > 0 and l_failureCount_0 <= 0 then
        local v94 = if l_successCount_0 == 1 then v91:Format("Feature.Avatar.Message.LooksPurchaseSuccessSingular", {
            numItems = l_successCount_0
        }) else v91:Format("Feature.Avatar.Message.LooksPurchaseSuccessPlural", {
            numItems = l_successCount_0
        });
        local v95 = {
            isLocalized = true, 
            toastMessage = v94, 
            toastType = v25.PurchaseMessage
        };
        v90(v24(v95));
        return;
    elseif l_successCount_0 > 0 and l_failureCount_0 > 0 then
        local v96 = nil;
        v96 = l_successCount_0 == 1 and l_failureCount_0 == 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSS" or l_successCount_0 == 1 and l_failureCount_0 > 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSP" or l_successCount_0 > 1 and l_failureCount_0 == 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPS" or "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPP";
        local v97 = {
            numSuccessItems = l_successCount_0, 
            numFailureItems = l_failureCount_0
        };
        local v98 = {
            isLocalized = true, 
            toastMessage = v91:Format("Feature.Avatar.Heading.LooksPurchasePartialSuccess"), 
            toastSubMessage = v91:Format(v96, v97), 
            toastType = v25.NetworkingError
        };
        v90(v24(v98));
        return;
    elseif l_successCount_0 <= 0 and l_failureCount_0 > 0 then
        local v99 = {
            isLocalized = true, 
            toastMessage = v91:Format("Feature.Avatar.Heading.LooksPurchaseFailed"), 
            toastSubMessage = v91:Format("Feature.Avatar.Message.LooksPurchaseFailedNetworkError"), 
            toastType = v25.NetworkingError
        };
        v90(v24(v99));
        return;
    else
        return;
    end;
end;
local function v102(v101) --[[ Line: 281 ]] --[[ Name: selectTryOnItems ]]
    return v101.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v104(v103) --[[ Line: 285 ]] --[[ Name: selectLookAnalyticsInfo ]]
    return v103.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
end;
local v105 = nil;
if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
    v105 = function(v106) --[[ Line: 291 ]]
        return v106.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo;
    end;
end;
return (v22((v21(function(v107) --[[ Line: 296 ]] --[[ Name: PurchaseLookPrompt ]]
    -- upvalues: v27 (copy), v29 (copy), l_useDispatch_0 (copy), v28 (copy), v8 (copy), v16 (copy), l_useTriggerFeedback_0 (copy), v2 (copy), l_useAvatarSaveContext_0 (copy), l_useSelector_0 (copy), v104 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v105 (ref), v102 (copy), v23 (copy), v51 (copy), v26 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v25 (copy), v24 (copy), v72 (copy), v88 (copy), v67 (copy), v50 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v15 (copy), v52 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_PeekViewState_0 (copy), v48 (copy), l_SaveAsMakeupLookThunk_0 (copy), v57 (copy), v10 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v20 (copy), v35 (copy), v14 (copy), v100 (copy), l_setTimeout_0 (copy), l_FIntAXLookOutfitCreationDelayMs_0 (copy), l_sendAXCounterV2_0 (copy), v19 (copy), l_isEconomicRestrictionResponse_0 (copy), v13 (copy)
    local v108 = v27(v29);
    local v109 = l_useDispatch_0();
    local v110 = v27(v28);
    local v111 = v27(v8);
    local v112 = v27(v16);
    local v113 = l_useTriggerFeedback_0();
    local v114, v115 = v2.useState(false);
    local v116, v117 = v2.useState(true);
    local v118, v119 = v2.useState(true);
    local v120 = l_useAvatarSaveContext_0();
    local v121 = l_useSelector_0(v104, l_getUseSelectorDeepEquals_0());
    local v122 = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_useSelector_0(v105, l_getUseSelectorDeepEquals_0()) else nil;
    local v123 = l_useSelector_0(v102, l_getUseSelectorDeepEquals_0());
    local v125 = l_useSelector_0(function(v124) --[[ Line: 315 ]]
        -- upvalues: v23 (ref)
        return v23.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v124);
    end, l_getUseSelectorDeepEquals_0());
    local v128 = l_useSelector_0(function(v126) --[[ Line: 319 ]]
        -- upvalues: v107 (copy)
        local v127 = v126.AvatarExperience.AvatarScene.Looks[v107.lookId];
        if v127 then
            return v127.lookType;
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v129 = nil;
    if v51() then
        v129 = l_useSelector_0(function(v130) --[[ Line: 327 ]]
            -- upvalues: v107 (copy)
            local v131 = v130.AvatarExperience.AvatarScene.Looks[v107.lookId];
            if v131 and v131.name then
                return v131.name;
            else
                return nil;
            end;
        end, l_getUseSelectorDeepEquals_0());
    end;
    local v132 = v26({
        buyButtonText = v128 == v12.LookType.Avatar and "Feature.Avatar.Title.BuyAvatar" or l_FFlagAXCatalogMakeupSupport_0 and v128 == v12.LookType.Makeup and "Feature.Avatar.Title.BuyMakeup" or "Feature.Avatar.Title.BuyOutfit", 
        buyLookQuestion = v128 == v12.LookType.Avatar and "Feature.Avatar.Label.BuyAvatarQuestion" or l_FFlagAXCatalogMakeupSupport_0 and v128 == v12.LookType.Makeup and "Feature.Avatar.Label.BuyMakeupQuestion" or "Feature.Avatar.Label.BuyLookQuestion", 
        buyLookTitle = v128 == v12.LookType.Avatar and "Feature.Avatar.Title.BuyAvatar" or l_FFlagAXCatalogMakeupSupport_0 and v128 == v12.LookType.Makeup and "Feature.Avatar.Title.BuyMakeup" or "Feature.Avatar.Title.BuyOutfit", 
        getButtonText = "Feature.Catalog.Label.Get", 
        getLookQuestion = "Feature.Avatar.Label.GetLookQuestion", 
        getLookTitle = "Feature.Avatar.Title.GetOutfit", 
        characterSavedHeading = "Feature.Avatar.Heading.LooksCharacterSaved", 
        characterSavedMsg = "Feature.Avatar.Message.LooksCharacterSaved", 
        makeupLookSavedHeading = "Feature.Avatar.Heading.MakeupLookSaved", 
        makeupLookSavedMsg = "Feature.Avatar.Message.MakeupLookSaved"
    });
    local function v133() --[[ Line: 362 ]]
        -- upvalues: v117 (copy), v116 (copy)
        v117(not v116);
    end;
    local function v134() --[[ Line: 366 ]]
        -- upvalues: v119 (copy), v118 (copy)
        v119(not v118);
    end;
    local function v137(v135) --[[ Line: 371 ]]
        -- upvalues: v132 (copy), v25 (ref), v109 (copy), v24 (ref)
        if not v135 then
            return;
        else
            local v136 = {
                isLocalized = true, 
                toastMessage = v132.characterSavedHeading, 
                toastSubMessage = v132.characterSavedMsg, 
                toastType = v25.SuccessConfirmation
            };
            v109(v24(v136));
            return;
        end;
    end;
    local function v139() --[[ Line: 387 ]]
        -- upvalues: v132 (copy), v25 (ref), v109 (copy), v24 (ref)
        local v138 = {
            isLocalized = true, 
            toastMessage = v132.makeupLookSavedHeading, 
            toastSubMessage = v132.makeupLookSavedMsg, 
            toastType = v25.SuccessConfirmation
        };
        v109(v24(v138));
    end;
    local function v162(v140) --[[ Line: 397 ]] --[[ Name: handleWearAfterPurchase ]]
        -- upvalues: v116 (copy), v107 (copy), v72 (ref), v123 (copy), v88 (ref), v12 (ref), v128 (copy), v67 (ref), v50 (ref), v120 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), v109 (copy), v15 (ref), v52 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref)
        if not v116 then
            return;
        else
            local v141 = {};
            if v107.isTryOnFromOutsideAX then
                if v107.ownedTryOnItems then
                    for _, v143 in v107.ownedTryOnItems do
                        table.insert(v141, (v72(v143.itemId, v143, false)));
                    end;
                end;
                if v123 then
                    for v144, v145 in v140.assetPurchaseStatus do
                        v141 = v88(v141, v123, v144, v145, v12.ItemType.Asset, v128);
                    end;
                    for v146, v147 in v140.bundlePurchaseStatus do
                        v141 = v88(v141, v123, v146, v147, v12.ItemType.Bundle, v128);
                    end;
                end;
            else
                if v107.ownedItemsInLook then
                    for _, v149 in v107.ownedItemsInLook do
                        table.insert(v141, (v67(v149.id, v149, false)));
                    end;
                end;
                if v107.allLookItems then
                    for v150, v151 in v140.assetPurchaseStatus do
                        local l_v141_0 = v141;
                        local l_allLookItems_0 = v107.allLookItems;
                        local _ = v12.ItemType.Asset;
                        local v155 = true;
                        if v151 ~= "Success" then
                            v155 = v50 and v151 == "AlreadyOwned";
                        end;
                        if v155 and l_allLookItems_0[v150] ~= nil then
                            table.insert(l_v141_0, (v67(v150, l_allLookItems_0[v150], true)));
                        end;
                        v141 = l_v141_0;
                    end;
                    for v156, v157 in v140.bundlePurchaseStatus do
                        local l_v141_1 = v141;
                        local l_allLookItems_1 = v107.allLookItems;
                        local _ = v12.ItemType.Bundle;
                        local v161 = true;
                        if v157 ~= "Success" then
                            v161 = v50 and v157 == "AlreadyOwned";
                        end;
                        if v161 and l_allLookItems_1[v156] ~= nil then
                            table.insert(l_v141_1, (v67(v156, l_allLookItems_1[v156], true)));
                        end;
                        v141 = l_v141_1;
                    end;
                end;
            end;
            if v107.isTryOnFromOutsideAX and v120 and v120.autoSaveNextNewSaveData then
                v120.autoSaveNextNewSaveData();
            end;
            if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
                l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
            end;
            v109(v15(v141, v107.navigation, nil, v128));
            if v52() and not v107.isTryOnFromOutsideAX then
                v109(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Closed));
            end;
            return;
        end;
    end;
    local function v165() --[[ Line: 498 ]] --[[ Name: handleSaveAsCharacter ]]
        -- upvalues: v118 (copy), v51 (ref), v129 (ref), v48 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v128 (copy), v12 (ref), v109 (copy), l_SaveAsMakeupLookThunk_0 (ref), v108 (copy), v123 (copy), v57 (ref), v139 (copy), v10 (ref), v111 (copy), v137 (copy), v125 (copy)
        if not v118 then
            return;
        else
            local v163 = nil;
            v163 = if v51() and v129 then v129 else v48;
            local function v164() --[[ Line: 512 ]]
                return true;
            end;
            if l_FFlagAXCatalogMakeupSupport_0 and v128 == v12.LookType.Makeup then
                v109(l_SaveAsMakeupLookThunk_0(v108, v163, v123, if v57 then nil else v139));
                return;
            else
                v109(v10(v163, v111, v164, if v57 then nil else v137, v125));
                return;
            end;
        end;
    end;
    local v169 = v107.isTryOnFromOutsideAX and function(v166) --[[ Line: 539 ]]
        -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v20 (ref), v107 (copy), v109 (copy), v35 (ref)
        local v167 = l_parseEconomicRestrictionsFailureReason_0(v166);
        local v168 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v166);
        l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
            surface = l_EconomicRestrictionsSurface_0.AvatarExperienceLook, 
            failureReason = v167
        });
        v20.closeOverlay(v107.navigation);
        return v109(v35(v167, v168));
    end or nil;
    local function v174() --[[ Line: 551 ]]
        -- upvalues: v114 (copy), v115 (copy), v113 (copy), v109 (copy), v14 (ref), v108 (copy), v107 (copy), v112 (copy), v100 (ref), v110 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), v128 (copy), v12 (ref), v165 (copy), v162 (copy), l_setTimeout_0 (ref), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v20 (ref), l_sendAXCounterV2_0 (ref), v19 (ref), v169 (copy), l_isEconomicRestrictionResponse_0 (ref), v24 (ref), v25 (ref)
        if v114 then
            return;
        else
            v115(true);
            v113("MakePurchase", "Press");
            v109(v14(v108, v107.lookId, v107.priceInRobux, v112)):andThen(function(v170) --[[ Line: 560 ]]
                -- upvalues: v115 (ref), v100 (ref), v109 (ref), v110 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v128 (ref), v12 (ref), v165 (ref), v162 (ref), l_setTimeout_0 (ref), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v107 (ref), v20 (ref)
                v115(false);
                v100(v170, v109, v110);
                if l_FFlagAXCatalogMakeupSupport_0 and v128 == v12.LookType.Makeup then
                    v165();
                end;
                v162(v170);
                if v128 == v12.LookType.Avatar then
                    l_setTimeout_0(v165, l_FIntAXLookOutfitCreationDelayMs_0);
                end;
                local l_navigation_0 = v107.navigation;
                v20.closeOverlay(l_navigation_0);
            end, function(v172) --[[ Line: 573 ]]
                -- upvalues: l_sendAXCounterV2_0 (ref), v12 (ref), v107 (ref), v19 (ref), v169 (ref), l_isEconomicRestrictionResponse_0 (ref), v115 (ref), v109 (ref), v24 (ref), v25 (ref), v20 (ref)
                l_sendAXCounterV2_0(v12.Counter.Errors.PurchaseLooksProductError, {
                    lookId = v107.lookId, 
                    promptType = "PurchaseLookPromptMIS", 
                    isTryOnFromOutsideAX = tostring(v107.isTryOnFromOutsideAX)
                });
                v19("PurchaseLooksProductMIS error", v172);
                if v169 and l_isEconomicRestrictionResponse_0(v172) then
                    v169(v172);
                    return;
                else
                    v115(false);
                    v109(v24({
                        isLocalized = false, 
                        toastType = v25.NetworkingError, 
                        toastMessage = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName"
                    }));
                    local l_navigation_1 = v107.navigation;
                    v20.closeOverlay(l_navigation_1);
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v175() --[[ Line: 597 ]]
        -- upvalues: v114 (copy), v20 (ref), v107 (copy)
        if v114 then
            return;
        else
            v20.closeOverlay(v107.navigation);
            return;
        end;
    end;
    local v176 = v107.priceInRobux == 0;
    local v177 = nil;
    local v178 = nil;
    local v179 = nil;
    if v176 then
        v177 = v132.getLookTitle;
        v178 = v132.getLookQuestion;
        v179 = v132.getButtonText;
    else
        v177 = v132.buyLookTitle;
        v178 = v132.buyLookQuestion;
        v179 = v132.buyButtonText;
    end;
    return v2.createElement(v13, {
        priceInRobux = v107.priceInRobux, 
        showWearAfterPurchase = v107.showWearAfterPurchase, 
        showSaveAsCharacter = v107.showSaveAsCharacter, 
        isWearAfterPurchaseChecked = v116, 
        isSaveAsCharacterChecked = v118, 
        toggleWearAfterPurchase = v133, 
        toggleSaveAsCharacter = v134, 
        saveIfWearAfterPurchase = v107.isTryOnFromOutsideAX, 
        lookType = v128, 
        analyticsInfo = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and v128 == v12.LookType.Makeup then v122 else v121, 
        titleText = v177, 
        bodyText = v178, 
        confirmButtonText = v179, 
        onConfirm = v174, 
        onCancel = v175, 
        isLoading = v114, 
        isPurchasingOutfit = true, 
        defaultChildRef = v107.defaultChildRef
    });
end))));