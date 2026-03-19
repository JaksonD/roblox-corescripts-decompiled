local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.useDebounce);
return function(v3, v4) --[[ Line: 9 ]] --[[ Name: useDebouncedState ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5, v6 = v1.useState(v3);
    return v2(v5, v4), v6;
end;