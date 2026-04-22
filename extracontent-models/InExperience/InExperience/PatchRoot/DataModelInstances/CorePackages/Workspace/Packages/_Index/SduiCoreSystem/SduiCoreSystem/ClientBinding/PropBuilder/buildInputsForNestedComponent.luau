local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local _ = require(l_Parent_0.Signals);
local l_FFlagSduiLocalizedLiterals_0 = require(l_Parent_0.SharedFlags).FFlagSduiLocalizedLiterals;
return function(v6, v7, v8, v9, v10, v11) --[[ Line: 23 ]] --[[ Name: buildInputsForNestedComponent ]]
    -- upvalues: v3 (copy), l_FFlagSduiLocalizedLiterals_0 (copy)
    if v7 then
        for v12, v13 in v7 do
            if v13.kind then
                local l_type_0 = v13.kind.type;
                if l_type_0 == "binding_path" then
                    local l_value_0 = v13.kind.value;
                    local v16 = string.split(l_value_0, ".");
                    local v17, _ = v3.resolveBindingPathValue(v9 or false, v16, v8, v6, nil, false);
                    v10[v12] = v17;
                elseif l_type_0 == "literal" then
                    local v19 = v13.kind.value and v13.kind.value.kind and v13.kind.value.kind.value;
                    if v19 == nil then
                        error((("Failed to determine value for nested input arg %*"):format(v12)));
                    end;
                    v10[v12] = v19;
                elseif l_FFlagSduiLocalizedLiterals_0 and l_type_0 == "translation" then
                    if v11 and v11.resolveLocalizedLiteral then
                        v10[v12] = v11.resolveLocalizedLiteral(v13.kind.value);
                    end;
                else
                    error((("Unrecognized inputDataType for key %*"):format(v12)));
                end;
            end;
        end;
    end;
end;