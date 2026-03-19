local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.valueToString);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidateBindOffset);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidationEyebrowEyelashSupport);
local function v12(v9, v10, v11) --[[ Line: 46 ]] --[[ Name: comparitorMethodImpl ]]
    -- upvalues: v3 (copy)
    if v11 == v3.COMPARISON_METHODS.SMALLER then
        return v9 < v10;
    elseif v11 == v3.COMPARISON_METHODS.SMALLER_EQ then
        return v9 <= v10;
    elseif v11 == v3.COMPARISON_METHODS.FUZZY_EQ then
        return math.abs(v9 - v10) <= 1.0E-5;
    elseif v11 == v3.COMPARISON_METHODS.EXACT_EQ then
        return v9 == v10;
    elseif v11 == v3.COMPARISON_METHODS.GREATER_EQ then
        return v10 <= v9;
    elseif v11 == v3.COMPARISON_METHODS.GREATER then
        return v10 < v9;
    else
        error("Invalid comparitor method: " .. v11);
        return;
    end;
end;
local function v13(v14, v15, v16) --[[ Line: 64 ]] --[[ Name: doesPropertyMatchExpectations ]]
    -- upvalues: v1 (copy), v8 (copy), v3 (copy), v13 (copy), v12 (copy)
    if v15 == v1.None then
        return v14 == nil;
    elseif v8() and typeof(v15) == "table" and v16 == v3.COMPARISON_METHODS.FOUND_IN then
        local v17 = false;
        for _, v19 in v15 do
            v17 = v17 or v13(v14, v19, v3.COMPARISON_METHODS.EXACT_EQ);
        end;
        return v17;
    elseif typeof(v14) ~= typeof(v15) then
        return false;
    elseif typeof(v15) == "number" then
        return v12(v14, v15, v16);
    elseif typeof(v15) == "Vector3" then
        return v12(v14.X, v15.X, v16) and v12(v14.Y, v15.Y, v16) and v12(v14.Z, v15.Z, v16);
    elseif typeof(v15) == "Color3" then
        return v12(v14.R, v15.R, v16) and v12(v14.G, v15.G, v16) and v12(v14.B, v15.B, v16);
    else
        return v14 == v15;
    end;
end;
local function v26(v20, v21, v22, v23, v24, v25) --[[ Line: 99 ]] --[[ Name: validatePropertyValue ]]
    -- upvalues: v13 (copy), v2 (copy), v5 (copy)
    if not v13(v23, v24, v25) then
        v2.reportFailure(v2.ErrorType.validateProperties_PropertyMismatch, nil, v20);
        return false, {
            string.format("Property %s of %s is invalid. Expected to be %s %s.", v22, v21:GetFullName(), v25, v5(v24))
        };
    else
        return true;
    end;
end;
local function v29(v27, v28) --[[ Line: 124 ]] --[[ Name: extractSubProperty ]]
    -- upvalues: v7 (copy)
    if typeof(v28) == "CFrame" and v27 == "PositionMagnitude" then
        return true, v28.Position.Magnitude;
    elseif typeof(v28) == "CFrame" and v27 == "Orientation" then
        return true, (Vector3.new(v28:ToOrientation()));
    elseif v7() and typeof(v28) == "CFrame" and v27 == "Position" then
        return true, v28.Position;
    else
        return false;
    end;
end;
local function v30(v31, v32, v33, v34) --[[ Line: 136 ]] --[[ Name: getAllActiveTestsOnProperty ]]
    -- upvalues: v3 (copy), v30 (copy), v29 (copy)
    if typeof(v34) ~= "table" then
        return {
            {
                v32, 
                v33, 
                v34, 
                v3.COMPARISON_METHODS.FUZZY_EQ
            }
        };
    else
        for v35, v36 in v34 do
            if v35 == v3.INCLUSION_METHODS.INCLUSION_LIST then
                if table.find(v36, v31) == nil then
                    return {};
                end;
            elseif v35 == v3.INCLUSION_METHODS.EXCLUSION_LIST and table.find(v36, v31) ~= nil then
                return {};
            end;
        end;
        local v37 = {};
        for _, v39 in v3.COMPARISON_METHODS do
            if v34[v39] ~= nil then
                table.insert(v37, {
                    v32, 
                    v33, 
                    v34[v39], 
                    v39
                });
            end;
        end;
        local v40 = 1;
        while v34[v40] ~= nil do
            local v41 = v30(v31, v32, v33, v34[v40]);
            table.move(v41, 1, #v41, #v37 + 1, v37);
            v40 = v40 + 1;
        end;
        for v42, v43 in v34 do
            local v44, v45 = v29(v42, v33);
            if v44 then
                for _, v47 in (v30(v31, v42, v45, v43)) do
                    v47[1] = v32 .. "." .. v47[1];
                    table.insert(v37, v47);
                end;
            end;
        end;
        return v37;
    end;
end;
return function(v48, v49, v50) --[[ Line: 196 ]] --[[ Name: validatePropertyRequirements ]]
    -- upvalues: v6 (copy), v3 (copy), v2 (copy), v30 (copy), v26 (copy)
    if v49 == nil then
        v49 = v50.assetTypeEnum;
    end;
    local l_v48_Descendants_0 = v48:GetDescendants();
    table.insert(l_v48_Descendants_0, v48);
    local v52 = v6.new();
    for _, v54 in l_v48_Descendants_0 do
        for v55, v56 in v3.PROPERTIES do
            if v54:IsA(v55) then
                for v57, v58 in v56 do
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 216 ]]
                        -- upvalues: v54 (copy), v57 (copy)
                        return v54[v57];
                    end);
                    if not l_status_0 then
                        v2.reportFailure(v2.ErrorType.validateProperties_PropertyDoesNotExist, nil, v50);
                        v52:updateReasons(false, {
                            string.format("Property '%s' not found in '%s'", v57, v54:GetFullName())
                        });
                    else
                        for _, v62 in (v30(v49, v57, l_result_0, v58)) do
                            local v63, v64, v65, v66 = table.unpack(v62);
                            v52:updateReasons(v26(v50, v54, v63, v64, v65, v66));
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v52:getFinalResults();
end;