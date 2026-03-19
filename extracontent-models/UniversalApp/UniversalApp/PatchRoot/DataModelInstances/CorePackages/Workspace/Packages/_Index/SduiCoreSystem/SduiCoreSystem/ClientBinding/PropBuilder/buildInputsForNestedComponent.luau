local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local _ = require(l_Parent_0.Signals);
local v6 = require(l_Parent_0.SharedFlags);
local l_FFlagSduiInputDataSignals_0 = v6.FFlagSduiInputDataSignals;
local l_FFlagSduiHydrationBindingResolution_0 = v6.FFlagSduiHydrationBindingResolution;
local function _(v9, v10) --[[ Line: 14 ]] --[[ Name: getFromInputData ]]
    -- upvalues: v2 (copy)
    local v11 = string.split(v9, ".");
    local v12, v13 = v2(v10, v11);
    if v12 and v13 ~= nil then
        return v13;
    else
        return nil;
    end;
end;
return function(v15, v16, v17, v18, v19) --[[ Line: 35 ]] --[[ Name: buildInputsForNestedComponent ]]
    -- upvalues: l_FFlagSduiHydrationBindingResolution_0 (copy), v4 (copy), v2 (copy), l_FFlagSduiInputDataSignals_0 (copy)
    if v16 then
        for v20, v21 in v16 do
            if v21.kind then
                local l_type_0 = v21.kind.type;
                if l_type_0 == "binding_path" then
                    local l_value_0 = v21.kind.value;
                    local v24 = string.split(l_value_0, ".");
                    if l_FFlagSduiHydrationBindingResolution_0 then
                        local v25, _ = v4.resolveBindingPathValue(v18 or false, v24, v17, v15, nil, false);
                        v19[v20] = v25;
                    else
                        local v27 = string.split(l_value_0, ".");
                        local v28, v29 = v2(v15, v27);
                        local v30 = if v28 and v29 ~= nil then v29 else nil;
                        if v30 then
                            v19[v20] = v30;
                        else
                            error((("Failed to find item in input for key %* path %*"):format(v20, l_value_0)));
                        end;
                    end;
                elseif l_type_0 == "literal" then
                    if l_FFlagSduiInputDataSignals_0 then
                        local v31 = v21.kind.value and v21.kind.value.kind and v21.kind.value.kind.value;
                        if v31 == nil then
                            error((("Failed to determine value for nested input arg %*"):format(v20)));
                        end;
                        v19[v20] = v31;
                    else
                        v19[v20] = v21.kind.value;
                    end;
                else
                    error((("Unrecognized inputDataType for key %*"):format(v20)));
                end;
            end;
        end;
    end;
end;