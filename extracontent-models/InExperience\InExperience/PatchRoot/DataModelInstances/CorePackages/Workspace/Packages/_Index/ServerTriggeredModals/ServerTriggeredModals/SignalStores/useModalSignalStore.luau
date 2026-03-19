local l_Parent_0 = script:FindFirstAncestor("ServerTriggeredModals").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.getModalSignalStore);
return function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useMemo(function() --[[ Line: 9 ]]
        -- upvalues: v2 (ref)
        return v2(false);
    end, {});
end;