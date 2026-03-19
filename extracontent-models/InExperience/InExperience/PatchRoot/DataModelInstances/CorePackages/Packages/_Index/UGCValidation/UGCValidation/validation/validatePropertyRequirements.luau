local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.valueToString);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidationEyebrowEyelashSupport);
local function v11(v8, v9, v10) --[[ Line: 45 ]] --[[ Name: comparitorMethodImpl ]]
    -- upvalues: v3 (copy)
    if v10 == v3.COMPARISON_METHODS.SMALLER then
        return v8 < v9;
    elseif v10 == v3.COMPARISON_METHODS.SMALLER_EQ then
        return v8 <= v9;
    elseif v10 == v3.COMPARISON_METHODS.FUZZY_EQ then
        return math.abs(v8 - v9) <= 1.0E-5;
    elseif v10 == v3.COMPARISON_METHODS.EXACT_EQ then
        return v8 == v9;
    elseif v10 == v3.COMPARISON_METHODS.GREATER_EQ then
        return v9 <= v8;
    elseif v10 == v3.COMPARISON_METHODS.GREATER then
        return v9 < v8;
    else
        error("Invalid comparitor method: " .. v10);
        return;
    end;
end;
local function v12(v13, v14, v15) --[[ Line: 63 ]] --[[ Name: doesPropertyMatchExpectations ]]
    -- upvalues: v1 (copy), v7 (copy), v3 (copy), v12 (copy), v11 (copy)
    if v14 == v1.None then
        return v13 == nil;
    elseif v7() and typeof(v14) == "table" and v15 == v3.COMPARISON_METHODS.FOUND_IN then
        local v16 = false;
        for _, v18 in v14 do
            v16 = v16 or v12(v13, v18, v3.COMPARISON_METHODS.EXACT_EQ);
        end;
        return v16;
    elseif typeof(v13) ~= typeof(v14) then
        return false;
    elseif typeof(v14) == "number" then
        return v11(v13, v14, v15);
    elseif typeof(v14) == "Vector3" then
        return v11(v13.X, v14.X, v15) and v11(v13.Y, v14.Y, v15) and v11(v13.Z, v14.Z, v15);
    elseif typeof(v14) == "Color3" then
        return v11(v13.R, v14.R, v15) and v11(v13.G, v14.G, v15) and v11(v13.B, v14.B, v15);
    else
        return v13 == v14;
    end;
end;
local function v25(v19, v20, v21, v22, v23, v24) --[[ Line: 98 ]] --[[ Name: validatePropertyValue ]]
    -- upvalues: v12 (copy), v2 (copy), v5 (copy)
    if not v12(v22, v23, v24) then
        v2.reportFailure(v2.ErrorType.validateProperties_PropertyMismatch, nil, v19);
        return false, {
            string.format("Property %s of %s is invalid. Expected to be %s %s.", v21, v20:GetFullName(), v24, v5(v23))
        };
    else
        return true;
    end;
end;
local function _(v26, v27) --[[ Line: 123 ]] --[[ Name: extractSubProperty ]]
    if typeof(v27) == "CFrame" and v26 == "PositionMagnitude" then
        return true, v27.Position.Magnitude;
    elseif typeof(v27) == "CFrame" and v26 == "Orientation" then
        return true, (Vector3.new(v27:ToOrientation()));
    elseif typeof(v27) == "CFrame" and v26 == "Position" then
        return true, v27.Position;
    else
        return false;
    end;
end;
local function v29(v30, v31, v32, v33) --[[ Line: 135 ]] --[[ Name: getAllActiveTestsOnProperty ]]
    -- upvalues: v3 (copy), v29 (copy)
    if typeof(v33) ~= "table" then
        return {
            {
                v31, 
                v32, 
                v33, 
                v3.COMPARISON_METHODS.FUZZY_EQ
            }
        };
    else
        for v34, v35 in v33 do
            if v34 == v3.INCLUSION_METHODS.INCLUSION_LIST then
                if table.find(v35, v30) == nil then
                    return {};
                end;
            elseif v34 == v3.INCLUSION_METHODS.EXCLUSION_LIST and table.find(v35, v30) ~= nil then
                return {};
            end;
        end;
        local v36 = {};
        for _, v38 in v3.COMPARISON_METHODS do
            if v33[v38] ~= nil then
                table.insert(v36, {
                    v31, 
                    v32, 
                    v33[v38], 
                    v38
                });
            end;
        end;
        local v39 = 1;
        while v33[v39] ~= nil do
            local v40 = v29(v30, v31, v32, v33[v39]);
            table.move(v40, 1, #v40, #v36 + 1, v36);
            v39 = v39 + 1;
        end;
        for v41, v42 in v33 do
            local v43, v44;
            if typeof(v32) == "CFrame" and v41 == "PositionMagnitude" then
                v43 = true;
                v44 = v32.Position.Magnitude;
            elseif typeof(v32) == "CFrame" and v41 == "Orientation" then
                v43 = true;
                v44 = Vector3.new(v32:ToOrientation());
            elseif typeof(v32) == "CFrame" and v41 == "Position" then
                v43 = true;
                v44 = v32.Position;
            else
                v43 = false;
                v44 = nil;
            end;
            if v43 then
                for _, v46 in (v29(v30, v41, v44, v42)) do
                    v46[1] = v31 .. "." .. v46[1];
                    table.insert(v36, v46);
                end;
            end;
        end;
        return v36;
    end;
end;
return function(v47, v48, v49) --[[ Line: 195 ]] --[[ Name: validatePropertyRequirements ]]
    -- upvalues: v6 (copy), v3 (copy), v2 (copy), v29 (copy), v25 (copy)
    if v48 == nil then
        v48 = v49.assetTypeEnum;
    end;
    local l_v47_Descendants_0 = v47:GetDescendants();
    table.insert(l_v47_Descendants_0, v47);
    local v51 = v6.new();
    for _, v53 in l_v47_Descendants_0 do
        for v54, v55 in v3.PROPERTIES do
            if v53:IsA(v54) then
                for v56, v57 in v55 do
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 215 ]]
                        -- upvalues: v53 (copy), v56 (copy)
                        return v53[v56];
                    end);
                    if not l_status_0 then
                        v2.reportFailure(v2.ErrorType.validateProperties_PropertyDoesNotExist, nil, v49);
                        v51:updateReasons(false, {
                            string.format("Property '%s' not found in '%s'", v56, v53:GetFullName())
                        });
                    else
                        for _, v61 in (v29(v48, v56, l_result_0, v57)) do
                            local v62, v63, v64, v65 = table.unpack(v61);
                            v51:updateReasons(v25(v49, v53, v62, v63, v64, v65));
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v51:getFinalResults();
end;