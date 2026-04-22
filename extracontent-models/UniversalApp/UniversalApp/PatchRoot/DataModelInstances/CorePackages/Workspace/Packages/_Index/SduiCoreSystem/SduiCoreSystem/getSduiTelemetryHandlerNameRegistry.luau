local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local function v10() --[[ Line: 23 ]] --[[ Name: createSduiTelemetryHandlerNameRegistry ]]
    local v2 = {};
    return {
        getTelemetryHandler = function(v3) --[[ Line: 26 ]] --[[ Name: getTelemetryHandler ]]
            -- upvalues: v2 (copy)
            local v4 = v2[v3];
            if v4 == nil then
                return nil;
            else
                if not v4.handler and v4.lazyHandler then
                    v4.handler = v4.lazyHandler();
                end;
                return v4.handler;
            end;
        end, 
        registerTelemetryHandler = function(v5, v6) --[[ Line: 38 ]] --[[ Name: registerTelemetryHandler ]]
            -- upvalues: v2 (copy)
            v2[v5] = v6;
        end, 
        registerTelemetryHandlers = function(v7) --[[ Line: 42 ]] --[[ Name: registerTelemetryHandlers ]]
            -- upvalues: v2 (copy)
            for v8, v9 in v7 do
                v2[v8] = v9;
            end;
        end, 
        debug_clear = function() --[[ Line: 48 ]] --[[ Name: debug_clear ]]
            -- upvalues: v2 (copy)
            table.clear(v2);
        end, 
        debug_getRegisteredConfigs = function() --[[ Line: 52 ]] --[[ Name: debug_getRegisteredConfigs ]]
            -- upvalues: v2 (copy)
            return v2;
        end
    };
end;
local v11 = nil;
return function() --[[ Line: 67 ]] --[[ Name: getSduiTelemetryHandlerNameRegistry ]]
    -- upvalues: v11 (ref), v10 (copy)
    if v11 == nil then
        v11 = v10();
    end;
    return v11;
end;