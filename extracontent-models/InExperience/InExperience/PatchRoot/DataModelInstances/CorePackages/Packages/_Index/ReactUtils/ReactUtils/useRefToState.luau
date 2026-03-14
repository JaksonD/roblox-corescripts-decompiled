local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 31 ]] --[[ Name: useRefToState ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(v2);
    v3.current = v2;
    return v3;
end;