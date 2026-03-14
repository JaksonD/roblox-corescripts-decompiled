local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_keyMapOrdered_0 = require(l_Parent_0.luaUtils.keyMapOrdered).keyMapOrdered;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_naturalCompare_0 = require(l_jsutils_0.naturalCompare).naturalCompare;
local l_language_0 = l_Parent_0.language;
local l_print_0 = require(l_language_0.printer).print;
local l_visit_0 = require(l_language_0.visitor).visit;
local _ = require(l_language_0.ast);
local l_type_0 = l_Parent_0.type;
local _ = require(l_type_0.schema);
local v16 = require(l_type_0.definition);
local l_isSpecifiedScalarType_0 = require(l_type_0.scalars).isSpecifiedScalarType;
local l_isScalarType_0 = v16.isScalarType;
local l_isObjectType_0 = v16.isObjectType;
local l_isInterfaceType_0 = v16.isInterfaceType;
local l_isUnionType_0 = v16.isUnionType;
local l_isEnumType_0 = v16.isEnumType;
local l_isInputObjectType_0 = v16.isInputObjectType;
local l_isNonNullType_0 = v16.isNonNullType;
local l_isListType_0 = v16.isListType;
local l_isNamedType_0 = v16.isNamedType;
local l_isRequiredArgument_0 = v16.isRequiredArgument;
local l_isRequiredInputField_0 = v16.isRequiredInputField;
local l_astFromValue_0 = require(script.Parent.astFromValue).astFromValue;
local v30 = nil;
local v31 = nil;
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
local v44 = l_Object_0.freeze({
    TYPE_REMOVED = "TYPE_REMOVED", 
    TYPE_CHANGED_KIND = "TYPE_CHANGED_KIND", 
    TYPE_REMOVED_FROM_UNION = "TYPE_REMOVED_FROM_UNION", 
    VALUE_REMOVED_FROM_ENUM = "VALUE_REMOVED_FROM_ENUM", 
    REQUIRED_INPUT_FIELD_ADDED = "REQUIRED_INPUT_FIELD_ADDED", 
    IMPLEMENTED_INTERFACE_REMOVED = "IMPLEMENTED_INTERFACE_REMOVED", 
    FIELD_REMOVED = "FIELD_REMOVED", 
    FIELD_CHANGED_KIND = "FIELD_CHANGED_KIND", 
    REQUIRED_ARG_ADDED = "REQUIRED_ARG_ADDED", 
    ARG_REMOVED = "ARG_REMOVED", 
    ARG_CHANGED_KIND = "ARG_CHANGED_KIND", 
    DIRECTIVE_REMOVED = "DIRECTIVE_REMOVED", 
    DIRECTIVE_ARG_REMOVED = "DIRECTIVE_ARG_REMOVED", 
    REQUIRED_DIRECTIVE_ARG_ADDED = "REQUIRED_DIRECTIVE_ARG_ADDED", 
    DIRECTIVE_REPEATABLE_REMOVED = "DIRECTIVE_REPEATABLE_REMOVED", 
    DIRECTIVE_LOCATION_REMOVED = "DIRECTIVE_LOCATION_REMOVED"
});
local v45 = l_Object_0.freeze({
    VALUE_ADDED_TO_ENUM = "VALUE_ADDED_TO_ENUM", 
    TYPE_ADDED_TO_UNION = "TYPE_ADDED_TO_UNION", 
    OPTIONAL_INPUT_FIELD_ADDED = "OPTIONAL_INPUT_FIELD_ADDED", 
    OPTIONAL_ARG_ADDED = "OPTIONAL_ARG_ADDED", 
    IMPLEMENTED_INTERFACE_ADDED = "IMPLEMENTED_INTERFACE_ADDED", 
    ARG_DEFAULT_VALUE_CHANGE = "ARG_DEFAULT_VALUE_CHANGE"
});
local function v49(v46, v47) --[[ Line: 122 ]] --[[ Name: findBreakingChanges ]]
    -- upvalues: l_Array_0 (copy), v30 (ref), v44 (copy)
    return (l_Array_0.filter(v30(v46, v47), function(v48) --[[ Line: 126 ]]
        -- upvalues: v44 (ref)
        return v44[v48.type] ~= nil;
    end));
end;
local function v53(v50, v51) --[[ Line: 136 ]] --[[ Name: findDangerousChanges ]]
    -- upvalues: l_Array_0 (copy), v30 (ref), v45 (copy)
    return (l_Array_0.filter(v30(v50, v51), function(v52) --[[ Line: 140 ]]
        -- upvalues: v45 (ref)
        return v45[v52.type] ~= nil;
    end));
end;
v30 = function(v54, v55) --[[ Line: 146 ]] --[[ Name: findSchemaChanges ]]
    -- upvalues: l_Array_0 (copy), v31 (ref), v32 (ref)
    return l_Array_0.concat(v31(v54, v55), v32(v54, v55));
end;
v32 = function(v56, v57) --[[ Line: 156 ]] --[[ Name: findDirectiveChanges ]]
    -- upvalues: v33 (ref), v44 (copy), l_isRequiredArgument_0 (copy)
    local v58 = {};
    local v59 = v33(v56:getDirectives(), v57:getDirectives());
    for _, v61 in ipairs(v59.removed) do
        table.insert(v58, {
            type = v44.DIRECTIVE_REMOVED, 
            description = ("%s was removed."):format(v61.name)
        });
    end;
    for _, v63 in ipairs(v59.persisted) do
        local v64 = v63[1];
        local v65 = v63[2];
        local v66 = v33(v64.args, v65.args);
        for _, v68 in ipairs(v66.added) do
            if l_isRequiredArgument_0(v68) then
                table.insert(v58, {
                    type = v44.REQUIRED_DIRECTIVE_ARG_ADDED, 
                    description = ("A required arg %s on directive %s was added."):format(v68.name, v64.name)
                });
            end;
        end;
        for _, v70 in ipairs(v66.removed) do
            table.insert(v58, {
                type = v44.DIRECTIVE_ARG_REMOVED, 
                description = ("%s was removed from %s."):format(v70.name, v64.name)
            });
        end;
        if v64.isRepeatable and not v65.isRepeatable then
            table.insert(v58, {
                type = v44.DIRECTIVE_REPEATABLE_REMOVED, 
                description = ("Repeatable flag was removed from %s."):format(v64.name)
            });
        end;
        for _, v72 in ipairs(v64.locations) do
            if table.find(v65.locations, v72) == nil then
                table.insert(v58, {
                    type = v44.DIRECTIVE_LOCATION_REMOVED, 
                    description = ("%s was removed from %s."):format(v72, v64.name)
                });
            end;
        end;
    end;
    return v58;
end;
v31 = function(v73, v74) --[[ Line: 215 ]] --[[ Name: findTypeChanges ]]
    -- upvalues: v33 (ref), v44 (copy), l_isSpecifiedScalarType_0 (copy), l_isEnumType_0 (copy), v34 (ref), l_isUnionType_0 (copy), v35 (ref), l_isInputObjectType_0 (copy), v36 (ref), l_isObjectType_0 (copy), l_Array_0 (copy), v37 (ref), v38 (ref), l_isInterfaceType_0 (copy), v39 (ref)
    local v75 = {};
    local v76 = v33(v73:getTypeMap():values(), v74:getTypeMap():values());
    for _, v78 in ipairs(v76.removed) do
        table.insert(v75, {
            type = v44.TYPE_REMOVED, 
            description = l_isSpecifiedScalarType_0(v78) and ("Standard scalar %s was removed because it is not referenced anymore."):format(v78.name) or ("%s was removed."):format(v78.name)
        });
    end;
    for _, v80 in ipairs(v76.persisted) do
        local v81 = v80[1];
        local v82 = v80[2];
        if l_isEnumType_0(v81) and l_isEnumType_0(v82) then
            for _, v84 in ipairs(v34(v81, v82)) do
                table.insert(v75, v84);
            end;
        elseif l_isUnionType_0(v81) and l_isUnionType_0(v82) then
            for _, v86 in ipairs(v35(v81, v82)) do
                table.insert(v75, v86);
            end;
        elseif l_isInputObjectType_0(v81) and l_isInputObjectType_0(v82) then
            for _, v88 in ipairs(v36(v81, v82)) do
                table.insert(v75, v88);
            end;
        elseif l_isObjectType_0(v81) and l_isObjectType_0(v82) then
            for _, v90 in ipairs(l_Array_0.concat(v37(v81, v82), v38(v81, v82))) do
                table.insert(v75, v90);
            end;
        elseif l_isInterfaceType_0(v81) and l_isInterfaceType_0(v82) then
            for _, v92 in ipairs(l_Array_0.concat(v37(v81, v82), v38(v81, v82))) do
                table.insert(v75, v92);
            end;
        elseif v81.new ~= v82.new then
            table.insert(v75, {
                type = v44.TYPE_CHANGED_KIND, 
                description = ("%s changed from %s to %s."):format(v81.name, v39(v81), v39(v82))
            });
        end;
    end;
    return v75;
end;
v36 = function(v93, v94) --[[ Line: 284 ]] --[[ Name: findInputObjectTypeChanges ]]
    -- upvalues: v33 (ref), l_isRequiredInputField_0 (copy), v44 (copy), v45 (copy), v40 (ref)
    local v95 = {};
    local v96 = v33(v93:getFields():values(), v94:getFields():values());
    for _, v98 in ipairs(v96.added) do
        if l_isRequiredInputField_0(v98) then
            table.insert(v95, {
                type = v44.REQUIRED_INPUT_FIELD_ADDED, 
                description = ("A required field %s on input type %s was added."):format(v98.name, v93.name)
            });
        else
            table.insert(v95, {
                type = v45.OPTIONAL_INPUT_FIELD_ADDED, 
                description = ("An optional field %s on input type %s was added."):format(v98.name, v93.name)
            });
        end;
    end;
    for _, v100 in ipairs(v96.removed) do
        table.insert(v95, {
            type = v44.FIELD_REMOVED, 
            description = ("%s.%s was removed."):format(v93.name, v100.name)
        });
    end;
    for _, v102 in ipairs(v96.persisted) do
        local v103 = v102[1];
        local v104 = v102[2];
        if not v40(v103.type, v104.type) then
            table.insert(v95, {
                type = v44.FIELD_CHANGED_KIND, 
                description = ("%s.%s changed type from %s to %s."):format(v93.name, v103.name, tostring(v103.type), (tostring(v104.type)))
            });
        end;
    end;
    return v95;
end;
v35 = function(v105, v106) --[[ Line: 339 ]] --[[ Name: findUnionTypeChanges ]]
    -- upvalues: v33 (ref), v45 (copy), v44 (copy)
    local v107 = {};
    local v108 = v33(v105:getTypes(), v106:getTypes());
    for _, v110 in ipairs(v108.added) do
        table.insert(v107, {
            type = v45.TYPE_ADDED_TO_UNION, 
            description = ("%s was added to union type %s."):format(v110.name, v105.name)
        });
    end;
    for _, v112 in ipairs(v108.removed) do
        table.insert(v107, {
            type = v44.TYPE_REMOVED_FROM_UNION, 
            description = ("%s was removed from union type %s."):format(v112.name, v105.name)
        });
    end;
    return v107;
end;
v34 = function(v113, v114) --[[ Line: 368 ]] --[[ Name: findEnumTypeChanges ]]
    -- upvalues: v33 (ref), v45 (copy), v44 (copy)
    local v115 = {};
    local v116 = v33(v113:getValues(), v114:getValues());
    for _, v118 in ipairs(v116.added) do
        table.insert(v115, {
            type = v45.VALUE_ADDED_TO_ENUM, 
            description = ("%s was added to enum type %s."):format(v118.name, v113.name)
        });
    end;
    for _, v120 in ipairs(v116.removed) do
        table.insert(v115, {
            type = v44.VALUE_REMOVED_FROM_ENUM, 
            description = ("%s was removed from enum type %s."):format(v120.name, v113.name)
        });
    end;
    return v115;
end;
v38 = function(v121, v122) --[[ Line: 390 ]] --[[ Name: findImplementedInterfacesChanges ]]
    -- upvalues: v33 (ref), v45 (copy), v44 (copy)
    local v123 = {};
    local v124 = v33(v121:getInterfaces(), v122:getInterfaces());
    for _, v126 in ipairs(v124.added) do
        table.insert(v123, {
            type = v45.IMPLEMENTED_INTERFACE_ADDED, 
            description = ("%s added to interfaces implemented by %s."):format(v126.name, v121.name)
        });
    end;
    for _, v128 in ipairs(v124.removed) do
        table.insert(v123, {
            type = v44.IMPLEMENTED_INTERFACE_REMOVED, 
            description = ("%s no longer implements interface %s."):format(v121.name, v128.name)
        });
    end;
    return v123;
end;
v37 = function(v129, v130) --[[ Line: 420 ]] --[[ Name: findFieldChanges ]]
    -- upvalues: v33 (ref), v44 (copy), v41 (ref), v42 (ref)
    local v131 = {};
    local v132 = v33(v129:getFields():values(), v130:getFields():values());
    for _, v134 in ipairs(v132.removed) do
        table.insert(v131, {
            type = v44.FIELD_REMOVED, 
            description = ("%s.%s was removed."):format(v129.name, v134.name)
        });
    end;
    for _, v136 in ipairs(v132.persisted) do
        local v137 = v136[1];
        local v138 = v136[2];
        for _, v140 in ipairs(v41(v129, v137, v138)) do
            table.insert(v131, v140);
        end;
        if not v42(v137.type, v138.type) then
            table.insert(v131, {
                type = v44.FIELD_CHANGED_KIND, 
                description = ("%s.%s changed type from "):format(v129.name, v137.name) .. ("%s to %s."):format(tostring(v137.type), (tostring(v138.type)))
            });
        end;
    end;
    return v131;
end;
v41 = function(v141, v142, v143) --[[ Line: 461 ]] --[[ Name: findArgChanges ]]
    -- upvalues: v33 (ref), v44 (copy), v40 (ref), v45 (copy), v43 (ref), l_isRequiredArgument_0 (copy)
    local v144 = {};
    local v145 = v33(v142.args, v143.args);
    for _, v147 in ipairs(v145.removed) do
        table.insert(v144, {
            type = v44.ARG_REMOVED, 
            description = ("%s.%s arg %s was removed."):format(v141.name, v142.name, v147.name)
        });
    end;
    for _, v149 in ipairs(v145.persisted) do
        local v150 = v149[1];
        local v151 = v149[2];
        if not v40(v150.type, v151.type) then
            table.insert(v144, {
                type = v44.ARG_CHANGED_KIND, 
                description = ("%s.%s arg %s has changed type from "):format(v141.name, v142.name, v150.name) .. ("%s to %s."):format(tostring(v150.type), (tostring(v151.type)))
            });
        elseif v150.defaultValue ~= nil then
            if v151.defaultValue == nil then
                table.insert(v144, {
                    type = v45.ARG_DEFAULT_VALUE_CHANGE, 
                    description = ("%s.%s arg %s defaultValue was removed."):format(v141.name, v142.name, v150.name)
                });
            else
                local v152 = v43(v150.defaultValue, v150.type);
                local v153 = v43(v151.defaultValue, v151.type);
                if v152 ~= v153 then
                    table.insert(v144, {
                        type = v45.ARG_DEFAULT_VALUE_CHANGE, 
                        description = ("%s.%s arg %s has changed defaultValue from %s to %s."):format(v141.name, v142.name, v150.name, v152, v153)
                    });
                end;
            end;
        end;
    end;
    for _, v155 in ipairs(v145.added) do
        if l_isRequiredArgument_0(v155) then
            table.insert(v144, {
                type = v44.REQUIRED_ARG_ADDED, 
                description = ("A required arg %s on %s.%s was added."):format(v155.name, v141.name, v142.name)
            });
        else
            table.insert(v144, {
                type = v45.OPTIONAL_ARG_ADDED, 
                description = ("An optional arg %s on %s.%s was added."):format(v155.name, v141.name, v142.name)
            });
        end;
    end;
    return v144;
end;
v42 = function(v156, v157) --[[ Line: 550 ]] --[[ Name: isChangeSafeForObjectOrInterfaceField ]]
    -- upvalues: l_isListType_0 (copy), v42 (ref), l_isNonNullType_0 (copy), l_isNamedType_0 (copy)
    if l_isListType_0(v156) then
        return l_isListType_0(v157) and v42(v156.ofType, v157.ofType) or l_isNonNullType_0(v157) and v42(v156, v157.ofType);
    elseif l_isNonNullType_0(v156) then
        return l_isNonNullType_0(v157) and v42(v156.ofType, v157.ofType);
    else
        return l_isNamedType_0(v157) and v156.name == v157.name or l_isNonNullType_0(v157) and v42(v156, v157.ofType);
    end;
end;
v40 = function(v158, v159) --[[ Line: 572 ]] --[[ Name: isChangeSafeForInputObjectFieldOrFieldArg ]]
    -- upvalues: l_isListType_0 (copy), v40 (ref), l_isNonNullType_0 (copy), l_isNamedType_0 (copy)
    if l_isListType_0(v158) then
        return l_isListType_0(v159) and v40(v158.ofType, v159.ofType);
    elseif l_isNonNullType_0(v158) then
        return l_isNonNullType_0(v159) and v40(v158.ofType, v159.ofType) or not l_isNonNullType_0(v159) and v40(v158.ofType, v159);
    else
        return l_isNamedType_0(v159) and v158.name == v159.name;
    end;
end;
v39 = function(v160) --[[ Line: 593 ]] --[[ Name: typeKindName ]]
    -- upvalues: l_isScalarType_0 (copy), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isUnionType_0 (copy), l_isEnumType_0 (copy), l_isInputObjectType_0 (copy), l_invariant_0 (copy), l_inspect_0 (copy)
    if l_isScalarType_0(v160) then
        return "a Scalar type";
    elseif l_isObjectType_0(v160) then
        return "an Object type";
    elseif l_isInterfaceType_0(v160) then
        return "an Interface type";
    elseif l_isUnionType_0(v160) then
        return "a Union type";
    elseif l_isEnumType_0(v160) then
        return "an Enum type";
    elseif l_isInputObjectType_0(v160) then
        return "an Input type";
    else
        l_invariant_0(false, "Unexpected type: " .. l_inspect_0(v160));
        return "";
    end;
end;
v43 = function(v161, v162) --[[ Line: 620 ]] --[[ Name: stringifyValue ]]
    -- upvalues: l_astFromValue_0 (copy), l_invariant_0 (copy), l_visit_0 (copy), l_Array_0 (copy), l_naturalCompare_0 (copy), l_Object_0 (copy), l_print_0 (copy)
    local v163 = l_astFromValue_0(v161, v162);
    l_invariant_0(v163 ~= nil);
    local v169 = l_visit_0(v163, {
        ObjectValue = function(_, v165) --[[ Line: 628 ]] --[[ Name: ObjectValue ]]
            -- upvalues: l_Array_0 (ref), l_naturalCompare_0 (ref), l_Object_0 (ref)
            local v166 = l_Array_0.concat({}, v165.fields);
            l_Array_0.sort(v166, function(v167, v168) --[[ Line: 632 ]]
                -- upvalues: l_naturalCompare_0 (ref)
                return l_naturalCompare_0(v167.name.value, v168.name.value);
            end);
            return l_Object_0.assign({}, v165, {
                fields = v166
            });
        end
    });
    return l_print_0(v169);
end;
v33 = function(v170, v171) --[[ Line: 645 ]] --[[ Name: diff ]]
    -- upvalues: l_keyMapOrdered_0 (copy)
    local v172 = {};
    local v173 = {};
    local v174 = {};
    local v176 = l_keyMapOrdered_0(v170, function(v175) --[[ Line: 656 ]]
        return v175.name;
    end);
    local v178 = l_keyMapOrdered_0(v171, function(v177) --[[ Line: 659 ]]
        return v177.name;
    end);
    for _, v180 in ipairs(v170) do
        local v181 = v178:get(v180.name);
        if v181 == nil then
            table.insert(v173, v180);
        else
            table.insert(v174, {
                v180, 
                v181
            });
        end;
    end;
    for _, v183 in ipairs(v171) do
        if v176:get(v183.name) == nil then
            table.insert(v172, v183);
        end;
    end;
    return {
        added = v172, 
        persisted = v174, 
        removed = v173
    };
end;
return {
    BreakingChangeType = v44, 
    DangerousChangeType = v45, 
    findBreakingChanges = v49, 
    findDangerousChanges = v53
};