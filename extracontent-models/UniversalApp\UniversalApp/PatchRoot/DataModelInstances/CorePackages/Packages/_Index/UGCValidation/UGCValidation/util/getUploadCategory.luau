local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.validationSystem.ValidationEnums);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.flags.getFStringUGCLCAllowedAssetTypeIds);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidateMakeupAssetTypeNewPipeline);
local v6 = string.split(v4(), ",");
return function(v7, v8, v9) --[[ Line: 9 ]] --[[ Name: getUploadCategory ]]
    -- upvalues: v1 (copy), v2 (copy), v6 (copy), v5 (copy), v3 (copy)
    if v9 ~= nil then
        if v9 == Enum.BundleType.BodyParts then
            return v1.UploadCategory.FULL_BODY;
        else
            return v1.UploadCategory.BOTH_SHOES;
        end;
    else
        assert(v8);
        local v10 = nil;
        if v8 == Enum.AssetType.EmoteAnimation then
            v10 = v1.UploadCategory.EMOTE_ANIMATION;
        elseif v2.ASSET_TYPE_INFO[v8] and v2.ASSET_TYPE_INFO[v8].isBodyPart then
            v10 = v8 == Enum.AssetType.DynamicHead and v1.UploadCategory.DYNAMIC_HEAD or v1.UploadCategory.TORSO_AND_LIMBS;
        elseif table.find(v6, (tostring(v8.Value))) then
            v10 = v1.UploadCategory.LAYERED_CLOTHING;
        elseif v2.ASSET_TYPE_INFO[v8] and v2.ASSET_TYPE_INFO[v8].rigidAllowed then
            v10 = v1.UploadCategory.RIGID_ACCESSORY;
        elseif v5() and v3.isMakeupAsset(v8) then
            v10 = v1.UploadCategory.MAKEUP;
        end;
        if v10 == nil then
            error((("No assigned validation category for %*, %*, %* "):format(v7.Name, v8, v9)));
        end;
        return v10;
    end;
end;