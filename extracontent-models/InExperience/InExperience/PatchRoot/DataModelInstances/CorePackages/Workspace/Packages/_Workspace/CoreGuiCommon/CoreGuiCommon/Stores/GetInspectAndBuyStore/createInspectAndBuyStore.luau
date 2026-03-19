local l_Parent_0 = script:FindFirstAncestor("CoreGuiCommon").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
return function() --[[ Line: 14 ]]
    -- upvalues: l_createSignal_0 (copy)
    local v2, v3 = l_createSignal_0(false);
    return {
        getInspectAndBuyOpen = v2, 
        setInspectAndBuyOpen = v3
    };
end;