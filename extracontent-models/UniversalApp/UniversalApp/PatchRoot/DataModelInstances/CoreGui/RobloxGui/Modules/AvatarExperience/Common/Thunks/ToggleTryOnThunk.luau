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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v16 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v18 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v19 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate);
local v20 = require(l_Modules_0.AvatarExperience.Common.Actions.ToggleTryOn);
local v21 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v22 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v23 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOrderedToggledOnItemsList);
local v25 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOrderedToggledOnMakeupItemsList);
local v26 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectUpdatedSortOrderForToggledOnItems);
local v27 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectUpdatedSortOrderForToggledOnMakeupItems);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local l_getTryOnItemReducerKey_0 = v6.Utils.getTryOnItemReducerKey;
local l_isMakeupAssetType_0 = v6.Utils.isMakeupAssetType;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_HeadShape_0 = v3.Enums.HeadShape;
local l_TryOnClassicHeadShape_0 = v3.Actions.TryOnClassicHeadShape;
local l_FFlagAXMISEnableMultiShopping_0 = v5.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesForMIS_0 = v5.FFlagAXDurablesForMIS;
local l_FFlagAXBlackbirdRoot_0 = v5.FFlagAXBlackbirdRoot;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogMakeupSupport_0 = v5.FFlagAXCatalogMakeupSupport;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
return function(v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52) --[[ Line: 62 ]]
    -- upvalues: v11 (copy), v16 (copy), l_FFlagAXBlackbirdRoot_0 (copy), v10 (copy), l_getTryOnItemReducerKey_0 (copy), l_AvatarScreenProperties_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v18 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v17 (copy), v29 (copy), v19 (copy), v24 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v25 (copy), l_isMakeupAssetType_0 (copy), v27 (copy), v26 (copy), v23 (copy), v22 (copy), v28 (copy), l_HeadShape_0 (copy), l_TryOnClassicHeadShape_0 (copy), l_useMultiItemShoppingFtux_0 (copy), v2 (copy), l_getFilteredTryOnItems_0 (copy), l_AvatarScreen_0 (copy), v21 (copy), v9 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v20 (copy), l_FFlagAXDurablesForMIS_0 (copy)
    return function(v53) --[[ Line: 76 ]]
        -- upvalues: v44 (copy), v43 (copy), v11 (ref), v16 (ref), v45 (copy), l_FFlagAXBlackbirdRoot_0 (ref), v10 (ref), v41 (copy), l_getTryOnItemReducerKey_0 (ref), v50 (copy), v47 (copy), l_AvatarScreenProperties_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v18 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v48 (copy), v17 (ref), v29 (ref), v42 (copy), v19 (ref), v24 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v25 (ref), l_isMakeupAssetType_0 (ref), v27 (ref), v26 (ref), v23 (ref), v22 (ref), v28 (ref), l_HeadShape_0 (ref), l_TryOnClassicHeadShape_0 (ref), l_useMultiItemShoppingFtux_0 (ref), v51 (copy), v2 (ref), l_getFilteredTryOnItems_0 (ref), l_AvatarScreen_0 (ref), v21 (ref), v9 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v20 (ref), v46 (copy), v49 (copy), l_FFlagAXDurablesForMIS_0 (ref), v52 (copy)
        local v54 = v53:getState();
        if v54.AvatarExperience.LayeredClothingSort.CharacterUpdatesLocked then
            return;
        elseif not v44 then
            return;
        else
            local v55 = nil;
            local v56 = nil;
            local v57 = nil;
            if v43 == v11.ItemType.Bundle then
                v55 = v16.getOutfitInfoFromBundleId(v54, v45);
                local v58 = v54.AvatarExperience.Common.BundleInfos[v45];
                v56 = if v58 then v58.isRecolorable else nil;
                v57 = if v56 and v58 then v44 == v11.BundleTypeIdStrings.BodyParts else nil;
                if not v55 and not l_FFlagAXBlackbirdRoot_0 then
                    v53:dispatch(v10(v41, v45));
                end;
            end;
            local l_TryOnItems_0 = v53:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
            local v60 = l_getTryOnItemReducerKey_0(v45, v43);
            local v61 = l_TryOnItems_0[v60];
            if v50 and v61 ~= nil then
                return;
            else
                local v62 = nil;
                v62 = v47 and l_AvatarScreenProperties_0[v47.opaque.name].isMultiTryOn;
                if not l_FFlagAXMISEnableMultiShopping_0 and not v62 then
                    if not v61 then
                        v53:dispatch(v18(v57));
                        if l_FFlagAXMigrateAXToGlobalAutofocus_0 and v48 then
                            v17.closeTryOnManager(v48);
                        end;
                    elseif v48 then
                        v17.closeFiltersAndItemDetails(v48);
                    end;
                end;
                if l_FFlagAXMISEnableMultiShopping_0 and not v61 or l_FFlagAXBlackbirdRoot_0 then
                    v53:dispatch(v29(v41, v42, v45, v43));
                end;
                if v16.isBundleOrLCAsset(v43, v44) then
                    v53:dispatch(v19());
                end;
                local v63, v64 = v24(v54);
                local v65 = if l_FFlagAXCatalogMakeupSupport_0 then v25(v54) else nil;
                local v66 = if l_FFlagAXCatalogMakeupSupport_0 and l_isMakeupAssetType_0(v44) then v27(v54, v45, v43, v44, v65) else v26(v54, v45, v43, v44, v63, v64);
                if v66.equippedAssetsToSetOrder then
                    v53:dispatch(v23(v66.equippedAssetsToSetOrder));
                end;
                if v66.itemIdToOrderMap then
                    v53:dispatch(v22(v66.itemIdToOrderMap));
                end;
                local v67 = v55 and true or false;
                if v44 == v11.AssetTypeIdStrings.Face then
                    local l_EquippedAssets_0 = v54.AvatarExperience.AvatarEditor.Character.EquippedAssets;
                    if not v54.AvatarExperience.AvatarScene.OutfitTryOn.LastTryOnClassicHeadShape and not v28.isClassicHeadEquipped(l_EquippedAssets_0) then
                        local l_HeadRefinement_0 = v54.AvatarExperience.AvatarScene.HeadRefinement;
                        local v70 = l_HeadRefinement_0 and l_HeadRefinement_0.lastSelectedHeadShape or l_HeadShape_0.Default;
                        v53:dispatch(l_TryOnClassicHeadShape_0(v70));
                    end;
                else
                    v53:dispatch(l_TryOnClassicHeadShape_0(nil));
                end;
                local v71 = nil;
                if l_FFlagAXMISEnableMultiShopping_0 and v43 == v11.ItemType.Bundle then
                    local v72 = v54.AvatarExperience.Common.BundleInfos[v45];
                    if v72 then
                        v71 = v72.items;
                    end;
                end;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    local v73 = l_TryOnItems_0[v60] ~= nil;
                    local v74 = l_useMultiItemShoppingFtux_0();
                    if v74.shouldShowItemReplacedOnAvatarPrompt() and not v51 and v2.fieldCount(l_TryOnItems_0) > 1 and not v73 and v44 then
                        local v75 = nil;
                        if v71 ~= nil then
                            v75 = {};
                            for _, v77 in v71 do
                                if v77.type == v11.ItemType.Asset and v77.assetType then
                                    v75[v77.id] = {
                                        assetType = v77.assetType
                                    };
                                end;
                            end;
                        end;
                        local _, v79 = l_getFilteredTryOnItems_0(l_TryOnItems_0, {
                            itemType = v43, 
                            itemSubType = v44, 
                            bundleInfo = v75
                        });
                        local _, v81 = next(v79);
                        if v81 and v48 then
                            v48.navigate(l_AvatarScreen_0.ItemReplacedOnAvatarPrompt, {
                                onConfirm = function() --[[ Line: 243 ]] --[[ Name: onConfirm ]]
                                    -- upvalues: v74 (copy), v53 (copy), v21 (ref), v48 (ref)
                                    v74.setSeenItemReplaceOnAvatarPrompt();
                                    v53:dispatch(v21(v48));
                                end, 
                                beforeItem = {
                                    itemId = v81.itemId, 
                                    thumbType = v9.GetRbxThumbType(v81.itemType)
                                }, 
                                afterItem = {
                                    itemId = v45, 
                                    thumbType = v9.GetRbxThumbType(v43)
                                }
                            });
                        end;
                    end;
                end;
                if l_FFlagAXMISEnableMultiShopping_0 and v48 and (if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentRoactNavigationRoute(v54) else v54.Navigation.currentRoute).routeName == l_AvatarScreen_0.Checkout then
                    v17.closeFocusedScreen(v48);
                end;
                v53:dispatch(v20(v43, v44, v45, v46, v66.overrideOrder, v66.bundleInfoMapping, v49, v67, v56, if l_FFlagAXMISEnableMultiShopping_0 then v71 else nil, if l_FFlagAXMISEnableMultiShopping_0 then v51 else nil, if l_FFlagAXDurablesForMIS_0 then v52 else nil));
                return;
            end;
        end;
    end;
end;