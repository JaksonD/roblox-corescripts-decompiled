local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
return function(v3) --[[ Line: 7 ]] --[[ Name: getMeshSize ]]
    -- upvalues: l_UGCValidationService_0 (copy)
    local l_l_UGCValidationService_0_EditableMeshVerts_0 = l_UGCValidationService_0:GetEditableMeshVerts(v3.editableMesh);
    local v5 = 1e999;
    local v6 = -1e999;
    local v7 = 1e999;
    local v8 = -1e999;
    local v9 = 1e999;
    local v10 = -1e999;
    for v11 = 1, #l_l_UGCValidationService_0_EditableMeshVerts_0 do
        local v12 = l_l_UGCValidationService_0_EditableMeshVerts_0[v11];
        v5 = math.min(v5, v12.X);
        v7 = math.min(v7, v12.Y);
        v9 = math.min(v9, v12.Z);
        v6 = math.max(v6, v12.X);
        v8 = math.max(v8, v12.Y);
        v10 = math.max(v10, v12.Z);
    end;
    return (Vector3.new(v6 - v5, v8 - v7, v10 - v9));
end;