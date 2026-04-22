local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.SduiErrors);
local v4 = require(l_script_FirstAncestor_0.SduiLogger);
local v5 = require(l_script_FirstAncestor_0.getSduiActionHandlerRegistry);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.getSduiServiceDependenciesStore);
local v7 = require(l_script_FirstAncestor_0.Analytics.logActionTelemetry);
local v8 = require(l_script_FirstAncestor_0.Analytics.reportUnifiedLoggingAction);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local v11 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local v12 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingBuilder);
local l_buildPropTable_0 = v12.buildPropTable;
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local v15 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local l_FFlagSduiActionsShouldTakeOverrides_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionsShouldTakeOverrides;
local l_FFlagSduiChartsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiChartsSupport;
local l_FFlagSduiActionTelemetryHandler_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionTelemetryHandler;
local function v25(v20, v21) --[[ Line: 39 ]] --[[ Name: mergeTemplateParamsWithOverrides ]]
    if typeof(v21) ~= "table" then
        return v20;
    else
        local v22 = if v20 then table.clone(v20) else {};
        for v23, v24 in v21 do
            v22[v23] = v24;
        end;
        return v22;
    end;
end;
local function v26(v27, v28, v29, v30, v31, v32) --[[ Line: 53 ]] --[[ Name: buildActionProp ]]
    -- upvalues: v11 (copy), v5 (copy), v6 (copy), l_FFlagSduiActionTelemetryHandler_0 (copy), v12 (copy), l_PropResultCategory_0 (copy), l_buildPropTable_0 (copy), l_FFlagSduiActionsShouldTakeOverrides_0 (copy), v25 (copy), v7 (copy), v4 (copy), v3 (copy), v8 (copy), l_FFlagSduiChartsSupport_0 (copy), v15 (copy), v26 (copy)
    if v27 == "value" then
        local v33 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 63 ]]
            -- upvalues: v31 (copy), v28 (copy), v33 (ref), v11 (ref), v5 (ref), v6 (ref), l_FFlagSduiActionTelemetryHandler_0 (ref), v12 (ref), v29 (copy), v30 (copy), v32 (copy), l_PropResultCategory_0 (ref), l_buildPropTable_0 (ref), l_FFlagSduiActionsShouldTakeOverrides_0 (ref), v25 (ref), v7 (ref), v4 (ref), v3 (ref), v8 (ref), l_FFlagSduiChartsSupport_0 (ref)
            local l_appPage_0 = v31.appPage;
            local v35 = typeof(v28) == "table" and v28.kind and v28.kind.value or nil;
            v33 = if v35 and v35.action_type then v11.mapActionTypeToLua(v35.action_type) else nil;
            if not v33 then
                error((("Could not map actionType: %*"):format(v35 and v35.action_type)));
            end;
            local v36 = v5().getActionHandlerConfig(v33);
            if not v36 then
                error((("Could not find action for actionType: %*"):format(v33)));
            end;
            return function(_, v38, v39) --[[ Line: 86 ]]
                -- upvalues: v6 (ref), l_appPage_0 (copy), l_FFlagSduiActionTelemetryHandler_0 (ref), v28 (ref), v12 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref), l_PropResultCategory_0 (ref), v35 (copy), v33 (ref), l_buildPropTable_0 (ref), l_FFlagSduiActionsShouldTakeOverrides_0 (ref), v25 (ref), v7 (ref), v36 (copy), v4 (ref), v3 (ref), v8 (ref), l_FFlagSduiChartsSupport_0 (ref)
                local v40 = {
                    dependencies = v6().getDependencies(l_appPage_0), 
                    appPage = l_appPage_0
                };
                local v41 = nil;
                if l_FFlagSduiActionTelemetryHandler_0 and v28 and v28.telemetry_handler then
                    local l_telemetry_handler_0 = v28.telemetry_handler;
                    if l_telemetry_handler_0.kind and l_telemetry_handler_0.kind.type then
                        local v43, v44 = v12.buildProp(l_telemetry_handler_0, v29, v30, v31, v32);
                        v41 = if v44 == l_PropResultCategory_0.PropSignal then v43(false).data else v43;
                    end;
                end;
                local v45 = v35 and v35.action_params;
                local v46 = {
                    actionType = v33, 
                    telemetryHandler = v41
                };
                local v47 = nil;
                if v45 and next(v45) then
                    local v48, v49 = l_buildPropTable_0(v45, v29, v30, v31, v32, nil);
                    if v49 then
                        for v50, v51 in v49 do
                            v48[v50] = v51(false).data;
                        end;
                    end;
                    if l_FFlagSduiActionsShouldTakeOverrides_0 then
                        v47 = v48;
                    else
                        v46.actionParams = v48;
                    end;
                end;
                if l_FFlagSduiActionsShouldTakeOverrides_0 then
                    v46.actionParams = v25(v47, v39);
                end;
                if l_FFlagSduiActionTelemetryHandler_0 then
                    v7(v41, v36, v46, v32, v40);
                elseif not v36.firesOwnTelemetry then
                    if v32 == nil then
                        v4.reportError(v3.SduiErrorType.NilAnalyticsContext, {
                            message = ("Could not reportUnifiedLoggingAction. Missing analyticsContext %*"):format(v33), 
                            name = v33
                        }, l_appPage_0);
                    else
                        v8(v40, v46, v32);
                    end;
                end;
                if v36.handler then
                    if l_FFlagSduiChartsSupport_0 then
                        return v36.handler(v46, v32, v40, v38);
                    else
                        v36.handler(v46, v32, v40, v38);
                    end;
                end;
            end;
        end);
        if l_status_0 then
            return l_result_0, l_PropResultCategory_0.Literal;
        else
            return function(_, _, _) --[[ Line: 182 ]]
                -- upvalues: v4 (ref), v3 (ref), v33 (ref)
                v4.reportCounter(v3.SduiCounterName.ExecutedInvalidAction, {
                    name = v33, 
                    parserName = "buildActionProp"
                });
            end, l_PropResultCategory_0.Failed, l_result_0;
        end;
    elseif v27 == "conditional" then
        return v15.generateConditionalPropValue(v28, v29, v31, v32, v30, v26), l_PropResultCategory_0.PropSignal;
    else
        error((("Could not build prop. Unknown propDefinitionType: %*"):format(v27)));
        return;
    end;
end;
return v26;