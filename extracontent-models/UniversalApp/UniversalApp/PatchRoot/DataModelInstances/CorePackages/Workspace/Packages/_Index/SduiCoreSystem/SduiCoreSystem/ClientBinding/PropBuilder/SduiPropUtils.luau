local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DataHydration);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.tutils);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinder);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v8 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v10 = require(l_script_FirstAncestor_0.SduiErrors);
local v11 = require(l_script_FirstAncestor_0.SduiLogger);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local v13 = require(l_script_FirstAncestor_0.ClientBinding.getSduiTokensStore);
local v14 = require(l_script_FirstAncestor_0.SduiParseHelpers);
local v15 = require(l_script_FirstAncestor_0.SduiParsers);
local l_PropResultCategory_0 = v8.PropResultCategory;
local l_DataStatus_0 = v2.DataHydrationTypes.DataStatus;
local l_FFlagSduiHydrationBindingResolution_0 = require(l_Parent_0.SharedFlags).FFlagSduiHydrationBindingResolution;
local l_FFlagSduiComponentFiltering_0 = require(l_Parent_0.SharedFlags).FFlagSduiComponentFiltering;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
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
    -- upvalues: v7 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v6 (copy), v33 (copy), l_FFlagSduiComponentFiltering_0 (copy), v14 (copy)
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
                -- upvalues: v38 (copy), v45 (ref), l_FFlagSduiComponentFiltering_0 (ref), v34 (copy)
                return v38(v45, if l_FFlagSduiComponentFiltering_0 then v34 else nil);
            end);
            if not l_status_0 then
                local v49 = v14.stringifyValue(l_result_0);
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
local function v84(v55, v56, v57, v58, v59, v60) --[[ Line: 191 ]] --[[ Name: generateDynamicBindingPropValue ]]
    -- upvalues: v3 (copy), l_FFlagSduiHydrationBindingResolution_0 (copy), v51 (copy), v7 (copy), v6 (copy), l_FFlagSduiComponentFiltering_0 (copy), v14 (copy), v11 (copy), v10 (copy), v21 (copy), v5 (copy)
    local v61 = string.split(v55, ".");
    if not v61 or #v61 == 0 then
        error((("Invalid bindingPath: %*"):format(v55)));
    end;
    return v3.createComputed(function(v62) --[[ Line: 204 ]]
        -- upvalues: l_FFlagSduiHydrationBindingResolution_0 (ref), v51 (ref), v61 (copy), v56 (copy), v58 (copy), v59 (copy), v60 (copy), v7 (ref), v55 (copy), v6 (ref), l_FFlagSduiComponentFiltering_0 (ref), v14 (ref), v11 (ref), v10 (ref), v57 (copy), v21 (ref)
        local v81, v82, v83 = pcall(function() --[[ Line: 205 ]]
            -- upvalues: l_FFlagSduiHydrationBindingResolution_0 (ref), v51 (ref), v62 (copy), v61 (ref), v56 (ref), v58 (ref), v59 (ref), v60 (ref), v7 (ref), v55 (ref), v6 (ref), l_FFlagSduiComponentFiltering_0 (ref), v14 (ref)
            local v63 = nil;
            local v64 = nil;
            if l_FFlagSduiHydrationBindingResolution_0 then
                local v65, v66 = v51(v62, v61, v56, v58, v59, v60);
                v63 = v65;
                v64 = v66;
            else
                local v67, v68 = v7(v58(v62), v61);
                if v67 and v68 ~= nil then
                    if v59 then
                        return v59(v68, v62);
                    else
                        return v68;
                    end;
                else
                    local v69 = v56(v62);
                    local v70 = v61[1];
                    local v71 = v69 and v69[v70];
                    if v71 == nil then
                        error((("Could not find data bindingSource source for key %* bindingPath: %*"):format(v70, v55)));
                    end;
                    local l_contentType_1 = v71.contentType;
                    local l_id_1 = v71.id;
                    if #v61 < 2 then
                        error((("Unsupported path for contentType %*"):format(l_contentType_1)));
                    end;
                    local v74 = v6.getDataObjectSignal(l_contentType_1, v61, l_id_1, v60);
                    if not v74 then
                        error((("No available data object for %* %* for id: %*"):format(l_contentType_1, v55, l_id_1)));
                    end;
                    local v75 = v74.data(v62);
                    v64 = v74.status(v62);
                    if v75 then
                        local v76, v77 = v7(v75, v61, 2);
                        if v76 then
                            v63 = v77;
                        end;
                    end;
                    if v59 and v63 ~= nil then
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 259 ]]
                            -- upvalues: v59 (ref), v63 (ref), l_FFlagSduiComponentFiltering_0 (ref), v62 (ref)
                            return v59(v63, if l_FFlagSduiComponentFiltering_0 then v62 else nil);
                        end);
                        if not l_status_1 then
                            local v80 = v14.stringifyValue(l_result_1);
                            error((("Parser failed for bindingPath: %*. err%*"):format(v55, v80)));
                        end;
                        v63 = l_result_1;
                    end;
                end;
            end;
            return v63, v64;
        end);
        if v81 then
            return {
                data = v82, 
                status = v83
            };
        else
            v11.reportError(v10.SduiErrorType.FailedToComputeDynamicBinding, {
                value = v55, 
                message = v14.stringifyValue(v82), 
                name = v57.debugName
            }, v57.appPage);
            return v21;
        end;
    end, v5.shallowEqual);
end;
local function v94(v85, v86, _) --[[ Line: 296 ]] --[[ Name: generateTokenBindingPropValue ]]
    -- upvalues: v3 (copy), v13 (copy), v7 (copy), v11 (copy), v10 (copy), v21 (copy), l_DataStatus_0 (copy), v5 (copy)
    local v88 = string.split(v85, ".");
    return v3.createComputed(function(v89) --[[ Line: 303 ]]
        -- upvalues: v13 (ref), v86 (copy), v7 (ref), v88 (copy), v11 (ref), v10 (ref), v21 (ref), l_DataStatus_0 (ref)
        local v90 = v13().getTokens(v89, v86.appPage);
        local v91, v92 = v7(v90, v88);
        if not v91 then
            local v93 = table.concat(v88, ".");
            v11.reportError(v10.SduiErrorType.TokenBindingFailed, {
                message = ("Could not find token with tokenPath %*"):format(v93), 
                name = v86.debugName
            }, v86.appPage);
            return v21;
        else
            return {
                data = v92, 
                status = l_DataStatus_0.Ready
            };
        end;
    end, v5.shallowEqual);
end;
local function v115(v95, v96, v97, v98, v99) --[[ Line: 344 ]] --[[ Name: generateFormatStringPropValue ]]
    -- upvalues: v84 (copy), v3 (copy), v11 (copy), v10 (copy), v21 (copy), v5 (copy)
    if typeof(v95) ~= "table" then
        error((("Unexpected type for stringFormat %*"):format((typeof(v95)))));
    end;
    local l_str_0 = v95.str;
    if not l_str_0 or l_str_0 == "" then
        error("No format string for prop");
    end;
    if not v95.args then
        error((("No args found for format. If no args needed, use literal. %*"):format(l_str_0)));
    end;
    local v101 = {};
    for v102, v103 in v95.args do
        local l_type_0 = v103.kind.type;
        local l_value_0 = v103.kind.value;
        if l_type_0 == "literal" then
            l_str_0 = l_str_0:gsub("{" .. v102 .. "}", (tostring(l_value_0)));
        elseif l_type_0 == "binding_path" then
            v101[v102] = v84(l_value_0, v96, v97, v98);
        else
            warn((("Unrecognized argType in buildFormatString %*"):format(l_type_0)));
        end;
    end;
    return v3.createComputed(function(v106) --[[ Line: 378 ]]
        -- upvalues: l_str_0 (ref), v101 (copy), v99 (copy), v11 (ref), v10 (ref), v97 (copy), v21 (ref)
        local l_l_str_0_0 = l_str_0;
        for v108, v109 in v101 do
            local v110 = v109(v106);
            local l_data_0 = v110.data;
            local l_status_2 = v110.status;
            if l_data_0 == nil then
                return {
                    status = l_status_2
                };
            else
                l_l_str_0_0 = l_l_str_0_0 and l_l_str_0_0:gsub("{" .. v108 .. "}", (tostring(l_data_0)));
            end;
        end;
        if v99 then
            local l_status_3, l_result_2 = pcall(function() --[[ Line: 394 ]]
                -- upvalues: v99 (ref), l_l_str_0_0 (ref)
                return v99(l_l_str_0_0);
            end);
            if not l_status_3 then
                v11.reportError(v10.SduiErrorType.FailedToParseProp, {
                    value = l_l_str_0_0, 
                    message = ("Parser in formatString for str %*"):format(l_str_0), 
                    name = v97.debugName
                }, v97.appPage);
                return v21;
            else
                return {
                    data = l_result_2
                };
            end;
        else
            return {
                data = l_l_str_0_0
            };
        end;
    end, v5.shallowEqual);
end;
local function v119(v116, v117, v118) --[[ Line: 421 ]] --[[ Name: validateNumbers ]]
    if typeof(v117) ~= "number" then
        v117 = tonumber(v117);
    end;
    if typeof(v118) ~= "number" then
        v118 = tonumber(v118);
    end;
    if typeof(v117) ~= "number" or typeof(v118) ~= "number" then
        error((("%* without numbers, %*: %*, %*: %*"):format(v116, v117, typeof(v117), v118, (typeof(v118)))));
    end;
    return v117, v118;
end;
local function v123(v120, v121) --[[ Line: 446 ]] --[[ Name: isSame ]]
    -- upvalues: v15 (copy)
    if v120 == v121 then
        return true;
    elseif v120 == nil then
        return false;
    else
        local v122 = typeof(v121);
        if typeof(v120) ~= v122 then
            if v122 == "string" then
                v120 = tostring(v120);
            elseif v122 == "number" then
                v120 = tonumber(v120);
            elseif v122 == "boolean" then
                v120 = v15.parseBooleanProp_(v120, nil, nil);
            end;
        end;
        return v120 == v121;
    end;
end;
local function v124(v125, v126, v127, v128, v129) --[[ Line: 485 ]] --[[ Name: evaluateCondition ]]
    -- upvalues: v51 (copy), l_DataStatus_0 (copy), v119 (copy), v123 (copy), v124 (copy)
    if v126 == nil then
        return true;
    else
        local v130 = v126 and v126.kind and v126.kind.type;
        local v131 = v126 and v126.kind and v126.kind.value;
        if v130 == nil then
            error("nil conditionType in condition");
        end;
        if v131 == nil then
            error("nil conditionValue in condition");
        end;
        local function _(v132) --[[ Line: 505 ]] --[[ Name: getFieldObject ]]
            -- upvalues: v51 (ref), v125 (copy), v127 (copy), v129 (copy)
            local v133 = string.split(v132, ".");
            local v134, v135, v136 = pcall(function() --[[ Line: 509 ]]
                -- upvalues: v51 (ref), v125 (ref), v133 (copy), v127 (ref), v129 (ref)
                return v51(v125, v133, v127, v129, nil, true);
            end);
            if v134 then
                return v135, v136;
            else
                return nil, v136;
            end;
        end;
        if v130 == "comparison" then
            local l_field_0 = v131.field;
            local v139 = string.split(l_field_0, ".");
            local l_v139_0 = v139 --[[ copy: 11 -> 16 ]];
            local v141, v142, v143 = pcall(function() --[[ Line: 509 ]]
                -- upvalues: v51 (ref), v125 (copy), l_v139_0 (copy), v127 (copy), v129 (copy)
                return v51(v125, l_v139_0, v127, v129, nil, true);
            end);
            local v144, v145;
            if v141 then
                v144 = v142;
                v145 = v143;
            else
                v144 = nil;
                v145 = v143;
            end;
            if v144 == nil or v145 and v145 ~= l_DataStatus_0.Ready then
                return nil, v145;
            else
                v139 = v131.kind.value;
                v141 = v131.op;
                if v141 == "OP_LT" then
                    v142, v143 = v119(v141, v144, v139);
                    return v142 < v143;
                elseif v141 == "OP_LTE" then
                    v142, v143 = v119(v141, v144, v139);
                    return v142 <= v143;
                elseif v141 == "OP_GT" then
                    v142, v143 = v119(v141, v144, v139);
                    return v143 < v142;
                elseif v141 == "OP_GTE" then
                    v142, v143 = v119(v141, v144, v139);
                    return v143 <= v142;
                elseif v141 == "OP_E" then
                    return (v123(v144, v139));
                elseif v141 == "OP_NE" then
                    return not v123(v144, v139);
                else
                    error((("Unknown operator for comparison %*"):format(v141)));
                end;
            end;
        elseif v130 == "is_null" then
            local l_field_1 = v131.field;
            local v147 = string.split(l_field_1, ".");
            local v148, v149, v150 = pcall(function() --[[ Line: 509 ]]
                -- upvalues: v51 (ref), v125 (copy), v147 (copy), v127 (copy), v129 (copy)
                return v51(v125, v147, v127, v129, nil, true);
            end);
            local v151, v152;
            if v148 then
                v152 = v149;
                v151 = v150;
            else
                v152 = nil;
                v151 = v150;
            end;
            if v151 and v151 ~= l_DataStatus_0.Ready then
                return nil, v151;
            else
                return v152 == nil;
            end;
        elseif v130 == "is_not_null" then
            local l_field_2 = v131.field;
            local v154 = string.split(l_field_2, ".");
            local v155, v156, v157 = pcall(function() --[[ Line: 509 ]]
                -- upvalues: v51 (ref), v125 (copy), v154 (copy), v127 (copy), v129 (copy)
                return v51(v125, v154, v127, v129, nil, true);
            end);
            local v158, v159;
            if v155 then
                v159 = v156;
                v158 = v157;
            else
                v159 = nil;
                v158 = v157;
            end;
            if v158 and v158 ~= l_DataStatus_0.Ready then
                return nil, v158;
            else
                return v159 ~= nil;
            end;
        elseif v130 == "and_condition" then
            for _, v161 in v131.conditions do
                local v162, v163 = v124(v125, v161, v127, v128, v129);
                if v163 and v163 ~= l_DataStatus_0.Ready then
                    return v162, v163;
                elseif not v162 then
                    return v162;
                end;
            end;
            return true;
        elseif v130 == "or_condition" then
            for _, v165 in v131.conditions do
                local v166, v167 = v124(v125, v165, v127, v128, v129);
                if v167 and v167 ~= l_DataStatus_0.Ready then
                    return v166, v167;
                elseif v166 or v166 == nil then
                    return v166, v167;
                end;
            end;
            return false;
        end;
        return nil;
    end;
end;
local function v177(v168, v169, v170, v171, v172) --[[ Line: 608 ]] --[[ Name: selectConditionalOption ]]
    -- upvalues: v124 (copy), l_DataStatus_0 (copy)
    for _, v174 in v169 do
        local v175, v176 = v124(v168, v174.condition, v170, v171, v172);
        if v175 then
            return v174, v176;
        elseif v176 and v176 ~= l_DataStatus_0.Ready then
            return v175, v176;
        end;
    end;
    return nil;
end;
local function v198(v178, v179, v180, v181, v182, v183, v184, v185) --[[ Line: 644 ]] --[[ Name: generateConditionalPropValue ]]
    -- upvalues: v3 (copy), v177 (copy), l_PropResultCategory_0 (copy), l_DataStatus_0 (copy), v11 (copy), v10 (copy), v14 (copy), v21 (copy), v5 (copy)
    local l_options_0 = v178.options;
    return v3.createComputed(function(v187) --[[ Line: 656 ]]
        -- upvalues: v177 (ref), l_options_0 (copy), v179 (copy), v180 (copy), v182 (copy), v183 (copy), v181 (copy), v184 (copy), l_PropResultCategory_0 (ref), l_DataStatus_0 (ref), v185 (copy), v11 (ref), v10 (ref), v14 (ref), v21 (ref)
        local v195, v196, v197 = pcall(function() --[[ Line: 657 ]]
            -- upvalues: v177 (ref), v187 (copy), l_options_0 (ref), v179 (ref), v180 (ref), v182 (ref), v183 (ref), v181 (ref), v184 (ref), l_PropResultCategory_0 (ref), l_DataStatus_0 (ref)
            local v188, v189 = v177(v187, l_options_0, v179, v180, v182);
            if v188 == nil then
                return nil, v189;
            else
                local v190 = v188 and v188.kind and v188.kind.type;
                local v191 = v188 and v188.kind and v188.kind.value;
                local v192, v193 = v183(v190, v191, v179, v182, v180, v181, v184);
                if v193 == l_PropResultCategory_0.PropSignal then
                    local v194 = v192(v187);
                    v192 = v194.data;
                    if v194.status and v194.status ~= l_DataStatus_0.Ready then
                        v189 = v194.status;
                    end;
                end;
                return v192, v189;
            end;
        end);
        if v195 then
            return {
                data = v196, 
                status = v197, 
                isNestedComponentConfig = v185
            };
        else
            v11.reportError(v10.SduiErrorType.FailedToEvaluateConditionalProp, {
                message = v14.stringifyValue(v196), 
                name = v180.debugName
            }, v180.appPage);
            return v21;
        end;
    end, v5.shallowEqual);
end;
local function v213(v199, v200, v201, v202, _, _, _, _, _) --[[ Line: 704 ]] --[[ Name: resolveTablePropValue ]]
    -- upvalues: v4 (copy), l_DataStatus_0 (copy)
    local v208 = v4.Dictionary.join(v202 or {}, v200 or {});
    local v209 = nil;
    if v201 then
        for v210, v211 in v201 do
            v208[v210] = v211(v199).data;
            local l_status_4 = v211(v199).status;
            if l_status_4 and l_status_4 ~= l_DataStatus_0.Ready then
                v209 = l_status_4;
            end;
        end;
    end;
    return v208, v209;
end;
return {
    generateStaticPropValue = v54, 
    generateDynamicBindingPropValue = v84, 
    generateTokenBindingPropValue = v94, 
    generateFormatStringPropValue = v115, 
    generateConditionalPropValue = v198, 
    generateTablePropSignalValue = function(v214, v215, v216, v217, v218, v219, _) --[[ Line: 732 ]] --[[ Name: generateTablePropSignalValue ]]
        -- upvalues: v3 (copy), v213 (copy), v11 (copy), v10 (copy), v14 (copy), v21 (copy), v5 (copy)
        local v221, v222, v223 = v219(v214, v215, v218, v216, v217);
        return v3.createComputed(function(v224) --[[ Line: 748 ]]
            -- upvalues: v213 (ref), v221 (copy), v222 (copy), v223 (copy), v215 (copy), v216 (copy), v217 (copy), v218 (copy), v219 (copy), v11 (ref), v10 (ref), v14 (ref), v21 (ref)
            local v227, v228, v229 = pcall(function() --[[ Line: 749 ]]
                -- upvalues: v213 (ref), v224 (copy), v221 (ref), v222 (ref), v223 (ref), v215 (ref), v216 (ref), v217 (ref), v218 (ref), v219 (ref)
                local v225, v226 = v213(v224, v221, v222, v223, v215, v216, v217, v218, v219);
                return v225, v226;
            end);
            if v227 then
                return {
                    data = v228, 
                    status = v229
                };
            else
                v11.reportError(v10.SduiErrorType.FailedToParseProp, {
                    message = v14.stringifyValue(v228), 
                    name = v216.debugName
                }, v216.appPage);
                return v21;
            end;
        end, v5.shallowEqual);
    end, 
    selectConditionalOption = v177, 
    evaluateCondition = v124, 
    resolveHydrationBinding = if l_FFlagSduiHydrationBindingResolution_0 then v33 else nil, 
    resolveBindingPathValue = if l_FFlagSduiHydrationBindingResolution_0 then v51 else nil, 
    resolveTablePropValue = v213
};