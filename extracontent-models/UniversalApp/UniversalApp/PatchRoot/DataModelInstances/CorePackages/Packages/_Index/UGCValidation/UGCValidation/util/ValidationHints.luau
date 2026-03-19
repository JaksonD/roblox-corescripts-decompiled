local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.BoundsCalculator);
local v4 = require(l_Parent_0.util.BoundsDataUtils);
local v5 = require(l_Parent_0.util.ParseContentIds);
local v6 = require(l_Parent_0.util.getMeshInfo);
local v7 = require(l_Parent_0.util.getMeshVerts);
local v8 = {};
local v9 = {
    MeshPart = {
        "MeshId"
    }
};
local v10 = {
    MeshPart = {
        MeshId = true
    }
};
local function v13(v11, v12) --[[ Line: 34 ]] --[[ Name: validateMeshIds ]]
    -- upvalues: v5 (copy), v9 (copy), v10 (copy)
    if not v5.parseWithErrorCheck({}, {}, v11, v9, v10, v12) then
        return false, {
            v11.Name .. " does not have a MeshId"
        };
    else
        return true;
    end;
end;
local function v29(v14, v15) --[[ Line: 52 ]] --[[ Name: validateAllMeshParts ]]
    -- upvalues: v1 (copy), v13 (copy)
    for _, v17 in v1.ASSET_TYPE_INFO do
        if v17.isBodyPart then
            for v18, v19 in pairs(v17.subParts) do
                local v20 = v14[v18];
                if not v20 or v20.ClassName ~= "MeshPart" then
                    return false, {
                        v18 .. " missing"
                    };
                elseif v20.Name ~= v18 then
                    return false, {
                        v18 .. " input data is incorrectly set-up"
                    };
                else
                    local v21, v22 = v13(v20, v15);
                    if not v21 then
                        return false, v22;
                    else
                        local v23 = {
                            [v19.rigAttachmentToParent.name] = 0
                        };
                        local v24 = 1;
                        for v25 in v19.otherAttachments do
                            if string.find(v25, "RigAttachment$") ~= nil then
                                v23[v25] = 0;
                                v24 = v24 + 1;
                            end;
                        end;
                        local v26 = 0;
                        for _, v28 in v20:GetChildren() do
                            if v28.ClassName == "Attachment" and v23[v28.Name] then
                                if v23[v28.Name] == 1 then
                                    return false, {
                                        v18 .. " has duplicate rig attachments: " .. v28.Name
                                    };
                                else
                                    v23[v28.Name] = v23[v28.Name] + 1;
                                    v26 = v26 + 1;
                                end;
                            end;
                        end;
                        if v26 ~= v24 then
                            return false, {
                                "Missing rig attachments"
                            };
                        end;
                    end;
                end;
            end;
        end;
    end;
    return true;
end;
local function _(v30, v31) --[[ Line: 107 ]] --[[ Name: isWindowValid ]]
    return v30 <= v31;
end;
local v33 = {
    "X", 
    "Y", 
    "Z"
};
local function v45(v34, v35) --[[ Line: 116 ]] --[[ Name: calculateScalingWindow ]]
    -- upvalues: v4 (copy), v33 (copy)
    local v36 = {};
    local v37, _, v39 = v4.calculateBoundsDimensions(v34);
    v36.meshSize = v37;
    v36.overallSize = v39;
    v36.scaleTypes = {};
    for v40, v41 in v35 do
        local v42 = {
            max = 1e999, 
            min = -1e999
        };
        for _, v44 in v33 do
            v42[v44] = {
                min = 5.0E-5 + v41.minSize[v44] / v37[v44], 
                max = v41.maxSize[v44] / v39[v44] - 5.0E-5
            };
            v42[v44].ok = v42[v44].min <= v42[v44].max;
            v42.max = math.min(v42.max, v42[v44].max);
            v42.min = math.max(v42.min, v42[v44].min);
        end;
        v42.ok = v42.min <= v42.max;
        v36.scaleTypes[v40] = v42;
    end;
    return v36;
end;
local function v52(v46) --[[ Line: 144 ]] --[[ Name: combineScalingWindows ]]
    local v47 = {};
    for _, v49 in v46 do
        for v50, v51 in v49.scaleTypes do
            v47[v50] = v47[v50] or {
                max = 1e999, 
                min = -1e999
            };
            v47[v50].max = math.min(v47[v50].max, v51.max);
            v47[v50].min = math.max(v47[v50].min, v51.min);
        end;
    end;
    return v47;
end;
local function v60(v53) --[[ Line: 160 ]] --[[ Name: createFinalResults ]]
    -- upvalues: v33 (copy)
    local v54 = {
        meshSize = v53.meshSize, 
        overallSize = v53.overallSize
    };
    for v55, v56 in v53.scaleTypes do
        local v57 = {};
        for _, v59 in v33 do
            v57[v59] = v56[v59];
        end;
        v57.ok = v56.ok;
        v57.min = v56.min;
        v57.max = v56.max;
        v54[v55] = v57;
    end;
    return v54;
end;
v8.preprocessDataAsync = function(v61, v62) --[[ Line: 180 ]] --[[ Name: preprocessDataAsync ]]
    -- upvalues: v29 (copy), v1 (copy), v6 (copy), v7 (copy)
    local v63, v64 = v29(v61, v62);
    if not v63 then
        return {
            ok = false, 
            errors = v64
        };
    else
        local v65 = {};
        for _, v67 in v1.ASSET_TYPE_INFO do
            if v67.isBodyPart then
                for v68 in v67.subParts do
                    assert(v61[v68].ClassName == "MeshPart");
                    local v69 = v61[v68];
                    local v70 = nil;
                    local v71 = nil;
                    local v72 = nil;
                    local v73, v74, v75 = v6(v69, v1.MESH_CONTENT_TYPE.RENDER_MESH, v62);
                    v70 = v73;
                    v71 = v74;
                    v72 = v75;
                    if not v70 then
                        return {
                            ok = false, 
                            errors = v71
                        };
                    else
                        v73 = v72;
                        v65[v69.MeshId] = {};
                        v74 = v65[v69.MeshId];
                        v75 = nil;
                        local v76, v77, v78 = v7(v73, v62);
                        v70 = v76;
                        v71 = v77;
                        v75 = v78;
                        if not v70 then
                            return {
                                ok = false, 
                                errors = v71
                            };
                        else
                            v74.verts = v75;
                        end;
                    end;
                end;
            end;
        end;
        return {
            ok = true, 
            cache = {
                meshData = v65
            }
        };
    end;
end;
v8.isPreprocessDataCached = function(v79, v80) --[[ Line: 232 ]] --[[ Name: isPreprocessDataCached ]]
    -- upvalues: v1 (copy)
    local l_meshData_0 = v80.meshData;
    for _, v83 in v1.ASSET_TYPE_INFO do
        if v83.isBodyPart then
            for v84 in pairs(v83.subParts) do
                local v85 = v79[v84];
                if v85 and v85.ClassName == "MeshPart" and v85.MeshId ~= "" then
                    if not l_meshData_0 then
                        return false;
                    else
                        local v86 = l_meshData_0[v85.MeshId];
                        if not v86 then
                            return false;
                        elseif not v86.verts then
                            return false;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return true;
end;
v8.calculateScaleToValidateBoundsAsync = function(v87, v88, v89) --[[ Line: 268 ]] --[[ Name: calculateScaleToValidateBoundsAsync ]]
    -- upvalues: v29 (copy), v3 (copy), v4 (copy), v45 (copy), v1 (copy), v52 (copy), v60 (copy)
    local v90, v91 = v29(v87, v88);
    if not v90 then
        return {
            ok = false, 
            errors = v91
        };
    else
        local v92, v93, v94 = v3.calculateIndividualFullBodyPartsData(v87, v88, v89, true);
        if not v92 then
            return {
                ok = false, 
                errors = v93 or {
                    "Errors calculating parts metrics"
                }
            };
        else
            local v95 = {};
            for _, v97 in v94 do
                v95 = v4.combineBounds(v95, v97.boundsData);
            end;
            local v98 = {
                FullBody = v45(v95, v1.FULL_BODY_BOUNDS)
            };
            for v99, v100 in v1.ASSET_TYPE_INFO do
                if v100.isBodyPart then
                    local v101 = {};
                    for v102 in v100.subParts do
                        v101 = v4.combineBounds(v101, v94[v102].boundsData);
                    end;
                    v98[v99.Name] = v45(v101, v1.ASSET_TYPE_INFO[v99].bounds);
                end;
            end;
            local v103 = nil;
            local v104 = nil;
            for v105, v106 in v52(v98) do
                if v106.min <= v106.max then
                    if v106.min <= 1 and v106.max >= 1 then
                        v103 = 1;
                        v104 = v105;
                        break;
                    else
                        local v107 = if math.abs(1 - v106.min) < math.abs(1 - v106.max) then v106.min else v106.max;
                        if not v103 or math.abs(1 - v107) < math.abs(1 - v103) then
                            v103 = v107;
                            v104 = v105;
                        end;
                    end;
                end;
            end;
            local v108 = {
                ok = true, 
                Overall = {
                    ok = v103 ~= nil, 
                    scale = v103, 
                    scaleType = v104
                }
            };
            for v109, v110 in v98 do
                v108[v109] = v60(v110);
            end;
            return v108;
        end;
    end;
end;
return v8;