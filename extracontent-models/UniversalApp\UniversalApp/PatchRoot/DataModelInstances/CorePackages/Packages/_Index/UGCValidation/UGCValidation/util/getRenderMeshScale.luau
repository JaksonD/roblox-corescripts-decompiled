local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.getMeshInfo);
local v4 = require(l_Parent_0.util.getMeshMinMax);
local v5 = require(l_Parent_0.util.getExpectedPartSize);
return function(v6, v7) --[[ Line: 12 ]] --[[ Name: getRenderMeshScale ]]
    -- upvalues: v3 (copy), v1 (copy), v4 (copy), v5 (copy)
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11, v12, v13 = v3(v6, v1.MESH_CONTENT_TYPE.RENDER_MESH, v7);
    v8 = v11;
    v9 = v12;
    v10 = v13;
    if not v8 then
        return v8, v9;
    else
        v11 = v10;
        v12 = nil;
        v13 = nil;
        local v14, v15, v16, v17 = v4(v11, v7);
        v8 = v14;
        v9 = v15;
        v12 = v16;
        v13 = v17;
        if not v8 then
            return v8, v9;
        else
            v14 = v13 - v12;
            return true, nil, v5(v6, v7) / v14;
        end;
    end;
end;