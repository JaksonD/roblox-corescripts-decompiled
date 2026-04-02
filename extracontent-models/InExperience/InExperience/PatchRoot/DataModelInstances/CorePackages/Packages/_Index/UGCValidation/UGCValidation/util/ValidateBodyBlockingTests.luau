local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v5 = require(l_util_0.floatEquals);
local v6 = require(l_util_0.getExpectedPartSize);
local v7 = require(l_util_0.FailureReasonsAccumulator);
local v8 = require(l_Parent_0.util.R15plusUtils);
local v16 = {
    validateMeshMin = function(v9, v10) --[[ Line: 21 ]] --[[ Name: validateMeshMin ]]
        -- upvalues: v5 (copy)
        local v11 = true;
        local v12 = "";
        for _, v14 in {
            "X", 
            "Y", 
            "Z"
        } do
            local v15 = v9[v14];
            if v5(v15, 0, 1.0E-4) then
                v12 = (if #v12 > 0 then v12 .. ". " else "") .. "Size on " .. v14 .. " axis is zero";
                v11 = false;
            end;
        end;
        if not v11 then
            return false, {
                "Render mesh for " .. v10 .. ": " .. v12 .. ". Increase the size of the mesh"
            };
        else
            return true;
        end;
    end
};
v16.validateInternal = function(v17, v18, v19) --[[ Line: 40 ]] --[[ Name: validateInternal ]]
    -- upvalues: v7 (copy), v6 (copy), v16 (copy), v1 (copy), v8 (copy)
    local v20 = v7.new();
    local v21 = v6(v17, v18, true);
    local v22, v23 = v16.validateMeshMin(v21, v17.Name);
    v20:updateReasons(v22, v23);
    if not v22 and v19 then
        v1.reportFailure(v1.ErrorType.validateBodyBlockingTests_ZeroMeshSize, nil, v18);
    end;
    if v8.checkFlagEnabledForAllowHrd() then
        local v24 = v8.getAvatarBoneSchema(v17.Name);
        for v25, v26 in (v8.getNameWhitelistOfClassInSchema(v24, "Attachment")) do
            if v26 and not v17:FindFirstChild(v25, true) then
                v20:updateReasons(false, {
                    (("Missing Required attachment %*"):format(v25))
                });
            end;
        end;
    end;
    return v20:getFinalResults();
end;
v16.validateAll = function(v27, v28) --[[ Line: 68 ]] --[[ Name: validateAll ]]
    -- upvalues: v16 (copy), v1 (copy)
    local v29 = tick();
    local v30 = true;
    for _, v32 in v27 do
        assert(v32:IsA("MeshPart"));
        if not v16.validateInternal(v32, v28, false) then
            v30 = false;
            break;
        end;
    end;
    v1.recordScriptTime(script.Name, v29, v28);
    return v30;
end;
v16.validate = function(v33, v34) --[[ Line: 88 ]] --[[ Name: validate ]]
    -- upvalues: v7 (copy), v2 (copy), v16 (copy), v1 (copy)
    local v35 = tick();
    local l_assetTypeEnum_0 = v34.assetTypeEnum;
    local v37 = v7.new();
    local v38 = v2.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        v37:updateReasons(v16.validateInternal(v33, v34, true));
    else
        for v39 in pairs(v38.subParts) do
            local l_v33_FirstChild_0 = v33:FindFirstChild(v39);
            assert(l_v33_FirstChild_0);
            v37:updateReasons(v16.validateInternal(l_v33_FirstChild_0, v34, true));
        end;
    end;
    v1.recordScriptTime(script.Name, v35, v34);
    return v37:getFinalResults();
end;
return v16;