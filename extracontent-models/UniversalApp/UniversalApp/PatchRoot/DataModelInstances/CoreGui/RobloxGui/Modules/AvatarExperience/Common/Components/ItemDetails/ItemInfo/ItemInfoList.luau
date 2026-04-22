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
local l_ProfileTypes_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.Enums).ProfileTypes;
local v12 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP);
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.AttributionItemInfoRow);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoRow);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useItemDataDigest);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v20 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResaleData);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetVersionData);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local v25 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v26 = require(l_Modules_0.LuaApp.AppPage);
local v27 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v28 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v29 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v30 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v31 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v32 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v33 = game:DefineFastFlag("UseItemDataHookRefactor", false);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v36 = game:DefineFastFlag("FixNavigationToCreatorProfileWebviewFromProfile", false);
local v37 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCollectibleOriginalPrice);
local v38 = game:DefineFastFlag("AXFixMissingResalePrice", false);
local l_FFlagAXUseTaxonomyInItemDetailsType_0 = v3.FFlagAXUseTaxonomyInItemDetailsType;
local v40 = require(l_Modules_0.AvatarExperience.Common.Selectors.getTaxonomyName);
local v41 = require(l_Modules_0.AvatarExperience.Common.Selectors.getEquipSlotForAssetType);
local function _(v42, v43) --[[ Line: 75 ]] --[[ Name: getNumberLocalization ]]
    -- upvalues: l_NumberLocalization_0 (copy)
    if not v42 then
        return nil;
    else
        return l_NumberLocalization_0.localize(v42, v43:GetLocale());
    end;
end;
local function _(v45, v46) --[[ Line: 83 ]] --[[ Name: getProductIdAndCreator ]]
    local v47 = if v45 then v45.collectibleProductId else if v46 and v46.product then v46.product.id else nil;
    if v45 then
        return v47, v45.creator;
    elseif v46 then
        return v47, v46.creator;
    else
        return v47, nil;
    end;
end;
local function _(v49, v50) --[[ Line: 96 ]] --[[ Name: getCreatingUniverseId ]]
    if v50 then
        return v50.creatingUniverseId;
    elseif v49 then
        return v49.creatingUniverseId;
    else
        return nil;
    end;
end;
local function v56(v52, v53, v54, v55) --[[ Line: 106 ]] --[[ Name: getGameJoinContext ]]
    -- upvalues: v18 (copy), v20 (copy)
    if v55 then
        return {
            outfitId = v55.outfitId, 
            itemType = Enum.AvatarItemType.Bundle, 
            joinSource = Enum.JoinSource.CreatedItemAttribution
        };
    else
        return {
            assetId = v53, 
            itemType = if v52 then Enum.AvatarItemType[v52] else nil, 
            assetType = if v52 == v18.ItemType.Asset and v54 then v20.AssetTypeIdStringToEnumValue(v54) else nil, 
            joinSource = Enum.JoinSource.CreatedItemAttribution
        };
    end;
end;
local function _() --[[ Line: 130 ]] --[[ Name: getLocalPlayerName ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    return l_LocalPlayer_0 and l_LocalPlayer_0.Name or "";
end;
return (v5.forwardRef(function(v59, _) --[[ Line: 135 ]]
    -- upvalues: l_useSelector_0 (copy), v13 (copy), l_getUseSelectorDeepEquals_0 (copy), v19 (copy), v38 (copy), v32 (copy), v5 (copy), v17 (copy), v33 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v31 (copy), v28 (copy), v12 (copy), v27 (copy), v26 (copy), l_ProfileTypes_0 (copy), v25 (copy), v36 (copy), l_AvatarScreen_0 (copy), v18 (copy), l_FFlagAXUseTaxonomyInItemDetailsType_0 (copy), v40 (copy), v41 (copy), v29 (copy), l_NumberLocalization_0 (copy), v30 (copy), v37 (copy), v16 (copy), v22 (copy), v23 (copy), v56 (copy), l_Players_0 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v14 (copy), v15 (copy), l_Focusable_0 (copy)
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v69 = l_useSelector_0(function(v68) --[[ Line: 149 ]]
        -- upvalues: v13 (ref), v59 (copy)
        return v13(v68.AvatarExperience.Common, v59.itemId, v59.itemType);
    end, l_getUseSelectorDeepEquals_0());
    (function() --[[ Line: 154 ]]
        -- upvalues: v69 (copy), v61 (ref), v62 (ref), v65 (ref), v66 (ref), v67 (ref), v19 (ref), v59 (copy), v63 (ref), v38 (ref), v64 (ref)
        if v69 then
            v61 = v69.collectibleItemId;
            local l_resellerUserAssetIds_0 = v69.resellerUserAssetIds;
            v62 = l_resellerUserAssetIds_0 and #l_resellerUserAssetIds_0 > 0 and l_resellerUserAssetIds_0[1];
            v65 = if v69.creator then v69.creator.id else nil;
            v66 = if v69.creator then v69.creator.type else nil;
            v67 = v19.GetItemSubType(v59.itemType, v69);
            v63 = if v38 then nil else v19.isLimitedCollectible(v69);
            v64 = if v38 then v19.IsResellable(v69) else nil;
        end;
    end)();
    local v72 = v32(function(v71) --[[ Line: 170 ]]
        return v71.getWebViewSupport();
    end);
    local v74 = v5.useCallback(function(v73) --[[ Line: 174 ]]
        -- upvalues: v61 (ref)
        if v61 then
            return v73.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v61];
        else
            return nil;
        end;
    end, {
        v61
    });
    local v75 = l_useSelector_0(v74);
    if v32(function(v76) --[[ Line: 181 ]]
        return v76.getDisableResellingCollectiblesForCompliance();
    end) and v75 then
        v75.resaleRestriction = v17.ResaleRestriction.Disabled;
    end;
    local v78 = v5.useCallback(function(v77) --[[ Line: 189 ]]
        -- upvalues: v38 (ref), v64 (ref), v63 (ref), v61 (ref)
        if not if v38 then v64 else v63 then
            return nil;
        elseif v61 then
            return v77.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v61];
        else
            return nil;
        end;
    end, {
        v61, 
        if v38 then v64 else v63
    });
    local v79 = if not v33 then l_useSelector_0(v78, l_getUseSelectorDeepEquals_0()) else nil;
    local v81 = l_useSelector_0(function(v80) --[[ Line: 204 ]]
        return v80.UserRobux[v80.LocalUserId];
    end, l_getUseSelectorDeepEquals_0());
    local v87 = l_useSelector_0(function(v82) --[[ Line: 208 ]]
        -- upvalues: v61 (ref), v38 (ref), v64 (ref), v63 (ref), v62 (ref)
        if v61 then
            if not if v38 then v64 else v63 then
                return nil;
            else
                local v83 = v82.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances[v61];
                local v84 = v83 and #v83.InstanceIdsList > 0 and v83.InstanceIdsList[1];
                local v85 = if v84 then v83.Instances[v84] else nil;
                if v85 then
                    return v85.price;
                else
                    return nil;
                end;
            end;
        elseif v62 then
            local v86 = v82.AvatarExperience.Catalog.UserAssets[v62];
            if v86 then
                return v86.priceInRobux;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v88 = l_useDispatch_0();
    local v89 = l_useNavigation_0();
    local v90 = v31(v28);
    local v91 = if v12.FFlagIsSetupEnabled then v12.useIsFeatureActive({
        isExposureEnabled = false
    }) else nil;
    local v93 = v5.useCallback(function() --[[ Line: 240 ]]
        -- upvalues: v65 (ref), v12 (ref), v66 (ref), v17 (ref), v91 (copy), v88 (copy), v27 (ref), v26 (ref), l_ProfileTypes_0 (ref), v25 (ref), v36 (ref), v89 (copy)
        if v65 then
            if v12.FFlagIsSetupEnabled and v66 == v17.CreatorType.Group then
                v12.logExposure();
            end;
            if v12.FFlagIsSetupEnabled and v91 then
                if v66 == v17.CreatorType.Group then
                    v88(v27({
                        name = v26.ProfilePlatform, 
                        detail = v65, 
                        extraProps = {
                            profileType = l_ProfileTypes_0.Community, 
                            source = "ItemDetailsPage"
                        }
                    }));
                    return;
                elseif v66 == v17.CreatorType.User then
                    v88(v27({
                        name = v26.ProfilePlatform, 
                        detail = v65, 
                        extraProps = {
                            profileType = l_ProfileTypes_0.User, 
                            source = "ItemDetailsPage"
                        }
                    }));
                    return;
                else
                    v88(v27({
                        name = v26.GenericWebPage, 
                        detail = v25.user.profile({
                            userId = v65
                        }), 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.Profile"
                        }
                    }));
                    return;
                end;
            else
                local v92 = if v66 == v17.CreatorType.Group then v25.user.group({
                    groupId = v65
                }) else v25.user.profile({
                    userId = v65
                });
                if v36 then
                    v88(v27({
                        name = v26.GenericWebPage, 
                        detail = v92, 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.Profile"
                        }
                    }));
                    return;
                else
                    v89.navigate(v26.GenericWebPage, {
                        detail = v92, 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.Profile"
                        }
                    });
                end;
            end;
        end;
    end, {
        v65, 
        v66, 
        if v12.FFlagIsSetupEnabled then v91 else nil
    });
    local v94 = v5.useCallback(function() --[[ Line: 307 ]]
        -- upvalues: v89 (copy), l_AvatarScreen_0 (ref), v59 (copy), v61 (ref)
        v89.navigate(l_AvatarScreen_0.ResellersPage, {
            itemId = v59.itemId, 
            collectibleItemId = v61, 
            itemType = v59.itemType, 
            fromContentFeed = v89.getParam("fromContentFeed"), 
            fromProfile = v89.getParam("fromProfile")
        });
    end, {
        v89, 
        v59.itemId, 
        v69, 
        v59.itemType, 
        v89.getParam("fromContentFeed"), 
        v89.getParam("fromProfile")
    });
    local v95 = nil;
    local v96 = nil;
    if v59.itemType == v18.ItemType.Asset then
        local v97 = v18.AssetTypeIdToCategory[v67];
        v95 = v18.AssetCategoriesLocalized[v97];
        v96 = v18.AssetTypeLocalized[v67];
    end;
    local v98 = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v69 then v40(v69.taxonomy) else nil;
    local v99 = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v67 then v41(v59.itemType, v67) else nil;
    local v100 = v31(v29);
    local v101 = if v87 then l_NumberLocalization_0.localize(v87, v100:GetLocale()) else "";
    local v102 = v30({
        bundle = "Feature.Catalog.Label.Bundle", 
        category = v95, 
        subType = v96, 
        yesText = "Feature.Catalog.Label.Yes", 
        noText = "Feature.Catalog.Label.No", 
        isPBR = "Feature.Catalog.Label.PBR.true", 
        notPBR = "Feature.Catalog.Label.PBR.false", 
        noneText = "Feature.Catalog.Label.None", 
        fromResalePrice = {
            "Feature.Catalog.Label.FromPrice"; 
            itemPrice = v17.RobloxEmoji.Robux .. v101
        }, 
        priceUnavailableText = v37 and "Feature.Catalog.Label.NA" or nil, 
        placementCategory = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v99 then v99.categoryKey else nil, 
        placementSlot = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v99 then v99.slotKey else nil
    });
    local v103 = nil;
    if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v99 then
        if v102.placementCategory and v102.placementSlot then
            v103 = ("%* | %*"):format(v102.placementCategory, v102.placementSlot);
        elseif v102.placementCategory then
            v103 = v102.placementCategory;
        end;
    end;
    local v104 = nil;
    v104 = if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v98 then v98 else if v59.itemType == v18.ItemType.Asset and v102.category and v102.subType then ("%* | %*"):format(v102.category, v102.subType) else if v59.itemType == v18.ItemType.Bundle then v102.bundle else "";
    local v105 = nil;
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
    local v117 = false;
    local v118 = nil;
    (function() --[[ Line: 398 ]]
        -- upvalues: v33 (ref), v16 (ref), v59 (copy), v64 (ref), v105 (ref), v106 (ref), v107 (ref), v108 (ref), v109 (ref), v111 (ref), v112 (ref), v113 (ref), v114 (ref), v115 (ref), v110 (ref), v116 (ref), v118 (ref), v38 (ref), v19 (ref), v69 (copy), v75 (copy), v17 (ref), v37 (ref), v79 (copy), v61 (ref), v117 (ref)
        if v33 then
            local v119 = v16(v59.itemId, v59.itemType);
            v64 = v119.isResellable;
            v105 = v119.isTradable;
            v106 = v119.hasAttribution;
            v107 = v119.shouldShowQuantityLimit;
            v108 = v119.reachedQuantityLimit;
            v109 = v119.hasResellers;
            v111 = v119.soldCount;
            v112 = v119.itemStock;
            v113 = v119.originalPrice;
            v114 = v119.averagePrice;
            v115 = v119.quantityLimit;
            v110 = v119.isStockAvailable;
            v116 = v119.collectiblesResaleRestriction;
            v118 = v119.isPBR;
        else
            if not v38 then
                v64 = v19.IsResellable(v69);
            end;
            v105 = v19.getIsTradable(v69);
            v106 = v19.HasAttribution(v69);
            v115 = 0;
            v107 = false;
            v108 = false;
            v109 = if v69 and v69.resellerUserAssetIds then #v69.resellerUserAssetIds > 0 else false;
            v111 = if v69 and v69.soldCount then v69.soldCount else 0;
            v112 = if v69 and v69.totalQuantity then v69.totalQuantity else 0;
            v113 = if v69 and v69.originalPrice then v69.originalPrice else 0;
            v114 = if v69 and v69.averagePrice then v69.averagePrice else 0;
            v118 = if v69 then v69.isPBR else nil;
            if v75 then
                v116 = if v75.resaleRestriction then v75.resaleRestriction else v17.ResaleRestriction.None;
                v109 = if v75.hasResellers then v75.hasResellers else false;
                local v120 = v75.assetStock or 0;
                local v121 = v75.unitsAvailableForConsumption or 0;
                v111 = if v120 and v121 then v120 - v121 else 0;
                v113 = if v37 then v75.price else v75.price or 0;
                v114 = v75.recentAveragePrice or 0;
                v112 = v75.assetStock or 0;
                v115 = v75.quantityLimitPerUser or 0;
                v108 = v19.reachQuantityLimit(v75, v79);
                v107 = v19.shouldShowQuantityLimit(v115);
            end;
            v110 = v111 < v112;
            v110 = v110 and v19.isOriginalStockSellableInShop(v75);
        end;
        if v64 and v69 and not v61 then
            v117 = true;
        end;
    end)();
    if v59.outfitInfo then
        v106 = v59.outfitInfo.creatingUniverseId ~= nil;
    end;
    local l_v111_0 = v111;
    local v123 = if not l_v111_0 then nil else l_NumberLocalization_0.localize(l_v111_0, v100:GetLocale());
    local l_v112_0 = v112;
    l_v111_0 = if not l_v112_0 then nil else l_NumberLocalization_0.localize(l_v112_0, v100:GetLocale());
    local l_v113_0 = v113;
    l_v112_0 = if not l_v113_0 then nil else l_NumberLocalization_0.localize(l_v113_0, v100:GetLocale());
    local v126 = if v75 then v75.collectibleProductId else if v69 and v69.product then v69.product.id else nil;
    local v127 = if v75 then v75.creator else if v69 then v69.creator else nil;
    l_v113_0 = v126;
    local l_v127_0 = v127;
    v126 = v5.useCallback(function() --[[ Line: 470 ]]
        -- upvalues: l_v127_0 (copy), v89 (copy), v113 (ref), v81 (copy), l_AvatarScreen_0 (ref), v59 (copy), l_v113_0 (copy)
        local v129 = if l_v127_0 then l_v127_0.id else nil;
        local v130 = if l_v127_0 then l_v127_0.name else nil;
        local v131 = v89.getParam("fromContentFeed");
        local v132 = v89.getParam("fromProfile");
        if v113 and v81 and v113 <= v81 then
            v89.navigate(l_AvatarScreen_0.PurchaseCatalogItem, {
                itemId = v59.itemId, 
                itemType = v59.itemType, 
                productId = l_v113_0, 
                priceInRobux = v113, 
                sellerId = v129, 
                sellerName = v130, 
                userAssetId = nil, 
                collectibleInstanceId = nil, 
                fromProfile = v132, 
                fromContentFeed = v131
            });
            return;
        else
            v89.navigate(l_AvatarScreen_0.InsufficientRobuxPrompt, {});
            return;
        end;
    end, {
        l_v113_0, 
        l_v127_0, 
        v75, 
        v89, 
        v59.itemId, 
        v59.itemType, 
        v113
    });
    v5.useEffect(function() --[[ Line: 494 ]]
        -- upvalues: v117 (ref), v88 (copy), v22 (ref), v90 (copy), v59 (copy), v18 (ref), v23 (ref)
        if v117 then
            v88(v22(v90, v59.itemId));
        end;
        if v59.itemType == v18.ItemType.Asset then
            v88(v23(v90, v59.itemId));
        end;
    end, {
        v117, 
        v90, 
        v59.itemId
    });
    local l_outfitInfo_0 = v59.outfitInfo;
    v127 = if l_outfitInfo_0 then l_outfitInfo_0.creatingUniverseId else if v69 then v69.creatingUniverseId else nil;
    l_outfitInfo_0 = v56(v59.itemType, v59.itemId, v67, v59.outfitInfo);
    local v134;
    if l_v127_0 then
        v134 = l_v127_0.name;
    elseif v127 then
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        v134 = l_LocalPlayer_1 and l_LocalPlayer_1.Name or "";
    else
        v134 = "";
    end;
    local v136 = if v72 and v65 then v93 else nil;
    local v141 = (function() --[[ Line: 517 ]]
        -- upvalues: v134 (copy), v136 (copy), l_v127_0 (copy), v106 (ref), v127 (copy), l_outfitInfo_0 (copy), v59 (copy), v64 (ref), v104 (ref), l_FFlagAXUseTaxonomyInItemDetailsType_0 (ref), v98 (copy), v103 (ref), v118 (ref), v102 (copy), v105 (ref), v107 (ref), v115 (ref), v116 (ref), v17 (ref), v109 (ref), v87 (copy), v94 (copy), v114 (ref), v112 (ref), v123 (copy), l_v111_0 (copy), l_v112_0 (copy), v37 (ref), v110 (ref), v108 (ref), v126 (copy), l_FFlagDynamicHeadsMigration_0 (ref)
        local v137 = {};
        table.insert(v137, {
            key = "Creator", 
            infoName = "Feature.Catalog.Label.Filter.Creator", 
            infoData = v134, 
            onActivate = v136, 
            hasVerifiedBadge = if l_v127_0 then l_v127_0.hasVerifiedBadge else false, 
            LayoutOrder = 2
        });
        if v106 then
            table.insert(v137, {
                key = "Attribution", 
                isAttribution = true, 
                infoName = "Feature.Catalog.Label.Attribution", 
                creatingUniverseId = v127, 
                gameJoinContext = l_outfitInfo_0, 
                LayoutOrder = 3, 
                attributionRef = v59.attributionRef, 
                NextSelectionUp = if v64 then v59.resellerRef else v59.NextSelectionUp, 
                NextSelectionDown = v59.NextSelectionDown
            });
        end;
        if v104 and v104 ~= "" then
            table.insert(v137, {
                key = "CategoryType", 
                infoName = "Feature.Catalog.Label.CategoryType", 
                infoData = v104, 
                infoNameDetails = l_FFlagAXUseTaxonomyInItemDetailsType_0 and v98 and "Feature.Catalog.Message.PriceCouldBeDifferent" or nil, 
                LayoutOrder = 4
            });
        end;
        if l_FFlagAXUseTaxonomyInItemDetailsType_0 and v103 then
            table.insert(v137, {
                key = "Placement", 
                infoName = "Feature.Catalog.Label.Placement", 
                infoData = v103, 
                LayoutOrder = 5
            });
        end;
        if v118 ~= nil then
            table.insert(v137, {
                key = "PBR", 
                infoName = "Feature.Catalog.Label.PBR", 
                infoData = if v118 then v102.isPBR else v102.notPBR, 
                infoNameDetails = "Feature.Catalog.Label.PBRInfo", 
                LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 6 or 5
            });
        end;
        if v105 ~= nil then
            table.insert(v137, {
                key = "Tradeability", 
                infoName = "Feature.Catalog.Label.Tradable", 
                infoData = if v105 then v102.yesText else v102.noText, 
                LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 7 or 6
            });
        end;
        if v107 then
            table.insert(v137, {
                key = "QuantityLimit", 
                infoName = "Feature.Catalog.Label.MaxPerUser", 
                infoData = v115, 
                LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 9 or 8
            });
        end;
        if v64 then
            if v116 == v17.ResaleRestriction.Disabled then
                table.insert(v137, {
                    key = "Resellability", 
                    infoName = "Feature.Catalog.Label.Resellable", 
                    infoData = v102.noText, 
                    LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 8 or 7
                });
            else
                table.insert(v137, {
                    key = "Sellers", 
                    infoName = "Feature.Catalog.Heading.Resellers", 
                    infoData = if not v109 then v102.noneText else if v87 then v102.fromResalePrice else "", 
                    onActivate = if v109 then v94 else nil, 
                    TextScaled = true, 
                    LayoutOrder = 1, 
                    ref = v59.resellerRef, 
                    NextSelectionUp = v59.NextSelectionUp, 
                    NextSelectionDown = if v106 then v59.attributionRef else v59.NextSelectionDown
                });
                table.insert(v137, {
                    key = "AveragePrice", 
                    infoName = "Feature.Catalog.Label.AveragePrice", 
                    infoData = tostring(v114), 
                    LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 12 or 11
                });
            end;
            table.insert(v137, {
                key = "SoldCount", 
                infoName = "Feature.Catalog.Label.QuantitySold", 
                infoData = if v112 == 0 then v123 else ("%*/%*"):format(v123, l_v111_0), 
                TextScaled = true, 
                LayoutOrder = l_FFlagAXUseTaxonomyInItemDetailsType_0 and 10 or 9
            });
            local v138 = if l_v112_0 then v17.RobloxEmoji.Robux .. l_v112_0 else "";
            if v37 then
                v138 = if l_v112_0 then v17.RobloxEmoji.Robux .. l_v112_0 else v102.priceUnavailableText;
            end;
            table.insert(v137, {
                key = "Price", 
                infoName = v116 == v17.ResaleRestriction.Disabled and "Feature.Catalog.Label.Price" or "Feature.Catalog.Label.OriginalPrice", 
                infoData = v138, 
                onActivate = if not v110 or v108 then nil else v126, 
                LayoutOrder = (not not v110 or v116 == v17.ResaleRestriction.Disabled) and 0 or l_FFlagAXUseTaxonomyInItemDetailsType_0 and 11 or 10
            });
        end;
        table.sort(v137, function(v139, v140) --[[ Line: 660 ]]
            return v139.LayoutOrder < v140.LayoutOrder;
        end);
        if l_FFlagDynamicHeadsMigration_0 and #v137 > 0 then
            v137[#v137].hideDivider = true;
        end;
        return v137;
    end)();
    local v142 = {
        UIListLayout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for _, v144 in v141 do
        v142[v144.key] = v5.createElement(if v144.isAttribution then v14 else v15, v144);
    end;
    return v5.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v59.LayoutOrder
    }, v142);
end));