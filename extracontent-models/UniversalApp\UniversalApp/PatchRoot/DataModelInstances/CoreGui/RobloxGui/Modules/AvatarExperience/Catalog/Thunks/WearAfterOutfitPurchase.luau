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
local v19 = {
    v6.AssetTypeIdStrings.Torso, 
    v6.AssetTypeIdStrings.RightArm, 
    v6.AssetTypeIdStrings.LeftArm, 
    v6.AssetTypeIdStrings.LeftLeg, 
    v6.AssetTypeIdStrings.RightLeg
};
local _ = function(v20) --[[ Line: 45 ]] --[[ Name: isFullyQualifiedOutfit ]]
    -- upvalues: v19 (copy)
    for _, v22 in v19 do
        if not v20[v22] then
            return false;
        end;
    end;
    return true;
end;
return function(v24, v25, v26, _) --[[ Line: 55 ]]
    -- upvalues: v11 (copy), l_FFlagAXMakeupEquipping_0 (copy), v6 (copy), v8 (copy), v10 (copy), v9 (copy), v1 (copy), v15 (copy), v4 (copy), v19 (copy), v7 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v12 (copy)
    return function(v28) --[[ Line: 56 ]]
        -- upvalues: v11 (ref), l_FFlagAXMakeupEquipping_0 (ref), v6 (ref), v8 (ref), v25 (copy), v10 (ref), v9 (ref), v1 (ref), v24 (copy), v15 (ref), v4 (ref), v19 (ref), v26 (copy), v7 (ref), l_FFlagParseHeadShapeFromAPIResponse_0 (ref), l_FFlagHeadRefinementFacialAnimationToggle_0 (ref), v12 (ref)
        local v29 = false;
        local v30 = v28:getState();
        local l_AssetInfos_0 = v30.AvatarExperience.Common.AssetInfos;
        local v32 = v11.buildEquippedBodyStateMap(v30);
        local v33 = {};
        local l_EquippedAssets_0 = v30.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local l_LookId_0 = v30.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        local l_LookType_0 = v30.AvatarExperience.AvatarScene.OutfitTryOn.LookType;
        if l_EquippedAssets_0 and l_LookId_0 then
            if l_FFlagAXMakeupEquipping_0 then
                local v37 = {};
                if l_LookType_0 == v6.LookType.Makeup then
                    v37[v6.AssetCategories.Makeup] = true;
                else
                    v37[v6.AssetCategories.Accessory] = true;
                    v37[v6.AssetCategories.Clothing] = true;
                    v37[v6.AssetCategories.Makeup] = true;
                end;
                for v38, v39 in l_EquippedAssets_0 do
                    local v40 = v6.AssetTypeIdToCategory[v38];
                    local v41 = false;
                    if l_LookType_0 == v6.LookType.Avatar then
                        v41 = v32 and v32[v38];
                    end;
                    if v37[v40] or v41 then
                        for v42, _ in v39 do
                            if v33 then
                                table.insert(v33, {
                                    assetTypeId = v38, 
                                    assetId = v42
                                });
                            else
                                v28:dispatch(v8(v38, v42, v25, true));
                            end;
                        end;
                    end;
                end;
            else
                for v44, v45 in l_EquippedAssets_0 do
                    local v46 = v6.AssetTypeIdToCategory[v44];
                    if v46 == v6.AssetCategories.Accessory or v46 == v6.AssetCategories.Clothing or l_LookType_0 == v6.LookType.Avatar and v32 and v32[v44] then
                        for v47, _ in v45 do
                            if v33 then
                                table.insert(v33, {
                                    assetTypeId = v44, 
                                    assetId = v47
                                });
                            else
                                v28:dispatch(v8(v44, v47, v25, true));
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local l_BodyColor3s_0 = v30.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s;
        local l_Scale_0 = v30.AvatarExperience.AvatarScene.OutfitTryOn.Scale;
        if l_BodyColor3s_0 then
            v28:dispatch(v10(l_BodyColor3s_0));
        end;
        if l_Scale_0 then
            v28:dispatch(v9(l_Scale_0));
        end;
        local v51 = {};
        if not v1.isEmpty(v24) and not v30.AvatarExperience.AvatarScene.Character.ShouldDelaySaveManager then
            v28:dispatch(v15());
        end;
        for _, v53 in v24 do
            if (v53.purchased or v53.owned) and not v53.assetIsWearable and v53.bundleId then
                local v54 = v4.getOutfitInfoFromBundleId(v30, v53.bundleId);
                if v54 then
                    local l_assets_0 = v54.assets;
                    local v56;
                    for _, v58 in v19 do
                        if not l_assets_0[v58] then
                            v56 = false;
                            v29 = true;
                        end;
                        if v29 then
                            break;
                        end;
                    end;
                    if not v29 then
                        v56 = true;
                    end;
                    v29 = false;
                    if v56 then
                        v56 = {
                            outfitInfo = v54, 
                            analytics = v26, 
                            navigation = v25, 
                            isSelected = false, 
                            fromOutfitPurchase = true, 
                            tryOnBundleInfo = v53.tryOnBundleInfo, 
                            blockFullReset = true
                        };
                        v28:dispatch(v7(v56));
                        v51[v53.bundleId] = true;
                    end;
                end;
            end;
        end;
        for _, v60 in v24 do
            local v61 = if v60.assetIsWearable then v60.assetId else v60.bundleId;
            if (v60.purchased or v60.owned) and v61 then
                if v60.assetType == v6.ItemType.Bundle then
                    if v51[v61] == nil then
                        local v62 = v4.getOutfitInfoFromBundleId(v30, v61);
                        local v63 = v4.getBundleInfoFromState(v30, v61);
                        local l_tryOnBundleInfo_0 = v60.tryOnBundleInfo;
                        if v62 then
                            local v65 = {
                                outfitInfo = v62, 
                                analytics = v26, 
                                navigation = v25, 
                                isSelected = false, 
                                fromOutfitPurchase = true, 
                                tryOnBundleInfo = v60.tryOnBundleInfo
                            };
                            v28:dispatch(v7(v65));
                        elseif l_tryOnBundleInfo_0 and l_LookType_0 == v6.LookType.Avatar then
                            assert(l_tryOnBundleInfo_0, "");
                            for v66, v67 in l_tryOnBundleInfo_0 do
                                local v68 = nil;
                                local v69 = nil;
                                if l_FFlagParseHeadShapeFromAPIResponse_0 and v67.assetType == v6.AssetTypeIdStrings.DynamicHead then
                                    v68 = v67.headShape;
                                    if l_FFlagHeadRefinementFacialAnimationToggle_0 then
                                        v69 = v67.staticFacialAnimation;
                                    end;
                                end;
                                local l_assetType_0 = v67.assetType;
                                local v71 = v30.AvatarExperience.AvatarEditor.Character.EquippedAssets[l_assetType_0];
                                local v72 = false;
                                if v71 then
                                    for v73, _ in v71 do
                                        if v73 == v66 then
                                            v72 = true;
                                            break;
                                        end;
                                    end;
                                    if v72 then
                                        continue;
                                    end;
                                end;
                                if v33 then
                                    local v75 = nil;
                                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v68 ~= nil then
                                        v75 = {
                                            headShape = v68
                                        };
                                    end;
                                    local v76 = nil;
                                    if l_FFlagHeadRefinementFacialAnimationToggle_0 and v69 ~= nil then
                                        v76 = {
                                            staticFacialAnimation = v69
                                        };
                                    end;
                                    local v77 = if not not v75 or v76 then v1.Dictionary.join(v75 or {}, v76 or {}) else nil;
                                    table.insert(v33, {
                                        assetTypeId = v67.assetType, 
                                        assetId = v66, 
                                        overrideOrder = nil, 
                                        overrideAdjustments = v77
                                    });
                                else
                                    v28:dispatch(v8(v67.assetType, v66, v25, true, nil));
                                end;
                            end;
                        elseif v63 then
                            assert(v63, "");
                            for _, v79 in v63.items do
                                local v80 = l_AssetInfos_0[v79.id];
                                if v80 and v80.assetType then
                                    local v81 = v60.tryOnBundleInfo and v60.tryOnBundleInfo[v79.id] and v60.tryOnBundleInfo[v79.id].order;
                                    v28:dispatch(v8(v80.assetType, v79.id, v25, true, v81));
                                end;
                            end;
                        end;
                    end;
                elseif v60.itemSubType and tostring(v60.itemSubType) ~= v6.AssetTypeIdStrings.EmoteAnimation then
                    local l_overrideOrder_0 = v60.overrideOrder;
                    local l_overrideAdjustments_0 = v60.overrideAdjustments;
                    if v33 and l_LookType_0 == v6.LookType.Avatar then
                        table.insert(v33, {
                            assetTypeId = tostring(v60.itemSubType), 
                            assetId = tostring(v61), 
                            overrideOrder = l_overrideOrder_0, 
                            overrideAdjustments = l_overrideAdjustments_0
                        });
                    else
                        v28:dispatch(v8(tostring(v60.itemSubType), tostring(v61), v25, true, l_overrideOrder_0, l_overrideAdjustments_0));
                    end;
                end;
            end;
        end;
        if v33 and #v33 > 0 then
            v28:dispatch(v12({
                assets = v33
            }));
        end;
    end;
end;