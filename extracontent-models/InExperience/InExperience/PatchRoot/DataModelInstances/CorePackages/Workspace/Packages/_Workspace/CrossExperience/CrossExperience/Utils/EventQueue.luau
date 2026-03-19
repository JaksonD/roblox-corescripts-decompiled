local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local _ = require(l_script_FirstAncestor_0.Types);
local v2 = require(l_script_FirstAncestor_0.Logger);
local v3 = {};
v3.__index = v3;
local _ = function(v4) --[[ Line: 40 ]] --[[ Name: getFirstKeyInTable ]]
    local v5 = nil;
    if v4 then
        for v6, _ in pairs(v4) do
            return v6;
        end;
    end;
    return v5;
end;
v3.new = function(v9) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v10 = {
        queues = {}, 
        requiresEventsInOrder = v9
    };
    setmetatable(v10, v3);
    return v10;
end;
v3.processNextEvent = function(v11, v12, v13) --[[ Line: 60 ]] --[[ Name: processNextEvent ]]
    -- upvalues: v2 (copy)
    local v14 = v11.queues[v12];
    if not v14 then
        v2:error("EventQueue: queue not found for origin {} abort processing", v12);
        return;
    else
        if v14.nextSequenceNumber == nil then
            local l_events_0 = v14.events;
            local v16 = nil;
            if l_events_0 then
                for v17, _ in pairs(l_events_0) do
                    v16 = v17;
                    break;
                end;
            end;
            local l_v16_0 = v16;
            if l_v16_0 ~= nil then
                v2:info("EventQueue: sequence for {} at {}", v12, l_v16_0);
                v14.nextSequenceNumber = l_v16_0;
            end;
        end;
        local v20 = v14.events[v14.nextSequenceNumber];
        if v20 then
            v2:info("EventQueue: processing event {} seq {}", v20.event.NOTIFY, v20.params._seq);
            if not v13 then
                v2:info("EventQueue: event originally delayed {} seq {} ", v20.event.NOTIFY, v20.params._seq);
            end;
            v20.callback(v20.params);
            v14.events[v14.nextSequenceNumber] = nil;
            v14.nextSequenceNumber = v14.nextSequenceNumber + 1;
            v11:processNextEvent(v12);
            return;
        else
            if v13 then
                v2:info("EventQueue: delaying processing event {} seq {} expecting {}", v13.event.NOTIFY, v13.params._seq, v14.nextSequenceNumber);
            end;
            return;
        end;
    end;
end;
v3.reset = function(v21) --[[ Line: 98 ]] --[[ Name: reset ]]
    v21.queues = {};
end;
v3.process = function(v22, v23, v24, v25) --[[ Line: 102 ]] --[[ Name: process ]]
    -- upvalues: v2 (copy)
    if not v24 then
        v2:error("EventQueue: invalid event {} params missing", v23.NOTIFY);
        return;
    else
        local l__origin_0 = v24._origin;
        local l__seq_0 = v24._seq;
        if not l__origin_0 or not l__seq_0 or not v22.requiresEventsInOrder then
            v2:info("EventQueue: event {} processing immediately", v23.NOTIFY);
            if v25 then
                v25(v24);
            end;
            return;
        else
            if not v22.queues[l__origin_0] then
                v2:info("EventQueue: initiating queue {}", l__origin_0);
                v22.queues[l__origin_0] = {
                    nextSequenceNumber = nil, 
                    events = {}
                };
            end;
            v2:info("EventQueue: new event {} seq {} current seq {}", v23.NOTIFY, l__seq_0, v22.queues[l__origin_0].nextSequenceNumber);
            local v28 = {
                event = v23, 
                params = v24, 
                callback = v25
            };
            v22.queues[l__origin_0].events[l__seq_0] = v28;
            v22:processNextEvent(l__origin_0, v28);
            return;
        end;
    end;
end;
return v3;