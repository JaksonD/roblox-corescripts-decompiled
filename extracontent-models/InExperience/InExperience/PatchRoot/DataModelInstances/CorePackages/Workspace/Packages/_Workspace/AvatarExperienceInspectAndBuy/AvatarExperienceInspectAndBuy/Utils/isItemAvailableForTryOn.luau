local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Types);
local v3 = require(l_Parent_0.AXCommon);
local l_Constants_0 = v3.Constants;
local l_ASSET_TYPE_TO_ACCESSORY_TYPE_0 = l_Constants_0.ASSET_TYPE_TO_ACCESSORY_TYPE;
local l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0 = l_Constants_0.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP;
local l_LAYERED_ASSET_TYPES_0 = l_Constants_0.LAYERED_ASSET_TYPES;
local l_AVATAR_ANIMATIONS_BUNDLE_TYPE_ID_0 = l_Constants_0.AVATAR_ANIMATIONS_BUNDLE_TYPE_ID;
local l_SHOES_BUNDLE_TYPE_ID_0 = l_Constants_0.SHOES_BUNDLE_TYPE_ID;
local l_ItemTypeEnum_0 = v3.Enums.ItemTypeEnum;
return function(v11, v12) --[[ Line: 20 ]] --[[ Name: isItemAvailableForTryOn ]]
    -- upvalues: l_ItemTypeEnum_0 (copy), l_AVATAR_ANIMATIONS_BUNDLE_TYPE_ID_0 (copy), l_SHOES_BUNDLE_TYPE_ID_0 (copy), l_ASSET_TYPE_TO_ACCESSORY_TYPE_0 (copy), l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0 (copy), l_LAYERED_ASSET_TYPES_0 (copy)
    local l_itemSubType_0 = v12.itemSubType;
    local v14 = v11 and v11.Humanoid and v11.Humanoid.RigType == Enum.HumanoidRigType.R6;
    if v12.itemType == l_ItemTypeEnum_0.Bundle and l_itemSubType_0 == l_AVATAR_ANIMATIONS_BUNDLE_TYPE_ID_0 then
        return false;
    elseif v12.itemType == l_ItemTypeEnum_0.Bundle and l_itemSubType_0 == l_SHOES_BUNDLE_TYPE_ID_0 and v14 then
        return false;
    elseif v12.itemType == l_ItemTypeEnum_0.Asset then
        if not l_itemSubType_0 then
            return false;
        else
            local v15 = true;
            if l_ASSET_TYPE_TO_ACCESSORY_TYPE_0[l_itemSubType_0] == nil then
                v15 = l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0[l_itemSubType_0] ~= nil;
            end;
            local v16 = v14 and l_LAYERED_ASSET_TYPES_0[l_itemSubType_0] ~= nil;
            return v15 and not v16;
        end;
    else
        return true;
    end;
end;