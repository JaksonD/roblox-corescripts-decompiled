local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_0.luaUtils.null);
local l_isNillish_0 = require(l_Parent_0.luaUtils.isNillish).isNillish;
local _ = require(l_Parent_0.jsutils.ObjMap);
local l_keyMap_0 = require(l_Parent_0.jsutils.keyMap).keyMap;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_printPathArray_0 = require(l_Parent_0.jsutils.printPathArray).printPathArray;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local _ = require(l_language_0.ast);
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_print_0 = require(l_language_0.printer).print;
local l_type_0 = l_Parent_0.type;
local _ = require(l_type_0.schema);
local _ = require(l_type_0.definition);
local _ = require(l_type_0.directives);
local v18 = require(l_Parent_0.type.definition);
local l_isInputType_0 = v18.isInputType;
local l_isNonNullType_0 = v18.isNonNullType;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
local l_valueFromAST_0 = require(l_Parent_0.utilities.valueFromAST).valueFromAST;
local l_coerceInputValue_0 = require(l_Parent_0.utilities.coerceInputValue).coerceInputValue;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
v24 = function(v29, v30, v31, v32) --[[ Line: 79 ]]
    -- upvalues: v25 (ref), l_GraphQLError_0 (copy)
    local v33 = {};
    local v34 = nil;
    if v32 ~= nil then
        v34 = v32.maxErrors;
    end;
    local l_status_0, l_result_0 = pcall(v25, v29, v30, v31, function(v35) --[[ Line: 91 ]]
        -- upvalues: v34 (ref), v33 (copy), l_GraphQLError_0 (ref)
        if v34 ~= nil and #v33 >= v34 then
            error(l_GraphQLError_0.new("Too many errors processing variables, error limit reached. Execution aborted."));
        end;
        table.insert(v33, v35);
    end);
    if not l_status_0 then
        table.insert(v33, l_result_0);
    end;
    if #v33 == 0 then
        return {
            coerced = l_result_0
        };
    else
        return {
            errors = v33
        };
    end;
end;
v25 = function(v38, v39, v40, v41) --[[ Line: 113 ]] --[[ Name: coerceVariableValues ]]
    -- upvalues: l_typeFromAST_0 (copy), l_isInputType_0 (copy), l_print_0 (copy), l_GraphQLError_0 (copy), v28 (ref), l_valueFromAST_0 (copy), l_isNonNullType_0 (copy), l_inspect_0 (copy), v3 (copy), l_coerceInputValue_0 (copy), l_printPathArray_0 (copy)
    local v42 = {};
    for _, v44 in ipairs(v39) do
        local l_value_0 = v44.variable.name.value;
        local v46 = l_typeFromAST_0(v38, v44.type);
        if not l_isInputType_0(v46) then
            local v47 = l_print_0(v44.type);
            v41(l_GraphQLError_0.new(("Variable \"$%s\" expected value of type \"%s\" which cannot be used as an input type."):format(l_value_0, v47), v44.type));
        elseif not v28(v40, l_value_0) then
            if v44.defaultValue then
                v42[l_value_0] = l_valueFromAST_0(v44.defaultValue, v46);
            elseif l_isNonNullType_0(v46) then
                local v48 = l_inspect_0(v46);
                v41(l_GraphQLError_0.new(("Variable \"$%s\" of required type \"%s\" was not provided."):format(l_value_0, v48), v44));
            end;
        else
            local v49 = v40[l_value_0];
            if v49 == v3 and l_isNonNullType_0(v46) then
                local v50 = l_inspect_0(v46);
                v41(l_GraphQLError_0.new(("Variable \"$%s\" of non-null type \"%s\" must not be null."):format(l_value_0, v50), v44));
            else
                v42[l_value_0] = l_coerceInputValue_0(v49, v46, function(v51, v52, v53) --[[ Line: 174 ]]
                    -- upvalues: l_value_0 (copy), l_inspect_0 (ref), l_printPathArray_0 (ref), v41 (copy), l_GraphQLError_0 (ref), v44 (copy)
                    local v54 = ("Variable \"$%s\" got invalid value "):format(l_value_0) .. l_inspect_0(v52);
                    if #v51 > 0 then
                        v54 = v54 .. (" at \"%s%s\""):format(l_value_0, l_printPathArray_0(v51));
                    end;
                    v41(l_GraphQLError_0.new(v54 .. "; " .. v53.message, v44, nil, nil, nil, v53.originalError));
                end);
            end;
        end;
    end;
    return v42;
end;
v26 = function(v55, v56, v57) --[[ Line: 207 ]] --[[ Name: getArgumentValues ]]
    -- upvalues: l_keyMap_0 (copy), l_isNonNullType_0 (copy), l_GraphQLError_0 (copy), l_inspect_0 (copy), l_Kind_0 (copy), v28 (ref), l_isNillish_0 (copy), l_valueFromAST_0 (copy), l_print_0 (copy)
    local v58 = {};
    local v59 = if v56.arguments then v56.arguments else {};
    local v61 = l_keyMap_0(v59, function(v60) --[[ Line: 217 ]]
        return v60.name.value;
    end);
    for _, v63 in ipairs(v55.args) do
        local l_name_0 = v63.name;
        local l_type_1 = v63.type;
        local v66 = v61[l_name_0];
        if not v66 then
            if v63.defaultValue ~= nil then
                v58[l_name_0] = v63.defaultValue;
            elseif l_isNonNullType_0(l_type_1) then
                error(l_GraphQLError_0.new(("Argument \"%s\" of required type \"%s\" "):format(l_name_0, l_inspect_0(l_type_1)) .. "was not provided.", v56));
            end;
        else
            local l_value_1 = v66.value;
            local v68 = l_value_1.kind == l_Kind_0.NULL;
            if l_value_1.kind == l_Kind_0.VARIABLE then
                local l_value_2 = l_value_1.name.value;
                if v57 == nil or not v28(v57, l_value_2) then
                    if v63.defaultValue ~= nil then
                        v58[l_name_0] = v63.defaultValue;
                        continue;
                    elseif l_isNonNullType_0(l_type_1) then
                        error(l_GraphQLError_0.new(("Argument \"%s\" of required type \"%s\" "):format(l_name_0, l_inspect_0(l_type_1)) .. ("was provided the variable \"$%s\" which was not provided a runtime value."):format(l_value_2), l_value_1));
                        continue;
                    else
                        continue;
                    end;
                else
                    v68 = l_isNillish_0(v57[l_value_2]);
                end;
            end;
            if v68 and l_isNonNullType_0(l_type_1) then
                error(l_GraphQLError_0.new(("Argument \"%s\" of non-null type \"%s\" "):format(l_name_0, l_inspect_0(l_type_1)) .. "must not be null.", l_value_1));
            end;
            local v70 = l_valueFromAST_0(l_value_1, l_type_1, v57);
            if v70 == nil then
                error(l_GraphQLError_0.new(("Argument \"%s\" has invalid value %s."):format(l_name_0, l_print_0(l_value_1)), l_value_1));
            end;
            v58[l_name_0] = v70;
        end;
    end;
    return v58;
end;
v27 = function(v71, v72, v73) --[[ Line: 305 ]]
    -- upvalues: l_Array_0 (copy), v26 (ref)
    local v75 = if v72.directives then l_Array_0.find(v72.directives, function(v74) --[[ Line: 312 ]]
        -- upvalues: v71 (copy)
        return v74.name.value == v71.name;
    end) else nil;
    if v75 then
        return v26(v71, v75, v73);
    else
        return nil;
    end;
end;
v28 = function(v76, v77) --[[ Line: 325 ]] --[[ Name: hasOwnProperty ]]
    return v76[v77] ~= nil;
end;
return {
    getVariableValues = v24, 
    getArgumentValues = v26, 
    getDirectiveValues = v27
};