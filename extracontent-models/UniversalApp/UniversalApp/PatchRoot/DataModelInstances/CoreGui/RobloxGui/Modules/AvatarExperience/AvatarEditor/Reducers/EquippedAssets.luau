local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.LuaApp.mutedError);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local l_SetEquippedDynamicHeadShape_0 = v5.Actions.SetEquippedDynamicHeadShape;
local l_SetEquippedStaticFacialAnimation_0 = v5.Actions.SetEquippedStaticFacialAnimation;
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagDynamicHeadsMigration_0 = v9.FFlagDynamicHeadsMigration;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v9.FFlagHeadRefinementFacialAnimationToggle;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateAvatarEquips);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.EquipOutfit);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UnequipOutfit);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.BatchUnequipByAssetType);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v22 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local v23 = require(l_Modules_0.AvatarExperience.LayeredMakeupSort.LayeredMakeupSortUtils);
local v24 = require(l_Modules_0.AvatarExperience.Common.Models.AssetMetadata);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RemoveLayeredClothing);
local v26 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local v27 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAccessoryAdjustments);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_HeadShape_0 = v5.Enums.HeadShape;
local l_HeadShapeProperties_0 = v5.Enums.HeadShapeProperties;
local v31 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableBatchUnequips);
local v32 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CharacterHistoryStateChangeButtonActivated_0 = v32.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_PurchaseItemsSuccess_0 = v8.State.Actions.PurchaseItemsSuccess;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v32.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_MAX_MAKEUP_LAYERS_0 = v32.Constants.MAX_MAKEUP_LAYERS;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip);
local l_FFlagAXMISEnableMultiShopping_0 = v9.FFlagAXMISEnableMultiShopping;
local v40 = game:DefineFastFlag("AXRefactorToggleEquipAsset3", false);
local l_FFlagAXModeratedItemsFlow_0 = v9.FFlagAXModeratedItemsFlow;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v9.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagAXCustomizeMakeupSupport_0 = v9.FFlagAXCustomizeMakeupSupport;
local v44 = game:DefineFastFlag("AXEquippedAssetsMissingAssetTypeId", false);
local l_FFlagAXSkipEmotesInAvatarData_0 = v9.FFlagAXSkipEmotesInAvatarData;
local function _(v46, v47) --[[ Line: 80 ]] --[[ Name: checkIfWearingAsset ]]
    if v46 and v46[v47] then
        return true;
    else
        return false;
    end;
end;
local function v55(v49, v50) --[[ Line: 92 ]] --[[ Name: replaceOutfitParts ]]
    -- upvalues: v38 (copy), v20 (copy), v3 (copy)
    if v38() then
        local v51 = {};
        if v50[v20.AssetTypeIdStrings.Head] or v50[v20.AssetTypeIdStrings.DynamicHead] then
            local v52 = {
                [v20.AssetTypeIdStrings.Head] = {}, 
                [v20.AssetTypeIdStrings.DynamicHead] = {}
            };
            for v53, _ in v20.DynamicHeadAssetTypes do
                v52[v53] = {};
            end;
            v51 = v3.Dictionary.join(v52, v50);
        else
            v51 = v50;
        end;
        return (v3.Dictionary.join(v49, v51));
    else
        return v3.Dictionary.join(v49, v50);
    end;
end;
local function v82(v56, v57, v58) --[[ Line: 154 ]] --[[ Name: toggleSingleAsset ]]
    -- upvalues: v20 (copy), v3 (copy), v24 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v23 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), v22 (copy), v44 (copy), v4 (copy), v21 (copy), l_HeadShapeProperties_0 (copy), l_HeadShape_0 (copy)
    v56 = v56 or {};
    if v57.assetTypeId == v20.AssetTypeIdStrings.EmoteAnimation then
        return v56;
    else
        local v59 = v56[v57.assetTypeId];
        local l_assetId_0 = v57.assetId;
        if v59 and v59[l_assetId_0] and true or false then
            v59 = v56[v57.assetTypeId] or {};
            return v3.Dictionary.join(v56, {
                [v57.assetTypeId] = v3.Dictionary.join(v59, {
                    [v57.assetId] = v3.None
                })
            });
        else
            v59 = v24.getDefaultMetadata(v57.assetTypeId);
            if v57.overrideOrder then
                v59.order = v57.overrideOrder;
                l_assetId_0 = if l_FFlagAXCustomizeMakeupSupport_0 then v23.getSortedEquippedLayeredMakeup(v56) else nil;
                if l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v57.assetTypeId] and l_assetId_0 and #l_assetId_0 == l_MAX_MAKEUP_LAYERS_0 then
                    local v61 = l_assetId_0[#l_assetId_0];
                    v56 = v3.Dictionary.join(v56, {
                        [v61.typeId] = v3.Dictionary.join(v56[v61.typeId] or {}, {
                            [v61.id] = v3.None
                        })
                    });
                end;
            elseif v59.isLayered and (not l_FFlagAXCustomizeMakeupSupport_0 or v20.AssetTypeIdToAccessoryTypeEnum[v57.assetTypeId]) then
                l_assetId_0 = v22.getSortedEquippedLCIfNoDefault(v56);
                if l_assetId_0 then
                    local v62 = {
                        id = v57.assetId, 
                        typeId = v57.assetTypeId
                    };
                    local v63, _ = v22.getTableAndOrderAfterEquippingIntoSort(l_assetId_0, v62);
                    for v65, v66 in v63 do
                        if v66.id ~= v57.assetId then
                            if v44 and not v56[v66.typeId] then
                                v4((("EquippedAssets.lua missing asset typeId post sort ID:%* typeId: %*"):format(v66.id, v66.typeId)));
                            else
                                v56 = v3.Dictionary.join(v56, {
                                    [v66.typeId] = v3.Dictionary.join(v56[v66.typeId], {
                                        [v66.id] = v3.Dictionary.join(v56[v66.typeId][v66.id], {
                                            order = #v63 - v65
                                        })
                                    })
                                });
                            end;
                        else
                            v59.order = #v63 - v65;
                        end;
                    end;
                end;
            elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v57.assetTypeId] then
                l_assetId_0 = v23.getSortedEquippedLayeredMakeup(v56);
                if l_assetId_0 then
                    local v67 = {
                        id = v57.assetId, 
                        typeId = v57.assetTypeId
                    };
                    local v68, _ = v23.getTableAndOrderAfterEquippingIntoSort(l_assetId_0, v67);
                    for v70, v71 in v68 do
                        if v71.id ~= v57.assetId then
                            local v72 = v56[v71.typeId] or {};
                            local v73 = v72[v71.id] or {};
                            v56 = v3.Dictionary.join(v56, {
                                [v71.typeId] = v3.Dictionary.join(v72, {
                                    [v71.id] = v3.Dictionary.join(v73, {
                                        order = #v68 - v70
                                    })
                                })
                            });
                        else
                            v59.order = math.min(#v68 - v70, l_MAX_MAKEUP_LAYERS_0 - 1);
                        end;
                    end;
                    if #l_assetId_0 > l_MAX_MAKEUP_LAYERS_0 then
                        for v74 = l_MAX_MAKEUP_LAYERS_0 + 1, #l_assetId_0 do
                            v56 = v3.Dictionary.join(v56, {
                                [l_assetId_0[v74].typeId] = v3.Dictionary.join(v56[l_assetId_0[v74].typeId] or {}, {
                                    [l_assetId_0[v74].id] = v3.None
                                })
                            });
                        end;
                    end;
                    return v3.Dictionary.join(v56, {
                        [v57.assetTypeId] = v3.Dictionary.join(v56[v57.assetTypeId] or {}, {
                            [v57.assetId] = v59
                        })
                    });
                end;
            elseif v57.overrideAdjustments then
                v59 = v3.Dictionary.join(v59, v57.overrideAdjustments);
            end;
            l_assetId_0 = {
                [v57.assetId] = v59
            };
            local v75 = v56[v57.assetTypeId] or {};
            if v57.assetTypeId == v20.AssetTypeIdStrings.Hat and (not v58 or not v58.ignoreAccessoryLimits) then
                if #v3.Dictionary.keys(v75) >= v21.MaxHats then
                    return v56;
                else
                    return v3.Dictionary.join(v56, {
                        [v57.assetTypeId] = v3.Dictionary.join(v75, l_assetId_0)
                    });
                end;
            else
                local v76 = v20.AssetTypeToAssetCategory[v57.assetTypeId];
                if v76 then
                    for _, v78 in v20.AssetCategoryToAssetTypes[v76] do
                        if v56[v78] and next(v56[v78]) then
                            v56 = v3.Dictionary.join(v56, {
                                [v78] = {}
                            });
                        end;
                    end;
                end;
                if v57.assetTypeId == v20.AssetTypeIdStrings.Head then
                    for v79, _ in v20.DynamicHeadAssetTypes do
                        v56 = v3.Dictionary.join(v56, {
                            [v79] = {}
                        });
                    end;
                end;
                if v57.assetTypeId == v20.AssetTypeIdStrings.DynamicHead then
                    v56 = v3.Dictionary.join(v56, {
                        [v20.AssetTypeIdStrings.Head] = {}
                    });
                end;
                if v57.assetId and tostring(v57.assetId) == tostring(l_HeadShapeProperties_0[l_HeadShape_0.Default].assetId) then
                    return (v3.Dictionary.join(v56, {
                        [v20.AssetTypeIdStrings.Head] = {}, 
                        [v20.AssetTypeIdStrings.DynamicHead] = {}
                    }));
                else
                    local v81 = v20.BypassAccessoryLimitsAccessoryAssetTypeIdStrings[v57.assetTypeId];
                    if l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v57.assetTypeId] then
                        return v3.Dictionary.join(v56, {
                            [v57.assetTypeId] = v3.Dictionary.join(v75, l_assetId_0)
                        });
                    else
                        return v3.Dictionary.join(v56, {
                            [v57.assetTypeId] = if v58 and v58.ignoreAccessoryLimits and v81 then v3.Dictionary.join(v75, l_assetId_0) else l_assetId_0
                        });
                    end;
                end;
            end;
        end;
    end;
end;
return v2.createReducer(nil, {
    [v18.name] = function(v83, v84) --[[ Line: 380 ]]
        -- upvalues: l_FFlagAXSkipEmotesInAvatarData_0 (copy), v20 (copy), v24 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v3 (copy)
        local l_assets_0 = v84.avatarData.assets;
        if l_assets_0 == nil then
            return v83;
        else
            v83 = {};
            for _, v87 in l_assets_0 do
                local v88 = tostring(v87.assetType.id);
                local v89 = tostring(v87.id);
                if not l_FFlagAXSkipEmotesInAvatarData_0 or v88 ~= v20.AssetTypeIdStrings.EmoteAnimation then
                    local v90 = v83[v88] or {};
                    v90[v89] = v24.fromMetadata(v87.meta, v88);
                    if l_FFlagAXModeratedItemsFlow_0 then
                        v90[v89].availabilityStatus = v87.availabilityStatus;
                    end;
                    v83[v88] = v90;
                end;
            end;
            local v91 = v83[v20.AssetTypeIdStrings.DynamicHead] or {};
            local v92 = v83[v20.AssetTypeIdStrings.Face] or {};
            if not v3.isEmpty(v91) and not v3.isEmpty(v92) then
                v83[v20.AssetTypeIdStrings.Face] = {};
            end;
            return v83;
        end;
    end, 
    [v14.name] = function(v93, v94) --[[ Line: 422 ]]
        -- upvalues: v40 (copy), v82 (copy), v20 (copy), v3 (copy), v24 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v23 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), v22 (copy), v44 (copy), v4 (copy), v21 (copy), l_HeadShapeProperties_0 (copy), l_HeadShape_0 (copy)
        if v40 then
            return v82(v93, v94);
        else
            v93 = v93 or {};
            if v94.assetTypeId == v20.AssetTypeIdStrings.EmoteAnimation then
                return v93;
            else
                local v95 = v93[v94.assetTypeId];
                local l_assetId_1 = v94.assetId;
                if v95 and v95[l_assetId_1] and true or false then
                    v95 = v93[v94.assetTypeId] or {};
                    return v3.Dictionary.join(v93, {
                        [v94.assetTypeId] = v3.Dictionary.join(v95, {
                            [v94.assetId] = v3.None
                        })
                    });
                else
                    v95 = v24.getDefaultMetadata(v94.assetTypeId);
                    if v94.overrideOrder then
                        v95.order = v94.overrideOrder;
                        l_assetId_1 = if l_FFlagAXCustomizeMakeupSupport_0 then v23.getSortedEquippedLayeredMakeup(v93) else nil;
                        if l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v94.assetTypeId] and l_assetId_1 and #l_assetId_1 == l_MAX_MAKEUP_LAYERS_0 then
                            local v97 = l_assetId_1[#l_assetId_1];
                            v93 = v3.Dictionary.join(v93, {
                                [v97.typeId] = v3.Dictionary.join(v93[v97.typeId] or {}, {
                                    [v97.id] = v3.None
                                })
                            });
                        end;
                    elseif v95.isLayered and (not l_FFlagAXCustomizeMakeupSupport_0 or v20.AssetTypeIdToAccessoryTypeEnum[v94.assetTypeId]) then
                        l_assetId_1 = v22.getSortedEquippedLCIfNoDefault(v93);
                        if l_assetId_1 then
                            local v98 = {
                                id = v94.assetId, 
                                typeId = v94.assetTypeId
                            };
                            local v99, _ = v22.getTableAndOrderAfterEquippingIntoSort(l_assetId_1, v98);
                            for v101, v102 in v99 do
                                if v102.id ~= v94.assetId then
                                    if v44 and not v93[v102.typeId] then
                                        v4((("EquippedAssets.lua missing asset typeId post sort ID:%* typeId: %*"):format(v102.id, v102.typeId)));
                                    else
                                        v93 = v3.Dictionary.join(v93, {
                                            [v102.typeId] = v3.Dictionary.join(v93[v102.typeId], {
                                                [v102.id] = v3.Dictionary.join(v93[v102.typeId][v102.id], {
                                                    order = #v99 - v101
                                                })
                                            })
                                        });
                                    end;
                                else
                                    v95.order = #v99 - v101;
                                end;
                            end;
                        end;
                    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v94.assetTypeId] then
                        l_assetId_1 = v23.getSortedEquippedLayeredMakeup(v93);
                        if l_assetId_1 then
                            local v103 = {
                                id = v94.assetId, 
                                typeId = v94.assetTypeId
                            };
                            local v104, _ = v23.getTableAndOrderAfterEquippingIntoSort(l_assetId_1, v103);
                            for v106, v107 in v104 do
                                if v107.id ~= v94.assetId then
                                    local v108 = v93[v107.typeId] or {};
                                    local v109 = v108[v107.id] or {};
                                    v93 = v3.Dictionary.join(v93, {
                                        [v107.typeId] = v3.Dictionary.join(v108, {
                                            [v107.id] = v3.Dictionary.join(v109, {
                                                order = #v104 - v106
                                            })
                                        })
                                    });
                                else
                                    v95.order = math.min(#v104 - v106, l_MAX_MAKEUP_LAYERS_0 - 1);
                                end;
                            end;
                            if #l_assetId_1 > l_MAX_MAKEUP_LAYERS_0 then
                                for v110 = l_MAX_MAKEUP_LAYERS_0 + 1, #l_assetId_1 do
                                    v93 = v3.Dictionary.join(v93, {
                                        [l_assetId_1[v110].typeId] = v3.Dictionary.join(v93[l_assetId_1[v110].typeId] or {}, {
                                            [l_assetId_1[v110].id] = v3.None
                                        })
                                    });
                                end;
                            end;
                            return v3.Dictionary.join(v93, {
                                [v94.assetTypeId] = v3.Dictionary.join(v93[v94.assetTypeId] or {}, {
                                    [v94.assetId] = v95
                                })
                            });
                        end;
                    elseif v94.overrideAdjustments then
                        v95 = v3.Dictionary.join(v95, v94.overrideAdjustments);
                    end;
                    l_assetId_1 = {
                        [v94.assetId] = v95
                    };
                    local v111 = v93[v94.assetTypeId] or {};
                    if v94.assetTypeId == v20.AssetTypeIdStrings.Hat then
                        if #v3.Dictionary.keys(v111) >= v21.MaxHats then
                            return v93;
                        else
                            return v3.Dictionary.join(v93, {
                                [v94.assetTypeId] = v3.Dictionary.join(v111, l_assetId_1)
                            });
                        end;
                    else
                        local v112 = v20.AssetTypeToAssetCategory[v94.assetTypeId];
                        if v112 then
                            for _, v114 in v20.AssetCategoryToAssetTypes[v112] do
                                if v93[v114] and next(v93[v114]) then
                                    v93 = v3.Dictionary.join(v93, {
                                        [v114] = {}
                                    });
                                end;
                            end;
                        end;
                        if v94.assetTypeId == v20.AssetTypeIdStrings.Head then
                            for v115, _ in v20.DynamicHeadAssetTypes do
                                v93 = v3.Dictionary.join(v93, {
                                    [v115] = {}
                                });
                            end;
                        end;
                        if v94.assetTypeId == v20.AssetTypeIdStrings.DynamicHead then
                            v93 = v3.Dictionary.join(v93, {
                                [v20.AssetTypeIdStrings.Head] = {}
                            });
                        end;
                        if v94.assetId and tostring(v94.assetId) == tostring(l_HeadShapeProperties_0[l_HeadShape_0.Default].assetId) then
                            return (v3.Dictionary.join(v93, {
                                [v20.AssetTypeIdStrings.Head] = {}, 
                                [v20.AssetTypeIdStrings.DynamicHead] = {}
                            }));
                        elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v94.assetTypeId] then
                            return v3.Dictionary.join(v93, {
                                [v94.assetTypeId] = v3.Dictionary.join(v111, l_assetId_1)
                            });
                        else
                            return v3.Dictionary.join(v93, {
                                [v94.assetTypeId] = l_assetId_1
                            });
                        end;
                    end;
                end;
            end;
        end;
    end, 
    [v13.name] = function(v117, v118) --[[ Line: 636 ]]
        -- upvalues: v3 (copy), v82 (copy)
        local l_assets_1 = v118.assets;
        if l_assets_1 and not v3.isEmpty(l_assets_1) then
            for _, v121 in l_assets_1 do
                v117 = v82(v117, v121, {
                    ignoreAccessoryLimits = true
                });
            end;
        end;
        return v117;
    end, 
    [v15.name] = function(v122, v123) --[[ Line: 651 ]]
        -- upvalues: v55 (copy)
        v122 = v122 or {};
        if v123.fullReset then
            return v123.assets;
        else
            return v55(v122, v123.assets);
        end;
    end, 
    [v16.name] = function(v124, v125) --[[ Line: 663 ]]
        -- upvalues: v3 (copy)
        v124 = v124 or {};
        for v126, v127 in v125.assetTypeIdToAssetIdToAssetMetadataModel do
            for v128, _ in v127 do
                v124 = v3.Dictionary.join(v124, {
                    [v126] = v3.Dictionary.join(v124[v126], {
                        [v128] = v3.None
                    })
                });
            end;
        end;
        return v124;
    end, 
    [v25.name] = function(v130, v131) --[[ Line: 681 ]]
        -- upvalues: v20 (copy)
        v130 = v130 or {};
        local v132 = false;
        local v133 = {};
        for v134, v135 in pairs(v130) do
            local v136 = {};
            local v137 = false;
            for v138, v139 in v135 do
                local v140 = v134 == v20.AssetTypeIdStrings.HairAccessory;
                if v139.isLayered and (not v140 or v131.hasLayeredHair) then
                    v137 = true;
                else
                    v136[v138] = v139;
                end;
            end;
            if v137 then
                v132 = true;
                v133[v134] = v136;
            else
                v133[v134] = v135;
            end;
        end;
        if v132 then
            return v133;
        else
            return v130;
        end;
    end, 
    [v26.name] = function(v141, v142) --[[ Line: 715 ]]
        -- upvalues: v3 (copy)
        for v143, v144 in v142.assetIdToOrderAndAssetTypeId do
            local l_assetTypeId_0 = v144.assetTypeId;
            local l_order_0 = v144.order;
            local v147 = v141[l_assetTypeId_0];
            local v148 = v147[v143];
            v141 = v3.Dictionary.join(v141, {
                [l_assetTypeId_0] = v3.Dictionary.join(v147, {
                    [v143] = v3.Dictionary.join(v148, {
                        order = l_order_0
                    })
                })
            });
        end;
        return v141;
    end, 
    [v27.name] = function(v149, v150) --[[ Line: 739 ]]
        -- upvalues: v3 (copy)
        for v151, v152 in v149 do
            for v153, v154 in v152 do
                if v153 == v150.itemId then
                    return v3.Dictionary.join(v149, {
                        [v151] = v3.Dictionary.join(v152, {
                            [v153] = v3.Dictionary.join(v154, {
                                position = v150.position, 
                                rotation = v150.rotation, 
                                scale = v150.scale
                            })
                        })
                    });
                end;
            end;
        end;
        return v149;
    end, 
    [v17.name] = function(v155, v156) --[[ Line: 760 ]]
        -- upvalues: v31 (copy), v20 (copy), v3 (copy)
        if not v31() then
            return v155;
        else
            local v157 = v155 or {};
            for _, v159 in v156.assetTypeIds do
                if v159 == v20.AssetTypeIdStrings.DynamicHead then
                    for v160, _ in v20.DynamicHeadAssetTypes do
                        v157 = v3.Dictionary.join(v157, {
                            [v160] = v3.None
                        });
                    end;
                end;
                v157 = v3.Dictionary.join(v157, {
                    [v159] = v3.None
                });
            end;
            return v157;
        end;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v162, v163) --[[ Line: 789 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v163.equipped and v163.equipped.EquippedAssets then
            return table.clone(v163.equipped.EquippedAssets);
        else
            return v162;
        end;
    end, 
    [l_SetEquippedDynamicHeadShape_0.name] = l_FFlagDynamicHeadsMigration_0 and function(v164, v165) --[[ Line: 801 ]]
        -- upvalues: v20 (copy), v3 (copy)
        local v166 = v164[v20.AssetTypeIdStrings.DynamicHead];
        if not v166 then
            return v164;
        else
            local v167 = {};
            local v168 = false;
            for v169, v170 in v166 do
                if v170.supportsHeadShapes ~= false then
                    v167[v169] = v3.Dictionary.join(v170, {
                        headShape = v165.headShapeName
                    });
                    v168 = true;
                else
                    v167[v169] = v170;
                end;
            end;
            if not v168 then
                return v164;
            else
                return v3.Dictionary.join(v164, {
                    [v20.AssetTypeIdStrings.DynamicHead] = v167
                });
            end;
        end;
    end or nil, 
    [l_SetEquippedStaticFacialAnimation_0.name] = l_FFlagHeadRefinementFacialAnimationToggle_0 and function(v171, v172) --[[ Line: 841 ]]
        -- upvalues: v20 (copy), v3 (copy)
        local v173 = v171[v20.AssetTypeIdStrings.DynamicHead];
        if not v173 then
            return v171;
        else
            local v174 = {};
            for v175, v176 in v173 do
                v174[v175] = v3.Dictionary.join(v176, {
                    staticFacialAnimation = v172.isEnabled
                });
            end;
            return v3.Dictionary.join(v171, {
                [v20.AssetTypeIdStrings.DynamicHead] = v174
            });
        end;
    end or nil, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v177, v178) --[[ Line: 861 ]]
        -- upvalues: l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v3 (copy), v82 (copy)
        v177 = v177 or {};
        if v178.equippableAssets and #v178.equippableAssets > 0 then
            if v178.replaceAllEquippedAssets then
                v177 = {};
            end;
            for _, v180 in v178.equippableAssets do
                local v181 = v177[v180.assetTypeId];
                local l_assetId_2 = v180.assetId;
                if not (v181 and v181[l_assetId_2] and true or false) and tostring(v180.assetTypeId) ~= tostring(Enum.AvatarAssetType.EmoteAnimation.Value) then
                    local v183 = nil;
                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v180.headShape ~= nil then
                        v183 = {
                            headShape = v180.headShape
                        };
                    end;
                    v181 = nil;
                    if l_FFlagHeadRefinementFacialAnimationToggle_0 then
                        l_assetId_2 = v180.staticFacialAnimation;
                        if l_assetId_2 ~= nil then
                            v181 = {
                                staticFacialAnimation = l_assetId_2
                            };
                        end;
                    end;
                    l_assetId_2 = if not not v183 or v181 then v3.Dictionary.join(v183 or {}, v181 or {}) else nil;
                    v177 = v82(v177, {
                        assetId = v180.assetId, 
                        assetTypeId = v180.assetTypeId, 
                        overrideAdjustments = l_assetId_2
                    }, {
                        ignoreAccessoryLimits = true
                    });
                end;
            end;
        end;
        return v177;
    end or nil, 
    [v19.name] = if not l_FFlagAXCustomizeMakeupSupport_0 then nil else function(v184, _) --[[ Line: 906 ]]
        -- upvalues: l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), v3 (copy)
        v184 = v184 or {};
        local v186 = {};
        for v187, _ in pairs(l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0) do
            local v189 = v184[v187];
            if v189 then
                for v190, v191 in v189 do
                    table.insert(v186, {
                        assetId = v190, 
                        assetTypeId = v187, 
                        metadata = v191
                    });
                end;
            end;
        end;
        table.sort(v186, function(v192, v193) --[[ Line: 929 ]]
            local v194 = false;
            if v192.metadata.order ~= nil then
                v194 = true;
                if v193.metadata.order ~= nil then
                    v194 = v192.metadata.order < v193.metadata.order;
                end;
            end;
            return v194;
        end);
        for v195, v196 in v186 do
            local l_assetTypeId_1 = v196.assetTypeId;
            local l_assetId_3 = v196.assetId;
            local v199 = v184[l_assetTypeId_1] and v184[l_assetTypeId_1][l_assetId_3] or v196.metadata;
            local v200 = v3.Dictionary.join(v199, {
                order = v195 - 1
            });
            v184 = v3.Dictionary.join(v184, {
                [l_assetTypeId_1] = v3.Dictionary.join(v184[l_assetTypeId_1] or {}, {
                    [l_assetId_3] = v200
                })
            });
        end;
        return v184;
    end
});