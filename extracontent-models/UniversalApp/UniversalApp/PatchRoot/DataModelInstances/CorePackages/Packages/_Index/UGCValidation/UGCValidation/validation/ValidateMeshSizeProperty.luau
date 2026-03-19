local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.Analytics);
local l_util_0 = l_Parent_0.util;
local v4 = require(l_Parent_0.util.floatEquals);
local _ = require(l_util_0.Types);
local v6 = require(l_util_0.pcallDeferred);
local v7 = require(l_util_0.getMeshSize);
local v8 = require(l_util_0.getEditableMeshFromContext);
local v9 = require(l_util_0.FailureReasonsAccumulator);
local v10 = {};
local function v15(v11, v12, v13, v14) --[[ Line: 21 ]] --[[ Name: reportFailure ]]
    -- upvalues: v2 (copy)
    if v14 and v13.isServer ~= nil and v13.isServer then
        error(v11);
    end;
    v2.reportFailure(v12, nil, v13);
    return false, {
        v11
    };
end;
local function _(v16, v17) --[[ Line: 40 ]] --[[ Name: vector3Equals ]]
    -- upvalues: v4 (copy)
    return v4(v16.X, v17.X, 1.0E-5) and v4(v16.Y, v17.Y, 1.0E-5) and v4(v16.Z, v17.Z, 1.0E-5);
end;
local function v26(v19, v20) --[[ Line: 45 ]] --[[ Name: calculateMeshSize ]]
    -- upvalues: v8 (copy), v15 (copy), v2 (copy), v6 (copy), v7 (copy)
    local v21 = {
        fullName = v19:GetFullName(), 
        fieldName = "MeshId", 
        contentId = v19.MeshId, 
        context = v19.Name
    };
    local v22, v23 = v8(v19, "MeshId", v20);
    if not v22 then
        return v15(string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", v19.Name), v2.ErrorType.validateMeshSizeProperty_FailedToLoadMesh, v20, false);
    else
        v21.editableMesh = v23;
        local v24, v25 = v6(function() --[[ Line: 68 ]]
            -- upvalues: v7 (ref), v21 (copy)
            return v7(v21);
        end, v20);
        if not v24 then
            return v15(string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", v19.Name), v2.ErrorType.validateMeshSizeProperty_FailedToLoadMesh, v20, true);
        else
            return true, nil, v25;
        end;
    end;
end;
local function v34(v27, v28) --[[ Line: 83 ]] --[[ Name: validateInternal ]]
    -- upvalues: v26 (copy), v4 (copy), v15 (copy), v2 (copy)
    local v29 = tick();
    local v30, v31, v32 = v26(v27, v28);
    if not v30 or not v32 then
        return v30, v31;
    else
        local l_MeshSize_0 = v27.MeshSize;
        if not (v4(l_MeshSize_0.X, v32.X, 1.0E-5) and v4(l_MeshSize_0.Y, v32.Y, 1.0E-5) and v4(l_MeshSize_0.Z, v32.Z, 1.0E-5)) then
            return v15(string.format("Calculated mesh size for %s does not match MeshSize property value", v27.Name), v2.ErrorType.validateMeshSizeProperty_Mismatch, v28, false);
        else
            v2.recordScriptTime(script.Name, v29, v28);
            return true;
        end;
    end;
end;
v10.validateSingleMeshPart = function(v35, v36) --[[ Line: 107 ]] --[[ Name: validateSingleMeshPart ]]
    -- upvalues: v34 (copy)
    if v36.allowEditableInstances then
        return true;
    else
        return v34(v35, v36);
    end;
end;
v10.validateBodyAsset = function(v37, v38) --[[ Line: 117 ]] --[[ Name: validateBodyAsset ]]
    -- upvalues: v34 (copy), v2 (copy), v9 (copy), v1 (copy)
    local v39 = tick();
    if v38.allowEditableInstances then
        return true;
    else
        local l_assetTypeEnum_0 = v38.assetTypeEnum;
        if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
            local v41, v42 = v34(v37, v38);
            v2.recordScriptTime(script.Name, v39, v38);
            return v41, v42;
        else
            local v43 = v9.new();
            for v44 in v1.ASSET_TYPE_INFO[l_assetTypeEnum_0].subParts do
                local l_v37_FirstChild_0 = v37:FindFirstChild(v44);
                assert(l_v37_FirstChild_0);
                v43:updateReasons(v34(l_v37_FirstChild_0, v38));
            end;
            v2.recordScriptTime(script.Name, v39, v38);
            return v43:getFinalResults();
        end;
    end;
end;
return v10;