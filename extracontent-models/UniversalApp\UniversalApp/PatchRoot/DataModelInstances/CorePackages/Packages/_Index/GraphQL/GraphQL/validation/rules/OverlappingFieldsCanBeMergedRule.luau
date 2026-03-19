local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local v6 = require(l_Parent_0.luaUtils.null);
local l_jsutils_0 = l_Parent_0.jsutils;
local l_language_0 = l_Parent_0.language;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_print_0 = require(l_language_0.printer).print;
local v13 = require(l_Parent_0.type.definition);
local l_getNamedType_0 = v13.getNamedType;
local l_isNonNullType_0 = v13.isNonNullType;
local l_isLeafType_0 = v13.isLeafType;
local l_isObjectType_0 = v13.isObjectType;
local l_isListType_0 = v13.isListType;
local l_isInterfaceType_0 = v13.isInterfaceType;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
local v21 = {};
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local function v34(v35) --[[ Line: 49 ]] --[[ Name: reasonMessage ]]
    -- upvalues: l_Array_0 (copy), v34 (copy)
    if l_Array_0.isArray(v35) then
        return table.concat(l_Array_0.map(v35, function(v36) --[[ Line: 52 ]]
            -- upvalues: v34 (ref)
            local v37 = v36[1];
            local v38 = v36[2];
            return ("subfields \"%s\" conflict because "):format(v37) .. v34(v38);
        end), " and ");
    else
        return v35;
    end;
end;
v21.OverlappingFieldsCanBeMergedRule = function(v39) --[[ Line: 70 ]]
    -- upvalues: v33 (ref), v22 (ref), l_Array_0 (copy), v34 (copy), l_GraphQLError_0 (copy)
    local v40 = v33.new();
    local v41 = {};
    return {
        SelectionSet = function(_, v43) --[[ Line: 82 ]] --[[ Name: SelectionSet ]]
            -- upvalues: v22 (ref), v39 (copy), v41 (copy), v40 (copy), l_Array_0 (ref), v34 (ref), l_GraphQLError_0 (ref)
            local v44 = v22(v39, v41, v40, v39:getParentType(), v43);
            for _, v46 in ipairs(v44) do
                local v47 = v46[1];
                local v48 = v47[1];
                local v49 = v47[2];
                local v50 = v46[2];
                local v51 = v46[3];
                local v55 = if l_Array_0.isArray(v49) then table.concat(l_Array_0.map(v49, function(v52) --[[ Line: 52 ]]
                    -- upvalues: v34 (ref)
                    local v53 = v52[1];
                    local v54 = v52[2];
                    return ("subfields \"%s\" conflict because "):format(v53) .. v34(v54);
                end), " and ") else v49;
                v39:reportError(l_GraphQLError_0.new(("Fields \"%s\" conflict because %s. Use different aliases on the fields to fetch both if this was intentional."):format(v48, v55), l_Array_0.concat(v50, v51)));
            end;
        end
    };
end;
v22 = function(v56, v57, v58, v59, v60) --[[ Line: 168 ]] --[[ Name: findConflictsWithinSelectionSet ]]
    -- upvalues: v27 (ref), v25 (ref), v23 (ref), v26 (ref)
    local v61 = {};
    local v62 = v27(v56, v57, v59, v60);
    local v63 = v62[1];
    local v64 = v62[2];
    v25(v56, v61, v57, v58, v63);
    if #v64 ~= 0 then
        for v65 = 1, #v64 do
            v23(v56, v61, v57, v58, false, v63, v64[v65]);
            for v66 = v65 + 1, #v64 do
                v26(v56, v61, v57, v58, false, v64[v65], v64[v66]);
            end;
        end;
    end;
    return v61;
end;
v23 = function(v67, v68, v69, v70, v71, v72, v73) --[[ Line: 230 ]] --[[ Name: collectConflictsBetweenFieldsAndFragment ]]
    -- upvalues: v28 (ref), v24 (ref), v23 (ref)
    local v74 = v67:getFragment(v73);
    if not v74 then
        return;
    else
        local v75 = v28(v67, v69, v74);
        local v76 = v75[1];
        local v77 = v75[2];
        if v72 == v76 then
            return;
        else
            v24(v67, v68, v69, v70, v71, v72, v76);
            for v78 = 1, #v77 do
                v23(v67, v68, v69, v70, v71, v72, v77[v78]);
            end;
            return;
        end;
    end;
end;
v26 = function(v79, v80, v81, v82, v83, v84, v85) --[[ Line: 285 ]] --[[ Name: collectConflictsBetweenFragments ]]
    -- upvalues: v28 (ref), v24 (ref), v26 (ref)
    if v84 == v85 then
        return;
    elseif v82:has(v84, v85, v83) then
        return;
    else
        v82:add(v84, v85, v83);
        local v86 = v79:getFragment(v84);
        local v87 = v79:getFragment(v85);
        if not v86 or not v87 then
            return;
        else
            local v88 = v28(v79, v81, v86);
            local v89 = v88[1];
            local v90 = v88[2];
            local v91 = v28(v79, v81, v87);
            local v92 = v91[1];
            local v93 = v91[2];
            v24(v79, v80, v81, v82, v83, v89, v92);
            for v94 = 1, #v93 do
                v26(v79, v80, v81, v82, v83, v84, v93[v94]);
            end;
            for v95 = 1, #v90 do
                v26(v79, v80, v81, v82, v83, v90[v95], v85);
            end;
            return;
        end;
    end;
end;
local function v115(v96, v97, v98, v99, v100, v101, v102, v103) --[[ Line: 370 ]] --[[ Name: findConflictsBetweenSubSelectionSets ]]
    -- upvalues: v27 (ref), v24 (ref), v23 (ref), v26 (ref)
    local v104 = {};
    local v105 = v27(v96, v97, v100, v101);
    local v106 = v105[1];
    local v107 = v105[2];
    local v108 = v27(v96, v97, v102, v103);
    local v109 = v108[1];
    local v110 = v108[2];
    v24(v96, v104, v97, v98, v99, v106, v109);
    if #v110 ~= 0 then
        for v111 = 1, #v110 do
            v23(v96, v104, v97, v98, v99, v106, v110[v111]);
        end;
    end;
    if #v107 ~= 0 then
        for v112 = 1, #v107 do
            v23(v96, v104, v97, v98, v99, v109, v107[v112]);
        end;
    end;
    for v113 = 1, #v107 do
        for v114 = 1, #v110 do
            v26(v96, v104, v97, v98, v99, v107[v113], v110[v114]);
        end;
    end;
    return v104;
end;
v25 = function(v116, v117, v118, v119, v120) --[[ Line: 461 ]] --[[ Name: collectConflictsWithin ]]
    -- upvalues: v29 (ref)
    for _, v122 in v120 do
        local v123 = v122[1];
        local v124 = v122[2];
        if #v124 > 1 then
            for v125 = 1, #v124 do
                for v126 = v125 + 1, #v124 do
                    local v127 = v29(v116, v118, v119, false, v123, v124[v125], v124[v126]);
                    if v127 then
                        table.insert(v117, v127);
                    end;
                end;
            end;
        end;
    end;
end;
v24 = function(v128, v129, v130, v131, v132, v133, v134) --[[ Line: 506 ]] --[[ Name: collectConflictsBetween ]]
    -- upvalues: v29 (ref)
    for _, v136 in ipairs(v133:keys()) do
        local v137 = v134[v136];
        if v137 then
            local v138 = v133[v136];
            for v139 = 1, #v138 do
                for v140 = 1, #v137 do
                    local v141 = v29(v128, v130, v131, v132, v136, v138[v139], v137[v140]);
                    if v141 then
                        table.insert(v129, v141);
                    end;
                end;
            end;
        end;
    end;
end;
v29 = function(v142, v143, v144, v145, v146, v147, v148) --[[ Line: 547 ]] --[[ Name: findConflict ]]
    -- upvalues: l_isObjectType_0 (copy), v30 (ref), v31 (ref), l_inspect_0 (copy), v115 (copy), l_getNamedType_0 (copy), v32 (ref)
    local v149 = v147[1];
    local v150 = v147[2];
    local v151 = v147[3];
    local v152 = v148[1];
    local v153 = v148[2];
    local v154 = v148[3];
    local v155 = v145 or v149 ~= v152 and l_isObjectType_0(v149) and l_isObjectType_0(v152);
    if not v155 then
        local l_value_0 = v150.name.value;
        local l_value_1 = v153.name.value;
        if l_value_0 ~= l_value_1 then
            return {
                {
                    v146, 
                    ("\"%s\" and \"%s\" are different fields"):format(l_value_0, l_value_1)
                }, 
                {
                    v150
                }, 
                {
                    v153
                }
            };
        else
            local v158 = v150.arguments or {};
            local v159 = v153.arguments or {};
            if not v30(v158, v159) then
                return {
                    {
                        v146, 
                        "they have differing arguments"
                    }, 
                    {
                        v150
                    }, 
                    {
                        v153
                    }
                };
            end;
        end;
    end;
    local v160 = v151 and v151.type;
    local v161 = v154 and v154.type;
    if v160 and v161 and v31(v160, v161) then
        return {
            {
                v146, 
                ("they return conflicting types \"%s\" and \"%s\""):format(l_inspect_0(v160), l_inspect_0(v161))
            }, 
            {
                v150
            }, 
            {
                v153
            }
        };
    else
        local l_selectionSet_0 = v150.selectionSet;
        local l_selectionSet_1 = v153.selectionSet;
        if l_selectionSet_0 and l_selectionSet_1 then
            local v164 = v115(v142, v143, v144, v155, l_getNamedType_0(v160), l_selectionSet_0, l_getNamedType_0(v161), l_selectionSet_1);
            return v32(v164, v146, v150, v153);
        else
            return nil;
        end;
    end;
end;
local v165 = nil;
local v166 = nil;
v30 = function(v167, v168) --[[ Line: 645 ]] --[[ Name: sameArguments ]]
    -- upvalues: l_Array_0 (copy), v165 (ref)
    if #v167 ~= #v168 then
        return false;
    else
        return l_Array_0.every(v167, function(v169) --[[ Line: 649 ]]
            -- upvalues: l_Array_0 (ref), v168 (copy), v165 (ref)
            local v171 = l_Array_0.find(v168, function(v170) --[[ Line: 650 ]]
                -- upvalues: v169 (copy)
                return v170.name.value == v169.name.value;
            end);
            if not v171 then
                return false;
            else
                return v165(v169.value, v171.value);
            end;
        end);
    end;
end;
v165 = function(v172, v173) --[[ Line: 660 ]] --[[ Name: sameValue ]]
    -- upvalues: l_print_0 (copy)
    return l_print_0(v172) == l_print_0(v173);
end;
v31 = function(v174, v175) --[[ Line: 667 ]] --[[ Name: doTypesConflict ]]
    -- upvalues: l_isListType_0 (copy), v31 (ref), l_isNonNullType_0 (copy), l_isLeafType_0 (copy)
    if l_isListType_0(v174) then
        if l_isListType_0(v175) then
            return v31(v174.ofType, v175.ofType);
        else
            return true;
        end;
    elseif l_isListType_0(v175) then
        return true;
    elseif l_isNonNullType_0(v174) then
        if l_isNonNullType_0(v175) then
            return v31(v174.ofType, v175.ofType);
        else
            return true;
        end;
    elseif l_isNonNullType_0(v175) then
        return true;
    elseif l_isLeafType_0(v174) or l_isLeafType_0(v175) then
        return v174 ~= v175;
    else
        return false;
    end;
end;
v27 = function(v176, v177, v178, v179) --[[ Line: 695 ]] --[[ Name: getFieldsAndFragmentNames ]]
    -- upvalues: l_Map_0 (copy), v166 (ref), l_Object_0 (copy)
    local v180 = v177[v179];
    if not v180 then
        local v181 = l_Map_0.new();
        local v182 = {};
        v166(v176, v178, v179, v181, v182);
        v180 = {
            v181, 
            l_Object_0.keys(v182)
        };
        v177[v179] = v180;
    end;
    return v180;
end;
v28 = function(v183, v184, v185) --[[ Line: 717 ]] --[[ Name: getReferencedFieldsAndFragmentNames ]]
    -- upvalues: l_typeFromAST_0 (copy), v27 (ref)
    local v186 = v184[v185.selectionSet];
    if v186 then
        return v186;
    else
        local v187 = l_typeFromAST_0(v183:getSchema(), v185.typeCondition);
        return v27(v183, v184, v187, v185.selectionSet);
    end;
end;
v166 = function(v188, v189, v190, v191, v192) --[[ Line: 733 ]] --[[ Name: _collectFieldsAndFragmentNames ]]
    -- upvalues: l_Kind_0 (copy), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), v6 (copy), l_typeFromAST_0 (copy), v166 (ref)
    for _, v194 in ipairs(v190.selections) do
        local l_kind_0 = v194.kind;
        if l_kind_0 == l_Kind_0.FIELD then
            local l_value_2 = v194.name.value;
            local v197 = nil;
            if l_isObjectType_0(v189) or l_isInterfaceType_0(v189) then
                v197 = v189:getFields():get(l_value_2);
            end;
            local v198 = if v194.alias then v194.alias.value else l_value_2;
            if not v191[v198] then
                v191[v198] = {};
            end;
            table.insert(v191[v198], {
                v189 or v6, 
                v194 or v6, 
                v197 or v6
            });
        elseif l_kind_0 == l_Kind_0.FRAGMENT_SPREAD then
            v192[v194.name.value] = true;
        elseif l_kind_0 == l_Kind_0.INLINE_FRAGMENT then
            local l_typeCondition_0 = v194.typeCondition;
            local l_v189_0 = v189;
            if l_typeCondition_0 then
                l_v189_0 = l_typeFromAST_0(v188:getSchema(), l_typeCondition_0);
            end;
            v166(v188, l_v189_0, v194.selectionSet, v191, v192);
        end;
    end;
end;
v32 = function(v201, v202, v203, v204) --[[ Line: 780 ]] --[[ Name: subfieldConflicts ]]
    -- upvalues: l_Array_0 (copy)
    if #v201 > 0 then
        return {
            {
                v202, 
                l_Array_0.map(v201, function(v205) --[[ Line: 785 ]]
                    return v205[1];
                end)
            }, 
            l_Array_0.reduce(v201, function(v206, v207) --[[ Line: 789 ]]
                -- upvalues: l_Array_0 (ref)
                local v208 = v207[2];
                return l_Array_0.concat(v206, v208);
            end, {
                v203
            }), 
            l_Array_0.reduce(v201, function(v209, v210) --[[ Line: 793 ]]
                -- upvalues: l_Array_0 (ref)
                local v211 = v210[3];
                return l_Array_0.concat(v209, v211);
            end, {
                v204
            })
        };
    else
        return nil;
    end;
end;
v33 = {};
local v212 = {
    __index = v33
};
v33.new = function() --[[ Line: 819 ]] --[[ Name: new ]]
    -- upvalues: v212 (copy)
    local v213 = setmetatable({}, v212);
    v213._data = {};
    return v213;
end;
v33.has = function(v214, v215, v216, v217) --[[ Line: 825 ]] --[[ Name: has ]]
    local v218 = v214._data[v215];
    local v219 = v218 and v218[v216];
    if v219 == nil then
        return false;
    elseif v217 == false then
        return v219 == false;
    else
        return true;
    end;
end;
v33.add = function(v220, v221, v222, v223) --[[ Line: 840 ]] --[[ Name: add ]]
    v220:_pairSetAdd(v221, v222, v223);
    v220:_pairSetAdd(v222, v221, v223);
end;
v33._pairSetAdd = function(v224, v225, v226, v227) --[[ Line: 845 ]] --[[ Name: _pairSetAdd ]]
    local v228 = v224._data[v225];
    if not v228 then
        v228 = {};
        v224._data[v225] = v228;
    end;
    v228[v226] = v227;
end;
return v21;