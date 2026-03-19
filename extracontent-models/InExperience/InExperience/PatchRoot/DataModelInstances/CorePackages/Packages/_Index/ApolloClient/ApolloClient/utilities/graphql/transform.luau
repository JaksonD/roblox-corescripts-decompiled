local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local v7 = {};
local v8 = require(l_Parent_1.GraphQL);
local l_visit_0 = v8.visit;
local l_REMOVE_0 = v8.REMOVE;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local v12 = require(script.Parent.getFromAST);
local l_checkDocument_0 = v12.checkDocument;
local l_getOperationDefinition_0 = v12.getOperationDefinition;
local l_getFragmentDefinition_0 = v12.getFragmentDefinition;
local l_getFragmentDefinitions_0 = v12.getFragmentDefinitions;
local l_getMainDefinition_0 = v12.getMainDefinition;
local l_filterInPlace_0 = require(script.Parent.Parent.common.filterInPlace).filterInPlace;
local v19 = require(script.Parent.storeUtils);
local l_isField_0 = v19.isField;
local l_isInlineFragment_0 = v19.isInlineFragment;
local function _(v22) --[[ Line: 58 ]] --[[ Name: createFragmentMap ]]
    -- upvalues: l_Array_0 (copy)
    local v23 = {};
    l_Array_0.forEach(v22, function(v24) --[[ Line: 60 ]]
        -- upvalues: v23 (copy)
        v23[v24.name.value] = v24;
    end);
    return v23;
end;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = {
    kind = "Field", 
    name = {
        kind = "Name", 
        value = "__typename"
    }
};
local function v31(v32, v33) --[[ Line: 90 ]] --[[ Name: isEmpty ]]
    -- upvalues: l_Array_0 (copy), v31 (copy)
    return l_Array_0.every(v32.selectionSet.selections, function(v34) --[[ Line: 91 ]]
        -- upvalues: v31 (ref), v33 (copy)
        local v35 = false;
        if v34.kind == "FragmentSpread" then
            v35 = v31(v33[v34.name.value], v33);
        end;
        return v35;
    end, nil);
end;
local function _(v36) --[[ Line: 97 ]] --[[ Name: nullIfDocIsEmpty ]]
    -- upvalues: l_getOperationDefinition_0 (copy), l_getFragmentDefinition_0 (copy), l_getFragmentDefinitions_0 (copy), l_Array_0 (copy), v31 (copy)
    local v37 = l_getOperationDefinition_0(v36) or l_getFragmentDefinition_0(v36);
    local v38 = l_getFragmentDefinitions_0(v36);
    local v39 = {};
    l_Array_0.forEach(v38, function(v40) --[[ Line: 60 ]]
        -- upvalues: v39 (copy)
        v39[v40.name.value] = v40;
    end);
    local l_v39_0 = v39;
    if l_Array_0.every(v37.selectionSet.selections, function(v42) --[[ Line: 91 ]]
        -- upvalues: v31 (ref), l_v39_0 (copy)
        local v43 = false;
        if v42.kind == "FragmentSpread" then
            v43 = v31(l_v39_0[v42.name.value], l_v39_0);
        end;
        return v43;
    end, nil) then
        return nil;
    else
        return v36;
    end;
end;
local function _(v45) --[[ Line: 110 ]] --[[ Name: getDirectiveMatcher ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy)
    return function(v46) --[[ Line: 111 ]]
        -- upvalues: l_Array_0 (ref), v45 (copy), l_Boolean_0 (ref)
        return l_Array_0.some(v45, function(v47) --[[ Line: 112 ]]
            -- upvalues: l_Boolean_0 (ref), v46 (copy)
            return l_Boolean_0.toJSBoolean(v47.name) and v47.name == v46.name.value or l_Boolean_0.toJSBoolean(v47.test) and v47:test(v46);
        end);
    end;
end;
local function v88(v49, v50) --[[ Line: 119 ]] --[[ Name: removeDirectivesFromDocument ]]
    -- upvalues: l_visit_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v29 (ref), l_REMOVE_0 (copy), l_getOperationDefinition_0 (copy), l_getFragmentDefinition_0 (copy), l_getFragmentDefinitions_0 (copy), v31 (copy), l_filterInPlace_0 (copy), v27 (ref), v28 (ref)
    local v51 = {};
    local v52 = {};
    local v53 = {};
    local v54 = {};
    local v77 = l_visit_0(v50, {
        Variable = {
            enter = function(_, v56, _, v58) --[[ Line: 131 ]] --[[ Name: enter ]]
                -- upvalues: v51 (copy)
                if v58.kind ~= "VariableDefinition" then
                    v51[v56.name.value] = true;
                end;
                return nil;
            end
        }, 
        Field = {
            enter = function(_, v60) --[[ Line: 144 ]] --[[ Name: enter ]]
                -- upvalues: l_Boolean_0 (ref), v49 (copy), l_Array_0 (ref), v52 (copy), v29 (ref), v54 (copy), l_REMOVE_0 (ref)
                if l_Boolean_0.toJSBoolean(v49) and l_Boolean_0.toJSBoolean(v60.directives) and l_Array_0.some(v49, function(v61) --[[ Line: 148 ]]
                    return v61.remove;
                end) and v60.directives then
                    local l_some_0 = l_Array_0.some;
                    local l_directives_0 = v60.directives;
                    local l_v49_0 = v49;
                    if l_some_0(l_directives_0, function(v65) --[[ Line: 111 ]]
                        -- upvalues: l_Array_0 (ref), l_v49_0 (copy), l_Boolean_0 (ref)
                        return l_Array_0.some(l_v49_0, function(v66) --[[ Line: 112 ]]
                            -- upvalues: l_Boolean_0 (ref), v65 (copy)
                            return l_Boolean_0.toJSBoolean(v66.name) and v66.name == v65.name.value or l_Boolean_0.toJSBoolean(v66.test) and v66:test(v65);
                        end);
                    end) then
                        if v60.arguments then
                            l_Array_0.forEach(v60.arguments, function(v67) --[[ Line: 160 ]]
                                -- upvalues: v52 (ref)
                                if v67.value.kind == "Variable" then
                                    table.insert(v52, {
                                        name = v67.value.name.value
                                    });
                                end;
                            end);
                        end;
                        if v60.selectionSet then
                            l_Array_0.forEach(v29(v60.selectionSet), function(v68) --[[ Line: 175 ]]
                                -- upvalues: v54 (ref)
                                table.insert(v54, {
                                    name = v68.name.value
                                });
                            end);
                        end;
                        return l_REMOVE_0;
                    end;
                end;
                return nil;
            end
        }, 
        FragmentSpread = {
            enter = function(_, v70) --[[ Line: 190 ]] --[[ Name: enter ]]
                -- upvalues: v53 (copy)
                v53[v70.name.value] = true;
            end
        }, 
        Directive = {
            enter = function(_, v72) --[[ Line: 197 ]] --[[ Name: enter ]]
                -- upvalues: l_Boolean_0 (ref), v49 (copy), l_Array_0 (ref), l_REMOVE_0 (ref)
                local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                local l_v49_1 = v49;
                if l_toJSBoolean_0((function(v75) --[[ Line: 111 ]]
                    -- upvalues: l_Array_0 (ref), l_v49_1 (copy), l_Boolean_0 (ref)
                    return l_Array_0.some(l_v49_1, function(v76) --[[ Line: 112 ]]
                        -- upvalues: l_Boolean_0 (ref), v75 (copy)
                        return l_Boolean_0.toJSBoolean(v76.name) and v76.name == v75.name.value or l_Boolean_0.toJSBoolean(v76.test) and v76:test(v75);
                    end);
                end)(v72)) then
                    return l_REMOVE_0;
                else
                    return nil;
                end;
            end
        }
    });
    local v78 = l_getOperationDefinition_0(v77) or l_getFragmentDefinition_0(v77);
    local v79 = l_getFragmentDefinitions_0(v77);
    local v80 = {};
    l_Array_0.forEach(v79, function(v81) --[[ Line: 60 ]]
        -- upvalues: v80 (copy)
        v80[v81.name.value] = v81;
    end);
    local l_v80_0 = v80;
    local v85 = if l_Array_0.every(v78.selectionSet.selections, function(v83) --[[ Line: 91 ]]
        -- upvalues: v31 (ref), l_v80_0 (copy)
        local v84 = false;
        if v83.kind == "FragmentSpread" then
            v84 = v31(l_v80_0[v83.name.value], l_v80_0);
        end;
        return v84;
    end, nil) then nil else v77;
    if l_Boolean_0.toJSBoolean(v85) and l_Boolean_0.toJSBoolean(#l_filterInPlace_0(v52, function(v86) --[[ Line: 213 ]]
        -- upvalues: l_Boolean_0 (ref), v51 (copy)
        return not not l_Boolean_0.toJSBoolean(v86.name) and not v51[v86.name];
    end)) then
        v85 = v27(v52, v85);
    end;
    if l_Boolean_0.toJSBoolean(v85) and l_Boolean_0.toJSBoolean(#l_filterInPlace_0(v54, function(v87) --[[ Line: 225 ]]
        -- upvalues: l_Boolean_0 (ref), v53 (copy)
        return not not l_Boolean_0.toJSBoolean(v87.name) and not v53[v87.name];
    end)) then
        v85 = v28(v54, v85);
    end;
    return v85;
end;
v7.removeDirectivesFromDocument = v88;
v7.addTypenameToDocument = l_Object_0.assign(setmetatable({}, {
    __call = function(_, v90) --[[ Line: 238 ]] --[[ Name: __call ]]
        -- upvalues: l_visit_0 (copy), l_checkDocument_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), l_isField_0 (copy), l_String_0 (copy), l_Object_0 (copy), v30 (copy)
        return l_visit_0(l_checkDocument_0(v90), {
            SelectionSet = {
                enter = function(_, v92, _, v94) --[[ Line: 241 ]] --[[ Name: enter ]]
                    -- upvalues: l_Boolean_0 (ref), l_Array_0 (ref), l_isField_0 (ref), l_String_0 (ref), l_Object_0 (ref), v30 (ref)
                    if l_Boolean_0.toJSBoolean(v94) and v94.kind == "OperationDefinition" then
                        return;
                    else
                        local l_selections_0 = v92.selections;
                        if not l_Boolean_0.toJSBoolean(l_selections_0) then
                            return;
                        elseif l_Array_0.some(l_selections_0, function(v96) --[[ Line: 258 ]]
                            -- upvalues: l_isField_0 (ref), l_String_0 (ref)
                            return l_isField_0(v96) and (v96.name.value == "__typename" or l_String_0.lastIndexOf(v96.name.value, "__", 1) == 1);
                        end) then
                            return;
                        elseif l_isField_0(v94) and l_Boolean_0.toJSBoolean(v94.directives) and l_Boolean_0.toJSBoolean(l_Array_0.some(v94.directives, function(v97) --[[ Line: 275 ]]
                            return v97.name.value == "export";
                        end)) then
                            return;
                        else
                            return l_Object_0.assign({}, v92, {
                                selections = l_Array_0.concat({}, l_selections_0, {
                                    v30
                                })
                            });
                        end;
                    end;
                end
            }
        });
    end
}), {
    added = function(_, v99) --[[ Line: 294 ]] --[[ Name: added ]]
        -- upvalues: v30 (copy)
        return v99 == v30;
    end
});
local v104 = {
    test = function(_, v101) --[[ Line: 302 ]] --[[ Name: test ]]
        -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy), l_invariant_0 (copy)
        local v102 = v101.name.value == "connection";
        if v102 and (not l_Boolean_0.toJSBoolean(v101.arguments) or l_Array_0.some(v101.arguments, function(v103) --[[ Line: 307 ]]
            return v103.name.value == "key";
        end)) then
            l_invariant_0.warn("Removing an @connection directive even though it does not have a key. You may want to use the key parameter to specify a store key.");
        end;
        return v102;
    end
};
v7.removeConnectionDirectiveFromDocument = function(v105) --[[ Line: 322 ]] --[[ Name: removeConnectionDirectiveFromDocument ]]
    -- upvalues: v88 (copy), v104 (copy), l_checkDocument_0 (copy)
    return (v88({
        v104
    }, l_checkDocument_0(v105)));
end;
local function _(v106, v107, v108) --[[ Line: 327 ]] --[[ Name: hasDirectivesInSelectionSet ]]
    -- upvalues: l_Array_0 (copy), v26 (ref)
    if v108 == nil then
        v108 = true;
    end;
    return v107 and v107.selections and l_Array_0.some(v107.selections, function(v109) --[[ Line: 338 ]]
        -- upvalues: v26 (ref), v106 (copy), v108 (ref)
        return v26(v106, v109, v108);
    end) or false;
end;
v26 = function(v111, v112, v113) --[[ Line: 346 ]] --[[ Name: hasDirectivesInSelection ]]
    -- upvalues: l_isField_0 (copy), l_Array_0 (copy), l_Boolean_0 (copy), v26 (ref)
    local v114 = false;
    if v113 == nil then
        v113 = true;
    end;
    if not l_isField_0(v112) then
        return true;
    elseif not v112.directives then
        return false;
    else
        local v117 = l_Array_0.some(v112.directives, function(v115) --[[ Line: 111 ]]
            -- upvalues: l_Array_0 (ref), v111 (copy), l_Boolean_0 (ref)
            return l_Array_0.some(v111, function(v116) --[[ Line: 112 ]]
                -- upvalues: l_Boolean_0 (ref), v115 (copy)
                return l_Boolean_0.toJSBoolean(v116.name) and v116.name == v115.name.value or l_Boolean_0.toJSBoolean(v116.test) and v116:test(v115);
            end);
        end);
        if not v117 then
            if v113 then
                local l_selectionSet_0 = v112.selectionSet;
                local l_v113_0 = v113;
                if l_v113_0 == nil then
                    l_v113_0 = true;
                end;
                if true then
                    local l_l_v113_0_0 = l_v113_0;
                    v117 = l_selectionSet_0 and l_selectionSet_0.selections and l_Array_0.some(l_selectionSet_0.selections, function(v121) --[[ Line: 338 ]]
                        -- upvalues: v26 (ref), v111 (copy), l_l_v113_0_0 (ref)
                        return v26(v111, v121, l_l_v113_0_0);
                    end) or false;
                end;
                v114 = v117;
            end;
            if not v114 then
                v117 = false;
            end;
        end;
        v114 = false;
        return v117;
    end;
end;
local function _(v122) --[[ Line: 375 ]] --[[ Name: getArgumentMatcher ]]
    -- upvalues: l_Array_0 (copy)
    return function(v123) --[[ Line: 376 ]]
        -- upvalues: l_Array_0 (ref), v122 (copy)
        return l_Array_0.some(v122, function(v124) --[[ Line: 377 ]]
            -- upvalues: v123 (copy)
            return if v123.value then v123.value.kind == "Variable" and (v123.value.name and (v124.name == v123.value.name.value or v124.test and v124:test(v123)) or false) else false;
        end);
    end;
end;
v27 = function(v126, v127) --[[ Line: 398 ]] --[[ Name: removeArgumentsFromDocument ]]
    -- upvalues: l_Array_0 (copy), l_visit_0 (copy), l_Object_0 (copy), l_REMOVE_0 (copy), l_Boolean_0 (copy), l_getOperationDefinition_0 (copy), l_getFragmentDefinition_0 (copy), l_getFragmentDefinitions_0 (copy), v31 (copy)
    local function v130(v128) --[[ Line: 376 ]]
        -- upvalues: l_Array_0 (ref), v126 (copy)
        return l_Array_0.some(v126, function(v129) --[[ Line: 377 ]]
            -- upvalues: v128 (copy)
            return if v128.value then v128.value.kind == "Variable" and (v128.value.name and (v129.name == v128.value.name.value or v129.test and v129:test(v128)) or false) else false;
        end);
    end;
    local v142 = l_visit_0(v127, {
        OperationDefinition = {
            enter = function(_, v132) --[[ Line: 403 ]] --[[ Name: enter ]]
                -- upvalues: l_Object_0 (ref), l_Array_0 (ref), v126 (copy)
                return l_Object_0.assign({}, v132, {
                    variableDefinitions = v132.variableDefinitions and l_Array_0.filter(v132.variableDefinitions, function(v133) --[[ Line: 407 ]]
                        -- upvalues: l_Array_0 (ref), v126 (ref)
                        return not l_Array_0.some(v126, function(v134) --[[ Line: 408 ]]
                            -- upvalues: v133 (copy)
                            return v134.name == v133.variable.name.value;
                        end);
                    end) or {}
                });
            end
        }, 
        Field = {
            enter = function(_, v136) --[[ Line: 418 ]] --[[ Name: enter ]]
                -- upvalues: l_Array_0 (ref), v126 (copy), v130 (copy), l_REMOVE_0 (ref)
                if l_Array_0.some(v126, function(v137) --[[ Line: 421 ]]
                    return v137.remove;
                end) then
                    local v138 = 0;
                    if v136.arguments then
                        l_Array_0.forEach(v136.arguments, function(v139) --[[ Line: 428 ]]
                            -- upvalues: v130 (ref), v138 (ref)
                            if v130(v139) then
                                v138 = v138 + 1;
                            end;
                        end);
                    end;
                    if v138 == 1 then
                        return l_REMOVE_0;
                    else
                        --[[ close >= 3 ]]
                    end;
                end;
                return nil;
            end
        }, 
        Argument = {
            enter = function(_, v141) --[[ Line: 444 ]] --[[ Name: enter ]]
                -- upvalues: l_Boolean_0 (ref), v130 (copy), l_REMOVE_0 (ref)
                if l_Boolean_0.toJSBoolean(v130(v141)) then
                    return l_REMOVE_0;
                else
                    return nil;
                end;
            end
        }
    });
    local v143 = l_getOperationDefinition_0(v142) or l_getFragmentDefinition_0(v142);
    local v144 = l_getFragmentDefinitions_0(v142);
    local v145 = {};
    l_Array_0.forEach(v144, function(v146) --[[ Line: 60 ]]
        -- upvalues: v145 (copy)
        v145[v146.name.value] = v146;
    end);
    local l_v145_0 = v145;
    if l_Array_0.every(v143.selectionSet.selections, function(v148) --[[ Line: 91 ]]
        -- upvalues: v31 (ref), l_v145_0 (copy)
        local v149 = false;
        if v148.kind == "FragmentSpread" then
            v149 = v31(l_v145_0[v148.name.value], l_v145_0);
        end;
        return v149;
    end, nil) then
        return nil;
    else
        return v142;
    end;
end;
v7.removeArgumentsFromDocument = v27;
v28 = function(v150, v151) --[[ Line: 456 ]] --[[ Name: removeFragmentSpreadFromDocument ]]
    -- upvalues: l_Array_0 (copy), l_REMOVE_0 (copy), l_visit_0 (copy), l_getOperationDefinition_0 (copy), l_getFragmentDefinition_0 (copy), l_getFragmentDefinitions_0 (copy), v31 (copy)
    local function v155(_, v153) --[[ Line: 460 ]] --[[ Name: enter ]]
        -- upvalues: l_Array_0 (ref), v150 (copy), l_REMOVE_0 (ref)
        if l_Array_0.some(v150, function(v154) --[[ Line: 461 ]]
            -- upvalues: v153 (copy)
            return v154.name == v153.name.value;
        end) then
            return l_REMOVE_0;
        else
            return nil;
        end;
    end;
    local v156 = l_visit_0(v151, {
        FragmentSpread = {
            enter = v155
        }, 
        FragmentDefinition = {
            enter = v155
        }
    });
    local v157 = l_getOperationDefinition_0(v156) or l_getFragmentDefinition_0(v156);
    local v158 = l_getFragmentDefinitions_0(v156);
    local v159 = {};
    l_Array_0.forEach(v158, function(v160) --[[ Line: 60 ]]
        -- upvalues: v159 (copy)
        v159[v160.name.value] = v160;
    end);
    local l_v159_0 = v159;
    if l_Array_0.every(v157.selectionSet.selections, function(v162) --[[ Line: 91 ]]
        -- upvalues: v31 (ref), l_v159_0 (copy)
        local v163 = false;
        if v162.kind == "FragmentSpread" then
            v163 = v31(l_v159_0[v162.name.value], l_v159_0);
        end;
        return v163;
    end, nil) then
        return nil;
    else
        return v156;
    end;
end;
v7.removeFragmentSpreadFromDocument = v28;
v29 = function(v164) --[[ Line: 473 ]] --[[ Name: getAllFragmentSpreadsFromSelectionSet ]]
    -- upvalues: l_Array_0 (copy), l_isField_0 (copy), l_isInlineFragment_0 (copy), v29 (ref)
    local v165 = {};
    l_Array_0.forEach(v164.selections, function(v166) --[[ Line: 475 ]]
        -- upvalues: l_isField_0 (ref), l_isInlineFragment_0 (ref), l_Array_0 (ref), v29 (ref), v165 (copy)
        if (l_isField_0(v166) or l_isInlineFragment_0(v166)) and v166.selectionSet then
            l_Array_0.forEach(v29(v166.selectionSet), function(v167) --[[ Line: 486 ]]
                -- upvalues: v165 (ref)
                table.insert(v165, v167);
            end);
            return;
        else
            if v166.kind == "FragmentSpread" then
                table.insert(v165, v166);
            end;
            return;
        end;
    end);
    return v165;
end;
v7.buildQueryFromSelectionSet = function(v168) --[[ Line: 501 ]] --[[ Name: buildQueryFromSelectionSet ]]
    -- upvalues: l_getMainDefinition_0 (copy), l_visit_0 (copy), l_Object_0 (copy)
    if l_getMainDefinition_0(v168).operation == "query" then
        return v168;
    else
        return (l_visit_0(v168, {
            OperationDefinition = {
                enter = function(_, v170) --[[ Line: 513 ]] --[[ Name: enter ]]
                    -- upvalues: l_Object_0 (ref)
                    return l_Object_0.assign({}, v170, {
                        operation = "query"
                    });
                end
            }
        }));
    end;
end;
v7.removeClientSetsFromDocument = function(v171) --[[ Line: 523 ]] --[[ Name: removeClientSetsFromDocument ]]
    -- upvalues: l_checkDocument_0 (copy), v88 (copy), l_Boolean_0 (copy), l_visit_0 (copy), l_Array_0 (copy), l_isField_0 (copy), l_REMOVE_0 (copy)
    l_checkDocument_0(v171);
    local v174 = v88({
        {
            test = function(_, v173) --[[ Line: 528 ]] --[[ Name: test ]]
                return v173.name.value == "client";
            end, 
            remove = true
        }
    }, v171);
    if l_Boolean_0.toJSBoolean(v174) then
        v174 = l_visit_0(v174, {
            FragmentDefinition = {
                enter = function(_, v176) --[[ Line: 542 ]] --[[ Name: enter ]]
                    -- upvalues: l_Array_0 (ref), l_isField_0 (ref), l_Boolean_0 (ref), l_REMOVE_0 (ref)
                    if v176.selectionSet then
                        local v178 = l_Array_0.every(v176.selectionSet.selections, function(v177) --[[ Line: 544 ]]
                            -- upvalues: l_isField_0 (ref)
                            return l_isField_0(v177) and v177.name.value == "__typename";
                        end);
                        if l_Boolean_0.toJSBoolean(v178) then
                            return l_REMOVE_0;
                        end;
                    end;
                    return nil;
                end
            }
        });
    end;
    return v174;
end;
return v7;