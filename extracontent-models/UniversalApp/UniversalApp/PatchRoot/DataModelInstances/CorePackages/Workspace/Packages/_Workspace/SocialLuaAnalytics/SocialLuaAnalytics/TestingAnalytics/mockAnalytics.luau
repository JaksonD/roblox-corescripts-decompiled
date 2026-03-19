return function(v0) --[[ Line: 1 ]]
    return {
        Diag = {
            reportCounter = v0.fn(), 
            reportStats = v0.fn()
        }, 
        EventStream = {
            setRBXEventStream = v0.fn(), 
            sendEventDeferred = v0.fn()
        }, 
        Telemetry = {
            logRobloxTelemetryCounter = v0.fn(), 
            logRobloxTelemetryEvent = v0.fn(), 
            logRobloxTelemetryStat = v0.fn(), 
            TelemetryBackends = {
                Points = "Points", 
                Stats = "RobloxTelemetryStat", 
                Counters = "RobloxTelemetryCounter", 
                EventIngest = "EventIngest"
            }
        }
    };
end;