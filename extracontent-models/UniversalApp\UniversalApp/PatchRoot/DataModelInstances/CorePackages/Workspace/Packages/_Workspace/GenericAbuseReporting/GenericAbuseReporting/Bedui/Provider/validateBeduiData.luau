local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local l_BeduiDataTypeInterface_0 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes).BeduiDataTypeInterface;
local function _(v4, v5) --[[ Line: 15 ]] --[[ Name: validateInterface ]]
    -- upvalues: v2 (copy)
    return v2.interface(v5)(v4);
end;
local function v12(v7) --[[ Line: 24 ]] --[[ Name: validateStepId ]]
    local v8 = false;
    local v9 = {};
    for _, v11 in v7.nodes do
        if v11.stepId == v7.rootStepId then
            if v8 then
                return false, "Bedui data contains multiple steps with the same rootStepId";
            else
                v8 = true;
            end;
        end;
        if table.find(v9, v11.stepId) then
            return false, "Bedui data contains duplicate stepId: " .. tostring(v11.stepId);
        else
            table.insert(v9, v11.stepId);
        end;
    end;
    if v8 then
        return true, nil;
    else
        return false, "Bedui data does not contain a step with the rootStepId";
    end;
end;
return function(v13) --[[ Line: 51 ]] --[[ Name: validateBeduiData ]]
    -- upvalues: l_BeduiDataTypeInterface_0 (copy), v2 (copy), v12 (copy)
    if v13 == nil then
        return false, "Bedui data is nil";
    else
        local l_l_BeduiDataTypeInterface_0_0 = l_BeduiDataTypeInterface_0;
        if not v2.interface(l_l_BeduiDataTypeInterface_0_0)(v13) then
            return false, "Bedui data does not conform to the expected structure";
        else
            return v12(v13);
        end;
    end;
end;