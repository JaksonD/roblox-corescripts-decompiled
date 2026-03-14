local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local l_isNotNillish_0 = require(l_Parent_0.luaUtils.isNillish).isNotNillish;
local l_inspect_0 = require(script.Parent.Parent.jsutils.inspect).inspect;
local l_GraphQLError_0 = require(script.Parent.Parent.error.GraphQLError).GraphQLError;
local l_locatedError_0 = require(script.Parent.Parent.error).locatedError;
local _ = require(l_Parent_0.language.ast);
local l_isValidNameError_0 = require(l_Parent_0.utilities.assertValidName).isValidNameError;
local v12 = require(script.Parent.Parent.utilities.typeComparators);
local l_isEqualType_0 = v12.isEqualType;
local l_isTypeSubTypeOf_0 = v12.isTypeSubTypeOf;
local l_assertSchema_0 = require(script.Parent.schema).assertSchema;
local v16 = require(script.Parent.definition);
local l_isIntrospectionType_0 = require(script.Parent.introspection).isIntrospectionType;
local v18 = require(script.Parent.directives);
local l_isDirective_0 = v18.isDirective;
local l_GraphQLDeprecatedDirective_0 = v18.GraphQLDeprecatedDirective;
local l_isObjectType_0 = v16.isObjectType;
local l_isInterfaceType_0 = v16.isInterfaceType;
local l_isUnionType_0 = v16.isUnionType;
local l_isEnumType_0 = v16.isEnumType;
local l_isInputObjectType_0 = v16.isInputObjectType;
local l_isNamedType_0 = v16.isNamedType;
local l_isNonNullType_0 = v16.isNonNullType;
local l_isInputType_0 = v16.isInputType;
local l_isOutputType_0 = v16.isOutputType;
local l_isRequiredArgument_0 = v16.isRequiredArgument;
local l_isRequiredInputField_0 = v16.isRequiredInputField;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = nil;
local v47 = nil;
local function v51(v48) --[[ Line: 78 ]]
    -- upvalues: l_assertSchema_0 (copy), v32 (ref), v33 (ref), v34 (ref), v45 (ref)
    l_assertSchema_0(v48);
    if v48.__validationErrors ~= nil then
        return v48.__validationErrors;
    else
        local v49 = v32.new(v48);
        v33(v49);
        v34(v49);
        v45(v49);
        local v50 = v49:getErrors();
        v48.__validationErrors = v50;
        return v50;
    end;
end;
local function v55(v52) --[[ Line: 106 ]]
    -- upvalues: v51 (copy), l_Error_0 (copy), l_Array_0 (copy)
    local v53 = v51(v52);
    if #v53 ~= 0 then
        error(l_Error_0.new(l_Array_0.join(l_Array_0.map(v53, function(v54) --[[ Line: 111 ]]
            return v54.message;
        end), "\n\n")));
    end;
end;
v32 = {};
v32.__index = v32;
v32.new = function(v56) --[[ Line: 132 ]] --[[ Name: new ]]
    -- upvalues: v32 (ref)
    local v57 = setmetatable({}, v32);
    v57._errors = {};
    v57.schema = v56;
    return v57;
end;
v32.reportError = function(v58, v59, v60) --[[ Line: 141 ]] --[[ Name: reportError ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), l_GraphQLError_0 (copy)
    local v61 = if l_Array_0.isArray(v60) then l_Array_0.filter(v60, l_Boolean_0.toJSBoolean) else v60;
    v58:addError(l_GraphQLError_0.new(v59, v61));
end;
v32.addError = function(v62, v63) --[[ Line: 150 ]] --[[ Name: addError ]]
    table.insert(v62._errors, v63);
end;
v32.getErrors = function(v64) --[[ Line: 154 ]] --[[ Name: getErrors ]]
    return v64._errors;
end;
v33 = function(v65) --[[ Line: 158 ]] --[[ Name: validateRootTypes ]]
    -- upvalues: l_isNotNillish_0 (copy), l_isObjectType_0 (copy), v35 (ref), l_inspect_0 (copy)
    local l_schema_0 = v65.schema;
    local v67 = l_schema_0:getQueryType();
    if not l_isNotNillish_0(v67) then
        v65:reportError("Query root type must be provided.", l_schema_0.astNode);
    elseif not l_isObjectType_0(v67) then
        local v68 = v35(l_schema_0, "query");
        v65:reportError(("Query root type must be Object type, it cannot be %s."):format(l_inspect_0(v67)), v68 or v67.astNode);
    end;
    local v69 = l_schema_0:getMutationType();
    if l_isNotNillish_0(v69) and not l_isObjectType_0(v69) then
        local v70 = v35(l_schema_0, "mutation");
        v65:reportError("Mutation root type must be Object type if provided, it cannot be " .. ("%s."):format(l_inspect_0(v69)), v70 or v69.astNode);
    end;
    local v71 = l_schema_0:getSubscriptionType();
    if l_isNotNillish_0(v71) and not l_isObjectType_0(v71) then
        local v72 = v35(l_schema_0, "subscription");
        v65:reportError("Subscription root type must be Object type if provided, it cannot be " .. ("%s."):format(l_inspect_0(v71)), v72 or v71.astNode);
    end;
end;
v35 = function(v73, v74) --[[ Line: 197 ]] --[[ Name: getOperationTypeNode ]]
    -- upvalues: v36 (ref)
    local v76 = v36(v73, function(v75) --[[ Line: 198 ]]
        return v75.operationTypes;
    end);
    for _, v78 in ipairs(v76) do
        if v78.operation == v74 then
            return v78.type;
        end;
    end;
    return nil;
end;
v34 = function(v79) --[[ Line: 211 ]] --[[ Name: validateDirectives ]]
    -- upvalues: l_isDirective_0 (copy), l_inspect_0 (copy), v42 (ref), l_isInputType_0 (copy), l_isRequiredArgument_0 (copy), l_isNotNillish_0 (copy), v39 (ref)
    for _, v81 in ipairs(v79.schema:getDirectives()) do
        if not l_isDirective_0(v81) then
            v79:reportError(("Expected directive but got: %s."):format(l_inspect_0(v81)), if v81 then v81.astNode else nil);
        else
            v42(v79, v81);
            for _, v83 in ipairs(v81.args) do
                v42(v79, v83);
                if not l_isInputType_0(v83.type) then
                    v79:reportError(("The type of @%s(%s:) must be Input Type "):format(v81.name, v83.name) .. ("but got: %s."):format(l_inspect_0(v83.type)), v83.astNode);
                end;
                if l_isRequiredArgument_0(v83) and l_isNotNillish_0(v83.deprecationReason) then
                    v79:reportError(("Required argument @%s(%s:) cannot be deprecated."):format(v81.name, v83.name), {
                        v39(v83.astNode), 
                        if v83.astNode ~= nil then v83.astNode.type else nil
                    });
                end;
            end;
        end;
    end;
end;
v42 = function(v84, v85) --[[ Line: 255 ]] --[[ Name: validateName ]]
    -- upvalues: l_isValidNameError_0 (copy), l_locatedError_0 (copy)
    local v86 = nil;
    local v87 = nil;
    if typeof(v85) == "table" then
        v86 = v85.name;
        v87 = v85.astNode;
    else
        v86 = tostring(v85);
    end;
    local v88 = l_isValidNameError_0(v86);
    if v88 then
        v84:addError(l_locatedError_0(v88, v87));
    end;
end;
v45 = function(v89) --[[ Line: 276 ]] --[[ Name: validateTypes ]]
    -- upvalues: l_isNamedType_0 (copy), l_inspect_0 (copy), l_isIntrospectionType_0 (copy), v42 (ref), l_isObjectType_0 (copy), v43 (ref), v47 (ref), l_isInterfaceType_0 (copy), l_isUnionType_0 (copy), l_isEnumType_0 (copy), v41 (ref), l_isInputObjectType_0 (copy)
    local v90 = createInputObjectCircularRefsValidator(v89);
    local v91 = v89.schema:getTypeMap();
    for _, v93 in ipairs(v91:values()) do
        local v94 = nil;
        if typeof(v93) == "table" then
            v94 = v93.astNode;
        end;
        if not l_isNamedType_0(v93) then
            v89:reportError(("Expected GraphQL named type but got: %s."):format(l_inspect_0(v93)), v94);
        else
            if not l_isIntrospectionType_0(v93) then
                v42(v89, v93);
            end;
            if l_isObjectType_0(v93) then
                v43(v89, v93);
                v47(v89, v93);
            elseif l_isInterfaceType_0(v93) then
                v43(v89, v93);
                v47(v89, v93);
            elseif l_isUnionType_0(v93) then
                validateUnionMembers(v89, v93);
            elseif l_isEnumType_0(v93) then
                v41(v89, v93);
            elseif l_isInputObjectType_0(v93) then
                validateInputFields(v89, v93);
                v90(v93);
            end;
        end;
    end;
end;
v43 = function(v95, v96) --[[ Line: 329 ]] --[[ Name: validateFields ]]
    -- upvalues: v37 (ref), v42 (ref), l_isOutputType_0 (copy), l_inspect_0 (copy), l_isInputType_0 (copy), l_isRequiredArgument_0 (copy), l_isNotNillish_0 (copy), v39 (ref)
    local v97 = v96:getFields():values();
    if #v97 == 0 then
        v95:reportError(("Type %s must define one or more fields."):format(v96.name), v37(v96));
    end;
    for _, v99 in ipairs(v97) do
        v42(v95, v99);
        if not l_isOutputType_0(v99.type) then
            v95:reportError(("The type of %s.%s must be Output Type "):format(v96.name, v99.name) .. ("but got: %s."):format(l_inspect_0(v99.type)), if v99.astNode ~= nil then v99.astNode.type else nil);
        end;
        for _, v101 in ipairs(v99.args) do
            local l_name_0 = v101.name;
            v42(v95, v101);
            if not l_isInputType_0(v101.type) then
                v95:reportError(("The type of %s.%s(%s:) must be Input "):format(v96.name, v99.name, l_name_0) .. ("Type but got: %s."):format(l_inspect_0(v101.type)), if v101.astNode ~= nil then v101.astNode.type else nil);
            end;
            if l_isRequiredArgument_0(v101) and l_isNotNillish_0(v101.deprecationReason) then
                v95:reportError(("Required argument %s.%s(%s:) cannot be deprecated."):format(v96.name, v99.name, l_name_0), {
                    v39(v101.astNode), 
                    if v101.astNode ~= nil then v101.astNode.type else nil
                });
            end;
        end;
    end;
end;
v47 = function(v103, v104) --[[ Line: 394 ]] --[[ Name: validateInterfaces ]]
    -- upvalues: l_isInterfaceType_0 (copy), l_inspect_0 (copy), v38 (ref), v44 (ref), v46 (ref)
    local v105 = {};
    for _, v107 in ipairs(v104:getInterfaces()) do
        if not l_isInterfaceType_0(v107) then
            v103:reportError(("Type %s must only implement Interface types, "):format(l_inspect_0(v104)) .. ("it cannot implement %s."):format(l_inspect_0(v107)), v38(v104, v107));
        elseif v104 == v107 then
            v103:reportError(("Type %s cannot implement itself because it would create a circular reference."):format(v104.name), v38(v104, v107));
        else
            local v108 = if typeof(nil) == "table" then tostring(v107.name) else tostring(v107);
            if v105[v108] then
                v103:reportError(("Type %s can only implement %s once."):format(v104.name, v107.name), v38(v104, v107));
            else
                v105[v108] = true;
                v44(v103, v104, v107);
                v46(v103, v104, v107);
            end;
        end;
    end;
end;
v46 = function(v109, v110, v111) --[[ Line: 444 ]] --[[ Name: validateTypeImplementsInterface ]]
    -- upvalues: l_Array_0 (copy), v37 (ref), l_isTypeSubTypeOf_0 (copy), l_inspect_0 (copy), l_isEqualType_0 (copy), l_isRequiredArgument_0 (copy)
    local v112 = v110:getFields();
    for _, v114 in ipairs(v111:getFields():values()) do
        local l_name_1 = v114.name;
        local v116 = v112:get(l_name_1);
        if not v116 then
            v109:reportError(("Interface field %s.%s expected but %s does not provide it."):format(v111.name, l_name_1, v110.name), l_Array_0.concat({
                v114.astNode
            }, v37(v110)));
        else
            if not l_isTypeSubTypeOf_0(v109.schema, v116.type, v114.type) then
                v109:reportError(("Interface field %s.%s expects type "):format(v111.name, l_name_1) .. ("%s but %s.%s "):format(l_inspect_0(v114.type), v110.name, l_name_1) .. ("is type %s."):format(l_inspect_0(v116.type)), {
                    if v114.astNode ~= nil then v114.astNode.type else nil, 
                    if v116.astNode ~= nil then v116.astNode.type else nil
                });
            end;
            for _, v118 in ipairs(v114.args) do
                local l_name_2 = v118.name;
                local v121 = l_Array_0.find(v116.args, function(v120) --[[ Line: 492 ]]
                    -- upvalues: l_name_2 (copy)
                    return v120.name == l_name_2;
                end);
                if not v121 then
                    v109:reportError(("Interface field argument %s.%s(%s:) expected but %s.%s does not provide it."):format(v111.name, l_name_1, l_name_2, v110.name, l_name_1), {
                        v118.astNode, 
                        v116.astNode
                    });
                elseif not l_isEqualType_0(v118.type, v121.type) then
                    v109:reportError(("Interface field argument %s.%s(%s:) "):format(v111.name, l_name_1, l_name_2) .. ("expects type %s but "):format(l_inspect_0(v118.type)) .. ("%s.%s(%s:) is type "):format(v110.name, l_name_1, l_name_2) .. ("%s."):format(l_inspect_0(v121.type)), {
                        if v118.astNode ~= nil then v118.astNode.type else nil, 
                        if v121.astNode ~= nil then v121.astNode.type else nil
                    });
                end;
            end;
            for _, v123 in ipairs(v116.args) do
                local l_name_3 = v123.name;
                if not l_Array_0.find(v114.args, function(v125) --[[ Line: 538 ]]
                    -- upvalues: l_name_3 (copy)
                    return v125.name == l_name_3;
                end) and l_isRequiredArgument_0(v123) then
                    v109:reportError(("Object field %s.%s includes required argument %s that is missing from the Interface field %s.%s."):format(v110.name, l_name_1, l_name_3, v111.name, l_name_1), {
                        v123.astNode, 
                        v114.astNode
                    });
                end;
            end;
        end;
    end;
end;
v44 = function(v126, v127, v128) --[[ Line: 557 ]] --[[ Name: validateTypeImplementsAncestors ]]
    -- upvalues: l_Array_0 (copy), v38 (ref)
    local v129 = v127:getInterfaces();
    for _, v131 in ipairs(v128:getInterfaces()) do
        if l_Array_0.indexOf(v129, v131) == -1 then
            v126:reportError(if v131 == v127 then ("Type %s cannot implement %s because it would create a circular reference."):format(v127.name, v128.name) else ("Type %s must implement %s because it is implemented by %s."):format(v127.name, v131.name, v128.name), l_Array_0.concat(v38(v128, v131), v38(v127, v128)));
        end;
    end;
end;
validateUnionMembers = function(v132, v133) --[[ Line: 587 ]] --[[ Name: validateUnionMembers ]]
    -- upvalues: v37 (ref), v40 (ref), l_isObjectType_0 (copy), l_inspect_0 (copy)
    local v134 = v133:getTypes();
    if #v134 == 0 then
        v132:reportError(("Union type %s must define one or more member types."):format(v133.name), v37(v133));
    end;
    local v135 = {};
    for _, v137 in ipairs(v134) do
        if v135[tostring(v137.name)] then
            v132:reportError(("Union type %s can only include type %s once."):format(v133.name, v137.name), v40(v133, v137.name));
        else
            v135[tostring(v137.name)] = true;
            if not l_isObjectType_0(v137) then
                v132:reportError(("Union type %s can only include Object types, "):format(v133.name) .. ("it cannot include %s."):format(l_inspect_0(v137)), v40(v133, (tostring(v137))));
            end;
        end;
    end;
end;
v41 = function(v138, v139) --[[ Line: 621 ]] --[[ Name: validateEnumValues ]]
    -- upvalues: v37 (ref), v42 (ref)
    local v140 = v139:getValues();
    if #v140 == 0 then
        v138:reportError(("Enum type %s must define one or more values."):format(v139.name), v37(v139));
    end;
    for _, v142 in ipairs(v140) do
        local l_name_4 = v142.name;
        v42(v138, v142);
        if l_name_4 == "true" or l_name_4 == "false" or l_name_4 == "null" then
            v138:reportError(("Enum type %s cannot include value: %s."):format(v139.name, l_name_4), v142.astNode);
        end;
    end;
end;
validateInputFields = function(v144, v145) --[[ Line: 646 ]] --[[ Name: validateInputFields ]]
    -- upvalues: v37 (ref), v42 (ref), l_isInputType_0 (copy), l_inspect_0 (copy), l_isRequiredInputField_0 (copy), l_isNotNillish_0 (copy), v39 (ref)
    local v146 = v145:getFields():values();
    if #v146 == 0 then
        v144:reportError(("Input Object type %s must define one or more fields."):format(v145.name), v37(v145));
    end;
    for _, v148 in ipairs(v146) do
        v42(v144, v148);
        if not l_isInputType_0(v148.type) then
            v144:reportError(("The type of %s.%s must be Input Type "):format(v145.name, v148.name) .. ("but got: %s."):format(l_inspect_0(v148.type)), if v148.astNode ~= nil then v148.astNode.type else nil);
        end;
        if l_isRequiredInputField_0(v148) and l_isNotNillish_0(v148.deprecationReason) then
            v144:reportError(("Required input field %s.%s cannot be deprecated."):format(v145.name, v148.name), {
                v39(v148.astNode), 
                if v148.astNode ~= nil then v148.astNode.type else nil
            });
        end;
    end;
end;
createInputObjectCircularRefsValidator = function(v149) --[[ Line: 688 ]] --[[ Name: createInputObjectCircularRefsValidator ]]
    -- upvalues: l_isNonNullType_0 (copy), l_isInputObjectType_0 (copy), l_Array_0 (copy)
    local v150 = {};
    local v151 = {};
    local v152 = {};
    local function v153(v154) --[[ Line: 705 ]] --[[ Name: detectCycleRecursive ]]
        -- upvalues: v150 (copy), v152 (copy), v151 (copy), l_isNonNullType_0 (ref), l_isInputObjectType_0 (ref), v153 (copy), l_Array_0 (ref), v149 (copy)
        if v150[tostring(v154.name)] then
            return;
        else
            v150[tostring(v154.name)] = true;
            v152[tostring(v154.name)] = #v151 + 1;
            local v155 = v154:getFields():values();
            for _, v157 in ipairs(v155) do
                if l_isNonNullType_0(v157.type) and l_isInputObjectType_0(v157.type.ofType) then
                    local l_ofType_0 = v157.type.ofType;
                    local v159 = v152[tostring(l_ofType_0.name)];
                    table.insert(v151, v157);
                    if v159 == nil then
                        v153(l_ofType_0);
                    else
                        local v160 = nil;
                        v160 = l_Array_0.slice(v151, v159);
                        local v162 = l_Array_0.join(l_Array_0.map(v160, function(v161) --[[ Line: 733 ]]
                            return v161.name;
                        end), ".");
                        v149:reportError(("Cannot reference Input Object \"%s\" within itself through a series of non-null fields: \"%s\"."):format(l_ofType_0.name, v162), l_Array_0.map(v160, function(v163) --[[ Line: 743 ]]
                            return v163.astNode;
                        end));
                    end;
                    table.remove(v151);
                end;
            end;
            v152[tostring(v154.name)] = nil;
            return;
        end;
    end;
    return v153;
end;
v37 = function(v164) --[[ Line: 767 ]] --[[ Name: getAllNodes ]]
    -- upvalues: l_Array_0 (copy)
    local l_astNode_0 = v164.astNode;
    local l_extensionASTNodes_0 = v164.extensionASTNodes;
    if l_astNode_0 then
        if l_extensionASTNodes_0 then
            return (l_Array_0.concat({
                l_astNode_0
            }, l_extensionASTNodes_0));
        else
            return {
                l_astNode_0
            };
        end;
    elseif l_extensionASTNodes_0 then
        return l_extensionASTNodes_0;
    else
        return {};
    end;
end;
v36 = function(v167, v168) --[[ Line: 777 ]] --[[ Name: getAllSubNodes ]]
    -- upvalues: v37 (ref), l_Array_0 (copy)
    local v169 = {};
    for _, v171 in ipairs(v37(v167)) do
        local v172 = v168(v171);
        v169 = l_Array_0.concat(v169, v172 or {});
    end;
    return v169;
end;
v38 = function(v173, v174) --[[ Line: 793 ]] --[[ Name: getAllImplementsInterfaceNodes ]]
    -- upvalues: l_Array_0 (copy), v36 (ref)
    return l_Array_0.filter(v36(v173, function(v175) --[[ Line: 798 ]]
        return v175.interfaces;
    end), function(v176) --[[ Line: 801 ]]
        -- upvalues: v174 (copy)
        return v176.name.value == v174.name;
    end);
end;
v40 = function(v177, v178) --[[ Line: 807 ]] --[[ Name: getUnionMemberTypeNodes ]]
    -- upvalues: l_Array_0 (copy), v36 (ref)
    return l_Array_0.filter(v36(v177, function(v179) --[[ Line: 809 ]]
        return v179.types;
    end), function(v180) --[[ Line: 812 ]]
        -- upvalues: v178 (copy)
        return v180.name.value == v178;
    end);
end;
v39 = function(v181) --[[ Line: 818 ]] --[[ Name: getDeprecatedDirectiveNode ]]
    -- upvalues: l_Array_0 (copy), l_GraphQLDeprecatedDirective_0 (copy)
    if v181 ~= nil and v181.directives ~= nil then
        return l_Array_0.find(v181.directives, function(v182) --[[ Line: 823 ]]
            -- upvalues: l_GraphQLDeprecatedDirective_0 (ref)
            return v182.name.value == l_GraphQLDeprecatedDirective_0.name;
        end);
    else
        return;
    end;
end;
return {
    validateSchema = v51, 
    assertValidSchema = v55
};