local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.LoggingProtocol);
local _ = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v3 = require(l_script_FirstAncestor_0.Flags.getFIntSongbirdTelemetryThrottle);
local l_GetFFlagSongDetailsPageRegressionTracking_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagSongDetailsPageRegressionTracking;
local v5 = {
    eventName = "AudioPlayerEvents", 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v3(), 
    lastUpdated = {
        25, 
        10, 
        24
    }, 
    description = " Analytics for AudioPlayer component to track playback, favoriting, and reporting flows ", 
    links = ""
};
local function v7(v6) --[[ Line: 25 ]] --[[ Name: createCounterEventConfig ]]
    -- upvalues: v5 (copy), v1 (copy)
    return {
        eventName = ("%*_%*"):format(v5.eventName, v6), 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        throttlingPercentage = v5.throttlingPercentage, 
        lastUpdated = v5.lastUpdated, 
        description = v5.description, 
        links = v5.links
    };
end;
return function(v8) --[[ Line: 47 ]] --[[ Name: sendAudioPlayerAnalytics ]]
    -- upvalues: l_GetFFlagSongDetailsPageRegressionTracking_0 (copy), v7 (copy), v1 (copy), v5 (copy)
    local v9 = if l_GetFFlagSongDetailsPageRegressionTracking_0() then v7(v8.action) else nil;
    v1.default:logRobloxTelemetryEvent(v5, nil, v8);
    if l_GetFFlagSongDetailsPageRegressionTracking_0() then
        v1.default:logRobloxTelemetryCounter(v9, 1);
    end;
end;