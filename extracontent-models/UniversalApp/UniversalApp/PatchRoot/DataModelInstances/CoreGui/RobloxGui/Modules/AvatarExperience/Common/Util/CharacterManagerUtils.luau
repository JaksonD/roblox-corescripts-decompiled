local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled);
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColors);
local l_setMakeupDescriptions_0 = v7.Utils.setMakeupDescriptions;
local l_destroyMakeupDescriptions_0 = v7.Utils.destroyMakeupDescriptions;
local v17 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local v18 = require(l_Modules_0.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils);
local v19 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixCharacterManagerValueConversionWarning);
local v20 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixOrderFieldUnlayeredItems);
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXCatalogMakeupSupport_0 = v6.FFlagAXCatalogMakeupSupport;
local l_FFlagAXRemoveMakeupAvatarLookTryOn_0 = v6.FFlagAXRemoveMakeupAvatarLookTryOn;
local l_FFlagAXMakeupEquipping_0 = v6.FFlagAXMakeupEquipping;
local l_FFlagEnableHeadShapeForCharacterManager_0 = v6.FFlagEnableHeadShapeForCharacterManager;
local l_isMakeupAssetType_0 = v7.Utils.isMakeupAssetType;
local l_FFlagDynamicHeadsMigration_0 = v6.FFlagDynamicHeadsMigration;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v6.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagFixHeadShapeColorSlider_0 = v6.FFlagFixHeadShapeColorSlider;
local l_FFlagAXFixR6DefaultHeadShape_0 = v6.FFlagAXFixR6DefaultHeadShape;
local v31 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShapeAssetId);
local v32 = game:DefineFastFlag("AXNilCheckEquippedAssets", false);
local v33 = {};
local function v42(v34, v35) --[[ Line: 75 ]] --[[ Name: getIsInLCSortIsRemovedTuple ]]
    -- upvalues: l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v17 (copy)
    local v36 = v34.AvatarExperience and v34.AvatarExperience.LayeredClothingSort;
    local v37 = v36 and v36.CurrentSort;
    if l_FFlagHeadRefinementFacialAnimationToggle_0 then
        if not v37 then
            return false, false;
        else
            local v38 = v37.OrderedList or {};
            local v39 = v37.RemovedList or {};
            return v17.createAssetIdToOrderMapping(v38)[v35], v39[v35];
        end;
    else
        local l_OrderedList_0 = v34.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
        local l_RemovedList_0 = v34.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
        return v17.createAssetIdToOrderMapping(l_OrderedList_0)[v35], l_RemovedList_0[v35];
    end;
end;
v33.tryApplyClassicHeadShapeTryOn = function(v43, v44) --[[ Line: 99 ]] --[[ Name: tryApplyClassicHeadShapeTryOn ]]
    -- upvalues: v11 (copy), v31 (copy)
    local v45 = v43.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil;
    local v46 = v11.isTryingOnDynamicHead(v43.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
    local v47 = v31(v43);
    if v45 or v46 or not v47 then
        return;
    else
        v44.Head = v47;
        return;
    end;
end;
local function v65(v48, v49, v50, v51) --[[ Line: 114 ]] --[[ Name: updateHumanoidDescriptionTryOnFromNormalizedAssets ]]
    -- upvalues: v9 (copy), v11 (copy)
    if not v50 or #v50 == 0 then
        return v49;
    else
        table.sort(v50, function(v52, v53) --[[ Line: 128 ]]
            if v52.itemRecency and v53.itemRecency then
                return v52.itemRecency < v53.itemRecency;
            else
                return false;
            end;
        end);
        for v54, v55 in v9.AssetTypeIdStringToHumanoidDescriptionProp do
            if v9.AssetTypeIdToCategory[v54] == v9.AssetCategories.Body then
                local v56 = v51[v55];
                if v56 ~= nil then
                    for _, v58 in v56 do
                        for v59, _ in v58 do
                            v48[v55] = v59;
                        end;
                    end;
                end;
            end;
        end;
        for _, v62 in v50 do
            if not v62.isRemovedInLCSort and v62.assetTypeId ~= v9.AssetTypeIdStrings.Gear and v62.assetId then
                local v63 = v9.AssetTypeIdStringToHumanoidDescriptionProp[v62.assetTypeId];
                if v9.AssetTypeIdToAccessoryTypeEnum[v62.assetTypeId] then
                    local v64 = v11.createDefaultHumanoidDescriptionAccessoryInfo(v62.assetTypeId, v62.assetId);
                    if v62.order ~= nil then
                        v64.Order = v62.order;
                    end;
                    v64.Position = v62.position;
                    v64.Rotation = v62.rotation;
                    v64.Scale = v62.scale;
                    if not v49[v62.assetTypeId] or not v62.lookId then
                        v49[v62.assetTypeId] = {};
                    end;
                    table.insert(v49[v62.assetTypeId], v64);
                elseif v63 then
                    v48[v63] = v62.lookId and v62.bundleId == tostring(v9.BlockyBundleId) and 0 or v62.assetId;
                end;
            end;
        end;
        return v49;
    end;
end;
local function v76(v66, v67, v68, v69, v70) --[[ Line: 209 ]] --[[ Name: updateHumanoidDescriptionTryOnOutfitAsset ]]
    -- upvalues: v9 (copy), v11 (copy), v20 (copy), v42 (copy)
    if not v67.selectedInTryOnManager then
        return;
    else
        local l_itemSubType_0 = v67.itemSubType;
        if v68 and l_itemSubType_0 ~= v9.AssetTypeIdStrings.Gear then
            local v72 = v9.AssetTypeIdStringToHumanoidDescriptionProp[l_itemSubType_0];
            if v9.AssetTypeIdToAccessoryTypeEnum[l_itemSubType_0] then
                local v73 = v11.createDefaultHumanoidDescriptionAccessoryInfo(l_itemSubType_0, v68);
                if v67.order ~= nil and (not v20() or v73.IsLayered) then
                    v73.Order = v67.order;
                end;
                v73.Position = v67.position;
                v73.Rotation = v67.rotation;
                v73.Scale = v67.scale;
                local _, v75 = v42(v66, v68);
                if not v75 then
                    table.insert(v69, v73);
                    return;
                end;
            elseif v72 then
                v70[v72] = v68;
            end;
        end;
        return;
    end;
end;
local function v93(v77, v78, v79, v80, v81) --[[ Line: 257 ]] --[[ Name: updateHumanoidDescriptionTryOnOutfitBundle ]]
    -- upvalues: v9 (copy), v11 (copy), v20 (copy), v42 (copy), v2 (copy)
    for v82, v83 in v78.assets do
        local v84 = v9.AssetTypeIdStringToHumanoidDescriptionProp[v82];
        local v85 = v84 and v82 ~= v9.AssetTypeIdStrings.Gear;
        if v9.AssetTypeIdToAccessoryTypeEnum[v82] then
            for v86, v87 in v83 do
                local v88 = v11.createHumanoidDescriptionAccessoryInfo(v82, v86, v87);
                local l_bundleInfo_0 = v79.bundleInfo;
                if l_bundleInfo_0 and l_bundleInfo_0[v86] and l_bundleInfo_0[v86].order ~= nil and (not v20() or v88.IsLayered) then
                    v88.Order = l_bundleInfo_0[v86].order;
                end;
                if l_bundleInfo_0 and l_bundleInfo_0[v86] then
                    v88.Position = l_bundleInfo_0[v86].position;
                    v88.Rotation = l_bundleInfo_0[v86].rotation;
                    v88.Scale = l_bundleInfo_0[v86].scale;
                end;
                local _, v91 = v42(v77, v86);
                if not v91 then
                    table.insert(v80, v88);
                end;
            end;
        elseif v85 then
            local v92 = v2.Dictionary.keys(v83);
            v81[v84] = table.concat(v92, ",");
        end;
    end;
end;
local function v111(v94, v95, v96, v97) --[[ Line: 309 ]] --[[ Name: updateHumanoidDescriptionTryOnItemBundle ]]
    -- upvalues: v18 (copy), v9 (copy), v11 (copy), v42 (copy)
    local v98 = v18.buildEquippedAssetMapByHumanoidDescriptionProp(v94);
    assert(v95.bundleInfo, "tryOnBundleItem.bundleInfo is non-nil. Silence type checker.");
    for v99, v100 in v95.bundleInfo do
        local v101 = v9.AssetTypeIdStringToHumanoidDescriptionProp[v100.assetType];
        local v102 = v101 and v100.assetType ~= v9.AssetTypeIdStrings.Gear;
        if v9.AssetTypeIdToAccessoryTypeEnum[v100.assetType] then
            if v95.selectedInTryOnManager then
                local v103 = v11.createDefaultHumanoidDescriptionAccessoryInfo(v100.assetType, v99);
                if v100.order ~= nil then
                    v103.Order = v100.order;
                end;
                local _, v105 = v42(v94, v99);
                if not v105 then
                    table.insert(v96, v103);
                end;
            end;
        elseif v102 then
            v97[v101] = v95.itemId == tostring(v9.BlockyBundleId) and 0 or v99;
            if not v95.selectedInTryOnManager then
                local v106 = v98[v101];
                v97[v101] = 0;
                if v106 ~= nil then
                    for _, v108 in v106 do
                        for v109, _ in v108 do
                            v97[v101] = v109;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local function v128(v112, v113, v114, v115) --[[ Line: 391 ]] --[[ Name: updateHumanoidDescriptionTryOnOutfitBundleNoUserOutfit ]]
    -- upvalues: v11 (copy), v20 (copy), v42 (copy)
    local l_AssetInfos_0 = v112.AvatarExperience.Common.AssetInfos;
    local v117 = false;
    if v114.items == nil then
        return;
    else
        assert(v114.items, "bundleInfo.items is non-nil. Silence type checker.");
        for _, v119 in v114.items do
            local v120 = l_AssetInfos_0[v119.id];
            if not v120 or not v120.assetType then
                v117 = true;
            end;
        end;
        if not v117 then
            for _, v122 in v114.items do
                local l_assetType_0 = l_AssetInfos_0[v122.id].assetType;
                local v124 = v11.createDefaultHumanoidDescriptionAccessoryInfo(l_assetType_0, v122.id);
                local l_bundleInfo_1 = v113.bundleInfo;
                if l_bundleInfo_1 and l_bundleInfo_1[v122.id] and l_bundleInfo_1[v122.id].order ~= nil and (not v20() or v124.IsLayered) then
                    v124.Order = l_bundleInfo_1[v122.id].order;
                end;
                local _, v127 = v42(v112, v122.id);
                if not v127 then
                    table.insert(v115, v124);
                end;
            end;
        end;
        return;
    end;
end;
local function _(v129) --[[ Line: 442 ]] --[[ Name: isHumanoidDescriptionPropertyEmpty ]]
    local v130 = true;
    if v129 ~= "" then
        v130 = v129 == 0;
    end;
    return v130;
end;
v33.isDHBundle = function(v132) --[[ Line: 446 ]]
    -- upvalues: v9 (copy)
    local v133 = false;
    if v132.itemType == v9.ItemType.Bundle then
        v133 = true;
        if v132.itemSubType ~= Enum.BundleType.DynamicHead.Name then
            v133 = v132.itemSubType == v9.BundleTypeIdStrings.DynamicHead;
        end;
    end;
    return v133;
end;
v33.isDHBundleTryOn = function(v134) --[[ Line: 458 ]]
    -- upvalues: v33 (copy)
    for _, v136 in v134.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v33.isDHBundle(v136) then
            return true;
        end;
    end;
    return false;
end;
v33.isClassicHeadOrClassicFaceTryOn = function(v137) --[[ Line: 468 ]]
    -- upvalues: v9 (copy)
    for _, v139 in v137.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v139.itemSubType == v9.AssetTypeIdStrings.Head or v139.itemSubType == v9.AssetTypeIdStrings.Face then
            return true;
        end;
    end;
    return false;
end;
local function v161(v140, v141, v142) --[[ Line: 485 ]] --[[ Name: setAccessoriesFromTryOn ]]
    -- upvalues: v9 (copy), l_FFlagAXMakeupEquipping_0 (copy), v33 (copy)
    local l_v141_Accessories_0 = v141:GetAccessories(true);
    local l_v142_Accessories_0 = v142:GetAccessories(true);
    local l_RemovedList_1 = v140.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
    local v146 = {};
    local v147 = {};
    for _, v149 in l_v142_Accessories_0 do
        local v150 = v9.AccessoryTypeEnumToAssetTypeId[v149.AccessoryType];
        local v151 = v9.AssetTypeToAssetCategory[v150];
        v146[v149.AccessoryType] = true;
        if v151 then
            v147[v151] = true;
        end;
    end;
    for _, v153 in l_RemovedList_1 do
        local v154 = v9.AssetTypeIdToAccessoryTypeEnum[v153];
        local v155 = v9.AssetTypeToAssetCategory[v153];
        if l_FFlagAXMakeupEquipping_0 and v154 then
            v146[v154] = true;
        elseif not l_FFlagAXMakeupEquipping_0 then
            v146[v154] = true;
        end;
        if v155 then
            v147[v155] = true;
        end;
    end;
    for _, v157 in l_v141_Accessories_0 do
        local v158 = v9.AccessoryTypeEnumToAssetTypeId[v157.AccessoryType];
        local v159 = not v146[v157.AccessoryType];
        local v160 = v9.AssetTypeToAssetCategory[v158];
        if v160 then
            v159 = not v147[v160];
        end;
        if v33.isDHBundleTryOn(v140) and v9.DynamicHeadAssetTypes[v158] then
            v159 = false;
        end;
        if v159 then
            table.insert(l_v142_Accessories_0, v157);
        end;
    end;
    v141:SetAccessories(l_v142_Accessories_0, true);
end;
local function v166(v162) --[[ Line: 558 ]] --[[ Name: getTryOnsBundleOutfitInfo ]]
    -- upvalues: v9 (copy), v11 (copy)
    for _, v164 in v162.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v164.itemType == v9.ItemType.Bundle and v164.itemSubType == v9.BundleTypeIdStrings.BodyParts then
            local v165 = v11.getOutfitInfoFromBundleId(v162, v164.itemId);
            if v165 then
                return v165;
            end;
        end;
    end;
    return nil;
end;
local function v171(v167, v168) --[[ Line: 575 ]] --[[ Name: normalizeTryOnAsset ]]
    -- upvalues: v42 (copy)
    local _, v170 = v42(v168, v167.itemId);
    return {
        assetId = v167.itemId, 
        assetTypeId = v167.itemSubType, 
        itemRecency = v167.itemRecency, 
        lookId = v167.lookId, 
        order = v167.order, 
        isRemovedInLCSort = v170, 
        position = v167.position, 
        rotation = v167.rotation, 
        scale = v167.scale
    };
end;
local function v191(v172, v173) --[[ Line: 593 ]] --[[ Name: getNormalizedAssetsFromTryOnBundle ]]
    -- upvalues: v11 (copy), v42 (copy), l_FFlagEnableHeadShapeForCharacterManager_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagDynamicHeadsMigration_0 (copy)
    local v174 = v11.getOutfitInfoFromBundleId(v173, v172.itemId);
    local v175 = {};
    if v172.bundleInfo and v172.lookId ~= nil then
        for v176, v177 in v172.bundleInfo do
            local _, v179 = v42(v173, v176);
            table.insert(v175, {
                assetId = v176, 
                assetTypeId = v177.assetType, 
                itemRecency = v172.itemRecency, 
                lookId = v172.lookId, 
                order = v177.order, 
                isRemovedInLCSort = v179, 
                position = v177.position, 
                rotation = v177.rotation, 
                scale = v177.scale, 
                bundleId = v172.itemId, 
                headShape = if l_FFlagEnableHeadShapeForCharacterManager_0 then v177.headShape else nil, 
                staticFacialAnimation = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v177.staticFacialAnimation else nil
            });
        end;
        return v175;
    elseif v174 and v174.assets then
        for v180, v181 in v174.assets do
            for v182, v183 in v181 do
                local _, v185 = v42(v173, v182);
                local v186 = if v172.bundleInfo and v172.bundleInfo[v182] then v172.bundleInfo[v182] else {};
                table.insert(v175, {
                    assetId = v182, 
                    assetTypeId = v180, 
                    itemRecency = v172.itemRecency, 
                    lookId = v172.lookId, 
                    order = v186.order, 
                    isRemovedInLCSort = v185, 
                    position = v186.position, 
                    rotation = v186.rotation, 
                    scale = v186.scale, 
                    bundleId = v172.itemId, 
                    headShape = if l_FFlagEnableHeadShapeForCharacterManager_0 then v183.headShape else nil, 
                    staticFacialAnimation = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v183.staticFacialAnimation else nil
                });
            end;
        end;
        return v175;
    else
        if l_FFlagDynamicHeadsMigration_0 and v172.bundleInfo then
            for v187, v188 in v172.bundleInfo do
                local _, v190 = v42(v173, v187);
                table.insert(v175, {
                    assetId = v187, 
                    assetTypeId = v188.assetType, 
                    itemRecency = v172.itemRecency, 
                    lookId = v172.lookId, 
                    order = v188.order, 
                    isRemovedInLCSort = v190, 
                    position = v188.position, 
                    rotation = v188.rotation, 
                    scale = v188.scale, 
                    bundleId = v172.itemId, 
                    headShape = if l_FFlagEnableHeadShapeForCharacterManager_0 then v188.headShape else nil, 
                    staticFacialAnimation = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v188.staticFacialAnimation else nil
                });
            end;
        end;
        return v175;
    end;
end;
v33.setAvatarTryOnProperties = function(v192, v193) --[[ Line: 683 ]]
    -- upvalues: v13 (copy), v14 (copy), v4 (copy), v9 (copy)
    local l_BodyColor3s_0 = v193.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s;
    local l_Scale_0 = v193.AvatarExperience.AvatarScene.OutfitTryOn.Scale;
    local v196 = v13(v193);
    local v197 = v14(v193);
    local v198 = if v196 then v197 else l_BodyColor3s_0;
    if v198 then
        v4.setHumanoidDescriptionColorsFromBodyColor3s(v192, v198);
    end;
    if l_Scale_0 ~= nil then
        for v199, v200 in l_Scale_0 do
            v192[v9.HumanoidDescriptionScaleToName[v199]] = v200;
        end;
    end;
end;
v33.resetHumanoidDescriptionProperties = function(v201) --[[ Line: 705 ]]
    -- upvalues: v9 (copy)
    for _, v203 in v9.AssetTypeIdStringToHumanoidDescriptionProp do
        local v204 = typeof(v201[v203]);
        if v204 == "string" then
            v201[v203] = "";
        elseif v204 == "number" then
            v201[v203] = 0;
        end;
    end;
end;
if l_FFlagEnableHeadShapeForCharacterManager_0 then
    v33.getHeadShapeFromTryOn = function(v205) --[[ Line: 722 ]]
        -- upvalues: v11 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v191 (copy), v9 (copy)
        local l_TryOnItems_0 = v205.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local l_LookId_0 = v205.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        local v208 = false;
        for _, v210 in l_TryOnItems_0 do
            local v211 = v11.getOutfitInfoFromBundleId(v205, v210.itemId);
            local l_bundleInfo_2 = v210.bundleInfo;
            local v213 = if l_FFlagAXMISEnableMultiShopping_0 then v191(v210, v205) else nil;
            if v211 and l_LookId_0 == nil then
                for v214, v215 in v211.assets do
                    if v214 == v9.AssetTypeIdStrings.DynamicHead then
                        v208 = true;
                        for _, v217 in v215 do
                            if v217.headShape then
                                return v217.headShape, v208;
                            end;
                        end;
                    end;
                end;
            end;
            if l_FFlagAXMISEnableMultiShopping_0 and v213 then
                for _, v219 in v213 do
                    if v219.assetTypeId == v9.AssetTypeIdStrings.DynamicHead then
                        v208 = true;
                        if v219.headShape then
                            return v219.headShape, v208;
                        end;
                    end;
                end;
            end;
            if l_bundleInfo_2 then
                for _, v221 in l_bundleInfo_2 do
                    if v221.assetType == v9.AssetTypeIdStrings.DynamicHead then
                        v208 = true;
                        if v221.headShape then
                            return v221.headShape, v208;
                        end;
                    end;
                end;
            end;
        end;
        return nil, v208;
    end;
    v33.getHeadShapeFromEquippedAssets = function(v222) --[[ Line: 779 ]]
        -- upvalues: v32 (copy), v9 (copy)
        local l_EquippedAssets_0 = v222.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        if v32 and not l_EquippedAssets_0 then
            return nil;
        else
            for v224, v225 in l_EquippedAssets_0 do
                if v224 == v9.AssetTypeIdStrings.DynamicHead then
                    for _, v227 in v225 do
                        return v227.headShape;
                    end;
                end;
            end;
            return nil;
        end;
    end;
    if l_FFlagHeadRefinementFacialAnimationToggle_0 then
        v33.getStaticFacialAnimationFromEquippedAssets = function(v228) --[[ Line: 800 ]]
            -- upvalues: v32 (copy), v9 (copy)
            local l_EquippedAssets_1 = v228.AvatarExperience.AvatarEditor.Character.EquippedAssets;
            if v32 and not l_EquippedAssets_1 then
                return nil;
            else
                local v230 = l_EquippedAssets_1[v9.AssetTypeIdStrings.DynamicHead];
                if v230 then
                    for _, v232 in v230 do
                        return v232.staticFacialAnimation;
                    end;
                end;
                return nil;
            end;
        end;
        v33.getStaticFacialAnimationFromTryOn = function(v233) --[[ Line: 821 ]]
            -- upvalues: v11 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v191 (copy), v9 (copy)
            for _, v235 in v233.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
                local v236 = v11.getOutfitInfoFromBundleId(v233, v235.itemId);
                local l_bundleInfo_3 = v235.bundleInfo;
                local v238 = if l_FFlagAXMISEnableMultiShopping_0 then v191(v235, v233) else nil;
                if v236 then
                    for v239, v240 in v236.assets do
                        if v239 == v9.AssetTypeIdStrings.DynamicHead then
                            for _, v242 in v240 do
                                if v242.staticFacialAnimation ~= nil then
                                    return v242.staticFacialAnimation;
                                end;
                            end;
                        end;
                    end;
                end;
                if l_FFlagAXMISEnableMultiShopping_0 and v238 then
                    for _, v244 in v238 do
                        if v244.assetTypeId == v9.AssetTypeIdStrings.DynamicHead and v244.staticFacialAnimation ~= nil then
                            return v244.staticFacialAnimation;
                        end;
                    end;
                end;
                if l_bundleInfo_3 then
                    for _, v246 in l_bundleInfo_3 do
                        if v246.assetType == v9.AssetTypeIdStrings.DynamicHead and v246.staticFacialAnimation ~= nil then
                            return v246.staticFacialAnimation;
                        end;
                    end;
                end;
            end;
            return nil;
        end;
    end;
    if l_FFlagFixHeadShapeColorSlider_0 then
        v33.getHeadShapeFromAssetMetadata = function(v247) --[[ Line: 870 ]]
            -- upvalues: l_FFlagAXFixR6DefaultHeadShape_0 (copy)
            for _, v249 in v247 do
                if v249.headShape and (not l_FFlagAXFixR6DefaultHeadShape_0 or v249.headShape ~= "Default") then
                    return v249.headShape;
                end;
            end;
            return nil;
        end;
        v33.applyHeadShapeFromAssetMetadata = function(v250, v251) --[[ Line: 882 ]]
            -- upvalues: v2 (copy), v33 (copy)
            local v252 = v2.Dictionary.keys(v251);
            for _, v254 in v250:GetChildren() do
                if v254:IsA("BodyPartDescription") and v254.BodyPart == Enum.BodyPart.Head then
                    local v255 = v33.getHeadShapeFromAssetMetadata(v251);
                    if v255 then
                        v254.HeadShape = v255;
                    end;
                    v254.AssetId = tonumber(v252[1]) or 0;
                end;
            end;
        end;
    end;
    v33.applyHeadShapeToHumanoidDescription = function(v256, v257) --[[ Line: 908 ]]
        -- upvalues: v33 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v9 (copy)
        local v258, v259 = v33.getHeadShapeFromTryOn(v257);
        local v260 = v33.getHeadShapeFromEquippedAssets(v257);
        local v261 = nil;
        if l_FFlagHeadRefinementFacialAnimationToggle_0 then
            local v262 = nil;
            if v259 then
                v262 = v33.getStaticFacialAnimationFromTryOn(v257);
            end;
            if v262 == nil then
                v262 = v33.getStaticFacialAnimationFromEquippedAssets(v257);
            end;
            if v262 ~= nil then
                v256[v9.StaticFacialAnimation] = v262;
            end;
        end;
        v261 = if v259 then v258 else v260;
        if v261 == "Default" then
            v261 = nil;
        end;
        if v261 then
            for _, v264 in v256:GetChildren() do
                if v264:IsA("BodyPartDescription") and v264.BodyPart == Enum.BodyPart.Head and v261 then
                    v264.HeadShape = v261;
                end;
            end;
        end;
    end;
end;
v33.updateHumanoidDescriptionUsingOutfitTryOn = function(v265, v266, v267) --[[ Line: 953 ]]
    -- upvalues: v19 (copy), v33 (copy), v9 (copy), v11 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupAssetType_0 (copy), l_setMakeupDescriptions_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v171 (copy), v191 (copy), v18 (copy), v65 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v76 (copy), v93 (copy), v111 (copy), v128 (copy)
    if v19() then
        v33.resetHumanoidDescriptionProperties(v266);
    else
        for _, v269 in v9.AssetTypeIdStringToHumanoidDescriptionProp do
            v266[v269] = "";
        end;
    end;
    v266:SetAccessories({}, true);
    local l_TryOnItems_1 = v265.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local l_LookType_0 = v265.AvatarExperience.AvatarScene.OutfitTryOn.LookType;
    local v272 = {};
    local v273 = v11.sortOutfitTryOnItemsByRecency(l_TryOnItems_1, false);
    if l_FFlagAXMakeupEquipping_0 then
        local v274 = {};
        for _, v276 in l_TryOnItems_1 do
            if v276.selectedInTryOnManager and v276.itemType == v9.ItemType.Asset then
                local l_itemSubType_1 = v276.itemSubType;
                if l_isMakeupAssetType_0(l_itemSubType_1) then
                    if not v274[l_itemSubType_1] then
                        v274[l_itemSubType_1] = {};
                    end;
                    v274[l_itemSubType_1][v276.itemId] = v276;
                end;
            end;
        end;
        l_setMakeupDescriptions_0(v266, v274);
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        local v278 = {};
        if v267 then
            for _, v280 in v267 do
                v278[v280.itemId] = true;
            end;
        end;
        local v281 = {};
        local v282 = {};
        for _, v284 in v273 do
            if v284.selectedInTryOnManager ~= false and (not v267 or v278[v284.itemId]) then
                if v284.itemType == v9.ItemType.Asset then
                    table.insert(v282, (v171(v284, v265)));
                elseif v284.itemType == v9.ItemType.Bundle then
                    for _, v286 in (v191(v284, v265)) do
                        table.insert(v282, v286);
                    end;
                end;
            end;
        end;
        local v287 = v18.buildEquippedAssetMapByHumanoidDescriptionProp(v265);
        v281 = v65(v266, v281, v282, v287);
        v33.tryApplyClassicHeadShapeTryOn(v265, v266);
        local v288 = {};
        for _, v290 in v281 do
            for _, v292 in v290 do
                table.insert(v288, v292);
            end;
        end;
        v266:SetAccessories(v288, true);
        return;
    else
        for _, v294 in v273 do
            if v294.selectedInTryOnManager or l_LookType_0 == v9.LookType.Avatar and (not l_FFlagAXCatalogMakeupSupport_0 or l_LookType_0 == v9.LookType.Makeup) then
                if v294.itemType == v9.ItemType.Asset then
                    v76(v265, v294, v294.itemId, v272, v266);
                elseif v294.itemType == v9.ItemType.Bundle then
                    local v295 = v11.getBundleInfoFromState(v265, v294.itemId);
                    local v296 = v11.getOutfitInfoFromBundleId(v265, v294.itemId);
                    if v296 then
                        v93(v265, v296, v294, v272, v266);
                    elseif v294.bundleInfo ~= nil and (l_LookType_0 == v9.LookType.Avatar or l_FFlagAXCatalogMakeupSupport_0 and l_LookType_0 == v9.LookType.Makeup) then
                        v111(v265, v294, v272, v266);
                    elseif v295 then
                        v128(v265, v294, v295, v272);
                    end;
                end;
            end;
        end;
        v33.tryApplyClassicHeadShapeTryOn(v265, v266);
        v266:SetAccessories(v272, true);
        return;
    end;
end;
v33.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn = function(v297, v298) --[[ Line: 1109 ]]
    -- upvalues: v33 (copy), v4 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXRemoveMakeupAvatarLookTryOn_0 (copy), l_destroyMakeupDescriptions_0 (copy), v9 (copy), v18 (copy), v161 (copy), v166 (copy), l_FFlagEnableHeadShapeForCharacterManager_0 (copy)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    v33.updateHumanoidDescriptionUsingOutfitTryOn(v297, l_HumanoidDescription_0, v298);
    local v300 = v4.getHumanoidDescriptionFromState(v297.AvatarExperience):Clone();
    local l_LookId_1 = v297.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    if l_FFlagAXMISEnableMultiShopping_0 then
        l_LookId_1 = v297.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems;
    end;
    if l_LookId_1 then
        v300:SetAccessories({}, true);
        v300.GraphicTShirt = 0;
        v300.Shirt = 0;
        v300.Pants = 0;
        if l_FFlagAXRemoveMakeupAvatarLookTryOn_0 then
            l_destroyMakeupDescriptions_0(v300);
        end;
    end;
    for v302, v303 in v9.AssetTypeIdStringToHumanoidDescriptionProp do
        if v9.AssetTypeIdToCategory[v302] == v9.AssetCategories.Body and v18.shouldUnequipBodyBeforeTryOn(v297) then
            v300[v303] = 0;
        end;
        if not v9.AssetTypeIdToAccessoryTypeEnum[v302] then
            local v304 = l_HumanoidDescription_0[v303];
            local v305 = true;
            if v304 ~= "" then
                v305 = v304 == 0;
            end;
            if not v305 then
                v300[v303] = l_HumanoidDescription_0[v303];
            end;
        end;
    end;
    v161(v297, v300, l_HumanoidDescription_0);
    local v306 = v166(v297);
    if v306 then
        for v307, v308 in v306.scales do
            v300[v9.HumanoidDescriptionScaleToName[v307]] = v308;
        end;
        v4.setHumanoidDescriptionColorsFromBodyColor3s(v300, v306.bodyColor3s);
    end;
    v33.setAvatarTryOnProperties(v300, v297);
    if l_FFlagEnableHeadShapeForCharacterManager_0 then
        v33.applyHeadShapeToHumanoidDescription(v300, v297);
    end;
    return v300;
end;
if l_FFlagAXMISEnableMultiShopping_0 then
    v33.getBundleOutfitInfoFromProvidedTryOns = function(v309, v310) --[[ Line: 1190 ]]
        -- upvalues: v9 (copy), v11 (copy)
        for _, v312 in v310 do
            if v312.itemType == v9.ItemType.Bundle and v312.itemSubType == v9.BundleTypeIdStrings.BodyParts then
                local v313 = v11.getOutfitInfoFromBundleId(v309, v312.itemId);
                if v313 then
                    return v313;
                end;
            end;
        end;
        return nil;
    end;
end;
return v33;