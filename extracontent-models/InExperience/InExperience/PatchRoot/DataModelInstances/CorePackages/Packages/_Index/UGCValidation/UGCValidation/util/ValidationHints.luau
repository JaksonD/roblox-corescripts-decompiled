local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.BoundsCalculator);
local v4 = require(l_Parent_0.util.BoundsDataUtils);
local v5 = require(l_Parent_0.util.ParseContentIds);
local v6 = require(l_Parent_0.util.getMeshInfo);
local v7 = require(l_Parent_0.util.getMeshVerts);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidationConsolidateGetMeshInfos);
local v9 = {};
local v10 = {
    MeshPart = {
        "MeshId"
    }
};
local v11 = {
    MeshPart = {
        MeshId = true
    }
};
local function v14(v12, v13) --[[ Line: 36 ]] --[[ Name: validateMeshIds ]]
    -- upvalues: v5 (copy), v10 (copy), v11 (copy)
    if not v5.parseWithErrorCheck({}, {}, v12, v10, v11, v13) then
        return false, {
            v12.Name .. " does not have a MeshId"
        };
    else
        return true;
    end;
end;
local function v30(v15, v16) --[[ Line: 54 ]] --[[ Name: validateAllMeshParts ]]
    -- upvalues: v1 (copy), v14 (copy)
    for _, v18 in v1.ASSET_TYPE_INFO do
        if v18.isBodyPart then
            for v19, v20 in pairs(v18.subParts) do
                local v21 = v15[v19];
                if not v21 or v21.ClassName ~= "MeshPart" then
                    return false, {
                        v19 .. " missing"
                    };
                elseif v21.Name ~= v19 then
                    return false, {
                        v19 .. " input data is incorrectly set-up"
                    };
                else
                    local v22, v23 = v14(v21, v16);
                    if not v22 then
                        return false, v23;
                    else
                        local v24 = {
                            [v20.rigAttachmentToParent.name] = 0
                        };
                        local v25 = 1;
                        for v26 in v20.otherAttachments do
                            if string.find(v26, "RigAttachment$") ~= nil then
                                v24[v26] = 0;
                                v25 = v25 + 1;
                            end;
                        end;
                        local v27 = 0;
                        for _, v29 in v21:GetChildren() do
                            if v29.ClassName == "Attachment" and v24[v29.Name] then
                                if v24[v29.Name] == 1 then
                                    return false, {
                                        v19 .. " has duplicate rig attachments: " .. v29.Name
                                    };
                                else
                                    v24[v29.Name] = v24[v29.Name] + 1;
                                    v27 = v27 + 1;
                                end;
                            end;
                        end;
                        if v27 ~= v25 then
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
local function _(v31, v32) --[[ Line: 109 ]] --[[ Name: isWindowValid ]]
    return v31 <= v32;
end;
local v34 = {
    "X", 
    "Y", 
    "Z"
};
local function v46(v35, v36) --[[ Line: 118 ]] --[[ Name: calculateScalingWindow ]]
    -- upvalues: v4 (copy), v34 (copy)
    local v37 = {};
    local v38, _, v40 = v4.calculateBoundsDimensions(v35);
    v37.meshSize = v38;
    v37.overallSize = v40;
    v37.scaleTypes = {};
    for v41, v42 in v36 do
        local v43 = {
            max = 1e999, 
            min = -1e999
        };
        for _, v45 in v34 do
            v43[v45] = {
                min = 5.0E-5 + v42.minSize[v45] / v38[v45], 
                max = v42.maxSize[v45] / v40[v45] - 5.0E-5
            };
            v43[v45].ok = v43[v45].min <= v43[v45].max;
            v43.max = math.min(v43.max, v43[v45].max);
            v43.min = math.max(v43.min, v43[v45].min);
        end;
        v43.ok = v43.min <= v43.max;
        v37.scaleTypes[v41] = v43;
    end;
    return v37;
end;
local function v53(v47) --[[ Line: 146 ]] --[[ Name: combineScalingWindows ]]
    local v48 = {};
    for _, v50 in v47 do
        for v51, v52 in v50.scaleTypes do
            v48[v51] = v48[v51] or {
                max = 1e999, 
                min = -1e999
            };
            v48[v51].max = math.min(v48[v51].max, v52.max);
            v48[v51].min = math.max(v48[v51].min, v52.min);
        end;
    end;
    return v48;
end;
local function v61(v54) --[[ Line: 162 ]] --[[ Name: createFinalResults ]]
    -- upvalues: v34 (copy)
    local v55 = {
        meshSize = v54.meshSize, 
        overallSize = v54.overallSize
    };
    for v56, v57 in v54.scaleTypes do
        local v58 = {};
        for _, v60 in v34 do
            v58[v60] = v57[v60];
        end;
        v58.ok = v57.ok;
        v58.min = v57.min;
        v58.max = v57.max;
        v55[v56] = v58;
    end;
    return v55;
end;
v9.preprocessDataAsync = function(v62, v63) --[[ Line: 182 ]] --[[ Name: preprocessDataAsync ]]
    -- upvalues: v30 (copy), v1 (copy), v8 (copy), v6 (copy), v7 (copy)
    local v64, v65 = v30(v62, v63);
    if not v64 then
        return {
            ok = false, 
            errors = v65
        };
    else
        local v66 = {};
        for _, v68 in v1.ASSET_TYPE_INFO do
            if v68.isBodyPart then
                for v69 in v68.subParts do
                    assert(v62[v69].ClassName == "MeshPart");
                    local v70 = v62[v69];
                    local v71 = nil;
                    local v72 = nil;
                    local v73 = nil;
                    if v8() then
                        local v74, v75, v76 = v6(v70, v1.MESH_CONTENT_TYPE.RENDER_MESH, v63);
                        v71 = v74;
                        v72 = v75;
                        v73 = v76;
                    else
                        local v77, v78, v79 = v6(v70, v63);
                        v71 = v77;
                        v72 = v78;
                        v73 = v79;
                    end;
                    if not v71 then
                        return {
                            ok = false, 
                            errors = v72
                        };
                    else
                        local l_v73_0 = v73;
                        v66[v70.MeshId] = {};
                        local v81 = v66[v70.MeshId];
                        local v82 = nil;
                        local v83, v84, v85 = v7(l_v73_0, v63);
                        v71 = v83;
                        v72 = v84;
                        v82 = v85;
                        if not v71 then
                            return {
                                ok = false, 
                                errors = v72
                            };
                        else
                            v81.verts = v82;
                        end;
                    end;
                end;
            end;
        end;
        return {
            ok = true, 
            cache = {
                meshData = v66
            }
        };
    end;
end;
v9.isPreprocessDataCached = function(v86, v87) --[[ Line: 238 ]] --[[ Name: isPreprocessDataCached ]]
    -- upvalues: v1 (copy)
    local l_meshData_0 = v87.meshData;
    for _, v90 in v1.ASSET_TYPE_INFO do
        if v90.isBodyPart then
            for v91 in pairs(v90.subParts) do
                local v92 = v86[v91];
                if v92 and v92.ClassName == "MeshPart" and v92.MeshId ~= "" then
                    if not l_meshData_0 then
                        return false;
                    else
                        local v93 = l_meshData_0[v92.MeshId];
                        if not v93 then
                            return false;
                        elseif not v93.verts then
                            return false;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return true;
end;
v9.calculateScaleToValidateBoundsAsync = function(v94, v95, v96) --[[ Line: 274 ]] --[[ Name: calculateScaleToValidateBoundsAsync ]]
    -- upvalues: v30 (copy), v3 (copy), v4 (copy), v46 (copy), v1 (copy), v53 (copy), v61 (copy)
    local v97, v98 = v30(v94, v95);
    if not v97 then
        return {
            ok = false, 
            errors = v98
        };
    else
        local v99, v100, v101 = v3.calculateIndividualFullBodyPartsData(v94, v95, v96, true);
        if not v99 then
            return {
                ok = false, 
                errors = v100 or {
                    "Errors calculating parts metrics"
                }
            };
        else
            local v102 = {};
            for _, v104 in v101 do
                v102 = v4.combineBounds(v102, v104.boundsData);
            end;
            local v105 = {
                FullBody = v46(v102, v1.FULL_BODY_BOUNDS)
            };
            for v106, v107 in v1.ASSET_TYPE_INFO do
                if v107.isBodyPart then
                    local v108 = {};
                    for v109 in v107.subParts do
                        v108 = v4.combineBounds(v108, v101[v109].boundsData);
                    end;
                    v105[v106.Name] = v46(v108, v1.ASSET_TYPE_INFO[v106].bounds);
                end;
            end;
            local v110 = nil;
            local v111 = nil;
            for v112, v113 in v53(v105) do
                if v113.min <= v113.max then
                    if v113.min <= 1 and v113.max >= 1 then
                        v110 = 1;
                        v111 = v112;
                        break;
                    else
                        local v114 = if math.abs(1 - v113.min) < math.abs(1 - v113.max) then v113.min else v113.max;
                        if not v110 or math.abs(1 - v114) < math.abs(1 - v110) then
                            v110 = v114;
                            v111 = v112;
                        end;
                    end;
                end;
            end;
            local v115 = {
                ok = true, 
                Overall = {
                    ok = v110 ~= nil, 
                    scale = v110, 
                    scaleType = v111
                }
            };
            for v116, v117 in v105 do
                v115[v116] = v61(v117);
            end;
            return v115;
        end;
    end;
end;
return v9;