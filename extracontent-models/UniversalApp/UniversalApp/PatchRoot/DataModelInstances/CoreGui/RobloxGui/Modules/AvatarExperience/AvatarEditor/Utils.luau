local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.mutedError);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = require(l_Modules_0.AvatarExperience.ColorPicker.ColorPickerUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarExperience);
local v17 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_setMakeupDescriptions_0 = v17.Utils.setMakeupDescriptions;
local l_isMakeupAssetType_0 = v17.Utils.isMakeupAssetType;
local l_isLayeredClothingAssetType_0 = v17.Utils.isLayeredClothingAssetType;
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarEditorServiceCreateOutfitSupportsGears);
local l_FFlagAXEditorSubcategoryFilters_0 = v5.FFlagAXEditorSubcategoryFilters;
local v23 = {};
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip);
local v25 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCheckOnOutfitAssets);
local v26 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXSimplifyOutfitEquipCheck);
local l_FFlagAXInventoryDurablesSupport_0 = v5.FFlagAXInventoryDurablesSupport;
local l_FFlagAXMakeupEquipping_0 = v5.FFlagAXMakeupEquipping;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v5.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagAXCustomizeMakeupSupport_0 = v5.FFlagAXCustomizeMakeupSupport;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v5.FFlagHeadRefinementFacialAnimationToggle;
v23.ReverseKeyValuePairs = l_memoize_0(function(v32) --[[ Line: 52 ]]
    local v33 = {};
    for _, v35 in v32 do
        if not v33[v35] then
            v33[v35] = 0;
        end;
    end;
    return v33;
end);
v23.Contains = function(v36, v37) --[[ Line: 70 ]]
    -- upvalues: v23 (copy)
    if v23.ReverseKeyValuePairs(v36)[v37] then
        return true;
    else
        return false;
    end;
end;
v23.isFullyQualifiedOutfit = function(v38) --[[ Line: 87 ]] --[[ Name: isFullyQualifiedOutfit ]]
    -- upvalues: v10 (copy), v25 (copy)
    local v39 = {
        Torso = v10.AssetTypeIdStrings.Torso, 
        RightArm = v10.AssetTypeIdStrings.RightArm, 
        LeftArm = v10.AssetTypeIdStrings.LeftArm, 
        LeftLeg = v10.AssetTypeIdStrings.LeftLeg, 
        RightLeg = v10.AssetTypeIdStrings.RightLeg
    };
    if v25 and not v38 then
        return false;
    else
        for _, v41 in v39 do
            if not v38[v41] then
                return false;
            end;
        end;
        for v42, _ in v38 do
            if v10.AssetTypeIdToAccessoryTypeEnum[v42] ~= Enum.AccessoryType.Hair and (v10.AssetTypeIdToAccessoryTypeEnum[v42] or v42 == v10.AssetTypeIdStrings.Gear) then
                return true;
            end;
        end;
        return false;
    end;
end;
v23.isWearingDynamicHeadOutfit = function(v44, v45) --[[ Line: 122 ]] --[[ Name: isWearingDynamicHeadOutfit ]]
    -- upvalues: v23 (copy), v10 (copy)
    local v46 = v23.getEquippedAssetIds(v44.assets);
    if not v45 then
        return false;
    else
        for v47, _ in v44.assets do
            if not v45[v47] then
                return false;
            else
                local v49 = next(v45[v47]);
                if next(v44.assets[v47]) then
                    local v50 = false;
                    for _, v52 in v46 do
                        if v52 == v49 then
                            v50 = true;
                        end;
                    end;
                    if not v50 then
                        return false;
                    end;
                end;
            end;
        end;
        if not v44.assets[v10.AssetTypeIdStrings.DynamicHead] then
            return false;
        else
            return true;
        end;
    end;
end;
v23.getAssetMetadata = function(v53, v54) --[[ Line: 163 ]] --[[ Name: getAssetMetadata ]]
    -- upvalues: l_FFlagAXInventoryDurablesSupport_0 (copy)
    for _, v56 in v54 do
        for v57, v58 in v56 do
            if v53 == v57 then
                if l_FFlagAXInventoryDurablesSupport_0 then
                    local v59 = table.clone(v58);
                    v59.availabilityStatus = nil;
                    return v59;
                else
                    return v58;
                end;
            end;
        end;
    end;
    return nil;
end;
v23.isSameAssetMetadata = function(v60, v61) --[[ Line: 180 ]] --[[ Name: isSameAssetMetadata ]]
    -- upvalues: v2 (copy), v11 (copy)
    if v60 == nil and v61 == nil then
        return true;
    elseif v60 == nil or v61 == nil then
        return false;
    else
        local v62 = v2.Dictionary.keys(v60);
        local v63 = v2.Dictionary.keys(v61);
        if #v62 ~= #v63 then
            return false;
        else
            for v64, v65 in v60 do
                local v66 = v61[v64];
                if typeof(v65) == "Vector3" and typeof(v66) == "Vector3" then
                    if not (v11.fuzzyEq(v65.X, v66.X) and v11.fuzzyEq(v65.Y, v66.Y) and v11.fuzzyEq(v65.Z, v66.Z)) then
                        return false;
                    end;
                elseif v65 ~= v66 then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v23.removeEmoteAnimationAsset = function(v67) --[[ Line: 211 ]] --[[ Name: removeEmoteAnimationAsset ]]
    -- upvalues: v10 (copy), v2 (copy)
    if not v67[v10.AssetTypeIdStrings.EmoteAnimation] then
        return v67;
    else
        return v2.Dictionary.join(v67, {
            [v10.AssetTypeIdStrings.EmoteAnimation] = v2.None
        });
    end;
end;
v23.getEquippedAssetIds = function(v68) --[[ Line: 221 ]] --[[ Name: getEquippedAssetIds ]]
    -- upvalues: v10 (copy)
    local v69 = {};
    if not v68 then
        return v69;
    else
        for _, v71 in v10.AssetTypeIdStrings do
            local v72 = v68[v71];
            if v72 then
                for v73, _ in v72 do
                    table.insert(v69, v73);
                end;
            end;
        end;
        return v69;
    end;
end;
v23.getEquippedAssetIdsForType = function(v75, v76) --[[ Line: 240 ]] --[[ Name: getEquippedAssetIdsForType ]]
    local v77 = {};
    if not v75 then
        return v77;
    else
        local v78 = v75[v76];
        if v78 then
            for v79, _ in v78 do
                table.insert(v77, v79);
            end;
        end;
        return v77;
    end;
end;
v23.getEquippedAssetIdsForCategory = function(v81, v82) --[[ Line: 257 ]] --[[ Name: getEquippedAssetIdsForCategory ]]
    -- upvalues: v23 (copy)
    local v83 = {};
    if not v82.AssetTypeIdStrings then
        return v83;
    else
        for _, v85 in v82.AssetTypeIdStrings do
            for _, v87 in (v23.getEquippedAssetIdsForType(v81, v85)) do
                v83[#v83 + 1] = v87;
            end;
        end;
        return v83;
    end;
end;
v23.isAssetEquipped = function(v88, v89, v90) --[[ Line: 273 ]] --[[ Name: isAssetEquipped ]]
    if v90 then
        local v91 = v90[v89];
        if v91 == nil or not next(v91) then
            return false;
        elseif v91[v88] then
            return true;
        end;
    end;
    return false;
end;
v23.isPresetOutfit = function(v92) --[[ Line: 288 ]] --[[ Name: isPresetOutfit ]]
    return not v92.isEditable;
end;
v23.isDuplicateOutfitName = function(v93, v94, v95) --[[ Line: 292 ]] --[[ Name: isDuplicateOutfitName ]]
    -- upvalues: v9 (copy)
    local v96 = string.lower(utf8.nfdnormalize(v95));
    local v97 = v93[v9.EditableCharacterKey] or {};
    for _, v99 in v97 do
        local v100 = tostring(v99);
        if v94[v100] and string.lower(utf8.nfdnormalize(v94[v100].name)) == v96 then
            return true;
        end;
    end;
    return false;
end;
local _ = function(v101, v102) --[[ Line: 314 ]] --[[ Name: diffListTruncated ]]
    -- upvalues: v2 (copy)
    local v103 = v2.List.toSet(v102);
    return (v2.List.filter(v101, function(v104, _) --[[ Line: 316 ]]
        -- upvalues: v103 (copy)
        return not v103[v104];
    end));
end;
v23.diffList = function(v107, v108) --[[ Line: 323 ]] --[[ Name: diffList ]]
    -- upvalues: v2 (copy)
    local v109 = v2.List.toSet(v108);
    local l_v109_0 = v109 --[[ copy: 3 -> 5 ]];
    local v113 = v2.List.filter(v107, function(v111, _) --[[ Line: 316 ]]
        -- upvalues: l_v109_0 (copy)
        return not l_v109_0[v111];
    end);
    local v114 = v2.List.toSet(v107);
    v109 = v2.List.filter(v108, function(v115, _) --[[ Line: 316 ]]
        -- upvalues: v114 (copy)
        return not v114[v115];
    end);
    return (v2.List.join(v113, v109));
end;
v23.getEquippedDiffs = function(v117, v118) --[[ Line: 330 ]] --[[ Name: getEquippedDiffs ]]
    -- upvalues: v23 (copy)
    local v119 = {};
    for v120, _ in v118 do
        local v122 = v23.getEquippedAssetIdsForType(v118, v120);
        local v123 = v23.getEquippedAssetIdsForType(v117, v120);
        if next(v123) then
            local v124 = v23.diffList(v122, v123);
            if next(v124) ~= nil then
                v119[v120] = v124;
            end;
        elseif next(v122) then
            v119[v120] = v122;
        end;
    end;
    for v125, _ in v117 do
        local v127 = v23.getEquippedAssetIdsForType(v117, v125);
        local v128 = v23.getEquippedAssetIdsForType(v118, v125);
        if next(v128) then
            local v129 = v23.diffList(v127, v128);
            if next(v129) ~= nil then
                v119[v125] = v129;
            end;
        elseif next(v127) then
            v119[v125] = v127;
        end;
    end;
    return v119;
end;
v23.isDynamicHeadEquipped = function(v130) --[[ Line: 362 ]] --[[ Name: isDynamicHeadEquipped ]]
    -- upvalues: v2 (copy), v23 (copy), v10 (copy)
    return not v2.isEmpty(v23.getEquippedAssetIdsForType(v130, v10.AssetTypeIdStrings.DynamicHead));
end;
v23.isClassicHeadEquipped = function(v131) --[[ Line: 368 ]] --[[ Name: isClassicHeadEquipped ]]
    -- upvalues: v2 (copy), v23 (copy), v10 (copy)
    return not v2.isEmpty(v23.getEquippedAssetIdsForType(v131, v10.AssetTypeIdStrings.Head));
end;
v23.hasWrapLayer = function(v132) --[[ Line: 374 ]]
    if not v132 then
        return false;
    else
        return v132:FindFirstChildWhichIsA("WrapLayer", true) ~= nil;
    end;
end;
v23.hasLayeredAssetsEquipped = l_memoize_0(function(v133) --[[ Line: 381 ]]
    if not v133 then
        return false;
    else
        for _, v135 in v133 do
            for _, v137 in v135 do
                if v137.isLayered then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end);
v23.setHumanoidDescriptionColorsFromBodyColor3s = function(v138, v139) --[[ Line: 396 ]] --[[ Name: setHumanoidDescriptionColorsFromBodyColor3s ]]
    -- upvalues: v10 (copy)
    if v139 then
        for v140, v141 in v139 do
            v138[v10.BodyPartForSkinColoringIdToHumanoidDescription[v140]] = v141;
        end;
    end;
end;
v23.setHumanoidDescriptionColorsFromCharacter = function(v142, v143) --[[ Line: 409 ]] --[[ Name: setHumanoidDescriptionColorsFromCharacter ]]
    -- upvalues: v23 (copy)
    v23.setHumanoidDescriptionColorsFromBodyColor3s(v142, v143.AvatarEditor.Character.BodyColor3s);
end;
v23.getGearAssetIdFromState = function(v144) --[[ Line: 419 ]] --[[ Name: getGearAssetIdFromState ]]
    -- upvalues: v21 (copy), v23 (copy), v10 (copy)
    if not v21() then
        return 0;
    else
        local l_EquippedAssets_0 = v144.AvatarEditor.Character.EquippedAssets;
        if l_EquippedAssets_0 == nil then
            return 0;
        else
            local v146 = v23.getEquippedAssetIdsForType(l_EquippedAssets_0, v10.AssetTypeIdStrings.Gear);
            local _, v148 = next(v146);
            if v148 then
                return (tonumber(v148));
            else
                return 0;
            end;
        end;
    end;
end;
v23.getHumanoidDescriptionFromState = function(v149) --[[ Line: 438 ]] --[[ Name: getHumanoidDescriptionFromState ]]
    -- upvalues: v10 (copy), v11 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupAssetType_0 (copy), v7 (copy), l_setMakeupDescriptions_0 (copy), v23 (copy)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    local l_EquippedAssets_1 = v149.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_0 = v149.AvatarEditor.Character.AvatarScales;
    local v153 = nil;
    if l_EquippedAssets_1 then
        local v154 = {};
        for v155, v156 in l_EquippedAssets_1 do
            local v157 = {};
            local v158 = v10.AssetTypeIdToAccessoryTypeEnum[v155];
            for v159, v160 in v156 do
                if v158 then
                    table.insert(v154, v11.createHumanoidDescriptionAccessoryInfo(v155, v159, v160));
                else
                    table.insert(v157, v159);
                end;
            end;
            if v158 == nil and #v157 > 0 then
                local v161 = v10.AssetTypeIdStringToHumanoidDescriptionProp[v155];
                local v162 = table.concat(v157, ",");
                if v161 then
                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v10.BodyPartNameToEnum[v161] then
                        local l_BodyPartDescription_0 = Instance.new("BodyPartDescription");
                        l_BodyPartDescription_0.AssetId = v162;
                        l_BodyPartDescription_0.Parent = l_HumanoidDescription_0;
                        l_BodyPartDescription_0.BodyPart = v10.BodyPartNameToEnum[v161];
                        if v155 == v10.AssetTypeIdStrings.DynamicHead then
                            local v164 = nil;
                            for _, v166 in v157 do
                                local v167 = v156[v166];
                                if l_FFlagHeadRefinementFacialAnimationToggle_0 and v167 and v167.staticFacialAnimation ~= nil then
                                    v153 = v167.staticFacialAnimation;
                                end;
                                if v167 and v167.headShape then
                                    v164 = if v167.headShape == "Default" then nil else v167.headShape;
                                    break;
                                end;
                            end;
                            if v164 then
                                l_BodyPartDescription_0.HeadShape = v164;
                            end;
                        end;
                    else
                        l_HumanoidDescription_0[v161] = v162;
                    end;
                elseif v155 ~= v10.AssetTypeIdStrings.Gear and (not l_FFlagAXMakeupEquipping_0 or not l_isMakeupAssetType_0(v155)) then
                    v7(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(v155))));
                end;
            end;
        end;
        l_HumanoidDescription_0:SetAccessories(v154, true);
        if l_FFlagAXMakeupEquipping_0 then
            l_setMakeupDescriptions_0(l_HumanoidDescription_0, l_EquippedAssets_1);
        end;
        if l_FFlagHeadRefinementFacialAnimationToggle_0 and v153 ~= nil then
            l_HumanoidDescription_0[v10.StaticFacialAnimation] = v153;
        end;
    end;
    if l_AvatarScales_0 then
        for v168, v169 in l_AvatarScales_0 do
            l_HumanoidDescription_0[v10.HumanoidDescriptionScaleToName[v168]] = v169;
        end;
    end;
    v23.setHumanoidDescriptionColorsFromCharacter(l_HumanoidDescription_0, v149);
    local v170 = {};
    local v171 = {};
    for _, v173 in v149.AvatarEditor.EquippedEmotes.slotInfo do
        v170[tostring(v173.assetId)] = {
            (tonumber(v173.assetId))
        };
        table.insert(v171, {
            Slot = v173.position, 
            Name = tostring(v173.assetId)
        });
    end;
    l_HumanoidDescription_0:SetEmotes(v170);
    l_HumanoidDescription_0:SetEquippedEmotes(v171);
    return l_HumanoidDescription_0;
end;
v23.getHumanoidDescriptionFromOutfitInfo = function(v174) --[[ Line: 547 ]] --[[ Name: getHumanoidDescriptionFromOutfitInfo ]]
    -- upvalues: v10 (copy), v11 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupAssetType_0 (copy), v7 (copy), l_setMakeupDescriptions_0 (copy), v23 (copy)
    local l_HumanoidDescription_1 = Instance.new("HumanoidDescription");
    local l_assets_0 = v174.assets;
    local l_scales_0 = v174.scales;
    if l_assets_0 then
        local v178 = {};
        for v179, v180 in l_assets_0 do
            local v181 = {};
            local v182 = v10.AssetTypeIdToAccessoryTypeEnum[v179];
            for v183, v184 in v180 do
                if v182 then
                    table.insert(v178, v11.createHumanoidDescriptionAccessoryInfo(v179, v183, v184));
                else
                    table.insert(v181, v183);
                end;
            end;
            if v182 == nil and #v181 > 0 then
                local v185 = v10.AssetTypeIdStringToHumanoidDescriptionProp[v179];
                local v186 = table.concat(v181, ",");
                if v185 then
                    l_HumanoidDescription_1[v185] = v186;
                elseif v179 ~= v10.AssetTypeIdStrings.Gear and (not l_FFlagAXMakeupEquipping_0 or not l_isMakeupAssetType_0(v179)) then
                    v7(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(v179))));
                end;
            end;
        end;
        l_HumanoidDescription_1:SetAccessories(v178, true);
        if l_FFlagAXMakeupEquipping_0 then
            l_setMakeupDescriptions_0(l_HumanoidDescription_1, l_assets_0);
        end;
    end;
    if l_scales_0 then
        for v187, v188 in l_scales_0 do
            l_HumanoidDescription_1[v10.HumanoidDescriptionScaleToName[v187]] = v188;
        end;
    end;
    v23.setHumanoidDescriptionColorsFromBodyColor3s(l_HumanoidDescription_1, v174.bodyColor3s);
    return l_HumanoidDescription_1;
end;
v23.shouldNotifyAssetTypes = function(v189, v190) --[[ Line: 609 ]] --[[ Name: shouldNotifyAssetTypes ]]
    for _, v192 in v189 do
        if v190[v192] == true then
            return true;
        end;
    end;
    return false;
end;
v23.shouldNotifyBundleTypes = function(v193, v194) --[[ Line: 622 ]] --[[ Name: shouldNotifyBundleTypes ]]
    -- upvalues: v10 (copy)
    for _, v196 in v193 do
        if v194[v10.BundleTypeIdStringToOutfitType[v196]] == true then
            return true;
        end;
    end;
    return false;
end;
v23.shouldNotifyCategory = function(v197, v198) --[[ Line: 636 ]] --[[ Name: shouldNotifyCategory ]]
    -- upvalues: v23 (copy)
    local l_AssetTypeIdStrings_0 = v197.AssetTypeIdStrings;
    local l_BundleTypeIdStrings_0 = v197.BundleTypeIdStrings;
    local l_Subcategories_0 = v197.Subcategories;
    local l_SubcategoryFilters_0 = v197.SubcategoryFilters;
    if l_AssetTypeIdStrings_0 and v23.shouldNotifyAssetTypes(l_AssetTypeIdStrings_0, v198) then
        return true;
    elseif l_BundleTypeIdStrings_0 and v23.shouldNotifyBundleTypes(l_BundleTypeIdStrings_0, v198) then
        return true;
    else
        if l_Subcategories_0 then
            for _, v204 in l_Subcategories_0 do
                if v23.shouldNotifyCategory(v204, v198) then
                    return true;
                end;
            end;
        elseif l_SubcategoryFilters_0 then
            for _, v206 in l_SubcategoryFilters_0 do
                if v23.shouldNotifyCategory(v206, v198) then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
v23.getNotificationItemTypesForCategory = function(v207, v208) --[[ Line: 668 ]] --[[ Name: getNotificationItemTypesForCategory ]]
    -- upvalues: v10 (copy), v23 (copy), v2 (copy)
    local v209 = {};
    local l_AssetTypeIdStrings_1 = v207.AssetTypeIdStrings;
    local l_BundleTypeIdStrings_1 = v207.BundleTypeIdStrings;
    local l_Subcategories_1 = v207.Subcategories;
    local l_SubcategoryFilters_1 = v207.SubcategoryFilters;
    if l_AssetTypeIdStrings_1 then
        for _, v215 in l_AssetTypeIdStrings_1 do
            if v208[v215] then
                v209[v215] = true;
            end;
        end;
    end;
    if l_BundleTypeIdStrings_1 then
        for _, v217 in l_BundleTypeIdStrings_1 do
            local v218 = v10.BundleTypeIdStringToOutfitType[v217];
            if v208[v218] then
                v209[v218] = true;
            end;
        end;
    end;
    if l_Subcategories_1 then
        for _, v220 in l_Subcategories_1 do
            for _, v222 in v23.getNotificationItemTypesForCategory(v220, v208) do
                v209[v222] = true;
            end;
        end;
    end;
    if l_SubcategoryFilters_1 then
        for _, v224 in l_SubcategoryFilters_1 do
            for _, v226 in v23.getNotificationItemTypesForCategory(v224, v208) do
                v209[v226] = true;
            end;
        end;
    end;
    return v2.Dictionary.keys(v209);
end;
v23.doAESCallAndAwaitResult = function(v227, v228, v229, ...) --[[ Line: 713 ]] --[[ Name: doAESCallAndAwaitResult ]]
    local v230 = v228(v227, ...);
    while not v230 do
        v229:Wait();
        v230 = v228(v227, ...);
    end;
    return v229:Wait();
end;
v23.getColor3AtValueInRange = l_memoize_0(function(v231, v232) --[[ Line: 724 ]]
    -- upvalues: v12 (copy), v7 (copy)
    local v233, v234 = v12.clampBetween0And1(v232);
    if v234 then
        v7(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(v232))));
    end;
    v232 = v233;
    if v232 == 0 then
        return v231[1];
    elseif v232 == 1 then
        return v231[#v231];
    else
        local v235 = v232 * (#v231 - 1);
        local v236 = math.floor(v235 + 1);
        local v237 = v235 + 1 - v236;
        return v231[v236]:Lerp(v231[v236 + 1], v237);
    end;
end);
local function v247(v238, v239, v240) --[[ Line: 755 ]]
    local v241 = Vector3.new(v238.R, v238.G, v238.B);
    local v242 = Vector3.new(v239.R, v239.G, v239.B);
    local v243 = Vector3.new(v240.R, v240.G, v240.B);
    local v244 = v242 - v241;
    local v245 = v243 - v241;
    if v245:Dot(v244) <= 0 then
        return v245.Magnitude, 0;
    else
        local v246 = v243 - v242;
        if v246:Dot(v244) >= 0 then
            return v246.Magnitude, 1;
        else
            return v244:Cross(v245).Magnitude / v245.Magnitude, v244.Unit:Dot(v245) / v244.Magnitude;
        end;
    end;
end;
local function v257(v248, v249) --[[ Line: 800 ]]
    -- upvalues: v247 (copy)
    local v250 = 10;
    local v251 = 0;
    for v252 = 1, #v248 - 1 do
        local v253 = v248[v252];
        local v254 = v248[v252 + 1];
        local v255, v256 = v247(v253, v254, v249);
        if v255 < v250 then
            v250 = v255;
            v251 = (v252 - 1 + v256) / (#v248 - 1);
        end;
    end;
    return v250, v251;
end;
v23.findRangeAndSliderValueForColor3 = function(v258, v259) --[[ Line: 826 ]]
    -- upvalues: v257 (copy)
    local v260 = 10;
    local v261 = 0;
    local v262 = nil;
    for _, v264 in v259 do
        local v265, v266 = v257(v264.range, v258);
        if v265 < v260 then
            v260 = v265;
            v261 = v266;
            v262 = v264.rangeId;
        end;
    end;
    return v262, v261;
end;
v23.getRangeStructForRangeId = l_memoize_0(function(v267, v268) --[[ Line: 846 ]]
    for _, v270 in v268 do
        if v270.rangeId == v267 then
            return v270;
        end;
    end;
    return nil;
end);
v23.getColor3AtValueForRangeId = l_memoize_0(function(v271, v272, v273) --[[ Line: 857 ]]
    -- upvalues: v12 (copy), v7 (copy), v23 (copy)
    local v274, v275 = v12.clampBetween0And1(v272);
    if v275 then
        v7(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(v272))));
    end;
    v272 = v274;
    local v276 = v23.getRangeStructForRangeId(v271, v273);
    if v276 then
        return v23.getColor3AtValueInRange(v276.range, v272);
    else
        return nil;
    end;
end);
v23.getInfoForRangeIdAndBodyPartIndex = function(v277, v278, v279) --[[ Line: 881 ]]
    -- upvalues: v4 (copy), v9 (copy)
    v4.isNotNil(v277, "rangeId");
    v4.assert(v278 >= 1, "selectedBodyPartIndex too low");
    v4.assert(v278 <= #v9.BodyPartButtonData, "selectedBodyPartIndex too high");
    if v279 == nil or v279[v277] == nil then
        return nil;
    else
        local v280 = v279[v277];
        local l_bodyPartForSkinColoringIds_0 = v9.BodyPartButtonData[v278].bodyPartForSkinColoringIds;
        local v282 = nil;
        for _, v284 in l_bodyPartForSkinColoringIds_0 do
            if v280[v284] then
                if v282 == nil then
                    v282 = v280[v284];
                elseif v282.color3 ~= v280[v284].color3 then
                    return nil;
                end;
            end;
        end;
        return v282;
    end;
end;
v23.getColor3ForRangeIdAndBodyPartIndex = l_memoize_0(function(v285, v286, v287, v288) --[[ Line: 929 ]]
    -- upvalues: v4 (copy), v23 (copy)
    v4.isNotNil(v288, "defaultBodyColorRanges");
    local v289 = v23.getInfoForRangeIdAndBodyPartIndex(v285, v286, v287);
    if v289 then
        return v289.color3;
    else
        return v23.getColor3AtValueForRangeId(v285, 0.5, v288);
    end;
end);
v23.getSliderValueForRangeIdAndBodyPartIndex = l_memoize_0(function(v290, v291, v292) --[[ Line: 953 ]]
    -- upvalues: v23 (copy)
    local v293 = v23.getInfoForRangeIdAndBodyPartIndex(v290, v291, v292);
    if v293 then
        return v293.sliderValue;
    else
        return 0.5;
    end;
end);
v23.getBodyColorsSliderFrameHeight = function(v294, v295, v296, v297) --[[ Line: 977 ]] --[[ Name: getBodyColorsSliderFrameHeight ]]
    local v298 = v296 - math.max(v295, v297);
    if v294 < v298 then
        return v298;
    else
        return v294;
    end;
end;
v23.getSearchUuidAndAssetTypes = function(v299, v300, v301) --[[ Line: 993 ]]
    -- upvalues: l_FFlagAXEditorSubcategoryFilters_0 (copy)
    local _ = nil;
    local _ = nil;
    if v299.SubButtons then
        v300 = v300 or 1;
        local v304 = v299.SubButtons[v300];
        return v304.SearchUuid, v304.AssetTypeIdStrings;
    elseif l_FFlagAXEditorSubcategoryFilters_0 and v299.SubcategoryFilters then
        v301 = v301 or 1;
        local v305 = v299.SubcategoryFilters[v301] or v299.SubcategoryFilters[1];
        return v305.SearchUuid, v305.AssetTypeIdStrings;
    else
        return v299.SearchUuid, v299.AssetTypeIdStrings;
    end;
end;
v23.getCategoryIndicesFromAssetType = function(v306) --[[ Line: 1014 ]] --[[ Name: getCategoryIndicesFromAssetType ]]
    -- upvalues: v14 (copy)
    for v307, v308 in (v14()) do
        if v308.Subcategories then
            for v309, v310 in v308.Subcategories do
                if v310.AssetTypeIdStrings then
                    for _, v312 in v310.AssetTypeIdStrings do
                        if v306 == v312 then
                            return v307, v309;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
v23.findAvatarEditorCategory = function(v313, v314) --[[ Line: 1037 ]] --[[ Name: findAvatarEditorCategory ]]
    -- upvalues: v14 (copy)
    for v315, v316 in (v14()) do
        if v316.SearchUuid == v313 then
            for v317, v318 in v316.Subcategories do
                if v318.SearchUuid == v314 then
                    return v315, v317;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
v23.selectAssetTypeKey = function(v319) --[[ Line: 1051 ]]
    -- upvalues: l_FFlagAXEditorSubcategoryFilters_0 (copy), v11 (copy), v23 (copy)
    local l_category_0 = v319.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v319.AvatarExperience.AvatarEditor.Categories.subcategory;
    local l_subButton_0 = v319.AvatarExperience.AvatarEditor.Categories.subButton;
    local v323 = if l_FFlagAXEditorSubcategoryFilters_0 then v319.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil;
    local v324 = v11.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0);
    local v325, _ = v23.getSearchUuidAndAssetTypes(v324, l_subButton_0, if l_FFlagAXEditorSubcategoryFilters_0 then v323 else nil);
    return v325 or v324.Name;
end;
v23.getColor3SharedByBodyParts = l_memoize_0(function(v327, v328) --[[ Line: 1075 ]]
    local v329 = nil;
    for _, v331 in v327 do
        local v332 = v328[v331];
        if v329 == nil then
            v329 = v332;
        elseif v332 and v329:ToHex() ~= v332:ToHex() then
            return nil;
        end;
    end;
    return v329;
end);
v23.getRangeIdSharedByBodyParts = l_memoize_0(function(v333, v334) --[[ Line: 1102 ]]
    local v335 = nil;
    for _, v337 in v333 do
        local v338 = v334[v337];
        if v335 == nil then
            v335 = v338;
        elseif v335 ~= v338 then
            return nil;
        end;
    end;
    return v335;
end);
v23.ExponentialRepeat = function(v339, v340, v341) --[[ Line: 1132 ]]
    v341 = v341 or 6;
    local v342 = 1;
    while true do
        if v342 <= v341 and v339() then
            if v340() then
                return;
            else
                task.wait(v342 ^ 2);
                v342 = v342 + 1;
            end;
        else
            return;
        end;
    end;
end;
if l_FFlagAXCustomizeMakeupSupport_0 then
    v23.isWearingOutfitNoState = function(v343, v344, v345, v346, v347, _, _) --[[ Line: 1171 ]] --[[ Name: isWearingOutfitNoState ]]
        -- upvalues: v10 (copy), v23 (copy), v3 (copy), l_isMakeupAssetType_0 (copy), v2 (copy), l_isLayeredClothingAssetType_0 (copy)
        if v343.outfitType == v10.OutfitTypes.DynamicHead then
            return v23.isWearingDynamicHeadOutfit(v343, v346);
        else
            local v350 = v23.removeEmoteAnimationAsset(v343.assets);
            local v351 = v343.outfitType == v10.OutfitTypes.Avatar and v343.isEditable or v23.isFullyQualifiedOutfit(v343.assets);
            if v351 then
                for v352, v353 in v347 do
                    if v343.scales[v352] ~= v353 then
                        return false;
                    end;
                end;
                if v343.avatarType ~= v344 then
                    return false;
                elseif not v23.isPresetOutfit(v343) then
                    for v354, v355 in v345 do
                        if not v343.bodyColor3s then
                            return false;
                        elseif v343.bodyColor3s[v354]:ToHex() ~= v355:ToHex() then
                            return false;
                        end;
                    end;
                end;
            end;
            local v356 = {};
            local v357 = {};
            for v358, v359 in v350 do
                if not v346[v358] then
                    return false;
                else
                    for v360, v361 in v359 do
                        if not v346[v358][v360] or not v23.isSameAssetMetadata(v3.omit(v361, {
                            "order", 
                            "availabilityStatus"
                        }), v3.omit(v346[v358][v360], {
                            "order", 
                            "availabilityStatus"
                        })) then
                            return false;
                        elseif l_isMakeupAssetType_0(v358) then
                            if v361.order ~= nil then
                                table.insert(v357, v2.Dictionary.join(v361, {
                                    assetId = v360, 
                                    assetTypeId = v358
                                }));
                            end;
                        elseif l_isLayeredClothingAssetType_0(v358) and v361.order ~= nil then
                            table.insert(v356, v2.Dictionary.join(v361, {
                                assetId = v360, 
                                assetTypeId = v358
                            }));
                        end;
                    end;
                end;
            end;
            local v362 = {
                [v10.AssetTypeIdStrings.EyebrowAccessory] = true, 
                [v10.AssetTypeIdStrings.EyelashAccessory] = true, 
                [v10.AssetTypeIdStrings.FaceMakeup] = true, 
                [v10.AssetTypeIdStrings.EyeMakeup] = true, 
                [v10.AssetTypeIdStrings.LipMakeup] = true
            };
            if v351 or v343.outfitType == v10.OutfitTypes.Makeup then
                for v363, v364 in v346 do
                    if v343.outfitType ~= v10.OutfitTypes.Makeup or v362[v363] then
                        if v350[v363] == nil then
                            return false;
                        else
                            for v365, _ in v364 do
                                if v350[v363][v365] == nil then
                                    return false;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            local function v369(v367, v368) --[[ Line: 1291 ]] --[[ Name: sortByOrder ]]
                return v367.order < v368.order;
            end;
            table.sort(v356, v369);
            table.sort(v357, v369);
            local v370 = nil;
            for _, v372 in v356 do
                if v370 == nil then
                    v370 = v346[v372.assetTypeId][v372.assetId].order;
                elseif v346[v372.assetTypeId][v372.assetId].order < v370 then
                    return false;
                else
                    v370 = v346[v372.assetTypeId][v372.assetId].order;
                end;
            end;
            local v373 = nil;
            for _, v375 in v357 do
                if v373 == nil then
                    v373 = v346[v375.assetTypeId][v375.assetId].order;
                elseif v346[v375.assetTypeId][v375.assetId].order < v373 then
                    return false;
                else
                    v373 = v346[v375.assetTypeId][v375.assetId].order;
                end;
            end;
            return true;
        end;
    end;
elseif v26() then
    v23.isWearingOutfitNoState = function(v376, _, _, v379, _, v381, v382) --[[ Line: 1338 ]] --[[ Name: isWearingOutfitNoState ]]
        -- upvalues: v23 (copy), v10 (copy), v26 (copy), v24 (copy)
        local v383 = v23.removeEmoteAnimationAsset(v376.assets);
        if v376.outfitType == v10.OutfitTypes.DynamicHead then
            return v23.isWearingDynamicHeadOutfit(v376, v379);
        else
            local v384 = v23.getEquippedAssetIds(v383);
            local v385 = v23.getEquippedAssetIds(v379);
            if v26() or #v384 ~= #v385 then
                for _, v387 in v384 do
                    if not v23.Contains(v385, v387) then
                        return false;
                    end;
                end;
                if v382 then
                    for _, v389 in v385 do
                        if not v23.Contains(v384, v389) then
                            return false;
                        end;
                    end;
                end;
                if v24() and v381 and v23.isFullyQualifiedOutfit(v383) then
                    return true;
                end;
            end;
            return true;
        end;
    end;
else
    v23.isWearingOutfitNoState = function(v390, v391, v392, v393, v394, v395, _) --[[ Line: 1396 ]] --[[ Name: isWearingOutfitNoState ]]
        -- upvalues: v23 (copy), v10 (copy), v24 (copy)
        local v397 = v23.removeEmoteAnimationAsset(v390.assets);
        if v390.outfitType == v10.OutfitTypes.DynamicHead then
            return v23.isWearingDynamicHeadOutfit(v390, v393);
        else
            local v398 = v23.getEquippedAssetIds(v397);
            local v399 = v23.getEquippedAssetIds(v393);
            if #v398 ~= #v399 then
                if v24() and v395 and not v23.isFullyQualifiedOutfit(v397) then
                    for _, v401 in v398 do
                        if not table.find(v399, v401) then
                            return false;
                        end;
                    end;
                    return true;
                else
                    return false;
                end;
            else
                for _, v403 in v398 do
                    local v404 = false;
                    for _, v406 in v399 do
                        if v403 == v406 then
                            local v407 = v23.getAssetMetadata(v403, v397);
                            local v408 = v23.getAssetMetadata(v406, v393);
                            if v23.isSameAssetMetadata(v407, v408) then
                                v404 = true;
                            end;
                        end;
                    end;
                    if not v404 then
                        return false;
                    end;
                end;
                if not v23.isPresetOutfit(v390) then
                    for v409, v410 in v392 do
                        if not v390.bodyColor3s then
                            return false;
                        elseif v390.bodyColor3s[v409]:ToHex() ~= v410:ToHex() then
                            return false;
                        end;
                    end;
                end;
                for v411, v412 in v394 do
                    if v390.scales[v411] ~= v412 then
                        return false;
                    end;
                end;
                if v390.avatarType ~= v391 then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
end;
v23.isWearingOutfit = function(v413, v414) --[[ Line: 1475 ]] --[[ Name: isWearingOutfit ]]
    -- upvalues: v23 (copy)
    local l_AvatarType_0 = v413.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_BodyColor3s_0 = v413.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    local l_EquippedAssets_2 = v413.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_1 = v413.AvatarExperience.AvatarEditor.Character.AvatarScales;
    return v23.isWearingOutfitNoState(v414, l_AvatarType_0, l_BodyColor3s_0, l_EquippedAssets_2, l_AvatarScales_1);
end;
v23.filterOutfitAssetsWithStatus = function(v419, v420) --[[ Line: 1484 ]] --[[ Name: filterOutfitAssetsWithStatus ]]
    -- upvalues: v2 (copy)
    local v421 = {};
    if v419.assets then
        for v422, v423 in v419.assets do
            if v423 then
                v421[v422] = {};
                for v424, v425 in v423 do
                    if typeof(v420) == "table" then
                        if not table.find(v420, v425.availabilityStatus) then
                            v421[v422][v424] = v425;
                        end;
                    elseif v425 and v425.availabilityStatus ~= v420 then
                        v421[v422][v424] = v425;
                    end;
                end;
            end;
            if next(v421[v422]) == nil then
                v421[v422] = nil;
            end;
        end;
    end;
    return v2.Dictionary.join(v419, {
        assets = v421
    });
end;
v23.hasMakeup = function(v426) --[[ Line: 1519 ]] --[[ Name: hasMakeup ]]
    -- upvalues: l_isMakeupAssetType_0 (copy)
    if not v426 then
        return false;
    else
        for v427, _ in v426 do
            if l_isMakeupAssetType_0(v427) then
                return true;
            end;
        end;
        return false;
    end;
end;
return v23;