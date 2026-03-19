local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s);
local v11 = require(l_Modules_0.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateAvatarEquips);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v15 = require(l_Modules_0.AvatarExperience.Common.Actions.AddSaveDelay);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagUnequipAccessoriesBeforeLookTryOn);
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixWearAfterTryOnOwnedBundles);
local l_FFlagParseHeadShapeFromAPIResponse_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagAXMakeupEquipping_0 = v5.FFlagAXMakeupEquipping;
local v21 = {
    v6.AssetTypeIdStrings.Torso, 
    v6.AssetTypeIdStrings.RightArm, 
    v6.AssetTypeIdStrings.LeftArm, 
    v6.AssetTypeIdStrings.LeftLeg, 
    v6.AssetTypeIdStrings.RightLeg
};
local _ = function(v22) --[[ Line: 49 ]] --[[ Name: isFullyQualifiedOutfit ]]
    -- upvalues: v21 (copy)
    for _, v24 in v21 do
        if not v22[v24] then
            return false;
        end;
    end;
    return true;
end;
return function(v26, v27, v28, v29) --[[ Line: 59 ]]
    -- upvalues: v11 (copy), v16 (copy), l_FFlagAXMakeupEquipping_0 (copy), v6 (copy), v8 (copy), v10 (copy), v9 (copy), v1 (copy), v15 (copy), v4 (copy), v21 (copy), v7 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v17 (copy), v12 (copy)
    return function(v30) --[[ Line: 60 ]]
        -- upvalues: v11 (ref), v16 (ref), l_FFlagAXMakeupEquipping_0 (ref), v6 (ref), v8 (ref), v27 (copy), v10 (ref), v9 (ref), v1 (ref), v26 (copy), v15 (ref), v4 (ref), v21 (ref), v28 (copy), v7 (ref), v29 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (ref), l_FFlagHeadRefinementFacialAnimationToggle_0 (ref), v17 (ref), v12 (ref)
        local v31 = false;
        local v32 = v30:getState();
        local l_AssetInfos_0 = v32.AvatarExperience.Common.AssetInfos;
        local v34 = v11.buildEquippedBodyStateMap(v32);
        local v35 = {};
        if v16() then
            local l_EquippedAssets_0 = v32.AvatarExperience.AvatarEditor.Character.EquippedAssets;
            local l_LookId_0 = v32.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
            local l_LookType_0 = v32.AvatarExperience.AvatarScene.OutfitTryOn.LookType;
            if l_EquippedAssets_0 and l_LookId_0 then
                if l_FFlagAXMakeupEquipping_0 then
                    local v39 = {};
                    if l_LookType_0 == v6.LookType.Makeup then
                        v39[v6.AssetCategories.Makeup] = true;
                    else
                        v39[v6.AssetCategories.Accessory] = true;
                        v39[v6.AssetCategories.Clothing] = true;
                        v39[v6.AssetCategories.Makeup] = true;
                    end;
                    for v40, v41 in l_EquippedAssets_0 do
                        local v42 = v6.AssetTypeIdToCategory[v40];
                        local v43 = false;
                        if l_LookType_0 == v6.LookType.Avatar then
                            v43 = v34 and v34[v40];
                        end;
                        if v39[v42] or v43 then
                            for v44, _ in v41 do
                                if v35 then
                                    table.insert(v35, {
                                        assetTypeId = v40, 
                                        assetId = v44
                                    });
                                else
                                    v30:dispatch(v8(v40, v44, v27, true));
                                end;
                            end;
                        end;
                    end;
                else
                    for v46, v47 in l_EquippedAssets_0 do
                        local v48 = v6.AssetTypeIdToCategory[v46];
                        if v48 == v6.AssetCategories.Accessory or v48 == v6.AssetCategories.Clothing or l_LookType_0 == v6.LookType.Avatar and v34 and v34[v46] then
                            for v49, _ in v47 do
                                if v35 then
                                    table.insert(v35, {
                                        assetTypeId = v46, 
                                        assetId = v49
                                    });
                                else
                                    v30:dispatch(v8(v46, v49, v27, true));
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local l_BodyColor3s_0 = v32.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s;
        local l_Scale_0 = v32.AvatarExperience.AvatarScene.OutfitTryOn.Scale;
        if l_BodyColor3s_0 then
            v30:dispatch(v10(l_BodyColor3s_0));
        end;
        if l_Scale_0 then
            v30:dispatch(v9(l_Scale_0));
        end;
        local v53 = {};
        if not v1.isEmpty(v26) and not v32.AvatarExperience.AvatarScene.Character.ShouldDelaySaveManager then
            v30:dispatch(v15());
        end;
        for _, v55 in v26 do
            if (v55.purchased or v55.owned) and not v55.assetIsWearable and v55.bundleId then
                local v56 = v4.getOutfitInfoFromBundleId(v32, v55.bundleId);
                if v56 then
                    local l_assets_0 = v56.assets;
                    local v58;
                    for _, v60 in v21 do
                        if not l_assets_0[v60] then
                            v58 = false;
                            v31 = true;
                        end;
                        if v31 then
                            break;
                        end;
                    end;
                    if not v31 then
                        v58 = true;
                    end;
                    v31 = false;
                    if v58 then
                        v58 = {
                            outfitInfo = v56, 
                            analytics = v28, 
                            navigation = v27, 
                            isSelected = false, 
                            fromOutfitPurchase = true, 
                            tryOnBundleInfo = v55.tryOnBundleInfo, 
                            blockFullReset = true
                        };
                        v30:dispatch(v7(v58));
                        v53[v55.bundleId] = true;
                    end;
                end;
            end;
        end;
        for _, v62 in v26 do
            local v63 = if v62.assetIsWearable then v62.assetId else v62.bundleId;
            if (v62.purchased or v62.owned) and v63 then
                if v62.assetType == v6.ItemType.Bundle then
                    if v53[v63] == nil then
                        local v64 = v4.getOutfitInfoFromBundleId(v32, v63);
                        local v65 = v4.getBundleInfoFromState(v32, v63);
                        local l_tryOnBundleInfo_0 = v62.tryOnBundleInfo;
                        if v64 then
                            local v67 = {
                                outfitInfo = v64, 
                                analytics = v28, 
                                navigation = v27, 
                                isSelected = false, 
                                fromOutfitPurchase = true, 
                                tryOnBundleInfo = v62.tryOnBundleInfo
                            };
                            v30:dispatch(v7(v67));
                        elseif l_tryOnBundleInfo_0 and v29 == v6.LookType.Avatar then
                            assert(l_tryOnBundleInfo_0, "");
                            for v68, v69 in l_tryOnBundleInfo_0 do
                                local v70 = nil;
                                local v71 = nil;
                                if l_FFlagParseHeadShapeFromAPIResponse_0 and v69.assetType == v6.AssetTypeIdStrings.DynamicHead then
                                    v70 = v69.headShape;
                                    if l_FFlagHeadRefinementFacialAnimationToggle_0 then
                                        v71 = v69.staticFacialAnimation;
                                    end;
                                end;
                                if v17() then
                                    local l_assetType_0 = v69.assetType;
                                    local v73 = v32.AvatarExperience.AvatarEditor.Character.EquippedAssets[l_assetType_0];
                                    local v74 = false;
                                    if v73 then
                                        for v75, _ in v73 do
                                            if v75 == v68 then
                                                v74 = true;
                                                break;
                                            end;
                                        end;
                                        if v74 then
                                            continue;
                                        end;
                                    end;
                                end;
                                if v35 then
                                    local v77 = nil;
                                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v70 ~= nil then
                                        v77 = {
                                            headShape = v70
                                        };
                                    end;
                                    local v78 = nil;
                                    if l_FFlagHeadRefinementFacialAnimationToggle_0 and v71 ~= nil then
                                        v78 = {
                                            staticFacialAnimation = v71
                                        };
                                    end;
                                    local v79 = if not not v77 or v78 then v1.Dictionary.join(v77 or {}, v78 or {}) else nil;
                                    table.insert(v35, {
                                        assetTypeId = v69.assetType, 
                                        assetId = v68, 
                                        overrideOrder = nil, 
                                        overrideAdjustments = v79
                                    });
                                else
                                    v30:dispatch(v8(v69.assetType, v68, v27, true, nil));
                                end;
                            end;
                        elseif v65 then
                            assert(v65, "");
                            for _, v81 in v65.items do
                                local v82 = l_AssetInfos_0[v81.id];
                                if v82 and v82.assetType then
                                    local v83 = v62.tryOnBundleInfo and v62.tryOnBundleInfo[v81.id] and v62.tryOnBundleInfo[v81.id].order;
                                    v30:dispatch(v8(v82.assetType, v81.id, v27, true, v83));
                                end;
                            end;
                        end;
                    end;
                elseif v62.itemSubType and tostring(v62.itemSubType) ~= v6.AssetTypeIdStrings.EmoteAnimation then
                    local l_overrideOrder_0 = v62.overrideOrder;
                    local l_overrideAdjustments_0 = v62.overrideAdjustments;
                    if v35 and v29 == v6.LookType.Avatar then
                        table.insert(v35, {
                            assetTypeId = tostring(v62.itemSubType), 
                            assetId = tostring(v63), 
                            overrideOrder = l_overrideOrder_0, 
                            overrideAdjustments = l_overrideAdjustments_0
                        });
                    else
                        v30:dispatch(v8(tostring(v62.itemSubType), tostring(v63), v27, true, l_overrideOrder_0, l_overrideAdjustments_0));
                    end;
                end;
            end;
        end;
        if v35 and #v35 > 0 then
            v30:dispatch(v12({
                assets = v35
            }));
        end;
    end;
end;