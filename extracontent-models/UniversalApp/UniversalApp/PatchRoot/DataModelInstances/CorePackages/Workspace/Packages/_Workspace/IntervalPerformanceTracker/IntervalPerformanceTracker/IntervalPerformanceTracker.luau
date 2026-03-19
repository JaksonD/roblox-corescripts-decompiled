local l_Parent_0 = script:FindFirstAncestor("IntervalPerformanceTracker").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_RunService_0 = require(l_Parent_0.MockableProxyServices).RunService;
local v3 = require(script.Parent.IntervalPerformanceTrackerTelemetryConfig);
game:DefineFastFlag("DebugPrintIntervalPerformanceTrackerResults", false);
local l_GetFFlagAXFPSEventStreamAndCounters_0 = require(l_Parent_0.SharedFlags).GetFFlagAXFPSEventStreamAndCounters;
local v5 = require(script.Parent.sendFPSStat);
local v6 = game:DefineFastFlag("AXFixAverageFPSCasing", false);
local l_GetFIntIntervalPerformanceTrackerEventStream_0 = require(l_Parent_0.SharedFlags).GetFIntIntervalPerformanceTrackerEventStream;
local v8 = math.random(0, 1000) < l_GetFIntIntervalPerformanceTrackerEventStream_0();
local v18 = {
    averageFPS = {
        reducer = function(v9) --[[ Line: 54 ]] --[[ Name: reducer ]]
            return {
                framesCount = v9.framesCount == nil and 0 or v9.framesCount + 1, 
                startTime = v9.startTime or tick()
            };
        end, 
        getResult = function(v10) --[[ Line: 60 ]] --[[ Name: getResult ]]
            local v11 = tick();
            if v10.framesCount == nil or v10.framesCount == 0 or v10.startTime == nil or v11 == v10.startTime then
                return nil;
            else
                return v10.framesCount / (v11 - v10.startTime);
            end;
        end
    }, 
    framesCount = {
        reducer = function(v12) --[[ Line: 75 ]] --[[ Name: reducer ]]
            return {
                framesCount = v12.framesCount == nil and 0 or v12.framesCount + 1
            };
        end, 
        getResult = function(v13) --[[ Line: 80 ]] --[[ Name: getResult ]]
            return v13.framesCount;
        end
    }, 
    longestFrameTime = {
        reducer = function(v14) --[[ Line: 85 ]] --[[ Name: reducer ]]
            return {
                framesCount = v14.framesCount == nil and 0 or v14.framesCount + 1, 
                longestFrameTime = (not (v14.longestFrameTime ~= nil) or v14.previousTime == nil) and 0 or math.max(v14.longestFrameTime, tick() - v14.previousTime), 
                previousTime = tick()
            };
        end, 
        getResult = function(v15) --[[ Line: 94 ]] --[[ Name: getResult ]]
            if v15.framesCount < 1 then
                return nil;
            else
                return v15.longestFrameTime;
            end;
        end
    }, 
    duration = {
        reducer = function(v16) --[[ Line: 102 ]] --[[ Name: reducer ]]
            return {
                startTime = v16.startTime or tick()
            };
        end, 
        getResult = function(v17) --[[ Line: 107 ]] --[[ Name: getResult ]]
            return tick() - v17.startTime;
        end
    }
};
local v19 = {};
local v20 = {};
for v21, _ in v18 do
    v19[v21] = v21;
    table.insert(v20, v21);
end;
local v23 = {};
v23.__index = v23;
v23.new = function(v24, v25, v26, v27) --[[ Line: 135 ]] --[[ Name: new ]]
    -- upvalues: l_GetFFlagAXFPSEventStreamAndCounters_0 (copy), v23 (copy)
    local v28 = {
        _metricsData = {}, 
        _timeout = v24, 
        _startTime = nil, 
        _metricsToTrack = v25, 
        _countersEnabled = if l_GetFFlagAXFPSEventStreamAndCounters_0() then v26 else nil, 
        _eventStreamEnabled = if l_GetFFlagAXFPSEventStreamAndCounters_0() then v27 else nil
    };
    setmetatable(v28, v23);
    return v28;
end;
v23.getMetricsToTrack = function(v29) --[[ Line: 153 ]] --[[ Name: getMetricsToTrack ]]
    -- upvalues: v20 (copy)
    if v29._metricsToTrack and #v29._metricsToTrack > 0 then
        return v29._metricsToTrack;
    else
        return v20;
    end;
end;
v23.hasReachedTimeout = function(v30) --[[ Line: 161 ]] --[[ Name: hasReachedTimeout ]]
    if v30._timeout ~= nil and v30._startTime ~= nil then
        return tick() - v30._startTime > v30._timeout;
    else
        return false;
    end;
end;
v23.updateMetrics = function(v31) --[[ Line: 168 ]] --[[ Name: updateMetrics ]]
    -- upvalues: v18 (copy)
    if v31._startTime == nil then
        v31._startTime = tick();
    end;
    for _, v33 in (v31:getMetricsToTrack()) do
        local v34 = v18[v33];
        if v34 then
            if not v31._metricsData[v33] then
                v31._metricsData[v33] = {};
            end;
            v31._metricsData[v33] = v34.reducer(v31._metricsData[v33]);
        end;
    end;
end;
v23.getResult = function(v35) --[[ Line: 188 ]] --[[ Name: getResult ]]
    -- upvalues: v18 (copy)
    local v36 = {};
    for _, v38 in (v35:getMetricsToTrack()) do
        local v39 = v18[v38];
        if v39 then
            v36[v38] = v39.getResult(v35._metricsData[v38]);
        end;
    end;
    return v36;
end;
local v40 = {};
v40.__index = v40;
v40.new = function() --[[ Line: 216 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v19 (copy), v40 (copy)
    local v41 = {
        _metricsTrackers = v18, 
        _intervals = {}, 
        _renderSteppedConnection = nil, 
        availableMetricsEnum = v19
    };
    setmetatable(v41, v40);
    return v41;
end;
v40._updateIntervals = function(v42) --[[ Line: 229 ]] --[[ Name: _updateIntervals ]]
    for v43, v44 in v42._intervals do
        v44:updateMetrics();
        if v44:hasReachedTimeout() then
            v42:stopAndLogTracking(v43);
        end;
    end;
end;
v40.startTracking = function(v45, v46, v47, v48, v49, v50) --[[ Line: 239 ]] --[[ Name: startTracking ]]
    -- upvalues: v8 (copy), v23 (copy), l_GetFFlagAXFPSEventStreamAndCounters_0 (copy), l_RunService_0 (copy)
    if not v8 then
        return;
    else
        if not v45._intervals[v46] then
            local v51 = v23.new(v47, v48, if l_GetFFlagAXFPSEventStreamAndCounters_0() then v49 else nil, if l_GetFFlagAXFPSEventStreamAndCounters_0() then v50 else nil);
            v45._intervals[v46] = v51;
            v51:updateMetrics();
        end;
        if not v45._renderSteppedConnection then
            v45._renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 265 ]]
                -- upvalues: v45 (copy)
                v45:_updateIntervals();
            end);
        end;
        return;
    end;
end;
v40._fireStatsTracking = function(v52, v53) --[[ Line: 279 ]]
    -- upvalues: v6 (copy), v5 (copy)
    local l_averageFPS_0 = v53.averageFPS;
    local l_framesCount_0 = v53.framesCount;
    local l_longestFrameTime_0 = v53.longestFrameTime;
    local l_intervalName_0 = v53.intervalName;
    local v58 = v52._intervals[l_intervalName_0];
    if not v58 then
        warn("Missing interval for interval perfomance trackerstat", l_intervalName_0);
        return;
    else
        local l__countersEnabled_0 = v58._countersEnabled;
        local l__eventStreamEnabled_0 = v58._eventStreamEnabled;
        local function _(v61, v62) --[[ Line: 298 ]] --[[ Name: makeStatName ]]
            return "IntervalPerformanceTracker_" .. v61 .. "_" .. v62;
        end;
        if not l__countersEnabled_0 and not l__eventStreamEnabled_0 or not l_intervalName_0 then
            return;
        else
            if l_averageFPS_0 then
                local v64 = "IntervalPerformanceTracker_" .. "AverageFPS" .. "_" .. l_intervalName_0;
                local v65 = table.clone(v53);
                v65.duration = l_averageFPS_0;
                v65.averageFps = if v6 then l_averageFPS_0 else nil;
                v5({
                    statName = v64, 
                    eventStreamName = l_intervalName_0, 
                    metaData = v65, 
                    interval = l_averageFPS_0, 
                    excludeCounters = not l__countersEnabled_0, 
                    excludeEventStream = not l__eventStreamEnabled_0
                });
            end;
            if l_framesCount_0 and l__countersEnabled_0 then
                local v66 = "IntervalPerformanceTracker_" .. "FramesCount" .. "_" .. l_intervalName_0;
                local v67 = table.clone(v53);
                v67.duration = l_framesCount_0;
                v5({
                    statName = v66, 
                    metaData = v67, 
                    interval = l_framesCount_0
                });
            end;
            if l_longestFrameTime_0 and v58._countersEnabled then
                local v68 = "IntervalPerformanceTracker_" .. "LongestFrameTime" .. "_" .. l_intervalName_0;
                local v69 = table.clone(v53);
                v69.duration = l_longestFrameTime_0;
                v5({
                    statName = v68, 
                    metaData = v69, 
                    interval = l_longestFrameTime_0
                });
            end;
            return;
        end;
    end;
end;
v40.stopAndLogTracking = function(v70, v71) --[[ Line: 351 ]] --[[ Name: stopAndLogTracking ]]
    -- upvalues: v8 (copy), l_default_0 (copy), v3 (copy), l_GetFFlagAXFPSEventStreamAndCounters_0 (copy)
    if not v8 then
        return;
    else
        local v72 = v70._intervals[v71];
        if v72 then
            local v73 = v72:getResult();
            local v74 = {
                intervalName = v71
            };
            local v75 = 0;
            for v76, v77 in v73 do
                if v77 ~= nil then
                    v75 = v75 + 1;
                end;
                v74[v76] = v77;
            end;
            if v75 > 0 then
                l_default_0:logRobloxTelemetryEvent(v3, nil, v74);
                if game:GetFastFlag("DebugPrintIntervalPerformanceTrackerResults") then
                    print("IntervalPerformanceTracker:" .. tostring(v71) .. " logged with results:");
                    for v78, v79 in v74 do
                        print("\t" .. tostring(v78) .. " = " .. tostring(v79));
                    end;
                end;
            end;
            if l_GetFFlagAXFPSEventStreamAndCounters_0() then
                v70:_fireStatsTracking(v74);
            end;
            v70._intervals[v71] = nil;
        end;
        v70:disconnectUnusedRenderStepped();
        return;
    end;
end;
v40.cancelTracking = function(v80, v81) --[[ Line: 398 ]] --[[ Name: cancelTracking ]]
    -- upvalues: v8 (copy)
    if not v8 then
        return;
    else
        v80._intervals[v81] = nil;
        v80:disconnectUnusedRenderStepped();
        return;
    end;
end;
v40.disconnectUnusedRenderStepped = function(v82) --[[ Line: 408 ]] --[[ Name: disconnectUnusedRenderStepped ]]
    if not next(v82._intervals) and v82._renderSteppedConnection then
        v82._renderSteppedConnection:Disconnect();
        v82._renderSteppedConnection = nil;
    end;
end;
v40.class = v40;
return v40.new();