local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.tutils);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_getFilteredTryOnItems_0 = v4.Utils.TryOns.getFilteredTryOnItems;
local l_useMultiItemShoppingFtux_0 = v4.Hooks.useMultiItemShoppingFtux;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchOutfitInfoFromBundle);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreenProperties_0 = v12.AvatarRoute.AvatarScreenProperties;
local l_AvatarScreen_0 = v12.Enums.AvatarScreen;
local v15 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v18 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate);
local v19 = require(l_Modules_0.AvatarExperience.Common.Actions.ToggleTryOn);
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v21 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v22 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOrderedToggledOnItemsList);
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOrderedToggledOnMakeupItemsList);
local v25 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectUpdatedSortOrderForToggledOnItems);
local v26 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectUpdatedSortOrderForToggledOnMakeupItems);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local l_getTryOnItemReducerKey_0 = v6.Utils.getTryOnItemReducerKey;
local l_isMakeupAssetType_0 = v6.Utils.isMakeupAssetType;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_HeadShape_0 = v3.Enums.HeadShape;
local l_TryOnClassicHeadShape_0 = v3.Actions.TryOnClassicHeadShape;
local l_FFlagAXMISEnableMultiShopping_0 = v5.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesForMIS_0 = v5.FFlagAXDurablesForMIS;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogMakeupSupport_0 = v5.FFlagAXCatalogMakeupSupport;
return function(v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49) --[[ Line: 59 ]]
    -- upvalues: v11 (copy), v15 (copy), v10 (copy), l_getTryOnItemReducerKey_0 (copy), l_AvatarScreenProperties_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v17 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v16 (copy), v28 (copy), v18 (copy), v23 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v24 (copy), l_isMakeupAssetType_0 (copy), v26 (copy), v25 (copy), v22 (copy), v21 (copy), v27 (copy), l_HeadShape_0 (copy), l_TryOnClassicHeadShape_0 (copy), l_useMultiItemShoppingFtux_0 (copy), v2 (copy), l_getFilteredTryOnItems_0 (copy), l_AvatarScreen_0 (copy), v20 (copy), v9 (copy), v19 (copy), l_FFlagAXDurablesForMIS_0 (copy)
    return function(v50) --[[ Line: 73 ]]
        -- upvalues: v41 (copy), v40 (copy), v11 (ref), v15 (ref), v42 (copy), v10 (ref), v38 (copy), l_getTryOnItemReducerKey_0 (ref), v47 (copy), v44 (copy), l_AvatarScreenProperties_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v17 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v45 (copy), v16 (ref), v28 (ref), v39 (copy), v18 (ref), v23 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v24 (ref), l_isMakeupAssetType_0 (ref), v26 (ref), v25 (ref), v22 (ref), v21 (ref), v27 (ref), l_HeadShape_0 (ref), l_TryOnClassicHeadShape_0 (ref), l_useMultiItemShoppingFtux_0 (ref), v48 (copy), v2 (ref), l_getFilteredTryOnItems_0 (ref), l_AvatarScreen_0 (ref), v20 (ref), v9 (ref), v19 (ref), v43 (copy), v46 (copy), l_FFlagAXDurablesForMIS_0 (ref), v49 (copy)
        local v51 = v50:getState();
        if v51.AvatarExperience.LayeredClothingSort.CharacterUpdatesLocked then
            return;
        elseif not v41 then
            return;
        else
            local v52 = nil;
            local v53 = nil;
            local v54 = nil;
            if v40 == v11.ItemType.Bundle then
                v52 = v15.getOutfitInfoFromBundleId(v51, v42);
                local v55 = v51.AvatarExperience.Common.BundleInfos[v42];
                v53 = if v55 then v55.isRecolorable else nil;
                v54 = if v53 and v55 then v41 == v11.BundleTypeIdStrings.BodyParts else nil;
                if not v52 then
                    v50:dispatch(v10(v38, v42));
                end;
            end;
            local l_TryOnItems_0 = v50:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
            local v57 = l_getTryOnItemReducerKey_0(v42, v40);
            local v58 = l_TryOnItems_0[v57];
            if v47 and v58 ~= nil then
                return;
            else
                local v59 = nil;
                v59 = v44 and l_AvatarScreenProperties_0[v44.opaque.name].isMultiTryOn;
                if not l_FFlagAXMISEnableMultiShopping_0 and not v59 then
                    if not v58 then
                        v50:dispatch(v17(v54));
                        if l_FFlagAXMigrateAXToGlobalAutofocus_0 and v45 then
                            v16.closeTryOnManager(v45);
                        end;
                    elseif v45 then
                        v16.closeFiltersAndItemDetails(v45);
                    end;
                end;
                if l_FFlagAXMISEnableMultiShopping_0 and not v58 then
                    v50:dispatch(v28(v38, v39, v42, v40));
                end;
                if v15.isBundleOrLCAsset(v40, v41) then
                    v50:dispatch(v18());
                end;
                local v60, v61 = v23(v51);
                local v62 = if l_FFlagAXCatalogMakeupSupport_0 then v24(v51) else nil;
                local v63 = if l_FFlagAXCatalogMakeupSupport_0 and l_isMakeupAssetType_0(v41) then v26(v51, v42, v40, v41, v62) else v25(v51, v42, v40, v41, v60, v61);
                if v63.equippedAssetsToSetOrder then
                    v50:dispatch(v22(v63.equippedAssetsToSetOrder));
                end;
                if v63.itemIdToOrderMap then
                    v50:dispatch(v21(v63.itemIdToOrderMap));
                end;
                local v64 = v52 and true or false;
                if v41 == v11.AssetTypeIdStrings.Face then
                    local l_EquippedAssets_0 = v51.AvatarExperience.AvatarEditor.Character.EquippedAssets;
                    if not v51.AvatarExperience.AvatarScene.OutfitTryOn.LastTryOnClassicHeadShape and not v27.isClassicHeadEquipped(l_EquippedAssets_0) then
                        local l_HeadRefinement_0 = v51.AvatarExperience.AvatarScene.HeadRefinement;
                        local v67 = l_HeadRefinement_0 and l_HeadRefinement_0.lastSelectedHeadShape or l_HeadShape_0.Default;
                        v50:dispatch(l_TryOnClassicHeadShape_0(v67));
                    end;
                else
                    v50:dispatch(l_TryOnClassicHeadShape_0(nil));
                end;
                local v68 = nil;
                if l_FFlagAXMISEnableMultiShopping_0 and v40 == v11.ItemType.Bundle then
                    local v69 = v51.AvatarExperience.Common.BundleInfos[v42];
                    if v69 then
                        v68 = v69.items;
                    end;
                end;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    local v70 = l_TryOnItems_0[v57] ~= nil;
                    local v71 = l_useMultiItemShoppingFtux_0();
                    if v71.shouldShowItemReplacedOnAvatarPrompt() and not v48 and v2.fieldCount(l_TryOnItems_0) > 1 and not v70 and v41 then
                        local v72 = nil;
                        if v68 ~= nil then
                            v72 = {};
                            for _, v74 in v68 do
                                if v74.type == v11.ItemType.Asset and v74.assetType then
                                    v72[v74.id] = {
                                        assetType = v74.assetType
                                    };
                                end;
                            end;
                        end;
                        local _, v76 = l_getFilteredTryOnItems_0(l_TryOnItems_0, {
                            itemType = v40, 
                            itemSubType = v41, 
                            bundleInfo = v72
                        });
                        local _, v78 = next(v76);
                        if v78 and v45 then
                            v45.navigate(l_AvatarScreen_0.ItemReplacedOnAvatarPrompt, {
                                onConfirm = function() --[[ Line: 246 ]] --[[ Name: onConfirm ]]
                                    -- upvalues: v71 (copy), v50 (copy), v20 (ref), v45 (ref)
                                    v71.setSeenItemReplaceOnAvatarPrompt();
                                    v50:dispatch(v20(v45));
                                end, 
                                beforeItem = {
                                    itemId = v78.itemId, 
                                    thumbType = v9.GetRbxThumbType(v78.itemType)
                                }, 
                                afterItem = {
                                    itemId = v42, 
                                    thumbType = v9.GetRbxThumbType(v40)
                                }
                            });
                        end;
                    end;
                end;
                v50:dispatch(v19(v40, v41, v42, v43, v63.overrideOrder, v63.bundleInfoMapping, v46, v64, v53, if l_FFlagAXMISEnableMultiShopping_0 then v68 else nil, if l_FFlagAXMISEnableMultiShopping_0 then v48 else nil, if l_FFlagAXDurablesForMIS_0 then v49 else nil));
                return;
            end;
        end;
    end;
end;