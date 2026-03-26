local l_Parent_0 = script:FindFirstAncestor("AppComposition").Parent;
local l_Breakpoint_0 = require(l_Parent_0.Foundation).Enums.Breakpoint;
local v2 = {
    [l_Breakpoint_0.XSmall] = 360, 
    [l_Breakpoint_0.Small] = 600, 
    [l_Breakpoint_0.Medium] = 1140, 
    [l_Breakpoint_0.Large] = 1520, 
    [l_Breakpoint_0.XLarge] = 1920, 
    [l_Breakpoint_0.XXLarge] = 1e999
};
local v3 = {
    l_Breakpoint_0.XSmall, 
    l_Breakpoint_0.Small, 
    l_Breakpoint_0.Medium, 
    l_Breakpoint_0.Large, 
    l_Breakpoint_0.XLarge, 
    l_Breakpoint_0.XXLarge
};
return function(v4) --[[ Line: 26 ]] --[[ Name: resolveBreakpoint ]]
    -- upvalues: v3 (copy), v2 (copy), l_Breakpoint_0 (copy)
    for _, v6 in v3 do
        if v4 <= (v2[v6] or 0) then
            return v6;
        end;
    end;
    return l_Breakpoint_0.XXLarge;
end;