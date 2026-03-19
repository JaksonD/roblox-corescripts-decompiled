local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.calculateMinMax);
local v3 = {};
v3.combineBounds = function(v4, v5) --[[ Line: 23 ]] --[[ Name: combineBounds ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v6 = {};
    local v7, v8 = v2(v4.minMeshCorner, v4.maxMeshCorner, v5.minMeshCorner, v5.maxMeshCorner);
    v6.minMeshCorner = v7;
    v6.maxMeshCorner = v8;
    v7, v8 = v2(v4.minRigAttachment, v4.maxRigAttachment, v5.minRigAttachment, v5.maxRigAttachment);
    v6.minRigAttachment = v7;
    v6.maxRigAttachment = v8;
    v3.setOverallBounds(v6);
    return v6;
end;
v3.expandMeshBounds = function(v9, v10) --[[ Line: 36 ]] --[[ Name: expandMeshBounds ]]
    -- upvalues: v2 (copy)
    local v11, v12 = v2(v9.minMeshCorner, v9.maxMeshCorner, v10, v10);
    v9.minMeshCorner = v11;
    v9.maxMeshCorner = v12;
end;
v3.expandRigAttachmentBounds = function(v13, v14) --[[ Line: 41 ]] --[[ Name: expandRigAttachmentBounds ]]
    -- upvalues: v2 (copy)
    local v15, v16 = v2(v13.minRigAttachment, v13.maxRigAttachment, v14, v14);
    v13.minRigAttachment = v15;
    v13.maxRigAttachment = v16;
end;
v3.setOverallBounds = function(v17) --[[ Line: 46 ]] --[[ Name: setOverallBounds ]]
    -- upvalues: v2 (copy)
    local v18, v19 = v2(v17.minMeshCorner, v17.maxMeshCorner, v17.minRigAttachment, v17.maxRigAttachment);
    v17.minOverall = v18;
    v17.maxOverall = v19;
end;
v3.calculateBoundsCenters = function(v20) --[[ Line: 52 ]] --[[ Name: calculateBoundsCenters ]]
    local v21 = if v20.minMeshCorner and v20.maxMeshCorner then (v20.minMeshCorner + v20.maxMeshCorner) / 2 else nil;
    local v22 = if v20.minRigAttachment and v20.maxRigAttachment then (v20.minRigAttachment + v20.maxRigAttachment) / 2 else nil;
    if v20.minOverall and v20.maxOverall then
        return v21, v22, (v20.minOverall + v20.maxOverall) / 2;
    else
        return v21, v22, nil;
    end;
end;
v3.calculateBoundsDimensions = function(v23) --[[ Line: 66 ]] --[[ Name: calculateBoundsDimensions ]]
    local v24 = if v23.minMeshCorner and v23.maxMeshCorner then v23.maxMeshCorner - v23.minMeshCorner else nil;
    local v25 = if v23.minRigAttachment and v23.maxRigAttachment then v23.maxRigAttachment - v23.minRigAttachment else nil;
    if v23.minOverall and v23.maxOverall then
        return v24, v25, v23.maxOverall - v23.minOverall;
    else
        return v24, v25, nil;
    end;
end;
return v3;