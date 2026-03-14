local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.tutils);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v7 = require(l_CorePackages_0.Packages.Promise);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseProduct);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v19 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v22 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v23 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v28 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_EconomicRestrictionsCounter_0 = v28.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v33 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local l_parseEconomicRestrictionsFailureReason_0 = v28.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v28.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local v36 = v2.PureComponent:extend("PurchaseOutfitPrompt");
v36.validateProps = v4.strictInterface({
    navigation = v4.table, 
    itemsToPurchase = v4.table, 
    ownedTryOnItems = v4.table, 
    totalOutfitPrice = v4.integer, 
    entryPoint = v4.optional(v4.string), 
    itemDataTable = v4.table, 
    userAssets = v4.table, 
    collectiblesItemInfo = v4.table, 
    collectiblesResellersInstances = v4.table, 
    collectiblesResellableInstances = v4.table, 
    purchaseProduct = v4.callback, 
    setCurrentToastMessage = v4.callback, 
    wearAfterOutfitPurchase = v4.callback, 
    economicRestrictionErrorHandler = v4.callback, 
    networking = v4.callback, 
    analytics = v4.table, 
    aeAnalytics = v4.table, 
    localization = v4.table, 
    enablePurchasePromptIncludingWarning = v4.boolean, 
    focusController = v4.optional(v4.table), 
    defaultChildRef = v4.optional(v4.table), 
    onOverlayClosed = v4.optional(v4.callback)
});
local function _(v37) --[[ Line: 89 ]] --[[ Name: closePrompt ]]
    -- upvalues: v13 (copy)
    v13.closeOverlay(v37);
end;
local function _(v39) --[[ Line: 93 ]] --[[ Name: purchaseResolveNav ]]
    -- upvalues: v13 (copy)
    v13.closeOverlay(v39);
    v13.closeFocusedScreen(v39);
end;
local v41 = nil;
local v47 = l_memoize_0(function(v42, v43) --[[ Line: 100 ]]
    -- upvalues: v19 (copy)
    local v44 = {};
    for v45, v46 in v43 do
        v44[v45] = v19(v42, v45, v46.itemType);
    end;
    return v44;
end);
v41 = function(v48, v49) --[[ Line: 109 ]]
    -- upvalues: v47 (copy)
    local l_Common_0 = v48.AvatarExperience.Common;
    return v47(l_Common_0, v49);
end;
v36.getToast = function(v51, v52, v53, _) --[[ Line: 121 ]] --[[ Name: getToast ]]
    -- upvalues: v23 (copy)
    local v55 = nil;
    local v56 = nil;
    local l_localization_0 = v51.props.localization;
    local v58 = {
        numItems = v52
    };
    local v59 = l_localization_0:Format("Feature.Avatar.Label.OutfitPurchaseSuccess", v58);
    local v60 = l_localization_0:Format("Feature.Avatar.Label.OutfitPurchaseFailure", v58);
    if v53 then
        v55 = v59;
        v56 = v23.InformationMessage;
    else
        v55 = v60;
        v56 = v23.NetworkingError;
    end;
    return {
        toastMessage = v55, 
        isLocalized = true, 
        toastType = v56
    };
end;
local _ = function(v61) --[[ Line: 151 ]] --[[ Name: getSuccessAndFailureCounts ]]
    local v62 = 0;
    local v63 = 0;
    for _, v65 in v61 do
        if v65 == true then
            v62 = v62 + 1;
        else
            v63 = v63 + 1;
        end;
    end;
    return v62, v63;
end;
v36.showToasts = function(v67, v68, v69) --[[ Line: 170 ]] --[[ Name: showToasts ]]
    local v70 = 0;
    local v71 = 0;
    for _, v73 in v68 do
        if v73 == true then
            v70 = v70 + 1;
        else
            v71 = v71 + 1;
        end;
    end;
    local l_v70_0 = v70;
    local l_v71_0 = v71;
    if l_v70_0 > 0 then
        v67.props.setCurrentToastMessage(v67:getToast(l_v70_0, true, v69));
    end;
    if l_v71_0 > 0 then
        v67.props.setCurrentToastMessage(v67:getToast(l_v71_0, false, v69));
    end;
end;
v36.formatOwnedItemForWearAfterPurchase = function(_, v77, v78) --[[ Line: 187 ]] --[[ Name: formatOwnedItemForWearAfterPurchase ]]
    -- upvalues: v17 (copy)
    local v79 = v78.itemType == v17.ItemType.Bundle;
    return {
        purchased = false, 
        owned = true, 
        assetIsWearable = not v79, 
        bundleId = v79 and v77 or nil, 
        tryOnBundleInfo = v79 and v78.bundleInfo or nil, 
        assetId = not v79 and v77 or nil, 
        assetType = v79 and v17.ItemType.Bundle or nil, 
        overrideOrder = v78.order, 
        itemSubType = v78.itemSubType
    };
end;
v36.handleWearAfterPurchase = function(v80, v81, v82) --[[ Line: 211 ]] --[[ Name: handleWearAfterPurchase ]]
    if not v80.state.isWearAfterPurchaseChecked then
        return;
    else
        local v83 = {};
        for v84, v85 in v80.props.ownedTryOnItems do
            table.insert(v83, v80:formatOwnedItemForWearAfterPurchase(v84, v85));
        end;
        for v86, v87 in v81 do
            if v87 == true and v82[v86].purchased == true then
                table.insert(v83, v82[v86]);
            end;
        end;
        v80.props.wearAfterOutfitPurchase(v83, v80.props.navigation, v80.props.aeAnalytics);
        return;
    end;
end;
v36.init = function(v88) --[[ Line: 235 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v20 (copy), v7 (copy)
    v88.isMounted = false;
    v88.state = {
        isWearAfterPurchaseChecked = true, 
        isPurchasing = false
    };
    v88.onCancel = function() --[[ Line: 243 ]]
        -- upvalues: v88 (copy), v13 (ref)
        if v88.state.isPurchasing then
            return;
        else
            local l_navigation_0 = v88.props.navigation;
            v13.closeOverlay(l_navigation_0);
            return;
        end;
    end;
    v88.onConfirm = function(v90) --[[ Line: 251 ]]
        -- upvalues: v88 (copy), v20 (ref), v7 (ref), v13 (ref)
        if v88.state.isPurchasing then
            return;
        else
            local l_networking_0 = v88.props.networking;
            local l_analytics_0 = v88.props.analytics;
            local l_navigation_1 = v88.props.navigation;
            local v94 = {};
            local l_entryPoint_0 = v88.props.entryPoint;
            for v96, v97 in v88.props.itemsToPurchase do
                local l_itemType_0 = v97.itemType;
                local l_itemSubType_0 = v97.itemSubType;
                local l_expectedPrice_0 = v97.expectedPrice;
                local v101 = v88.props.itemDataTable[v96];
                local l_id_0 = v101.product.id;
                local l_expectedSellerId_0 = v101.expectedSellerId;
                local l_resellerUserAssetIds_0 = v101.resellerUserAssetIds;
                local v105 = v20.IsResellable(v101);
                local v106 = v101 and v101.collectibleItemId;
                local v107 = v101 and v101.creator and v101.creator.type;
                local v108 = l_resellerUserAssetIds_0 and l_resellerUserAssetIds_0[1];
                local v109 = v88.props.userAssets[v108];
                local v110 = nil;
                if v105 and v109 then
                    v110 = v109.userAssetId;
                    l_expectedSellerId_0 = v109.userId;
                end;
                local v111 = nil;
                if v106 then
                    local l_collectiblesItemInfo_0 = v88.props.collectiblesItemInfo;
                    local l_collectiblesResellersInstances_0 = v88.props.collectiblesResellersInstances;
                    local l_collectiblesResellableInstances_0 = v88.props.collectiblesResellableInstances;
                    local v115 = v20.findCheapestCollectiblePurchaseInfoV2(v106, v105, l_collectiblesItemInfo_0, l_collectiblesResellersInstances_0, l_collectiblesResellableInstances_0);
                    if v115.price then
                        l_expectedPrice_0 = v115.price;
                    end;
                    if v115.collectibleInstanceId then
                        v111 = v115.collectibleInstanceId;
                        l_expectedSellerId_0 = v115.expectedSellerId;
                    end;
                end;
                table.insert(v94, v88.props.purchaseProduct(l_networking_0, l_id_0, l_expectedPrice_0 or 0, l_expectedSellerId_0, v96, l_itemType_0, l_itemSubType_0, false, v110, l_analytics_0, l_navigation_1, false, true, l_entryPoint_0, v106, v111, v107, v88.props.economicRestrictionErrorHandler));
            end;
            v88:setState({
                isPurchasing = true
            });
            v7.new(function(v116, _) --[[ Line: 344 ]]
                -- upvalues: v94 (copy)
                local v118 = {};
                local v119 = {};
                for _, v121 in v94 do
                    local v122, v123 = v121:await();
                    table.insert(v118, v122);
                    table.insert(v119, v123);
                end;
                v116(v118, v119);
            end):andThen(function(v124, v125) --[[ Line: 359 ]]
                -- upvalues: v88 (ref), v90 (copy), v13 (ref)
                if v88.isMounted then
                    v88:setState({
                        isPurchasing = false
                    });
                    v88:showToasts(v124, v90);
                    v88:handleWearAfterPurchase(v124, v125);
                    local l_navigation_2 = v88.props.navigation;
                    v13.closeOverlay(l_navigation_2);
                    v13.closeFocusedScreen(l_navigation_2);
                    return;
                else
                    v88:showToasts(v124, v90);
                    v88:handleWearAfterPurchase(v124, v125);
                    return;
                end;
            end);
            return;
        end;
    end;
    v88.toggleWearAfterPurchase = function() --[[ Line: 377 ]]
        -- upvalues: v88 (copy)
        local v127 = not v88.state.isWearAfterPurchaseChecked;
        v88:setState({
            isWearAfterPurchaseChecked = v127
        });
    end;
end;
v36.renderAlertLocalized = function(v128, v129) --[[ Line: 385 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v5 (copy), v2 (copy), v25 (copy)
    local l_totalOutfitPrice_0 = v128.props.totalOutfitPrice;
    local v131 = v5.fieldCount(v128.props.itemsToPurchase);
    local v132 = l_totalOutfitPrice_0 == 0;
    local v133 = nil;
    local v134 = nil;
    local v135 = nil;
    local l_localization_1 = v128.props.localization;
    local v137 = {
        numItems = v131
    };
    local v138 = l_localization_1:Format("Feature.Avatar.Label.GetOutfitMultiple", v137);
    local v139 = l_localization_1:Format("Feature.Avatar.Label.BuyOutfitMultiple", v137);
    local v140 = l_localization_1:Format("Feature.Avatar.Label.BuyOutfitLuobuMultiple", v137);
    if v132 then
        v133 = v129.getOutfit;
        if v131 > 1 then
            v134 = v138;
        elseif v131 == 1 then
            v134 = v129.getOutfitOne;
        end;
        v135 = v129.get;
    else
        v133 = v129.buyOutfit;
        if v128.props.enablePurchasePromptIncludingWarning then
            if v131 > 1 then
                v134 = v140;
            elseif v131 == 1 then
                v134 = v129.buyOutfitLuobuSingle;
            end;
        elseif v131 > 1 then
            v134 = v139;
        elseif v131 == 1 then
            v134 = v129.buyOutfitSingle;
        end;
        v135 = v129.buyOutfit;
    end;
    return v2.createElement(v25, {
        priceInRobux = l_totalOutfitPrice_0, 
        showWearAfterPurchase = true, 
        isWearAfterPurchaseChecked = v128.state.isWearAfterPurchaseChecked, 
        toggleWearAfterPurchase = v128.toggleWearAfterPurchase, 
        titleText = v133, 
        bodyText = v134, 
        confirmButtonText = v135, 
        onConfirm = function() --[[ Line: 438 ]] --[[ Name: onConfirm ]]
            -- upvalues: v128 (copy), v129 (copy)
            return v128.onConfirm(v129);
        end, 
        onCancel = v128.onCancel, 
        isLoading = v128.state.isPurchasing, 
        defaultChildRef = v128.props.defaultChildRef
    });
end;
v36.render = function(v141) --[[ Line: 447 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        getOutfit = "Feature.Avatar.Title.GetOutfit", 
        buyOutfit = "Feature.Avatar.Title.BuyOutfit", 
        get = "Feature.Catalog.Label.Get", 
        getOutfitOne = "Feature.Avatar.Label.GetOutfitOne", 
        buyOutfitSingle = "Feature.Avatar.Label.BuyOutfitSingle", 
        buyOutfitLuobuSingle = "Feature.Avatar.Label.BuyOutfitLuobuSingle"
    })(function(v142) --[[ Line: 455 ]]
        -- upvalues: v141 (copy)
        return v141:renderAlertLocalized(v142);
    end);
end;
v36.didMount = function(v143) --[[ Line: 460 ]] --[[ Name: didMount ]]
    v143.isMounted = true;
end;
v36.willUnmount = function(v144) --[[ Line: 464 ]] --[[ Name: willUnmount ]]
    v144.isMounted = false;
end;
v36 = l_RoactAppPolicy_0.connect(function(v145, _) --[[ Line: 468 ]]
    return {
        enablePurchasePromptIncludingWarning = v145.getPurchasePromptIncludingWarning()
    };
end)(v36);
v36 = v3.connect(function(v147, v148) --[[ Line: 474 ]]
    -- upvalues: v41 (ref)
    return {
        itemDataTable = v41(v147, v148.itemsToPurchase), 
        userAssets = v147.AvatarExperience.Catalog.UserAssets, 
        collectiblesItemInfo = v147.AvatarExperience.Common.Collectibles.CollectiblesItemInfo, 
        collectiblesResellersInstances = v147.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances, 
        collectiblesResellableInstances = v147.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances
    };
end, function(v149) --[[ Line: 482 ]]
    -- upvalues: v22 (copy), v15 (copy), v21 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v33 (copy)
    return {
        setCurrentToastMessage = function(v150) --[[ Line: 484 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v149 (copy), v22 (ref)
            v149(v22(v150));
        end, 
        purchaseProduct = function(v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169) --[[ Line: 488 ]] --[[ Name: purchaseProduct ]]
            -- upvalues: v149 (copy), v15 (ref)
            return v149(v15(v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169));
        end, 
        wearAfterOutfitPurchase = function(v170, v171, v172) --[[ Line: 534 ]] --[[ Name: wearAfterOutfitPurchase ]]
            -- upvalues: v149 (copy), v21 (ref)
            return v149(v21(v170, v171, v172));
        end, 
        economicRestrictionErrorHandler = function(v173) --[[ Line: 538 ]] --[[ Name: economicRestrictionErrorHandler ]]
            -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v149 (copy), v33 (ref)
            local v174 = l_parseEconomicRestrictionsFailureReason_0(v173);
            local v175 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v173);
            l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
                surface = l_EconomicRestrictionsSurface_0.AvatarExperience, 
                failureReason = v174
            });
            return v149(v33(v174, v175));
        end
    };
end)(v36);
return (v12((v11((l_RoactServices_0.connect({
    networking = v9, 
    analytics = v16, 
    aeAnalytics = v18, 
    localization = v10
})(v36))))));