local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Analytics.Enums.SupportedTelemetryBackends);
local v4 = require(l_script_FirstAncestor_0.Telemetry.formatEventStreamFields);
local _ = require(l_script_FirstAncestor_0.Analytics.Enums.Contexts);
return function(v6) --[[ Line: 26 ]] --[[ Name: telemetryConfig ]]
    -- upvalues: v2 (copy), v4 (copy)
    return {
        name = v6.name, 
        description = v6.description, 
        eventStreamCtx = v6.eventStreamCtx, 
        lastUpdated = v6.lastUpdated, 
        backendsList = v2.List.map(v6.backendsList, function(v7) --[[ Line: 32 ]]
            -- upvalues: v4 (ref), v2 (ref)
            if v7.type == "EventIngest" then
                local function v9(...) --[[ Line: 35 ]]
                    -- upvalues: v7 (copy), v4 (ref)
                    local v8 = v7.format(...);
                    return v4(v8);
                end;
                return v2.Dictionary.join(v7, {
                    format = v9
                });
            else
                return v7;
            end;
        end), 
        throttlingThousandths = v6.throttlingThousandths
    };
end;