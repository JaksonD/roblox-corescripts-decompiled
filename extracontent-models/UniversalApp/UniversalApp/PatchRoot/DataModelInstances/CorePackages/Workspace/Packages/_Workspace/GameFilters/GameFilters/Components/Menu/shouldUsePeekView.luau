local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local v1 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v1.useBreakpointXOrSmaller;
return function() --[[ Line: 7 ]] --[[ Name: shouldUsePeekView ]]
    -- upvalues: l_useBreakpointXOrSmaller_0 (copy), v1 (copy)
    return l_useBreakpointXOrSmaller_0(v1.Keys.Small);
end;