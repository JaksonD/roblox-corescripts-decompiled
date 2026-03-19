local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.createTelemetryEmitter);
return function(v3) --[[ Line: 7 ]] --[[ Name: useTelemetry ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.useContext(v3);
    return v2(v4);
end;