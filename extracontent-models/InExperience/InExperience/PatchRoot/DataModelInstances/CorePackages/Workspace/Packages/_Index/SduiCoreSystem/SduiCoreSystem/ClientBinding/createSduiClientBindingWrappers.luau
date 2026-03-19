local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_script_FirstAncestor_0.compareSduiProps);
local l_SduiErrorType_0 = require(l_script_FirstAncestor_0.SduiErrors).SduiErrorType;
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local v10 = require(l_script_FirstAncestor_0.getSduiComponentRegistry);
local v11 = require(l_script_FirstAncestor_0.validateInterface);
local l_FFlagSduiComponentFiltering_0 = require(l_Parent_0.SharedFlags).FFlagSduiComponentFiltering;
local function v14(_) --[[ Line: 22 ]] --[[ Name: SduiErrorComponent ]]
    -- upvalues: v2 (copy)
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 100, 0, 100)
    });
end;
local function v34(v15, v16, v17) --[[ Line: 37 ]] --[[ Name: buildWrappedComponent ]]
    -- upvalues: v2 (copy), v10 (copy), l_SduiErrorType_0 (copy), v14 (copy), v11 (copy)
    local l_componentType_0 = v16.componentConfig.componentType;
    local l_sduiContext_0 = v16.sduiContext;
    if v16.localAnalyticsData then
        v16.componentConfig.analyticsContext.setLocalAnalyticsData(v16.localAnalyticsData);
    end;
    local v20 = if v16.componentConfig.props then table.clone(v16.componentConfig.props) else {};
    if v17 then
        for v21, v22 in v17 do
            if not v22.isNestedComponentConfig then
                v20[v21] = v22.data;
            end;
        end;
    end;
    if v16.extraLocalProps then
        for v23, v24 in v16.extraLocalProps do
            v20[v23] = v24;
        end;
    end;
    v20.componentConfig = v16.componentConfig;
    v20.sduiContext = v16.sduiContext;
    v20.debugName = v16.debugName;
    v20.analyticsContext = v16.componentConfig.analyticsContext;
    local v25 = nil;
    if v17 then
        for v26, v27 in v17 do
            if v27.isNestedComponentConfig then
                if v25 == nil then
                    v25 = if v16.componentConfig.nestedComponentConfigs then table.clone(v16.componentConfig.nestedComponentConfigs) else {};
                end;
                v25[v26] = v27.data;
            end;
        end;
    end;
    v25 = v25 or v16.componentConfig.nestedComponentConfigs;
    if v25 then
        for v28, v29 in v25 do
            local v30 = v15(v29);
            v20[v28] = v2.createElement(v30, {
                sduiContext = v16.sduiContext, 
                componentConfig = v29, 
                debugName = ("%*.%*"):format(v16.debugName, v28)
            });
        end;
    end;
    local v31 = v10().getComponentDefinition(l_componentType_0);
    local v32 = v31 and v31.component or nil;
    if v32 == nil then
        l_sduiContext_0.dependencies.logger.reportError(l_SduiErrorType_0.NoComponentRegistered, {
            componentType = l_componentType_0, 
            name = v16.debugName
        }, l_sduiContext_0.appPage);
        return v2.createElement(v14);
    else
        local v33 = v31 and v31.propInterface;
        if v33 and not v11(v20, v33) then
            return nil;
        else
            return v2.createElement(v32, v20);
        end;
    end;
end;
return function(v35) --[[ Line: 130 ]] --[[ Name: createSduiClientBindingWrappers ]]
    -- upvalues: v2 (copy), v34 (copy), v5 (copy), l_FFlagSduiComponentFiltering_0 (copy), v3 (copy), v4 (copy)
    local v37 = v2.memo(function(v36) --[[ Line: 136 ]]
        -- upvalues: v34 (ref), v35 (copy)
        return v34(v35, v36);
    end, v5);
    local v49 = v2.memo(function(v38) --[[ Line: 142 ]]
        -- upvalues: l_FFlagSduiComponentFiltering_0 (ref), v2 (ref), v3 (ref), v4 (ref), v34 (ref), v35 (copy)
        local l_propSignals_0 = v38.componentConfig.propSignals;
        local v40 = if l_FFlagSduiComponentFiltering_0 then v38.componentConfig.isComponentFilteredSignal else nil;
        local v47 = v2.useMemo(function() --[[ Line: 147 ]]
            -- upvalues: l_propSignals_0 (copy), l_FFlagSduiComponentFiltering_0 (ref), v40 (copy), v3 (ref)
            assert(l_propSignals_0 or l_FFlagSduiComponentFiltering_0 and v40, "propSignals or isComponentFilteredSignal must exist");
            return v3.createComputed(function(v41) --[[ Line: 153 ]]
                -- upvalues: l_FFlagSduiComponentFiltering_0 (ref), l_propSignals_0 (ref), v40 (ref)
                local v42 = {};
                if l_FFlagSduiComponentFiltering_0 then
                    if l_propSignals_0 then
                        for v43, v44 in l_propSignals_0 do
                            v42[v43] = v44(v41);
                        end;
                    end;
                    if v40 and v40(v41).data == true then
                        v42.__isComponentFiltered = true;
                        return v42;
                    end;
                else
                    for v45, v46 in l_propSignals_0 do
                        v42[v45] = v46(v41);
                    end;
                end;
                return v42;
            end);
        end, {
            l_propSignals_0, 
            if l_FFlagSduiComponentFiltering_0 then v40 else nil
        });
        local v48 = v4.useSignalState(v47);
        if l_FFlagSduiComponentFiltering_0 and v48.__isComponentFiltered == true then
            return nil;
        else
            return v34(v35, v38, v48);
        end;
    end, v5);
    return {
        SduiClientBindingThinWrapper = v37, 
        SduiDataBindingWrapper = v49
    };
end;