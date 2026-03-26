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
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RemoveMakeup);
local v27 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local v28 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAccessoryAdjustments);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_HeadShape_0 = v5.Enums.HeadShape;
local l_HeadShapeProperties_0 = v5.Enums.HeadShapeProperties;
local v32 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableBatchUnequips);
local v33 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_isMakeupAssetType_0 = v33.Utils.isMakeupAssetType;
local l_CharacterHistoryStateChangeButtonActivated_0 = v33.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_PurchaseItemsSuccess_0 = v8.State.Actions.PurchaseItemsSuccess;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v33.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_MAX_MAKEUP_LAYERS_0 = v33.Constants.MAX_MAKEUP_LAYERS;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v40 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip);
local l_FFlagAXMISEnableMultiShopping_0 = v9.FFlagAXMISEnableMultiShopping;
local v42 = game:DefineFastFlag("AXRefactorToggleEquipAsset3", false);
local l_FFlagAXModeratedItemsFlow_0 = v9.FFlagAXModeratedItemsFlow;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v9.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagAXCustomizeMakeupSupport_0 = v9.FFlagAXCustomizeMakeupSupport;
local v46 = game:DefineFastFlag("AXEquippedAssetsMissingAssetTypeId", false);
local l_FFlagAXSkipEmotesInAvatarData_0 = v9.FFlagAXSkipEmotesInAvatarData;
local l_FFlagAXBlockMakeupEquipR6_0 = v9.FFlagAXBlockMakeupEquipR6;
local function _(v49, v50) --[[ Line: 83 ]] --[[ Name: checkIfWearingAsset ]]
    if v49 and v49[v50] then
        return true;
    else
        return false;
    end;
end;
local function v58(v52, v53) --[[ Line: 95 ]] --[[ Name: replaceOutfitParts ]]
    -- upvalues: v40 (copy), v20 (copy), v3 (copy)
    if v40() then
        local v54 = {};
        if v53[v20.AssetTypeIdStrings.Head] or v53[v20.AssetTypeIdStrings.DynamicHead] then
            local v55 = {
                [v20.AssetTypeIdStrings.Head] = {}, 
                [v20.AssetTypeIdStrings.DynamicHead] = {}
            };
            for v56, _ in v20.DynamicHeadAssetTypes do
                v55[v56] = {};
            end;
            v54 = v3.Dictionary.join(v55, v53);
        else
            v54 = v53;
        end;
        return (v3.Dictionary.join(v52, v54));
    else
        return v3.Dictionary.join(v52, v53);
    end;
end;
local function v85(v59, v60, v61) --[[ Line: 157 ]] --[[ Name: toggleSingleAsset ]]
    -- upvalues: v20 (copy), v3 (copy), v24 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v23 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), v22 (copy), v46 (copy), v4 (copy), v21 (copy), l_HeadShapeProperties_0 (copy), l_HeadShape_0 (copy)
    v59 = v59 or {};
    if v60.assetTypeId == v20.AssetTypeIdStrings.EmoteAnimation then
        return v59;
    else
        local v62 = v59[v60.assetTypeId];
        local l_assetId_0 = v60.assetId;
        if v62 and v62[l_assetId_0] and true or false then
            v62 = v59[v60.assetTypeId] or {};
            return v3.Dictionary.join(v59, {
                [v60.assetTypeId] = v3.Dictionary.join(v62, {
                    [v60.assetId] = v3.None
                })
            });
        else
            v62 = v24.getDefaultMetadata(v60.assetTypeId);
            if v60.overrideOrder then
                v62.order = v60.overrideOrder;
                l_assetId_0 = if l_FFlagAXCustomizeMakeupSupport_0 then v23.getSortedEquippedLayeredMakeup(v59) else nil;
                if l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v60.assetTypeId] and l_assetId_0 and #l_assetId_0 == l_MAX_MAKEUP_LAYERS_0 then
                    local v64 = l_assetId_0[#l_assetId_0];
                    v59 = v3.Dictionary.join(v59, {
                        [v64.typeId] = v3.Dictionary.join(v59[v64.typeId] or {}, {
                            [v64.id] = v3.None
                        })
                    });
                end;
            elseif v62.isLayered and (not l_FFlagAXCustomizeMakeupSupport_0 or v20.AssetTypeIdToAccessoryTypeEnum[v60.assetTypeId]) then
                l_assetId_0 = v22.getSortedEquippedLCIfNoDefault(v59);
                if l_assetId_0 then
                    local v65 = {
                        id = v60.assetId, 
                        typeId = v60.assetTypeId
                    };
                    local v66, _ = v22.getTableAndOrderAfterEquippingIntoSort(l_assetId_0, v65);
                    for v68, v69 in v66 do
                        if v69.id ~= v60.assetId then
                            if v46 and not v59[v69.typeId] then
                                v4((("EquippedAssets.lua missing asset typeId post sort ID:%* typeId: %*"):format(v69.id, v69.typeId)));
                            else
                                v59 = v3.Dictionary.join(v59, {
                                    [v69.typeId] = v3.Dictionary.join(v59[v69.typeId], {
                                        [v69.id] = v3.Dictionary.join(v59[v69.typeId][v69.id], {
                                            order = #v66 - v68
                                        })
                                    })
                                });
                            end;
                        else
                            v62.order = #v66 - v68;
                        end;
                    end;
                end;
            elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v60.assetTypeId] then
                l_assetId_0 = v23.getSortedEquippedLayeredMakeup(v59);
                if l_assetId_0 then
                    local v70 = {
                        id = v60.assetId, 
                        typeId = v60.assetTypeId
                    };
                    local v71, _ = v23.getTableAndOrderAfterEquippingIntoSort(l_assetId_0, v70);
                    for v73, v74 in v71 do
                        if v74.id ~= v60.assetId then
                            local v75 = v59[v74.typeId] or {};
                            local v76 = v75[v74.id] or {};
                            v59 = v3.Dictionary.join(v59, {
                                [v74.typeId] = v3.Dictionary.join(v75, {
                                    [v74.id] = v3.Dictionary.join(v76, {
                                        order = #v71 - v73
                                    })
                                })
                            });
                        else
                            v62.order = math.min(#v71 - v73, l_MAX_MAKEUP_LAYERS_0 - 1);
                        end;
                    end;
                    if #l_assetId_0 > l_MAX_MAKEUP_LAYERS_0 then
                        for v77 = l_MAX_MAKEUP_LAYERS_0 + 1, #l_assetId_0 do
                            v59 = v3.Dictionary.join(v59, {
                                [l_assetId_0[v77].typeId] = v3.Dictionary.join(v59[l_assetId_0[v77].typeId] or {}, {
                                    [l_assetId_0[v77].id] = v3.None
                                })
                            });
                        end;
                    end;
                    return v3.Dictionary.join(v59, {
                        [v60.assetTypeId] = v3.Dictionary.join(v59[v60.assetTypeId] or {}, {
                            [v60.assetId] = v62
                        })
                    });
                end;
            elseif v60.overrideAdjustments then
                v62 = v3.Dictionary.join(v62, v60.overrideAdjustments);
            end;
            l_assetId_0 = {
                [v60.assetId] = v62
            };
            local v78 = v59[v60.assetTypeId] or {};
            if v60.assetTypeId == v20.AssetTypeIdStrings.Hat and (not v61 or not v61.ignoreAccessoryLimits) then
                if #v3.Dictionary.keys(v78) >= v21.MaxHats then
                    return v59;
                else
                    return v3.Dictionary.join(v59, {
                        [v60.assetTypeId] = v3.Dictionary.join(v78, l_assetId_0)
                    });
                end;
            else
                local v79 = v20.AssetTypeToAssetCategory[v60.assetTypeId];
                if v79 then
                    for _, v81 in v20.AssetCategoryToAssetTypes[v79] do
                        if v59[v81] and next(v59[v81]) then
                            v59 = v3.Dictionary.join(v59, {
                                [v81] = {}
                            });
                        end;
                    end;
                end;
                if v60.assetTypeId == v20.AssetTypeIdStrings.Head then
                    for v82, _ in v20.DynamicHeadAssetTypes do
                        v59 = v3.Dictionary.join(v59, {
                            [v82] = {}
                        });
                    end;
                end;
                if v60.assetTypeId == v20.AssetTypeIdStrings.DynamicHead then
                    v59 = v3.Dictionary.join(v59, {
                        [v20.AssetTypeIdStrings.Head] = {}
                    });
                end;
                if v60.assetId and tostring(v60.assetId) == tostring(l_HeadShapeProperties_0[l_HeadShape_0.Default].assetId) then
                    return (v3.Dictionary.join(v59, {
                        [v20.AssetTypeIdStrings.Head] = {}, 
                        [v20.AssetTypeIdStrings.DynamicHead] = {}
                    }));
                else
                    local v84 = v20.BypassAccessoryLimitsAccessoryAssetTypeIdStrings[v60.assetTypeId];
                    if l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v60.assetTypeId] then
                        return v3.Dictionary.join(v59, {
                            [v60.assetTypeId] = v3.Dictionary.join(v78, l_assetId_0)
                        });
                    else
                        return v3.Dictionary.join(v59, {
                            [v60.assetTypeId] = if v61 and v61.ignoreAccessoryLimits and v84 then v3.Dictionary.join(v78, l_assetId_0) else l_assetId_0
                        });
                    end;
                end;
            end;
        end;
    end;
end;
return v2.createReducer(nil, {
    [v18.name] = function(v86, v87) --[[ Line: 383 ]]
        -- upvalues: l_FFlagAXSkipEmotesInAvatarData_0 (copy), v20 (copy), v24 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v3 (copy)
        local l_assets_0 = v87.avatarData.assets;
        if l_assets_0 == nil then
            return v86;
        else
            v86 = {};
            for _, v90 in l_assets_0 do
                local v91 = tostring(v90.assetType.id);
                local v92 = tostring(v90.id);
                if not l_FFlagAXSkipEmotesInAvatarData_0 or v91 ~= v20.AssetTypeIdStrings.EmoteAnimation then
                    local v93 = v86[v91] or {};
                    v93[v92] = v24.fromMetadata(v90.meta, v91);
                    if l_FFlagAXModeratedItemsFlow_0 then
                        v93[v92].availabilityStatus = v90.availabilityStatus;
                    end;
                    v86[v91] = v93;
                end;
            end;
            local v94 = v86[v20.AssetTypeIdStrings.DynamicHead] or {};
            local v95 = v86[v20.AssetTypeIdStrings.Face] or {};
            if not v3.isEmpty(v94) and not v3.isEmpty(v95) then
                v86[v20.AssetTypeIdStrings.Face] = {};
            end;
            return v86;
        end;
    end, 
    [v14.name] = function(v96, v97) --[[ Line: 425 ]]
        -- upvalues: v42 (copy), v85 (copy), v20 (copy), v3 (copy), v24 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v23 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), v22 (copy), v46 (copy), v4 (copy), v21 (copy), l_HeadShapeProperties_0 (copy), l_HeadShape_0 (copy)
        if v42 then
            return v85(v96, v97);
        else
            v96 = v96 or {};
            if v97.assetTypeId == v20.AssetTypeIdStrings.EmoteAnimation then
                return v96;
            else
                local v98 = v96[v97.assetTypeId];
                local l_assetId_1 = v97.assetId;
                if v98 and v98[l_assetId_1] and true or false then
                    v98 = v96[v97.assetTypeId] or {};
                    return v3.Dictionary.join(v96, {
                        [v97.assetTypeId] = v3.Dictionary.join(v98, {
                            [v97.assetId] = v3.None
                        })
                    });
                else
                    v98 = v24.getDefaultMetadata(v97.assetTypeId);
                    if v97.overrideOrder then
                        v98.order = v97.overrideOrder;
                        l_assetId_1 = if l_FFlagAXCustomizeMakeupSupport_0 then v23.getSortedEquippedLayeredMakeup(v96) else nil;
                        if l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v97.assetTypeId] and l_assetId_1 and #l_assetId_1 == l_MAX_MAKEUP_LAYERS_0 then
                            local v100 = l_assetId_1[#l_assetId_1];
                            v96 = v3.Dictionary.join(v96, {
                                [v100.typeId] = v3.Dictionary.join(v96[v100.typeId] or {}, {
                                    [v100.id] = v3.None
                                })
                            });
                        end;
                    elseif v98.isLayered and (not l_FFlagAXCustomizeMakeupSupport_0 or v20.AssetTypeIdToAccessoryTypeEnum[v97.assetTypeId]) then
                        l_assetId_1 = v22.getSortedEquippedLCIfNoDefault(v96);
                        if l_assetId_1 then
                            local v101 = {
                                id = v97.assetId, 
                                typeId = v97.assetTypeId
                            };
                            local v102, _ = v22.getTableAndOrderAfterEquippingIntoSort(l_assetId_1, v101);
                            for v104, v105 in v102 do
                                if v105.id ~= v97.assetId then
                                    if v46 and not v96[v105.typeId] then
                                        v4((("EquippedAssets.lua missing asset typeId post sort ID:%* typeId: %*"):format(v105.id, v105.typeId)));
                                    else
                                        v96 = v3.Dictionary.join(v96, {
                                            [v105.typeId] = v3.Dictionary.join(v96[v105.typeId], {
                                                [v105.id] = v3.Dictionary.join(v96[v105.typeId][v105.id], {
                                                    order = #v102 - v104
                                                })
                                            })
                                        });
                                    end;
                                else
                                    v98.order = #v102 - v104;
                                end;
                            end;
                        end;
                    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v97.assetTypeId] then
                        l_assetId_1 = v23.getSortedEquippedLayeredMakeup(v96);
                        if l_assetId_1 then
                            local v106 = {
                                id = v97.assetId, 
                                typeId = v97.assetTypeId
                            };
                            local v107, _ = v23.getTableAndOrderAfterEquippingIntoSort(l_assetId_1, v106);
                            for v109, v110 in v107 do
                                if v110.id ~= v97.assetId then
                                    local v111 = v96[v110.typeId] or {};
                                    local v112 = v111[v110.id] or {};
                                    v96 = v3.Dictionary.join(v96, {
                                        [v110.typeId] = v3.Dictionary.join(v111, {
                                            [v110.id] = v3.Dictionary.join(v112, {
                                                order = #v107 - v109
                                            })
                                        })
                                    });
                                else
                                    v98.order = math.min(#v107 - v109, l_MAX_MAKEUP_LAYERS_0 - 1);
                                end;
                            end;
                            if #l_assetId_1 > l_MAX_MAKEUP_LAYERS_0 then
                                for v113 = l_MAX_MAKEUP_LAYERS_0 + 1, #l_assetId_1 do
                                    v96 = v3.Dictionary.join(v96, {
                                        [l_assetId_1[v113].typeId] = v3.Dictionary.join(v96[l_assetId_1[v113].typeId] or {}, {
                                            [l_assetId_1[v113].id] = v3.None
                                        })
                                    });
                                end;
                            end;
                            return v3.Dictionary.join(v96, {
                                [v97.assetTypeId] = v3.Dictionary.join(v96[v97.assetTypeId] or {}, {
                                    [v97.assetId] = v98
                                })
                            });
                        end;
                    elseif v97.overrideAdjustments then
                        v98 = v3.Dictionary.join(v98, v97.overrideAdjustments);
                    end;
                    l_assetId_1 = {
                        [v97.assetId] = v98
                    };
                    local v114 = v96[v97.assetTypeId] or {};
                    if v97.assetTypeId == v20.AssetTypeIdStrings.Hat then
                        if #v3.Dictionary.keys(v114) >= v21.MaxHats then
                            return v96;
                        else
                            return v3.Dictionary.join(v96, {
                                [v97.assetTypeId] = v3.Dictionary.join(v114, l_assetId_1)
                            });
                        end;
                    else
                        local v115 = v20.AssetTypeToAssetCategory[v97.assetTypeId];
                        if v115 then
                            for _, v117 in v20.AssetCategoryToAssetTypes[v115] do
                                if v96[v117] and next(v96[v117]) then
                                    v96 = v3.Dictionary.join(v96, {
                                        [v117] = {}
                                    });
                                end;
                            end;
                        end;
                        if v97.assetTypeId == v20.AssetTypeIdStrings.Head then
                            for v118, _ in v20.DynamicHeadAssetTypes do
                                v96 = v3.Dictionary.join(v96, {
                                    [v118] = {}
                                });
                            end;
                        end;
                        if v97.assetTypeId == v20.AssetTypeIdStrings.DynamicHead then
                            v96 = v3.Dictionary.join(v96, {
                                [v20.AssetTypeIdStrings.Head] = {}
                            });
                        end;
                        if v97.assetId and tostring(v97.assetId) == tostring(l_HeadShapeProperties_0[l_HeadShape_0.Default].assetId) then
                            return (v3.Dictionary.join(v96, {
                                [v20.AssetTypeIdStrings.Head] = {}, 
                                [v20.AssetTypeIdStrings.DynamicHead] = {}
                            }));
                        elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v97.assetTypeId] then
                            return v3.Dictionary.join(v96, {
                                [v97.assetTypeId] = v3.Dictionary.join(v114, l_assetId_1)
                            });
                        else
                            return v3.Dictionary.join(v96, {
                                [v97.assetTypeId] = l_assetId_1
                            });
                        end;
                    end;
                end;
            end;
        end;
    end, 
    [v13.name] = function(v120, v121) --[[ Line: 639 ]]
        -- upvalues: v3 (copy), v85 (copy)
        local l_assets_1 = v121.assets;
        if l_assets_1 and not v3.isEmpty(l_assets_1) then
            for _, v124 in l_assets_1 do
                v120 = v85(v120, v124, {
                    ignoreAccessoryLimits = true
                });
            end;
        end;
        return v120;
    end, 
    [v15.name] = function(v125, v126) --[[ Line: 654 ]]
        -- upvalues: v58 (copy)
        v125 = v125 or {};
        if v126.fullReset then
            return v126.assets;
        else
            return v58(v125, v126.assets);
        end;
    end, 
    [v16.name] = function(v127, v128) --[[ Line: 666 ]]
        -- upvalues: v3 (copy)
        v127 = v127 or {};
        for v129, v130 in v128.assetTypeIdToAssetIdToAssetMetadataModel do
            for v131, _ in v130 do
                v127 = v3.Dictionary.join(v127, {
                    [v129] = v3.Dictionary.join(v127[v129], {
                        [v131] = v3.None
                    })
                });
            end;
        end;
        return v127;
    end, 
    [v25.name] = function(v133, v134) --[[ Line: 684 ]]
        -- upvalues: v20 (copy)
        v133 = v133 or {};
        local v135 = false;
        local v136 = {};
        for v137, v138 in pairs(v133) do
            local v139 = {};
            local v140 = false;
            for v141, v142 in v138 do
                local v143 = v137 == v20.AssetTypeIdStrings.HairAccessory;
                if v142.isLayered and (not v143 or v134.hasLayeredHair) then
                    v140 = true;
                else
                    v139[v141] = v142;
                end;
            end;
            if v140 then
                v135 = true;
                v136[v137] = v139;
            else
                v136[v137] = v138;
            end;
        end;
        if v135 then
            return v136;
        else
            return v133;
        end;
    end, 
    [v27.name] = function(v144, v145) --[[ Line: 718 ]]
        -- upvalues: v3 (copy)
        for v146, v147 in v145.assetIdToOrderAndAssetTypeId do
            local l_assetTypeId_0 = v147.assetTypeId;
            local l_order_0 = v147.order;
            local v150 = v144[l_assetTypeId_0];
            local v151 = v150[v146];
            v144 = v3.Dictionary.join(v144, {
                [l_assetTypeId_0] = v3.Dictionary.join(v150, {
                    [v146] = v3.Dictionary.join(v151, {
                        order = l_order_0
                    })
                })
            });
        end;
        return v144;
    end, 
    [v28.name] = function(v152, v153) --[[ Line: 742 ]]
        -- upvalues: v3 (copy)
        for v154, v155 in v152 do
            for v156, v157 in v155 do
                if v156 == v153.itemId then
                    return v3.Dictionary.join(v152, {
                        [v154] = v3.Dictionary.join(v155, {
                            [v156] = v3.Dictionary.join(v157, {
                                position = v153.position, 
                                rotation = v153.rotation, 
                                scale = v153.scale
                            })
                        })
                    });
                end;
            end;
        end;
        return v152;
    end, 
    [v17.name] = function(v158, v159) --[[ Line: 763 ]]
        -- upvalues: v32 (copy), v20 (copy), v3 (copy)
        if not v32() then
            return v158;
        else
            local v160 = v158 or {};
            for _, v162 in v159.assetTypeIds do
                if v162 == v20.AssetTypeIdStrings.DynamicHead then
                    for v163, _ in v20.DynamicHeadAssetTypes do
                        v160 = v3.Dictionary.join(v160, {
                            [v163] = v3.None
                        });
                    end;
                end;
                v160 = v3.Dictionary.join(v160, {
                    [v162] = v3.None
                });
            end;
            return v160;
        end;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v165, v166) --[[ Line: 792 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v166.equipped and v166.equipped.EquippedAssets then
            return table.clone(v166.equipped.EquippedAssets);
        else
            return v165;
        end;
    end, 
    [l_SetEquippedDynamicHeadShape_0.name] = l_FFlagDynamicHeadsMigration_0 and function(v167, v168) --[[ Line: 804 ]]
        -- upvalues: v20 (copy), v3 (copy)
        local v169 = v167[v20.AssetTypeIdStrings.DynamicHead];
        if not v169 then
            return v167;
        else
            local v170 = {};
            local v171 = false;
            for v172, v173 in v169 do
                if v173.supportsHeadShapes ~= false then
                    v170[v172] = v3.Dictionary.join(v173, {
                        headShape = v168.headShapeName
                    });
                    v171 = true;
                else
                    v170[v172] = v173;
                end;
            end;
            if not v171 then
                return v167;
            else
                return v3.Dictionary.join(v167, {
                    [v20.AssetTypeIdStrings.DynamicHead] = v170
                });
            end;
        end;
    end or nil, 
    [l_SetEquippedStaticFacialAnimation_0.name] = l_FFlagHeadRefinementFacialAnimationToggle_0 and function(v174, v175) --[[ Line: 844 ]]
        -- upvalues: v20 (copy), v3 (copy)
        local v176 = v174[v20.AssetTypeIdStrings.DynamicHead];
        if not v176 then
            return v174;
        else
            local v177 = {};
            for v178, v179 in v176 do
                v177[v178] = v3.Dictionary.join(v179, {
                    staticFacialAnimation = v175.isEnabled
                });
            end;
            return v3.Dictionary.join(v174, {
                [v20.AssetTypeIdStrings.DynamicHead] = v177
            });
        end;
    end or nil, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v180, v181) --[[ Line: 864 ]]
        -- upvalues: l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v3 (copy), v85 (copy)
        v180 = v180 or {};
        if v181.equippableAssets and #v181.equippableAssets > 0 then
            if v181.replaceAllEquippedAssets then
                v180 = {};
            end;
            for _, v183 in v181.equippableAssets do
                local v184 = v180[v183.assetTypeId];
                local l_assetId_2 = v183.assetId;
                if not (v184 and v184[l_assetId_2] and true or false) and tostring(v183.assetTypeId) ~= tostring(Enum.AvatarAssetType.EmoteAnimation.Value) then
                    local v186 = nil;
                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v183.headShape ~= nil then
                        v186 = {
                            headShape = v183.headShape
                        };
                    end;
                    v184 = nil;
                    if l_FFlagHeadRefinementFacialAnimationToggle_0 then
                        l_assetId_2 = v183.staticFacialAnimation;
                        if l_assetId_2 ~= nil then
                            v184 = {
                                staticFacialAnimation = l_assetId_2
                            };
                        end;
                    end;
                    l_assetId_2 = if not not v186 or v184 then v3.Dictionary.join(v186 or {}, v184 or {}) else nil;
                    v180 = v85(v180, {
                        assetId = v183.assetId, 
                        assetTypeId = v183.assetTypeId, 
                        overrideAdjustments = l_assetId_2
                    }, {
                        ignoreAccessoryLimits = true
                    });
                end;
            end;
        end;
        return v180;
    end or nil, 
    [v19.name] = if not l_FFlagAXCustomizeMakeupSupport_0 then nil else function(v187, _) --[[ Line: 909 ]]
        -- upvalues: l_FFlagAXBlockMakeupEquipR6_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), v3 (copy)
        v187 = v187 or {};
        local v189 = {};
        local v190 = if l_FFlagAXBlockMakeupEquipR6_0 then l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 else pairs(l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0);
        for v191, _ in v190 do
            local v193 = v187[v191];
            if v193 then
                for v194, v195 in v193 do
                    table.insert(v189, {
                        assetId = v194, 
                        assetTypeId = v191, 
                        metadata = v195
                    });
                end;
            end;
        end;
        table.sort(v189, function(v196, v197) --[[ Line: 936 ]]
            local v198 = false;
            if v196.metadata.order ~= nil then
                v198 = true;
                if v197.metadata.order ~= nil then
                    v198 = v196.metadata.order < v197.metadata.order;
                end;
            end;
            return v198;
        end);
        for v199, v200 in v189 do
            local l_assetTypeId_1 = v200.assetTypeId;
            local l_assetId_3 = v200.assetId;
            local v203 = v187[l_assetTypeId_1] and v187[l_assetTypeId_1][l_assetId_3] or v200.metadata;
            local v204 = v3.Dictionary.join(v203, {
                order = v199 - 1
            });
            v187 = v3.Dictionary.join(v187, {
                [l_assetTypeId_1] = v3.Dictionary.join(v187[l_assetTypeId_1] or {}, {
                    [l_assetId_3] = v204
                })
            });
        end;
        return v187;
    end, 
    [v26.name] = if not l_FFlagAXBlockMakeupEquipR6_0 then nil else function(v205, _) --[[ Line: 962 ]]
        -- upvalues: l_isMakeupAssetType_0 (copy), v3 (copy)
        v205 = v205 or {};
        for v207, _ in v205 do
            if l_isMakeupAssetType_0(v207) then
                v205 = v3.Dictionary.join(v205, {
                    [v207] = v3.None
                });
            end;
        end;
        return v205;
    end
});