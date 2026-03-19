local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_HttpService_0 = game:GetService("HttpService");
local v6 = {};
local v7 = nil;
local v8 = nil;
local v9 = nil;
local _ = require(script.Parent.types);
local _ = require(l_Parent_1.GraphQL);
local l_InvariantError_0 = require(l_Parent_0.jsutils.invariant).InvariantError;
local l_isNonNullObject_0 = require(script.Parent.Parent.common.objects).isNonNullObject;
local v14 = require(script.Parent.fragments);
local v15 = require(l_Parent_0.luaUtils.objectKeysForEach);
local l_getFragmentFromSelection_0 = v14.getFragmentFromSelection;
v6.makeReference = function(v17) --[[ Line: 59 ]] --[[ Name: makeReference ]]
    return {
        __ref = tostring(v17)
    };
end;
v6.isReference = function(v18) --[[ Line: 64 ]] --[[ Name: isReference ]]
    local v19 = false;
    if type(v18) == "table" then
        v19 = type(v18.__ref) == "string";
    end;
    return v19;
end;
v6.isDocumentNode = function(v20) --[[ Line: 74 ]] --[[ Name: isDocumentNode ]]
    -- upvalues: l_isNonNullObject_0 (copy), l_Array_0 (copy)
    return l_isNonNullObject_0(v20) and v20.kind == "Document" and l_Array_0.isArray(v20.definitions);
end;
local function _(v21) --[[ Line: 81 ]] --[[ Name: isStringValue ]]
    return v21.kind == "StringValue";
end;
local function _(v23) --[[ Line: 85 ]] --[[ Name: isBooleanValue ]]
    return v23.kind == "BooleanValue";
end;
local function _(v25) --[[ Line: 89 ]] --[[ Name: isIntValue ]]
    return v25.kind == "IntValue";
end;
local function _(v27) --[[ Line: 93 ]] --[[ Name: isFloatValue ]]
    return v27.kind == "FloatValue";
end;
local function _(v29) --[[ Line: 97 ]] --[[ Name: isVariable ]]
    return v29.kind == "Variable";
end;
local function _(v31) --[[ Line: 101 ]] --[[ Name: isObjectValue ]]
    return v31.kind == "ObjectValue";
end;
local function _(v33) --[[ Line: 105 ]] --[[ Name: isListValue ]]
    return v33.kind == "ListValue";
end;
local function _(v35) --[[ Line: 109 ]] --[[ Name: isEnumValue ]]
    return v35.kind == "EnumValue";
end;
local function _(v37) --[[ Line: 113 ]] --[[ Name: isNullValue ]]
    return v37.kind == "NullValue";
end;
local function v39(v40, v41, v42, v43) --[[ Line: 117 ]] --[[ Name: valueToObjectRepresentation ]]
    -- upvalues: l_Array_0 (copy), v39 (copy), l_InvariantError_0 (copy)
    if v42.kind == "IntValue" or v42.kind == "FloatValue" then
        v40[v41.value] = tonumber(v42.value);
        return;
    elseif v42.kind == "BooleanValue" or v42.kind == "StringValue" then
        v40[v41.value] = v42.value;
        return;
    elseif v42.kind == "ObjectValue" then
        local v44 = {};
        l_Array_0.map(v42.fields, function(v45) --[[ Line: 125 ]]
            -- upvalues: v39 (ref), v44 (copy), v43 (copy)
            v39(v44, v45.name, v45.value, v43);
            return nil;
        end);
        v40[v41.value] = v44;
        return;
    elseif v42.kind == "Variable" then
        local v46 = (v43 or {})[v42.name.value];
        v40[v41.value] = v46;
        return;
    elseif v42.kind == "ListValue" then
        v40[v41.value] = l_Array_0.map(v42.values, function(v47) --[[ Line: 136 ]]
            -- upvalues: v39 (ref), v41 (copy), v43 (copy)
            local v48 = {};
            v39(v48, v41, v47, v43);
            return v48[v41.value];
        end);
        return;
    elseif v42.kind == "EnumValue" then
        v40[v41.value] = v42.value;
        return;
    elseif v42.kind == "NullValue" then
        v40[v41.value] = nil;
        return;
    else
        error(l_InvariantError_0.new(tostring(("The inline argument \"%s\" of kind \"%s\""):format(v41.value, v42.kind)) .. "is not supported. Use variables instead of inline arguments to " .. "overcome this limitation."));
        return;
    end;
end;
v6.valueToObjectRepresentation = v39;
v6.storeKeyNameFromField = function(v49, v50) --[[ Line: 158 ]] --[[ Name: storeKeyNameFromField ]]
    -- upvalues: l_Array_0 (copy), v39 (copy), v7 (ref)
    local v51 = nil;
    if v49.directives then
        v51 = {};
        l_Array_0.forEach(v49.directives, function(v52) --[[ Line: 162 ]]
            -- upvalues: v51 (ref), l_Array_0 (ref), v39 (ref), v50 (copy)
            v51[v52.name.value] = {};
            if v52.arguments then
                l_Array_0.forEach(v52.arguments, function(v53) --[[ Line: 166 ]]
                    -- upvalues: v39 (ref), v51 (ref), v52 (copy), v50 (ref)
                    local l_name_0 = v53.name;
                    local l_value_0 = v53.value;
                    v39(v51[v52.name.value], l_name_0, l_value_0, v50);
                end);
            end;
        end);
    end;
    local v56 = nil;
    if v49.arguments and #v49.arguments > 0 then
        v56 = {};
        l_Array_0.forEach(v49.arguments, function(v57) --[[ Line: 177 ]]
            -- upvalues: v39 (ref), v56 (ref), v50 (copy)
            local l_name_1 = v57.name;
            local l_value_1 = v57.value;
            v39(v56, l_name_1, l_value_1, v50);
        end);
    end;
    return v7(v49.name.value, v56, v51);
end;
local v60 = {
    "connection", 
    "include", 
    "skip", 
    "client", 
    "rest", 
    "export"
};
v7 = l_Object_0.assign(setmetatable({}, {
    __call = function(_, v62, v63, v64) --[[ Line: 201 ]] --[[ Name: __call ]]
        -- upvalues: l_Array_0 (copy), v8 (ref), v15 (copy), v60 (copy)
        if v63 and v64 and v64.connection and v64.connection.key then
            if v64.connection.filter and #v64.connection.filter > 0 then
                local v65 = nil;
                v65 = if v64.connection.filter then v64.connection.filter else {};
                l_Array_0.sort(v65, nil);
                local v66 = {};
                l_Array_0.forEach(v65, function(v67) --[[ Line: 227 ]]
                    -- upvalues: v66 (copy), v63 (copy)
                    v66[v67] = v63[v67];
                end);
                return ("%s(%s)"):format(v64.connection.key, v8(v66));
            else
                return v64.connection.key;
            end;
        else
            local l_v62_0 = v62;
            if v63 then
                l_v62_0 = l_v62_0 .. ("(%s)"):format((v8(v63)));
            end;
            if v64 then
                v15(v64, function(v69) --[[ Line: 254 ]]
                    -- upvalues: l_Array_0 (ref), v60 (ref), v64 (copy), l_v62_0 (ref), v8 (ref)
                    if l_Array_0.indexOf(v60, v69) ~= -1 then
                        return;
                    elseif v64[v69] and next(v64[v69]) ~= nil then
                        l_v62_0 = l_v62_0 .. ("@%s(%s)"):format(v69, v8(v64[v69]));
                        return;
                    else
                        l_v62_0 = l_v62_0 .. ("@%s"):format(v69);
                        return;
                    end;
                end);
            end;
            return l_v62_0;
        end;
    end
}), {
    setStringify = function(_, v71) --[[ Line: 273 ]] --[[ Name: setStringify ]]
        -- upvalues: v8 (ref)
        local l_v8_0 = v8;
        v8 = v71;
        return l_v8_0;
    end
});
v6.getStoreKeyName = v7;
v8 = function(v73) --[[ Line: 284 ]] --[[ Name: stringify ]]
    -- upvalues: l_isNonNullObject_0 (copy), l_HttpService_0 (copy), l_Array_0 (copy), l_Object_0 (copy), v8 (ref)
    if not l_isNonNullObject_0(v73) then
        return l_HttpService_0:JSONEncode(v73);
    else
        local v75 = l_Array_0.map(l_Array_0.sort(l_Object_0.keys(v73), nil), function(v74) --[[ Line: 295 ]]
            -- upvalues: v8 (ref), v73 (copy)
            return {
                v74, 
                v8(v73[v74])
            };
        end);
        if l_Array_0.isArray(v73) then
            return ("[%s]"):format(l_Array_0.join(l_Array_0.map(v75, function(v76) --[[ Line: 301 ]]
                return v76[2];
            end), ","));
        else
            return ("{%s}"):format(l_Array_0.join(l_Array_0.map(v75, function(v77) --[[ Line: 308 ]]
                return ("\"%s\":%s"):format(v77[1], v77[2]);
            end), ","));
        end;
    end;
end;
v6.argumentsObjectFromField = function(v78, v79) --[[ Line: 329 ]] --[[ Name: argumentsObjectFromField ]]
    -- upvalues: l_Array_0 (copy), v39 (copy)
    if v78.arguments and #v78.arguments > 0 then
        local v80 = {};
        l_Array_0.forEach(v78.arguments, function(v81) --[[ Line: 334 ]]
            -- upvalues: v39 (ref), v80 (copy), v79 (copy)
            local l_name_2 = v81.name;
            local l_value_2 = v81.value;
            v39(v80, l_name_2, l_value_2, v79);
        end);
        return v80;
    else
        return nil;
    end;
end;
v6.resultKeyNameFromField = function(v84) --[[ Line: 344 ]] --[[ Name: resultKeyNameFromField ]]
    if v84.alias then
        return v84.alias.value;
    else
        return v84.name.value;
    end;
end;
local function v85(v86, v87, v88) --[[ Line: 355 ]] --[[ Name: getTypenameFromResult ]]
    -- upvalues: v9 (ref), v85 (copy), l_getFragmentFromSelection_0 (copy)
    if typeof(v86.__typename) == "string" then
        return v86.__typename;
    else
        for _, v90 in ipairs(v87.selections) do
            if v9(v90) then
                if v90.name.value == "__typename" then
                    return v86[if v90.alias then v90.alias.value else v90.name.value];
                end;
            else
                local v91 = v85(v86, l_getFragmentFromSelection_0(v90, v88).selectionSet, v88);
                if typeof(v91) == "string" then
                    return v91;
                end;
            end;
        end;
        return nil;
    end;
end;
v6.getTypenameFromResult = v85;
v9 = function(v92) --[[ Line: 385 ]] --[[ Name: isField ]]
    return v92.kind == "Field";
end;
v6.isField = v9;
v6.isInlineFragment = function(v93) --[[ Line: 390 ]] --[[ Name: isInlineFragment ]]
    return v93.kind == "InlineFragment";
end;
return v6;