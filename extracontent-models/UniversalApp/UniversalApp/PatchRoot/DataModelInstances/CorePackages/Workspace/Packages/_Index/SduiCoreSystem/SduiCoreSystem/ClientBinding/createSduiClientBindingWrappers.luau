local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_script_FirstAncestor_0.compareSduiProps);
local l_SduiErrorType_0 = require(l_script_FirstAncestor_0.SduiErrors).SduiErrorType;
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local v11 = require(l_script_FirstAncestor_0.getSduiComponentRegistry);
local v12 = require(l_script_FirstAncestor_0.validateInterface);
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
local l_FFlagSduiComponentFiltering_0 = require(l_Parent_0.SharedFlags).FFlagSduiComponentFiltering;
local v15 = {};
local function v17(_) --[[ Line: 27 ]] --[[ Name: SduiErrorComponent ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 100, 0, 100)
    });
end;
local function v40(v18, v19, v20) --[[ Line: 42 ]] --[[ Name: buildWrappedComponent ]]
    -- upvalues: l_FFlagSduiInputDataSignals_0 (copy), v2 (copy), v15 (copy), v3 (copy), v11 (copy), l_SduiErrorType_0 (copy), v17 (copy), v12 (copy)
    local l_componentType_0 = v19.componentConfig.componentType;
    local l_sduiContext_0 = v19.sduiContext;
    if v19.localAnalyticsData then
        v19.componentConfig.analyticsContext.setLocalAnalyticsData(v19.localAnalyticsData);
    end;
    local v23 = nil;
    if l_FFlagSduiInputDataSignals_0 then
        v23 = if v19.componentConfig.props then table.clone(v19.componentConfig.props) else {};
        if v20 then
            for v24, v25 in v20 do
                if not v25.isNestedComponentConfig then
                    v23[v24] = v25.data;
                end;
            end;
        end;
        if v19.extraLocalProps then
            for v26, v27 in v19.extraLocalProps do
                v23[v26] = v27;
            end;
        end;
    else
        v23 = v2.Dictionary.join(v19.componentConfig.props or v15, v20 or v15, v19.extraLocalProps or v15);
    end;
    v23.componentConfig = v19.componentConfig;
    v23.sduiContext = v19.sduiContext;
    v23.debugName = v19.debugName;
    v23.analyticsContext = v19.componentConfig.analyticsContext;
    if l_FFlagSduiInputDataSignals_0 then
        local v28 = nil;
        if v20 then
            for v29, v30 in v20 do
                if v30.isNestedComponentConfig then
                    if v28 == nil then
                        v28 = if v19.componentConfig.nestedComponentConfigs then table.clone(v19.componentConfig.nestedComponentConfigs) else {};
                    end;
                    v28[v29] = v30.data;
                end;
            end;
        end;
        v28 = v28 or v19.componentConfig.nestedComponentConfigs;
        if v28 then
            for v31, v32 in v28 do
                local v33 = v18(v32);
                v23[v31] = v3.createElement(v33, {
                    sduiContext = v19.sduiContext, 
                    componentConfig = v32, 
                    debugName = ("%*.%*"):format(v19.debugName, v31)
                });
            end;
        end;
    elseif v19.componentConfig.nestedComponentConfigs then
        for v34, v35 in v19.componentConfig.nestedComponentConfigs do
            local v36 = v18(v35);
            v23[v34] = v3.createElement(v36, {
                sduiContext = v19.sduiContext, 
                componentConfig = v35, 
                debugName = ("%*.%*"):format(v19.debugName, v34)
            });
        end;
    end;
    local v37 = v11().getComponentDefinition(l_componentType_0);
    local v38 = v37 and v37.component or nil;
    if v38 == nil then
        l_sduiContext_0.dependencies.logger.reportError(l_SduiErrorType_0.NoComponentRegistered, {
            componentType = l_componentType_0, 
            name = v19.debugName
        }, l_sduiContext_0.appPage);
        return v3.createElement(v17);
    else
        local v39 = v37 and v37.propInterface;
        if v39 and not v12(v23, v39) then
            return nil;
        else
            return v3.createElement(v38, v23);
        end;
    end;
end;
return function(v41) --[[ Line: 155 ]] --[[ Name: createSduiClientBindingWrappers ]]
    -- upvalues: v3 (copy), v40 (copy), v6 (copy), l_FFlagSduiComponentFiltering_0 (copy), v4 (copy), v5 (copy)
    local v43 = v3.memo(function(v42) --[[ Line: 161 ]]
        -- upvalues: v40 (ref), v41 (copy)
        return v40(v41, v42);
    end, v6);
    local v55 = v3.memo(function(v44) --[[ Line: 167 ]]
        -- upvalues: l_FFlagSduiComponentFiltering_0 (ref), v3 (ref), v4 (ref), v5 (ref), v40 (ref), v41 (copy)
        local l_propSignals_0 = v44.componentConfig.propSignals;
        local v46 = if l_FFlagSduiComponentFiltering_0 then v44.componentConfig.isComponentFilteredSignal else nil;
        local v53 = v3.useMemo(function() --[[ Line: 172 ]]
            -- upvalues: l_propSignals_0 (copy), l_FFlagSduiComponentFiltering_0 (ref), v46 (copy), v4 (ref)
            assert(l_propSignals_0 or l_FFlagSduiComponentFiltering_0 and v46, "propSignals or isComponentFilteredSignal must exist");
            return v4.createComputed(function(v47) --[[ Line: 178 ]]
                -- upvalues: l_FFlagSduiComponentFiltering_0 (ref), l_propSignals_0 (ref), v46 (ref)
                local v48 = {};
                if l_FFlagSduiComponentFiltering_0 then
                    if l_propSignals_0 then
                        for v49, v50 in l_propSignals_0 do
                            v48[v49] = v50(v47);
                        end;
                    end;
                    if v46 and v46(v47).data == true then
                        v48.__isComponentFiltered = true;
                        return v48;
                    end;
                else
                    for v51, v52 in l_propSignals_0 do
                        v48[v51] = v52(v47);
                    end;
                end;
                return v48;
            end);
        end, {
            l_propSignals_0, 
            if l_FFlagSduiComponentFiltering_0 then v46 else nil
        });
        local v54 = v5.useSignalState(v53);
        if l_FFlagSduiComponentFiltering_0 and v54.__isComponentFiltered == true then
            return nil;
        else
            return v40(v41, v44, v54);
        end;
    end, v6);
    return {
        SduiClientBindingThinWrapper = v43, 
        SduiDataBindingWrapper = v55
    };
end;