local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local v2 = require(l_script_FirstAncestor_0.Enums.BreakpointShortName);
local v3 = {
    [v1.XSmall] = v2.xs, 
    [v1.Small] = v2.sm, 
    [v1.Medium] = v2.md, 
    [v1.Large] = v2.lg, 
    [v1.XLarge] = v2.xl, 
    [v1.XXLarge] = v2.xxl
};
local v4 = {
    [v1.XSmall] = 360, 
    [v1.Small] = 600, 
    [v1.Medium] = 1140, 
    [v1.Large] = 1520, 
    [v1.XLarge] = 1920, 
    [v1.XXLarge] = 1e999
};
local v5 = {
    v1.XSmall, 
    v1.Small, 
    v1.Medium, 
    v1.Large, 
    v1.XLarge, 
    v1.XXLarge
};
return {
    shortNames = v3, 
    widths = v4, 
    order = v5
};