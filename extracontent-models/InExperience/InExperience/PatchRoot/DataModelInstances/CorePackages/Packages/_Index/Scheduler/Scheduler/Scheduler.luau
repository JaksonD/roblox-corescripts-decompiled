return function(v0) --[[ Line: 12 ]]
    local l_Parent_0 = script.Parent.Parent;
    local v2 = require(l_Parent_0.ReactGlobals);
    local v3 = require(l_Parent_0.Shared);
    local l_describeError_0 = v3.describeError;
    local l_ReactFeatureFlags_0 = v3.ReactFeatureFlags;
    local v6 = require(script.Parent.SchedulerFeatureFlags);
    local l_enableSchedulerDebugging_0 = v6.enableSchedulerDebugging;
    local l_enableProfiling_0 = v6.enableProfiling;
    local v9 = v0 or require(script.Parent.SchedulerHostConfig);
    local l_requestHostCallback_0 = v9.requestHostCallback;
    local l_requestHostTimeout_0 = v9.requestHostTimeout;
    local l_cancelHostTimeout_0 = v9.cancelHostTimeout;
    local l_shouldYieldToHost_0 = v9.shouldYieldToHost;
    local l_getCurrentTime_0 = v9.getCurrentTime;
    local l_forceFrameRate_0 = v9.forceFrameRate;
    local l_requestPaint_0 = v9.requestPaint;
    local l_setSchedulerFlags_0 = v9.setSchedulerFlags;
    local l_getSchedulerFlags_0 = v9.getSchedulerFlags;
    local v19 = require(script.Parent.NoYield);
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    local function _(v23, v24) --[[ Line: 51 ]]
        -- upvalues: v21 (ref)
        local v25 = #v23 + 1;
        v23[v25] = v24;
        v21(v23, v24, v25);
    end;
    local function _(v27) --[[ Line: 58 ]]
        return v27[1];
    end;
    local function _(v29) --[[ Line: 62 ]]
        -- upvalues: v22 (ref)
        local v30 = v29[1];
        if v30 ~= nil then
            local v31 = v29[#v29];
            v29[#v29] = nil;
            if v31 ~= v30 then
                v29[1] = v31;
                v22(v29, v31, 1);
            end;
            return v30;
        else
            return nil;
        end;
    end;
    v21 = function(v33, v34, v35) --[[ Line: 78 ]]
        -- upvalues: v20 (ref)
        while true do
            local v36 = math.floor(v35 / 2);
            local v37 = v33[v36];
            if v37 ~= nil and v20(v37, v34) > 0 then
                v33[v36] = v34;
                v33[v35] = v37;
                v35 = v36;
            else
                break;
            end;
        end;
    end;
    v22 = function(v38, v39, v40) --[[ Line: 94 ]]
        -- upvalues: v20 (ref)
        local v41 = #v38;
        while true do
            if v40 < v41 then
                local v42 = v40 * 2;
                local v43 = v38[v42];
                local v44 = v42 + 1;
                local v45 = v38[v44];
                if v43 ~= nil and v20(v43, v39) < 0 then
                    if v45 ~= nil and v20(v45, v43) < 0 then
                        v38[v40] = v45;
                        v38[v44] = v39;
                        v40 = v44;
                    else
                        v38[v40] = v43;
                        v38[v42] = v39;
                        v40 = v42;
                    end;
                elseif v45 ~= nil and v20(v45, v39) < 0 then
                    v38[v40] = v45;
                    v38[v44] = v39;
                    v40 = v44;
                else
                    return;
                end;
            else
                return;
            end;
        end;
    end;
    v20 = function(v46, v47) --[[ Line: 124 ]]
        local v48 = v46.sortIndex - v47.sortIndex;
        if v48 == 0 then
            return v46.id - v47.id;
        else
            return v48;
        end;
    end;
    local v49 = require(script.Parent.SchedulerPriorities);
    local l_ImmediatePriority_0 = v49.ImmediatePriority;
    local l_UserBlockingPriority_0 = v49.UserBlockingPriority;
    local l_NormalPriority_0 = v49.NormalPriority;
    local l_LowPriority_0 = v49.LowPriority;
    local l_IdlePriority_0 = v49.IdlePriority;
    local v55 = require(script.Parent.SchedulerProfiling);
    local l_markTaskRun_0 = v55.markTaskRun;
    local l_markTaskYield_0 = v55.markTaskYield;
    local l_markTaskCompleted_0 = v55.markTaskCompleted;
    local l_markTaskCanceled_0 = v55.markTaskCanceled;
    local l_markTaskErrored_0 = v55.markTaskErrored;
    local l_markSchedulerSuspended_0 = v55.markSchedulerSuspended;
    local l_markSchedulerUnsuspended_0 = v55.markSchedulerUnsuspended;
    local l_markTaskStart_0 = v55.markTaskStart;
    local l_stopLoggingProfilingEvents_0 = v55.stopLoggingProfilingEvents;
    local l_startLoggingProfilingEvents_0 = v55.startLoggingProfilingEvents;
    local v66 = {};
    local v67 = {};
    local v68 = 1;
    local v69 = false;
    local v70 = nil;
    local l_l_NormalPriority_0_0 = l_NormalPriority_0;
    local v72 = false;
    local v73 = false;
    local v74 = false;
    local v75 = nil;
    local v76 = nil;
    local v77 = nil;
    local function v87(v78) --[[ Line: 191 ]] --[[ Name: advanceTimers ]]
        -- upvalues: v67 (copy), v22 (ref), v66 (copy), v21 (ref), l_enableProfiling_0 (copy), l_markTaskStart_0 (copy)
        local v79 = v67[1];
        while true do
            if v79 ~= nil then
                if v79.callback == nil then
                    local l_v67_0 = v67;
                    local v81 = l_v67_0[1];
                    if v81 ~= nil then
                        local v82 = l_v67_0[#l_v67_0];
                        l_v67_0[#l_v67_0] = nil;
                        if v82 ~= v81 then
                            l_v67_0[1] = v82;
                            v22(l_v67_0, v82, 1);
                        end;
                    end;
                elseif v79.startTime <= v78 then
                    local l_v67_1 = v67;
                    local v84 = l_v67_1[1];
                    if v84 ~= nil then
                        local v85 = l_v67_1[#l_v67_1];
                        l_v67_1[#l_v67_1] = nil;
                        if v85 ~= v84 then
                            l_v67_1[1] = v85;
                            v22(l_v67_1, v85, 1);
                        end;
                    end;
                    v79.sortIndex = v79.expirationTime;
                    l_v67_1 = v66;
                    v84 = v79;
                    local v86 = #l_v67_1 + 1;
                    l_v67_1[v86] = v84;
                    v21(l_v67_1, v84, v86);
                    if l_enableProfiling_0 then
                        l_markTaskStart_0(v79, v78);
                        v79.isQueued = true;
                    end;
                else
                    return;
                end;
                v79 = v67[1];
            else
                return;
            end;
        end;
    end;
    v75 = function(v88) --[[ Line: 217 ]]
        -- upvalues: v74 (ref), v87 (copy), v73 (ref), v66 (copy), l_requestHostCallback_0 (copy), v76 (ref), v67 (copy), l_requestHostTimeout_0 (copy), v75 (ref)
        v74 = false;
        v87(v88);
        if not v73 then
            if v66[1] ~= nil then
                v73 = true;
                l_requestHostCallback_0(v76);
                return;
            else
                local v89 = v67[1];
                if v89 ~= nil then
                    l_requestHostTimeout_0(v75, v89.startTime - v88);
                end;
            end;
        end;
    end;
    v76 = function(v90, v91) --[[ Line: 234 ]]
        -- upvalues: l_enableProfiling_0 (copy), l_markSchedulerUnsuspended_0 (copy), v73 (ref), v74 (ref), l_cancelHostTimeout_0 (copy), v72 (ref), l_l_NormalPriority_0_0 (ref), v2 (copy), v77 (ref), l_describeError_0 (copy), v70 (ref), l_getCurrentTime_0 (copy), l_markTaskErrored_0 (copy), l_markSchedulerSuspended_0 (copy)
        if l_enableProfiling_0 then
            l_markSchedulerUnsuspended_0(v91);
        end;
        v73 = false;
        if v74 then
            v74 = false;
            l_cancelHostTimeout_0();
        end;
        v72 = true;
        local l_l_l_NormalPriority_0_0_0 = l_l_NormalPriority_0_0;
        local v93 = nil;
        local v94 = nil;
        if not v2.__YOLO__ then
            if l_enableProfiling_0 then
                local v95, v96 = xpcall(v77, l_describeError_0, v90, v91);
                v93 = v95;
                v94 = v96;
                if not v93 and v70 ~= nil then
                    v95 = l_getCurrentTime_0();
                    l_markTaskErrored_0(v70, v95);
                    v70.isQueued = false;
                end;
            else
                v93 = true;
                v94 = v77(v90, v91);
            end;
        else
            v93 = true;
            v94 = v77(v90, v91);
        end;
        v70 = nil;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_0;
        v72 = false;
        if l_enableProfiling_0 then
            local v97 = l_getCurrentTime_0();
            l_markSchedulerSuspended_0(v97);
        end;
        if not v93 then
            error(v94);
        end;
        return v94;
    end;
    v77 = function(v98, v99) --[[ Line: 291 ]]
        -- upvalues: v2 (copy), l_ReactFeatureFlags_0 (copy), v87 (copy), v70 (ref), v66 (copy), l_enableSchedulerDebugging_0 (copy), v69 (ref), l_shouldYieldToHost_0 (copy), l_l_NormalPriority_0_0 (ref), l_markTaskRun_0 (copy), v19 (copy), l_getCurrentTime_0 (copy), l_markTaskYield_0 (copy), l_enableProfiling_0 (copy), l_markTaskCompleted_0 (copy), v22 (ref), v67 (copy), l_requestHostTimeout_0 (copy), v75 (ref)
        local v100 = v2.__DEV__ and l_ReactFeatureFlags_0.catchYieldingInDEV;
        local l_v99_0 = v99;
        v87(l_v99_0);
        v70 = v66[1];
        while v70 ~= nil and (not l_enableSchedulerDebugging_0 or not v69) and (l_v99_0 >= v70.expirationTime or v98 and not l_shouldYieldToHost_0()) do
            local l_callback_0 = v70.callback;
            if typeof(l_callback_0) == "function" then
                v70.callback = nil;
                l_l_NormalPriority_0_0 = v70.priorityLevel;
                local v103 = v70.expirationTime <= l_v99_0;
                l_markTaskRun_0(v70, l_v99_0);
                local v104 = nil;
                v104 = if v100 then v19(l_callback_0, v103) else l_callback_0(v103);
                l_v99_0 = l_getCurrentTime_0();
                if typeof(v104) == "function" then
                    v70.callback = v104;
                    l_markTaskYield_0(v70, l_v99_0);
                else
                    if l_enableProfiling_0 then
                        l_markTaskCompleted_0(v70, l_v99_0);
                        v70.isQueued = false;
                    end;
                    if v70 == v66[1] then
                        local l_v66_0 = v66;
                        local v106 = l_v66_0[1];
                        if v106 ~= nil then
                            local v107 = l_v66_0[#l_v66_0];
                            l_v66_0[#l_v66_0] = nil;
                            if v107 ~= v106 then
                                l_v66_0[1] = v107;
                                v22(l_v66_0, v107, 1);
                            end;
                        end;
                    end;
                end;
                v87(l_v99_0);
            else
                local l_v66_1 = v66;
                local v109 = l_v66_1[1];
                if v109 ~= nil then
                    local v110 = l_v66_1[#l_v66_1];
                    l_v66_1[#l_v66_1] = nil;
                    if v110 ~= v109 then
                        l_v66_1[1] = v110;
                        v22(l_v66_1, v110, 1);
                    end;
                end;
            end;
            v70 = v66[1];
        end;
        if v70 ~= nil then
            return true;
        else
            local v111 = v67[1];
            if v111 ~= nil then
                l_requestHostTimeout_0(v75, v111.startTime - l_v99_0);
            end;
            return false;
        end;
    end;
    local function v119(v112, v113) --[[ Line: 358 ]] --[[ Name: unstable_runWithPriority ]]
        -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_IdlePriority_0 (copy), l_l_NormalPriority_0_0 (ref), v2 (copy), l_describeError_0 (copy)
        if v112 ~= l_ImmediatePriority_0 and v112 ~= l_UserBlockingPriority_0 and v112 ~= l_NormalPriority_0 and v112 ~= l_LowPriority_0 and v112 ~= l_IdlePriority_0 then
            v112 = l_NormalPriority_0;
        end;
        local l_l_l_NormalPriority_0_0_1 = l_l_NormalPriority_0_0;
        l_l_NormalPriority_0_0 = v112;
        local v115 = nil;
        local v116 = nil;
        if not v2.__YOLO__ then
            local v117, v118 = xpcall(v113, l_describeError_0);
            v115 = v117;
            v116 = v118;
        else
            v115 = true;
            v116 = v113();
        end;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_1;
        if not v115 then
            error(v116);
        end;
        return v116;
    end;
    local function v127(v120) --[[ Line: 393 ]] --[[ Name: unstable_next ]]
        -- upvalues: l_l_NormalPriority_0_0 (ref), l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), v2 (copy), l_describeError_0 (copy)
        local v121 = nil;
        v121 = if not (l_l_NormalPriority_0_0 ~= l_ImmediatePriority_0 and l_l_NormalPriority_0_0 ~= l_UserBlockingPriority_0) or l_l_NormalPriority_0_0 == l_NormalPriority_0 then l_NormalPriority_0 else l_l_NormalPriority_0_0;
        local l_l_l_NormalPriority_0_0_2 = l_l_NormalPriority_0_0;
        l_l_NormalPriority_0_0 = v121;
        local v123 = nil;
        local v124 = nil;
        if not v2.__YOLO__ then
            local v125, v126 = xpcall(v120, l_describeError_0);
            v123 = v125;
            v124 = v126;
        else
            v123 = true;
            v124 = v120();
        end;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_2;
        if not v123 then
            error(v124);
        end;
        return v124;
    end;
    local function v135(v128) --[[ Line: 429 ]] --[[ Name: unstable_wrapCallback ]]
        -- upvalues: l_l_NormalPriority_0_0 (ref), v2 (copy), l_describeError_0 (copy)
        local l_l_l_NormalPriority_0_0_3 = l_l_NormalPriority_0_0;
        return function(...) --[[ Line: 432 ]]
            -- upvalues: l_l_NormalPriority_0_0 (ref), l_l_l_NormalPriority_0_0_3 (copy), v2 (ref), v128 (copy), l_describeError_0 (ref)
            local l_l_l_NormalPriority_0_0_4 = l_l_NormalPriority_0_0;
            l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_3;
            local v131 = nil;
            local v132 = nil;
            if not v2.__YOLO__ then
                local v133, v134 = xpcall(v128, l_describeError_0, ...);
                v131 = v133;
                v132 = v134;
            else
                v131 = true;
                v132 = v128(...);
            end;
            l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_4;
            if not v131 then
                error(v132);
            end;
            return v132;
        end;
    end;
    local function v149(v136, v137, v138) --[[ Line: 457 ]] --[[ Name: unstable_scheduleCallback ]]
        -- upvalues: l_getCurrentTime_0 (copy), l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_IdlePriority_0 (copy), l_LowPriority_0 (copy), v68 (ref), l_enableProfiling_0 (copy), v67 (copy), v21 (ref), v66 (copy), v74 (ref), l_cancelHostTimeout_0 (copy), l_requestHostTimeout_0 (copy), v75 (ref), l_markTaskStart_0 (copy), v73 (ref), v72 (ref), l_requestHostCallback_0 (copy), v76 (ref)
        local v139 = l_getCurrentTime_0();
        local v140 = nil;
        if typeof(v138) == "table" then
            local l_delay_0 = v138.delay;
            v140 = if typeof(l_delay_0) == "number" and l_delay_0 > 0 then v139 + l_delay_0 else v139;
        else
            v140 = v139;
        end;
        local _ = nil;
        local v143 = v140 + (v136 == l_ImmediatePriority_0 and -1 or v136 == l_UserBlockingPriority_0 and 250 or v136 == l_IdlePriority_0 and 1073741823 or v136 == l_LowPriority_0 and 10000 or 5000);
        local v144 = {
            id = v68, 
            callback = v137, 
            priorityLevel = v136, 
            startTime = v140, 
            expirationTime = v143, 
            sortIndex = -1
        };
        v68 = v68 + 1;
        if l_enableProfiling_0 then
            v144.isQueued = false;
        end;
        if v139 < v140 then
            v144.sortIndex = v140;
            local l_v67_2 = v67;
            local v146 = #l_v67_2 + 1;
            l_v67_2[v146] = v144;
            v21(l_v67_2, v144, v146);
            if #v66 == 0 and v144 == v67[1] then
                if v74 then
                    l_cancelHostTimeout_0();
                else
                    v74 = true;
                end;
                l_requestHostTimeout_0(v75, v140 - v139);
                return v144;
            end;
        else
            v144.sortIndex = v143;
            local l_v66_2 = v66;
            local v148 = #l_v66_2 + 1;
            l_v66_2[v148] = v144;
            v21(l_v66_2, v144, v148);
            if l_enableProfiling_0 then
                l_markTaskStart_0(v144, v139);
                v144.isQueued = true;
            end;
            if not v73 and not v72 then
                v73 = true;
                l_requestHostCallback_0(v76);
            end;
        end;
        return v144;
    end;
    local function v150() --[[ Line: 537 ]] --[[ Name: unstable_pauseExecution ]]
        -- upvalues: v69 (ref)
        v69 = true;
    end;
    local function v151() --[[ Line: 541 ]] --[[ Name: unstable_continueExecution ]]
        -- upvalues: v69 (ref), v73 (ref), v72 (ref), l_requestHostCallback_0 (copy), v76 (ref)
        v69 = false;
        if not v73 and not v72 then
            v73 = true;
            l_requestHostCallback_0(v76);
        end;
    end;
    local function v152() --[[ Line: 549 ]] --[[ Name: unstable_getFirstCallbackNode ]]
        -- upvalues: v66 (copy)
        return v66[1];
    end;
    local function v155(v153) --[[ Line: 553 ]] --[[ Name: unstable_cancelCallback ]]
        -- upvalues: l_enableProfiling_0 (copy), l_getCurrentTime_0 (copy), l_markTaskCanceled_0 (copy)
        if l_enableProfiling_0 and v153.isQueued then
            local v154 = l_getCurrentTime_0();
            l_markTaskCanceled_0(v153, v154);
            v153.isQueued = false;
        end;
        v153.callback = nil;
    end;
    local function v156() --[[ Line: 568 ]] --[[ Name: unstable_getCurrentPriorityLevel ]]
        -- upvalues: l_l_NormalPriority_0_0 (ref)
        return l_l_NormalPriority_0_0;
    end;
    return {
        unstable_ImmediatePriority = l_ImmediatePriority_0, 
        unstable_UserBlockingPriority = l_UserBlockingPriority_0, 
        unstable_NormalPriority = l_NormalPriority_0, 
        unstable_IdlePriority = l_IdlePriority_0, 
        unstable_LowPriority = l_LowPriority_0, 
        unstable_runWithPriority = v119, 
        unstable_next = v127, 
        unstable_scheduleCallback = v149, 
        unstable_cancelCallback = v155, 
        unstable_wrapCallback = v135, 
        unstable_getCurrentPriorityLevel = v156, 
        unstable_shouldYield = l_shouldYieldToHost_0, 
        unstable_requestPaint = l_requestPaint_0, 
        unstable_continueExecution = v151, 
        unstable_pauseExecution = v150, 
        unstable_getFirstCallbackNode = v152, 
        unstable_now = l_getCurrentTime_0, 
        unstable_forceFrameRate = l_forceFrameRate_0, 
        unstable_setSchedulerFlags = l_setSchedulerFlags_0, 
        unstable_getSchedulerFlags = l_getSchedulerFlags_0, 
        unstable_Profiling = if l_enableProfiling_0 then {
            startLoggingProfilingEvents = l_startLoggingProfilingEvents_0, 
            stopLoggingProfilingEvents = l_stopLoggingProfilingEvents_0
        } else nil
    };
end;