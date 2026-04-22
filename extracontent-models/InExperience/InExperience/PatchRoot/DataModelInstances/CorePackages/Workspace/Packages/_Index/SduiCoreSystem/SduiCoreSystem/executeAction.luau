local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Analytics.logActionTelemetry);
local v3 = require(l_script_FirstAncestor_0.Analytics.reportUnifiedLoggingAction);
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v7 = require(l_script_FirstAncestor_0.getSduiActionHandlerRegistry);
local l_FFlagSduiChartsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiChartsSupport;
local l_FFlagSduiActionTelemetryHandler_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionTelemetryHandler;
return function(v10, v11, v12, v13) --[[ Line: 22 ]] --[[ Name: executeAction ]]
    -- upvalues: v7 (copy), l_FFlagSduiActionTelemetryHandler_0 (copy), v2 (copy), v3 (copy), l_FFlagSduiChartsSupport_0 (copy)
    if not v10 then
        return;
    else
        assert(v10, "actionConfig must exist");
        local v14 = v7().getActionHandlerConfig(v10.actionType);
        if not v14 then
            return;
        else
            assert(v14, "actionHandlerConfig must exist");
            if l_FFlagSduiActionTelemetryHandler_0 then
                v2(v10.telemetryHandler, v14, v10, v11, v12);
            elseif not v14.firesOwnTelemetry then
                v3(v12, v10, v11);
            end;
            if v14.handler then
                if l_FFlagSduiChartsSupport_0 then
                    return v14.handler(v10, v11, v12, v13);
                else
                    v14.handler(v10, v11, v12, v13);
                end;
            end;
            return;
        end;
    end;
end;