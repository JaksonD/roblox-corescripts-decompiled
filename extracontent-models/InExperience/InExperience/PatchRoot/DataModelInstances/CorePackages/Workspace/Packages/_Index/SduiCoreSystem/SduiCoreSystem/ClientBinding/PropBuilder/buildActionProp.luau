local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local l_FFlagSduiActionsShouldTakeOverrides_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionsShouldTakeOverrides;
local v4 = require(l_script_FirstAncestor_0.SduiErrors);
local v5 = require(l_script_FirstAncestor_0.SduiLogger);
local v6 = require(l_script_FirstAncestor_0.getSduiActionHandlerRegistry);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.getSduiServiceDependenciesStore);
local v8 = require(l_script_FirstAncestor_0.Analytics.reportUnifiedLoggingAction);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local v11 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local l_buildPropTable_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingBuilder).buildPropTable;
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local v14 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local function v20(v15, v16) --[[ Line: 33 ]] --[[ Name: mergeTemplateParamsWithOverrides ]]
    if typeof(v16) ~= "table" then
        return v15;
    else
        local v17 = if v15 then table.clone(v15) else {};
        for v18, v19 in v16 do
            v17[v18] = v19;
        end;
        return v17;
    end;
end;
local function v21(v22, v23, v24, v25, v26, v27) --[[ Line: 47 ]] --[[ Name: buildActionProp ]]
    -- upvalues: v11 (copy), v6 (copy), v7 (copy), l_buildPropTable_0 (copy), l_FFlagSduiActionsShouldTakeOverrides_0 (copy), v20 (copy), v5 (copy), v4 (copy), v8 (copy), l_PropResultCategory_0 (copy), v14 (copy), v21 (copy)
    if v22 == "value" then
        local v28 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 57 ]]
            -- upvalues: v26 (copy), v23 (copy), v28 (ref), v11 (ref), v6 (ref), v7 (ref), l_buildPropTable_0 (ref), v24 (copy), v25 (copy), v27 (copy), l_FFlagSduiActionsShouldTakeOverrides_0 (ref), v20 (ref), v5 (ref), v4 (ref), v8 (ref)
            local l_appPage_0 = v26.appPage;
            local v30 = typeof(v23) == "table" and v23.kind and v23.kind.value or nil;
            v28 = if v30 and v30.action_type then v11.mapActionTypeToLua(v30.action_type) else nil;
            if not v28 then
                error((("Could not map actionType: %*"):format(v30 and v30.action_type)));
            end;
            local v31 = v6().getActionHandlerConfig(v28);
            if not v31 then
                error((("Could not find action for actionType: %*"):format(v28)));
            end;
            return function(_, v33, v34) --[[ Line: 80 ]]
                -- upvalues: v7 (ref), l_appPage_0 (copy), v30 (copy), v28 (ref), l_buildPropTable_0 (ref), v24 (ref), v25 (ref), v26 (ref), v27 (ref), l_FFlagSduiActionsShouldTakeOverrides_0 (ref), v20 (ref), v31 (copy), v5 (ref), v4 (ref), v8 (ref)
                local v35 = {
                    dependencies = v7().getDependencies(l_appPage_0), 
                    appPage = l_appPage_0
                };
                local v36 = v30 and v30.action_params;
                local v37 = {
                    actionType = v28
                };
                local v38 = nil;
                if v36 and next(v36) then
                    local v39, v40 = l_buildPropTable_0(v36, v24, v25, v26, v27, nil);
                    if v40 then
                        for v41, v42 in v40 do
                            v39[v41] = v42(false).data;
                        end;
                    end;
                    if l_FFlagSduiActionsShouldTakeOverrides_0 then
                        v38 = v39;
                    else
                        v37.actionParams = v39;
                    end;
                end;
                if l_FFlagSduiActionsShouldTakeOverrides_0 then
                    v37.actionParams = v20(v38, v34);
                end;
                if not v31.firesOwnTelemetry then
                    if v27 == nil then
                        v5.reportError(v4.SduiErrorType.NilAnalyticsContext, {
                            message = ("Could not reportUnifiedLoggingAction. Missing analyticsContext %*"):format(v28), 
                            name = v28
                        }, l_appPage_0);
                    else
                        v8(v35, v37, v27);
                    end;
                end;
                if v31.handler then
                    v31.handler(v37, v27, v35, v33);
                end;
            end;
        end);
        if l_status_0 then
            return l_result_0, l_PropResultCategory_0.Literal;
        else
            return function(_, _, _) --[[ Line: 138 ]]
                -- upvalues: v5 (ref), v4 (ref), v28 (ref)
                v5.reportCounter(v4.SduiCounterName.ExecutedInvalidAction, {
                    name = v28, 
                    parserName = "buildActionProp"
                });
            end, l_PropResultCategory_0.Failed, l_result_0;
        end;
    elseif v22 == "conditional" then
        return v14.generateConditionalPropValue(v23, v24, v26, v27, v25, v21), l_PropResultCategory_0.PropSignal;
    else
        error((("Could not build prop. Unknown propDefinitionType: %*"):format(v22)));
        return;
    end;
end;
return v21;