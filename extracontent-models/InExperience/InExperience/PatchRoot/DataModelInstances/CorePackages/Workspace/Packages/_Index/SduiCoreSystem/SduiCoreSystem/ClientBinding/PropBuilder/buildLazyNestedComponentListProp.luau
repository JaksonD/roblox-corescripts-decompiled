local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildInputsForNestedComponent);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local l_buildConfigForComponent_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent;
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local l_PropResultCategory_0 = v6.PropResultCategory;
local v10 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local v11 = require(l_script_FirstAncestor_0.SduiLogger);
local v12 = require(l_script_FirstAncestor_0.SduiErrors);
local v13 = require(l_script_FirstAncestor_0.SduiParseHelpers);
local l_FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport;
local l_FFlagSduiOrderedTemplateDataSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiOrderedTemplateDataSupport;
local l_FFlagSduiLocalizedLiterals_0 = require(l_Parent_0.SharedFlags).FFlagSduiLocalizedLiterals;
local function v39(v17, v18, v19, v20, v21, v22, v23, v24, v25) --[[ Line: 35 ]] --[[ Name: buildItemList ]]
    -- upvalues: l_FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport_0 (copy), l_FFlagSduiOrderedTemplateDataSupport_0 (copy), v10 (copy), v3 (copy), v4 (copy), l_FFlagSduiLocalizedLiterals_0 (copy), v11 (copy), v12 (copy), v13 (copy), l_buildConfigForComponent_0 (copy)
    local v26 = {};
    for v27, v28 in v18 do
        local v29 = nil;
        v29 = if l_FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport_0 and v28 and v28.roblox_component then v21.getTemplateForRobloxComponent(v28.roblox_component) or v17 else v17;
        if v23 and v23[v27] then
            local v30 = v23[v27];
            if l_FFlagSduiOrderedTemplateDataSupport_0 then
                if v10.isComponentVisible(v30, v25) then
                    table.insert(v26, v30);
                end;
            else
                local v31 = false;
                if v30.isComponentFilteredSignal ~= nil then
                    v31 = v30.isComponentFilteredSignal(v25).data;
                end;
                if not v31 then
                    table.insert(v26, v30);
                end;
            end;
        else
            local v36 = v3.createComputed(function(v32) --[[ Line: 70 ]]
                -- upvalues: v19 (copy), v28 (copy), v4 (ref), v20 (copy), v24 (copy), l_FFlagSduiLocalizedLiterals_0 (ref), v21 (copy), v11 (ref), v12 (ref), v13 (ref)
                local v33 = nil;
                if v19 then
                    v33 = table.clone(v28);
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 74 ]]
                        -- upvalues: v4 (ref), v20 (ref), v19 (ref), v24 (ref), v32 (copy), v33 (ref), l_FFlagSduiLocalizedLiterals_0 (ref), v21 (ref)
                        v4(v20, v19, v24, v32, v33, if l_FFlagSduiLocalizedLiterals_0 then v21 else nil);
                    end);
                    if not l_status_0 then
                        v11.reportError(v12.SduiErrorType.FailedToParseProp, {
                            message = ("Failed to build inputs for nested component in list: %*"):format((v13.stringifyValue(l_result_0))), 
                            name = v21.debugName
                        }, v21.appPage);
                    end;
                else
                    v33 = v28;
                end;
                return v33;
            end);
            local v37 = l_buildConfigForComponent_0(v29, v36, v21, v22);
            if v37 then
                if l_FFlagSduiOrderedTemplateDataSupport_0 then
                    if v10.isComponentVisible(v37, v25) then
                        table.insert(v26, v37);
                    end;
                else
                    local v38 = false;
                    if v37.isComponentFilteredSignal ~= nil then
                        v38 = v37.isComponentFilteredSignal(v25).data;
                    end;
                    if not v38 then
                        table.insert(v26, v37);
                    end;
                end;
            end;
        end;
    end;
    return v26;
end;
local function v75(v40, v41, v42, v43, v44) --[[ Line: 118 ]] --[[ Name: buildOrderedTemplateDataList ]]
    -- upvalues: v3 (copy), v10 (copy), v11 (copy), v12 (copy), v4 (copy), l_FFlagSduiLocalizedLiterals_0 (copy), l_buildConfigForComponent_0 (copy), v13 (copy), l_PropResultCategory_0 (copy)
    local l_entry_map_path_0 = v40.entry_map_path;
    local l_entry_order_0 = v40.entry_order;
    local l_template_data_map_0 = v40.template_data_map;
    if l_entry_order_0 == nil then
        error("Missing entry_order in ordered_template_data");
    end;
    if l_template_data_map_0 == nil or typeof(l_template_data_map_0) ~= "table" then
        error("Missing or invalid template_data_map in ordered_template_data");
    end;
    local v48 = if l_entry_map_path_0 and l_entry_map_path_0 ~= "" then string.split(l_entry_map_path_0, ".") else nil;
    local v49 = if l_entry_order_0 then l_entry_order_0.kind else nil;
    local v50 = if v49 and v49.type == "binding_path" then string.split(v49.value, ".") else nil;
    return v3.createComputed(function(v51) --[[ Line: 143 ]]
        -- upvalues: v50 (copy), v10 (ref), v41 (copy), v42 (copy), v49 (copy), v48 (copy), l_template_data_map_0 (copy), v11 (ref), v12 (ref), v43 (copy), v3 (ref), v4 (ref), l_FFlagSduiLocalizedLiterals_0 (ref), l_buildConfigForComponent_0 (ref), v44 (copy), v13 (ref)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 144 ]]
            -- upvalues: v50 (ref), v10 (ref), v51 (copy), v41 (ref), v42 (ref), v49 (ref), v48 (ref), l_template_data_map_0 (ref), v11 (ref), v12 (ref), v43 (ref), v3 (ref), v4 (ref), l_FFlagSduiLocalizedLiterals_0 (ref), l_buildConfigForComponent_0 (ref), v44 (ref), v13 (ref)
            local v52 = nil;
            if v50 then
                v52 = v10.resolveBindingPathValue(v51, v50, v41, v42);
            elseif v49 and v49.type == "literal" then
                v52 = v49.value and v49.value.items;
            end;
            if v52 == nil then
                error("entry_order resolved to nil in ordered_template_data");
            end;
            local v53 = if v48 then v10.resolveBindingPathValue(v51, v48, v41, v42) else nil;
            local v54 = {};
            for _, v56 in v52 do
                local v57 = if typeof(v56) == "table" then v56.identifier else v56;
                if v57 ~= nil and v57 ~= "" then
                    local v58 = l_template_data_map_0[v57];
                    local v59 = if v53 then v53[v57] else nil;
                    local v60 = if v59 and v59.roblox_component and v59.roblox_component ~= "" then v59.roblox_component else if v58 and v58.roblox_component then v58.roblox_component else nil;
                    if v60 == nil then
                        v11.reportError(v12.SduiErrorType.UnknownTemplateDataIdentifier, {
                            message = ("No roblox_component for identifier \"%*\" in ordered_template_data (not in template_data_map or feed entry)"):format(v57), 
                            name = v43.debugName
                        }, v43.appPage);
                    else
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 187 ]]
                            -- upvalues: v10 (ref), v60 (copy), v43 (ref), v58 (copy), v3 (ref), v4 (ref), v42 (ref), v41 (ref), l_FFlagSduiLocalizedLiterals_0 (ref), v59 (copy), l_buildConfigForComponent_0 (ref), v44 (ref)
                            local v61 = v10.resolveTemplate(v60, v43);
                            local v62 = if v58 then v58.inputs else nil;
                            local v68 = v3.createComputed(function(v63) --[[ Line: 191 ]]
                                -- upvalues: v62 (copy), v4 (ref), v42 (ref), v41 (ref), l_FFlagSduiLocalizedLiterals_0 (ref), v43 (ref), v59 (ref)
                                local v64 = {};
                                if v62 then
                                    v4(v42, v62, v41, v63, v64, if l_FFlagSduiLocalizedLiterals_0 then v43 else nil);
                                end;
                                if v59 then
                                    local v65 = if v59.input_data and v59.input_data.kind and v59.input_data.kind.value then v59.input_data.kind.value else nil;
                                    if typeof(v65) == "table" then
                                        for v66, v67 in v65 do
                                            v64[v66] = v67;
                                        end;
                                    end;
                                end;
                                return v64;
                            end);
                            return l_buildConfigForComponent_0(v61, v68, v43, v44);
                        end);
                        if not l_status_1 then
                            local v71 = v13.stringifyValue(l_result_1);
                            v11.reportError(v12.SduiErrorType.FailedToParseProp, {
                                message = ("Failed to build ordered_template_data entry for identifier %*: %*"):format(v57, v71), 
                                name = v43.debugName
                            }, v43.appPage);
                        elseif l_result_1 and v10.isComponentVisible(l_result_1, v51) then
                            table.insert(v54, l_result_1);
                        end;
                    end;
                end;
            end;
            return v54;
        end);
        if not l_status_2 then
            local v74 = v13.stringifyValue(l_result_2);
            v11.reportError(v12.SduiErrorType.FailedToParseProp, {
                message = ("Failed to build ordered_template_data component list: %*"):format(v74), 
                name = v43.debugName
            }, v43.appPage);
            return {
                data = {}
            };
        else
            return {
                data = l_result_2
            };
        end;
    end), l_PropResultCategory_0.PropSignal;
end;
local function v76(v77, v78, v79, v80, v81, v82) --[[ Line: 285 ]] --[[ Name: buildLazyNestedComponentListProp ]]
    -- upvalues: l_FFlagSduiOrderedTemplateDataSupport_0 (copy), v10 (copy), v39 (copy), l_PropResultCategory_0 (copy), v3 (copy), v4 (copy), l_FFlagSduiLocalizedLiterals_0 (copy), v13 (copy), v11 (copy), v12 (copy), l_buildConfigForComponent_0 (copy), v75 (copy), v76 (copy)
    if v77 == "array_map" then
        local v83 = nil;
        if l_FFlagSduiOrderedTemplateDataSupport_0 then
            v83 = v10.resolveTemplate(v78.roblox_component, v81);
        else
            if v78.roblox_component == nil then
                error("Missing templateData.roblox_component");
            end;
            local v84 = v81.getTemplateForRobloxComponent(v78.roblox_component);
            if v84 == nil then
                error((("Could not find template for roblox_component %*"):format(v78.roblox_component)));
            end;
            v83 = v84;
        end;
        local l_binding_path_0 = v78.binding_path;
        if l_binding_path_0 == nil or l_binding_path_0 == "" then
            error((("No bindingPath specified for roblox_component %*"):format(v78.roblox_component)));
        end;
        local v86 = nil;
        return v10.generateDynamicBindingPropValue(l_binding_path_0, v79, v81, v80, function(v87, v88) --[[ Line: 323 ]]
            -- upvalues: v86 (ref), v39 (ref), v83 (ref), v78 (copy), v80 (copy), v81 (copy), v82 (copy), v79 (copy)
            v86 = v39(v83, v87, v78.inputs, v80, v81, v82, v86, v79, v88);
            return v86;
        end), l_PropResultCategory_0.PropSignal;
    elseif v77 == "item_list" then
        if typeof(v78) ~= "table" then
            error((("Missing or invalid templateDataList %*"):format((typeof(v78)))));
        end;
        local l_items_0 = v78.items;
        if typeof(l_items_0) ~= "table" then
            error((("Missing or invalid templateDataList.items %*"):format((typeof(v78)))));
        end;
        return v3.createComputed(function(v90) --[[ Line: 352 ]]
            -- upvalues: l_items_0 (copy), l_FFlagSduiOrderedTemplateDataSupport_0 (ref), v10 (ref), v81 (copy), v3 (ref), v4 (ref), v80 (copy), v79 (copy), l_FFlagSduiLocalizedLiterals_0 (ref), v13 (ref), v11 (ref), v12 (ref), l_buildConfigForComponent_0 (ref), v82 (copy)
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 353 ]]
                -- upvalues: l_items_0 (ref), l_FFlagSduiOrderedTemplateDataSupport_0 (ref), v10 (ref), v81 (ref), v3 (ref), v4 (ref), v80 (ref), v79 (ref), l_FFlagSduiLocalizedLiterals_0 (ref), v13 (ref), v11 (ref), v12 (ref), l_buildConfigForComponent_0 (ref), v82 (ref), v90 (copy)
                local v91 = {};
                for _, v93 in l_items_0 do
                    local v94 = nil;
                    if l_FFlagSduiOrderedTemplateDataSupport_0 then
                        v94 = v10.resolveTemplate(v93.roblox_component, v81);
                    else
                        if v93.roblox_component == nil then
                            error("Missing templateData.roblox_component");
                        end;
                        local v95 = v81.getTemplateForRobloxComponent(v93.roblox_component);
                        if v95 == nil then
                            error((("Could not find template for roblox_component %*"):format(v93.roblox_component)));
                        end;
                        v94 = v95;
                    end;
                    local l_inputs_0 = v93.inputs;
                    local v102 = v3.createComputed(function(v97) --[[ Line: 371 ]]
                        -- upvalues: l_inputs_0 (copy), v4 (ref), v80 (ref), v79 (ref), l_FFlagSduiLocalizedLiterals_0 (ref), v81 (ref), v13 (ref), v11 (ref), v12 (ref)
                        local v98 = {};
                        if l_inputs_0 then
                            local l_status_3, l_result_3 = pcall(function() --[[ Line: 374 ]]
                                -- upvalues: v4 (ref), v80 (ref), l_inputs_0 (ref), v79 (ref), v97 (copy), v98 (copy), l_FFlagSduiLocalizedLiterals_0 (ref), v81 (ref)
                                v4(v80, l_inputs_0, v79, v97, v98, if l_FFlagSduiLocalizedLiterals_0 then v81 else nil);
                            end);
                            if not l_status_3 then
                                local v101 = v13.stringifyValue(l_result_3);
                                v11.reportError(v12.SduiErrorType.FailedToParseProp, {
                                    message = ("Failed to build inputs for nested component in item_list: %*"):format(v101), 
                                    name = v81.debugName
                                }, v81.appPage);
                            end;
                        end;
                        return v98;
                    end);
                    local v103 = l_buildConfigForComponent_0(v94, v102, v81, v82);
                    if v103 then
                        if l_FFlagSduiOrderedTemplateDataSupport_0 then
                            if v10.isComponentVisible(v103, v90) then
                                table.insert(v91, v103);
                            end;
                        else
                            local v104 = false;
                            if v103.isComponentFilteredSignal ~= nil then
                                v104 = v103.isComponentFilteredSignal(v90).data;
                            end;
                            if not v104 then
                                table.insert(v91, v103);
                            end;
                        end;
                    end;
                end;
                return v91;
            end);
            if not l_status_4 then
                local v107 = v13.stringifyValue(l_result_4);
                v11.reportError(v12.SduiErrorType.FailedToParseProp, {
                    message = ("Failed to build item_list component list: %*"):format(v107), 
                    name = v81.debugName
                }, v81.appPage);
                return {
                    data = {}
                };
            else
                return {
                    data = l_result_4
                };
            end;
        end), l_PropResultCategory_0.PropSignal;
    elseif l_FFlagSduiOrderedTemplateDataSupport_0 and v77 == "ordered_template_data" then
        return v75(v78, v79, v80, v81, v82);
    elseif v77 == "conditional" then
        return v10.generateConditionalPropValue(v78, v79, v81, v82, v80, v76), l_PropResultCategory_0.PropSignal;
    else
        error((("Could not build prop. Unknown propDefinitionType: %*"):format(v77)));
        return;
    end;
end;
return v76;