local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_IntervalPerformanceTracker_0 = require(l_Parent_0.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_TimeToInteractiveTracker_0 = require(l_Parent_0.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_Logger_0 = require(l_Parent_0.ExpChatShared).Logger;
local v4 = require(script.Parent.ExpChatPerfEventConfig);
local l_EventTypes_0 = v4.EventTypes;
local l_Events_0 = v4.Events;
local l_EventConfig_0 = v4.EventConfig;
local v17 = {
    start = function(v8, v9) --[[ Line: 19 ]] --[[ Name: start ]]
        -- upvalues: l_EventConfig_0 (copy), l_EventTypes_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_Logger_0 (copy)
        local v10 = l_EventConfig_0[v8] or {};
        if v10.type == l_EventTypes_0.TTI then
            v10.onStart(v9);
            l_TimeToInteractiveTracker_0.trackStart(v10.baseName);
            return;
        elseif v10.type == l_EventTypes_0.Interval then
            if not v10.canStart(v9) then
                return;
            else
                l_IntervalPerformanceTracker_0:cancelTracking(v10.name);
                v10.onStart(v9);
                l_IntervalPerformanceTracker_0:startTracking(v10.name, nil, v10.intervalMetrics, true, true);
                return;
            end;
        else
            l_Logger_0:warning((("ExpChatPerfTracker.start: unknown event type for event: %*"):format(v8)));
            return;
        end;
    end, 
    finish = function(v11, v12) --[[ Line: 38 ]] --[[ Name: finish ]]
        -- upvalues: l_EventConfig_0 (copy), l_EventTypes_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_Logger_0 (copy)
        local v13 = l_EventConfig_0[v11] or {};
        if v13.type == l_EventTypes_0.TTI then
            if not v13.canFinish(v12) then
                return;
            else
                l_TimeToInteractiveTracker_0.trackEnd(v13.baseName);
                return;
            end;
        elseif v13.type == l_EventTypes_0.Interval then
            if not v13.canFinish(v12) then
                return;
            else
                v13.onFinish(v12);
                l_IntervalPerformanceTracker_0:stopAndLogTracking(v13.name);
                return;
            end;
        else
            l_Logger_0:warning((("ExpChatPerfTracker.finish: unknown event type for event: %*"):format(v11)));
            return;
        end;
    end, 
    cancel = function(v14, v15) --[[ Line: 56 ]] --[[ Name: cancel ]]
        -- upvalues: l_EventConfig_0 (copy), l_EventTypes_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_Logger_0 (copy)
        local v16 = l_EventConfig_0[v14] or {};
        if v16.type == l_EventTypes_0.TTI then
            l_TimeToInteractiveTracker_0.resetEvent(v16.baseName);
            return;
        elseif v16.type == l_EventTypes_0.Interval then
            v16.onFinish(v15);
            l_IntervalPerformanceTracker_0:cancelTracking(v16.name);
            return;
        else
            l_Logger_0:warning((("ExpChatPerfTracker.cancel: unknown event type for event: %*"):format(v14)));
            return;
        end;
    end
};
v17.cancelAll = function() --[[ Line: 68 ]] --[[ Name: cancelAll ]]
    -- upvalues: l_EventConfig_0 (copy), v17 (copy)
    for v18, _ in l_EventConfig_0 do
        v17.cancel(v18);
    end;
end;
v17.Events = l_Events_0;
return v17;