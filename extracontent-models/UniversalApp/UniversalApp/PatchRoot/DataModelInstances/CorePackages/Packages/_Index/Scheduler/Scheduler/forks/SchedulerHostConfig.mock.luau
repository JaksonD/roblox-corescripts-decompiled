local v0 = {};
local v1 = 0;
local v2 = nil;
local v3 = nil;
local v4 = -1;
local v5 = nil;
local v6 = -1;
local v7 = false;
local v8 = false;
local v9 = false;
local v10 = false;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_disabledLog_0 = require(l_Parent_0.Shared).ConsolePatchingDev.disabledLog;
v0.requestHostCallback = function(v14) --[[ Line: 28 ]]
    -- upvalues: v2 (ref)
    v2 = v14;
end;
v0.cancelHostCallback = function() --[[ Line: 32 ]]
    -- upvalues: v2 (ref)
    v2 = nil;
end;
v0.requestHostTimeout = function(v15, v16) --[[ Line: 36 ]]
    -- upvalues: v3 (ref), v4 (ref), v1 (ref)
    v3 = v15;
    v4 = v1 + v16;
end;
v0.cancelHostTimeout = function() --[[ Line: 41 ]]
    -- upvalues: v3 (ref), v4 (ref)
    v3 = nil;
    v4 = -1;
end;
v0.shouldYieldToHost = function() --[[ Line: 46 ]]
    -- upvalues: v5 (ref), v6 (ref), v10 (ref), v9 (ref), v7 (ref)
    local l_v5_0 = v5;
    if v6 ~= -1 and l_v5_0 ~= nil and #l_v5_0 >= v6 or v10 and v9 then
        v7 = true;
        return true;
    else
        return false;
    end;
end;
v0.getCurrentTime = function() --[[ Line: 65 ]]
    -- upvalues: v1 (ref)
    return v1;
end;
v0.forceFrameRate = function() --[[ Line: 69 ]]

end;
v0.reset = function() --[[ Line: 73 ]]
    -- upvalues: v8 (ref), v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v9 (ref)
    if v8 then
        error("Cannot reset while already flushing work.");
    end;
    v1 = 0;
    v2 = nil;
    v3 = nil;
    v4 = -1;
    v5 = nil;
    v6 = -1;
    v7 = false;
    v8 = false;
    v9 = false;
end;
v0.unstable_flushNumberOfYields = function(v18) --[[ Line: 90 ]]
    -- upvalues: v8 (ref), v2 (ref), v6 (ref), v1 (ref), v7 (ref)
    if v8 then
        error("Already flushing work.");
    end;
    if v2 ~= nil then
        local l_v2_0 = v2;
        v6 = v18;
        v8 = true;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 100 ]]
            -- upvalues: l_v2_0 (copy), v1 (ref), v7 (ref), v2 (ref)
            local v20 = true;
            repeat
                v20 = l_v2_0(true, v1);
            until not v20 or v7;
            if not v20 then
                v2 = nil;
            end;
        end);
        v6 = -1;
        v7 = false;
        v8 = false;
        if not l_status_0 then
            error(l_result_0);
        end;
    end;
end;
v0.unstable_flushUntilNextPaint = function() --[[ Line: 121 ]]
    -- upvalues: v8 (ref), v2 (ref), v10 (ref), v9 (ref), v1 (ref), v7 (ref)
    if v8 then
        error("Already flushing work.");
    end;
    if v2 ~= nil then
        local l_v2_1 = v2;
        v10 = true;
        v9 = false;
        v8 = true;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 132 ]]
            -- upvalues: l_v2_1 (copy), v1 (ref), v7 (ref), v2 (ref)
            local v24 = true;
            repeat
                v24 = l_v2_1(true, v1);
            until not v24 or v7;
            if not v24 then
                v2 = nil;
            end;
        end);
        v10 = false;
        v7 = false;
        v8 = false;
        if not l_status_1 then
            error(l_result_1);
        end;
    end;
end;
v0.unstable_flushExpired = function() --[[ Line: 154 ]]
    -- upvalues: v8 (ref), v2 (ref), v1 (ref)
    if v8 then
        error("Already flushing work.");
    end;
    if v2 ~= nil then
        v8 = true;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 160 ]]
            -- upvalues: v2 (ref), v1 (ref)
            if not v2(false, v1) then
                v2 = nil;
            end;
        end);
        v8 = false;
        if not l_status_2 then
            error(l_result_2);
        end;
    end;
end;
v0.unstable_flushAllWithoutAsserting = function() --[[ Line: 178 ]]
    -- upvalues: v8 (ref), v2 (ref), v1 (ref)
    if v8 then
        error("Already flushing work.");
    end;
    if v2 ~= nil then
        local l_v2_2 = v2;
        v8 = true;
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 186 ]]
            -- upvalues: l_v2_2 (copy), v1 (ref), v2 (ref)
            local v30 = true;
            repeat
                v30 = l_v2_2(true, v1);
            until not v30;
            if not v30 then
                v2 = nil;
            end;
        end);
        v8 = false;
        if not l_status_3 then
            error(l_result_3);
        end;
        return true;
    else
        return false;
    end;
end;
v0.unstable_clearYields = function() --[[ Line: 209 ]]
    -- upvalues: v5 (ref)
    if v5 == nil then
        return {};
    else
        local l_v5_1 = v5;
        v5 = nil;
        return l_v5_1;
    end;
end;
v0.unstable_flushAll = function() --[[ Line: 218 ]]
    -- upvalues: v5 (ref), v0 (copy)
    if v5 ~= nil then
        error("Log is not empty. Assert on the log of yielded values before flushing additional work.");
    end;
    v0.unstable_flushAllWithoutAsserting();
    if v5 ~= nil then
        error("While flushing work, something yielded a value. Use an assertion helper to assert on the log of yielded values, e.g. expect(Scheduler).toFlushAndYield([...])");
    end;
end;
v0.unstable_yieldValue = function(v34) --[[ Line: 235 ]]
    -- upvalues: l_console_0 (copy), l_disabledLog_0 (copy), v5 (ref)
    if l_console_0.log == l_disabledLog_0 then
        return;
    elseif v5 == nil then
        v5 = {
            v34
        };
        return;
    else
        table.insert(v5, v34);
        return;
    end;
end;
v0.unstable_advanceTime = function(v35) --[[ Line: 252 ]]
    -- upvalues: l_console_0 (copy), l_disabledLog_0 (copy), v1 (ref), v3 (ref), v4 (ref)
    if l_console_0.log == l_disabledLog_0 then
        return;
    else
        v1 = v1 + v35;
        if v3 ~= nil and v4 <= v1 then
            v3(v1);
            v4 = -1;
            v3 = nil;
        end;
        return;
    end;
end;
v0.requestPaint = function() --[[ Line: 271 ]]
    -- upvalues: v9 (ref)
    v9 = true;
end;
return v0;