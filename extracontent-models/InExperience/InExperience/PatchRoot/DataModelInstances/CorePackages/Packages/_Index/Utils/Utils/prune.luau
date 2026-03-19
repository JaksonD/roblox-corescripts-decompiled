local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local v7 = {};
local v8 = require(l_Parent_0.GraphQL);
local l_getNamedType_0 = v8.getNamedType;
local l_isObjectType_0 = v8.isObjectType;
local l_isInterfaceType_0 = v8.isInterfaceType;
local l_isUnionType_0 = v8.isUnionType;
local l_isInputObjectType_0 = v8.isInputObjectType;
local l_isSpecifiedScalarType_0 = v8.isSpecifiedScalarType;
local l_isScalarType_0 = v8.isScalarType;
local l_isEnumType_0 = v8.isEnumType;
local _ = require(script.Parent.types);
local l_mapSchema_0 = require(script.Parent.mapSchema).mapSchema;
local l_MapperKind_0 = require(script.Parent.Interfaces).MapperKind;
local l_getRootTypes_0 = require(script.Parent.rootTypes).getRootTypes;
local l_getImplementingTypes_0 = require(script.Parent["get-implementing-types"]).getImplementingTypes;
local l_String_0 = v1.String;
local v23 = nil;
local v24 = nil;
local v25 = nil;
v7.pruneSchema = function(v26, v27) --[[ Line: 69 ]] --[[ Name: pruneSchema ]]
    -- upvalues: v23 (ref), l_String_0 (copy), v24 (ref), l_mapSchema_0 (copy), l_MapperKind_0 (copy), l_Boolean_0 (copy), l_isSpecifiedScalarType_0 (copy), l_isUnionType_0 (copy), l_isInputObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isObjectType_0 (copy), l_isScalarType_0 (copy), l_Object_0 (copy)
    local v28 = if v27 ~= nil then v27 else {};
    local l_skipEmptyCompositeTypePruning_0 = v28.skipEmptyCompositeTypePruning;
    local l_skipEmptyUnionPruning_0 = v28.skipEmptyUnionPruning;
    local l_skipPruning_0 = v28.skipPruning;
    local l_skipUnimplementedInterfacesPruning_0 = v28.skipUnimplementedInterfacesPruning;
    local l_skipUnusedTypesPruning_0 = v28.skipUnusedTypesPruning;
    local v34 = {};
    local l_v26_0 = v26;
    do
        while true do
            local v36 = v23(l_v26_0);
            if l_skipPruning_0 then
                local v37 = {};
                for _, v39 in l_v26_0:getTypeMap() do
                    local v40 = v39[1];
                    if not l_String_0.startsWith(v40, "__") then
                        local v41 = l_v26_0:getType(v40);
                        if v41 and l_skipPruning_0(v41) then
                            table.insert(v37, v40);
                        end;
                    end;
                end;
                v36 = v24(v37, l_v26_0, v36);
            end;
            v34 = {};
            l_v26_0 = l_mapSchema_0(l_v26_0, {
                [l_MapperKind_0.TYPE] = function(v42) --[[ Line: 111 ]]
                    -- upvalues: l_Boolean_0 (ref), v36 (ref), l_isSpecifiedScalarType_0 (ref), l_isUnionType_0 (ref), l_isInputObjectType_0 (ref), l_isInterfaceType_0 (ref), l_isObjectType_0 (ref), l_isScalarType_0 (ref), l_skipUnusedTypesPruning_0 (copy), l_skipEmptyUnionPruning_0 (copy), l_skipEmptyCompositeTypePruning_0 (copy), l_skipUnimplementedInterfacesPruning_0 (copy), v34 (ref), l_Object_0 (ref)
                    if not l_Boolean_0.toJSBoolean(v36:has(v42.name)) and not l_Boolean_0.toJSBoolean(l_isSpecifiedScalarType_0(v42)) then
                        if l_isUnionType_0(v42) or l_isInputObjectType_0(v42) or l_isInterfaceType_0(v42) or l_isObjectType_0(v42) or l_isScalarType_0(v42) then
                            if l_Boolean_0.toJSBoolean(l_skipUnusedTypesPruning_0) then
                                return v42;
                            elseif l_isUnionType_0(v42) and l_skipEmptyUnionPruning_0 and not l_Boolean_0.toJSBoolean(#v42:getTypes()) then
                                return v42;
                            elseif (l_isInputObjectType_0(v42) or l_isInterfaceType_0(v42) or l_isObjectType_0(v42)) and l_skipEmptyCompositeTypePruning_0 and not l_Boolean_0.toJSBoolean(#v42:getFields():keys()) then
                                return v42;
                            elseif l_isInterfaceType_0(v42) and l_skipUnimplementedInterfacesPruning_0 then
                                return v42;
                            end;
                        end;
                        table.insert(v34, v42.name);
                        v36:delete(v42.name);
                        return l_Object_0.None;
                    else
                        return v42;
                    end;
                end
            });
            if #v34 ~= 0 then
                --[[ close >= 10 ]]
            else
                break;
            end;
        end;
    end;
    return l_v26_0;
end;
v23 = function(v43) --[[ Line: 216 ]] --[[ Name: visitSchema ]]
    -- upvalues: l_getRootTypes_0 (copy), v24 (ref)
    local v44 = {};
    for _, v46 in l_getRootTypes_0(v43) do
        table.insert(v44, v46.name);
    end;
    return v24(v44, v43);
end;
v24 = function(v47, v48, v49) --[[ Line: 227 ]] --[[ Name: visitQueue ]]
    -- upvalues: l_Set_0 (copy), l_Map_0 (copy), l_Boolean_0 (copy), l_isUnionType_0 (copy), l_Array_0 (copy), l_isInterfaceType_0 (copy), l_getImplementingTypes_0 (copy), l_isEnumType_0 (copy), v25 (ref), l_isObjectType_0 (copy), l_getNamedType_0 (copy)
    local v50 = if v49 ~= nil then v49 else l_Set_0.new();
    local v51 = l_Map_0.new();
    while #v47 ~= 0 do
        local v52 = table.remove(v47);
        if not v50:has(v52) or v51[v52] == true then
            local v53 = v48:getType(v52);
            if l_Boolean_0.toJSBoolean(v53) and v53 then
                if l_Boolean_0.toJSBoolean(l_isUnionType_0(v53)) then
                    v47 = l_Array_0.concat(v47, l_Array_0.map(v53:getTypes(), function(v54) --[[ Line: 262 ]]
                        return v54.name;
                    end));
                end;
                if l_isInterfaceType_0(v53) and v51[v52] == true then
                    v47 = l_Array_0.concat(v47, l_getImplementingTypes_0(v53.name, v48));
                    v51[tostring(v52)] = false;
                end;
                if l_Boolean_0.toJSBoolean(l_isEnumType_0(v53)) then
                    v47 = l_Array_0.concat(v47, l_Array_0.flatMap(v53:getValues(), function(v55) --[[ Line: 301 ]]
                        -- upvalues: v25 (ref), v48 (copy)
                        if v55.astNode then
                            return v25(v48, v55.astNode);
                        else
                            return {};
                        end;
                    end));
                end;
                if v53.getInterfaces ~= nil then
                    v47 = l_Array_0.concat(v47, l_Array_0.map(v53:getInterfaces(), function(v56) --[[ Line: 322 ]]
                        return v56.name;
                    end));
                end;
                if v53.getFields ~= nil then
                    local v57 = v53:getFields():entries();
                    if #v57 ~= 0 then
                        for _, v59 in v57 do
                            local v60 = v59[2];
                            if l_Boolean_0.toJSBoolean(l_isObjectType_0(v53)) then
                                v47 = l_Array_0.concat(v47, l_Array_0.flatMap(v60.args, function(v61) --[[ Line: 368 ]]
                                    -- upvalues: l_getNamedType_0 (ref), l_Array_0 (ref), v25 (ref), v48 (copy)
                                    local v62 = {
                                        l_getNamedType_0(v61.type).name
                                    };
                                    if v61.astNode then
                                        v62 = l_Array_0.concat(v62, v25(v48, v61.astNode));
                                    end;
                                    return v62;
                                end));
                            end;
                            local v63 = l_getNamedType_0(v60.type);
                            table.insert(v47, v63.name);
                            if l_Boolean_0.toJSBoolean(v60.astNode) then
                                v47 = l_Array_0.concat(v47, v25(v48, v60.astNode));
                            end;
                            if l_isInterfaceType_0(v63) and not v51:has(v63.name) then
                                v51[tostring(v63.name)] = true;
                            end;
                        end;
                    else
                        continue;
                    end;
                end;
                if l_Boolean_0.toJSBoolean(v53.astNode) then
                    v47 = l_Array_0.concat(v47, v25(v48, v53.astNode));
                end;
                v50:add(v52);
            end;
        end;
    end;
    return v50;
end;
v25 = function(v64, v65) --[[ Line: 421 ]] --[[ Name: getDirectivesArgumentsTypeNames ]]
    -- upvalues: l_Array_0 (copy), l_getNamedType_0 (copy)
    return l_Array_0.flatMap(v65.directives or {}, function(v66) --[[ Line: 432 ]]
        -- upvalues: v64 (copy), l_Array_0 (ref), l_getNamedType_0 (ref)
        local v67 = v64:getDirective(v66.name.value);
        local v68 = if typeof(v67) == "table" then v67.args else nil;
        local v70 = if v68 ~= nil then l_Array_0.map(v68, function(v69) --[[ Line: 436 ]]
            -- upvalues: l_getNamedType_0 (ref)
            return l_getNamedType_0(v69.type).name;
        end) else nil;
        if v70 ~= nil then
            return v70;
        else
            return {};
        end;
    end);
end;
return v7;