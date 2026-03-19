local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceCommon);
local _ = require(l_script_FirstAncestor_0.Types);
local l_ItemTypeEnum_0 = v2.Enums.ItemTypeEnum;
shouldReplaceTryOn = function(v5, v6) --[[ Line: 20 ]] --[[ Name: shouldReplaceTryOn ]]
    -- upvalues: l_ItemTypeEnum_0 (copy)
    if v5.isDynamicHead and v6.isClassicHeadOrFace then
        return true;
    elseif v5.isClassicHeadOrFace and v6.isDynamicHead then
        return true;
    else
        if v5.itemType == l_ItemTypeEnum_0.Asset and v6.itemType == l_ItemTypeEnum_0.Asset then
            if v5.itemSubType == v6.itemSubType then
                return true;
            else
                for v7, _ in v6.layeredClothingCategories do
                    if v5.layeredClothingCategories[v7] then
                        return true;
                    end;
                end;
            end;
        end;
        if v5.itemType == l_ItemTypeEnum_0.Bundle then
            if v6.itemType == l_ItemTypeEnum_0.Bundle and v5.itemSubType == v6.itemSubType then
                return true;
            else
                local v9 = false;
                if v6.itemType == l_ItemTypeEnum_0.Bundle then
                    v9 = v6.itemSubType == tostring(Enum.BundleType.BodyParts.Value);
                end;
                for v10, _ in v5.assetTypes do
                    if v6.assetTypes[v10] and not v9 then
                        return true;
                    end;
                end;
                for v12, _ in v5.layeredClothingCategories do
                    if v6.layeredClothingCategories[v12] and not v9 then
                        return true;
                    end;
                end;
            end;
        end;
        return false;
    end;
end;
return shouldReplaceTryOn;