local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local _ = require(l_Parent_0.language.ast);
local l_isNode_0 = require(script.Parent.ast).isNode;
local v7 = {
    Name = {}, 
    Document = {
        "definitions"
    }, 
    OperationDefinition = {
        "name", 
        "variableDefinitions", 
        "directives", 
        "selectionSet"
    }, 
    VariableDefinition = {
        "variable", 
        "type", 
        "defaultValue", 
        "directives"
    }, 
    Variable = {
        "name"
    }, 
    SelectionSet = {
        "selections"
    }, 
    Field = {
        "alias", 
        "name", 
        "arguments", 
        "directives", 
        "selectionSet"
    }, 
    Argument = {
        "name", 
        "value"
    }, 
    FragmentSpread = {
        "name", 
        "directives"
    }, 
    InlineFragment = {
        "typeCondition", 
        "directives", 
        "selectionSet"
    }, 
    FragmentDefinition = {
        "name", 
        "variableDefinitions", 
        "typeCondition", 
        "directives", 
        "selectionSet"
    }, 
    IntValue = {}, 
    FloatValue = {}, 
    StringValue = {}, 
    BooleanValue = {}, 
    NullValue = {}, 
    EnumValue = {}, 
    ListValue = {
        "values"
    }, 
    ObjectValue = {
        "fields"
    }, 
    ObjectField = {
        "name", 
        "value"
    }, 
    Directive = {
        "name", 
        "arguments"
    }, 
    NamedType = {
        "name"
    }, 
    ListType = {
        "type"
    }, 
    NonNullType = {
        "type"
    }, 
    SchemaDefinition = {
        "description", 
        "directives", 
        "operationTypes"
    }, 
    OperationTypeDefinition = {
        "type"
    }, 
    ScalarTypeDefinition = {
        "description", 
        "name", 
        "directives"
    }, 
    ObjectTypeDefinition = {
        "description", 
        "name", 
        "interfaces", 
        "directives", 
        "fields"
    }, 
    FieldDefinition = {
        "description", 
        "name", 
        "arguments", 
        "type", 
        "directives"
    }, 
    InputValueDefinition = {
        "description", 
        "name", 
        "type", 
        "defaultValue", 
        "directives"
    }, 
    InterfaceTypeDefinition = {
        "description", 
        "name", 
        "interfaces", 
        "directives", 
        "fields"
    }, 
    UnionTypeDefinition = {
        "description", 
        "name", 
        "directives", 
        "types"
    }, 
    EnumTypeDefinition = {
        "description", 
        "name", 
        "directives", 
        "values"
    }, 
    EnumValueDefinition = {
        "description", 
        "name", 
        "directives"
    }, 
    InputObjectTypeDefinition = {
        "description", 
        "name", 
        "directives", 
        "fields"
    }, 
    DirectiveDefinition = {
        "description", 
        "name", 
        "arguments", 
        "locations"
    }, 
    SchemaExtension = {
        "directives", 
        "operationTypes"
    }, 
    ScalarTypeExtension = {
        "name", 
        "directives"
    }, 
    ObjectTypeExtension = {
        "name", 
        "interfaces", 
        "directives", 
        "fields"
    }, 
    InterfaceTypeExtension = {
        "name", 
        "interfaces", 
        "directives", 
        "fields"
    }, 
    UnionTypeExtension = {
        "name", 
        "directives", 
        "types"
    }, 
    EnumTypeExtension = {
        "name", 
        "directives", 
        "values"
    }, 
    InputObjectTypeExtension = {
        "name", 
        "directives", 
        "fields"
    }
};
local v8 = l_Object_0.freeze({});
local v9 = require(l_Parent_0.luaUtils.null);
local v10 = nil;
local v11 = nil;
local function v39(v12, v13, v14) --[[ Line: 249 ]] --[[ Name: visit ]]
    -- upvalues: v7 (copy), l_Array_0 (copy), v9 (copy), l_isNode_0 (copy), l_inspect_0 (copy), v11 (ref), v8 (copy)
    local v15 = false;
    local v16 = false;
    local v17 = false;
    local v18 = false;
    local v19 = v14 or v7;
    local v20 = nil;
    local v21 = l_Array_0.isArray(v12);
    local v22 = {
        v12
    };
    local v23 = 0;
    local v24 = {};
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = {};
    local v29 = {};
    local l_v12_0 = v12;
    local v31, v32, v33;
    repeat
        repeat
            repeat
                repeat
                    repeat
                        if not v18 then
                            if not v18 then
                                if not v18 then
                                    if not v18 then
                                        v16 = false;
                                        v23 = v23 + 1;
                                        v31 = v23 == #v22 + 1;
                                        v32 = v31 and #v24 ~= 0;
                                        if v31 then
                                            v26 = if #v29 == 0 then nil else v28[#v28];
                                            v25 = v27;
                                            v27 = table.remove(v29);
                                            if v32 then
                                                if v21 then
                                                    v25 = l_Array_0.slice(v25);
                                                else
                                                    v33 = {};
                                                    for v34 in pairs(v25) do
                                                        v33[v34] = v25[v34];
                                                    end;
                                                    v25 = v33;
                                                end;
                                                v33 = 0;
                                                for v35 = 1, #v24 do
                                                    local v36 = v24[v35][1];
                                                    local v37 = v24[v35][2];
                                                    if v21 then
                                                        v36 = v36 - v33;
                                                    end;
                                                    if v21 and v37 == nil then
                                                        l_Array_0.splice(v25, v36, 1);
                                                        v33 = v33 + 1;
                                                    else
                                                        v25[v36] = v37;
                                                    end;
                                                end;
                                            end;
                                            v23 = v20.index;
                                            v22 = v20.keys;
                                            v24 = v20.edits;
                                            v21 = v20.inArray;
                                            v20 = v20.prev;
                                            v15 = true;
                                        else
                                            v26 = if v27 then if v21 then v23 else v22[v23] else nil;
                                            v25 = if v27 then v27[v26] else l_v12_0;
                                            if v25 ~= nil and v25 ~= v9 then
                                                if v27 then
                                                    table.insert(v28, v26);
                                                    v15 = true;
                                                else
                                                    v15 = true;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        if v18 or v18 or v18 or v18 or not v15 then
                            if v18 or v18 or v18 or v18 or not v15 then
                                if v18 or v18 or v18 or v18 or not v15 then
                                    v18 = false;
                                    if v20 ~= nil then
                                        v16 = true;
                                    else
                                        v17 = true;
                                    end;
                                end;
                            end;
                        end;
                        if v17 then
                            break;
                        end;
                    until not v16;
                    if not v17 then
                        v15 = false;
                        v33 = nil;
                        if not l_Array_0.isArray(v25) then
                            if not l_isNode_0(v25) then
                                error("Invalid AST Node: " .. l_inspect_0(v25) .. ".");
                            end;
                            local v38 = v11(v13, v25.kind, v31);
                            if v38 then
                                v33 = v38(v13, v25, v26, v27, v28, v29);
                                if v33 ~= v8 then
                                    if v33 == false then
                                        if not v31 then
                                            table.remove(v28);
                                            v18 = true;
                                        end;
                                    elseif v33 ~= nil or v33 == v9 then
                                        if v33 == v9 then
                                            v33 = nil;
                                        end;
                                        table.insert(v24, {
                                            v26, 
                                            v33
                                        });
                                        if not v31 then
                                            if l_isNode_0(v33) then
                                                v25 = v33;
                                            else
                                                table.remove(v28);
                                                v18 = true;
                                            end;
                                        end;
                                    end;
                                else
                                    v17 = true;
                                end;
                            end;
                        end;
                        if not v17 then
                            if not v18 then
                                if not v18 then
                                    if v33 == nil and v32 then
                                        table.insert(v24, {
                                            v26, 
                                            v25
                                        });
                                    end;
                                    if v31 then
                                        table.remove(v28);
                                        v18 = true;
                                    else
                                        v20 = {
                                            inArray = v21, 
                                            index = v23, 
                                            keys = v22, 
                                            edits = v24, 
                                            prev = v20
                                        };
                                        v21 = l_Array_0.isArray(v25);
                                        v22 = if v21 then v25 else v19[v25.kind] or {};
                                        v23 = 0;
                                        v24 = {};
                                        if v27 then
                                            table.insert(v29, v27);
                                        end;
                                        v27 = v25;
                                        v18 = true;
                                    end;
                                end;
                            end;
                        end;
                    end;
                until not v18;
            until not v18;
            if v17 then
                break;
            end;
        until not v18;
        if v17 then
            break;
        end;
    until not v18;
    v17 = false;
    if #v24 ~= 0 then
        l_v12_0 = v24[#v24][2];
    end;
    return l_v12_0;
end;
v10 = function(v40) --[[ Line: 412 ]] --[[ Name: visitInParallel ]]
    -- upvalues: v11 (ref), v8 (copy)
    local v41 = {};
    return {
        enter = function(_, v43, ...) --[[ Line: 417 ]] --[[ Name: enter ]]
            -- upvalues: v40 (copy), v41 (copy), v11 (ref), v8 (ref)
            for v44 = 1, #v40 do
                if v41[v44] == nil then
                    local v45 = v11(v40[v44], v43.kind, false);
                    if v45 then
                        local v46 = v45(v40[v44], v43, ...);
                        if v46 == false then
                            v41[v44] = v43;
                        elseif v46 == v8 then
                            v41[v44] = v8;
                        elseif v46 ~= nil then
                            return v46;
                        end;
                    end;
                end;
            end;
        end, 
        leave = function(_, ...) --[[ Line: 439 ]] --[[ Name: leave ]]
            -- upvalues: v40 (copy), v41 (copy), v11 (ref), v8 (ref)
            local v48 = ...;
            for v49 = 1, #v40 do
                if v41[v49] == nil then
                    local v50 = v11(v40[v49], v48.kind, true);
                    if v50 then
                        local v51 = v50(v40[v49], ...);
                        if v51 == v8 then
                            v41[v49] = v8;
                        elseif v51 ~= nil and v51 ~= false then
                            return v51;
                        end;
                    end;
                elseif v41[v49] == v48 then
                    v41[v49] = nil;
                end;
            end;
        end
    };
end;
v11 = function(v52, v53, v54) --[[ Line: 465 ]] --[[ Name: getVisitFn ]]
    local v55 = v52[v53];
    if v55 then
        if not v54 and type(v55) == "function" then
            return v55;
        else
            local v56 = nil;
            if typeof(v55) ~= "function" then
                v56 = if v54 then v55.leave else v55.enter;
            end;
            if type(v56) == "function" then
                return v56;
            end;
        end;
    else
        local v57 = nil;
        v57 = if v54 then v52.leave else v52.enter;
        if v57 then
            if type(v57) == "function" then
                return v57;
            else
                local v58 = v57[v53];
                if type(v58) == "function" then
                    return v58;
                end;
            end;
        end;
    end;
end;
return {
    BREAK = v8, 
    REMOVE = v9, 
    visit = v39, 
    visitInParallel = v10, 
    getVisitFn = v11, 
    QueryDocumentKeys = v7
};