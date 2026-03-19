local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v6 = require(l_Parent_0.util.getEditableImageFromContext);
local v7 = require(l_Parent_0.util.ParseContentIds);
local v8 = require(l_Parent_0.validation.validateMakeupDecalUVZones);
local v9 = require(l_Parent_0.flags.getFFlagUGCValidateDecalTextureLimits);
local v10 = require(l_Parent_0.validation.validateTextureSize);
return function(v11, v12) --[[ Line: 23 ]] --[[ Name: validateMakeupDecal ]]
    -- upvalues: v5 (copy), v7 (copy), v2 (copy), v6 (copy), v1 (copy), v9 (copy), v3 (copy), v10 (copy), v8 (copy)
    local v13 = tick();
    local l_assetTypeEnum_0 = v12.assetTypeEnum;
    local l_WrapTextureTransfer_0 = v11:FindFirstChildOfClass("WrapTextureTransfer");
    assert(l_WrapTextureTransfer_0 ~= nil, string.format("WrapTextureTransfer child not found for %s", v11.Name));
    local v16 = v5.new();
    local v17 = v7.parse(v11, v2.TEXTURE_CONTENT_ID_FIELDS, v12);
    local v18 = nil;
    for _, v20 in v17 do
        local v21 = {
            fullName = v20.instance:GetFullName() .. "." .. v20.fieldName, 
            fieldName = v20.fieldName, 
            contentId = v20.instance[v20.fieldName]
        };
        local v22, v23 = v6(v20.instance, v20.fieldName, v12);
        if not v22 then
            v1.reportFailure(v1.ErrorType.validateMakeupDecal_FailedToLoadTexture, nil, v12);
            v16:updateReasons(false, {
                string.format("Failed to load %s for Decal %s. Make sure TextureContent exists and is valid and try again.", v21.fieldName, v11.Name)
            });
        end;
        v21.editableImage = v23;
        if v20.fieldName == "ColorMap" then
            v18 = v23;
        end;
        local v24 = nil;
        if v9() and l_assetTypeEnum_0 then
            v24 = v3.getTextureLimit(l_assetTypeEnum_0, v20.instance, v20.fieldName);
        end;
        v16:updateReasons(v10(v21, nil, v12, v24));
    end;
    if not v18 then
        v1.reportFailure(v1.ErrorType.validateMakeupDecal_NoColorMap, nil, v12);
        return false, {
            string.format("No ColorMap found for Decal %s. Makeup Decals are required to have a valid ColorMap.", v11.Name)
        };
    else
        v16:updateReasons(v8(v11, v18, l_WrapTextureTransfer_0, v2.MAKEUP_INFO.AssetUVBounds[l_assetTypeEnum_0], v12));
        v1.recordScriptTime(script.Name, v13, v12);
        return v16:getFinalResults();
    end;
end;