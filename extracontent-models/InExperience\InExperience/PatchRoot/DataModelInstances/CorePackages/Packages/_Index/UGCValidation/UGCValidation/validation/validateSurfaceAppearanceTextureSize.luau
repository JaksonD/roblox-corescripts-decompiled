local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.validation.validateTextureSize);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.util.getEditableImageFromContext);
local v8 = require(l_Parent_0.util.ParseContentIds);
local l_flags_0 = l_Parent_0.flags;
local v10 = require(l_flags_0.getFFlagUGCValidateAccessoryAssetSurfaceAppearanceTextureLimits);
local v11 = game:DefineFastInt("AccessoryColorMapMaxSize", 1024);
local v12 = game:DefineFastInt("AccessoryMetalnessMapMaxSize", 256);
local v13 = game:DefineFastInt("AccessoryNormalMapMaxSize", 256);
local v14 = game:DefineFastInt("AccessoryRoughnessMapMaxSize", 256);
local v15 = {
    ColorMap = v11, 
    MetalnessMap = v12, 
    NormalMap = v13, 
    RoughnessMap = v14
};
return function(v16, v17) --[[ Line: 34 ]] --[[ Name: validateSurfaceAppearanceTextureSize ]]
    -- upvalues: v6 (copy), v8 (copy), v2 (copy), v7 (copy), v10 (copy), v3 (copy), v15 (copy), v5 (copy), v1 (copy)
    local v18 = tick();
    local l_v16_Descendants_0 = v16:GetDescendants();
    table.insert(l_v16_Descendants_0, v16);
    local v20 = v6.new();
    for _, v22 in l_v16_Descendants_0 do
        if v22:IsA("MeshPart") then
            local l_SurfaceAppearance_0 = v22:FindFirstChildWhichIsA("SurfaceAppearance");
            if l_SurfaceAppearance_0 then
                for _, v25 in (v8.parse(l_SurfaceAppearance_0, v2.TEXTURE_CONTENT_ID_FIELDS, v17)) do
                    local v26 = {
                        fullName = v25.instance:GetFullName() .. "." .. v25.fieldName, 
                        fieldName = v25.fieldName, 
                        contentId = v25.instance[v25.fieldName]
                    };
                    local v27, v28 = v7(v25.instance, v25.fieldName, v17);
                    if not v27 then
                        return false, {
                            "Failed to load texture data"
                        };
                    else
                        v26.editableImage = v28;
                        local v29 = nil;
                        v29 = if v10() and v17.assetTypeEnum then v3.getTextureLimit(v17.assetTypeEnum, v25.instance, v25.fieldName) else v15[v25.fieldName];
                        v20:updateReasons(v5(v26, nil, v17, v29));
                    end;
                end;
            end;
        end;
    end;
    v1.recordScriptTime(script.Name, v18, v17);
    return v20:getFinalResults();
end;