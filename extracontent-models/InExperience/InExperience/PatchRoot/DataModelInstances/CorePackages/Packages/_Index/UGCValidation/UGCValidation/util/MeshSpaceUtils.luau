local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.util.BoundsDataUtils);
local v2 = {};
local function _(v3, v4) --[[ Line: 16 ]] --[[ Name: toWorldSpace ]]
    return v3 * (v4 / 2);
end;
local function _(v6, v7) --[[ Line: 22 ]] --[[ Name: calculateLocalSpaceTransform ]]
    local v8 = v6.Rotation:Inverse() * v7.Rotation;
    local v9 = v6.Rotation:Inverse() * (v7.Position - v6.Position);
    return CFrame.new(v9) * v8;
end;
local function _(v11, v12, v13) --[[ Line: 30 ]] --[[ Name: calculateAcceptableBoundsWorldSpace ]]
    local v14 = v11.min * (v12 / 2);
    local v15 = v11.max * (v12 / 2);
    local v16 = (v14 + v15) * 0.5;
    local v17 = v15 - v14;
    return v16 + v13, v17;
end;
v2.clampAttachmentToBounds = function(v19, v20, v21, v22) --[[ Line: 43 ]] --[[ Name: clampAttachmentToBounds ]]
    -- upvalues: v1 (copy)
    v22 = v22 or 0.001;
    local v23 = v20.cframe * v19.CFrame;
    local v24 = v1.calculateBoundsCenters(v20.boundsData);
    local v25 = v1.calculateBoundsDimensions(v20.boundsData);
    assert(v24, "meshCenterPos is nil");
    assert(v25, "meshDimensions is nil");
    local v26 = v23.Position - v24;
    local v27 = v21.min * (v25 / 2);
    local v28 = v21.max * (v25 / 2);
    local v29 = {};
    for _, v31 in {
        "X", 
        "Y", 
        "Z"
    } do
        v29[v31] = {};
        local v32 = v29[v31];
        local v33 = v29[v31];
        local v34 = v27[v31] + v22;
        local v35 = v28[v31] - v22;
        v32.min = v34;
        v33.max = v35;
        if v29[v31].min > v29[v31].max then
            v32 = (v27[v31] + v28[v31]) * 0.5;
            v33 = v29[v31];
            v34 = v29[v31];
            v33.min = v32;
            v34.max = v32;
        end;
    end;
    local v36 = v24 + Vector3.new(math.clamp(v26.X, v29.X.min, v29.X.max), math.clamp(v26.Y, v29.Y.min, v29.Y.max), (math.clamp(v26.Z, v29.Z.min, v29.Z.max)));
    local v37 = v23.Rotation + v36;
    local l_cframe_0 = v20.cframe;
    local v39 = l_cframe_0.Rotation:Inverse() * v37.Rotation;
    local v40 = l_cframe_0.Rotation:Inverse() * (v37.Position - l_cframe_0.Position);
    return CFrame.new(v40) * v39;
end;
v2.calculateAcceptableBoundsLocalSpace = function(v41, v42, v43, v44) --[[ Line: 88 ]] --[[ Name: calculateAcceptableBoundsLocalSpace ]]
    local v45 = v41.min * (v43 / 2);
    local v46 = v41.max * (v43 / 2);
    local v47 = (v45 + v46) * 0.5;
    local v48 = v46 - v45;
    local v49 = v47 + v44;
    local l_v48_0 = v48;
    v46 = v42.cframe;
    v47 = CFrame.new(v49);
    v48 = v46.Rotation:Inverse() * v47.Rotation;
    local v51 = v46.Rotation:Inverse() * (v47.Position - v46.Position);
    return CFrame.new(v51) * v48, l_v48_0;
end;
return v2;