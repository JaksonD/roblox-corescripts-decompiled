local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingBuilder);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local l_FFlagSduiV2ConditionalSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2ConditionalSupport;
local function v9(v10, v11, v12, v13, v14, v15, v16) --[[ Line: 32 ]] --[[ Name: buildRepeatedProp ]]
    -- upvalues: v7 (copy), v3 (copy), l_PropResultCategory_0 (copy), l_FFlagSduiV2ConditionalSupport_0 (copy), v9 (copy)
    if v10 == "literal" then
        if typeof(v11) ~= "table" then
            error("buildRepeatedProp: propDefinitionValue must be a table for literal type");
        end;
        local l_array_0 = v11.array;
        if l_array_0 == nil then
            error("buildRepeatedProp: wrapper message must have 'array' field");
        end;
        if typeof(l_array_0) ~= "table" then
            error("buildRepeatedProp: array field must be a table/array");
        end;
        return v7.generateTablePropSignalValue(l_array_0, v12, v14, v15, v13, v3.buildPropTable, v16), l_PropResultCategory_0.PropSignal;
    elseif v10 == "binding_path" then
        local function v23(v18, v19) --[[ Line: 69 ]] --[[ Name: evaluatePropArray ]]
            -- upvalues: v3 (ref), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v7 (ref)
            local v20, v21, v22 = v3.buildPropTable(v18, v12, v13, v14, v15);
            return v7.resolveTablePropValue(v19, v20, v21, v22, v12, v14, v15, v13, v3.buildPropTable);
        end;
        return v7.generateDynamicBindingPropValue(v11, v12, v14, v13, v23), l_PropResultCategory_0.PropSignal;
    else
        if v10 == "conditional" then
            if l_FFlagSduiV2ConditionalSupport_0 then
                return v7.generateConditionalPropValue(v11, v12, v14, v15, v13, v9, v16), l_PropResultCategory_0.PropSignal;
            else
                error("TODO Conditionals not yet supported");
            end;
        end;
        return nil, l_PropResultCategory_0.Failed;
    end;
end;
return v9;