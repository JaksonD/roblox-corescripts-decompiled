local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactInternalTypes);
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local l_enableProfilerCommitHooks_0 = l_ReactFeatureFlags_0.enableProfilerCommitHooks;
local l_Profiler_0 = require(script.Parent.ReactWorkTags).Profiler;
local l_unstable_now_0 = require(l_Parent_0.Scheduler).unstable_now;
local v7 = 0;
local v8 = -1;
local v9 = -1;
local v10 = -1;
getCommitTime = function() --[[ Line: 43 ]] --[[ Name: getCommitTime ]]
    -- upvalues: v7 (ref)
    return v7;
end;
recordCommitTime = function() --[[ Line: 47 ]] --[[ Name: recordCommitTime ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), v7 (ref), l_unstable_now_0 (copy)
    if not l_enableProfilerTimer_0 then
        return;
    else
        v7 = l_unstable_now_0();
        return;
    end;
end;
startProfilerTimer = function(v11) --[[ Line: 54 ]] --[[ Name: startProfilerTimer ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), v9 (ref), l_unstable_now_0 (copy)
    if not l_enableProfilerTimer_0 then
        return;
    else
        v9 = l_unstable_now_0();
        if v11.actualStartTime ~= nil and v11.actualStartTime < 0 then
            v11.actualStartTime = l_unstable_now_0();
        end;
        return;
    end;
end;
stopProfilerTimerIfRunning = function(_) --[[ Line: 67 ]] --[[ Name: stopProfilerTimerIfRunning ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), v9 (ref)
    if not l_enableProfilerTimer_0 then
        return;
    else
        v9 = -1;
        return;
    end;
end;
stopProfilerTimerIfRunningAndRecordDelta = function(v13, v14) --[[ Line: 74 ]] --[[ Name: stopProfilerTimerIfRunningAndRecordDelta ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), v9 (ref), l_unstable_now_0 (copy)
    if not l_enableProfilerTimer_0 then
        return;
    else
        if v9 >= 0 then
            local v15 = l_unstable_now_0() - v9;
            v13.actualDuration = v13.actualDuration + v15;
            if v14 then
                v13.selfBaseDuration = v15;
            end;
            v9 = -1;
        end;
        return;
    end;
end;
recordLayoutEffectDuration = function(v16) --[[ Line: 92 ]] --[[ Name: recordLayoutEffectDuration ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), v8 (ref), l_unstable_now_0 (copy), l_Profiler_0 (copy)
    if not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0 then
        return;
    else
        if v8 >= 0 then
            local v17 = l_unstable_now_0() - v8;
            v8 = -1;
            local l_return__0 = v16.return_;
            while l_return__0 ~= nil do
                if l_return__0.tag == l_Profiler_0 then
                    local l_stateNode_0 = l_return__0.stateNode;
                    l_stateNode_0.effectDuration = l_stateNode_0.effectDuration + v17;
                    return;
                else
                    l_return__0 = l_return__0.return_;
                end;
            end;
        end;
        return;
    end;
end;
recordPassiveEffectDuration = function(v20) --[[ Line: 115 ]] --[[ Name: recordPassiveEffectDuration ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), v10 (ref), l_unstable_now_0 (copy), l_Profiler_0 (copy)
    if not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0 then
        return;
    else
        if v10 >= 0 then
            local v21 = l_unstable_now_0() - v10;
            v10 = -1;
            local l_return__1 = v20.return_;
            while l_return__1 ~= nil do
                if l_return__1.tag == l_Profiler_0 then
                    local l_stateNode_1 = l_return__1.stateNode;
                    if l_stateNode_1 ~= nil then
                        l_stateNode_1.passiveEffectDuration = l_stateNode_1.passiveEffectDuration + v21;
                        return;
                    else
                        break;
                    end;
                else
                    l_return__1 = l_return__1.return_;
                end;
            end;
        end;
        return;
    end;
end;
startLayoutEffectTimer = function() --[[ Line: 143 ]] --[[ Name: startLayoutEffectTimer ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), v8 (ref), l_unstable_now_0 (copy)
    if not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0 then
        return;
    else
        v8 = l_unstable_now_0();
        return;
    end;
end;
startPassiveEffectTimer = function() --[[ Line: 150 ]] --[[ Name: startPassiveEffectTimer ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), v10 (ref), l_unstable_now_0 (copy)
    if not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0 then
        return;
    else
        v10 = l_unstable_now_0();
        return;
    end;
end;
transferActualDuration = function(v24) --[[ Line: 157 ]] --[[ Name: transferActualDuration ]]
    local l_child_0 = v24.child;
    while l_child_0 do
        v24.actualDuration = v24.actualDuration + l_child_0.actualDuration;
        l_child_0 = l_child_0.sibling;
    end;
end;
return {
    getCommitTime = getCommitTime, 
    recordCommitTime = recordCommitTime, 
    recordLayoutEffectDuration = recordLayoutEffectDuration, 
    recordPassiveEffectDuration = recordPassiveEffectDuration, 
    startLayoutEffectTimer = startLayoutEffectTimer, 
    startPassiveEffectTimer = startPassiveEffectTimer, 
    startProfilerTimer = startProfilerTimer, 
    stopProfilerTimerIfRunning = stopProfilerTimerIfRunning, 
    stopProfilerTimerIfRunningAndRecordDelta = stopProfilerTimerIfRunningAndRecordDelta, 
    transferActualDuration = transferActualDuration
};