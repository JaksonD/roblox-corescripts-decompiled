local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local v4 = require(l_luaUtils_0.null);
local l_language_0 = l_Parent_0.language;
local l_type_0 = l_Parent_0.type;
local v7 = require(l_language_0.visitor);
local v8 = require(l_language_0.ast);
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_isNode_0 = v8.isNode;
local l_getVisitFn_0 = v7.getVisitFn;
local _ = require(l_type_0.schema);
local _ = require(l_type_0.directives);
local v14 = require(l_type_0.definition);
local l_isObjectType_0 = v14.isObjectType;
local l_isInterfaceType_0 = v14.isInterfaceType;
local l_isEnumType_0 = v14.isEnumType;
local l_isInputObjectType_0 = v14.isInputObjectType;
local l_isListType_0 = v14.isListType;
local l_isCompositeType_0 = v14.isCompositeType;
local l_isInputType_0 = v14.isInputType;
local l_isOutputType_0 = v14.isOutputType;
local l_getNullableType_0 = v14.getNullableType;
local l_getNamedType_0 = v14.getNamedType;
local v25 = require(l_type_0.introspection);
local l_SchemaMetaFieldDef_0 = v25.SchemaMetaFieldDef;
local l_TypeMetaFieldDef_0 = v25.TypeMetaFieldDef;
local l_TypeNameMetaFieldDef_0 = v25.TypeNameMetaFieldDef;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
local function _(v30) --[[ Line: 79 ]] --[[ Name: unwrapNull ]]
    -- upvalues: v4 (copy)
    if v30 == v4 then
        return nil;
    else
        return v30;
    end;
end;
local v32 = {};
local v33 = {
    __index = v32
};
local v34 = nil;
v32.new = function(v35, v36, v37) --[[ Line: 132 ]] --[[ Name: new ]]
    -- upvalues: v33 (copy), v34 (ref), l_isInputType_0 (copy), l_isCompositeType_0 (copy), l_isOutputType_0 (copy)
    local v38 = setmetatable({}, v33);
    v38._schema = v35;
    v38._typeStack = {};
    v38._parentTypeStack = {};
    v38._inputTypeStack = {};
    v38._fieldDefStack = {};
    v38._defaultValueStack = {};
    v38._directive = nil;
    v38._argument = nil;
    v38._enumValue = nil;
    v38._getFieldDef = v36 or v34;
    if v37 then
        if l_isInputType_0(v37) then
            table.insert(v38._inputTypeStack, v37);
        end;
        if l_isCompositeType_0(v37) then
            table.insert(v38._parentTypeStack, v37);
        end;
        if l_isOutputType_0(v37) then
            table.insert(v38._typeStack, v37);
        end;
    end;
    return v38;
end;
v32.getType = function(v39) --[[ Line: 169 ]] --[[ Name: getType ]]
    -- upvalues: v4 (copy)
    if #v39._typeStack > 0 then
        local v40 = v39._typeStack[#v39._typeStack];
        if v40 == v4 then
            return nil;
        else
            return v40;
        end;
    else
        return nil;
    end;
end;
v32.getParentType = function(v41) --[[ Line: 176 ]] --[[ Name: getParentType ]]
    -- upvalues: v4 (copy)
    if #v41._parentTypeStack > 0 then
        local v42 = v41._parentTypeStack[#v41._parentTypeStack];
        if v42 == v4 then
            return nil;
        else
            return v42;
        end;
    else
        return nil;
    end;
end;
v32.getInputType = function(v43) --[[ Line: 183 ]] --[[ Name: getInputType ]]
    -- upvalues: v4 (copy)
    if #v43._inputTypeStack > 0 then
        local v44 = v43._inputTypeStack[#v43._inputTypeStack];
        if v44 == v4 then
            return nil;
        else
            return v44;
        end;
    else
        return nil;
    end;
end;
v32.getParentInputType = function(v45) --[[ Line: 190 ]] --[[ Name: getParentInputType ]]
    -- upvalues: v4 (copy)
    if #v45._inputTypeStack > 1 then
        local v46 = v45._inputTypeStack[#v45._inputTypeStack - 1];
        if v46 == v4 then
            return nil;
        else
            return v46;
        end;
    else
        return nil;
    end;
end;
v32.getFieldDef = function(v47) --[[ Line: 197 ]] --[[ Name: getFieldDef ]]
    -- upvalues: v4 (copy)
    if #v47._fieldDefStack > 0 then
        local v48 = v47._fieldDefStack[#v47._fieldDefStack];
        if v48 == v4 then
            return nil;
        else
            return v48;
        end;
    else
        return nil;
    end;
end;
v32.getDefaultValue = function(v49) --[[ Line: 204 ]] --[[ Name: getDefaultValue ]]
    -- upvalues: v4 (copy)
    if #v49._defaultValueStack > 0 then
        local v50 = v49._defaultValueStack[#v49._defaultValueStack];
        if v50 == v4 then
            return nil;
        else
            return v50;
        end;
    else
        return nil;
    end;
end;
v32.getDirective = function(v51) --[[ Line: 211 ]] --[[ Name: getDirective ]]
    return v51._directive;
end;
v32.getArgument = function(v52) --[[ Line: 215 ]] --[[ Name: getArgument ]]
    return v52._argument;
end;
v32.getEnumValue = function(v53) --[[ Line: 219 ]] --[[ Name: getEnumValue ]]
    return v53._enumValue;
end;
v32.enter = function(v54, v55) --[[ Line: 223 ]] --[[ Name: enter ]]
    -- upvalues: l_Kind_0 (copy), l_getNamedType_0 (copy), l_isCompositeType_0 (copy), v4 (copy), l_isOutputType_0 (copy), l_isObjectType_0 (copy), l_typeFromAST_0 (copy), l_isInputType_0 (copy), l_Array_0 (copy), l_getNullableType_0 (copy), l_isListType_0 (copy), l_isInputObjectType_0 (copy), l_isEnumType_0 (copy)
    local l__schema_0 = v54._schema;
    local l_kind_0 = v55.kind;
    if l_kind_0 == l_Kind_0.SELECTION_SET then
        local v58 = l_getNamedType_0(v54:getType());
        table.insert(v54._parentTypeStack, if l_isCompositeType_0(v58) then v58 else v4);
        return;
    elseif l_kind_0 == l_Kind_0.FIELD then
        local v59 = v54:getParentType();
        local v60 = nil;
        local v61 = nil;
        if v59 then
            v60 = v54._getFieldDef(l__schema_0, v59, v55);
            if v60 then
                v61 = v60.type;
            end;
        end;
        table.insert(v54._fieldDefStack, if v60 then v60 else v4);
        table.insert(v54._typeStack, if l_isOutputType_0(v61) then v61 else v4);
        return;
    elseif l_kind_0 == l_Kind_0.DIRECTIVE then
        v54._directive = l__schema_0:getDirective(v55.name.value);
        return;
    elseif l_kind_0 == l_Kind_0.OPERATION_DEFINITION then
        local v62 = nil;
        local l_operation_0 = v55.operation;
        if l_operation_0 == "query" then
            v62 = l__schema_0:getQueryType();
        elseif l_operation_0 == "mutation" then
            v62 = l__schema_0:getMutationType();
        elseif l_operation_0 == "subscription" then
            v62 = l__schema_0:getSubscriptionType();
        end;
        table.insert(v54._typeStack, if l_isObjectType_0(v62) then v62 else v4);
        return;
    elseif l_kind_0 == l_Kind_0.INLINE_FRAGMENT or l_kind_0 == l_Kind_0.FRAGMENT_DEFINITION then
        local l_typeCondition_0 = v55.typeCondition;
        local v65 = if l_typeCondition_0 then l_typeFromAST_0(l__schema_0, l_typeCondition_0) else l_getNamedType_0(v54:getType());
        table.insert(v54._typeStack, if l_isOutputType_0(v65) then v65 else v4);
        return;
    elseif l_kind_0 == l_Kind_0.VARIABLE_DEFINITION then
        local v66 = l_typeFromAST_0(l__schema_0, v55.type);
        table.insert(v54._inputTypeStack, if l_isInputType_0(v66) then v66 else v4);
        return;
    elseif l_kind_0 == l_Kind_0.ARGUMENT then
        local v67 = nil;
        local v68 = nil;
        local v69 = v54:getDirective() or v54:getFieldDef();
        if v69 then
            v67 = l_Array_0.find(v69.args, function(v70) --[[ Line: 297 ]]
                -- upvalues: v55 (copy)
                return v70.name == v55.name.value;
            end);
            if v67 then
                v68 = v67.type;
            end;
        end;
        v54._argument = v67;
        table.insert(v54._defaultValueStack, if v67 then v67.defaultValue else v4);
        table.insert(v54._inputTypeStack, if l_isInputType_0(v68) then v68 else v4);
        return;
    elseif l_kind_0 == l_Kind_0.LIST then
        local v71 = l_getNullableType_0(v54:getInputType());
        local v72 = if l_isListType_0(v71) then v71.ofType else v71;
        table.insert(v54._defaultValueStack, v4);
        table.insert(v54._inputTypeStack, if l_isInputType_0(v72) then v72 else v4);
        return;
    elseif l_kind_0 == l_Kind_0.OBJECT_FIELD then
        local v73 = l_getNamedType_0(v54:getInputType());
        local v74 = nil;
        local v75 = nil;
        if l_isInputObjectType_0(v73) then
            v75 = v73:getFields():get(v55.name.value);
            if v75 then
                v74 = v75.type;
            end;
        end;
        table.insert(v54._defaultValueStack, if v75 then v75.defaultValue else v4);
        table.insert(v54._inputTypeStack, if l_isInputType_0(v74) then v74 else v4);
        return;
    elseif l_kind_0 == l_Kind_0.ENUM then
        local v76 = l_getNamedType_0(v54:getInputType());
        local v77 = nil;
        if l_isEnumType_0(v76) then
            v77 = v76:getValue(v55.value);
        end;
        v54._enumValue = v77;
        return;
    else
        return;
    end;
end;
v32.leave = function(v78, v79) --[[ Line: 343 ]] --[[ Name: leave ]]
    -- upvalues: l_Kind_0 (copy)
    local l_kind_1 = v79.kind;
    if l_kind_1 == l_Kind_0.SELECTION_SET then
        table.remove(v78._parentTypeStack);
        return;
    elseif l_kind_1 == l_Kind_0.FIELD then
        table.remove(v78._fieldDefStack);
        table.remove(v78._typeStack);
        return;
    elseif l_kind_1 == l_Kind_0.DIRECTIVE then
        v78._directive = nil;
        return;
    elseif l_kind_1 == l_Kind_0.OPERATION_DEFINITION or l_kind_1 == l_Kind_0.INLINE_FRAGMENT or l_kind_1 == l_Kind_0.FRAGMENT_DEFINITION then
        table.remove(v78._typeStack);
        return;
    elseif l_kind_1 == l_Kind_0.VARIABLE_DEFINITION then
        table.remove(v78._inputTypeStack);
        return;
    elseif l_kind_1 == l_Kind_0.ARGUMENT then
        v78._argument = nil;
        table.remove(v78._defaultValueStack);
        table.remove(v78._inputTypeStack);
        return;
    elseif l_kind_1 == l_Kind_0.LIST or l_kind_1 == l_Kind_0.OBJECT_FIELD then
        table.remove(v78._defaultValueStack);
        table.remove(v78._inputTypeStack);
        return;
    else
        if l_kind_1 == l_Kind_0.ENUM then
            v78._enumValue = nil;
        end;
        return;
    end;
end;
v34 = function(v81, v82, v83) --[[ Line: 377 ]] --[[ Name: getFieldDef ]]
    -- upvalues: l_SchemaMetaFieldDef_0 (copy), l_TypeMetaFieldDef_0 (copy), l_TypeNameMetaFieldDef_0 (copy), l_isCompositeType_0 (copy), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy)
    local l_value_0 = v83.name.value;
    if l_value_0 == l_SchemaMetaFieldDef_0.name and v81:getQueryType() == v82 then
        return l_SchemaMetaFieldDef_0;
    elseif l_value_0 == l_TypeMetaFieldDef_0.name and v81:getQueryType() == v82 then
        return l_TypeMetaFieldDef_0;
    elseif l_value_0 == l_TypeNameMetaFieldDef_0.name and l_isCompositeType_0(v82) then
        return l_TypeNameMetaFieldDef_0;
    elseif l_isObjectType_0(v82) or l_isInterfaceType_0(v82) then
        return v82:getFields():get(l_value_0);
    else
        return nil;
    end;
end;
return {
    TypeInfo = v32, 
    visitWithTypeInfo = function(v85, v86) --[[ Line: 404 ]] --[[ Name: visitWithTypeInfo ]]
        -- upvalues: l_getVisitFn_0 (copy), l_isNode_0 (copy)
        return {
            enter = function(_, v88, ...) --[[ Line: 409 ]] --[[ Name: enter ]]
                -- upvalues: v85 (copy), l_getVisitFn_0 (ref), v86 (copy), l_isNode_0 (ref)
                v85:enter(v88);
                local v89 = l_getVisitFn_0(v86, v88.kind, false);
                if v89 then
                    local v90 = v89(v86, v88, ...);
                    if v90 ~= nil then
                        v85:leave(v88);
                        if l_isNode_0(v90) then
                            v85:enter(v90);
                        end;
                    end;
                    return v90;
                else
                    return nil;
                end;
            end, 
            leave = function(_, v92, ...) --[[ Line: 428 ]] --[[ Name: leave ]]
                -- upvalues: l_getVisitFn_0 (ref), v86 (copy), v85 (copy)
                local v93 = l_getVisitFn_0(v86, v92.kind, true);
                local v94 = nil;
                if v93 then
                    v94 = v93(v86, v92, ...);
                end;
                v85:leave(v92);
                return v94;
            end
        };
    end
};