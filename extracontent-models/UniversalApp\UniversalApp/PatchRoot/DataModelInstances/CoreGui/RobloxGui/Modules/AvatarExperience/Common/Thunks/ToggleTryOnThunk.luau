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
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogMakeupSupport_0 = v5.FFlagAXCatalogMakeupSupport;
return function(v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47) --[[ Line: 58 ]]
    -- upvalues: v11 (copy), v15 (copy), v10 (copy), l_getTryOnItemReducerKey_0 (copy), l_AvatarScreenProperties_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v17 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v16 (copy), v28 (copy), v18 (copy), v23 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v24 (copy), l_isMakeupAssetType_0 (copy), v26 (copy), v25 (copy), v22 (copy), v21 (copy), v27 (copy), l_HeadShape_0 (copy), l_TryOnClassicHeadShape_0 (copy), l_useMultiItemShoppingFtux_0 (copy), v2 (copy), l_getFilteredTryOnItems_0 (copy), l_AvatarScreen_0 (copy), v20 (copy), v9 (copy), v19 (copy)
    return function(v48) --[[ Line: 71 ]]
        -- upvalues: v40 (copy), v39 (copy), v11 (ref), v15 (ref), v41 (copy), v10 (ref), v37 (copy), l_getTryOnItemReducerKey_0 (ref), v46 (copy), v43 (copy), l_AvatarScreenProperties_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v17 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v44 (copy), v16 (ref), v28 (ref), v38 (copy), v18 (ref), v23 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v24 (ref), l_isMakeupAssetType_0 (ref), v26 (ref), v25 (ref), v22 (ref), v21 (ref), v27 (ref), l_HeadShape_0 (ref), l_TryOnClassicHeadShape_0 (ref), l_useMultiItemShoppingFtux_0 (ref), v47 (copy), v2 (ref), l_getFilteredTryOnItems_0 (ref), l_AvatarScreen_0 (ref), v20 (ref), v9 (ref), v19 (ref), v42 (copy), v45 (copy)
        local v49 = v48:getState();
        if v49.AvatarExperience.LayeredClothingSort.CharacterUpdatesLocked then
            return;
        elseif not v40 then
            return;
        else
            local v50 = nil;
            local v51 = nil;
            local v52 = nil;
            if v39 == v11.ItemType.Bundle then
                v50 = v15.getOutfitInfoFromBundleId(v49, v41);
                local v53 = v49.AvatarExperience.Common.BundleInfos[v41];
                v51 = if v53 then v53.isRecolorable else nil;
                v52 = if v51 and v53 then v40 == v11.BundleTypeIdStrings.BodyParts else nil;
                if not v50 then
                    v48:dispatch(v10(v37, v41));
                end;
            end;
            local l_TryOnItems_0 = v48:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
            local v55 = l_getTryOnItemReducerKey_0(v41, v39);
            local v56 = l_TryOnItems_0[v55];
            if v46 and v56 ~= nil then
                return;
            else
                local v57 = nil;
                v57 = v43 and l_AvatarScreenProperties_0[v43.opaque.name].isMultiTryOn;
                if not l_FFlagAXMISEnableMultiShopping_0 and not v57 then
                    if not v56 then
                        v48:dispatch(v17(v52));
                        if l_FFlagAXMigrateAXToGlobalAutofocus_0 and v44 then
                            v16.closeTryOnManager(v44);
                        end;
                    elseif v44 then
                        v16.closeFiltersAndItemDetails(v44);
                    end;
                end;
                if l_FFlagAXMISEnableMultiShopping_0 and not v56 then
                    v48:dispatch(v28(v37, v38, v41, v39));
                end;
                if v15.isBundleOrLCAsset(v39, v40) then
                    v48:dispatch(v18());
                end;
                local v58, v59 = v23(v49);
                local v60 = if l_FFlagAXCatalogMakeupSupport_0 then v24(v49) else nil;
                local v61 = if l_FFlagAXCatalogMakeupSupport_0 and l_isMakeupAssetType_0(v40) then v26(v49, v41, v39, v40, v60) else v25(v49, v41, v39, v40, v58, v59);
                if v61.equippedAssetsToSetOrder then
                    v48:dispatch(v22(v61.equippedAssetsToSetOrder));
                end;
                if v61.itemIdToOrderMap then
                    v48:dispatch(v21(v61.itemIdToOrderMap));
                end;
                local v62 = v50 and true or false;
                if v40 == v11.AssetTypeIdStrings.Face then
                    local l_EquippedAssets_0 = v49.AvatarExperience.AvatarEditor.Character.EquippedAssets;
                    if not v49.AvatarExperience.AvatarScene.OutfitTryOn.LastTryOnClassicHeadShape and not v27.isClassicHeadEquipped(l_EquippedAssets_0) then
                        local l_HeadRefinement_0 = v49.AvatarExperience.AvatarScene.HeadRefinement;
                        local v65 = l_HeadRefinement_0 and l_HeadRefinement_0.lastSelectedHeadShape or l_HeadShape_0.Default;
                        v48:dispatch(l_TryOnClassicHeadShape_0(v65));
                    end;
                else
                    v48:dispatch(l_TryOnClassicHeadShape_0(nil));
                end;
                local v66 = nil;
                if l_FFlagAXMISEnableMultiShopping_0 and v39 == v11.ItemType.Bundle then
                    local v67 = v49.AvatarExperience.Common.BundleInfos[v41];
                    if v67 then
                        v66 = v67.items;
                    end;
                end;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    local v68 = l_TryOnItems_0[v55] ~= nil;
                    local v69 = l_useMultiItemShoppingFtux_0();
                    if v69.shouldShowItemReplacedOnAvatarPrompt() and not v47 and v2.fieldCount(l_TryOnItems_0) > 1 and not v68 and v40 then
                        local v70 = nil;
                        if v66 ~= nil then
                            v70 = {};
                            for _, v72 in v66 do
                                if v72.type == v11.ItemType.Asset and v72.assetType then
                                    v70[v72.id] = {
                                        assetType = v72.assetType
                                    };
                                end;
                            end;
                        end;
                        local _, v74 = l_getFilteredTryOnItems_0(l_TryOnItems_0, {
                            itemType = v39, 
                            itemSubType = v40, 
                            bundleInfo = v70
                        });
                        local _, v76 = next(v74);
                        if v76 and v44 then
                            v44.navigate(l_AvatarScreen_0.ItemReplacedOnAvatarPrompt, {
                                onConfirm = function() --[[ Line: 244 ]] --[[ Name: onConfirm ]]
                                    -- upvalues: v69 (copy), v48 (copy), v20 (ref), v44 (ref)
                                    v69.setSeenItemReplaceOnAvatarPrompt();
                                    v48:dispatch(v20(v44));
                                end, 
                                beforeItem = {
                                    itemId = v76.itemId, 
                                    thumbType = v9.GetRbxThumbType(v76.itemType)
                                }, 
                                afterItem = {
                                    itemId = v41, 
                                    thumbType = v9.GetRbxThumbType(v39)
                                }
                            });
                        end;
                    end;
                end;
                v48:dispatch(v19(v39, v40, v41, v42, v61.overrideOrder, v61.bundleInfoMapping, v45, v62, v51, if l_FFlagAXMISEnableMultiShopping_0 then v66 else nil, if l_FFlagAXMISEnableMultiShopping_0 then v47 else nil));
                return;
            end;
        end;
    end;
end;