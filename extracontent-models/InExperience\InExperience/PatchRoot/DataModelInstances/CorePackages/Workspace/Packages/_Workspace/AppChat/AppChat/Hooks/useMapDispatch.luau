local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v2 = require(l_Parent_0.React);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy)
    local v4 = l_useDispatch_0();
    return v2.useMemo(function() --[[ Line: 10 ]]
        -- upvalues: v3 (copy), v4 (copy)
        return v3(v4);
    end, {
        v4, 
        v3
    });
end;