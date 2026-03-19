local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local v1 = require(l_script_FirstAncestor_0.Analytics.reportUnifiedLoggingAction);
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v5 = require(l_script_FirstAncestor_0.getSduiActionHandlerRegistry);
return function(v6, v7, v8, v9) --[[ Line: 17 ]] --[[ Name: executeAction ]]
    -- upvalues: v5 (copy), v1 (copy)
    if not v6 then
        return;
    else
        assert(v6, "actionConfig must exist");
        local v10 = v5().getActionHandlerConfig(v6.actionType);
        if not v10 then
            return;
        else
            assert(v10, "actionHandlerConfig must exist");
            if not v10.firesOwnTelemetry then
                v1(v8, v6, v7);
            end;
            if v10.handler then
                v10.handler(v6, v7, v8, v9);
            end;
            return;
        end;
    end;
end;