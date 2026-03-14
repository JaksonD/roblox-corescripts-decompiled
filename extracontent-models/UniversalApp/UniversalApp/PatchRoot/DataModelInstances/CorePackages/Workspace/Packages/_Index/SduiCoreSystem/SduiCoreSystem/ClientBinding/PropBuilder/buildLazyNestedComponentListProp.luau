local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildInputsForNestedComponent);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildHydrationBindingProp);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local l_buildConfigForComponent_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent;
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local l_PropResultCategory_0 = v7.PropResultCategory;
local v11 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local v12 = require(l_script_FirstAncestor_0.SduiLogger);
local v13 = require(l_script_FirstAncestor_0.SduiErrors);
local v14 = require(l_script_FirstAncestor_0.SduiParseHelpers);
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
local l_FFlagSduiV2ConditionalSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2ConditionalSupport;
local l_FFlagSduiComponentFiltering_0 = require(l_Parent_0.SharedFlags).FFlagSduiComponentFiltering;
local l_FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport;
local function v42(v19, v20, v21, v22, v23, v24, v25, v26, v27) --[[ Line: 37 ]] --[[ Name: buildItemList ]]
    -- upvalues: l_FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport_0 (copy), l_FFlagSduiInputDataSignals_0 (copy), l_FFlagSduiComponentFiltering_0 (copy), v3 (copy), v4 (copy), v12 (copy), v13 (copy), v14 (copy), l_buildConfigForComponent_0 (copy)
    local v28 = {};
    for v29, v30 in v20 do
        local v31 = nil;
        v31 = if l_FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport_0 and v30 and v30.roblox_component then v23.getTemplateForRobloxComponent(v30.roblox_component) or v19 else v19;
        if l_FFlagSduiInputDataSignals_0 then
            if v25 and v25[v29] then
                if l_FFlagSduiComponentFiltering_0 then
                    local v32 = v25[v29];
                    local v33 = false;
                    if v32.isComponentFilteredSignal ~= nil then
                        v33 = v32.isComponentFilteredSignal(v27).data;
                    end;
                    if not v33 then
                        table.insert(v28, v32);
                    end;
                else
                    table.insert(v28, v25[v29]);
                end;
            else
                local v38 = v3.createComputed(function(v34) --[[ Line: 71 ]]
                    -- upvalues: v21 (copy), v30 (copy), v4 (ref), v22 (copy), v26 (copy), v12 (ref), v13 (ref), v14 (ref), v23 (copy)
                    local v35 = nil;
                    if v21 then
                        v35 = table.clone(v30);
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 75 ]]
                            -- upvalues: v4 (ref), v22 (ref), v21 (ref), v26 (ref), v34 (copy), v35 (ref)
                            v4(v22, v21, v26, v34, v35);
                        end);
                        if not l_status_0 then
                            v12.reportError(v13.SduiErrorType.FailedToParseProp, {
                                message = ("Failed to build inputs for nested component in list: %*"):format((v14.stringifyValue(l_result_0))), 
                                name = v23.debugName
                            }, v23.appPage);
                        end;
                    else
                        v35 = v30;
                    end;
                    return v35;
                end);
                local v39 = l_buildConfigForComponent_0(v31, v38, v23, v24);
                if l_FFlagSduiComponentFiltering_0 then
                    if v39 then
                        local v40 = false;
                        if v39.isComponentFilteredSignal ~= nil then
                            v40 = v39.isComponentFilteredSignal(v27).data;
                        end;
                        if not v40 then
                            table.insert(v28, v39);
                        end;
                    end;
                else
                    table.insert(v28, v39);
                end;
            end;
        else
            local v41 = nil;
            if v21 then
                v41 = table.clone(v30);
                v4(v22, v21, nil, nil, v41);
            else
                v41 = v30;
            end;
            table.insert(v28, (l_buildConfigForComponent_0(v31, v41, v23, v24)));
        end;
    end;
    return v28;
end;
local function v43(v44, v45, v46, v47, v48, v49) --[[ Line: 153 ]] --[[ Name: buildLazyNestedComponentListProp ]]
    -- upvalues: l_FFlagSduiInputDataSignals_0 (copy), v11 (copy), v42 (copy), l_FFlagSduiComponentFiltering_0 (copy), l_PropResultCategory_0 (copy), v5 (copy), v3 (copy), v4 (copy), v14 (copy), v12 (copy), v13 (copy), l_buildConfigForComponent_0 (copy), l_FFlagSduiV2ConditionalSupport_0 (copy), v43 (copy)
    if v44 == "array_map" then
        if v45.roblox_component == nil then
            error("Missing templateData.roblox_component");
        end;
        local v50 = v48.getTemplateForRobloxComponent(v45.roblox_component);
        if v50 == nil then
            error((("Could not find template for roblox_component %*"):format(v45.roblox_component)));
        end;
        local l_binding_path_0 = v45.binding_path;
        if l_binding_path_0 == nil or l_binding_path_0 == "" then
            error((("No bindingPath specified for roblox_component %*"):format(v45.roblox_component)));
        end;
        if l_FFlagSduiInputDataSignals_0 then
            local v52 = nil;
            return v11.generateDynamicBindingPropValue(l_binding_path_0, v46, v48, v47, function(v53, v54) --[[ Line: 186 ]]
                -- upvalues: v52 (ref), v42 (ref), v50 (copy), v45 (copy), v47 (copy), v48 (copy), v49 (copy), v46 (copy), l_FFlagSduiComponentFiltering_0 (ref)
                v52 = v42(v50, v53, v45.inputs, v47, v48, v49, v52, v46, if l_FFlagSduiComponentFiltering_0 then v54 else nil);
                return v52;
            end), l_PropResultCategory_0.PropSignal;
        else
            local v56, v57 = v5(l_binding_path_0, v46, v47, function(v55) --[[ Line: 208 ]]
                -- upvalues: v42 (ref), v50 (copy), v45 (copy), v47 (copy), v48 (copy), v49 (copy)
                return (v42(v50, v55, v45.inputs, v47, v48, v49, nil));
            end);
            return v56, v57;
        end;
    elseif v44 == "item_list" then
        if typeof(v45) ~= "table" then
            error((("Missing or invalid templateDataList %*"):format((typeof(v45)))));
        end;
        local l_items_0 = v45.items;
        if typeof(l_items_0) ~= "table" then
            error((("Missing or invalid templateDataList.items %*"):format((typeof(v45)))));
        end;
        if l_FFlagSduiComponentFiltering_0 then
            return v3.createComputed(function(v59) --[[ Line: 236 ]]
                -- upvalues: l_items_0 (copy), v48 (copy), v3 (ref), v4 (ref), v47 (copy), v46 (copy), v14 (ref), v12 (ref), v13 (ref), l_buildConfigForComponent_0 (ref), v49 (copy)
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 237 ]]
                    -- upvalues: l_items_0 (ref), v48 (ref), v3 (ref), v4 (ref), v47 (ref), v46 (ref), v14 (ref), v12 (ref), v13 (ref), l_buildConfigForComponent_0 (ref), v49 (ref), v59 (copy)
                    local v60 = {};
                    for _, v62 in l_items_0 do
                        if v62.roblox_component == nil then
                            error("Missing templateData.roblox_component");
                        end;
                        local v63 = v48.getTemplateForRobloxComponent(v62.roblox_component);
                        if v63 == nil then
                            error((("Could not find template for roblox_component %*"):format(v62.roblox_component)));
                        end;
                        local l_inputs_0 = v62.inputs;
                        local v70 = v3.createComputed(function(v65) --[[ Line: 251 ]]
                            -- upvalues: l_inputs_0 (copy), v4 (ref), v47 (ref), v46 (ref), v14 (ref), v12 (ref), v13 (ref), v48 (ref)
                            local v66 = {};
                            if l_inputs_0 then
                                local l_status_1, l_result_1 = pcall(function() --[[ Line: 254 ]]
                                    -- upvalues: v4 (ref), v47 (ref), l_inputs_0 (ref), v46 (ref), v65 (copy), v66 (copy)
                                    v4(v47, l_inputs_0, v46, v65, v66);
                                end);
                                if not l_status_1 then
                                    local v69 = v14.stringifyValue(l_result_1);
                                    v12.reportError(v13.SduiErrorType.FailedToParseProp, {
                                        message = ("Failed to build inputs for nested component in item_list: %*"):format(v69), 
                                        name = v48.debugName
                                    }, v48.appPage);
                                end;
                            end;
                            return v66;
                        end);
                        local v71 = l_buildConfigForComponent_0(v63, v70, v48, v49);
                        if v71 then
                            local v72 = false;
                            if v71.isComponentFilteredSignal ~= nil then
                                v72 = v71.isComponentFilteredSignal(v59).data;
                            end;
                            if not v72 then
                                table.insert(v60, v71);
                            end;
                        end;
                    end;
                    return v60;
                end);
                if not l_status_2 then
                    local v75 = v14.stringifyValue(l_result_2);
                    v12.reportError(v13.SduiErrorType.FailedToParseProp, {
                        message = ("Failed to build item_list component list: %*"):format(v75), 
                        name = v48.debugName
                    }, v48.appPage);
                    return {
                        data = {}
                    };
                else
                    return {
                        data = l_result_2
                    };
                end;
            end), l_PropResultCategory_0.PropSignal;
        else
            local l_Literal_0 = l_PropResultCategory_0.Literal;
            local v77 = {};
            for _, v79 in l_items_0 do
                if v79.roblox_component == nil then
                    error("Missing templateData.roblox_component");
                end;
                local v80 = v48.getTemplateForRobloxComponent(v79.roblox_component);
                if v80 == nil then
                    error((("Could not find template for roblox_component %*"):format(v79.roblox_component)));
                end;
                local l_inputs_1 = v79.inputs;
                local v82 = nil;
                if l_FFlagSduiInputDataSignals_0 then
                    v82 = v3.createComputed(function(v83) --[[ Line: 317 ]]
                        -- upvalues: l_inputs_1 (copy), v4 (ref), v47 (copy), v46 (copy), v14 (ref), v12 (ref), v13 (ref), v48 (copy)
                        local v84 = {};
                        if l_inputs_1 then
                            local l_status_3, l_result_3 = pcall(function() --[[ Line: 320 ]]
                                -- upvalues: v4 (ref), v47 (ref), l_inputs_1 (ref), v46 (ref), v83 (copy), v84 (copy)
                                v4(v47, l_inputs_1, v46, v83, v84);
                            end);
                            if not l_status_3 then
                                local v87 = v14.stringifyValue(l_result_3);
                                v12.reportError(v13.SduiErrorType.FailedToParseProp, {
                                    message = ("Failed to build inputs for nested component in item_list: %*"):format(v87), 
                                    name = v48.debugName
                                }, v48.appPage);
                            end;
                        end;
                        return v84;
                    end);
                else
                    v82 = {};
                    if l_inputs_1 then
                        v4(v47, l_inputs_1, nil, nil, v82);
                    end;
                end;
                table.insert(v77, (l_buildConfigForComponent_0(v80, v82, v48, v49)));
            end;
            return v77, l_Literal_0;
        end;
    elseif v44 == "conditional" then
        if l_FFlagSduiV2ConditionalSupport_0 then
            return v11.generateConditionalPropValue(v45, v46, v48, v49, v47, v43), l_PropResultCategory_0.PropSignal;
        else
            error("TODO: Conditional not implemented yet");
            return;
        end;
    else
        error((("Could not build prop. Unknown propDefinitionType: %*"):format(v44)));
        return;
    end;
end;
return v43;