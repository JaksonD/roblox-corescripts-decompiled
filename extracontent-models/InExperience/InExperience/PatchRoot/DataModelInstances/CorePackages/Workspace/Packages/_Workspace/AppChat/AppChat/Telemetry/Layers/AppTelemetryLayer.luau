local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Telemetry_0 = l_script_FirstAncestor_0.Telemetry;
local v4 = require(l_Telemetry_0.createReactTelemetryLayer);
local v5 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
return v4(v2.createContext(function() --[[ Line: 21 ]]
    return {};
end), {
    context = "platformChat", 
    locale = "unknown", 
    entryPoint = "unknown", 
    userId = "unknown", 
    placement = v5.Enum.Unknown
});