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
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
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
local v56 = l_FFlagAXRootSlotBasedEditorFlag_0 and game:DefineFastFlag("AXDisableCharacterSaveToast", false);
local function _(v57) --[[ Line: 103 ]] --[[ Name: PurchaseResolveNav ]]
    -- upvalues: v20 (copy)
    v20.closeOverlay(v57);
end;
local function v66(v59, v60, v61) --[[ Line: 111 ]] --[[ Name: formatItemForWearAfterPurchaseMIS ]]
    -- upvalues: v12 (copy)
    local v62 = v60.itemType == v12.ItemType.Bundle;
    local v63 = {};
    if v62 then
        for _, v65 in v60.assetsInBundle do
            if v65.isIncluded then
                v63[tostring(v65.id)] = {
                    assetType = tostring(v65.assetType), 
                    order = v65.order
                };
            end;
        end;
    end;
    return {
        assetId = if not v62 then v59 else nil, 
        assetIsWearable = not v62, 
        assetType = if v62 then v12.ItemType.Bundle else nil, 
        bundleId = if v62 then v59 else nil, 
        itemSubType = if v62 then tostring(v60.bundleType) else tostring(v60.assetType), 
        owned = true, 
        purchased = v61, 
        tryOnBundleInfo = if v62 then v63 else nil
    };
end;
local function v71(v67, v68, v69) --[[ Line: 142 ]] --[[ Name: formatItemForWearAfterPurchaseLegacy ]]
    -- upvalues: v12 (copy)
    local v70 = v68.itemType == v12.ItemType.Bundle;
    return {
        assetId = if not v70 then v67 else nil, 
        assetIsWearable = not v70, 
        assetType = if v70 then v12.ItemType.Bundle else nil, 
        bundleId = if v70 then v67 else nil, 
        itemSubType = v68.itemSubType, 
        overrideOrder = v68.order, 
        overrideAdjustments = {
            position = v68.position, 
            rotation = v68.rotation, 
            scale = v68.scale
        }, 
        owned = true, 
        purchased = v69, 
        tryOnBundleInfo = if v70 then v68.bundleInfo else nil
    };
end;
local _ = function(v72, v73, v74, v75, _) --[[ Line: 167 ]] --[[ Name: processItem ]]
    -- upvalues: v50 (copy), v66 (copy)
    local v77 = true;
    if v75 ~= "Success" then
        v77 = v50 and v75 == "AlreadyOwned";
    end;
    if v77 and v73[v74] ~= nil then
        table.insert(v72, (v66(v74, v73[v74], true)));
    end;
    return v72;
end;
local function v87(v79, v80, v81, v82, v83, v84) --[[ Line: 181 ]] --[[ Name: processItemLegacy ]]
    -- upvalues: v50 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_getTryOnItemReducerKey_0 (copy), v71 (copy)
    local v85 = true;
    if v82 ~= "Success" then
        v85 = v50 and v82 == "AlreadyOwned";
    end;
    local v86 = if v83 ~= nil and (not (v84 ~= v12.LookType.Avatar) or l_FFlagAXCatalogMakeupSupport_0 and v84 == v12.LookType.Makeup) then l_getTryOnItemReducerKey_0(v81, v83) else v81;
    if v85 and v80[v86] ~= nil then
        table.insert(v79, (v71(v81, v80[v86], true)));
    end;
    return v79;
end;
local function v99(v88, v89, v90) --[[ Line: 214 ]] --[[ Name: ShowToasts ]]
    -- upvalues: v25 (copy), v24 (copy)
    local l_successCount_0 = v88.successCount;
    local l_failureCount_0 = v88.failureCount;
    if l_successCount_0 > 0 and l_failureCount_0 <= 0 then
        local v93 = if l_successCount_0 == 1 then v90:Format("Feature.Avatar.Message.LooksPurchaseSuccessSingular", {
            numItems = l_successCount_0
        }) else v90:Format("Feature.Avatar.Message.LooksPurchaseSuccessPlural", {
            numItems = l_successCount_0
        });
        local v94 = {
            isLocalized = true, 
            toastMessage = v93, 
            toastType = v25.PurchaseMessage
        };
        v89(v24(v94));
        return;
    elseif l_successCount_0 > 0 and l_failureCount_0 > 0 then
        local v95 = nil;
        v95 = l_successCount_0 == 1 and l_failureCount_0 == 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSS" or l_successCount_0 == 1 and l_failureCount_0 > 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSP" or l_successCount_0 > 1 and l_failureCount_0 == 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPS" or "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPP";
        local v96 = {
            numSuccessItems = l_successCount_0, 
            numFailureItems = l_failureCount_0
        };
        local v97 = {
            isLocalized = true, 
            toastMessage = v90:Format("Feature.Avatar.Heading.LooksPurchasePartialSuccess"), 
            toastSubMessage = v90:Format(v95, v96), 
            toastType = v25.NetworkingError
        };
        v89(v24(v97));
        return;
    elseif l_successCount_0 <= 0 and l_failureCount_0 > 0 then
        local v98 = {
            isLocalized = true, 
            toastMessage = v90:Format("Feature.Avatar.Heading.LooksPurchaseFailed"), 
            toastSubMessage = v90:Format("Feature.Avatar.Message.LooksPurchaseFailedNetworkError"), 
            toastType = v25.NetworkingError
        };
        v89(v24(v98));
        return;
    else
        return;
    end;
end;
local function v101(v100) --[[ Line: 279 ]] --[[ Name: selectTryOnItems ]]
    return v100.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v103(v102) --[[ Line: 283 ]] --[[ Name: selectLookAnalyticsInfo ]]
    return v102.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
end;
return (v22((v21(function(v104) --[[ Line: 287 ]] --[[ Name: PurchaseLookPrompt ]]
    -- upvalues: v27 (copy), v29 (copy), l_useDispatch_0 (copy), v28 (copy), v8 (copy), v16 (copy), l_useTriggerFeedback_0 (copy), v2 (copy), l_useAvatarSaveContext_0 (copy), l_useSelector_0 (copy), v103 (copy), l_getUseSelectorDeepEquals_0 (copy), v101 (copy), v23 (copy), v51 (copy), v26 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v25 (copy), v24 (copy), v71 (copy), v87 (copy), v66 (copy), v50 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v15 (copy), v52 (copy), v18 (copy), l_PeekViewState_0 (copy), v48 (copy), l_SaveAsMakeupLookThunk_0 (copy), v56 (copy), v10 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v20 (copy), v35 (copy), v14 (copy), v99 (copy), l_setTimeout_0 (copy), l_FIntAXLookOutfitCreationDelayMs_0 (copy), l_sendAXCounterV2_0 (copy), v19 (copy), l_isEconomicRestrictionResponse_0 (copy), v13 (copy)
    local v105 = v27(v29);
    local v106 = l_useDispatch_0();
    local v107 = v27(v28);
    local v108 = v27(v8);
    local v109 = v27(v16);
    local v110 = l_useTriggerFeedback_0();
    local v111, v112 = v2.useState(false);
    local v113, v114 = v2.useState(true);
    local v115, v116 = v2.useState(true);
    local v117 = l_useAvatarSaveContext_0();
    local v118 = l_useSelector_0(v103, l_getUseSelectorDeepEquals_0());
    local v119 = l_useSelector_0(v101, l_getUseSelectorDeepEquals_0());
    local v121 = l_useSelector_0(function(v120) --[[ Line: 303 ]]
        -- upvalues: v23 (ref)
        return v23.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v120);
    end, l_getUseSelectorDeepEquals_0());
    local v124 = l_useSelector_0(function(v122) --[[ Line: 307 ]]
        -- upvalues: v104 (copy)
        local v123 = v122.AvatarExperience.AvatarScene.Looks[v104.lookId];
        if v123 then
            return v123.lookType;
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v125 = nil;
    if v51() then
        v125 = l_useSelector_0(function(v126) --[[ Line: 315 ]]
            -- upvalues: v104 (copy)
            local v127 = v126.AvatarExperience.AvatarScene.Looks[v104.lookId];
            if v127 and v127.name then
                return v127.name;
            else
                return nil;
            end;
        end, l_getUseSelectorDeepEquals_0());
    end;
    local v128 = v26({
        buyButtonText = v124 == v12.LookType.Avatar and "Feature.Avatar.Title.BuyAvatar" or l_FFlagAXCatalogMakeupSupport_0 and v124 == v12.LookType.Makeup and "Feature.Avatar.Title.BuyMakeup" or "Feature.Avatar.Title.BuyOutfit", 
        buyLookQuestion = v124 == v12.LookType.Avatar and "Feature.Avatar.Label.BuyAvatarQuestion" or l_FFlagAXCatalogMakeupSupport_0 and v124 == v12.LookType.Makeup and "Feature.Avatar.Label.BuyMakeupQuestion" or "Feature.Avatar.Label.BuyLookQuestion", 
        buyLookTitle = v124 == v12.LookType.Avatar and "Feature.Avatar.Title.BuyAvatar" or l_FFlagAXCatalogMakeupSupport_0 and v124 == v12.LookType.Makeup and "Feature.Avatar.Title.BuyMakeup" or "Feature.Avatar.Title.BuyOutfit", 
        getButtonText = "Feature.Catalog.Label.Get", 
        getLookQuestion = "Feature.Avatar.Label.GetLookQuestion", 
        getLookTitle = "Feature.Avatar.Title.GetOutfit", 
        characterSavedHeading = "Feature.Avatar.Heading.LooksCharacterSaved", 
        characterSavedMsg = "Feature.Avatar.Message.LooksCharacterSaved", 
        makeupLookSavedHeading = "Feature.Avatar.Heading.MakeupLookSaved", 
        makeupLookSavedMsg = "Feature.Avatar.Message.MakeupLookSaved"
    });
    local function v129() --[[ Line: 350 ]]
        -- upvalues: v114 (copy), v113 (copy)
        v114(not v113);
    end;
    local function v130() --[[ Line: 354 ]]
        -- upvalues: v116 (copy), v115 (copy)
        v116(not v115);
    end;
    local function v133(v131) --[[ Line: 359 ]]
        -- upvalues: v128 (copy), v25 (ref), v106 (copy), v24 (ref)
        if not v131 then
            return;
        else
            local v132 = {
                isLocalized = true, 
                toastMessage = v128.characterSavedHeading, 
                toastSubMessage = v128.characterSavedMsg, 
                toastType = v25.SuccessConfirmation
            };
            v106(v24(v132));
            return;
        end;
    end;
    local function v135() --[[ Line: 375 ]]
        -- upvalues: v128 (copy), v25 (ref), v106 (copy), v24 (ref)
        local v134 = {
            isLocalized = true, 
            toastMessage = v128.makeupLookSavedHeading, 
            toastSubMessage = v128.makeupLookSavedMsg, 
            toastType = v25.SuccessConfirmation
        };
        v106(v24(v134));
    end;
    local function v158(v136) --[[ Line: 385 ]] --[[ Name: handleWearAfterPurchase ]]
        -- upvalues: v113 (copy), v104 (copy), v71 (ref), v119 (copy), v87 (ref), v12 (ref), v124 (copy), v66 (ref), v50 (ref), v117 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), v106 (copy), v15 (ref), v52 (ref), v18 (ref), l_PeekViewState_0 (ref)
        if not v113 then
            return;
        else
            local v137 = {};
            if v104.isTryOnFromOutsideAX then
                if v104.ownedTryOnItems then
                    for _, v139 in v104.ownedTryOnItems do
                        table.insert(v137, (v71(v139.itemId, v139, false)));
                    end;
                end;
                if v119 then
                    for v140, v141 in v136.assetPurchaseStatus do
                        v137 = v87(v137, v119, v140, v141, v12.ItemType.Asset, v124);
                    end;
                    for v142, v143 in v136.bundlePurchaseStatus do
                        v137 = v87(v137, v119, v142, v143, v12.ItemType.Bundle, v124);
                    end;
                end;
            else
                if v104.ownedItemsInLook then
                    for _, v145 in v104.ownedItemsInLook do
                        table.insert(v137, (v66(v145.id, v145, false)));
                    end;
                end;
                if v104.allLookItems then
                    for v146, v147 in v136.assetPurchaseStatus do
                        local l_v137_0 = v137;
                        local l_allLookItems_0 = v104.allLookItems;
                        local _ = v12.ItemType.Asset;
                        local v151 = true;
                        if v147 ~= "Success" then
                            v151 = v50 and v147 == "AlreadyOwned";
                        end;
                        if v151 and l_allLookItems_0[v146] ~= nil then
                            table.insert(l_v137_0, (v66(v146, l_allLookItems_0[v146], true)));
                        end;
                        v137 = l_v137_0;
                    end;
                    for v152, v153 in v136.bundlePurchaseStatus do
                        local l_v137_1 = v137;
                        local l_allLookItems_1 = v104.allLookItems;
                        local _ = v12.ItemType.Bundle;
                        local v157 = true;
                        if v153 ~= "Success" then
                            v157 = v50 and v153 == "AlreadyOwned";
                        end;
                        if v157 and l_allLookItems_1[v152] ~= nil then
                            table.insert(l_v137_1, (v66(v152, l_allLookItems_1[v152], true)));
                        end;
                        v137 = l_v137_1;
                    end;
                end;
            end;
            if v104.isTryOnFromOutsideAX and v117 and v117.autoSaveNextNewSaveData then
                v117.autoSaveNextNewSaveData();
            end;
            if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
                l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
            end;
            v106(v15(v137, v104.navigation, nil, v124));
            if v52() and not v104.isTryOnFromOutsideAX then
                v106(v18(l_PeekViewState_0.Closed));
            end;
            return;
        end;
    end;
    local function v161() --[[ Line: 486 ]] --[[ Name: handleSaveAsCharacter ]]
        -- upvalues: v115 (copy), v51 (ref), v125 (ref), v48 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v124 (copy), v12 (ref), v106 (copy), l_SaveAsMakeupLookThunk_0 (ref), v105 (copy), v119 (copy), v56 (ref), v135 (copy), v10 (ref), v108 (copy), v133 (copy), v121 (copy)
        if not v115 then
            return;
        else
            local v159 = nil;
            v159 = if v51() and v125 then v125 else v48;
            local function v160() --[[ Line: 500 ]]
                return true;
            end;
            if l_FFlagAXCatalogMakeupSupport_0 and v124 == v12.LookType.Makeup then
                v106(l_SaveAsMakeupLookThunk_0(v105, v159, v119, if v56 then nil else v135));
                return;
            else
                v106(v10(v159, v108, v160, if v56 then nil else v133, v121));
                return;
            end;
        end;
    end;
    local v165 = v104.isTryOnFromOutsideAX and function(v162) --[[ Line: 527 ]]
        -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v20 (ref), v104 (copy), v106 (copy), v35 (ref)
        local v163 = l_parseEconomicRestrictionsFailureReason_0(v162);
        local v164 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v162);
        l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
            surface = l_EconomicRestrictionsSurface_0.AvatarExperienceLook, 
            failureReason = v163
        });
        v20.closeOverlay(v104.navigation);
        return v106(v35(v163, v164));
    end or nil;
    local function v170() --[[ Line: 539 ]]
        -- upvalues: v111 (copy), v112 (copy), v110 (copy), v106 (copy), v14 (ref), v105 (copy), v104 (copy), v109 (copy), v99 (ref), v107 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), v124 (copy), v12 (ref), v161 (copy), v158 (copy), l_setTimeout_0 (ref), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v20 (ref), l_sendAXCounterV2_0 (ref), v19 (ref), v165 (copy), l_isEconomicRestrictionResponse_0 (ref), v24 (ref), v25 (ref)
        if v111 then
            return;
        else
            v112(true);
            v110("MakePurchase", "Press");
            v106(v14(v105, v104.lookId, v104.priceInRobux, v109)):andThen(function(v166) --[[ Line: 548 ]]
                -- upvalues: v112 (ref), v99 (ref), v106 (ref), v107 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v124 (ref), v12 (ref), v161 (ref), v158 (ref), l_setTimeout_0 (ref), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v104 (ref), v20 (ref)
                v112(false);
                v99(v166, v106, v107);
                if l_FFlagAXCatalogMakeupSupport_0 and v124 == v12.LookType.Makeup then
                    v161();
                end;
                v158(v166);
                if v124 == v12.LookType.Avatar then
                    l_setTimeout_0(v161, l_FIntAXLookOutfitCreationDelayMs_0);
                end;
                local l_navigation_0 = v104.navigation;
                v20.closeOverlay(l_navigation_0);
            end, function(v168) --[[ Line: 561 ]]
                -- upvalues: l_sendAXCounterV2_0 (ref), v12 (ref), v104 (ref), v19 (ref), v165 (ref), l_isEconomicRestrictionResponse_0 (ref), v112 (ref), v106 (ref), v24 (ref), v25 (ref), v20 (ref)
                l_sendAXCounterV2_0(v12.Counter.Errors.PurchaseLooksProductError, {
                    lookId = v104.lookId, 
                    promptType = "PurchaseLookPromptMIS", 
                    isTryOnFromOutsideAX = tostring(v104.isTryOnFromOutsideAX)
                });
                v19("PurchaseLooksProductMIS error", v168);
                if v165 and l_isEconomicRestrictionResponse_0(v168) then
                    v165(v168);
                    return;
                else
                    v112(false);
                    v106(v24({
                        isLocalized = false, 
                        toastType = v25.NetworkingError, 
                        toastMessage = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName"
                    }));
                    local l_navigation_1 = v104.navigation;
                    v20.closeOverlay(l_navigation_1);
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v171() --[[ Line: 585 ]]
        -- upvalues: v111 (copy), v20 (ref), v104 (copy)
        if v111 then
            return;
        else
            v20.closeOverlay(v104.navigation);
            return;
        end;
    end;
    local v172 = v104.priceInRobux == 0;
    local v173 = nil;
    local v174 = nil;
    local v175 = nil;
    if v172 then
        v173 = v128.getLookTitle;
        v174 = v128.getLookQuestion;
        v175 = v128.getButtonText;
    else
        v173 = v128.buyLookTitle;
        v174 = v128.buyLookQuestion;
        v175 = v128.buyButtonText;
    end;
    return v2.createElement(v13, {
        priceInRobux = v104.priceInRobux, 
        showWearAfterPurchase = v104.showWearAfterPurchase, 
        showSaveAsCharacter = v104.showSaveAsCharacter, 
        isWearAfterPurchaseChecked = v113, 
        isSaveAsCharacterChecked = v115, 
        toggleWearAfterPurchase = v129, 
        toggleSaveAsCharacter = v130, 
        saveIfWearAfterPurchase = v104.isTryOnFromOutsideAX, 
        lookType = v124, 
        analyticsInfo = v118, 
        titleText = v173, 
        bodyText = v174, 
        confirmButtonText = v175, 
        onConfirm = v170, 
        onCancel = v171, 
        isLoading = v111, 
        isPurchasingOutfit = true, 
        defaultChildRef = v104.defaultChildRef
    });
end))));