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
local l_FFlagSduiComponentFiltering_0 = require(l_Parent_0.SharedFlags).FFlagSduiComponentFiltering;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local v20 = table.freeze({
    status = l_DataStatus_0.Failed
});
local function v32(v21, v22, v23, v24) --[[ Line: 64 ]] --[[ Name: resolveHydrationBinding ]]
    -- upvalues: v6 (copy)
    local v25 = table.concat(v21, ".");
    local v26 = v21[1];
    local v27 = v22 and v22[v26];
    if v27 == nil then
        error((("Could not find data bindingSource for key %*, bindingPath: %*"):format(v26, v25)));
    end;
    local l_contentType_0 = v27.contentType;
    local l_id_0 = v27.id;
    if #v21 < 2 then
        error((("Unsupported path for contentType %*, bindingPath: %*"):format(l_contentType_0, v25)));
    end;
    local v30, v31 = v6.getFieldValue(l_contentType_0, v21, l_id_0, v23, v24);
    return v30, v31;
end;
local function v50(v33, v34, v35, v36, v37, v38) --[[ Line: 108 ]] --[[ Name: resolveBindingPathValue ]]
    -- upvalues: v7 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v6 (copy), v32 (copy), l_FFlagSduiComponentFiltering_0 (copy), v14 (copy)
    local v39, v40 = v7(v36(v33), v34);
    if v39 and v40 ~= nil then
        if v37 then
            return v37(v40, v33);
        else
            return v40;
        end;
    else
        if l_FFlagSduiCoreBadgeDetailsSupport_0 then
            local v41 = v34 and v34[1];
            if v6.isClientContentType(v41) then
                local v42 = v6.getFieldValueForClientContentType(v41, v34, v33);
                if v37 and v42 ~= nil then
                    return v37(v42, v33);
                else
                    return v42;
                end;
            end;
        end;
        local v43 = v35(v33);
        local v44, v45 = v32(v34, v43, v33, v38);
        if v37 and v44 ~= nil then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 145 ]]
                -- upvalues: v37 (copy), v44 (ref), l_FFlagSduiComponentFiltering_0 (ref), v33 (copy)
                return v37(v44, if l_FFlagSduiComponentFiltering_0 then v33 else nil);
            end);
            if not l_status_0 then
                local v48 = v14.stringifyValue(l_result_0);
                local v49 = table.concat(v34, ".");
                error((("Parser failed for bindingPath: %*. err%*"):format(v49, v48)));
            end;
            v44 = l_result_0;
        end;
        return v44, v45;
    end;
end;
local function v53(v51, v52) --[[ Line: 166 ]] --[[ Name: generateStaticPropValue ]]
    if v52 then
        return v52(v51);
    else
        return v51;
    end;
end;
local function v67(v54, v55, v56, v57, v58, v59) --[[ Line: 190 ]] --[[ Name: generateDynamicBindingPropValue ]]
    -- upvalues: v3 (copy), v50 (copy), v11 (copy), v10 (copy), v14 (copy), v20 (copy), v5 (copy)
    local v60 = string.split(v54, ".");
    if not v60 or #v60 == 0 then
        error((("Invalid bindingPath: %*"):format(v54)));
    end;
    return v3.createComputed(function(v61) --[[ Line: 203 ]]
        -- upvalues: v50 (ref), v60 (copy), v55 (copy), v57 (copy), v58 (copy), v59 (copy), v11 (ref), v10 (ref), v54 (copy), v14 (ref), v56 (copy), v20 (ref)
        local v64, v65, v66 = pcall(function() --[[ Line: 204 ]]
            -- upvalues: v50 (ref), v61 (copy), v60 (ref), v55 (ref), v57 (ref), v58 (ref), v59 (ref)
            local v62, v63 = v50(v61, v60, v55, v57, v58, v59);
            return v62, v63;
        end);
        if v64 then
            return {
                data = v65, 
                status = v66
            };
        else
            v11.reportError(v10.SduiErrorType.FailedToComputeDynamicBinding, {
                value = v54, 
                message = v14.stringifyValue(v65), 
                name = v56.debugName
            }, v56.appPage);
            return v20;
        end;
    end, v5.shallowEqual);
end;
local function v77(v68, v69, _) --[[ Line: 240 ]] --[[ Name: generateTokenBindingPropValue ]]
    -- upvalues: v3 (copy), v13 (copy), v7 (copy), v11 (copy), v10 (copy), v20 (copy), l_DataStatus_0 (copy), v5 (copy)
    local v71 = string.split(v68, ".");
    return v3.createComputed(function(v72) --[[ Line: 247 ]]
        -- upvalues: v13 (ref), v69 (copy), v7 (ref), v71 (copy), v11 (ref), v10 (ref), v20 (ref), l_DataStatus_0 (ref)
        local v73 = v13().getTokens(v72, v69.appPage);
        local v74, v75 = v7(v73, v71);
        if not v74 then
            local v76 = table.concat(v71, ".");
            v11.reportError(v10.SduiErrorType.TokenBindingFailed, {
                message = ("Could not find token with tokenPath %*"):format(v76), 
                name = v69.debugName
            }, v69.appPage);
            return v20;
        else
            return {
                data = v75, 
                status = l_DataStatus_0.Ready
            };
        end;
    end, v5.shallowEqual);
end;
local function v98(v78, v79, v80, v81, v82) --[[ Line: 288 ]] --[[ Name: generateFormatStringPropValue ]]
    -- upvalues: v67 (copy), v3 (copy), v11 (copy), v10 (copy), v20 (copy), v5 (copy)
    if typeof(v78) ~= "table" then
        error((("Unexpected type for stringFormat %*"):format((typeof(v78)))));
    end;
    local l_str_0 = v78.str;
    if not l_str_0 or l_str_0 == "" then
        error("No format string for prop");
    end;
    if not v78.args then
        error((("No args found for format. If no args needed, use literal. %*"):format(l_str_0)));
    end;
    local v84 = {};
    for v85, v86 in v78.args do
        local l_type_0 = v86.kind.type;
        local l_value_0 = v86.kind.value;
        if l_type_0 == "literal" then
            l_str_0 = l_str_0:gsub("{" .. v85 .. "}", (tostring(l_value_0)));
        elseif l_type_0 == "binding_path" then
            v84[v85] = v67(l_value_0, v79, v80, v81);
        else
            warn((("Unrecognized argType in buildFormatString %*"):format(l_type_0)));
        end;
    end;
    return v3.createComputed(function(v89) --[[ Line: 322 ]]
        -- upvalues: l_str_0 (ref), v84 (copy), v82 (copy), v11 (ref), v10 (ref), v80 (copy), v20 (ref)
        local l_l_str_0_0 = l_str_0;
        for v91, v92 in v84 do
            local v93 = v92(v89);
            local l_data_0 = v93.data;
            local l_status_1 = v93.status;
            if l_data_0 == nil then
                return {
                    status = l_status_1
                };
            else
                l_l_str_0_0 = l_l_str_0_0 and l_l_str_0_0:gsub("{" .. v91 .. "}", (tostring(l_data_0)));
            end;
        end;
        if v82 then
            local l_status_2, l_result_1 = pcall(function() --[[ Line: 338 ]]
                -- upvalues: v82 (ref), l_l_str_0_0 (ref)
                return v82(l_l_str_0_0);
            end);
            if not l_status_2 then
                v11.reportError(v10.SduiErrorType.FailedToParseProp, {
                    value = l_l_str_0_0, 
                    message = ("Parser in formatString for str %*"):format(l_str_0), 
                    name = v80.debugName
                }, v80.appPage);
                return v20;
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
local function v102(v99, v100, v101) --[[ Line: 365 ]] --[[ Name: validateNumbers ]]
    if typeof(v100) ~= "number" then
        v100 = tonumber(v100);
    end;
    if typeof(v101) ~= "number" then
        v101 = tonumber(v101);
    end;
    if typeof(v100) ~= "number" or typeof(v101) ~= "number" then
        error((("%* without numbers, %*: %*, %*: %*"):format(v99, v100, typeof(v100), v101, (typeof(v101)))));
    end;
    return v100, v101;
end;
local function v106(v103, v104) --[[ Line: 390 ]] --[[ Name: isSame ]]
    -- upvalues: v15 (copy)
    if v103 == v104 then
        return true;
    elseif v103 == nil then
        return false;
    else
        local v105 = typeof(v104);
        if typeof(v103) ~= v105 then
            if v105 == "string" then
                v103 = tostring(v103);
            elseif v105 == "number" then
                v103 = tonumber(v103);
            elseif v105 == "boolean" then
                v103 = v15.parseBooleanProp_(v103, nil, nil);
            end;
        end;
        return v103 == v104;
    end;
end;
local function v107(v108, v109, v110, v111, v112) --[[ Line: 429 ]] --[[ Name: evaluateCondition ]]
    -- upvalues: v50 (copy), l_DataStatus_0 (copy), v102 (copy), v106 (copy), v107 (copy)
    if v109 == nil then
        return true;
    else
        local v113 = v109 and v109.kind and v109.kind.type;
        local v114 = v109 and v109.kind and v109.kind.value;
        if v113 == nil then
            error("nil conditionType in condition");
        end;
        if v114 == nil then
            error("nil conditionValue in condition");
        end;
        local function _(v115) --[[ Line: 449 ]] --[[ Name: getFieldObject ]]
            -- upvalues: v50 (ref), v108 (copy), v110 (copy), v112 (copy)
            local v116 = string.split(v115, ".");
            local v117, v118, v119 = pcall(function() --[[ Line: 453 ]]
                -- upvalues: v50 (ref), v108 (ref), v116 (copy), v110 (ref), v112 (ref)
                return v50(v108, v116, v110, v112, nil, true);
            end);
            if v117 then
                return v118, v119;
            else
                return nil, v119;
            end;
        end;
        if v113 == "comparison" then
            local l_field_0 = v114.field;
            local v122 = string.split(l_field_0, ".");
            local l_v122_0 = v122 --[[ copy: 11 -> 16 ]];
            local v124, v125, v126 = pcall(function() --[[ Line: 453 ]]
                -- upvalues: v50 (ref), v108 (copy), l_v122_0 (copy), v110 (copy), v112 (copy)
                return v50(v108, l_v122_0, v110, v112, nil, true);
            end);
            local v127, v128;
            if v124 then
                v127 = v125;
                v128 = v126;
            else
                v127 = nil;
                v128 = v126;
            end;
            if v127 == nil or v128 and v128 ~= l_DataStatus_0.Ready then
                return nil, v128;
            else
                v122 = v114.kind.value;
                v124 = v114.op;
                if v124 == "OP_LT" then
                    v125, v126 = v102(v124, v127, v122);
                    return v125 < v126;
                elseif v124 == "OP_LTE" then
                    v125, v126 = v102(v124, v127, v122);
                    return v125 <= v126;
                elseif v124 == "OP_GT" then
                    v125, v126 = v102(v124, v127, v122);
                    return v126 < v125;
                elseif v124 == "OP_GTE" then
                    v125, v126 = v102(v124, v127, v122);
                    return v126 <= v125;
                elseif v124 == "OP_E" then
                    return (v106(v127, v122));
                elseif v124 == "OP_NE" then
                    return not v106(v127, v122);
                else
                    error((("Unknown operator for comparison %*"):format(v124)));
                end;
            end;
        elseif v113 == "is_null" then
            local l_field_1 = v114.field;
            local v130 = string.split(l_field_1, ".");
            local v131, v132, v133 = pcall(function() --[[ Line: 453 ]]
                -- upvalues: v50 (ref), v108 (copy), v130 (copy), v110 (copy), v112 (copy)
                return v50(v108, v130, v110, v112, nil, true);
            end);
            local v134, v135;
            if v131 then
                v135 = v132;
                v134 = v133;
            else
                v135 = nil;
                v134 = v133;
            end;
            if v134 and v134 ~= l_DataStatus_0.Ready then
                return nil, v134;
            else
                return v135 == nil;
            end;
        elseif v113 == "is_not_null" then
            local l_field_2 = v114.field;
            local v137 = string.split(l_field_2, ".");
            local v138, v139, v140 = pcall(function() --[[ Line: 453 ]]
                -- upvalues: v50 (ref), v108 (copy), v137 (copy), v110 (copy), v112 (copy)
                return v50(v108, v137, v110, v112, nil, true);
            end);
            local v141, v142;
            if v138 then
                v142 = v139;
                v141 = v140;
            else
                v142 = nil;
                v141 = v140;
            end;
            if v141 and v141 ~= l_DataStatus_0.Ready then
                return nil, v141;
            else
                return v142 ~= nil;
            end;
        elseif v113 == "and_condition" then
            for _, v144 in v114.conditions do
                local v145, v146 = v107(v108, v144, v110, v111, v112);
                if v146 and v146 ~= l_DataStatus_0.Ready then
                    return v145, v146;
                elseif not v145 then
                    return v145;
                end;
            end;
            return true;
        elseif v113 == "or_condition" then
            for _, v148 in v114.conditions do
                local v149, v150 = v107(v108, v148, v110, v111, v112);
                if v150 and v150 ~= l_DataStatus_0.Ready then
                    return v149, v150;
                elseif v149 or v149 == nil then
                    return v149, v150;
                end;
            end;
            return false;
        end;
        return nil;
    end;
end;
local function v160(v151, v152, v153, v154, v155) --[[ Line: 552 ]] --[[ Name: selectConditionalOption ]]
    -- upvalues: v107 (copy), l_DataStatus_0 (copy)
    for _, v157 in v152 do
        local v158, v159 = v107(v151, v157.condition, v153, v154, v155);
        if v158 then
            return v157, v159;
        elseif v159 and v159 ~= l_DataStatus_0.Ready then
            return v158, v159;
        end;
    end;
    return nil;
end;
local function v181(v161, v162, v163, v164, v165, v166, v167, v168) --[[ Line: 588 ]] --[[ Name: generateConditionalPropValue ]]
    -- upvalues: v3 (copy), v160 (copy), l_PropResultCategory_0 (copy), l_DataStatus_0 (copy), v11 (copy), v10 (copy), v14 (copy), v20 (copy), v5 (copy)
    local l_options_0 = v161.options;
    return v3.createComputed(function(v170) --[[ Line: 600 ]]
        -- upvalues: v160 (ref), l_options_0 (copy), v162 (copy), v163 (copy), v165 (copy), v166 (copy), v164 (copy), v167 (copy), l_PropResultCategory_0 (ref), l_DataStatus_0 (ref), v168 (copy), v11 (ref), v10 (ref), v14 (ref), v20 (ref)
        local v178, v179, v180 = pcall(function() --[[ Line: 601 ]]
            -- upvalues: v160 (ref), v170 (copy), l_options_0 (ref), v162 (ref), v163 (ref), v165 (ref), v166 (ref), v164 (ref), v167 (ref), l_PropResultCategory_0 (ref), l_DataStatus_0 (ref)
            local v171, v172 = v160(v170, l_options_0, v162, v163, v165);
            if v171 == nil then
                return nil, v172;
            else
                local v173 = v171 and v171.kind and v171.kind.type;
                local v174 = v171 and v171.kind and v171.kind.value;
                local v175, v176 = v166(v173, v174, v162, v165, v163, v164, v167);
                if v176 == l_PropResultCategory_0.PropSignal then
                    local v177 = v175(v170);
                    v175 = v177.data;
                    if v177.status and v177.status ~= l_DataStatus_0.Ready then
                        v172 = v177.status;
                    end;
                end;
                return v175, v172;
            end;
        end);
        if v178 then
            return {
                data = v179, 
                status = v180, 
                isNestedComponentConfig = v168
            };
        else
            v11.reportError(v10.SduiErrorType.FailedToEvaluateConditionalProp, {
                message = v14.stringifyValue(v179), 
                name = v163.debugName
            }, v163.appPage);
            return v20;
        end;
    end, v5.shallowEqual);
end;
local function v196(v182, v183, v184, v185, _, _, _, _, _) --[[ Line: 648 ]] --[[ Name: resolveTablePropValue ]]
    -- upvalues: v4 (copy), l_DataStatus_0 (copy)
    local v191 = v4.Dictionary.join(v185 or {}, v183 or {});
    local v192 = nil;
    if v184 then
        for v193, v194 in v184 do
            v191[v193] = v194(v182).data;
            local l_status_3 = v194(v182).status;
            if l_status_3 and l_status_3 ~= l_DataStatus_0.Ready then
                v192 = l_status_3;
            end;
        end;
    end;
    return v191, v192;
end;
return {
    generateStaticPropValue = v53, 
    generateDynamicBindingPropValue = v67, 
    generateTokenBindingPropValue = v77, 
    generateFormatStringPropValue = v98, 
    generateConditionalPropValue = v181, 
    generateTablePropSignalValue = function(v197, v198, v199, v200, v201, v202, _) --[[ Line: 676 ]] --[[ Name: generateTablePropSignalValue ]]
        -- upvalues: v3 (copy), v196 (copy), v11 (copy), v10 (copy), v14 (copy), v20 (copy), v5 (copy)
        local v204, v205, v206 = v202(v197, v198, v201, v199, v200);
        return v3.createComputed(function(v207) --[[ Line: 692 ]]
            -- upvalues: v196 (ref), v204 (copy), v205 (copy), v206 (copy), v198 (copy), v199 (copy), v200 (copy), v201 (copy), v202 (copy), v11 (ref), v10 (ref), v14 (ref), v20 (ref)
            local v210, v211, v212 = pcall(function() --[[ Line: 693 ]]
                -- upvalues: v196 (ref), v207 (copy), v204 (ref), v205 (ref), v206 (ref), v198 (ref), v199 (ref), v200 (ref), v201 (ref), v202 (ref)
                local v208, v209 = v196(v207, v204, v205, v206, v198, v199, v200, v201, v202);
                return v208, v209;
            end);
            if v210 then
                return {
                    data = v211, 
                    status = v212
                };
            else
                v11.reportError(v10.SduiErrorType.FailedToParseProp, {
                    message = v14.stringifyValue(v211), 
                    name = v199.debugName
                }, v199.appPage);
                return v20;
            end;
        end, v5.shallowEqual);
    end, 
    selectConditionalOption = v160, 
    evaluateCondition = v107, 
    resolveHydrationBinding = v32, 
    resolveBindingPathValue = v50, 
    resolveTablePropValue = v196, 
    isComponentVisible = function(v213, v214) --[[ Line: 723 ]] --[[ Name: isComponentVisible ]]
        if v213.isComponentFilteredSignal == nil then
            return true;
        else
            return v213.isComponentFilteredSignal(v214).data ~= true;
        end;
    end, 
    resolveTemplate = function(v215, v216) --[[ Line: 730 ]] --[[ Name: resolveTemplate ]]
        if v215 == nil then
            error("Missing roblox_component");
        end;
        local v217 = v216.getTemplateForRobloxComponent(v215);
        if v217 == nil then
            error((("Could not find template for roblox_component %*"):format(v215)));
        end;
        return v217;
    end
};