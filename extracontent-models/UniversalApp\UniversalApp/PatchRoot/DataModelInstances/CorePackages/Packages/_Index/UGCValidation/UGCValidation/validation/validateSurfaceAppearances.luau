local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.FailureReasonsAccumulator);
return function(v4, v5) --[[ Line: 13 ]] --[[ Name: validateSurfaceAppearances ]]
    -- upvalues: v3 (copy), v1 (copy)
    local l_allowEditableInstances_0 = v5.allowEditableInstances;
    local l_v4_Descendants_0 = v4:GetDescendants();
    table.insert(l_v4_Descendants_0, v4);
    local v8 = v3.new();
    for _, v10 in pairs(l_v4_Descendants_0) do
        if v10:IsA("MeshPart") then
            local v11 = v10.TextureID ~= "";
            if l_allowEditableInstances_0 and not v11 then
                local l_TextureContent_0 = v10.TextureContent;
                v11 = l_TextureContent_0.Uri ~= nil and l_TextureContent_0.Uri ~= "" or l_TextureContent_0.Object ~= nil;
            end;
            local l_SurfaceAppearance_0 = v10:FindFirstChildWhichIsA("SurfaceAppearance");
            if v11 then
                if l_SurfaceAppearance_0 then
                    v1.reportFailure(v1.ErrorType.validateSurfaceAppearances_MeshPartHasTexture, nil, v5);
                    v8:updateReasons(false, {
                        (("TextureID and SurfaceAppearance are both defined for MeshPart (%*). Publishing will only use SurfaceApperance."):format((v10:GetFullName())))
                    });
                end;
            elseif not l_SurfaceAppearance_0 then
                v1.reportFailure(v1.ErrorType.validateSurfaceAppearances_MissingSurfaceAppearance, nil, v5);
                v8:updateReasons(false, {
                    (("(%*) has an empty TextureID and no child SurfaceAppearance instance. You need to define at least one of them."):format((v10:GetFullName())))
                });
            end;
        end;
    end;
    return v8:getFinalResults();
end;