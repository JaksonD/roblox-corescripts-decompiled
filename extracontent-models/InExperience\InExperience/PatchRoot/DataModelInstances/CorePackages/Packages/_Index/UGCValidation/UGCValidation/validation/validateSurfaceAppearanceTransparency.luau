local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.validation.validateTextureTransparency);
local v5 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v6 = require(l_Parent_0.util.getEditableImageFromContext);
local v7 = require(l_Parent_0.util.ParseContentIds);
local v8 = {
    ColorMap = true, 
    NormalMap = true
};
return function(v9, v10) --[[ Line: 22 ]] --[[ Name: validateSurfaceAppearanceTransparency ]]
    -- upvalues: v5 (copy), v1 (copy), v7 (copy), v2 (copy), v8 (copy), v6 (copy), v4 (copy)
    local v11 = tick();
    local l_v9_Descendants_0 = v9:GetDescendants();
    table.insert(l_v9_Descendants_0, v9);
    local v13 = v5.new();
    for _, v15 in l_v9_Descendants_0 do
        if v15:IsA("MeshPart") then
            local l_SurfaceAppearance_0 = v15:FindFirstChildWhichIsA("SurfaceAppearance");
            if l_SurfaceAppearance_0 then
                if l_SurfaceAppearance_0.AlphaMode ~= Enum.AlphaMode.Overlay then
                    v1.reportFailure(v1.ErrorType.validateSurfaceAppearances_InvalidAlphaMode, nil, v10);
                    v13:updateReasons(false, {
                        (("SurfaceAppearance (%*) has an invalid AlphaMode. Expected Enum.AlphaMode.Overlay"):format((v15:GetFullName())))
                    });
                end;
                for _, v18 in (v7.parse(l_SurfaceAppearance_0, v2.TEXTURE_CONTENT_ID_FIELDS, v10)) do
                    if v8[v18.fieldName] then
                        local v19 = {
                            fullName = v18.instance:GetFullName(), 
                            fieldName = v18.fieldName, 
                            contentId = v18.instance[v18.fieldName]
                        };
                        local v20, v21 = v6(v18.instance, v18.fieldName, v10);
                        if not v20 then
                            return false, {
                                "Failed to load texture data"
                            };
                        else
                            v19.editableImage = v21;
                            v13:updateReasons(v4(v19, v10));
                        end;
                    end;
                end;
            end;
        end;
    end;
    v1.recordScriptTime(script.Name, v11, v10);
    return v13:getFinalResults();
end;