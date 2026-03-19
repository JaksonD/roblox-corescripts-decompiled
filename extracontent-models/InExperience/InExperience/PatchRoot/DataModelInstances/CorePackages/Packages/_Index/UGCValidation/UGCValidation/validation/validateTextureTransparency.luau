local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local function v6(v3) --[[ Line: 10 ]] --[[ Name: getIsOpaque ]]
    local v4 = v3:ReadPixelsBuffer(Vector2.new(0, 0), v3.Size);
    for v5 = 0, buffer.len(v4) - 1, 4 do
        if buffer.readu8(v4, v5 + 3) < 255 then
            return false;
        end;
    end;
    return true;
end;
return function(v7, v8) --[[ Line: 22 ]] --[[ Name: validateTextureTransparency ]]
    -- upvalues: v1 (copy), v6 (copy)
    local v9 = tick();
    if not v7.editableImage then
        v1.reportFailure(v1.ErrorType.validateTextureTransparency_InvalidTextureId, nil, v8);
        return false, {
            string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", v7.fullName)
        };
    elseif not v6(v7.editableImage) then
        v1.reportFailure(v1.ErrorType.validateTextureTransparency_TransparentTexture, nil, v8);
        return false, {
            string.format("Texture %s is not fully opaque. Please use an opaque texture.", v7.fullName)
        };
    else
        v1.recordScriptTime(script.Name, v9, v8);
        return true;
    end;
end;