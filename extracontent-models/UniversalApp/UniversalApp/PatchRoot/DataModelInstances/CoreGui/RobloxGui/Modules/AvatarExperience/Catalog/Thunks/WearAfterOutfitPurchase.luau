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
local l_FFlagParseHeadShapeFromAPIResponse_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagAXMakeupEquipping_0 = v5.FFlagAXMakeupEquipping;
local l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 = v5.FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType;
local v20 = {
    v6.AssetTypeIdStrings.Torso, 
    v6.AssetTypeIdStrings.RightArm, 
    v6.AssetTypeIdStrings.LeftArm, 
    v6.AssetTypeIdStrings.LeftLeg, 
    v6.AssetTypeIdStrings.RightLeg
};
local _ = function(v21) --[[ Line: 47 ]] --[[ Name: isFullyQualifiedOutfit ]]
    -- upvalues: v20 (copy)
    for _, v23 in v20 do
        if not v21[v23] then
            return false;
        end;
    end;
    return true;
end;
return function(v25, v26, v27, _) --[[ Line: 57 ]]
    -- upvalues: v11 (copy), l_FFlagAXMakeupEquipping_0 (copy), v6 (copy), v8 (copy), v10 (copy), v9 (copy), v1 (copy), v15 (copy), v4 (copy), v20 (copy), v7 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (copy), v12 (copy)
    return function(v29) --[[ Line: 58 ]]
        -- upvalues: v11 (ref), l_FFlagAXMakeupEquipping_0 (ref), v6 (ref), v8 (ref), v26 (copy), v10 (ref), v9 (ref), v1 (ref), v25 (copy), v15 (ref), v4 (ref), v20 (ref), v27 (copy), v7 (ref), l_FFlagParseHeadShapeFromAPIResponse_0 (ref), l_FFlagHeadRefinementFacialAnimationToggle_0 (ref), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (ref), v12 (ref)
        local v30 = false;
        local v31 = v29:getState();
        local l_AssetInfos_0 = v31.AvatarExperience.Common.AssetInfos;
        local v33 = v11.buildEquippedBodyStateMap(v31);
        local v34 = {};
        local l_EquippedAssets_0 = v31.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local l_LookId_0 = v31.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        local l_LookType_0 = v31.AvatarExperience.AvatarScene.OutfitTryOn.LookType;
        if l_EquippedAssets_0 and l_LookId_0 then
            if l_FFlagAXMakeupEquipping_0 then
                local v38 = {};
                if l_LookType_0 == v6.LookType.Makeup then
                    v38[v6.AssetCategories.Makeup] = true;
                else
                    v38[v6.AssetCategories.Accessory] = true;
                    v38[v6.AssetCategories.Clothing] = true;
                    v38[v6.AssetCategories.Makeup] = true;
                end;
                for v39, v40 in l_EquippedAssets_0 do
                    local v41 = v6.AssetTypeIdToCategory[v39];
                    local v42 = false;
                    if l_LookType_0 == v6.LookType.Avatar then
                        v42 = v33 and v33[v39];
                    end;
                    if v38[v41] or v42 then
                        for v43, _ in v40 do
                            if v34 then
                                table.insert(v34, {
                                    assetTypeId = v39, 
                                    assetId = v43
                                });
                            else
                                v29:dispatch(v8(v39, v43, v26, true));
                            end;
                        end;
                    end;
                end;
            else
                for v45, v46 in l_EquippedAssets_0 do
                    local v47 = v6.AssetTypeIdToCategory[v45];
                    if v47 == v6.AssetCategories.Accessory or v47 == v6.AssetCategories.Clothing or l_LookType_0 == v6.LookType.Avatar and v33 and v33[v45] then
                        for v48, _ in v46 do
                            if v34 then
                                table.insert(v34, {
                                    assetTypeId = v45, 
                                    assetId = v48
                                });
                            else
                                v29:dispatch(v8(v45, v48, v26, true));
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local l_BodyColor3s_0 = v31.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s;
        local l_Scale_0 = v31.AvatarExperience.AvatarScene.OutfitTryOn.Scale;
        if l_BodyColor3s_0 then
            v29:dispatch(v10(l_BodyColor3s_0));
        end;
        if l_Scale_0 then
            v29:dispatch(v9(l_Scale_0));
        end;
        local v52 = {};
        if not v1.isEmpty(v25) and not v31.AvatarExperience.AvatarScene.Character.ShouldDelaySaveManager then
            v29:dispatch(v15());
        end;
        for _, v54 in v25 do
            if (v54.purchased or v54.owned) and not v54.assetIsWearable and v54.bundleId then
                local v55 = v4.getOutfitInfoFromBundleId(v31, v54.bundleId);
                if v55 then
                    local l_assets_0 = v55.assets;
                    local v57;
                    for _, v59 in v20 do
                        if not l_assets_0[v59] then
                            v57 = false;
                            v30 = true;
                        end;
                        if v30 then
                            break;
                        end;
                    end;
                    if not v30 then
                        v57 = true;
                    end;
                    v30 = false;
                    if v57 then
                        v57 = {
                            outfitInfo = v55, 
                            analytics = v27, 
                            navigation = v26, 
                            isSelected = false, 
                            fromOutfitPurchase = true, 
                            tryOnBundleInfo = v54.tryOnBundleInfo, 
                            blockFullReset = true
                        };
                        v29:dispatch(v7(v57));
                        v52[v54.bundleId] = true;
                    end;
                end;
            end;
        end;
        for _, v61 in v25 do
            local v62 = if v61.assetIsWearable then v61.assetId else v61.bundleId;
            if (v61.purchased or v61.owned) and v62 then
                if v61.assetType == v6.ItemType.Bundle then
                    if v52[v62] == nil then
                        local v63 = v4.getOutfitInfoFromBundleId(v31, v62);
                        local v64 = v4.getBundleInfoFromState(v31, v62);
                        local l_tryOnBundleInfo_0 = v61.tryOnBundleInfo;
                        if v63 then
                            local v66 = {
                                outfitInfo = v63, 
                                analytics = v27, 
                                navigation = v26, 
                                isSelected = false, 
                                fromOutfitPurchase = true, 
                                tryOnBundleInfo = v61.tryOnBundleInfo
                            };
                            v29:dispatch(v7(v66));
                        elseif l_tryOnBundleInfo_0 and l_LookType_0 == v6.LookType.Avatar then
                            assert(l_tryOnBundleInfo_0, "");
                            for v67, v68 in l_tryOnBundleInfo_0 do
                                local v69 = nil;
                                local v70 = nil;
                                if l_FFlagParseHeadShapeFromAPIResponse_0 and v68.assetType == v6.AssetTypeIdStrings.DynamicHead then
                                    v69 = v68.headShape;
                                    if l_FFlagHeadRefinementFacialAnimationToggle_0 then
                                        v70 = v68.staticFacialAnimation;
                                    end;
                                end;
                                local l_assetType_0 = v68.assetType;
                                local v72 = v31.AvatarExperience.AvatarEditor.Character.EquippedAssets[l_assetType_0];
                                local v73 = false;
                                if v72 then
                                    for v74, _ in v72 do
                                        if v74 == v67 then
                                            v73 = true;
                                            break;
                                        end;
                                    end;
                                    if v73 then
                                        continue;
                                    end;
                                end;
                                if v34 then
                                    local v76 = nil;
                                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v69 ~= nil then
                                        v76 = {
                                            headShape = v69
                                        };
                                    end;
                                    local v77 = nil;
                                    if l_FFlagHeadRefinementFacialAnimationToggle_0 and v70 ~= nil then
                                        v77 = {
                                            staticFacialAnimation = v70
                                        };
                                    end;
                                    local v78 = if not not v76 or v77 then v1.Dictionary.join(v76 or {}, v77 or {}) else nil;
                                    table.insert(v34, {
                                        assetTypeId = v68.assetType, 
                                        assetId = v67, 
                                        overrideOrder = nil, 
                                        overrideAdjustments = v78
                                    });
                                else
                                    v29:dispatch(v8(v68.assetType, v67, v26, true, nil));
                                end;
                            end;
                        elseif v64 then
                            assert(v64, "");
                            for _, v80 in v64.items do
                                local v81 = l_AssetInfos_0[v80.id];
                                if v81 and v81.assetType then
                                    local v82 = v61.tryOnBundleInfo and v61.tryOnBundleInfo[v80.id] and v61.tryOnBundleInfo[v80.id].order;
                                    v29:dispatch(v8(v81.assetType, v80.id, v26, true, v82));
                                end;
                            end;
                        end;
                    end;
                elseif v61.itemSubType and tostring(v61.itemSubType) ~= v6.AssetTypeIdStrings.EmoteAnimation then
                    local l_overrideOrder_0 = v61.overrideOrder;
                    local l_overrideAdjustments_0 = v61.overrideAdjustments;
                    local v85 = if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then l_LookType_0 == v6.LookType.Avatar else nil;
                    local v86 = if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then l_LookType_0 == v6.LookType.Makeup else nil;
                    if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 and (v86 or v85) or v34 and l_LookType_0 == v6.LookType.Avatar then
                        table.insert(v34, {
                            assetTypeId = tostring(v61.itemSubType), 
                            assetId = tostring(v62), 
                            overrideOrder = l_overrideOrder_0, 
                            overrideAdjustments = l_overrideAdjustments_0
                        });
                    else
                        v29:dispatch(v8(tostring(v61.itemSubType), tostring(v62), v26, true, l_overrideOrder_0, l_overrideAdjustments_0));
                    end;
                end;
            end;
        end;
        if v34 and #v34 > 0 then
            v29:dispatch(v12({
                assets = v34
            }));
        end;
    end;
end;