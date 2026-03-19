local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new("AppChatPerf");
local l_IntervalPerformanceTracker_0 = require(l_Parent_0.IntervalPerformanceTracker).IntervalPerformanceTracker;
local v4 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfEventInfo);
local v5 = require(l_script_FirstAncestor_0.Telemetry.AppChatTTITracker);
local v6 = {
    "duration", 
    "averageFPS", 
    "longestFrameTime"
};
local v7 = {};
local function v12(v8) --[[ Line: 40 ]] --[[ Name: canStartInterval ]]
    -- upvalues: v4 (copy), v5 (copy)
    local v9 = v4.getParentTTI(v8);
    local v10 = v4.getTTIPage(v9);
    if not v5.isInteractive(v9) then
        return false, v10 .. "_not_interactive";
    else
        local v11 = v5.getInteractiveTimestamp(v9);
        if v11 and os.clock() - v11 < 0.5 then
            return false, v10 .. "_interactive_settling_delay";
        else
            return true, nil;
        end;
    end;
end;
local v28 = {
    start = function(v13, _) --[[ Line: 66 ]] --[[ Name: start ]]
        -- upvalues: v4 (copy), v12 (copy), v2 (copy), l_IntervalPerformanceTracker_0 (copy), v6 (copy), v7 (copy)
        local v15 = v4.getIntervalName(v13);
        local v16, v17 = v12(v13);
        if not v16 then
            v2:debug("Perf start ignored: {} (reason={})", v13, v17 or "unknown");
            return false;
        else
            v2:debug("Interval Start: {}", v15);
            l_IntervalPerformanceTracker_0:startTracking(v15, nil, v6, true, true);
            v7[v13] = true;
            return true;
        end;
    end, 
    finish = function(v18) --[[ Line: 87 ]] --[[ Name: finish ]]
        -- upvalues: v4 (copy), v7 (copy), v2 (copy), l_IntervalPerformanceTracker_0 (copy)
        local v19 = v4.getIntervalName(v18);
        if not v7[v18] then
            return false;
        else
            v2:debug("Interval Stop: {}", v19);
            l_IntervalPerformanceTracker_0:stopAndLogTracking(v19);
            v7[v18] = false;
            return true;
        end;
    end, 
    cancel = function(v20) --[[ Line: 98 ]] --[[ Name: cancel ]]
        -- upvalues: v4 (copy), v7 (copy), v2 (copy), l_IntervalPerformanceTracker_0 (copy)
        local v21 = v4.getIntervalName(v20);
        if not v7[v20] then
            return false;
        else
            v2:debug("Interval Cancel: {}", v21);
            l_IntervalPerformanceTracker_0:cancelTracking(v21);
            v7[v20] = false;
            return true;
        end;
    end, 
    isActive = function(v22) --[[ Line: 109 ]] --[[ Name: isActive ]]
        -- upvalues: v7 (copy)
        return v7[v22] == true;
    end, 
    cancelIntervalsForTTI = function(v23, v24) --[[ Line: 115 ]] --[[ Name: cancelIntervalsForTTI ]]
        -- upvalues: v4 (copy), v7 (copy), v2 (copy), l_IntervalPerformanceTracker_0 (copy)
        for _, v26 in (v4.getIntervalsForTTI(v23)) do
            if v7[v26] then
                local v27 = v4.getIntervalName(v26);
                v2:debug("Canceling interval ({}): {}", v24, v27);
                l_IntervalPerformanceTracker_0:cancelTracking(v27);
                v7[v26] = false;
            end;
        end;
    end
};
v5.setOnConversationSwitch(function(v29) --[[ Line: 128 ]]
    -- upvalues: v28 (copy)
    v28.cancelIntervalsForTTI(v29, "conversation_switch");
end);
return v28;