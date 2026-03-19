local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.RobloxTelemetry.TelemetryConfigs);
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
return function(v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: l_LoginStatus_0 (copy), v2 (copy)
    return function(v7) --[[ Line: 10 ]]
        -- upvalues: l_LoginStatus_0 (ref), v6 (copy), v4 (copy), v5 (copy), v2 (ref)
        if v7:getState().AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN then
            return;
        else
            v6(v4):andThen(function(_) --[[ Line: 23 ]]
                -- upvalues: v5 (ref), v2 (ref)
                v5:logRobloxTelemetryCounter(v2.ValidCookieForNoCachedUserTelemetryConfig, 1);
            end):catch(function(_) --[[ Line: 31 ]]

            end);
            return;
        end;
    end;
end;