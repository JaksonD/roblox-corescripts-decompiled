local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v4 = {};
local l_GraphQLObjectType_0 = require(l_Parent_0.GraphQL).GraphQLObjectType;
local l_MapperKind_0 = require(script.Parent.Interfaces).MapperKind;
local v7 = require(script.Parent.mapSchema);
local l_mapSchema_0 = v7.mapSchema;
local l_correctASTNodes_0 = v7.correctASTNodes;
local l_addTypes_0 = require(script.Parent.addTypes).addTypes;
local l_Map_0 = v1.Map;
v4.appendObjectFields = function(v12, v13, v14) --[[ Line: 41 ]] --[[ Name: appendObjectFields ]]
    -- upvalues: l_addTypes_0 (copy), l_GraphQLObjectType_0 (copy), l_mapSchema_0 (copy), l_MapperKind_0 (copy), l_Map_0 (copy), l_correctASTNodes_0 (copy), l_Object_0 (copy)
    if v12:getType(v13) == nil then
        return l_addTypes_0(v12, {
            l_GraphQLObjectType_0.new({
                name = v13, 
                fields = v14
            })
        });
    else
        return l_mapSchema_0(v12, {
            [l_MapperKind_0.OBJECT_TYPE] = function(v15) --[[ Line: 54 ]]
                -- upvalues: v13 (copy), l_Map_0 (ref), v14 (copy), l_correctASTNodes_0 (ref), l_GraphQLObjectType_0 (ref), l_Object_0 (ref)
                if v15.name == v13 then
                    local v16 = v15:toConfig();
                    local l_fields_0 = v16.fields;
                    local v18 = l_Map_0.new();
                    for _, v20 in l_fields_0 do
                        local v21 = v20[1];
                        v18:set(v21, l_fields_0:get(v21));
                    end;
                    for _, v23 in v14 do
                        local v24 = v23[1];
                        v18:set(v24, v14:get(v24));
                    end;
                    return (l_correctASTNodes_0(l_GraphQLObjectType_0.new(l_Object_0.assign({}, v16, {
                        fields = v18
                    }))));
                else
                    return nil;
                end;
            end
        });
    end;
end;
v4.removeObjectFields = function(v25, v26, v27) --[[ Line: 100 ]] --[[ Name: removeObjectFields ]]
    -- upvalues: l_Map_0 (copy), l_mapSchema_0 (copy), l_MapperKind_0 (copy), l_Boolean_0 (copy), l_correctASTNodes_0 (copy), l_GraphQLObjectType_0 (copy), l_Object_0 (copy)
    local v28 = l_Map_0.new();
    return {
        l_mapSchema_0(v25, {
            [l_MapperKind_0.OBJECT_TYPE] = function(v29) --[[ Line: 112 ]]
                -- upvalues: v26 (copy), l_Map_0 (ref), l_Boolean_0 (ref), v27 (copy), v28 (copy), l_correctASTNodes_0 (ref), l_GraphQLObjectType_0 (ref), l_Object_0 (ref)
                if v29.name == v26 then
                    local v30 = v29:toConfig();
                    local l_fields_1 = v30.fields;
                    local v32 = l_Map_0.new();
                    for _, v34 in l_fields_1 do
                        local v35 = table.unpack(v34);
                        local v36 = l_fields_1:get(v35);
                        if l_Boolean_0.toJSBoolean(v27(v35, v36)) then
                            v28:set(v35, v36);
                        else
                            v32:set(v35, v36);
                        end;
                    end;
                    return (l_correctASTNodes_0(l_GraphQLObjectType_0.new(l_Object_0.assign({}, v30, {
                        fields = v32
                    }))));
                else
                    return nil;
                end;
            end
        }), 
        v28
    };
end;
v4.selectObjectFields = function(v37, v38, v39) --[[ Line: 160 ]] --[[ Name: selectObjectFields ]]
    -- upvalues: l_Map_0 (copy), l_mapSchema_0 (copy), l_MapperKind_0 (copy), l_Boolean_0 (copy)
    local v40 = l_Map_0.new();
    l_mapSchema_0(v37, {
        [tostring(l_MapperKind_0.OBJECT_TYPE)] = function(v41) --[[ Line: 170 ]]
            -- upvalues: v38 (copy), l_Boolean_0 (ref), v39 (copy), v40 (copy)
            if v41.name == v38 then
                local l_fields_2 = v41:toConfig().fields;
                for _, v44 in l_fields_2 do
                    local v45 = v44[1];
                    local v46 = l_fields_2:get(v45);
                    if l_Boolean_0.toJSBoolean(v39(v45, v46)) then
                        v40:set(v45, v46);
                    end;
                end;
            end;
            return nil;
        end
    });
    return v40;
end;
v4.modifyObjectFields = function(v47, v48, v49, v50) --[[ Line: 200 ]] --[[ Name: modifyObjectFields ]]
    -- upvalues: l_Map_0 (copy), l_mapSchema_0 (copy), l_MapperKind_0 (copy), l_Boolean_0 (copy), l_correctASTNodes_0 (copy), l_GraphQLObjectType_0 (copy), l_Object_0 (copy)
    local v51 = l_Map_0.new();
    return {
        l_mapSchema_0(v47, {
            [l_MapperKind_0.OBJECT_TYPE] = function(v52) --[[ Line: 213 ]]
                -- upvalues: v48 (copy), l_Map_0 (ref), l_Boolean_0 (ref), v49 (copy), v51 (copy), v50 (copy), l_correctASTNodes_0 (ref), l_GraphQLObjectType_0 (ref), l_Object_0 (ref)
                if v52.name == v48 then
                    local v53 = v52:toConfig();
                    local l_fields_3 = v53.fields;
                    local v55 = l_Map_0.new();
                    for _, v57 in l_fields_3 do
                        local v58 = v57[1];
                        local v59 = l_fields_3:get(v58);
                        if l_Boolean_0.toJSBoolean(v49(v58, v59)) then
                            v51:set(v58, v59);
                        else
                            v55:set(v58, v59);
                        end;
                    end;
                    for _, v61 in v50 do
                        local v62 = v61[1];
                        v55:set(v62, (v50:get(v62)));
                    end;
                    return (l_correctASTNodes_0(l_GraphQLObjectType_0.new(l_Object_0.assign({}, v53, {
                        fields = v55
                    }))));
                else
                    return nil;
                end;
            end
        }), 
        v51
    };
end;
return v4;