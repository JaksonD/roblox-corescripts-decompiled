local l_Parent_0 = script:FindFirstAncestor("CoreGuiCommon").Parent;
local v1 = require(l_Parent_0.Signals);
return function() --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.createSignal(false);
    return {
        getVisibility = v2, 
        setVisibility = v3
    };
end;