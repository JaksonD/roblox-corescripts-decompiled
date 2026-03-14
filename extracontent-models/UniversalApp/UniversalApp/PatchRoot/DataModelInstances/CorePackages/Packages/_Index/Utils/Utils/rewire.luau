local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local v6 = {};
local v7 = require(l_Parent_0.GraphQL);
local l_GraphQLDirective_0 = v7.GraphQLDirective;
local l_GraphQLEnumType_0 = v7.GraphQLEnumType;
local l_GraphQLInputObjectType_0 = v7.GraphQLInputObjectType;
local l_GraphQLInterfaceType_0 = v7.GraphQLInterfaceType;
local l_GraphQLList_0 = v7.GraphQLList;
local l_GraphQLObjectType_0 = v7.GraphQLObjectType;
local l_GraphQLNonNull_0 = v7.GraphQLNonNull;
local l_GraphQLScalarType_0 = v7.GraphQLScalarType;
local l_GraphQLUnionType_0 = v7.GraphQLUnionType;
local l_isInterfaceType_0 = v7.isInterfaceType;
local l_isEnumType_0 = v7.isEnumType;
local l_isInputObjectType_0 = v7.isInputObjectType;
local l_isListType_0 = v7.isListType;
local l_isNamedType_0 = v7.isNamedType;
local l_isNonNullType_0 = v7.isNonNullType;
local l_isObjectType_0 = v7.isObjectType;
local l_isScalarType_0 = v7.isScalarType;
local l_isUnionType_0 = v7.isUnionType;
local l_isSpecifiedScalarType_0 = v7.isSpecifiedScalarType;
local l_isSpecifiedDirective_0 = v7.isSpecifiedDirective;
local v28 = require(script.Parent.stub);
local l_getBuiltInForStub_0 = v28.getBuiltInForStub;
local l_isNamedStub_0 = v28.isNamedStub;
local l_Map_0 = v1.Map;
local l_String_0 = v1.String;
v6.rewireTypes = function(v33, v34) --[[ Line: 92 ]] --[[ Name: rewireTypes ]]
    -- upvalues: l_isSpecifiedDirective_0 (copy), l_GraphQLDirective_0 (copy), l_Map_0 (copy), l_isObjectType_0 (copy), l_Object_0 (copy), l_GraphQLObjectType_0 (copy), l_isInterfaceType_0 (copy), l_Array_0 (copy), l_GraphQLInterfaceType_0 (copy), l_isUnionType_0 (copy), l_GraphQLUnionType_0 (copy), l_isInputObjectType_0 (copy), l_GraphQLInputObjectType_0 (copy), l_isEnumType_0 (copy), l_GraphQLEnumType_0 (copy), l_isScalarType_0 (copy), l_isSpecifiedScalarType_0 (copy), l_GraphQLScalarType_0 (copy), l_Error_0 (copy), l_isListType_0 (copy), l_GraphQLList_0 (copy), l_isNonNullType_0 (copy), l_GraphQLNonNull_0 (copy), l_isNamedType_0 (copy), l_isNamedStub_0 (copy), l_getBuiltInForStub_0 (copy), l_String_0 (copy), l_console_0 (copy)
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    local v42 = nil;
    local v43 = nil;
    v37 = function(v44) --[[ Line: 114 ]] --[[ Name: rewireDirective ]]
        -- upvalues: l_isSpecifiedDirective_0 (ref), v38 (ref), l_GraphQLDirective_0 (ref)
        if l_isSpecifiedDirective_0(v44) then
            return v44;
        else
            local v45 = v44:toConfig();
            v45.args = v38(v45.args);
            return l_GraphQLDirective_0.new(v45);
        end;
    end;
    v38 = function(v46) --[[ Line: 123 ]] --[[ Name: rewireArgs ]]
        -- upvalues: l_Map_0 (ref), v43 (ref)
        local v47 = l_Map_0.new();
        for _, v49 in v46 do
            local v50 = v49[1];
            local v51 = v46:get(v50);
            local v52 = v43(v51.type);
            if v52 ~= nil then
                v51.type = v52;
                v47:set(v50, v51);
            end;
        end;
        return v47;
    end;
    v39 = function(v53) --[[ Line: 138 ]] --[[ Name: rewireNamedType ]]
        -- upvalues: l_isObjectType_0 (ref), l_Object_0 (ref), v40 (ref), v42 (ref), l_GraphQLObjectType_0 (ref), l_isInterfaceType_0 (ref), l_Array_0 (ref), l_GraphQLInterfaceType_0 (ref), l_isUnionType_0 (ref), l_GraphQLUnionType_0 (ref), l_isInputObjectType_0 (ref), v41 (ref), l_GraphQLInputObjectType_0 (ref), l_isEnumType_0 (ref), l_GraphQLEnumType_0 (ref), l_isScalarType_0 (ref), l_isSpecifiedScalarType_0 (ref), l_GraphQLScalarType_0 (ref), l_Error_0 (ref)
        if l_isObjectType_0(v53) then
            local v54 = v53:toConfig();
            local v55 = l_Object_0.assign({}, v54, {
                fields = function() --[[ Line: 143 ]] --[[ Name: fields ]]
                    -- upvalues: v40 (ref), v54 (copy)
                    return v40(v54.fields);
                end, 
                interfaces = function() --[[ Line: 146 ]] --[[ Name: interfaces ]]
                    -- upvalues: v42 (ref), v54 (copy)
                    return v42(v54.interfaces);
                end
            });
            return l_GraphQLObjectType_0.new(v55);
        elseif l_isInterfaceType_0(v53) then
            local v56 = v53:toConfig();
            local v57 = l_Object_0.assign({}, v56, {
                fields = function() --[[ Line: 154 ]] --[[ Name: fields ]]
                    -- upvalues: v40 (ref), v56 (copy)
                    return v40(v56.fields);
                end
            });
            if l_Array_0.indexOf(l_Object_0.keys(v57), "interfaces") ~= -1 then
                v57.interfaces = function(_) --[[ Line: 159 ]]
                    -- upvalues: v42 (ref), v56 (copy)
                    return v42(v56.interfaces);
                end;
            end;
            return l_GraphQLInterfaceType_0.new(v57);
        elseif l_isUnionType_0(v53) then
            local v59 = v53:toConfig();
            local v60 = l_Object_0.assign({}, v59, {
                types = function() --[[ Line: 169 ]] --[[ Name: types ]]
                    -- upvalues: v42 (ref), v59 (copy)
                    return v42(v59.types);
                end
            });
            return l_GraphQLUnionType_0.new(v60);
        elseif l_isInputObjectType_0(v53) then
            local v61 = v53:toConfig();
            local v62 = l_Object_0.assign({}, v61, {
                fields = function() --[[ Line: 177 ]] --[[ Name: fields ]]
                    -- upvalues: v41 (ref), v61 (copy)
                    return v41(v61.fields);
                end
            });
            return l_GraphQLInputObjectType_0.new(v62);
        elseif l_isEnumType_0(v53) then
            local v63 = v53:toConfig();
            return l_GraphQLEnumType_0.new(v63);
        elseif l_isScalarType_0(v53) then
            if l_isSpecifiedScalarType_0(v53) then
                return v53;
            else
                local v64 = v53:toConfig();
                local l_serialize_0 = v64.serialize;
                local l_parseValue_0 = v64.parseValue;
                local l_parseLiteral_0 = v64.parseLiteral;
                if l_serialize_0 then
                    v64.serialize = function(...) --[[ Line: 196 ]]
                        -- upvalues: l_serialize_0 (copy), v64 (copy)
                        return l_serialize_0(v64, ...);
                    end;
                end;
                if l_parseValue_0 then
                    v64.parseValue = function(...) --[[ Line: 202 ]]
                        -- upvalues: l_parseValue_0 (copy), v64 (copy)
                        return l_parseValue_0(v64, ...);
                    end;
                end;
                if l_parseLiteral_0 then
                    v64.parseLiteral = function(...) --[[ Line: 208 ]]
                        -- upvalues: l_parseLiteral_0 (copy), v64 (copy)
                        return l_parseLiteral_0(v64, ...);
                    end;
                end;
                return l_GraphQLScalarType_0.new(v64);
            end;
        else
            error(l_Error_0.new(("Unexpected schema type: %s"):format((tostring(v53)))));
            return;
        end;
    end;
    v40 = function(v68) --[[ Line: 220 ]] --[[ Name: rewireFields ]]
        -- upvalues: l_Map_0 (ref), v43 (ref), v38 (ref)
        local v69 = l_Map_0.new();
        for _, v71 in v68 do
            local v72 = v71[1];
            local v73 = v68:get(v72);
            local v74 = v43(v73.type);
            if v74 ~= nil and v73.args then
                v73.type = v74;
                v73.args = v38(v73.args);
                v69:set(v72, v73);
            end;
        end;
        return v69;
    end;
    v41 = function(v75) --[[ Line: 235 ]] --[[ Name: rewireInputFields ]]
        -- upvalues: l_Map_0 (ref), v43 (ref)
        local v76 = l_Map_0.new();
        for _, v78 in v75 do
            local v79 = v78[1];
            local v80 = v75:get(v79);
            local v81 = v43(v80.type);
            if v81 ~= nil then
                v80.type = v81;
                v76:set(v79, v80);
            end;
        end;
        return v76;
    end;
    v42 = function(v82) --[[ Line: 249 ]] --[[ Name: rewireNamedTypes ]]
        -- upvalues: v43 (ref), l_Object_0 (ref)
        local v83 = {};
        for _, v85 in v82 do
            local v86 = v43(v85);
            if v86 ~= nil and v86 ~= l_Object_0.None then
                table.insert(v83, v86);
            end;
        end;
        return v83;
    end;
    v43 = function(v87) --[[ Line: 260 ]] --[[ Name: rewireType ]]
        -- upvalues: l_isListType_0 (ref), v43 (ref), l_Object_0 (ref), l_GraphQLList_0 (ref), l_isNonNullType_0 (ref), l_GraphQLNonNull_0 (ref), l_isNamedType_0 (ref), v35 (ref), l_isNamedStub_0 (ref), l_getBuiltInForStub_0 (ref), v39 (ref), v36 (ref)
        if l_isListType_0(v87) then
            local v88 = v43(v87.ofType);
            if v88 ~= nil and v88 ~= l_Object_0.None then
                return (l_GraphQLList_0.new(v88));
            else
                return nil;
            end;
        elseif l_isNonNullType_0(v87) then
            local v89 = v43(v87.ofType);
            if v89 ~= nil and v89 ~= l_Object_0.None then
                return (l_GraphQLNonNull_0.new(v89));
            else
                return nil;
            end;
        elseif l_isNamedType_0(v87) then
            local v90 = v35:get(v87.name);
            if v90 == nil then
                v90 = if l_isNamedStub_0(v87) then l_getBuiltInForStub_0(v87) else v39(v87);
                v35:set(v87.name, v90);
                v36:set(v90.name, (v35:get(v87.name)));
            end;
            if v90 ~= nil and v90 ~= l_Object_0.None then
                return (v36:get(v90.name));
            else
                return nil;
            end;
        else
            return nil;
        end;
    end;
    v35 = l_Map_0.new();
    for _, v92 in v33 do
        local v93 = v92[1];
        local l_v93_0 = v93;
        local v95 = v33:get(v93);
        v35:set(l_v93_0, v95);
    end;
    v36 = l_Map_0.new();
    for _, v97 in v35 do
        local v98 = v97[1];
        local v99 = v35:get(v98);
        if v99 ~= nil and v99 ~= l_Object_0.None and not l_String_0.startsWith(v98, "__") then
            local l_name_0 = v99.name;
            if not l_String_0.startsWith(l_name_0, "__") then
                if v36:get(l_name_0) ~= nil then
                    l_console_0.warn(("Duplicate schema type name %s found; keeping the existing one found in the schema"):format((tostring(l_name_0))));
                else
                    v36:set(l_name_0, v99);
                end;
            end;
        end;
    end;
    for _, v102 in v36 do
        local v103 = v102[1];
        v36:set(v103, v39(v36:get(v103)));
    end;
    local v105 = l_Array_0.map(v34, function(v104) --[[ Line: 360 ]]
        -- upvalues: v37 (ref)
        return v37(v104);
    end);
    return {
        typeMap = v36, 
        directives = v105
    };
end;
return v6;