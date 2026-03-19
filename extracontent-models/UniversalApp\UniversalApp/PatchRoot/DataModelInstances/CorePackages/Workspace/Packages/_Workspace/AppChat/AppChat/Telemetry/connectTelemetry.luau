local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
return function(v5) --[[ Line: 8 ]] --[[ Name: connectTelemetry ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    return function(v6) --[[ Line: 9 ]]
        -- upvalues: v4 (ref), v5 (copy), v3 (ref), v2 (ref)
        return function(v7) --[[ Line: 10 ]]
            -- upvalues: v4 (ref), v5 (ref), v3 (ref), v6 (copy), v2 (ref)
            local v8 = v4(v5);
            return v3.createElement(v6, v2.Dictionary.union(v7, {
                telemetry = v8
            }));
        end;
    end;
end;