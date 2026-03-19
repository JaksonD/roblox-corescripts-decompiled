local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_SlotEditorCategories_0 = v2.Constants.SlotEditorCategories;
local l_Categories_0 = v2.Enums.Categories;
local l_FFlagAXCustomizeMakeupSupport_0 = v4.FFlagAXCustomizeMakeupSupport;
local v9 = {};
for _, v11 in l_SlotEditorCategories_0 do
    for _, v13 in v11.slots do
        if not v13.hide and v13.assetTypes then
            for _, v15 in v13.assetTypes do
                v9[tostring(v15.Value)] = {
                    categoryKey = v11.nameTranslationKey, 
                    slotKey = v13.nameTranslationKey
                };
            end;
        end;
    end;
end;
if l_FFlagAXCustomizeMakeupSupport_0 then
    local l_nameTranslationKey_0 = l_SlotEditorCategories_0[l_Categories_0.Makeup].nameTranslationKey;
    v9[v5.AssetTypeIdStrings.EyeMakeup] = {
        categoryKey = l_nameTranslationKey_0, 
        slotKey = "Feature.Catalog.Label.EyeMakeup"
    };
    v9[v5.AssetTypeIdStrings.FaceMakeup] = {
        categoryKey = l_nameTranslationKey_0, 
        slotKey = "Feature.Catalog.Label.FaceMakeup"
    };
    v9[v5.AssetTypeIdStrings.LipMakeup] = {
        categoryKey = l_nameTranslationKey_0, 
        slotKey = "Feature.Catalog.Label.LipMakeup"
    };
end;
v9[v5.AssetTypeIdStrings.EmoteAnimation] = {
    categoryKey = l_SlotEditorCategories_0[l_Categories_0.Emotes].nameTranslationKey
};
local v17 = {
    [v5.BundleTypeIdStrings.BodyParts] = {
        categoryKey = l_SlotEditorCategories_0[l_Categories_0.Body].nameTranslationKey, 
        slotKey = "Feature.Catalog.Label.FullBody"
    }, 
    [v5.BundleTypeIdStrings.DynamicHead] = {
        categoryKey = l_SlotEditorCategories_0[l_Categories_0.Body].nameTranslationKey, 
        slotKey = "Feature.Avatar.Label.Head"
    }, 
    [v5.BundleTypeIdStrings.Shoes] = {
        categoryKey = l_SlotEditorCategories_0[l_Categories_0.Clothing].nameTranslationKey, 
        slotKey = "Feature.Avatar.Label.Shoes"
    }, 
    [v5.BundleTypeIdStrings.Animations] = {
        categoryKey = l_SlotEditorCategories_0[l_Categories_0.Animations].nameTranslationKey, 
        slotKey = "Feature.Avatar.Label.AnimationFullSet"
    }
};
return function(v18, v19) --[[ Line: 88 ]] --[[ Name: getEquipSlotForAssetType ]]
    -- upvalues: v5 (copy), v9 (copy), v17 (copy)
    if v18 == v5.ItemType.Asset then
        return v9[v19];
    elseif v18 == v5.ItemType.Bundle then
        return v17[v19];
    else
        return nil;
    end;
end;