local l_AssetService_0 = game:GetService("AssetService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.tryYield);
local v4 = {};
local function _(v5, v6, v7) --[[ Line: 29 ]] --[[ Name: orthoProjectCoordinate ]]
    local v8 = v5:Dot(v7);
    local v9 = v6:Dot(v7);
    return Vector2.new(v8, v9);
end;
local function _(v11, v12) --[[ Line: 36 ]] --[[ Name: shouldRenderTriangle ]]
    return v11:Dot(v12) < 0;
end;
v4.shouldRenderTriangle_UNIT_TEST = function(v14, v15) --[[ Line: 40 ]] --[[ Name: shouldRenderTriangle_UNIT_TEST ]]
    return v14:Dot(v15) < 0;
end;
local function v39(v16, v17, v18, v19, v20) --[[ Line: 44 ]] --[[ Name: getScreenCoordinatesForTriangle ]]
    local v21 = v16[1];
    local v22 = v16[2];
    local v23 = v16[3];
    local v24 = CFrame.new(v19):Inverse() * v21;
    local v25 = CFrame.new(v19):Inverse() * v22;
    local v26 = CFrame.new(v19):Inverse() * v23;
    local v27 = v20 / 2;
    local v28 = (v24 + v27) / v20;
    local v29 = (v25 + v27) / v20;
    local v30 = (v26 + v27) / v20;
    local l_axis1_0 = v18.axis1;
    local l_axis2_0 = v18.axis2;
    local v33 = l_axis1_0:Dot(v28);
    local v34 = l_axis2_0:Dot(v28);
    local v35 = Vector2.new(v33, v34) * (v17 - Vector2.new(1, 1));
    l_axis2_0 = v18.axis1;
    v33 = v18.axis2;
    v34 = l_axis2_0:Dot(v29);
    local v36 = v33:Dot(v29);
    local v37 = Vector2.new(v34, v36) * (v17 - Vector2.new(1, 1));
    v33 = v18.axis1;
    v34 = v18.axis2;
    v36 = v33:Dot(v30);
    local v38 = v34:Dot(v30);
    return v35, v37, Vector2.new(v36, v38) * (v17 - Vector2.new(1, 1));
end;
v4.rasterMesh = function(v40, v41, v42, v43, v44, v45) --[[ Line: 71 ]] --[[ Name: rasterMesh ]]
    -- upvalues: l_AssetService_0 (copy), v39 (copy), v3 (copy)
    local l_l_AssetService_0_EditableImage_0 = l_AssetService_0:CreateEditableImage({
        Size = v41
    });
    for _, v48 in v40 do
        if v48.normal:Dot(v42.normal) < 0 then
            local v49, v50, v51 = v39(v48.orderedVerts, l_l_AssetService_0_EditableImage_0.Size, v42, v43, v44);
            l_l_AssetService_0_EditableImage_0:DrawTriangle(v49, v50, v51, Color3.new(1, 1, 1), 0);
            v3(v45);
        end;
    end;
    return l_l_AssetService_0_EditableImage_0;
end;
return v4;