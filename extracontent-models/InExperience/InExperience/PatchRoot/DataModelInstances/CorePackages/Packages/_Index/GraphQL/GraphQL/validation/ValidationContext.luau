local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Map_0 = v2.Map;
local l_jsutils_0 = l_Parent_0.jsutils;
local _ = require(l_jsutils_0.ObjMap);
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_visit_0 = require(l_language_0.visitor).visit;
local _ = require(l_language_0.ast);
local _ = require(l_Parent_0.error.GraphQLError);
local v12 = require(l_Parent_0.utilities.TypeInfo);
local l_TypeInfo_0 = v12.TypeInfo;
local l_visitWithTypeInfo_0 = v12.visitWithTypeInfo;
local _ = require(l_Parent_0.type.schema);
local _ = require(l_Parent_0.type.directives);
local _ = require(l_Parent_0.type.definition);
local v18 = {};
local v19 = {
    __index = v18
};
v18.new = function(v20, v21) --[[ Line: 100 ]] --[[ Name: new ]]
    -- upvalues: v19 (copy)
    return (setmetatable({
        _ast = v20, 
        _fragments = nil, 
        _fragmentSpreads = {}, 
        _recursivelyReferencedFragments = {}, 
        _onError = v21
    }, v19));
end;
v18.reportError = function(v22, v23) --[[ Line: 115 ]] --[[ Name: reportError ]]
    v22._onError(v23);
end;
v18.getDocument = function(v24) --[[ Line: 119 ]] --[[ Name: getDocument ]]
    return v24._ast;
end;
v18.getFragment = function(v25, v26) --[[ Line: 123 ]] --[[ Name: getFragment ]]
    -- upvalues: l_Kind_0 (copy)
    local v27 = nil;
    if v25._fragments then
        v27 = v25._fragments;
    else
        v27 = {};
        for _, v29 in ipairs(v25:getDocument().definitions) do
            if v29.kind == l_Kind_0.FRAGMENT_DEFINITION then
                v27[v29.name.value] = v29;
            end;
        end;
        v25._fragments = v27;
    end;
    return v27[v26];
end;
v18.getFragmentSpreads = function(v30, v31) --[[ Line: 139 ]] --[[ Name: getFragmentSpreads ]]
    -- upvalues: l_Kind_0 (copy)
    local v32 = v30._fragmentSpreads[v31] or {};
    if not v30._fragmentSpreads[v31] then
        local v33 = {
            v31
        };
        while #v33 ~= 0 do
            local v34 = table.remove(v33);
            for _, v36 in ipairs(v34.selections) do
                if v36.kind == l_Kind_0.FRAGMENT_SPREAD then
                    table.insert(v32, v36);
                elseif v36.selectionSet then
                    table.insert(v33, v36.selectionSet);
                end;
            end;
        end;
        v30._fragmentSpreads[v31] = v32;
    end;
    return v32;
end;
v18.getRecursivelyReferencedFragments = function(v37, v38) --[[ Line: 165 ]] --[[ Name: getRecursivelyReferencedFragments ]]
    local v39 = v37._recursivelyReferencedFragments[v38] or {};
    if not v37._recursivelyReferencedFragments[v38] then
        local v40 = {};
        local v41 = {
            v38.selectionSet
        };
        while #v41 ~= 0 do
            local v42 = table.remove(v41);
            for _, v44 in ipairs(v37:getFragmentSpreads(v42)) do
                local l_value_0 = v44.name.value;
                if v40[l_value_0] ~= true then
                    v40[l_value_0] = true;
                    local v46 = v37:getFragment(l_value_0);
                    if v46 then
                        table.insert(v39, v46);
                        table.insert(v41, v46.selectionSet);
                    end;
                end;
            end;
        end;
        v37._recursivelyReferencedFragments[v38] = v39;
    end;
    return v39;
end;
local v47 = setmetatable({}, {
    __index = v18
});
local v48 = {
    __index = v47
};
v47.new = function(v49, v50, v51) --[[ Line: 208 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v48 (copy)
    local v52 = v18.new(v49, v51);
    v52._schema = v50;
    return (setmetatable(v52, v48));
end;
v47.getSchema = function(v53) --[[ Line: 218 ]] --[[ Name: getSchema ]]
    return v53._schema;
end;
local v54 = setmetatable({}, {
    __index = v18
});
local v55 = {
    __index = v54
};
v54.new = function(v56, v57, v58, v59) --[[ Line: 257 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), l_Map_0 (copy), v55 (copy)
    local v60 = v18.new(v57, v59);
    v60._schema = v56;
    v60._typeInfo = v58;
    v60._variableUsages = l_Map_0.new();
    v60._recursiveVariableUsages = l_Map_0.new();
    return (setmetatable(v60, v55));
end;
v54.getSchema = function(v61) --[[ Line: 274 ]] --[[ Name: getSchema ]]
    return v61._schema;
end;
v54.getVariableUsages = function(v62, v63) --[[ Line: 278 ]] --[[ Name: getVariableUsages ]]
    -- upvalues: l_TypeInfo_0 (copy), l_visit_0 (copy), l_visitWithTypeInfo_0 (copy)
    local v64 = v62._variableUsages[v63];
    if not v64 then
        local v65 = {};
        local v66 = l_TypeInfo_0.new(v62._schema);
        l_visit_0(v63, l_visitWithTypeInfo_0(v66, {
            VariableDefinition = function() --[[ Line: 286 ]] --[[ Name: VariableDefinition ]]
                return false;
            end, 
            Variable = function(_, v68) --[[ Line: 289 ]] --[[ Name: Variable ]]
                -- upvalues: v65 (copy), v66 (copy)
                table.insert(v65, {
                    node = v68, 
                    type = v66:getInputType(), 
                    defaultValue = v66:getDefaultValue()
                });
            end
        }));
        v64 = v65;
        v62._variableUsages[v63] = v64;
    end;
    return v64;
end;
v54.getRecursiveVariableUsages = function(v69, v70) --[[ Line: 305 ]] --[[ Name: getRecursiveVariableUsages ]]
    -- upvalues: l_Array_0 (copy)
    local v71 = v69._recursiveVariableUsages[v70];
    if not v71 then
        v71 = v69:getVariableUsages(v70);
        for _, v73 in ipairs(v69:getRecursivelyReferencedFragments(v70)) do
            v71 = l_Array_0.concat(v71, v69:getVariableUsages(v73));
        end;
        v69._recursiveVariableUsages[v70] = v71;
    end;
    return v71;
end;
v54.getType = function(v74) --[[ Line: 319 ]] --[[ Name: getType ]]
    return v74._typeInfo:getType();
end;
v54.getParentType = function(v75) --[[ Line: 323 ]] --[[ Name: getParentType ]]
    return v75._typeInfo:getParentType();
end;
v54.getInputType = function(v76) --[[ Line: 327 ]] --[[ Name: getInputType ]]
    return v76._typeInfo:getInputType();
end;
v54.getParentInputType = function(v77) --[[ Line: 331 ]] --[[ Name: getParentInputType ]]
    return v77._typeInfo:getParentInputType();
end;
v54.getFieldDef = function(v78) --[[ Line: 335 ]] --[[ Name: getFieldDef ]]
    return v78._typeInfo:getFieldDef();
end;
v54.getDirective = function(v79) --[[ Line: 339 ]] --[[ Name: getDirective ]]
    return v79._typeInfo:getDirective();
end;
v54.getArgument = function(v80) --[[ Line: 343 ]] --[[ Name: getArgument ]]
    return v80._typeInfo:getArgument();
end;
v54.getEnumValue = function(v81) --[[ Line: 347 ]] --[[ Name: getEnumValue ]]
    return v81._typeInfo:getEnumValue();
end;
return {
    ASTValidationContext = v18, 
    SDLValidationContext = v47, 
    ValidationContext = v54
};