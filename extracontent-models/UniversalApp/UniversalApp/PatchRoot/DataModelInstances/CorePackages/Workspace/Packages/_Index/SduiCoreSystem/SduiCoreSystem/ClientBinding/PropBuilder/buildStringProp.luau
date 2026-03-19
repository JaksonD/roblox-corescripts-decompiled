local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinder);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildHydrationBindingProp);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local v6 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildDefaultProp);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v9 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
local l_FFlagSduiV2ConditionalSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2ConditionalSupport;
local function v24(v12, v13, _, v15) --[[ Line: 31 ]] --[[ Name: createFormatStringComputed ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v16 = {};
    for _, v18 in v13 do
        table.insert(v16, v3.createFieldComputed(v18.contentType, v18.path, v18.id));
    end;
    return v2.createComputed(function(v19) --[[ Line: 45 ]]
        -- upvalues: v12 (copy), v16 (copy), v13 (copy), v15 (copy)
        local l_v12_0 = v12;
        for v21, v22 in v16 do
            local v23 = v22(v19);
            if v23 == nil then
                return nil;
            else
                l_v12_0 = l_v12_0 and l_v12_0:gsub("{" .. v13[v21].argName .. "}", (tostring(v23)));
            end;
        end;
        if v15 then
            return v15(l_v12_0);
        else
            return l_v12_0;
        end;
    end);
end;
local function v44(v25, v26, v27, v28, _, v30) --[[ Line: 67 ]] --[[ Name: buildFormatString ]]
    -- upvalues: v4 (copy), l_PropResultCategory_0 (copy), v24 (copy)
    if typeof(v25) ~= "table" then
        error((("Unexpected type for stringFormat %*"):format((typeof(v25)))));
    end;
    local l_str_0 = v25.str;
    if not l_str_0 or l_str_0 == "" then
        error("No format string for prop");
    end;
    if not v25.args then
        error((("No args found for format. If no args needed, use literal. %*"):format(l_str_0)));
    end;
    local v32 = {};
    for v33, v34 in v25.args do
        local l_type_0 = v34.kind.type;
        local l_value_0 = v34.kind.value;
        if l_type_0 == "literal" then
            l_str_0 = l_str_0:gsub("{" .. v33 .. "}", (tostring(l_value_0)));
        elseif l_type_0 == "binding_path" then
            local v37, v38 = v4(l_value_0, v26, v27, nil);
            if v38 == l_PropResultCategory_0.Literal then
                l_str_0 = l_str_0:gsub("{" .. v33 .. "}", (tostring(v37)));
            elseif v38 == l_PropResultCategory_0.PropSignal then
                local v39 = string.split(l_value_0, ".");
                local v40 = v39[1];
                local v41 = v26 and v26[v40];
                if v41 ~= nil then
                    local l_contentType_0 = v41.contentType;
                    local l_id_0 = v41.id;
                    table.insert(v32, {
                        contentType = l_contentType_0, 
                        path = v39, 
                        id = l_id_0, 
                        argName = v33
                    });
                end;
            else
                error((("Unexpected propResultCategory: %* in %* for %*: %*"):format(v38, l_str_0, v33, l_value_0)));
            end;
        else
            warn((("Unrecognized argType in buildFormatString %*"):format(l_type_0)));
        end;
    end;
    if next(v32) then
        return v24(l_str_0, v32, v28, v30), l_PropResultCategory_0.PropSignal;
    elseif v30 then
        return v30(l_str_0), l_PropResultCategory_0.Literal;
    else
        return l_str_0, l_PropResultCategory_0.Literal;
    end;
end;
local function v45(v46, v47, v48, v49, v50, v51, v52) --[[ Line: 136 ]] --[[ Name: buildStringProp ]]
    -- upvalues: l_FFlagSduiInputDataSignals_0 (copy), v9 (copy), l_PropResultCategory_0 (copy), v44 (copy), v6 (copy), l_FFlagSduiV2ConditionalSupport_0 (copy), v45 (copy)
    if v46 == "format" then
        if l_FFlagSduiInputDataSignals_0 then
            return v9.generateFormatStringPropValue(v47, v48, v50, v49, v52), l_PropResultCategory_0.PropSignal;
        else
            local v53, v54 = v44(v47, v48, v49, v50.appPage, v50.debugName, v52);
            return v53, v54;
        end;
    else
        local v55, v56 = v6(v46, v47, v48, v49, v50, v51, v52, if l_FFlagSduiV2ConditionalSupport_0 then v45 else nil);
        return v55, v56;
    end;
end;
return v45;