local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local l_GreenlistedEndpointsForLogging_0 = require(l_Parent_1.Http).Logger.GreenlistedEndpointsForLogging;
local _ = require(l_Parent_0.HttpStoreTypes);
return function(v5) --[[ Line: 13 ]] --[[ Name: createGrafanaLoggingHandler ]]
    -- upvalues: v2 (copy), l_GreenlistedEndpointsForLogging_0 (copy)
    return v2.createEffect(function(v6) --[[ Line: 14 ]]
        -- upvalues: v5 (copy), l_GreenlistedEndpointsForLogging_0 (ref)
        local v7 = v5(v6);
        if v7.status == "Success" then
            l_GreenlistedEndpointsForLogging_0.sendStatusCodeCounter(v7.config.Url, v7.response.StatusCode);
        end;
    end);
end;