local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_console_0 = v1.console;
local v6 = {};
local v7 = require(l_Parent_0.GraphQL);
local l_GraphQLList_0 = v7.GraphQLList;
local l_GraphQLNonNull_0 = v7.GraphQLNonNull;
local l_isNamedType_0 = v7.isNamedType;
local l_isObjectType_0 = v7.isObjectType;
local l_isInterfaceType_0 = v7.isInterfaceType;
local l_isUnionType_0 = v7.isUnionType;
local l_isInputObjectType_0 = v7.isInputObjectType;
local l_isLeafType_0 = v7.isLeafType;
local l_isListType_0 = v7.isListType;
local l_isNonNullType_0 = v7.isNonNullType;
local l_Map_0 = v1.Map;
local l_String_0 = v1.String;
local v20 = nil;
v6.healSchema = function(v21) --[[ Line: 96 ]] --[[ Name: healSchema ]]
    -- upvalues: v20 (ref)
    v20(v21:getTypeMap(), v21:getDirectives());
    return v21;
end;
v20 = function(v22, v23) --[[ Line: 106 ]] --[[ Name: healTypes ]]
    -- upvalues: l_Boolean_0 (copy), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isUnionType_0 (copy), l_isInputObjectType_0 (copy), l_isLeafType_0 (copy), l_Error_0 (copy), l_Array_0 (copy), l_isListType_0 (copy), l_GraphQLList_0 (copy), l_isNonNullType_0 (copy), l_GraphQLNonNull_0 (copy), l_isNamedType_0 (copy), l_Map_0 (copy), l_String_0 (copy), l_console_0 (copy)
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    v24 = function(v30) --[[ Line: 187 ]] --[[ Name: healNamedType ]]
        -- upvalues: l_Boolean_0 (ref), l_isObjectType_0 (ref), v25 (ref), v26 (ref), l_isInterfaceType_0 (ref), l_isUnionType_0 (ref), v28 (ref), l_isInputObjectType_0 (ref), v27 (ref), l_isLeafType_0 (ref), l_Error_0 (ref)
        if l_Boolean_0.toJSBoolean(l_isObjectType_0(v30)) then
            v25(v30);
            v26(v30);
            return;
        elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v30)) then
            v25(v30);
            if v30.getInterfaces ~= nil then
                v26(v30);
            end;
            return;
        elseif l_Boolean_0.toJSBoolean(l_isUnionType_0(v30)) then
            v28(v30);
            return;
        elseif l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v30)) then
            v27(v30);
            return;
        elseif l_Boolean_0.toJSBoolean(l_isLeafType_0(v30)) then
            return;
        else
            error(l_Error_0.new(("Unexpected schema type: %s"):format((tostring(v30)))));
            return;
        end;
    end;
    v25 = function(v31) --[[ Line: 234 ]] --[[ Name: healFields ]]
        -- upvalues: l_Array_0 (ref), v29 (ref), l_Boolean_0 (ref)
        local v32 = v31:getFields();
        for _, v34 in v32:entries() do
            local v35 = v34[1];
            local v36 = v34[2];
            l_Array_0.filter(l_Array_0.map(v36.args, function(v37) --[[ Line: 250 ]]
                -- upvalues: v29 (ref)
                v37.type = v29(v37.type);
                if v37.type == nil then
                    return nil;
                else
                    return v37;
                end;
            end), l_Boolean_0.toJSBoolean);
            v36.type = v29(v36.type);
            if v36.type == nil then
                v32[tostring(v35)] = nil;
            end;
        end;
    end;
    v26 = function(v38) --[[ Line: 267 ]] --[[ Name: healInterfaces ]]
        -- upvalues: l_Array_0 (ref), v29 (ref), l_Boolean_0 (ref)
        if v38.getInterfaces ~= nil then
            local v39 = v38:getInterfaces();
            v39 = l_Array_0.concat(v39, l_Array_0.filter(l_Array_0.map(l_Array_0.splice(v39, 1), function(v40) --[[ Line: 285 ]]
                -- upvalues: v29 (ref)
                return (v29(v40));
            end), l_Boolean_0.toJSBoolean));
        end;
    end;
    v27 = function(v41) --[[ Line: 296 ]] --[[ Name: healInputFields ]]
        -- upvalues: v29 (ref)
        local v42 = v41:getFields();
        for _, v44 in v42:entries() do
            local v45 = v44[1];
            local v46 = v44[2];
            v46.type = v29(v46.type);
            if v46.type == nil then
                v42[tostring(v45)] = nil;
            end;
        end;
    end;
    v28 = function(v47) --[[ Line: 316 ]] --[[ Name: healUnderlyingTypes ]]
        -- upvalues: l_Array_0 (ref), v29 (ref), l_Boolean_0 (ref)
        local v48 = v47:getTypes();
        v48 = l_Array_0.concat(v48, l_Array_0.filter(l_Array_0.map(l_Array_0.splice(v48, 1), function(v49) --[[ Line: 327 ]]
            -- upvalues: v29 (ref)
            return (v29(v49));
        end), l_Boolean_0.toJSBoolean));
    end;
    v29 = function(v50) --[[ Line: 337 ]] --[[ Name: healType ]]
        -- upvalues: l_Boolean_0 (ref), l_isListType_0 (ref), v29 (ref), l_GraphQLList_0 (ref), l_isNonNullType_0 (ref), l_GraphQLNonNull_0 (ref), l_isNamedType_0 (ref), v22 (copy)
        if l_Boolean_0.toJSBoolean(l_isListType_0(v50)) then
            local v51 = v29(v50.ofType);
            if v51 ~= nil then
                return (l_GraphQLList_0.new(v51));
            else
                return nil;
            end;
        elseif l_Boolean_0.toJSBoolean(l_isNonNullType_0(v50)) then
            local v52 = v29(v50.ofType);
            if v52 ~= nil then
                return (l_GraphQLNonNull_0.new(v52));
            else
                return nil;
            end;
        else
            if l_Boolean_0.toJSBoolean(l_isNamedType_0(v50)) then
                local v53 = v22:get(v50.name);
                if l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v53) then v50 ~= v53 else v53) then
                    return v53;
                end;
            end;
            return v50;
        end;
    end;
    local v54 = l_Map_0.new();
    for _, v56 in v22 do
        local v57 = table.unpack(v56);
        local v58 = v22:get(v57);
        if v58 ~= nil and not l_String_0.startsWith(v57, "__") then
            local l_name_0 = v58.name;
            if not l_String_0.startsWith(l_name_0, "__") then
                if v54:get(l_name_0) ~= nil then
                    l_console_0.warn(("Duplicate schema type name %s found; keeping the existing one found in the schema"):format(l_name_0));
                else
                    v54:set(l_name_0, v58);
                end;
            end;
        end;
    end;
    for _, v61 in v54 do
        local v62 = table.unpack(v61);
        v22:set(v62, (v54:get(v62)));
    end;
    for _, v64 in v23 do
        v64.args = l_Array_0.filter(v64.args, function(v65) --[[ Line: 422 ]]
            -- upvalues: v29 (ref)
            v65.type = v29(v65.type);
            return v65.type ~= nil;
        end);
    end;
    for _, v67 in v22 do
        local v68 = table.unpack(v67);
        local v69 = v22:get(v68);
        if not l_String_0.startsWith(v68, "__") and l_Array_0.indexOf(v54:keys(), v68) ~= -1 and v69 ~= nil then
            v24(v69);
        end;
    end;
    for _, v71 in v22 do
        local v72 = table.unpack(v71);
        if not l_String_0.startsWith(v72, "__") and l_Array_0.indexOf(v54:keys(), v72) == -1 then
            v22:set(v72, nil);
        end;
    end;
end;
v6.healTypes = v20;
return v6;