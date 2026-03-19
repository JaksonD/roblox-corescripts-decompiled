local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.SduiBuilder);
local v5 = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local v7 = require(l_script_FirstAncestor_0.ConditionalProps.SduiConditionalPropWrapper);
local v8 = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v9 = require(l_script_FirstAncestor_0.SduiErrors);
local l_SduiErrorType_0 = v9.SduiErrorType;
local l_SduiBuilderProcessingPhase_0 = v5.SduiBuilderProcessingPhase;
local v12 = require(l_script_FirstAncestor_0.compareSduiProps);
local v13 = require(l_script_FirstAncestor_0.compareSduiAnalyticsContext);
local v14 = require(l_Parent_0.SduiCompat);
local l_mapServerBindingProps_0 = v14.mapServerBindingProps;
local l_ServerBindingPropMap_0 = v14.ServerBindingPropMap;
local v17 = require(l_script_FirstAncestor_0.parseProps);
local v18 = require(l_script_FirstAncestor_0.validateInterface);
local l_UiComponentInterface_0 = v8.UiComponentInterface;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v21 = {};
local v22 = nil;
local function v24(_) --[[ Line: 39 ]] --[[ Name: SduiErrorComponent ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 100, 0, 100)
    });
end;
local v53 = v3.memo(function(v25) --[[ Line: 47 ]]
    -- upvalues: l_SduiBuilderProcessingPhase_0 (copy), v3 (copy), v4 (copy), v13 (copy), l_SduiErrorType_0 (copy), v24 (copy), v2 (copy), v21 (copy), l_FFlagSduiServerCompat_0 (copy), l_mapServerBindingProps_0 (copy), l_ServerBindingPropMap_0 (copy), v17 (copy), v18 (copy), v22 (ref)
    local l___processed_0 = v25.componentConfig.__processed;
    local v27 = if l___processed_0 then l_SduiBuilderProcessingPhase_0.Render else l_SduiBuilderProcessingPhase_0.Lazy;
    local l_componentConfig_0 = v25.componentConfig;
    local l_sduiContext_0 = v25.sduiContext;
    local l_debugName_0 = v25.debugName;
    local l_parentAnalyticsContext_0 = v25.parentAnalyticsContext;
    local l_localAnalyticsData_0 = v25.localAnalyticsData;
    local l_extraLocalProps_0 = v25.extraLocalProps;
    local l_conditionalProps_0 = v25.conditionalProps;
    local l_instrumentation_0 = l_sduiContext_0.dependencies.instrumentation;
    l_instrumentation_0:startTimerFlow("BuildPropsAndChildren");
    local v36 = v3.useRef(nil);
    if v36.current == nil then
        v36.current = v4.buildAnalyticsContext(l_componentConfig_0, l_parentAnalyticsContext_0, l_localAnalyticsData_0);
    else
        local v37 = v4.buildAnalyticsContext(l_componentConfig_0, l_parentAnalyticsContext_0, l_localAnalyticsData_0);
        if not v13(v36.current, v37) then
            v36.current = v37;
        end;
    end;
    local l_current_0 = v36.current;
    local v39 = v4.getComponentType(l_componentConfig_0, l_sduiContext_0);
    if v39 == nil then
        l_sduiContext_0.dependencies.logger.reportError(l_SduiErrorType_0.NilComponentType, {
            message = ("Unable to resolve componentType for component with template %*"):format(l_componentConfig_0 and l_componentConfig_0.templateKey or nil), 
            name = l_debugName_0
        }, l_sduiContext_0.appPage);
        l_instrumentation_0:stopTimerFlow("BuildPropsAndChildren", l_sduiContext_0, true);
        return v3.createElement(v24);
    else
        local v40 = l_sduiContext_0.componentDefinitions:getComponent(v39);
        if v40 == nil then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrorType_0.NoComponentRegistered, {
                componentType = v39, 
                name = l_debugName_0
            }, l_sduiContext_0.appPage);
            l_instrumentation_0:stopTimerFlow("BuildPropsAndChildren", l_sduiContext_0, true);
            return v3.createElement(v24);
        else
            local v41 = nil;
            l_instrumentation_0:startTimerFlow("ParseProps");
            v41 = v2.Dictionary.join(l_componentConfig_0.props or v21, l_conditionalProps_0 or v21);
            if l_FFlagSduiServerCompat_0 and not l___processed_0 then
                local v42, v43 = l_mapServerBindingProps_0(v41, l_ServerBindingPropMap_0);
                if v42 then
                    for v44, v45 in v42 do
                        v41[v44] = v45;
                    end;
                end;
                if v43 then
                    l_sduiContext_0.dependencies.logger.reportError(l_SduiErrorType_0.UnmappedServerBindingProp, {
                        componentType = v39, 
                        name = l_debugName_0, 
                        message = ("Unmapped PascalCase props detected: %*. These props will not reach the camelCase component."):format((table.concat(v43, ", ")))
                    }, l_sduiContext_0.appPage);
                end;
            end;
            v17(v39, v41, l_debugName_0, l_sduiContext_0, l_current_0, nil, v27);
            if l_extraLocalProps_0 then
                v41 = v2.Dictionary.join(v41, l_extraLocalProps_0);
            end;
            v41.componentConfig = l_componentConfig_0;
            v41.sduiContext = l_sduiContext_0;
            v41.debugName = l_debugName_0;
            v41.analyticsContext = l_current_0;
            if not l___processed_0 then
                local v46 = l_sduiContext_0.componentDefinitions:getPropInterface(v39);
                if v46 then
                    local v47, v48 = v18(v41, v46);
                    if not v47 then
                        l_instrumentation_0:stopTimerFlow("ParseProps", l_sduiContext_0, true);
                        l_sduiContext_0.dependencies.logger.reportError(l_SduiErrorType_0.InvalidProps, {
                            componentType = v39, 
                            name = l_debugName_0, 
                            message = v48
                        }, l_sduiContext_0.appPage);
                        return v3.createElement(v24);
                    end;
                end;
            end;
            l_instrumentation_0:stopTimerFlow("ParseProps", l_sduiContext_0);
            local v49 = if l_componentConfig_0.children then {} else nil;
            if l_componentConfig_0.children then
                assert(v49, "reactChildren must exist");
                for v50, v51 in l_componentConfig_0.children do
                    local v52 = ("%*_%*"):format(v51.componentType, v50);
                    v49[v52] = v3.createElement(v22, {
                        componentConfig = v51, 
                        sduiContext = l_sduiContext_0, 
                        parentAnalyticsContext = l_current_0, 
                        extraLocalProps = {
                            index = v50, 
                            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v50 else nil, 
                            layoutOrder = if l_FFlagSduiServerCompat_0 then v50 else nil
                        }, 
                        debugName = v52
                    });
                end;
            end;
            l_instrumentation_0:stopTimerFlow("BuildPropsAndChildren", l_sduiContext_0);
            return v3.createElement(v40, v41, v49);
        end;
    end;
end, v12);
v22 = function(v54) --[[ Line: 169 ]]
    -- upvalues: l_SduiErrorType_0 (copy), v3 (copy), v24 (copy), v18 (copy), l_UiComponentInterface_0 (copy), v9 (copy), v7 (copy), v53 (copy)
    if not v54.componentConfig then
        v54.sduiContext.dependencies.logger.reportError(l_SduiErrorType_0.NilComponentConfig, {
            name = v54.debugName
        }, v54.sduiContext.appPage);
        return v3.createElement(v24);
    else
        if not v54.componentConfig.__processed then
            if v54.sduiContext.templateRegistry:shouldResolveTemplate(v54.componentConfig) then
                v54.sduiContext.templateRegistry:resolveTemplateForConfig(v54.componentConfig, v54.sduiContext);
            end;
            local v55, v56 = v18(v54.componentConfig, l_UiComponentInterface_0, false);
            if not v55 then
                v54.sduiContext.dependencies.logger.reportError(v9.SduiErrorType.InvalidComponentConfig, {
                    message = ("Invalid config for component. err: %*"):format(v56), 
                    componentType = v54.componentConfig.componentType, 
                    name = v54.debugName
                }, v54.sduiContext.appPage);
            end;
        end;
        if v54.componentConfig.conditionalProps then
            return v3.createElement(v7, {
                wrappedComponent = v53, 
                sduiContext = v54.sduiContext, 
                parentAnalyticsContext = v54.parentAnalyticsContext, 
                extraLocalProps = v54.extraLocalProps, 
                componentConfig = v54.componentConfig, 
                debugName = v54.debugName, 
                localAnalyticsData = v54.localAnalyticsData
            });
        else
            return v3.createElement(v53, v54);
        end;
    end;
end;
return v3.memo(v22, v12);