local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v5 = {};
local _ = require(script.Parent["merge-typedefs_types"]);
local _ = require(l_Parent_0.GraphQL);
local v8 = require(script.Parent.utils);
local l_extractType_0 = v8.extractType;
local l_isWrappingTypeNode_0 = v8.isWrappingTypeNode;
local l_isListTypeNode_0 = v8.isListTypeNode;
local l_isNonNullTypeNode_0 = v8.isNonNullTypeNode;
local l_printTypeNode_0 = v8.printTypeNode;
local l_mergeDirectives_0 = require(script.Parent.directives).mergeDirectives;
local l_compareNodes_0 = require(l_Parent_0.Utils).compareNodes;
local l_mergeArguments_0 = require(script.Parent.arguments).mergeArguments;
local v17 = nil;
local v18 = nil;
local function v26(v19, v20, v21) --[[ Line: 48 ]] --[[ Name: fieldAlreadyExists ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), l_extractType_0 (copy), l_Error_0 (copy)
    local v23 = l_Array_0.find(v19, function(v22) --[[ Line: 51 ]]
        -- upvalues: v20 (copy)
        return v22.name.value == v20.name.value;
    end);
    if v23 and (not v21 or not l_Boolean_0.toJSBoolean(v21.ignoreFieldConflicts)) then
        local v24 = l_extractType_0(v23.type);
        local v25 = l_extractType_0(v20.type);
        if v24.name.value ~= v25.name.value then
            error(l_Error_0.new(("Field \"%s\" already defined with a different type. Declared as \"%s\", but you tried to override with \"%s\""):format(tostring(v20.name.value), tostring(v24.name.value), (tostring(v25.name.value)))));
        end;
    end;
    return not not l_Boolean_0.toJSBoolean(v23);
end;
v5.mergeFields = function(v27, v28, v29, v30) --[[ Line: 83 ]] --[[ Name: mergeFields ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), v26 (copy), v17 (ref), l_isNonNullTypeNode_0 (copy), l_mergeArguments_0 (copy), l_mergeDirectives_0 (copy), l_compareNodes_0 (copy)
    local v31 = {};
    if v29 ~= nil then
        v31 = l_Array_0.concat(v31, v29);
    end;
    if v28 ~= nil then
        for _, v33 in v28 do
            if l_Boolean_0.toJSBoolean((v26(v31, v33, v30))) then
                local v35 = l_Array_0.find(v31, function(v34) --[[ Line: 115 ]]
                    -- upvalues: v33 (copy)
                    return v34.name.value == v33.name.value;
                end);
                if not v30 or not l_Boolean_0.toJSBoolean(v30.ignoreFieldConflicts) then
                    if v30 and l_Boolean_0.toJSBoolean(v30.throwOnConflict) then
                        v17(v27, v35, v33, false);
                    else
                        v17(v27, v35, v33, true);
                    end;
                    local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                    local v37 = l_isNonNullTypeNode_0(v33.type);
                    if l_toJSBoolean_0(if l_Boolean_0.toJSBoolean(v37) then not l_Boolean_0.toJSBoolean(l_isNonNullTypeNode_0(v35.type)) else v37) then
                        v35.type = v33.type;
                    end;
                end;
                v35.arguments = l_mergeArguments_0(if l_Boolean_0.toJSBoolean(v33.arguments) then v33.arguments else {}, if l_Boolean_0.toJSBoolean(v35.arguments) then v35.arguments else {}, v30);
                v35.directives = l_mergeDirectives_0(v33.directives, v35.directives, v30);
                v35.description = if l_Boolean_0.toJSBoolean(v33.description) then v33.description else v35.description;
            else
                table.insert(v31, v33);
            end;
        end;
    end;
    if v30 and l_Boolean_0.toJSBoolean(v30.sort) then
        l_Array_0.sort(v31, l_compareNodes_0);
    end;
    if v30 and v30.exclusions then
        local l_exclusions_0 = v30.exclusions;
        return l_Array_0.filter(v31, function(v39) --[[ Line: 183 ]]
            -- upvalues: l_Boolean_0 (ref), l_Array_0 (ref), l_exclusions_0 (copy), v27 (copy)
            return not l_Boolean_0.toJSBoolean(l_Array_0.includes(l_exclusions_0, ("%s.%s"):format(tostring(v27.name.value), (tostring(v39.name.value)))));
        end);
    else
        return v31;
    end;
end;
v17 = function(v40, v41, v42, v43) --[[ Line: 194 ]] --[[ Name: preventConflicts ]]
    -- upvalues: l_printTypeNode_0 (copy), l_Boolean_0 (copy), v18 (ref), l_Error_0 (copy)
    local v44 = v43 ~= nil and v43;
    local v45 = l_printTypeNode_0(v41.type);
    local v46 = l_printTypeNode_0(v42.type);
    if v45 ~= v46 and not l_Boolean_0.toJSBoolean(v18(v41.type, v42.type, v44)) then
        error(l_Error_0.new(("Field '%s.%s' changed type from '%s' to '%s'"):format(tostring(v40.name.value), tostring(v41.name.value), tostring(v45), (tostring(v46)))));
    end;
end;
v18 = function(v47, v48, v49) --[[ Line: 223 ]] --[[ Name: safeChangeForFieldType ]]
    -- upvalues: l_Boolean_0 (copy), l_isWrappingTypeNode_0 (copy), l_isNonNullTypeNode_0 (copy), v18 (ref), l_isListTypeNode_0 (copy)
    local v50 = v49 ~= nil and v49;
    if not l_Boolean_0.toJSBoolean(l_isWrappingTypeNode_0(v47)) and not l_Boolean_0.toJSBoolean(l_isWrappingTypeNode_0(v48)) then
        if typeof(v47) == "table" and #v47 == 0 and typeof(v48) == "table" and #v48 == 0 then
            return true;
        else
            return tostring(v47) == tostring(v48);
        end;
    elseif l_Boolean_0.toJSBoolean(l_isNonNullTypeNode_0(v48)) then
        local v51 = if l_Boolean_0.toJSBoolean(l_isNonNullTypeNode_0(v47)) then v47.type else v47;
        return v18(v51, v48.type);
    elseif l_Boolean_0.toJSBoolean(l_isNonNullTypeNode_0(v47)) then
        return v18(v48, v47, v50);
    elseif l_Boolean_0.toJSBoolean(l_isListTypeNode_0(v47)) then
        return l_isListTypeNode_0(v48) and v18(v47.type, v48.type) or l_isNonNullTypeNode_0(v48) and v18(v47, v48.type);
    else
        return false;
    end;
end;
return v5;