local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
return function() --[[ Line: 28 ]]
    -- upvalues: l_createSignal_0 (copy)
    local v2, v3 = l_createSignal_0("Unknown");
    return {
        getChatStatus = v2, 
        setChatStatus = v3
    };
end;