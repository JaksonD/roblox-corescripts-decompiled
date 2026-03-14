local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(script.Parent.NextUpState);
local v4 = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry);
local l_default_0 = v1.default;
local v6 = if v4 then {
    LeaveGame = "LeaveGame", 
    CloseExitModalClick = "CloseExitModalClick", 
    CloseExitModalEscape = "CloseExitModalEscape", 
    JoinGame = "JoinGame"
} else nil;
local v7 = {
    eventName = "InGameNextUpExitMenuSortRequestLatency", 
    backends = {
        v1.TelemetryBackends.Stats
    }, 
    lastUpdated = {
        25, 
        7, 
        16
    }, 
    description = "Request latency for In-Game Exit Page network requests"
};
local function v10(v8, v9) --[[ Line: 33 ]] --[[ Name: logRequestLatency ]]
    -- upvalues: l_default_0 (copy), v7 (copy)
    l_default_0:logRobloxTelemetryStat(v7, v9, {
        endpointName = v8
    });
end;
local v11 = {
    eventName = "InGameNextUpExitMenuSortView", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        25, 
        7, 
        16
    }, 
    description = "Next-up sort views from the In-Game Exit Modal"
};
local function v13(v12) --[[ Line: 48 ]] --[[ Name: logNextUpSortView ]]
    -- upvalues: l_default_0 (copy), v11 (copy)
    l_default_0:logRobloxTelemetryCounter(v11, 1, {
        tilesLoaded = tostring(v12)
    });
end;
local v14 = if v4 then {
    eventName = "InGameNextUpExitMenuSortView", 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:DefineFastInt("InGameNextUpSortViewEventThrottlingPercentage", 0), 
    lastUpdated = {
        25, 
        7, 
        22
    }, 
    description = "Next-up sort views from the In-Game Exit Modal"
} else nil;
local v16 = v4 and function(v15) --[[ Line: 67 ]]
    return v15 * 1000;
end or nil;
local v20 = v4 and function(v17) --[[ Line: 73 ]]
    -- upvalues: v3 (copy), v2 (copy), v16 (copy), l_default_0 (copy), v14 (copy)
    local v18 = v3.getNextUpComponentSortLatency();
    local v19 = v2.List.map(v3.getNextUpTileImageTextureLatencies(), v16);
    l_default_0:logRobloxTelemetryEvent(v14, {}, {
        action = v17, 
        sortLatency = if v18 then v16(v18) else nil, 
        tileLatencies = if #v19 > 0 then table.concat(v19, ",") else nil
    });
end or nil;
return {
    logRequestLatency = v10, 
    logNextUpSortView = if v4 then nil else v13, 
    NextUpSortViewActionType = if v4 then v6 else nil, 
    logNextUpExitModalAction = if v4 then v20 else nil
};