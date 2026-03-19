local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 21 ]] --[[ Name: useLazyRef ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(nil);
    if v3.current == nil then
        v3.current = v2();
    end;
    assert(v3.current ~= nil, "Ref must be defined after initialization function is called");
    return v3;
end;