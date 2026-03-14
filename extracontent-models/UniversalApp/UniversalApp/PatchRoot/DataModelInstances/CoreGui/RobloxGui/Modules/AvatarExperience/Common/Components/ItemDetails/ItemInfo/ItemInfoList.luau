local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagDynamicHeadsMigration_0 = v3.FFlagDynamicHeadsMigration;
local v5 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v11 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_ProfileTypes_0 = v11.ProfileTypes;
local l_EnableCommunityProfilePageIXP_0 = v11.EnableCommunityProfilePageIXP;
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.AttributionItemInfoRow);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoRow);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useItemDataDigest);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResaleData);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetVersionData);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local v26 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v27 = require(l_Modules_0.LuaApp.AppPage);
local v28 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v29 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v30 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v31 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v32 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v33 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v34 = game:DefineFastFlag("UseItemDataHookRefactor", false);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v37 = game:DefineFastFlag("FixNavigationToCreatorProfileWebviewFromProfile", false);
local v38 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCollectibleOriginalPrice);
local v39 = game:DefineFastFlag("AXFixMissingResalePrice", false);
local l_FFlagAXUseTaxonomyInItemDetailsType_0 = v3.FFlagAXUseTaxonomyInItemDetailsType;
local v41 = require(l_Modules_0.AvatarExperience.Common.Selectors.getTaxonomyName);
local v42 = require(l_Modules_0.AvatarExperience.Common.Selectors.getEquipSlotForAssetType);
local function _(v43, v44) --[[ Line: 76 ]] --[[ Name: getNumberLocalization ]]
    -- upvalues: l_NumberLocalization_0 (copy)
    if not v43 then
        return nil;
    else
        return l_NumberLocalization_0.localize(v43, v44:GetLocale());
    end;
end;
local function _(v46, v47) --[[ Line: 84 ]] --[[ Name: getProductIdAndCreator ]]
    local v48 = if v46 then v46.collectibleProductId else if v47 and v47.product then v47.product.id else nil;
    if v46 then
        return v48, v46.creator;
    elseif v47 then
        return v48, v47.creator;
    else
        return v48, nil;
    end;
end;
local function _(v50, v51) --[[ Line: 97 ]] --[[ Name: getCreatingUniverseId ]]
    if v51 then
        return v51.creatingUniverseId;
    elseif v50 then
        return v50.creatingUniverseId;
    else
        return nil;
    end;
end;
local function v57(v53, v54, v55, v56) --[[ Line: 107 ]] --[[ Name: getGameJoinContext ]]
    -- upvalues: v19 (copy), v21 (copy)
    if v56 then
        return {
            outfitId = v56.outfitId, 
            itemType = Enum.AvatarItemType.Bundle, 
            joinSource = Enum.JoinSource.CreatedItemAttribution
        };
    else
        return {
            assetId = v54, 
            itemType = if v53 then Enum.AvatarItemType[v53] else nil, 
            assetType = if v53 == v19.ItemType.Asset and v55 then v21.AssetTypeIdStringToEnumValue(v55) else nil, 
            joinSource = Enum.JoinSource.CreatedItemAttribution
        };
    end;
end;
local function _() --[[ Line: 131 ]] --[[ Name: getLocalPlayerName ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    return l_LocalPlayer_0 and l_LocalPlayer_0.Name or "";
end;
return (v5.forwardRef(function(v60, _) --[[ Line: 136 ]]
    -- upvalues: l_useSelector_0 (copy), v14 (copy), l_getUseSelectorDeepEquals_0 (copy), v20 (copy), v39 (copy), v33 (copy), v5 (copy), v18 (copy), v34 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v32 (copy), v29 (copy), l_EnableCommunityProfilePageIXP_0 (copy), v28 (copy), v27 (copy), l_ProfileTypes_0 (copy), v26 (copy), v37 (copy), l_AvatarScreen_0 (copy), v19 (copy), l_FFlagAXUseTaxonomyInItemDetailsType_0 (copy), v41 (copy), v42 (copy), v30 (copy), l_NumberLocalization_0 (copy), v31 (copy), v38 (copy), v17 (copy), v23 (copy), v24 (copy), v57 (copy), l_Players_0 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v15 (copy), v16 (copy), l_Focusable_0 (copy)
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v70 = l_useSelector_0(function(v69) --[[ Line: 150 ]]
        -- upvalues: v14 (ref), v60 (copy)
        return v14(v69.AvatarExperience.Common, v60.itemId, v60.itemType);
    end, l_getUseSelectorDeepEquals_0());
    (function() --[[ Line: 155 ]]
        -- upvalues: v70 (copy), v62 (ref), v63 (ref), v66 (ref), v67 (ref), v68 (ref), v20 (ref), v60 (copy), v64 (ref), v39 (ref), v65 (ref)
        if v70 then
            v62 = v70.collectibleItemId;
            local l_resellerUserAssetIds_0 = v70.resellerUserAssetIds;
            v63 = l_resellerUserAssetIds_0 and #l_resellerUserAssetIds_0 > 0 and l_resellerUserAssetIds_0[1];
            v66 = if v70.creator then v70.creator.id else nil;
            v67 = if v70.creator then v70.creator.type else nil;
            v68 = v20.GetItemSubType(v60.itemType, v70);
            v64 = if v39 then nil else v20.isLimitedCollectible(v70);
            v65 = if v39 then v20.IsResellable(v70) else nil;
        end;
    end)();
    local v73 = v33(function(v72) --[[ Line: 171 ]]
        return v72.getWebViewSupport();
    end);
    local v75 = v5.useCallback(function(v74) --[[ Line: 175 ]]
        -- upvalues: v62 (ref)
        if v62 then
            return v74.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v62];
        else
            return nil;
        end;
    end, {
        v62
    });
    local v76 = l_useSelector_0(v75);
    if v33(function(v77) --[[ Line: 182 ]]
        return v77.getDisableResellingCollectiblesForCompliance();
    end) and v76 then
        v76.resaleRestriction = v18.ResaleRestriction.Disabled;
    end;
    local v79 = v5.useCallback(function(v78) --[[ Line: 190 ]]
        -- upvalues: v39 (ref), v65 (ref), v64 (ref), v62 (ref)
        if not if v39 then v65 else v64 then
            return nil;
        elseif v62 then
            return v78.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v62];
        else
            return nil;
        end;
    end, {
        v62, 
        if v39 then v65 else v64
    });
    local v80 = if not v34 then l_useSelector_0(v79, l_getUseSelectorDeepEquals_0()) else nil;
    local v82 = l_useSelector_0(function(v81) --[[ Line: 205 ]]
        return v81.UserRobux[v81.LocalUserId];
    end, l_getUseSelectorDeepEquals_0());
    local v88 = l_useSelector_0(function(v83) --[[ Line: 209 ]]
        -- upvalues: v62 (ref), v39 (ref), v65 (ref), v64 (ref), v63 (ref)
        if v62 then
            if not if v39 then v65 else v64 then
                return nil;
            else
                local v84 = v83.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances[v62];
                local v85 = v84 and #v84.InstanceIdsList > 0 and v84.InstanceIdsList[1];
                local v86 = if v85 then v84.Instances[v85] else nil;
                if v86 then
                    return v86.price;
                else
                    return nil;
                end;
            end;
        elseif v63 then
            local v87 = v83.AvatarExperience.Catalog.UserAssets[v63];
            if v87 then
                return v87.priceInRobux;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v89 = l_useDispatch_0();
    local v90 = l_useNavigation_0();
    local v91 = v32(v29);
    local v92 = if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled then l_EnableCommunityProfilePageIXP_0.useIsFeatureActive({
        isExposureEnabled = false
    }) else nil;
    local v94 = v5.useCallback(function() --[[ Line: 241 ]]
        -- upvalues: v66 (ref), l_EnableCommunityProfilePageIXP_0 (ref), v67 (ref), v18 (ref), v92 (copy), v89 (copy), v28 (ref), v27 (ref), l_ProfileTypes_0 (ref), v26 (ref), v37 (ref), v90 (copy)
        if v66 then
            if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and v67 == v18.CreatorType.Group then
                l_EnableCommunityProfilePageIXP_0.logExposure();
            end;
            if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and v92 then
                if v67 == v18.CreatorType.Group then
                    v89(v28({
                        name = v27.ProfilePlatform, 
                        detail = v66, 
                        extraProps = {
                            profileType = l_ProfileTypes_0.Community, 
                            source = "ItemDetailsPage"
                        }
                    }));
                    return;
                elseif v67 == v18.CreatorType.User then
                    v89(v28({
                        name = v27.ProfilePlatform, 
                        detail = v66, 
                        extraProps = {
                            profileType = l_ProfileTypes_0.User, 
                            source = "ItemDetailsPage"
                        }
                    }));
                    return;
                else
                    v89(v28({
                        name = v27.GenericWebPage, 
                        detail = v26.user.profile({
                            userId = v66
                        }), 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.Profile"
                        }
                    }));
                    return;
                end;
            else
                local v93 = if v67 == v18.CreatorType.Group then v26.user.group({
                    groupId = v66
                }) else v26.user.profile({
                    userId = v66
                });
                if v37 then
                    v89(v28({
                        name = v27.GenericWebPage, 
                        detail = v93, 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.Profile"
                        }
                    }));
                    return;
                else
                    v90.navigate(v27.GenericWebPage, {
                        detail = v93, 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.Profile"
                        }
                    });
                end;
            end;
        end;
    end, {
        v66, 
        v67, 
        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled then v92 else nil
    });
    local v95 = v5.useCallback(function() --[[ Line: 308 ]]
        -- upvalues: v90 (copy), l_AvatarScreen_0 (ref), v60 (copy), v62 (ref)
        v90.navigate(l_AvatarScreen_0.ResellersPage, {
            itemId = v60.itemId, 
            collectibleItemId = v62, 
            itemType = v60.itemType, 
            fromContentFeed = v90.getParam("fromContentFeed"), 
            fromProfile = v90.getParam("fromProfile")
        });
    end, {
        v90, 
        v60.itemId, 
        v70, 
        v60.itemType, 
        v90.getParam("fromContentFeed"), 
        v90.getParam("fromProfile")
    });
    local v96 = nil;
    local v97 = nil;
    if v60.itemType == v19.ItemType.Asset then
        local v98 = v19.AssetTypeIdToCategory[v68];
        v96 = v19.AssetCategoriesLocalized[v98];
        v97 = v19.AssetTypeLocalized[v68];
    end;
    local v99 = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v70 then v41(v70.taxonomy) else nil;
    local v100 = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v68 then v42(v60.itemType, v68) else nil;
    local v101 = v32(v30);
    local v102 = if v88 then l_NumberLocalization_0.localize(v88, v101:GetLocale()) else "";
    local v103 = v31({
        bundle = "Feature.Catalog.Label.Bundle", 
        category = v96, 
        subType = v97, 
        yesText = "Feature.Catalog.Label.Yes", 
        noText = "Feature.Catalog.Label.No", 
        isPBR = "Feature.Catalog.Label.PBR.true", 
        notPBR = "Feature.Catalog.Label.PBR.false", 
        noneText = "Feature.Catalog.Label.None", 
        fromResalePrice = {
            "Feature.Catalog.Label.FromPrice"; 
            itemPrice = v18.RobloxEmoji.Robux .. v102
        }, 
        priceUnavailableText = v38 and "Feature.Catalog.Label.NA" or nil, 
        placementCategory = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v100 then v100.categoryKey else nil, 
        placementSlot = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v100 then v100.slotKey else nil
    });
    local v104 = nil;
    if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v100 then
        if v103.placementCategory and v103.placementSlot then
            v104 = ("%* | %*"):format(v103.placementCategory, v103.placementSlot);
        elseif v103.placementCategory then
            v104 = v103.placementCategory;
        end;
    end;
    local v105 = nil;
    v105 = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v99 then v99 else if v60.itemType == v19.ItemType.Asset and v103.category and v103.subType then ("%* | %*"):format(v103.category, v103.subType) else if v60.itemType == v19.ItemType.Bundle then v103.bundle else "";
    local v106 = nil;
    local v107 = nil;
    local v108 = nil;
    local v109 = nil;
    local v110 = nil;
    local v111 = nil;
    local v112 = nil;
    local v113 = nil;
    local v114 = nil;
    local v115 = nil;
    local v116 = nil;
    local v117 = nil;
    local v118 = false;
    local v119 = nil;
    (function() --[[ Line: 399 ]]
        -- upvalues: v34 (ref), v17 (ref), v60 (copy), v65 (ref), v106 (ref), v107 (ref), v108 (ref), v109 (ref), v110 (ref), v112 (ref), v113 (ref), v114 (ref), v115 (ref), v116 (ref), v111 (ref), v117 (ref), v119 (ref), v39 (ref), v20 (ref), v70 (copy), v76 (copy), v18 (ref), v38 (ref), v80 (copy), v62 (ref), v118 (ref)
        if v34 then
            local v120 = v17(v60.itemId, v60.itemType);
            v65 = v120.isResellable;
            v106 = v120.isTradable;
            v107 = v120.hasAttribution;
            v108 = v120.shouldShowQuantityLimit;
            v109 = v120.reachedQuantityLimit;
            v110 = v120.hasResellers;
            v112 = v120.soldCount;
            v113 = v120.itemStock;
            v114 = v120.originalPrice;
            v115 = v120.averagePrice;
            v116 = v120.quantityLimit;
            v111 = v120.isStockAvailable;
            v117 = v120.collectiblesResaleRestriction;
            v119 = v120.isPBR;
        else
            if not v39 then
                v65 = v20.IsResellable(v70);
            end;
            v106 = v20.getIsTradable(v70);
            v107 = v20.HasAttribution(v70);
            v116 = 0;
            v108 = false;
            v109 = false;
            v110 = if v70 and v70.resellerUserAssetIds then #v70.resellerUserAssetIds > 0 else false;
            v112 = if v70 and v70.soldCount then v70.soldCount else 0;
            v113 = if v70 and v70.totalQuantity then v70.totalQuantity else 0;
            v114 = if v70 and v70.originalPrice then v70.originalPrice else 0;
            v115 = if v70 and v70.averagePrice then v70.averagePrice else 0;
            v119 = if v70 then v70.isPBR else nil;
            if v76 then
                v117 = if v76.resaleRestriction then v76.resaleRestriction else v18.ResaleRestriction.None;
                v110 = if v76.hasResellers then v76.hasResellers else false;
                local v121 = v76.assetStock or 0;
                local v122 = v76.unitsAvailableForConsumption or 0;
                v112 = if v121 and v122 then v121 - v122 else 0;
                v114 = if v38 then v76.price else v76.price or 0;
                v115 = v76.recentAveragePrice or 0;
                v113 = v76.assetStock or 0;
                v116 = v76.quantityLimitPerUser or 0;
                v109 = v20.reachQuantityLimit(v76, v80);
                v108 = v20.shouldShowQuantityLimit(v116);
            end;
            v111 = v112 < v113;
            v111 = v111 and v20.isOriginalStockSellableInShop(v76);
        end;
        if v65 and v70 and not v62 then
            v118 = true;
        end;
    end)();
    if v60.outfitInfo then
        v107 = v60.outfitInfo.creatingUniverseId ~= nil;
    end;
    local l_v112_0 = v112;
    local v124 = if not l_v112_0 then nil else l_NumberLocalization_0.localize(l_v112_0, v101:GetLocale());
    local l_v113_0 = v113;
    l_v112_0 = if not l_v113_0 then nil else l_NumberLocalization_0.localize(l_v113_0, v101:GetLocale());
    local l_v114_0 = v114;
    l_v113_0 = if not l_v114_0 then nil else l_NumberLocalization_0.localize(l_v114_0, v101:GetLocale());
    local v127 = if v76 then v76.collectibleProductId else if v70 and v70.product then v70.product.id else nil;
    local v128 = if v76 then v76.creator else if v70 then v70.creator else nil;
    l_v114_0 = v127;
    local l_v128_0 = v128;
    v127 = v5.useCallback(function() --[[ Line: 471 ]]
        -- upvalues: l_v128_0 (copy), v90 (copy), v114 (ref), v82 (copy), l_AvatarScreen_0 (ref), v60 (copy), l_v114_0 (copy)
        local v130 = if l_v128_0 then l_v128_0.id else nil;
        local v131 = if l_v128_0 then l_v128_0.name else nil;
        local v132 = v90.getParam("fromContentFeed");
        local v133 = v90.getParam("fromProfile");
        if v114 and v82 and v114 <= v82 then
            v90.navigate(l_AvatarScreen_0.PurchaseCatalogItem, {
                itemId = v60.itemId, 
                itemType = v60.itemType, 
                productId = l_v114_0, 
                priceInRobux = v114, 
                sellerId = v130, 
                sellerName = v131, 
                userAssetId = nil, 
                collectibleInstanceId = nil, 
                fromProfile = v133, 
                fromContentFeed = v132
            });
            return;
        else
            v90.navigate(l_AvatarScreen_0.InsufficientRobuxPrompt, {});
            return;
        end;
    end, {
        l_v114_0, 
        l_v128_0, 
        v76, 
        v90, 
        v60.itemId, 
        v60.itemType, 
        v114
    });
    v5.useEffect(function() --[[ Line: 495 ]]
        -- upvalues: v118 (ref), v89 (copy), v23 (ref), v91 (copy), v60 (copy), v19 (ref), v24 (ref)
        if v118 then
            v89(v23(v91, v60.itemId));
        end;
        if v60.itemType == v19.ItemType.Asset then
            v89(v24(v91, v60.itemId));
        end;
    end, {
        v118, 
        v91, 
        v60.itemId
    });
    local l_outfitInfo_0 = v60.outfitInfo;
    v128 = if l_outfitInfo_0 then l_outfitInfo_0.creatingUniverseId else if v70 then v70.creatingUniverseId else nil;
    l_outfitInfo_0 = v57(v60.itemType, v60.itemId, v68, v60.outfitInfo);
    local v135;
    if l_v128_0 then
        v135 = l_v128_0.name;
    elseif v128 then
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        v135 = l_LocalPlayer_1 and l_LocalPlayer_1.Name or "";
    else
        v135 = "";
    end;
    local v137 = if v73 and v66 then v94 else nil;
    local v142 = (function() --[[ Line: 518 ]]
        -- upvalues: v135 (copy), v137 (copy), l_v128_0 (copy), v107 (ref), v128 (copy), l_outfitInfo_0 (copy), v60 (copy), v65 (ref), v105 (ref), l_FFlagAXUseTaxonomyInItemDetailsType_0 (ref), v99 (copy), v104 (ref), v119 (ref), v103 (copy), v106 (ref), v108 (ref), v116 (ref), v117 (ref), v18 (ref), v110 (ref), v88 (copy), v95 (copy), v115 (ref), v113 (ref), v124 (copy), l_v112_0 (copy), l_v113_0 (copy), v38 (ref), v111 (ref), v109 (ref), v127 (copy), l_FFlagDynamicHeadsMigration_0 (ref)
        local v138 = {};
        table.insert(v138, {
            key = "Creator", 
            infoName = "Feature.Catalog.Label.Filter.Creator", 
            infoData = v135, 
            onActivate = v137, 
            hasVerifiedBadge = if l_v128_0 then l_v128_0.hasVerifiedBadge else false, 
            LayoutOrder = 2
        });
        if v107 then
            table.insert(v138, {
                key = "Attribution", 
                isAttribution = true, 
                infoName = "Feature.Catalog.Label.Attribution", 
                creatingUniverseId = v128, 
                gameJoinContext = l_outfitInfo_0, 
                LayoutOrder = 3, 
                attributionRef = v60.attributionRef, 
                NextSelectionUp = if v65 then v60.resellerRef else v60.NextSelectionUp, 
                NextSelectionDown = v60.NextSelectionDown
            });
        end;
        if v105 and v105 ~= "" then
            table.insert(v138, {
                key = "CategoryType", 
                infoName = "Feature.Catalog.Label.CategoryType", 
                infoData = v105, 
                infoNameDetails = l_FFlagAXUseTaxonomyInItemDetailsType_0 and v99 and "Feature.Catalog.Message.PriceCouldBeDifferent" or nil, 
                LayoutOrder = 4
            });
        end;
        if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v104 then
            table.insert(v138, {
                key = "Placement", 
                infoName = "Feature.Catalog.Label.Placement", 
                infoData = v104, 
                LayoutOrder = 5
            });
        end;
        if v119 ~= nil then
            table.insert(v138, {
                key = "PBR", 
                infoName = "Feature.Catalog.Label.PBR", 
                infoData = if v119 then v103.isPBR else v103.notPBR, 
                infoNameDetails = "Feature.Catalog.Label.PBRInfo", 
                LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 6 or 5
            });
        end;
        if v106 ~= nil then
            table.insert(v138, {
                key = "Tradeability", 
                infoName = "Feature.Catalog.Label.Tradable", 
                infoData = if v106 then v103.yesText else v103.noText, 
                LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 7 or 6
            });
        end;
        if v108 then
            table.insert(v138, {
                key = "QuantityLimit", 
                infoName = "Feature.Catalog.Label.MaxPerUser", 
                infoData = v116, 
                LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 9 or 8
            });
        end;
        if v65 then
            if v117 == v18.ResaleRestriction.Disabled then
                table.insert(v138, {
                    key = "Resellability", 
                    infoName = "Feature.Catalog.Label.Resellable", 
                    infoData = v103.noText, 
                    LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 8 or 7
                });
            else
                table.insert(v138, {
                    key = "Sellers", 
                    infoName = "Feature.Catalog.Heading.Resellers", 
                    infoData = if not v110 then v103.noneText else if v88 then v103.fromResalePrice else "", 
                    onActivate = if v110 then v95 else nil, 
                    TextScaled = true, 
                    LayoutOrder = 1, 
                    ref = v60.resellerRef, 
                    NextSelectionUp = v60.NextSelectionUp, 
                    NextSelectionDown = if v107 then v60.attributionRef else v60.NextSelectionDown
                });
                table.insert(v138, {
                    key = "AveragePrice", 
                    infoName = "Feature.Catalog.Label.AveragePrice", 
                    infoData = tostring(v115), 
                    LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 12 or 11
                });
            end;
            table.insert(v138, {
                key = "SoldCount", 
                infoName = "Feature.Catalog.Label.QuantitySold", 
                infoData = if v113 == 0 then v124 else ("%*/%*"):format(v124, l_v112_0), 
                TextScaled = true, 
                LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 10 or 9
            });
            local v139 = if l_v113_0 then v18.RobloxEmoji.Robux .. l_v113_0 else "";
            if v38 then
                v139 = if l_v113_0 then v18.RobloxEmoji.Robux .. l_v113_0 else v103.priceUnavailableText;
            end;
            table.insert(v138, {
                key = "Price", 
                infoName = v117 == v18.ResaleRestriction.Disabled and "Feature.Catalog.Label.Price" or "Feature.Catalog.Label.OriginalPrice", 
                infoData = v139, 
                onActivate = if not v111 or v109 then nil else v127, 
                LayoutOrder = (not not v111 or v117 == v18.ResaleRestriction.Disabled) and 0 or l_FFlagAXUseTaxonomyInItemDetailsType_0 and 11 or 10
            });
        end;
        table.sort(v138, function(v140, v141) --[[ Line: 661 ]]
            return v140.LayoutOrder < v141.LayoutOrder;
        end);
        if l_FFlagDynamicHeadsMigration_0 and #v138 > 0 then
            v138[#v138].hideDivider = true;
        end;
        return v138;
    end)();
    local v143 = {
        UIListLayout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for _, v145 in v142 do
        v143[v145.key] = v5.createElement(if v145.isAttribution then v15 else v16, v145);
    end;
    return v5.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v60.LayoutOrder
    }, v143);
end));