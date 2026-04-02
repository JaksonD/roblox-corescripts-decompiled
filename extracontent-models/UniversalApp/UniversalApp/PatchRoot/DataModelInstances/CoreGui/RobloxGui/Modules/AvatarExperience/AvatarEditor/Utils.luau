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
local l_FFlagAXFixOutfitEquipCheckEmptyArray_0 = v5.FFlagAXFixOutfitEquipCheckEmptyArray;
local v24 = {};
local v25 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip);
local v26 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCheckOnOutfitAssets);
local v27 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXSimplifyOutfitEquipCheck);
local l_FFlagAXInventoryDurablesSupport_0 = v5.FFlagAXInventoryDurablesSupport;
local l_FFlagAXMakeupEquipping_0 = v5.FFlagAXMakeupEquipping;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v5.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagAXCustomizeMakeupSupport_0 = v5.FFlagAXCustomizeMakeupSupport;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v5.FFlagHeadRefinementFacialAnimationToggle;
v24.ReverseKeyValuePairs = l_memoize_0(function(v33) --[[ Line: 53 ]]
    local v34 = {};
    for _, v36 in v33 do
        if not v34[v36] then
            v34[v36] = 0;
        end;
    end;
    return v34;
end);
v24.Contains = function(v37, v38) --[[ Line: 71 ]]
    -- upvalues: v24 (copy)
    if v24.ReverseKeyValuePairs(v37)[v38] then
        return true;
    else
        return false;
    end;
end;
v24.isFullyQualifiedOutfit = function(v39) --[[ Line: 88 ]] --[[ Name: isFullyQualifiedOutfit ]]
    -- upvalues: v10 (copy), v26 (copy)
    local v40 = {
        Torso = v10.AssetTypeIdStrings.Torso, 
        RightArm = v10.AssetTypeIdStrings.RightArm, 
        LeftArm = v10.AssetTypeIdStrings.LeftArm, 
        LeftLeg = v10.AssetTypeIdStrings.LeftLeg, 
        RightLeg = v10.AssetTypeIdStrings.RightLeg
    };
    if v26 and not v39 then
        return false;
    else
        for _, v42 in v40 do
            if not v39[v42] then
                return false;
            end;
        end;
        for v43, _ in v39 do
            if v10.AssetTypeIdToAccessoryTypeEnum[v43] ~= Enum.AccessoryType.Hair and (v10.AssetTypeIdToAccessoryTypeEnum[v43] or v43 == v10.AssetTypeIdStrings.Gear) then
                return true;
            end;
        end;
        return false;
    end;
end;
v24.isWearingDynamicHeadOutfit = function(v45, v46) --[[ Line: 123 ]] --[[ Name: isWearingDynamicHeadOutfit ]]
    -- upvalues: v24 (copy), v10 (copy)
    local v47 = v24.getEquippedAssetIds(v45.assets);
    if not v46 then
        return false;
    else
        for v48, _ in v45.assets do
            if not v46[v48] then
                return false;
            else
                local v50 = next(v46[v48]);
                if next(v45.assets[v48]) then
                    local v51 = false;
                    for _, v53 in v47 do
                        if v53 == v50 then
                            v51 = true;
                        end;
                    end;
                    if not v51 then
                        return false;
                    end;
                end;
            end;
        end;
        if not v45.assets[v10.AssetTypeIdStrings.DynamicHead] then
            return false;
        else
            return true;
        end;
    end;
end;
v24.getAssetMetadata = function(v54, v55) --[[ Line: 164 ]] --[[ Name: getAssetMetadata ]]
    -- upvalues: l_FFlagAXInventoryDurablesSupport_0 (copy)
    for _, v57 in v55 do
        for v58, v59 in v57 do
            if v54 == v58 then
                if l_FFlagAXInventoryDurablesSupport_0 then
                    local v60 = table.clone(v59);
                    v60.availabilityStatus = nil;
                    return v60;
                else
                    return v59;
                end;
            end;
        end;
    end;
    return nil;
end;
v24.isSameAssetMetadata = function(v61, v62) --[[ Line: 181 ]] --[[ Name: isSameAssetMetadata ]]
    -- upvalues: v2 (copy), v11 (copy)
    if v61 == nil and v62 == nil then
        return true;
    elseif v61 == nil or v62 == nil then
        return false;
    else
        local v63 = v2.Dictionary.keys(v61);
        local v64 = v2.Dictionary.keys(v62);
        if #v63 ~= #v64 then
            return false;
        else
            for v65, v66 in v61 do
                local v67 = v62[v65];
                if typeof(v66) == "Vector3" and typeof(v67) == "Vector3" then
                    if not (v11.fuzzyEq(v66.X, v67.X) and v11.fuzzyEq(v66.Y, v67.Y) and v11.fuzzyEq(v66.Z, v67.Z)) then
                        return false;
                    end;
                elseif v66 ~= v67 then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v24.removeEmoteAnimationAsset = function(v68) --[[ Line: 212 ]] --[[ Name: removeEmoteAnimationAsset ]]
    -- upvalues: v10 (copy), v2 (copy)
    if not v68[v10.AssetTypeIdStrings.EmoteAnimation] then
        return v68;
    else
        return v2.Dictionary.join(v68, {
            [v10.AssetTypeIdStrings.EmoteAnimation] = v2.None
        });
    end;
end;
v24.getEquippedAssetIds = function(v69) --[[ Line: 222 ]] --[[ Name: getEquippedAssetIds ]]
    -- upvalues: v10 (copy)
    local v70 = {};
    if not v69 then
        return v70;
    else
        for _, v72 in v10.AssetTypeIdStrings do
            local v73 = v69[v72];
            if v73 then
                for v74, _ in v73 do
                    table.insert(v70, v74);
                end;
            end;
        end;
        return v70;
    end;
end;
v24.getEquippedAssetIdsForType = function(v76, v77) --[[ Line: 241 ]] --[[ Name: getEquippedAssetIdsForType ]]
    local v78 = {};
    if not v76 then
        return v78;
    else
        local v79 = v76[v77];
        if v79 then
            for v80, _ in v79 do
                table.insert(v78, v80);
            end;
        end;
        return v78;
    end;
end;
v24.getEquippedAssetIdsForCategory = function(v82, v83) --[[ Line: 258 ]] --[[ Name: getEquippedAssetIdsForCategory ]]
    -- upvalues: v24 (copy)
    local v84 = {};
    if not v83.AssetTypeIdStrings then
        return v84;
    else
        for _, v86 in v83.AssetTypeIdStrings do
            for _, v88 in (v24.getEquippedAssetIdsForType(v82, v86)) do
                v84[#v84 + 1] = v88;
            end;
        end;
        return v84;
    end;
end;
v24.isAssetEquipped = function(v89, v90, v91) --[[ Line: 274 ]] --[[ Name: isAssetEquipped ]]
    if v91 then
        local v92 = v91[v90];
        if v92 == nil or not next(v92) then
            return false;
        elseif v92[v89] then
            return true;
        end;
    end;
    return false;
end;
v24.isPresetOutfit = function(v93) --[[ Line: 289 ]] --[[ Name: isPresetOutfit ]]
    return not v93.isEditable;
end;
v24.isDuplicateOutfitName = function(v94, v95, v96) --[[ Line: 293 ]] --[[ Name: isDuplicateOutfitName ]]
    -- upvalues: v9 (copy)
    local v97 = string.lower(utf8.nfdnormalize(v96));
    local v98 = v94[v9.EditableCharacterKey] or {};
    for _, v100 in v98 do
        local v101 = tostring(v100);
        if v95[v101] and string.lower(utf8.nfdnormalize(v95[v101].name)) == v97 then
            return true;
        end;
    end;
    return false;
end;
local _ = function(v102, v103) --[[ Line: 315 ]] --[[ Name: diffListTruncated ]]
    -- upvalues: v2 (copy)
    local v104 = v2.List.toSet(v103);
    return (v2.List.filter(v102, function(v105, _) --[[ Line: 317 ]]
        -- upvalues: v104 (copy)
        return not v104[v105];
    end));
end;
v24.diffList = function(v108, v109) --[[ Line: 324 ]] --[[ Name: diffList ]]
    -- upvalues: v2 (copy)
    local v110 = v2.List.toSet(v109);
    local l_v110_0 = v110 --[[ copy: 3 -> 5 ]];
    local v114 = v2.List.filter(v108, function(v112, _) --[[ Line: 317 ]]
        -- upvalues: l_v110_0 (copy)
        return not l_v110_0[v112];
    end);
    local v115 = v2.List.toSet(v108);
    v110 = v2.List.filter(v109, function(v116, _) --[[ Line: 317 ]]
        -- upvalues: v115 (copy)
        return not v115[v116];
    end);
    return (v2.List.join(v114, v110));
end;
v24.getEquippedDiffs = function(v118, v119) --[[ Line: 331 ]] --[[ Name: getEquippedDiffs ]]
    -- upvalues: v24 (copy)
    local v120 = {};
    for v121, _ in v119 do
        local v123 = v24.getEquippedAssetIdsForType(v119, v121);
        local v124 = v24.getEquippedAssetIdsForType(v118, v121);
        if next(v124) then
            local v125 = v24.diffList(v123, v124);
            if next(v125) ~= nil then
                v120[v121] = v125;
            end;
        elseif next(v123) then
            v120[v121] = v123;
        end;
    end;
    for v126, _ in v118 do
        local v128 = v24.getEquippedAssetIdsForType(v118, v126);
        local v129 = v24.getEquippedAssetIdsForType(v119, v126);
        if next(v129) then
            local v130 = v24.diffList(v128, v129);
            if next(v130) ~= nil then
                v120[v126] = v130;
            end;
        elseif next(v128) then
            v120[v126] = v128;
        end;
    end;
    return v120;
end;
v24.isDynamicHeadEquipped = function(v131) --[[ Line: 363 ]] --[[ Name: isDynamicHeadEquipped ]]
    -- upvalues: v2 (copy), v24 (copy), v10 (copy)
    return not v2.isEmpty(v24.getEquippedAssetIdsForType(v131, v10.AssetTypeIdStrings.DynamicHead));
end;
v24.isClassicHeadEquipped = function(v132) --[[ Line: 369 ]] --[[ Name: isClassicHeadEquipped ]]
    -- upvalues: v2 (copy), v24 (copy), v10 (copy)
    return not v2.isEmpty(v24.getEquippedAssetIdsForType(v132, v10.AssetTypeIdStrings.Head));
end;
v24.hasWrapLayer = function(v133) --[[ Line: 375 ]]
    if not v133 then
        return false;
    else
        return v133:FindFirstChildWhichIsA("WrapLayer", true) ~= nil;
    end;
end;
v24.hasLayeredAssetsEquipped = l_memoize_0(function(v134) --[[ Line: 382 ]]
    if not v134 then
        return false;
    else
        for _, v136 in v134 do
            for _, v138 in v136 do
                if v138.isLayered then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end);
v24.setHumanoidDescriptionColorsFromBodyColor3s = function(v139, v140) --[[ Line: 397 ]] --[[ Name: setHumanoidDescriptionColorsFromBodyColor3s ]]
    -- upvalues: v10 (copy)
    if v140 then
        for v141, v142 in v140 do
            v139[v10.BodyPartForSkinColoringIdToHumanoidDescription[v141]] = v142;
        end;
    end;
end;
v24.setHumanoidDescriptionColorsFromCharacter = function(v143, v144) --[[ Line: 410 ]] --[[ Name: setHumanoidDescriptionColorsFromCharacter ]]
    -- upvalues: v24 (copy)
    v24.setHumanoidDescriptionColorsFromBodyColor3s(v143, v144.AvatarEditor.Character.BodyColor3s);
end;
v24.getGearAssetIdFromState = function(v145) --[[ Line: 420 ]] --[[ Name: getGearAssetIdFromState ]]
    -- upvalues: v21 (copy), v24 (copy), v10 (copy)
    if not v21() then
        return 0;
    else
        local l_EquippedAssets_0 = v145.AvatarEditor.Character.EquippedAssets;
        if l_EquippedAssets_0 == nil then
            return 0;
        else
            local v147 = v24.getEquippedAssetIdsForType(l_EquippedAssets_0, v10.AssetTypeIdStrings.Gear);
            local _, v149 = next(v147);
            if v149 then
                return (tonumber(v149));
            else
                return 0;
            end;
        end;
    end;
end;
v24.getHumanoidDescriptionFromState = function(v150) --[[ Line: 439 ]] --[[ Name: getHumanoidDescriptionFromState ]]
    -- upvalues: v10 (copy), v11 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupAssetType_0 (copy), v7 (copy), l_setMakeupDescriptions_0 (copy), v24 (copy)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    local l_EquippedAssets_1 = v150.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_0 = v150.AvatarEditor.Character.AvatarScales;
    local v154 = nil;
    if l_EquippedAssets_1 then
        local v155 = {};
        for v156, v157 in l_EquippedAssets_1 do
            local v158 = {};
            local v159 = v10.AssetTypeIdToAccessoryTypeEnum[v156];
            for v160, v161 in v157 do
                if v159 then
                    table.insert(v155, v11.createHumanoidDescriptionAccessoryInfo(v156, v160, v161));
                else
                    table.insert(v158, v160);
                end;
            end;
            if v159 == nil and #v158 > 0 then
                local v162 = v10.AssetTypeIdStringToHumanoidDescriptionProp[v156];
                local v163 = table.concat(v158, ",");
                if v162 then
                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v10.BodyPartNameToEnum[v162] then
                        local l_BodyPartDescription_0 = Instance.new("BodyPartDescription");
                        l_BodyPartDescription_0.AssetId = v163;
                        l_BodyPartDescription_0.Parent = l_HumanoidDescription_0;
                        l_BodyPartDescription_0.BodyPart = v10.BodyPartNameToEnum[v162];
                        if v156 == v10.AssetTypeIdStrings.DynamicHead then
                            local v165 = nil;
                            for _, v167 in v158 do
                                local v168 = v157[v167];
                                if l_FFlagHeadRefinementFacialAnimationToggle_0 and v168 and v168.staticFacialAnimation ~= nil then
                                    v154 = v168.staticFacialAnimation;
                                end;
                                if v168 and v168.headShape then
                                    v165 = if v168.headShape == "Default" then nil else v168.headShape;
                                    break;
                                end;
                            end;
                            if v165 then
                                l_BodyPartDescription_0.HeadShape = v165;
                            end;
                        end;
                    else
                        l_HumanoidDescription_0[v162] = v163;
                    end;
                elseif v156 ~= v10.AssetTypeIdStrings.Gear and (not l_FFlagAXMakeupEquipping_0 or not l_isMakeupAssetType_0(v156)) then
                    v7(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(v156))));
                end;
            end;
        end;
        l_HumanoidDescription_0:SetAccessories(v155, true);
        if l_FFlagAXMakeupEquipping_0 then
            l_setMakeupDescriptions_0(l_HumanoidDescription_0, l_EquippedAssets_1);
        end;
        if l_FFlagHeadRefinementFacialAnimationToggle_0 and v154 ~= nil then
            l_HumanoidDescription_0[v10.StaticFacialAnimation] = v154;
        end;
    end;
    if l_AvatarScales_0 then
        for v169, v170 in l_AvatarScales_0 do
            l_HumanoidDescription_0[v10.HumanoidDescriptionScaleToName[v169]] = v170;
        end;
    end;
    v24.setHumanoidDescriptionColorsFromCharacter(l_HumanoidDescription_0, v150);
    local v171 = {};
    local v172 = {};
    for _, v174 in v150.AvatarEditor.EquippedEmotes.slotInfo do
        v171[tostring(v174.assetId)] = {
            (tonumber(v174.assetId))
        };
        table.insert(v172, {
            Slot = v174.position, 
            Name = tostring(v174.assetId)
        });
    end;
    l_HumanoidDescription_0:SetEmotes(v171);
    l_HumanoidDescription_0:SetEquippedEmotes(v172);
    return l_HumanoidDescription_0;
end;
v24.getHumanoidDescriptionFromOutfitInfo = function(v175) --[[ Line: 548 ]] --[[ Name: getHumanoidDescriptionFromOutfitInfo ]]
    -- upvalues: v10 (copy), v11 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupAssetType_0 (copy), v7 (copy), l_setMakeupDescriptions_0 (copy), v24 (copy)
    local l_HumanoidDescription_1 = Instance.new("HumanoidDescription");
    local l_assets_0 = v175.assets;
    local l_scales_0 = v175.scales;
    if l_assets_0 then
        local v179 = {};
        for v180, v181 in l_assets_0 do
            local v182 = {};
            local v183 = v10.AssetTypeIdToAccessoryTypeEnum[v180];
            for v184, v185 in v181 do
                if v183 then
                    table.insert(v179, v11.createHumanoidDescriptionAccessoryInfo(v180, v184, v185));
                else
                    table.insert(v182, v184);
                end;
            end;
            if v183 == nil and #v182 > 0 then
                local v186 = v10.AssetTypeIdStringToHumanoidDescriptionProp[v180];
                local v187 = table.concat(v182, ",");
                if v186 then
                    l_HumanoidDescription_1[v186] = v187;
                elseif v180 ~= v10.AssetTypeIdStrings.Gear and (not l_FFlagAXMakeupEquipping_0 or not l_isMakeupAssetType_0(v180)) then
                    v7(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(v180))));
                end;
            end;
        end;
        l_HumanoidDescription_1:SetAccessories(v179, true);
        if l_FFlagAXMakeupEquipping_0 then
            l_setMakeupDescriptions_0(l_HumanoidDescription_1, l_assets_0);
        end;
    end;
    if l_scales_0 then
        for v188, v189 in l_scales_0 do
            l_HumanoidDescription_1[v10.HumanoidDescriptionScaleToName[v188]] = v189;
        end;
    end;
    v24.setHumanoidDescriptionColorsFromBodyColor3s(l_HumanoidDescription_1, v175.bodyColor3s);
    return l_HumanoidDescription_1;
end;
v24.shouldNotifyAssetTypes = function(v190, v191) --[[ Line: 610 ]] --[[ Name: shouldNotifyAssetTypes ]]
    for _, v193 in v190 do
        if v191[v193] == true then
            return true;
        end;
    end;
    return false;
end;
v24.shouldNotifyBundleTypes = function(v194, v195) --[[ Line: 623 ]] --[[ Name: shouldNotifyBundleTypes ]]
    -- upvalues: v10 (copy)
    for _, v197 in v194 do
        if v195[v10.BundleTypeIdStringToOutfitType[v197]] == true then
            return true;
        end;
    end;
    return false;
end;
v24.shouldNotifyCategory = function(v198, v199) --[[ Line: 637 ]] --[[ Name: shouldNotifyCategory ]]
    -- upvalues: v24 (copy)
    local l_AssetTypeIdStrings_0 = v198.AssetTypeIdStrings;
    local l_BundleTypeIdStrings_0 = v198.BundleTypeIdStrings;
    local l_Subcategories_0 = v198.Subcategories;
    local l_SubcategoryFilters_0 = v198.SubcategoryFilters;
    if l_AssetTypeIdStrings_0 and v24.shouldNotifyAssetTypes(l_AssetTypeIdStrings_0, v199) then
        return true;
    elseif l_BundleTypeIdStrings_0 and v24.shouldNotifyBundleTypes(l_BundleTypeIdStrings_0, v199) then
        return true;
    else
        if l_Subcategories_0 then
            for _, v205 in l_Subcategories_0 do
                if v24.shouldNotifyCategory(v205, v199) then
                    return true;
                end;
            end;
        elseif l_SubcategoryFilters_0 then
            for _, v207 in l_SubcategoryFilters_0 do
                if v24.shouldNotifyCategory(v207, v199) then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
v24.getNotificationItemTypesForCategory = function(v208, v209) --[[ Line: 669 ]] --[[ Name: getNotificationItemTypesForCategory ]]
    -- upvalues: v10 (copy), v24 (copy), v2 (copy)
    local v210 = {};
    local l_AssetTypeIdStrings_1 = v208.AssetTypeIdStrings;
    local l_BundleTypeIdStrings_1 = v208.BundleTypeIdStrings;
    local l_Subcategories_1 = v208.Subcategories;
    local l_SubcategoryFilters_1 = v208.SubcategoryFilters;
    if l_AssetTypeIdStrings_1 then
        for _, v216 in l_AssetTypeIdStrings_1 do
            if v209[v216] then
                v210[v216] = true;
            end;
        end;
    end;
    if l_BundleTypeIdStrings_1 then
        for _, v218 in l_BundleTypeIdStrings_1 do
            local v219 = v10.BundleTypeIdStringToOutfitType[v218];
            if v209[v219] then
                v210[v219] = true;
            end;
        end;
    end;
    if l_Subcategories_1 then
        for _, v221 in l_Subcategories_1 do
            for _, v223 in v24.getNotificationItemTypesForCategory(v221, v209) do
                v210[v223] = true;
            end;
        end;
    end;
    if l_SubcategoryFilters_1 then
        for _, v225 in l_SubcategoryFilters_1 do
            for _, v227 in v24.getNotificationItemTypesForCategory(v225, v209) do
                v210[v227] = true;
            end;
        end;
    end;
    return v2.Dictionary.keys(v210);
end;
v24.doAESCallAndAwaitResult = function(v228, v229, v230, ...) --[[ Line: 714 ]] --[[ Name: doAESCallAndAwaitResult ]]
    local v231 = v229(v228, ...);
    while not v231 do
        v230:Wait();
        v231 = v229(v228, ...);
    end;
    return v230:Wait();
end;
v24.getColor3AtValueInRange = l_memoize_0(function(v232, v233) --[[ Line: 725 ]]
    -- upvalues: v12 (copy), v7 (copy)
    local v234, v235 = v12.clampBetween0And1(v233);
    if v235 then
        v7(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(v233))));
    end;
    v233 = v234;
    if v233 == 0 then
        return v232[1];
    elseif v233 == 1 then
        return v232[#v232];
    else
        local v236 = v233 * (#v232 - 1);
        local v237 = math.floor(v236 + 1);
        local v238 = v236 + 1 - v237;
        return v232[v237]:Lerp(v232[v237 + 1], v238);
    end;
end);
local function v248(v239, v240, v241) --[[ Line: 756 ]]
    local v242 = Vector3.new(v239.R, v239.G, v239.B);
    local v243 = Vector3.new(v240.R, v240.G, v240.B);
    local v244 = Vector3.new(v241.R, v241.G, v241.B);
    local v245 = v243 - v242;
    local v246 = v244 - v242;
    if v246:Dot(v245) <= 0 then
        return v246.Magnitude, 0;
    else
        local v247 = v244 - v243;
        if v247:Dot(v245) >= 0 then
            return v247.Magnitude, 1;
        else
            return v245:Cross(v246).Magnitude / v246.Magnitude, v245.Unit:Dot(v246) / v245.Magnitude;
        end;
    end;
end;
local function v258(v249, v250) --[[ Line: 801 ]]
    -- upvalues: v248 (copy)
    local v251 = 10;
    local v252 = 0;
    for v253 = 1, #v249 - 1 do
        local v254 = v249[v253];
        local v255 = v249[v253 + 1];
        local v256, v257 = v248(v254, v255, v250);
        if v256 < v251 then
            v251 = v256;
            v252 = (v253 - 1 + v257) / (#v249 - 1);
        end;
    end;
    return v251, v252;
end;
v24.findRangeAndSliderValueForColor3 = function(v259, v260) --[[ Line: 827 ]]
    -- upvalues: v258 (copy)
    local v261 = 10;
    local v262 = 0;
    local v263 = nil;
    for _, v265 in v260 do
        local v266, v267 = v258(v265.range, v259);
        if v266 < v261 then
            v261 = v266;
            v262 = v267;
            v263 = v265.rangeId;
        end;
    end;
    return v263, v262;
end;
v24.getRangeStructForRangeId = l_memoize_0(function(v268, v269) --[[ Line: 847 ]]
    for _, v271 in v269 do
        if v271.rangeId == v268 then
            return v271;
        end;
    end;
    return nil;
end);
v24.getColor3AtValueForRangeId = l_memoize_0(function(v272, v273, v274) --[[ Line: 858 ]]
    -- upvalues: v12 (copy), v7 (copy), v24 (copy)
    local v275, v276 = v12.clampBetween0And1(v273);
    if v276 then
        v7(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(v273))));
    end;
    v273 = v275;
    local v277 = v24.getRangeStructForRangeId(v272, v274);
    if v277 then
        return v24.getColor3AtValueInRange(v277.range, v273);
    else
        return nil;
    end;
end);
v24.getInfoForRangeIdAndBodyPartIndex = function(v278, v279, v280) --[[ Line: 882 ]]
    -- upvalues: v4 (copy), v9 (copy)
    v4.isNotNil(v278, "rangeId");
    v4.assert(v279 >= 1, "selectedBodyPartIndex too low");
    v4.assert(v279 <= #v9.BodyPartButtonData, "selectedBodyPartIndex too high");
    if v280 == nil or v280[v278] == nil then
        return nil;
    else
        local v281 = v280[v278];
        local l_bodyPartForSkinColoringIds_0 = v9.BodyPartButtonData[v279].bodyPartForSkinColoringIds;
        local v283 = nil;
        for _, v285 in l_bodyPartForSkinColoringIds_0 do
            if v281[v285] then
                if v283 == nil then
                    v283 = v281[v285];
                elseif v283.color3 ~= v281[v285].color3 then
                    return nil;
                end;
            end;
        end;
        return v283;
    end;
end;
v24.getColor3ForRangeIdAndBodyPartIndex = l_memoize_0(function(v286, v287, v288, v289) --[[ Line: 930 ]]
    -- upvalues: v4 (copy), v24 (copy)
    v4.isNotNil(v289, "defaultBodyColorRanges");
    local v290 = v24.getInfoForRangeIdAndBodyPartIndex(v286, v287, v288);
    if v290 then
        return v290.color3;
    else
        return v24.getColor3AtValueForRangeId(v286, 0.5, v289);
    end;
end);
v24.getSliderValueForRangeIdAndBodyPartIndex = l_memoize_0(function(v291, v292, v293) --[[ Line: 954 ]]
    -- upvalues: v24 (copy)
    local v294 = v24.getInfoForRangeIdAndBodyPartIndex(v291, v292, v293);
    if v294 then
        return v294.sliderValue;
    else
        return 0.5;
    end;
end);
v24.getBodyColorsSliderFrameHeight = function(v295, v296, v297, v298) --[[ Line: 978 ]] --[[ Name: getBodyColorsSliderFrameHeight ]]
    local v299 = v297 - math.max(v296, v298);
    if v295 < v299 then
        return v299;
    else
        return v295;
    end;
end;
v24.getSearchUuidAndAssetTypes = function(v300, v301, v302) --[[ Line: 994 ]]
    -- upvalues: l_FFlagAXEditorSubcategoryFilters_0 (copy)
    local _ = nil;
    local _ = nil;
    if v300.SubButtons then
        v301 = v301 or 1;
        local v305 = v300.SubButtons[v301];
        return v305.SearchUuid, v305.AssetTypeIdStrings;
    elseif l_FFlagAXEditorSubcategoryFilters_0 and v300.SubcategoryFilters then
        v302 = v302 or 1;
        local v306 = v300.SubcategoryFilters[v302] or v300.SubcategoryFilters[1];
        return v306.SearchUuid, v306.AssetTypeIdStrings;
    else
        return v300.SearchUuid, v300.AssetTypeIdStrings;
    end;
end;
v24.getCategoryIndicesFromAssetType = function(v307) --[[ Line: 1015 ]] --[[ Name: getCategoryIndicesFromAssetType ]]
    -- upvalues: v14 (copy)
    for v308, v309 in (v14()) do
        if v309.Subcategories then
            for v310, v311 in v309.Subcategories do
                if v311.AssetTypeIdStrings then
                    for _, v313 in v311.AssetTypeIdStrings do
                        if v307 == v313 then
                            return v308, v310;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
v24.findAvatarEditorCategory = function(v314, v315) --[[ Line: 1038 ]] --[[ Name: findAvatarEditorCategory ]]
    -- upvalues: v14 (copy)
    for v316, v317 in (v14()) do
        if v317.SearchUuid == v314 then
            for v318, v319 in v317.Subcategories do
                if v319.SearchUuid == v315 then
                    return v316, v318;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
v24.selectAssetTypeKey = function(v320) --[[ Line: 1052 ]]
    -- upvalues: l_FFlagAXEditorSubcategoryFilters_0 (copy), v11 (copy), v24 (copy)
    local l_category_0 = v320.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v320.AvatarExperience.AvatarEditor.Categories.subcategory;
    local l_subButton_0 = v320.AvatarExperience.AvatarEditor.Categories.subButton;
    local v324 = if l_FFlagAXEditorSubcategoryFilters_0 then v320.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil;
    local v325 = v11.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0);
    local v326, _ = v24.getSearchUuidAndAssetTypes(v325, l_subButton_0, if l_FFlagAXEditorSubcategoryFilters_0 then v324 else nil);
    return v326 or v325.Name;
end;
v24.getColor3SharedByBodyParts = l_memoize_0(function(v328, v329) --[[ Line: 1076 ]]
    local v330 = nil;
    for _, v332 in v328 do
        local v333 = v329[v332];
        if v330 == nil then
            v330 = v333;
        elseif v333 and v330:ToHex() ~= v333:ToHex() then
            return nil;
        end;
    end;
    return v330;
end);
v24.getRangeIdSharedByBodyParts = l_memoize_0(function(v334, v335) --[[ Line: 1103 ]]
    local v336 = nil;
    for _, v338 in v334 do
        local v339 = v335[v338];
        if v336 == nil then
            v336 = v339;
        elseif v336 ~= v339 then
            return nil;
        end;
    end;
    return v336;
end);
v24.ExponentialRepeat = function(v340, v341, v342) --[[ Line: 1133 ]]
    v342 = v342 or 6;
    local v343 = 1;
    while true do
        if v343 <= v342 and v340() then
            if v341() then
                return;
            else
                task.wait(v343 ^ 2);
                v343 = v343 + 1;
            end;
        else
            return;
        end;
    end;
end;
if l_FFlagAXCustomizeMakeupSupport_0 then
    v24.isWearingOutfitNoState = function(v344, v345, v346, v347, v348, _, _) --[[ Line: 1172 ]] --[[ Name: isWearingOutfitNoState ]]
        -- upvalues: v10 (copy), v24 (copy), v3 (copy), l_isMakeupAssetType_0 (copy), v2 (copy), l_isLayeredClothingAssetType_0 (copy), l_FFlagAXFixOutfitEquipCheckEmptyArray_0 (copy)
        if v344.outfitType == v10.OutfitTypes.DynamicHead then
            return v24.isWearingDynamicHeadOutfit(v344, v347);
        else
            local v351 = v24.removeEmoteAnimationAsset(v344.assets);
            local v352 = v344.outfitType == v10.OutfitTypes.Avatar and v344.isEditable or v24.isFullyQualifiedOutfit(v344.assets);
            if v352 then
                for v353, v354 in v348 do
                    if v344.scales[v353] ~= v354 then
                        return false;
                    end;
                end;
                if v344.avatarType ~= v345 then
                    return false;
                elseif not v24.isPresetOutfit(v344) then
                    for v355, v356 in v346 do
                        if not v344.bodyColor3s then
                            return false;
                        elseif v344.bodyColor3s[v355]:ToHex() ~= v356:ToHex() then
                            return false;
                        end;
                    end;
                end;
            end;
            local v357 = {};
            local v358 = {};
            for v359, v360 in v351 do
                if not v347[v359] then
                    return false;
                else
                    for v361, v362 in v360 do
                        if not v347[v359][v361] or not v24.isSameAssetMetadata(v3.omit(v362, {
                            "order", 
                            "availabilityStatus"
                        }), v3.omit(v347[v359][v361], {
                            "order", 
                            "availabilityStatus"
                        })) then
                            return false;
                        elseif l_isMakeupAssetType_0(v359) then
                            if v362.order ~= nil then
                                table.insert(v358, v2.Dictionary.join(v362, {
                                    assetId = v361, 
                                    assetTypeId = v359
                                }));
                            end;
                        elseif l_isLayeredClothingAssetType_0(v359) and v362.order ~= nil then
                            table.insert(v357, v2.Dictionary.join(v362, {
                                assetId = v361, 
                                assetTypeId = v359
                            }));
                        end;
                    end;
                end;
            end;
            local v363 = {
                [v10.AssetTypeIdStrings.EyebrowAccessory] = true, 
                [v10.AssetTypeIdStrings.EyelashAccessory] = true, 
                [v10.AssetTypeIdStrings.FaceMakeup] = true, 
                [v10.AssetTypeIdStrings.EyeMakeup] = true, 
                [v10.AssetTypeIdStrings.LipMakeup] = true
            };
            if v352 or v344.outfitType == v10.OutfitTypes.Makeup then
                for v364, v365 in v347 do
                    if (not l_FFlagAXFixOutfitEquipCheckEmptyArray_0 or next(v365) ~= nil) and (v344.outfitType ~= v10.OutfitTypes.Makeup or v363[v364]) then
                        if v351[v364] == nil then
                            return false;
                        else
                            for v366, _ in v365 do
                                if v351[v364][v366] == nil then
                                    return false;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            local function v370(v368, v369) --[[ Line: 1296 ]] --[[ Name: sortByOrder ]]
                return v368.order < v369.order;
            end;
            table.sort(v357, v370);
            table.sort(v358, v370);
            local v371 = nil;
            for _, v373 in v357 do
                if v371 == nil then
                    v371 = v347[v373.assetTypeId][v373.assetId].order;
                elseif v347[v373.assetTypeId][v373.assetId].order < v371 then
                    return false;
                else
                    v371 = v347[v373.assetTypeId][v373.assetId].order;
                end;
            end;
            local v374 = nil;
            for _, v376 in v358 do
                if v374 == nil then
                    v374 = v347[v376.assetTypeId][v376.assetId].order;
                elseif v347[v376.assetTypeId][v376.assetId].order < v374 then
                    return false;
                else
                    v374 = v347[v376.assetTypeId][v376.assetId].order;
                end;
            end;
            return true;
        end;
    end;
elseif v27() then
    v24.isWearingOutfitNoState = function(v377, _, _, v380, _, v382, v383) --[[ Line: 1343 ]] --[[ Name: isWearingOutfitNoState ]]
        -- upvalues: v24 (copy), v10 (copy), v27 (copy), v25 (copy)
        local v384 = v24.removeEmoteAnimationAsset(v377.assets);
        if v377.outfitType == v10.OutfitTypes.DynamicHead then
            return v24.isWearingDynamicHeadOutfit(v377, v380);
        else
            local v385 = v24.getEquippedAssetIds(v384);
            local v386 = v24.getEquippedAssetIds(v380);
            if v27() or #v385 ~= #v386 then
                for _, v388 in v385 do
                    if not v24.Contains(v386, v388) then
                        return false;
                    end;
                end;
                if v383 then
                    for _, v390 in v386 do
                        if not v24.Contains(v385, v390) then
                            return false;
                        end;
                    end;
                end;
                if v25() and v382 and v24.isFullyQualifiedOutfit(v384) then
                    return true;
                end;
            end;
            return true;
        end;
    end;
else
    v24.isWearingOutfitNoState = function(v391, v392, v393, v394, v395, v396, _) --[[ Line: 1401 ]] --[[ Name: isWearingOutfitNoState ]]
        -- upvalues: v24 (copy), v10 (copy), v25 (copy)
        local v398 = v24.removeEmoteAnimationAsset(v391.assets);
        if v391.outfitType == v10.OutfitTypes.DynamicHead then
            return v24.isWearingDynamicHeadOutfit(v391, v394);
        else
            local v399 = v24.getEquippedAssetIds(v398);
            local v400 = v24.getEquippedAssetIds(v394);
            if #v399 ~= #v400 then
                if v25() and v396 and not v24.isFullyQualifiedOutfit(v398) then
                    for _, v402 in v399 do
                        if not table.find(v400, v402) then
                            return false;
                        end;
                    end;
                    return true;
                else
                    return false;
                end;
            else
                for _, v404 in v399 do
                    local v405 = false;
                    for _, v407 in v400 do
                        if v404 == v407 then
                            local v408 = v24.getAssetMetadata(v404, v398);
                            local v409 = v24.getAssetMetadata(v407, v394);
                            if v24.isSameAssetMetadata(v408, v409) then
                                v405 = true;
                            end;
                        end;
                    end;
                    if not v405 then
                        return false;
                    end;
                end;
                if not v24.isPresetOutfit(v391) then
                    for v410, v411 in v393 do
                        if not v391.bodyColor3s then
                            return false;
                        elseif v391.bodyColor3s[v410]:ToHex() ~= v411:ToHex() then
                            return false;
                        end;
                    end;
                end;
                for v412, v413 in v395 do
                    if v391.scales[v412] ~= v413 then
                        return false;
                    end;
                end;
                if v391.avatarType ~= v392 then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
end;
v24.isWearingOutfit = function(v414, v415) --[[ Line: 1480 ]] --[[ Name: isWearingOutfit ]]
    -- upvalues: v24 (copy)
    local l_AvatarType_0 = v414.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_BodyColor3s_0 = v414.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    local l_EquippedAssets_2 = v414.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_1 = v414.AvatarExperience.AvatarEditor.Character.AvatarScales;
    return v24.isWearingOutfitNoState(v415, l_AvatarType_0, l_BodyColor3s_0, l_EquippedAssets_2, l_AvatarScales_1);
end;
v24.filterOutfitAssetsWithStatus = function(v420, v421) --[[ Line: 1489 ]] --[[ Name: filterOutfitAssetsWithStatus ]]
    -- upvalues: v2 (copy)
    local v422 = {};
    if v420.assets then
        for v423, v424 in v420.assets do
            if v424 then
                v422[v423] = {};
                for v425, v426 in v424 do
                    if typeof(v421) == "table" then
                        if not table.find(v421, v426.availabilityStatus) then
                            v422[v423][v425] = v426;
                        end;
                    elseif v426 and v426.availabilityStatus ~= v421 then
                        v422[v423][v425] = v426;
                    end;
                end;
            end;
            if next(v422[v423]) == nil then
                v422[v423] = nil;
            end;
        end;
    end;
    return v2.Dictionary.join(v420, {
        assets = v422
    });
end;
v24.hasMakeup = function(v427) --[[ Line: 1524 ]] --[[ Name: hasMakeup ]]
    -- upvalues: l_isMakeupAssetType_0 (copy)
    if not v427 then
        return false;
    else
        for v428, _ in v427 do
            if l_isMakeupAssetType_0(v428) then
                return true;
            end;
        end;
        return false;
    end;
end;
return v24;