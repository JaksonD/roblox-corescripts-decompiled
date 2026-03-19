local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local l_flags_0 = l_Parent_0.flags;
local v5 = require(l_flags_0.getFFlagUGCValidateTextureSizeExtraErrorInfo);
local v6 = require(l_Parent_0.Analytics);
local v7 = require(l_Parent_0.Constants);
return function(v8, v9, v10, v11) --[[ Line: 14 ]] --[[ Name: validateTextureSize ]]
    -- upvalues: v7 (copy), v6 (copy), v3 (copy), l_UGCValidationService_0 (copy), v5 (copy)
    local v12 = tick();
    local l_isServer_0 = v10.isServer;
    if not v11 then
        v11 = v7.MAX_TEXTURE_SIZE;
    end;
    assert(v11, "maxTextureSize is required for validateTextureSize");
    if not v8.editableImage then
        if v9 then
            return true;
        else
            v6.reportFailure(v6.ErrorType.validateTextureSize_InvalidTextureId, nil, v10);
            return false, {
                string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", v8.fullName)
            };
        end;
    else
        local v14, v15 = v3(function() --[[ Line: 41 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v8 (copy)
            return l_UGCValidationService_0:GetEditableImageSize(v8.editableImage);
        end, v10);
        if not v14 then
            if l_isServer_0 ~= nil and l_isServer_0 then
                error(string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", v8.fullName));
            end;
            v6.reportFailure(v6.ErrorType.validateTextureSize_FailedToLoadTexture, nil, v10);
            return false, {
                string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", v8.fullName)
            };
        elseif v11 < v15.X or v11 < v15.Y then
            v6.reportFailure(v6.ErrorType.validateTextureSize_TextureTooBig, nil, v10);
            local v16 = v11 ~= v7.MAX_TEXTURE_SIZE;
            if v5() or v16 then
                return false, {
                    string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px for field '%s'.", v15.X, v15.Y, v8.fullName, v11, v11, v8.fieldName)
                };
            else
                return false, {
                    string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px. You need to reduce the texture resolution", v15.X, v15.Y, v8.fullName, v11, v11)
                };
            end;
        else
            v6.recordScriptTime(script.Name, v12, v10);
            return true;
        end;
    end;
end;