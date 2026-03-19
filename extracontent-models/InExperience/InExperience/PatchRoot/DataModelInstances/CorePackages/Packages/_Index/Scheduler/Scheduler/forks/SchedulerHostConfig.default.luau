local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local v4 = require(l_Parent_0.Shared);
local l_console_0 = v4.console;
local l_errorToString_0 = v4.errorToString;
local l_describeError_0 = v4.describeError;
local v8 = require(l_Parent_0.SafeFlags);
local function v9() --[[ Line: 22 ]]
    return os.clock() * 1000;
end;
local l_setTimeout_0 = v2.setTimeout;
local l_clearTimeout_0 = v2.clearTimeout;
local v12 = false;
local v13 = nil;
local l_None_0 = l_Object_0.None;
local v15 = v8.createGetFInt("ReactSchedulerYieldInterval2", 15);
local v16 = v8.createGetFInt("ReactSchedulerDesiredFrameRate", 60)();
local v17 = v8.createGetFInt("ReactSchedulerMinFrameRate", 30)();
local v18 = v8.createGetFFlag("ReactSchedulerEnableDeferredWork")();
local v19 = v8.createGetFFlag("ReactSchedulerSetFrameMarkerOnHeartbeatEnd")();
local v20 = v8.createGetFFlag("ReactSchedulerSetTargetMsByHeartbeatDelta")();
local v21 = v8.createGetFInt("ReactSchedulerNumberOfLookbackFrames", 1)();
local v22 = v8.createGetFFlag("ReactSchedulerLookbackUseRingBuffer")();
local v23 = false;
local v24 = 0;
local v25 = 1000 / v16;
local v26 = 1000 / v17;
local l_v25_0 = v25;
local l_l_v25_0_0 = l_v25_0;
local v29 = nil;
local v30 = if v22 then table.create(v21) else nil;
local v31 = 1;
local function _() --[[ Line: 71 ]] --[[ Name: createHeartbeatConnection ]]
    -- upvalues: v29 (ref), v21 (ref), v22 (ref), v30 (copy), v31 (ref), l_l_v25_0_0 (ref), l_v25_0 (ref), v25 (copy), v26 (copy)
    if v29 then
        v29:Disconnect();
    end;
    v29 = game:GetService("RunService").Heartbeat:Connect(function(v32) --[[ Line: 76 ]]
        -- upvalues: v21 (ref), v22 (ref), v30 (ref), v31 (ref), l_l_v25_0_0 (ref), l_v25_0 (ref), v25 (ref), v26 (ref)
        if v21 > 1 then
            if v22 then
                v30[v31] = v32 * 1000;
                v31 = v31 % v21 + 1;
                local v33 = 0;
                local l_v21_0 = v21;
                for v35 = 1, l_v21_0 do
                    if v30[v35] == nil then
                        l_v21_0 = v35 - 1;
                        break;
                    else
                        v33 = v33 + v30[v35];
                    end;
                end;
                l_l_v25_0_0 = v33 / l_v21_0;
            else
                local l_v21_1 = v21;
                l_l_v25_0_0 = (l_l_v25_0_0 * (l_v21_1 - 1) + v32 * 1000) / l_v21_1;
            end;
            l_v25_0 = math.clamp(l_l_v25_0_0, v25, v26);
            return;
        else
            l_v25_0 = math.clamp(v32 * 1000, v25, v26);
            return;
        end;
    end);
end;
if v20 then
    if v29 then
        v29:Disconnect();
    end;
    v29 = game:GetService("RunService").Heartbeat:Connect(function(v38) --[[ Line: 76 ]]
        -- upvalues: v21 (ref), v22 (ref), v30 (copy), v31 (ref), l_l_v25_0_0 (ref), l_v25_0 (ref), v25 (copy), v26 (copy)
        if v21 > 1 then
            if v22 then
                v30[v31] = v38 * 1000;
                v31 = v31 % v21 + 1;
                local v39 = 0;
                local l_v21_2 = v21;
                for v41 = 1, l_v21_2 do
                    if v30[v41] == nil then
                        l_v21_2 = v41 - 1;
                        break;
                    else
                        v39 = v39 + v30[v41];
                    end;
                end;
                l_l_v25_0_0 = v39 / l_v21_2;
            else
                local l_v21_3 = v21;
                l_l_v25_0_0 = (l_l_v25_0_0 * (l_v21_3 - 1) + v38 * 1000) / l_v21_3;
            end;
            l_v25_0 = math.clamp(l_l_v25_0_0, v25, v26);
            return;
        else
            l_v25_0 = math.clamp(v38 * 1000, v25, v26);
            return;
        end;
    end);
end;
local function v43() --[[ Line: 118 ]] --[[ Name: setFrameMarker ]]
    -- upvalues: v24 (ref)
    v24 = os.clock() * 1000;
end;
local v44 = v15();
local v45 = 0;
local function v52(v46) --[[ Line: 138 ]] --[[ Name: setSchedulerFlags ]]
    -- upvalues: v44 (ref), v18 (ref), v19 (ref), v20 (ref), v29 (ref), v21 (ref), v22 (ref), v30 (copy), v31 (ref), l_l_v25_0_0 (ref), l_v25_0 (ref), v25 (copy), v26 (copy)
    if v46.yieldInterval ~= nil then
        v44 = v46.yieldInterval;
    end;
    if v46.deferredWork ~= nil then
        v18 = v46.deferredWork;
    end;
    if v46.heartbeatFrameMarker ~= nil then
        v19 = v46.heartbeatFrameMarker;
    end;
    if v46.targetMsByHeartbeatDelta ~= nil then
        v20 = v46.targetMsByHeartbeatDelta;
        if v46.targetMsByHeartbeatDelta then
            if v29 then
                v29:Disconnect();
            end;
            v29 = game:GetService("RunService").Heartbeat:Connect(function(v47) --[[ Line: 76 ]]
                -- upvalues: v21 (ref), v22 (ref), v30 (ref), v31 (ref), l_l_v25_0_0 (ref), l_v25_0 (ref), v25 (ref), v26 (ref)
                if v21 > 1 then
                    if v22 then
                        v30[v31] = v47 * 1000;
                        v31 = v31 % v21 + 1;
                        local v48 = 0;
                        local l_v21_4 = v21;
                        for v50 = 1, l_v21_4 do
                            if v30[v50] == nil then
                                l_v21_4 = v50 - 1;
                                break;
                            else
                                v48 = v48 + v30[v50];
                            end;
                        end;
                        l_l_v25_0_0 = v48 / l_v21_4;
                    else
                        local l_v21_5 = v21;
                        l_l_v25_0_0 = (l_l_v25_0_0 * (l_v21_5 - 1) + v47 * 1000) / l_v21_5;
                    end;
                    l_v25_0 = math.clamp(l_l_v25_0_0, v25, v26);
                    return;
                else
                    l_v25_0 = math.clamp(v47 * 1000, v25, v26);
                    return;
                end;
            end);
        elseif v29 then
            v29:Disconnect();
            v29 = nil;
            l_v25_0 = v25;
        end;
    end;
    if v46.numberOfLookbackFrames ~= nil then
        v21 = v46.numberOfLookbackFrames;
    end;
    if v46.lookbackUseRingBuffer ~= nil then
        v22 = v46.lookbackUseRingBuffer;
    end;
end;
local function v53() --[[ Line: 168 ]] --[[ Name: getSchedulerFlags ]]
    -- upvalues: v44 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref)
    return {
        yieldInterval = v44, 
        deferredWork = v18, 
        heartbeatFrameMarker = v19, 
        targetMsByHeartbeatDelta = v20, 
        numberOfLookbackFrames = v21, 
        lookbackUseRingBuffer = v22
    };
end;
local function _() --[[ Line: 179 ]] --[[ Name: doesBudgetRemain ]]
    -- upvalues: v24 (ref), l_v25_0 (ref), v44 (ref)
    local v54 = os.clock() * 1000 - v24;
    return l_v25_0 - v54 > v44;
end;
local function v56() --[[ Line: 187 ]] --[[ Name: shouldYieldToHost ]]
    -- upvalues: v45 (ref)
    return os.clock() * 1000 >= v45;
end;
local function v57() --[[ Line: 192 ]] --[[ Name: requestPaint ]]

end;
local function v59(v58) --[[ Line: 194 ]] --[[ Name: forceFrameRate ]]
    -- upvalues: l_console_0 (copy), v44 (ref)
    if v58 < 0 or v58 > 125 then
        l_console_0.warn("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported");
        return;
    elseif v58 > 0 then
        v44 = math.floor(1000 / v58);
        return;
    else
        v44 = 5;
        return;
    end;
end;
local function v60() --[[ Line: 210 ]] --[[ Name: performWorkUntilDeadline ]]
    -- upvalues: v13 (ref), v45 (ref), v44 (ref), v18 (ref), v19 (ref), v23 (ref), v24 (ref), l_v25_0 (ref), v12 (ref), v60 (ref), v43 (copy), v1 (copy), l_describeError_0 (copy), l_errorToString_0 (copy)
    if v13 ~= nil then
        local v61 = os.clock() * 1000;
        v45 = v61 + v44;
        local v62 = true;
        if v18 and not v19 and not v23 then
            v24 = v61;
        end;
        if v19 and v23 then
            local v63 = os.clock() * 1000 - v24;
            if not (l_v25_0 - v63 > v44) then
                v62 = false;
            end;
        end;
        local v64 = nil;
        local v65 = nil;
        local function v67() --[[ Line: 240 ]] --[[ Name: doWork ]]
            -- upvalues: v13 (ref), v62 (ref), v61 (copy), v12 (ref), v18 (ref), v24 (ref), l_v25_0 (ref), v44 (ref), v23 (ref), v60 (ref), v19 (ref), v43 (ref)
            if not v13(v62, v61) then
                v12 = false;
                v13 = nil;
            elseif v18 then
                local v66 = os.clock() * 1000 - v24;
                if l_v25_0 - v66 > v44 then
                    v23 = true;
                    task.defer(v60);
                else
                    v23 = false;
                    task.delay(0, v60);
                    if v19 then
                        task.defer(v43);
                    end;
                end;
            else
                task.delay(0, v60);
            end;
            return nil;
        end;
        if not v1.__YOLO__ then
            local v68, v69 = xpcall(v67, l_describeError_0);
            v64 = v68;
            v65 = v69;
        else
            v65 = v67();
            v64 = true;
        end;
        if not v64 then
            task.delay(0, v60);
            if v19 then
                task.defer(v43);
            end;
            error(l_errorToString_0(v65));
        end;
        return;
    else
        v12 = false;
        return;
    end;
end;
local _ = function(v70) --[[ Line: 301 ]] --[[ Name: wrapPerformWorkWithCoroutine ]]
    local v74 = coroutine.create(function() --[[ Line: 302 ]]
        -- upvalues: v70 (copy)
        while true do
            local v71 = coroutine.wrap(v70);
            local l_status_0, l_result_0 = pcall(v71);
            coroutine.yield(l_status_0, l_result_0);
        end;
    end);
    return function() --[[ Line: 312 ]]
        -- upvalues: v74 (copy)
        local _, v76, v77 = coroutine.resume(v74);
        if not v76 then
            error(v77);
        end;
    end;
end;
local l_v60_0 = v60;
local l_l_v60_0_0 = l_v60_0 --[[ copy: 44 -> 48 ]];
local v84 = coroutine.create(function() --[[ Line: 302 ]]
    -- upvalues: l_l_v60_0_0 (copy)
    while true do
        local v81 = coroutine.wrap(l_l_v60_0_0);
        local l_status_1, l_result_1 = pcall(v81);
        coroutine.yield(l_status_1, l_result_1);
    end;
end);
local l_v84_0 = v84 --[[ copy: 45 -> 49 ]];
v60 = function() --[[ Line: 312 ]]
    -- upvalues: l_v84_0 (copy)
    local _, v87, v88 = coroutine.resume(l_v84_0);
    if not v87 then
        error(v88);
    end;
end;
l_v60_0 = function(v89) --[[ Line: 322 ]] --[[ Name: requestHostCallback ]]
    -- upvalues: v13 (ref), v12 (ref), v60 (ref), v19 (ref), v43 (copy)
    v13 = v89;
    if not v12 then
        v12 = true;
        task.delay(0, v60);
        if v19 then
            task.defer(v43);
        end;
    end;
end;
v84 = function() --[[ Line: 334 ]] --[[ Name: cancelHostCallback ]]
    -- upvalues: v13 (ref)
    v13 = nil;
end;
local function v92(v90, v91) --[[ Line: 338 ]] --[[ Name: requestHostTimeout ]]
    -- upvalues: l_None_0 (ref), l_setTimeout_0 (copy)
    l_None_0 = l_setTimeout_0(function() --[[ Line: 339 ]]
        -- upvalues: v90 (copy)
        v90(os.clock() * 1000);
    end, v91);
end;
local function v93() --[[ Line: 344 ]] --[[ Name: cancelHostTimeout ]]
    -- upvalues: l_clearTimeout_0 (copy), l_None_0 (ref), l_Object_0 (copy)
    l_clearTimeout_0(l_None_0);
    l_None_0 = l_Object_0.None;
end;
return {
    requestHostCallback = l_v60_0, 
    cancelHostCallback = v84, 
    requestHostTimeout = v92, 
    cancelHostTimeout = v93, 
    shouldYieldToHost = v56, 
    requestPaint = v57, 
    getCurrentTime = v9, 
    forceFrameRate = v59, 
    setSchedulerFlags = v52, 
    getSchedulerFlags = v53
};