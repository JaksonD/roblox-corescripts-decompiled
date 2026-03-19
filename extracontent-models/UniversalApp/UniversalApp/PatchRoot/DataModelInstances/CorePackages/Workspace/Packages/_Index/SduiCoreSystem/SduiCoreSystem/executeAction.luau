local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Analytics.reportUnifiedLoggingAction);
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v6 = require(l_script_FirstAncestor_0.getSduiActionHandlerRegistry);
local l_FFlagSduiActionHandlerSharedRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionHandlerSharedRegistry;
return function(v8, v9, v10, v11) --[[ Line: 20 ]] --[[ Name: executeAction ]]
    -- upvalues: l_FFlagSduiActionHandlerSharedRegistry_0 (copy), v6 (copy), v2 (copy)
    if not v8 then
        return;
    else
        assert(v8, "actionConfig must exist");
        local v12 = if l_FFlagSduiActionHandlerSharedRegistry_0 then v6().getActionHandlerConfig(v8.actionType) else v10.actionHandlerRegistry:getActionHandlerConfig(v8.actionType);
        if not v12 then
            return;
        else
            assert(v12, "actionHandlerConfig must exist");
            if not v12.firesOwnTelemetry then
                v2(v10, v8, v9);
            end;
            if v12.handler then
                v12.handler(v8, v9, v10, v11);
            end;
            return;
        end;
    end;
end;