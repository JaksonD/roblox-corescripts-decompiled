local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(script.Scheduler);
local function _(v3) --[[ Line: 17 ]] --[[ Name: onlyInTestError ]]
    return function() --[[ Line: 18 ]]
        -- upvalues: v3 (copy)
        error(v3 .. " is only available in tests, not in production");
    end;
end;
local v5 = v2(nil);
local v6 = require(script.Tracing);
local v7 = require(script.TracingSubscriptions);
if v1.__ROACT_17_MOCK_SCHEDULER__ then
    return require(script.unstable_mock);
else
    local v8 = {
        unstable_ImmediatePriority = v5.unstable_ImmediatePriority, 
        unstable_UserBlockingPriority = v5.unstable_UserBlockingPriority, 
        unstable_NormalPriority = v5.unstable_NormalPriority, 
        unstable_IdlePriority = v5.unstable_IdlePriority, 
        unstable_LowPriority = v5.unstable_LowPriority, 
        unstable_runWithPriority = v5.unstable_runWithPriority, 
        unstable_next = v5.unstable_next, 
        unstable_scheduleCallback = v5.unstable_scheduleCallback, 
        unstable_cancelCallback = v5.unstable_cancelCallback, 
        unstable_wrapCallback = v5.unstable_wrapCallback, 
        unstable_getCurrentPriorityLevel = v5.unstable_getCurrentPriorityLevel, 
        unstable_shouldYield = v5.unstable_shouldYield, 
        unstable_requestPaint = v5.unstable_requestPaint, 
        unstable_continueExecution = v5.unstable_continueExecution, 
        unstable_pauseExecution = v5.unstable_pauseExecution, 
        unstable_getFirstCallbackNode = v5.unstable_getFirstCallbackNode, 
        unstable_now = v5.unstable_now, 
        unstable_forceFrameRate = v5.unstable_forceFrameRate, 
        unstable_setSchedulerFlags = v5.unstable_setSchedulerFlags, 
        unstable_getSchedulerFlags = v5.unstable_getSchedulerFlags
    };
    local v9 = "unstable_flushAllWithoutAsserting";
    local l_v9_0 = v9 --[[ copy: 9 -> 13 ]];
    v8.unstable_flushAllWithoutAsserting = function() --[[ Line: 18 ]]
        -- upvalues: l_v9_0 (copy)
        error(l_v9_0 .. " is only available in tests, not in production");
    end;
    v9 = "unstable_flushAll";
    local l_v9_1 = v9 --[[ copy: 9 -> 14 ]];
    v8.unstable_flushAll = function() --[[ Line: 18 ]]
        -- upvalues: l_v9_1 (copy)
        error(l_v9_1 .. " is only available in tests, not in production");
    end;
    v9 = "unstable_flushNumberOfYields";
    local l_v9_2 = v9 --[[ copy: 9 -> 15 ]];
    v8.unstable_flushNumberOfYields = function() --[[ Line: 18 ]]
        -- upvalues: l_v9_2 (copy)
        error(l_v9_2 .. " is only available in tests, not in production");
    end;
    v9 = "unstable_clearYields";
    local l_v9_3 = v9 --[[ copy: 9 -> 16 ]];
    v8.unstable_clearYields = function() --[[ Line: 18 ]]
        -- upvalues: l_v9_3 (copy)
        error(l_v9_3 .. " is only available in tests, not in production");
    end;
    v9 = "unstable_clearYields";
    local l_v9_4 = v9 --[[ copy: 9 -> 17 ]];
    v8.unstable_flushUntilNextPaint = function() --[[ Line: 18 ]]
        -- upvalues: l_v9_4 (copy)
        error(l_v9_4 .. " is only available in tests, not in production");
    end;
    v9 = "unstable_advanceTime";
    local l_v9_5 = v9 --[[ copy: 9 -> 18 ]];
    v8.unstable_advanceTime = function() --[[ Line: 18 ]]
        -- upvalues: l_v9_5 (copy)
        error(l_v9_5 .. " is only available in tests, not in production");
    end;
    v9 = "unstable_flushExpired";
    local l_v9_6 = v9 --[[ copy: 9 -> 19 ]];
    v8.unstable_flushExpired = function() --[[ Line: 18 ]]
        -- upvalues: l_v9_6 (copy)
        error(l_v9_6 .. " is only available in tests, not in production");
    end;
    v9 = "unstable_yieldValue";
    v8.unstable_yieldValue = function() --[[ Line: 18 ]]
        -- upvalues: v9 (copy)
        error(v9 .. " is only available in tests, not in production");
    end;
    local v17 = {};
    local v18 = "unstable_wrap";
    v17.unstable_wrap = function() --[[ Line: 18 ]]
        -- upvalues: v18 (copy)
        error(v18 .. " is only available in tests, not in production");
    end;
    v17.__interactionsRef = {};
    v17.__subscriberRef = {};
    v8.tracing = v17;
    for v19, v20 in v6 do
        v8.tracing[v19] = v20;
    end;
    for v21, v22 in v7 do
        v8.tracing[v21] = v22;
    end;
    return v8;
end;