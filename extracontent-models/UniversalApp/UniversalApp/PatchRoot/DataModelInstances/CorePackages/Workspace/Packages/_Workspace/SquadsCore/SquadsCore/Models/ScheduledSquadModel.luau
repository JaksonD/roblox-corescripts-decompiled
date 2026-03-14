local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.t);
local v2 = {};
v2.new = function(v3) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(v2.isValid(v3));
    v2.__index = v2;
    setmetatable(v3, v2);
    return v3;
end;
v2.mock = function(v4) --[[ Line: 20 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    v4 = v4 or {};
    return (v2.new({
        createdAtTime = v4.createdAtTime or "2025-07-02T18:00:00Z", 
        initiatorId = v4.initiatorId or 54321, 
        parentChannelId = v4.parentChannelId or "23456", 
        scheduledGroupUpId = v4.scheduledGroupUpId or 12345, 
        startTime = v4.startTime or "2500-07-02T18:00:00Z", 
        subscribers = v4.subscribers or {
            {
                userId = 12345
            }
        }, 
        title = v4.title or "Cool Test Scheduled Party", 
        updatedAtTime = v4.updatedAtTime or "2025-07-02T18:00:00Z"
    }));
end;
v2.format = function(v5) --[[ Line: 37 ]] --[[ Name: format ]]
    -- upvalues: v2 (copy)
    return (v2.new({
        createdAtTime = v5.scheduledGroupUp.createdAtTime, 
        initiatorId = v5.scheduledGroupUp.initiatorId, 
        parentChannelId = v5.scheduledGroupUp.parentChannelId, 
        scheduledGroupUpId = v5.scheduledGroupUp.scheduledGroupUpId, 
        startTime = v5.scheduledGroupUp.startTime, 
        subscribers = v5.scheduledGroupUp.subscribers, 
        title = v5.scheduledGroupUp.title, 
        updatedAtTime = v5.scheduledGroupUp.updatedAtTime
    }));
end;
v2.isValid = v1.strictInterface({
    createdAtTime = v1.string, 
    initiatorId = v1.number, 
    parentChannelId = v1.string, 
    scheduledGroupUpId = v1.number, 
    startTime = v1.string, 
    subscribers = v1.array(v1.strictInterface({
        userId = v1.number
    })), 
    title = v1.string, 
    updatedAtTime = v1.string
});
return v2;