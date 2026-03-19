local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    v1.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v2 (copy)
        v2();
    end, {});
end;