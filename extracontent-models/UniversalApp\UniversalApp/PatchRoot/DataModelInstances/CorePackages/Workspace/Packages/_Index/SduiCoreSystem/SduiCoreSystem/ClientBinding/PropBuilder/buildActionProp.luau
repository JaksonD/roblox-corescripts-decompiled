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
local function v14(v15, v16, v17, v18, v19, v20) --[[ Line: 32 ]] --[[ Name: buildActionProp ]]
    -- upvalues: v10 (copy), v5 (copy), v6 (copy), l_buildPropTable_0 (copy), v4 (copy), v3 (copy), v7 (copy), l_PropResultCategory_0 (copy), v13 (copy), v14 (copy)
    if v15 == "value" then
        local v21 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 42 ]]
            -- upvalues: v19 (copy), v16 (copy), v21 (ref), v10 (ref), v5 (ref), v6 (ref), l_buildPropTable_0 (ref), v17 (copy), v18 (copy), v20 (copy), v4 (ref), v3 (ref), v7 (ref)
            local l_appPage_0 = v19.appPage;
            local v23 = typeof(v16) == "table" and v16.kind and v16.kind.value or nil;
            v21 = if v23 and v23.action_type then v10.mapActionTypeToLua(v23.action_type) else nil;
            if not v21 then
                error((("Could not map actionType: %*"):format(v23 and v23.action_type)));
            end;
            local v24 = v5().getActionHandlerConfig(v21);
            if not v24 then
                error((("Could not find action for actionType: %*"):format(v21)));
            end;
            return function(_, v26) --[[ Line: 61 ]]
                -- upvalues: v6 (ref), l_appPage_0 (copy), v23 (copy), v21 (ref), l_buildPropTable_0 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v24 (copy), v4 (ref), v3 (ref), v7 (ref)
                local v27 = {
                    dependencies = v6().getDependencies(l_appPage_0), 
                    appPage = l_appPage_0
                };
                local v28 = v23 and v23.action_params;
                local v29 = {
                    actionType = v21
                };
                if v28 and next(v28) then
                    local v30, v31 = l_buildPropTable_0(v28, v17, v18, v19, v20, nil);
                    if v31 then
                        for v32, v33 in v31 do
                            v30[v32] = v33(false).data;
                        end;
                    end;
                    v29.actionParams = v30;
                end;
                if not v24.firesOwnTelemetry then
                    if v20 == nil then
                        v4.reportError(v3.SduiErrorType.NilAnalyticsContext, {
                            message = ("Could not reportUnifiedLoggingAction. Missing analyticsContext %*"):format(v21), 
                            name = v21
                        }, l_appPage_0);
                    else
                        v7(v27, v29, v20);
                    end;
                end;
                if v24.handler then
                    v24.handler(v29, v20, v27, v26);
                end;
            end;
        end);
        if l_status_0 then
            return l_result_0, l_PropResultCategory_0.Literal;
        else
            return function(_, _) --[[ Line: 111 ]]
                -- upvalues: v4 (ref), v3 (ref), v21 (ref)
                v4.reportCounter(v3.SduiCounterName.ExecutedInvalidAction, {
                    name = v21, 
                    parserName = "buildActionProp"
                });
            end, l_PropResultCategory_0.Failed, l_result_0;
        end;
    elseif v15 == "conditional" then
        return v13.generateConditionalPropValue(v16, v17, v19, v20, v18, v14), l_PropResultCategory_0.PropSignal;
    else
        error((("Could not build prop. Unknown propDefinitionType: %*"):format(v15)));
        return;
    end;
end;
return v14;