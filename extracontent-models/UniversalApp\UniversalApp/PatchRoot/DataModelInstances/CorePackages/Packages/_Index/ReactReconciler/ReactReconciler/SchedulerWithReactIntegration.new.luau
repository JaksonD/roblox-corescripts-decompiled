local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(l_Parent_0.Scheduler);
local l_decoupleUpdatePriorityFromScheduler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.decoupleUpdatePriorityFromScheduler;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local v8 = require(script.Parent.ReactFiberLane);
local l_SyncLanePriority_0 = v8.SyncLanePriority;
local l_getCurrentUpdateLanePriority_0 = v8.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v8.setCurrentUpdateLanePriority;
local l_unstable_runWithPriority_0 = v4.unstable_runWithPriority;
local l_unstable_scheduleCallback_0 = v4.unstable_scheduleCallback;
local l_unstable_cancelCallback_0 = v4.unstable_cancelCallback;
local l_unstable_shouldYield_0 = v4.unstable_shouldYield;
local l_unstable_requestPaint_0 = v4.unstable_requestPaint;
local l_unstable_now_0 = v4.unstable_now;
local l_unstable_getCurrentPriorityLevel_0 = v4.unstable_getCurrentPriorityLevel;
local l_unstable_ImmediatePriority_0 = v4.unstable_ImmediatePriority;
local l_unstable_UserBlockingPriority_0 = v4.unstable_UserBlockingPriority;
local l_unstable_NormalPriority_0 = v4.unstable_NormalPriority;
local l_unstable_LowPriority_0 = v4.unstable_LowPriority;
local l_unstable_IdlePriority_0 = v4.unstable_IdlePriority;
local v24 = require(script.Parent["ReactFiberSchedulerPriorities.roblox"]);
local l_ImmediatePriority_0 = v24.ImmediatePriority;
local l_UserBlockingPriority_0 = v24.UserBlockingPriority;
local l_NormalPriority_0 = v24.NormalPriority;
local l_LowPriority_0 = v24.LowPriority;
local l_IdlePriority_0 = v24.IdlePriority;
local l_NoPriority_0 = v24.NoPriority;
local v31 = nil;
local v32 = {};
local v33 = nil;
v33 = if l_unstable_requestPaint_0 ~= nil then l_unstable_requestPaint_0 else function() --[[ Line: 94 ]]

end;
local v34 = nil;
local v35 = nil;
local v36 = false;
local v37 = l_unstable_now_0();
local function v38() --[[ Line: 118 ]] --[[ Name: now ]]
    -- upvalues: l_unstable_now_0 (copy), v37 (copy)
    return l_unstable_now_0() - v37;
end;
local function v40() --[[ Line: 122 ]] --[[ Name: getCurrentPriorityLevel ]]
    -- upvalues: l_unstable_getCurrentPriorityLevel_0 (copy), l_unstable_ImmediatePriority_0 (copy), l_ImmediatePriority_0 (copy), l_unstable_UserBlockingPriority_0 (copy), l_UserBlockingPriority_0 (copy), l_unstable_NormalPriority_0 (copy), l_NormalPriority_0 (copy), l_unstable_LowPriority_0 (copy), l_LowPriority_0 (copy), l_unstable_IdlePriority_0 (copy), l_IdlePriority_0 (copy), l_invariant_0 (copy), l_NoPriority_0 (copy)
    local v39 = l_unstable_getCurrentPriorityLevel_0();
    if v39 == l_unstable_ImmediatePriority_0 then
        return l_ImmediatePriority_0;
    elseif v39 == l_unstable_UserBlockingPriority_0 then
        return l_UserBlockingPriority_0;
    elseif v39 == l_unstable_NormalPriority_0 then
        return l_NormalPriority_0;
    elseif v39 == l_unstable_LowPriority_0 then
        return l_LowPriority_0;
    elseif v39 == l_unstable_IdlePriority_0 then
        return l_IdlePriority_0;
    else
        l_invariant_0(false, "Unknown priority level.");
        return l_NoPriority_0;
    end;
end;
reactPriorityToSchedulerPriority = function(v41) --[[ Line: 141 ]] --[[ Name: reactPriorityToSchedulerPriority ]]
    -- upvalues: l_ImmediatePriority_0 (copy), l_unstable_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_unstable_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_unstable_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_unstable_LowPriority_0 (copy), l_IdlePriority_0 (copy), l_unstable_IdlePriority_0 (copy), l_invariant_0 (copy)
    if v41 == l_ImmediatePriority_0 then
        return l_unstable_ImmediatePriority_0;
    elseif v41 == l_UserBlockingPriority_0 then
        return l_unstable_UserBlockingPriority_0;
    elseif v41 == l_NormalPriority_0 then
        return l_unstable_NormalPriority_0;
    elseif v41 == l_LowPriority_0 then
        return l_unstable_LowPriority_0;
    elseif v41 == l_IdlePriority_0 then
        return l_unstable_IdlePriority_0;
    else
        l_invariant_0(false, "Unknown priority level.");
        return nil;
    end;
end;
local function v45(v42, v43) --[[ Line: 160 ]] --[[ Name: runWithPriority ]]
    -- upvalues: l_unstable_runWithPriority_0 (copy)
    local v44 = reactPriorityToSchedulerPriority(v42);
    return l_unstable_runWithPriority_0(v44, v43);
end;
local function v50(v46, v47, v48) --[[ Line: 168 ]] --[[ Name: scheduleCallback ]]
    -- upvalues: l_unstable_scheduleCallback_0 (copy)
    local v49 = reactPriorityToSchedulerPriority(v46);
    return l_unstable_scheduleCallback_0(v49, v47, v48);
end;
local function v52(v51) --[[ Line: 177 ]] --[[ Name: scheduleSyncCallback ]]
    -- upvalues: v34 (ref), v35 (ref), l_unstable_scheduleCallback_0 (copy), l_unstable_ImmediatePriority_0 (copy), v31 (ref), v32 (copy)
    if v34 == nil then
        v34 = {
            v51
        };
        v35 = l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v31);
    else
        table.insert(v34, v51);
    end;
    return v32;
end;
local function v54(v53) --[[ Line: 196 ]] --[[ Name: cancelCallback ]]
    -- upvalues: v32 (copy), l_unstable_cancelCallback_0 (copy)
    if v53 ~= v32 then
        l_unstable_cancelCallback_0(v53);
    end;
end;
local function v56() --[[ Line: 202 ]] --[[ Name: flushSyncCallbackQueue ]]
    -- upvalues: v35 (ref), l_unstable_cancelCallback_0 (copy), v31 (ref)
    if v35 ~= nil then
        local l_v35_0 = v35;
        v35 = nil;
        l_unstable_cancelCallback_0(l_v35_0);
    end;
    return v31();
end;
v31 = function() --[[ Line: 211 ]]
    -- upvalues: v36 (ref), v34 (ref), l_decoupleUpdatePriorityFromScheduler_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), v1 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_SyncLanePriority_0 (copy), v45 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), l_unstable_runWithPriority_0 (copy), l_Array_0 (copy), l_unstable_scheduleCallback_0 (copy), l_unstable_ImmediatePriority_0 (copy), v56 (copy)
    if not v36 and v34 ~= nil then
        v36 = true;
        local v57 = 1;
        if l_decoupleUpdatePriorityFromScheduler_0 then
            local v58 = l_getCurrentUpdateLanePriority_0();
            local v59 = true;
            local v60 = nil;
            if not v1.__YOLO__ then
                local l_v34_0 = v34;
                l_setCurrentUpdateLanePriority_0(l_SyncLanePriority_0);
                local v64, v65 = xpcall(v45, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 232 ]]
                    -- upvalues: l_v34_0 (copy), v57 (ref)
                    for v62, v63 in l_v34_0 do
                        v57 = v62;
                        repeat
                            v63 = v63(true);
                        until v63 == nil;
                    end;
                end);
                v59 = v64;
                v60 = v65;
                v34 = nil;
            else
                v59 = true;
                local l_v34_1 = v34;
                l_setCurrentUpdateLanePriority_0(l_SyncLanePriority_0);
                local l_l_ImmediatePriority_0_0 = l_ImmediatePriority_0;
                local function v70() --[[ Line: 250 ]]
                    -- upvalues: l_v34_1 (copy), v57 (ref)
                    for v68, v69 in l_v34_1 do
                        v57 = v68;
                        repeat
                            v69 = v69(true);
                        until v69 == nil;
                        v57 = v57 + 1;
                    end;
                end;
                local v71 = reactPriorityToSchedulerPriority(l_l_ImmediatePriority_0_0);
                local _ = l_unstable_runWithPriority_0(v71, v70);
                v34 = nil;
            end;
            l_setCurrentUpdateLanePriority_0(v58);
            v36 = false;
            if not v59 then
                if v34 ~= nil then
                    v34 = l_Array_0.slice(v34, v57 + 1);
                end;
                l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v56);
                error(v60);
            end;
        else
            local v73 = nil;
            local v74 = nil;
            if not v1.__YOLO__ then
                local l_v34_2 = v34;
                local v78, v79 = xpcall(v45, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 292 ]]
                    -- upvalues: l_v34_2 (copy), v57 (ref)
                    for v76, v77 in l_v34_2 do
                        v57 = v76;
                        repeat
                            v77 = v77(true);
                        until v77 == nil;
                    end;
                end);
                v73 = v78;
                v74 = v79;
                v34 = nil;
            else
                v73 = true;
                local l_v34_3 = v34;
                local l_l_ImmediatePriority_0_1 = l_ImmediatePriority_0;
                local function v84() --[[ Line: 308 ]]
                    -- upvalues: l_v34_3 (copy), v57 (ref)
                    for v82, v83 in l_v34_3 do
                        v57 = v82;
                        repeat
                            v83 = v83(true);
                        until v83 == nil;
                    end;
                end;
                local v85 = reactPriorityToSchedulerPriority(l_l_ImmediatePriority_0_1);
                local _ = l_unstable_runWithPriority_0(v85, v84);
                v34 = nil;
            end;
            v36 = false;
            if not v73 then
                if v34 ~= nil then
                    v34 = l_Array_0.slice(v34, v57 + 1);
                end;
                l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v56);
                error(v74);
            end;
        end;
        return true;
    else
        return false;
    end;
end;
return {
    ImmediatePriority = l_ImmediatePriority_0, 
    UserBlockingPriority = l_UserBlockingPriority_0, 
    NormalPriority = l_NormalPriority_0, 
    LowPriority = l_LowPriority_0, 
    IdlePriority = l_IdlePriority_0, 
    NoPriority = l_NoPriority_0, 
    getCurrentPriorityLevel = v40, 
    flushSyncCallbackQueue = v56, 
    runWithPriority = v45, 
    scheduleCallback = v50, 
    scheduleSyncCallback = v52, 
    cancelCallback = v54, 
    now = v38, 
    requestPaint = v33, 
    shouldYield = l_unstable_shouldYield_0
};