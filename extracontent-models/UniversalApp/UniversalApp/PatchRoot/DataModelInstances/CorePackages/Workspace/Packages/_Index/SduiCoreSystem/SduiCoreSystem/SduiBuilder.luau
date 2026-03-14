local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.tutils);
local l_SduiBuilderProcessingPhase_0 = require(l_script_FirstAncestor_0.SduiBuilderTypes).SduiBuilderProcessingPhase;
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local v6 = require(l_script_FirstAncestor_0.SduiConfigTypes);
local l_SduiErrorType_0 = require(l_script_FirstAncestor_0.SduiErrors).SduiErrorType;
local v8 = require(l_script_FirstAncestor_0.parseProps);
local v9 = require(l_script_FirstAncestor_0.validateInterface);
local l_UiComponentInterface_0 = v6.UiComponentInterface;
local v11 = require(l_Parent_0.SduiCompat);
local l_mapServerBindingProps_0 = v11.mapServerBindingProps;
local l_ServerBindingPropMap_0 = v11.ServerBindingPropMap;
local l_FFlagSduiClientBinding_0 = require(l_Parent_0.SharedFlags).FFlagSduiClientBinding;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v16 = {};
return {
    getComponentType = function(v17, v18) --[[ Line: 32 ]] --[[ Name: getComponentType ]]
        -- upvalues: l_FFlagSduiClientBinding_0 (copy)
        if (not l_FFlagSduiClientBinding_0 or not v17.__isClientBinding) and v18.templateRegistry:shouldResolveTemplate(v17) then
            v18.templateRegistry:resolveTemplateForConfig(v17, v18);
        end;
        return v17.componentType;
    end, 
    buildAnalyticsContext = function(v19, v20, v21) --[[ Line: 43 ]] --[[ Name: buildAnalyticsContext ]]
        -- upvalues: v16 (copy), v2 (copy)
        v20 = v20 or v16;
        local v22 = v19.analyticsData or v16;
        local v23 = v2.Dictionary.join(v20.ancestorAnalyticsData or v16, v20.analyticsData or v16);
        local l_getCollectionData_0 = v20.getCollectionData;
        if v21 then
            v22 = v2.Dictionary.join(v22, v21);
        end;
        return {
            analyticsData = v22, 
            ancestorAnalyticsData = v23, 
            getCollectionData = l_getCollectionData_0
        };
    end, 
    tryCreateEagerProcessedComponentConfig = function(v25, v26, v27, v28, v29) --[[ Line: 77 ]] --[[ Name: tryCreateEagerProcessedComponentConfig ]]
        -- upvalues: l_SduiErrorType_0 (copy), v3 (copy), v9 (copy), l_UiComponentInterface_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_mapServerBindingProps_0 (copy), l_ServerBindingPropMap_0 (copy), v8 (copy), l_SduiBuilderProcessingPhase_0 (copy)
        local l_instrumentation_0 = v26.dependencies.instrumentation;
        l_instrumentation_0:startTimerFlow("EagerProcess");
        if not v25 then
            v26.dependencies.logger.reportError(l_SduiErrorType_0.NilComponentConfig, {
                name = v27
            }, v26.appPage);
            l_instrumentation_0:stopTimerFlow("EagerProcess", v26, true);
            return false, v25;
        else
            assert(v25, "componentConfig must exist");
            if v25.__processed then
                v26.dependencies.logger.reportError(l_SduiErrorType_0.EagerReprocessing, {
                    message = "Eagerly evaluating a component that has already been processed", 
                    componentType = v25.componentType, 
                    name = v27
                }, v26.appPage);
                l_instrumentation_0:stopTimerFlow("EagerProcess", v26, true);
                return true, v25;
            else
                local v31 = if v29 then v3.deepCopy(v25) else v25;
                if v26.templateRegistry:shouldResolveTemplate(v31) then
                    local l_props_0 = v31.props;
                    if l_props_0 and l_props_0.itemTemplateKey then
                        if l_props_0.items then
                            for _, v34 in l_props_0.items do
                                if v34.templateKey == nil then
                                    v34.templateKey = l_props_0.itemTemplateKey;
                                end;
                            end;
                        elseif l_props_0.item and l_props_0.item.templateKey == nil then
                            l_props_0.item.templateKey = l_props_0.itemTemplateKey;
                        end;
                    end;
                    if not v26.templateRegistry:resolveTemplateForConfig(v31, v26) then
                        l_instrumentation_0:stopTimerFlow("EagerProcess", v26, true);
                        return false, v25;
                    end;
                end;
                local l_componentType_0 = v31.componentType;
                if v26.componentDefinitions:getComponent(l_componentType_0) == nil then
                    v26.dependencies.logger.reportError(l_SduiErrorType_0.NoComponentRegistered, {
                        componentType = l_componentType_0, 
                        name = v27
                    }, v26.appPage);
                    l_instrumentation_0:stopTimerFlow("EagerProcess", v26, true);
                    return false, v25;
                else
                    local v36, v37 = v9(v31, l_UiComponentInterface_0, false);
                    if not v36 then
                        v26.dependencies.logger.reportError(l_SduiErrorType_0.InvalidComponentConfig, {
                            message = ("(Eager) Invalid config for component. err: %*"):format(v37), 
                            componentType = l_componentType_0, 
                            name = v27, 
                            value = v31
                        }, v26.appPage);
                        l_instrumentation_0:stopTimerFlow("EagerProcess", v26, true);
                        return false, v25;
                    else
                        if l_FFlagSduiServerCompat_0 and v31.props then
                            local v38, v39 = l_mapServerBindingProps_0(v31.props, l_ServerBindingPropMap_0);
                            if v38 then
                                for v40, v41 in v38 do
                                    v31.props[v40] = v41;
                                end;
                            end;
                            if v39 then
                                v26.dependencies.logger.reportError(l_SduiErrorType_0.UnmappedServerBindingProp, {
                                    componentType = l_componentType_0, 
                                    name = v27, 
                                    message = ("Unmapped PascalCase props detected: %*. These props will not reach the camelCase component."):format((table.concat(v39, ", ")))
                                }, v26.appPage);
                            end;
                        end;
                        if v31.props then
                            v8(l_componentType_0, v31.props, v27, v26, v28, nil, l_SduiBuilderProcessingPhase_0.Eager);
                        end;
                        if v31.conditionalProps then
                            for _, v43 in v31.conditionalProps do
                                if l_FFlagSduiServerCompat_0 then
                                    local v44, v45 = l_mapServerBindingProps_0(v43.propOverrides, l_ServerBindingPropMap_0);
                                    if v44 then
                                        for v46, v47 in v44 do
                                            v43.propOverrides[v46] = v47;
                                        end;
                                    end;
                                    if v45 then
                                        v26.dependencies.logger.reportError(l_SduiErrorType_0.UnmappedServerBindingProp, {
                                            componentType = l_componentType_0, 
                                            name = v27, 
                                            message = ("Unmapped PascalCase conditional props detected: %*. These props will not reach the camelCase component."):format((table.concat(v45, ", ")))
                                        }, v26.appPage);
                                    end;
                                end;
                                v8(l_componentType_0, v43.propOverrides, v27, v26, v28, nil, l_SduiBuilderProcessingPhase_0.Eager);
                            end;
                        end;
                        local v48 = v26.componentDefinitions:getPropInterface(l_componentType_0);
                        if v48 then
                            local v49 = nil;
                            local v50, v51 = v9(v31.props, v48);
                            v49 = v50;
                            v37 = v51;
                            if not v49 then
                                v26.dependencies.logger.reportError(l_SduiErrorType_0.InvalidProps, {
                                    componentType = l_componentType_0, 
                                    name = v27, 
                                    message = v37
                                }, v26.appPage);
                                l_instrumentation_0:stopTimerFlow("EagerProcess", v26, true);
                                return false, v25;
                            end;
                        end;
                        v31.__processed = true;
                        l_instrumentation_0:stopTimerFlow("EagerProcess", v26);
                        return true, v31;
                    end;
                end;
            end;
        end;
    end
};