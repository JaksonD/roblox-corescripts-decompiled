local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.getMeshMinMax);
local function v11(v4, v5, v6) --[[ Line: 12 ]] --[[ Name: formatError ]]
    local function _(v7) --[[ Line: 13 ]] --[[ Name: getContext ]]
        return v7.fullName .. "." .. v7.fieldName;
    end;
    local v9 = v4.fullName .. "." .. v4.fieldName;
    local v10 = v5.fullName .. "." .. v5.fieldName;
    return string.format("%s is more than max difference %.2f in size compared to the other mesh %s. You need to edit the model to adjust its size", v9, v6, v10);
end;
return function(v12, v13, v14, v15) --[[ Line: 28 ]] --[[ Name: validateMeshComparison ]]
    -- upvalues: v3 (copy), v2 (copy), v11 (copy)
    local v16, v17, v18, v19 = v3(v12, v15);
    if not v16 then
        return v16, v17;
    else
        local v20, v21, v22, v23 = v3(v13, v15);
        if not v20 then
            return v20, v21;
        elseif v14 < (v18 - v22).Magnitude or v14 < (v19 - v23).Magnitude then
            v2.reportFailure(v2.ErrorType.validateMeshComparison, nil, v15);
            return false, {
                v11(v12, v13, v14)
            };
        else
            return true;
        end;
    end;
end;