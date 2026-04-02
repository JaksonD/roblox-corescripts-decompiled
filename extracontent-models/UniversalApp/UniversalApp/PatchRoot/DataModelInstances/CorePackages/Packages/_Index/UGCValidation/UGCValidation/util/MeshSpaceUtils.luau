local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.util.BoundsDataUtils);
local v2 = require(l_Parent_0.util.getAttachmentCFrameInPartSpace);
local v3 = {};
local function _(v4, v5) --[[ Line: 20 ]] --[[ Name: toWorldSpace ]]
    return v4 * (v5 / 2);
end;
local function _(v7, v8) --[[ Line: 26 ]] --[[ Name: calculateLocalSpaceTransform ]]
    local v9 = v7.Rotation:Inverse() * v8.Rotation;
    local v10 = v7.Rotation:Inverse() * (v8.Position - v7.Position);
    return CFrame.new(v10) * v9;
end;
local function _(v12, v13, v14) --[[ Line: 34 ]] --[[ Name: calculateAcceptableBoundsWorldSpace ]]
    local v15 = v12.min * (v13 / 2);
    local v16 = v12.max * (v13 / 2);
    local v17 = (v15 + v16) * 0.5;
    local v18 = v16 - v15;
    return v17 + v14, v18;
end;
v3.clampAttachmentToBounds = function(v20, v21, v22, v23) --[[ Line: 47 ]] --[[ Name: clampAttachmentToBounds ]]
    -- upvalues: v2 (copy), v1 (copy)
    v23 = v23 or 0.001;
    local v24 = v21.cframe * v2(v20);
    local v25 = v1.calculateBoundsCenters(v21.boundsData);
    local v26 = v1.calculateBoundsDimensions(v21.boundsData);
    assert(v25, "meshCenterPos is nil");
    assert(v26, "meshDimensions is nil");
    local v27 = v24.Position - v25;
    local v28 = v22.min * (v26 / 2);
    local v29 = v22.max * (v26 / 2);
    local v30 = {};
    for _, v32 in {
        "X", 
        "Y", 
        "Z"
    } do
        v30[v32] = {};
        local v33 = v30[v32];
        local v34 = v30[v32];
        local v35 = v28[v32] + v23;
        local v36 = v29[v32] - v23;
        v33.min = v35;
        v34.max = v36;
        if v30[v32].min > v30[v32].max then
            v33 = (v28[v32] + v29[v32]) * 0.5;
            v34 = v30[v32];
            v35 = v30[v32];
            v34.min = v33;
            v35.max = v33;
        end;
    end;
    local v37 = v25 + Vector3.new(math.clamp(v27.X, v30.X.min, v30.X.max), math.clamp(v27.Y, v30.Y.min, v30.Y.max), (math.clamp(v27.Z, v30.Z.min, v30.Z.max)));
    local v38 = v24.Rotation + v37;
    local l_cframe_0 = v21.cframe;
    local v40 = l_cframe_0.Rotation:Inverse() * v38.Rotation;
    local v41 = l_cframe_0.Rotation:Inverse() * (v38.Position - l_cframe_0.Position);
    return CFrame.new(v41) * v40;
end;
v3.calculateAcceptableBoundsLocalSpace = function(v42, v43, v44, v45) --[[ Line: 92 ]] --[[ Name: calculateAcceptableBoundsLocalSpace ]]
    local v46 = v42.min * (v44 / 2);
    local v47 = v42.max * (v44 / 2);
    local v48 = (v46 + v47) * 0.5;
    local v49 = v47 - v46;
    local v50 = v48 + v45;
    local l_v49_0 = v49;
    v47 = v43.cframe;
    v48 = CFrame.new(v50);
    v49 = v47.Rotation:Inverse() * v48.Rotation;
    local v52 = v47.Rotation:Inverse() * (v48.Position - v47.Position);
    return CFrame.new(v52) * v49, l_v49_0;
end;
return v3;