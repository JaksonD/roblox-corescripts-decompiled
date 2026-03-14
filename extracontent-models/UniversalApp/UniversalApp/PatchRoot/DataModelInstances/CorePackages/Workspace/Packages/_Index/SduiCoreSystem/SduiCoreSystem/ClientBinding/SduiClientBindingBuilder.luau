local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.SduiErrors);
local v4 = require(l_script_FirstAncestor_0.SduiLogger);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.buildDataBindingSourcesForTemplate);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.buildAnalyticsContextForClientBinding);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local v10 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local v11 = require(l_script_FirstAncestor_0.SduiParseHelpers);
local v12 = require(l_script_FirstAncestor_0.getSduiComponentRegistry);
local v13 = require(l_Parent_0.SharedFlags);
local l_FFlagSduiInputDataSignals_0 = v13.FFlagSduiInputDataSignals;
local l_FFlagSduiOneofPropSupport_0 = v13.FFlagSduiOneofPropSupport;
local l_FFlagSduiPropMapping_0 = v13.FFlagSduiPropMapping;
local l_FFlagSduiV2ConditionalSupport_0 = v13.FFlagSduiV2ConditionalSupport;
local l_FFlagSduiComponentFiltering_0 = v13.FFlagSduiComponentFiltering;
local function v19(v20, v21, v22, v23, v24) --[[ Line: 36 ]] --[[ Name: buildProp ]]
    -- upvalues: l_FFlagSduiOneofPropSupport_0 (copy), v19 (copy)
    if l_FFlagSduiOneofPropSupport_0 and v20.oneof_prop and v20.oneof_prop.value then
        return v19(v20.oneof_prop.value, v21, v22, v23, v24);
    else
        local v25 = v20 and v20.kind and v20.kind.type;
        if v25 == nil then
            error("No propDefinitionType provided");
        end;
        if v20.descriptor == nil then
            error((("No propDefinitionType descriptor provided for %*"):format(v25)));
        end;
        local l_name_0 = v20.descriptor.name;
        local v27 = v23.getPropBuilder(l_name_0);
        local v28 = v20.kind and v20.kind.value;
        if l_FFlagSduiOneofPropSupport_0 and v28 == nil then
            error((("No propDefinitionValue provided for %*"):format(v25)));
        end;
        local v29, v30, v31 = v27(v25, v28, v21, v22, v23, v24);
        return v29, v30, v31;
    end;
end;
local function _(v32, v33) --[[ Line: 97 ]] --[[ Name: transformPropKey ]]
    -- upvalues: v10 (copy)
    if v33 and v33[v32] then
        return v33[v32];
    else
        return v10.mapPropName(v32) or v32;
    end;
end;
local function v52(v35, v36, v37, v38, v39, v40) --[[ Line: 105 ]] --[[ Name: buildPropTable ]]
    -- upvalues: l_FFlagSduiPropMapping_0 (copy), v10 (copy), v19 (copy), l_PropResultCategory_0 (copy), v4 (copy), v3 (copy), l_FFlagSduiV2ConditionalSupport_0 (copy)
    local v41 = {};
    if v35 == nil then
        error("Attempt to buildPropTable with nil");
    end;
    local v42 = nil;
    local v43 = nil;
    for v44, v45 in v35 do
        local v46 = if l_FFlagSduiPropMapping_0 then if v40 and v40[v44] then v40[v44] else v10.mapPropName(v44) or v44 else v10.mapPropName(v44);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 125 ]]
            -- upvalues: v19 (ref), v45 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), l_PropResultCategory_0 (ref), v42 (ref), v46 (copy), v43 (ref), v41 (copy), v4 (ref), v3 (ref), l_FFlagSduiV2ConditionalSupport_0 (ref)
            local v47, v48, v49 = v19(v45, v36, v37, v38, v39);
            if v48 == l_PropResultCategory_0.PropSignal then
                if v42 == nil then
                    v42 = {};
                end;
                v42[v46] = v47;
                return;
            elseif v48 == l_PropResultCategory_0.NestedComponentConfig then
                if v43 == nil then
                    v43 = {};
                end;
                v43[v46] = v47;
                return;
            elseif v48 == l_PropResultCategory_0.Failed then
                v41[v46] = v47;
                v4.reportError(v3.SduiErrorType.FailedToParseProp, {
                    message = ("ClientBinding - failed to build prop %*: %*, %*"):format(v46, v47, v49), 
                    propName = if l_FFlagSduiV2ConditionalSupport_0 then ("%*"):format(v46) else v46, 
                    name = v38.debugName, 
                    value = v45
                }, v38.appPage);
                return;
            elseif v48 == l_PropResultCategory_0.Literal then
                v41[v46] = v47;
                return;
            else
                v4.reportError(v3.SduiErrorType.FailedToParseProp, {
                    message = ("ClientBinding - unexpected propResultCategory: %*. %*: %*, %*"):format(v48, v46, v47, v49), 
                    propName = if l_FFlagSduiV2ConditionalSupport_0 then ("%*"):format(v46) else v46, 
                    name = v38.debugName, 
                    value = v45
                }, v38.appPage);
                v41[v46] = v47;
                return;
            end;
        end);
        if not l_status_0 then
            v4.reportError(v3.SduiErrorType.FailedToParseProp, {
                message = ("ClientBinding - failed to build prop %*: %*. %*"):format(v46, l_result_0, l_result_0), 
                propName = if l_FFlagSduiV2ConditionalSupport_0 then ("%*"):format(v46) else v46, 
                name = v38.debugName, 
                value = v45
            }, v38.appPage);
        end;
    end;
    return v41, v42, v43;
end;
local v55 = {
    __index = function(v53, v54) --[[ Line: 176 ]] --[[ Name: __index ]]
        if v54 == "analyticsData" then
            return v53.analyticsContext and v53.analyticsContext.analyticsData;
        else
            return nil;
        end;
    end
};
return {
    buildPropTable = v52, 
    buildProp = v19, 
    buildConfigForComponent = function(v56, v57, v58, v59, _) --[[ Line: 185 ]] --[[ Name: buildConfigForComponent ]]
        -- upvalues: l_FFlagSduiV2ConditionalSupport_0 (copy), l_FFlagSduiInputDataSignals_0 (copy), v2 (copy), v5 (copy), v4 (copy), v3 (copy), v11 (copy), v10 (copy), v55 (copy), v52 (copy), v6 (copy), l_FFlagSduiPropMapping_0 (copy), v12 (copy), l_FFlagSduiComponentFiltering_0 (copy), v19 (copy), l_PropResultCategory_0 (copy)
        if not v56 or not next(v56) then
            error("Attempt to buildConfigForComponent with nil template");
        end;
        local l_value_0 = v56.kind.value;
        local v62 = nil;
        if l_FFlagSduiV2ConditionalSupport_0 or l_value_0.shared and l_value_0.shared.data then
            if l_FFlagSduiInputDataSignals_0 then
                local v63 = nil;
                v63 = if l_FFlagSduiV2ConditionalSupport_0 then l_value_0.shared and l_value_0.shared.data or {} else l_value_0.shared.data;
                do
                    local l_v63_0 = v63;
                    v62 = v2.createComputed(function(v65) --[[ Line: 208 ]]
                        -- upvalues: v5 (ref), v57 (copy), l_v63_0 (ref), v4 (ref), v3 (ref), v58 (copy), v11 (ref)
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 209 ]]
                            -- upvalues: v5 (ref), v57 (ref), v65 (copy), l_v63_0 (ref)
                            return v5(v57(v65), l_v63_0);
                        end);
                        if not l_status_1 then
                            v4.reportError(v3.SduiErrorType.FailedToBuildBindingSources, {
                                name = v58.debugName, 
                                message = v11.stringifyValue(l_result_1)
                            }, v58.appPage);
                            return {};
                        else
                            return l_result_1;
                        end;
                    end);
                end;
            else
                v62 = v5(v57, l_value_0.shared.data);
            end;
        end;
        local v68 = l_value_0.shared and l_value_0.shared.component_type;
        if not v68 then
            error("Could not determine ui component type");
        end;
        local v69 = v10.mapUiComponentTypeToLua(v68);
        local v70 = {
            __processed = true, 
            __isClientBinding = true, 
            componentType = v69
        };
        setmetatable(v70, v55);
        local v71 = nil;
        local v72 = nil;
        if l_value_0.shared and l_value_0.shared.analytics_data then
            local v73, v74 = v52(l_value_0.shared.analytics_data, v62, v57, v58, nil, nil);
            v71 = v73;
            v72 = v74;
        end;
        v70.analyticsContext = v6(v71, v72, v59, v58);
        if l_value_0.props then
            local v75 = nil;
            if l_FFlagSduiPropMapping_0 then
                local v76 = v12().getComponentDefinition(v69);
                v75 = v76 and v76.propMapping or nil;
            end;
            local v77 = nil;
            local v78 = nil;
            local v79, v80, v81 = v52(l_value_0.props, v62, v57, v58, v70.analyticsContext, v75);
            v70.props = v79;
            v77 = v80;
            v78 = v81;
            if v77 ~= nil and next(v77) then
                v70.propSignals = v77;
            end;
            if v78 ~= nil and next(v78) then
                v70.nestedComponentConfigs = v78;
            end;
        end;
        if l_FFlagSduiComponentFiltering_0 and l_value_0.shared and l_value_0.shared.is_component_filtered then
            local l_is_component_filtered_0 = l_value_0.shared.is_component_filtered;
            local v83, v84, v85, v86 = pcall(function() --[[ Line: 284 ]]
                -- upvalues: v19 (ref), l_is_component_filtered_0 (copy), v62 (ref), v57 (copy), v58 (copy), v70 (copy)
                return v19(l_is_component_filtered_0, v62, v57, v58, v70.analyticsContext);
            end);
            if not v83 or v86 or v85 == l_PropResultCategory_0.Failed then
                local v87 = if v86 then v11.stringifyValue(v86) else v11.stringifyValue(v84);
                local v88 = v11.stringifyValue(l_is_component_filtered_0);
                v4.reportError(v3.SduiErrorType.FailedToParseProp, {
                    message = ("Failed to build is_component_filtered prop: %*"):format(v87), 
                    name = v58.debugName, 
                    value = v88
                }, v58.appPage);
            elseif v85 == l_PropResultCategory_0.PropSignal then
                v70.isComponentFilteredSignal = v84;
            elseif v85 == l_PropResultCategory_0.Literal then
                v70.isComponentFilteredSignal = function() --[[ Line: 308 ]]
                    -- upvalues: v84 (copy)
                    return {
                        data = v84
                    };
                end;
            end;
        end;
        return v70;
    end
};