local l_Parent_0 = script.Parent.Parent;
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v6 = require(l_util_0.pcallDeferred);
local v7 = require(l_util_0.getEditableMeshFromContext);
local v8 = require(l_util_0.FailureReasonsAccumulator);
local v9 = require(l_util_0.getExpectedPartSize);
local v10 = require(l_util_0.getMeshInfo);
local v11 = require(l_util_0.AssetCalculator);
local l_flags_0 = l_Parent_0.flags;
local v13 = require(l_flags_0.GetFStringUGCValidationMaxCageDistance);
local v14 = require(l_Parent_0.flags.getFFlagUGCValidationConsolidateGetMeshInfos);
local v15 = require(l_Parent_0.flags.getFFlagUGCValidationHyperlinksInCageQuality);
local v16 = {};
local function _(v17, v18, v19, v20, v21) --[[ Line: 30 ]] --[[ Name: DEPRECATED_getMeshInfo ]]
    -- upvalues: v7 (copy)
    local v22 = {
        fullName = v17:GetFullName(), 
        contentId = v19, 
        fieldName = v18, 
        context = v20
    };
    local v23, v24 = v7(v17, v18, v21);
    if not v23 then
        return false, v22;
    else
        v22.editableMesh = v24;
        return true, v22;
    end;
end;
local function v59(v26, v27) --[[ Line: 54 ]] --[[ Name: validateInternal ]]
    -- upvalues: v14 (copy), v10 (copy), v3 (copy), v7 (copy), v9 (copy), v6 (copy), l_UGCValidationService_0 (copy), v2 (copy), v13 (copy)
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    if v14() then
        local v31, v32, v33 = v10(v26, v3.MESH_CONTENT_TYPE.RENDER_MESH, v27);
        v28 = v31;
        v29 = v32;
        v30 = v33;
    else
        local l_MeshId_0 = v26.MeshId;
        local l_Name_0 = v26.Name;
        local v36 = {
            fullName = v26:GetFullName(), 
            contentId = l_MeshId_0, 
            fieldName = "MeshId", 
            context = l_Name_0
        };
        local v37, v38 = v7(v26, "MeshId", v27);
        local v39, v40;
        if not v37 then
            v39 = false;
            v40 = v36;
        else
            v36.editableMesh = v38;
            v39 = true;
            v40 = v36;
        end;
        v28 = v39;
        v30 = v40;
    end;
    if not v28 then
        if v14() then
            return false, v29;
        else
            return false, {
                "Failed to load " .. v26.Name .. "'s render mesh data"
            };
        end;
    else
        local l_WrapTarget_0 = v26:FindFirstChildWhichIsA("WrapTarget");
        assert(l_WrapTarget_0, "Missing WrapTarget child for " .. v26.Name);
        local v42 = nil;
        local v43 = nil;
        local v44 = nil;
        if v14() then
            local v45, v46, v47 = v10(l_WrapTarget_0, v3.MESH_CONTENT_TYPE.OUTER_CAGE, v27);
            v42 = v45;
            v43 = v46;
            v44 = v47;
        else
            local l_CageMeshId_0 = l_WrapTarget_0.CageMeshId;
            local l_ClassName_0 = l_WrapTarget_0.ClassName;
            local v50 = {
                fullName = l_WrapTarget_0:GetFullName(), 
                contentId = l_CageMeshId_0, 
                fieldName = "CageMeshId", 
                context = l_ClassName_0
            };
            local v51, v52 = v7(l_WrapTarget_0, "CageMeshId", v27);
            local v53, v54;
            if not v51 then
                v53 = false;
                v54 = v50;
            else
                v50.editableMesh = v52;
                v53 = true;
                v54 = v50;
            end;
            v42 = v53;
            v44 = v54;
        end;
        if not v42 then
            if v14() then
                return false, v43;
            else
                return false, {
                    "Failed to load " .. v26.Name .. "'s WrapTarget's cage mesh data"
                };
            end;
        else
            local v55 = v9(v26, v27) / v9(v26, v27, true);
            local v56, v57 = v6(function() --[[ Line: 101 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v44 (ref), v30 (ref), l_WrapTarget_0 (copy), v55 (copy)
                return l_UGCValidationService_0:CalculateBodyPartMaxCageDistance(v44.editableMesh, v30.editableMesh, l_WrapTarget_0.CageOrigin, v55);
            end, v27);
            if not v56 then
                local v58 = ("Failed to execute body part max cage distance check. Make sure %*'s render mesh and its WrapTarget's cage mesh exist, and try again."):format(v26.Name);
                if v27.isServer ~= nil and v27.isServer then
                    error(v58);
                end;
                v2.reportFailure(v2.ErrorType.validateBodyPartCage_FailedToExecute, nil, v27);
                return false, {
                    v58
                };
            elseif v13.asNumber() < v57 then
                v2.reportFailure(v2.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, v27);
                return false, {
                    string.format("Cage mesh verts referenced in %s.%s.CageMeshId were found that are %.2f studs outside the %s render mesh. %s studs is the maximum. Reduce the size of your cage mesh.", v26.Name, l_WrapTarget_0.Name, v57, v26.Name, v13.asString())
                };
            else
                return true;
            end;
        end;
    end;
end;
v16.validateSingleBodyPart = function(v60, v61) --[[ Line: 144 ]] --[[ Name: validateSingleBodyPart ]]
    -- upvalues: v3 (copy), v8 (copy), v59 (copy), v2 (copy)
    local v62 = tick();
    local v63 = v3.ASSET_TYPE_INFO[v61.assetTypeEnum];
    local v64 = v8.new();
    if Enum.AssetType.DynamicHead == v61.assetTypeEnum then
        return v59(v60, v61);
    else
        for v65 in pairs(v63.subParts) do
            local l_v60_FirstChild_0 = v60:FindFirstChild(v65);
            assert(l_v60_FirstChild_0, "expected parts have been checked for existance before calling this function");
            v64:updateReasons(v59(l_v60_FirstChild_0, v61));
        end;
        v2.recordScriptTime(script.Name, v62, v61);
        return v64:getFinalResults();
    end;
end;
v16.validateFullBody = function(v67, v68) --[[ Line: 167 ]] --[[ Name: validateFullBody ]]
    -- upvalues: v11 (copy), v14 (copy), v10 (copy), v3 (copy), v7 (copy), v9 (copy), v6 (copy), l_UGCValidationService_0 (copy), v2 (copy), v13 (copy), v15 (copy)
    local v69 = tick();
    local v70 = v11.calculateAllTransformsForFullBody(v67);
    local v71 = {};
    for _, v73 in v67 do
        local v74 = nil;
        local v75 = nil;
        local v76 = nil;
        if v14() then
            local v77, v78, v79 = v10(v73, v3.MESH_CONTENT_TYPE.RENDER_MESH, v68);
            v74 = v77;
            v75 = v78;
            v76 = v79;
        else
            local l_MeshId_1 = v73.MeshId;
            local l_Name_1 = v73.Name;
            local v82 = {
                fullName = v73:GetFullName(), 
                contentId = l_MeshId_1, 
                fieldName = "MeshId", 
                context = l_Name_1
            };
            local v83, v84 = v7(v73, "MeshId", v68);
            local v85, v86;
            if not v83 then
                v85 = false;
                v86 = v82;
            else
                v82.editableMesh = v84;
                v85 = true;
                v86 = v82;
            end;
            v74 = v85;
            v76 = v86;
        end;
        if not v74 then
            if v14() then
                return false, v75;
            else
                return false, {
                    "Failed to load " .. v73.Name .. "'s render mesh data"
                };
            end;
        else
            local l_WrapTarget_1 = v73:FindFirstChildWhichIsA("WrapTarget");
            assert(l_WrapTarget_1, "Missing WrapTarget child for " .. v73.Name);
            local v88 = nil;
            local v89 = nil;
            local v90 = nil;
            if v14() then
                local v91, v92, v93 = v10(l_WrapTarget_1, v3.MESH_CONTENT_TYPE.OUTER_CAGE, v68);
                v88 = v91;
                v89 = v92;
                v90 = v93;
            else
                local l_CageMeshId_1 = l_WrapTarget_1.CageMeshId;
                local l_ClassName_1 = l_WrapTarget_1.ClassName;
                local v96 = {
                    fullName = l_WrapTarget_1:GetFullName(), 
                    contentId = l_CageMeshId_1, 
                    fieldName = "CageMeshId", 
                    context = l_ClassName_1
                };
                local v97, v98 = v7(l_WrapTarget_1, "CageMeshId", v68);
                local v99, v100;
                if not v97 then
                    v99 = false;
                    v100 = v96;
                else
                    v96.editableMesh = v98;
                    v99 = true;
                    v100 = v96;
                end;
                v88 = v99;
                v90 = v100;
            end;
            if not v88 then
                if v14() then
                    return false, v89;
                else
                    return false, {
                        "Failed to load " .. v73.Name .. "'s WrapTarget's cage mesh data"
                    };
                end;
            else
                local v101 = v9(v73, v68) / v9(v73, v68, true);
                table.insert(v71, {
                    renderMesh = v76.editableMesh, 
                    outerCage = v90.editableMesh, 
                    renderMeshTransform = v70[v73.Name], 
                    outerCageLocalTransform = l_WrapTarget_1.CageOrigin, 
                    scale = v101, 
                    name = v73.Name
                });
            end;
        end;
    end;
    local v102, v103, v104 = v6(function() --[[ Line: 237 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v71 (copy)
        return l_UGCValidationService_0:CalculateBodyMaxCageDistance(v71);
    end, v68);
    v2.recordScriptTime(script.Name, v69, v68);
    if not v102 then
        if v68.isServer ~= nil and v68.isServer then
            error("Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again.");
        end;
        v2.reportFailure(v2.ErrorType.validateBodyPartCage_FailedToExecute, nil, v68);
        return false, {
            "Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again."
        };
    elseif v13.asNumber() < v103 then
        v2.reportFailure(v2.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, v68);
        local v105 = string.format("A vertex was found on the %s's cage mesh that is %.2f studs away from the closest render mesh. %s studs is the maximum. Make the cage mesh more closely match the shape and size of the render mesh.", v104, v103, v13.asString());
        if v15() then
            v105 = v105 .. "[Read more](https://create.roblox.com/docs/art/validation-errors#bodyCageMaxSize)";
        end;
        return false, {
            v105
        };
    else
        return true;
    end;
end;
return v16;