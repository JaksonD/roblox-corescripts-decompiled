local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingBuilder);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local function v8(v9, v10, v11, v12, v13, v14, v15) --[[ Line: 30 ]] --[[ Name: buildRepeatedProp ]]
    -- upvalues: v7 (copy), v3 (copy), l_PropResultCategory_0 (copy), v8 (copy)
    if v9 == "literal" then
        if typeof(v10) ~= "table" then
            error("buildRepeatedProp: propDefinitionValue must be a table for literal type");
        end;
        local l_array_0 = v10.array;
        if l_array_0 == nil then
            error("buildRepeatedProp: wrapper message must have 'array' field");
        end;
        if typeof(l_array_0) ~= "table" then
            error("buildRepeatedProp: array field must be a table/array");
        end;
        return v7.generateTablePropSignalValue(l_array_0, v11, v13, v14, v12, v3.buildPropTable, v15), l_PropResultCategory_0.PropSignal;
    elseif v9 == "binding_path" then
        local function v22(v17, v18) --[[ Line: 67 ]] --[[ Name: evaluatePropArray ]]
            -- upvalues: v3 (ref), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v7 (ref)
            local v19, v20, v21 = v3.buildPropTable(v17, v11, v12, v13, v14);
            return v7.resolveTablePropValue(v18, v19, v20, v21, v11, v13, v14, v12, v3.buildPropTable);
        end;
        return v7.generateDynamicBindingPropValue(v10, v11, v13, v12, v22), l_PropResultCategory_0.PropSignal;
    elseif v9 == "conditional" then
        return v7.generateConditionalPropValue(v10, v11, v13, v14, v12, v8, v15), l_PropResultCategory_0.PropSignal;
    else
        return nil, l_PropResultCategory_0.Failed;
    end;
end;
return v8;