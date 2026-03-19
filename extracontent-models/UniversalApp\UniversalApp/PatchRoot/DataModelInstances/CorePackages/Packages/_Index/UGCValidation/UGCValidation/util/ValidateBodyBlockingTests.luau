local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v5 = require(l_util_0.floatEquals);
local v6 = require(l_util_0.getExpectedPartSize);
local v7 = require(l_util_0.FailureReasonsAccumulator);
local v15 = {
    validateMeshMin = function(v8, v9) --[[ Line: 20 ]] --[[ Name: validateMeshMin ]]
        -- upvalues: v5 (copy)
        local v10 = true;
        local v11 = "";
        for _, v13 in {
            "X", 
            "Y", 
            "Z"
        } do
            local v14 = v8[v13];
            if v5(v14, 0, 1.0E-4) then
                v11 = (if #v11 > 0 then v11 .. ". " else "") .. "Size on " .. v13 .. " axis is zero";
                v10 = false;
            end;
        end;
        if not v10 then
            return false, {
                "Render mesh for " .. v9 .. ": " .. v11 .. ". Increase the size of the mesh"
            };
        else
            return true;
        end;
    end
};
v15.validateInternal = function(v16, v17, v18) --[[ Line: 39 ]] --[[ Name: validateInternal ]]
    -- upvalues: v7 (copy), v6 (copy), v15 (copy), v1 (copy)
    local v19 = v7.new();
    local v20 = v6(v16, v17, true);
    local v21, v22 = v15.validateMeshMin(v20, v16.Name);
    v19:updateReasons(v21, v22);
    if not v21 and v18 then
        v1.reportFailure(v1.ErrorType.validateBodyBlockingTests_ZeroMeshSize, nil, v17);
    end;
    return v19:getFinalResults();
end;
v15.validateAll = function(v23, v24) --[[ Line: 57 ]] --[[ Name: validateAll ]]
    -- upvalues: v15 (copy), v1 (copy)
    local v25 = tick();
    local v26 = true;
    for _, v28 in v23 do
        assert(v28:IsA("MeshPart"));
        if not v15.validateInternal(v28, v24, false) then
            v26 = false;
            break;
        end;
    end;
    v1.recordScriptTime(script.Name, v25, v24);
    return v26;
end;
v15.validate = function(v29, v30) --[[ Line: 77 ]] --[[ Name: validate ]]
    -- upvalues: v7 (copy), v2 (copy), v15 (copy), v1 (copy)
    local v31 = tick();
    local l_assetTypeEnum_0 = v30.assetTypeEnum;
    local v33 = v7.new();
    local v34 = v2.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        v33:updateReasons(v15.validateInternal(v29, v30, true));
    else
        for v35 in pairs(v34.subParts) do
            local l_v29_FirstChild_0 = v29:FindFirstChild(v35);
            assert(l_v29_FirstChild_0);
            v33:updateReasons(v15.validateInternal(l_v29_FirstChild_0, v30, true));
        end;
    end;
    v1.recordScriptTime(script.Name, v31, v30);
    return v33:getFinalResults();
end;
return v15;