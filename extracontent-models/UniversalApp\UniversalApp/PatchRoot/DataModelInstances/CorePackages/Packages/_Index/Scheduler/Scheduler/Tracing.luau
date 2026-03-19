local l_Parent_0 = script.Parent.Parent;
local l_Set_0 = require(l_Parent_0.LuauPolyfill).Set;
local v2 = {};
local l_enableSchedulerTracing_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulerTracing;
local v4 = 0;
local v5 = 0;
local v6 = nil;
local v7 = nil;
if l_enableSchedulerTracing_0 then
    v6 = {
        current = l_Set_0.new()
    };
    v7 = {
        current = nil
    };
end;
v2.__interactionsRef = v6;
v2.__subscriberRef = v7;
v2.unstable_clear = function(v8) --[[ Line: 92 ]]
    -- upvalues: l_enableSchedulerTracing_0 (copy), v6 (ref), l_Set_0 (copy)
    if not l_enableSchedulerTracing_0 then
        return v8();
    else
        local l_current_0 = v6.current;
        v6.current = l_Set_0.new();
        local l_status_0, l_result_0 = pcall(v8);
        v6.current = l_current_0;
        if not l_status_0 then
            error(l_result_0);
        end;
        return l_result_0;
    end;
end;
v2.unstable_getCurrent = function() --[[ Line: 112 ]]
    -- upvalues: l_enableSchedulerTracing_0 (copy), v6 (ref)
    if not l_enableSchedulerTracing_0 then
        return nil;
    else
        return v6.current;
    end;
end;
v2.unstable_getThreadID = function() --[[ Line: 120 ]]
    -- upvalues: v5 (ref)
    v5 = v5 + 1;
    return v5;
end;
v2.unstable_trace = function(v12, v13, v14, v15) --[[ Line: 125 ]]
    -- upvalues: l_enableSchedulerTracing_0 (copy), v4 (ref), v6 (ref), l_Set_0 (copy), v7 (ref)
    local v16 = if v15 ~= nil then v15 else 0;
    if not l_enableSchedulerTracing_0 then
        return v14();
    else
        local v17 = {
            __count = 1, 
            id = v4, 
            name = v12, 
            timestamp = v13
        };
        v4 = v4 + 1;
        local l_current_1 = v6.current;
        local v19 = l_Set_0.new(l_current_1);
        v19:add(v17);
        v6.current = v19;
        local l_current_2 = v7.current;
        local v21 = nil;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 159 ]]
            -- upvalues: l_current_2 (copy), v17 (copy)
            if l_current_2 ~= nil then
                l_current_2.onInteractionTraced(v17);
            end;
        end);
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 166 ]]
            -- upvalues: l_current_2 (copy), v19 (copy), v16 (copy)
            if l_current_2 ~= nil then
                l_current_2.onWorkStarted(v19, v16);
            end;
        end);
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 174 ]]
            -- upvalues: v21 (ref), v14 (copy)
            v21 = v14();
        end);
        v6.current = l_current_1;
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 180 ]]
            -- upvalues: l_current_2 (copy), v19 (copy), v16 (copy)
            if l_current_2 ~= nil then
                l_current_2.onWorkStopped(v19, v16);
            end;
        end);
        v17.__count = v17.__count - 1;
        if l_current_2 ~= nil and v17.__count == 0 then
            l_current_2.onInteractionScheduledWorkCompleted(v17);
        end;
        if not l_status_4 then
            error(l_result_4);
        end;
        if not l_status_3 then
            error(l_result_3);
        end;
        if not l_status_2 then
            error(l_result_2);
        end;
        if not l_status_1 then
            error(l_result_1);
        end;
        return v21;
    end;
end;
v2.unstable_wrap = function(v30, v31) --[[ Line: 213 ]]
    -- upvalues: l_enableSchedulerTracing_0 (copy), v6 (ref), v7 (ref)
    if v31 == nil then
        v31 = 0;
    end;
    if not l_enableSchedulerTracing_0 then
        return v30;
    else
        local l_current_3 = v6.current;
        local l_current_4 = v7.current;
        if l_current_4 ~= nil then
            l_current_4.onWorkScheduled(l_current_3, v31);
        end;
        for _, v35 in l_current_3 do
            v35.__count = v35.__count + 1;
        end;
        local v36 = false;
        local function v48(_, ...) --[[ Line: 241 ]] --[[ Name: _wrapped ]]
            -- upvalues: v6 (ref), l_current_3 (copy), l_current_4 (ref), v7 (ref), v31 (ref), v30 (copy), v36 (ref)
            local l_current_5 = v6.current;
            v6.current = l_current_3;
            l_current_4 = v7.current;
            local l_status_7, l_result_7 = pcall(function(...) --[[ Line: 248 ]]
                -- upvalues: l_current_4 (ref), l_current_3 (ref), v31 (ref), v30 (ref), v6 (ref), l_current_5 (copy)
                local v39 = nil;
                local l_status_5, l_result_5 = pcall(function() --[[ Line: 252 ]]
                    -- upvalues: l_current_4 (ref), l_current_3 (ref), v31 (ref)
                    if l_current_4 ~= nil then
                        l_current_4.onWorkStarted(l_current_3, v31);
                    end;
                end);
                local l_status_6, l_result_6 = pcall(function(...) --[[ Line: 259 ]]
                    -- upvalues: v39 (ref), v30 (ref)
                    v39 = v30(...);
                end, ...);
                v6.current = l_current_5;
                if l_current_4 ~= nil then
                    l_current_4.onWorkStopped(l_current_3, v31);
                end;
                if not l_status_6 then
                    error(l_result_6);
                end;
                if not l_status_5 then
                    error(l_result_5);
                end;
                return v39;
            end, ...);
            if not v36 then
                v36 = true;
                for _, v47 in l_current_3 do
                    v47.__count = v47.__count - 1;
                    if l_current_4 ~= nil and v47.__count == 0 then
                        l_current_4.onInteractionScheduledWorkCompleted(v47);
                    end;
                end;
            end;
            if not l_status_7 then
                error(l_result_7);
            end;
            return l_result_7;
        end;
        local function v53() --[[ Line: 306 ]]
            -- upvalues: l_current_4 (ref), v7 (ref), l_current_3 (copy), v31 (ref)
            l_current_4 = v7.current;
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 309 ]]
                -- upvalues: l_current_4 (ref), l_current_3 (ref), v31 (ref)
                if l_current_4 ~= nil then
                    l_current_4.onWorkCanceled(l_current_3, v31);
                end;
            end);
            for _, v52 in l_current_3 do
                v52.__count = v52.__count - 1;
                if l_current_4 ~= nil and v52.__count == 0 then
                    l_current_4.onInteractionScheduledWorkCompleted(v52);
                end;
            end;
            if not l_status_8 then
                error(l_result_8);
            end;
        end;
        local v54 = {};
        setmetatable(v54, {
            __call = v48
        });
        v54.cancel = v53;
        return v54;
    end;
end;
return v2;