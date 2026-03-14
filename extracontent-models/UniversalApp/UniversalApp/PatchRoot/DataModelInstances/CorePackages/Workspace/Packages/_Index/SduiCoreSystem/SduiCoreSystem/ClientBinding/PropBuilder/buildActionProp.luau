local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.SduiErrors);
local v4 = require(l_script_FirstAncestor_0.SduiLogger);
local v5 = require(l_script_FirstAncestor_0.getSduiActionHandlerRegistry);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.getSduiServiceDependenciesStore);
local v7 = require(l_script_FirstAncestor_0.Analytics.reportUnifiedLoggingAction);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local v10 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local l_buildPropTable_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingBuilder).buildPropTable;
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local v13 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
local l_FFlagSduiV2ConditionalSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2ConditionalSupport;
local function v16(v17, v18, v19, v20, v21, v22) --[[ Line: 35 ]] --[[ Name: buildActionProp ]]
    -- upvalues: v10 (copy), v5 (copy), v6 (copy), l_buildPropTable_0 (copy), l_FFlagSduiInputDataSignals_0 (copy), v4 (copy), v3 (copy), v7 (copy), l_PropResultCategory_0 (copy), l_FFlagSduiV2ConditionalSupport_0 (copy), v13 (copy), v16 (copy)
    if v17 == "value" then
        local v23 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 45 ]]
            -- upvalues: v21 (copy), v18 (copy), v23 (ref), v10 (ref), v5 (ref), v6 (ref), l_buildPropTable_0 (ref), v19 (copy), v20 (copy), v22 (copy), l_FFlagSduiInputDataSignals_0 (ref), v4 (ref), v3 (ref), v7 (ref)
            local l_appPage_0 = v21.appPage;
            local v25 = typeof(v18) == "table" and v18.kind and v18.kind.value or nil;
            v23 = if v25 and v25.action_type then v10.mapActionTypeToLua(v25.action_type) else nil;
            if not v23 then
                error((("Could not map actionType: %*"):format(v25 and v25.action_type)));
            end;
            local v26 = v5().getActionHandlerConfig(v23);
            if not v26 then
                error((("Could not find action for actionType: %*"):format(v23)));
            end;
            return function(_, v28) --[[ Line: 64 ]]
                -- upvalues: v6 (ref), l_appPage_0 (copy), v25 (copy), v23 (ref), l_buildPropTable_0 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), l_FFlagSduiInputDataSignals_0 (ref), v26 (copy), v4 (ref), v3 (ref), v7 (ref)
                local v29 = {
                    dependencies = v6().getDependencies(l_appPage_0), 
                    appPage = l_appPage_0
                };
                local v30 = v25 and v25.action_params;
                local v31 = {
                    actionType = v23
                };
                if v30 and next(v30) then
                    local v32, v33 = l_buildPropTable_0(v30, v19, v20, v21, v22, nil);
                    if v33 then
                        for v34, v35 in v33 do
                            if l_FFlagSduiInputDataSignals_0 then
                                v32[v34] = v35(false).data;
                            else
                                v32[v34] = v35(false);
                            end;
                        end;
                    end;
                    v31.actionParams = v32;
                end;
                if not v26.firesOwnTelemetry then
                    if v22 == nil then
                        v4.reportError(v3.SduiErrorType.NilAnalyticsContext, {
                            message = ("Could not reportUnifiedLoggingAction. Missing analyticsContext %*"):format(v23), 
                            name = v23
                        }, l_appPage_0);
                    else
                        v7(v29, v31, v22);
                    end;
                end;
                if v26.handler then
                    v26.handler(v31, v22, v29, v28);
                end;
            end;
        end);
        if l_status_0 then
            return l_result_0, l_PropResultCategory_0.Literal;
        else
            return function(_, _) --[[ Line: 118 ]]
                -- upvalues: v4 (ref), v3 (ref), v23 (ref)
                v4.reportCounter(v3.SduiCounterName.ExecutedInvalidAction, {
                    name = v23, 
                    parserName = "buildActionProp"
                });
            end, l_PropResultCategory_0.Failed, l_result_0;
        end;
    elseif v17 == "conditional" then
        if l_FFlagSduiV2ConditionalSupport_0 then
            return v13.generateConditionalPropValue(v18, v19, v21, v22, v20, v16), l_PropResultCategory_0.PropSignal;
        else
            error("TODO: Conditional not implemented yet");
            return;
        end;
    else
        error((("Could not build prop. Unknown propDefinitionType: %*"):format(v17)));
        return;
    end;
end;
return v16;