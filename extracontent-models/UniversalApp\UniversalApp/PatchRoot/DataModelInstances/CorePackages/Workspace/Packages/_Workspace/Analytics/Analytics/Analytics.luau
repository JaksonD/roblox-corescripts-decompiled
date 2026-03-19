local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AnalyticsReporters_0 = script.Parent.AnalyticsReporters;
local v2 = require(l_AnalyticsReporters_0.Diag);
local v3 = require(l_AnalyticsReporters_0.EventStream);
local v4 = require(l_AnalyticsReporters_0.GoogleAnalytics);
local v5 = require(l_AnalyticsReporters_0.Influx);
local v6 = {};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy)
    if not v7 then
        v7 = l_RbxAnalyticsService_0;
    end;
    local v8 = {
        Diag = v2.new(v7), 
        EventStream = v3.new(v7), 
        GoogleAnalytics = v4.new(v7), 
        InfluxDb = v5.new(v7)
    };
    setmetatable(v8, v6);
    return v8;
end;
v6.mock = function() --[[ Line: 63 ]] --[[ Name: mock ]]
    -- upvalues: v6 (copy)
    local v9 = {
        ReportCounter = function() --[[ Line: 66 ]] --[[ Name: ReportCounter ]]

        end, 
        ReportInfluxSeries = function() --[[ Line: 67 ]] --[[ Name: ReportInfluxSeries ]]

        end, 
        ReportStats = function() --[[ Line: 68 ]] --[[ Name: ReportStats ]]

        end, 
        SetRBXEvent = function() --[[ Line: 69 ]] --[[ Name: SetRBXEvent ]]

        end, 
        SetRBXEventStream = function() --[[ Line: 70 ]] --[[ Name: SetRBXEventStream ]]

        end, 
        TrackEvent = function() --[[ Line: 71 ]] --[[ Name: TrackEvent ]]

        end, 
        UpdateHeartbeatObject = function() --[[ Line: 72 ]] --[[ Name: UpdateHeartbeatObject ]]

        end, 
        SendEventDeferred = function() --[[ Line: 73 ]] --[[ Name: SendEventDeferred ]]

        end
    };
    return v6.new(v9);
end;
return v6;