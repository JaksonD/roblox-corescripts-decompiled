local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DataHydration);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.tutils);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinder);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v8 = require(l_script_FirstAncestor_0.ClientBinding.buildDataBindingSourcesForTemplate);
local v9 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v11 = require(l_script_FirstAncestor_0.SduiErrors);
local v12 = require(l_script_FirstAncestor_0.SduiLogger);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local v14 = require(l_script_FirstAncestor_0.ClientBinding.getSduiTokensStore);
local v15 = require(l_script_FirstAncestor_0.SduiParseHelpers);
local v16 = require(l_script_FirstAncestor_0.SduiParsers);
local l_PropResultCategory_0 = v9.PropResultCategory;
local l_DataStatus_0 = v2.DataHydrationTypes.DataStatus;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiLocalizedLiterals_0 = require(l_Parent_0.SharedFlags).FFlagSduiLocalizedLiterals;
local v21 = table.freeze({
    status = l_DataStatus_0.Failed
});
local function v33(v22, v23, v24, v25) --[[ Line: 65 ]] --[[ Name: resolveHydrationBinding ]]
    -- upvalues: v6 (copy)
    local v26 = table.concat(v22, ".");
    local v27 = v22[1];
    local v28 = v23 and v23[v27];
    if v28 == nil then
        error((("Could not find data bindingSource for key %*, bindingPath: %*"):format(v27, v26)));
    end;
    local l_contentType_0 = v28.contentType;
    local l_id_0 = v28.id;
    if #v22 < 2 then
        error((("Unsupported path for contentType %*, bindingPath: %*"):format(l_contentType_0, v26)));
    end;
    local v31, v32 = v6.getFieldValue(l_contentType_0, v22, l_id_0, v24, v25);
    return v31, v32;
end;
local function v51(v34, v35, v36, v37, v38, v39) --[[ Line: 109 ]] --[[ Name: resolveBindingPathValue ]]
    -- upvalues: v7 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v6 (copy), v33 (copy), v15 (copy)
    local v40, v41 = v7(v37(v34), v35);
    if v40 and v41 ~= nil then
        if v38 then
            return v38(v41, v34);
        else
            return v41;
        end;
    else
        if l_FFlagSduiCoreBadgeDetailsSupport_0 then
            local v42 = v35 and v35[1];
            if v6.isClientContentType(v42) then
                local v43 = v6.getFieldValueForClientContentType(v42, v35, v34);
                if v38 and v43 ~= nil then
                    return v38(v43, v34);
                else
                    return v43;
                end;
            end;
        end;
        local v44 = v36(v34);
        local v45, v46 = v33(v35, v44, v34, v39);
        if v38 and v45 ~= nil then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 146 ]]
                -- upvalues: v38 (copy), v45 (ref), v34 (copy)
                return v38(v45, v34);
            end);
            if not l_status_0 then
                local v49 = v15.stringifyValue(l_result_0);
                local v50 = table.concat(v35, ".");
                error((("Parser failed for bindingPath: %*. err%*"):format(v50, v49)));
            end;
            v45 = l_result_0;
        end;
        return v45, v46;
    end;
end;
local function v54(v52, v53) --[[ Line: 167 ]] --[[ Name: generateStaticPropValue ]]
    if v53 then
        return v53(v52);
    else
        return v52;
    end;
end;
local function v68(v55, v56, v57, v58, v59, v60) --[[ Line: 191 ]] --[[ Name: generateDynamicBindingPropValue ]]
    -- upvalues: v3 (copy), v51 (copy), v12 (copy), v11 (copy), v15 (copy), v21 (copy), v5 (copy)
    local v61 = string.split(v55, ".");
    if not v61 or #v61 == 0 then
        error((("Invalid bindingPath: %*"):format(v55)));
    end;
    return v3.createComputed(function(v62) --[[ Line: 204 ]]
        -- upvalues: v51 (ref), v61 (copy), v56 (copy), v58 (copy), v59 (copy), v60 (copy), v12 (ref), v11 (ref), v55 (copy), v15 (ref), v57 (copy), v21 (ref)
        local v65, v66, v67 = pcall(function() --[[ Line: 205 ]]
            -- upvalues: v51 (ref), v62 (copy), v61 (ref), v56 (ref), v58 (ref), v59 (ref), v60 (ref)
            local v63, v64 = v51(v62, v61, v56, v58, v59, v60);
            return v63, v64;
        end);
        if v65 then
            return {
                data = v66, 
                status = v67
            };
        else
            v12.reportError(v11.SduiErrorType.FailedToComputeDynamicBinding, {
                value = v55, 
                message = v15.stringifyValue(v66), 
                name = v57.debugName
            }, v57.appPage);
            return v21;
        end;
    end, v5.shallowEqual);
end;
local function v78(v69, v70, _) --[[ Line: 241 ]] --[[ Name: generateTokenBindingPropValue ]]
    -- upvalues: v3 (copy), v14 (copy), v7 (copy), v12 (copy), v11 (copy), v21 (copy), l_DataStatus_0 (copy), v5 (copy)
    local v72 = string.split(v69, ".");
    return v3.createComputed(function(v73) --[[ Line: 248 ]]
        -- upvalues: v14 (ref), v70 (copy), v7 (ref), v72 (copy), v12 (ref), v11 (ref), v21 (ref), l_DataStatus_0 (ref)
        local v74 = v14().getTokens(v73, v70.appPage);
        local v75, v76 = v7(v74, v72);
        if not v75 then
            local v77 = table.concat(v72, ".");
            v12.reportError(v11.SduiErrorType.TokenBindingFailed, {
                message = ("Could not find token with tokenPath %*"):format(v77), 
                name = v70.debugName
            }, v70.appPage);
            return v21;
        else
            return {
                data = v76, 
                status = l_DataStatus_0.Ready
            };
        end;
    end, v5.shallowEqual);
end;
local function v99(v79, v80, v81, v82, v83) --[[ Line: 289 ]] --[[ Name: generateFormatStringPropValue ]]
    -- upvalues: l_FFlagSduiLocalizedLiterals_0 (copy), v68 (copy), v3 (copy), v12 (copy), v11 (copy), v21 (copy), v5 (copy)
    if typeof(v79) ~= "table" then
        error((("Unexpected type for stringFormat %*"):format((typeof(v79)))));
    end;
    local l_str_0 = v79.str;
    if l_FFlagSduiLocalizedLiterals_0 and (not l_str_0 or l_str_0 == "") and v79.translation then
        l_str_0 = v81.resolveLocalizedLiteral(v79.translation);
    end;
    if not l_str_0 or l_str_0 == "" then
        error("No format string for prop");
    end;
    if not v79.args then
        error((("No args found for format. If no args needed, use literal. %*"):format(l_str_0)));
    end;
    local v85 = {};
    for v86, v87 in v79.args do
        local l_type_0 = v87.kind.type;
        local l_value_0 = v87.kind.value;
        if l_type_0 == "literal" then
            l_str_0 = l_str_0:gsub("{" .. v86 .. "}", (tostring(l_value_0)));
        elseif l_type_0 == "binding_path" then
            v85[v86] = v68(l_value_0, v80, v81, v82);
        else
            warn((("Unrecognized argType in buildFormatString %*"):format(l_type_0)));
        end;
    end;
    return v3.createComputed(function(v90) --[[ Line: 329 ]]
        -- upvalues: l_str_0 (ref), v85 (copy), v83 (copy), v12 (ref), v11 (ref), v81 (copy), v21 (ref)
        local l_l_str_0_0 = l_str_0;
        for v92, v93 in v85 do
            local v94 = v93(v90);
            local l_data_0 = v94.data;
            local l_status_1 = v94.status;
            if l_data_0 == nil then
                return {
                    status = l_status_1
                };
            else
                l_l_str_0_0 = l_l_str_0_0 and l_l_str_0_0:gsub("{" .. v92 .. "}", (tostring(l_data_0)));
            end;
        end;
        if v83 then
            local l_status_2, l_result_1 = pcall(function() --[[ Line: 345 ]]
                -- upvalues: v83 (ref), l_l_str_0_0 (ref)
                return v83(l_l_str_0_0);
            end);
            if not l_status_2 then
                v12.reportError(v11.SduiErrorType.FailedToParseProp, {
                    value = l_l_str_0_0, 
                    message = ("Parser in formatString for str %*"):format(l_str_0), 
                    name = v81.debugName
                }, v81.appPage);
                return v21;
            else
                return {
                    data = l_result_1
                };
            end;
        else
            return {
                data = l_l_str_0_0
            };
        end;
    end, v5.shallowEqual);
end;
local function v103(v100, v101, v102) --[[ Line: 372 ]] --[[ Name: validateNumbers ]]
    if typeof(v101) ~= "number" then
        v101 = tonumber(v101);
    end;
    if typeof(v102) ~= "number" then
        v102 = tonumber(v102);
    end;
    if typeof(v101) ~= "number" or typeof(v102) ~= "number" then
        error((("%* without numbers, %*: %*, %*: %*"):format(v100, v101, typeof(v101), v102, (typeof(v102)))));
    end;
    return v101, v102;
end;
local function v107(v104, v105) --[[ Line: 397 ]] --[[ Name: isSame ]]
    -- upvalues: v16 (copy)
    if v104 == v105 then
        return true;
    elseif v104 == nil then
        return false;
    else
        local v106 = typeof(v105);
        if typeof(v104) ~= v106 then
            if v106 == "string" then
                v104 = tostring(v104);
            elseif v106 == "number" then
                v104 = tonumber(v104);
            elseif v106 == "boolean" then
                v104 = v16.parseBooleanProp_(v104, nil, nil);
            end;
        end;
        return v104 == v105;
    end;
end;
local function v108(v109, v110, v111, v112, v113) --[[ Line: 436 ]] --[[ Name: evaluateCondition ]]
    -- upvalues: v51 (copy), l_DataStatus_0 (copy), v103 (copy), v107 (copy), v108 (copy)
    if v110 == nil then
        return true;
    else
        local v114 = v110 and v110.kind and v110.kind.type;
        local v115 = v110 and v110.kind and v110.kind.value;
        if v114 == nil then
            error("nil conditionType in condition");
        end;
        if v115 == nil then
            error("nil conditionValue in condition");
        end;
        local function _(v116) --[[ Line: 456 ]] --[[ Name: getFieldObject ]]
            -- upvalues: v51 (ref), v109 (copy), v111 (copy), v113 (copy)
            local v117 = string.split(v116, ".");
            local v118, v119, v120 = pcall(function() --[[ Line: 460 ]]
                -- upvalues: v51 (ref), v109 (ref), v117 (copy), v111 (ref), v113 (ref)
                return v51(v109, v117, v111, v113, nil, true);
            end);
            if v118 then
                return v119, v120;
            else
                return nil, v120;
            end;
        end;
        if v114 == "comparison" then
            local l_field_0 = v115.field;
            local v123 = string.split(l_field_0, ".");
            local l_v123_0 = v123 --[[ copy: 11 -> 16 ]];
            local v125, v126, v127 = pcall(function() --[[ Line: 460 ]]
                -- upvalues: v51 (ref), v109 (copy), l_v123_0 (copy), v111 (copy), v113 (copy)
                return v51(v109, l_v123_0, v111, v113, nil, true);
            end);
            local v128, v129;
            if v125 then
                v128 = v126;
                v129 = v127;
            else
                v128 = nil;
                v129 = v127;
            end;
            if v128 == nil or v129 and v129 ~= l_DataStatus_0.Ready then
                return nil, v129;
            else
                v123 = v115.kind.value;
                v125 = v115.op;
                if v125 == "OP_LT" then
                    v126, v127 = v103(v125, v128, v123);
                    return v126 < v127;
                elseif v125 == "OP_LTE" then
                    v126, v127 = v103(v125, v128, v123);
                    return v126 <= v127;
                elseif v125 == "OP_GT" then
                    v126, v127 = v103(v125, v128, v123);
                    return v127 < v126;
                elseif v125 == "OP_GTE" then
                    v126, v127 = v103(v125, v128, v123);
                    return v127 <= v126;
                elseif v125 == "OP_E" then
                    return (v107(v128, v123));
                elseif v125 == "OP_NE" then
                    return not v107(v128, v123);
                else
                    error((("Unknown operator for comparison %*"):format(v125)));
                end;
            end;
        elseif v114 == "is_null" then
            local l_field_1 = v115.field;
            local v131 = string.split(l_field_1, ".");
            local v132, v133, v134 = pcall(function() --[[ Line: 460 ]]
                -- upvalues: v51 (ref), v109 (copy), v131 (copy), v111 (copy), v113 (copy)
                return v51(v109, v131, v111, v113, nil, true);
            end);
            local v135, v136;
            if v132 then
                v136 = v133;
                v135 = v134;
            else
                v136 = nil;
                v135 = v134;
            end;
            if v135 and v135 ~= l_DataStatus_0.Ready then
                return nil, v135;
            else
                return v136 == nil;
            end;
        elseif v114 == "is_not_null" then
            local l_field_2 = v115.field;
            local v138 = string.split(l_field_2, ".");
            local v139, v140, v141 = pcall(function() --[[ Line: 460 ]]
                -- upvalues: v51 (ref), v109 (copy), v138 (copy), v111 (copy), v113 (copy)
                return v51(v109, v138, v111, v113, nil, true);
            end);
            local v142, v143;
            if v139 then
                v143 = v140;
                v142 = v141;
            else
                v143 = nil;
                v142 = v141;
            end;
            if v142 and v142 ~= l_DataStatus_0.Ready then
                return nil, v142;
            else
                return v143 ~= nil;
            end;
        elseif v114 == "and_condition" then
            for _, v145 in v115.conditions do
                local v146, v147 = v108(v109, v145, v111, v112, v113);
                if v147 and v147 ~= l_DataStatus_0.Ready then
                    return v146, v147;
                elseif not v146 then
                    return v146;
                end;
            end;
            return true;
        elseif v114 == "or_condition" then
            for _, v149 in v115.conditions do
                local v150, v151 = v108(v109, v149, v111, v112, v113);
                if v151 and v151 ~= l_DataStatus_0.Ready then
                    return v150, v151;
                elseif v150 or v150 == nil then
                    return v150, v151;
                end;
            end;
            return false;
        end;
        return nil;
    end;
end;
local function v161(v152, v153, v154, v155, v156) --[[ Line: 559 ]] --[[ Name: selectConditionalOption ]]
    -- upvalues: v108 (copy), l_DataStatus_0 (copy)
    for _, v158 in v153 do
        local v159, v160 = v108(v152, v158.condition, v154, v155, v156);
        if v159 then
            return v158, v160;
        elseif v160 and v160 ~= l_DataStatus_0.Ready then
            return v159, v160;
        end;
    end;
    return nil;
end;
local function v182(v162, v163, v164, v165, v166, v167, v168, v169) --[[ Line: 595 ]] --[[ Name: generateConditionalPropValue ]]
    -- upvalues: v3 (copy), v161 (copy), l_PropResultCategory_0 (copy), l_DataStatus_0 (copy), v12 (copy), v11 (copy), v15 (copy), v21 (copy), v5 (copy)
    local l_options_0 = v162.options;
    return v3.createComputed(function(v171) --[[ Line: 607 ]]
        -- upvalues: v161 (ref), l_options_0 (copy), v163 (copy), v164 (copy), v166 (copy), v167 (copy), v165 (copy), v168 (copy), l_PropResultCategory_0 (ref), l_DataStatus_0 (ref), v169 (copy), v12 (ref), v11 (ref), v15 (ref), v21 (ref)
        local v179, v180, v181 = pcall(function() --[[ Line: 608 ]]
            -- upvalues: v161 (ref), v171 (copy), l_options_0 (ref), v163 (ref), v164 (ref), v166 (ref), v167 (ref), v165 (ref), v168 (ref), l_PropResultCategory_0 (ref), l_DataStatus_0 (ref)
            local v172, v173 = v161(v171, l_options_0, v163, v164, v166);
            if v172 == nil then
                return nil, v173;
            else
                local v174 = v172 and v172.kind and v172.kind.type;
                local v175 = v172 and v172.kind and v172.kind.value;
                local v176, v177 = v167(v174, v175, v163, v166, v164, v165, v168);
                if v177 == l_PropResultCategory_0.PropSignal then
                    local v178 = v176(v171);
                    v176 = v178.data;
                    if v178.status and v178.status ~= l_DataStatus_0.Ready then
                        v173 = v178.status;
                    end;
                end;
                return v176, v173;
            end;
        end);
        if v179 then
            return {
                data = v180, 
                status = v181, 
                isNestedComponentConfig = v169
            };
        else
            v12.reportError(v11.SduiErrorType.FailedToEvaluateConditionalProp, {
                message = v15.stringifyValue(v180), 
                name = v164.debugName
            }, v164.appPage);
            return v21;
        end;
    end, v5.shallowEqual);
end;
local function v197(v183, v184, v185, v186, _, _, _, _, _) --[[ Line: 655 ]] --[[ Name: resolveTablePropValue ]]
    -- upvalues: v4 (copy), l_DataStatus_0 (copy)
    local v192 = v4.Dictionary.join(v186 or {}, v184 or {});
    local v193 = nil;
    if v185 then
        for v194, v195 in v185 do
            v192[v194] = v195(v183).data;
            local l_status_3 = v195(v183).status;
            if l_status_3 and l_status_3 ~= l_DataStatus_0.Ready then
                v193 = l_status_3;
            end;
        end;
    end;
    return v192, v193;
end;
return {
    generateStaticPropValue = v54, 
    generateDynamicBindingPropValue = v68, 
    generateTokenBindingPropValue = v78, 
    generateFormatStringPropValue = v99, 
    generateConditionalPropValue = v182, 
    generateTablePropSignalValue = function(v198, v199, v200, v201, v202, v203, _) --[[ Line: 683 ]] --[[ Name: generateTablePropSignalValue ]]
        -- upvalues: v3 (copy), v197 (copy), v12 (copy), v11 (copy), v15 (copy), v21 (copy), v5 (copy)
        local v205, v206, v207 = v203(v198, v199, v202, v200, v201);
        return v3.createComputed(function(v208) --[[ Line: 699 ]]
            -- upvalues: v197 (ref), v205 (copy), v206 (copy), v207 (copy), v199 (copy), v200 (copy), v201 (copy), v202 (copy), v203 (copy), v12 (ref), v11 (ref), v15 (ref), v21 (ref)
            local v211, v212, v213 = pcall(function() --[[ Line: 700 ]]
                -- upvalues: v197 (ref), v208 (copy), v205 (ref), v206 (ref), v207 (ref), v199 (ref), v200 (ref), v201 (ref), v202 (ref), v203 (ref)
                local v209, v210 = v197(v208, v205, v206, v207, v199, v200, v201, v202, v203);
                return v209, v210;
            end);
            if v211 then
                return {
                    data = v212, 
                    status = v213
                };
            else
                v12.reportError(v11.SduiErrorType.FailedToParseProp, {
                    message = v15.stringifyValue(v212), 
                    name = v200.debugName
                }, v200.appPage);
                return v21;
            end;
        end, v5.shallowEqual);
    end, 
    selectConditionalOption = v161, 
    evaluateCondition = v108, 
    resolveHydrationBinding = v33, 
    resolveBindingPathValue = v51, 
    resolveTablePropValue = v197, 
    resolveSourceArray = function(v214, v215, v216, v217, v218) --[[ Line: 741 ]] --[[ Name: resolveSourceArray ]]
        -- upvalues: v51 (copy)
        if v214 == "binding_path" then
            local v219 = string.split(v215, ".");
            return v51(v216, v219, v217, v218);
        elseif v214 == "literal" then
            return v215 and v215.items;
        else
            return nil;
        end;
    end, 
    resolveFieldMap = function(v220, v221, v222, v223, v224, v225, v226) --[[ Line: 773 ]] --[[ Name: resolveFieldMap ]]
        -- upvalues: v197 (copy)
        local v227, v228 = v226(v220, v221, v222, v223, v224);
        return v197(v225, v227, v228, nil, v221, v223, v224, v222, nil);
    end, 
    mapArrayWithFieldMap = function(v229, v230, v231, v232, v233, v234, v235) --[[ Line: 813 ]] --[[ Name: mapArrayWithFieldMap ]]
        -- upvalues: v8 (copy), v197 (copy)
        local v236 = {};
        for _, v238 in v229 do
            local v239 = v8(v238, v230);
            local function v240() --[[ Line: 825 ]]
                -- upvalues: v239 (copy)
                return v239;
            end;
            local function v241() --[[ Line: 828 ]]
                -- upvalues: v238 (copy)
                return v238;
            end;
            local v242, v243 = v235(v231, v240, v241, v232, v233);
            table.insert(v236, (v197(v234, v242, v243, nil, v240, v232, v233, v241, nil)));
        end;
        return v236;
    end, 
    isComponentVisible = function(v244, v245) --[[ Line: 845 ]] --[[ Name: isComponentVisible ]]
        if v244.isComponentFilteredSignal == nil then
            return true;
        else
            return v244.isComponentFilteredSignal(v245).data ~= true;
        end;
    end, 
    resolveTemplate = function(v246, v247) --[[ Line: 852 ]] --[[ Name: resolveTemplate ]]
        if v246 == nil then
            error("Missing roblox_component");
        end;
        local v248 = v247.getTemplateForRobloxComponent(v246);
        if v248 == nil then
            error((("Could not find template for roblox_component %*"):format(v246)));
        end;
        return v248;
    end
};