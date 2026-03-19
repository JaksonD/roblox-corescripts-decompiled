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
        canSeeRegroupPromptToast = v4.canSeeRegroupPromptToast or false, 
        canSeeRegroupJoinButton = v4.canSeeRegroupJoinButton or false
    }));
end;
v2.format = function(v5) --[[ Line: 31 ]] --[[ Name: format ]]
    -- upvalues: v2 (copy)
    return (v2.new({
        canSeeRegroupPromptToast = v5.canSeeRegroupPromptToast, 
        canSeeRegroupJoinButton = v5.canSeeRegroupJoinButton
    }));
end;
v2.isValid = v1.interface({
    canSeeRegroupPromptToast = v1.boolean, 
    canSeeRegroupJoinButton = v1.boolean
});
return v2;