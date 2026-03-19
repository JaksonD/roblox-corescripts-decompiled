local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v6 = {};
local l_print_0 = require(l_Parent_0.GraphQL).print;
local _ = require(script.Parent["merge-typedefs_types"]);
local l_isSome_0 = require(l_Parent_0.Utils).isSome;
local v10 = nil;
local function v14(v11, v12) --[[ Line: 43 ]] --[[ Name: directiveAlreadyExists ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy)
    return l_Boolean_0.toJSBoolean(l_Array_0.find(v11, function(v13) --[[ Line: 49 ]]
        -- upvalues: v12 (copy)
        return v13.name.value == v12.name.value;
    end));
end;
local function _(v15, v16) --[[ Line: 54 ]] --[[ Name: nameAlreadyExists ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.some(v16, function(v17) --[[ Line: 55 ]]
        -- upvalues: v15 (copy)
        return v17.value == v15.value;
    end);
end;
local function v33(v19, v20) --[[ Line: 60 ]] --[[ Name: mergeArguments ]]
    -- upvalues: l_Array_0 (copy), v10 (ref), l_Boolean_0 (copy)
    local v21 = l_Array_0.concat({}, v20);
    for _, v23 in v19 do
        local v25 = l_Array_0.findIndex(v21, function(v24) --[[ Line: 73 ]]
            -- upvalues: v23 (copy)
            return v24.name.value == v23.name.value;
        end);
        if v25 > -1 then
            local v26 = v21[v25];
            if v26.value.kind == "ListValue" then
                local l_values_0 = v26.value.values;
                local l_values_1 = v23.value.values;
                v26.value.values = v10(l_values_0, l_values_1, function(v29, v30) --[[ Line: 87 ]]
                    -- upvalues: l_Boolean_0 (ref), l_Array_0 (ref)
                    local l_value_0 = v29.value;
                    return not l_Boolean_0.toJSBoolean(l_value_0) or not l_Array_0.some(v30, function(v32) --[[ Line: 94 ]]
                        -- upvalues: l_value_0 (copy)
                        return v32.value == l_value_0;
                    end);
                end);
            else
                v26.value = v23.value;
            end;
        else
            table.insert(v21, v23);
        end;
    end;
    return v21;
end;
local function _(v34) --[[ Line: 108 ]] --[[ Name: deduplicateDirectives ]]
    -- upvalues: l_Array_0 (copy), v33 (copy), l_isSome_0 (copy)
    return (l_Array_0.filter(l_Array_0.map(v34, function(v35, v36, v37) --[[ Line: 112 ]]
        -- upvalues: l_Array_0 (ref), v33 (ref)
        local v39 = l_Array_0.findIndex(v37, function(v38) --[[ Line: 114 ]]
            -- upvalues: v35 (copy)
            return v38.name.value == v35.name.value;
        end);
        if v39 ~= v36 then
            local v40 = v37[v39];
            v35.arguments = v33(v35.arguments, v40.arguments);
            return nil;
        else
            return v35;
        end;
    end), l_isSome_0));
end;
v6.mergeDirectives = function(v42, v43, v44) --[[ Line: 133 ]] --[[ Name: mergeDirectives ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy), v33 (copy), l_isSome_0 (copy), v14 (copy)
    local v45 = if v42 ~= nil then v42 else {};
    local v46 = if v43 ~= nil then v43 else {};
    local v47 = v44 and v44.reverseDirectives;
    local v48 = if l_Boolean_0.toJSBoolean(v47) then v45 else v46;
    local v49 = if l_Boolean_0.toJSBoolean(v47) then v46 else v45;
    local v50 = l_Array_0.concat({}, v48);
    local v57 = l_Array_0.filter(l_Array_0.map(v50, function(v51, v52, v53) --[[ Line: 112 ]]
        -- upvalues: l_Array_0 (ref), v33 (ref)
        local v55 = l_Array_0.findIndex(v53, function(v54) --[[ Line: 114 ]]
            -- upvalues: v51 (copy)
            return v54.name.value == v51.name.value;
        end);
        if v55 ~= v52 then
            local v56 = v53[v55];
            v51.arguments = v33(v51.arguments, v56.arguments);
            return nil;
        else
            return v51;
        end;
    end), l_isSome_0);
    for _, v59 in v49 do
        if l_Boolean_0.toJSBoolean(v14(v57, v59)) then
            local v61 = l_Array_0.findIndex(v57, function(v60) --[[ Line: 155 ]]
                -- upvalues: v59 (copy)
                return v60.name.value == v59.name.value;
            end);
            local v62 = v57[v61];
            v57[v61].arguments = v33(l_Boolean_0.toJSBoolean(v59.arguments) and v59.arguments or {}, l_Boolean_0.toJSBoolean(v62.arguments) and v62.arguments or {});
        else
            table.insert(v57, v59);
        end;
    end;
    return v57;
end;
local function v68(v63, v64) --[[ Line: 176 ]] --[[ Name: validateInputs ]]
    -- upvalues: l_print_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), l_Error_0 (copy)
    local v65 = l_print_0(l_Object_0.assign({}, v63, {
        description = l_Object_0.None
    }));
    local v66 = l_print_0(l_Object_0.assign({}, v64, {
        description = l_Object_0.None
    }));
    local v67 = v65:gsub("directive @w*d*", ""):gsub(" on .*$", "") == v66:gsub("directive @w*d*", ""):gsub(" on .*$", "");
    if not l_Boolean_0.toJSBoolean(v67) then
        error(l_Error_0.new(("Unable to merge GraphQL directive \"%s\". \nExisting directive:  \n\t%s \nReceived directive: \n\t%s"):format(tostring(v63.name.value), tostring(v66), (tostring(v65)))));
    end;
end;
v6.mergeDirective = function(v69, v70) --[[ Line: 201 ]] --[[ Name: mergeDirective ]]
    -- upvalues: v68 (copy), l_Object_0 (copy), l_Array_0 (copy)
    if v70 then
        v68(v69, v70);
        return l_Object_0.assign({}, v69, {
            locations = l_Array_0.concat({}, v70.locations, l_Array_0.filter(v69.locations, function(v71) --[[ Line: 219 ]]
                -- upvalues: v70 (copy), l_Array_0 (ref)
                local l_locations_0 = v70.locations;
                return not l_Array_0.some(l_locations_0, function(v73) --[[ Line: 55 ]]
                    -- upvalues: v71 (copy)
                    return v73.value == v71.value;
                end);
            end))
        });
    else
        return v69;
    end;
end;
v10 = function(v74, v75, v76) --[[ Line: 229 ]] --[[ Name: deduplicateLists ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.concat(v74, l_Array_0.filter(v75, function(v77) --[[ Line: 247 ]]
        -- upvalues: v76 (copy), v74 (copy)
        return v76(v77, v74);
    end));
end;
return v6;