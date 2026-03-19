local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_DiscoveryAppLaunchTracker_0 = require(l_Parent_0.AppLaunchTracker).DiscoveryAppLaunchTracker;
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local v4 = require(l_script_FirstAncestor_0.SduiErrors);
local v5 = game:DefineFastInt("DiscoverySduiInstrumentationHundredthsPercent", 0) >= math.random(10000);
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v6 (copy)
    local v9 = {
        startTime = 0, 
        openTimerCount = 0, 
        openTimers = {}, 
        closedTimers = {}, 
        isFlushScheduled = false, 
        flushDelay = v7 or 0.1, 
        enabled = v8 or v5
    };
    setmetatable(v9, v6);
    return v9;
end;
v6.startTimerFlow = function(v10, v11) --[[ Line: 53 ]] --[[ Name: startTimerFlow ]]
    if not v10.enabled then
        return;
    else
        local v12 = 1000 * os.clock();
        if v10.openTimerCount == 0 then
            v10.startTime = v12;
        end;
        v10.openTimerCount = v10.openTimerCount + 1;
        local v13 = v10.openTimers[v11];
        if v13 then
            if v13.openCount == 0 then
                v13.startTime = v12;
            end;
            v13.count = v13.count + 1;
            v13.openCount = v13.openCount + 1;
            return;
        else
            v10.openTimers[v11] = {
                startTime = v12, 
                failed = 0, 
                count = 1, 
                openCount = 1
            };
            return;
        end;
    end;
end;
v6.stopTimerFlow = function(v14, v15, v16, v17) --[[ Line: 86 ]] --[[ Name: stopTimerFlow ]]
    -- upvalues: v4 (copy), l_DiscoveryAppLaunchTracker_0 (copy)
    if not v14.enabled then
        return;
    else
        v14.openTimerCount = v14.openTimerCount - 1;
        local v18 = v14.openTimers[v15];
        if not v18 then
            v16.dependencies.logger.reportError(v4.SduiErrorType.NilInstrumentationTimer, {
                name = v15, 
                message = "Failed to find timer when calling stopTimer"
            }, v16.appPage);
            return;
        else
            if v17 then
                v18.failed = v18.failed + 1;
            end;
            v18.openCount = v18.openCount - 1;
            if v18.openCount == 0 then
                local v19 = 1000 * os.clock();
                local v20 = v19 - v18.startTime;
                v14:aggregateClosedTimer(v15, v18.count, v18.failed, v20);
                v14.openTimers[v15] = nil;
                if v14.openTimerCount == 0 then
                    v14:scheduleFlush(v16);
                    local v21 = v19 - v14.startTime;
                    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
                        l_DiscoveryAppLaunchTracker_0.default:trackSduiDuration(v21);
                        return;
                    end;
                elseif v14.openTimerCount < 1 then
                    v16.dependencies.logger.reportError(v4.SduiErrorType.ImbalancedStartStopTimer, {
                        name = v15, 
                        message = ("Negative timer count when stopping timer %*"):format(v14.openTimerCount)
                    }, v16.appPage);
                end;
            end;
            return;
        end;
    end;
end;
v6.aggregateClosedTimer = function(v22, v23, v24, v25, v26) --[[ Line: 133 ]] --[[ Name: aggregateClosedTimer ]]
    local v27 = v22.closedTimers[v23];
    if v27 then
        v27.failed = v27.failed + v25;
        v27.count = v27.count + v24;
        v27.durationMs = v27.durationMs + v26;
        return;
    else
        v22.closedTimers[v23] = {
            failed = v25, 
            count = v24, 
            durationMs = v26
        };
        return;
    end;
end;
v6.scheduleFlush = function(v28, v29) --[[ Line: 154 ]] --[[ Name: scheduleFlush ]]
    if v28.enabled and not v28.isFlushScheduled then
        task.delay(v28.flushDelay, function() --[[ Line: 156 ]]
            -- upvalues: v28 (copy), v29 (copy)
            v28.isFlushScheduled = false;
            v28:reportTimers(v29);
        end);
        v28.isFlushScheduled = true;
    end;
end;
v6.reportTimers = function(v30, v31) --[[ Line: 164 ]] --[[ Name: reportTimers ]]
    if v30.enabled then
        v31.dependencies.logger.reportTimers(v30.closedTimers, v31.appPage);
        v30.closedTimers = {};
    end;
end;
return v6;