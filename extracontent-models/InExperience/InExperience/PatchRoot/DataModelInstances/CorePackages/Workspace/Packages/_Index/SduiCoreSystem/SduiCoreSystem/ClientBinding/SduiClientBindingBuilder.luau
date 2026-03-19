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
local l_FFlagSduiOneofPropSupport_0 = v13.FFlagSduiOneofPropSupport;
local l_FFlagSduiPropMapping_0 = v13.FFlagSduiPropMapping;
local l_FFlagSduiComponentFiltering_0 = v13.FFlagSduiComponentFiltering;
local function v17(v18, v19, v20, v21, v22) --[[ Line: 34 ]] --[[ Name: buildProp ]]
    -- upvalues: l_FFlagSduiOneofPropSupport_0 (copy), v17 (copy)
    if l_FFlagSduiOneofPropSupport_0 and v18.oneof_prop and v18.oneof_prop.value then
        return v17(v18.oneof_prop.value, v19, v20, v21, v22);
    else
        local v23 = v18 and v18.kind and v18.kind.type;
        if v23 == nil then
            error("No propDefinitionType provided");
        end;
        if v18.descriptor == nil then
            error((("No propDefinitionType descriptor provided for %*"):format(v23)));
        end;
        local l_name_0 = v18.descriptor.name;
        local v25 = v21.getPropBuilder(l_name_0);
        local v26 = v18.kind and v18.kind.value;
        if l_FFlagSduiOneofPropSupport_0 and v26 == nil then
            error((("No propDefinitionValue provided for %*"):format(v23)));
        end;
        local v27, v28, v29 = v25(v23, v26, v19, v20, v21, v22);
        return v27, v28, v29;
    end;
end;
local function _(v30, v31) --[[ Line: 95 ]] --[[ Name: transformPropKey ]]
    -- upvalues: v10 (copy)
    if v31 and v31[v30] then
        return v31[v30];
    else
        return v10.mapPropName(v30) or v30;
    end;
end;
local function v50(v33, v34, v35, v36, v37, v38) --[[ Line: 103 ]] --[[ Name: buildPropTable ]]
    -- upvalues: l_FFlagSduiPropMapping_0 (copy), v10 (copy), v17 (copy), l_PropResultCategory_0 (copy), v4 (copy), v3 (copy)
    local v39 = {};
    if v33 == nil then
        error("Attempt to buildPropTable with nil");
    end;
    local v40 = nil;
    local v41 = nil;
    for v42, v43 in v33 do
        local v44 = if l_FFlagSduiPropMapping_0 then if v38 and v38[v42] then v38[v42] else v10.mapPropName(v42) or v42 else v10.mapPropName(v42);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 123 ]]
            -- upvalues: v17 (ref), v43 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), l_PropResultCategory_0 (ref), v40 (ref), v44 (copy), v41 (ref), v39 (copy), v4 (ref), v3 (ref)
            local v45, v46, v47 = v17(v43, v34, v35, v36, v37);
            if v46 == l_PropResultCategory_0.PropSignal then
                if v40 == nil then
                    v40 = {};
                end;
                v40[v44] = v45;
                return;
            elseif v46 == l_PropResultCategory_0.NestedComponentConfig then
                if v41 == nil then
                    v41 = {};
                end;
                v41[v44] = v45;
                return;
            elseif v46 == l_PropResultCategory_0.Failed then
                v39[v44] = v45;
                v4.reportError(v3.SduiErrorType.FailedToParseProp, {
                    message = ("ClientBinding - failed to build prop %*: %*, %*"):format(v44, v45, v47), 
                    propName = ("%*"):format(v44), 
                    name = v36.debugName, 
                    value = v43
                }, v36.appPage);
                return;
            elseif v46 == l_PropResultCategory_0.Literal then
                v39[v44] = v45;
                return;
            else
                v4.reportError(v3.SduiErrorType.FailedToParseProp, {
                    message = ("ClientBinding - unexpected propResultCategory: %*. %*: %*, %*"):format(v46, v44, v45, v47), 
                    propName = ("%*"):format(v44), 
                    name = v36.debugName, 
                    value = v43
                }, v36.appPage);
                v39[v44] = v45;
                return;
            end;
        end);
        if not l_status_0 then
            v4.reportError(v3.SduiErrorType.FailedToParseProp, {
                message = ("ClientBinding - failed to build prop %*: %*. %*"):format(v44, l_result_0, l_result_0), 
                propName = ("%*"):format(v44), 
                name = v36.debugName, 
                value = v43
            }, v36.appPage);
        end;
    end;
    return v39, v40, v41;
end;
local v53 = {
    __index = function(v51, v52) --[[ Line: 174 ]] --[[ Name: __index ]]
        if v52 == "analyticsData" then
            return v51.analyticsContext and v51.analyticsContext.analyticsData;
        else
            return nil;
        end;
    end
};
return {
    buildPropTable = v50, 
    buildProp = v17, 
    buildConfigForComponent = function(v54, v55, v56, v57, _) --[[ Line: 183 ]] --[[ Name: buildConfigForComponent ]]
        -- upvalues: v2 (copy), v5 (copy), v4 (copy), v3 (copy), v11 (copy), v10 (copy), v53 (copy), v50 (copy), v6 (copy), l_FFlagSduiPropMapping_0 (copy), v12 (copy), l_FFlagSduiComponentFiltering_0 (copy), v17 (copy), l_PropResultCategory_0 (copy)
        if not v54 or not next(v54) then
            error("Attempt to buildConfigForComponent with nil template");
        end;
        local l_value_0 = v54.kind.value;
        local v60 = l_value_0.shared and l_value_0.shared.data or {};
        local v64 = v2.createComputed(function(v61) --[[ Line: 198 ]]
            -- upvalues: v5 (ref), v55 (copy), v60 (copy), v4 (ref), v3 (ref), v56 (copy), v11 (ref)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 199 ]]
                -- upvalues: v5 (ref), v55 (ref), v61 (copy), v60 (ref)
                return v5(v55(v61), v60);
            end);
            if not l_status_1 then
                v4.reportError(v3.SduiErrorType.FailedToBuildBindingSources, {
                    name = v56.debugName, 
                    message = v11.stringifyValue(l_result_1)
                }, v56.appPage);
                return {};
            else
                return l_result_1;
            end;
        end);
        local v65 = l_value_0.shared and l_value_0.shared.component_type;
        if not v65 then
            error("Could not determine ui component type");
        end;
        local v66 = v10.mapUiComponentTypeToLua(v65);
        local v67 = {
            __processed = true, 
            __isClientBinding = true, 
            componentType = v66
        };
        setmetatable(v67, v53);
        local v68 = nil;
        local v69 = nil;
        if l_value_0.shared and l_value_0.shared.analytics_data then
            local v70, v71 = v50(l_value_0.shared.analytics_data, v64, v55, v56, nil, nil);
            v68 = v70;
            v69 = v71;
        end;
        v67.analyticsContext = v6(v68, v69, v57, v56);
        if l_value_0.props then
            local v72 = nil;
            if l_FFlagSduiPropMapping_0 then
                local v73 = v12().getComponentDefinition(v66);
                v72 = v73 and v73.propMapping or nil;
            end;
            local v74 = nil;
            local v75 = nil;
            local v76, v77, v78 = v50(l_value_0.props, v64, v55, v56, v67.analyticsContext, v72);
            v67.props = v76;
            v74 = v77;
            v75 = v78;
            if v74 ~= nil and next(v74) then
                v67.propSignals = v74;
            end;
            if v75 ~= nil and next(v75) then
                v67.nestedComponentConfigs = v75;
            end;
        end;
        if l_FFlagSduiComponentFiltering_0 and l_value_0.shared and l_value_0.shared.is_component_filtered then
            local l_is_component_filtered_0 = l_value_0.shared.is_component_filtered;
            local v80, v81, v82, v83 = pcall(function() --[[ Line: 269 ]]
                -- upvalues: v17 (ref), l_is_component_filtered_0 (copy), v64 (copy), v55 (copy), v56 (copy), v67 (copy)
                return v17(l_is_component_filtered_0, v64, v55, v56, v67.analyticsContext);
            end);
            if not v80 or v83 or v82 == l_PropResultCategory_0.Failed then
                local v84 = if v83 then v11.stringifyValue(v83) else v11.stringifyValue(v81);
                local v85 = v11.stringifyValue(l_is_component_filtered_0);
                v4.reportError(v3.SduiErrorType.FailedToParseProp, {
                    message = ("Failed to build is_component_filtered prop: %*"):format(v84), 
                    name = v56.debugName, 
                    value = v85
                }, v56.appPage);
                return v67;
            elseif v82 == l_PropResultCategory_0.PropSignal then
                v67.isComponentFilteredSignal = v81;
                return v67;
            elseif v82 == l_PropResultCategory_0.Literal then
                v67.isComponentFilteredSignal = function() --[[ Line: 293 ]]
                    -- upvalues: v81 (copy)
                    return {
                        data = v81
                    };
                end;
            end;
        end;
        return v67;
    end
};