local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local v32 = {
    buildEquippedBodyStateMap = function(v9) --[[ Line: 35 ]]
        -- upvalues: v2 (copy)
        local v10 = {};
        for _, v12 in v9.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
            if v12.itemType == v2.ItemType.Bundle and v12.bundleInfo and v12.itemId == tostring(v2.BlockyBundleId) then
                for _, v14 in v12.bundleInfo do
                    if v2.AssetTypeIdToCategory[v14.assetType] == v2.AssetCategories.Body then
                        v10[v14.assetType] = v12.selectedInTryOnManager;
                    end;
                end;
            end;
        end;
        return v10;
    end, 
    shouldUnequipBodyBeforeTryOn = function(v15) --[[ Line: 62 ]]
        -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v2 (copy)
        if l_FFlagAXMISEnableMultiShopping_0 then
            return v15.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems == true;
        else
            local l_LookId_0 = v15.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
            local l_LookType_0 = v15.AvatarExperience.AvatarScene.OutfitTryOn.LookType;
            local v18 = false;
            if l_LookId_0 ~= nil then
                v18 = l_LookType_0 == v2.LookType.Avatar;
            end;
            return v18;
        end;
    end, 
    buildEquippedAssetMapByHumanoidDescriptionProp = function(v19) --[[ Line: 78 ]]
        -- upvalues: v2 (copy)
        local l_EquippedAssets_0 = v19.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local v21 = {};
        if l_EquippedAssets_0 then
            for v22, v23 in l_EquippedAssets_0 do
                local v24 = v2.AssetTypeIdStringToHumanoidDescriptionProp[v22];
                if v24 then
                    if not v21[v24] then
                        v21[v24] = {};
                    end;
                    table.insert(v21[v24], v23);
                end;
            end;
        end;
        return v21;
    end, 
    processBlockyBundleParts = function(v25) --[[ Line: 99 ]]
        -- upvalues: v2 (copy)
        local v26 = {
            [v2.AssetTypeIdStrings.Torso] = true, 
            [v2.AssetTypeIdStrings.RightArm] = true, 
            [v2.AssetTypeIdStrings.LeftArm] = true, 
            [v2.AssetTypeIdStrings.LeftLeg] = true, 
            [v2.AssetTypeIdStrings.RightLeg] = true, 
            [v2.AssetTypeIdStrings.DynamicHead] = true, 
            [v2.AssetTypeIdStrings.Head] = true
        };
        local v27 = 7;
        for _, v29 in v25 do
            for _, v31 in v29.assetsInBundle do
                if v31.isIncluded then
                    if tostring(v31.assetType) == v2.AssetTypeIdStrings.DynamicHead or tostring(v31.assetType) == v2.AssetTypeIdStrings.Head then
                        v26[v2.AssetTypeIdStrings.DynamicHead] = nil;
                        v26[v2.AssetTypeIdStrings.Head] = nil;
                        v27 = v27 - 2;
                    else
                        v26[tostring(v31.assetType)] = nil;
                        v27 = v27 - 1;
                    end;
                end;
            end;
        end;
        if v26[v2.AssetTypeIdStrings.DynamicHead] and v26[v2.AssetTypeIdStrings.Head] then
            v26[v2.AssetTypeIdStrings.Head] = nil;
            v27 = v27 - 1;
        end;
        return v26;
    end
};
v32.buildBlockyLookDetailItem = function(v33, v34) --[[ Line: 152 ]]
    -- upvalues: v5 (copy), v2 (copy), v32 (copy)
    local v35 = {
        itemType = v5.ContentType.Bundle, 
        bundleType = 1, 
        itemRestrictions = {}, 
        assetsInBundle = {}, 
        name = v34("Feature.Avatar.Label.DefaultBody"), 
        description = "", 
        id = tostring(v2.BlockyBundleId), 
        productId = 0, 
        isPurchasable = false, 
        priceInRobux = 0, 
        quantityOwned = 1, 
        tryOnItemOrder = 0
    };
    local v36 = 1;
    for v37, _ in (v32.processBlockyBundleParts(v33)) do
        table.insert(v35.assetsInBundle, {
            id = v36, 
            assetType = tonumber(v37) or 0, 
            isIncluded = true
        });
        v36 = v36 + 1;
    end;
    if #v35.assetsInBundle == 0 then
        return nil;
    else
        return v35;
    end;
end;
v32.adjustTryOnItemOrderForBlockyBundle = function(v39, v40, v41) --[[ Line: 202 ]]
    -- upvalues: v6 (copy), v2 (copy)
    local v42 = 0;
    for v43, v44 in v41 do
        if not v6.isItemSelectable(v44) then
            v42 = v43;
        end;
    end;
    local v45 = v42 + 1;
    for _, v47 in v39 do
        if v47.tryOnItemOrder and v45 <= v47.tryOnItemOrder then
            v47.tryOnItemOrder = v47.tryOnItemOrder + 1;
        end;
    end;
    for _, v49 in v40 do
        if v49.id == tostring(v2.BlockyBundleId) then
            v49.tryOnItemOrder = v45;
        elseif v49.tryOnItemOrder and v45 <= v49.tryOnItemOrder then
            v49.tryOnItemOrder = v49.tryOnItemOrder + 1;
        end;
    end;
end;
return v32;