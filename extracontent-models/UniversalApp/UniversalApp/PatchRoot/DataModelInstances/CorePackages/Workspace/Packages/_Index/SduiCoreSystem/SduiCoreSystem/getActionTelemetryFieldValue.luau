local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local v1 = require(l_script_FirstAncestor_0.findAnalyticsFieldInAncestors);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
return function(v4, v5, v6, v7) --[[ Line: 12 ]] --[[ Name: getActionTelemetryFieldValue ]]
    -- upvalues: v1 (copy)
    local v8 = v1(v6, v5);
    if v8 ~= nil then
        return v8;
    else
        if v4 then
            local l_actionParams_0 = v4.actionParams;
            if l_actionParams_0 and l_actionParams_0[v6] ~= nil then
                return l_actionParams_0[v6];
            end;
        end;
        return v7;
    end;
end;