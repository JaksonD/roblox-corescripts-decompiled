local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceCommon);
local _ = require(l_script_FirstAncestor_0.Types);
local l_ItemTypeEnum_0 = v2.Enums.ItemTypeEnum;
local v5 = {
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = "LCTops", 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = "LCTops", 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = "LCTops", 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = "LCBottoms", 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = "LCBottoms", 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = "LCBottoms"
};
getTryOnItemComparisonData = function(v6) --[[ Line: 19 ]] --[[ Name: getTryOnItemComparisonData ]]
    -- upvalues: v5 (copy), l_ItemTypeEnum_0 (copy)
    local v7 = {};
    local v8 = {};
    local v9 = false;
    local v10 = false;
    local function _(v11) --[[ Line: 29 ]] --[[ Name: addAssetTypeAndLayeredClothingCategory ]]
        -- upvalues: v7 (copy), v5 (ref), v8 (copy)
        v7[v11] = true;
        local v12 = v5[v11];
        if v12 then
            v8[v12] = true;
        end;
    end;
    if v6.itemType == l_ItemTypeEnum_0.Asset then
        local l_itemSubType_0 = v6.itemSubType;
        v7[l_itemSubType_0] = true;
        local v15 = v5[l_itemSubType_0];
        if v15 then
            v8[v15] = true;
        end;
        if v6.itemSubType == tostring(Enum.AssetType.Head.Value) or v6.itemSubType == tostring(Enum.AssetType.Face.Value) then
            v9 = true;
        end;
    elseif v6.itemType == l_ItemTypeEnum_0.Bundle and v6.bundleInfo then
        if v6.itemSubType == tostring(Enum.BundleType.DynamicHead.Value) then
            v10 = true;
        end;
        for _, v17 in v6.bundleInfo do
            local l_assetType_0 = v17.assetType;
            v7[l_assetType_0] = true;
            local v19 = v5[l_assetType_0];
            if v19 then
                v8[v19] = true;
            end;
        end;
    end;
    return {
        assetTypes = v7, 
        layeredClothingCategories = v8, 
        isClassicHeadOrFace = v9, 
        isDynamicHead = v10, 
        itemType = v6.itemType, 
        itemSubType = v6.itemSubType
    };
end;
return getTryOnItemComparisonData;