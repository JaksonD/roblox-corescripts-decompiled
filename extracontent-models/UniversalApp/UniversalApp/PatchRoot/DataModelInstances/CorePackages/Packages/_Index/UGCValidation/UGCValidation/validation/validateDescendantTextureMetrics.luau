local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.validation.validateTextureSize);
local v5 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v6 = require(l_Parent_0.util.ParseContentIds);
local v7 = require(l_Parent_0.util.getEditableImageFromContext);
local l_flags_0 = l_Parent_0.flags;
local v9 = require(l_flags_0.getFFlagUGCValidateBodyAssetTextureLimits);
return function(v10, v11) --[[ Line: 20 ]] --[[ Name: validateDescendantTextureMetrics ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), v7 (copy), v9 (copy), v3 (copy), v4 (copy)
    local v12 = v5.new();
    local v13 = v6.parse(v10, v2.TEXTURE_CONTENT_ID_FIELDS, v11);
    local v14 = {};
    for _, v16 in v13 do
        local v17 = {
            fullName = v16.instance:GetFullName(), 
            fieldName = v16.fieldName, 
            contentId = v16.instance[v16.fieldName]
        };
        local v18, v19 = v7(v16.instance, v16.fieldName, v11);
        if not v18 then
            return false, {
                "Failed to load texture data"
            };
        else
            v17.editableImage = v19;
            if not v14[v16.id] then
                local v20 = nil;
                if v9() then
                    v20 = v3.getTextureLimit(v11.assetTypeEnum, v16.instance, v16.fieldName);
                end;
                v12:updateReasons(v4(v17, nil, v11, v20));
                if v16.id then
                    v14[v16.id] = true;
                end;
            end;
        end;
    end;
    return v12:getFinalResults();
end;