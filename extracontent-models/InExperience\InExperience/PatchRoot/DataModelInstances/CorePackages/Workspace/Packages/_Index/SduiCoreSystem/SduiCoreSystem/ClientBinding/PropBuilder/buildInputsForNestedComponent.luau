local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local _ = require(l_Parent_0.Signals);
return function(v5, v6, v7, v8, v9) --[[ Line: 21 ]] --[[ Name: buildInputsForNestedComponent ]]
    -- upvalues: v3 (copy)
    if v6 then
        for v10, v11 in v6 do
            if v11.kind then
                local l_type_0 = v11.kind.type;
                if l_type_0 == "binding_path" then
                    local l_value_0 = v11.kind.value;
                    local v14 = string.split(l_value_0, ".");
                    local v15, _ = v3.resolveBindingPathValue(v8 or false, v14, v7, v5, nil, false);
                    v9[v10] = v15;
                elseif l_type_0 == "literal" then
                    local v17 = v11.kind.value and v11.kind.value.kind and v11.kind.value.kind.value;
                    if v17 == nil then
                        error((("Failed to determine value for nested input arg %*"):format(v10)));
                    end;
                    v9[v10] = v17;
                else
                    error((("Unrecognized inputDataType for key %*"):format(v10)));
                end;
            end;
        end;
    end;
end;