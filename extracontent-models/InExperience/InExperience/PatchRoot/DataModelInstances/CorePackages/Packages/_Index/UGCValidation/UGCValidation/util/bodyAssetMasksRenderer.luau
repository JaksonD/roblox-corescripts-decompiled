local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.tryYield);
local v3 = require(l_Parent_0.util.getEditableMeshFromContext);
local l_getAssetMeshesValidationSpaceTransforms_0 = require(l_Parent_0.util.AssetCalculator).getAssetMeshesValidationSpaceTransforms;
local l_AssetService_0 = game:GetService("AssetService");
local v6 = require(l_Parent_0.flags.getFIntUGCValidationBodyAssetMaskHeightPixels);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidateTinyTrianglesIntersectFix);
local v8 = {};
v8.__index = v8;
v8.viewIds = {
    Front = "Front", 
    Back = "Back", 
    Left = "Left", 
    Right = "Right", 
    Top = "Top", 
    Bottom = "Bottom"
};
if v7() then
    v8.opposingViewIds = {
        Front = v8.viewIds.Back, 
        Back = v8.viewIds.Front, 
        Left = v8.viewIds.Right, 
        Right = v8.viewIds.Left, 
        Top = v8.viewIds.Bottom, 
        Bottom = v8.viewIds.Top
    };
end;
v8.viewDirections = {
    [v8.viewIds.Front] = Vector3.new(0, 0, 1, 0), 
    [v8.viewIds.Back] = Vector3.new(0, 0, -1, 0), 
    [v8.viewIds.Left] = Vector3.new(-1, 0, 0, 0), 
    [v8.viewIds.Right] = Vector3.new(1, 0, 0, 0), 
    [v8.viewIds.Top] = Vector3.new(0, -1, 0, 0), 
    [v8.viewIds.Bottom] = Vector3.new(0, 1, 0, 0)
};
v8.views = nil;
v8.getViewToWorldTransforms = function() --[[ Line: 73 ]] --[[ Name: getViewToWorldTransforms ]]
    -- upvalues: v8 (copy)
    if not v8.views then
        v8.views = {};
        for _, v10 in v8.viewIds do
            local v11 = v8.viewDirections[v10];
            local v12 = Vector3.new(0, 1, 0, 0);
            if math.abs((v11:Dot(v12))) > 0.99 then
                v12 = v8.viewDirections[v8.viewIds.Front];
            end;
            local v13 = CFrame.lookAlong(Vector3.new(0, 0, 0, 0), v11, v12);
            v8.views[v10] = v13;
        end;
    end;
    return v8.views;
end;
v8.getViewSpacePositionFromNormalized = function(v14, v15) --[[ Line: 92 ]] --[[ Name: getViewSpacePositionFromNormalized ]]
    local v16 = (v14 - Vector2.new(0.5, 0.5)) * Vector2.new(2, -2);
    local v17 = (v15.max - v15.min) / 2;
    return v15.min + v17 + v17 * Vector3.new(v16.X, v16.Y, 0);
end;
local function v23(v18) --[[ Line: 104 ]] --[[ Name: populateViewsToRender ]]
    -- upvalues: v8 (copy)
    local v19 = v8.getViewToWorldTransforms();
    local v20 = {};
    if v18 then
        for v21, v22 in v18 do
            if v22 and v19[v21] then
                v20[v21] = v19[v21];
            end;
        end;
        return v20;
    else
        return v19;
    end;
end;
local function v32(v24, v25, v26, v27) --[[ Line: 120 ]] --[[ Name: addTransformedTriangle ]]
    local l_v24_FaceVertices_0 = v24:GetFaceVertices(v25);
    local v29 = {};
    for v30 = 1, 3 do
        local v31 = v24:GetPosition(l_v24_FaceVertices_0[v30]) * v26.scale;
        table.insert(v29, v26.CFrame * v31);
    end;
    table.insert(v27, v29);
end;
local function v39(v33, v34, v35, v36) --[[ Line: 139 ]] --[[ Name: pushTransformedMesh ]]
    -- upvalues: v32 (copy), v2 (copy)
    for _, v38 in (v33:GetFaces()) do
        v32(v33, v38, v34, v36);
        v2(v35);
    end;
end;
local function v51(v40, v41) --[[ Line: 152 ]] --[[ Name: getViewSpaceMesh ]]
    local v42 = v41:Inverse();
    local v43 = {
        min = Vector3.new(1e999, 1e999, 1e999, 0), 
        max = Vector3.new(-1e999, -1e999, -1e999, 0)
    };
    local v44 = {};
    for _, v46 in v40 do
        local v47 = {};
        for _, v49 in v46 do
            local v50 = v42 * v49;
            table.insert(v47, v42 * v49);
            v43.min = v43.min:Min(v50);
            v43.max = v43.max:Max(v50);
        end;
        table.insert(v44, v47);
    end;
    return v44, v43;
end;
local _ = function(v52, v53, v54) --[[ Line: 179 ]] --[[ Name: getNormalizedCoordinates ]]
    local v55 = {};
    for _, v57 in v52 do
        table.insert(v55, (v57 - v53) / v54);
    end;
    return v55;
end;
local function _(v59) --[[ Line: 193 ]] --[[ Name: getIsNormalizedTriangleVisible ]]
    return (v59[2] - v59[1]):Cross(v59[3] - v59[1]).Z > 0.001;
end;
local function v63(v61, v62) --[[ Line: 204 ]] --[[ Name: normalizedSpaceToScreenSpace ]]
    return (Vector2.new(v61.X, v61.Y) * Vector2.new(0.5, -0.5) + Vector2.new(0.5, 0.5)) * (v62 - Vector2.new(1, 1));
end;
local function v82(v64, v65, v66, v67) --[[ Line: 211 ]] --[[ Name: rasterMesh ]]
    -- upvalues: l_AssetService_0 (copy), v63 (copy), v2 (copy)
    local v68 = v65.max - v65.min;
    local v69 = v68 / 2;
    local v70 = v65.min + v69;
    local v71 = v68.X / v68.Y * v66;
    local v72 = Vector2.new(v71, v66);
    v72 = (v72 * math.min(1024 / math.max(v72.X, v72.Y), 1) + Vector2.new(0.5)):Floor();
    local l_l_AssetService_0_EditableImage_0 = l_AssetService_0:CreateEditableImage({
        Size = v72
    });
    for _, v75 in v64 do
        local v76 = {};
        for _, v78 in v75 do
            table.insert(v76, (v78 - v70) / v69);
        end;
        local l_v76_0 = v76;
        if (l_v76_0[2] - l_v76_0[1]):Cross(l_v76_0[3] - l_v76_0[1]).Z > 0.001 then
            v76 = {};
            for _, v81 in l_v76_0 do
                table.insert(v76, (v63(v81, v72)));
            end;
            l_l_AssetService_0_EditableImage_0:DrawTriangle(v76[1], v76[2], v76[3], Color3.new(1, 1, 1), 0);
            v2(v67);
        end;
    end;
    return l_l_AssetService_0_EditableImage_0;
end;
local function v105(v83, v84, v85) --[[ Line: 250 ]] --[[ Name: createBodyAssetMasks ]]
    -- upvalues: l_getAssetMeshesValidationSpaceTransforms_0 (copy), v3 (copy), v39 (copy), v51 (copy), v6 (copy), v82 (copy)
    local l_assetTypeEnum_0 = v85.assetTypeEnum;
    local v87 = {};
    if v83:IsA("MeshPart") and v85.assetTypeEnum == Enum.AssetType.DynamicHead then
        table.insert(v87, v83);
    else
        for _, v89 in v83:GetChildren() do
            if v89:IsA("MeshPart") then
                table.insert(v87, v89);
            end;
        end;
    end;
    local v90 = l_getAssetMeshesValidationSpaceTransforms_0(v83, v85);
    local v91 = {};
    for _, v93 in v87 do
        local v94, v95 = v3(v93, "MeshId", v85);
        if not v94 then
            local v96 = string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v93.Name);
            if v85.isServer then
                error(v96);
            else
                return false, {
                    v96
                };
            end;
        end;
        v95:Triangulate();
        local v97 = v90[v93.Name];
        v39(v95, v97, v85, v91);
    end;
    if #v91 == 0 then
        return false, {
            string.format("Mesh for %s has no triangles.", l_assetTypeEnum_0.Name)
        };
    else
        local v98 = {};
        for v99, v100 in v84 do
            local v101, v102 = v51(v91, v100);
            local v103 = v6();
            local v104 = v82(v101, v102, v103, v85);
            v98[v99] = {
                viewId = v99, 
                mask = v104, 
                view = v100, 
                viewSpaceBounds = v102
            };
        end;
        return true, v98;
    end;
end;
v8.new = function(v106, v107, v108) --[[ Line: 312 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v23 (copy), v105 (copy)
    local v109 = setmetatable({}, v8);
    local v110 = v23(v107);
    local v111, v112 = v105(v106, v110, v108);
    if not v111 then
        return false, v112;
    else
        v109.bodyAssetMasks = v112;
        return true, v109;
    end;
end;
v8.destroyBodyAssetMasks = function(v113) --[[ Line: 327 ]] --[[ Name: destroyBodyAssetMasks ]]
    for _, v115 in v113.bodyAssetMasks do
        if v115.mask then
            v115.mask:Destroy();
            v115.mask = nil;
        end;
    end;
end;
return v8;