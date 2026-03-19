local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_IntervalPerformanceTracker_0 = require(l_Parent_0.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_TimeToInteractiveTracker_0 = require(l_Parent_0.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_Logger_0 = require(l_Parent_0.ExpChatShared).Logger;
local v5 = require(script.Parent.ExpChatPerfEventConfig);
local l_EventTypes_0 = v5.EventTypes;
local l_Events_0 = v5.Events;
local l_EventConfig_0 = v5.EventConfig;
local l_Performance_0 = require(l_Parent_0.SocialLuaAnalytics).Performance;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatScrollPerfTracking);
local v20 = {
    start = function(v11, v12) --[[ Line: 23 ]] --[[ Name: start ]]
        -- upvalues: l_EventConfig_0 (copy), l_EventTypes_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_Logger_0 (copy)
        local v13 = l_EventConfig_0[v11] or {};
        if v13.type == l_EventTypes_0.TTI then
            v13.onStart(v12);
            l_TimeToInteractiveTracker_0.trackStart(v13.baseName);
            return true;
        elseif v13.type == l_EventTypes_0.Interval then
            if not v13.canStart(v12) then
                return false;
            else
                l_IntervalPerformanceTracker_0:cancelTracking(v13.name);
                v13.onStart(v12);
                l_IntervalPerformanceTracker_0:startTracking(v13.name, nil, v13.intervalMetrics, true, true);
                return true;
            end;
        else
            l_Logger_0:warning((("ExpChatPerfTracker.start: unknown event type for event: %*"):format(v11)));
            return false;
        end;
    end, 
    finish = function(v14, v15) --[[ Line: 45 ]] --[[ Name: finish ]]
        -- upvalues: l_EventConfig_0 (copy), l_EventTypes_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_Logger_0 (copy)
        local v16 = l_EventConfig_0[v14] or {};
        if v16.type == l_EventTypes_0.TTI then
            if not v16.canFinish(v15) then
                return;
            else
                l_TimeToInteractiveTracker_0.trackEnd(v16.baseName);
                return;
            end;
        elseif v16.type == l_EventTypes_0.Interval then
            if not v16.canFinish(v15) then
                return;
            else
                v16.onFinish(v15);
                l_IntervalPerformanceTracker_0:stopAndLogTracking(v16.name);
                return;
            end;
        else
            l_Logger_0:warning((("ExpChatPerfTracker.finish: unknown event type for event: %*"):format(v14)));
            return;
        end;
    end, 
    cancel = function(v17, v18) --[[ Line: 63 ]] --[[ Name: cancel ]]
        -- upvalues: l_EventConfig_0 (copy), l_EventTypes_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_Logger_0 (copy)
        local v19 = l_EventConfig_0[v17] or {};
        if v19.type == l_EventTypes_0.TTI then
            l_TimeToInteractiveTracker_0.resetEvent(v19.baseName);
            return;
        elseif v19.type == l_EventTypes_0.Interval then
            v19.onFinish(v18);
            l_IntervalPerformanceTracker_0:cancelTracking(v19.name);
            return;
        else
            l_Logger_0:warning((("ExpChatPerfTracker.cancel: unknown event type for event: %*"):format(v17)));
            return;
        end;
    end
};
v20.cancelAll = function() --[[ Line: 75 ]] --[[ Name: cancelAll ]]
    -- upvalues: l_EventConfig_0 (copy), v20 (copy)
    for v21, _ in l_EventConfig_0 do
        v20.cancel(v21);
    end;
end;
v20.Events = l_Events_0;
if v10 then
    v20.startChatWindowScrollInterval = function(v23, v24, v25) --[[ Line: 84 ]] --[[ Name: startChatWindowScrollInterval ]]
        -- upvalues: v20 (copy), l_Performance_0 (copy)
        local v26 = {
            debugName = v23
        };
        local function v28(v27) --[[ Line: 92 ]]
            -- upvalues: v20 (ref), v23 (copy)
            return v20.start(v23, v27);
        end;
        local function v30(v29) --[[ Line: 95 ]]
            -- upvalues: v20 (ref), v23 (copy)
            v20.finish(v23, v29);
        end;
        return l_Performance_0.createScrollIntervalTracker(v28, v30, v24, v25, v26);
    end;
end;
return v20;