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
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v15 = {};
return {
    getComponentType = function(v16, v17) --[[ Line: 31 ]] --[[ Name: getComponentType ]]
        if not v16.__isClientBinding and v17.templateRegistry:shouldResolveTemplate(v16) then
            v17.templateRegistry:resolveTemplateForConfig(v16, v17);
        end;
        return v16.componentType;
    end, 
    buildAnalyticsContext = function(v18, v19, v20) --[[ Line: 41 ]] --[[ Name: buildAnalyticsContext ]]
        -- upvalues: v15 (copy), v2 (copy)
        v19 = v19 or v15;
        local v21 = v18.analyticsData or v15;
        local v22 = v2.Dictionary.join(v19.ancestorAnalyticsData or v15, v19.analyticsData or v15);
        local l_getCollectionData_0 = v19.getCollectionData;
        if v20 then
            v21 = v2.Dictionary.join(v21, v20);
        end;
        return {
            analyticsData = v21, 
            ancestorAnalyticsData = v22, 
            getCollectionData = l_getCollectionData_0
        };
    end, 
    tryCreateEagerProcessedComponentConfig = function(v24, v25, v26, v27, v28) --[[ Line: 75 ]] --[[ Name: tryCreateEagerProcessedComponentConfig ]]
        -- upvalues: l_SduiErrorType_0 (copy), v3 (copy), v9 (copy), l_UiComponentInterface_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_mapServerBindingProps_0 (copy), l_ServerBindingPropMap_0 (copy), v8 (copy), l_SduiBuilderProcessingPhase_0 (copy)
        local l_instrumentation_0 = v25.dependencies.instrumentation;
        l_instrumentation_0:startTimerFlow("EagerProcess");
        if not v24 then
            v25.dependencies.logger.reportError(l_SduiErrorType_0.NilComponentConfig, {
                name = v26
            }, v25.appPage);
            l_instrumentation_0:stopTimerFlow("EagerProcess", v25, true);
            return false, v24;
        else
            assert(v24, "componentConfig must exist");
            if v24.__processed then
                v25.dependencies.logger.reportError(l_SduiErrorType_0.EagerReprocessing, {
                    message = "Eagerly evaluating a component that has already been processed", 
                    componentType = v24.componentType, 
                    name = v26
                }, v25.appPage);
                l_instrumentation_0:stopTimerFlow("EagerProcess", v25, true);
                return true, v24;
            else
                local v30 = if v28 then v3.deepCopy(v24) else v24;
                if v25.templateRegistry:shouldResolveTemplate(v30) then
                    local l_props_0 = v30.props;
                    if l_props_0 and l_props_0.itemTemplateKey then
                        if l_props_0.items then
                            for _, v33 in l_props_0.items do
                                if v33.templateKey == nil then
                                    v33.templateKey = l_props_0.itemTemplateKey;
                                end;
                            end;
                        elseif l_props_0.item and l_props_0.item.templateKey == nil then
                            l_props_0.item.templateKey = l_props_0.itemTemplateKey;
                        end;
                    end;
                    if not v25.templateRegistry:resolveTemplateForConfig(v30, v25) then
                        l_instrumentation_0:stopTimerFlow("EagerProcess", v25, true);
                        return false, v24;
                    end;
                end;
                local l_componentType_0 = v30.componentType;
                if v25.componentDefinitions:getComponent(l_componentType_0) == nil then
                    v25.dependencies.logger.reportError(l_SduiErrorType_0.NoComponentRegistered, {
                        componentType = l_componentType_0, 
                        name = v26
                    }, v25.appPage);
                    l_instrumentation_0:stopTimerFlow("EagerProcess", v25, true);
                    return false, v24;
                else
                    local v35, v36 = v9(v30, l_UiComponentInterface_0, false);
                    if not v35 then
                        v25.dependencies.logger.reportError(l_SduiErrorType_0.InvalidComponentConfig, {
                            message = ("(Eager) Invalid config for component. err: %*"):format(v36), 
                            componentType = l_componentType_0, 
                            name = v26, 
                            value = v30
                        }, v25.appPage);
                        l_instrumentation_0:stopTimerFlow("EagerProcess", v25, true);
                        return false, v24;
                    else
                        if l_FFlagSduiServerCompat_0 and v30.props then
                            local v37, v38 = l_mapServerBindingProps_0(v30.props, l_ServerBindingPropMap_0);
                            if v37 then
                                for v39, v40 in v37 do
                                    v30.props[v39] = v40;
                                end;
                            end;
                            if v38 then
                                v25.dependencies.logger.reportError(l_SduiErrorType_0.UnmappedServerBindingProp, {
                                    componentType = l_componentType_0, 
                                    name = v26, 
                                    message = ("Unmapped PascalCase props detected: %*. These props will not reach the camelCase component."):format((table.concat(v38, ", ")))
                                }, v25.appPage);
                            end;
                        end;
                        if v30.props then
                            v8(l_componentType_0, v30.props, v26, v25, v27, nil, l_SduiBuilderProcessingPhase_0.Eager);
                        end;
                        if v30.conditionalProps then
                            for _, v42 in v30.conditionalProps do
                                if l_FFlagSduiServerCompat_0 then
                                    local v43, v44 = l_mapServerBindingProps_0(v42.propOverrides, l_ServerBindingPropMap_0);
                                    if v43 then
                                        for v45, v46 in v43 do
                                            v42.propOverrides[v45] = v46;
                                        end;
                                    end;
                                    if v44 then
                                        v25.dependencies.logger.reportError(l_SduiErrorType_0.UnmappedServerBindingProp, {
                                            componentType = l_componentType_0, 
                                            name = v26, 
                                            message = ("Unmapped PascalCase conditional props detected: %*. These props will not reach the camelCase component."):format((table.concat(v44, ", ")))
                                        }, v25.appPage);
                                    end;
                                end;
                                v8(l_componentType_0, v42.propOverrides, v26, v25, v27, nil, l_SduiBuilderProcessingPhase_0.Eager);
                            end;
                        end;
                        local v47 = v25.componentDefinitions:getPropInterface(l_componentType_0);
                        if v47 then
                            local v48 = nil;
                            local v49, v50 = v9(v30.props, v47);
                            v48 = v49;
                            v36 = v50;
                            if not v48 then
                                v25.dependencies.logger.reportError(l_SduiErrorType_0.InvalidProps, {
                                    componentType = l_componentType_0, 
                                    name = v26, 
                                    message = v36
                                }, v25.appPage);
                                l_instrumentation_0:stopTimerFlow("EagerProcess", v25, true);
                                return false, v24;
                            end;
                        end;
                        v30.__processed = true;
                        l_instrumentation_0:stopTimerFlow("EagerProcess", v25);
                        return true, v30;
                    end;
                end;
            end;
        end;
    end
};