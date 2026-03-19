local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v2 = {};
local _ = require(script.Parent.SchedulerPriorities);
local l_enableProfiling_0 = require(script.Parent.SchedulerFeatureFlags).enableProfiling;
local v5 = 0;
local v6 = 0;
local v7 = 0;
local v8 = nil;
local v9 = nil;
local v10 = 1;
local function v13(v11) --[[ Line: 46 ]] --[[ Name: logEvent ]]
    -- upvalues: v9 (ref), v10 (ref), v7 (ref), l_console_0 (copy), v2 (copy), v8 (ref)
    if v9 ~= nil then
        v10 = v10 + #v11;
        if v10 + 1 > v7 then
            v7 = v7 * 2;
            if v7 > 524288 then
                l_console_0.error("Scheduler Profiling: Event log exceeded maximum size. Don't forget to call `stopLoggingProfilingEvents()`.");
                v2.stopLoggingProfilingEvents();
                return;
            else
                local v12 = {};
                table.insert(v12, v9);
                v8 = v12;
                v9 = v12;
            end;
        end;
        table.insert(v9, v11);
    end;
end;
v2.startLoggingProfilingEvents = function() --[[ Line: 70 ]]
    -- upvalues: v7 (ref), v8 (ref), v9 (ref), v10 (ref)
    v7 = 131072;
    v8 = {};
    v9 = v8;
    v10 = 1;
end;
v2.stopLoggingProfilingEvents = function() --[[ Line: 77 ]]
    -- upvalues: v8 (ref), v7 (ref), v9 (ref), v10 (ref)
    local l_v8_0 = v8;
    v7 = 0;
    v8 = nil;
    v9 = nil;
    v10 = 1;
    return l_v8_0;
end;
v2.markTaskStart = function(v15, v16) --[[ Line: 87 ]]
    -- upvalues: l_enableProfiling_0 (copy), v9 (ref), v13 (copy)
    if l_enableProfiling_0 and v9 ~= nil then
        v13({
            1, 
            v16 * 1000, 
            v15.id, 
            v15.priorityLevel
        });
    end;
end;
v2.markTaskCompleted = function(v17, v18) --[[ Line: 98 ]]
    -- upvalues: l_enableProfiling_0 (copy), v9 (ref), v13 (copy)
    if l_enableProfiling_0 and v9 ~= nil then
        v13({
            2, 
            v18 * 1000, 
            v17.id
        });
    end;
end;
v2.markTaskCanceled = function(v19, v20) --[[ Line: 109 ]]
    -- upvalues: l_enableProfiling_0 (copy), v9 (ref), v13 (copy)
    if l_enableProfiling_0 and v9 ~= nil then
        v13({
            4, 
            v20 * 1000, 
            v19.id
        });
    end;
end;
v2.markTaskErrored = function(v21, v22) --[[ Line: 117 ]]
    -- upvalues: l_enableProfiling_0 (copy), v9 (ref), v13 (copy)
    if l_enableProfiling_0 and v9 ~= nil then
        v13({
            3, 
            v22 * 1000, 
            v21.id
        });
    end;
end;
v2.markTaskRun = function(v23, v24) --[[ Line: 125 ]]
    -- upvalues: l_enableProfiling_0 (copy), v5 (ref), v9 (ref), v13 (copy)
    if l_enableProfiling_0 then
        v5 = v5 + 1;
        if v9 ~= nil then
            v13({
                5, 
                v24 * 1000, 
                v23.id, 
                v5
            });
        end;
    end;
end;
v2.markTaskYield = function(v25, v26) --[[ Line: 135 ]]
    -- upvalues: l_enableProfiling_0 (copy), v9 (ref), v13 (copy), v5 (ref)
    if l_enableProfiling_0 and v9 ~= nil then
        v13({
            6, 
            v26 * 1000, 
            v25.id, 
            v5
        });
    end;
end;
v2.markSchedulerSuspended = function(v27) --[[ Line: 143 ]]
    -- upvalues: l_enableProfiling_0 (copy), v6 (ref), v9 (ref), v13 (copy)
    if l_enableProfiling_0 then
        v6 = v6 + 1;
        if v9 ~= nil then
            v13({
                7, 
                v27 * 1000, 
                v6
            });
        end;
    end;
end;
v2.markSchedulerUnsuspended = function(v28) --[[ Line: 153 ]]
    -- upvalues: l_enableProfiling_0 (copy), v9 (ref), v13 (copy), v6 (ref)
    if l_enableProfiling_0 and v9 ~= nil then
        v13({
            8, 
            v28 * 1000, 
            v6
        });
    end;
end;
return v2;