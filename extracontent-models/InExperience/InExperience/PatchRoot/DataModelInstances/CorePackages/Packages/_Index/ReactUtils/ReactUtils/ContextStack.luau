local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 12 ]] --[[ Name: ContextStack ]]
    -- upvalues: v1 (copy)
    local l_children_0 = v2.children;
    for v4 = #v2.providers, 1, -1 do
        local v5 = v2.providers[v4];
        l_children_0 = v1.cloneElement(v5, nil, l_children_0);
    end;
    return l_children_0;
end;