local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.SduiBuilder);
local v5 = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local l_SduiErrorType_0 = require(l_script_FirstAncestor_0.SduiErrors).SduiErrorType;
local l_SduiBuilderProcessingPhase_0 = v5.SduiBuilderProcessingPhase;
local v10 = require(l_script_FirstAncestor_0.compareSduiProps);
local v11 = require(l_script_FirstAncestor_0.compareSduiAnalyticsContext);
local v12 = require(l_script_FirstAncestor_0.parseProps);
local function v14(_) --[[ Line: 25 ]] --[[ Name: SduiErrorComponent ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 100, 0, 100)
    });
end;
local v15 = {};
return v3.memo(function(v16) --[[ Line: 35 ]] --[[ Name: SduiFastPathComponent ]]
    -- upvalues: v3 (copy), v4 (copy), v11 (copy), v15 (copy), v12 (copy), l_SduiBuilderProcessingPhase_0 (copy), v2 (copy), l_SduiErrorType_0 (copy), v14 (copy)
    local l_componentConfig_0 = v16.componentConfig;
    local l_componentType_0 = l_componentConfig_0.componentType;
    local l_sduiContext_0 = v16.sduiContext;
    local l_debugName_0 = v16.debugName;
    local l_parentAnalyticsContext_0 = v16.parentAnalyticsContext;
    local l_localAnalyticsData_0 = v16.localAnalyticsData;
    local l_extraLocalProps_0 = v16.extraLocalProps;
    local v24 = v3.useRef(nil);
    if v24.current == nil then
        v24.current = v4.buildAnalyticsContext(l_componentConfig_0, l_parentAnalyticsContext_0, l_localAnalyticsData_0);
    else
        local v25 = v4.buildAnalyticsContext(l_componentConfig_0, l_parentAnalyticsContext_0, l_localAnalyticsData_0);
        if not v11(v24.current, v25) then
            v24.current = v25;
        end;
    end;
    local l_current_0 = v24.current;
    local v27 = table.clone(l_componentConfig_0.props or v15);
    v12(l_componentType_0, v27, l_debugName_0, l_sduiContext_0, l_current_0, nil, l_SduiBuilderProcessingPhase_0.Render);
    if l_extraLocalProps_0 then
        v27 = v2.Dictionary.join(v27, l_extraLocalProps_0);
    end;
    v27.componentConfig = l_componentConfig_0;
    v27.sduiContext = l_sduiContext_0;
    v27.debugName = l_debugName_0;
    v27.analyticsContext = l_current_0;
    local v28 = l_sduiContext_0.componentDefinitions:getComponent(l_componentType_0);
    if v28 == nil then
        l_sduiContext_0.dependencies.logger.reportError(l_SduiErrorType_0.NoComponentRegistered, {
            componentType = l_componentType_0, 
            name = l_debugName_0
        }, l_sduiContext_0.appPage);
        return v3.createElement(v14);
    else
        return v3.createElement(v28, v27);
    end;
end, v10);