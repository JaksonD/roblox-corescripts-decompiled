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
local v16 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local v17 = require(l_Modules_0.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixCharacterManagerValueConversionWarning);
local v19 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixOrderFieldUnlayeredItems);
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXCatalogMakeupSupport_0 = v6.FFlagAXCatalogMakeupSupport;
local l_FFlagAXMakeupEquipping_0 = v6.FFlagAXMakeupEquipping;
local l_FFlagEnableHeadShapeForCharacterManager_0 = v6.FFlagEnableHeadShapeForCharacterManager;
local l_isMakeupAssetType_0 = v7.Utils.isMakeupAssetType;
local l_FFlagDynamicHeadsMigration_0 = v6.FFlagDynamicHeadsMigration;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v6.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagFixHeadShapeColorSlider_0 = v6.FFlagFixHeadShapeColorSlider;
local l_FFlagAXFixR6DefaultHeadShape_0 = v6.FFlagAXFixR6DefaultHeadShape;
local v29 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShapeAssetId);
local v30 = {};
local function v39(v31, v32) --[[ Line: 71 ]] --[[ Name: getIsInLCSortIsRemovedTuple ]]
    -- upvalues: l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v16 (copy)
    local v33 = v31.AvatarExperience and v31.AvatarExperience.LayeredClothingSort;
    local v34 = v33 and v33.CurrentSort;
    if l_FFlagHeadRefinementFacialAnimationToggle_0 then
        if not v34 then
            return false, false;
        else
            local v35 = v34.OrderedList or {};
            local v36 = v34.RemovedList or {};
            return v16.createAssetIdToOrderMapping(v35)[v32], v36[v32];
        end;
    else
        local l_OrderedList_0 = v31.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
        local l_RemovedList_0 = v31.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
        return v16.createAssetIdToOrderMapping(l_OrderedList_0)[v32], l_RemovedList_0[v32];
    end;
end;
v30.tryApplyClassicHeadShapeTryOn = function(v40, v41) --[[ Line: 95 ]] --[[ Name: tryApplyClassicHeadShapeTryOn ]]
    -- upvalues: v11 (copy), v29 (copy)
    local v42 = v40.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil;
    local v43 = v11.isTryingOnDynamicHead(v40.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
    local v44 = v29(v40);
    if v42 or v43 or not v44 then
        return;
    else
        v41.Head = v44;
        return;
    end;
end;
local function v62(v45, v46, v47, v48) --[[ Line: 110 ]] --[[ Name: updateHumanoidDescriptionTryOnFromNormalizedAssets ]]
    -- upvalues: v9 (copy), v11 (copy)
    if not v47 or #v47 == 0 then
        return v46;
    else
        table.sort(v47, function(v49, v50) --[[ Line: 124 ]]
            if v49.itemRecency and v50.itemRecency then
                return v49.itemRecency < v50.itemRecency;
            else
                return false;
            end;
        end);
        for v51, v52 in v9.AssetTypeIdStringToHumanoidDescriptionProp do
            if v9.AssetTypeIdToCategory[v51] == v9.AssetCategories.Body then
                local v53 = v48[v52];
                if v53 ~= nil then
                    for _, v55 in v53 do
                        for v56, _ in v55 do
                            v45[v52] = v56;
                        end;
                    end;
                end;
            end;
        end;
        for _, v59 in v47 do
            if not v59.isRemovedInLCSort and v59.assetTypeId ~= v9.AssetTypeIdStrings.Gear and v59.assetId then
                local v60 = v9.AssetTypeIdStringToHumanoidDescriptionProp[v59.assetTypeId];
                if v9.AssetTypeIdToAccessoryTypeEnum[v59.assetTypeId] then
                    local v61 = v11.createDefaultHumanoidDescriptionAccessoryInfo(v59.assetTypeId, v59.assetId);
                    if v59.order ~= nil then
                        v61.Order = v59.order;
                    end;
                    v61.Position = v59.position;
                    v61.Rotation = v59.rotation;
                    v61.Scale = v59.scale;
                    if not v46[v59.assetTypeId] or not v59.lookId then
                        v46[v59.assetTypeId] = {};
                    end;
                    table.insert(v46[v59.assetTypeId], v61);
                elseif v60 then
                    v45[v60] = v59.lookId and v59.bundleId == tostring(v9.BlockyBundleId) and 0 or v59.assetId;
                end;
            end;
        end;
        return v46;
    end;
end;
local function v73(v63, v64, v65, v66, v67) --[[ Line: 205 ]] --[[ Name: updateHumanoidDescriptionTryOnOutfitAsset ]]
    -- upvalues: v9 (copy), v11 (copy), v19 (copy), v39 (copy)
    if not v64.selectedInTryOnManager then
        return;
    else
        local l_itemSubType_0 = v64.itemSubType;
        if v65 and l_itemSubType_0 ~= v9.AssetTypeIdStrings.Gear then
            local v69 = v9.AssetTypeIdStringToHumanoidDescriptionProp[l_itemSubType_0];
            if v9.AssetTypeIdToAccessoryTypeEnum[l_itemSubType_0] then
                local v70 = v11.createDefaultHumanoidDescriptionAccessoryInfo(l_itemSubType_0, v65);
                if v64.order ~= nil and (not v19() or v70.IsLayered) then
                    v70.Order = v64.order;
                end;
                v70.Position = v64.position;
                v70.Rotation = v64.rotation;
                v70.Scale = v64.scale;
                local _, v72 = v39(v63, v65);
                if not v72 then
                    table.insert(v66, v70);
                    return;
                end;
            elseif v69 then
                v67[v69] = v65;
            end;
        end;
        return;
    end;
end;
local function v90(v74, v75, v76, v77, v78) --[[ Line: 253 ]] --[[ Name: updateHumanoidDescriptionTryOnOutfitBundle ]]
    -- upvalues: v9 (copy), v11 (copy), v19 (copy), v39 (copy), v2 (copy)
    for v79, v80 in v75.assets do
        local v81 = v9.AssetTypeIdStringToHumanoidDescriptionProp[v79];
        local v82 = v81 and v79 ~= v9.AssetTypeIdStrings.Gear;
        if v9.AssetTypeIdToAccessoryTypeEnum[v79] then
            for v83, v84 in v80 do
                local v85 = v11.createHumanoidDescriptionAccessoryInfo(v79, v83, v84);
                local l_bundleInfo_0 = v76.bundleInfo;
                if l_bundleInfo_0 and l_bundleInfo_0[v83] and l_bundleInfo_0[v83].order ~= nil and (not v19() or v85.IsLayered) then
                    v85.Order = l_bundleInfo_0[v83].order;
                end;
                if l_bundleInfo_0 and l_bundleInfo_0[v83] then
                    v85.Position = l_bundleInfo_0[v83].position;
                    v85.Rotation = l_bundleInfo_0[v83].rotation;
                    v85.Scale = l_bundleInfo_0[v83].scale;
                end;
                local _, v88 = v39(v74, v83);
                if not v88 then
                    table.insert(v77, v85);
                end;
            end;
        elseif v82 then
            local v89 = v2.Dictionary.keys(v80);
            v78[v81] = table.concat(v89, ",");
        end;
    end;
end;
local function v108(v91, v92, v93, v94) --[[ Line: 305 ]] --[[ Name: updateHumanoidDescriptionTryOnItemBundle ]]
    -- upvalues: v17 (copy), v9 (copy), v11 (copy), v39 (copy)
    local v95 = v17.buildEquippedAssetMapByHumanoidDescriptionProp(v91);
    assert(v92.bundleInfo, "tryOnBundleItem.bundleInfo is non-nil. Silence type checker.");
    for v96, v97 in v92.bundleInfo do
        local v98 = v9.AssetTypeIdStringToHumanoidDescriptionProp[v97.assetType];
        local v99 = v98 and v97.assetType ~= v9.AssetTypeIdStrings.Gear;
        if v9.AssetTypeIdToAccessoryTypeEnum[v97.assetType] then
            if v92.selectedInTryOnManager then
                local v100 = v11.createDefaultHumanoidDescriptionAccessoryInfo(v97.assetType, v96);
                if v97.order ~= nil then
                    v100.Order = v97.order;
                end;
                local _, v102 = v39(v91, v96);
                if not v102 then
                    table.insert(v93, v100);
                end;
            end;
        elseif v99 then
            v94[v98] = v92.itemId == tostring(v9.BlockyBundleId) and 0 or v96;
            if not v92.selectedInTryOnManager then
                local v103 = v95[v98];
                v94[v98] = 0;
                if v103 ~= nil then
                    for _, v105 in v103 do
                        for v106, _ in v105 do
                            v94[v98] = v106;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local function v125(v109, v110, v111, v112) --[[ Line: 387 ]] --[[ Name: updateHumanoidDescriptionTryOnOutfitBundleNoUserOutfit ]]
    -- upvalues: v11 (copy), v19 (copy), v39 (copy)
    local l_AssetInfos_0 = v109.AvatarExperience.Common.AssetInfos;
    local v114 = false;
    if v111.items == nil then
        return;
    else
        assert(v111.items, "bundleInfo.items is non-nil. Silence type checker.");
        for _, v116 in v111.items do
            local v117 = l_AssetInfos_0[v116.id];
            if not v117 or not v117.assetType then
                v114 = true;
            end;
        end;
        if not v114 then
            for _, v119 in v111.items do
                local l_assetType_0 = l_AssetInfos_0[v119.id].assetType;
                local v121 = v11.createDefaultHumanoidDescriptionAccessoryInfo(l_assetType_0, v119.id);
                local l_bundleInfo_1 = v110.bundleInfo;
                if l_bundleInfo_1 and l_bundleInfo_1[v119.id] and l_bundleInfo_1[v119.id].order ~= nil and (not v19() or v121.IsLayered) then
                    v121.Order = l_bundleInfo_1[v119.id].order;
                end;
                local _, v124 = v39(v109, v119.id);
                if not v124 then
                    table.insert(v112, v121);
                end;
            end;
        end;
        return;
    end;
end;
local function _(v126) --[[ Line: 438 ]] --[[ Name: isHumanoidDescriptionPropertyEmpty ]]
    local v127 = true;
    if v126 ~= "" then
        v127 = v126 == 0;
    end;
    return v127;
end;
v30.isDHBundle = function(v129) --[[ Line: 442 ]]
    -- upvalues: v9 (copy)
    local v130 = false;
    if v129.itemType == v9.ItemType.Bundle then
        v130 = true;
        if v129.itemSubType ~= Enum.BundleType.DynamicHead.Name then
            v130 = v129.itemSubType == v9.BundleTypeIdStrings.DynamicHead;
        end;
    end;
    return v130;
end;
v30.isDHBundleTryOn = function(v131) --[[ Line: 454 ]]
    -- upvalues: v30 (copy)
    for _, v133 in v131.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v30.isDHBundle(v133) then
            return true;
        end;
    end;
    return false;
end;
v30.isClassicHeadOrClassicFaceTryOn = function(v134) --[[ Line: 464 ]]
    -- upvalues: v9 (copy)
    for _, v136 in v134.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v136.itemSubType == v9.AssetTypeIdStrings.Head or v136.itemSubType == v9.AssetTypeIdStrings.Face then
            return true;
        end;
    end;
    return false;
end;
local function v158(v137, v138, v139) --[[ Line: 481 ]] --[[ Name: setAccessoriesFromTryOn ]]
    -- upvalues: v9 (copy), l_FFlagAXMakeupEquipping_0 (copy), v30 (copy)
    local l_v138_Accessories_0 = v138:GetAccessories(true);
    local l_v139_Accessories_0 = v139:GetAccessories(true);
    local l_RemovedList_1 = v137.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
    local v143 = {};
    local v144 = {};
    for _, v146 in l_v139_Accessories_0 do
        local v147 = v9.AccessoryTypeEnumToAssetTypeId[v146.AccessoryType];
        local v148 = v9.AssetTypeToAssetCategory[v147];
        v143[v146.AccessoryType] = true;
        if v148 then
            v144[v148] = true;
        end;
    end;
    for _, v150 in l_RemovedList_1 do
        local v151 = v9.AssetTypeIdToAccessoryTypeEnum[v150];
        local v152 = v9.AssetTypeToAssetCategory[v150];
        if l_FFlagAXMakeupEquipping_0 and v151 then
            v143[v151] = true;
        elseif not l_FFlagAXMakeupEquipping_0 then
            v143[v151] = true;
        end;
        if v152 then
            v144[v152] = true;
        end;
    end;
    for _, v154 in l_v138_Accessories_0 do
        local v155 = v9.AccessoryTypeEnumToAssetTypeId[v154.AccessoryType];
        local v156 = not v143[v154.AccessoryType];
        local v157 = v9.AssetTypeToAssetCategory[v155];
        if v157 then
            v156 = not v144[v157];
        end;
        if v30.isDHBundleTryOn(v137) and v9.DynamicHeadAssetTypes[v155] then
            v156 = false;
        end;
        if v156 then
            table.insert(l_v139_Accessories_0, v154);
        end;
    end;
    v138:SetAccessories(l_v139_Accessories_0, true);
end;
local function v163(v159) --[[ Line: 554 ]] --[[ Name: getTryOnsBundleOutfitInfo ]]
    -- upvalues: v9 (copy), v11 (copy)
    for _, v161 in v159.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v161.itemType == v9.ItemType.Bundle and v161.itemSubType == v9.BundleTypeIdStrings.BodyParts then
            local v162 = v11.getOutfitInfoFromBundleId(v159, v161.itemId);
            if v162 then
                return v162;
            end;
        end;
    end;
    return nil;
end;
local function v168(v164, v165) --[[ Line: 571 ]] --[[ Name: normalizeTryOnAsset ]]
    -- upvalues: v39 (copy)
    local _, v167 = v39(v165, v164.itemId);
    return {
        assetId = v164.itemId, 
        assetTypeId = v164.itemSubType, 
        itemRecency = v164.itemRecency, 
        lookId = v164.lookId, 
        order = v164.order, 
        isRemovedInLCSort = v167, 
        position = v164.position, 
        rotation = v164.rotation, 
        scale = v164.scale
    };
end;
local function v188(v169, v170) --[[ Line: 589 ]] --[[ Name: getNormalizedAssetsFromTryOnBundle ]]
    -- upvalues: v11 (copy), v39 (copy), l_FFlagEnableHeadShapeForCharacterManager_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagDynamicHeadsMigration_0 (copy)
    local v171 = v11.getOutfitInfoFromBundleId(v170, v169.itemId);
    local v172 = {};
    if v169.bundleInfo and v169.lookId ~= nil then
        for v173, v174 in v169.bundleInfo do
            local _, v176 = v39(v170, v173);
            table.insert(v172, {
                assetId = v173, 
                assetTypeId = v174.assetType, 
                itemRecency = v169.itemRecency, 
                lookId = v169.lookId, 
                order = v174.order, 
                isRemovedInLCSort = v176, 
                position = v174.position, 
                rotation = v174.rotation, 
                scale = v174.scale, 
                bundleId = v169.itemId, 
                headShape = if l_FFlagEnableHeadShapeForCharacterManager_0 then v174.headShape else nil, 
                staticFacialAnimation = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v174.staticFacialAnimation else nil
            });
        end;
        return v172;
    elseif v171 and v171.assets then
        for v177, v178 in v171.assets do
            for v179, v180 in v178 do
                local _, v182 = v39(v170, v179);
                local v183 = if v169.bundleInfo and v169.bundleInfo[v179] then v169.bundleInfo[v179] else {};
                table.insert(v172, {
                    assetId = v179, 
                    assetTypeId = v177, 
                    itemRecency = v169.itemRecency, 
                    lookId = v169.lookId, 
                    order = v183.order, 
                    isRemovedInLCSort = v182, 
                    position = v183.position, 
                    rotation = v183.rotation, 
                    scale = v183.scale, 
                    bundleId = v169.itemId, 
                    headShape = if l_FFlagEnableHeadShapeForCharacterManager_0 then v180.headShape else nil, 
                    staticFacialAnimation = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v180.staticFacialAnimation else nil
                });
            end;
        end;
        return v172;
    else
        if l_FFlagDynamicHeadsMigration_0 and v169.bundleInfo then
            for v184, v185 in v169.bundleInfo do
                local _, v187 = v39(v170, v184);
                table.insert(v172, {
                    assetId = v184, 
                    assetTypeId = v185.assetType, 
                    itemRecency = v169.itemRecency, 
                    lookId = v169.lookId, 
                    order = v185.order, 
                    isRemovedInLCSort = v187, 
                    position = v185.position, 
                    rotation = v185.rotation, 
                    scale = v185.scale, 
                    bundleId = v169.itemId, 
                    headShape = if l_FFlagEnableHeadShapeForCharacterManager_0 then v185.headShape else nil, 
                    staticFacialAnimation = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v185.staticFacialAnimation else nil
                });
            end;
        end;
        return v172;
    end;
end;
v30.setAvatarTryOnProperties = function(v189, v190) --[[ Line: 679 ]]
    -- upvalues: v13 (copy), v14 (copy), v4 (copy), v9 (copy)
    local l_BodyColor3s_0 = v190.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s;
    local l_Scale_0 = v190.AvatarExperience.AvatarScene.OutfitTryOn.Scale;
    local v193 = v13(v190);
    local v194 = v14(v190);
    local v195 = if v193 then v194 else l_BodyColor3s_0;
    if v195 then
        v4.setHumanoidDescriptionColorsFromBodyColor3s(v189, v195);
    end;
    if l_Scale_0 ~= nil then
        for v196, v197 in l_Scale_0 do
            v189[v9.HumanoidDescriptionScaleToName[v196]] = v197;
        end;
    end;
end;
v30.resetHumanoidDescriptionProperties = function(v198) --[[ Line: 701 ]]
    -- upvalues: v9 (copy)
    for _, v200 in v9.AssetTypeIdStringToHumanoidDescriptionProp do
        local v201 = typeof(v198[v200]);
        if v201 == "string" then
            v198[v200] = "";
        elseif v201 == "number" then
            v198[v200] = 0;
        end;
    end;
end;
if l_FFlagEnableHeadShapeForCharacterManager_0 then
    v30.getHeadShapeFromTryOn = function(v202) --[[ Line: 718 ]]
        -- upvalues: v11 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v188 (copy), v9 (copy)
        local l_TryOnItems_0 = v202.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local l_LookId_0 = v202.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        local v205 = false;
        for _, v207 in l_TryOnItems_0 do
            local v208 = v11.getOutfitInfoFromBundleId(v202, v207.itemId);
            local l_bundleInfo_2 = v207.bundleInfo;
            local v210 = if l_FFlagAXMISEnableMultiShopping_0 then v188(v207, v202) else nil;
            if v208 and l_LookId_0 == nil then
                for v211, v212 in v208.assets do
                    if v211 == v9.AssetTypeIdStrings.DynamicHead then
                        v205 = true;
                        for _, v214 in v212 do
                            if v214.headShape then
                                return v214.headShape, v205;
                            end;
                        end;
                    end;
                end;
            end;
            if l_FFlagAXMISEnableMultiShopping_0 and v210 then
                for _, v216 in v210 do
                    if v216.assetTypeId == v9.AssetTypeIdStrings.DynamicHead then
                        v205 = true;
                        if v216.headShape then
                            return v216.headShape, v205;
                        end;
                    end;
                end;
            end;
            if l_bundleInfo_2 then
                for _, v218 in l_bundleInfo_2 do
                    if v218.assetType == v9.AssetTypeIdStrings.DynamicHead then
                        v205 = true;
                        if v218.headShape then
                            return v218.headShape, v205;
                        end;
                    end;
                end;
            end;
        end;
        return nil, v205;
    end;
    v30.getHeadShapeFromEquippedAssets = function(v219) --[[ Line: 775 ]]
        -- upvalues: v9 (copy)
        for v220, v221 in v219.AvatarExperience.AvatarEditor.Character.EquippedAssets do
            if v220 == v9.AssetTypeIdStrings.DynamicHead then
                for _, v223 in v221 do
                    return v223.headShape;
                end;
            end;
        end;
        return nil;
    end;
    if l_FFlagHeadRefinementFacialAnimationToggle_0 then
        v30.getStaticFacialAnimationFromEquippedAssets = function(v224) --[[ Line: 791 ]]
            -- upvalues: v9 (copy)
            local v225 = v224.AvatarExperience.AvatarEditor.Character.EquippedAssets[v9.AssetTypeIdStrings.DynamicHead];
            if v225 then
                for _, v227 in v225 do
                    return v227.staticFacialAnimation;
                end;
            end;
            return nil;
        end;
        v30.getStaticFacialAnimationFromTryOn = function(v228) --[[ Line: 807 ]]
            -- upvalues: v11 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v188 (copy), v9 (copy)
            for _, v230 in v228.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
                local v231 = v11.getOutfitInfoFromBundleId(v228, v230.itemId);
                local l_bundleInfo_3 = v230.bundleInfo;
                local v233 = if l_FFlagAXMISEnableMultiShopping_0 then v188(v230, v228) else nil;
                if v231 then
                    for v234, v235 in v231.assets do
                        if v234 == v9.AssetTypeIdStrings.DynamicHead then
                            for _, v237 in v235 do
                                if v237.staticFacialAnimation ~= nil then
                                    return v237.staticFacialAnimation;
                                end;
                            end;
                        end;
                    end;
                end;
                if l_FFlagAXMISEnableMultiShopping_0 and v233 then
                    for _, v239 in v233 do
                        if v239.assetTypeId == v9.AssetTypeIdStrings.DynamicHead and v239.staticFacialAnimation ~= nil then
                            return v239.staticFacialAnimation;
                        end;
                    end;
                end;
                if l_bundleInfo_3 then
                    for _, v241 in l_bundleInfo_3 do
                        if v241.assetType == v9.AssetTypeIdStrings.DynamicHead and v241.staticFacialAnimation ~= nil then
                            return v241.staticFacialAnimation;
                        end;
                    end;
                end;
            end;
            return nil;
        end;
    end;
    if l_FFlagFixHeadShapeColorSlider_0 then
        v30.getHeadShapeFromAssetMetadata = function(v242) --[[ Line: 856 ]]
            -- upvalues: l_FFlagAXFixR6DefaultHeadShape_0 (copy)
            for _, v244 in v242 do
                if v244.headShape and (not l_FFlagAXFixR6DefaultHeadShape_0 or v244.headShape ~= "Default") then
                    return v244.headShape;
                end;
            end;
            return nil;
        end;
        v30.applyHeadShapeFromAssetMetadata = function(v245, v246) --[[ Line: 868 ]]
            -- upvalues: v2 (copy), v30 (copy)
            local v247 = v2.Dictionary.keys(v246);
            for _, v249 in v245:GetChildren() do
                if v249:IsA("BodyPartDescription") and v249.BodyPart == Enum.BodyPart.Head then
                    local v250 = v30.getHeadShapeFromAssetMetadata(v246);
                    if v250 then
                        v249.HeadShape = v250;
                    end;
                    v249.AssetId = tonumber(v247[1]) or 0;
                end;
            end;
        end;
    end;
    v30.applyHeadShapeToHumanoidDescription = function(v251, v252) --[[ Line: 894 ]]
        -- upvalues: v30 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v9 (copy)
        local v253, v254 = v30.getHeadShapeFromTryOn(v252);
        local v255 = v30.getHeadShapeFromEquippedAssets(v252);
        local v256 = nil;
        if l_FFlagHeadRefinementFacialAnimationToggle_0 then
            local v257 = nil;
            if v254 then
                v257 = v30.getStaticFacialAnimationFromTryOn(v252);
            end;
            if v257 == nil then
                v257 = v30.getStaticFacialAnimationFromEquippedAssets(v252);
            end;
            if v257 ~= nil then
                v251[v9.StaticFacialAnimation] = v257;
            end;
        end;
        v256 = if v254 then v253 else v255;
        if v256 == "Default" then
            v256 = nil;
        end;
        if v256 then
            for _, v259 in v251:GetChildren() do
                if v259:IsA("BodyPartDescription") and v259.BodyPart == Enum.BodyPart.Head and v256 then
                    v259.HeadShape = v256;
                end;
            end;
        end;
    end;
end;
v30.updateHumanoidDescriptionUsingOutfitTryOn = function(v260, v261, v262) --[[ Line: 939 ]]
    -- upvalues: v18 (copy), v30 (copy), v9 (copy), v11 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupAssetType_0 (copy), l_setMakeupDescriptions_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v168 (copy), v188 (copy), v17 (copy), v62 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v73 (copy), v90 (copy), v108 (copy), v125 (copy)
    if v18() then
        v30.resetHumanoidDescriptionProperties(v261);
    else
        for _, v264 in v9.AssetTypeIdStringToHumanoidDescriptionProp do
            v261[v264] = "";
        end;
    end;
    v261:SetAccessories({}, true);
    local l_TryOnItems_1 = v260.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local l_LookType_0 = v260.AvatarExperience.AvatarScene.OutfitTryOn.LookType;
    local v267 = {};
    local v268 = v11.sortOutfitTryOnItemsByRecency(l_TryOnItems_1, false);
    if l_FFlagAXMakeupEquipping_0 then
        local v269 = {};
        for _, v271 in l_TryOnItems_1 do
            if v271.selectedInTryOnManager and v271.itemType == v9.ItemType.Asset then
                local l_itemSubType_1 = v271.itemSubType;
                if l_isMakeupAssetType_0(l_itemSubType_1) then
                    if not v269[l_itemSubType_1] then
                        v269[l_itemSubType_1] = {};
                    end;
                    v269[l_itemSubType_1][v271.itemId] = v271;
                end;
            end;
        end;
        l_setMakeupDescriptions_0(v261, v269);
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        local v273 = {};
        if v262 then
            for _, v275 in v262 do
                v273[v275.itemId] = true;
            end;
        end;
        local v276 = {};
        local v277 = {};
        for _, v279 in v268 do
            if v279.selectedInTryOnManager ~= false and (not v262 or v273[v279.itemId]) then
                if v279.itemType == v9.ItemType.Asset then
                    table.insert(v277, (v168(v279, v260)));
                elseif v279.itemType == v9.ItemType.Bundle then
                    for _, v281 in (v188(v279, v260)) do
                        table.insert(v277, v281);
                    end;
                end;
            end;
        end;
        local v282 = v17.buildEquippedAssetMapByHumanoidDescriptionProp(v260);
        v276 = v62(v261, v276, v277, v282);
        v30.tryApplyClassicHeadShapeTryOn(v260, v261);
        local v283 = {};
        for _, v285 in v276 do
            for _, v287 in v285 do
                table.insert(v283, v287);
            end;
        end;
        v261:SetAccessories(v283, true);
        return;
    else
        for _, v289 in v268 do
            if v289.selectedInTryOnManager or l_LookType_0 == v9.LookType.Avatar and (not l_FFlagAXCatalogMakeupSupport_0 or l_LookType_0 == v9.LookType.Makeup) then
                if v289.itemType == v9.ItemType.Asset then
                    v73(v260, v289, v289.itemId, v267, v261);
                elseif v289.itemType == v9.ItemType.Bundle then
                    local v290 = v11.getBundleInfoFromState(v260, v289.itemId);
                    local v291 = v11.getOutfitInfoFromBundleId(v260, v289.itemId);
                    if v291 then
                        v90(v260, v291, v289, v267, v261);
                    elseif v289.bundleInfo ~= nil and (l_LookType_0 == v9.LookType.Avatar or l_FFlagAXCatalogMakeupSupport_0 and l_LookType_0 == v9.LookType.Makeup) then
                        v108(v260, v289, v267, v261);
                    elseif v290 then
                        v125(v260, v289, v290, v267);
                    end;
                end;
            end;
        end;
        v30.tryApplyClassicHeadShapeTryOn(v260, v261);
        v261:SetAccessories(v267, true);
        return;
    end;
end;
v30.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn = function(v292, v293) --[[ Line: 1095 ]]
    -- upvalues: v30 (copy), v4 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v9 (copy), v17 (copy), v158 (copy), v163 (copy), l_FFlagEnableHeadShapeForCharacterManager_0 (copy)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    v30.updateHumanoidDescriptionUsingOutfitTryOn(v292, l_HumanoidDescription_0, v293);
    local v295 = v4.getHumanoidDescriptionFromState(v292.AvatarExperience):Clone();
    local l_LookId_1 = v292.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    if l_FFlagAXMISEnableMultiShopping_0 then
        l_LookId_1 = v292.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems;
    end;
    if l_LookId_1 then
        v295:SetAccessories({}, true);
        v295.GraphicTShirt = 0;
        v295.Shirt = 0;
        v295.Pants = 0;
    end;
    for v297, v298 in v9.AssetTypeIdStringToHumanoidDescriptionProp do
        if v9.AssetTypeIdToCategory[v297] == v9.AssetCategories.Body and v17.shouldUnequipBodyBeforeTryOn(v292) then
            v295[v298] = 0;
        end;
        if not v9.AssetTypeIdToAccessoryTypeEnum[v297] then
            local v299 = l_HumanoidDescription_0[v298];
            local v300 = true;
            if v299 ~= "" then
                v300 = v299 == 0;
            end;
            if not v300 then
                v295[v298] = l_HumanoidDescription_0[v298];
            end;
        end;
    end;
    v158(v292, v295, l_HumanoidDescription_0);
    local v301 = v163(v292);
    if v301 then
        for v302, v303 in v301.scales do
            v295[v9.HumanoidDescriptionScaleToName[v302]] = v303;
        end;
        v4.setHumanoidDescriptionColorsFromBodyColor3s(v295, v301.bodyColor3s);
    end;
    v30.setAvatarTryOnProperties(v295, v292);
    if l_FFlagEnableHeadShapeForCharacterManager_0 then
        v30.applyHeadShapeToHumanoidDescription(v295, v292);
    end;
    return v295;
end;
if l_FFlagAXMISEnableMultiShopping_0 then
    v30.getBundleOutfitInfoFromProvidedTryOns = function(v304, v305) --[[ Line: 1172 ]]
        -- upvalues: v9 (copy), v11 (copy)
        for _, v307 in v305 do
            if v307.itemType == v9.ItemType.Bundle and v307.itemSubType == v9.BundleTypeIdStrings.BodyParts then
                local v308 = v11.getOutfitInfoFromBundleId(v304, v307.itemId);
                if v308 then
                    return v308;
                end;
            end;
        end;
        return nil;
    end;
end;
return v30;