local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v3 = require(l_script_FirstAncestor_0.SduiErrors);
local v4 = require(l_script_FirstAncestor_0.SduiLogger);
local v5 = require(l_script_FirstAncestor_0.getSduiTelemetryHandlerNameRegistry);
local v6 = require(l_script_FirstAncestor_0.Analytics.reportUnifiedLoggingAction);
return function(v7, v8, v9, v10, v11) --[[ Line: 16 ]] --[[ Name: logActionTelemetry ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v6 (copy)
    if v7 and v7 ~= "" then
        local v12 = v5().getTelemetryHandler(v7);
        if v12 then
            v12(v9, v10, v11);
        else
            v4.reportError(v3.SduiErrorType.InvalidActionParams, {
                message = ("Unknown telemetry handler name: %*"):format(v7), 
                name = v9.actionType
            }, v11.appPage);
        end;
    elseif v8.telemetryHandler then
        v8.telemetryHandler(v9, v10, v11);
    end;
    if not v8.firesOwnTelemetry then
        if v10 == nil then
            v4.reportError(v3.SduiErrorType.NilAnalyticsContext, {
                message = ("Could not reportUnifiedLoggingAction. Missing analyticsContext %*"):format(v9.actionType), 
                name = v9.actionType
            }, v11.appPage);
            return;
        else
            v6(v11, v9, v10);
        end;
    end;
end;