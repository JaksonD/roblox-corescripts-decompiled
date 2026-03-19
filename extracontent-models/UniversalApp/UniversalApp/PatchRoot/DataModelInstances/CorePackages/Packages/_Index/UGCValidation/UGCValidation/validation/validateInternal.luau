local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidationMakeupSupport);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.util.isMeshPartAccessory);
local v5 = require(l_Parent_0.util.isLayeredClothing);
local v6 = require(l_Parent_0.validation.validateLayeredClothingAccessory);
local v7 = require(l_Parent_0.validation.validateLegacyAccessory);
local v8 = require(l_Parent_0.validation.validateMeshPartAccessory);
local v9 = require(l_Parent_0.validation.validateMakeupAsset);
local v10 = require(l_Parent_0.validation.validateLimbsAndTorso);
local v11 = require(l_Parent_0.validation.validateDynamicHeadMeshPartFormat);
local v12 = require(l_Parent_0.validation.validatePackage);
local v13 = require(l_Parent_0.validation.ValidateEmoteAnimation);
local function v16(v14) --[[ Line: 20 ]] --[[ Name: validateBodyPartInternal ]]
    -- upvalues: v3 (copy), v11 (copy), v10 (copy)
    local l_assetTypeEnum_0 = v14.assetTypeEnum;
    assert(l_assetTypeEnum_0 ~= nil, "assetTypeEnum is required in validateBodyPartInternal");
    assert(v3.isBodyPart(l_assetTypeEnum_0));
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        return v11(v14);
    else
        return v10(v14);
    end;
end;
return function(v17) --[[ Line: 31 ]] --[[ Name: validateInternal ]]
    -- upvalues: v13 (copy), v2 (copy), v3 (copy), v9 (copy), v16 (copy), v12 (copy), v4 (copy), v5 (copy), v6 (copy), v8 (copy), v7 (copy)
    assert(v17.instances ~= nil, "instances required in validationContext for validateInternal");
    assert(v17.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateInternal");
    local l_instances_0 = v17.instances;
    local l_assetTypeEnum_1 = v17.assetTypeEnum;
    local l_validateMeshPartAccessories_0 = v17.validateMeshPartAccessories;
    if l_assetTypeEnum_1 == Enum.AssetType.EmoteAnimation then
        return v13.validate(v17);
    elseif v2() and v3.isMakeupAsset(l_assetTypeEnum_1) then
        return v9(v17);
    elseif v3.isBodyPart(l_assetTypeEnum_1) then
        return v16(v17);
    elseif l_assetTypeEnum_1 == Enum.AssetType.Model then
        return v12(v17);
    elseif l_validateMeshPartAccessories_0 then
        local v21 = l_instances_0[1];
        if v4(v21) then
            if v5(v21) then
                return v6(v17);
            else
                return v8(v17);
            end;
        else
            return v7(v17);
        end;
    elseif v5(l_instances_0[1]) then
        return v6(v17);
    else
        return v7(v17);
    end;
end;