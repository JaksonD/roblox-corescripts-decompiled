local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_keyValMap_0 = require(l_Parent_0.jsutils.keyValMap).keyValMap;
local l_naturalCompare_0 = require(l_Parent_0.jsutils.naturalCompare).naturalCompare;
local l_GraphQLSchema_0 = require(l_Parent_0.type.schema).GraphQLSchema;
local l_GraphQLDirective_0 = require(l_Parent_0.type.directives).GraphQLDirective;
local v12 = require(l_Parent_0.type.definition);
local _ = require(l_Parent_0.language.ast);
local l_isIntrospectionType_0 = require(l_Parent_0.type.introspection).isIntrospectionType;
local l_GraphQLList_0 = v12.GraphQLList;
local l_GraphQLNonNull_0 = v12.GraphQLNonNull;
local l_GraphQLObjectType_0 = v12.GraphQLObjectType;
local l_GraphQLInterfaceType_0 = v12.GraphQLInterfaceType;
local l_GraphQLUnionType_0 = v12.GraphQLUnionType;
local l_GraphQLEnumType_0 = v12.GraphQLEnumType;
local l_GraphQLInputObjectType_0 = v12.GraphQLInputObjectType;
local l_isListType_0 = v12.isListType;
local l_isNonNullType_0 = v12.isNonNullType;
local l_isScalarType_0 = v12.isScalarType;
local l_isObjectType_0 = v12.isObjectType;
local l_isInterfaceType_0 = v12.isInterfaceType;
local l_isUnionType_0 = v12.isUnionType;
local l_isEnumType_0 = v12.isEnumType;
local l_isInputObjectType_0 = v12.isInputObjectType;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local function v66(v33) --[[ Line: 78 ]] --[[ Name: lexicographicSortSchema ]]
    -- upvalues: l_isListType_0 (copy), l_GraphQLList_0 (copy), l_isNonNullType_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLDirective_0 (copy), l_Object_0 (copy), v32 (ref), v30 (ref), l_Array_0 (copy), v31 (ref), l_isScalarType_0 (copy), l_isIntrospectionType_0 (copy), l_isObjectType_0 (copy), l_GraphQLObjectType_0 (copy), l_isInterfaceType_0 (copy), l_GraphQLInterfaceType_0 (copy), l_isUnionType_0 (copy), l_GraphQLUnionType_0 (copy), l_isEnumType_0 (copy), l_GraphQLEnumType_0 (copy), l_isInputObjectType_0 (copy), l_GraphQLInputObjectType_0 (copy), l_invariant_0 (copy), l_inspect_0 (copy), l_keyValMap_0 (copy), l_GraphQLSchema_0 (copy)
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    local v42 = nil;
    local v43 = v33:toConfig();
    local function v44(v45) --[[ Line: 86 ]] --[[ Name: replaceType ]]
        -- upvalues: l_isListType_0 (ref), l_GraphQLList_0 (ref), v44 (copy), l_isNonNullType_0 (ref), l_GraphQLNonNull_0 (ref), v35 (ref)
        if l_isListType_0(v45) then
            return l_GraphQLList_0.new(v44(v45.ofType));
        elseif l_isNonNullType_0(v45) then
            return l_GraphQLNonNull_0.new(v44(v45.ofType));
        else
            return v35(v45);
        end;
    end;
    v35 = function(v46) --[[ Line: 102 ]] --[[ Name: replaceNamedType ]]
        -- upvalues: v34 (ref)
        return v34[v46.name];
    end;
    v36 = function(v47) --[[ Line: 108 ]] --[[ Name: replaceMaybeType ]]
        -- upvalues: v35 (ref)
        if v47 then
            return (v35(v47));
        else
            return nil;
        end;
    end;
    v37 = function(v48) --[[ Line: 112 ]] --[[ Name: sortDirective ]]
        -- upvalues: l_GraphQLDirective_0 (ref), l_Object_0 (ref), v32 (ref), v38 (ref)
        local v49 = v48:toConfig();
        return l_GraphQLDirective_0.new(l_Object_0.assign({}, v49, {
            locations = v32(v49.locations, function(v50) --[[ Line: 116 ]]
                return v50;
            end), 
            args = v38(v49.args)
        }));
    end;
    v38 = function(v51) --[[ Line: 123 ]] --[[ Name: sortArgs ]]
        -- upvalues: v30 (ref), l_Object_0 (ref), v44 (copy)
        return v30(v51, function(v52) --[[ Line: 124 ]]
            -- upvalues: l_Object_0 (ref), v44 (ref)
            return l_Object_0.assign({}, v52, {
                type = v44(v52.type)
            });
        end);
    end;
    v39 = function(v53) --[[ Line: 131 ]] --[[ Name: sortFields ]]
        -- upvalues: v30 (ref), l_Object_0 (ref), v44 (copy), v38 (ref)
        return v30(v53, function(v54) --[[ Line: 132 ]]
            -- upvalues: l_Object_0 (ref), v44 (ref), v38 (ref)
            return l_Object_0.assign({}, v54, {
                type = v44(v54.type), 
                args = if v54.args then v38(v54.args) else nil
            });
        end);
    end;
    v40 = function(v55) --[[ Line: 140 ]] --[[ Name: sortInputFields ]]
        -- upvalues: v30 (ref), l_Object_0 (ref), v44 (copy)
        return v30(v55, function(v56) --[[ Line: 141 ]]
            -- upvalues: l_Object_0 (ref), v44 (ref)
            return l_Object_0.assign({}, v56, {
                type = v44(v56.type)
            });
        end);
    end;
    v41 = function(v57) --[[ Line: 148 ]] --[[ Name: sortTypes ]]
        -- upvalues: l_Array_0 (ref), v31 (ref), v35 (ref)
        return l_Array_0.map(v31(v57), v35);
    end;
    v42 = function(v58) --[[ Line: 152 ]] --[[ Name: sortNamedType ]]
        -- upvalues: l_isScalarType_0 (ref), l_isIntrospectionType_0 (ref), l_isObjectType_0 (ref), l_GraphQLObjectType_0 (ref), l_Object_0 (ref), v41 (ref), v39 (ref), l_isInterfaceType_0 (ref), l_GraphQLInterfaceType_0 (ref), l_isUnionType_0 (ref), l_GraphQLUnionType_0 (ref), l_isEnumType_0 (ref), l_GraphQLEnumType_0 (ref), v30 (ref), l_isInputObjectType_0 (ref), l_GraphQLInputObjectType_0 (ref), v40 (ref), l_invariant_0 (ref), l_inspect_0 (ref)
        if l_isScalarType_0(v58) or l_isIntrospectionType_0(v58) then
            return v58;
        elseif l_isObjectType_0(v58) then
            local v59 = v58:toConfig();
            return l_GraphQLObjectType_0.new(l_Object_0.assign({}, v59, {
                interfaces = function() --[[ Line: 161 ]] --[[ Name: interfaces ]]
                    -- upvalues: v41 (ref), v59 (copy)
                    return v41(v59.interfaces);
                end, 
                fields = function() --[[ Line: 164 ]] --[[ Name: fields ]]
                    -- upvalues: v39 (ref), v59 (copy)
                    return v39(v59.fields);
                end
            }));
        elseif l_isInterfaceType_0(v58) then
            local v60 = v58:toConfig();
            return l_GraphQLInterfaceType_0.new(l_Object_0.assign({}, v60, {
                interfaces = function() --[[ Line: 174 ]] --[[ Name: interfaces ]]
                    -- upvalues: v41 (ref), v60 (copy)
                    return v41(v60.interfaces);
                end, 
                fields = function() --[[ Line: 177 ]] --[[ Name: fields ]]
                    -- upvalues: v39 (ref), v60 (copy)
                    return v39(v60.fields);
                end
            }));
        elseif l_isUnionType_0(v58) then
            local v61 = v58:toConfig();
            return l_GraphQLUnionType_0.new(l_Object_0.assign({}, v61, {
                types = function() --[[ Line: 187 ]] --[[ Name: types ]]
                    -- upvalues: v41 (ref), v61 (copy)
                    return v41(v61.types);
                end
            }));
        elseif l_isEnumType_0(v58) then
            local v62 = v58:toConfig();
            return l_GraphQLEnumType_0.new(l_Object_0.assign({}, v62, {
                values = v30(v62.values, function(v63) --[[ Line: 197 ]]
                    return v63;
                end)
            }));
        elseif l_isInputObjectType_0(v58) then
            local v64 = v58:toConfig();
            return l_GraphQLInputObjectType_0.new(l_Object_0.assign({}, v64, {
                fields = function() --[[ Line: 208 ]] --[[ Name: fields ]]
                    -- upvalues: v40 (ref), v64 (copy)
                    return v40(v64.fields);
                end
            }));
        else
            l_invariant_0(false, "Unexpected type: " .. l_inspect_0(v58));
            error("Unexpected type: " .. l_inspect_0(v58));
            return;
        end;
    end;
    v34 = l_keyValMap_0(v31(v43.types), function(v65) --[[ Line: 220 ]]
        return v65.name;
    end, v42);
    return l_GraphQLSchema_0.new(l_Object_0.assign({}, v43, {
        types = v34:values(), 
        directives = l_Array_0.map(v31(v43.directives), v37), 
        query = v36(v43.query), 
        mutation = v36(v43.mutation), 
        subscription = v36(v43.subscription)
    }));
end;
v30 = function(v67, v68) --[[ Line: 235 ]] --[[ Name: sortObjMap ]]
    -- upvalues: l_Map_0 (copy), v32 (ref)
    local v69 = l_Map_0.new();
    local v71 = v32(v67:keys(), function(v70) --[[ Line: 238 ]]
        return v70;
    end);
    for _, v73 in ipairs(v71) do
        v69[v73] = v68(v67[v73]);
    end;
    return v69;
end;
v31 = function(v74) --[[ Line: 249 ]] --[[ Name: sortByName ]]
    -- upvalues: v32 (ref)
    return v32(v74, function(v75) --[[ Line: 250 ]]
        return v75.name;
    end);
end;
v32 = function(v76, v77) --[[ Line: 256 ]] --[[ Name: sortBy ]]
    -- upvalues: l_Array_0 (copy), l_naturalCompare_0 (copy)
    return l_Array_0.sort(l_Array_0.slice(v76), function(v78, v79) --[[ Line: 257 ]]
        -- upvalues: v77 (copy), l_naturalCompare_0 (ref)
        local v80 = v77(v78);
        local v81 = v77(v79);
        return l_naturalCompare_0(v80, v81);
    end);
end;
return {
    lexicographicSortSchema = v66
};