local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.getMeshInfo);
local v4 = require(l_Parent_0.util.getMeshMinMax);
local v5 = require(l_Parent_0.util.getExpectedPartSize);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationConsolidateGetMeshInfos);
return function(v7, v8) --[[ Line: 14 ]] --[[ Name: getRenderMeshScale ]]
    -- upvalues: v6 (copy), v3 (copy), v1 (copy), v4 (copy), v5 (copy)
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    if v6() then
        local v12, v13, v14 = v3(v7, v1.MESH_CONTENT_TYPE.RENDER_MESH, v8);
        v9 = v12;
        v10 = v13;
        v11 = v14;
    else
        local v15, v16, v17 = v3(v7, v8);
        v9 = v15;
        v10 = v16;
        v11 = v17;
    end;
    if not v9 then
        return v9, v10;
    else
        local l_v11_0 = v11;
        local v19 = nil;
        local v20 = nil;
        local v21, v22, v23, v24 = v4(l_v11_0, v8);
        v9 = v21;
        v10 = v22;
        v19 = v23;
        v20 = v24;
        if not v9 then
            return v9, v10;
        else
            v21 = v20 - v19;
            return true, nil, v5(v7, v8) / v21;
        end;
    end;
end;