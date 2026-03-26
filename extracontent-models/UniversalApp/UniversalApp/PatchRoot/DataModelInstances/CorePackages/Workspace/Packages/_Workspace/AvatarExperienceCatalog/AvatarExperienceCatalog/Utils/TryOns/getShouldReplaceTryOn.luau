local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceCommon);
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local _ = require(l_script_FirstAncestor_0.Types);
local l_Constants_0 = v2.Constants;
local l_ItemTypeEnum_0 = v2.Enums.ItemTypeEnum;
local l_FFlagAXCatalogMakeupSupport_0 = v3.FFlagAXCatalogMakeupSupport;
shouldReplaceTryOn = function(v8, v9) --[[ Line: 24 ]] --[[ Name: shouldReplaceTryOn ]]
    -- upvalues: l_ItemTypeEnum_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_Constants_0 (copy)
    if v8.isDynamicHead and v9.isClassicHeadOrFace then
        return true;
    elseif v8.isClassicHeadOrFace and v9.isDynamicHead then
        return true;
    else
        if v8.itemType == l_ItemTypeEnum_0.Asset and v9.itemType == l_ItemTypeEnum_0.Asset then
            if v8.itemSubType == v9.itemSubType and (not l_FFlagAXCatalogMakeupSupport_0 or not l_Constants_0.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[v9.itemSubType]) then
                return true;
            else
                for v10, _ in v9.layeredClothingCategories do
                    if v8.layeredClothingCategories[v10] then
                        return true;
                    end;
                end;
            end;
        end;
        if v8.itemType == l_ItemTypeEnum_0.Bundle then
            if v9.itemType == l_ItemTypeEnum_0.Bundle and v8.itemSubType == v9.itemSubType then
                return true;
            else
                local v12 = false;
                if v9.itemType == l_ItemTypeEnum_0.Bundle then
                    v12 = v9.itemSubType == tostring(Enum.BundleType.BodyParts.Value);
                end;
                for v13, _ in v8.assetTypes do
                    if v9.assetTypes[v13] and not v12 then
                        return true;
                    end;
                end;
                for v15, _ in v8.layeredClothingCategories do
                    if v9.layeredClothingCategories[v15] and not v12 then
                        return true;
                    end;
                end;
            end;
        end;
        return false;
    end;
end;
return shouldReplaceTryOn;