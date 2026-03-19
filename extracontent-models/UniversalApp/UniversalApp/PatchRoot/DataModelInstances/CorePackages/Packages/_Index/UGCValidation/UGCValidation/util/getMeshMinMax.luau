local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.util.calculateMinMax);
local function v11(v5, v6, v7) --[[ Line: 14 ]] --[[ Name: getVerts ]]
    -- upvalues: v3 (copy), l_UGCValidationService_0 (copy)
    local v8, v9 = v3(function() --[[ Line: 19 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v5 (copy)
        return l_UGCValidationService_0:GetEditableMeshVerts(v5.editableMesh);
    end, v7);
    if not v8 then
        local v10 = "Failed to read mesh: " .. v5.fullName;
        if v6 then
            error(v10);
        end;
        return false, {
            v10
        };
    else
        return true, nil, v9;
    end;
end;
local function v21(v12, v13) --[[ Line: 36 ]] --[[ Name: getBoundsInfo ]]
    -- upvalues: v4 (copy)
    local v14 = nil;
    local v15 = nil;
    for _, v17 in pairs(v12) do
        local v18 = if v13 then v17 * v13 else v17;
        local v19, v20 = v4(v14, v15, v18, v18);
        v14 = v19;
        v15 = v20;
    end;
    return v14, v15;
end;
return function(v22, v23) --[[ Line: 47 ]] --[[ Name: getMeshMinMax ]]
    -- upvalues: v11 (copy), v21 (copy)
    local l_isServer_0 = v23.isServer;
    local v25, v26, v27 = v11(v22, l_isServer_0, v23);
    if not v25 then
        return v25, v26;
    elseif not v27 or #v27 == 0 then
        return false, {
            "Mesh: " .. v22.fullName .. " contains no verts"
        };
    else
        local v28, v29 = v21(v27, v22.scale);
        return true, nil, v28, v29;
    end;
end;