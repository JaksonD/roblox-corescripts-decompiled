local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
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
        userId = v4.userId or 1234, 
        partyVoiceEligible = v4.partyVoiceEligible or false
    }));
end;
v2.format = function(v5) --[[ Line: 31 ]] --[[ Name: format ]]
    -- upvalues: v2 (copy)
    return (v2.new({
        userId = v5.userId, 
        partyVoiceEligible = v5.partyVoiceEligible
    }));
end;
v2.isValid = v1.interface({
    userId = v1.number, 
    partyVoiceEligible = v1.optional(v1.boolean)
});
return v2;